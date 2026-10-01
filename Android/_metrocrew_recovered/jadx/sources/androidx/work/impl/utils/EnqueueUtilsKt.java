package androidx.work.impl.utils;

import android.os.Build;
import androidx.work.Configuration;
import androidx.work.Constraints;
import androidx.work.Data;
import androidx.work.WorkRequest;
import androidx.work.impl.Scheduler;
import androidx.work.impl.WorkContinuationImpl;
import androidx.work.impl.WorkDatabase;
import androidx.work.impl.model.WorkSpec;
import androidx.work.impl.workers.ConstraintTrackingWorker;
import androidx.work.impl.workers.ConstraintTrackingWorkerKt;
import java.util.Collection;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.internal.Intrinsics;

/* JADX INFO: compiled from: EnqueueUtils.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000<\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\u001a \u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\fH\u0000\u001a\u0010\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u000eH\u0000\u001a\u0010\u0010\u0010\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u000eH\u0007\u001a\u001e\u0010\u0011\u001a\u00020\u00122\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00150\u00142\u0006\u0010\u0016\u001a\u00020\u0001H\u0002\u001a\u001e\u0010\u0017\u001a\u00020\u000e2\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00150\u00142\u0006\u0010\u000f\u001a\u00020\u000eH\u0000\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0002\u001a\u00020\u0001X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0003\u001a\u00020\u0001X\u0080T¢\u0006\u0002\n\u0000\"\u000e\u0010\u0004\u001a\u00020\u0001X\u0080T¢\u0006\u0002\n\u0000¨\u0006\u0018"}, d2 = {"ARGUMENT_REMOTE_LISTENABLE_WORKER_NAME", "", "ARGUMENT_SERVICE_CLASS_NAME", "ARGUMENT_SERVICE_PACKAGE_NAME", "REMOTE_DELEGATING_LISTENABLE_WORKER_CLASS_NAME", "checkContentUriTriggerWorkerLimits", "", "workDatabase", "Landroidx/work/impl/WorkDatabase;", "configuration", "Landroidx/work/Configuration;", "continuation", "Landroidx/work/impl/WorkContinuationImpl;", "tryDelegateConstrainedWorkSpec", "Landroidx/work/impl/model/WorkSpec;", "workSpec", "tryDelegateRemoteListenableWorker", "usesScheduler", "", "schedulers", "", "Landroidx/work/impl/Scheduler;", "className", "wrapWorkSpecIfNeeded", "work-runtime_release"}, k = 2, mv = {1, 8, 0}, xi = 48)
public final class EnqueueUtilsKt {
    public static final String ARGUMENT_REMOTE_LISTENABLE_WORKER_NAME = "androidx.work.multiprocess.RemoteListenableDelegatingWorker.ARGUMENT_REMOTE_LISTENABLE_WORKER_NAME";
    public static final String ARGUMENT_SERVICE_CLASS_NAME = "androidx.work.impl.workers.RemoteListenableWorker.ARGUMENT_CLASS_NAME";
    public static final String ARGUMENT_SERVICE_PACKAGE_NAME = "androidx.work.impl.workers.RemoteListenableWorker.ARGUMENT_PACKAGE_NAME";
    public static final String REMOTE_DELEGATING_LISTENABLE_WORKER_CLASS_NAME = "androidx.work.multiprocess.RemoteListenableDelegatingWorker";

    public static final void checkContentUriTriggerWorkerLimits(WorkDatabase workDatabase, Configuration configuration, WorkContinuationImpl continuation) {
        int count$iv;
        Intrinsics.checkNotNullParameter(workDatabase, "workDatabase");
        Intrinsics.checkNotNullParameter(configuration, "configuration");
        Intrinsics.checkNotNullParameter(continuation, "continuation");
        List continuations = CollectionsKt.mutableListOf(continuation);
        int newCount = 0;
        while (!continuations.isEmpty()) {
            WorkContinuationImpl current = (WorkContinuationImpl) CollectionsKt.removeLast(continuations);
            Iterable work = current.getWork();
            Intrinsics.checkNotNullExpressionValue(work, "current.work");
            Iterable $this$count$iv = work;
            if (($this$count$iv instanceof Collection) && ((Collection) $this$count$iv).isEmpty()) {
                count$iv = 0;
            } else {
                count$iv = 0;
                for (Object element$iv : $this$count$iv) {
                    WorkRequest it = (WorkRequest) element$iv;
                    if (it.getWorkSpec().constraints.hasContentUriTriggers() && (count$iv = count$iv + 1) < 0) {
                        CollectionsKt.throwCountOverflow();
                    }
                }
            }
            newCount += count$iv;
            List<WorkContinuationImpl> parents = current.getParents();
            if (parents != null) {
                continuations.addAll(parents);
            }
        }
        if (newCount == 0) {
            return;
        }
        int alreadyEnqueuedCount = workDatabase.workSpecDao().countNonFinishedContentUriTriggerWorkers();
        int limit = configuration.getContentUriTriggerWorkersLimit();
        if (alreadyEnqueuedCount + newCount > limit) {
            throw new IllegalArgumentException("Too many workers with contentUriTriggers are enqueued:\ncontentUriTrigger workers limit: " + limit + ";\nalready enqueued count: " + alreadyEnqueuedCount + ";\ncurrent enqueue operation count: " + newCount + ".\nTo address this issue you can: \n1. enqueue less workers or batch some of workers with content uri triggers together;\n2. increase limit via Configuration.Builder.setContentUriTriggerWorkersLimit;\nPlease beware that workers with content uri triggers immediately occupy slots in JobScheduler so no updates to content uris are missed.");
        }
    }

    public static final WorkSpec tryDelegateRemoteListenableWorker(WorkSpec workSpec) {
        Intrinsics.checkNotNullParameter(workSpec, "workSpec");
        Data this_$iv = workSpec.input;
        boolean hasDelegateWorker = this_$iv.hasKeyWithValueOfType(ARGUMENT_REMOTE_LISTENABLE_WORKER_NAME, String.class);
        Data this_$iv2 = workSpec.input;
        boolean zHasKeyWithValueOfType = this_$iv2.hasKeyWithValueOfType(ARGUMENT_SERVICE_PACKAGE_NAME, String.class);
        Data this_$iv3 = workSpec.input;
        boolean zHasKeyWithValueOfType2 = this_$iv3.hasKeyWithValueOfType(ARGUMENT_SERVICE_CLASS_NAME, String.class);
        if (!hasDelegateWorker && zHasKeyWithValueOfType && zHasKeyWithValueOfType2) {
            String workerClassName = workSpec.workerClassName;
            Data newInputData = new Data.Builder().putAll(workSpec.input).putString(ARGUMENT_REMOTE_LISTENABLE_WORKER_NAME, workerClassName).build();
            return WorkSpec.copy$default(workSpec, null, null, REMOTE_DELEGATING_LISTENABLE_WORKER_CLASS_NAME, null, newInputData, null, 0L, 0L, 0L, null, 0, null, 0L, 0L, 0L, 0L, false, null, 0, 0, 0L, 0, 0, null, 16777195, null);
        }
        return workSpec;
    }

    public static final WorkSpec tryDelegateConstrainedWorkSpec(WorkSpec workSpec) {
        Intrinsics.checkNotNullParameter(workSpec, "workSpec");
        Constraints constraints = workSpec.constraints;
        String workerClassName = workSpec.workerClassName;
        boolean isConstraintTrackingWorker = Intrinsics.areEqual(workerClassName, ConstraintTrackingWorker.class.getName());
        if (!isConstraintTrackingWorker && (constraints.getRequiresBatteryNotLow() || constraints.getRequiresStorageNotLow())) {
            Data newInputData = new Data.Builder().putAll(workSpec.input).putString(ConstraintTrackingWorkerKt.ARGUMENT_CLASS_NAME, workerClassName).build();
            String name = ConstraintTrackingWorker.class.getName();
            Intrinsics.checkNotNullExpressionValue(name, "name");
            return WorkSpec.copy$default(workSpec, null, null, name, null, newInputData, null, 0L, 0L, 0L, null, 0, null, 0L, 0L, 0L, 0L, false, null, 0, 0, 0L, 0, 0, null, 16777195, null);
        }
        return workSpec;
    }

    public static final WorkSpec wrapWorkSpecIfNeeded(List<? extends Scheduler> schedulers, WorkSpec workSpec) {
        Intrinsics.checkNotNullParameter(schedulers, "schedulers");
        Intrinsics.checkNotNullParameter(workSpec, "workSpec");
        WorkSpec delegated = tryDelegateRemoteListenableWorker(workSpec);
        if (Build.VERSION.SDK_INT < 26) {
            return tryDelegateConstrainedWorkSpec(delegated);
        }
        return delegated;
    }

    private static final boolean usesScheduler(List<? extends Scheduler> list, String className) {
        try {
            Class<?> cls = Class.forName(className);
            List<? extends Scheduler> $this$any$iv = list;
            if (($this$any$iv instanceof Collection) && $this$any$iv.isEmpty()) {
                return false;
            }
            for (Object element$iv : $this$any$iv) {
                Scheduler scheduler = (Scheduler) element$iv;
                if (cls.isAssignableFrom(scheduler.getClass())) {
                    return true;
                }
            }
            return false;
        } catch (ClassNotFoundException e) {
            return false;
        }
    }
}
