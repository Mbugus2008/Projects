package androidx.work.impl;

import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.text.TextUtils;
import androidx.arch.core.util.Function;
import androidx.lifecycle.LiveData;
import androidx.work.Configuration;
import androidx.work.ExistingPeriodicWorkPolicy;
import androidx.work.ExistingWorkPolicy;
import androidx.work.ListenableFutureKt;
import androidx.work.Logger;
import androidx.work.OneTimeWorkRequest;
import androidx.work.Operation;
import androidx.work.PeriodicWorkRequest;
import androidx.work.TracerKt;
import androidx.work.WorkContinuation;
import androidx.work.WorkInfo;
import androidx.work.WorkManager;
import androidx.work.WorkQuery;
import androidx.work.WorkRequest;
import androidx.work.impl.background.systemjob.SystemJobScheduler;
import androidx.work.impl.constraints.trackers.Trackers;
import androidx.work.impl.foreground.SystemForegroundDispatcher;
import androidx.work.impl.model.RawWorkInfoDao;
import androidx.work.impl.model.RawWorkInfoDaoKt;
import androidx.work.impl.model.WorkGenerationalId;
import androidx.work.impl.model.WorkSpec;
import androidx.work.impl.model.WorkSpecDao;
import androidx.work.impl.model.WorkSpecDaoKt;
import androidx.work.impl.utils.CancelWorkRunnable;
import androidx.work.impl.utils.ForceStopRunnable;
import androidx.work.impl.utils.LiveDataUtils;
import androidx.work.impl.utils.PreferenceUtils;
import androidx.work.impl.utils.PruneWorkRunnableKt;
import androidx.work.impl.utils.RawQueries;
import androidx.work.impl.utils.StatusRunnable;
import androidx.work.impl.utils.StopWorkRunnable;
import androidx.work.impl.utils.taskexecutor.SerialExecutor;
import androidx.work.impl.utils.taskexecutor.TaskExecutor;
import androidx.work.multiprocess.RemoteWorkManager;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.UUID;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.flow.Flow;

/* JADX INFO: loaded from: classes.dex */
public class WorkManagerImpl extends WorkManager {
    public static final int CONTENT_URI_TRIGGER_API_LEVEL = 24;
    public static final int MAX_PRE_JOB_SCHEDULER_API_LEVEL = 22;
    public static final int MIN_JOB_SCHEDULER_API_LEVEL = 23;
    public static final String REMOTE_WORK_MANAGER_CLIENT = "androidx.work.multiprocess.RemoteWorkManagerClient";
    private Configuration mConfiguration;
    private Context mContext;
    private boolean mForceStopRunnableCompleted = false;
    private PreferenceUtils mPreferenceUtils;
    private Processor mProcessor;
    private volatile RemoteWorkManager mRemoteWorkManager;
    private BroadcastReceiver.PendingResult mRescheduleReceiverResult;
    private List<Scheduler> mSchedulers;
    private final Trackers mTrackers;
    private WorkDatabase mWorkDatabase;
    private final CoroutineScope mWorkManagerScope;
    private TaskExecutor mWorkTaskExecutor;
    private static final String TAG = Logger.tagWithPrefix("WorkManagerImpl");
    private static WorkManagerImpl sDelegatedInstance = null;
    private static WorkManagerImpl sDefaultInstance = null;
    private static final Object sLock = new Object();

    public static void setDelegate(WorkManagerImpl delegate) {
        synchronized (sLock) {
            sDelegatedInstance = delegate;
        }
    }

    @Deprecated
    public static WorkManagerImpl getInstance() {
        synchronized (sLock) {
            if (sDelegatedInstance != null) {
                return sDelegatedInstance;
            }
            return sDefaultInstance;
        }
    }

    public static boolean isInitialized() {
        WorkManagerImpl instance = getInstance();
        return instance != null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static WorkManagerImpl getInstance(Context context) {
        WorkManagerImpl instance;
        synchronized (sLock) {
            instance = getInstance();
            if (instance == null) {
                Context applicationContext = context.getApplicationContext();
                if (applicationContext instanceof Configuration.Provider) {
                    initialize(applicationContext, ((Configuration.Provider) applicationContext).getWorkManagerConfiguration());
                    instance = getInstance(applicationContext);
                } else {
                    throw new IllegalStateException("WorkManager is not initialized properly.  You have explicitly disabled WorkManagerInitializer in your manifest, have not manually called WorkManager#initialize at this point, and your Application does not implement Configuration.Provider.");
                }
            }
        }
        return instance;
    }

    public static void initialize(Context context, Configuration configuration) {
        synchronized (sLock) {
            if (sDelegatedInstance != null && sDefaultInstance != null) {
                throw new IllegalStateException("WorkManager is already initialized.  Did you try to initialize it manually without disabling WorkManagerInitializer? See WorkManager#initialize(Context, Configuration) or the class level Javadoc for more information.");
            }
            if (sDelegatedInstance == null) {
                Context context2 = context.getApplicationContext();
                if (sDefaultInstance == null) {
                    sDefaultInstance = WorkManagerImplExtKt.createWorkManager(context2, configuration);
                }
                sDelegatedInstance = sDefaultInstance;
            }
        }
    }

    public WorkManagerImpl(Context context, Configuration configuration, TaskExecutor workTaskExecutor, WorkDatabase workDatabase, List<Scheduler> schedulers, Processor processor, Trackers trackers) {
        Context context2 = context.getApplicationContext();
        if (Api24Impl.isDeviceProtectedStorage(context2)) {
            throw new IllegalStateException("Cannot initialize WorkManager in direct boot mode");
        }
        Logger.setLogger(new Logger.LogcatLogger(configuration.getMinimumLoggingLevel()));
        this.mContext = context2;
        this.mWorkTaskExecutor = workTaskExecutor;
        this.mWorkDatabase = workDatabase;
        this.mProcessor = processor;
        this.mTrackers = trackers;
        this.mConfiguration = configuration;
        this.mSchedulers = schedulers;
        this.mWorkManagerScope = WorkManagerImplExtKt.createWorkManagerScope(this.mWorkTaskExecutor);
        this.mPreferenceUtils = new PreferenceUtils(this.mWorkDatabase);
        Schedulers.registerRescheduling(schedulers, this.mProcessor, workTaskExecutor.getSerialTaskExecutor(), this.mWorkDatabase, configuration);
        this.mWorkTaskExecutor.executeOnTaskThread(new ForceStopRunnable(context2, this));
        UnfinishedWorkListenerKt.maybeLaunchUnfinishedWorkListener(this.mWorkManagerScope, this.mContext, configuration, workDatabase);
    }

    public Context getApplicationContext() {
        return this.mContext;
    }

    public WorkDatabase getWorkDatabase() {
        return this.mWorkDatabase;
    }

    CoroutineScope getWorkManagerScope() {
        return this.mWorkManagerScope;
    }

    @Override // androidx.work.WorkManager
    public Configuration getConfiguration() {
        return this.mConfiguration;
    }

    public List<Scheduler> getSchedulers() {
        return this.mSchedulers;
    }

    public Processor getProcessor() {
        return this.mProcessor;
    }

    public TaskExecutor getWorkTaskExecutor() {
        return this.mWorkTaskExecutor;
    }

    public PreferenceUtils getPreferenceUtils() {
        return this.mPreferenceUtils;
    }

    public Trackers getTrackers() {
        return this.mTrackers;
    }

    @Override // androidx.work.WorkManager
    public Operation enqueue(List<? extends WorkRequest> requests) {
        if (requests.isEmpty()) {
            throw new IllegalArgumentException("enqueue needs at least one WorkRequest.");
        }
        return new WorkContinuationImpl(this, requests).enqueue();
    }

    @Override // androidx.work.WorkManager
    public WorkContinuation beginWith(List<OneTimeWorkRequest> requests) {
        if (requests.isEmpty()) {
            throw new IllegalArgumentException("beginWith needs at least one OneTimeWorkRequest.");
        }
        return new WorkContinuationImpl(this, requests);
    }

    @Override // androidx.work.WorkManager
    public WorkContinuation beginUniqueWork(String uniqueWorkName, ExistingWorkPolicy existingWorkPolicy, List<OneTimeWorkRequest> requests) {
        if (requests.isEmpty()) {
            throw new IllegalArgumentException("beginUniqueWork needs at least one OneTimeWorkRequest.");
        }
        return new WorkContinuationImpl(this, uniqueWorkName, existingWorkPolicy, requests);
    }

    @Override // androidx.work.WorkManager
    public Operation enqueueUniqueWork(String uniqueWorkName, ExistingWorkPolicy existingWorkPolicy, List<OneTimeWorkRequest> requests) {
        return new WorkContinuationImpl(this, uniqueWorkName, existingWorkPolicy, requests).enqueue();
    }

    @Override // androidx.work.WorkManager
    public Operation enqueueUniquePeriodicWork(String uniqueWorkName, ExistingPeriodicWorkPolicy existingPeriodicWorkPolicy, PeriodicWorkRequest request) {
        if (existingPeriodicWorkPolicy == ExistingPeriodicWorkPolicy.UPDATE) {
            return WorkerUpdater.enqueueUniquelyNamedPeriodic(this, uniqueWorkName, request);
        }
        return createWorkContinuationForUniquePeriodicWork(uniqueWorkName, existingPeriodicWorkPolicy, request).enqueue();
    }

    public WorkContinuationImpl createWorkContinuationForUniquePeriodicWork(String uniqueWorkName, ExistingPeriodicWorkPolicy existingPeriodicWorkPolicy, PeriodicWorkRequest periodicWork) {
        ExistingWorkPolicy existingWorkPolicy;
        if (existingPeriodicWorkPolicy == ExistingPeriodicWorkPolicy.KEEP) {
            existingWorkPolicy = ExistingWorkPolicy.KEEP;
        } else {
            existingWorkPolicy = ExistingWorkPolicy.REPLACE;
        }
        return new WorkContinuationImpl(this, uniqueWorkName, existingWorkPolicy, Collections.singletonList(periodicWork));
    }

    @Override // androidx.work.WorkManager
    public Operation cancelWorkById(UUID id) {
        return CancelWorkRunnable.forId(id, this);
    }

    @Override // androidx.work.WorkManager
    public Operation cancelAllWorkByTag(final String tag) {
        return CancelWorkRunnable.forTag(tag, this);
    }

    @Override // androidx.work.WorkManager
    public Operation cancelUniqueWork(String uniqueWorkName) {
        return CancelWorkRunnable.forName(uniqueWorkName, this);
    }

    @Override // androidx.work.WorkManager
    public Operation cancelAllWork() {
        return CancelWorkRunnable.forAll(this);
    }

    @Override // androidx.work.WorkManager
    public PendingIntent createCancelPendingIntent(UUID id) {
        Intent intent = SystemForegroundDispatcher.createCancelWorkIntent(this.mContext, id.toString());
        int flags = Build.VERSION.SDK_INT >= 31 ? 134217728 | 33554432 : 134217728;
        return PendingIntent.getService(this.mContext, 0, intent, flags);
    }

    @Override // androidx.work.WorkManager
    public LiveData<Long> getLastCancelAllTimeMillisLiveData() {
        return this.mPreferenceUtils.getLastCancelAllTimeMillisLiveData();
    }

    @Override // androidx.work.WorkManager
    public ListenableFuture<Long> getLastCancelAllTimeMillis() {
        final PreferenceUtils preferenceUtils = this.mPreferenceUtils;
        SerialExecutor serialTaskExecutor = this.mWorkTaskExecutor.getSerialTaskExecutor();
        Objects.requireNonNull(preferenceUtils);
        return ListenableFutureKt.executeAsync(serialTaskExecutor, "getLastCancelAllTimeMillis", new Function0() { // from class: androidx.work.impl.WorkManagerImpl$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                return Long.valueOf(preferenceUtils.getLastCancelAllTimeMillis());
            }
        });
    }

    @Override // androidx.work.WorkManager
    public Operation pruneWork() {
        return PruneWorkRunnableKt.pruneWork(this.mWorkDatabase, this.mConfiguration, this.mWorkTaskExecutor);
    }

    @Override // androidx.work.WorkManager
    public LiveData<WorkInfo> getWorkInfoByIdLiveData(UUID id) {
        WorkSpecDao dao = this.mWorkDatabase.workSpecDao();
        LiveData<List<WorkSpec.WorkInfoPojo>> inputLiveData = dao.getWorkStatusPojoLiveDataForIds(Collections.singletonList(id.toString()));
        return LiveDataUtils.dedupedMappedLiveDataFor(inputLiveData, new Function<List<WorkSpec.WorkInfoPojo>, WorkInfo>() { // from class: androidx.work.impl.WorkManagerImpl.1
            @Override // androidx.arch.core.util.Function
            public WorkInfo apply(List<WorkSpec.WorkInfoPojo> input) {
                if (input == null || input.size() <= 0) {
                    return null;
                }
                WorkInfo workInfo = input.get(0).toWorkInfo();
                return workInfo;
            }
        }, this.mWorkTaskExecutor);
    }

    @Override // androidx.work.WorkManager
    public Flow<WorkInfo> getWorkInfoByIdFlow(UUID id) {
        return WorkSpecDaoKt.getWorkStatusPojoFlowDataForIds(getWorkDatabase().workSpecDao(), id);
    }

    @Override // androidx.work.WorkManager
    public ListenableFuture<WorkInfo> getWorkInfoById(UUID id) {
        return StatusRunnable.forUUID(this.mWorkDatabase, this.mWorkTaskExecutor, id);
    }

    @Override // androidx.work.WorkManager
    public Flow<List<WorkInfo>> getWorkInfosByTagFlow(String tag) {
        WorkSpecDao workSpecDao = this.mWorkDatabase.workSpecDao();
        return WorkSpecDaoKt.getWorkStatusPojoFlowForTag(workSpecDao, this.mWorkTaskExecutor.getTaskCoroutineDispatcher(), tag);
    }

    @Override // androidx.work.WorkManager
    public LiveData<List<WorkInfo>> getWorkInfosByTagLiveData(String tag) {
        WorkSpecDao workSpecDao = this.mWorkDatabase.workSpecDao();
        LiveData<List<WorkSpec.WorkInfoPojo>> inputLiveData = workSpecDao.getWorkStatusPojoLiveDataForTag(tag);
        return LiveDataUtils.dedupedMappedLiveDataFor(inputLiveData, WorkSpec.WORK_INFO_MAPPER, this.mWorkTaskExecutor);
    }

    @Override // androidx.work.WorkManager
    public ListenableFuture<List<WorkInfo>> getWorkInfosByTag(String tag) {
        return StatusRunnable.forTag(this.mWorkDatabase, this.mWorkTaskExecutor, tag);
    }

    @Override // androidx.work.WorkManager
    public LiveData<List<WorkInfo>> getWorkInfosForUniqueWorkLiveData(String uniqueWorkName) {
        WorkSpecDao workSpecDao = this.mWorkDatabase.workSpecDao();
        LiveData<List<WorkSpec.WorkInfoPojo>> inputLiveData = workSpecDao.getWorkStatusPojoLiveDataForName(uniqueWorkName);
        return LiveDataUtils.dedupedMappedLiveDataFor(inputLiveData, WorkSpec.WORK_INFO_MAPPER, this.mWorkTaskExecutor);
    }

    @Override // androidx.work.WorkManager
    public Flow<List<WorkInfo>> getWorkInfosForUniqueWorkFlow(String uniqueWorkName) {
        WorkSpecDao workSpecDao = this.mWorkDatabase.workSpecDao();
        return WorkSpecDaoKt.getWorkStatusPojoFlowForName(workSpecDao, this.mWorkTaskExecutor.getTaskCoroutineDispatcher(), uniqueWorkName);
    }

    @Override // androidx.work.WorkManager
    public ListenableFuture<List<WorkInfo>> getWorkInfosForUniqueWork(String uniqueWorkName) {
        return StatusRunnable.forUniqueWork(this.mWorkDatabase, this.mWorkTaskExecutor, uniqueWorkName);
    }

    @Override // androidx.work.WorkManager
    public LiveData<List<WorkInfo>> getWorkInfosLiveData(WorkQuery workQuery) {
        RawWorkInfoDao rawWorkInfoDao = this.mWorkDatabase.rawWorkInfoDao();
        LiveData<List<WorkSpec.WorkInfoPojo>> inputLiveData = rawWorkInfoDao.getWorkInfoPojosLiveData(RawQueries.toRawQuery(workQuery));
        return LiveDataUtils.dedupedMappedLiveDataFor(inputLiveData, WorkSpec.WORK_INFO_MAPPER, this.mWorkTaskExecutor);
    }

    @Override // androidx.work.WorkManager
    public Flow<List<WorkInfo>> getWorkInfosFlow(WorkQuery workQuery) {
        RawWorkInfoDao rawWorkInfoDao = this.mWorkDatabase.rawWorkInfoDao();
        return RawWorkInfoDaoKt.getWorkInfoPojosFlow(rawWorkInfoDao, this.mWorkTaskExecutor.getTaskCoroutineDispatcher(), RawQueries.toRawQuery(workQuery));
    }

    @Override // androidx.work.WorkManager
    public ListenableFuture<List<WorkInfo>> getWorkInfos(WorkQuery workQuery) {
        return StatusRunnable.forWorkQuerySpec(this.mWorkDatabase, this.mWorkTaskExecutor, workQuery);
    }

    @Override // androidx.work.WorkManager
    public ListenableFuture<WorkManager.UpdateResult> updateWork(WorkRequest request) {
        return WorkerUpdater.updateWorkImpl(this, request);
    }

    LiveData<List<WorkInfo>> getWorkInfosById(List<String> workSpecIds) {
        WorkSpecDao dao = this.mWorkDatabase.workSpecDao();
        LiveData<List<WorkSpec.WorkInfoPojo>> inputLiveData = dao.getWorkStatusPojoLiveDataForIds(workSpecIds);
        return LiveDataUtils.dedupedMappedLiveDataFor(inputLiveData, WorkSpec.WORK_INFO_MAPPER, this.mWorkTaskExecutor);
    }

    public RemoteWorkManager getRemoteWorkManager() {
        if (this.mRemoteWorkManager == null) {
            synchronized (sLock) {
                if (this.mRemoteWorkManager == null) {
                    tryInitializeMultiProcessSupport();
                    if (this.mRemoteWorkManager == null && !TextUtils.isEmpty(this.mConfiguration.getDefaultProcessName())) {
                        throw new IllegalStateException("Invalid multiprocess configuration. Define an `implementation` dependency on :work:work-multiprocess library");
                    }
                }
            }
        }
        return this.mRemoteWorkManager;
    }

    public void stopForegroundWork(WorkGenerationalId id, int reason) {
        this.mWorkTaskExecutor.executeOnTaskThread(new StopWorkRunnable(this.mProcessor, new StartStopToken(id), true, reason));
    }

    public void rescheduleEligibleWork() {
        Configuration configuration = getConfiguration();
        TracerKt.traced(configuration.getTracer(), "ReschedulingWork", new Function0() { // from class: androidx.work.impl.WorkManagerImpl$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                return this.f$0.m311xa5e5c8b0();
            }
        });
    }

    /* JADX INFO: renamed from: lambda$rescheduleEligibleWork$0$androidx-work-impl-WorkManagerImpl, reason: not valid java name */
    /* synthetic */ Unit m311xa5e5c8b0() {
        SystemJobScheduler.cancelAllInAllNamespaces(getApplicationContext());
        getWorkDatabase().workSpecDao().resetScheduledState();
        Schedulers.schedule(getConfiguration(), getWorkDatabase(), getSchedulers());
        return Unit.INSTANCE;
    }

    public void onForceStopRunnableCompleted() {
        synchronized (sLock) {
            this.mForceStopRunnableCompleted = true;
            if (this.mRescheduleReceiverResult != null) {
                this.mRescheduleReceiverResult.finish();
                this.mRescheduleReceiverResult = null;
            }
        }
    }

    public void setReschedulePendingResult(BroadcastReceiver.PendingResult rescheduleReceiverResult) {
        synchronized (sLock) {
            if (this.mRescheduleReceiverResult != null) {
                this.mRescheduleReceiverResult.finish();
            }
            this.mRescheduleReceiverResult = rescheduleReceiverResult;
            if (this.mForceStopRunnableCompleted) {
                this.mRescheduleReceiverResult.finish();
                this.mRescheduleReceiverResult = null;
            }
        }
    }

    public void closeDatabase() {
        WorkManagerImplExtKt.close(this);
    }

    private void tryInitializeMultiProcessSupport() {
        try {
            Class<?> klass = Class.forName(REMOTE_WORK_MANAGER_CLIENT);
            this.mRemoteWorkManager = (RemoteWorkManager) klass.getConstructor(Context.class, WorkManagerImpl.class).newInstance(this.mContext, this);
        } catch (Throwable throwable) {
            Logger.get().debug(TAG, "Unable to initialize multi-process support", throwable);
        }
    }

    static class Api24Impl {
        private Api24Impl() {
        }

        static boolean isDeviceProtectedStorage(Context context) {
            return context.isDeviceProtectedStorage();
        }
    }
}
