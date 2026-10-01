package com.facebook.stetho.inspector.jsonrpc;

import com.facebook.stetho.common.Util;
import com.facebook.stetho.inspector.jsonrpc.protocol.JsonRpcError;

/* JADX INFO: loaded from: classes.dex */
public class JsonRpcException extends Exception {
    private final JsonRpcError mErrorMessage;

    public JsonRpcException(JsonRpcError errorMessage) {
        super(errorMessage.code + ": " + errorMessage.message);
        this.mErrorMessage = (JsonRpcError) Util.throwIfNull(errorMessage);
    }

    public JsonRpcError getErrorMessage() {
        return this.mErrorMessage;
    }
}
