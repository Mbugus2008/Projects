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

/* JADX INFO: compiled from: ScatterSet.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0011\n\u0000\n\u0002\u0010\u001c\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0010#\n\u0002\b\u0015\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u001e\n\u0002\b\u0002\u0018\u0000*\u0004\b\u0000\u0010\u00012\b\u0012\u0004\u0012\u0002H\u00010\u0002B\u000f\u0012\b\b\u0002\u0010\u0003\u001a\u00020\u0004¢\u0006\u0002\u0010\u0005J\u0013\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00028\u0000¢\u0006\u0002\u0010\nJ\u0014\u0010\u000b\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\rJ\u0014\u0010\u000b\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u000eJ\u0014\u0010\u000b\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0002J\u001b\u0010\u000b\u001a\u00020\b2\u000e\u0010\f\u001a\n\u0012\u0006\b\u0001\u0012\u00028\u00000\u000f¢\u0006\u0002\u0010\u0010J\u0014\u0010\u000b\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0011J\u0014\u0010\u000b\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0012J\r\u0010\u0013\u001a\u00020\u0014H\u0000¢\u0006\u0002\b\u0015J\f\u0010\u0016\u001a\b\u0012\u0004\u0012\u00028\u00000\u0017J\u0006\u0010\u0018\u001a\u00020\u0014J\r\u0010\u0019\u001a\u00020\u0014H\u0000¢\u0006\u0002\b\u001aJ\u0015\u0010\u001b\u001a\u00020\u00042\u0006\u0010\t\u001a\u00028\u0000H\u0002¢\u0006\u0002\u0010\u001cJ\u0010\u0010\u001d\u001a\u00020\u00042\u0006\u0010\u001e\u001a\u00020\u0004H\u0002J\b\u0010\u001f\u001a\u00020\u0014H\u0002J\u0010\u0010 \u001a\u00020\u00142\u0006\u0010!\u001a\u00020\u0004H\u0002J\u0010\u0010\"\u001a\u00020\u00142\u0006\u0010\u0003\u001a\u00020\u0004H\u0002J\u0016\u0010#\u001a\u00020\u00142\u0006\u0010\t\u001a\u00028\u0000H\u0086\u0002¢\u0006\u0002\u0010$J\u0017\u0010#\u001a\u00020\u00142\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\rH\u0086\u0002J\u0017\u0010#\u001a\u00020\u00142\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u000eH\u0086\u0002J\u0017\u0010#\u001a\u00020\u00142\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0002H\u0086\u0002J\u001e\u0010#\u001a\u00020\u00142\u000e\u0010\f\u001a\n\u0012\u0006\b\u0001\u0012\u00028\u00000\u000fH\u0086\u0002¢\u0006\u0002\u0010%J\u0017\u0010#\u001a\u00020\u00142\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0011H\u0086\u0002J\u0017\u0010#\u001a\u00020\u00142\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0012H\u0086\u0002J\u0016\u0010&\u001a\u00020\u00142\u0006\u0010\t\u001a\u00028\u0000H\u0086\u0002¢\u0006\u0002\u0010$J\u0017\u0010&\u001a\u00020\u00142\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\rH\u0086\u0002J\u0017\u0010&\u001a\u00020\u00142\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u000eH\u0086\u0002J\u0017\u0010&\u001a\u00020\u00142\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0002H\u0086\u0002J\u001e\u0010&\u001a\u00020\u00142\u000e\u0010\f\u001a\n\u0012\u0006\b\u0001\u0012\u00028\u00000\u000fH\u0086\u0002¢\u0006\u0002\u0010%J\u0017\u0010&\u001a\u00020\u00142\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0011H\u0086\u0002J\u0017\u0010&\u001a\u00020\u00142\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0012H\u0086\u0002J\u0013\u0010'\u001a\u00020\b2\u0006\u0010\t\u001a\u00028\u0000¢\u0006\u0002\u0010\nJ\u0014\u0010(\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\rJ\u0014\u0010(\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u000eJ\u0014\u0010(\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0002J\u001b\u0010(\u001a\u00020\b2\u000e\u0010\f\u001a\n\u0012\u0006\b\u0001\u0012\u00028\u00000\u000f¢\u0006\u0002\u0010\u0010J\u0014\u0010(\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0011J\u0014\u0010(\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0012J\u0010\u0010)\u001a\u00020\u00142\u0006\u0010*\u001a\u00020\u0004H\u0001J \u0010+\u001a\u00020\u00142\u0012\u0010,\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\b0-H\u0086\bø\u0001\u0000J\u0015\u0010.\u001a\u00020\u00142\u0006\u0010/\u001a\u00020\u0004H\u0000¢\u0006\u0002\b0J\u001a\u00101\u001a\u00020\b2\u0012\u0010,\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\b0-J\u0014\u00101\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u000eJ\u0014\u00101\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u00000\u0002J\u0014\u00101\u001a\u00020\b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00028\u000002J\b\u00103\u001a\u00020\u0004H\u0007R\u000e\u0010\u0006\u001a\u00020\u0004X\u0082\u000e¢\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u00064"}, d2 = {"Landroidx/collection/MutableScatterSet;", "E", "Landroidx/collection/ScatterSet;", "initialCapacity", "", "(I)V", "growthLimit", "add", "", "element", "(Ljava/lang/Object;)Z", "addAll", "elements", "Landroidx/collection/ObjectList;", "Landroidx/collection/OrderedScatterSet;", "", "([Ljava/lang/Object;)Z", "", "Lkotlin/sequences/Sequence;", "adjustStorage", "", "adjustStorage$collection", "asMutableSet", "", "clear", "dropDeletes", "dropDeletes$collection", "findAbsoluteInsertIndex", "(Ljava/lang/Object;)I", "findFirstAvailableSlot", "hash1", "initializeGrowth", "initializeMetadata", "capacity", "initializeStorage", "minusAssign", "(Ljava/lang/Object;)V", "([Ljava/lang/Object;)V", "plusAssign", "remove", "removeAll", "removeElementAt", "index", "removeIf", "predicate", "Lkotlin/Function1;", "resizeStorage", "newCapacity", "resizeStorage$collection", "retainAll", "", "trim", "collection"}, k = 1, mv = {1, 9, 0}, xi = 48)
public final class MutableScatterSet<E> extends ScatterSet<E> {
    private int growthLimit;

    public MutableScatterSet() {
        this(0, 1, null);
    }

    public MutableScatterSet(int initialCapacity) {
        super(null);
        boolean value$iv = initialCapacity >= 0;
        if (!value$iv) {
            RuntimeHelpersKt.throwIllegalArgumentException("Capacity must be a positive value.");
        }
        initializeStorage(ScatterMapKt.unloadedCapacity(initialCapacity));
    }

    public /* synthetic */ MutableScatterSet(int i, int i2, DefaultConstructorMarker defaultConstructorMarker) {
        this((i2 & 1) != 0 ? 6 : i);
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
        this.elements = newCapacity == 0 ? ContainerHelpersKt.EMPTY_OBJECTS : new Object[newCapacity];
    }

    private final void initializeMetadata(int capacity) {
        long[] jArr;
        if (capacity == 0) {
            jArr = ScatterMapKt.EmptyGroup;
        } else {
            int size = ((((capacity + 1) + 7) + 7) & (-8)) >> 3;
            long[] $this$initializeMetadata_u24lambda_u241 = new long[size];
            ArraysKt.fill$default($this$initializeMetadata_u24lambda_u241, -9187201950435737472L, 0, 0, 6, (Object) null);
            jArr = $this$initializeMetadata_u24lambda_u241;
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
        return get_size() != oldSize;
    }

    public final void plusAssign(E element) {
        int index = findAbsoluteInsertIndex(element);
        this.elements[index] = element;
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

    public final boolean addAll(ScatterSet<E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        int oldSize = get_size();
        plusAssign((ScatterSet) elements);
        return oldSize != get_size();
    }

    public final boolean addAll(OrderedScatterSet<E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        int oldSize = get_size();
        plusAssign((OrderedScatterSet) elements);
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
        MutableScatterSet<E> this_$iv = this;
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
        MutableScatterSet<E> this_$iv = this;
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

    public final boolean removeAll(ScatterSet<E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        int oldSize = get_size();
        minusAssign((ScatterSet) elements);
        return oldSize != get_size();
    }

    public final boolean removeAll(OrderedScatterSet<E> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        int oldSize = get_size();
        minusAssign((OrderedScatterSet) elements);
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
        MutableScatterSet<E> this_$iv = this;
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
        MutableScatterSet<E> this_$iv = this;
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
    public final boolean retainAll(ScatterSet<E> elements) {
        int i;
        Intrinsics.checkNotNullParameter(elements, "elements");
        Object[] internalElements = this.elements;
        int startSize = this._size;
        MutableScatterSet<E> this_$iv = this;
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
    public final boolean retainAll(OrderedScatterSet<E> elements) {
        int i;
        Intrinsics.checkNotNullParameter(elements, "elements");
        Object[] internalElements = this.elements;
        int startSize = this._size;
        MutableScatterSet<E> this_$iv = this;
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

    /* JADX WARN: Code duplicated, block: B:21:0x0073 A[DONT_INVERT] */
    /* JADX WARN: Code duplicated, block: B:22:0x0075 A[LOOP:0: B:4:0x001a->B:22:0x0075, LOOP_END] */
    /* JADX WARN: Code duplicated, block: B:30:0x0079 A[EDGE_INSN: B:30:0x0079->B:24:0x0079 BREAK  A[LOOP:0: B:4:0x001a->B:22:0x0075], SYNTHETIC] */
    public final boolean retainAll(Function1<? super E, Boolean> predicate) {
        int i;
        Intrinsics.checkNotNullParameter(predicate, "predicate");
        Object[] elements = this.elements;
        int startSize = this._size;
        MutableScatterSet<E> this_$iv = this;
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
        return startSize != this._size;
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

    public final void adjustStorage$collection() {
        if (this._capacity > 8 && Long.compare(ULong.m643constructorimpl(ULong.m643constructorimpl(this._size) * 32) ^ Long.MIN_VALUE, ULong.m643constructorimpl(ULong.m643constructorimpl(this._capacity) * 25) ^ Long.MIN_VALUE) <= 0) {
            dropDeletes$collection();
        } else {
            resizeStorage$collection(ScatterMapKt.nextCapacity(this._capacity));
        }
    }

    public final void dropDeletes$collection() {
        long[] metadata;
        MutableScatterSet<E> mutableScatterSet = this;
        long[] metadata2 = mutableScatterSet.metadata;
        int capacity = mutableScatterSet._capacity;
        Object[] elements = mutableScatterSet.elements;
        int end$iv = (capacity + 7) >> 3;
        for (int i$iv = 0; i$iv < end$iv; i$iv++) {
            long maskedGroup$iv = metadata2[i$iv] & (-9187201950435737472L);
            metadata2[i$iv] = ((~maskedGroup$iv) + (maskedGroup$iv >>> 7)) & (-72340172838076674L);
        }
        int lastIndex$iv = ArraysKt.getLastIndex(metadata2);
        long j = 72057594037927935L;
        metadata2[lastIndex$iv - 1] = (metadata2[lastIndex$iv - 1] & 72057594037927935L) | (-72057594037927936L);
        int newProbeIndex = 0;
        metadata2[lastIndex$iv] = metadata2[0];
        int index = 0;
        while (index != capacity) {
            long m = (metadata2[index >> 3] >> ((index & 7) << 3)) & 255;
            if (m == 128) {
                index++;
            } else if (m != 254) {
                index++;
            } else {
                Object k$iv = elements[index];
                int hash$iv = (k$iv != null ? k$iv.hashCode() : newProbeIndex) * ScatterMapKt.MurmurHashC1;
                int hash = hash$iv ^ (hash$iv << 16);
                int $i$f$h1 = hash >>> 7;
                int targetIndex = mutableScatterSet.findFirstAvailableSlot($i$f$h1);
                int probeOffset = $i$f$h1 & capacity;
                int i = newProbeIndex;
                int newProbeIndex2 = ((targetIndex - probeOffset) & capacity) / 8;
                int oldProbeIndex = ((index - probeOffset) & capacity) / 8;
                if (newProbeIndex2 != oldProbeIndex) {
                    long j2 = j;
                    if (((metadata2[targetIndex >> 3] >> ((targetIndex & 7) << 3)) & 255) != 128) {
                        metadata = metadata2;
                        int $i$f$h2 = hash & WorkQueueKt.MASK;
                        long value$iv = $i$f$h2;
                        int i$iv2 = targetIndex >> 3;
                        int b$iv = (targetIndex & 7) << 3;
                        metadata[i$iv2] = (metadata[i$iv2] & (~(255 << b$iv))) | (value$iv << b$iv);
                        Object oldElement = elements[targetIndex];
                        elements[targetIndex] = elements[index];
                        elements[index] = oldElement;
                        index--;
                    } else {
                        int $i$f$h3 = hash & WorkQueueKt.MASK;
                        long value$iv2 = $i$f$h3;
                        int i$iv3 = targetIndex >> 3;
                        int b$iv2 = (targetIndex & 7) << 3;
                        metadata = metadata2;
                        metadata[i$iv3] = (metadata2[i$iv3] & (~(255 << b$iv2))) | (value$iv2 << b$iv2);
                        int i$iv4 = index >> 3;
                        int b$iv3 = (index & 7) << 3;
                        long value$iv3 = 255 << b$iv3;
                        metadata[i$iv4] = (metadata[i$iv4] & (~value$iv3)) | (128 << b$iv3);
                        elements[targetIndex] = elements[index];
                        elements[index] = null;
                    }
                    metadata[ArraysKt.getLastIndex(metadata)] = (metadata[i] & j2) | Long.MIN_VALUE;
                    index++;
                    mutableScatterSet = this;
                    newProbeIndex = i;
                    j = j2;
                    metadata2 = metadata;
                } else {
                    int $i$f$h4 = hash & WorkQueueKt.MASK;
                    long j3 = j;
                    long value$iv4 = $i$f$h4;
                    int i$iv5 = index >> 3;
                    int b$iv4 = (index & 7) << 3;
                    metadata2[i$iv5] = (metadata2[i$iv5] & (~(255 << b$iv4))) | (value$iv4 << b$iv4);
                    metadata2[ArraysKt.getLastIndex(metadata2)] = (metadata2[i] & j3) | Long.MIN_VALUE;
                    index++;
                    newProbeIndex = i;
                    j = j3;
                }
            }
        }
        initializeGrowth();
    }

    public final void resizeStorage$collection(int newCapacity) {
        long[] previousMetadata = this.metadata;
        Object[] previousElements = this.elements;
        int previousCapacity = this._capacity;
        initializeStorage(newCapacity);
        long[] newMetadata = this.metadata;
        Object[] newElements = this.elements;
        int capacity = this._capacity;
        for (int i = 0; i < previousCapacity; i++) {
            if (((previousMetadata[i >> 3] >> ((i & 7) << 3)) & 255) < 128) {
                Object previousElement = previousElements[i];
                int hash$iv = (previousElement != null ? previousElement.hashCode() : 0) * ScatterMapKt.MurmurHashC1;
                int $i$f$hash = hash$iv ^ (hash$iv << 16);
                int $i$f$h1 = $i$f$hash >>> 7;
                int index = findFirstAvailableSlot($i$f$h1);
                int $i$f$h2 = $i$f$hash & WorkQueueKt.MASK;
                long value$iv = $i$f$h2;
                int i$iv$iv = index >> 3;
                int b$iv$iv = (index & 7) << 3;
                newMetadata[i$iv$iv] = (newMetadata[i$iv$iv] & (~(255 << b$iv$iv))) | (value$iv << b$iv$iv);
                int cloneIndex$iv = ((index - 7) & capacity) + (capacity & 7);
                newMetadata[cloneIndex$iv >> 3] = newMetadata[index >> 3];
                newElements[index] = previousElement;
            }
        }
    }

    public final Set<E> asMutableSet() {
        return new MutableSetWrapper(this);
    }
}
