package androidx.collection;

import androidx.collection.internal.ContainerHelpersKt;
import androidx.collection.internal.RuntimeHelpersKt;
import java.util.Set;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.scheduling.WorkQueueKt;

/* JADX INFO: compiled from: ScatterSet.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\\\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0010\u0011\n\u0002\b\u0003\n\u0002\u0010\u0016\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\"\n\u0002\b\r\n\u0002\u0010\u0002\n\u0002\b\u0007\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\r\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\b6\u0018\u0000*\u0004\b\u0000\u0010\u00012\u00020\u0002B\u0007\b\u0004¢\u0006\u0002\u0010\u0003J:\u0010\u0013\u001a\u00020\u00142!\u0010\u0015\u001a\u001d\u0012\u0013\u0012\u00118\u0000¢\u0006\f\b\u0017\u0012\b\b\u0018\u0012\u0004\b\b(\u0019\u0012\u0004\u0012\u00020\u00140\u0016H\u0086\bø\u0001\u0000\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001J\u0006\u0010\u001a\u001a\u00020\u0014J:\u0010\u001a\u001a\u00020\u00142!\u0010\u0015\u001a\u001d\u0012\u0013\u0012\u00118\u0000¢\u0006\f\b\u0017\u0012\b\b\u0018\u0012\u0004\b\b(\u0019\u0012\u0004\u0012\u00020\u00140\u0016H\u0086\bø\u0001\u0000\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001J\f\u0010\u001b\u001a\b\u0012\u0004\u0012\u00028\u00000\u001cJ\u0016\u0010\u001d\u001a\u00020\u00142\u0006\u0010\u0019\u001a\u00028\u0000H\u0086\u0002¢\u0006\u0002\u0010\u001eJ\b\u0010\u001f\u001a\u00020\u0005H\u0007J:\u0010\u001f\u001a\u00020\u00052!\u0010\u0015\u001a\u001d\u0012\u0013\u0012\u00118\u0000¢\u0006\f\b\u0017\u0012\b\b\u0018\u0012\u0004\b\b(\u0019\u0012\u0004\u0012\u00020\u00140\u0016H\u0087\bø\u0001\u0000\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001J\u0013\u0010 \u001a\u00020\u00142\b\u0010!\u001a\u0004\u0018\u00010\u0002H\u0096\u0002J\u0018\u0010\"\u001a\u00020\u00052\u0006\u0010\u0019\u001a\u00028\u0000H\u0080\b¢\u0006\u0004\b#\u0010$J\u000b\u0010%\u001a\u00028\u0000¢\u0006\u0002\u0010&J?\u0010%\u001a\u00028\u00002!\u0010\u0015\u001a\u001d\u0012\u0013\u0012\u00118\u0000¢\u0006\f\b\u0017\u0012\b\b\u0018\u0012\u0004\b\b(\u0019\u0012\u0004\u0012\u00020\u00140\u0016H\u0086\bø\u0001\u0000\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001¢\u0006\u0002\u0010'JA\u0010(\u001a\u0004\u0018\u00018\u00002!\u0010\u0015\u001a\u001d\u0012\u0013\u0012\u00118\u0000¢\u0006\f\b\u0017\u0012\b\b\u0018\u0012\u0004\b\b(\u0019\u0012\u0004\u0012\u00020\u00140\u0016H\u0086\bø\u0001\u0000\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001¢\u0006\u0002\u0010'J:\u0010)\u001a\u00020*2!\u0010+\u001a\u001d\u0012\u0013\u0012\u00118\u0000¢\u0006\f\b\u0017\u0012\b\b\u0018\u0012\u0004\b\b(\u0019\u0012\u0004\u0012\u00020*0\u0016H\u0086\bø\u0001\u0000\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001J:\u0010,\u001a\u00020*2!\u0010+\u001a\u001d\u0012\u0013\u0012\u00110\u0005¢\u0006\f\b\u0017\u0012\b\b\u0018\u0012\u0004\b\b(-\u0012\u0004\u0012\u00020*0\u0016H\u0081\bø\u0001\u0000\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001J\b\u0010.\u001a\u00020\u0005H\u0016J\u0006\u0010/\u001a\u00020\u0014J\u0006\u00100\u001a\u00020\u0014JR\u00101\u001a\u0002022\b\b\u0002\u00103\u001a\u0002042\b\b\u0002\u00105\u001a\u0002042\b\b\u0002\u00106\u001a\u0002042\b\b\u0002\u00107\u001a\u00020\u00052\b\b\u0002\u00108\u001a\u0002042\u0016\b\u0002\u00109\u001a\u0010\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u000204\u0018\u00010\u0016H\u0007J\u0006\u0010:\u001a\u00020\u0014J\b\u0010;\u001a\u000202H\u0016R\u0012\u0010\u0004\u001a\u00020\u00058\u0000@\u0000X\u0081\u000e¢\u0006\u0002\n\u0000R\u0012\u0010\u0006\u001a\u00020\u00058\u0000@\u0000X\u0081\u000e¢\u0006\u0002\n\u0000R\u0011\u0010\u0007\u001a\u00020\u00058G¢\u0006\u0006\u001a\u0004\b\b\u0010\tR\"\u0010\n\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00020\u000b8\u0000@\u0000X\u0081\u000e¢\u0006\n\n\u0002\u0010\r\u0012\u0004\b\f\u0010\u0003R\u0018\u0010\u000e\u001a\u00020\u000f8\u0000@\u0000X\u0081\u000e¢\u0006\b\n\u0000\u0012\u0004\b\u0010\u0010\u0003R\u0011\u0010\u0011\u001a\u00020\u00058G¢\u0006\u0006\u001a\u0004\b\u0012\u0010\t\u0082\u0001\u0001<\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006="}, d2 = {"Landroidx/collection/ScatterSet;", "E", "", "()V", "_capacity", "", "_size", "capacity", "getCapacity", "()I", "elements", "", "getElements$annotations", "[Ljava/lang/Object;", "metadata", "", "getMetadata$annotations", "size", "getSize", "all", "", "predicate", "Lkotlin/Function1;", "Lkotlin/ParameterName;", "name", "element", "any", "asSet", "", "contains", "(Ljava/lang/Object;)Z", "count", "equals", "other", "findElementIndex", "findElementIndex$collection", "(Ljava/lang/Object;)I", "first", "()Ljava/lang/Object;", "(Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "firstOrNull", "forEach", "", "block", "forEachIndex", "index", "hashCode", "isEmpty", "isNotEmpty", "joinToString", "", "separator", "", "prefix", "postfix", "limit", "truncated", "transform", "none", "toString", "Landroidx/collection/MutableScatterSet;", "collection"}, k = 1, mv = {1, 9, 0}, xi = 48)
public abstract class ScatterSet<E> {
    public int _capacity;
    public int _size;
    public Object[] elements;
    public long[] metadata;

    public /* synthetic */ ScatterSet(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    public static /* synthetic */ void getElements$annotations() {
    }

    public static /* synthetic */ void getMetadata$annotations() {
    }

    private ScatterSet() {
        this.metadata = ScatterMapKt.EmptyGroup;
        this.elements = ContainerHelpersKt.EMPTY_OBJECTS;
    }

    /* JADX INFO: renamed from: getCapacity, reason: from getter */
    public final int get_capacity() {
        return this._capacity;
    }

    /* JADX INFO: renamed from: getSize, reason: from getter */
    public final int get_size() {
        return this._size;
    }

    public final boolean any() {
        return this._size != 0;
    }

    public final boolean none() {
        return this._size == 0;
    }

    public final boolean isEmpty() {
        return this._size == 0;
    }

    public final boolean isNotEmpty() {
        return this._size != 0;
    }

    /* JADX WARN: Code duplicated, block: B:17:0x0051 A[DONT_INVERT] */
    /* JADX WARN: Code duplicated, block: B:18:0x0053 A[LOOP:0: B:4:0x0011->B:18:0x0053, LOOP_END] */
    /* JADX WARN: Code duplicated, block: B:24:0x0057 A[SYNTHETIC] */
    public final E first() {
        Object[] objArr = this.elements;
        long[] jArr = this.metadata;
        int length = jArr.length - 2;
        int i = 0;
        if (0 <= length) {
            while (true) {
                long j = jArr[i];
                if ((((~j) << 7) & j & (-9187201950435737472L)) == -9187201950435737472L) {
                    if (i != length) {
                        i++;
                    }
                } else {
                    int i2 = 8 - ((~(i - length)) >>> 31);
                    for (int i3 = 0; i3 < i2; i3++) {
                        if ((255 & j) < 128) {
                            return (E) objArr[(i << 3) + i3];
                        }
                        j >>= 8;
                    }
                    if (i2 == 8) {
                        if (i != length) {
                            i++;
                        }
                    }
                }
            }
        }
        RuntimeHelpersKt.throwNoSuchElementExceptionForInline("The ScatterSet is empty");
        throw new KotlinNothingValueException();
    }

    /* JADX WARN: Code duplicated, block: B:21:0x0078 A[DONT_INVERT] */
    /* JADX WARN: Code duplicated, block: B:22:0x007a A[LOOP:0: B:4:0x001a->B:22:0x007a, LOOP_END] */
    /* JADX WARN: Code duplicated, block: B:29:0x0084 A[SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r2v6, types: [E, java.lang.Object] */
    public final E first(Function1<? super E, Boolean> predicate) {
        Intrinsics.checkNotNullParameter(predicate, "predicate");
        int i = 0;
        ScatterSet<E> scatterSet = this;
        Object[] objArr = scatterSet.elements;
        long[] jArr = scatterSet.metadata;
        int length = jArr.length - 2;
        int i2 = 0;
        if (0 <= length) {
            while (true) {
                long j = jArr[i2];
                int i3 = i;
                ScatterSet<E> scatterSet2 = scatterSet;
                if ((((~j) << 7) & j & (-9187201950435737472L)) == -9187201950435737472L) {
                    if (i2 != length) {
                        i2++;
                        i = i3;
                        scatterSet = scatterSet2;
                    }
                } else {
                    int i4 = 8;
                    int i5 = 8 - ((~(i2 - length)) >>> 31);
                    int i6 = 0;
                    while (i6 < i5) {
                        if ((255 & j) < 128) {
                            ?? r2 = (Object) objArr[(i2 << 3) + i6];
                            if (predicate.invoke(r2).booleanValue()) {
                                return r2;
                            }
                        }
                        j >>= i4;
                        i6++;
                        i4 = i4;
                    }
                    if (i5 == i4) {
                        if (i2 != length) {
                            i2++;
                            i = i3;
                            scatterSet = scatterSet2;
                        }
                    }
                }
            }
        }
        RuntimeHelpersKt.throwNoSuchElementExceptionForInline("Could not find a match");
        throw new KotlinNothingValueException();
    }

    /* JADX WARN: Type inference failed for: r2v6, types: [E, java.lang.Object] */
    public final E firstOrNull(Function1<? super E, Boolean> predicate) {
        Intrinsics.checkNotNullParameter(predicate, "predicate");
        int i = 0;
        ScatterSet<E> scatterSet = this;
        Object[] objArr = scatterSet.elements;
        long[] jArr = scatterSet.metadata;
        int length = jArr.length - 2;
        int i2 = 0;
        if (0 > length) {
            return null;
        }
        while (true) {
            long j = jArr[i2];
            int i3 = i;
            ScatterSet<E> scatterSet2 = scatterSet;
            if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                int i4 = 8;
                int i5 = 8 - ((~(i2 - length)) >>> 31);
                int i6 = 0;
                while (i6 < i5) {
                    if ((255 & j) < 128) {
                        ?? r2 = (Object) objArr[(i2 << 3) + i6];
                        if (predicate.invoke(r2).booleanValue()) {
                            return r2;
                        }
                    }
                    j >>= i4;
                    i6++;
                    i4 = i4;
                }
                if (i5 != i4) {
                    return null;
                }
            }
            if (i2 == length) {
                return null;
            }
            i2++;
            i = i3;
            scatterSet = scatterSet2;
        }
    }

    public final void forEachIndex(Function1<? super Integer, Unit> block) {
        Intrinsics.checkNotNullParameter(block, "block");
        long[] m = this.metadata;
        int lastIndex = m.length - 2;
        int i = 0;
        if (0 > lastIndex) {
            return;
        }
        while (true) {
            long slot = m[i];
            long $this$maskEmptyOrDeleted$iv = ((~slot) << 7) & slot & (-9187201950435737472L);
            if ($this$maskEmptyOrDeleted$iv != -9187201950435737472L) {
                int bitCount = 8 - ((~(i - lastIndex)) >>> 31);
                for (int j = 0; j < bitCount; j++) {
                    long value$iv = 255 & slot;
                    if (value$iv < 128) {
                        int index = (i << 3) + j;
                        block.invoke(Integer.valueOf(index));
                    }
                    slot >>= 8;
                }
                if (bitCount != 8) {
                    return;
                }
            }
            if (i == lastIndex) {
                return;
            } else {
                i++;
            }
        }
    }

    public final void forEach(Function1<? super E, Unit> block) {
        Intrinsics.checkNotNullParameter(block, "block");
        Object[] elements = this.elements;
        long[] m$iv = this.metadata;
        int lastIndex$iv = m$iv.length - 2;
        int i$iv = 0;
        if (0 > lastIndex$iv) {
            return;
        }
        while (true) {
            long slot$iv = m$iv[i$iv];
            long $this$maskEmptyOrDeleted$iv$iv = ((~slot$iv) << 7) & slot$iv & (-9187201950435737472L);
            if ($this$maskEmptyOrDeleted$iv$iv != -9187201950435737472L) {
                int i = 8;
                int bitCount$iv = 8 - ((~(i$iv - lastIndex$iv)) >>> 31);
                int j$iv = 0;
                while (j$iv < bitCount$iv) {
                    long value$iv$iv = 255 & slot$iv;
                    if (value$iv$iv < 128) {
                        int index$iv = (i$iv << 3) + j$iv;
                        block.invoke(elements[index$iv]);
                    }
                    slot$iv >>= i;
                    j$iv++;
                    i = i;
                }
                if (bitCount$iv != i) {
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

    public final boolean all(Function1<? super E, Boolean> predicate) {
        Intrinsics.checkNotNullParameter(predicate, "predicate");
        Object[] elements$iv = this.elements;
        long[] m$iv$iv = this.metadata;
        int lastIndex$iv$iv = m$iv$iv.length - 2;
        int i$iv$iv = 0;
        if (0 > lastIndex$iv$iv) {
            return true;
        }
        while (true) {
            long slot$iv$iv = m$iv$iv[i$iv$iv];
            long slot$iv$iv2 = slot$iv$iv;
            if ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) != -9187201950435737472L) {
                int i = 8;
                int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                int j$iv$iv = 0;
                while (j$iv$iv < bitCount$iv$iv) {
                    long value$iv$iv$iv = slot$iv$iv2 & 255;
                    if (value$iv$iv$iv < 128) {
                        int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                        Object element = elements$iv[index$iv$iv];
                        if (!predicate.invoke(element).booleanValue()) {
                            return false;
                        }
                    }
                    slot$iv$iv2 >>= i;
                    j$iv$iv++;
                    i = i;
                }
                if (bitCount$iv$iv != i) {
                    return true;
                }
            }
            if (i$iv$iv == lastIndex$iv$iv) {
                return true;
            }
            i$iv$iv++;
        }
    }

    public final boolean any(Function1<? super E, Boolean> predicate) {
        Intrinsics.checkNotNullParameter(predicate, "predicate");
        Object[] elements$iv = this.elements;
        long[] m$iv$iv = this.metadata;
        int lastIndex$iv$iv = m$iv$iv.length - 2;
        int i$iv$iv = 0;
        if (0 > lastIndex$iv$iv) {
            return false;
        }
        while (true) {
            long slot$iv$iv = m$iv$iv[i$iv$iv];
            long slot$iv$iv2 = slot$iv$iv;
            if ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) != -9187201950435737472L) {
                int i = 8;
                int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                int j$iv$iv = 0;
                while (j$iv$iv < bitCount$iv$iv) {
                    long value$iv$iv$iv = slot$iv$iv2 & 255;
                    if (value$iv$iv$iv < 128) {
                        int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                        Object element = elements$iv[index$iv$iv];
                        if (predicate.invoke(element).booleanValue()) {
                            return true;
                        }
                    }
                    slot$iv$iv2 >>= i;
                    j$iv$iv++;
                    i = i;
                }
                if (bitCount$iv$iv != i) {
                    return false;
                }
            }
            if (i$iv$iv == lastIndex$iv$iv) {
                return false;
            }
            i$iv$iv++;
        }
    }

    public final int count() {
        return get_size();
    }

    public final int count(Function1<? super E, Boolean> predicate) {
        int i;
        Intrinsics.checkNotNullParameter(predicate, "predicate");
        int $i$f$count = 0;
        int count = 0;
        Object[] elements$iv = this.elements;
        long[] m$iv$iv = this.metadata;
        int lastIndex$iv$iv = m$iv$iv.length - 2;
        int i$iv$iv = 0;
        if (0 <= lastIndex$iv$iv) {
            while (true) {
                long slot$iv$iv = m$iv$iv[i$iv$iv];
                int $i$f$count2 = $i$f$count;
                int count2 = count;
                if ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) == -9187201950435737472L) {
                    count = count2;
                } else {
                    int i2 = 8;
                    int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                    int j$iv$iv = 0;
                    while (j$iv$iv < bitCount$iv$iv) {
                        long value$iv$iv$iv = 255 & slot$iv$iv;
                        if (!(value$iv$iv$iv < 128)) {
                            i = i2;
                        } else {
                            int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                            i = i2;
                            Object element = elements$iv[index$iv$iv];
                            if (predicate.invoke(element).booleanValue()) {
                                count2++;
                            }
                        }
                        slot$iv$iv >>= i;
                        j$iv$iv++;
                        i2 = i;
                    }
                    if (bitCount$iv$iv != i2) {
                        return count2;
                    }
                    count = count2;
                }
                if (i$iv$iv != lastIndex$iv$iv) {
                    i$iv$iv++;
                    $i$f$count = $i$f$count2;
                }
            }
        }
        return count;
    }

    public final boolean contains(E element) {
        int index$iv;
        int $i$f$findElementIndex$collection = 0;
        int hash$iv$iv = (element != null ? element.hashCode() : 0) * ScatterMapKt.MurmurHashC1;
        int hash$iv = hash$iv$iv ^ (hash$iv$iv << 16);
        int hash2$iv = hash$iv & WorkQueueKt.MASK;
        int probeMask$iv = this._capacity;
        int $i$f$h1 = hash$iv >>> 7;
        int probeOffset$iv = $i$f$h1 & probeMask$iv;
        int probeIndex$iv = 0;
        loop0: while (true) {
            long[] metadata$iv$iv = this.metadata;
            int i$iv$iv = probeOffset$iv >> 3;
            int b$iv$iv = (probeOffset$iv & 7) << 3;
            int hash2$iv2 = hash2$iv;
            long g$iv = (((-b$iv$iv) >> 63) & (metadata$iv$iv[i$iv$iv + 1] << (64 - b$iv$iv))) | (metadata$iv$iv[i$iv$iv] >>> b$iv$iv);
            long x$iv$iv = (((long) hash2$iv2) * ScatterMapKt.BitmaskLsb) ^ g$iv;
            int $i$f$findElementIndex$collection2 = $i$f$findElementIndex$collection;
            int hash$iv2 = hash$iv;
            long m$iv = (~x$iv$iv) & (x$iv$iv - ScatterMapKt.BitmaskLsb) & (-9187201950435737472L);
            while (true) {
                long $this$hasNext$iv$iv = m$iv;
                if ($this$hasNext$iv$iv != 0) {
                    long $this$get$iv$iv = m$iv;
                    index$iv = ((Long.numberOfTrailingZeros($this$get$iv$iv) >> 3) + probeOffset$iv) & probeMask$iv;
                    if (Intrinsics.areEqual(this.elements[index$iv], element)) {
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
        return index$iv >= 0;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ String joinToString$default(ScatterSet scatterSet, CharSequence charSequence, CharSequence charSequence2, CharSequence charSequence3, int i, CharSequence charSequence4, Function1 function1, int i2, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: joinToString");
        }
        if ((i2 & 1) != 0) {
        }
        if ((i2 & 2) != 0) {
        }
        if ((i2 & 4) != 0) {
        }
        if ((i2 & 8) != 0) {
            i = -1;
        }
        if ((i2 & 16) != 0) {
        }
        Function1 function2 = (i2 & 32) != 0 ? null : function1;
        CharSequence charSequence5 = charSequence4;
        return scatterSet.joinToString(charSequence, charSequence2, charSequence3, i, charSequence5, function2);
    }

    public final String joinToString(CharSequence separator, CharSequence prefix, CharSequence postfix, int limit, CharSequence truncated, Function1<? super E, ? extends CharSequence> transform) {
        StringBuilder sb;
        CharSequence separator2 = separator;
        Intrinsics.checkNotNullParameter(separator2, "separator");
        Intrinsics.checkNotNullParameter(prefix, "prefix");
        Intrinsics.checkNotNullParameter(postfix, "postfix");
        Intrinsics.checkNotNullParameter(truncated, "truncated");
        StringBuilder $this$joinToString_u24lambda_u2415 = new StringBuilder();
        int i = 0;
        $this$joinToString_u24lambda_u2415.append(prefix);
        int index = 0;
        ScatterSet<E> scatterSet = this;
        int $i$f$forEach = 0;
        Object[] elements$iv = scatterSet.elements;
        long[] m$iv$iv = scatterSet.metadata;
        int lastIndex$iv$iv = m$iv$iv.length - 2;
        int i$iv$iv = 0;
        if (0 <= lastIndex$iv$iv) {
            while (true) {
                long slot$iv$iv = m$iv$iv[i$iv$iv];
                int i2 = i;
                int index2 = index;
                ScatterSet<E> scatterSet2 = scatterSet;
                int $i$f$forEach2 = $i$f$forEach;
                long $this$maskEmptyOrDeleted$iv$iv$iv = ((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L);
                if ($this$maskEmptyOrDeleted$iv$iv$iv == -9187201950435737472L) {
                    sb = $this$joinToString_u24lambda_u2415;
                    index = index2;
                } else {
                    int i3 = 8;
                    int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                    int j$iv$iv = 0;
                    int index3 = index2;
                    while (j$iv$iv < bitCount$iv$iv) {
                        long value$iv$iv$iv = slot$iv$iv & 255;
                        if (!(value$iv$iv$iv < 128)) {
                            sb = $this$joinToString_u24lambda_u2415;
                        } else {
                            int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                            Object element = elements$iv[index$iv$iv];
                            sb = $this$joinToString_u24lambda_u2415;
                            if (index3 == limit) {
                                $this$joinToString_u24lambda_u2415.append(truncated);
                                String string = sb.toString();
                                Intrinsics.checkNotNullExpressionValue(string, "toString(...)");
                                return string;
                            }
                            if (index3 != 0) {
                                $this$joinToString_u24lambda_u2415.append(separator2);
                            }
                            if (transform == null) {
                                $this$joinToString_u24lambda_u2415.append(element);
                            } else {
                                $this$joinToString_u24lambda_u2415.append(transform.invoke(element));
                            }
                            index3++;
                        }
                        slot$iv$iv >>= i3;
                        j$iv$iv++;
                        separator2 = separator;
                        i3 = i3;
                        $this$joinToString_u24lambda_u2415 = sb;
                    }
                    sb = $this$joinToString_u24lambda_u2415;
                    if (bitCount$iv$iv != i3) {
                        break;
                    }
                    index = index3;
                }
                if (i$iv$iv != lastIndex$iv$iv) {
                    i$iv$iv++;
                    separator2 = separator;
                    scatterSet = scatterSet2;
                    $i$f$forEach = $i$f$forEach2;
                    i = i2;
                    $this$joinToString_u24lambda_u2415 = sb;
                }
            }
            $this$joinToString_u24lambda_u2415.append(postfix);
            String string2 = sb.toString();
            Intrinsics.checkNotNullExpressionValue(string2, "toString(...)");
            return string2;
        }
        sb = $this$joinToString_u24lambda_u2415;
        $this$joinToString_u24lambda_u2415.append(postfix);
        String string3 = sb.toString();
        Intrinsics.checkNotNullExpressionValue(string3, "toString(...)");
        return string3;
    }

    public final String joinToString() {
        return joinToString$default(this, null, null, null, 0, null, null, 63, null);
    }

    public final String joinToString(CharSequence separator) {
        Intrinsics.checkNotNullParameter(separator, "separator");
        return joinToString$default(this, separator, null, null, 0, null, null, 62, null);
    }

    public final String joinToString(CharSequence separator, CharSequence prefix) {
        Intrinsics.checkNotNullParameter(separator, "separator");
        Intrinsics.checkNotNullParameter(prefix, "prefix");
        return joinToString$default(this, separator, prefix, null, 0, null, null, 60, null);
    }

    public final String joinToString(CharSequence separator, CharSequence prefix, CharSequence postfix) {
        Intrinsics.checkNotNullParameter(separator, "separator");
        Intrinsics.checkNotNullParameter(prefix, "prefix");
        Intrinsics.checkNotNullParameter(postfix, "postfix");
        return joinToString$default(this, separator, prefix, postfix, 0, null, null, 56, null);
    }

    public final String joinToString(CharSequence separator, CharSequence prefix, CharSequence postfix, int limit) {
        Intrinsics.checkNotNullParameter(separator, "separator");
        Intrinsics.checkNotNullParameter(prefix, "prefix");
        Intrinsics.checkNotNullParameter(postfix, "postfix");
        return joinToString$default(this, separator, prefix, postfix, limit, null, null, 48, null);
    }

    public final String joinToString(CharSequence separator, CharSequence prefix, CharSequence postfix, int limit, CharSequence truncated) {
        Intrinsics.checkNotNullParameter(separator, "separator");
        Intrinsics.checkNotNullParameter(prefix, "prefix");
        Intrinsics.checkNotNullParameter(postfix, "postfix");
        Intrinsics.checkNotNullParameter(truncated, "truncated");
        return joinToString$default(this, separator, prefix, postfix, limit, truncated, null, 32, null);
    }

    public int hashCode() {
        int i;
        int hash = (this._capacity * 31) + this._size;
        ScatterSet<E> scatterSet = this;
        Object[] elements$iv = scatterSet.elements;
        long[] m$iv$iv = scatterSet.metadata;
        int lastIndex$iv$iv = m$iv$iv.length - 2;
        int i$iv$iv = 0;
        if (0 <= lastIndex$iv$iv) {
            while (true) {
                long slot$iv$iv = m$iv$iv[i$iv$iv];
                ScatterSet<E> scatterSet2 = scatterSet;
                int hash2 = hash;
                if ((((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L)) == -9187201950435737472L) {
                    hash = hash2;
                } else {
                    int i2 = 8;
                    int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                    int j$iv$iv = 0;
                    while (j$iv$iv < bitCount$iv$iv) {
                        long value$iv$iv$iv = 255 & slot$iv$iv;
                        if (!(value$iv$iv$iv < 128)) {
                            i = i2;
                        } else {
                            int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                            i = i2;
                            Object element = elements$iv[index$iv$iv];
                            if (!Intrinsics.areEqual(element, this)) {
                                hash2 += element != null ? element.hashCode() : 0;
                            }
                        }
                        slot$iv$iv >>= i;
                        j$iv$iv++;
                        i2 = i;
                    }
                    if (bitCount$iv$iv != i2) {
                        return hash2;
                    }
                    hash = hash2;
                }
                if (i$iv$iv != lastIndex$iv$iv) {
                    i$iv$iv++;
                    scatterSet = scatterSet2;
                }
            }
        }
        return hash;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public boolean equals(Object other) {
        boolean z;
        boolean z2;
        boolean z3 = true;
        if (other == this) {
            return true;
        }
        boolean z4 = false;
        if (!(other instanceof ScatterSet) || ((ScatterSet) other).get_size() != get_size()) {
            return false;
        }
        ScatterSet scatterSet = (ScatterSet) other;
        ScatterSet<E> scatterSet2 = this;
        Object[] elements$iv = scatterSet2.elements;
        long[] m$iv$iv = scatterSet2.metadata;
        int lastIndex$iv$iv = m$iv$iv.length - 2;
        int i$iv$iv = 0;
        if (0 > lastIndex$iv$iv) {
            return true;
        }
        while (true) {
            long slot$iv$iv = m$iv$iv[i$iv$iv];
            boolean z5 = z3;
            boolean z6 = z4;
            ScatterSet<E> scatterSet3 = scatterSet2;
            long $this$maskEmptyOrDeleted$iv$iv$iv = ((~slot$iv$iv) << 7) & slot$iv$iv & (-9187201950435737472L);
            if ($this$maskEmptyOrDeleted$iv$iv$iv == -9187201950435737472L) {
                z = z6;
            } else {
                int bitCount$iv$iv = 8 - ((~(i$iv$iv - lastIndex$iv$iv)) >>> 31);
                int j$iv$iv = 0;
                while (j$iv$iv < bitCount$iv$iv) {
                    long value$iv$iv$iv = slot$iv$iv & 255;
                    if (!(value$iv$iv$iv < 128 ? z5 : z6)) {
                        z2 = z6;
                    } else {
                        int index$iv$iv = (i$iv$iv << 3) + j$iv$iv;
                        z2 = z6;
                        Object element = elements$iv[index$iv$iv];
                        if (!scatterSet.contains(element)) {
                            return z2;
                        }
                    }
                    slot$iv$iv >>= 8;
                    j$iv$iv++;
                    z6 = z2;
                }
                z = z6;
                if (bitCount$iv$iv != 8) {
                    return z5;
                }
            }
            if (i$iv$iv == lastIndex$iv$iv) {
                return z5;
            }
            i$iv$iv++;
            scatterSet2 = scatterSet3;
            z3 = z5;
            z4 = z;
        }
    }

    public String toString() {
        return joinToString$default(this, null, "[", "]", 0, null, new Function1<E, CharSequence>(this) { // from class: androidx.collection.ScatterSet.toString.1
            final /* synthetic */ ScatterSet<E> this$0;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
                this.this$0 = this;
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function1
            public final CharSequence invoke(E e) {
                if (e == this.this$0) {
                    return "(this)";
                }
                return String.valueOf(e);
            }
        }, 25, null);
    }

    public final int findElementIndex$collection(E element) {
        int $i$f$findElementIndex$collection = 0;
        int hash$iv = (element != null ? element.hashCode() : 0) * ScatterMapKt.MurmurHashC1;
        int hash = hash$iv ^ (hash$iv << 16);
        int hash2 = hash & WorkQueueKt.MASK;
        int probeMask = this._capacity;
        int $i$f$h1 = hash >>> 7;
        int probeOffset = $i$f$h1 & probeMask;
        int probeIndex = 0;
        while (true) {
            long[] metadata$iv = this.metadata;
            int i$iv = probeOffset >> 3;
            int b$iv = (probeOffset & 7) << 3;
            int hash3 = hash2;
            long g = (((-b$iv) >> 63) & (metadata$iv[i$iv + 1] << (64 - b$iv))) | (metadata$iv[i$iv] >>> b$iv);
            long x$iv = (((long) hash3) * ScatterMapKt.BitmaskLsb) ^ g;
            int $i$f$findElementIndex$collection2 = $i$f$findElementIndex$collection;
            int hash4 = hash;
            long m = (~x$iv) & (x$iv - ScatterMapKt.BitmaskLsb) & (-9187201950435737472L);
            while (true) {
                long $this$hasNext$iv = m;
                if ($this$hasNext$iv != 0) {
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
            if ($this$maskEmpty$iv == 0) {
                probeIndex += 8;
                probeOffset = (probeOffset + probeIndex) & probeMask;
                hash2 = hash3;
                $i$f$findElementIndex$collection = $i$f$findElementIndex$collection2;
                hash = hash4;
            } else {
                return -1;
            }
        }
    }

    public final Set<E> asSet() {
        return new SetWrapper(this);
    }
}
