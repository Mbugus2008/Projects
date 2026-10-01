package androidx.work.impl.utils;

import android.text.TextUtils;
import androidx.work.ExistingWorkPolicy;
import androidx.work.Logger;
import androidx.work.WorkInfo;
import androidx.work.WorkRequest;
import androidx.work.impl.Schedulers;
import androidx.work.impl.WorkContinuationImpl;
import androidx.work.impl.WorkDatabase;
import androidx.work.impl.WorkManagerImpl;
import androidx.work.impl.model.Dependency;
import androidx.work.impl.model.DependencyDao;
import androidx.work.impl.model.WorkName;
import androidx.work.impl.model.WorkSpec;
import androidx.work.impl.model.WorkSpecDao;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public class EnqueueRunnable {
    private static final String TAG = Logger.tagWithPrefix("EnqueueRunnable");

    private EnqueueRunnable() {
    }

    public static void enqueue(WorkContinuationImpl workContinuation) {
        if (workContinuation.hasCycles()) {
            throw new IllegalStateException("WorkContinuation has cycles (" + workContinuation + ")");
        }
        boolean needsScheduling = addToDatabase(workContinuation);
        if (needsScheduling) {
            scheduleWorkInBackground(workContinuation);
        }
    }

    public static boolean addToDatabase(WorkContinuationImpl workContinuation) {
        WorkManagerImpl workManagerImpl = workContinuation.getWorkManagerImpl();
        WorkDatabase workDatabase = workManagerImpl.getWorkDatabase();
        workDatabase.beginTransaction();
        try {
            EnqueueUtilsKt.checkContentUriTriggerWorkerLimits(workDatabase, workManagerImpl.getConfiguration(), workContinuation);
            boolean needsScheduling = processContinuation(workContinuation);
            workDatabase.setTransactionSuccessful();
            return needsScheduling;
        } finally {
            workDatabase.endTransaction();
        }
    }

    public static void scheduleWorkInBackground(WorkContinuationImpl workContinuation) {
        WorkManagerImpl workManager = workContinuation.getWorkManagerImpl();
        Schedulers.schedule(workManager.getConfiguration(), workManager.getWorkDatabase(), workManager.getSchedulers());
    }

    private static boolean processContinuation(WorkContinuationImpl workContinuation) {
        boolean needsScheduling = false;
        List<WorkContinuationImpl> parents = workContinuation.getParents();
        if (parents != null) {
            for (WorkContinuationImpl parent : parents) {
                if (!parent.isEnqueued()) {
                    needsScheduling |= processContinuation(parent);
                } else {
                    Logger.get().warning(TAG, "Already enqueued work ids (" + TextUtils.join(", ", parent.getIds()) + ")");
                }
            }
        }
        return needsScheduling | enqueueContinuation(workContinuation);
    }

    private static boolean enqueueContinuation(WorkContinuationImpl workContinuation) {
        Set<String> prerequisiteIds = WorkContinuationImpl.prerequisitesFor(workContinuation);
        boolean needsScheduling = enqueueWorkWithPrerequisites(workContinuation.getWorkManagerImpl(), workContinuation.getWork(), (String[]) prerequisiteIds.toArray(new String[0]), workContinuation.getName(), workContinuation.getExistingWorkPolicy());
        workContinuation.markEnqueued();
        return needsScheduling;
    }

    /* JADX WARN: Code duplicated, block: B:100:0x01b9  */
    /* JADX WARN: Code duplicated, block: B:108:0x01da  */
    /* JADX WARN: Code duplicated, block: B:111:0x01e2  */
    /* JADX WARN: Code duplicated, block: B:114:0x01f4  */
    /* JADX WARN: Code duplicated, block: B:116:0x01f9 A[LOOP:4: B:115:0x01f7->B:116:0x01f9, LOOP_END] */
    /* JADX WARN: Code duplicated, block: B:118:0x021b  */
    /* JADX WARN: Code duplicated, block: B:121:0x0230  */
    /* JADX WARN: Code duplicated, block: B:135:0x0240 A[SYNTHETIC] */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r14v18 */
    /* JADX WARN: Type inference failed for: r14v3 */
    /* JADX WARN: Type inference failed for: r14v4, types: [int] */
    private static boolean enqueueWorkWithPrerequisites(WorkManagerImpl workManagerImpl, List<? extends WorkRequest> list, String[] strArr, String str, ExistingWorkPolicy existingWorkPolicy) {
        boolean z;
        boolean z2;
        boolean z3;
        boolean z4;
        Iterator<? extends WorkRequest> it;
        WorkRequest next;
        WorkSpec workSpec;
        String[] strArr2;
        Iterator<? extends WorkRequest> it2;
        int length;
        ?? r14;
        String[] strArr3 = strArr;
        boolean z5 = false;
        long jCurrentTimeMillis = workManagerImpl.getConfiguration().getClock().currentTimeMillis();
        WorkDatabase workDatabase = workManagerImpl.getWorkDatabase();
        boolean z6 = strArr3 != null && strArr3.length > 0;
        boolean z7 = true;
        boolean z8 = false;
        boolean z9 = false;
        if (!z6) {
            z = false;
            z2 = true;
            z3 = false;
        } else {
            int length2 = strArr3.length;
            int i = 0;
            while (i < length2) {
                String str2 = strArr3[i];
                WorkSpec workSpec2 = workDatabase.workSpecDao().getWorkSpec(str2);
                if (workSpec2 == null) {
                    Logger.get().error(TAG, "Prerequisite " + str2 + " doesn't exist; not enqueuing");
                    return false;
                }
                boolean z10 = z5;
                WorkInfo.State state = workSpec2.state;
                z7 &= state == WorkInfo.State.SUCCEEDED;
                if (state == WorkInfo.State.FAILED) {
                    z8 = true;
                } else if (state == WorkInfo.State.CANCELLED) {
                    z9 = true;
                }
                i++;
                z5 = z10;
            }
            z = z5;
            z2 = true;
            z3 = false;
        }
        boolean z11 = !TextUtils.isEmpty(str);
        if ((!z11 || z6) ? z3 : z2) {
            List<WorkSpec.IdAndState> workSpecIdAndStatesForName = workDatabase.workSpecDao().getWorkSpecIdAndStatesForName(str);
            if (!workSpecIdAndStatesForName.isEmpty()) {
                if (existingWorkPolicy == ExistingWorkPolicy.APPEND || existingWorkPolicy == ExistingWorkPolicy.APPEND_OR_REPLACE) {
                    DependencyDao dependencyDao = workDatabase.dependencyDao();
                    List arrayList = new ArrayList();
                    for (WorkSpec.IdAndState idAndState : workSpecIdAndStatesForName) {
                        if (!dependencyDao.hasDependents(idAndState.id)) {
                            boolean z12 = (idAndState.state == WorkInfo.State.SUCCEEDED ? z2 : z3) & z7;
                            if (idAndState.state == WorkInfo.State.FAILED) {
                                z8 = true;
                            } else if (idAndState.state == WorkInfo.State.CANCELLED) {
                                z9 = true;
                            }
                            arrayList.add(idAndState.id);
                            z7 = z12;
                        }
                        dependencyDao = dependencyDao;
                    }
                    if (existingWorkPolicy == ExistingWorkPolicy.APPEND_OR_REPLACE && (z9 || z8)) {
                        WorkSpecDao workSpecDao = workDatabase.workSpecDao();
                        Iterator<WorkSpec.IdAndState> it3 = workSpecDao.getWorkSpecIdAndStatesForName(str).iterator();
                        while (it3.hasNext()) {
                            workSpecDao.delete(it3.next().id);
                        }
                        arrayList = Collections.emptyList();
                        z8 = false;
                        z9 = false;
                    }
                    strArr3 = (String[]) arrayList.toArray(strArr3);
                    if (strArr3.length <= 0) {
                        z2 = z3;
                    }
                    z6 = z2;
                    z4 = z;
                } else {
                    if (existingWorkPolicy != ExistingWorkPolicy.KEEP) {
                        z11 = z11;
                    } else {
                        for (WorkSpec.IdAndState idAndState2 : workSpecIdAndStatesForName) {
                            boolean z13 = z11;
                            if (idAndState2.state == WorkInfo.State.ENQUEUED || idAndState2.state == WorkInfo.State.RUNNING) {
                                return z3;
                            }
                            z11 = z13;
                        }
                        z11 = z11;
                    }
                    CancelWorkRunnable.forNameInline(str, workManagerImpl);
                    WorkSpecDao workSpecDao2 = workDatabase.workSpecDao();
                    Iterator<WorkSpec.IdAndState> it4 = workSpecIdAndStatesForName.iterator();
                    while (it4.hasNext()) {
                        workSpecDao2.delete(it4.next().id);
                        workDatabase = workDatabase;
                    }
                    workDatabase = workDatabase;
                    z4 = true;
                }
            }
            it = list.iterator();
            while (it.hasNext()) {
                next = it.next();
                workSpec = next.getWorkSpec();
                if (!z6 && !z7) {
                    if (z8) {
                        workSpec.state = WorkInfo.State.FAILED;
                    } else if (z9) {
                        workSpec.state = WorkInfo.State.CANCELLED;
                    } else {
                        workSpec.state = WorkInfo.State.BLOCKED;
                    }
                } else {
                    workSpec.lastEnqueueTime = jCurrentTimeMillis;
                }
                if (workSpec.state == WorkInfo.State.ENQUEUED) {
                    z4 = true;
                }
                workDatabase.workSpecDao().insertWorkSpec(EnqueueUtilsKt.wrapWorkSpecIfNeeded(workManagerImpl.getSchedulers(), workSpec));
                if (z6) {
                    strArr2 = strArr3;
                    it2 = it;
                } else {
                    length = strArr3.length;
                    for (r14 = z3; r14 < length; r14++) {
                        workDatabase.dependencyDao().insertDependency(new Dependency(next.getStringId(), strArr3[r14]));
                        it = it;
                        strArr3 = strArr3;
                    }
                    strArr2 = strArr3;
                    it2 = it;
                }
                workDatabase.workTagDao().insertTags(next.getStringId(), next.getTags());
                if (z11) {
                    workDatabase.workNameDao().insert(new WorkName(str, next.getStringId()));
                }
                it = it2;
                strArr3 = strArr2;
            }
            return z4;
        }
        z4 = z;
        it = list.iterator();
        while (it.hasNext()) {
            next = it.next();
            workSpec = next.getWorkSpec();
            if (!z6) {
                workSpec.lastEnqueueTime = jCurrentTimeMillis;
            } else {
                workSpec.lastEnqueueTime = jCurrentTimeMillis;
            }
            if (workSpec.state == WorkInfo.State.ENQUEUED) {
                z4 = true;
            }
            workDatabase.workSpecDao().insertWorkSpec(EnqueueUtilsKt.wrapWorkSpecIfNeeded(workManagerImpl.getSchedulers(), workSpec));
            if (z6) {
                strArr2 = strArr3;
                it2 = it;
            } else {
                length = strArr3.length;
                while (r14 < length) {
                    workDatabase.dependencyDao().insertDependency(new Dependency(next.getStringId(), strArr3[r14]));
                    it = it;
                    strArr3 = strArr3;
                }
                strArr2 = strArr3;
                it2 = it;
            }
            workDatabase.workTagDao().insertTags(next.getStringId(), next.getTags());
            if (z11) {
                workDatabase.workNameDao().insert(new WorkName(str, next.getStringId()));
            }
            it = it2;
            strArr3 = strArr2;
        }
        return z4;
    }
}
