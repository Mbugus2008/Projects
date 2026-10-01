package androidx.collection;

import androidx.collection.internal.ContainerHelpersKt;
import androidx.collection.internal.RuntimeHelpersKt;
import java.util.Collection;
import java.util.Iterator;
import java.util.Set;
import kotlin.Metadata;
import kotlin.ULong;
import kotlin.collections.ArraysKt;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.sequences.Sequence;
import kotlinx.coroutines.scheduling.WorkQueueKt;

/* JADX INFO: compiled from: OrderedScatterSet.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000`\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0011\n\u0000\n\u0002\u0010\u001c\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010#\n\u0002\b\t\n\u0002\u0010\u0015\n\u0002\u0010\u0016\n\u0002\b\u000f\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u001e\n\u0002\b\u0004\u0018\u0000*\u0004\b\u0000\u0010\u00012\b\u0012\u0004\u0012\u0002H\u00010\u0002B\u000f\u0012\b\b\u0002\u0010\u0003\u001a\u00020\u0004¢\u0006\u0002\u0010\u0005J\u0013\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00028\u0000¢\u0006\u0002\u0010\nJ\u0014\u0010\u000b\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\rJ\u0014\u0010\u000b\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0002J\u0014\u0010\u000b\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u000eJ\u001b\u0010\u000b\u001a\u00020\b2\u000e\u0010\f\u001a\n\u0012\u0006\b\u0001\u0012\u00028\u00000\u000f¢\u0006\u0002\u0010\u0010J\u0014\u0010\u000b\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0011J\u0014\u0010\u000b\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0012J\r\u0010\u0013\u001a\u00020\u0014H\u0000¢\u0006\u0002\b\u0015J\f\u0010\u0016\u001a\b\u0012\u0004\u0012\u00028\u00000\u0017J\u0006\u0010\u0018\u001a\u00020\u0014J\r\u0010\u0019\u001a\u00020\u0014H\u0000¢\u0006\u0002\b\u001aJ\u0015\u0010\u001b\u001a\u00020\u00042\u0006\u0010\t\u001a\u00028\u0000H\u0002¢\u0006\u0002\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u00042\u0006\u0010\u001e\u001a\u00020\u0004H\u0002J\u0010\u0010\u001f\u001a\u00020\u00142\u0006\u0010 \u001a\u00020!H\u0002J\u0010\u0010\u001f\u001a\u00020\u00142\u0006\u0010 \u001a\u00020\"H\u0002J\b\u0010#\u001a\u00020\u0014H\u0002J\u0010\u0010$\u001a\u00020\u00142\u0006\u0010%\u001a\u00020\u0004H\u0002J\u0010\u0010&\u001a\u00020\u00142\u0006\u0010\u0003\u001a\u00020\u0004H\u0002J\u0016\u0010'\u001a\u00020\u00142\u0006\u0010\t\u001a\u00028\u0000H\u0086\u0002¢\u0006\u0002\u0010(J\u0017\u0010'\u001a\u00020\u00142\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\rH\u0086\u0002J\u0017\u0010'\u001a\u00020\u00142\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0002H\u0086\u0002J\u0017\u0010'\u001a\u00020\u00142\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u000eH\u0086\u0002J\u001e\u0010'\u001a\u00020\u00142\u000e\u0010\f\u001a\n\u0012\u0006\b\u0001\u0012\u00028\u00000\u000fH\u0086\u0002¢\u0006\u0002\u0010)J\u0017\u0010'\u001a\u00020\u00142\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0011H\u0086\u0002J\u0017\u0010'\u001a\u00020\u00142\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0012H\u0086\u0002J\u0011\u0010*\u001a\u00020\u00142\u0006\u0010+\u001a\u00020\u0004H\u0082\bJ\u0016\u0010,\u001a\u00020\u00142\u0006\u0010\t\u001a\u00028\u0000H\u0086\u0002¢\u0006\u0002\u0010(J\u0017\u0010,\u001a\u00020\u00142\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\rH\u0086\u0002J\u0017\u0010,\u001a\u00020\u00142\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0002H\u0086\u0002J\u0017\u0010,\u001a\u00020\u00142\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u000eH\u0086\u0002J\u001e\u0010,\u001a\u00020\u00142\u000e\u0010\f\u001a\n\u0012\u0006\b\u0001\u0012\u00028\u00000\u000fH\u0086\u0002¢\u0006\u0002\u0010)J\u0017\u0010,\u001a\u00020\u00142\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0011H\u0086\u0002J\u0017\u0010,\u001a\u00020\u00142\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0012H\u0086\u0002J\u0013\u0010-\u001a\u00020\b2\u0006\u0010\t\u001a\u00028\u0000¢\u0006\u0002\u0010\nJ\u0014\u0010.\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\rJ\u0014\u0010.\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0002J\u0014\u0010.\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u000eJ\u001b\u0010.\u001a\u00020\b2\u000e\u0010\f\u001a\n\u0012\u0006\b\u0001\u0012\u00028\u00000\u000f¢\u0006\u0002\u0010\u0010J\u0014\u0010.\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0011J\u0014\u0010.\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0012J\u0010\u0010/\u001a\u00020\u00142\u0006\u0010+\u001a\u00020\u0004H\u0001J \u00100\u001a\u00020\u00142\u0012\u00101\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\b02H\u0086\bø\u0001\u0000J\u0011\u00103\u001a\u00020\u00142\u0006\u0010+\u001a\u00020\u0004H\u0082\bJ\u0015\u00104\u001a\u00020\u00142\u0006\u00105\u001a\u00020\u0004H\u0000¢\u0006\u0002\b6J \u00107\u001a\u00020\b2\u0012\u00101\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\b02H\u0086\bø\u0001\u0000J\u0014\u00107\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0002J\u0014\u00107\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u000eJ\u0014\u00107\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u000008J\b\u00109\u001a\u00020\u0004H\u0007J\u000e\u0010:\u001a\u00020\u00142\u0006\u0010;\u001a\u00020\u0004R\u000e\u0010\u0006\u001a\u00020\u0004X\u0082\u000e¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006<"}, d2 = {"Landroidx/collection/MutableOrderedScatterSet;", "E", "Landroidx/collection/OrderedScatterSet;", "initialCapacity", "", "(I)V", "growthLimit", "add", "", "element", "(Ljava/lang/Object;)Z", "addAll", "elements", "Landroidx/collection/ObjectList;", "Landroidx/collection/ScatterSet;", "", "([Ljava/lang/Object;)Z", "", "Lkotlin/sequences/Sequence;", "adjustStorage", "", "adjustStorage$collection", "asMutableSet", "", "clear", "dropDeletes", "dropDeletes$collection", "findAbsoluteInsertIndex", "(Ljava/lang/Object;)I", "findFirstAvailableSlot", "hash1", "fixupNodes", "mapping", "", "", "initializeGrowth", "initializeMetadata", "capacity", "initializeStorage", "minusAssign", "(Ljava/lang/Object;)V", "([Ljava/lang/Object;)V", "moveNodeToHead", "index", "plusAssign", "remove", "removeAll", "removeElementAt", "removeIf", "predicate", "Lkotlin/Function1;", "removeNode", "resizeStorage", "newCapacity", "resizeStorage$collection", "retainAll", "", "trim", "trimToSize", "maxSize", "collection"}, k = 1, mv = {1, 9, 0}, xi = 48)
public final class MutableOrderedScatterSet<E> extends OrderedScatterSet<E> {
    private int growthLimit;

    public MutableOrderedScatterSet() {
        this(0, 1, null);
    }

    public /* synthetic */ MutableOrderedScatterSet(int i, int i2, DefaultConstructorMarker defaultConstructorMarker) {
        this((i2 & 1) != 0 ? 6 : i);
    }

    public MutableOrderedScatterSet(int initialCapacity) {
        super(null);
        boolean value$iv = initialCapacity >= 0;
        if (!value$iv) {
            RuntimeHelpersKt.throwIllegalArgumentException("Capacity must be a positive value.");
        }
        initializeStorage(ScatterMapKt.unloadedCapacity(initialCapacity));
    }

    private final void initializeStorage(int initialCapacity) {
        int newCapacity;
        long[] $this$initializeStorage_u24lambda_u241;
        if (initialCapacity > 0) {
            newCapacity = Math.max(7, ScatterMapKt.normalizeCapacity(initialCapacity));
        } else {
            newCapacity = 0;
        }
        this._capacity = newCapacity;
        initializeMetadata(newCapacity);
        this.elements = newCapacity == 0 ? ContainerHelpersKt.EMPTY_OBJECTS : new Object[newCapacity];
        if (newCapacity == 0) {
            $this$initializeStorage_u24lambda_u241 = SieveCacheKt.getEmptyNodes();
        } else {
            $this$initializeStorage_u24lambda_u241 = new long[newCapacity];
            ArraysKt.fill$default($this$initializeStorage_u24lambda_u241, 4611686018427387903L, 0, 0, 6, (Object) null);
        }
        this.nodes = $this$initializeStorage_u24lambda_u241;
    }

    private final void initializeMetadata(int capacity) {
        long[] jArr;
        if (capacity == 0) {
            jArr = ScatterMapKt.EmptyGroup;
        } else {
            int size = ((((capacity + 1) + 7) + 7) & (-8)) >> 3;
            long[] $this$initializeMetadata_u24lambda_u242 = new long[size];
            ArraysKt.fill$default($this$initializeMetadata_u24lambda_u242, -9187201950435737472L, 0, 0, 6, (Object) null);
            jArr = $this$initializeMetadata_u24lambda_u242;
        }
        this.metadata = jArr;
        long[] data$iv = this.metadata;
        int i$iv = capacity >> 3;
        int b$iv = (capacity & 7) << 3;
        data$iv[i$iv] = (data$iv[i$iv] & (~(255 << b$iv))) | (255 << b$iv);
        initializeGrowth();
    }

    private final void initializeGrowth() {
        this.growthLimit = ScatterMapKt.loadedCapacity(get_capacity()) - this._size;
    }

    public final boolean add(E element) {
        int oldSize = get_size();
        int index = findAbsoluteInsertIndex(element);
        this.elements[index] = element;
        long[] jArr = this.nodes;
        int next$iv$iv = this.head;
        jArr[index] = (((long) next$iv$iv) & SieveCacheKt.NodeLinkMask) | 4611686016279904256L;
        if (this.head != Integer.MAX_VALUE) {
            long[] jArr2 = this.nodes;
            int i = this.head;
            long node$iv$iv = this.nodes[this.head];
            jArr2[i] = (SieveCacheKt.NodeMetaAndNextMask & node$iv$iv) | ((((long) index) & SieveCacheKt.NodeLinkMask) << 31);
        }
        this.head = index;
        if (this.tail == Integer.MAX_VALUE) {
            this.tail = index;
        }
        return get_size() != oldSize;
    }

    public final void plusAssign(E element) {
        int index = findAbsoluteInsertIndex(element);
        this.elements[index] = element;
        long[] jArr = this.nodes;
        int next$iv$iv = this.head;
        jArr[index] = (((long) next$iv$iv) & SieveCacheKt.NodeLinkMask) | 4611686016279904256L;
        if (this.head != Integer.MAX_VALUE) {
            long[] jArr2 = this.nodes;
            int i = this.head;
            long node$iv$iv = this.nodes[this.head];
            jArr2[i] = (SieveCacheKt.NodeMetaAndNextMask & node$iv$iv) | ((((long) index) & SieveCacheKt.NodeLinkMask) << 31);
        }
        this.head = index;
        if (this.tail != Integer.MAX_VALUE) {
            return;
        }
        this.tail = index;
    }

    public final boolean addAll(E[] elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        int oldSize = get_size();
        plusAssign((Object[]) elements);
        return oldSize != get_size();
    }

    public final boolean addAll(Iterable<? extends E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        int oldSize = get_size();
        plusAssign((Iterable) elements);
        return oldSize != get_size();
    }

    public final boolean addAll(Sequence<? extends E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        int oldSize = get_size();
        plusAssign((Sequence) elements);
        return oldSize != get_size();
    }

    public final boolean addAll(OrderedScatterSet<E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        int oldSize = get_size();
        plusAssign((OrderedScatterSet) elements);
        return oldSize != get_size();
    }

    public final boolean addAll(ScatterSet<E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        int oldSize = get_size();
        plusAssign((ScatterSet) elements);
        return oldSize != get_size();
    }

    public final boolean addAll(ObjectList<E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        int oldSize = get_size();
        plusAssign((ObjectList) elements);
        return oldSize != get_size();
    }

    public final void plusAssign(E[] elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        for (E e : elements) {
            plusAssign(e);
        }
    }

    public final void plusAssign(Iterable<? extends E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        Iterator<? extends E> it = elements.iterator();
        while (it.hasNext()) {
            plusAssign(it.next());
        }
    }

    public final void plusAssign(Sequence<? extends E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        Iterator<? extends E> it = elements.iterator();
        while (it.hasNext()) {
            plusAssign(it.next());
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void plusAssign(OrderedScatterSet<E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        Object[] elements$iv = elements.elements;
        long[] nodes$iv = elements.nodes;
        int candidate$iv = elements.tail;
        while (candidate$iv != Integer.MAX_VALUE) {
            long $this$previousNode$iv$iv = nodes$iv[candidate$iv];
            int previousNode$iv = (int) (($this$previousNode$iv$iv >> 31) & SieveCacheKt.NodeLinkMask);
            Object element = elements$iv[candidate$iv];
            plusAssign(element);
            candidate$iv = previousNode$iv;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void plusAssign(ScatterSet<E> elements) {
        ScatterSet<E> scatterSet;
        Intrinsics.checkNotNullParameter(elements, "elements");
        ScatterSet<E> scatterSet2 = elements;
        Object[] elements$iv = scatterSet2.elements;
        long[] m$iv$iv = scatterSet2.metadata;
        int lastIndex$iv$iv = m$iv$iv.length - 2;
        int i$iv$iv = 0;
        if (0 > lastIndex$iv$iv) {
            return;
        }
        while (true) {
            long slot$iv$iv = m$iv$iv[i$iv$iv];
            long $this$maskEmptyOrDeleted$iv$iv$iv = ((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L);
            if ($this$maskEmptyOrDeleted$iv$iv$iv == -9187201950435737472L) {
                scatterSet = scatterSet2;
            } else {
                int i = 8;
                int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                int j$iv$iv = 0;
                while (j$iv$iv < bitCount$iv$iv) {
                    long value$iv$iv$iv = 255 & slot$iv$iv;
                    if (value$iv$iv$iv < 128) {
                        int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                        Object element = elements$iv[index$iv$iv];
                        plusAssign(element);
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
            scatterSet2 = scatterSet;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void plusAssign(ObjectList<E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        Object[] content$iv = elements.content;
        int i = elements._size;
        for (int i$iv = 0; i$iv < i; i$iv++) {
            Object element = content$iv[i$iv];
            plusAssign(element);
        }
    }

    public final boolean remove(E element) {
        int index$iv;
        MutableOrderedScatterSet<E> this_$iv = this;
        int $i$f$findElementIndex$collection = 0;
        int hash$iv$iv = (element != null ? element.hashCode() : 0) * ScatterMapKt.MurmurHashC1;
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
            int $i$f$findElementIndex$collection2 = $i$f$findElementIndex$collection;
            int hash$iv2 = hash$iv;
            long m$iv = (x$iv$iv - ScatterMapKt.BitmaskLsb) & (~x$iv$iv) & (-9187201950435737472L);
            while (true) {
                long $this$hasNext$iv$iv = m$iv;
                if ($this$hasNext$iv$iv != 0) {
                    long $this$get$iv$iv = m$iv;
                    index$iv = ((Long.numberOfTrailingZeros($this$get$iv$iv) >> 3) + probeOffset$iv) & probeMask$iv;
                    if (Intrinsics.areEqual(this_$iv.elements[index$iv], element)) {
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
                $i$f$findElementIndex$collection = $i$f$findElementIndex$collection2;
                hash$iv = hash$iv2;
            } else {
                index$iv = -1;
                break;
            }
        }
        boolean exists = index$iv >= 0;
        if (exists) {
            removeElementAt(index$iv);
        }
        return exists;
    }

    public final void minusAssign(E element) {
        int index$iv;
        MutableOrderedScatterSet<E> this_$iv = this;
        int $i$f$findElementIndex$collection = 0;
        int hash$iv$iv = (element != null ? element.hashCode() : 0) * ScatterMapKt.MurmurHashC1;
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
            int $i$f$findElementIndex$collection2 = $i$f$findElementIndex$collection;
            int hash$iv2 = hash$iv;
            long m$iv = (x$iv$iv - ScatterMapKt.BitmaskLsb) & (~x$iv$iv) & (-9187201950435737472L);
            while (true) {
                long $this$hasNext$iv$iv = m$iv;
                if ($this$hasNext$iv$iv != 0) {
                    long $this$get$iv$iv = m$iv;
                    index$iv = ((Long.numberOfTrailingZeros($this$get$iv$iv) >> 3) + probeOffset$iv) & probeMask$iv;
                    if (Intrinsics.areEqual(this_$iv.elements[index$iv], element)) {
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
                $i$f$findElementIndex$collection = $i$f$findElementIndex$collection2;
                hash$iv = hash$iv2;
            } else {
                index$iv = -1;
                break;
            }
        }
        if (index$iv >= 0) {
            removeElementAt(index$iv);
        }
    }

    public final boolean removeAll(E[] elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        int oldSize = get_size();
        minusAssign((Object[]) elements);
        return oldSize != get_size();
    }

    public final boolean removeAll(Sequence<? extends E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        int oldSize = get_size();
        minusAssign((Sequence) elements);
        return oldSize != get_size();
    }

    public final boolean removeAll(Iterable<? extends E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        int oldSize = get_size();
        minusAssign((Iterable) elements);
        return oldSize != get_size();
    }

    public final boolean removeAll(OrderedScatterSet<E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        int oldSize = get_size();
        minusAssign((OrderedScatterSet) elements);
        return oldSize != get_size();
    }

    public final boolean removeAll(ScatterSet<E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        int oldSize = get_size();
        minusAssign((ScatterSet) elements);
        return oldSize != get_size();
    }

    public final boolean removeAll(ObjectList<E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        int oldSize = get_size();
        minusAssign((ObjectList) elements);
        return oldSize != get_size();
    }

    public final void minusAssign(E[] elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        for (E e : elements) {
            minusAssign(e);
        }
    }

    public final void minusAssign(Sequence<? extends E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        Iterator<? extends E> it = elements.iterator();
        while (it.hasNext()) {
            minusAssign(it.next());
        }
    }

    public final void minusAssign(Iterable<? extends E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        Iterator<? extends E> it = elements.iterator();
        while (it.hasNext()) {
            minusAssign(it.next());
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void minusAssign(OrderedScatterSet<E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        Object[] elements$iv = elements.elements;
        long[] nodes$iv = elements.nodes;
        int candidate$iv = elements.tail;
        while (candidate$iv != Integer.MAX_VALUE) {
            long $this$previousNode$iv$iv = nodes$iv[candidate$iv];
            int previousNode$iv = (int) (($this$previousNode$iv$iv >> 31) & SieveCacheKt.NodeLinkMask);
            Object element = elements$iv[candidate$iv];
            minusAssign(element);
            candidate$iv = previousNode$iv;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void minusAssign(ScatterSet<E> elements) {
        ScatterSet<E> scatterSet;
        Intrinsics.checkNotNullParameter(elements, "elements");
        ScatterSet<E> scatterSet2 = elements;
        Object[] elements$iv = scatterSet2.elements;
        long[] m$iv$iv = scatterSet2.metadata;
        int lastIndex$iv$iv = m$iv$iv.length - 2;
        int i$iv$iv = 0;
        if (0 > lastIndex$iv$iv) {
            return;
        }
        while (true) {
            long slot$iv$iv = m$iv$iv[i$iv$iv];
            long $this$maskEmptyOrDeleted$iv$iv$iv = ((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L);
            if ($this$maskEmptyOrDeleted$iv$iv$iv == -9187201950435737472L) {
                scatterSet = scatterSet2;
            } else {
                int i = 8;
                int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                int j$iv$iv = 0;
                while (j$iv$iv < bitCount$iv$iv) {
                    long value$iv$iv$iv = 255 & slot$iv$iv;
                    if (value$iv$iv$iv < 128) {
                        int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                        Object element = elements$iv[index$iv$iv];
                        minusAssign(element);
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
            scatterSet2 = scatterSet;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void minusAssign(ObjectList<E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        Object[] content$iv = elements.content;
        int i = elements._size;
        for (int i$iv = 0; i$iv < i; i$iv++) {
            Object element = content$iv[i$iv];
            minusAssign(element);
        }
    }

    public final void removeIf(Function1<? super E, Boolean> predicate) {
        int i;
        Intrinsics.checkNotNullParameter(predicate, "predicate");
        Object[] elements = this.elements;
        MutableOrderedScatterSet<E> this_$iv = this;
        long[] m$iv = this_$iv.metadata;
        int lastIndex$iv = m$iv.length - 2;
        int i$iv = 0;
        if (0 > lastIndex$iv) {
            return;
        }
        while (true) {
            long slot$iv = m$iv[i$iv];
            long $this$maskEmptyOrDeleted$iv$iv = ((~slot$iv) << 7) & slot$iv & (-9187201950435737472L);
            if ($this$maskEmptyOrDeleted$iv$iv != -9187201950435737472L) {
                int i2 = 8;
                int bitCount$iv = 8 - ((~(i$iv - lastIndex$iv)) >>> 31);
                int j$iv = 0;
                while (j$iv < bitCount$iv) {
                    long value$iv$iv = 255 & slot$iv;
                    if (!(value$iv$iv < 128)) {
                        i = i2;
                    } else {
                        int index$iv = (i$iv << 3) + j$iv;
                        i = i2;
                        if (predicate.invoke(elements[index$iv]).booleanValue()) {
                            removeElementAt(index$iv);
                        }
                    }
                    slot$iv >>= i;
                    j$iv++;
                    i2 = i;
                }
                if (bitCount$iv != i2) {
                    return;
                }
            }
            if (i$iv == lastIndex$iv) {
                return;
            } else {
                i$iv++;
            }
        }
    }

    /* JADX WARN: Code duplicated, block: B:21:0x0074 A[DONT_INVERT] */
    /* JADX WARN: Code duplicated, block: B:22:0x0076 A[LOOP:0: B:4:0x001a->B:22:0x0076, LOOP_END] */
    /* JADX WARN: Code duplicated, block: B:30:0x007c A[EDGE_INSN: B:30:0x007c->B:24:0x007c BREAK  A[LOOP:0: B:4:0x001a->B:22:0x0076], SYNTHETIC] */
    public final boolean retainAll(Collection<? extends E> elements) {
        int i;
        Collection<? extends E> elements2 = elements;
        Intrinsics.checkNotNullParameter(elements2, "elements");
        Object[] internalElements = this.elements;
        int startSize = this._size;
        MutableOrderedScatterSet<E> this_$iv = this;
        long[] m$iv = this_$iv.metadata;
        int lastIndex$iv = m$iv.length - 2;
        int i$iv = 0;
        if (0 <= lastIndex$iv) {
            while (true) {
                long slot$iv = m$iv[i$iv];
                if ((((~slot$iv) << 7) & slot$iv & (-9187201950435737472L)) == -9187201950435737472L) {
                    if (i$iv != lastIndex$iv) {
                        break;
                        break;
                    }
                    i$iv++;
                    elements2 = elements;
                } else {
                    int i2 = 8;
                    int bitCount$iv = 8 - ((~(i$iv - lastIndex$iv)) >>> 31);
                    int j$iv = 0;
                    while (j$iv < bitCount$iv) {
                        long value$iv$iv = 255 & slot$iv;
                        if (!(value$iv$iv < 128)) {
                            i = i2;
                        } else {
                            int index$iv = (i$iv << 3) + j$iv;
                            i = i2;
                            if (!CollectionsKt.contains(elements2, internalElements[index$iv])) {
                                removeElementAt(index$iv);
                            }
                        }
                        slot$iv >>= i;
                        j$iv++;
                        elements2 = elements;
                        i2 = i;
                    }
                    if (bitCount$iv != i2) {
                        break;
                    }
                    if (i$iv != lastIndex$iv) {
                        break;
                    }
                    i$iv++;
                    elements2 = elements;
                }
            }
        }
        return startSize != this._size;
    }

    /* JADX WARN: Code duplicated, block: B:21:0x006d A[DONT_INVERT] */
    /* JADX WARN: Code duplicated, block: B:22:0x006f A[LOOP:0: B:4:0x001a->B:22:0x006f, LOOP_END] */
    /* JADX WARN: Code duplicated, block: B:30:0x0073 A[EDGE_INSN: B:30:0x0073->B:24:0x0073 BREAK  A[LOOP:0: B:4:0x001a->B:22:0x006f], SYNTHETIC] */
    /* JADX WARN: Multi-variable type inference failed */
    public final boolean retainAll(OrderedScatterSet<E> elements) {
        int i;
        Intrinsics.checkNotNullParameter(elements, "elements");
        Object[] internalElements = this.elements;
        int startSize = this._size;
        MutableOrderedScatterSet<E> this_$iv = this;
        long[] m$iv = this_$iv.metadata;
        int lastIndex$iv = m$iv.length - 2;
        int i$iv = 0;
        if (0 <= lastIndex$iv) {
            while (true) {
                long slot$iv = m$iv[i$iv];
                if ((((~slot$iv) << 7) & slot$iv & (-9187201950435737472L)) == -9187201950435737472L) {
                    if (i$iv != lastIndex$iv) {
                        break;
                        break;
                    }
                    i$iv++;
                } else {
                    int i2 = 8;
                    int bitCount$iv = 8 - ((~(i$iv - lastIndex$iv)) >>> 31);
                    int j$iv = 0;
                    while (j$iv < bitCount$iv) {
                        long value$iv$iv = 255 & slot$iv;
                        if (!(value$iv$iv < 128)) {
                            i = i2;
                        } else {
                            int index$iv = (i$iv << 3) + j$iv;
                            i = i2;
                            if (!elements.contains(internalElements[index$iv])) {
                                removeElementAt(index$iv);
                            }
                        }
                        slot$iv >>= i;
                        j$iv++;
                        i2 = i;
                    }
                    if (bitCount$iv != i2) {
                        break;
                    }
                    if (i$iv != lastIndex$iv) {
                        break;
                    }
                    i$iv++;
                }
            }
        }
        return startSize != this._size;
    }

    /* JADX WARN: Code duplicated, block: B:21:0x006d A[DONT_INVERT] */
    /* JADX WARN: Code duplicated, block: B:22:0x006f A[LOOP:0: B:4:0x001a->B:22:0x006f, LOOP_END] */
    /* JADX WARN: Code duplicated, block: B:30:0x0073 A[EDGE_INSN: B:30:0x0073->B:24:0x0073 BREAK  A[LOOP:0: B:4:0x001a->B:22:0x006f], SYNTHETIC] */
    /* JADX WARN: Multi-variable type inference failed */
    public final boolean retainAll(ScatterSet<E> elements) {
        int i;
        Intrinsics.checkNotNullParameter(elements, "elements");
        Object[] internalElements = this.elements;
        int startSize = this._size;
        MutableOrderedScatterSet<E> this_$iv = this;
        long[] m$iv = this_$iv.metadata;
        int lastIndex$iv = m$iv.length - 2;
        int i$iv = 0;
        if (0 <= lastIndex$iv) {
            while (true) {
                long slot$iv = m$iv[i$iv];
                if ((((~slot$iv) << 7) & slot$iv & (-9187201950435737472L)) == -9187201950435737472L) {
                    if (i$iv != lastIndex$iv) {
                        break;
                        break;
                    }
                    i$iv++;
                } else {
                    int i2 = 8;
                    int bitCount$iv = 8 - ((~(i$iv - lastIndex$iv)) >>> 31);
                    int j$iv = 0;
                    while (j$iv < bitCount$iv) {
                        long value$iv$iv = 255 & slot$iv;
                        if (!(value$iv$iv < 128)) {
                            i = i2;
                        } else {
                            int index$iv = (i$iv << 3) + j$iv;
                            i = i2;
                            if (!elements.contains(internalElements[index$iv])) {
                                removeElementAt(index$iv);
                            }
                        }
                        slot$iv >>= i;
                        j$iv++;
                        i2 = i;
                    }
                    if (bitCount$iv != i2) {
                        break;
                    }
                    if (i$iv != lastIndex$iv) {
                        break;
                    }
                    i$iv++;
                }
            }
        }
        return startSize != this._size;
    }

    /* JADX WARN: Code duplicated, block: B:22:0x007d A[DONT_INVERT] */
    /* JADX WARN: Code duplicated, block: B:23:0x007f A[LOOP:0: B:4:0x001d->B:23:0x007f, LOOP_END] */
    /* JADX WARN: Code duplicated, block: B:31:0x0083 A[EDGE_INSN: B:31:0x0083->B:25:0x0083 BREAK  A[LOOP:0: B:4:0x001d->B:23:0x007f], SYNTHETIC] */
    public final boolean retainAll(Function1<? super E, Boolean> predicate) {
        int i;
        Intrinsics.checkNotNullParameter(predicate, "predicate");
        Object[] elements = this.elements;
        int startSize = get_size();
        MutableOrderedScatterSet<E> this_$iv = this;
        long[] m$iv = this_$iv.metadata;
        int lastIndex$iv = m$iv.length - 2;
        int i$iv = 0;
        if (0 <= lastIndex$iv) {
            while (true) {
                long slot$iv = m$iv[i$iv];
                if ((((~slot$iv) << 7) & slot$iv & (-9187201950435737472L)) == -9187201950435737472L) {
                    if (i$iv != lastIndex$iv) {
                        break;
                        break;
                    }
                    i$iv++;
                } else {
                    int i2 = 8;
                    int bitCount$iv = 8 - ((~(i$iv - lastIndex$iv)) >>> 31);
                    int j$iv = 0;
                    while (j$iv < bitCount$iv) {
                        long value$iv$iv = 255 & slot$iv;
                        if (!(value$iv$iv < 128)) {
                            i = i2;
                        } else {
                            int index$iv = (i$iv << 3) + j$iv;
                            i = i2;
                            if (!predicate.invoke(elements[index$iv]).booleanValue()) {
                                removeElementAt(index$iv);
                            }
                        }
                        slot$iv >>= i;
                        j$iv++;
                        i2 = i;
                    }
                    if (bitCount$iv != i2) {
                        break;
                    }
                    if (i$iv != lastIndex$iv) {
                        break;
                    }
                    i$iv++;
                }
            }
        }
        return startSize != get_size();
    }

    public final void removeElementAt(int index) {
        this._size--;
        long[] data$iv = this.metadata;
        int capacity$iv = this._capacity;
        int i$iv$iv = index >> 3;
        int b$iv$iv = (index & 7) << 3;
        data$iv[i$iv$iv] = (data$iv[i$iv$iv] & (~(255 << b$iv$iv))) | (254 << b$iv$iv);
        int $i$f$writeRawMetadata = index - 7;
        int cloneIndex$iv = ($i$f$writeRawMetadata & capacity$iv) + (capacity$iv & 7);
        data$iv[cloneIndex$iv >> 3] = data$iv[index >> 3];
        this.elements[index] = null;
        long[] nodes$iv = this.nodes;
        long node$iv = nodes$iv[index];
        int previousIndex$iv = (int) ((node$iv >> 31) & SieveCacheKt.NodeLinkMask);
        int nextIndex$iv = (int) (node$iv & SieveCacheKt.NodeLinkMask);
        if (previousIndex$iv == Integer.MAX_VALUE) {
            this.head = nextIndex$iv;
        } else {
            long node$iv$iv = nodes$iv[previousIndex$iv];
            nodes$iv[previousIndex$iv] = (((long) nextIndex$iv) & SieveCacheKt.NodeLinkMask) | (SieveCacheKt.NodeMetaAndPreviousMask & node$iv$iv);
        }
        if (nextIndex$iv != Integer.MAX_VALUE) {
            long node$iv$iv2 = nodes$iv[nextIndex$iv];
            nodes$iv[nextIndex$iv] = (SieveCacheKt.NodeMetaAndNextMask & node$iv$iv2) | ((((long) previousIndex$iv) & SieveCacheKt.NodeLinkMask) << 31);
        } else {
            this.tail = previousIndex$iv;
        }
        nodes$iv[index] = 4611686018427387903L;
    }

    private final void moveNodeToHead(int index) {
        long[] jArr = this.nodes;
        int next$iv = this.head;
        jArr[index] = (((long) next$iv) & SieveCacheKt.NodeLinkMask) | 4611686016279904256L;
        if (this.head != Integer.MAX_VALUE) {
            long[] jArr2 = this.nodes;
            int i = this.head;
            long node$iv = this.nodes[this.head];
            jArr2[i] = (SieveCacheKt.NodeMetaAndNextMask & node$iv) | ((((long) index) & SieveCacheKt.NodeLinkMask) << 31);
        }
        this.head = index;
        if (this.tail == Integer.MAX_VALUE) {
            this.tail = index;
        }
    }

    private final void removeNode(int index) {
        long[] nodes = this.nodes;
        long node = nodes[index];
        int previousIndex = (int) ((node >> 31) & SieveCacheKt.NodeLinkMask);
        int nextIndex = (int) (node & SieveCacheKt.NodeLinkMask);
        if (previousIndex != Integer.MAX_VALUE) {
            long node$iv = nodes[previousIndex];
            nodes[previousIndex] = (((long) nextIndex) & SieveCacheKt.NodeLinkMask) | (SieveCacheKt.NodeMetaAndPreviousMask & node$iv);
        } else {
            this.head = nextIndex;
        }
        if (nextIndex != Integer.MAX_VALUE) {
            long node$iv2 = nodes[nextIndex];
            nodes[nextIndex] = (SieveCacheKt.NodeMetaAndNextMask & node$iv2) | ((((long) previousIndex) & SieveCacheKt.NodeLinkMask) << 31);
        } else {
            this.tail = previousIndex;
        }
        nodes[index] = 4611686018427387903L;
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
        ArraysKt.fill(this.elements, (Object) null, 0, this._capacity);
        ArraysKt.fill$default(this.nodes, 4611686018427387903L, 0, 0, 6, (Object) null);
        this.head = Integer.MAX_VALUE;
        this.tail = Integer.MAX_VALUE;
        initializeGrowth();
    }

    private final int findAbsoluteInsertIndex(E element) {
        int hash$iv = (element != null ? element.hashCode() : 0) * ScatterMapKt.MurmurHashC1;
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
                    if (Intrinsics.areEqual(this.elements[index], element)) {
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
                return index2;
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

    public final void trimToSize(int maxSize) {
        long[] nodes = this.nodes;
        int candidate = this.head;
        while (candidate != Integer.MAX_VALUE && this._size > maxSize && this._size != 0) {
            long $this$nextNode$iv = nodes[candidate];
            int nextNode = (int) (SieveCacheKt.NodeLinkMask & $this$nextNode$iv);
            removeElementAt(candidate);
            candidate = nextNode;
        }
    }

    public final void adjustStorage$collection() {
        if (this._capacity > 8 && Long.compare(ULong.m643constructorimpl(ULong.m643constructorimpl(this._size) * 32) ^ Long.MIN_VALUE, ULong.m643constructorimpl(ULong.m643constructorimpl(this._capacity) * 25) ^ Long.MIN_VALUE) <= 0) {
            dropDeletes$collection();
        } else {
            resizeStorage$collection(ScatterMapKt.nextCapacity(this._capacity));
        }
    }

    public final void dropDeletes$collection() {
        int src;
        long[] metadata = this.metadata;
        if (metadata == null) {
            return;
        }
        int capacity = this._capacity;
        Object[] elements = this.elements;
        long[] nodes = this.nodes;
        long[] indexMapping = new long[capacity];
        long j = SieveCacheKt.InvalidMapping;
        int newProbeIndex = 0;
        ArraysKt.fill(indexMapping, SieveCacheKt.InvalidMapping, 0, capacity);
        int end$iv = (capacity + 7) >> 3;
        for (int i$iv = 0; i$iv < end$iv; i$iv++) {
            long maskedGroup$iv = metadata[i$iv] & (-9187201950435737472L);
            metadata[i$iv] = ((~maskedGroup$iv) + (maskedGroup$iv >>> 7)) & (-72340172838076674L);
        }
        int lastIndex$iv = ArraysKt.getLastIndex(metadata);
        metadata[lastIndex$iv - 1] = (metadata[lastIndex$iv - 1] & 72057594037927935L) | (-72057594037927936L);
        metadata[lastIndex$iv] = metadata[0];
        int index = 0;
        while (index != capacity) {
            long m = (metadata[index >> 3] >> ((index & 7) << 3)) & 255;
            if (m == 128) {
                index++;
            } else if (m != 254) {
                index++;
            } else {
                Object k$iv = elements[index];
                int hash$iv = (k$iv != null ? k$iv.hashCode() : newProbeIndex) * ScatterMapKt.MurmurHashC1;
                int hash = hash$iv ^ (hash$iv << 16);
                int $i$f$h1 = hash >>> 7;
                long j2 = j;
                int targetIndex = findFirstAvailableSlot($i$f$h1);
                int probeOffset = $i$f$h1 & capacity;
                int i = newProbeIndex;
                int newProbeIndex2 = ((targetIndex - probeOffset) & capacity) / 8;
                int oldProbeIndex = ((index - probeOffset) & capacity) / 8;
                if (newProbeIndex2 != oldProbeIndex) {
                    int capacity2 = capacity;
                    Object[] elements2 = elements;
                    if (((metadata[targetIndex >> 3] >> ((targetIndex & 7) << 3)) & 255) == 128) {
                        int $i$f$h2 = hash & WorkQueueKt.MASK;
                        long value$iv = $i$f$h2;
                        int i$iv2 = targetIndex >> 3;
                        int b$iv = (targetIndex & 7) << 3;
                        metadata[i$iv2] = (metadata[i$iv2] & (~(255 << b$iv))) | (value$iv << b$iv);
                        int i$iv3 = index >> 3;
                        int b$iv2 = (index & 7) << 3;
                        metadata[i$iv3] = (metadata[i$iv3] & (~(255 << b$iv2))) | (128 << b$iv2);
                        elements2[targetIndex] = elements2[index];
                        elements2[index] = null;
                        nodes[targetIndex] = nodes[index];
                        nodes[index] = 4611686018427387903L;
                        long mapping = indexMapping[index];
                        int src2 = (int) ((mapping >> 32) & 4294967295L);
                        if (src2 != Integer.MAX_VALUE) {
                            long mapping$iv = indexMapping[src2];
                            indexMapping[src2] = ((long) targetIndex) | (mapping$iv & (-4294967296L));
                            long mapping$iv2 = indexMapping[index];
                            indexMapping[index] = (mapping$iv2 & 4294967295L) | (-4294967296L);
                        } else {
                            indexMapping[index] = (((long) Integer.MAX_VALUE) << 32) | ((long) targetIndex);
                        }
                        indexMapping[targetIndex] = (((long) index) << 32) | ((long) Integer.MAX_VALUE);
                    } else {
                        int $i$f$h3 = hash & WorkQueueKt.MASK;
                        long value$iv2 = $i$f$h3;
                        int i$iv4 = targetIndex >> 3;
                        int b$iv3 = (targetIndex & 7) << 3;
                        metadata[i$iv4] = ((~(255 << b$iv3)) & metadata[i$iv4]) | (value$iv2 << b$iv3);
                        Object oldElement = elements2[targetIndex];
                        elements2[targetIndex] = elements2[index];
                        elements2[index] = oldElement;
                        long oldNode = nodes[targetIndex];
                        nodes[targetIndex] = nodes[index];
                        nodes[index] = oldNode;
                        long mapping2 = indexMapping[index];
                        int src3 = (int) ((mapping2 >> 32) & 4294967295L);
                        if (src3 != Integer.MAX_VALUE) {
                            long mapping$iv3 = indexMapping[src3];
                            indexMapping[src3] = (mapping$iv3 & (-4294967296L)) | ((long) targetIndex);
                            long mapping$iv4 = indexMapping[index];
                            long mapping$iv5 = targetIndex;
                            indexMapping[index] = (mapping$iv5 << 32) | (mapping$iv4 & 4294967295L);
                            src = src3;
                        } else {
                            indexMapping[index] = (((long) targetIndex) << 32) | ((long) targetIndex);
                            src = index;
                        }
                        indexMapping[targetIndex] = (((long) src) << 32) | ((long) index);
                        index--;
                    }
                    metadata[metadata.length - 1] = metadata[i];
                    index++;
                    nodes = nodes;
                    capacity = capacity2;
                    j = j2;
                    newProbeIndex = i;
                    elements = elements2;
                } else {
                    int $i$f$h4 = hash & WorkQueueKt.MASK;
                    int capacity3 = capacity;
                    Object[] elements3 = elements;
                    long value$iv3 = $i$f$h4;
                    int i$iv5 = index >> 3;
                    int b$iv4 = (index & 7) << 3;
                    metadata[i$iv5] = (metadata[i$iv5] & (~(255 << b$iv4))) | (value$iv3 << b$iv4);
                    long value$iv4 = indexMapping[index];
                    if (value$iv4 == j2) {
                        indexMapping[index] = ((long) index) | (((long) index) << 32);
                    }
                    metadata[metadata.length - 1] = metadata[i];
                    index++;
                    capacity = capacity3;
                    j = j2;
                    newProbeIndex = i;
                    elements = elements3;
                }
            }
        }
        initializeGrowth();
        fixupNodes(indexMapping);
    }

    public final void resizeStorage$collection(int newCapacity) {
        long[] previousMetadata = this.metadata;
        Object[] previousElements = this.elements;
        long[] previousNodes = this.nodes;
        int previousCapacity = this._capacity;
        int[] indexMapping = new int[previousCapacity];
        initializeStorage(newCapacity);
        long[] newMetadata = this.metadata;
        Object[] newElements = this.elements;
        long[] newNodes = this.nodes;
        int capacity = this._capacity;
        int i = 0;
        while (i < previousCapacity) {
            if (((previousMetadata[i >> 3] >> ((i & 7) << 3)) & 255) < 128) {
                Object previousKey = previousElements[i];
                int hash$iv = (previousKey != null ? previousKey.hashCode() : 0) * ScatterMapKt.MurmurHashC1;
                int $i$f$hash = hash$iv ^ (hash$iv << 16);
                int $i$f$h1 = $i$f$hash >>> 7;
                int index = findFirstAvailableSlot($i$f$h1);
                int $i$f$h2 = $i$f$hash & WorkQueueKt.MASK;
                long value$iv = $i$f$h2;
                int i$iv$iv = index >> 3;
                int b$iv$iv = (index & 7) << 3;
                long value$iv2 = 255 << b$iv$iv;
                newMetadata[i$iv$iv] = (newMetadata[i$iv$iv] & (~value$iv2)) | (value$iv << b$iv$iv);
                int cloneIndex$iv = ((index - 7) & capacity) + (capacity & 7);
                newMetadata[cloneIndex$iv >> 3] = newMetadata[index >> 3];
                newElements[index] = previousKey;
                newNodes[index] = previousNodes[i];
                indexMapping[i] = index;
            }
            i++;
            previousMetadata = previousMetadata;
            previousElements = previousElements;
        }
        fixupNodes(indexMapping);
    }

    private final void fixupNodes(long[] mapping) {
        long j;
        int i;
        long[] nodes = this.nodes;
        int i2 = 0;
        int length = nodes.length;
        while (true) {
            int $i$f$getDst = Integer.MAX_VALUE;
            if (i2 >= length) {
                break;
            }
            long node = nodes[i2];
            int previous = (int) ((node >> 31) & SieveCacheKt.NodeLinkMask);
            int next = (int) (node & SieveCacheKt.NodeLinkMask);
            long j2 = SieveCacheKt.NodeMetaMask & node;
            if (previous == Integer.MAX_VALUE) {
                i = Integer.MAX_VALUE;
                j = 4294967295L;
            } else {
                long $this$dst$iv$iv = mapping[previous];
                j = 4294967295L;
                i = (int) ($this$dst$iv$iv & 4294967295L);
            }
            long j3 = (((long) i) | j2) << 31;
            if (next != Integer.MAX_VALUE) {
                long $this$dst$iv$iv2 = mapping[next];
                $i$f$getDst = (int) ($this$dst$iv$iv2 & j);
            }
            long $this$dst$iv$iv3 = $i$f$getDst;
            nodes[i2] = j3 | $this$dst$iv$iv3;
            i2++;
        }
        int i3 = this.head;
        if (i3 != Integer.MAX_VALUE) {
            long $this$dst$iv = mapping[this.head];
            this.head = (int) ($this$dst$iv & 4294967295L);
        }
        if (this.tail != Integer.MAX_VALUE) {
            long $this$dst$iv2 = mapping[this.tail];
            this.tail = (int) ($this$dst$iv2 & 4294967295L);
        }
    }

    private final void fixupNodes(int[] mapping) {
        long[] nodes = this.nodes;
        int i = 0;
        int length = nodes.length;
        while (true) {
            int i2 = Integer.MAX_VALUE;
            if (i >= length) {
                break;
            }
            long node = nodes[i];
            int previous = (int) ((node >> 31) & SieveCacheKt.NodeLinkMask);
            int next = (int) (node & SieveCacheKt.NodeLinkMask);
            long j = ((SieveCacheKt.NodeMetaMask & node) | ((long) (previous == Integer.MAX_VALUE ? Integer.MAX_VALUE : mapping[previous]))) << 31;
            if (next != Integer.MAX_VALUE) {
                i2 = mapping[next];
            }
            nodes[i] = j | ((long) i2);
            i++;
        }
        int i3 = this.head;
        if (i3 != Integer.MAX_VALUE) {
            this.head = mapping[this.head];
        }
        if (this.tail != Integer.MAX_VALUE) {
            this.tail = mapping[this.tail];
        }
    }

    public final Set<E> asMutableSet() {
        return new MutableOrderedSetWrapper(this);
    }
}
