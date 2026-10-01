package com.facebook.stetho.inspector.jsonrpc.protocol;

import com.facebook.stetho.json.annotation.JsonProperty;
import com.google.android.material.ripple.RippleUtils;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class JsonRpcResponse {

    @JsonProperty
    public JSONObject error;

    @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
    public long id;

    @JsonProperty
    public JSONObject result;
}
