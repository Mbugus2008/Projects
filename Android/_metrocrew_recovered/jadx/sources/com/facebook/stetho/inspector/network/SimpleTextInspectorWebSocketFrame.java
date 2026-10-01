package com.facebook.stetho.inspector.network;

/* JADX INFO: loaded from: classes.dex */
public class SimpleTextInspectorWebSocketFrame implements NetworkEventReporter.InspectorWebSocketFrame {
    private final String mPayload;
    private final String mRequestId;

    public SimpleTextInspectorWebSocketFrame(String requestId, String payload) {
        this.mRequestId = requestId;
        this.mPayload = payload;
    }

    @Override // com.facebook.stetho.inspector.network.NetworkEventReporter.InspectorWebSocketFrame
    public String requestId() {
        return this.mRequestId;
    }

    @Override // com.facebook.stetho.inspector.network.NetworkEventReporter.InspectorWebSocketFrame
    public int opcode() {
        return 1;
    }

    @Override // com.facebook.stetho.inspector.network.NetworkEventReporter.InspectorWebSocketFrame
    public boolean mask() {
        return false;
    }

    @Override // com.facebook.stetho.inspector.network.NetworkEventReporter.InspectorWebSocketFrame
    public String payloadData() {
        return this.mPayload;
    }
}
