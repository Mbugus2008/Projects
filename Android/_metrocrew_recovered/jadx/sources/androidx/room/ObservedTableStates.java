package androidx.room;

import java.util.concurrent.locks.ReentrantLock;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.ArraysKt;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* JADX INFO: compiled from: InvalidationTracker.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0016\n\u0000\n\u0002\u0010\u0018\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0015\n\u0002\b\t\b\u0000\u0018\u00002\u00020\u0001:\u0001!B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J+\u0010\u0010\u001a\u00020\u00112\u0018\u0010\u0012\u001a\u0014\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00150\u0014\u0012\u0004\u0012\u00020\u00110\u0013H\u0080\bø\u0001\u0000¢\u0006\u0002\b\u0016J\u0015\u0010\u0017\u001a\u00020\u000f2\u0006\u0010\u0018\u001a\u00020\u0019H\u0000¢\u0006\u0002\b\u001aJ\u0015\u0010\u001b\u001a\u00020\u000f2\u0006\u0010\u0018\u001a\u00020\u0019H\u0000¢\u0006\u0002\b\u001cJ\r\u0010\u001d\u001a\u00020\u0011H\u0000¢\u0006\u0002\b\u001eJ\r\u0010\u001f\u001a\u00020\u0011H\u0000¢\u0006\u0002\b R\u0014\u0010\u0006\u001a\u00060\u0007j\u0002`\bX\u0082\u0004¢\u0006\u0004\n\u0002\u0010\tR\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\rX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u000e¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006\""}, d2 = {"Landroidx/room/ObservedTableStates;", "", "size", "", "<init>", "(I)V", "lock", "Ljava/util/concurrent/locks/ReentrantLock;", "Landroidx/room/concurrent/ReentrantLock;", "Ljava/util/concurrent/locks/ReentrantLock;", "tableObserversCount", "", "tableObservedState", "", "needsSync", "", "onSync", "", "action", "Lkotlin/Function1;", "", "Landroidx/room/ObservedTableStates$ObserveOp;", "onSync$room_runtime", "onObserverAdded", "tableIds", "", "onObserverAdded$room_runtime", "onObserverRemoved", "onObserverRemoved$room_runtime", "resetTriggerState", "resetTriggerState$room_runtime", "forceNeedSync", "forceNeedSync$room_runtime", "ObserveOp", "room-runtime"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class ObservedTableStates {
    private final ReentrantLock lock = new ReentrantLock();
    private volatile boolean needsSync;
    private final boolean[] tableObservedState;
    private final long[] tableObserversCount;

    /* JADX INFO: compiled from: InvalidationTracker.kt */
    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0006\b\u0080\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006¨\u0006\u0007"}, d2 = {"Landroidx/room/ObservedTableStates$ObserveOp;", "", "<init>", "(Ljava/lang/String;I)V", "NO_OP", "ADD", "REMOVE", "room-runtime"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public enum ObserveOp {
        NO_OP,
        ADD,
        REMOVE;

        private static final /* synthetic */ EnumEntries $ENTRIES = EnumEntriesKt.enumEntries($VALUES);

        public static EnumEntries<ObserveOp> getEntries() {
            return $ENTRIES;
        }
    }

    public ObservedTableStates(int size) {
        this.tableObserversCount = new long[size];
        this.tableObservedState = new boolean[size];
    }

    /* JADX WARN: Type inference failed for: r7v0, types: [androidx.room.ObservedTableStates$ObserveOp[], java.lang.Object] */
    public final void onSync$room_runtime(Function1<? super ObserveOp[], Unit> action) {
        ObserveOp observeOp;
        Intrinsics.checkNotNullParameter(action, "action");
        ReentrantLock $this$withLock$iv = this.lock;
        $this$withLock$iv.lock();
        try {
            if (this.needsSync) {
                this.needsSync = false;
                boolean addOrRemove = false;
                int length = this.tableObserversCount.length;
                ?? r7 = new ObserveOp[length];
                for (int i = 0; i < length; i++) {
                    boolean newState = this.tableObserversCount[i] > 0;
                    if (newState != this.tableObservedState[i]) {
                        addOrRemove = true;
                        this.tableObservedState[i] = newState;
                        observeOp = newState ? ObserveOp.ADD : ObserveOp.REMOVE;
                    } else {
                        observeOp = ObserveOp.NO_OP;
                    }
                    r7[i] = observeOp;
                }
                if (addOrRemove) {
                    action.invoke(r7);
                }
                Unit unit = Unit.INSTANCE;
            }
        } finally {
            $this$withLock$iv.unlock();
        }
    }

    public final boolean onObserverAdded$room_runtime(int[] tableIds) {
        Intrinsics.checkNotNullParameter(tableIds, "tableIds");
        ReentrantLock $this$withLock$iv = this.lock;
        $this$withLock$iv.lock();
        boolean shouldSync = false;
        try {
            for (int element$iv : tableIds) {
                long previousCount = this.tableObserversCount[element$iv];
                this.tableObserversCount[element$iv] = previousCount + 1;
                if (previousCount == 0) {
                    this.needsSync = true;
                    shouldSync = true;
                }
            }
            return shouldSync || this.needsSync;
        } finally {
            $this$withLock$iv.unlock();
        }
    }

    public final boolean onObserverRemoved$room_runtime(int[] tableIds) {
        Intrinsics.checkNotNullParameter(tableIds, "tableIds");
        ReentrantLock $this$withLock$iv = this.lock;
        $this$withLock$iv.lock();
        boolean shouldSync = false;
        try {
            for (int element$iv : tableIds) {
                long previousCount = this.tableObserversCount[element$iv];
                this.tableObserversCount[element$iv] = previousCount - 1;
                if (previousCount == 1) {
                    this.needsSync = true;
                    shouldSync = true;
                }
            }
            return shouldSync || this.needsSync;
        } finally {
            $this$withLock$iv.unlock();
        }
    }

    public final void resetTriggerState$room_runtime() {
        ReentrantLock $this$withLock$iv = this.lock;
        $this$withLock$iv.lock();
        try {
            ArraysKt.fill$default(this.tableObservedState, false, 0, 0, 6, (Object) null);
            this.needsSync = true;
            Unit unit = Unit.INSTANCE;
        } finally {
            $this$withLock$iv.unlock();
        }
    }

    public final void forceNeedSync$room_runtime() {
        ReentrantLock $this$withLock$iv = this.lock;
        $this$withLock$iv.lock();
        try {
            this.needsSync = true;
            Unit unit = Unit.INSTANCE;
        } finally {
            $this$withLock$iv.unlock();
        }
    }
}
