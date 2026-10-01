package com.facebook.stetho.inspector.jsonrpc;

import com.facebook.stetho.inspector.jsonrpc.protocol.JsonRpcResponse;

/* JADX INFO: loaded from: classes.dex */
public interface PendingRequestCallback {
    void onResponse(JsonRpcPeer jsonRpcPeer, JsonRpcResponse jsonRpcResponse);
}
