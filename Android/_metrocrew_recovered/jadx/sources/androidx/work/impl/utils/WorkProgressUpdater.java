package androidx.work.impl.utils;

import android.content.Context;
import androidx.work.Data;
import androidx.work.ListenableFutureKt;
import androidx.work.Logger;
import androidx.work.ProgressUpdater;
import androidx.work.WorkInfo;
import androidx.work.impl.WorkDatabase;
import androidx.work.impl.model.WorkProgress;
import androidx.work.impl.model.WorkSpec;
import androidx.work.impl.model.WorkSpecDao;
import androidx.work.impl.utils.taskexecutor.TaskExecutor;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.UUID;
import kotlin.jvm.functions.Function0;

/* JADX INFO: loaded from: classes.dex */
public class WorkProgressUpdater implements ProgressUpdater {
    static final String TAG = Logger.tagWithPrefix("WorkProgressUpdater");
    final TaskExecutor mTaskExecutor;
    final WorkDatabase mWorkDatabase;

    public WorkProgressUpdater(WorkDatabase workDatabase, TaskExecutor taskExecutor) {
        this.mWorkDatabase = workDatabase;
        this.mTaskExecutor = taskExecutor;
    }

    @Override // androidx.work.ProgressUpdater
    public ListenableFuture<Void> updateProgress(final Context context, final UUID id, final Data data) {
        return ListenableFutureKt.executeAsync(this.mTaskExecutor.getSerialTaskExecutor(), "updateProgress", new Function0() { // from class: androidx.work.impl.utils.WorkProgressUpdater$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                return this.f$0.m324xd69acc5f(id, data);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$updateProgress$0$androidx-work-impl-utils-WorkProgressUpdater, reason: not valid java name */
    /* synthetic */ Void m324xd69acc5f(UUID id, Data data) {
        String workSpecId = id.toString();
        Logger.get().debug(TAG, "Updating progress for " + id + " (" + data + ")");
        this.mWorkDatabase.beginTransaction();
        try {
            WorkSpecDao workSpecDao = this.mWorkDatabase.workSpecDao();
            WorkSpec workSpec = workSpecDao.getWorkSpec(workSpecId);
            if (workSpec != null) {
                WorkInfo.State state = workSpec.state;
                if (state == WorkInfo.State.RUNNING) {
                    WorkProgress progress = new WorkProgress(workSpecId, data);
                    this.mWorkDatabase.workProgressDao().insert(progress);
                } else {
                    Logger.get().warning(TAG, "Ignoring setProgressAsync(...). WorkSpec (" + workSpecId + ") is not in a RUNNING state.");
                }
                this.mWorkDatabase.setTransactionSuccessful();
                this.mWorkDatabase.endTransaction();
                return null;
            }
            throw new IllegalStateException("Calls to setProgressAsync() must complete before a ListenableWorker signals completion of work by returning an instance of Result.");
        } catch (Throwable throwable) {
            try {
                Logger.get().error(TAG, "Error updating Worker progress", throwable);
                throw throwable;
            } catch (Throwable throwable2) {
                this.mWorkDatabase.endTransaction();
                throw throwable2;
            }
        }
    }
}
