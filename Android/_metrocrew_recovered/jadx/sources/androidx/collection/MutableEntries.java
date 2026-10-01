package androidx.collection;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.RestrictedSuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.CollectionToArray;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import kotlin.jvm.internal.markers.KMutableIterator;
import kotlin.jvm.internal.markers.KMutableSet;
import kotlin.sequences.SequenceScope;
import kotlin.sequences.SequencesKt;
import kotlinx.coroutines.scheduling.WorkQueueKt;

/* JADX INFO: compiled from: ScatterMap.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010#\n\u0002\u0010'\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u001e\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0010)\n\u0002\b\u0004\b\u0002\u0018\u0000*\u0004\b\u0000\u0010\u0001*\u0004\b\u0001\u0010\u00022\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u0002H\u0001\u0012\u0004\u0012\u0002H\u00020\u00040\u0003B\u0019\u0012\u0012\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0006¢\u0006\u0002\u0010\u0007J\u001c\u0010\f\u001a\u00020\r2\u0012\u0010\u000e\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0004H\u0016J\"\u0010\u000f\u001a\u00020\r2\u0018\u0010\u0010\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00040\u0011H\u0016J\b\u0010\u0012\u001a\u00020\u0013H\u0016J\u001d\u0010\u0014\u001a\u00020\r2\u0012\u0010\u000e\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0004H\u0096\u0002J\"\u0010\u0015\u001a\u00020\r2\u0018\u0010\u0010\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00040\u0011H\u0016J\b\u0010\u0016\u001a\u00020\rH\u0016J\u001b\u0010\u0017\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00040\u0018H\u0096\u0002J\u001c\u0010\u0019\u001a\u00020\r2\u0012\u0010\u000e\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0004H\u0016J\"\u0010\u001a\u001a\u00020\r2\u0018\u0010\u0010\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00040\u0011H\u0016J\"\u0010\u001b\u001a\u00020\r2\u0018\u0010\u0010\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00040\u0011H\u0016R\u001a\u0010\u0005\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0006X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\b\u001a\u00020\t8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\n\u0010\u000b¨\u0006\u001c"}, d2 = {"Landroidx/collection/MutableEntries;", "K", "V", "", "", "parent", "Landroidx/collection/MutableScatterMap;", "(Landroidx/collection/MutableScatterMap;)V", "size", "", "getSize", "()I", "add", "", "element", "addAll", "elements", "", "clear", "", "contains", "containsAll", "isEmpty", "iterator", "", "remove", "removeAll", "retainAll", "collection"}, k = 1, mv = {1, 9, 0}, xi = 48)
final class MutableEntries<K, V> implements Set<Map.Entry<K, V>>, KMutableSet {
    private final MutableScatterMap<K, V> parent;

    @Override // java.util.Set, java.util.Collection
    public Object[] toArray() {
        return CollectionToArray.toArray(this);
    }

    @Override // java.util.Set, java.util.Collection
    public <T> T[] toArray(T[] array) {
        Intrinsics.checkNotNullParameter(array, "array");
        return (T[]) CollectionToArray.toArray(this, array);
    }

    public MutableEntries(MutableScatterMap<K, V> parent) {
        Intrinsics.checkNotNullParameter(parent, "parent");
        this.parent = parent;
    }

    @Override // java.util.Set, java.util.Collection
    public final /* bridge */ boolean contains(Object element) {
        if (TypeIntrinsics.isMutableMapEntry(element)) {
            return contains((Map.Entry) element);
        }
        return false;
    }

    @Override // java.util.Set, java.util.Collection
    public final /* bridge */ boolean remove(Object element) {
        if (TypeIntrinsics.isMutableMapEntry(element)) {
            return remove((Map.Entry) element);
        }
        return false;
    }

    @Override // java.util.Set, java.util.Collection
    public final /* bridge */ int size() {
        return getSize();
    }

    public int getSize() {
        return this.parent._size;
    }

    @Override // java.util.Set, java.util.Collection
    public boolean isEmpty() {
        return this.parent.isEmpty();
    }

    /* JADX INFO: renamed from: androidx.collection.MutableEntries$iterator$1, reason: invalid class name */
    /* JADX INFO: compiled from: ScatterMap.kt */
    @Metadata(d1 = {"\u0000-\n\u0000\n\u0002\u0010)\n\u0002\u0010'\n\u0000\n\u0002\u0010\b\n\u0002\b\u0005\n\u0002\u0010(\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\b\n\u0018\u00002\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00020\u0001J\t\u0010\u000f\u001a\u00020\u0010H\u0096\u0002J\u0015\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u0002H\u0096\u0002J\b\u0010\u0012\u001a\u00020\u0013H\u0016R\u001a\u0010\u0003\u001a\u00020\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0005\u0010\u0006\"\u0004\b\u0007\u0010\bR,\u0010\t\u001a\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00028\u00010\u00020\nX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u000b\u0010\f\"\u0004\b\r\u0010\u000e¨\u0006\u0014"}, d2 = {"androidx/collection/MutableEntries$iterator$1", "", "", "current", "", "getCurrent", "()I", "setCurrent", "(I)V", "iterator", "", "getIterator", "()Ljava/util/Iterator;", "setIterator", "(Ljava/util/Iterator;)V", "hasNext", "", "next", "remove", "", "collection"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class AnonymousClass1 implements Iterator<Map.Entry<K, V>>, KMutableIterator {
        private int current = -1;
        private Iterator<? extends Map.Entry<K, V>> iterator;
        final /* synthetic */ MutableEntries<K, V> this$0;

        AnonymousClass1(MutableEntries<K, V> mutableEntries) {
            this.this$0 = mutableEntries;
            this.iterator = SequencesKt.iterator(new C00011(mutableEntries, this, null));
        }

        public final Iterator<Map.Entry<K, V>> getIterator() {
            return this.iterator;
        }

        public final void setIterator(Iterator<? extends Map.Entry<K, V>> it) {
            Intrinsics.checkNotNullParameter(it, "<set-?>");
            this.iterator = it;
        }

        public final int getCurrent() {
            return this.current;
        }

        public final void setCurrent(int i) {
            this.current = i;
        }

        /* JADX INFO: renamed from: androidx.collection.MutableEntries$iterator$1$1, reason: invalid class name and collision with other inner class name */
        /* JADX INFO: compiled from: ScatterMap.kt */
        @Metadata(d1 = {"\u0000\u0012\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010'\u0010\u0000\u001a\u00020\u0001\"\u0004\b\u0000\u0010\u0002\"\u0004\b\u0001\u0010\u0003*\u0014\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u0002H\u0002\u0012\u0004\u0012\u0002H\u00030\u00050\u0004H\u008a@"}, d2 = {"<anonymous>", "", "K", "V", "Lkotlin/sequences/SequenceScope;", ""}, k = 3, mv = {1, 9, 0}, xi = 48)
        @DebugMetadata(c = "androidx.collection.MutableEntries$iterator$1$1", f = "ScatterMap.kt", i = {0, 0, 0, 0, 0, 0, 0}, l = {1538}, m = "invokeSuspend", n = {"$this$iterator", "m$iv", "lastIndex$iv", "i$iv", "slot$iv", "bitCount$iv", "j$iv"}, s = {"L$0", "L$3", "I$0", "I$1", "J$0", "I$2", "I$3"})
        static final class C00011 extends RestrictedSuspendLambda implements Function2<SequenceScope<? super Map.Entry<K, V>>, Continuation<? super Unit>, Object> {
            int I$0;
            int I$1;
            int I$2;
            int I$3;
            long J$0;
            private /* synthetic */ Object L$0;
            Object L$1;
            Object L$2;
            Object L$3;
            int label;
            final /* synthetic */ MutableEntries<K, V> this$0;
            final /* synthetic */ AnonymousClass1 this$1;

            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            C00011(MutableEntries<K, V> mutableEntries, AnonymousClass1 anonymousClass1, Continuation<? super C00011> continuation) {
                super(2, continuation);
                this.this$0 = mutableEntries;
                this.this$1 = anonymousClass1;
            }

            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
                C00011 c00011 = new C00011(this.this$0, this.this$1, continuation);
                c00011.L$0 = obj;
                return c00011;
            }

            @Override // kotlin.jvm.functions.Function2
            public final Object invoke(SequenceScope<? super Map.Entry<K, V>> sequenceScope, Continuation<? super Unit> continuation) {
                return ((C00011) create(sequenceScope, continuation)).invokeSuspend(Unit.INSTANCE);
            }

            /* JADX WARN: Code duplicated, block: B:12:0x0072  */
            /* JADX WARN: Code duplicated, block: B:29:0x0102  */
            /* JADX WARN: Code duplicated, block: B:31:0x010a  */
            /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:12:0x0072 -> B:13:0x0088). Please report as a decompilation issue!!! */
            /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:22:0x00da -> B:25:0x00e5). Please report as a decompilation issue!!! */
            /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:24:0x00e1 -> B:25:0x00e5). Please report as a decompilation issue!!! */
            /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:29:0x0102 -> B:30:0x0108). Please report as a decompilation issue!!! */
            /*  JADX ERROR: JadxOverflowException in pass: RegionMakerVisitor
                jadx.core.utils.exceptions.JadxOverflowException: Regions stack size limit reached
                	at jadx.core.utils.ErrorsCounter.addError(ErrorsCounter.java:59)
                	at jadx.core.utils.ErrorsCounter.error(ErrorsCounter.java:31)
                	at jadx.core.dex.attributes.nodes.NotificationAttrNode.addError(NotificationAttrNode.java:19)
                */
            @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
            public final java.lang.Object invokeSuspend(java.lang.Object r26) {
                /*
                    Method dump skipped, instruction units count: 290
                    To view this dump add '--comments-level debug' option
                */
                throw new UnsupportedOperationException("Method not decompiled: androidx.collection.MutableEntries.AnonymousClass1.C00011.invokeSuspend(java.lang.Object):java.lang.Object");
            }
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.iterator.hasNext();
        }

        @Override // java.util.Iterator
        public Map.Entry<K, V> next() {
            return this.iterator.next();
        }

        @Override // java.util.Iterator
        public void remove() {
            if (this.current != -1) {
                ((MutableEntries) this.this$0).parent.removeValueAt(this.current);
                this.current = -1;
            }
        }
    }

    @Override // java.util.Set, java.util.Collection, java.lang.Iterable
    public Iterator<Map.Entry<K, V>> iterator() {
        return new AnonymousClass1(this);
    }

    @Override // java.util.Set, java.util.Collection
    public void clear() {
        this.parent.clear();
    }

    @Override // java.util.Set, java.util.Collection
    public boolean containsAll(Collection<? extends Object> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        Collection<? extends Object> collection = elements;
        if (collection.isEmpty()) {
            return true;
        }
        Iterator<T> it = collection.iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            if (!Intrinsics.areEqual(this.parent.get((K) entry.getKey()), entry.getValue())) {
                return false;
            }
        }
        return true;
    }

    public boolean contains(Map.Entry<K, V> element) {
        Intrinsics.checkNotNullParameter(element, "element");
        return Intrinsics.areEqual(this.parent.get(element.getKey()), element.getValue());
    }

    @Override // java.util.Set, java.util.Collection
    public boolean addAll(Collection<? extends Map.Entry<K, V>> elements) {
        Intrinsics.checkNotNullParameter(elements, "elements");
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Set, java.util.Collection
    public boolean add(Map.Entry<K, V> element) {
        Intrinsics.checkNotNullParameter(element, "element");
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Set, java.util.Collection
    public boolean retainAll(Collection<? extends Object> elements) {
        int i;
        boolean changed;
        Intrinsics.checkNotNullParameter(elements, "elements");
        boolean changed2 = false;
        ScatterMap this_$iv = this.parent;
        long[] m$iv = this_$iv.metadata;
        int lastIndex$iv = m$iv.length - 2;
        int i$iv = 0;
        if (0 > lastIndex$iv) {
            return false;
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
                    if (value$iv$iv < 128) {
                        int index$iv = (i$iv << 3) + j$iv;
                        boolean found = false;
                        Iterator<? extends Object> it = elements.iterator();
                        while (true) {
                            if (!it.hasNext()) {
                                changed = changed2;
                                i = i2;
                                break;
                            }
                            Map.Entry entry = (Map.Entry) it.next();
                            i = i2;
                            changed = changed2;
                            if (!Intrinsics.areEqual(entry.getKey(), this.parent.keys[index$iv]) || !Intrinsics.areEqual(entry.getValue(), this.parent.values[index$iv])) {
                                i2 = i;
                                changed2 = changed;
                            } else {
                                found = true;
                                break;
                            }
                        }
                        if (found) {
                            changed2 = changed;
                        } else {
                            this.parent.removeValueAt(index$iv);
                            changed2 = true;
                        }
                    } else {
                        i = i2;
                    }
                    slot$iv >>= i;
                    j$iv++;
                    i2 = i;
                }
                boolean changed3 = changed2;
                if (bitCount$iv != i2) {
                    return changed3;
                }
                changed2 = changed3;
            }
            if (i$iv == lastIndex$iv) {
                return changed2;
            }
            i$iv++;
        }
    }

    @Override // java.util.Set, java.util.Collection
    public boolean removeAll(Collection<? extends Object> elements) {
        int i;
        Intrinsics.checkNotNullParameter(elements, "elements");
        boolean changed = false;
        ScatterMap this_$iv = this.parent;
        long[] m$iv = this_$iv.metadata;
        int lastIndex$iv = m$iv.length - 2;
        int i$iv = 0;
        if (0 > lastIndex$iv) {
            return false;
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
                    if (value$iv$iv < 128) {
                        int index$iv = (i$iv << 3) + j$iv;
                        Iterator<? extends Object> it = elements.iterator();
                        while (true) {
                            if (!it.hasNext()) {
                                i = i2;
                                break;
                            }
                            Map.Entry entry = (Map.Entry) it.next();
                            i = i2;
                            boolean changed2 = changed;
                            if (!Intrinsics.areEqual(entry.getKey(), this.parent.keys[index$iv]) || !Intrinsics.areEqual(entry.getValue(), this.parent.values[index$iv])) {
                                i2 = i;
                                changed = changed2;
                            } else {
                                this.parent.removeValueAt(index$iv);
                                changed = true;
                                break;
                            }
                        }
                    } else {
                        i = i2;
                    }
                    slot$iv >>= i;
                    j$iv++;
                    i2 = i;
                }
                boolean changed3 = changed;
                if (bitCount$iv != i2) {
                    return changed3;
                }
                changed = changed3;
            }
            if (i$iv == lastIndex$iv) {
                return changed;
            }
            i$iv++;
        }
    }

    public boolean remove(Map.Entry<K, V> element) {
        int index$iv;
        Intrinsics.checkNotNullParameter(element, "element");
        ScatterMap this_$iv = this.parent;
        Object key$iv = element.getKey();
        int $i$f$findKeyIndex$collection = 0;
        int hash$iv$iv = (key$iv != null ? key$iv.hashCode() : 0) * ScatterMapKt.MurmurHashC1;
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
            int $i$f$findKeyIndex$collection2 = $i$f$findKeyIndex$collection;
            int hash$iv2 = hash$iv;
            long x$iv$iv = (((long) hash2$iv2) * ScatterMapKt.BitmaskLsb) ^ g$iv;
            long m$iv = (x$iv$iv - ScatterMapKt.BitmaskLsb) & (~x$iv$iv) & (-9187201950435737472L);
            while (true) {
                long $this$hasNext$iv$iv = m$iv;
                if ($this$hasNext$iv$iv != 0) {
                    long $this$get$iv$iv = m$iv;
                    index$iv = ((Long.numberOfTrailingZeros($this$get$iv$iv) >> 3) + probeOffset$iv) & probeMask$iv;
                    if (Intrinsics.areEqual(this_$iv.keys[index$iv], key$iv)) {
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
        if (index$iv < 0 || !Intrinsics.areEqual(this.parent.values[index$iv], element.getValue())) {
            return false;
        }
        this.parent.removeValueAt(index$iv);
        return true;
    }
}
