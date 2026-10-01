package androidx.work.impl;

import android.text.TextUtils;
import androidx.lifecycle.LiveData;
import androidx.work.ArrayCreatingInputMerger;
import androidx.work.ExistingWorkPolicy;
import androidx.work.ListenableWorker;
import androidx.work.Logger;
import androidx.work.OneTimeWorkRequest;
import androidx.work.Operation;
import androidx.work.OperationKt;
import androidx.work.WorkContinuation;
import androidx.work.WorkInfo;
import androidx.work.WorkRequest;
import androidx.work.impl.utils.EnqueueRunnable;
import androidx.work.impl.utils.StatusRunnable;
import androidx.work.impl.workers.CombineContinuationsWorker;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;

/* JADX INFO: loaded from: classes.dex */
public class WorkContinuationImpl extends WorkContinuation {
    private static final String TAG = Logger.tagWithPrefix("WorkContinuationImpl");
    private final List<String> mAllIds;
    private boolean mEnqueued;
    private final ExistingWorkPolicy mExistingWorkPolicy;
    private final List<String> mIds;
    private final String mName;
    private Operation mOperation;
    private final List<WorkContinuationImpl> mParents;
    private final List<? extends WorkRequest> mWork;
    private final WorkManagerImpl mWorkManagerImpl;

    public WorkManagerImpl getWorkManagerImpl() {
        return this.mWorkManagerImpl;
    }

    public String getName() {
        return this.mName;
    }

    public ExistingWorkPolicy getExistingWorkPolicy() {
        return this.mExistingWorkPolicy;
    }

    public List<? extends WorkRequest> getWork() {
        return this.mWork;
    }

    public List<String> getIds() {
        return this.mIds;
    }

    public List<String> getAllIds() {
        return this.mAllIds;
    }

    public boolean isEnqueued() {
        return this.mEnqueued;
    }

    public void markEnqueued() {
        this.mEnqueued = true;
    }

    public List<WorkContinuationImpl> getParents() {
        return this.mParents;
    }

    public WorkContinuationImpl(WorkManagerImpl workManagerImpl, List<? extends WorkRequest> work) {
        this(workManagerImpl, null, ExistingWorkPolicy.KEEP, work, null);
    }

    public WorkContinuationImpl(WorkManagerImpl workManagerImpl, String name, ExistingWorkPolicy existingWorkPolicy, List<? extends WorkRequest> work) {
        this(workManagerImpl, name, existingWorkPolicy, work, null);
    }

    public WorkContinuationImpl(WorkManagerImpl workManagerImpl, String name, ExistingWorkPolicy existingWorkPolicy, List<? extends WorkRequest> work, List<WorkContinuationImpl> parents) {
        this.mWorkManagerImpl = workManagerImpl;
        this.mName = name;
        this.mExistingWorkPolicy = existingWorkPolicy;
        this.mWork = work;
        this.mParents = parents;
        this.mIds = new ArrayList(this.mWork.size());
        this.mAllIds = new ArrayList();
        if (parents != null) {
            for (WorkContinuationImpl parent : parents) {
                this.mAllIds.addAll(parent.mAllIds);
            }
        }
        for (int i = 0; i < work.size(); i++) {
            if (existingWorkPolicy == ExistingWorkPolicy.REPLACE && work.get(i).getWorkSpec().getNextScheduleTimeOverride() != Long.MAX_VALUE) {
                throw new IllegalArgumentException("Next Schedule Time Override must be used with ExistingPeriodicWorkPolicyUPDATE (preferably) or KEEP");
            }
            String id = work.get(i).getStringId();
            this.mIds.add(id);
            this.mAllIds.add(id);
        }
    }

    @Override // androidx.work.WorkContinuation
    public WorkContinuation then(List<OneTimeWorkRequest> work) {
        if (work.isEmpty()) {
            return this;
        }
        return new WorkContinuationImpl(this.mWorkManagerImpl, this.mName, ExistingWorkPolicy.KEEP, work, Collections.singletonList(this));
    }

    @Override // androidx.work.WorkContinuation
    public LiveData<List<WorkInfo>> getWorkInfosLiveData() {
        return this.mWorkManagerImpl.getWorkInfosById(this.mAllIds);
    }

    @Override // androidx.work.WorkContinuation
    public ListenableFuture<List<WorkInfo>> getWorkInfos() {
        return StatusRunnable.forStringIds(this.mWorkManagerImpl.getWorkDatabase(), this.mWorkManagerImpl.getWorkTaskExecutor(), this.mAllIds);
    }

    @Override // androidx.work.WorkContinuation
    public Operation enqueue() {
        if (!this.mEnqueued) {
            this.mOperation = OperationKt.launchOperation(this.mWorkManagerImpl.getConfiguration().getTracer(), "EnqueueRunnable_" + getExistingWorkPolicy().name(), this.mWorkManagerImpl.getWorkTaskExecutor().getSerialTaskExecutor(), new Function0() { // from class: androidx.work.impl.WorkContinuationImpl$$ExternalSyntheticLambda0
                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    return this.f$0.m310lambda$enqueue$0$androidxworkimplWorkContinuationImpl();
                }
            });
        } else {
            Logger.get().warning(TAG, "Already enqueued work ids (" + TextUtils.join(", ", this.mIds) + ")");
        }
        return this.mOperation;
    }

    /* JADX INFO: renamed from: lambda$enqueue$0$androidx-work-impl-WorkContinuationImpl, reason: not valid java name */
    /* synthetic */ Unit m310lambda$enqueue$0$androidxworkimplWorkContinuationImpl() {
        EnqueueRunnable.enqueue(this);
        return Unit.INSTANCE;
    }

    @Override // androidx.work.WorkContinuation
    protected WorkContinuation combineInternal(List<WorkContinuation> continuations) {
        OneTimeWorkRequest combinedWork = new OneTimeWorkRequest.Builder((Class<? extends ListenableWorker>) CombineContinuationsWorker.class).setInputMerger(ArrayCreatingInputMerger.class).build();
        List<WorkContinuationImpl> parents = new ArrayList<>(continuations.size());
        for (WorkContinuation continuation : continuations) {
            parents.add((WorkContinuationImpl) continuation);
        }
        return new WorkContinuationImpl(this.mWorkManagerImpl, null, ExistingWorkPolicy.KEEP, Collections.singletonList(combinedWork), parents);
    }

    public boolean hasCycles() {
        return hasCycles(this, new HashSet());
    }

    private static boolean hasCycles(WorkContinuationImpl continuation, Set<String> visited) {
        visited.addAll(continuation.getIds());
        Set<String> prerequisiteIds = prerequisitesFor(continuation);
        for (String id : visited) {
            if (prerequisiteIds.contains(id)) {
                return true;
            }
        }
        List<WorkContinuationImpl> parents = continuation.getParents();
        if (parents != null && !parents.isEmpty()) {
            for (WorkContinuationImpl parent : parents) {
                if (hasCycles(parent, visited)) {
                    return true;
                }
            }
        }
        visited.removeAll(continuation.getIds());
        return false;
    }

    public static Set<String> prerequisitesFor(WorkContinuationImpl continuation) {
        Set<String> preRequisites = new HashSet<>();
        List<WorkContinuationImpl> parents = continuation.getParents();
        if (parents != null && !parents.isEmpty()) {
            for (WorkContinuationImpl parent : parents) {
                preRequisites.addAll(parent.getIds());
            }
        }
        return preRequisites;
    }
}
