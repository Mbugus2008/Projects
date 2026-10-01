package com.facebook.stetho.inspector.network;

import android.content.Context;
import android.util.Base64OutputStream;
import com.facebook.stetho.common.ExceptionUtil;
import com.facebook.stetho.common.LogRedirector;
import com.facebook.stetho.common.Utf8Charset;
import com.facebook.stetho.common.Util;
import java.io.ByteArrayOutputStream;
import java.io.EOFException;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

/* JADX INFO: loaded from: classes.dex */
public class ResponseBodyFileManager {
    private static final String FILENAME_PREFIX = "network-response-body-";
    private static final int PRETTY_PRINT_TIMEOUT_SEC = 10;
    private static final String TAG = "ResponseBodyFileManager";
    private final Context mContext;
    private final Map<String, AsyncPrettyPrinter> mRequestIdMap = Collections.synchronizedMap(new HashMap());

    public ResponseBodyFileManager(Context context) {
        this.mContext = context;
    }

    public void cleanupFiles() {
        for (File file : this.mContext.getFilesDir().listFiles()) {
            if (file.getName().startsWith(FILENAME_PREFIX) && !file.delete()) {
                LogRedirector.w(TAG, "Failed to delete " + file.getAbsolutePath());
            }
        }
        LogRedirector.i(TAG, "Cleaned up temporary network files.");
    }

    public ResponseBodyData readFile(String requestId) throws IOException {
        InputStream in = this.mContext.openFileInput(getFilename(requestId));
        try {
            int firstByte = in.read();
            if (firstByte == -1) {
                throw new EOFException("Failed to read base64Encode byte");
            }
            ResponseBodyData bodyData = new ResponseBodyData();
            bodyData.base64Encoded = firstByte != 0;
            AsyncPrettyPrinter asyncPrettyPrinter = this.mRequestIdMap.get(requestId);
            if (asyncPrettyPrinter != null) {
                bodyData.data = prettyPrintContentWithTimeOut(asyncPrettyPrinter, in);
            } else {
                bodyData.data = Util.readAsUTF8(in);
            }
            in.close();
            return bodyData;
        } catch (Throwable th) {
            in.close();
            throw th;
        }
    }

    private String prettyPrintContentWithTimeOut(AsyncPrettyPrinter asyncPrettyPrinter, InputStream in) throws Throwable {
        AsyncPrettyPrintingCallable prettyPrintingCallable = new AsyncPrettyPrintingCallable(in, asyncPrettyPrinter);
        ExecutorService executorService = AsyncPrettyPrinterExecutorHolder.getExecutorService();
        if (executorService == null) {
            return null;
        }
        Future<String> future = executorService.submit(prettyPrintingCallable);
        try {
            return (String) Util.getUninterruptibly(future, 10L, TimeUnit.SECONDS);
        } catch (ExecutionException e) {
            Throwable cause = e.getCause();
            ExceptionUtil.propagateIfInstanceOf(cause, IOException.class);
            throw ExceptionUtil.propagate(cause);
        } catch (TimeoutException e2) {
            future.cancel(true);
            return "Time out after 10 seconds of attempting to pretty print\n" + Util.readAsUTF8(in);
        }
    }

    public OutputStream openResponseBodyFile(String str, boolean z) throws IOException {
        FileOutputStream fileOutputStreamOpenFileOutput = this.mContext.openFileOutput(getFilename(str), 0);
        fileOutputStreamOpenFileOutput.write(z ? 1 : 0);
        if (z) {
            return new Base64OutputStream(fileOutputStreamOpenFileOutput, 0);
        }
        return fileOutputStreamOpenFileOutput;
    }

    private static String getFilename(String requestId) {
        return FILENAME_PREFIX + requestId;
    }

    public void associateAsyncPrettyPrinterWithId(String requestId, AsyncPrettyPrinter asyncPrettyPrinter) {
        if (this.mRequestIdMap.put(requestId, asyncPrettyPrinter) != null) {
            throw new IllegalArgumentException("cannot associate different pretty printers with the same request id: " + requestId);
        }
    }

    private class AsyncPrettyPrintingCallable implements Callable<String> {
        private final AsyncPrettyPrinter mAsyncPrettyPrinter;
        private final InputStream mInputStream;

        public AsyncPrettyPrintingCallable(InputStream in, AsyncPrettyPrinter asyncPrettyPrinter) {
            this.mInputStream = in;
            this.mAsyncPrettyPrinter = asyncPrettyPrinter;
        }

        @Override // java.util.concurrent.Callable
        public String call() throws IOException {
            return prettyPrintContent(this.mInputStream, this.mAsyncPrettyPrinter);
        }

        private String prettyPrintContent(InputStream in, AsyncPrettyPrinter asyncPrettyPrinter) throws IOException {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            PrintWriter writer = new PrintWriter(out);
            asyncPrettyPrinter.printTo(writer, in);
            writer.flush();
            return out.toString(Utf8Charset.NAME);
        }
    }
}
