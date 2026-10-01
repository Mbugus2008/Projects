package androidx.collection;

import androidx.collection.internal.ContainerHelpersKt;
import androidx.collection.internal.RuntimeHelpersKt;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import java.util.Iterator;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.ULong;
import kotlin.collections.ArraysKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.Sequence;
import kotlinx.coroutines.scheduling.WorkQueueKt;

/* JADX INFO: compiled from: ScatterMap.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000l\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010%\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0011\n\u0000\n\u0002\u0010\u001c\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\r\u0018\u0000*\u0004\b\u0000\u0010\u0001*\u0004\b\u0001\u0010\u00022\u000e\u0012\u0004\u0012\u0002H\u0001\u0012\u0004\u0012\u0002H\u00020\u0003B\u000f\u0012\b\b\u0002\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006J\r\u0010\b\u001a\u00020\tH\u0000¢\u0006\u0002\b\nJ\u0012\u0010\u000b\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\fJ\u0006\u0010\r\u001a\u00020\tJS\u0010\u000e\u001a\u00028\u00012\u0006\u0010\u000f\u001a\u00028\u000028\u0010\u0010\u001a4\u0012\u0013\u0012\u00118\u0000¢\u0006\f\b\u0012\u0012\b\b\u0013\u0012\u0004\b\b(\u000f\u0012\u0015\u0012\u0013\u0018\u00018\u0001¢\u0006\f\b\u0012\u0012\b\b\u0013\u0012\u0004\b\b(\u0014\u0012\u0004\u0012\u00028\u00010\u0011H\u0086\bø\u0001\u0000¢\u0006\u0002\u0010\u0015J\r\u0010\u0016\u001a\u00020\tH\u0000¢\u0006\u0002\b\u0017J\u0010\u0010\u0018\u001a\u00020\u00052\u0006\u0010\u0019\u001a\u00020\u0005H\u0002J\u0015\u0010\u001a\u001a\u00020\u00052\u0006\u0010\u000f\u001a\u00028\u0000H\u0001¢\u0006\u0002\u0010\u001bJ'\u0010\u001c\u001a\u00028\u00012\u0006\u0010\u000f\u001a\u00028\u00002\f\u0010\u001d\u001a\b\u0012\u0004\u0012\u00028\u00010\u001eH\u0086\bø\u0001\u0000¢\u0006\u0002\u0010\u001fJ\b\u0010 \u001a\u00020\tH\u0002J\u0010\u0010!\u001a\u00020\t2\u0006\u0010\"\u001a\u00020\u0005H\u0002J\u0010\u0010#\u001a\u00020\t2\u0006\u0010\u0004\u001a\u00020\u0005H\u0002J\u0016\u0010$\u001a\u00020\t2\u0006\u0010\u000f\u001a\u00028\u0000H\u0086\n¢\u0006\u0002\u0010%J\u0017\u0010$\u001a\u00020\t2\f\u0010&\u001a\b\u0012\u0004\u0012\u00028\u00000'H\u0086\nJ\u0017\u0010$\u001a\u00020\t2\f\u0010&\u001a\b\u0012\u0004\u0012\u00028\u00000(H\u0086\nJ\u001e\u0010$\u001a\u00020\t2\u000e\u0010&\u001a\n\u0012\u0006\b\u0001\u0012\u00028\u00000)H\u0086\n¢\u0006\u0002\u0010*J\u0017\u0010$\u001a\u00020\t2\f\u0010&\u001a\b\u0012\u0004\u0012\u00028\u00000+H\u0086\nJ\u0017\u0010$\u001a\u00020\t2\f\u0010&\u001a\b\u0012\u0004\u0012\u00028\u00000,H\u0086\nJ\u001d\u0010-\u001a\u00020\t2\u0012\u0010.\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0003H\u0086\nJ*\u0010-\u001a\u00020\t2\u001a\u0010/\u001a\u0016\u0012\u0012\b\u0001\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u0001000)H\u0086\n¢\u0006\u0002\u00101J\u001d\u0010-\u001a\u00020\t2\u0012\u00102\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u000100H\u0086\nJ#\u0010-\u001a\u00020\t2\u0018\u0010/\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u0001000+H\u0086\nJ\u001d\u0010-\u001a\u00020\t2\u0012\u0010.\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u000103H\u0086\nJ#\u0010-\u001a\u00020\t2\u0018\u0010/\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u0001000,H\u0086\nJ\u001d\u00104\u001a\u0004\u0018\u00018\u00012\u0006\u0010\u000f\u001a\u00028\u00002\u0006\u0010\u0014\u001a\u00028\u0001¢\u0006\u0002\u00105J\u001a\u00106\u001a\u00020\t2\u0012\u0010.\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0003J'\u00106\u001a\u00020\t2\u001a\u0010/\u001a\u0016\u0012\u0012\b\u0001\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u0001000)¢\u0006\u0002\u00101J \u00106\u001a\u00020\t2\u0018\u0010/\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u0001000+J\u001a\u00106\u001a\u00020\t2\u0012\u0010.\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u000103J \u00106\u001a\u00020\t2\u0018\u0010/\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u0001000,J\u0015\u00107\u001a\u0004\u0018\u00018\u00012\u0006\u0010\u000f\u001a\u00028\u0000¢\u0006\u0002\u00108J\u001b\u00107\u001a\u0002092\u0006\u0010\u000f\u001a\u00028\u00002\u0006\u0010\u0014\u001a\u00028\u0001¢\u0006\u0002\u0010:J&\u0010;\u001a\u00020\t2\u0018\u0010<\u001a\u0014\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u0001\u0012\u0004\u0012\u0002090\u0011H\u0086\bø\u0001\u0000J\u0017\u0010=\u001a\u0004\u0018\u00018\u00012\u0006\u0010>\u001a\u00020\u0005H\u0001¢\u0006\u0002\u0010?J\u0015\u0010@\u001a\u00020\t2\u0006\u0010A\u001a\u00020\u0005H\u0000¢\u0006\u0002\bBJ\u001e\u0010C\u001a\u00020\t2\u0006\u0010\u000f\u001a\u00028\u00002\u0006\u0010\u0014\u001a\u00028\u0001H\u0086\u0002¢\u0006\u0002\u0010DJ\u0006\u0010E\u001a\u00020\u0005R\u000e\u0010\u0007\u001a\u00020\u0005X\u0082\u000e¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006F"}, d2 = {"Landroidx/collection/MutableScatterMap;", "K", "V", "Landroidx/collection/ScatterMap;", "initialCapacity", "", "(I)V", "growthLimit", "adjustStorage", "", "adjustStorage$collection", "asMutableMap", "", "clear", "compute", "key", "computeBlock", "Lkotlin/Function2;", "Lkotlin/ParameterName;", "name", "value", "(Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;", "dropDeletes", "dropDeletes$collection", "findFirstAvailableSlot", "hash1", "findInsertIndex", "(Ljava/lang/Object;)I", "getOrPut", "defaultValue", "Lkotlin/Function0;", "(Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;", "initializeGrowth", "initializeMetadata", "capacity", "initializeStorage", "minusAssign", "(Ljava/lang/Object;)V", "keys", "Landroidx/collection/ObjectList;", "Landroidx/collection/ScatterSet;", "", "([Ljava/lang/Object;)V", "", "Lkotlin/sequences/Sequence;", "plusAssign", TypedValues.TransitionType.S_FROM, "pairs", "Lkotlin/Pair;", "([Lkotlin/Pair;)V", "pair", "", "put", "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;", "putAll", "remove", "(Ljava/lang/Object;)Ljava/lang/Object;", "", "(Ljava/lang/Object;Ljava/lang/Object;)Z", "removeIf", "predicate", "removeValueAt", "index", "(I)Ljava/lang/Object;", "resizeStorage", "newCapacity", "resizeStorage$collection", "set", "(Ljava/lang/Object;Ljava/lang/Object;)V", "trim", "collection"}, k = 1, mv = {1, 9, 0}, xi = 48)
public final class MutableScatterMap<K, V> extends ScatterMap<K, V> {
    private int growthLimit;

    public MutableScatterMap() {
        this(0, 1, null);
    }

    public /* synthetic */ MutableScatterMap(int i, int i2, DefaultConstructorMarker defaultConstructorMarker) {
        this((i2 & 1) != 0 ? 6 : i);
    }

    public MutableScatterMap(int initialCapacity) {
        super(null);
        boolean value$iv = initialCapacity >= 0;
        if (!value$iv) {
            RuntimeHelpersKt.throwIllegalArgumentException("Capacity must be a positive value.");
        }
        initializeStorage(ScatterMapKt.unloadedCapacity(initialCapacity));
    }

    private final void initializeStorage(int initialCapacity) {
        int newCapacity;
        if (initialCapacity > 0) {
            newCapacity = Math.max(7, ScatterMapKt.normalizeCapacity(initialCapacity));
        } else {
            newCapacity = 0;
        }
        this._capacity = newCapacity;
        initializeMetadata(newCapacity);
        this.keys = newCapacity == 0 ? ContainerHelpersKt.EMPTY_OBJECTS : new Object[newCapacity];
        this.values = newCapacity == 0 ? ContainerHelpersKt.EMPTY_OBJECTS : new Object[newCapacity];
    }

    private final void initializeMetadata(int capacity) {
        long[] jArr;
        if (capacity == 0) {
            jArr = ScatterMapKt.EmptyGroup;
        } else {
            int size = ((((capacity + 1) + 7) + 7) & (-8)) >> 3;
            long[] $this$initializeMetadata_u24lambda_u241 = new long[size];
            ArraysKt.fill$default($this$initializeMetadata_u24lambda_u241, -9187201950435737472L, 0, 0, 6, (Object) null);
            int i$iv = capacity >> 3;
            int b$iv = (capacity & 7) << 3;
            $this$initializeMetadata_u24lambda_u241[i$iv] = ($this$initializeMetadata_u24lambda_u241[i$iv] & (~(255 << b$iv))) | (255 << b$iv);
            jArr = $this$initializeMetadata_u24lambda_u241;
        }
        this.metadata = jArr;
        initializeGrowth();
    }

    private final void initializeGrowth() {
        this.growthLimit = ScatterMapKt.loadedCapacity(get_capacity()) - this._size;
    }

    public final V getOrPut(K key, Function0<? extends V> defaultValue) {
        Intrinsics.checkNotNullParameter(defaultValue, "defaultValue");
        V v = get(key);
        if (v != null) {
            return v;
        }
        V vInvoke = defaultValue.invoke();
        set(key, vInvoke);
        return vInvoke;
    }

    public final V compute(K key, Function2<? super K, ? super V, ? extends V> computeBlock) {
        Intrinsics.checkNotNullParameter(computeBlock, "computeBlock");
        int index = findInsertIndex(key);
        boolean inserting = index < 0;
        V vInvoke = computeBlock.invoke(key, inserting ? null : this.values[index]);
        if (inserting) {
            int insertionIndex = ~index;
            this.keys[insertionIndex] = key;
            this.values[insertionIndex] = vInvoke;
        } else {
            this.values[index] = vInvoke;
        }
        return vInvoke;
    }

    public final void set(K key, V value) {
        int index = findInsertIndex(key);
        if (index < 0) {
            index = ~index;
        }
        this.keys[index] = key;
        this.values[index] = value;
    }

    public final V put(K key, V value) {
        int iFindInsertIndex = findInsertIndex(key);
        if (iFindInsertIndex < 0) {
            iFindInsertIndex = ~iFindInsertIndex;
        }
        V v = (V) this.values[iFindInsertIndex];
        this.keys[iFindInsertIndex] = key;
        this.values[iFindInsertIndex] = value;
        return v;
    }

    public final void putAll(Pair<? extends K, ? extends V>[] pairs) {
        Intrinsics.checkNotNullParameter(pairs, "pairs");
        for (Pair<? extends K, ? extends V> pair : pairs) {
            set(pair.component1(), pair.component2());
        }
    }

    public final void putAll(Iterable<? extends Pair<? extends K, ? extends V>> pairs) {
        Intrinsics.checkNotNullParameter(pairs, "pairs");
        for (Pair<? extends K, ? extends V> pair : pairs) {
            set(pair.component1(), pair.component2());
        }
    }

    public final void putAll(Sequence<? extends Pair<? extends K, ? extends V>> pairs) {
        Intrinsics.checkNotNullParameter(pairs, "pairs");
        for (Pair<? extends K, ? extends V> pair : pairs) {
            set(pair.component1(), pair.component2());
        }
    }

    public final void putAll(Map<K, ? extends V> from) {
        Intrinsics.checkNotNullParameter(from, "from");
        for (Map.Entry<K, ? extends V> entry : from.entrySet()) {
            set(entry.getKey(), entry.getValue());
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void putAll(ScatterMap<K, V> from) {
        int $i$f$forEach;
        Object[] k$iv;
        Intrinsics.checkNotNullParameter(from, "from");
        ScatterMap<K, V> scatterMap = from;
        int $i$f$forEach2 = 0;
        Object[] k$iv2 = scatterMap.keys;
        Object[] v$iv = scatterMap.values;
        long[] m$iv$iv = scatterMap.metadata;
        int lastIndex$iv$iv = m$iv$iv.length - 2;
        int i$iv$iv = 0;
        if (0 > lastIndex$iv$iv) {
            return;
        }
        while (true) {
            long slot$iv$iv = m$iv$iv[i$iv$iv];
            ScatterMap<K, V> scatterMap2 = scatterMap;
            if ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) == -9187201950435737472L) {
                $i$f$forEach = $i$f$forEach2;
                k$iv = k$iv2;
            } else {
                int i = 8;
                int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                int j$iv$iv = 0;
                while (j$iv$iv < bitCount$iv$iv) {
                    long value$iv$iv$iv = 255 & slot$iv$iv;
                    if (value$iv$iv$iv < 128) {
                        int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                        Object key = k$iv2[index$iv$iv];
                        Object value = v$iv[index$iv$iv];
                        set(key, value);
                    }
                    slot$iv$iv >>= i;
                    j$iv$iv++;
                    i = i;
                    $i$f$forEach2 = $i$f$forEach2;
                    k$iv2 = k$iv2;
                }
                $i$f$forEach = $i$f$forEach2;
                k$iv = k$iv2;
                if (bitCount$iv$iv != i) {
                    return;
                }
            }
            if (i$iv$iv == lastIndex$iv$iv) {
                return;
            }
            i$iv$iv++;
            scatterMap = scatterMap2;
            $i$f$forEach2 = $i$f$forEach;
            k$iv2 = k$iv;
        }
    }

    public final void plusAssign(Pair<? extends K, ? extends V> pair) {
        Intrinsics.checkNotNullParameter(pair, "pair");
        set(pair.getFirst(), pair.getSecond());
    }

    public final void plusAssign(Pair<? extends K, ? extends V>[] pairs) {
        Intrinsics.checkNotNullParameter(pairs, "pairs");
        putAll(pairs);
    }

    public final void plusAssign(Iterable<? extends Pair<? extends K, ? extends V>> pairs) {
        Intrinsics.checkNotNullParameter(pairs, "pairs");
        putAll(pairs);
    }

    public final void plusAssign(Sequence<? extends Pair<? extends K, ? extends V>> pairs) {
        Intrinsics.checkNotNullParameter(pairs, "pairs");
        putAll(pairs);
    }

    public final void plusAssign(Map<K, ? extends V> from) {
        Intrinsics.checkNotNullParameter(from, "from");
        putAll(from);
    }

    public final void plusAssign(ScatterMap<K, V> from) {
        Intrinsics.checkNotNullParameter(from, "from");
        putAll(from);
    }

    public final V remove(K key) {
        int index$iv;
        MutableScatterMap<K, V> this_$iv = this;
        int $i$f$findKeyIndex$collection = 0;
        int hash$iv$iv = (key != null ? key.hashCode() : 0) * ScatterMapKt.MurmurHashC1;
        int hash$iv = hash$iv$iv ^ (hash$iv$iv << 16);
        int hash2$iv = hash$iv & WorkQueueKt.MASK;
        int probeMask$iv = this_$iv._capacity;
        int $i$f$h1 = hash$iv >>> 7;
        int probeOffset$iv = $i$f$h1 & probeMask$iv;
        int probeIndex$iv = 0;
        loop0: while (true) {
            long[] metadata$iv$iv = this_$iv.metadata;
            int i$iv$iv = probeOffset$iv >> 3;
            int b$iv$iv = (probeOffset$iv & 7) << 3;
            int hash2$iv2 = hash2$iv;
            long g$iv = ((metadata$iv$iv[i$iv$iv + 1] << (64 - b$iv$iv)) & ((-b$iv$iv) >> 63)) | (metadata$iv$iv[i$iv$iv] >>> b$iv$iv);
            long x$iv$iv = (((long) hash2$iv2) * ScatterMapKt.BitmaskLsb) ^ g$iv;
            int $i$f$findKeyIndex$collection2 = $i$f$findKeyIndex$collection;
            int hash$iv2 = hash$iv;
            long m$iv = (x$iv$iv - ScatterMapKt.BitmaskLsb) & (~x$iv$iv) & (-9187201950435737472L);
            while (true) {
                long $this$hasNext$iv$iv = m$iv;
                if ($this$hasNext$iv$iv != 0) {
                    long $this$get$iv$iv = m$iv;
                    index$iv = ((Long.numberOfTrailingZeros($this$get$iv$iv) >> 3) + probeOffset$iv) & probeMask$iv;
                    if (Intrinsics.areEqual(this_$iv.keys[index$iv], key)) {
                        break loop0;
                    }
                    long $this$next$iv$iv = m$iv;
                    m$iv = $this$next$iv$iv & ($this$next$iv$iv - 1);
                }
            }
            long $this$maskEmpty$iv$iv = ((~g$iv) << 6) & g$iv & (-9187201950435737472L);
            if ($this$maskEmpty$iv$iv == 0) {
                probeIndex$iv += 8;
                probeOffset$iv = (probeOffset$iv + probeIndex$iv) & probeMask$iv;
                hash2$iv = hash2$iv2;
                $i$f$findKeyIndex$collection = $i$f$findKeyIndex$collection2;
                hash$iv = hash$iv2;
            } else {
                index$iv = -1;
                break;
            }
        }
        if (index$iv >= 0) {
            return removeValueAt(index$iv);
        }
        return null;
    }

    public final boolean remove(K key, V value) {
        int index$iv;
        MutableScatterMap<K, V> this_$iv = this;
        int $i$f$findKeyIndex$collection = 0;
        int hash$iv$iv = (key != null ? key.hashCode() : 0) * ScatterMapKt.MurmurHashC1;
        int hash$iv = hash$iv$iv ^ (hash$iv$iv << 16);
        int hash2$iv = hash$iv & WorkQueueKt.MASK;
        int probeMask$iv = this_$iv._capacity;
        int $i$f$h1 = hash$iv >>> 7;
        int probeOffset$iv = $i$f$h1 & probeMask$iv;
        int probeIndex$iv = 0;
        loop0: while (true) {
            long[] metadata$iv$iv = this_$iv.metadata;
            int i$iv$iv = probeOffset$iv >> 3;
            int b$iv$iv = (probeOffset$iv & 7) << 3;
            int hash2$iv2 = hash2$iv;
            long g$iv = ((metadata$iv$iv[i$iv$iv + 1] << (64 - b$iv$iv)) & ((-b$iv$iv) >> 63)) | (metadata$iv$iv[i$iv$iv] >>> b$iv$iv);
            long x$iv$iv = (((long) hash2$iv2) * ScatterMapKt.BitmaskLsb) ^ g$iv;
            int $i$f$findKeyIndex$collection2 = $i$f$findKeyIndex$collection;
            int hash$iv2 = hash$iv;
            long m$iv = (x$iv$iv - ScatterMapKt.BitmaskLsb) & (~x$iv$iv) & (-9187201950435737472L);
            while (true) {
                long $this$hasNext$iv$iv = m$iv;
                if ($this$hasNext$iv$iv != 0) {
                    long $this$get$iv$iv = m$iv;
                    index$iv = ((Long.numberOfTrailingZeros($this$get$iv$iv) >> 3) + probeOffset$iv) & probeMask$iv;
                    if (Intrinsics.areEqual(this_$iv.keys[index$iv], key)) {
                        break loop0;
                    }
                    long $this$next$iv$iv = m$iv;
                    m$iv = $this$next$iv$iv & ($this$next$iv$iv - 1);
                }
            }
            long $this$maskEmpty$iv$iv = ((~g$iv) << 6) & g$iv & (-9187201950435737472L);
            if ($this$maskEmpty$iv$iv == 0) {
                probeIndex$iv += 8;
                probeOffset$iv = (probeOffset$iv + probeIndex$iv) & probeMask$iv;
                hash2$iv = hash2$iv2;
                $i$f$findKeyIndex$collection = $i$f$findKeyIndex$collection2;
                hash$iv = hash$iv2;
            } else {
                index$iv = -1;
                break;
            }
        }
        if (index$iv >= 0 && Intrinsics.areEqual(this.values[index$iv], value)) {
            removeValueAt(index$iv);
            return true;
        }
        return false;
    }

    public final void removeIf(Function2<? super K, ? super V, Boolean> predicate) {
        int $i$f$removeIf;
        int $i$f$removeIf2;
        int i;
        Intrinsics.checkNotNullParameter(predicate, "predicate");
        int $i$f$removeIf3 = 0;
        MutableScatterMap<K, V> this_$iv = this;
        long[] m$iv = this_$iv.metadata;
        int lastIndex$iv = m$iv.length - 2;
        int i$iv = 0;
        if (0 > lastIndex$iv) {
            return;
        }
        while (true) {
            long slot$iv = m$iv[i$iv];
            long $this$maskEmptyOrDeleted$iv$iv = ((~slot$iv) << 7) & slot$iv & (-9187201950435737472L);
            if ($this$maskEmptyOrDeleted$iv$iv == -9187201950435737472L) {
                $i$f$removeIf = $i$f$removeIf3;
            } else {
                int i2 = 8;
                int bitCount$iv = 8 - ((~(i$iv - lastIndex$iv)) >>> 31);
                int j$iv = 0;
                while (j$iv < bitCount$iv) {
                    long value$iv$iv = 255 & slot$iv;
                    if (!(value$iv$iv < 128)) {
                        $i$f$removeIf2 = $i$f$removeIf3;
                        i = i2;
                    } else {
                        int index$iv = (i$iv << 3) + j$iv;
                        i = i2;
                        $i$f$removeIf2 = $i$f$removeIf3;
                        if (predicate.invoke(this.keys[index$iv], this.values[index$iv]).booleanValue()) {
                            removeValueAt(index$iv);
                        }
                    }
                    slot$iv >>= i;
                    j$iv++;
                    i2 = i;
                    $i$f$removeIf3 = $i$f$removeIf2;
                }
                $i$f$removeIf = $i$f$removeIf3;
                if (bitCount$iv != i2) {
                    return;
                }
            }
            if (i$iv == lastIndex$iv) {
                return;
            }
            i$iv++;
            $i$f$removeIf3 = $i$f$removeIf;
        }
    }

    public final void minusAssign(K key) {
        remove(key);
    }

    public final void minusAssign(K[] keys) {
        Intrinsics.checkNotNullParameter(keys, "keys");
        for (K k : keys) {
            remove(k);
        }
    }

    public final void minusAssign(Iterable<? extends K> keys) {
        Intrinsics.checkNotNullParameter(keys, "keys");
        Iterator<? extends K> it = keys.iterator();
        while (it.hasNext()) {
            remove(it.next());
        }
    }

    public final void minusAssign(Sequence<? extends K> keys) {
        Intrinsics.checkNotNullParameter(keys, "keys");
        Iterator<? extends K> it = keys.iterator();
        while (it.hasNext()) {
            remove(it.next());
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void minusAssign(ScatterSet<K> keys) {
        ScatterSet<K> scatterSet;
        Intrinsics.checkNotNullParameter(keys, "keys");
        int $i$f$minusAssign = 0;
        ScatterSet<K> scatterSet2 = keys;
        Object[] elements$iv = scatterSet2.elements;
        long[] m$iv$iv = scatterSet2.metadata;
        int lastIndex$iv$iv = m$iv$iv.length - 2;
        int i$iv$iv = 0;
        if (0 > lastIndex$iv$iv) {
            return;
        }
        while (true) {
            long slot$iv$iv = m$iv$iv[i$iv$iv];
            int $i$f$minusAssign2 = $i$f$minusAssign;
            if ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) == -9187201950435737472L) {
                scatterSet = scatterSet2;
            } else {
                int i = 8;
                int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                int j$iv$iv = 0;
                while (j$iv$iv < bitCount$iv$iv) {
                    long value$iv$iv$iv = 255 & slot$iv$iv;
                    if (value$iv$iv$iv < 128) {
                        int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                        Object key = elements$iv[index$iv$iv];
                        remove(key);
                    }
                    slot$iv$iv >>= i;
                    j$iv$iv++;
                    i = i;
                    scatterSet2 = scatterSet2;
                }
                scatterSet = scatterSet2;
                if (bitCount$iv$iv != i) {
                    return;
                }
            }
            if (i$iv$iv == lastIndex$iv$iv) {
                return;
            }
            i$iv$iv++;
            $i$f$minusAssign = $i$f$minusAssign2;
            scatterSet2 = scatterSet;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void minusAssign(ObjectList<K> keys) {
        Intrinsics.checkNotNullParameter(keys, "keys");
        Object[] content$iv = keys.content;
        int i = keys._size;
        for (int i$iv = 0; i$iv < i; i$iv++) {
            Object key = content$iv[i$iv];
            remove(key);
        }
    }

    public final V removeValueAt(int index) {
        this._size--;
        long[] jArr = this.metadata;
        int i = this._capacity;
        int i2 = index >> 3;
        int i3 = (index & 7) << 3;
        jArr[i2] = (jArr[i2] & (~(255 << i3))) | (254 << i3);
        jArr[(((index - 7) & i) + (i & 7)) >> 3] = jArr[index >> 3];
        this.keys[index] = null;
        V v = (V) this.values[index];
        this.values[index] = null;
        return v;
    }

    public final void clear() {
        this._size = 0;
        if (this.metadata != ScatterMapKt.EmptyGroup) {
            ArraysKt.fill$default(this.metadata, -9187201950435737472L, 0, 0, 6, (Object) null);
            long[] data$iv = this.metadata;
            int offset$iv = this._capacity;
            int i$iv = offset$iv >> 3;
            int b$iv = (offset$iv & 7) << 3;
            data$iv[i$iv] = (data$iv[i$iv] & (~(255 << b$iv))) | (255 << b$iv);
        }
        ArraysKt.fill(this.values, (Object) null, 0, this._capacity);
        ArraysKt.fill(this.keys, (Object) null, 0, this._capacity);
        initializeGrowth();
    }

    public final int findInsertIndex(K key) {
        int hash$iv = (key != null ? key.hashCode() : 0) * ScatterMapKt.MurmurHashC1;
        int hash = hash$iv ^ (hash$iv << 16);
        int hash1 = hash >>> 7;
        int $i$f$h2 = hash & WorkQueueKt.MASK;
        int probeMask = this._capacity;
        int probeOffset = hash1 & probeMask;
        int probeIndex = 0;
        while (true) {
            long[] metadata$iv = this.metadata;
            int i$iv = probeOffset >> 3;
            int b$iv = (probeOffset & 7) << 3;
            int hash2 = hash1;
            long g = (((-b$iv) >> 63) & (metadata$iv[i$iv + 1] << (64 - b$iv))) | (metadata$iv[i$iv] >>> b$iv);
            long x$iv = (((long) $i$f$h2) * ScatterMapKt.BitmaskLsb) ^ g;
            int hash3 = hash;
            long m = (~x$iv) & (x$iv - ScatterMapKt.BitmaskLsb) & (-9187201950435737472L);
            while (true) {
                long $this$hasNext$iv = m;
                int $i$f$hasNext = $this$hasNext$iv != 0 ? 1 : 0;
                if ($i$f$hasNext != 0) {
                    long $this$get$iv = m;
                    int index = ((Long.numberOfTrailingZeros($this$get$iv) >> 3) + probeOffset) & probeMask;
                    if (Intrinsics.areEqual(this.keys[index], key)) {
                        return index;
                    }
                    long $this$next$iv = m;
                    m = $this$next$iv & ($this$next$iv - 1);
                }
            }
            long $this$maskEmpty$iv = ((~g) << 6) & g & (-9187201950435737472L);
            if ($this$maskEmpty$iv != 0) {
                int index2 = findFirstAvailableSlot(hash2);
                if (this.growthLimit == 0) {
                    if (!(((this.metadata[index2 >> 3] >> ((index2 & 7) << 3)) & 255) == 254)) {
                        adjustStorage$collection();
                        index2 = findFirstAvailableSlot(hash2);
                    }
                }
                this._size++;
                this.growthLimit -= ((this.metadata[index2 >> 3] >> ((index2 & 7) << 3)) & 255) == 128 ? 1 : 0;
                long[] data$iv = this.metadata;
                int capacity$iv = this._capacity;
                long value$iv = $i$f$h2;
                int i$iv$iv = index2 >> 3;
                int b$iv$iv = (index2 & 7) << 3;
                data$iv[i$iv$iv] = (data$iv[i$iv$iv] & (~(255 << b$iv$iv))) | (value$iv << b$iv$iv);
                int cloneIndex$iv = ((index2 - 7) & capacity$iv) + (capacity$iv & 7);
                data$iv[cloneIndex$iv >> 3] = data$iv[index2 >> 3];
                return ~index2;
            }
            hash1 = hash2;
            probeIndex += 8;
            probeOffset = (probeOffset + probeIndex) & probeMask;
            hash = hash3;
        }
    }

    private final int findFirstAvailableSlot(int hash1) {
        int probeMask = this._capacity;
        int probeOffset = hash1 & probeMask;
        int probeIndex = 0;
        while (true) {
            long[] metadata$iv = this.metadata;
            int i$iv = probeOffset >> 3;
            int b$iv = (probeOffset & 7) << 3;
            long g = (metadata$iv[i$iv] >>> b$iv) | ((metadata$iv[i$iv + 1] << (64 - b$iv)) & ((-b$iv) >> 63));
            long $this$maskEmptyOrDeleted$iv = ((~g) << 7) & g & (-9187201950435737472L);
            if ($this$maskEmptyOrDeleted$iv != 0) {
                return ((Long.numberOfTrailingZeros($this$maskEmptyOrDeleted$iv) >> 3) + probeOffset) & probeMask;
            }
            probeIndex += 8;
            probeOffset = (probeOffset + probeIndex) & probeMask;
        }
    }

    public final int trim() {
        int previousCapacity = this._capacity;
        int newCapacity = ScatterMapKt.normalizeCapacity(ScatterMapKt.unloadedCapacity(this._size));
        if (newCapacity < previousCapacity) {
            resizeStorage$collection(newCapacity);
            return previousCapacity - this._capacity;
        }
        return 0;
    }

    public final void adjustStorage$collection() {
        if (this._capacity > 8 && Long.compare(ULong.m643constructorimpl(ULong.m643constructorimpl(this._size) * 32) ^ Long.MIN_VALUE, ULong.m643constructorimpl(ULong.m643constructorimpl(this._capacity) * 25) ^ Long.MIN_VALUE) <= 0) {
            dropDeletes$collection();
        } else {
            resizeStorage$collection(ScatterMapKt.nextCapacity(this._capacity));
        }
    }

    public final void dropDeletes$collection() {
        MutableScatterMap<K, V> mutableScatterMap = this;
        long[] metadata = mutableScatterMap.metadata;
        int capacity = mutableScatterMap._capacity;
        Object[] keys = mutableScatterMap.keys;
        Object[] values = mutableScatterMap.values;
        int end$iv = (capacity + 7) >> 3;
        for (int i$iv = 0; i$iv < end$iv; i$iv++) {
            long maskedGroup$iv = metadata[i$iv] & (-9187201950435737472L);
            metadata[i$iv] = ((~maskedGroup$iv) + (maskedGroup$iv >>> 7)) & (-72340172838076674L);
        }
        int lastIndex$iv = ArraysKt.getLastIndex(metadata);
        metadata[lastIndex$iv - 1] = (metadata[lastIndex$iv - 1] & 72057594037927935L) | (-72057594037927936L);
        int newProbeIndex = 0;
        metadata[lastIndex$iv] = metadata[0];
        int index = 0;
        while (index != capacity) {
            long m = (metadata[index >> 3] >> ((index & 7) << 3)) & 255;
            if (m == 128) {
                index++;
            } else if (m != 254) {
                index++;
            } else {
                Object k$iv = keys[index];
                int hash$iv = (k$iv != null ? k$iv.hashCode() : newProbeIndex) * ScatterMapKt.MurmurHashC1;
                int hash = hash$iv ^ (hash$iv << 16);
                int $i$f$h1 = hash >>> 7;
                int targetIndex = mutableScatterMap.findFirstAvailableSlot($i$f$h1);
                int probeOffset = $i$f$h1 & capacity;
                int i = newProbeIndex;
                int newProbeIndex2 = ((targetIndex - probeOffset) & capacity) / 8;
                int oldProbeIndex = ((index - probeOffset) & capacity) / 8;
                if (newProbeIndex2 != oldProbeIndex) {
                    long[] metadata2 = metadata;
                    if (((metadata2[targetIndex >> 3] >> ((targetIndex & 7) << 3)) & 255) == 128) {
                        int $i$f$h2 = hash & WorkQueueKt.MASK;
                        long value$iv = $i$f$h2;
                        int i$iv2 = targetIndex >> 3;
                        int b$iv = (targetIndex & 7) << 3;
                        metadata2[i$iv2] = (metadata2[i$iv2] & (~(255 << b$iv))) | (value$iv << b$iv);
                        int i$iv3 = index >> 3;
                        int b$iv2 = (index & 7) << 3;
                        long value$iv2 = 255 << b$iv2;
                        metadata2[i$iv3] = (metadata2[i$iv3] & (~value$iv2)) | (128 << b$iv2);
                        keys[targetIndex] = keys[index];
                        keys[index] = null;
                        values[targetIndex] = values[index];
                        values[index] = null;
                    } else {
                        int $i$f$h3 = hash & WorkQueueKt.MASK;
                        long value$iv3 = $i$f$h3;
                        int i$iv4 = targetIndex >> 3;
                        int b$iv3 = (targetIndex & 7) << 3;
                        metadata2[i$iv4] = (metadata2[i$iv4] & (~(255 << b$iv3))) | (value$iv3 << b$iv3);
                        Object oldKey = keys[targetIndex];
                        keys[targetIndex] = keys[index];
                        keys[index] = oldKey;
                        Object oldValue = values[targetIndex];
                        values[targetIndex] = values[index];
                        values[index] = oldValue;
                        index--;
                    }
                    metadata2[ArraysKt.getLastIndex(metadata2)] = metadata2[i];
                    index++;
                    mutableScatterMap = this;
                    newProbeIndex = i;
                    metadata = metadata2;
                } else {
                    int $i$f$h4 = hash & WorkQueueKt.MASK;
                    long value$iv4 = $i$f$h4;
                    int i$iv5 = index >> 3;
                    int b$iv4 = (index & 7) << 3;
                    long[] metadata3 = metadata;
                    metadata3[i$iv5] = (metadata[i$iv5] & (~(255 << b$iv4))) | (value$iv4 << b$iv4);
                    metadata3[ArraysKt.getLastIndex(metadata3)] = metadata3[i];
                    index++;
                    mutableScatterMap = this;
                    newProbeIndex = i;
                    metadata = metadata3;
                }
            }
        }
        initializeGrowth();
    }

    public final void resizeStorage$collection(int newCapacity) {
        MutableScatterMap<K, V> mutableScatterMap = this;
        long[] previousMetadata = mutableScatterMap.metadata;
        Object[] previousKeys = mutableScatterMap.keys;
        Object[] previousValues = mutableScatterMap.values;
        int previousCapacity = mutableScatterMap._capacity;
        initializeStorage(newCapacity);
        long[] newMetadata = mutableScatterMap.metadata;
        Object[] newKeys = mutableScatterMap.keys;
        Object[] newValues = mutableScatterMap.values;
        int capacity = mutableScatterMap._capacity;
        int i = 0;
        while (i < previousCapacity) {
            if (((previousMetadata[i >> 3] >> ((i & 7) << 3)) & 255) < 128) {
                Object previousKey = previousKeys[i];
                int hash$iv = (previousKey != null ? previousKey.hashCode() : 0) * ScatterMapKt.MurmurHashC1;
                int $i$f$hash = hash$iv ^ (hash$iv << 16);
                int $i$f$h1 = $i$f$hash >>> 7;
                int index = mutableScatterMap.findFirstAvailableSlot($i$f$h1);
                int $i$f$h2 = $i$f$hash & WorkQueueKt.MASK;
                long value$iv = $i$f$h2;
                int i$iv$iv = index >> 3;
                int b$iv$iv = (index & 7) << 3;
                newMetadata[i$iv$iv] = (newMetadata[i$iv$iv] & (~(255 << b$iv$iv))) | (value$iv << b$iv$iv);
                int cloneIndex$iv = ((index - 7) & capacity) + (capacity & 7);
                newMetadata[cloneIndex$iv >> 3] = newMetadata[index >> 3];
                newKeys[index] = previousKey;
                newValues[index] = previousValues[i];
            }
            i++;
            mutableScatterMap = this;
            previousMetadata = previousMetadata;
        }
    }

    public final Map<K, V> asMutableMap() {
        return new MutableMapWrapper(this);
    }
}
