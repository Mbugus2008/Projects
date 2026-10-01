package androidx.work.impl.workers;

import android.content.Context;
import android.os.Build;
import androidx.concurrent.futures.ListenableFutureKt;
import androidx.core.util.Consumer;
import androidx.work.CoroutineWorker;
import androidx.work.ListenableWorker;
import androidx.work.Logger;
import androidx.work.WorkInfo;
import androidx.work.WorkerExceptionInfo;
import androidx.work.WorkerFactory;
import androidx.work.WorkerParameters;
import androidx.work.impl.WorkManagerImpl;
import androidx.work.impl.constraints.WorkConstraintsTracker;
import androidx.work.impl.constraints.trackers.Trackers;
import androidx.work.impl.model.WorkSpec;
import androidx.work.impl.model.WorkSpecDao;
import androidx.work.impl.utils.WorkerExceptionUtilsKt;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.CancellationException;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineDispatcher;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.CoroutineScopeKt;
import kotlinx.coroutines.ExecutorsKt;
import kotlinx.coroutines.Job;

/* JADX INFO: compiled from: ConstraintTrackingWorker.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u00002\u00020\u0001:\u0001\u0013B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J\u000e\u0010\u0007\u001a\u00020\bH\u0096@¢\u0006\u0002\u0010\tJ&\u0010\n\u001a\u00020\b2\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u0010H\u0082@¢\u0006\u0002\u0010\u0011J\u000e\u0010\u0012\u001a\u00020\bH\u0082@¢\u0006\u0002\u0010\tR\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0014"}, d2 = {"Landroidx/work/impl/workers/ConstraintTrackingWorker;", "Landroidx/work/CoroutineWorker;", "appContext", "Landroid/content/Context;", "workerParameters", "Landroidx/work/WorkerParameters;", "(Landroid/content/Context;Landroidx/work/WorkerParameters;)V", "doWork", "Landroidx/work/ListenableWorker$Result;", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "runWorker", "delegate", "Landroidx/work/ListenableWorker;", "workConstraintsTracker", "Landroidx/work/impl/constraints/WorkConstraintsTracker;", "workSpec", "Landroidx/work/impl/model/WorkSpec;", "(Landroidx/work/ListenableWorker;Landroidx/work/impl/constraints/WorkConstraintsTracker;Landroidx/work/impl/model/WorkSpec;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "setupAndRunConstraintTrackingWork", "ConstraintUnsatisfiedException", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public final class ConstraintTrackingWorker extends CoroutineWorker {
    private final WorkerParameters workerParameters;

    /* JADX INFO: renamed from: androidx.work.impl.workers.ConstraintTrackingWorker$runWorker$1, reason: invalid class name */
    /* JADX INFO: compiled from: ConstraintTrackingWorker.kt */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    @DebugMetadata(c = "androidx.work.impl.workers.ConstraintTrackingWorker", f = "ConstraintTrackingWorker.kt", i = {}, l = {125}, m = "runWorker", n = {}, s = {})
    static final class AnonymousClass1 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return ConstraintTrackingWorker.this.runWorker(null, null, null, this);
        }
    }

    /* JADX INFO: renamed from: androidx.work.impl.workers.ConstraintTrackingWorker$setupAndRunConstraintTrackingWork$1, reason: invalid class name and case insensitive filesystem */
    /* JADX INFO: compiled from: ConstraintTrackingWorker.kt */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    @DebugMetadata(c = "androidx.work.impl.workers.ConstraintTrackingWorker", f = "ConstraintTrackingWorker.kt", i = {0, 0}, l = {97}, m = "setupAndRunConstraintTrackingWork", n = {"this", "delegate"}, s = {"L$0", "L$1"})
    static final class C00851 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        C00851(Continuation<? super C00851> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return ConstraintTrackingWorker.this.setupAndRunConstraintTrackingWork(this);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ConstraintTrackingWorker(Context appContext, WorkerParameters workerParameters) {
        super(appContext, workerParameters);
        Intrinsics.checkNotNullParameter(appContext, "appContext");
        Intrinsics.checkNotNullParameter(workerParameters, "workerParameters");
        this.workerParameters = workerParameters;
    }

    /* JADX INFO: renamed from: androidx.work.impl.workers.ConstraintTrackingWorker$doWork$2, reason: invalid class name */
    /* JADX INFO: compiled from: ConstraintTrackingWorker.kt */
    @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "Landroidx/work/ListenableWorker$Result;", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 8, 0}, xi = 48)
    @DebugMetadata(c = "androidx.work.impl.workers.ConstraintTrackingWorker$doWork$2", f = "ConstraintTrackingWorker.kt", i = {}, l = {58}, m = "invokeSuspend", n = {}, s = {})
    static final class AnonymousClass2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super ListenableWorker.Result>, Object> {
        int label;

        AnonymousClass2(Continuation<? super AnonymousClass2> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return ConstraintTrackingWorker.this.new AnonymousClass2(continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(CoroutineScope coroutineScope, Continuation<? super ListenableWorker.Result> continuation) {
            return ((AnonymousClass2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object $result) throws Throwable {
            Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
            switch (this.label) {
                case 0:
                    ResultKt.throwOnFailure($result);
                    this.label = 1;
                    Object obj = ConstraintTrackingWorker.this.setupAndRunConstraintTrackingWork(this);
                    if (obj == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    return obj;
                case 1:
                    ResultKt.throwOnFailure($result);
                    return $result;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
    }

    @Override // androidx.work.CoroutineWorker
    public Object doWork(Continuation<? super ListenableWorker.Result> continuation) {
        Executor backgroundExecutor = getBackgroundExecutor();
        Intrinsics.checkNotNullExpressionValue(backgroundExecutor, "backgroundExecutor");
        return BuildersKt.withContext(ExecutorsKt.from(backgroundExecutor), new AnonymousClass2(null), continuation);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code duplicated, block: B:51:0x016c  */
    /* JADX WARN: Code duplicated, block: B:54:0x0171  */
    /* JADX WARN: Code duplicated, block: B:56:0x0177  */
    /* JADX WARN: Code duplicated, block: B:57:0x017a  */
    /* JADX WARN: Code duplicated, block: B:59:0x0180  */
    /* JADX WARN: Code duplicated, block: B:60:0x0185  */
    /* JADX WARN: Code duplicated, block: B:62:0x0189  */
    /* JADX WARN: Code duplicated, block: B:66:0x0199  */
    /* JADX WARN: Code duplicated, block: B:68:0x01a5  */
    /* JADX WARN: Code duplicated, block: B:69:0x01a6  */
    /* JADX WARN: Code duplicated, block: B:7:0x0018  */
    public final Object setupAndRunConstraintTrackingWork(Continuation<? super ListenableWorker.Result> continuation) throws Throwable {
        C00851 c00851;
        ListenableWorker delegate;
        ConstraintTrackingWorker constraintTrackingWorker;
        ListenableWorker delegate2;
        Object objWithContext;
        int reason;
        if (continuation instanceof C00851) {
            c00851 = (C00851) continuation;
            if ((c00851.label & Integer.MIN_VALUE) != 0) {
                c00851.label -= Integer.MIN_VALUE;
            } else {
                c00851 = new C00851(continuation);
            }
        } else {
            c00851 = new C00851(continuation);
        }
        C00851 c00852 = c00851;
        Object $result = c00852.result;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (c00852.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                String className = getInputData().getString(ConstraintTrackingWorkerKt.ARGUMENT_CLASS_NAME);
                String str = className;
                if (str == null || str.length() == 0) {
                    String tag$iv = ConstraintTrackingWorkerKt.TAG;
                    Logger.get().error(tag$iv, "No worker to delegate to.");
                    ListenableWorker.Result resultFailure = ListenableWorker.Result.failure();
                    Intrinsics.checkNotNullExpressionValue(resultFailure, "failure()");
                    return resultFailure;
                }
                WorkManagerImpl workManagerImpl = WorkManagerImpl.getInstance(getApplicationContext());
                Intrinsics.checkNotNullExpressionValue(workManagerImpl, "getInstance(applicationContext)");
                WorkSpecDao workSpecDao = workManagerImpl.getWorkDatabase().workSpecDao();
                String string = getId().toString();
                Intrinsics.checkNotNullExpressionValue(string, "id.toString()");
                WorkSpec workSpec = workSpecDao.getWorkSpec(string);
                if (workSpec == null) {
                    ListenableWorker.Result resultFailure2 = ListenableWorker.Result.failure();
                    Intrinsics.checkNotNullExpressionValue(resultFailure2, "failure()");
                    return resultFailure2;
                }
                Trackers trackers = workManagerImpl.getTrackers();
                Intrinsics.checkNotNullExpressionValue(trackers, "workManagerImpl.trackers");
                WorkConstraintsTracker workConstraintsTracker = new WorkConstraintsTracker(trackers);
                if (!workConstraintsTracker.areAllConstraintsMet(workSpec)) {
                    String tag$iv2 = ConstraintTrackingWorkerKt.TAG;
                    Logger.get().debug(tag$iv2, "Constraints not met for delegate " + className + ". Requesting retry.");
                    ListenableWorker.Result resultRetry = ListenableWorker.Result.retry();
                    Intrinsics.checkNotNullExpressionValue(resultRetry, "retry()");
                    return resultRetry;
                }
                String tag$iv3 = ConstraintTrackingWorkerKt.TAG;
                Logger.get().debug(tag$iv3, "Constraints met for delegate " + className);
                try {
                    WorkerFactory workerFactory = getWorkerFactory();
                    Context applicationContext = getApplicationContext();
                    Intrinsics.checkNotNullExpressionValue(applicationContext, "applicationContext");
                    delegate = workerFactory.createWorkerWithDefaultFallback(applicationContext, className, this.workerParameters);
                    Executor mainThreadExecutor = this.workerParameters.getTaskExecutor().getMainThreadExecutor();
                    Intrinsics.checkNotNullExpressionValue(mainThreadExecutor, "workerParameters.taskExecutor.mainThreadExecutor");
                    try {
                        CoroutineDispatcher coroutineDispatcherFrom = ExecutorsKt.from(mainThreadExecutor);
                        AnonymousClass5 anonymousClass5 = new AnonymousClass5(delegate, workConstraintsTracker, workSpec, null);
                        c00852.L$0 = this;
                        c00852.L$1 = delegate;
                        c00852.label = 1;
                        objWithContext = BuildersKt.withContext(coroutineDispatcherFrom, anonymousClass5, c00852);
                        if (objWithContext == coroutine_suspended) {
                            return coroutine_suspended;
                        }
                        constraintTrackingWorker = this;
                        try {
                            return (ListenableWorker.Result) objWithContext;
                        } catch (CancellationException e) {
                            cancelled = e;
                            delegate2 = delegate;
                            if (!constraintTrackingWorker.isStopped() || (cancelled instanceof ConstraintUnsatisfiedException)) {
                                if (Build.VERSION.SDK_INT < 31) {
                                    reason = WorkInfo.STOP_REASON_UNKNOWN;
                                } else if (constraintTrackingWorker.isStopped()) {
                                    reason = constraintTrackingWorker.getStopReason();
                                } else {
                                    if (!(cancelled instanceof ConstraintUnsatisfiedException)) {
                                        throw new IllegalStateException("Unreachable");
                                    }
                                    reason = ((ConstraintUnsatisfiedException) cancelled).getStopReason();
                                }
                                delegate2.stop(reason);
                            }
                            if (cancelled instanceof ConstraintUnsatisfiedException) {
                                ListenableWorker.Result resultRetry2 = ListenableWorker.Result.retry();
                                Intrinsics.checkNotNullExpressionValue(resultRetry2, "{\n            // there a…throw cancelled\n        }");
                                return resultRetry2;
                            }
                            throw cancelled;
                        }
                    } catch (CancellationException e2) {
                        cancelled = e2;
                        constraintTrackingWorker = this;
                        delegate2 = delegate;
                        if (!constraintTrackingWorker.isStopped()) {
                            if (Build.VERSION.SDK_INT < 31) {
                                reason = WorkInfo.STOP_REASON_UNKNOWN;
                            } else if (constraintTrackingWorker.isStopped()) {
                                reason = constraintTrackingWorker.getStopReason();
                            } else {
                                if (!(cancelled instanceof ConstraintUnsatisfiedException)) {
                                    throw new IllegalStateException("Unreachable");
                                }
                                reason = ((ConstraintUnsatisfiedException) cancelled).getStopReason();
                            }
                            delegate2.stop(reason);
                        } else {
                            if (Build.VERSION.SDK_INT < 31) {
                                reason = WorkInfo.STOP_REASON_UNKNOWN;
                            } else if (constraintTrackingWorker.isStopped()) {
                                reason = constraintTrackingWorker.getStopReason();
                            } else {
                                if (!(cancelled instanceof ConstraintUnsatisfiedException)) {
                                    throw new IllegalStateException("Unreachable");
                                }
                                reason = ((ConstraintUnsatisfiedException) cancelled).getStopReason();
                            }
                            delegate2.stop(reason);
                        }
                        if (cancelled instanceof ConstraintUnsatisfiedException) {
                            ListenableWorker.Result resultRetry3 = ListenableWorker.Result.retry();
                            Intrinsics.checkNotNullExpressionValue(resultRetry3, "{\n            // there a…throw cancelled\n        }");
                            return resultRetry3;
                        }
                        throw cancelled;
                    }
                } catch (Throwable e3) {
                    String tag$iv4 = ConstraintTrackingWorkerKt.TAG;
                    Logger.get().debug(tag$iv4, "No worker to delegate to.");
                    Consumer<WorkerExceptionInfo> workerInitializationExceptionHandler = workManagerImpl.getConfiguration().getWorkerInitializationExceptionHandler();
                    if (workerInitializationExceptionHandler != null) {
                        WorkerExceptionUtilsKt.safeAccept(workerInitializationExceptionHandler, new WorkerExceptionInfo(className, this.workerParameters, e3), ConstraintTrackingWorkerKt.TAG);
                    }
                    ListenableWorker.Result resultFailure3 = ListenableWorker.Result.failure();
                    Intrinsics.checkNotNullExpressionValue(resultFailure3, "failure()");
                    return resultFailure3;
                }
            case 1:
                delegate2 = (ListenableWorker) c00852.L$1;
                constraintTrackingWorker = (ConstraintTrackingWorker) c00852.L$0;
                try {
                    ResultKt.throwOnFailure($result);
                    delegate = delegate2;
                    objWithContext = $result;
                    return (ListenableWorker.Result) objWithContext;
                } catch (CancellationException e4) {
                    cancelled = e4;
                    if (!constraintTrackingWorker.isStopped()) {
                        if (Build.VERSION.SDK_INT < 31) {
                            reason = WorkInfo.STOP_REASON_UNKNOWN;
                        } else if (constraintTrackingWorker.isStopped()) {
                            reason = constraintTrackingWorker.getStopReason();
                        } else {
                            if (!(cancelled instanceof ConstraintUnsatisfiedException)) {
                                throw new IllegalStateException("Unreachable");
                            }
                            reason = ((ConstraintUnsatisfiedException) cancelled).getStopReason();
                        }
                        delegate2.stop(reason);
                    } else {
                        if (Build.VERSION.SDK_INT < 31) {
                            reason = WorkInfo.STOP_REASON_UNKNOWN;
                        } else if (constraintTrackingWorker.isStopped()) {
                            reason = constraintTrackingWorker.getStopReason();
                        } else {
                            if (!(cancelled instanceof ConstraintUnsatisfiedException)) {
                                throw new IllegalStateException("Unreachable");
                            }
                            reason = ((ConstraintUnsatisfiedException) cancelled).getStopReason();
                        }
                        delegate2.stop(reason);
                    }
                    if (cancelled instanceof ConstraintUnsatisfiedException) {
                        ListenableWorker.Result resultRetry4 = ListenableWorker.Result.retry();
                        Intrinsics.checkNotNullExpressionValue(resultRetry4, "{\n            // there a…throw cancelled\n        }");
                        return resultRetry4;
                    }
                    throw cancelled;
                }
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    /* JADX INFO: renamed from: androidx.work.impl.workers.ConstraintTrackingWorker$setupAndRunConstraintTrackingWork$5, reason: invalid class name */
    /* JADX INFO: compiled from: ConstraintTrackingWorker.kt */
    @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "Landroidx/work/ListenableWorker$Result;", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 8, 0}, xi = 48)
    @DebugMetadata(c = "androidx.work.impl.workers.ConstraintTrackingWorker$setupAndRunConstraintTrackingWork$5", f = "ConstraintTrackingWorker.kt", i = {}, l = {98}, m = "invokeSuspend", n = {}, s = {})
    static final class AnonymousClass5 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super ListenableWorker.Result>, Object> {
        final /* synthetic */ ListenableWorker $delegate;
        final /* synthetic */ WorkConstraintsTracker $workConstraintsTracker;
        final /* synthetic */ WorkSpec $workSpec;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AnonymousClass5(ListenableWorker listenableWorker, WorkConstraintsTracker workConstraintsTracker, WorkSpec workSpec, Continuation<? super AnonymousClass5> continuation) {
            super(2, continuation);
            this.$delegate = listenableWorker;
            this.$workConstraintsTracker = workConstraintsTracker;
            this.$workSpec = workSpec;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return ConstraintTrackingWorker.this.new AnonymousClass5(this.$delegate, this.$workConstraintsTracker, this.$workSpec, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(CoroutineScope coroutineScope, Continuation<? super ListenableWorker.Result> continuation) {
            return ((AnonymousClass5) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object $result) throws Throwable {
            Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
            switch (this.label) {
                case 0:
                    ResultKt.throwOnFailure($result);
                    this.label = 1;
                    Object objRunWorker = ConstraintTrackingWorker.this.runWorker(this.$delegate, this.$workConstraintsTracker, this.$workSpec, this);
                    if (objRunWorker == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    return objRunWorker;
                case 1:
                    ResultKt.throwOnFailure($result);
                    return $result;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code duplicated, block: B:7:0x0014  */
    public final Object runWorker(ListenableWorker delegate, WorkConstraintsTracker workConstraintsTracker, WorkSpec workSpec, Continuation<? super ListenableWorker.Result> continuation) throws Throwable {
        AnonymousClass1 anonymousClass1;
        Object objCoroutineScope;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            if ((anonymousClass1.label & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label -= Integer.MIN_VALUE;
            } else {
                anonymousClass1 = new AnonymousClass1(continuation);
            }
        } else {
            anonymousClass1 = new AnonymousClass1(continuation);
        }
        Object $result = anonymousClass1.result;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (anonymousClass1.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                C00842 c00842 = new C00842(delegate, workConstraintsTracker, workSpec, null);
                anonymousClass1.label = 1;
                objCoroutineScope = CoroutineScopeKt.coroutineScope(c00842, anonymousClass1);
                if (objCoroutineScope == coroutine_suspended) {
                    return coroutine_suspended;
                }
                break;
            case 1:
                ResultKt.throwOnFailure($result);
                objCoroutineScope = $result;
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        Intrinsics.checkNotNullExpressionValue(objCoroutineScope, "delegate: ListenableWork….cancel()\n        }\n    }");
        return objCoroutineScope;
    }

    /* JADX INFO: renamed from: androidx.work.impl.workers.ConstraintTrackingWorker$runWorker$2, reason: invalid class name and case insensitive filesystem */
    /* JADX INFO: compiled from: ConstraintTrackingWorker.kt */
    @Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\u0010\u0000\u001a\n \u0002*\u0004\u0018\u00010\u00010\u0001*\u00020\u0003H\u008a@"}, d2 = {"<anonymous>", "Landroidx/work/ListenableWorker$Result;", "kotlin.jvm.PlatformType", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 8, 0}, xi = 48)
    @DebugMetadata(c = "androidx.work.impl.workers.ConstraintTrackingWorker$runWorker$2", f = "ConstraintTrackingWorker.kt", i = {0, 0, 0}, l = {134}, m = "invokeSuspend", n = {"atomicReason", "future", "constraintTrackingJob"}, s = {"L$0", "L$1", "L$2"})
    static final class C00842 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super ListenableWorker.Result>, Object> {
        final /* synthetic */ ListenableWorker $delegate;
        final /* synthetic */ WorkConstraintsTracker $workConstraintsTracker;
        final /* synthetic */ WorkSpec $workSpec;
        private /* synthetic */ Object L$0;
        Object L$1;
        Object L$2;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        C00842(ListenableWorker listenableWorker, WorkConstraintsTracker workConstraintsTracker, WorkSpec workSpec, Continuation<? super C00842> continuation) {
            super(2, continuation);
            this.$delegate = listenableWorker;
            this.$workConstraintsTracker = workConstraintsTracker;
            this.$workSpec = workSpec;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            C00842 c00842 = new C00842(this.$delegate, this.$workConstraintsTracker, this.$workSpec, continuation);
            c00842.L$0 = obj;
            return c00842;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(CoroutineScope coroutineScope, Continuation<? super ListenableWorker.Result> continuation) {
            return ((C00842) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
        }

        /* JADX WARN: Code duplicated, block: B:33:0x00f8  */
        /* JADX WARN: Code duplicated, block: B:34:0x00fa  */
        /* JADX WARN: Code duplicated, block: B:37:0x0101 A[ADDED_TO_REGION] */
        /* JADX WARN: Not initialized variable reg: 7, insn: 0x0110: INVOKE 
  (r7 I:kotlinx.coroutines.Job A[D('constraintTrackingJob' kotlinx.coroutines.Job)])
  (r6 I:java.util.concurrent.CancellationException)
  (r5 I:int)
  (r6 I:java.lang.Object)
 STATIC call: kotlinx.coroutines.Job.DefaultImpls.cancel$default(kotlinx.coroutines.Job, java.util.concurrent.CancellationException, int, java.lang.Object):void A[MD:(kotlinx.coroutines.Job, java.util.concurrent.CancellationException, int, java.lang.Object):void (m)], block:B:43:0x0110 */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object $result) throws Throwable {
            Job constraintTrackingJob;
            AtomicInteger atomicReason;
            Job constraintTrackingJob2;
            ListenableFuture<ListenableWorker.Result> listenableFuture;
            AtomicInteger atomicReason2;
            Object $result2;
            Object $result3;
            boolean constraintFailed;
            Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
            try {
                switch (this.label) {
                    case 0:
                        ResultKt.throwOnFailure($result);
                        CoroutineScope $this$coroutineScope = (CoroutineScope) this.L$0;
                        AtomicInteger atomicReason3 = new AtomicInteger(-256);
                        ListenableFuture<ListenableWorker.Result> listenableFutureStartWork = this.$delegate.startWork();
                        Intrinsics.checkNotNullExpressionValue(listenableFutureStartWork, "delegate.startWork()");
                        atomicReason = atomicReason3;
                        constraintTrackingJob2 = BuildersKt__Builders_commonKt.launch$default($this$coroutineScope, null, null, new ConstraintTrackingWorker$runWorker$2$constraintTrackingJob$1(this.$workConstraintsTracker, this.$workSpec, atomicReason3, listenableFutureStartWork, null), 3, null);
                        try {
                            this.L$0 = atomicReason;
                            this.L$1 = listenableFutureStartWork;
                            this.L$2 = constraintTrackingJob2;
                            this.label = 1;
                            Object objAwait = ListenableFutureKt.await(listenableFutureStartWork, this);
                            if (objAwait == coroutine_suspended) {
                                return coroutine_suspended;
                            }
                            $result2 = $result;
                            $result3 = objAwait;
                            listenableFuture = listenableFutureStartWork;
                            try {
                                Object $result4 = (ListenableWorker.Result) $result3;
                                Job.DefaultImpls.cancel$default(constraintTrackingJob2, (CancellationException) null, 1, (Object) null);
                                return $result4;
                            } catch (CancellationException e) {
                                cancellation = e;
                                atomicReason2 = atomicReason;
                                String tag$iv = ConstraintTrackingWorkerKt.TAG;
                                Logger.get().debug(tag$iv, "Delegated worker " + this.$delegate.getClass() + " was cancelled", cancellation);
                                if (atomicReason2.get() != -256) {
                                    constraintFailed = true;
                                } else {
                                    constraintFailed = false;
                                }
                                if (listenableFuture.isCancelled()) {
                                }
                                throw cancellation;
                            } catch (Throwable th) {
                                throwable = th;
                                String tag$iv2 = ConstraintTrackingWorkerKt.TAG;
                                Logger.get().debug(tag$iv2, "Delegated worker " + this.$delegate.getClass() + " threw exception in startWork.", throwable);
                                throw throwable;
                            }
                        } catch (CancellationException e2) {
                            cancellation = e2;
                            listenableFuture = listenableFutureStartWork;
                            atomicReason2 = atomicReason;
                            String tag$iv3 = ConstraintTrackingWorkerKt.TAG;
                            Logger.get().debug(tag$iv3, "Delegated worker " + this.$delegate.getClass() + " was cancelled", cancellation);
                            if (atomicReason2.get() != -256) {
                                constraintFailed = true;
                            } else {
                                constraintFailed = false;
                            }
                            if (listenableFuture.isCancelled()) {
                            }
                            throw cancellation;
                        } catch (Throwable th2) {
                            throwable = th2;
                            String tag$iv4 = ConstraintTrackingWorkerKt.TAG;
                            Logger.get().debug(tag$iv4, "Delegated worker " + this.$delegate.getClass() + " threw exception in startWork.", throwable);
                            throw throwable;
                        }
                    case 1:
                        $result3 = $result;
                        Job constraintTrackingJob3 = (Job) this.L$2;
                        listenableFuture = (ListenableFuture) this.L$1;
                        atomicReason2 = (AtomicInteger) this.L$0;
                        try {
                            ResultKt.throwOnFailure($result3);
                            atomicReason = atomicReason2;
                            constraintTrackingJob2 = constraintTrackingJob3;
                            $result2 = $result3;
                            Object $result5 = (ListenableWorker.Result) $result3;
                            Job.DefaultImpls.cancel$default(constraintTrackingJob2, (CancellationException) null, 1, (Object) null);
                            return $result5;
                        } catch (CancellationException e3) {
                            cancellation = e3;
                            String tag$iv5 = ConstraintTrackingWorkerKt.TAG;
                            Logger.get().debug(tag$iv5, "Delegated worker " + this.$delegate.getClass() + " was cancelled", cancellation);
                            if (atomicReason2.get() != -256) {
                                constraintFailed = true;
                            } else {
                                constraintFailed = false;
                            }
                            if (listenableFuture.isCancelled() || !constraintFailed) {
                                throw cancellation;
                            }
                            throw new ConstraintUnsatisfiedException(atomicReason2.get());
                        } catch (Throwable th3) {
                            throwable = th3;
                            String tag$iv6 = ConstraintTrackingWorkerKt.TAG;
                            Logger.get().debug(tag$iv6, "Delegated worker " + this.$delegate.getClass() + " threw exception in startWork.", throwable);
                            throw throwable;
                        }
                    default:
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
            } catch (Throwable cancellation) {
                Job.DefaultImpls.cancel$default(constraintTrackingJob, (CancellationException) null, 1, (Object) null);
                throw cancellation;
            }
        }
    }

    /* JADX INFO: compiled from: ConstraintTrackingWorker.kt */
    @Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\b\u0002\u0018\u00002\u00060\u0001j\u0002`\u0002B\r\u0012\u0006\u0010\u0003\u001a\u00020\u0004¢\u0006\u0002\u0010\u0005R\u0011\u0010\u0003\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Landroidx/work/impl/workers/ConstraintTrackingWorker$ConstraintUnsatisfiedException;", "Ljava/util/concurrent/CancellationException;", "Lkotlinx/coroutines/CancellationException;", "stopReason", "", "(I)V", "getStopReason", "()I", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
    private static final class ConstraintUnsatisfiedException extends CancellationException {
        private final int stopReason;

        public ConstraintUnsatisfiedException(int stopReason) {
            this.stopReason = stopReason;
        }

        public final int getStopReason() {
            return this.stopReason;
        }
    }
}
