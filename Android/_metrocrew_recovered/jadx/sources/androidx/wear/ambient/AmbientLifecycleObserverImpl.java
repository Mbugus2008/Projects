package androidx.wear.ambient;

import android.app.Activity;
import android.os.Bundle;
import androidx.lifecycle.LifecycleOwner;
import java.util.concurrent.Executor;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* JADX INFO: compiled from: AmbientLifecycleObserverImpl.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000C\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005*\u0001\u000b\b\u0000\u0018\u00002\u00020\u0001B\u0017\b\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\tJ\u0010\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0015H\u0016J\u0010\u0010\u0016\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0015H\u0016J\u0010\u0010\u0017\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0015H\u0016J\u0010\u0010\u0018\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0015H\u0016J\u0010\u0010\u0019\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0015H\u0016R\u0010\u0010\n\u001a\u00020\u000bX\u0082\u0004¢\u0006\u0004\n\u0002\u0010\fR\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u000f\u001a\u00020\u00108VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u000f\u0010\u0011¨\u0006\u001a"}, d2 = {"Landroidx/wear/ambient/AmbientLifecycleObserverImpl;", "Landroidx/wear/ambient/AmbientLifecycleObserver;", "activity", "Landroid/app/Activity;", "callback", "Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;", "(Landroid/app/Activity;Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;)V", "callbackExecutor", "Ljava/util/concurrent/Executor;", "(Landroid/app/Activity;Ljava/util/concurrent/Executor;Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;)V", "callbackTranslator", "androidx/wear/ambient/AmbientLifecycleObserverImpl$callbackTranslator$1", "Landroidx/wear/ambient/AmbientLifecycleObserverImpl$callbackTranslator$1;", "delegate", "Landroidx/wear/ambient/AmbientDelegate;", "isAmbient", "", "()Z", "onCreate", "", "owner", "Landroidx/lifecycle/LifecycleOwner;", "onDestroy", "onPause", "onResume", "onStop", "wear_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public final class AmbientLifecycleObserverImpl implements AmbientLifecycleObserver {
    private final AmbientLifecycleObserverImpl$callbackTranslator$1 callbackTranslator;
    private final AmbientDelegate delegate;

    /* JADX WARN: Type inference failed for: r0v3, types: [androidx.wear.ambient.AmbientLifecycleObserverImpl$callbackTranslator$1] */
    public AmbientLifecycleObserverImpl(Activity activity, final Executor callbackExecutor, final AmbientLifecycleObserver.AmbientLifecycleCallback callback) {
        Intrinsics.checkNotNullParameter(activity, "activity");
        Intrinsics.checkNotNullParameter(callbackExecutor, "callbackExecutor");
        Intrinsics.checkNotNullParameter(callback, "callback");
        this.callbackTranslator = new AmbientDelegate.AmbientCallback() { // from class: androidx.wear.ambient.AmbientLifecycleObserverImpl$callbackTranslator$1
            @Override // androidx.wear.ambient.AmbientDelegate.AmbientCallback
            public void onEnterAmbient(Bundle ambientDetails) {
                boolean burnInProtection;
                boolean lowBitAmbient = false;
                if (ambientDetails != null) {
                    burnInProtection = ambientDetails.getBoolean("com.google.android.wearable.compat.extra.BURN_IN_PROTECTION");
                } else {
                    burnInProtection = false;
                }
                if (ambientDetails != null) {
                    lowBitAmbient = ambientDetails.getBoolean("com.google.android.wearable.compat.extra.LOWBIT_AMBIENT");
                }
                Executor executor = callbackExecutor;
                callback.onEnterAmbient(new AmbientLifecycleObserver.AmbientDetails(burnInProtection, lowBitAmbient));
            }

            @Override // androidx.wear.ambient.AmbientDelegate.AmbientCallback
            public void onUpdateAmbient() {
                Executor executor = callbackExecutor;
                callback.onUpdateAmbient();
            }

            @Override // androidx.wear.ambient.AmbientDelegate.AmbientCallback
            public void onExitAmbient() {
                Executor executor = callbackExecutor;
                callback.onExitAmbient();
            }

            @Override // androidx.wear.ambient.AmbientDelegate.AmbientCallback
            public void onAmbientOffloadInvalidated() {
            }
        };
        this.delegate = new AmbientDelegate(activity, new WearableControllerProvider(), this.callbackTranslator);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public AmbientLifecycleObserverImpl(Activity activity, AmbientLifecycleObserver.AmbientLifecycleCallback callback) {
        this(activity, new Executor() { // from class: androidx.wear.ambient.AmbientLifecycleObserverImpl$$ExternalSyntheticLambda0
            @Override // java.util.concurrent.Executor
            public final void execute(Runnable runnable) {
                runnable.run();
            }
        }, callback);
        Intrinsics.checkNotNullParameter(activity, "activity");
        Intrinsics.checkNotNullParameter(callback, "callback");
    }

    @Override // androidx.wear.ambient.AmbientLifecycleObserver
    public boolean isAmbient() {
        return this.delegate.isAmbient();
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public void onCreate(LifecycleOwner owner) {
        Intrinsics.checkNotNullParameter(owner, "owner");
        super.onCreate(owner);
        this.delegate.onCreate();
        this.delegate.setAmbientEnabled();
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public void onResume(LifecycleOwner owner) {
        Intrinsics.checkNotNullParameter(owner, "owner");
        super.onResume(owner);
        this.delegate.onResume();
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public void onPause(LifecycleOwner owner) {
        Intrinsics.checkNotNullParameter(owner, "owner");
        super.onPause(owner);
        this.delegate.onPause();
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public void onStop(LifecycleOwner owner) {
        Intrinsics.checkNotNullParameter(owner, "owner");
        super.onStop(owner);
        this.delegate.onStop();
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public void onDestroy(LifecycleOwner owner) {
        Intrinsics.checkNotNullParameter(owner, "owner");
        super.onDestroy(owner);
        this.delegate.onDestroy();
    }
}
