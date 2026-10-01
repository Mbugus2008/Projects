package com.facebook.stetho.inspector.jsonrpc.protocol;

import com.facebook.stetho.json.annotation.JsonProperty;
import com.facebook.stetho.json.annotation.JsonValue;
import com.google.android.material.ripple.RippleUtils;
import javax.annotation.Nullable;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class JsonRpcError {

    @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
    public ErrorCode code;

    @JsonProperty
    public JSONObject data;

    @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
    public String message;

    public JsonRpcError() {
    }

    public JsonRpcError(ErrorCode code, String message, @Nullable JSONObject data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public enum ErrorCode {
        PARSER_ERROR(-32700),
        INVALID_REQUEST(-32600),
        METHOD_NOT_FOUND(-32601),
        INVALID_PARAMS(-32602),
        INTERNAL_ERROR(-32603);

        private final int mProtocolValue;

        ErrorCode(int protocolValue) {
            this.mProtocolValue = protocolValue;
        }

        @JsonValue
        public int getProtocolValue() {
            return this.mProtocolValue;
        }
    }
}
