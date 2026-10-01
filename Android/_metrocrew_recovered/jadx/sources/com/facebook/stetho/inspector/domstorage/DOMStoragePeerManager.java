package com.facebook.stetho.inspector.domstorage;

import android.content.Context;
import android.content.SharedPreferences;
import com.facebook.stetho.common.LogUtil;
import com.facebook.stetho.inspector.helper.ChromePeerManager;
import com.facebook.stetho.inspector.helper.PeerRegistrationListener;
import com.facebook.stetho.inspector.helper.PeersRegisteredListener;
import com.facebook.stetho.inspector.protocol.module.DOMStorage;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public class DOMStoragePeerManager extends ChromePeerManager {
    private final Context mContext;
    private final PeerRegistrationListener mPeerListener = new PeersRegisteredListener() { // from class: com.facebook.stetho.inspector.domstorage.DOMStoragePeerManager.1
        private final List<DevToolsSharedPreferencesListener> mPrefsListeners = new ArrayList();

        @Override // com.facebook.stetho.inspector.helper.PeersRegisteredListener
        protected synchronized void onFirstPeerRegistered() {
            List<String> tags = SharedPreferencesHelper.getSharedPreferenceTags(DOMStoragePeerManager.this.mContext);
            for (String tag : tags) {
                SharedPreferences prefs = DOMStoragePeerManager.this.mContext.getSharedPreferences(tag, 0);
                DevToolsSharedPreferencesListener listener = DOMStoragePeerManager.this.new DevToolsSharedPreferencesListener(prefs, tag);
                prefs.registerOnSharedPreferenceChangeListener(listener);
                this.mPrefsListeners.add(listener);
            }
        }

        @Override // com.facebook.stetho.inspector.helper.PeersRegisteredListener
        protected synchronized void onLastPeerUnregistered() {
            for (DevToolsSharedPreferencesListener prefsListener : this.mPrefsListeners) {
                prefsListener.unregister();
            }
            this.mPrefsListeners.clear();
        }
    };

    public DOMStoragePeerManager(Context context) {
        this.mContext = context;
        setListener(this.mPeerListener);
    }

    public void signalItemRemoved(DOMStorage.StorageId storageId, String key) {
        DOMStorage.DomStorageItemRemovedParams params = new DOMStorage.DomStorageItemRemovedParams();
        params.storageId = storageId;
        params.key = key;
        sendNotificationToPeers("DOMStorage.domStorageItemRemoved", params);
    }

    public void signalItemAdded(DOMStorage.StorageId storageId, String key, String value) {
        DOMStorage.DomStorageItemAddedParams params = new DOMStorage.DomStorageItemAddedParams();
        params.storageId = storageId;
        params.key = key;
        params.newValue = value;
        sendNotificationToPeers("DOMStorage.domStorageItemAdded", params);
    }

    public void signalItemUpdated(DOMStorage.StorageId storageId, String key, String oldValue, String newValue) {
        DOMStorage.DomStorageItemUpdatedParams params = new DOMStorage.DomStorageItemUpdatedParams();
        params.storageId = storageId;
        params.key = key;
        params.oldValue = oldValue;
        params.newValue = newValue;
        sendNotificationToPeers("DOMStorage.domStorageItemUpdated", params);
    }

    private class DevToolsSharedPreferencesListener implements SharedPreferences.OnSharedPreferenceChangeListener {
        private final Map<String, Object> mCopy;
        private final SharedPreferences mPrefs;
        private final DOMStorage.StorageId mStorageId = new DOMStorage.StorageId();

        public DevToolsSharedPreferencesListener(SharedPreferences prefs, String tag) {
            this.mPrefs = prefs;
            this.mStorageId.securityOrigin = tag;
            this.mStorageId.isLocalStorage = true;
            this.mCopy = DOMStoragePeerManager.prefsCopy(prefs.getAll());
        }

        public void unregister() {
            this.mPrefs.unregisterOnSharedPreferenceChangeListener(this);
        }

        @Override // android.content.SharedPreferences.OnSharedPreferenceChangeListener
        public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String key) {
            Map<String, ?> entries = sharedPreferences.getAll();
            boolean existedBefore = this.mCopy.containsKey(key);
            boolean existsNow = entries.containsKey(key);
            Object newValue = existsNow ? entries.get(key) : null;
            if (existedBefore && existsNow) {
                DOMStoragePeerManager.this.signalItemUpdated(this.mStorageId, key, SharedPreferencesHelper.valueToString(this.mCopy.get(key)), SharedPreferencesHelper.valueToString(newValue));
                this.mCopy.put(key, newValue);
            } else if (existedBefore) {
                DOMStoragePeerManager.this.signalItemRemoved(this.mStorageId, key);
                this.mCopy.remove(key);
            } else if (existsNow) {
                DOMStoragePeerManager.this.signalItemAdded(this.mStorageId, key, SharedPreferencesHelper.valueToString(newValue));
                this.mCopy.put(key, newValue);
            } else {
                LogUtil.i("Detected rapid put/remove of %s", key);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Map<String, Object> prefsCopy(Map<String, ?> src) {
        HashMap<String, Object> dst = new HashMap<>(src.size());
        for (Map.Entry<String, ?> entry : src.entrySet()) {
            String key = entry.getKey();
            Object value = entry.getValue();
            if (value instanceof Set) {
                dst.put(key, shallowCopy((Set) value));
            } else {
                dst.put(key, value);
            }
        }
        return dst;
    }

    private static <T> Set<T> shallowCopy(Set<T> src) {
        HashSet<T> dst = new HashSet<>();
        for (T item : src) {
            dst.add(item);
        }
        return dst;
    }
}
