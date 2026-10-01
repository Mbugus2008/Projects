package androidx.room.coroutines;

import android.database.SQLException;
import androidx.room.TransactionScope;
import androidx.room.Transactor;
import androidx.room.concurrent.ThreadLocal_jvmAndroidKt;
import androidx.savedstate.serialization.ClassDiscriminatorModeKt;
import androidx.sqlite.SQLite;
import androidx.sqlite.SQLiteConnection;
import androidx.sqlite.SQLiteStatement;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.ExceptionsKt;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.ArrayDeque;
import kotlin.collections.CollectionsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.Boxing;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jdk7.AutoCloseableKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.sync.Mutex;

/* JADX INFO: compiled from: ConnectionPoolImpl.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000~\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0002\u0018\u00002\u00020\u00012\u00020\u0002:\u0003:;<B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b¢\u0006\u0004\b\t\u0010\nJ0\u0010\u001c\u001a\u0002H\u001d\"\u0004\b\u0000\u0010\u001d2\u0006\u0010\u001e\u001a\u00020\u001f2\u0012\u0010 \u001a\u000e\u0012\u0004\u0012\u00020\"\u0012\u0004\u0012\u0002H\u001d0!H\u0096@¢\u0006\u0002\u0010#JK\u0010$\u001a\u0002H\u001d\"\u0004\b\u0000\u0010\u001d2\u0006\u0010%\u001a\u00020&2-\u0010 \u001a)\b\u0001\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u001d0(\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u001d0)\u0012\u0006\u0012\u0004\u0018\u00010*0'¢\u0006\u0002\b+H\u0096@¢\u0006\u0002\u0010,J\u000e\u0010-\u001a\u00020\bH\u0096@¢\u0006\u0002\u0010.J\u0006\u0010/\u001a\u000200JM\u00101\u001a\u0002H\u001d\"\u0004\b\u0000\u0010\u001d2\b\u0010%\u001a\u0004\u0018\u00010&2-\u0010 \u001a)\b\u0001\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u001d0(\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u001d0)\u0012\u0006\u0012\u0004\u0018\u00010*0'¢\u0006\u0002\b+H\u0082@¢\u0006\u0002\u0010,J\u0016\u00102\u001a\u0002002\u0006\u0010%\u001a\u00020&H\u0082@¢\u0006\u0002\u00103J\u0016\u00104\u001a\u0002002\u0006\u00105\u001a\u00020\bH\u0082@¢\u0006\u0002\u00106J\"\u00107\u001a\u0002H\u001d\"\u0004\b\u0000\u0010\u001d2\f\u0010 \u001a\b\u0012\u0004\u0012\u0002H\u001d08H\u0082H¢\u0006\u0002\u00109R\u0011\u0010\u0003\u001a\u00020\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0007\u001a\u00020\b¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\u000fR\u0014\u0010\u0010\u001a\b\u0012\u0004\u0012\u00020\u00120\u0011X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0013\u001a\u00060\u0014j\u0002`\u0015X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0016R\u0014\u0010\u0017\u001a\u00020\b8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u0017\u0010\u000fR\u0014\u0010\u0018\u001a\u00020\u00198VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u001a\u0010\u001b¨\u0006="}, d2 = {"Landroidx/room/coroutines/PooledConnectionImpl;", "Landroidx/room/Transactor;", "Landroidx/room/coroutines/RawConnectionAccessor;", "connectionElementKey", "Landroidx/room/coroutines/ConnectionElementKey;", "delegate", "Landroidx/room/coroutines/ConnectionWithLock;", "isReadOnly", "", "<init>", "(Landroidx/room/coroutines/ConnectionElementKey;Landroidx/room/coroutines/ConnectionWithLock;Z)V", "getConnectionElementKey", "()Landroidx/room/coroutines/ConnectionElementKey;", "getDelegate", "()Landroidx/room/coroutines/ConnectionWithLock;", "()Z", "transactionStack", "Lkotlin/collections/ArrayDeque;", "Landroidx/room/coroutines/PooledConnectionImpl$TransactionItem;", "_isRecycled", "Ljava/util/concurrent/atomic/AtomicBoolean;", "Landroidx/room/concurrent/AtomicBoolean;", "Ljava/util/concurrent/atomic/AtomicBoolean;", "isRecycled", "rawConnection", "Landroidx/sqlite/SQLiteConnection;", "getRawConnection", "()Landroidx/sqlite/SQLiteConnection;", "usePrepared", "R", "sql", "", "block", "Lkotlin/Function1;", "Landroidx/sqlite/SQLiteStatement;", "(Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "withTransaction", ClassDiscriminatorModeKt.CLASS_DISCRIMINATOR_KEY, "Landroidx/room/Transactor$SQLiteTransactionType;", "Lkotlin/Function2;", "Landroidx/room/TransactionScope;", "Lkotlin/coroutines/Continuation;", "", "Lkotlin/ExtensionFunctionType;", "(Landroidx/room/Transactor$SQLiteTransactionType;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "inTransaction", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "markRecycled", "", "transaction", "beginTransaction", "(Landroidx/room/Transactor$SQLiteTransactionType;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "endTransaction", "success", "(ZLkotlin/coroutines/Continuation;)Ljava/lang/Object;", "withStateCheck", "Lkotlin/Function0;", "(Lkotlin/jvm/functions/Function0;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "TransactionItem", "TransactionImpl", "StatementWrapper", "room-runtime"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class PooledConnectionImpl implements Transactor, RawConnectionAccessor {
    private final AtomicBoolean _isRecycled;
    private final ConnectionElementKey connectionElementKey;
    private final ConnectionWithLock delegate;
    private final boolean isReadOnly;
    private final ArrayDeque<TransactionItem> transactionStack;

    /* JADX INFO: compiled from: ConnectionPoolImpl.kt */
    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public static final /* synthetic */ class WhenMappings {
        public static final /* synthetic */ int[] $EnumSwitchMapping$0;

        static {
            int[] iArr = new int[Transactor.SQLiteTransactionType.values().length];
            try {
                iArr[Transactor.SQLiteTransactionType.DEFERRED.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                iArr[Transactor.SQLiteTransactionType.IMMEDIATE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                iArr[Transactor.SQLiteTransactionType.EXCLUSIVE.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            $EnumSwitchMapping$0 = iArr;
        }
    }

    /* JADX INFO: renamed from: androidx.room.coroutines.PooledConnectionImpl$beginTransaction$1, reason: invalid class name */
    /* JADX INFO: compiled from: ConnectionPoolImpl.kt */
    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "androidx.room.coroutines.PooledConnectionImpl", f = "ConnectionPoolImpl.kt", i = {0, 0}, l = {557}, m = "beginTransaction", n = {ClassDiscriminatorModeKt.CLASS_DISCRIMINATOR_KEY, "$this$withLock_u24default$iv"}, s = {"L$0", "L$1"})
    static final class AnonymousClass1 extends ContinuationImpl {
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return PooledConnectionImpl.this.beginTransaction(null, this);
        }
    }

    /* JADX INFO: renamed from: androidx.room.coroutines.PooledConnectionImpl$endTransaction$1, reason: invalid class name and case insensitive filesystem */
    /* JADX INFO: compiled from: ConnectionPoolImpl.kt */
    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "androidx.room.coroutines.PooledConnectionImpl", f = "ConnectionPoolImpl.kt", i = {0, 0}, l = {557}, m = "endTransaction", n = {"$this$withLock_u24default$iv", "success"}, s = {"L$0", "Z$0"})
    static final class C00551 extends ContinuationImpl {
        Object L$0;
        boolean Z$0;
        int label;
        /* synthetic */ Object result;

        C00551(Continuation<? super C00551> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return PooledConnectionImpl.this.endTransaction(false, this);
        }
    }

    /* JADX INFO: renamed from: androidx.room.coroutines.PooledConnectionImpl$transaction$1, reason: invalid class name and case insensitive filesystem */
    /* JADX INFO: compiled from: ConnectionPoolImpl.kt */
    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "androidx.room.coroutines.PooledConnectionImpl", f = "ConnectionPoolImpl.kt", i = {0, 1, 4}, l = {392, 396, 410, 410, 410}, m = "transaction", n = {"block", "success", "exception"}, s = {"L$0", "I$0", "L$0"})
    static final class C00561<R> extends ContinuationImpl {
        int I$0;
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        C00561(Continuation<? super C00561> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return PooledConnectionImpl.this.transaction(null, null, this);
        }
    }

    /* JADX INFO: renamed from: androidx.room.coroutines.PooledConnectionImpl$usePrepared$1, reason: invalid class name and case insensitive filesystem */
    /* JADX INFO: compiled from: ConnectionPoolImpl.kt */
    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "androidx.room.coroutines.PooledConnectionImpl", f = "ConnectionPoolImpl.kt", i = {0, 0, 0}, l = {568}, m = "usePrepared", n = {"sql", "block", "$this$withLock_u24default$iv"}, s = {"L$0", "L$1", "L$2"})
    static final class C00571<R> extends ContinuationImpl {
        Object L$0;
        Object L$1;
        Object L$2;
        int label;
        /* synthetic */ Object result;

        C00571(Continuation<? super C00571> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return PooledConnectionImpl.this.usePrepared(null, null, this);
        }
    }

    public PooledConnectionImpl(ConnectionElementKey connectionElementKey, ConnectionWithLock delegate, boolean isReadOnly) {
        Intrinsics.checkNotNullParameter(connectionElementKey, "connectionElementKey");
        Intrinsics.checkNotNullParameter(delegate, "delegate");
        this.connectionElementKey = connectionElementKey;
        this.delegate = delegate;
        this.isReadOnly = isReadOnly;
        this.transactionStack = new ArrayDeque<>();
        this._isRecycled = new AtomicBoolean(false);
    }

    public final ConnectionElementKey getConnectionElementKey() {
        return this.connectionElementKey;
    }

    public final ConnectionWithLock getDelegate() {
        return this.delegate;
    }

    /* JADX INFO: renamed from: isReadOnly, reason: from getter */
    public final boolean getIsReadOnly() {
        return this.isReadOnly;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final boolean isRecycled() {
        return this._isRecycled.get();
    }

    @Override // androidx.room.coroutines.RawConnectionAccessor
    public SQLiteConnection getRawConnection() {
        return this.delegate;
    }

    /* JADX WARN: Code duplicated, block: B:7:0x0014  */
    @Override // androidx.room.PooledConnection
    public <R> Object usePrepared(String str, Function1<? super SQLiteStatement, ? extends R> function1, Continuation<? super R> continuation) throws Throwable {
        C00571 c00571;
        Function1<? super SQLiteStatement, ? extends R> function2;
        String sql;
        ConnectionWithLock $this$withLock_u24default$iv;
        PooledConnectionImpl pooledConnectionImpl;
        Object owner$iv;
        if (continuation instanceof C00571) {
            c00571 = (C00571) continuation;
            if ((c00571.label & Integer.MIN_VALUE) != 0) {
                c00571.label -= Integer.MIN_VALUE;
            } else {
                c00571 = new C00571(continuation);
            }
        } else {
            c00571 = new C00571(continuation);
        }
        Object $result = c00571.result;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (c00571.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                function2 = function1;
                sql = str;
                if (!isRecycled()) {
                    ConnectionElement connectionElement$iv = (ConnectionElement) c00571.getContext().get(getConnectionElementKey());
                    if (connectionElement$iv != null && connectionElement$iv.getConnectionWrapper() == this) {
                        $this$withLock_u24default$iv = this.delegate;
                        Continuation $completion$iv = c00571;
                        c00571.L$0 = sql;
                        c00571.L$1 = function2;
                        c00571.L$2 = $this$withLock_u24default$iv;
                        c00571.label = 1;
                        if ($this$withLock_u24default$iv.lock(null, $completion$iv) == coroutine_suspended) {
                            return coroutine_suspended;
                        }
                        pooledConnectionImpl = this;
                        owner$iv = null;
                    } else {
                        SQLite.throwSQLiteException(21, "Attempted to use connection on a different coroutine");
                        throw new KotlinNothingValueException();
                    }
                } else {
                    SQLite.throwSQLiteException(21, "Connection is recycled");
                    throw new KotlinNothingValueException();
                }
                break;
            case 1:
                pooledConnectionImpl = this;
                owner$iv = null;
                $this$withLock_u24default$iv = (Mutex) c00571.L$2;
                function2 = (Function1) c00571.L$1;
                sql = (String) c00571.L$0;
                ResultKt.throwOnFailure($result);
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        try {
            StatementWrapper statementWrapper = new StatementWrapper(pooledConnectionImpl, pooledConnectionImpl.delegate.prepare(sql));
            try {
                StatementWrapper it = statementWrapper;
                R rInvoke = function2.invoke(it);
                AutoCloseableKt.closeFinally(statementWrapper, null);
                $this$withLock_u24default$iv.unlock(owner$iv);
                return rInvoke;
            } catch (Throwable th) {
                try {
                    throw th;
                } catch (Throwable th2) {
                    AutoCloseableKt.closeFinally(statementWrapper, th);
                    throw th2;
                }
            }
        } catch (Throwable th3) {
            $this$withLock_u24default$iv.unlock(owner$iv);
            throw th3;
        }
    }

    @Override // androidx.room.Transactor
    public <R> Object withTransaction(Transactor.SQLiteTransactionType type, Function2<? super TransactionScope<R>, ? super Continuation<? super R>, ? extends Object> function2, Continuation<? super R> continuation) {
        if (!isRecycled()) {
            ConnectionElement connectionElement$iv = (ConnectionElement) continuation.getContext().get(getConnectionElementKey());
            if (connectionElement$iv != null && connectionElement$iv.getConnectionWrapper() == this) {
                return transaction(type, function2, continuation);
            }
            SQLite.throwSQLiteException(21, "Attempted to use connection on a different coroutine");
            throw new KotlinNothingValueException();
        }
        SQLite.throwSQLiteException(21, "Connection is recycled");
        throw new KotlinNothingValueException();
    }

    @Override // androidx.room.Transactor
    public Object inTransaction(Continuation<? super Boolean> continuation) {
        if (!isRecycled()) {
            ConnectionElement connectionElement$iv = (ConnectionElement) continuation.getContext().get(getConnectionElementKey());
            if (connectionElement$iv != null && connectionElement$iv.getConnectionWrapper() == this) {
                return Boxing.boxBoolean(!this.transactionStack.isEmpty() || this.delegate.inTransaction());
            }
            SQLite.throwSQLiteException(21, "Attempted to use connection on a different coroutine");
            throw new KotlinNothingValueException();
        }
        SQLite.throwSQLiteException(21, "Connection is recycled");
        throw new KotlinNothingValueException();
    }

    public final void markRecycled() {
        if (this._isRecycled.compareAndSet(false, true) && this.delegate.inTransaction()) {
            SQLite.execSQL(this.delegate, "ROLLBACK TRANSACTION");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code duplicated, block: B:43:0x0098 A[RETURN] */
    /* JADX WARN: Code duplicated, block: B:44:0x0099  */
    /* JADX WARN: Code duplicated, block: B:47:0x009f  */
    /* JADX WARN: Code duplicated, block: B:50:0x00ac A[RETURN] */
    /* JADX WARN: Code duplicated, block: B:51:0x00ad  */
    /* JADX WARN: Code duplicated, block: B:63:0x00bd A[Catch: all -> 0x00dd, TRY_LEAVE, TryCatch #6 {all -> 0x00dd, blocks: (B:61:0x00b9, B:63:0x00bd, B:75:0x00dc), top: B:103:0x00b9 }] */
    /* JADX WARN: Code duplicated, block: B:66:0x00d1 A[RETURN] */
    /* JADX WARN: Code duplicated, block: B:67:0x00d2  */
    /* JADX WARN: Code duplicated, block: B:74:0x00da  */
    /* JADX WARN: Code duplicated, block: B:7:0x0014  */
    /* JADX WARN: Code duplicated, block: B:88:0x00f9  */
    /* JADX WARN: Code duplicated, block: B:90:0x0100  */
    public final <R> Object transaction(Transactor.SQLiteTransactionType type, Function2<? super TransactionScope<R>, ? super Continuation<? super R>, ? extends Object> function2, Continuation<? super R> continuation) throws Throwable {
        C00561 c00561;
        PooledConnectionImpl pooledConnectionImpl;
        int i;
        Throwable exception;
        Throwable exception2;
        Object objInvoke;
        PooledConnectionImpl pooledConnectionImpl2;
        Object obj;
        boolean z;
        Throwable th;
        Throwable exception3;
        Object result;
        if (continuation instanceof C00561) {
            c00561 = (C00561) continuation;
            if ((c00561.label & Integer.MIN_VALUE) != 0) {
                c00561.label -= Integer.MIN_VALUE;
            } else {
                c00561 = new C00561(continuation);
            }
        } else {
            c00561 = new C00561(continuation);
        }
        Object $result = c00561.result;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (c00561.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                if (type == null) {
                    type = Transactor.SQLiteTransactionType.DEFERRED;
                }
                c00561.L$0 = function2;
                c00561.label = 1;
                if (beginTransaction(type, c00561) == coroutine_suspended) {
                    return coroutine_suspended;
                }
                pooledConnectionImpl = this;
                i = 1;
                exception = null;
                try {
                    TransactionImpl transactionImpl = pooledConnectionImpl.new TransactionImpl();
                    c00561.L$0 = null;
                    c00561.I$0 = 1;
                    c00561.label = 2;
                    objInvoke = function2.invoke(transactionImpl, c00561);
                    if (objInvoke == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    pooledConnectionImpl2 = pooledConnectionImpl;
                    obj = objInvoke;
                    z = i != 0;
                    try {
                        c00561.L$0 = obj;
                        c00561.label = 3;
                        if (pooledConnectionImpl2.endTransaction(z, c00561) == coroutine_suspended) {
                            return coroutine_suspended;
                        }
                        return obj;
                    } catch (SQLException ex) {
                        throw ex;
                    }
                } catch (Throwable th2) {
                    exception2 = th2;
                    try {
                        if (exception2 instanceof ConnectionPool.RollbackException) {
                            throw exception2;
                        }
                        result = ((ConnectionPool.RollbackException) exception2).getResult();
                        try {
                            c00561.L$0 = result;
                            c00561.label = 4;
                            if (pooledConnectionImpl.endTransaction(false, c00561) == coroutine_suspended) {
                                return coroutine_suspended;
                            }
                            return result;
                        } catch (SQLException ex2) {
                            throw ex2;
                        }
                    } catch (Throwable ex3) {
                        z = 0 != 0;
                        try {
                            c00561.L$0 = exception;
                            c00561.L$1 = ex3;
                            c00561.label = 5;
                            if (pooledConnectionImpl.endTransaction(z, c00561) == coroutine_suspended) {
                                return coroutine_suspended;
                            }
                            throw ex3;
                        } catch (SQLException e) {
                            ex = e;
                            th = ex3;
                            exception3 = exception;
                            if (exception3 != null) {
                                throw ex;
                            }
                            ExceptionsKt.addSuppressed(exception3, ex);
                            throw th;
                        }
                    }
                }
            case 1:
                pooledConnectionImpl = this;
                function2 = (Function2) c00561.L$0;
                ResultKt.throwOnFailure($result);
                i = 1;
                exception = null;
                TransactionImpl transactionImpl2 = pooledConnectionImpl.new TransactionImpl();
                c00561.L$0 = null;
                c00561.I$0 = 1;
                c00561.label = 2;
                objInvoke = function2.invoke(transactionImpl2, c00561);
                if (objInvoke == coroutine_suspended) {
                    return coroutine_suspended;
                }
                pooledConnectionImpl2 = pooledConnectionImpl;
                obj = objInvoke;
                if (i != 0) {
                }
                c00561.L$0 = obj;
                c00561.label = 3;
                if (pooledConnectionImpl2.endTransaction(z, c00561) == coroutine_suspended) {
                    return coroutine_suspended;
                }
                return obj;
            case 2:
                pooledConnectionImpl = this;
                int i2 = c00561.I$0;
                try {
                    ResultKt.throwOnFailure($result);
                    exception = null;
                    i = i2;
                    pooledConnectionImpl2 = pooledConnectionImpl;
                    obj = $result;
                    if (i != 0) {
                    }
                    c00561.L$0 = obj;
                    c00561.label = 3;
                    if (pooledConnectionImpl2.endTransaction(z, c00561) == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    return obj;
                } catch (Throwable th3) {
                    exception = null;
                    exception2 = th3;
                    if (exception2 instanceof ConnectionPool.RollbackException) {
                        throw exception2;
                    }
                    result = ((ConnectionPool.RollbackException) exception2).getResult();
                    c00561.L$0 = result;
                    c00561.label = 4;
                    if (pooledConnectionImpl.endTransaction(false, c00561) == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    return result;
                }
            case 3:
                obj = c00561.L$0;
                try {
                    ResultKt.throwOnFailure($result);
                    return obj;
                } catch (SQLException ex4) {
                    throw ex4;
                }
            case 4:
                Object obj2 = c00561.L$0;
                try {
                    ResultKt.throwOnFailure($result);
                    return obj2;
                } catch (SQLException ex5) {
                    throw ex5;
                }
            case 5:
                th = (Throwable) c00561.L$1;
                exception3 = (Throwable) c00561.L$0;
                try {
                    ResultKt.throwOnFailure($result);
                    throw th;
                } catch (SQLException e2) {
                    ex = e2;
                    if (exception3 != null) {
                        throw ex;
                    }
                    ExceptionsKt.addSuppressed(exception3, ex);
                    throw th;
                }
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code duplicated, block: B:7:0x0014  */
    public final Object beginTransaction(Transactor.SQLiteTransactionType sQLiteTransactionType, Continuation<? super Unit> continuation) throws Throwable {
        AnonymousClass1 anonymousClass1;
        Transactor.SQLiteTransactionType type;
        ConnectionWithLock $this$withLock_u24default$iv;
        PooledConnectionImpl owner$iv;
        PooledConnectionImpl pooledConnectionImpl;
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
                type = sQLiteTransactionType;
                $this$withLock_u24default$iv = this.delegate;
                anonymousClass1.L$0 = type;
                anonymousClass1.L$1 = $this$withLock_u24default$iv;
                anonymousClass1.label = 1;
                if ($this$withLock_u24default$iv.lock(null, anonymousClass1) == coroutine_suspended) {
                    return coroutine_suspended;
                }
                owner$iv = null;
                pooledConnectionImpl = this;
                break;
                break;
            case 1:
                pooledConnectionImpl = this;
                owner$iv = null;
                $this$withLock_u24default$iv = (Mutex) anonymousClass1.L$1;
                type = (Transactor.SQLiteTransactionType) anonymousClass1.L$0;
                ResultKt.throwOnFailure($result);
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        try {
            int newTransactionId = pooledConnectionImpl.transactionStack.size();
            if (pooledConnectionImpl.transactionStack.isEmpty()) {
                switch (WhenMappings.$EnumSwitchMapping$0[type.ordinal()]) {
                    case 1:
                        SQLite.execSQL(pooledConnectionImpl.delegate, "BEGIN DEFERRED TRANSACTION");
                        break;
                    case 2:
                        SQLite.execSQL(pooledConnectionImpl.delegate, "BEGIN IMMEDIATE TRANSACTION");
                        break;
                    case 3:
                        SQLite.execSQL(pooledConnectionImpl.delegate, "BEGIN EXCLUSIVE TRANSACTION");
                        break;
                    default:
                        throw new NoWhenBranchMatchedException();
                }
            } else {
                SQLite.execSQL(pooledConnectionImpl.delegate, "SAVEPOINT '" + newTransactionId + '\'');
            }
            pooledConnectionImpl.transactionStack.addLast(new TransactionItem(newTransactionId, false));
            Unit unit = Unit.INSTANCE;
            $this$withLock_u24default$iv.unlock(owner$iv);
            return unit;
        } catch (Throwable th) {
            $this$withLock_u24default$iv.unlock(owner$iv);
            throw th;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code duplicated, block: B:7:0x0014  */
    public final Object endTransaction(boolean success, Continuation<? super Unit> continuation) throws Throwable {
        C00551 c00551;
        ConnectionWithLock $this$withLock_u24default$iv;
        Object owner$iv;
        boolean success2;
        PooledConnectionImpl pooledConnectionImpl;
        if (continuation instanceof C00551) {
            c00551 = (C00551) continuation;
            if ((c00551.label & Integer.MIN_VALUE) != 0) {
                c00551.label -= Integer.MIN_VALUE;
            } else {
                c00551 = new C00551(continuation);
            }
        } else {
            c00551 = new C00551(continuation);
        }
        Object $result = c00551.result;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (c00551.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                $this$withLock_u24default$iv = this.delegate;
                owner$iv = null;
                c00551.L$0 = $this$withLock_u24default$iv;
                c00551.Z$0 = success;
                c00551.label = 1;
                if ($this$withLock_u24default$iv.lock(null, c00551) == coroutine_suspended) {
                    return coroutine_suspended;
                }
                success2 = success;
                pooledConnectionImpl = this;
                break;
                break;
            case 1:
                pooledConnectionImpl = this;
                success2 = c00551.Z$0;
                owner$iv = null;
                $this$withLock_u24default$iv = (Mutex) c00551.L$0;
                ResultKt.throwOnFailure($result);
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        try {
            if (pooledConnectionImpl.transactionStack.isEmpty()) {
                throw new IllegalStateException("Not in a transaction".toString());
            }
            TransactionItem transaction = (TransactionItem) CollectionsKt.removeLast(pooledConnectionImpl.transactionStack);
            if (success2 && !transaction.getShouldRollback()) {
                if (!pooledConnectionImpl.transactionStack.isEmpty()) {
                    SQLite.execSQL(pooledConnectionImpl.delegate, "RELEASE SAVEPOINT '" + transaction.getId() + '\'');
                } else {
                    SQLite.execSQL(pooledConnectionImpl.delegate, "END TRANSACTION");
                }
            } else if (!pooledConnectionImpl.transactionStack.isEmpty()) {
                SQLite.execSQL(pooledConnectionImpl.delegate, "ROLLBACK TRANSACTION TO SAVEPOINT '" + transaction.getId() + '\'');
            } else {
                SQLite.execSQL(pooledConnectionImpl.delegate, "ROLLBACK TRANSACTION");
            }
            Unit unit = Unit.INSTANCE;
            $this$withLock_u24default$iv.unlock(owner$iv);
            return unit;
        } catch (Throwable th) {
            $this$withLock_u24default$iv.unlock(owner$iv);
            throw th;
        }
    }

    /* JADX INFO: compiled from: ConnectionPoolImpl.kt */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0002\b\t\b\u0002\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u001a\u0010\u0004\u001a\u00020\u0005X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\n\u0010\u000b\"\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Landroidx/room/coroutines/PooledConnectionImpl$TransactionItem;", "", "id", "", "shouldRollback", "", "<init>", "(IZ)V", "getId", "()I", "getShouldRollback", "()Z", "setShouldRollback", "(Z)V", "room-runtime"}, k = 1, mv = {2, 1, 0}, xi = 48)
    private static final class TransactionItem {
        private final int id;
        private boolean shouldRollback;

        public TransactionItem(int id, boolean shouldRollback) {
            this.id = id;
            this.shouldRollback = shouldRollback;
        }

        public final int getId() {
            return this.id;
        }

        public final boolean getShouldRollback() {
            return this.shouldRollback;
        }

        public final void setShouldRollback(boolean z) {
            this.shouldRollback = z;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX INFO: compiled from: ConnectionPoolImpl.kt */
    @Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u0001\n\u0002\b\u0003\b\u0082\u0004\u0018\u0000*\u0004\b\u0000\u0010\u00012\b\u0012\u0004\u0012\u0002H\u00010\u00022\u00020\u0003B\u0007¢\u0006\u0004\b\u0004\u0010\u0005J0\u0010\n\u001a\u0002H\u000b\"\u0004\b\u0001\u0010\u000b2\u0006\u0010\f\u001a\u00020\r2\u0012\u0010\u000e\u001a\u000e\u0012\u0004\u0012\u00020\u0010\u0012\u0004\u0012\u0002H\u000b0\u000fH\u0096@¢\u0006\u0002\u0010\u0011J>\u0010\u0012\u001a\u0002H\u000b\"\u0004\b\u0001\u0010\u000b2(\u0010\u000e\u001a$\b\u0001\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u000b0\u0002\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u000b0\u0014\u0012\u0006\u0012\u0004\u0018\u00010\u00150\u0013H\u0096@¢\u0006\u0002\u0010\u0016J\u0016\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00028\u0000H\u0096@¢\u0006\u0002\u0010\u001aR\u0014\u0010\u0006\u001a\u00020\u00078VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\b\u0010\t¨\u0006\u001b"}, d2 = {"Landroidx/room/coroutines/PooledConnectionImpl$TransactionImpl;", "T", "Landroidx/room/TransactionScope;", "Landroidx/room/coroutines/RawConnectionAccessor;", "<init>", "(Landroidx/room/coroutines/PooledConnectionImpl;)V", "rawConnection", "Landroidx/sqlite/SQLiteConnection;", "getRawConnection", "()Landroidx/sqlite/SQLiteConnection;", "usePrepared", "R", "sql", "", "block", "Lkotlin/Function1;", "Landroidx/sqlite/SQLiteStatement;", "(Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "withNestedTransaction", "Lkotlin/Function2;", "Lkotlin/coroutines/Continuation;", "", "(Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "rollback", "", "result", "(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "room-runtime"}, k = 1, mv = {2, 1, 0}, xi = 48)
    final class TransactionImpl<T> implements TransactionScope<T>, RawConnectionAccessor {
        public TransactionImpl() {
        }

        @Override // androidx.room.coroutines.RawConnectionAccessor
        public SQLiteConnection getRawConnection() {
            return PooledConnectionImpl.this.getRawConnection();
        }

        @Override // androidx.room.PooledConnection
        public <R> Object usePrepared(String sql, Function1<? super SQLiteStatement, ? extends R> function1, Continuation<? super R> continuation) {
            return PooledConnectionImpl.this.usePrepared(sql, function1, continuation);
        }

        @Override // androidx.room.TransactionScope
        public <R> Object withNestedTransaction(Function2<? super TransactionScope<R>, ? super Continuation<? super R>, ? extends Object> function2, Continuation<? super R> continuation) {
            PooledConnectionImpl this_$iv = PooledConnectionImpl.this;
            PooledConnectionImpl pooledConnectionImpl = PooledConnectionImpl.this;
            if (this_$iv.isRecycled()) {
                SQLite.throwSQLiteException(21, "Connection is recycled");
                throw new KotlinNothingValueException();
            }
            ConnectionElement connectionElement$iv = (ConnectionElement) continuation.getContext().get(this_$iv.getConnectionElementKey());
            if (connectionElement$iv != null && connectionElement$iv.getConnectionWrapper() == this_$iv) {
                return pooledConnectionImpl.transaction(null, function2, continuation);
            }
            SQLite.throwSQLiteException(21, "Attempted to use connection on a different coroutine");
            throw new KotlinNothingValueException();
        }

        /* JADX WARN: Code duplicated, block: B:7:0x0014  */
        @Override // androidx.room.TransactionScope
        public Object rollback(T t, Continuation<?> continuation) throws Throwable {
            PooledConnectionImpl$TransactionImpl$rollback$1 pooledConnectionImpl$TransactionImpl$rollback$1;
            Object result;
            PooledConnectionImpl pooledConnectionImpl;
            ConnectionWithLock $this$withLock_u24default$iv;
            Object owner$iv;
            if (continuation instanceof PooledConnectionImpl$TransactionImpl$rollback$1) {
                pooledConnectionImpl$TransactionImpl$rollback$1 = (PooledConnectionImpl$TransactionImpl$rollback$1) continuation;
                if ((pooledConnectionImpl$TransactionImpl$rollback$1.label & Integer.MIN_VALUE) != 0) {
                    pooledConnectionImpl$TransactionImpl$rollback$1.label -= Integer.MIN_VALUE;
                } else {
                    pooledConnectionImpl$TransactionImpl$rollback$1 = new PooledConnectionImpl$TransactionImpl$rollback$1(this, continuation);
                }
            } else {
                pooledConnectionImpl$TransactionImpl$rollback$1 = new PooledConnectionImpl$TransactionImpl$rollback$1(this, continuation);
            }
            Object $result = pooledConnectionImpl$TransactionImpl$rollback$1.result;
            Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
            switch (pooledConnectionImpl$TransactionImpl$rollback$1.label) {
                case 0:
                    ResultKt.throwOnFailure($result);
                    result = t;
                    PooledConnectionImpl this_$iv = PooledConnectionImpl.this;
                    pooledConnectionImpl = PooledConnectionImpl.this;
                    if (this_$iv.isRecycled()) {
                        SQLite.throwSQLiteException(21, "Connection is recycled");
                        throw new KotlinNothingValueException();
                    }
                    ConnectionElement connectionElement$iv = (ConnectionElement) pooledConnectionImpl$TransactionImpl$rollback$1.getContext().get(this_$iv.getConnectionElementKey());
                    if (connectionElement$iv != null && connectionElement$iv.getConnectionWrapper() == this_$iv) {
                        if (pooledConnectionImpl.transactionStack.isEmpty()) {
                            throw new IllegalStateException("Not in a transaction".toString());
                        }
                        $this$withLock_u24default$iv = pooledConnectionImpl.getDelegate();
                        Continuation $completion$iv = pooledConnectionImpl$TransactionImpl$rollback$1;
                        pooledConnectionImpl$TransactionImpl$rollback$1.L$0 = result;
                        pooledConnectionImpl$TransactionImpl$rollback$1.L$1 = pooledConnectionImpl;
                        pooledConnectionImpl$TransactionImpl$rollback$1.L$2 = $this$withLock_u24default$iv;
                        pooledConnectionImpl$TransactionImpl$rollback$1.label = 1;
                        if ($this$withLock_u24default$iv.lock(null, $completion$iv) == coroutine_suspended) {
                            return coroutine_suspended;
                        }
                        owner$iv = null;
                    } else {
                        SQLite.throwSQLiteException(21, "Attempted to use connection on a different coroutine");
                        throw new KotlinNothingValueException();
                    }
                    break;
                    break;
                case 1:
                    owner$iv = null;
                    $this$withLock_u24default$iv = (Mutex) pooledConnectionImpl$TransactionImpl$rollback$1.L$2;
                    pooledConnectionImpl = (PooledConnectionImpl) pooledConnectionImpl$TransactionImpl$rollback$1.L$1;
                    result = pooledConnectionImpl$TransactionImpl$rollback$1.L$0;
                    ResultKt.throwOnFailure($result);
                    break;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            try {
                ((TransactionItem) pooledConnectionImpl.transactionStack.last()).setShouldRollback(true);
                Unit unit = Unit.INSTANCE;
                throw new ConnectionPool.RollbackException(result);
            } finally {
                $this$withLock_u24default$iv.unlock(owner$iv);
            }
        }
    }

    private final <R> Object withStateCheck(Function0<? extends R> function0, Continuation<? super R> continuation) {
        if (isRecycled()) {
            SQLite.throwSQLiteException(21, "Connection is recycled");
            throw new KotlinNothingValueException();
        }
        Continuation continuation2 = null;
        continuation2.getContext();
        throw null;
    }

    /* JADX INFO: compiled from: ConnectionPoolImpl.kt */
    @Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u0006\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0006\n\u0002\u0010\u000b\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0082\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0001¢\u0006\u0004\b\u0003\u0010\u0004J\u0018\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\fH\u0016J\u0018\u0010\r\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000eH\u0016J\u0018\u0010\u000f\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u0006H\u0016J\u0018\u0010\u0010\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u0011H\u0016J\u0010\u0010\u0012\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\nH\u0016J\u0010\u0010\u0013\u001a\u00020\f2\u0006\u0010\t\u001a\u00020\nH\u0016J\u0010\u0010\u0014\u001a\u00020\u000e2\u0006\u0010\t\u001a\u00020\nH\u0016J\u0010\u0010\u0015\u001a\u00020\u00062\u0006\u0010\t\u001a\u00020\nH\u0016J\u0010\u0010\u0016\u001a\u00020\u00112\u0006\u0010\t\u001a\u00020\nH\u0016J\u0010\u0010\u0017\u001a\u00020\u00182\u0006\u0010\t\u001a\u00020\nH\u0016J\b\u0010\u0019\u001a\u00020\nH\u0016J\u0010\u0010\u001a\u001a\u00020\u00112\u0006\u0010\t\u001a\u00020\nH\u0016J\u0010\u0010\u001b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\nH\u0016J\b\u0010\u001c\u001a\u00020\u0018H\u0016J\b\u0010\u001d\u001a\u00020\bH\u0016J\b\u0010\u001e\u001a\u00020\bH\u0016J\b\u0010\u001f\u001a\u00020\bH\u0016J\"\u0010 \u001a\u0002H!\"\u0004\b\u0000\u0010!2\f\u0010\"\u001a\b\u0012\u0004\u0012\u0002H!0#H\u0082\b¢\u0006\u0002\u0010$R\u000e\u0010\u0002\u001a\u00020\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006%"}, d2 = {"Landroidx/room/coroutines/PooledConnectionImpl$StatementWrapper;", "Landroidx/sqlite/SQLiteStatement;", "delegate", "<init>", "(Landroidx/room/coroutines/PooledConnectionImpl;Landroidx/sqlite/SQLiteStatement;)V", "threadId", "", "bindBlob", "", "index", "", "value", "", "bindDouble", "", "bindLong", "bindText", "", "bindNull", "getBlob", "getDouble", "getLong", "getText", "isNull", "", "getColumnCount", "getColumnName", "getColumnType", "step", "reset", "clearBindings", "close", "withStateCheck", "R", "block", "Lkotlin/Function0;", "(Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "room-runtime"}, k = 1, mv = {2, 1, 0}, xi = 48)
    private final class StatementWrapper implements SQLiteStatement {
        private final SQLiteStatement delegate;
        final /* synthetic */ PooledConnectionImpl this$0;
        private final long threadId;

        public StatementWrapper(PooledConnectionImpl this$0, SQLiteStatement delegate) {
            Intrinsics.checkNotNullParameter(delegate, "delegate");
            this.this$0 = this$0;
            this.delegate = delegate;
            this.threadId = ThreadLocal_jvmAndroidKt.currentThreadId();
        }

        @Override // androidx.sqlite.SQLiteStatement
        /* JADX INFO: renamed from: bindBlob */
        public void mo150bindBlob(int index, byte[] value) {
            Intrinsics.checkNotNullParameter(value, "value");
            if (this.this$0.isRecycled()) {
                SQLite.throwSQLiteException(21, "Statement is recycled");
                throw new KotlinNothingValueException();
            }
            if (this.threadId == ThreadLocal_jvmAndroidKt.currentThreadId()) {
                this.delegate.mo150bindBlob(index, value);
            } else {
                SQLite.throwSQLiteException(21, "Attempted to use statement on a different thread");
                throw new KotlinNothingValueException();
            }
        }

        @Override // androidx.sqlite.SQLiteStatement
        /* JADX INFO: renamed from: bindDouble */
        public void mo151bindDouble(int index, double value) {
            if (this.this$0.isRecycled()) {
                SQLite.throwSQLiteException(21, "Statement is recycled");
                throw new KotlinNothingValueException();
            }
            if (this.threadId == ThreadLocal_jvmAndroidKt.currentThreadId()) {
                this.delegate.mo151bindDouble(index, value);
            } else {
                SQLite.throwSQLiteException(21, "Attempted to use statement on a different thread");
                throw new KotlinNothingValueException();
            }
        }

        @Override // androidx.sqlite.SQLiteStatement
        /* JADX INFO: renamed from: bindLong */
        public void mo152bindLong(int index, long value) {
            if (this.this$0.isRecycled()) {
                SQLite.throwSQLiteException(21, "Statement is recycled");
                throw new KotlinNothingValueException();
            }
            if (this.threadId == ThreadLocal_jvmAndroidKt.currentThreadId()) {
                this.delegate.mo152bindLong(index, value);
            } else {
                SQLite.throwSQLiteException(21, "Attempted to use statement on a different thread");
                throw new KotlinNothingValueException();
            }
        }

        @Override // androidx.sqlite.SQLiteStatement
        /* JADX INFO: renamed from: bindText */
        public void mo154bindText(int index, String value) {
            Intrinsics.checkNotNullParameter(value, "value");
            if (this.this$0.isRecycled()) {
                SQLite.throwSQLiteException(21, "Statement is recycled");
                throw new KotlinNothingValueException();
            }
            if (this.threadId == ThreadLocal_jvmAndroidKt.currentThreadId()) {
                this.delegate.mo154bindText(index, value);
            } else {
                SQLite.throwSQLiteException(21, "Attempted to use statement on a different thread");
                throw new KotlinNothingValueException();
            }
        }

        @Override // androidx.sqlite.SQLiteStatement
        /* JADX INFO: renamed from: bindNull */
        public void mo153bindNull(int index) {
            if (this.this$0.isRecycled()) {
                SQLite.throwSQLiteException(21, "Statement is recycled");
                throw new KotlinNothingValueException();
            }
            if (this.threadId == ThreadLocal_jvmAndroidKt.currentThreadId()) {
                this.delegate.mo153bindNull(index);
            } else {
                SQLite.throwSQLiteException(21, "Attempted to use statement on a different thread");
                throw new KotlinNothingValueException();
            }
        }

        @Override // androidx.sqlite.SQLiteStatement
        public byte[] getBlob(int index) {
            if (this.this$0.isRecycled()) {
                SQLite.throwSQLiteException(21, "Statement is recycled");
                throw new KotlinNothingValueException();
            }
            if (this.threadId == ThreadLocal_jvmAndroidKt.currentThreadId()) {
                return this.delegate.getBlob(index);
            }
            SQLite.throwSQLiteException(21, "Attempted to use statement on a different thread");
            throw new KotlinNothingValueException();
        }

        @Override // androidx.sqlite.SQLiteStatement
        public double getDouble(int index) {
            if (this.this$0.isRecycled()) {
                SQLite.throwSQLiteException(21, "Statement is recycled");
                throw new KotlinNothingValueException();
            }
            if (this.threadId == ThreadLocal_jvmAndroidKt.currentThreadId()) {
                return this.delegate.getDouble(index);
            }
            SQLite.throwSQLiteException(21, "Attempted to use statement on a different thread");
            throw new KotlinNothingValueException();
        }

        @Override // androidx.sqlite.SQLiteStatement
        public long getLong(int index) {
            if (this.this$0.isRecycled()) {
                SQLite.throwSQLiteException(21, "Statement is recycled");
                throw new KotlinNothingValueException();
            }
            if (this.threadId == ThreadLocal_jvmAndroidKt.currentThreadId()) {
                return this.delegate.getLong(index);
            }
            SQLite.throwSQLiteException(21, "Attempted to use statement on a different thread");
            throw new KotlinNothingValueException();
        }

        @Override // androidx.sqlite.SQLiteStatement
        public String getText(int index) {
            if (this.this$0.isRecycled()) {
                SQLite.throwSQLiteException(21, "Statement is recycled");
                throw new KotlinNothingValueException();
            }
            if (this.threadId == ThreadLocal_jvmAndroidKt.currentThreadId()) {
                return this.delegate.getText(index);
            }
            SQLite.throwSQLiteException(21, "Attempted to use statement on a different thread");
            throw new KotlinNothingValueException();
        }

        @Override // androidx.sqlite.SQLiteStatement
        public boolean isNull(int index) {
            if (this.this$0.isRecycled()) {
                SQLite.throwSQLiteException(21, "Statement is recycled");
                throw new KotlinNothingValueException();
            }
            if (this.threadId == ThreadLocal_jvmAndroidKt.currentThreadId()) {
                return this.delegate.isNull(index);
            }
            SQLite.throwSQLiteException(21, "Attempted to use statement on a different thread");
            throw new KotlinNothingValueException();
        }

        @Override // androidx.sqlite.SQLiteStatement
        public int getColumnCount() {
            if (this.this$0.isRecycled()) {
                SQLite.throwSQLiteException(21, "Statement is recycled");
                throw new KotlinNothingValueException();
            }
            if (this.threadId == ThreadLocal_jvmAndroidKt.currentThreadId()) {
                return this.delegate.getColumnCount();
            }
            SQLite.throwSQLiteException(21, "Attempted to use statement on a different thread");
            throw new KotlinNothingValueException();
        }

        @Override // androidx.sqlite.SQLiteStatement
        public String getColumnName(int index) {
            if (this.this$0.isRecycled()) {
                SQLite.throwSQLiteException(21, "Statement is recycled");
                throw new KotlinNothingValueException();
            }
            if (this.threadId == ThreadLocal_jvmAndroidKt.currentThreadId()) {
                return this.delegate.getColumnName(index);
            }
            SQLite.throwSQLiteException(21, "Attempted to use statement on a different thread");
            throw new KotlinNothingValueException();
        }

        @Override // androidx.sqlite.SQLiteStatement
        public int getColumnType(int index) {
            if (this.this$0.isRecycled()) {
                SQLite.throwSQLiteException(21, "Statement is recycled");
                throw new KotlinNothingValueException();
            }
            if (this.threadId == ThreadLocal_jvmAndroidKt.currentThreadId()) {
                return this.delegate.getColumnType(index);
            }
            SQLite.throwSQLiteException(21, "Attempted to use statement on a different thread");
            throw new KotlinNothingValueException();
        }

        @Override // androidx.sqlite.SQLiteStatement
        public boolean step() {
            if (this.this$0.isRecycled()) {
                SQLite.throwSQLiteException(21, "Statement is recycled");
                throw new KotlinNothingValueException();
            }
            if (this.threadId == ThreadLocal_jvmAndroidKt.currentThreadId()) {
                return this.delegate.step();
            }
            SQLite.throwSQLiteException(21, "Attempted to use statement on a different thread");
            throw new KotlinNothingValueException();
        }

        @Override // androidx.sqlite.SQLiteStatement
        public void reset() {
            if (this.this$0.isRecycled()) {
                SQLite.throwSQLiteException(21, "Statement is recycled");
                throw new KotlinNothingValueException();
            }
            if (this.threadId == ThreadLocal_jvmAndroidKt.currentThreadId()) {
                this.delegate.reset();
            } else {
                SQLite.throwSQLiteException(21, "Attempted to use statement on a different thread");
                throw new KotlinNothingValueException();
            }
        }

        @Override // androidx.sqlite.SQLiteStatement
        /* JADX INFO: renamed from: clearBindings */
        public void mo155clearBindings() {
            if (this.this$0.isRecycled()) {
                SQLite.throwSQLiteException(21, "Statement is recycled");
                throw new KotlinNothingValueException();
            }
            if (this.threadId == ThreadLocal_jvmAndroidKt.currentThreadId()) {
                this.delegate.mo155clearBindings();
            } else {
                SQLite.throwSQLiteException(21, "Attempted to use statement on a different thread");
                throw new KotlinNothingValueException();
            }
        }

        @Override // androidx.sqlite.SQLiteStatement, java.lang.AutoCloseable
        public void close() {
            if (this.this$0.isRecycled()) {
                SQLite.throwSQLiteException(21, "Statement is recycled");
                throw new KotlinNothingValueException();
            }
            if (this.threadId == ThreadLocal_jvmAndroidKt.currentThreadId()) {
                this.delegate.close();
            } else {
                SQLite.throwSQLiteException(21, "Attempted to use statement on a different thread");
                throw new KotlinNothingValueException();
            }
        }

        private final <R> R withStateCheck(Function0<? extends R> block) {
            if (this.this$0.isRecycled()) {
                SQLite.throwSQLiteException(21, "Statement is recycled");
                throw new KotlinNothingValueException();
            }
            if (this.threadId != ThreadLocal_jvmAndroidKt.currentThreadId()) {
                SQLite.throwSQLiteException(21, "Attempted to use statement on a different thread");
                throw new KotlinNothingValueException();
            }
            return block.invoke();
        }
    }
}
