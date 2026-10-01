package com.facebook.stetho.server.http;

import android.net.Uri;
import com.facebook.stetho.server.LeakyBufferedInputStream;
import com.facebook.stetho.server.SocketLike;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;

/* JADX INFO: loaded from: classes.dex */
public class LightHttpServer {
    private static final String TAG = "LightHttpServer";
    private final HandlerRegistry mHandlerRegistry;

    public LightHttpServer(HandlerRegistry handlerRegistry) {
        this.mHandlerRegistry = handlerRegistry;
    }

    public void serve(SocketLike socket) throws IOException {
        LeakyBufferedInputStream input = new LeakyBufferedInputStream(socket.getInput(), 1024);
        OutputStream output = socket.getOutput();
        HttpMessageReader reader = new HttpMessageReader(input);
        HttpMessageWriter writer = new HttpMessageWriter(new BufferedOutputStream(output));
        SocketLike anotherSocketLike = new SocketLike(socket, input);
        LightHttpRequest scratchRequest = new LightHttpRequest();
        LightHttpResponse scratchResponse = new LightHttpResponse();
        while (true) {
            LightHttpRequest request = readRequestMessage(scratchRequest, reader);
            if (request != null) {
                scratchResponse.reset();
                boolean keepGoing = dispatchToHandler(anotherSocketLike, request, scratchResponse);
                if (keepGoing) {
                    writeFullResponse(scratchResponse, writer, output);
                } else {
                    return;
                }
            } else {
                return;
            }
        }
    }

    private boolean dispatchToHandler(SocketLike socketLike, LightHttpRequest request, LightHttpResponse response) throws IOException {
        HttpHandler handler = this.mHandlerRegistry.lookup(request.uri.getPath());
        if (handler == null) {
            response.code = HttpStatus.HTTP_NOT_FOUND;
            response.reasonPhrase = "Not found";
            response.body = LightHttpBody.create("No handler found\n", "text/plain");
            return true;
        }
        try {
            return handler.handleRequest(socketLike, request, response);
        } catch (RuntimeException e) {
            response.code = HttpStatus.HTTP_INTERNAL_SERVER_ERROR;
            response.reasonPhrase = "Internal Server Error";
            StringWriter stack = new StringWriter();
            PrintWriter stackWriter = new PrintWriter(stack);
            try {
                e.printStackTrace(stackWriter);
                stackWriter.close();
                response.body = LightHttpBody.create(stack.toString(), "text/plain");
                return true;
            } catch (Throwable th) {
                stackWriter.close();
                throw th;
            }
        }
    }

    private static LightHttpRequest readRequestMessage(LightHttpRequest request, HttpMessageReader reader) throws IOException {
        request.reset();
        String requestLine = reader.readLine();
        if (requestLine == null) {
            return null;
        }
        String[] requestParts = requestLine.split(" ", 3);
        if (requestParts.length != 3) {
            throw new IOException("Invalid request line: " + requestLine);
        }
        request.method = requestParts[0];
        request.uri = Uri.parse(requestParts[1]);
        request.protocol = requestParts[2];
        readHeaders(request, reader);
        return request;
    }

    private static void readHeaders(LightHttpMessage message, HttpMessageReader reader) throws IOException {
        while (true) {
            String headerLine = reader.readLine();
            if (headerLine == null) {
                throw new EOFException();
            }
            if (!"".equals(headerLine)) {
                String[] headerParts = headerLine.split(": ", 2);
                if (headerParts.length != 2) {
                    throw new IOException("Malformed header: " + headerLine);
                }
                String name = headerParts[0];
                String value = headerParts[1];
                message.headerNames.add(name);
                message.headerValues.add(value);
            } else {
                return;
            }
        }
    }

    private static void writeFullResponse(LightHttpResponse response, HttpMessageWriter writer, OutputStream output) throws IOException {
        response.prepare();
        writeResponseMessage(response, writer);
        if (response.body != null) {
            response.body.writeTo(output);
        }
    }

    public static void writeResponseMessage(LightHttpResponse response, HttpMessageWriter writer) throws IOException {
        writer.writeLine("HTTP/1.1 " + response.code + " " + response.reasonPhrase);
        int N = response.headerNames.size();
        for (int i = 0; i < N; i++) {
            String name = response.headerNames.get(i);
            String value = response.headerValues.get(i);
            writer.writeLine(name + ": " + value);
        }
        writer.writeLine();
        writer.flush();
    }

    private static class HttpMessageReader {
        private final BufferedInputStream mIn;
        private final StringBuilder mBuffer = new StringBuilder();
        private final NewLineDetector mNewLineDetector = new NewLineDetector();

        public HttpMessageReader(BufferedInputStream in) {
            this.mIn = in;
        }

        public String readLine() throws IOException {
            while (true) {
                int b = this.mIn.read();
                if (b < 0) {
                    return null;
                }
                char c = (char) b;
                this.mNewLineDetector.accept(c);
                switch (this.mNewLineDetector.state()) {
                    case 1:
                        this.mBuffer.append(c);
                        break;
                    case 3:
                        String result = this.mBuffer.toString();
                        this.mBuffer.setLength(0);
                        return result;
                }
            }
        }

        private static class NewLineDetector {
            private static final int STATE_ON_CR = 2;
            private static final int STATE_ON_CRLF = 3;
            private static final int STATE_ON_OTHER = 1;
            private int state;

            private NewLineDetector() {
                this.state = 1;
            }

            public void accept(char c) {
                switch (this.state) {
                    case 1:
                        if (c == '\r') {
                            this.state = 2;
                            return;
                        }
                        return;
                    case 2:
                        if (c == '\n') {
                            this.state = 3;
                            return;
                        } else {
                            this.state = 1;
                            return;
                        }
                    case 3:
                        if (c == '\r') {
                            this.state = 2;
                            return;
                        } else {
                            this.state = 1;
                            return;
                        }
                    default:
                        throw new IllegalArgumentException("Unknown state: " + this.state);
                }
            }

            public int state() {
                return this.state;
            }
        }
    }

    public static class HttpMessageWriter {
        private static final byte[] CRLF = "\r\n".getBytes();
        private final BufferedOutputStream mOut;

        public HttpMessageWriter(BufferedOutputStream out) {
            this.mOut = out;
        }

        public void writeLine(String line) throws IOException {
            int N = line.length();
            for (int i = 0; i < N; i++) {
                char c = line.charAt(i);
                this.mOut.write(c);
            }
            this.mOut.write(CRLF);
        }

        public void writeLine() throws IOException {
            this.mOut.write(CRLF);
        }

        public void flush() throws IOException {
            this.mOut.flush();
        }
    }
}
