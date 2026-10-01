package androidx.work;

import android.content.Context;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* JADX INFO: compiled from: WorkerFactory.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b&\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\"\u0010\u0003\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\nH&J \u0010\u000b\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\nH\u0007¨\u0006\f"}, d2 = {"Landroidx/work/WorkerFactory;", "", "()V", "createWorker", "Landroidx/work/ListenableWorker;", "appContext", "Landroid/content/Context;", "workerClassName", "", "workerParameters", "Landroidx/work/WorkerParameters;", "createWorkerWithDefaultFallback", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public abstract class WorkerFactory {
    public abstract ListenableWorker createWorker(Context appContext, String workerClassName, WorkerParameters workerParameters);

    private static final Class<? extends ListenableWorker> createWorkerWithDefaultFallback$getWorkerClass(String workerClassName) {
        try {
            Class clsAsSubclass = Class.forName(workerClassName).asSubclass(ListenableWorker.class);
            Intrinsics.checkNotNullExpressionValue(clsAsSubclass, "{\n                Class.…class.java)\n            }");
            return clsAsSubclass;
        } catch (Throwable throwable) {
            Logger.get().error(WorkerFactoryKt.TAG, "Invalid class: " + workerClassName, throwable);
            throw throwable;
        }
    }

    private static final ListenableWorker createWorkerWithDefaultFallback$fallbackToReflection(Context $appContext, String workerClassName, WorkerParameters workerParameters) {
        try {
            ListenableWorker listenableWorkerNewInstance = createWorkerWithDefaultFallback$getWorkerClass(workerClassName).getDeclaredConstructor(Context.class, WorkerParameters.class).newInstance($appContext, workerParameters);
            Intrinsics.checkNotNullExpressionValue(listenableWorkerNewInstance, "{\n                val co…Parameters)\n            }");
            return listenableWorkerNewInstance;
        } catch (Throwable e) {
            Logger.get().error(WorkerFactoryKt.TAG, "Could not instantiate " + workerClassName, e);
            throw e;
        }
    }

    public final ListenableWorker createWorkerWithDefaultFallback(Context appContext, String workerClassName, WorkerParameters workerParameters) {
        Intrinsics.checkNotNullParameter(appContext, "appContext");
        Intrinsics.checkNotNullParameter(workerClassName, "workerClassName");
        Intrinsics.checkNotNullParameter(workerParameters, "workerParameters");
        ListenableWorker worker = createWorker(appContext, workerClassName, workerParameters);
        if (worker == null) {
            worker = createWorkerWithDefaultFallback$fallbackToReflection(appContext, workerClassName, workerParameters);
        }
        if (worker.isUsed()) {
            String message = "WorkerFactory (" + getClass().getName() + ") returned an instance of a ListenableWorker (" + workerClassName + ") which has already been invoked. createWorker() must always return a new instance of a ListenableWorker.";
            throw new IllegalStateException(message);
        }
        return worker;
    }
}
