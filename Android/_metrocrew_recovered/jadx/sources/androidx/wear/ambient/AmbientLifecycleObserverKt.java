package androidx.wear.ambient;

import android.app.Activity;
import java.util.concurrent.Executor;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* JADX INFO: compiled from: AmbientLifecycleObserver.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u001a\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a\u0016\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005\u001a\u001e\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0004\u001a\u00020\u0005¨\u0006\b"}, d2 = {"AmbientLifecycleObserver", "Landroidx/wear/ambient/AmbientLifecycleObserver;", "activity", "Landroid/app/Activity;", "callbacks", "Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;", "callbackExecutor", "Ljava/util/concurrent/Executor;", "wear_release"}, k = 2, mv = {1, 8, 0}, xi = 48)
public final class AmbientLifecycleObserverKt {
    public static final AmbientLifecycleObserver AmbientLifecycleObserver(Activity activity, Executor callbackExecutor, AmbientLifecycleObserver.AmbientLifecycleCallback callbacks) {
        Intrinsics.checkNotNullParameter(activity, "activity");
        Intrinsics.checkNotNullParameter(callbackExecutor, "callbackExecutor");
        Intrinsics.checkNotNullParameter(callbacks, "callbacks");
        return new AmbientLifecycleObserverImpl(activity, callbackExecutor, callbacks);
    }

    public static final AmbientLifecycleObserver AmbientLifecycleObserver(Activity activity, AmbientLifecycleObserver.AmbientLifecycleCallback callbacks) {
        Intrinsics.checkNotNullParameter(activity, "activity");
        Intrinsics.checkNotNullParameter(callbacks, "callbacks");
        return new AmbientLifecycleObserverImpl(activity, callbacks);
    }
}
