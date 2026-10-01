package androidx.room.coroutines;

import androidx.collection.CircularArray;
import androidx.sqlite.SQLite;
import androidx.sqlite.SQLiteConnection;
import java.util.List;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.sync.Semaphore;
import kotlinx.coroutines.sync.SemaphoreKt;

/* JADX INFO: compiled from: ConnectionPoolImpl.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000`\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0002\u0018\u00002\u00020\u0001B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\u0004\b\u0007\u0010\bJ&\u0010\u001c\u001a\u00020\u00162\u0006\u0010\u001d\u001a\u00020\u001e2\f\u0010\u001f\u001a\b\u0012\u0004\u0012\u00020 0\u0005H\u0086@¢\u0006\u0004\b!\u0010\"J\u000e\u0010#\u001a\u00020\u0016H\u0086@¢\u0006\u0002\u0010$J\b\u0010%\u001a\u00020 H\u0002J\u000e\u0010&\u001a\u00020 2\u0006\u0010'\u001a\u00020\u0016J\u0006\u0010(\u001a\u00020 J\u0012\u0010)\u001a\u00020 2\n\u0010*\u001a\u00060+j\u0002`,R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\nR\u0017\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u000b\u0010\fR\u0014\u0010\r\u001a\u00060\u000ej\u0002`\u000fX\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0010R\u000e\u0010\u0011\u001a\u00020\u0003X\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u000e¢\u0006\u0002\n\u0000R\u0018\u0010\u0014\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00160\u0015X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0017R\u000e\u0010\u0018\u001a\u00020\u0019X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\u00160\u001bX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006-"}, d2 = {"Landroidx/room/coroutines/Pool;", "", "capacity", "", "connectionFactory", "Lkotlin/Function0;", "Landroidx/sqlite/SQLiteConnection;", "<init>", "(ILkotlin/jvm/functions/Function0;)V", "getCapacity", "()I", "getConnectionFactory", "()Lkotlin/jvm/functions/Function0;", "lock", "Ljava/util/concurrent/locks/ReentrantLock;", "Landroidx/room/concurrent/ReentrantLock;", "Ljava/util/concurrent/locks/ReentrantLock;", "size", "isClosed", "", "connections", "", "Landroidx/room/coroutines/ConnectionWithLock;", "[Landroidx/room/coroutines/ConnectionWithLock;", "connectionPermits", "Lkotlinx/coroutines/sync/Semaphore;", "availableConnections", "Landroidx/collection/CircularArray;", "acquireWithTimeout", "timeout", "Lkotlin/time/Duration;", "onTimeout", "", "acquireWithTimeout-KLykuaI", "(JLkotlin/jvm/functions/Function0;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "acquire", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "tryOpenNewConnectionLocked", "recycle", "connection", "close", "dump", "builder", "Ljava/lang/StringBuilder;", "Lkotlin/text/StringBuilder;", "room-runtime"}, k = 1, mv = {2, 1, 0}, xi = 48)
final class Pool {
    private final CircularArray<ConnectionWithLock> availableConnections;
    private final int capacity;
    private final Function0<SQLiteConnection> connectionFactory;
    private final Semaphore connectionPermits;
    private final ConnectionWithLock[] connections;
    private boolean isClosed;
    private final ReentrantLock lock;
    private int size;

    /* JADX INFO: renamed from: androidx.room.coroutines.Pool$acquire$1, reason: invalid class name */
    /* JADX INFO: compiled from: ConnectionPoolImpl.kt */
    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "androidx.room.coroutines.Pool", f = "ConnectionPoolImpl.kt", i = {}, l = {236}, m = "acquire", n = {}, s = {})
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
            return Pool.this.acquire(this);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public Pool(int capacity, Function0<? extends SQLiteConnection> connectionFactory) {
        Intrinsics.checkNotNullParameter(connectionFactory, "connectionFactory");
        this.capacity = capacity;
        this.connectionFactory = connectionFactory;
        this.lock = new ReentrantLock();
        this.connections = new ConnectionWithLock[this.capacity];
        this.connectionPermits = SemaphoreKt.Semaphore$default(this.capacity, 0, 2, null);
        this.availableConnections = new CircularArray<>(this.capacity);
    }

    public final int getCapacity() {
        return this.capacity;
    }

    public final Function0<SQLiteConnection> getConnectionFactory() {
        return this.connectionFactory;
    }

    /* JADX WARN: Code duplicated, block: B:21:0x0065 A[RETURN] */
    /* JADX WARN: Code duplicated, block: B:27:0x006d A[Catch: all -> 0x007c, TryCatch #0 {all -> 0x007c, blocks: (B:25:0x0069, B:27:0x006d, B:29:0x0073, B:31:0x0077, B:34:0x007b), top: B:40:0x0069 }] */
    /* JADX WARN: Code duplicated, block: B:28:0x0071  */
    /* JADX WARN: Code duplicated, block: B:29:0x0073 A[Catch: all -> 0x007c, TryCatch #0 {all -> 0x007c, blocks: (B:25:0x0069, B:27:0x006d, B:29:0x0073, B:31:0x0077, B:34:0x007b), top: B:40:0x0069 }] */
    /* JADX WARN: Code duplicated, block: B:31:0x0077 A[Catch: all -> 0x007c, TryCatch #0 {all -> 0x007c, blocks: (B:25:0x0069, B:27:0x006d, B:29:0x0073, B:31:0x0077, B:34:0x007b), top: B:40:0x0069 }] */
    /* JADX WARN: Code duplicated, block: B:34:0x007b A[Catch: all -> 0x007c, TRY_LEAVE, TryCatch #0 {all -> 0x007c, blocks: (B:25:0x0069, B:27:0x006d, B:29:0x0073, B:31:0x0077, B:34:0x007b), top: B:40:0x0069 }] */
    /* JADX WARN: Code duplicated, block: B:7:0x0014  */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:20:0x0063 -> B:40:0x0069). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:23:0x0067 -> B:40:0x0069). Please report as a decompilation issue!!! */
    /*  JADX ERROR: JadxOverflowException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxOverflowException: Regions count limit reached at block B:17:0x003e
        	at jadx.core.utils.ErrorsCounter.addError(ErrorsCounter.java:59)
        	at jadx.core.utils.ErrorsCounter.error(ErrorsCounter.java:31)
        	at jadx.core.dex.attributes.nodes.NotificationAttrNode.addError(NotificationAttrNode.java:19)
        */
    /* JADX INFO: renamed from: acquireWithTimeout-KLykuaI, reason: not valid java name */
    public final java.lang.Object m149acquireWithTimeoutKLykuaI(long r9, kotlin.jvm.functions.Function0<kotlin.Unit> r11, kotlin.coroutines.Continuation<? super androidx.room.coroutines.ConnectionWithLock> r12) {
        /*
            r8 = this;
            boolean r0 = r12 instanceof androidx.room.coroutines.Pool$acquireWithTimeout$1
            if (r0 == 0) goto L14
            r0 = r12
            androidx.room.coroutines.Pool$acquireWithTimeout$1 r0 = (androidx.room.coroutines.Pool$acquireWithTimeout$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            androidx.room.coroutines.Pool$acquireWithTimeout$1 r0 = new androidx.room.coroutines.Pool$acquireWithTimeout$1
            r0.<init>(r8, r12)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            switch(r3) {
                case 0: goto L3e;
                case 1: goto L2c;
                default: goto L24;
            }
        L24:
            java.lang.IllegalStateException r9 = new java.lang.IllegalStateException
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            r9.<init>(r10)
            throw r9
        L2c:
            r9 = r8
            long r10 = r0.J$0
            r3 = 0
            java.lang.Object r4 = r0.L$1
            kotlin.jvm.internal.Ref$ObjectRef r4 = (kotlin.jvm.internal.Ref.ObjectRef) r4
            java.lang.Object r5 = r0.L$0
            kotlin.jvm.functions.Function0 r5 = (kotlin.jvm.functions.Function0) r5
            kotlin.ResultKt.throwOnFailure(r1)     // Catch: java.lang.Throwable -> L3c
            goto L66
        L3c:
            r3 = move-exception
            goto L67
        L3e:
            kotlin.ResultKt.throwOnFailure(r1)
            r3 = r8
            r5 = r11
            r10 = r9
            r9 = r3
        L45:
            kotlin.jvm.internal.Ref$ObjectRef r3 = new kotlin.jvm.internal.Ref$ObjectRef
            r3.<init>()
            r4 = r3
            r3 = 0
            androidx.room.coroutines.Pool$acquireWithTimeout$2 r6 = new androidx.room.coroutines.Pool$acquireWithTimeout$2     // Catch: java.lang.Throwable -> L3c
            r7 = 0
            r6.<init>(r4, r9, r7)     // Catch: java.lang.Throwable -> L3c
            kotlin.jvm.functions.Function2 r6 = (kotlin.jvm.functions.Function2) r6     // Catch: java.lang.Throwable -> L3c
            r0.L$0 = r5     // Catch: java.lang.Throwable -> L3c
            r0.L$1 = r4     // Catch: java.lang.Throwable -> L3c
            r0.J$0 = r10     // Catch: java.lang.Throwable -> L3c
            r7 = 1
            r0.label = r7     // Catch: java.lang.Throwable -> L3c
            java.lang.Object r6 = kotlinx.coroutines.TimeoutKt.m1966withTimeoutKLykuaI(r10, r6, r0)     // Catch: java.lang.Throwable -> L3c
            if (r6 != r2) goto L66
            return r2
        L66:
            goto L68
        L67:
            r6 = r3
        L68:
            boolean r6 = r3 instanceof kotlinx.coroutines.TimeoutCancellationException     // Catch: java.lang.Throwable -> L7c
            if (r6 == 0) goto L71
            r5.invoke()     // Catch: java.lang.Throwable -> L7c
            goto L45
        L71:
            if (r3 != 0) goto L7a
            T r3 = r4.element     // Catch: java.lang.Throwable -> L7c
            if (r3 == 0) goto L45
            T r10 = r4.element     // Catch: java.lang.Throwable -> L7c
            return r10
        L7a:
            throw r3     // Catch: java.lang.Throwable -> L7c
        L7c:
            r10 = move-exception
            T r11 = r4.element
            androidx.room.coroutines.ConnectionWithLock r11 = (androidx.room.coroutines.ConnectionWithLock) r11
            if (r11 == 0) goto L88
            r2 = 0
            r9.recycle(r11)
        L88:
            throw r10
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.room.coroutines.Pool.m149acquireWithTimeoutKLykuaI(long, kotlin.jvm.functions.Function0, kotlin.coroutines.Continuation):java.lang.Object");
    }

    /* JADX WARN: Code duplicated, block: B:7:0x0014  */
    public final Object acquire(Continuation<? super ConnectionWithLock> continuation) throws Throwable {
        AnonymousClass1 anonymousClass1;
        Pool pool;
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
                Semaphore semaphore = this.connectionPermits;
                anonymousClass1.label = 1;
                if (semaphore.acquire(anonymousClass1) == coroutine_suspended) {
                    return coroutine_suspended;
                }
                pool = this;
                break;
                break;
            case 1:
                pool = this;
                ResultKt.throwOnFailure($result);
                break;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        try {
            ReentrantLock $this$withLock$iv = pool.lock;
            $this$withLock$iv.lock();
            try {
                if (pool.isClosed) {
                    SQLite.throwSQLiteException(21, "Connection pool is closed");
                    throw new KotlinNothingValueException();
                }
                if (pool.availableConnections.isEmpty()) {
                    pool.tryOpenNewConnectionLocked();
                }
                ConnectionWithLock connectionWithLockPopFirst = pool.availableConnections.popFirst();
                $this$withLock$iv.unlock();
                return connectionWithLockPopFirst;
            } catch (Throwable th) {
                $this$withLock$iv.unlock();
                throw th;
            }
        } catch (Throwable ex) {
            pool.connectionPermits.release();
            throw ex;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private final void tryOpenNewConnectionLocked() {
        if (this.size >= this.capacity) {
            return;
        }
        ConnectionWithLock connectionWithLock = new ConnectionWithLock(this.connectionFactory.invoke(), null, 2, 0 == true ? 1 : 0);
        ConnectionWithLock[] connectionWithLockArr = this.connections;
        int i = this.size;
        this.size = i + 1;
        connectionWithLockArr[i] = connectionWithLock;
        this.availableConnections.addLast(connectionWithLock);
    }

    public final void recycle(ConnectionWithLock connection) {
        Intrinsics.checkNotNullParameter(connection, "connection");
        ReentrantLock $this$withLock$iv = this.lock;
        $this$withLock$iv.lock();
        try {
            this.availableConnections.addLast(connection);
            Unit unit = Unit.INSTANCE;
            $this$withLock$iv.unlock();
            this.connectionPermits.release();
        } catch (Throwable th) {
            $this$withLock$iv.unlock();
            throw th;
        }
    }

    public final void close() {
        ReentrantLock $this$withLock$iv = this.lock;
        $this$withLock$iv.lock();
        try {
            this.isClosed = true;
            for (ConnectionWithLock connectionWithLock : this.connections) {
                if (connectionWithLock != null) {
                    connectionWithLock.close();
                }
            }
            Unit unit = Unit.INSTANCE;
        } finally {
            $this$withLock$iv.unlock();
        }
    }

    public final void dump(StringBuilder builder) {
        Intrinsics.checkNotNullParameter(builder, "builder");
        ReentrantLock $this$withLock$iv = this.lock;
        $this$withLock$iv.lock();
        try {
            List $this$dump_u24lambda_u247_u24lambda_u245 = CollectionsKt.createListBuilder();
            int size = this.availableConnections.size();
            for (int i = 0; i < size; i++) {
                $this$dump_u24lambda_u247_u24lambda_u245.add(this.availableConnections.get(i));
            }
            List availableQueue = CollectionsKt.build($this$dump_u24lambda_u247_u24lambda_u245);
            builder.append('\t' + super.toString() + " (");
            builder.append("capacity=" + this.capacity + ", ");
            builder.append("permits=" + this.connectionPermits.getAvailablePermits() + ", ");
            builder.append("queue=(size=" + availableQueue.size() + ")[" + CollectionsKt.joinToString$default(availableQueue, null, null, null, 0, null, null, 63, null) + ']');
            builder.append(")").append('\n');
            ConnectionWithLock[] connectionWithLockArr = this.connections;
            int index$iv = 0;
            int length = connectionWithLockArr.length;
            int i2 = 0;
            while (i2 < length) {
                ConnectionWithLock connectionWithLock = connectionWithLockArr[i2];
                int index$iv2 = index$iv + 1;
                ConnectionWithLock[] connectionWithLockArr2 = connectionWithLockArr;
                builder.append("\t\t[" + (index$iv + 1) + "] - " + (connectionWithLock != null ? connectionWithLock.toString() : null)).append('\n');
                if (connectionWithLock != null) {
                    connectionWithLock.dump(builder);
                }
                i2++;
                index$iv = index$iv2;
                connectionWithLockArr = connectionWithLockArr2;
            }
            Unit unit = Unit.INSTANCE;
        } finally {
            $this$withLock$iv.unlock();
        }
    }
}
