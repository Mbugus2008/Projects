package com.facebook.stetho.inspector.network;

import com.facebook.stetho.common.ExceptionUtil;
import com.facebook.stetho.common.Util;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import javax.annotation.Nullable;

/* JADX INFO: loaded from: classes.dex */
public abstract class DownloadingAsyncPrettyPrinterFactory implements AsyncPrettyPrinterFactory {
    protected abstract void doPrint(PrintWriter printWriter, InputStream inputStream, String str) throws IOException;

    @Nullable
    protected abstract MatchResult matchAndParseHeader(String str, String str2);

    @Override // com.facebook.stetho.inspector.network.AsyncPrettyPrinterFactory
    public AsyncPrettyPrinter getInstance(String headerName, String headerValue) {
        final MatchResult result = matchAndParseHeader(headerName, headerValue);
        if (result == null) {
            return null;
        }
        String uri = result.getSchemaUri();
        URL schemaURL = parseURL(uri);
        if (schemaURL == null) {
            return getErrorAsyncPrettyPrinter(headerName, headerValue);
        }
        ExecutorService executorService = AsyncPrettyPrinterExecutorHolder.getExecutorService();
        if (executorService == null) {
            return null;
        }
        final Future<String> response = executorService.submit(new Request(schemaURL));
        return new AsyncPrettyPrinter() { // from class: com.facebook.stetho.inspector.network.DownloadingAsyncPrettyPrinterFactory.1
            @Override // com.facebook.stetho.inspector.network.AsyncPrettyPrinter
            public void printTo(PrintWriter output, InputStream payload) throws IOException {
                try {
                    try {
                        try {
                            String schema = (String) response.get();
                            DownloadingAsyncPrettyPrinterFactory.this.doPrint(output, payload, schema);
                        } catch (ExecutionException e) {
                            Throwable cause = e.getCause();
                            throw ExceptionUtil.propagate(cause);
                        }
                    } catch (ExecutionException e2) {
                        Throwable cause2 = e2.getCause();
                        if (!IOException.class.isInstance(cause2)) {
                            throw e2;
                        }
                        DownloadingAsyncPrettyPrinterFactory.doErrorPrint(output, payload, "Cannot successfully download schema: " + e2.getMessage());
                    }
                } catch (InterruptedException e3) {
                    DownloadingAsyncPrettyPrinterFactory.doErrorPrint(output, payload, "Encountered spurious interrupt while downloading schema for pretty printing: " + e3.getMessage());
                }
            }

            @Override // com.facebook.stetho.inspector.network.AsyncPrettyPrinter
            public PrettyPrinterDisplayType getPrettifiedType() {
                return result.getDisplayType();
            }
        };
    }

    @Nullable
    private static URL parseURL(String uri) {
        try {
            return new URL(uri);
        } catch (MalformedURLException e) {
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void doErrorPrint(PrintWriter output, InputStream payload, String errorMessage) throws IOException {
        output.print(errorMessage + "\n" + Util.readAsUTF8(payload));
    }

    private static AsyncPrettyPrinter getErrorAsyncPrettyPrinter(final String headerName, final String headerValue) {
        return new AsyncPrettyPrinter() { // from class: com.facebook.stetho.inspector.network.DownloadingAsyncPrettyPrinterFactory.2
            @Override // com.facebook.stetho.inspector.network.AsyncPrettyPrinter
            public void printTo(PrintWriter output, InputStream payload) throws IOException {
                String errorMessage = "[Failed to parse header: " + headerName + " : " + headerValue + " ]";
                DownloadingAsyncPrettyPrinterFactory.doErrorPrint(output, payload, errorMessage);
            }

            @Override // com.facebook.stetho.inspector.network.AsyncPrettyPrinter
            public PrettyPrinterDisplayType getPrettifiedType() {
                return PrettyPrinterDisplayType.TEXT;
            }
        };
    }

    protected class MatchResult {
        private final PrettyPrinterDisplayType mDisplayType;
        private final String mSchemaUri;

        public MatchResult(String schemaUri, PrettyPrinterDisplayType displayType) {
            this.mSchemaUri = schemaUri;
            this.mDisplayType = displayType;
        }

        public String getSchemaUri() {
            return this.mSchemaUri;
        }

        public PrettyPrinterDisplayType getDisplayType() {
            return this.mDisplayType;
        }
    }

    private static class Request implements Callable<String> {
        private URL url;

        public Request(URL url) {
            this.url = url;
        }

        @Override // java.util.concurrent.Callable
        public String call() throws IOException {
            HttpURLConnection connection = (HttpURLConnection) this.url.openConnection();
            int statusCode = connection.getResponseCode();
            if (statusCode != 200) {
                throw new IOException("Got status code: " + statusCode + " while downloading schema with url: " + this.url.toString());
            }
            InputStream urlStream = connection.getInputStream();
            try {
                return Util.readAsUTF8(urlStream);
            } finally {
                urlStream.close();
            }
        }
    }
}
