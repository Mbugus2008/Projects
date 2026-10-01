package com.facebook.stetho.inspector.jsonrpc;

import android.database.Observable;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.inspector.jsonrpc.protocol.JsonRpcRequest;
import com.facebook.stetho.json.ObjectMapper;
import com.facebook.stetho.websocket.SimpleSession;
import java.nio.channels.NotYetConnectedException;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Nullable;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class JsonRpcPeer {
    private long mNextRequestId;
    private final ObjectMapper mObjectMapper;
    private final SimpleSession mPeer;
    private final Map<Long, PendingRequest> mPendingRequests = new HashMap();
    private final DisconnectObservable mDisconnectObservable = new DisconnectObservable();

    public JsonRpcPeer(ObjectMapper objectMapper, SimpleSession peer) {
        this.mObjectMapper = objectMapper;
        this.mPeer = (SimpleSession) Util.throwIfNull(peer);
    }

    public SimpleSession getWebSocket() {
        return this.mPeer;
    }

    public void invokeMethod(String method, Object paramsObject, @Nullable PendingRequestCallback callback) throws NotYetConnectedException {
        Util.throwIfNull(method);
        Long requestId = callback != null ? Long.valueOf(preparePendingRequest(callback)) : null;
        JSONObject params = (JSONObject) this.mObjectMapper.convertValue(paramsObject, JSONObject.class);
        JsonRpcRequest message = new JsonRpcRequest(requestId, method, params);
        JSONObject jsonObject = (JSONObject) this.mObjectMapper.convertValue(message, JSONObject.class);
        String requestString = jsonObject.toString();
        this.mPeer.sendText(requestString);
    }

    public void registerDisconnectReceiver(DisconnectReceiver callback) {
        this.mDisconnectObservable.registerObserver(callback);
    }

    public void unregisterDisconnectReceiver(DisconnectReceiver callback) {
        this.mDisconnectObservable.unregisterObserver(callback);
    }

    public void invokeDisconnectReceivers() {
        this.mDisconnectObservable.onDisconnect();
    }

    private synchronized long preparePendingRequest(PendingRequestCallback callback) {
        long requestId;
        requestId = this.mNextRequestId;
        this.mNextRequestId = 1 + requestId;
        this.mPendingRequests.put(Long.valueOf(requestId), new PendingRequest(requestId, callback));
        return requestId;
    }

    public synchronized PendingRequest getAndRemovePendingRequest(long requestId) {
        return this.mPendingRequests.remove(Long.valueOf(requestId));
    }

    private static class DisconnectObservable extends Observable<DisconnectReceiver> {
        private DisconnectObservable() {
        }

        public void onDisconnect() {
            int N = this.mObservers.size();
            for (int i = 0; i < N; i++) {
                DisconnectReceiver observer = (DisconnectReceiver) this.mObservers.get(i);
                observer.onDisconnect();
            }
        }
    }
}
