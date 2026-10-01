package com.facebook.stetho.inspector.protocol.module;

import com.facebook.stetho.inspector.jsonrpc.JsonRpcPeer;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcResult;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsDomain;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsMethod;
import com.facebook.stetho.json.annotation.JsonProperty;
import com.google.android.material.ripple.RippleUtils;
import java.util.Collections;
import java.util.List;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class HeapProfiler implements ChromeDevtoolsDomain {
    @ChromeDevtoolsMethod
    public JsonRpcResult getProfileHeaders(JsonRpcPeer peer, JSONObject params) {
        ProfileHeaderResponse response = new ProfileHeaderResponse();
        response.headers = Collections.emptyList();
        return response;
    }

    private static class ProfileHeaderResponse implements JsonRpcResult {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public List<ProfileHeader> headers;

        private ProfileHeaderResponse() {
        }
    }

    private static class ProfileHeader {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String title;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int uid;

        private ProfileHeader() {
        }
    }
}
