package androidx.room.util;

import androidx.room.RoomDatabase;
import androidx.room.TransactionScope;
import androidx.room.Transactor;
import androidx.savedstate.serialization.ClassDiscriminatorModeKt;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;

/* JADX INFO: Add missing generic type declarations: [R] */
/* JADX INFO: compiled from: DBUtil.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\n\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u0002H\u0001\"\u0004\b\u0000\u0010\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n¨\u0006\u0004"}, d2 = {"<anonymous>", "R", "transactor", "Landroidx/room/Transactor;", "androidx/room/util/DBUtil__DBUtilKt$internalPerform$2"}, k = 3, mv = {2, 1, 0}, xi = 48)
@DebugMetadata(c = "androidx.room.util.DBUtil__DBUtil_androidKt$performInTransactionSuspending$2$invokeSuspend$$inlined$internalPerform$1", f = "DBUtil.android.kt", i = {0, 0, 1, 1, 2, 3}, l = {56, 57, 59, 60, 172}, m = "invokeSuspend", n = {"transactor", ClassDiscriminatorModeKt.CLASS_DISCRIMINATOR_KEY, "transactor", ClassDiscriminatorModeKt.CLASS_DISCRIMINATOR_KEY, "transactor", "result"}, s = {"L$0", "L$1", "L$0", "L$1", "L$0", "L$0"})
public final class DBUtil__DBUtil_androidKt$performInTransactionSuspending$2$invokeSuspend$$inlined$internalPerform$1<R> extends SuspendLambda implements Function2<Transactor, Continuation<? super R>, Object> {
    final /* synthetic */ Function1 $block$inlined;
    final /* synthetic */ boolean $inTransaction;
    final /* synthetic */ boolean $isReadOnly;
    final /* synthetic */ RoomDatabase $this_internalPerform;
    /* synthetic */ Object L$0;
    Object L$1;
    int label;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public DBUtil__DBUtil_androidKt$performInTransactionSuspending$2$invokeSuspend$$inlined$internalPerform$1(boolean z, boolean z2, RoomDatabase roomDatabase, Continuation continuation, Function1 function1) {
        super(2, continuation);
        this.$inTransaction = z;
        this.$isReadOnly = z2;
        this.$this_internalPerform = roomDatabase;
        this.$block$inlined = function1;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        DBUtil__DBUtil_androidKt$performInTransactionSuspending$2$invokeSuspend$$inlined$internalPerform$1 dBUtil__DBUtil_androidKt$performInTransactionSuspending$2$invokeSuspend$$inlined$internalPerform$1 = new DBUtil__DBUtil_androidKt$performInTransactionSuspending$2$invokeSuspend$$inlined$internalPerform$1(this.$inTransaction, this.$isReadOnly, this.$this_internalPerform, continuation, this.$block$inlined);
        dBUtil__DBUtil_androidKt$performInTransactionSuspending$2$invokeSuspend$$inlined$internalPerform$1.L$0 = obj;
        return dBUtil__DBUtil_androidKt$performInTransactionSuspending$2$invokeSuspend$$inlined$internalPerform$1;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Transactor transactor, Continuation<? super R> continuation) {
        return ((DBUtil__DBUtil_androidKt$performInTransactionSuspending$2$invokeSuspend$$inlined$internalPerform$1) create(transactor, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX INFO: renamed from: androidx.room.util.DBUtil__DBUtil_androidKt$performInTransactionSuspending$2$invokeSuspend$$inlined$internalPerform$1$1, reason: invalid class name */
    /* JADX INFO: compiled from: DBUtil.kt */
    @Metadata(d1 = {"\u0000\n\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u0002H\u0001\"\u0004\b\u0000\u0010\u0001*\b\u0012\u0004\u0012\u0002H\u00010\u0002H\n¨\u0006\u0003"}, d2 = {"<anonymous>", "R", "Landroidx/room/TransactionScope;", "androidx/room/util/DBUtil__DBUtilKt$internalPerform$2$result$1"}, k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "androidx.room.util.DBUtil__DBUtil_androidKt$performInTransactionSuspending$2$invokeSuspend$$inlined$internalPerform$1$1", f = "DBUtil.android.kt", i = {}, l = {60}, m = "invokeSuspend", n = {}, s = {})
    public static final class AnonymousClass1 extends SuspendLambda implements Function2<TransactionScope<R>, Continuation<? super R>, Object> {
        final /* synthetic */ Function1 $block$inlined;
        private /* synthetic */ Object L$0;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AnonymousClass1(Continuation continuation, Function1 function1) {
            super(2, continuation);
            this.$block$inlined = function1;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            AnonymousClass1 anonymousClass1 = new AnonymousClass1(continuation, this.$block$inlined);
            anonymousClass1.L$0 = obj;
            return anonymousClass1;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(TransactionScope<R> transactionScope, Continuation<? super R> continuation) {
            return ((AnonymousClass1) create(transactionScope, continuation)).invokeSuspend(Unit.INSTANCE);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object $completion) throws Throwable {
            Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
            switch (this.label) {
                case 0:
                    ResultKt.throwOnFailure($completion);
                    Function1 function1 = this.$block$inlined;
                    this.label = 1;
                    Object objInvoke = function1.invoke(this);
                    if (objInvoke != coroutine_suspended) {
                        return objInvoke;
                    }
                    return coroutine_suspended;
                case 1:
                    ResultKt.throwOnFailure($completion);
                    return $completion;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
    }

    /* JADX WARN: Code duplicated, block: B:25:0x007e  */
    /* JADX WARN: Code duplicated, block: B:27:0x0094 A[RETURN] */
    /* JADX WARN: Code duplicated, block: B:28:0x0095  */
    /* JADX WARN: Code duplicated, block: B:30:0x009c  */
    /* JADX WARN: Code duplicated, block: B:33:0x00b8 A[RETURN] */
    /* JADX WARN: Code duplicated, block: B:34:0x00b9  */
    /* JADX WARN: Code duplicated, block: B:37:0x00c2  */
    /* JADX WARN: Code duplicated, block: B:39:0x00d0 A[RETURN] */
    /* JADX WARN: Code duplicated, block: B:40:0x00d1  */
    /* JADX WARN: Code duplicated, block: B:43:0x00db  */
    /* JADX WARN: Code duplicated, block: B:54:? A[RETURN, SYNTHETIC] */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object result) throws Throwable {
        Transactor transactor;
        Object objInvoke;
        Transactor.SQLiteTransactionType type;
        Transactor transactor2;
        Transactor.SQLiteTransactionType type2;
        Transactor transactor3;
        Object objWithTransaction;
        Transactor transactor4;
        Object objInTransaction;
        Object result2;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (this.label) {
            case 0:
                ResultKt.throwOnFailure(result);
                transactor = (Transactor) this.L$0;
                if (!this.$inTransaction) {
                    Function1 function1 = this.$block$inlined;
                    this.label = 5;
                    objInvoke = function1.invoke(this);
                    if (objInvoke == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    Object $result = objInvoke;
                    return $result;
                }
                type = this.$isReadOnly ? Transactor.SQLiteTransactionType.DEFERRED : Transactor.SQLiteTransactionType.IMMEDIATE;
                if (!this.$isReadOnly) {
                    this.L$0 = transactor;
                    this.L$1 = type;
                    this.label = 1;
                    Object objInTransaction2 = transactor.inTransaction(this);
                    if (objInTransaction2 == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    result = objInTransaction2;
                    transactor2 = transactor;
                    if (((Boolean) result).booleanValue()) {
                        result = result;
                        transactor = transactor2;
                    } else {
                        this.L$0 = transactor2;
                        this.L$1 = type;
                        this.label = 2;
                        if (this.$this_internalPerform.getInvalidationTracker().sync$room_runtime(this) == coroutine_suspended) {
                            return coroutine_suspended;
                        }
                        result = result;
                        type2 = type;
                        transactor3 = transactor2;
                        Transactor transactor5 = transactor3;
                        type = type2;
                        transactor = transactor5;
                    }
                }
                this.L$0 = transactor;
                this.L$1 = null;
                this.label = 3;
                objWithTransaction = transactor.withTransaction(type, new AnonymousClass1(null, this.$block$inlined), this);
                if (objWithTransaction == coroutine_suspended) {
                    return coroutine_suspended;
                }
                result = objWithTransaction;
                transactor4 = transactor;
                if (!this.$isReadOnly) {
                    return result;
                }
                this.L$0 = result;
                this.label = 4;
                objInTransaction = transactor4.inTransaction(this);
                if (objInTransaction == coroutine_suspended) {
                    return coroutine_suspended;
                }
                result2 = result;
                result = objInTransaction;
                if (!((Boolean) result).booleanValue()) {
                    this.$this_internalPerform.getInvalidationTracker().refreshAsync();
                }
                return result2;
            case 1:
                Transactor.SQLiteTransactionType type3 = (Transactor.SQLiteTransactionType) this.L$1;
                Transactor transactor6 = (Transactor) this.L$0;
                ResultKt.throwOnFailure(result);
                transactor2 = transactor6;
                type = type3;
                if (((Boolean) result).booleanValue()) {
                    this.L$0 = transactor2;
                    this.L$1 = type;
                    this.label = 2;
                    if (this.$this_internalPerform.getInvalidationTracker().sync$room_runtime(this) == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    result = result;
                    type2 = type;
                    transactor3 = transactor2;
                    Transactor transactor7 = transactor3;
                    type = type2;
                    transactor = transactor7;
                } else {
                    result = result;
                    transactor = transactor2;
                }
                this.L$0 = transactor;
                this.L$1 = null;
                this.label = 3;
                objWithTransaction = transactor.withTransaction(type, new AnonymousClass1(null, this.$block$inlined), this);
                if (objWithTransaction == coroutine_suspended) {
                    return coroutine_suspended;
                }
                result = objWithTransaction;
                transactor4 = transactor;
                if (!this.$isReadOnly) {
                    return result;
                }
                this.L$0 = result;
                this.label = 4;
                objInTransaction = transactor4.inTransaction(this);
                if (objInTransaction == coroutine_suspended) {
                    return coroutine_suspended;
                }
                result2 = result;
                result = objInTransaction;
                if (!((Boolean) result).booleanValue()) {
                    this.$this_internalPerform.getInvalidationTracker().refreshAsync();
                }
                return result2;
            case 2:
                type2 = (Transactor.SQLiteTransactionType) this.L$1;
                transactor3 = (Transactor) this.L$0;
                ResultKt.throwOnFailure(result);
                Transactor transactor8 = transactor3;
                type = type2;
                transactor = transactor8;
                this.L$0 = transactor;
                this.L$1 = null;
                this.label = 3;
                objWithTransaction = transactor.withTransaction(type, new AnonymousClass1(null, this.$block$inlined), this);
                if (objWithTransaction == coroutine_suspended) {
                    return coroutine_suspended;
                }
                result = objWithTransaction;
                transactor4 = transactor;
                if (!this.$isReadOnly) {
                    return result;
                }
                this.L$0 = result;
                this.label = 4;
                objInTransaction = transactor4.inTransaction(this);
                if (objInTransaction == coroutine_suspended) {
                    return coroutine_suspended;
                }
                result2 = result;
                result = objInTransaction;
                if (!((Boolean) result).booleanValue()) {
                    this.$this_internalPerform.getInvalidationTracker().refreshAsync();
                }
                return result2;
            case 3:
                Transactor transactor9 = (Transactor) this.L$0;
                ResultKt.throwOnFailure(result);
                transactor4 = transactor9;
                if (!this.$isReadOnly) {
                    return result;
                }
                this.L$0 = result;
                this.label = 4;
                objInTransaction = transactor4.inTransaction(this);
                if (objInTransaction == coroutine_suspended) {
                    return coroutine_suspended;
                }
                result2 = result;
                result = objInTransaction;
                if (!((Boolean) result).booleanValue()) {
                    this.$this_internalPerform.getInvalidationTracker().refreshAsync();
                }
                return result2;
            case 4:
                result2 = this.L$0;
                ResultKt.throwOnFailure(result);
                if (!((Boolean) result).booleanValue()) {
                    this.$this_internalPerform.getInvalidationTracker().refreshAsync();
                }
                return result2;
            case 5:
                ResultKt.throwOnFailure(result);
                objInvoke = result;
                Object $result2 = objInvoke;
                return $result2;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }
}
