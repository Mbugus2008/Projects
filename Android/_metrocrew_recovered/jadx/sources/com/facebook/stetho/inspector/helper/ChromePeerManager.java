package com.facebook.stetho.inspector.helper;

import com.facebook.stetho.common.LogRedirector;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.inspector.jsonrpc.DisconnectReceiver;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcPeer;
import com.facebook.stetho.inspector.jsonrpc.PendingRequestCallback;
import java.nio.channels.NotYetConnectedException;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Nullable;

/* JADX INFO: loaded from: classes.dex */
public class ChromePeerManager {
    private static final String TAG = "ChromePeerManager";
    private PeerRegistrationListener mListener;
    private final Map<JsonRpcPeer, DisconnectReceiver> mReceivingPeers = new HashMap();
    private JsonRpcPeer[] mReceivingPeersSnapshot;

    public synchronized void setListener(PeerRegistrationListener listener) {
        this.mListener = listener;
    }

    public synchronized boolean addPeer(JsonRpcPeer peer) {
        if (this.mReceivingPeers.containsKey(peer)) {
            return false;
        }
        DisconnectReceiver disconnectReceiver = new UnregisterOnDisconnect(peer);
        peer.registerDisconnectReceiver(disconnectReceiver);
        this.mReceivingPeers.put(peer, disconnectReceiver);
        this.mReceivingPeersSnapshot = null;
        if (this.mListener != null) {
            this.mListener.onPeerRegistered(peer);
        }
        return true;
    }

    public synchronized void removePeer(JsonRpcPeer peer) {
        if (this.mReceivingPeers.remove(peer) != null) {
            this.mReceivingPeersSnapshot = null;
            if (this.mListener != null) {
                this.mListener.onPeerUnregistered(peer);
            }
        }
    }

    public synchronized boolean hasRegisteredPeers() {
        return !this.mReceivingPeers.isEmpty();
    }

    private synchronized JsonRpcPeer[] getReceivingPeersSnapshot() {
        if (this.mReceivingPeersSnapshot == null) {
            this.mReceivingPeersSnapshot = (JsonRpcPeer[]) this.mReceivingPeers.keySet().toArray(new JsonRpcPeer[this.mReceivingPeers.size()]);
        }
        return this.mReceivingPeersSnapshot;
    }

    public void sendNotificationToPeers(String method, Object params) {
        sendMessageToPeers(method, params, null);
    }

    public void invokeMethodOnPeers(String method, Object params, PendingRequestCallback callback) {
        Util.throwIfNull(callback);
        sendMessageToPeers(method, params, callback);
    }

    private void sendMessageToPeers(String method, Object params, @Nullable PendingRequestCallback callback) {
        JsonRpcPeer[] peers = getReceivingPeersSnapshot();
        for (JsonRpcPeer peer : peers) {
            try {
                peer.invokeMethod(method, params, callback);
            } catch (NotYetConnectedException e) {
                LogRedirector.e(TAG, "Error delivering data to Chrome", e);
            }
        }
    }

    private class UnregisterOnDisconnect implements DisconnectReceiver {
        private final JsonRpcPeer mPeer;

        public UnregisterOnDisconnect(JsonRpcPeer peer) {
            this.mPeer = peer;
        }

        @Override // com.facebook.stetho.inspector.jsonrpc.DisconnectReceiver
        public void onDisconnect() {
            ChromePeerManager.this.removePeer(this.mPeer);
        }
    }
}
