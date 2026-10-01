package androidx.work.impl;

import android.content.Context;
import androidx.core.util.Consumer;
import androidx.work.Clock;
import androidx.work.Configuration;
import androidx.work.Data;
import androidx.work.ForegroundUpdater;
import androidx.work.InputMerger;
import androidx.work.ListenableFutureKt;
import androidx.work.ListenableWorker;
import androidx.work.Logger;
import androidx.work.WorkInfo;
import androidx.work.WorkerExceptionInfo;
import androidx.work.WorkerParameters;
import androidx.work.impl.foreground.ForegroundProcessor;
import androidx.work.impl.model.DependencyDao;
import androidx.work.impl.model.WorkGenerationalId;
import androidx.work.impl.model.WorkSpec;
import androidx.work.impl.model.WorkSpecDao;
import androidx.work.impl.model.WorkSpecKt;
import androidx.work.impl.utils.WorkForegroundUpdater;
import androidx.work.impl.utils.WorkProgressUpdater;
import androidx.work.impl.utils.WorkerExceptionUtilsKt;
import androidx.work.impl.utils.taskexecutor.TaskExecutor;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.Collection;
import java.util.List;
import java.util.UUID;
import java.util.concurrent.Callable;
import java.util.concurrent.CancellationException;
import java.util.concurrent.Executor;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.CompletableJob;
import kotlinx.coroutines.CoroutineDispatcher;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.ExecutorsKt;
import kotlinx.coroutines.Job;
import kotlinx.coroutines.JobKt__JobKt;

/* JADX INFO: compiled from: WorkerWrapper.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u009e\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0007\b\u0007\u0018\u00002\u00020\u0001:\u0002>?B\u000f\b\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u0016\u0010(\u001a\u00020\u00152\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00150\u0014H\u0002J\u0012\u0010)\u001a\u00020*2\b\u0010+\u001a\u0004\u0018\u00010,H\u0002J\u0010\u0010-\u001a\u00020.2\u0006\u0010/\u001a\u000200H\u0007J\u0010\u00101\u001a\u00020.2\u0006\u0010#\u001a\u00020\u0015H\u0002J\f\u00102\u001a\b\u0012\u0004\u0012\u00020*03J\u0010\u00104\u001a\u00020*2\u0006\u0010+\u001a\u00020,H\u0002J\u0010\u00105\u001a\u00020*2\u0006\u0010/\u001a\u000200H\u0002J\b\u00106\u001a\u00020*H\u0002J\u0010\u00107\u001a\u00020*2\u0006\u0010/\u001a\u000200H\u0002J\u000e\u00108\u001a\u000209H\u0082@¢\u0006\u0002\u0010:J\u0010\u0010;\u001a\u00020*2\u0006\u0010+\u001a\u00020,H\u0007J\u0010\u0010<\u001a\u00020*2\u0006\u0010+\u001a\u00020,H\u0002J\b\u0010=\u001a\u00020*H\u0002R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0007\u001a\u0004\u0018\u00010\bX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\fX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00150\u0014X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0017X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0015X\u0082\u0004¢\u0006\u0002\n\u0000R\u0011\u0010\u0019\u001a\u00020\u001a8F¢\u0006\u0006\u001a\u0004\b\u001b\u0010\u001cR\u0011\u0010\u001d\u001a\u00020\u001e¢\u0006\b\n\u0000\u001a\u0004\b\u001f\u0010 R\u000e\u0010!\u001a\u00020\"X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010#\u001a\u00020\u0015X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010$\u001a\u00020%X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010&\u001a\u00020'X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006@"}, d2 = {"Landroidx/work/impl/WorkerWrapper;", "", "builder", "Landroidx/work/impl/WorkerWrapper$Builder;", "(Landroidx/work/impl/WorkerWrapper$Builder;)V", "appContext", "Landroid/content/Context;", "builderWorker", "Landroidx/work/ListenableWorker;", "clock", "Landroidx/work/Clock;", "configuration", "Landroidx/work/Configuration;", "dependencyDao", "Landroidx/work/impl/model/DependencyDao;", "foregroundProcessor", "Landroidx/work/impl/foreground/ForegroundProcessor;", "runtimeExtras", "Landroidx/work/WorkerParameters$RuntimeExtras;", "tags", "", "", "workDatabase", "Landroidx/work/impl/WorkDatabase;", "workDescription", "workGenerationalId", "Landroidx/work/impl/model/WorkGenerationalId;", "getWorkGenerationalId", "()Landroidx/work/impl/model/WorkGenerationalId;", "workSpec", "Landroidx/work/impl/model/WorkSpec;", "getWorkSpec", "()Landroidx/work/impl/model/WorkSpec;", "workSpecDao", "Landroidx/work/impl/model/WorkSpecDao;", "workSpecId", "workTaskExecutor", "Landroidx/work/impl/utils/taskexecutor/TaskExecutor;", "workerJob", "Lkotlinx/coroutines/CompletableJob;", "createWorkDescription", "handleResult", "", "result", "Landroidx/work/ListenableWorker$Result;", "interrupt", "", "stopReason", "", "iterativelyFailWorkAndDependents", "launch", "Lcom/google/common/util/concurrent/ListenableFuture;", "onWorkFinished", "reschedule", "resetPeriodic", "resetWorkerStatus", "runWorker", "Landroidx/work/impl/WorkerWrapper$Resolution;", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "setFailed", "setSucceeded", "trySetRunning", "Builder", "Resolution", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public final class WorkerWrapper {
    private final Context appContext;
    private final ListenableWorker builderWorker;
    private final Clock clock;
    private final Configuration configuration;
    private final DependencyDao dependencyDao;
    private final ForegroundProcessor foregroundProcessor;
    private final WorkerParameters.RuntimeExtras runtimeExtras;
    private final List<String> tags;
    private final WorkDatabase workDatabase;
    private final String workDescription;
    private final WorkSpec workSpec;
    private final WorkSpecDao workSpecDao;
    private final String workSpecId;
    private final TaskExecutor workTaskExecutor;
    private final CompletableJob workerJob;

    /* JADX INFO: renamed from: androidx.work.impl.WorkerWrapper$runWorker$1, reason: invalid class name and case insensitive filesystem */
    /* JADX INFO: compiled from: WorkerWrapper.kt */
    @Metadata(k = 3, mv = {1, 8, 0}, xi = 48)
    @DebugMetadata(c = "androidx.work.impl.WorkerWrapper", f = "WorkerWrapper.kt", i = {0, 0}, l = {299}, m = "runWorker", n = {"this", "params"}, s = {"L$0", "L$1"})
    static final class C00751 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        C00751(Continuation<? super C00751> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return WorkerWrapper.this.runWorker(this);
        }
    }

    public WorkerWrapper(Builder builder) {
        Intrinsics.checkNotNullParameter(builder, "builder");
        this.workSpec = builder.getWorkSpec();
        this.appContext = builder.getAppContext();
        this.workSpecId = this.workSpec.id;
        this.runtimeExtras = builder.getRuntimeExtras();
        this.builderWorker = builder.getWorker();
        this.workTaskExecutor = builder.getWorkTaskExecutor();
        this.configuration = builder.getConfiguration();
        this.clock = this.configuration.getClock();
        this.foregroundProcessor = builder.getForegroundProcessor();
        this.workDatabase = builder.getWorkDatabase();
        this.workSpecDao = this.workDatabase.workSpecDao();
        this.dependencyDao = this.workDatabase.dependencyDao();
        this.tags = builder.getTags();
        this.workDescription = createWorkDescription(this.tags);
        this.workerJob = JobKt__JobKt.Job$default((Job) null, 1, (Object) null);
    }

    public final WorkSpec getWorkSpec() {
        return this.workSpec;
    }

    public final WorkGenerationalId getWorkGenerationalId() {
        return WorkSpecKt.generationalId(this.workSpec);
    }

    /* JADX INFO: renamed from: androidx.work.impl.WorkerWrapper$launch$1, reason: invalid class name */
    /* JADX INFO: compiled from: WorkerWrapper.kt */
    @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u000b\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u008a@"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 8, 0}, xi = 48)
    @DebugMetadata(c = "androidx.work.impl.WorkerWrapper$launch$1", f = "WorkerWrapper.kt", i = {}, l = {98}, m = "invokeSuspend", n = {}, s = {})
    static final class AnonymousClass1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Boolean>, Object> {
        int label;

        AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return WorkerWrapper.this.new AnonymousClass1(continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Boolean> continuation) {
            return ((AnonymousClass1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
        }

        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Type inference failed for: r9v10, types: [androidx.work.impl.WorkerWrapper$Resolution] */
        /* JADX WARN: Type inference failed for: r9v22 */
        /* JADX WARN: Type inference failed for: r9v5 */
        /* JADX WARN: Type inference failed for: r9v7 */
        /* JADX WARN: Type inference failed for: r9v9 */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) throws Throwable {
            final ?? failed;
            Object obj2;
            Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
            int i = 1;
            ListenableWorker.Result result = null;
            boolean z = false;
            boolean z2 = false;
            boolean z3 = false;
            try {
                switch (this.label) {
                    case 0:
                        ResultKt.throwOnFailure(obj);
                        this.label = 1;
                        Object objWithContext = BuildersKt.withContext(WorkerWrapper.this.workerJob, new WorkerWrapper$launch$1$resolution$1(WorkerWrapper.this, null), this);
                        if (objWithContext == coroutine_suspended) {
                            return coroutine_suspended;
                        }
                        obj2 = objWithContext;
                        break;
                    case 1:
                        ResultKt.throwOnFailure(obj);
                        obj2 = obj;
                        break;
                    default:
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                try {
                    obj = (Resolution) obj2;
                    failed = obj;
                } catch (WorkerStoppedException e) {
                    e = e;
                    obj = obj;
                    failed = new Resolution.ResetWorkerStatus(e.getReason());
                } catch (CancellationException e2) {
                    obj = obj;
                    failed = new Resolution.Failed(result, i, z3 ? 1 : 0);
                } catch (Throwable th) {
                    th = th;
                    obj = obj;
                    Logger.get().error(WorkerWrapperKt.TAG, "Unexpected error in WorkerWrapper", th);
                    failed = new Resolution.Failed(z2 ? 1 : 0, i, z ? 1 : 0);
                }
            } catch (WorkerStoppedException e3) {
                e = e3;
            } catch (CancellationException e4) {
            } catch (Throwable th2) {
                th = th2;
            }
            WorkDatabase workDatabase = WorkerWrapper.this.workDatabase;
            final WorkerWrapper workerWrapper = WorkerWrapper.this;
            Object objRunInTransaction = workDatabase.runInTransaction((Callable<Object>) new Callable() { // from class: androidx.work.impl.WorkerWrapper$launch$1$$ExternalSyntheticLambda0
                @Override // java.util.concurrent.Callable
                public final Object call() {
                    return WorkerWrapper.AnonymousClass1.invokeSuspend$lambda$1(failed, workerWrapper);
                }
            });
            Intrinsics.checkNotNullExpressionValue(objRunInTransaction, "workDatabase.runInTransa…          }\n            )");
            return objRunInTransaction;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static final Boolean invokeSuspend$lambda$1(Resolution $resolution, WorkerWrapper this$0) {
            boolean zResetWorkerStatus;
            if ($resolution instanceof Resolution.Finished) {
                zResetWorkerStatus = this$0.onWorkFinished(((Resolution.Finished) $resolution).getResult());
            } else if ($resolution instanceof Resolution.Failed) {
                this$0.setFailed(((Resolution.Failed) $resolution).getResult());
                zResetWorkerStatus = false;
            } else if ($resolution instanceof Resolution.ResetWorkerStatus) {
                zResetWorkerStatus = this$0.resetWorkerStatus(((Resolution.ResetWorkerStatus) $resolution).getReason());
            } else {
                throw new NoWhenBranchMatchedException();
            }
            return Boolean.valueOf(zResetWorkerStatus);
        }
    }

    public final ListenableFuture<Boolean> launch() {
        return ListenableFutureKt.launchFuture$default(this.workTaskExecutor.getTaskCoroutineDispatcher().plus(JobKt__JobKt.Job$default((Job) null, 1, (Object) null)), null, new AnonymousClass1(null), 2, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX INFO: compiled from: WorkerWrapper.kt */
    @Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b2\u0018\u00002\u00020\u0001:\u0003\u0003\u0004\u0005B\u0007\b\u0004¢\u0006\u0002\u0010\u0002\u0082\u0001\u0003\u0006\u0007\b¨\u0006\t"}, d2 = {"Landroidx/work/impl/WorkerWrapper$Resolution;", "", "()V", "Failed", "Finished", "ResetWorkerStatus", "Landroidx/work/impl/WorkerWrapper$Resolution$Failed;", "Landroidx/work/impl/WorkerWrapper$Resolution$Finished;", "Landroidx/work/impl/WorkerWrapper$Resolution$ResetWorkerStatus;", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
    static abstract class Resolution {
        public /* synthetic */ Resolution(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        /* JADX INFO: compiled from: WorkerWrapper.kt */
        @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0007"}, d2 = {"Landroidx/work/impl/WorkerWrapper$Resolution$ResetWorkerStatus;", "Landroidx/work/impl/WorkerWrapper$Resolution;", "reason", "", "(I)V", "getReason", "()I", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
        public static final class ResetWorkerStatus extends Resolution {
            private final int reason;

            public ResetWorkerStatus() {
                this(0, 1, null);
            }

            public ResetWorkerStatus(int reason) {
                super(null);
                this.reason = reason;
            }

            public /* synthetic */ ResetWorkerStatus(int i, int i2, DefaultConstructorMarker defaultConstructorMarker) {
                this((i2 & 1) != 0 ? -256 : i);
            }

            public final int getReason() {
                return this.reason;
            }
        }

        private Resolution() {
        }

        /* JADX INFO: compiled from: WorkerWrapper.kt */
        @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\b\b\u0002\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0007"}, d2 = {"Landroidx/work/impl/WorkerWrapper$Resolution$Failed;", "Landroidx/work/impl/WorkerWrapper$Resolution;", "result", "Landroidx/work/ListenableWorker$Result;", "(Landroidx/work/ListenableWorker$Result;)V", "getResult", "()Landroidx/work/ListenableWorker$Result;", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
        public static final class Failed extends Resolution {
            private final ListenableWorker.Result result;

            /* JADX WARN: Multi-variable type inference failed */
            public Failed() {
                this(null, 1, 0 == true ? 1 : 0);
            }

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public Failed(ListenableWorker.Result result) {
                super(null);
                Intrinsics.checkNotNullParameter(result, "result");
                this.result = result;
            }

            public /* synthetic */ Failed(ListenableWorker.Result.Failure failure, int i, DefaultConstructorMarker defaultConstructorMarker) {
                this((i & 1) != 0 ? new ListenableWorker.Result.Failure() : failure);
            }

            public final ListenableWorker.Result getResult() {
                return this.result;
            }
        }

        /* JADX INFO: compiled from: WorkerWrapper.kt */
        @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u0007"}, d2 = {"Landroidx/work/impl/WorkerWrapper$Resolution$Finished;", "Landroidx/work/impl/WorkerWrapper$Resolution;", "result", "Landroidx/work/ListenableWorker$Result;", "(Landroidx/work/ListenableWorker$Result;)V", "getResult", "()Landroidx/work/ListenableWorker$Result;", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
        public static final class Finished extends Resolution {
            private final ListenableWorker.Result result;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            public Finished(ListenableWorker.Result result) {
                super(null);
                Intrinsics.checkNotNullParameter(result, "result");
                this.result = result;
            }

            public final ListenableWorker.Result getResult() {
                return this.result;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code duplicated, block: B:68:0x025f  */
    /* JADX WARN: Code duplicated, block: B:7:0x0018  */
    /* JADX WARN: Multi-variable type inference failed */
    public final Object runWorker(Continuation<? super Resolution> continuation) throws Throwable {
        C00751 c00751;
        final WorkerWrapper workerWrapper;
        Data dataMerge;
        WorkerParameters workerParameters;
        Object objWithContext;
        Consumer<WorkerExceptionInfo> workerExecutionExceptionHandler;
        if (continuation instanceof C00751) {
            c00751 = (C00751) continuation;
            if ((c00751.label & Integer.MIN_VALUE) != 0) {
                c00751.label -= Integer.MIN_VALUE;
            } else {
                c00751 = new C00751(continuation);
            }
        } else {
            c00751 = new C00751(continuation);
        }
        C00751 c00752 = c00751;
        Object obj = c00752.result;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        int i = 1;
        ListenableWorker.Result result = null;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        Object[] objArr3 = 0;
        Object[] objArr4 = 0;
        Object[] objArr5 = 0;
        Object[] objArr6 = 0;
        Object[] objArr7 = 0;
        Object[] objArr8 = 0;
        try {
            switch (c00752.label) {
                case 0:
                    ResultKt.throwOnFailure(obj);
                    workerWrapper = this;
                    boolean zIsEnabled = workerWrapper.configuration.getTracer().isEnabled();
                    final String traceTag = workerWrapper.workSpec.getTraceTag();
                    if (zIsEnabled && traceTag != null) {
                        workerWrapper.configuration.getTracer().beginAsyncSection(traceTag, workerWrapper.workSpec.hashCode());
                    }
                    Boolean shouldExit = (Boolean) workerWrapper.workDatabase.runInTransaction(new Callable() { // from class: androidx.work.impl.WorkerWrapper$$ExternalSyntheticLambda0
                        @Override // java.util.concurrent.Callable
                        public final Object call() {
                            return WorkerWrapper.runWorker$lambda$1(this.f$0);
                        }
                    });
                    Intrinsics.checkNotNullExpressionValue(shouldExit, "shouldExit");
                    int i2 = 0;
                    if (shouldExit.booleanValue()) {
                        return new Resolution.ResetWorkerStatus(i2, i, objArr7 == true ? 1 : 0);
                    }
                    if (workerWrapper.workSpec.isPeriodic()) {
                        dataMerge = workerWrapper.workSpec.input;
                    } else {
                        InputMerger inputMergerCreateInputMergerWithDefaultFallback = workerWrapper.configuration.getInputMergerFactory().createInputMergerWithDefaultFallback(workerWrapper.workSpec.inputMergerClassName);
                        if (inputMergerCreateInputMergerWithDefaultFallback == null) {
                            Logger.get().error(WorkerWrapperKt.TAG, "Could not create Input Merger " + workerWrapper.workSpec.inputMergerClassName);
                            return new Resolution.Failed(objArr2 == true ? 1 : 0, i, objArr == true ? 1 : 0);
                        }
                        dataMerge = inputMergerCreateInputMergerWithDefaultFallback.merge(CollectionsKt.plus((Collection) CollectionsKt.listOf(workerWrapper.workSpec.input), (Iterable) workerWrapper.workSpecDao.getInputsFromPrerequisites(workerWrapper.workSpecId)));
                    }
                    WorkerParameters workerParameters2 = new WorkerParameters(UUID.fromString(workerWrapper.workSpecId), dataMerge, workerWrapper.tags, workerWrapper.runtimeExtras, workerWrapper.workSpec.runAttemptCount, workerWrapper.workSpec.getGeneration(), workerWrapper.configuration.getExecutor(), workerWrapper.configuration.getWorkerCoroutineContext(), workerWrapper.workTaskExecutor, workerWrapper.configuration.getWorkerFactory(), new WorkProgressUpdater(workerWrapper.workDatabase, workerWrapper.workTaskExecutor), new WorkForegroundUpdater(workerWrapper.workDatabase, workerWrapper.foregroundProcessor, workerWrapper.workTaskExecutor));
                    final ListenableWorker listenableWorkerCreateWorkerWithDefaultFallback = workerWrapper.builderWorker;
                    if (listenableWorkerCreateWorkerWithDefaultFallback == null) {
                        try {
                            listenableWorkerCreateWorkerWithDefaultFallback = workerWrapper.configuration.getWorkerFactory().createWorkerWithDefaultFallback(workerWrapper.appContext, workerWrapper.workSpec.workerClassName, workerParameters2);
                        } catch (Throwable th) {
                            Logger.get().error(WorkerWrapperKt.TAG, "Could not create Worker " + workerWrapper.workSpec.workerClassName);
                            Consumer<WorkerExceptionInfo> workerInitializationExceptionHandler = workerWrapper.configuration.getWorkerInitializationExceptionHandler();
                            if (workerInitializationExceptionHandler != null) {
                                WorkerExceptionUtilsKt.safeAccept(workerInitializationExceptionHandler, new WorkerExceptionInfo(workerWrapper.workSpec.workerClassName, workerParameters2, th), WorkerWrapperKt.TAG);
                            }
                            return new Resolution.Failed(objArr4 == true ? 1 : 0, 1, objArr3 == true ? 1 : 0);
                        }
                    }
                    listenableWorkerCreateWorkerWithDefaultFallback.setUsed();
                    CoroutineContext.Element element = c00752.getContext().get(Job.INSTANCE);
                    Intrinsics.checkNotNull(element);
                    Job job = (Job) element;
                    final boolean z = zIsEnabled;
                    job.invokeOnCompletion(new Function1<Throwable, Unit>() { // from class: androidx.work.impl.WorkerWrapper.runWorker.2
                        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                        {
                            super(1);
                        }

                        @Override // kotlin.jvm.functions.Function1
                        public /* bridge */ /* synthetic */ Unit invoke(Throwable th2) {
                            invoke2(th2);
                            return Unit.INSTANCE;
                        }

                        /* JADX INFO: renamed from: invoke, reason: avoid collision after fix types in other method */
                        public final void invoke2(Throwable it) {
                            if (it instanceof WorkerStoppedException) {
                                listenableWorkerCreateWorkerWithDefaultFallback.stop(((WorkerStoppedException) it).getReason());
                            }
                            if (z && traceTag != null) {
                                workerWrapper.configuration.getTracer().endAsyncSection(traceTag, workerWrapper.getWorkSpec().hashCode());
                            }
                        }
                    });
                    if (!workerWrapper.trySetRunning()) {
                        return new Resolution.ResetWorkerStatus(0, 1, objArr6 == true ? 1 : 0);
                    }
                    int i3 = 0;
                    int i4 = 1;
                    if (job.isCancelled()) {
                        return new Resolution.ResetWorkerStatus(i3, i4, objArr5 == true ? 1 : 0);
                    }
                    ForegroundUpdater foregroundUpdater = workerParameters2.getForegroundUpdater();
                    Intrinsics.checkNotNullExpressionValue(foregroundUpdater, "params.foregroundUpdater");
                    Executor mainThreadExecutor = workerWrapper.workTaskExecutor.getMainThreadExecutor();
                    Intrinsics.checkNotNullExpressionValue(mainThreadExecutor, "workTaskExecutor.getMainThreadExecutor()");
                    try {
                        CoroutineDispatcher coroutineDispatcherFrom = ExecutorsKt.from(mainThreadExecutor);
                        WorkerWrapper$runWorker$result$1 workerWrapper$runWorker$result$1 = new WorkerWrapper$runWorker$result$1(workerWrapper, listenableWorkerCreateWorkerWithDefaultFallback, foregroundUpdater, null);
                        c00752.L$0 = workerWrapper;
                        c00752.L$1 = workerParameters2;
                        c00752.label = 1;
                        objWithContext = BuildersKt.withContext(coroutineDispatcherFrom, workerWrapper$runWorker$result$1, c00752);
                        if (objWithContext == coroutine_suspended) {
                            return coroutine_suspended;
                        }
                        workerParameters = workerParameters2;
                        ListenableWorker.Result result2 = (ListenableWorker.Result) objWithContext;
                        Intrinsics.checkNotNullExpressionValue(result2, "result");
                        return new Resolution.Finished(result2);
                    } catch (Throwable th2) {
                        th = th2;
                        workerParameters = workerParameters2;
                        Logger.get().error(WorkerWrapperKt.TAG, workerWrapper.workDescription + " failed because it threw an exception/error", th);
                        workerExecutionExceptionHandler = workerWrapper.configuration.getWorkerExecutionExceptionHandler();
                        if (workerExecutionExceptionHandler != null) {
                            WorkerExceptionUtilsKt.safeAccept(workerExecutionExceptionHandler, new WorkerExceptionInfo(workerWrapper.workSpec.workerClassName, workerParameters, th), WorkerWrapperKt.TAG);
                        }
                        return new Resolution.Failed(result, 1, objArr8 == true ? 1 : 0);
                    }
                    break;
                case 1:
                    workerParameters = (WorkerParameters) c00752.L$1;
                    workerWrapper = (WorkerWrapper) c00752.L$0;
                    try {
                        ResultKt.throwOnFailure(obj);
                        objWithContext = obj;
                        ListenableWorker.Result result3 = (ListenableWorker.Result) objWithContext;
                        Intrinsics.checkNotNullExpressionValue(result3, "result");
                        return new Resolution.Finished(result3);
                    } catch (Throwable th3) {
                        th = th3;
                        Logger.get().error(WorkerWrapperKt.TAG, workerWrapper.workDescription + " failed because it threw an exception/error", th);
                        workerExecutionExceptionHandler = workerWrapper.configuration.getWorkerExecutionExceptionHandler();
                        if (workerExecutionExceptionHandler != null) {
                            WorkerExceptionUtilsKt.safeAccept(workerExecutionExceptionHandler, new WorkerExceptionInfo(workerWrapper.workSpec.workerClassName, workerParameters, th), WorkerWrapperKt.TAG);
                        }
                        return new Resolution.Failed(result, 1, objArr8 == true ? 1 : 0);
                    }
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        } catch (CancellationException e) {
            Logger.get().info(WorkerWrapperKt.TAG, workerWrapper.workDescription + " was cancelled", e);
            throw e;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Boolean runWorker$lambda$1(WorkerWrapper this$0) {
        if (this$0.workSpec.state != WorkInfo.State.ENQUEUED) {
            String tag$iv = WorkerWrapperKt.TAG;
            Logger.get().debug(tag$iv, this$0.workSpec.workerClassName + " is not in ENQUEUED state. Nothing more to do");
            return true;
        }
        if (this$0.workSpec.isPeriodic() || this$0.workSpec.isBackedOff()) {
            long now = this$0.clock.currentTimeMillis();
            if (now < this$0.workSpec.calculateNextRunTime()) {
                Logger.get().debug(WorkerWrapperKt.TAG, "Delaying execution for " + this$0.workSpec.workerClassName + " because it is being executed before schedule.");
                return true;
            }
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean onWorkFinished(ListenableWorker.Result result) {
        WorkInfo.State state = this.workSpecDao.getState(this.workSpecId);
        this.workDatabase.workProgressDao().delete(this.workSpecId);
        if (state == null) {
            return false;
        }
        if (state == WorkInfo.State.RUNNING) {
            return handleResult(result);
        }
        if (state.isFinished()) {
            return false;
        }
        return reschedule(WorkInfo.STOP_REASON_UNKNOWN);
    }

    public final void interrupt(int stopReason) {
        this.workerJob.cancel((CancellationException) new WorkerStoppedException(stopReason));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean resetWorkerStatus(int stopReason) {
        WorkInfo.State state = this.workSpecDao.getState(this.workSpecId);
        if (state == null || state.isFinished()) {
            String tag$iv = WorkerWrapperKt.TAG;
            Logger.get().debug(tag$iv, "Status for " + this.workSpecId + " is " + state + " ; not doing any work");
            return false;
        }
        String tag$iv2 = WorkerWrapperKt.TAG;
        Logger.get().debug(tag$iv2, "Status for " + this.workSpecId + " is " + state + "; not doing any work and rescheduling for later execution");
        this.workSpecDao.setState(WorkInfo.State.ENQUEUED, this.workSpecId);
        this.workSpecDao.setStopReason(this.workSpecId, stopReason);
        this.workSpecDao.markWorkSpecScheduled(this.workSpecId, -1L);
        return true;
    }

    private final boolean handleResult(ListenableWorker.Result result) {
        if (result instanceof ListenableWorker.Result.Success) {
            String tag$iv = WorkerWrapperKt.TAG;
            Logger.get().info(tag$iv, "Worker result SUCCESS for " + this.workDescription);
            if (this.workSpec.isPeriodic()) {
                return resetPeriodic();
            }
            return setSucceeded(result);
        }
        if (result instanceof ListenableWorker.Result.Retry) {
            String tag$iv2 = WorkerWrapperKt.TAG;
            Logger.get().info(tag$iv2, "Worker result RETRY for " + this.workDescription);
            return reschedule(-256);
        }
        String tag$iv3 = WorkerWrapperKt.TAG;
        Logger.get().info(tag$iv3, "Worker result FAILURE for " + this.workDescription);
        if (this.workSpec.isPeriodic()) {
            return resetPeriodic();
        }
        return setFailed(result == null ? new ListenableWorker.Result.Failure() : result);
    }

    private final boolean trySetRunning() {
        Object objRunInTransaction = this.workDatabase.runInTransaction((Callable<Object>) new Callable() { // from class: androidx.work.impl.WorkerWrapper$$ExternalSyntheticLambda1
            @Override // java.util.concurrent.Callable
            public final Object call() {
                return WorkerWrapper.trySetRunning$lambda$11(this.f$0);
            }
        });
        Intrinsics.checkNotNullExpressionValue(objRunInTransaction, "workDatabase.runInTransa…e\n            }\n        )");
        return ((Boolean) objRunInTransaction).booleanValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Boolean trySetRunning$lambda$11(WorkerWrapper this$0) {
        boolean z;
        WorkInfo.State currentState = this$0.workSpecDao.getState(this$0.workSpecId);
        if (currentState == WorkInfo.State.ENQUEUED) {
            this$0.workSpecDao.setState(WorkInfo.State.RUNNING, this$0.workSpecId);
            this$0.workSpecDao.incrementWorkSpecRunAttemptCount(this$0.workSpecId);
            this$0.workSpecDao.setStopReason(this$0.workSpecId, -256);
            z = true;
        } else {
            z = false;
        }
        return Boolean.valueOf(z);
    }

    public final boolean setFailed(ListenableWorker.Result result) {
        Intrinsics.checkNotNullParameter(result, "result");
        iterativelyFailWorkAndDependents(this.workSpecId);
        ListenableWorker.Result.Failure failure = (ListenableWorker.Result.Failure) result;
        Data output = failure.getOutputData();
        Intrinsics.checkNotNullExpressionValue(output, "failure.outputData");
        this.workSpecDao.resetWorkSpecNextScheduleTimeOverride(this.workSpecId, this.workSpec.getNextScheduleTimeOverrideGeneration());
        this.workSpecDao.setOutput(this.workSpecId, output);
        return false;
    }

    private final void iterativelyFailWorkAndDependents(String workSpecId) {
        List idsToProcess = CollectionsKt.mutableListOf(workSpecId);
        while (!idsToProcess.isEmpty()) {
            String id = (String) CollectionsKt.removeLast(idsToProcess);
            if (this.workSpecDao.getState(id) != WorkInfo.State.CANCELLED) {
                this.workSpecDao.setState(WorkInfo.State.FAILED, id);
            }
            idsToProcess.addAll(this.dependencyDao.getDependentWorkIds(id));
        }
    }

    private final boolean reschedule(int stopReason) {
        this.workSpecDao.setState(WorkInfo.State.ENQUEUED, this.workSpecId);
        this.workSpecDao.setLastEnqueueTime(this.workSpecId, this.clock.currentTimeMillis());
        this.workSpecDao.resetWorkSpecNextScheduleTimeOverride(this.workSpecId, this.workSpec.getNextScheduleTimeOverrideGeneration());
        this.workSpecDao.markWorkSpecScheduled(this.workSpecId, -1L);
        this.workSpecDao.setStopReason(this.workSpecId, stopReason);
        return true;
    }

    private final boolean resetPeriodic() {
        this.workSpecDao.setLastEnqueueTime(this.workSpecId, this.clock.currentTimeMillis());
        this.workSpecDao.setState(WorkInfo.State.ENQUEUED, this.workSpecId);
        this.workSpecDao.resetWorkSpecRunAttemptCount(this.workSpecId);
        this.workSpecDao.resetWorkSpecNextScheduleTimeOverride(this.workSpecId, this.workSpec.getNextScheduleTimeOverrideGeneration());
        this.workSpecDao.incrementPeriodCount(this.workSpecId);
        this.workSpecDao.markWorkSpecScheduled(this.workSpecId, -1L);
        return false;
    }

    private final boolean setSucceeded(ListenableWorker.Result result) {
        this.workSpecDao.setState(WorkInfo.State.SUCCEEDED, this.workSpecId);
        Intrinsics.checkNotNull(result, "null cannot be cast to non-null type androidx.work.ListenableWorker.Result.Success");
        ListenableWorker.Result.Success success = (ListenableWorker.Result.Success) result;
        Data output = success.getOutputData();
        Intrinsics.checkNotNullExpressionValue(output, "success.outputData");
        this.workSpecDao.setOutput(this.workSpecId, output);
        long currentTimeMillis = this.clock.currentTimeMillis();
        for (String dependentWorkId : this.dependencyDao.getDependentWorkIds(this.workSpecId)) {
            if (this.workSpecDao.getState(dependentWorkId) == WorkInfo.State.BLOCKED && this.dependencyDao.hasCompletedAllPrerequisites(dependentWorkId)) {
                String tag$iv = WorkerWrapperKt.TAG;
                Logger.get().info(tag$iv, "Setting status to enqueued for " + dependentWorkId);
                this.workSpecDao.setState(WorkInfo.State.ENQUEUED, dependentWorkId);
                this.workSpecDao.setLastEnqueueTime(dependentWorkId, currentTimeMillis);
            }
        }
        return false;
    }

    private final String createWorkDescription(List<String> tags) {
        return "Work [ id=" + this.workSpecId + ", tags={ " + CollectionsKt.joinToString$default(tags, ",", null, null, 0, null, null, 62, null) + " } ]";
    }

    /* JADX INFO: compiled from: WorkerWrapper.kt */
    @Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0007\u0018\u00002\u00020\u0001BE\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\u0006\u0010\f\u001a\u00020\r\u0012\f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00100\u000f¢\u0006\u0002\u0010\u0011J\u0006\u0010-\u001a\u00020.J\u0010\u0010/\u001a\u00020\u00002\b\u0010\u0019\u001a\u0004\u0018\u00010\u001aJ\u0010\u00100\u001a\u00020\u00002\u0006\u0010'\u001a\u00020(H\u0007R\u0011\u0010\u0012\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0016R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0018R\u001a\u0010\u0019\u001a\u00020\u001aX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u001b\u0010\u001c\"\u0004\b\u001d\u0010\u001eR\u0017\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00100\u000f¢\u0006\b\n\u0000\u001a\u0004\b\u001f\u0010 R\u0011\u0010\n\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b!\u0010\"R\u0011\u0010\f\u001a\u00020\r¢\u0006\b\n\u0000\u001a\u0004\b#\u0010$R\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b%\u0010&R\u001c\u0010'\u001a\u0004\u0018\u00010(X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b)\u0010*\"\u0004\b+\u0010,¨\u00061"}, d2 = {"Landroidx/work/impl/WorkerWrapper$Builder;", "", "context", "Landroid/content/Context;", "configuration", "Landroidx/work/Configuration;", "workTaskExecutor", "Landroidx/work/impl/utils/taskexecutor/TaskExecutor;", "foregroundProcessor", "Landroidx/work/impl/foreground/ForegroundProcessor;", "workDatabase", "Landroidx/work/impl/WorkDatabase;", "workSpec", "Landroidx/work/impl/model/WorkSpec;", "tags", "", "", "(Landroid/content/Context;Landroidx/work/Configuration;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Landroidx/work/impl/foreground/ForegroundProcessor;Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/model/WorkSpec;Ljava/util/List;)V", "appContext", "getAppContext", "()Landroid/content/Context;", "getConfiguration", "()Landroidx/work/Configuration;", "getForegroundProcessor", "()Landroidx/work/impl/foreground/ForegroundProcessor;", "runtimeExtras", "Landroidx/work/WorkerParameters$RuntimeExtras;", "getRuntimeExtras", "()Landroidx/work/WorkerParameters$RuntimeExtras;", "setRuntimeExtras", "(Landroidx/work/WorkerParameters$RuntimeExtras;)V", "getTags", "()Ljava/util/List;", "getWorkDatabase", "()Landroidx/work/impl/WorkDatabase;", "getWorkSpec", "()Landroidx/work/impl/model/WorkSpec;", "getWorkTaskExecutor", "()Landroidx/work/impl/utils/taskexecutor/TaskExecutor;", "worker", "Landroidx/work/ListenableWorker;", "getWorker", "()Landroidx/work/ListenableWorker;", "setWorker", "(Landroidx/work/ListenableWorker;)V", "build", "Landroidx/work/impl/WorkerWrapper;", "withRuntimeExtras", "withWorker", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
    public static final class Builder {
        private final Context appContext;
        private final Configuration configuration;
        private final ForegroundProcessor foregroundProcessor;
        private WorkerParameters.RuntimeExtras runtimeExtras;
        private final List<String> tags;
        private final WorkDatabase workDatabase;
        private final WorkSpec workSpec;
        private final TaskExecutor workTaskExecutor;
        private ListenableWorker worker;

        public Builder(Context context, Configuration configuration, TaskExecutor workTaskExecutor, ForegroundProcessor foregroundProcessor, WorkDatabase workDatabase, WorkSpec workSpec, List<String> tags) {
            Intrinsics.checkNotNullParameter(context, "context");
            Intrinsics.checkNotNullParameter(configuration, "configuration");
            Intrinsics.checkNotNullParameter(workTaskExecutor, "workTaskExecutor");
            Intrinsics.checkNotNullParameter(foregroundProcessor, "foregroundProcessor");
            Intrinsics.checkNotNullParameter(workDatabase, "workDatabase");
            Intrinsics.checkNotNullParameter(workSpec, "workSpec");
            Intrinsics.checkNotNullParameter(tags, "tags");
            this.configuration = configuration;
            this.workTaskExecutor = workTaskExecutor;
            this.foregroundProcessor = foregroundProcessor;
            this.workDatabase = workDatabase;
            this.workSpec = workSpec;
            this.tags = tags;
            Context applicationContext = context.getApplicationContext();
            Intrinsics.checkNotNullExpressionValue(applicationContext, "context.applicationContext");
            this.appContext = applicationContext;
            this.runtimeExtras = new WorkerParameters.RuntimeExtras();
        }

        public final Configuration getConfiguration() {
            return this.configuration;
        }

        public final TaskExecutor getWorkTaskExecutor() {
            return this.workTaskExecutor;
        }

        public final ForegroundProcessor getForegroundProcessor() {
            return this.foregroundProcessor;
        }

        public final WorkDatabase getWorkDatabase() {
            return this.workDatabase;
        }

        public final WorkSpec getWorkSpec() {
            return this.workSpec;
        }

        public final List<String> getTags() {
            return this.tags;
        }

        public final Context getAppContext() {
            return this.appContext;
        }

        public final ListenableWorker getWorker() {
            return this.worker;
        }

        public final void setWorker(ListenableWorker listenableWorker) {
            this.worker = listenableWorker;
        }

        public final WorkerParameters.RuntimeExtras getRuntimeExtras() {
            return this.runtimeExtras;
        }

        public final void setRuntimeExtras(WorkerParameters.RuntimeExtras runtimeExtras) {
            Intrinsics.checkNotNullParameter(runtimeExtras, "<set-?>");
            this.runtimeExtras = runtimeExtras;
        }

        public final Builder withRuntimeExtras(WorkerParameters.RuntimeExtras runtimeExtras) {
            if (runtimeExtras != null) {
                this.runtimeExtras = runtimeExtras;
            }
            return this;
        }

        public final Builder withWorker(ListenableWorker worker) {
            Intrinsics.checkNotNullParameter(worker, "worker");
            this.worker = worker;
            return this;
        }

        public final WorkerWrapper build() {
            return new WorkerWrapper(this);
        }
    }
}
