package com.facebook.stetho.inspector.network;

import com.facebook.stetho.common.Utf8Charset;
import java.io.UnsupportedEncodingException;

/* JADX INFO: loaded from: classes.dex */
public class SimpleBinaryInspectorWebSocketFrame implements NetworkEventReporter.InspectorWebSocketFrame {
    private final byte[] mPayload;
    private final String mRequestId;

    public SimpleBinaryInspectorWebSocketFrame(String requestId, byte[] payload) {
        this.mRequestId = requestId;
        this.mPayload = payload;
    }

    @Override // com.facebook.stetho.inspector.network.NetworkEventReporter.InspectorWebSocketFrame
    public String requestId() {
        return this.mRequestId;
    }

    @Override // com.facebook.stetho.inspector.network.NetworkEventReporter.InspectorWebSocketFrame
    public int opcode() {
        return 2;
    }

    @Override // com.facebook.stetho.inspector.network.NetworkEventReporter.InspectorWebSocketFrame
    public boolean mask() {
        return false;
    }

    @Override // com.facebook.stetho.inspector.network.NetworkEventReporter.InspectorWebSocketFrame
    public String payloadData() {
        try {
            return new String(this.mPayload, Utf8Charset.NAME);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }
}
