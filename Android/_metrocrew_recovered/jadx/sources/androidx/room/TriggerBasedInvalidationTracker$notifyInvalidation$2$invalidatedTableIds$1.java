package androidx.room;

import android.database.SQLException;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import java.util.Set;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.SetsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* JADX INFO: compiled from: InvalidationTracker.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0010\n\u0000\n\u0002\u0010\"\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u0004H\n"}, d2 = {"<anonymous>", "", "", "connection", "Landroidx/room/Transactor;"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "androidx.room.TriggerBasedInvalidationTracker$notifyInvalidation$2$invalidatedTableIds$1", f = "InvalidationTracker.kt", i = {0}, l = {417, TypedValues.CycleType.TYPE_WAVE_OFFSET}, m = "invokeSuspend", n = {"connection"}, s = {"L$0"})
final class TriggerBasedInvalidationTracker$notifyInvalidation$2$invalidatedTableIds$1 extends SuspendLambda implements Function2<Transactor, Continuation<? super Set<? extends Integer>>, Object> {
    /* synthetic */ Object L$0;
    int label;
    final /* synthetic */ TriggerBasedInvalidationTracker this$0;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    TriggerBasedInvalidationTracker$notifyInvalidation$2$invalidatedTableIds$1(TriggerBasedInvalidationTracker triggerBasedInvalidationTracker, Continuation<? super TriggerBasedInvalidationTracker$notifyInvalidation$2$invalidatedTableIds$1> continuation) {
        super(2, continuation);
        this.this$0 = triggerBasedInvalidationTracker;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        TriggerBasedInvalidationTracker$notifyInvalidation$2$invalidatedTableIds$1 triggerBasedInvalidationTracker$notifyInvalidation$2$invalidatedTableIds$1 = new TriggerBasedInvalidationTracker$notifyInvalidation$2$invalidatedTableIds$1(this.this$0, continuation);
        triggerBasedInvalidationTracker$notifyInvalidation$2$invalidatedTableIds$1.L$0 = obj;
        return triggerBasedInvalidationTracker$notifyInvalidation$2$invalidatedTableIds$1;
    }

    /* JADX INFO: renamed from: invoke, reason: avoid collision after fix types in other method */
    public final Object invoke2(Transactor transactor, Continuation<? super Set<Integer>> continuation) {
        return ((TriggerBasedInvalidationTracker$notifyInvalidation$2$invalidatedTableIds$1) create(transactor, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    @Override // kotlin.jvm.functions.Function2
    public /* bridge */ /* synthetic */ Object invoke(Transactor transactor, Continuation<? super Set<? extends Integer>> continuation) {
        return invoke2(transactor, (Continuation<? super Set<Integer>>) continuation);
    }

    /* JADX WARN: Code duplicated, block: B:17:0x0044  */
    /* JADX WARN: Code duplicated, block: B:22:0x0064 A[RETURN] */
    /* JADX WARN: Code duplicated, block: B:31:0x004a A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object $result) throws Throwable {
        Transactor connection;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
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
                $result = objInTransaction;
                connection = connection2;
                if (((Boolean) $result).booleanValue()) {
                    return SetsKt.emptySet();
                }
                try {
                    this.L$0 = null;
                    this.label = 2;
                    $result = connection.withTransaction(Transactor.SQLiteTransactionType.IMMEDIATE, new AnonymousClass1(this.this$0, null), this);
                    if ($result == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    return (Set) $result;
                } catch (SQLException e) {
                    $result = $result;
                    return SetsKt.emptySet();
                }
            case 1:
                Transactor connection3 = (Transactor) this.L$0;
                ResultKt.throwOnFailure($result);
                connection = connection3;
                if (((Boolean) $result).booleanValue()) {
                    return SetsKt.emptySet();
                }
                this.L$0 = null;
                this.label = 2;
                $result = connection.withTransaction(Transactor.SQLiteTransactionType.IMMEDIATE, new AnonymousClass1(this.this$0, null), this);
                if ($result == coroutine_suspended) {
                    return coroutine_suspended;
                }
                return (Set) $result;
            case 2:
                try {
                    ResultKt.throwOnFailure($result);
                    $result = $result;
                    return (Set) $result;
                } catch (SQLException e2) {
                    return SetsKt.emptySet();
                }
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    /* JADX INFO: renamed from: androidx.room.TriggerBasedInvalidationTracker$notifyInvalidation$2$invalidatedTableIds$1$1, reason: invalid class name */
    /* JADX INFO: compiled from: InvalidationTracker.kt */
    @Metadata(d1 = {"\u0000\u000e\n\u0000\n\u0002\u0010\"\n\u0002\u0010\b\n\u0002\u0018\u0002\u0010\u0000\u001a\b\u0012\u0004\u0012\u00020\u00020\u0001*\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00020\u00010\u0003H\n"}, d2 = {"<anonymous>", "", "", "Landroidx/room/TransactionScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "androidx.room.TriggerBasedInvalidationTracker$notifyInvalidation$2$invalidatedTableIds$1$1", f = "InvalidationTracker.kt", i = {}, l = {TypedValues.CycleType.TYPE_WAVE_PHASE}, m = "invokeSuspend", n = {}, s = {})
    static final class AnonymousClass1 extends SuspendLambda implements Function2<TransactionScope<Set<? extends Integer>>, Continuation<? super Set<? extends Integer>>, Object> {
        private /* synthetic */ Object L$0;
        int label;
        final /* synthetic */ TriggerBasedInvalidationTracker this$0;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        AnonymousClass1(TriggerBasedInvalidationTracker triggerBasedInvalidationTracker, Continuation<? super AnonymousClass1> continuation) {
            super(2, continuation);
            this.this$0 = triggerBasedInvalidationTracker;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            AnonymousClass1 anonymousClass1 = new AnonymousClass1(this.this$0, continuation);
            anonymousClass1.L$0 = obj;
            return anonymousClass1;
        }

        /* JADX INFO: renamed from: invoke, reason: avoid collision after fix types in other method */
        public final Object invoke2(TransactionScope<Set<Integer>> transactionScope, Continuation<? super Set<Integer>> continuation) {
            return ((AnonymousClass1) create(transactionScope, continuation)).invokeSuspend(Unit.INSTANCE);
        }

        @Override // kotlin.jvm.functions.Function2
        public /* bridge */ /* synthetic */ Object invoke(TransactionScope<Set<? extends Integer>> transactionScope, Continuation<? super Set<? extends Integer>> continuation) {
            return invoke2((TransactionScope<Set<Integer>>) transactionScope, (Continuation<? super Set<Integer>>) continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object $result) throws Throwable {
            Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
            switch (this.label) {
                case 0:
                    ResultKt.throwOnFailure($result);
                    TransactionScope $this$withTransaction = (TransactionScope) this.L$0;
                    this.label = 1;
                    Object objCheckInvalidatedTables = this.this$0.checkInvalidatedTables($this$withTransaction, this);
                    if (objCheckInvalidatedTables == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    return objCheckInvalidatedTables;
                case 1:
                    ResultKt.throwOnFailure($result);
                    return $result;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
    }
}
