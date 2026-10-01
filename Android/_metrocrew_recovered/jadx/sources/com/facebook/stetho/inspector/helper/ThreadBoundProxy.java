package com.facebook.stetho.inspector.helper;

import com.facebook.stetho.common.ThreadBound;
import com.facebook.stetho.common.UncheckedCallable;
import com.facebook.stetho.common.Util;

/* JADX INFO: loaded from: classes.dex */
public abstract class ThreadBoundProxy implements ThreadBound {
    private final ThreadBound mEnforcer;

    public ThreadBoundProxy(ThreadBound enforcer) {
        this.mEnforcer = (ThreadBound) Util.throwIfNull(enforcer);
    }

    @Override // com.facebook.stetho.common.ThreadBound
    public final boolean checkThreadAccess() {
        return this.mEnforcer.checkThreadAccess();
    }

    @Override // com.facebook.stetho.common.ThreadBound
    public final void verifyThreadAccess() {
        this.mEnforcer.verifyThreadAccess();
    }

    @Override // com.facebook.stetho.common.ThreadBound
    public final <V> V postAndWait(UncheckedCallable<V> uncheckedCallable) {
        return (V) this.mEnforcer.postAndWait(uncheckedCallable);
    }

    @Override // com.facebook.stetho.common.ThreadBound
    public final void postAndWait(Runnable r) {
        this.mEnforcer.postAndWait(r);
    }

    @Override // com.facebook.stetho.common.ThreadBound
    public final void postDelayed(Runnable r, long delayMillis) {
        this.mEnforcer.postDelayed(r, delayMillis);
    }

    @Override // com.facebook.stetho.common.ThreadBound
    public final void removeCallbacks(Runnable r) {
        this.mEnforcer.removeCallbacks(r);
    }
}
