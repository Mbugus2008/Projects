package androidx.room;

import java.util.concurrent.locks.ReentrantLock;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* JADX INFO: compiled from: InvalidationTracker.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n"}, d2 = {"<anonymous>", "", "connection", "Landroidx/room/Transactor;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "androidx.room.TriggerBasedInvalidationTracker$syncTriggers$2$1", f = "InvalidationTracker.kt", i = {0, 1}, l = {306, 313}, m = "invokeSuspend", n = {"connection", "$this$withLock$iv$iv"}, s = {"L$0", "L$0"})
final class TriggerBasedInvalidationTracker$syncTriggers$2$1 extends SuspendLambda implements Function2<Transactor, Continuation<? super Unit>, Object> {
    /* synthetic */ Object L$0;
    int label;
    final /* synthetic */ TriggerBasedInvalidationTracker this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    TriggerBasedInvalidationTracker$syncTriggers$2$1(TriggerBasedInvalidationTracker triggerBasedInvalidationTracker, Continuation<? super TriggerBasedInvalidationTracker$syncTriggers$2$1> continuation) {
        super(2, continuation);
        this.this$0 = triggerBasedInvalidationTracker;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        TriggerBasedInvalidationTracker$syncTriggers$2$1 triggerBasedInvalidationTracker$syncTriggers$2$1 = new TriggerBasedInvalidationTracker$syncTriggers$2$1(this.this$0, continuation);
        triggerBasedInvalidationTracker$syncTriggers$2$1.L$0 = obj;
        return triggerBasedInvalidationTracker$syncTriggers$2$1;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Transactor transactor, Continuation<? super Unit> continuation) {
        return ((TriggerBasedInvalidationTracker$syncTriggers$2$1) create(transactor, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Code duplicated, block: B:18:0x0057  */
    /* JADX WARN: Code duplicated, block: B:20:0x005a  */
    /* JADX WARN: Code duplicated, block: B:23:0x0074  */
    /* JADX WARN: Code duplicated, block: B:24:0x0079  */
    /* JADX WARN: Code duplicated, block: B:27:0x0088 A[Catch: all -> 0x00fe, TryCatch #2 {all -> 0x00fe, blocks: (B:25:0x007a, B:27:0x0088, B:31:0x0099, B:33:0x00a5, B:37:0x00b1, B:39:0x00b5, B:42:0x00c2, B:40:0x00b8, B:41:0x00bb, B:45:0x00ce), top: B:66:0x007a }] */
    /* JADX WARN: Code duplicated, block: B:29:0x0094  */
    /* JADX WARN: Code duplicated, block: B:30:0x0097  */
    /* JADX WARN: Code duplicated, block: B:33:0x00a5 A[Catch: all -> 0x00fe, TryCatch #2 {all -> 0x00fe, blocks: (B:25:0x007a, B:27:0x0088, B:31:0x0099, B:33:0x00a5, B:37:0x00b1, B:39:0x00b5, B:42:0x00c2, B:40:0x00b8, B:41:0x00bb, B:45:0x00ce), top: B:66:0x007a }] */
    /* JADX WARN: Code duplicated, block: B:35:0x00ac  */
    /* JADX WARN: Code duplicated, block: B:36:0x00af  */
    /* JADX WARN: Code duplicated, block: B:39:0x00b5 A[Catch: all -> 0x00fe, TryCatch #2 {all -> 0x00fe, blocks: (B:25:0x007a, B:27:0x0088, B:31:0x0099, B:33:0x00a5, B:37:0x00b1, B:39:0x00b5, B:42:0x00c2, B:40:0x00b8, B:41:0x00bb, B:45:0x00ce), top: B:66:0x007a }] */
    /* JADX WARN: Code duplicated, block: B:40:0x00b8 A[Catch: all -> 0x00fe, TryCatch #2 {all -> 0x00fe, blocks: (B:25:0x007a, B:27:0x0088, B:31:0x0099, B:33:0x00a5, B:37:0x00b1, B:39:0x00b5, B:42:0x00c2, B:40:0x00b8, B:41:0x00bb, B:45:0x00ce), top: B:66:0x007a }] */
    /* JADX WARN: Code duplicated, block: B:41:0x00bb A[Catch: all -> 0x00fe, TryCatch #2 {all -> 0x00fe, blocks: (B:25:0x007a, B:27:0x0088, B:31:0x0099, B:33:0x00a5, B:37:0x00b1, B:39:0x00b5, B:42:0x00c2, B:40:0x00b8, B:41:0x00bb, B:45:0x00ce), top: B:66:0x007a }] */
    /* JADX WARN: Code duplicated, block: B:45:0x00ce A[Catch: all -> 0x00fe, TRY_LEAVE, TryCatch #2 {all -> 0x00fe, blocks: (B:25:0x007a, B:27:0x0088, B:31:0x0099, B:33:0x00a5, B:37:0x00b1, B:39:0x00b5, B:42:0x00c2, B:40:0x00b8, B:41:0x00bb, B:45:0x00ce), top: B:66:0x007a }] */
    /* JADX WARN: Code duplicated, block: B:47:0x00e4 A[RETURN] */
    /* JADX WARN: Code duplicated, block: B:48:0x00e5  */
    /* JADX WARN: Code duplicated, block: B:50:0x00ed  */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) throws Throwable {
        Object $result2;
        Object $result3;
        Transactor connection;
        ObservedTableStates this_$iv;
        TriggerBasedInvalidationTracker triggerBasedInvalidationTracker;
        ReentrantLock $this$withLock$iv$iv;
        ReentrantLock $this$withLock$iv$iv2;
        boolean z;
        boolean addOrRemove$iv;
        int length;
        ObservedTableStates.ObserveOp[] tablesToSync;
        int i;
        Object $result4;
        Transactor.SQLiteTransactionType sQLiteTransactionType;
        TriggerBasedInvalidationTracker$syncTriggers$2$1$1$1 triggerBasedInvalidationTracker$syncTriggers$2$1$1$1;
        int i2;
        boolean z2;
        boolean newState$iv;
        ObservedTableStates.ObserveOp observeOp;
        boolean addOrRemove$iv2;
        boolean z3;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        boolean addOrRemove$iv3 = true;
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                Transactor connection2 = (Transactor) this.L$0;
                this.L$0 = connection2;
                this.label = 1;
                Object objInTransaction = connection2.inTransaction(this);
                if (objInTransaction == coroutine_suspended) {
                    return coroutine_suspended;
                }
                $result2 = $result;
                $result3 = objInTransaction;
                connection = connection2;
                if (((Boolean) $result3).booleanValue()) {
                    return Unit.INSTANCE;
                }
                this_$iv = this.this$0.observedTableStates;
                triggerBasedInvalidationTracker = this.this$0;
                $this$withLock$iv$iv = this_$iv.lock;
                $this$withLock$iv$iv.lock();
                try {
                    if (this_$iv.needsSync) {
                        z = false;
                        try {
                            this_$iv.needsSync = false;
                            addOrRemove$iv = false;
                            length = this_$iv.tableObserversCount.length;
                            tablesToSync = new ObservedTableStates.ObserveOp[length];
                            i = 0;
                            while (i < length) {
                                if (this_$iv.tableObserversCount[i] > 0) {
                                    z2 = addOrRemove$iv3;
                                } else {
                                    z2 = z;
                                }
                                newState$iv = z2;
                                if (newState$iv != this_$iv.tableObservedState[i]) {
                                    addOrRemove$iv2 = true;
                                    boolean[] zArr = this_$iv.tableObservedState;
                                    if (newState$iv) {
                                        z3 = true;
                                    } else {
                                        z3 = false;
                                    }
                                    zArr[i] = z3;
                                    if (newState$iv) {
                                        observeOp = ObservedTableStates.ObserveOp.ADD;
                                    } else {
                                        observeOp = ObservedTableStates.ObserveOp.REMOVE;
                                    }
                                } else {
                                    boolean z4 = addOrRemove$iv;
                                    observeOp = ObservedTableStates.ObserveOp.NO_OP;
                                    addOrRemove$iv2 = z4;
                                }
                                tablesToSync[i] = observeOp;
                                i++;
                                addOrRemove$iv = addOrRemove$iv2;
                                addOrRemove$iv3 = true;
                                z = false;
                            }
                            if (addOrRemove$iv) {
                                sQLiteTransactionType = Transactor.SQLiteTransactionType.IMMEDIATE;
                                triggerBasedInvalidationTracker$syncTriggers$2$1$1$1 = new TriggerBasedInvalidationTracker$syncTriggers$2$1$1$1(tablesToSync, triggerBasedInvalidationTracker, connection, null);
                                this.L$0 = $this$withLock$iv$iv;
                                this.label = 2;
                                if (connection.withTransaction(sQLiteTransactionType, triggerBasedInvalidationTracker$syncTriggers$2$1$1$1, this) == coroutine_suspended) {
                                    return coroutine_suspended;
                                }
                                $result4 = $result2;
                                $this$withLock$iv$iv2 = $this$withLock$iv$iv;
                                i2 = 0;
                            } else {
                                $result4 = $result2;
                                $this$withLock$iv$iv2 = $this$withLock$iv$iv;
                            }
                            Unit unit = Unit.INSTANCE;
                            $this$withLock$iv$iv2.unlock();
                        } catch (Throwable th) {
                            th = th;
                            $this$withLock$iv$iv2 = $this$withLock$iv$iv;
                            $this$withLock$iv$iv2.unlock();
                            throw th;
                        }
                    } else {
                        $this$withLock$iv$iv.unlock();
                    }
                    return Unit.INSTANCE;
                } catch (Throwable th2) {
                    th = th2;
                    $this$withLock$iv$iv2 = $this$withLock$iv$iv;
                }
                break;
            case 1:
                $result3 = $result;
                Transactor connection3 = (Transactor) this.L$0;
                ResultKt.throwOnFailure($result3);
                connection = connection3;
                $result2 = $result3;
                if (((Boolean) $result3).booleanValue()) {
                    return Unit.INSTANCE;
                }
                this_$iv = this.this$0.observedTableStates;
                triggerBasedInvalidationTracker = this.this$0;
                $this$withLock$iv$iv = this_$iv.lock;
                $this$withLock$iv$iv.lock();
                if (this_$iv.needsSync) {
                    $this$withLock$iv$iv.unlock();
                } else {
                    z = false;
                    this_$iv.needsSync = false;
                    addOrRemove$iv = false;
                    length = this_$iv.tableObserversCount.length;
                    tablesToSync = new ObservedTableStates.ObserveOp[length];
                    i = 0;
                    while (i < length) {
                        if (this_$iv.tableObserversCount[i] > 0) {
                            z2 = addOrRemove$iv3;
                        } else {
                            z2 = z;
                        }
                        newState$iv = z2;
                        if (newState$iv != this_$iv.tableObservedState[i]) {
                            addOrRemove$iv2 = true;
                            boolean[] zArr2 = this_$iv.tableObservedState;
                            if (newState$iv) {
                                z3 = true;
                            } else {
                                z3 = false;
                            }
                            zArr2[i] = z3;
                            if (newState$iv) {
                                observeOp = ObservedTableStates.ObserveOp.ADD;
                            } else {
                                observeOp = ObservedTableStates.ObserveOp.REMOVE;
                            }
                        } else {
                            boolean z5 = addOrRemove$iv;
                            observeOp = ObservedTableStates.ObserveOp.NO_OP;
                            addOrRemove$iv2 = z5;
                        }
                        tablesToSync[i] = observeOp;
                        i++;
                        addOrRemove$iv = addOrRemove$iv2;
                        addOrRemove$iv3 = true;
                        z = false;
                    }
                    if (addOrRemove$iv) {
                        sQLiteTransactionType = Transactor.SQLiteTransactionType.IMMEDIATE;
                        triggerBasedInvalidationTracker$syncTriggers$2$1$1$1 = new TriggerBasedInvalidationTracker$syncTriggers$2$1$1$1(tablesToSync, triggerBasedInvalidationTracker, connection, null);
                        this.L$0 = $this$withLock$iv$iv;
                        this.label = 2;
                        if (connection.withTransaction(sQLiteTransactionType, triggerBasedInvalidationTracker$syncTriggers$2$1$1$1, this) == coroutine_suspended) {
                            return coroutine_suspended;
                        }
                        $result4 = $result2;
                        $this$withLock$iv$iv2 = $this$withLock$iv$iv;
                        i2 = 0;
                    } else {
                        $result4 = $result2;
                        $this$withLock$iv$iv2 = $this$withLock$iv$iv;
                    }
                    Unit unit2 = Unit.INSTANCE;
                    $this$withLock$iv$iv2.unlock();
                }
                return Unit.INSTANCE;
            case 2:
                $result4 = $result;
                i2 = 0;
                $this$withLock$iv$iv2 = (ReentrantLock) this.L$0;
                try {
                    ResultKt.throwOnFailure($result4);
                    Unit unit3 = Unit.INSTANCE;
                    $this$withLock$iv$iv2.unlock();
                    return Unit.INSTANCE;
                } catch (Throwable th3) {
                    th = th3;
                    $this$withLock$iv$iv2.unlock();
                    throw th;
                }
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }
}
