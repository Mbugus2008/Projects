package com.facebook.stetho.websocket;

import android.util.Base64;
import com.facebook.stetho.common.Utf8Charset;
import com.facebook.stetho.server.SocketLike;
import com.facebook.stetho.server.http.HttpHandler;
import com.facebook.stetho.server.http.LightHttpBody;
import com.facebook.stetho.server.http.LightHttpMessage;
import com.facebook.stetho.server.http.LightHttpRequest;
import com.facebook.stetho.server.http.LightHttpResponse;
import com.facebook.stetho.server.http.LightHttpServer;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import javax.annotation.Nullable;

/* JADX INFO: loaded from: classes.dex */
public class WebSocketHandler implements HttpHandler {
    private static final String HEADER_CONNECTION = "Connection";
    private static final String HEADER_CONNECTION_UPGRADE = "Upgrade";
    private static final String HEADER_SEC_WEBSOCKET_ACCEPT = "Sec-WebSocket-Accept";
    private static final String HEADER_SEC_WEBSOCKET_KEY = "Sec-WebSocket-Key";
    private static final String HEADER_SEC_WEBSOCKET_PROTOCOL = "Sec-WebSocket-Protocol";
    private static final String HEADER_SEC_WEBSOCKET_VERSION = "Sec-WebSocket-Version";
    private static final String HEADER_SEC_WEBSOCKET_VERSION_13 = "13";
    private static final String HEADER_UPGRADE = "Upgrade";
    private static final String HEADER_UPGRADE_WEBSOCKET = "websocket";
    private static final String SERVER_KEY_GUID = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11";
    private final SimpleEndpoint mEndpoint;

    public WebSocketHandler(SimpleEndpoint endpoint) {
        this.mEndpoint = endpoint;
    }

    @Override // com.facebook.stetho.server.http.HttpHandler
    public boolean handleRequest(SocketLike socket, LightHttpRequest request, LightHttpResponse response) throws IOException {
        if (!isSupportableUpgradeRequest(request)) {
            response.code = 501;
            response.reasonPhrase = "Not Implemented";
            response.body = LightHttpBody.create("Not a supported WebSocket upgrade request\n", "text/plain");
            return true;
        }
        doUpgrade(socket, request, response);
        return false;
    }

    private static boolean isSupportableUpgradeRequest(LightHttpRequest request) {
        return HEADER_UPGRADE_WEBSOCKET.equalsIgnoreCase(getFirstHeaderValue(request, "Upgrade")) && "Upgrade".equals(getFirstHeaderValue(request, HEADER_CONNECTION)) && HEADER_SEC_WEBSOCKET_VERSION_13.equals(getFirstHeaderValue(request, HEADER_SEC_WEBSOCKET_VERSION));
    }

    private void doUpgrade(SocketLike socketLike, LightHttpRequest request, LightHttpResponse response) throws IOException {
        response.code = 101;
        response.reasonPhrase = "Switching Protocols";
        response.addHeader("Upgrade", HEADER_UPGRADE_WEBSOCKET);
        response.addHeader(HEADER_CONNECTION, "Upgrade");
        response.body = null;
        String clientKey = getFirstHeaderValue(request, HEADER_SEC_WEBSOCKET_KEY);
        if (clientKey != null) {
            response.addHeader(HEADER_SEC_WEBSOCKET_ACCEPT, generateServerKey(clientKey));
        }
        InputStream in = socketLike.getInput();
        OutputStream out = socketLike.getOutput();
        LightHttpServer.writeResponseMessage(response, new LightHttpServer.HttpMessageWriter(new BufferedOutputStream(out)));
        WebSocketSession session = new WebSocketSession(in, out, this.mEndpoint);
        session.handle();
    }

    private static String generateServerKey(String clientKey) {
        try {
            String serverKey = clientKey + SERVER_KEY_GUID;
            MessageDigest sha1 = MessageDigest.getInstance("SHA-1");
            sha1.update(Utf8Charset.encodeUTF8(serverKey));
            return Base64.encodeToString(sha1.digest(), 2);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    @Nullable
    private static String getFirstHeaderValue(LightHttpMessage message, String headerName) {
        return message.getFirstHeaderValue(headerName);
    }
}
