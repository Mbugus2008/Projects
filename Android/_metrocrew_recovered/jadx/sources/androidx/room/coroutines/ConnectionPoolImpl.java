package androidx.room.coroutines;

import android.database.SQLException;
import androidx.room.Transactor;
import androidx.room.concurrent.ThreadLocal_jvmAndroidKt;
import androidx.sqlite.SQLite;
import androidx.sqlite.SQLiteConnection;
import androidx.sqlite.SQLiteDriver;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.ExceptionsKt;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.CoroutineScope;

/* JADX INFO: compiled from: ConnectionPoolImpl.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000|\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\b\u0000\u0018\u00002\u00020\u0001B\u0019\b\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007B)\b\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\t¢\u0006\u0004\b\u0006\u0010\u000bJ@\u0010)\u001a\u0002H*\"\u0004\b\u0000\u0010*2\u0006\u0010+\u001a\u00020\u001b2\"\u0010,\u001a\u001e\b\u0001\u0012\u0004\u0012\u00020.\u0012\n\u0012\b\u0012\u0004\u0012\u0002H*0/\u0012\u0006\u0012\u0004\u0018\u0001000-H\u0096@¢\u0006\u0002\u00101J\u0010\u00102\u001a\u0002032\u0006\u00104\u001a\u00020\u0013H\u0002J\u0010\u0010$\u001a\u0002052\u0006\u0010+\u001a\u00020\u001bH\u0002J\b\u00106\u001a\u000205H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\rX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\rX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u0004¢\u0006\u0002\n\u0000R \u0010\u0011\u001a\u0012\u0012\u0004\u0012\u00020\u00130\u0012j\b\u0012\u0004\u0012\u00020\u0013`\u0014X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0015R\u0014\u0010\u0016\u001a\u00060\u0017j\u0002`\u0018X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0019R\u0014\u0010\u001a\u001a\u00020\u001b8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b\u001a\u0010\u001cR\u001c\u0010\u001d\u001a\u00020\u001eX\u0080\u000e¢\u0006\u0010\n\u0002\u0010#\u001a\u0004\b\u001f\u0010 \"\u0004\b!\u0010\"R\u001a\u0010$\u001a\u00020\tX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b%\u0010&\"\u0004\b'\u0010(¨\u00067"}, d2 = {"Landroidx/room/coroutines/ConnectionPoolImpl;", "Landroidx/room/coroutines/ConnectionPool;", "driver", "Landroidx/sqlite/SQLiteDriver;", "fileName", "", "<init>", "(Landroidx/sqlite/SQLiteDriver;Ljava/lang/String;)V", "maxNumOfReaders", "", "maxNumOfWriters", "(Landroidx/sqlite/SQLiteDriver;Ljava/lang/String;II)V", "readers", "Landroidx/room/coroutines/Pool;", "writers", "connectionElementKey", "Landroidx/room/coroutines/ConnectionElementKey;", "connectionThreadLocal", "Ljava/lang/ThreadLocal;", "Landroidx/room/coroutines/PooledConnectionImpl;", "Landroidx/room/concurrent/ThreadLocal;", "Ljava/lang/ThreadLocal;", "_isClosed", "Ljava/util/concurrent/atomic/AtomicBoolean;", "Landroidx/room/concurrent/AtomicBoolean;", "Ljava/util/concurrent/atomic/AtomicBoolean;", "isClosed", "", "()Z", "timeout", "Lkotlin/time/Duration;", "getTimeout-UwyO8pc$room_runtime", "()J", "setTimeout-LRDsOJo$room_runtime", "(J)V", "J", "onTimeout", "getOnTimeout$room_runtime", "()I", "setOnTimeout$room_runtime", "(I)V", "useConnection", "R", "isReadOnly", "block", "Lkotlin/Function2;", "Landroidx/room/Transactor;", "Lkotlin/coroutines/Continuation;", "", "(ZLkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "createConnectionContext", "Lkotlin/coroutines/CoroutineContext;", "connection", "", "close", "room-runtime"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class ConnectionPoolImpl implements ConnectionPool {
    private final AtomicBoolean _isClosed;
    private final ConnectionElementKey connectionElementKey;
    private final ThreadLocal<PooledConnectionImpl> connectionThreadLocal;
    private final SQLiteDriver driver;
    private int onTimeout;
    private final Pool readers;
    private long timeout;
    private final Pool writers;

    /* JADX INFO: renamed from: androidx.room.coroutines.ConnectionPoolImpl$useConnection$1, reason: invalid class name */
    /* JADX INFO: compiled from: ConnectionPoolImpl.kt */
    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "androidx.room.coroutines.ConnectionPoolImpl", f = "ConnectionPoolImpl.kt", i = {2, 2, 2, 2, 2, 3, 3}, l = {120, 124, 143, 148}, m = "useConnection", n = {"block", "pool", "connection", "currentContext", "isReadOnly", "pool", "connection"}, s = {"L$0", "L$1", "L$2", "L$3", "Z$0", "L$0", "L$1"})
    static final class AnonymousClass1<R> extends ContinuationImpl {
        Object L$0;
        Object L$1;
        Object L$2;
        Object L$3;
        Object L$4;
        Object L$5;
        boolean Z$0;
        int label;
        /* synthetic */ Object result;

        AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return ConnectionPoolImpl.this.useConnection(false, null, this);
        }
    }

    private final boolean isClosed() {
        return this._isClosed.get();
    }

    /* JADX INFO: renamed from: getTimeout-UwyO8pc$room_runtime, reason: not valid java name and from getter */
    public final long getTimeout() {
        return this.timeout;
    }

    /* JADX INFO: renamed from: setTimeout-LRDsOJo$room_runtime, reason: not valid java name */
    public final void m148setTimeoutLRDsOJo$room_runtime(long j) {
        this.timeout = j;
    }

    /* JADX INFO: renamed from: getOnTimeout$room_runtime, reason: from getter */
    public final int getOnTimeout() {
        return this.onTimeout;
    }

    public final void setOnTimeout$room_runtime(int i) {
        this.onTimeout = i;
    }

    public ConnectionPoolImpl(final SQLiteDriver driver, final String fileName) {
        Intrinsics.checkNotNullParameter(driver, "driver");
        Intrinsics.checkNotNullParameter(fileName, "fileName");
        this.connectionElementKey = new ConnectionElementKey();
        this.connectionThreadLocal = new ThreadLocal<>();
        this._isClosed = new AtomicBoolean(false);
        Duration.Companion companion = Duration.INSTANCE;
        this.timeout = DurationKt.toDuration(30, DurationUnit.SECONDS);
        this.onTimeout = 2;
        this.driver = driver;
        this.readers = new Pool(1, new Function0() { // from class: androidx.room.coroutines.ConnectionPoolImpl$$ExternalSyntheticLambda2
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                return driver.open(fileName);
            }
        });
        this.writers = this.readers;
    }

    public ConnectionPoolImpl(final SQLiteDriver driver, final String fileName, int maxNumOfReaders, int maxNumOfWriters) {
        Intrinsics.checkNotNullParameter(driver, "driver");
        Intrinsics.checkNotNullParameter(fileName, "fileName");
        this.connectionElementKey = new ConnectionElementKey();
        this.connectionThreadLocal = new ThreadLocal<>();
        this._isClosed = new AtomicBoolean(false);
        Duration.Companion companion = Duration.INSTANCE;
        this.timeout = DurationKt.toDuration(30, DurationUnit.SECONDS);
        this.onTimeout = 2;
        if (!(maxNumOfReaders > 0)) {
            throw new IllegalArgumentException("Maximum number of readers must be greater than 0".toString());
        }
        if (!(maxNumOfWriters > 0)) {
            throw new IllegalArgumentException("Maximum number of writers must be greater than 0".toString());
        }
        this.driver = driver;
        this.readers = new Pool(maxNumOfReaders, new Function0() { // from class: androidx.room.coroutines.ConnectionPoolImpl$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                return ConnectionPoolImpl._init_$lambda$4(driver, fileName);
            }
        });
        this.writers = new Pool(maxNumOfWriters, new Function0() { // from class: androidx.room.coroutines.ConnectionPoolImpl$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                return driver.open(fileName);
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final SQLiteConnection _init_$lambda$4(SQLiteDriver $driver, String $fileName) {
        SQLiteConnection newConnection = $driver.open($fileName);
        SQLite.execSQL(newConnection, "PRAGMA query_only = 1");
        return newConnection;
    }

    /* JADX WARN: Code duplicated, block: B:66:0x0149  */
    /* JADX WARN: Code duplicated, block: B:69:0x014e  */
    /* JADX WARN: Code duplicated, block: B:70:0x0150  */
    /* JADX WARN: Code duplicated, block: B:73:0x015a A[Catch: all -> 0x01b0, TRY_LEAVE, TryCatch #0 {all -> 0x01b0, blocks: (B:62:0x0139, B:67:0x014a, B:71:0x0151, B:73:0x015a, B:85:0x01a4, B:86:0x01af), top: B:105:0x0139 }] */
    /* JADX WARN: Code duplicated, block: B:75:0x0180 A[RETURN] */
    /* JADX WARN: Code duplicated, block: B:76:0x0181  */
    /* JADX WARN: Code duplicated, block: B:7:0x0018  */
    /* JADX WARN: Code duplicated, block: B:80:0x018b A[Catch: all -> 0x01a1, TRY_LEAVE, TryCatch #2 {, blocks: (B:78:0x0185, B:80:0x018b), top: B:108:0x0185 }] */
    /* JADX WARN: Code duplicated, block: B:85:0x01a4 A[Catch: all -> 0x01b0, TRY_ENTER, TryCatch #0 {all -> 0x01b0, blocks: (B:62:0x0139, B:67:0x014a, B:71:0x0151, B:73:0x015a, B:85:0x01a4, B:86:0x01af), top: B:105:0x0139 }] */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r9v5, types: [T, androidx.room.coroutines.PooledConnectionImpl] */
    @Override // androidx.room.coroutines.ConnectionPool
    public <R> Object useConnection(boolean z, Function2<? super Transactor, ? super Continuation<? super R>, ? extends Object> function2, Continuation<? super R> continuation) throws Throwable {
        AnonymousClass1 anonymousClass1;
        final ConnectionPoolImpl connectionPoolImpl;
        Function2<? super Transactor, ? super Continuation<? super R>, ? extends Object> function3;
        boolean isReadOnly;
        Ref.ObjectRef connection;
        Pool pool;
        Ref.ObjectRef connection2;
        CoroutineContext currentContext;
        Object objM149acquireWithTimeoutKLykuaI;
        ConnectionElementKey connectionElementKey;
        Throwable exception;
        Ref.ObjectRef objectRef;
        boolean z2;
        boolean z3;
        Object result;
        PooledConnectionImpl usedConnection;
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
        AnonymousClass1 anonymousClass2 = anonymousClass1;
        Object $result = anonymousClass2.result;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (anonymousClass2.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                connectionPoolImpl = this;
                function3 = function2;
                isReadOnly = z;
                if (connectionPoolImpl.isClosed()) {
                    SQLite.throwSQLiteException(21, "Connection pool is closed");
                    throw new KotlinNothingValueException();
                }
                PooledConnectionImpl confinedConnection = connectionPoolImpl.connectionThreadLocal.get();
                if (confinedConnection == null) {
                    ConnectionElement connectionElement = (ConnectionElement) anonymousClass2.getContext().get(connectionPoolImpl.connectionElementKey);
                    confinedConnection = connectionElement != null ? connectionElement.getConnectionWrapper() : null;
                }
                if (confinedConnection != null) {
                    if (!isReadOnly && confinedConnection.getIsReadOnly()) {
                        SQLite.throwSQLiteException(1, "Cannot upgrade connection from reader to writer");
                        throw new KotlinNothingValueException();
                    }
                    if (anonymousClass2.getContext().get(connectionPoolImpl.connectionElementKey) != null) {
                        anonymousClass2.label = 2;
                        Object objInvoke = function3.invoke(confinedConnection, anonymousClass2);
                        return objInvoke == coroutine_suspended ? coroutine_suspended : objInvoke;
                    }
                    CoroutineContext coroutineContextCreateConnectionContext = connectionPoolImpl.createConnectionContext(confinedConnection);
                    AnonymousClass2 anonymousClass3 = new AnonymousClass2(function3, confinedConnection, null);
                    anonymousClass2.label = 1;
                    Object objWithContext = BuildersKt.withContext(coroutineContextCreateConnectionContext, anonymousClass3, anonymousClass2);
                    return objWithContext == coroutine_suspended ? coroutine_suspended : objWithContext;
                }
                Pool pool2 = isReadOnly ? connectionPoolImpl.readers : connectionPoolImpl.writers;
                connection = new Ref.ObjectRef();
                try {
                    currentContext = anonymousClass2.getContext();
                    ConnectionElementKey connectionElementKey2 = connectionPoolImpl.connectionElementKey;
                    long j = connectionPoolImpl.timeout;
                    final boolean z4 = isReadOnly;
                    Function0<Unit> function0 = new Function0() { // from class: androidx.room.coroutines.ConnectionPoolImpl$$ExternalSyntheticLambda3
                        @Override // kotlin.jvm.functions.Function0
                        public final Object invoke() {
                            return ConnectionPoolImpl.useConnection$lambda$6(this.f$0, z4);
                        }
                    };
                    anonymousClass2.L$0 = function3;
                    anonymousClass2.L$1 = pool2;
                    anonymousClass2.L$2 = connection;
                    anonymousClass2.L$3 = currentContext;
                    anonymousClass2.L$4 = connection;
                    anonymousClass2.L$5 = connectionElementKey2;
                    anonymousClass2.Z$0 = isReadOnly;
                    anonymousClass2.label = 3;
                    objM149acquireWithTimeoutKLykuaI = pool2.m149acquireWithTimeoutKLykuaI(j, function0, anonymousClass2);
                    if (objM149acquireWithTimeoutKLykuaI == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    pool = pool2;
                    connectionElementKey = connectionElementKey2;
                    exception = null;
                    objectRef = connection;
                    try {
                        ConnectionWithLock connectionWithLockMarkAcquired = ((ConnectionWithLock) objM149acquireWithTimeoutKLykuaI).markAcquired(currentContext);
                        if (connectionPoolImpl.readers == connectionPoolImpl.writers && isReadOnly) {
                            z2 = true;
                        } else {
                            z2 = false;
                        }
                        if (z2) {
                            z3 = true;
                        } else {
                            z3 = false;
                        }
                        objectRef.element = new PooledConnectionImpl(connectionElementKey, connectionWithLockMarkAcquired, z3);
                        if (connection.element != 0) {
                            throw new IllegalArgumentException("Required value was null.".toString());
                        }
                        CoroutineContext coroutineContextCreateConnectionContext2 = connectionPoolImpl.createConnectionContext((PooledConnectionImpl) connection.element);
                        AnonymousClass4 anonymousClass4 = new AnonymousClass4(function3, connection, null);
                        anonymousClass2.L$0 = pool;
                        anonymousClass2.L$1 = connection;
                        anonymousClass2.L$2 = null;
                        anonymousClass2.L$3 = null;
                        anonymousClass2.L$4 = null;
                        anonymousClass2.L$5 = null;
                        anonymousClass2.label = 4;
                        result = BuildersKt.withContext(coroutineContextCreateConnectionContext2, anonymousClass4, anonymousClass2);
                        if (result == coroutine_suspended) {
                            return coroutine_suspended;
                        }
                        connection2 = connection;
                        usedConnection = (PooledConnectionImpl) connection2.element;
                        if (usedConnection != null) {
                            usedConnection.markRecycled();
                            usedConnection.getDelegate().markReleased();
                            pool.recycle(usedConnection.getDelegate());
                            break;
                        }
                        return result;
                    } catch (Throwable th) {
                        ex = th;
                        connection2 = connection;
                        Throwable exception2 = ex;
                        try {
                            throw ex;
                        } catch (Throwable ex) {
                            try {
                                PooledConnectionImpl usedConnection2 = (PooledConnectionImpl) connection2.element;
                                if (usedConnection2 == null) {
                                    throw ex;
                                }
                                usedConnection2.markRecycled();
                                usedConnection2.getDelegate().markReleased();
                                pool.recycle(usedConnection2.getDelegate());
                                throw ex;
                            } catch (Throwable recycleException) {
                                ExceptionsKt.addSuppressed(exception2, recycleException);
                                throw ex;
                            }
                        }
                    }
                } catch (Throwable th2) {
                    ex = th2;
                    pool = pool2;
                    connection2 = connection;
                    Throwable exception3 = ex;
                    throw ex;
                }
            case 1:
                ResultKt.throwOnFailure($result);
                return $result;
            case 2:
                ResultKt.throwOnFailure($result);
                return $result;
            case 3:
                connectionPoolImpl = this;
                isReadOnly = anonymousClass2.Z$0;
                connectionElementKey = (ConnectionElementKey) anonymousClass2.L$5;
                objectRef = (Ref.ObjectRef) anonymousClass2.L$4;
                CoroutineContext currentContext2 = (CoroutineContext) anonymousClass2.L$3;
                Ref.ObjectRef connection3 = (Ref.ObjectRef) anonymousClass2.L$2;
                exception = null;
                Pool pool3 = (Pool) anonymousClass2.L$1;
                function3 = (Function2) anonymousClass2.L$0;
                try {
                    ResultKt.throwOnFailure($result);
                    currentContext = currentContext2;
                    connection = connection3;
                    objM149acquireWithTimeoutKLykuaI = $result;
                    pool = pool3;
                    ConnectionWithLock connectionWithLockMarkAcquired2 = ((ConnectionWithLock) objM149acquireWithTimeoutKLykuaI).markAcquired(currentContext);
                    if (connectionPoolImpl.readers == connectionPoolImpl.writers) {
                        z2 = false;
                    } else {
                        z2 = false;
                    }
                    if (z2) {
                        z3 = true;
                    } else {
                        z3 = false;
                    }
                    objectRef.element = new PooledConnectionImpl(connectionElementKey, connectionWithLockMarkAcquired2, z3);
                    if (connection.element != 0) {
                        throw new IllegalArgumentException("Required value was null.".toString());
                    }
                    CoroutineContext coroutineContextCreateConnectionContext3 = connectionPoolImpl.createConnectionContext((PooledConnectionImpl) connection.element);
                    AnonymousClass4 anonymousClass5 = new AnonymousClass4(function3, connection, null);
                    anonymousClass2.L$0 = pool;
                    anonymousClass2.L$1 = connection;
                    anonymousClass2.L$2 = null;
                    anonymousClass2.L$3 = null;
                    anonymousClass2.L$4 = null;
                    anonymousClass2.L$5 = null;
                    anonymousClass2.label = 4;
                    result = BuildersKt.withContext(coroutineContextCreateConnectionContext3, anonymousClass5, anonymousClass2);
                    if (result == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    connection2 = connection;
                    usedConnection = (PooledConnectionImpl) connection2.element;
                    if (usedConnection != null) {
                        usedConnection.markRecycled();
                        usedConnection.getDelegate().markReleased();
                        pool.recycle(usedConnection.getDelegate());
                        break;
                    }
                    return result;
                } catch (Throwable th3) {
                    ex = th3;
                    connection2 = connection3;
                    pool = pool3;
                    Throwable exception4 = ex;
                    throw ex;
                }
            case 4:
                connection2 = (Ref.ObjectRef) anonymousClass2.L$1;
                pool = (Pool) anonymousClass2.L$0;
                try {
                    ResultKt.throwOnFailure($result);
                    result = $result;
                    usedConnection = (PooledConnectionImpl) connection2.element;
                    if (usedConnection != null) {
                        usedConnection.markRecycled();
                        usedConnection.getDelegate().markReleased();
                        pool.recycle(usedConnection.getDelegate());
                        break;
                    }
                    return result;
                } catch (Throwable th4) {
                    ex = th4;
                    Throwable exception5 = ex;
                    throw ex;
                }
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    /* JADX INFO: Add missing generic type declarations: [R] */
    /* JADX INFO: renamed from: androidx.room.coroutines.ConnectionPoolImpl$useConnection$2, reason: invalid class name */
    /* JADX INFO: compiled from: ConnectionPoolImpl.kt */
    @Metadata(d1 = {"\u0000\b\n\u0002\b\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u0002H\u0001\"\u0004\b\u0000\u0010\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "R", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "androidx.room.coroutines.ConnectionPoolImpl$useConnection$2", f = "ConnectionPoolImpl.kt", i = {}, l = {121}, m = "invokeSuspend", n = {}, s = {})
    static final class AnonymousClass2<R> extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super R>, Object> {
        final /* synthetic */ Function2<Transactor, Continuation<? super R>, Object> $block;
        final /* synthetic */ PooledConnectionImpl $confinedConnection;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        AnonymousClass2(Function2<? super Transactor, ? super Continuation<? super R>, ? extends Object> function2, PooledConnectionImpl pooledConnectionImpl, Continuation<? super AnonymousClass2> continuation) {
            super(2, continuation);
            this.$block = function2;
            this.$confinedConnection = pooledConnectionImpl;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new AnonymousClass2(this.$block, this.$confinedConnection, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(CoroutineScope coroutineScope, Continuation<? super R> continuation) {
            return ((AnonymousClass2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object $result) throws Throwable {
            Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
            switch (this.label) {
                case 0:
                    ResultKt.throwOnFailure($result);
                    Function2<Transactor, Continuation<? super R>, Object> function2 = this.$block;
                    PooledConnectionImpl pooledConnectionImpl = this.$confinedConnection;
                    this.label = 1;
                    Object objInvoke = function2.invoke(pooledConnectionImpl, this);
                    if (objInvoke == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    return objInvoke;
                case 1:
                    ResultKt.throwOnFailure($result);
                    return $result;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit useConnection$lambda$6(ConnectionPoolImpl this$0, boolean $isReadOnly) {
        this$0.onTimeout($isReadOnly);
        return Unit.INSTANCE;
    }

    /* JADX INFO: Add missing generic type declarations: [R] */
    /* JADX INFO: renamed from: androidx.room.coroutines.ConnectionPoolImpl$useConnection$4, reason: invalid class name */
    /* JADX INFO: compiled from: ConnectionPoolImpl.kt */
    @Metadata(d1 = {"\u0000\b\n\u0002\b\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u0002H\u0001\"\u0004\b\u0000\u0010\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "R", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "androidx.room.coroutines.ConnectionPoolImpl$useConnection$4", f = "ConnectionPoolImpl.kt", i = {}, l = {148}, m = "invokeSuspend", n = {}, s = {})
    static final class AnonymousClass4<R> extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super R>, Object> {
        final /* synthetic */ Function2<Transactor, Continuation<? super R>, Object> $block;
        final /* synthetic */ Ref.ObjectRef<PooledConnectionImpl> $connection;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        AnonymousClass4(Function2<? super Transactor, ? super Continuation<? super R>, ? extends Object> function2, Ref.ObjectRef<PooledConnectionImpl> objectRef, Continuation<? super AnonymousClass4> continuation) {
            super(2, continuation);
            this.$block = function2;
            this.$connection = objectRef;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new AnonymousClass4(this.$block, this.$connection, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(CoroutineScope coroutineScope, Continuation<? super R> continuation) {
            return ((AnonymousClass4) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
        }

        /*  JADX ERROR: JadxRuntimeException in pass: ModVisitor
            jadx.core.utils.exceptions.JadxRuntimeException: Can't change immutable type java.lang.Object to androidx.room.coroutines.ConnectionPoolImpl$useConnection$4<R> for r4v1 'this'  java.lang.Object
            	at jadx.core.dex.instructions.args.SSAVar.setType(SSAVar.java:114)
            	at jadx.core.dex.instructions.args.RegisterArg.setType(RegisterArg.java:52)
            	at jadx.core.dex.visitors.ModVisitor.removeCheckCast(ModVisitor.java:417)
            	at jadx.core.dex.visitors.ModVisitor.replaceStep(ModVisitor.java:152)
            	at jadx.core.dex.visitors.ModVisitor.visit(ModVisitor.java:96)
            */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final java.lang.Object invokeSuspend(java.lang.Object r5) {
            /*
                r4 = this;
                java.lang.Object r0 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
                int r1 = r4.label
                switch(r1) {
                    case 0: goto L16;
                    case 1: goto L11;
                    default: goto L9;
                }
            L9:
                java.lang.IllegalStateException r5 = new java.lang.IllegalStateException
                java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
                r5.<init>(r0)
                throw r5
            L11:
                kotlin.ResultKt.throwOnFailure(r5)
                r1 = r5
                goto L29
            L16:
                kotlin.ResultKt.throwOnFailure(r5)
                kotlin.jvm.functions.Function2<androidx.room.Transactor, kotlin.coroutines.Continuation<? super R>, java.lang.Object> r1 = r4.$block
                kotlin.jvm.internal.Ref$ObjectRef<androidx.room.coroutines.PooledConnectionImpl> r2 = r4.$connection
                T r2 = r2.element
                r3 = 1
                r4.label = r3
                java.lang.Object r1 = r1.invoke(r2, r4)
                if (r1 != r0) goto L29
                return r0
            L29:
                return r1
            */
            throw new UnsupportedOperationException("Method not decompiled: androidx.room.coroutines.ConnectionPoolImpl.AnonymousClass4.invokeSuspend(java.lang.Object):java.lang.Object");
        }
    }

    private final CoroutineContext createConnectionContext(PooledConnectionImpl connection) {
        return new ConnectionElement(this.connectionElementKey, connection).plus(ThreadLocal_jvmAndroidKt.asContextElement(this.connectionThreadLocal, connection));
    }

    private final void onTimeout(boolean isReadOnly) {
        String readOrWrite = isReadOnly ? "reader" : "writer";
        StringBuilder $this$onTimeout_u24lambda_u248 = new StringBuilder();
        $this$onTimeout_u24lambda_u248.append("Timed out attempting to acquire a " + readOrWrite + " connection.").append('\n');
        $this$onTimeout_u24lambda_u248.append('\n');
        $this$onTimeout_u24lambda_u248.append("Writer pool:").append('\n');
        this.writers.dump($this$onTimeout_u24lambda_u248);
        $this$onTimeout_u24lambda_u248.append("Reader pool:").append('\n');
        this.readers.dump($this$onTimeout_u24lambda_u248);
        String message = $this$onTimeout_u24lambda_u248.toString();
        try {
            SQLite.throwSQLiteException(5, message);
            throw new KotlinNothingValueException();
        } catch (SQLException ex) {
            switch (this.onTimeout) {
                case 1:
                    throw ex;
                case 2:
                    ex.printStackTrace();
                    return;
                default:
                    return;
            }
        }
    }

    @Override // androidx.room.coroutines.ConnectionPool, java.lang.AutoCloseable
    public void close() {
        if (this._isClosed.compareAndSet(false, true)) {
            this.readers.close();
            this.writers.close();
        }
    }
}
