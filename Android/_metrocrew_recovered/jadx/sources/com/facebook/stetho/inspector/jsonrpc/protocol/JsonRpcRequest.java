package com.facebook.stetho.inspector.jsonrpc.protocol;

import com.facebook.stetho.json.annotation.JsonProperty;
import com.google.android.material.ripple.RippleUtils;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class JsonRpcRequest {

    @JsonProperty
    public Long id;

    @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
    public String method;

    @JsonProperty
    public JSONObject params;

    public JsonRpcRequest() {
    }

    public JsonRpcRequest(Long id, String method, JSONObject params) {
        this.id = id;
        this.method = method;
        this.params = params;
    }
}
