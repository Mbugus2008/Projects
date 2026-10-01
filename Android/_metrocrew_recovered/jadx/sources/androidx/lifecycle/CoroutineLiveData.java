package androidx.lifecycle;

import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.EmptyCoroutineContext;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.CompletableJob;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.CoroutineScopeKt;
import kotlinx.coroutines.Dispatchers;
import kotlinx.coroutines.DisposableHandle;
import kotlinx.coroutines.Job;
import kotlinx.coroutines.SupervisorKt;

/* JADX INFO: compiled from: CoroutineLiveData.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000R\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\b\u0000\u0018\u0000*\u0004\b\u0000\u0010\u00012\b\u0012\u0004\u0012\u0002H\u00010\u0002BT\u0012\b\b\u0002\u0010\u0003\u001a\u00020\u0004\u0012\b\b\u0002\u0010\u0005\u001a\u00020\u0006\u00127\u0010\u0007\u001a3\b\u0001\u0012\n\u0012\b\u0012\u0004\u0012\u00028\u00000\t\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u000b0\n\u0012\u0006\u0012\u0004\u0018\u00010\f0\bj\b\u0012\u0004\u0012\u00028\u0000`\u000e¢\u0006\u0002\b\r¢\u0006\u0004\b\u000f\u0010\u0010J\u001e\u0010\u0015\u001a\u00020\u00162\f\u0010\u0017\u001a\b\u0012\u0004\u0012\u00028\u00000\u0018H\u0080@¢\u0006\u0004\b\u0019\u0010\u001aJ\u0010\u0010\u001b\u001a\u00020\u000bH\u0080@¢\u0006\u0004\b\u001c\u0010\u001dJ\b\u0010\u001e\u001a\u00020\u000bH\u0014J\b\u0010\u001f\u001a\u00020\u000bH\u0014R\u0016\u0010\u0011\u001a\n\u0012\u0004\u0012\u00028\u0000\u0018\u00010\u0012X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0013\u001a\u0004\u0018\u00010\u0014X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006 "}, d2 = {"Landroidx/lifecycle/CoroutineLiveData;", "T", "Landroidx/lifecycle/MediatorLiveData;", "context", "Lkotlin/coroutines/CoroutineContext;", "timeoutInMs", "", "block", "Lkotlin/Function2;", "Landroidx/lifecycle/LiveDataScope;", "Lkotlin/coroutines/Continuation;", "", "", "Lkotlin/ExtensionFunctionType;", "Landroidx/lifecycle/Block;", "<init>", "(Lkotlin/coroutines/CoroutineContext;JLkotlin/jvm/functions/Function2;)V", "blockRunner", "Landroidx/lifecycle/BlockRunner;", "emittedSource", "Landroidx/lifecycle/EmittedSource;", "emitSource", "Lkotlinx/coroutines/DisposableHandle;", "source", "Landroidx/lifecycle/LiveData;", "emitSource$lifecycle_livedata_release", "(Landroidx/lifecycle/LiveData;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "clearSource", "clearSource$lifecycle_livedata_release", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "onActive", "onInactive", "lifecycle-livedata_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
public final class CoroutineLiveData<T> extends MediatorLiveData<T> {
    private BlockRunner<T> blockRunner;
    private EmittedSource emittedSource;

    public /* synthetic */ CoroutineLiveData(EmptyCoroutineContext emptyCoroutineContext, long j, Function2 function2, int i, DefaultConstructorMarker defaultConstructorMarker) {
        this((i & 1) != 0 ? EmptyCoroutineContext.INSTANCE : emptyCoroutineContext, (i & 2) != 0 ? CoroutineLiveDataKt.DEFAULT_TIMEOUT : j, function2);
    }

    public CoroutineLiveData(CoroutineContext context, long timeoutInMs, Function2<? super LiveDataScope<T>, ? super Continuation<? super Unit>, ? extends Object> block) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(block, "block");
        CompletableJob supervisorJob = SupervisorKt.SupervisorJob((Job) context.get(Job.INSTANCE));
        CoroutineScope scope = CoroutineScopeKt.CoroutineScope(Dispatchers.getMain().getImmediate().plus(context).plus(supervisorJob));
        this.blockRunner = new BlockRunner<>(this, block, timeoutInMs, scope, new Function0() { // from class: androidx.lifecycle.CoroutineLiveData$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                return CoroutineLiveData._init_$lambda$0(this.f$0);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit _init_$lambda$0(CoroutineLiveData this$0) {
        this$0.blockRunner = null;
        return Unit.INSTANCE;
    }

    /* JADX WARN: Code duplicated, block: B:20:0x005d A[RETURN] */
    /* JADX WARN: Code duplicated, block: B:7:0x0014  */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v2 */
    /* JADX WARN: Type inference failed for: r7v0, types: [androidx.lifecycle.CoroutineLiveData, androidx.lifecycle.CoroutineLiveData<T>] */
    /* JADX WARN: Type inference failed for: r8v1 */
    /* JADX WARN: Type inference failed for: r8v2 */
    /* JADX WARN: Type inference failed for: r8v3 */
    /* JADX WARN: Type inference failed for: r8v4, types: [androidx.lifecycle.CoroutineLiveData] */
    /* JADX WARN: Type inference failed for: r8v5 */
    /* JADX WARN: Type inference failed for: r8v7 */
    public final Object emitSource$lifecycle_livedata_release(LiveData<T> liveData, Continuation<? super DisposableHandle> continuation) throws Throwable {
        CoroutineLiveData$emitSource$1 coroutineLiveData$emitSource$1;
        LiveData<T> liveData2;
        ?? r8;
        Object objAddDisposableSource;
        ?? r9;
        if (continuation instanceof CoroutineLiveData$emitSource$1) {
            coroutineLiveData$emitSource$1 = (CoroutineLiveData$emitSource$1) continuation;
            if ((coroutineLiveData$emitSource$1.label & Integer.MIN_VALUE) != 0) {
                coroutineLiveData$emitSource$1.label -= Integer.MIN_VALUE;
            } else {
                coroutineLiveData$emitSource$1 = new CoroutineLiveData$emitSource$1(this, continuation);
            }
        } else {
            coroutineLiveData$emitSource$1 = new CoroutineLiveData$emitSource$1(this, continuation);
        }
        Object obj = coroutineLiveData$emitSource$1.result;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (coroutineLiveData$emitSource$1.label) {
            case 0:
                ResultKt.throwOnFailure(obj);
                coroutineLiveData$emitSource$1.L$0 = liveData;
                coroutineLiveData$emitSource$1.label = 1;
                if (clearSource$lifecycle_livedata_release(coroutineLiveData$emitSource$1) == coroutine_suspended) {
                    return coroutine_suspended;
                }
                liveData2 = liveData;
                r8 = this;
                coroutineLiveData$emitSource$1.L$0 = null;
                coroutineLiveData$emitSource$1.label = 2;
                objAddDisposableSource = CoroutineLiveDataKt.addDisposableSource((MediatorLiveData) r8, liveData2, coroutineLiveData$emitSource$1);
                r9 = r8;
                if (objAddDisposableSource == coroutine_suspended) {
                    return coroutine_suspended;
                }
                EmittedSource emittedSource = (EmittedSource) objAddDisposableSource;
                r9.emittedSource = emittedSource;
                return emittedSource;
            case 1:
                r8 = this;
                liveData2 = (LiveData) coroutineLiveData$emitSource$1.L$0;
                ResultKt.throwOnFailure(obj);
                coroutineLiveData$emitSource$1.L$0 = null;
                coroutineLiveData$emitSource$1.label = 2;
                objAddDisposableSource = CoroutineLiveDataKt.addDisposableSource((MediatorLiveData) r8, liveData2, coroutineLiveData$emitSource$1);
                r9 = r8;
                if (objAddDisposableSource == coroutine_suspended) {
                    return coroutine_suspended;
                }
                EmittedSource emittedSource2 = (EmittedSource) objAddDisposableSource;
                r9.emittedSource = emittedSource2;
                return emittedSource2;
            case 2:
                r9 = this;
                ResultKt.throwOnFailure(obj);
                objAddDisposableSource = obj;
                EmittedSource emittedSource3 = (EmittedSource) objAddDisposableSource;
                r9.emittedSource = emittedSource3;
                return emittedSource3;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    /* JADX WARN: Code duplicated, block: B:7:0x0014  */
    public final Object clearSource$lifecycle_livedata_release(Continuation<? super Unit> continuation) throws Throwable {
        CoroutineLiveData$clearSource$1 coroutineLiveData$clearSource$1;
        CoroutineLiveData<T> coroutineLiveData;
        CoroutineLiveData<T> coroutineLiveData2;
        if (continuation instanceof CoroutineLiveData$clearSource$1) {
            coroutineLiveData$clearSource$1 = (CoroutineLiveData$clearSource$1) continuation;
            if ((coroutineLiveData$clearSource$1.label & Integer.MIN_VALUE) != 0) {
                coroutineLiveData$clearSource$1.label -= Integer.MIN_VALUE;
            } else {
                coroutineLiveData$clearSource$1 = new CoroutineLiveData$clearSource$1(this, continuation);
            }
        } else {
            coroutineLiveData$clearSource$1 = new CoroutineLiveData$clearSource$1(this, continuation);
        }
        Object $result = coroutineLiveData$clearSource$1.result;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (coroutineLiveData$clearSource$1.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                coroutineLiveData = this;
                EmittedSource emittedSource = coroutineLiveData.emittedSource;
                if (emittedSource != null) {
                    coroutineLiveData$clearSource$1.label = 1;
                    if (emittedSource.disposeNow(coroutineLiveData$clearSource$1) == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    coroutineLiveData2 = coroutineLiveData;
                    coroutineLiveData = coroutineLiveData2;
                }
                coroutineLiveData.emittedSource = null;
                return Unit.INSTANCE;
            case 1:
                coroutineLiveData2 = this;
                ResultKt.throwOnFailure($result);
                coroutineLiveData = coroutineLiveData2;
                coroutineLiveData.emittedSource = null;
                return Unit.INSTANCE;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    @Override // androidx.lifecycle.MediatorLiveData, androidx.lifecycle.LiveData
    protected void onActive() {
        super.onActive();
        BlockRunner<T> blockRunner = this.blockRunner;
        if (blockRunner != null) {
            blockRunner.maybeRun();
        }
    }

    @Override // androidx.lifecycle.MediatorLiveData, androidx.lifecycle.LiveData
    protected void onInactive() {
        super.onInactive();
        BlockRunner<T> blockRunner = this.blockRunner;
        if (blockRunner != null) {
            blockRunner.cancel();
        }
    }
}
