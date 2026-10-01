package com.facebook.stetho.inspector.protocol.module;

import android.content.Context;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcException;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcPeer;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcResult;
import com.facebook.stetho.inspector.jsonrpc.protocol.JsonRpcError;
import com.facebook.stetho.inspector.network.AsyncPrettyPrinterInitializer;
import com.facebook.stetho.inspector.network.NetworkPeerManager;
import com.facebook.stetho.inspector.network.ResponseBodyData;
import com.facebook.stetho.inspector.network.ResponseBodyFileManager;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsDomain;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsMethod;
import com.facebook.stetho.json.annotation.JsonProperty;
import com.facebook.stetho.json.annotation.JsonValue;
import com.google.android.material.ripple.RippleUtils;
import java.io.IOException;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class Network implements ChromeDevtoolsDomain {
    private final NetworkPeerManager mNetworkPeerManager;
    private final ResponseBodyFileManager mResponseBodyFileManager;

    public static class DataReceivedParams {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int dataLength;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int encodedDataLength;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String requestId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double timestamp;
    }

    public static class Initiator {

        @JsonProperty
        public List<Console.CallFrame> stackTrace;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public InitiatorType type;
    }

    public static class LoadingFailedParams {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String errorText;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String requestId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double timestamp;

        @JsonProperty
        public Page.ResourceType type;
    }

    public static class LoadingFinishedParams {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String requestId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double timestamp;
    }

    public static class Request {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public JSONObject headers;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String method;

        @JsonProperty
        public String postData;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String url;
    }

    public static class RequestWillBeSentParams {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String documentURL;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String frameId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public Initiator initiator;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String loaderId;

        @JsonProperty
        public Response redirectResponse;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public Request request;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String requestId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double timestamp;

        @JsonProperty
        public Page.ResourceType type;
    }

    public static class ResourceTiming {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double connectionEnd;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double connectionStart;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double dnsEnd;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double dnsStart;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double proxyEnd;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double proxyStart;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double receivedHeadersEnd;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double requestTime;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double sendEnd;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double sendStart;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double sslEnd;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double sslStart;
    }

    public static class Response {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int connectionId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public boolean connectionReused;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public Boolean fromDiskCache;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public JSONObject headers;

        @JsonProperty
        public String headersText;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String mimeType;

        @JsonProperty
        public JSONObject requestHeaders;

        @JsonProperty
        public String requestHeadersTest;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int status;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String statusText;

        @JsonProperty
        public ResourceTiming timing;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String url;
    }

    public static class ResponseReceivedParams {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String frameId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String loaderId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String requestId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public Response response;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double timestamp;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public Page.ResourceType type;
    }

    public static class WebSocketClosedParams {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String requestId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double timestamp;
    }

    public static class WebSocketCreatedParams {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String requestId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String url;
    }

    public static class WebSocketFrame {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public boolean mask;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int opcode;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String payloadData;
    }

    public static class WebSocketFrameErrorParams {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String errorMessage;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String requestId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double timestamp;
    }

    public static class WebSocketFrameReceivedParams {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String requestId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public WebSocketFrame response;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double timestamp;
    }

    public static class WebSocketFrameSentParams {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String requestId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public WebSocketFrame response;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double timestamp;
    }

    public static class WebSocketHandshakeResponseReceivedParams {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String requestId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public WebSocketResponse response;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double timestamp;
    }

    public static class WebSocketRequest {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public JSONObject headers;
    }

    public static class WebSocketResponse {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public JSONObject headers;

        @JsonProperty
        public String headersText;

        @JsonProperty
        public JSONObject requestHeaders;

        @JsonProperty
        public String requestHeadersText;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int status;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String statusText;
    }

    public static class WebSocketWillSendHandshakeRequestParams {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public WebSocketRequest request;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String requestId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double timestamp;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public double wallTime;
    }

    public Network(Context context) {
        this.mNetworkPeerManager = NetworkPeerManager.getOrCreateInstance(context);
        this.mResponseBodyFileManager = this.mNetworkPeerManager.getResponseBodyFileManager();
    }

    @ChromeDevtoolsMethod
    public void enable(JsonRpcPeer peer, JSONObject params) {
        this.mNetworkPeerManager.addPeer(peer);
    }

    @ChromeDevtoolsMethod
    public void disable(JsonRpcPeer peer, JSONObject params) {
        this.mNetworkPeerManager.removePeer(peer);
    }

    @ChromeDevtoolsMethod
    public void setUserAgentOverride(JsonRpcPeer peer, JSONObject params) {
    }

    @ChromeDevtoolsMethod
    public JsonRpcResult getResponseBody(JsonRpcPeer peer, JSONObject params) throws JsonRpcException {
        try {
            String requestId = params.getString("requestId");
            return readResponseBody(requestId);
        } catch (IOException e) {
            throw new JsonRpcException(new JsonRpcError(JsonRpcError.ErrorCode.INTERNAL_ERROR, e.toString(), null));
        } catch (JSONException e2) {
            throw new JsonRpcException(new JsonRpcError(JsonRpcError.ErrorCode.INTERNAL_ERROR, e2.toString(), null));
        }
    }

    private GetResponseBodyResponse readResponseBody(String requestId) throws JsonRpcException, IOException {
        GetResponseBodyResponse response = new GetResponseBodyResponse();
        try {
            ResponseBodyData bodyData = this.mResponseBodyFileManager.readFile(requestId);
            response.body = bodyData.data;
            response.base64Encoded = bodyData.base64Encoded;
            return response;
        } catch (OutOfMemoryError e) {
            throw new JsonRpcException(new JsonRpcError(JsonRpcError.ErrorCode.INTERNAL_ERROR, e.toString(), null));
        }
    }

    public void setPrettyPrinterInitializer(AsyncPrettyPrinterInitializer initializer) {
        Util.throwIfNull(initializer);
        this.mNetworkPeerManager.setPrettyPrinterInitializer(initializer);
    }

    private static class GetResponseBodyResponse implements JsonRpcResult {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public boolean base64Encoded;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String body;

        private GetResponseBodyResponse() {
        }
    }

    public enum InitiatorType {
        PARSER("parser"),
        SCRIPT("script"),
        OTHER("other");

        private final String mProtocolValue;

        InitiatorType(String protocolValue) {
            this.mProtocolValue = protocolValue;
        }

        @JsonValue
        public String getProtocolValue() {
            return this.mProtocolValue;
        }
    }
}
