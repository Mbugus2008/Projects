package com.facebook.stetho.inspector.protocol.module;

import com.facebook.stetho.inspector.console.ConsolePeerManager;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcPeer;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsDomain;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsMethod;
import com.facebook.stetho.json.annotation.JsonProperty;
import com.facebook.stetho.json.annotation.JsonValue;
import com.google.android.material.ripple.RippleUtils;
import com.trimline.metrocrew.BuildConfig;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class Console implements ChromeDevtoolsDomain {

    public static class ConsoleMessage {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public MessageLevel level;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public MessageSource source;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String text;
    }

    public static class MessageAddedRequest {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public ConsoleMessage message;
    }

    @ChromeDevtoolsMethod
    public void enable(JsonRpcPeer peer, JSONObject params) {
        ConsolePeerManager.getOrCreateInstance().addPeer(peer);
    }

    @ChromeDevtoolsMethod
    public void disable(JsonRpcPeer peer, JSONObject params) {
        ConsolePeerManager.getOrCreateInstance().removePeer(peer);
    }

    public enum MessageSource {
        XML("xml"),
        JAVASCRIPT("javascript"),
        NETWORK("network"),
        CONSOLE_API("console-api"),
        STORAGE("storage"),
        APPCACHE("appcache"),
        RENDERING("rendering"),
        CSS("css"),
        SECURITY("security"),
        OTHER("other");

        private final String mProtocolValue;

        MessageSource(String protocolValue) {
            this.mProtocolValue = protocolValue;
        }

        @JsonValue
        public String getProtocolValue() {
            return this.mProtocolValue;
        }
    }

    public enum MessageLevel {
        LOG("log"),
        WARNING("warning"),
        ERROR("error"),
        DEBUG(BuildConfig.BUILD_TYPE);

        private final String mProtocolValue;

        MessageLevel(String protocolValue) {
            this.mProtocolValue = protocolValue;
        }

        @JsonValue
        public String getProtocolValue() {
            return this.mProtocolValue;
        }
    }

    public static class CallFrame {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int columnNumber;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String functionName;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int lineNumber;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String url;

        public CallFrame() {
        }

        public CallFrame(String functionName, String url, int lineNumber, int columnNumber) {
            this.functionName = functionName;
            this.url = url;
            this.lineNumber = lineNumber;
            this.columnNumber = columnNumber;
        }
    }
}
