package com.facebook.stetho.inspector.jsonrpc.protocol;

import com.facebook.stetho.json.annotation.JsonProperty;
import com.google.android.material.ripple.RippleUtils;
import javax.annotation.Nullable;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class JsonRpcEvent {

    @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
    public String method;

    @JsonProperty
    public JSONObject params;

    public JsonRpcEvent() {
    }

    public JsonRpcEvent(String method, @Nullable JSONObject params) {
        this.method = method;
        this.params = params;
    }
}
