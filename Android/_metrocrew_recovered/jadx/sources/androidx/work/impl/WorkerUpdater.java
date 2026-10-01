package androidx.work.impl;

import androidx.work.Configuration;
import androidx.work.ExistingWorkPolicy;
import androidx.work.ListenableFutureKt;
import androidx.work.Operation;
import androidx.work.OperationKt;
import androidx.work.Tracer;
import androidx.work.WorkInfo;
import androidx.work.WorkManager;
import androidx.work.WorkRequest;
import androidx.work.impl.model.WorkSpec;
import androidx.work.impl.model.WorkSpecDao;
import androidx.work.impl.model.WorkTagDao;
import androidx.work.impl.utils.EnqueueRunnable;
import androidx.work.impl.utils.EnqueueUtilsKt;
import androidx.work.impl.utils.taskexecutor.SerialExecutor;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* JADX INFO: compiled from: WorkerUpdater.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000J\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\"\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001aD\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\n0\t2\u0006\u0010\u000b\u001a\u00020\f2\f\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u000f0\u000eH\u0002\u001a\u001c\u0010\u0010\u001a\u00020\u0011*\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u000f2\u0006\u0010\u0014\u001a\u00020\u0015H\u0007\u001a\u001a\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00010\u0016*\u00020\u00122\u0006\u0010\u0014\u001a\u00020\u0015H\u0000¨\u0006\u0017"}, d2 = {"updateWorkImpl", "Landroidx/work/WorkManager$UpdateResult;", "processor", "Landroidx/work/impl/Processor;", "workDatabase", "Landroidx/work/impl/WorkDatabase;", "configuration", "Landroidx/work/Configuration;", "schedulers", "", "Landroidx/work/impl/Scheduler;", "newWorkSpec", "Landroidx/work/impl/model/WorkSpec;", "tags", "", "", "enqueueUniquelyNamedPeriodic", "Landroidx/work/Operation;", "Landroidx/work/impl/WorkManagerImpl;", "name", "workRequest", "Landroidx/work/WorkRequest;", "Lcom/google/common/util/concurrent/ListenableFuture;", "work-runtime_release"}, k = 2, mv = {1, 8, 0}, xi = 48)
public final class WorkerUpdater {
    /* JADX INFO: Access modifiers changed from: private */
    public static final WorkManager.UpdateResult updateWorkImpl(Processor processor, final WorkDatabase workDatabase, Configuration configuration, final List<? extends Scheduler> list, final WorkSpec newWorkSpec, final Set<String> set) {
        final String workSpecId = newWorkSpec.id;
        final WorkSpec oldWorkSpec = workDatabase.workSpecDao().getWorkSpec(workSpecId);
        if (oldWorkSpec == null) {
            throw new IllegalArgumentException("Worker with " + workSpecId + " doesn't exist");
        }
        if (oldWorkSpec.state.isFinished()) {
            return WorkManager.UpdateResult.NOT_APPLIED;
        }
        if (oldWorkSpec.isPeriodic() ^ newWorkSpec.isPeriodic()) {
            Function1 type = new Function1<WorkSpec, String>() { // from class: androidx.work.impl.WorkerUpdater$updateWorkImpl$type$1
                @Override // kotlin.jvm.functions.Function1
                public final String invoke(WorkSpec spec) {
                    Intrinsics.checkNotNullParameter(spec, "spec");
                    return spec.isPeriodic() ? "Periodic" : "OneTime";
                }
            };
            throw new UnsupportedOperationException("Can't update " + type.invoke(oldWorkSpec) + " Worker to " + type.invoke(newWorkSpec) + " Worker. Update operation must preserve worker's type.");
        }
        final boolean isEnqueued = processor.isEnqueued(workSpecId);
        if (!isEnqueued) {
            List<? extends Scheduler> $this$forEach$iv = list;
            for (Object element$iv : $this$forEach$iv) {
                Scheduler scheduler = (Scheduler) element$iv;
                scheduler.cancel(workSpecId);
            }
        }
        workDatabase.runInTransaction(new Runnable() { // from class: androidx.work.impl.WorkerUpdater$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                WorkerUpdater.updateWorkImpl$lambda$2(workDatabase, oldWorkSpec, newWorkSpec, list, workSpecId, set, isEnqueued);
            }
        });
        if (!isEnqueued) {
            Schedulers.schedule(configuration, workDatabase, list);
        }
        return isEnqueued ? WorkManager.UpdateResult.APPLIED_FOR_NEXT_RUN : WorkManager.UpdateResult.APPLIED_IMMEDIATELY;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void updateWorkImpl$lambda$2(WorkDatabase $workDatabase, WorkSpec $oldWorkSpec, WorkSpec $newWorkSpec, List $schedulers, String $workSpecId, Set $tags, boolean $isEnqueued) {
        WorkSpecDao workSpecDao = $workDatabase.workSpecDao();
        WorkTagDao workTagDao = $workDatabase.workTagDao();
        WorkSpec updatedSpec = WorkSpec.copy$default($newWorkSpec, null, $oldWorkSpec.state, null, null, null, null, 0L, 0L, 0L, null, $oldWorkSpec.runAttemptCount, null, 0L, $oldWorkSpec.lastEnqueueTime, 0L, 0L, false, null, $oldWorkSpec.getPeriodCount(), $oldWorkSpec.getGeneration() + 1, $oldWorkSpec.getNextScheduleTimeOverride(), $oldWorkSpec.getNextScheduleTimeOverrideGeneration(), 0, null, 12835837, null);
        if ($newWorkSpec.getNextScheduleTimeOverrideGeneration() == 1) {
            updatedSpec.setNextScheduleTimeOverride($newWorkSpec.getNextScheduleTimeOverride());
            updatedSpec.setNextScheduleTimeOverrideGeneration(updatedSpec.getNextScheduleTimeOverrideGeneration() + 1);
        }
        workSpecDao.updateWorkSpec(EnqueueUtilsKt.wrapWorkSpecIfNeeded($schedulers, updatedSpec));
        workTagDao.deleteByWorkSpecId($workSpecId);
        workTagDao.insertTags($workSpecId, $tags);
        if ($isEnqueued) {
            return;
        }
        workSpecDao.markWorkSpecScheduled($workSpecId, -1L);
        $workDatabase.workProgressDao().delete($workSpecId);
    }

    public static final ListenableFuture<WorkManager.UpdateResult> updateWorkImpl(final WorkManagerImpl $this$updateWorkImpl, final WorkRequest workRequest) {
        Intrinsics.checkNotNullParameter($this$updateWorkImpl, "<this>");
        Intrinsics.checkNotNullParameter(workRequest, "workRequest");
        SerialExecutor serialTaskExecutor = $this$updateWorkImpl.getWorkTaskExecutor().getSerialTaskExecutor();
        Intrinsics.checkNotNullExpressionValue(serialTaskExecutor, "workTaskExecutor.serialTaskExecutor");
        return ListenableFutureKt.executeAsync(serialTaskExecutor, "updateWorkImpl", new Function0<WorkManager.UpdateResult>() { // from class: androidx.work.impl.WorkerUpdater.updateWorkImpl.3
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final WorkManager.UpdateResult invoke() {
                Processor processor = $this$updateWorkImpl.getProcessor();
                Intrinsics.checkNotNullExpressionValue(processor, "processor");
                WorkDatabase workDatabase = $this$updateWorkImpl.getWorkDatabase();
                Intrinsics.checkNotNullExpressionValue(workDatabase, "workDatabase");
                Configuration configuration = $this$updateWorkImpl.getConfiguration();
                Intrinsics.checkNotNullExpressionValue(configuration, "configuration");
                List<Scheduler> schedulers = $this$updateWorkImpl.getSchedulers();
                Intrinsics.checkNotNullExpressionValue(schedulers, "schedulers");
                return WorkerUpdater.updateWorkImpl(processor, workDatabase, configuration, schedulers, workRequest.getWorkSpec(), workRequest.getTags());
            }
        });
    }

    public static final Operation enqueueUniquelyNamedPeriodic(final WorkManagerImpl $this$enqueueUniquelyNamedPeriodic, final String name, final WorkRequest workRequest) {
        Intrinsics.checkNotNullParameter($this$enqueueUniquelyNamedPeriodic, "<this>");
        Intrinsics.checkNotNullParameter(name, "name");
        Intrinsics.checkNotNullParameter(workRequest, "workRequest");
        Tracer tracer = $this$enqueueUniquelyNamedPeriodic.getConfiguration().getTracer();
        String str = "enqueueUniquePeriodic_" + name;
        SerialExecutor serialTaskExecutor = $this$enqueueUniquelyNamedPeriodic.getWorkTaskExecutor().getSerialTaskExecutor();
        Intrinsics.checkNotNullExpressionValue(serialTaskExecutor, "workTaskExecutor.serialTaskExecutor");
        return OperationKt.launchOperation(tracer, str, serialTaskExecutor, new Function0<Unit>() { // from class: androidx.work.impl.WorkerUpdater.enqueueUniquelyNamedPeriodic.1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public /* bridge */ /* synthetic */ Unit invoke() {
                invoke2();
                return Unit.INSTANCE;
            }

            /* JADX INFO: renamed from: invoke, reason: avoid collision after fix types in other method */
            public final void invoke2() {
                final WorkRequest workRequest2 = workRequest;
                final WorkManagerImpl workManagerImpl = $this$enqueueUniquelyNamedPeriodic;
                final String str2 = name;
                Function0<Unit> function0 = new Function0<Unit>() { // from class: androidx.work.impl.WorkerUpdater$enqueueUniquelyNamedPeriodic$1$enqueueNew$1
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public /* bridge */ /* synthetic */ Unit invoke() {
                        invoke2();
                        return Unit.INSTANCE;
                    }

                    /* JADX INFO: renamed from: invoke, reason: avoid collision after fix types in other method */
                    public final void invoke2() {
                        List requests = CollectionsKt.listOf(workRequest2);
                        WorkContinuationImpl continuation = new WorkContinuationImpl(workManagerImpl, str2, ExistingWorkPolicy.KEEP, requests);
                        EnqueueRunnable.enqueue(continuation);
                    }
                };
                WorkSpecDao workSpecDao = $this$enqueueUniquelyNamedPeriodic.getWorkDatabase().workSpecDao();
                List<WorkSpec.IdAndState> workSpecIdAndStatesForName = workSpecDao.getWorkSpecIdAndStatesForName(name);
                if (workSpecIdAndStatesForName.size() > 1) {
                    throw new UnsupportedOperationException("Can't apply UPDATE policy to the chains of work.");
                }
                WorkSpec.IdAndState current = (WorkSpec.IdAndState) CollectionsKt.firstOrNull((List) workSpecIdAndStatesForName);
                if (current == null) {
                    function0.invoke();
                    return;
                }
                WorkSpec spec = workSpecDao.getWorkSpec(current.id);
                if (spec == null) {
                    throw new IllegalStateException("WorkSpec with " + current.id + ", that matches a name \"" + name + "\", wasn't found");
                }
                if (!spec.isPeriodic()) {
                    throw new UnsupportedOperationException("Can't update OneTimeWorker to Periodic Worker. Update operation must preserve worker's type.");
                }
                if (current.state == WorkInfo.State.CANCELLED) {
                    workSpecDao.delete(current.id);
                    function0.invoke();
                    return;
                }
                WorkSpec newWorkSpec = WorkSpec.copy$default(workRequest.getWorkSpec(), current.id, null, null, null, null, null, 0L, 0L, 0L, null, 0, null, 0L, 0L, 0L, 0L, false, null, 0, 0, 0L, 0, 0, null, 16777214, null);
                Processor processor = $this$enqueueUniquelyNamedPeriodic.getProcessor();
                Intrinsics.checkNotNullExpressionValue(processor, "processor");
                WorkDatabase workDatabase = $this$enqueueUniquelyNamedPeriodic.getWorkDatabase();
                Intrinsics.checkNotNullExpressionValue(workDatabase, "workDatabase");
                Configuration configuration = $this$enqueueUniquelyNamedPeriodic.getConfiguration();
                Intrinsics.checkNotNullExpressionValue(configuration, "configuration");
                List<Scheduler> schedulers = $this$enqueueUniquelyNamedPeriodic.getSchedulers();
                Intrinsics.checkNotNullExpressionValue(schedulers, "schedulers");
                WorkerUpdater.updateWorkImpl(processor, workDatabase, configuration, schedulers, newWorkSpec, workRequest.getTags());
            }
        });
    }
}
