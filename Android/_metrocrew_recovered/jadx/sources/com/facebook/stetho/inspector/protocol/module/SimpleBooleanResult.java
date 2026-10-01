package com.facebook.stetho.inspector.protocol.module;

import com.facebook.stetho.inspector.jsonrpc.JsonRpcResult;
import com.facebook.stetho.json.annotation.JsonProperty;
import com.google.android.material.ripple.RippleUtils;

/* JADX INFO: loaded from: classes.dex */
public class SimpleBooleanResult implements JsonRpcResult {

    @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
    public boolean result;

    public SimpleBooleanResult() {
    }

    public SimpleBooleanResult(boolean result) {
        this.result = result;
    }
}
