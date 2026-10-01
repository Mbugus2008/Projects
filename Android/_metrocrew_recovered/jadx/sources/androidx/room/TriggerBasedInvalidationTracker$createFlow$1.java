package androidx.room;

import androidx.room.util.DBUtil;
import java.util.ArrayList;
import java.util.Set;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.ArraysKt;
import kotlin.collections.CollectionsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Ref;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.flow.FlowCollector;

/* JADX INFO: compiled from: InvalidationTracker.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0012\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0010\"\n\u0002\u0010\u000e\u0010\u0000\u001a\u00020\u0001*\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00040\u00030\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/flow/FlowCollector;", "", ""}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "androidx.room.TriggerBasedInvalidationTracker$createFlow$1", f = "InvalidationTracker.kt", i = {0, 1}, l = {238, 238, 242}, m = "invokeSuspend", n = {"$this$flow", "$this$flow"}, s = {"L$0", "L$0"})
final class TriggerBasedInvalidationTracker$createFlow$1 extends SuspendLambda implements Function2<FlowCollector<? super Set<? extends String>>, Continuation<? super Unit>, Object> {
    final /* synthetic */ boolean $emitInitialState;
    final /* synthetic */ String[] $resolvedTableNames;
    final /* synthetic */ int[] $tableIds;
    private /* synthetic */ Object L$0;
    int label;
    final /* synthetic */ TriggerBasedInvalidationTracker this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    TriggerBasedInvalidationTracker$createFlow$1(TriggerBasedInvalidationTracker triggerBasedInvalidationTracker, int[] iArr, boolean z, String[] strArr, Continuation<? super TriggerBasedInvalidationTracker$createFlow$1> continuation) {
        super(2, continuation);
        this.this$0 = triggerBasedInvalidationTracker;
        this.$tableIds = iArr;
        this.$emitInitialState = z;
        this.$resolvedTableNames = strArr;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        TriggerBasedInvalidationTracker$createFlow$1 triggerBasedInvalidationTracker$createFlow$1 = new TriggerBasedInvalidationTracker$createFlow$1(this.this$0, this.$tableIds, this.$emitInitialState, this.$resolvedTableNames, continuation);
        triggerBasedInvalidationTracker$createFlow$1.L$0 = obj;
        return triggerBasedInvalidationTracker$createFlow$1;
    }

    @Override // kotlin.jvm.functions.Function2
    public /* bridge */ /* synthetic */ Object invoke(FlowCollector<? super Set<? extends String>> flowCollector, Continuation<? super Unit> continuation) {
        return invoke2((FlowCollector<? super Set<String>>) flowCollector, continuation);
    }

    /* JADX INFO: renamed from: invoke, reason: avoid collision after fix types in other method */
    public final Object invoke2(FlowCollector<? super Set<String>> flowCollector, Continuation<? super Unit> continuation) {
        return ((TriggerBasedInvalidationTracker$createFlow$1) create(flowCollector, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Code duplicated, block: B:20:0x0074 A[RETURN] */
    /* JADX WARN: Code duplicated, block: B:21:0x0075  */
    /* JADX WARN: Code duplicated, block: B:26:0x00a0 A[RETURN] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) throws Throwable {
        FlowCollector $this$flow;
        FlowCollector $this$flow2;
        FlowCollector $this$flow3;
        Ref.ObjectRef currentVersions;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        try {
            switch (this.label) {
                case 0:
                    ResultKt.throwOnFailure($result);
                    FlowCollector $this$flow4 = (FlowCollector) this.L$0;
                    boolean shouldSync = this.this$0.observedTableStates.onObserverAdded$room_runtime(this.$tableIds);
                    if (shouldSync) {
                        this.L$0 = $this$flow4;
                        this.label = 1;
                        Object coroutineContext = DBUtil.getCoroutineContext(this.this$0.database, false, this);
                        if (coroutineContext == coroutine_suspended) {
                            return coroutine_suspended;
                        }
                        $result = coroutineContext;
                        $this$flow2 = $this$flow4;
                        this.L$0 = $this$flow2;
                        this.label = 2;
                        if (BuildersKt.withContext((CoroutineContext) $result, new AnonymousClass1(this.this$0, null), this) == coroutine_suspended) {
                            return coroutine_suspended;
                        }
                        $this$flow3 = $this$flow2;
                        $this$flow = $this$flow3;
                    } else {
                        $this$flow = $this$flow4;
                    }
                    currentVersions = new Ref.ObjectRef();
                    this.L$0 = null;
                    this.label = 3;
                    if (this.this$0.observedTableVersions.collect(new AnonymousClass2(currentVersions, this.$emitInitialState, $this$flow, this.$resolvedTableNames, this.$tableIds), this) == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    throw new KotlinNothingValueException();
                case 1:
                    FlowCollector $this$flow5 = (FlowCollector) this.L$0;
                    ResultKt.throwOnFailure($result);
                    $this$flow2 = $this$flow5;
                    this.L$0 = $this$flow2;
                    this.label = 2;
                    if (BuildersKt.withContext((CoroutineContext) $result, new AnonymousClass1(this.this$0, null), this) == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    $this$flow3 = $this$flow2;
                    $this$flow = $this$flow3;
                    currentVersions = new Ref.ObjectRef();
                    this.L$0 = null;
                    this.label = 3;
                    if (this.this$0.observedTableVersions.collect(new AnonymousClass2(currentVersions, this.$emitInitialState, $this$flow, this.$resolvedTableNames, this.$tableIds), this) == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    throw new KotlinNothingValueException();
                case 2:
                    $this$flow3 = (FlowCollector) this.L$0;
                    ResultKt.throwOnFailure($result);
                    $this$flow = $this$flow3;
                    currentVersions = new Ref.ObjectRef();
                    this.L$0 = null;
                    this.label = 3;
                    if (this.this$0.observedTableVersions.collect(new AnonymousClass2(currentVersions, this.$emitInitialState, $this$flow, this.$resolvedTableNames, this.$tableIds), this) == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    throw new KotlinNothingValueException();
                case 3:
                    ResultKt.throwOnFailure($result);
                    throw new KotlinNothingValueException();
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        } catch (Throwable th) {
            this.this$0.observedTableStates.onObserverRemoved$room_runtime(this.$tableIds);
            throw th;
        }
    }

    /* JADX INFO: renamed from: androidx.room.TriggerBasedInvalidationTracker$createFlow$1$1, reason: invalid class name */
    /* JADX INFO: compiled from: InvalidationTracker.kt */
    @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "androidx.room.TriggerBasedInvalidationTracker$createFlow$1$1", f = "InvalidationTracker.kt", i = {}, l = {238}, m = "invokeSuspend", n = {}, s = {})
    static final class AnonymousClass1 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
        int label;
        final /* synthetic */ TriggerBasedInvalidationTracker this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AnonymousClass1(TriggerBasedInvalidationTracker triggerBasedInvalidationTracker, Continuation<? super AnonymousClass1> continuation) {
            super(2, continuation);
            this.this$0 = triggerBasedInvalidationTracker;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new AnonymousClass1(this.this$0, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
            return ((AnonymousClass1) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object $result) throws Throwable {
            Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
            switch (this.label) {
                case 0:
                    ResultKt.throwOnFailure($result);
                    this.label = 1;
                    if (this.this$0.syncTriggers$room_runtime(this) == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    break;
                case 1:
                    ResultKt.throwOnFailure($result);
                    break;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            return Unit.INSTANCE;
        }
    }

    /* JADX INFO: renamed from: androidx.room.TriggerBasedInvalidationTracker$createFlow$1$2, reason: invalid class name */
    /* JADX INFO: compiled from: InvalidationTracker.kt */
    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    static final class AnonymousClass2<T> implements FlowCollector {
        final /* synthetic */ FlowCollector<Set<String>> $$this$flow;
        final /* synthetic */ Ref.ObjectRef<int[]> $currentVersions;
        final /* synthetic */ boolean $emitInitialState;
        final /* synthetic */ String[] $resolvedTableNames;
        final /* synthetic */ int[] $tableIds;

        /* JADX WARN: Multi-variable type inference failed */
        AnonymousClass2(Ref.ObjectRef<int[]> objectRef, boolean z, FlowCollector<? super Set<String>> flowCollector, String[] strArr, int[] iArr) {
            this.$currentVersions = objectRef;
            this.$emitInitialState = z;
            this.$$this$flow = flowCollector;
            this.$resolvedTableNames = strArr;
            this.$tableIds = iArr;
        }

        @Override // kotlinx.coroutines.flow.FlowCollector
        public /* bridge */ /* synthetic */ Object emit(Object value, Continuation $completion) {
            return emit((int[]) value, (Continuation<? super Unit>) $completion);
        }

        /* JADX WARN: Code duplicated, block: B:7:0x0018  */
        /* JADX WARN: Type inference failed for: r6v10 */
        /* JADX WARN: Type inference failed for: r6v11 */
        /* JADX WARN: Type inference failed for: r6v2, types: [T] */
        /* JADX WARN: Type inference failed for: r6v8 */
        /* JADX WARN: Type inference failed for: r6v9 */
        public final Object emit(int[] iArr, Continuation<? super Unit> continuation) throws Throwable {
            TriggerBasedInvalidationTracker$createFlow$1$2$emit$1 triggerBasedInvalidationTracker$createFlow$1$2$emit$1;
            AnonymousClass2<T> anonymousClass2;
            int[] iArr2;
            AnonymousClass2<T> anonymousClass3;
            int[] iArr3;
            AnonymousClass2<T> anonymousClass4;
            int[] iArr4;
            ?? r6;
            if (continuation instanceof TriggerBasedInvalidationTracker$createFlow$1$2$emit$1) {
                triggerBasedInvalidationTracker$createFlow$1$2$emit$1 = (TriggerBasedInvalidationTracker$createFlow$1$2$emit$1) continuation;
                if ((triggerBasedInvalidationTracker$createFlow$1$2$emit$1.label & Integer.MIN_VALUE) != 0) {
                    triggerBasedInvalidationTracker$createFlow$1$2$emit$1.label -= Integer.MIN_VALUE;
                } else {
                    triggerBasedInvalidationTracker$createFlow$1$2$emit$1 = new TriggerBasedInvalidationTracker$createFlow$1$2$emit$1(this, continuation);
                }
            } else {
                triggerBasedInvalidationTracker$createFlow$1$2$emit$1 = new TriggerBasedInvalidationTracker$createFlow$1$2$emit$1(this, continuation);
            }
            Object obj = triggerBasedInvalidationTracker$createFlow$1$2$emit$1.result;
            Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
            switch (triggerBasedInvalidationTracker$createFlow$1$2$emit$1.label) {
                case 0:
                    ResultKt.throwOnFailure(obj);
                    anonymousClass2 = this;
                    iArr2 = (T) iArr;
                    if (anonymousClass2.$currentVersions.element == null) {
                        if (anonymousClass2.$emitInitialState) {
                            FlowCollector<Set<String>> flowCollector = anonymousClass2.$$this$flow;
                            Set<String> set = ArraysKt.toSet(anonymousClass2.$resolvedTableNames);
                            triggerBasedInvalidationTracker$createFlow$1$2$emit$1.L$0 = iArr2;
                            triggerBasedInvalidationTracker$createFlow$1$2$emit$1.label = 1;
                            if (flowCollector.emit(set, triggerBasedInvalidationTracker$createFlow$1$2$emit$1) != coroutine_suspended) {
                                r6 = iArr2;
                                anonymousClass4 = anonymousClass2;
                                iArr4 = iArr2;
                                boolean z = (T) iArr4;
                                anonymousClass2 = anonymousClass4;
                                r6 = z;
                            }
                            r6 = iArr2;
                            return coroutine_suspended;
                        }
                        r6 = iArr2;
                        anonymousClass2.$currentVersions.element = (T) r6;
                        return Unit.INSTANCE;
                    }
                    String[] strArr = anonymousClass2.$resolvedTableNames;
                    Ref.ObjectRef<int[]> objectRef = anonymousClass2.$currentVersions;
                    int[] iArr5 = anonymousClass2.$tableIds;
                    ArrayList arrayList = new ArrayList();
                    int i = 0;
                    int length = strArr.length;
                    int i2 = 0;
                    while (i2 < length) {
                        String str = strArr[i2];
                        int i3 = i + 1;
                        int i4 = i2;
                        int[] iArr6 = objectRef.element;
                        if (iArr6 == null) {
                            throw new IllegalStateException("Required value was null.".toString());
                        }
                        if (iArr6[iArr5[i]] != iArr2[iArr5[i]]) {
                            arrayList.add(str);
                        }
                        i2 = i4 + 1;
                        i = i3;
                    }
                    ArrayList arrayList2 = arrayList;
                    r6 = iArr2;
                    if (!arrayList2.isEmpty()) {
                        FlowCollector<Set<String>> flowCollector2 = anonymousClass2.$$this$flow;
                        Set<String> set2 = CollectionsKt.toSet(arrayList2);
                        triggerBasedInvalidationTracker$createFlow$1$2$emit$1.L$0 = iArr2;
                        triggerBasedInvalidationTracker$createFlow$1$2$emit$1.label = 2;
                        if (flowCollector2.emit(set2, triggerBasedInvalidationTracker$createFlow$1$2$emit$1) != coroutine_suspended) {
                            anonymousClass3 = anonymousClass2;
                            iArr3 = iArr2;
                            boolean z2 = (T) iArr3;
                            anonymousClass2 = anonymousClass3;
                            r6 = z2;
                        }
                        r6 = iArr2;
                        return coroutine_suspended;
                    }
                    r6 = iArr2;
                    anonymousClass2.$currentVersions.element = (T) r6;
                    return Unit.INSTANCE;
                case 1:
                    anonymousClass4 = this;
                    int[] iArr7 = (int[]) triggerBasedInvalidationTracker$createFlow$1$2$emit$1.L$0;
                    ResultKt.throwOnFailure(obj);
                    iArr4 = iArr7;
                    boolean z3 = (T) iArr4;
                    anonymousClass2 = anonymousClass4;
                    r6 = z3;
                    r6 = iArr2;
                    anonymousClass2.$currentVersions.element = (T) r6;
                    return Unit.INSTANCE;
                case 2:
                    anonymousClass3 = this;
                    int[] iArr8 = (int[]) triggerBasedInvalidationTracker$createFlow$1$2$emit$1.L$0;
                    ResultKt.throwOnFailure(obj);
                    iArr3 = iArr8;
                    boolean z4 = (T) iArr3;
                    anonymousClass2 = anonymousClass3;
                    r6 = z4;
                    r6 = iArr2;
                    anonymousClass2.$currentVersions.element = (T) r6;
                    return Unit.INSTANCE;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
    }
}
