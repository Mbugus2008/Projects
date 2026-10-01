package com.facebook.stetho.inspector.elements;

import com.facebook.stetho.common.ThreadBound;
import com.facebook.stetho.common.UncheckedCallable;
import com.facebook.stetho.common.Util;
import java.util.HashMap;
import java.util.Map;
import javax.annotation.Nullable;

/* JADX INFO: loaded from: classes.dex */
public abstract class Descriptor<E> implements NodeDescriptor<E> {
    private Host mHost;

    public interface Host extends ThreadBound {
        @Nullable
        Descriptor<?> getDescriptor(@Nullable Object obj);

        void onAttributeModified(Object obj, String str, String str2);

        void onAttributeRemoved(Object obj, String str);
    }

    protected Descriptor() {
    }

    final void initialize(Host host) {
        Util.throwIfNull(host);
        Util.throwIfNotNull(this.mHost);
        this.mHost = host;
    }

    final boolean isInitialized() {
        return this.mHost != null;
    }

    protected final Host getHost() {
        return this.mHost;
    }

    @Override // com.facebook.stetho.common.ThreadBound
    public final boolean checkThreadAccess() {
        return getHost().checkThreadAccess();
    }

    @Override // com.facebook.stetho.common.ThreadBound
    public final void verifyThreadAccess() {
        getHost().verifyThreadAccess();
    }

    @Override // com.facebook.stetho.common.ThreadBound
    public final <V> V postAndWait(UncheckedCallable<V> uncheckedCallable) {
        return (V) getHost().postAndWait(uncheckedCallable);
    }

    @Override // com.facebook.stetho.common.ThreadBound
    public final void postAndWait(Runnable r) {
        getHost().postAndWait(r);
    }

    @Override // com.facebook.stetho.common.ThreadBound
    public final void postDelayed(Runnable r, long delayMillis) {
        getHost().postDelayed(r, delayMillis);
    }

    @Override // com.facebook.stetho.common.ThreadBound
    public final void removeCallbacks(Runnable r) {
        getHost().removeCallbacks(r);
    }

    protected static Map<String, String> parseSetAttributesAsTextArg(String text) {
        String value = "";
        String key = "";
        StringBuilder buffer = new StringBuilder();
        Map<String, String> keyValuePairs = new HashMap<>();
        boolean isInsideQuotes = false;
        int N = text.length();
        for (int i = 0; i < N; i++) {
            char c = text.charAt(i);
            if (c == '=') {
                key = buffer.toString();
                buffer.setLength(0);
            } else if (c == '\"') {
                if (isInsideQuotes) {
                    value = buffer.toString();
                    buffer.setLength(0);
                }
                isInsideQuotes = isInsideQuotes ? false : true;
            } else if (c == ' ' && !isInsideQuotes) {
                keyValuePairs.put(key, value);
            } else {
                buffer.append(c);
            }
        }
        if (!key.isEmpty() && !value.isEmpty()) {
            keyValuePairs.put(key, value);
        }
        return keyValuePairs;
    }
}
