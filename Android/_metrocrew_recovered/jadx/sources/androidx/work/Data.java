package androidx.work;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.ReplaceWith;
import kotlin.Unit;
import kotlin.collections.ArraysKt;
import kotlin.collections.CollectionsKt;
import kotlin.io.CloseableKt;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Reflection;
import kotlin.reflect.KClass;

/* JADX INFO: compiled from: Data_.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0088\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0004\n\u0002\u0010\u0018\n\u0000\n\u0002\u0010\u0005\n\u0000\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u0013\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0014\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0015\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0016\n\u0002\b\u0005\n\u0002\u0010\u0011\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0006\u0018\u0000 A2\u00020\u0001:\u0002@AB\u000f\b\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0000¢\u0006\u0002\u0010\u0003B\u0019\b\u0010\u0012\u0010\u0010\u0004\u001a\f\u0012\u0004\u0012\u00020\u0006\u0012\u0002\b\u00030\u0005¢\u0006\u0002\u0010\u0007J\u0013\u0010\u000b\u001a\u00020\f2\b\u0010\u0002\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\u0016\u0010\r\u001a\u00020\f2\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\fJ\u0010\u0010\u0010\u001a\u0004\u0018\u00010\u00112\u0006\u0010\u000e\u001a\u00020\u0006J\u0016\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\u0013J\u0010\u0010\u0014\u001a\u0004\u0018\u00010\u00152\u0006\u0010\u000e\u001a\u00020\u0006J\u0016\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\u0017J\u0010\u0010\u0018\u001a\u0004\u0018\u00010\u00192\u0006\u0010\u000e\u001a\u00020\u0006J\u0016\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\u001bJ\u0010\u0010\u001c\u001a\u0004\u0018\u00010\u001d2\u0006\u0010\u000e\u001a\u00020\u0006J\u0016\u0010\u001e\u001a\u00020\u001f2\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\u001fJ\u0010\u0010 \u001a\u0004\u0018\u00010!2\u0006\u0010\u000e\u001a\u00020\u0006J\u0016\u0010\"\u001a\u00020#2\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020#J\u0010\u0010$\u001a\u0004\u0018\u00010%2\u0006\u0010\u000e\u001a\u00020\u0006J*\u0010&\u001a\u0002H'\"\n\b\u0000\u0010'\u0018\u0001*\u00020\u00012\u0006\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u0002H'H\u0082\b¢\u0006\u0002\u0010(J\u0010\u0010)\u001a\u0004\u0018\u00010\u00062\u0006\u0010\u000e\u001a\u00020\u0006J\u001b\u0010*\u001a\n\u0012\u0004\u0012\u00020\u0006\u0018\u00010+2\u0006\u0010\u000e\u001a\u00020\u0006¢\u0006\u0002\u0010,J}\u0010-\u001a\u0004\u0018\u0001H.\"\n\b\u0000\u0010'\u0018\u0001*\u00020\u0001\"\u0004\b\u0001\u0010.2\u0006\u0010\u000e\u001a\u00020\u00062Q\u0010/\u001aM\u0012\u0013\u0012\u00110\u001f¢\u0006\f\b1\u0012\b\b2\u0012\u0004\b\b(3\u0012.\u0012,\u0012\u0013\u0012\u00110\u001f¢\u0006\f\b1\u0012\b\b2\u0012\u0004\b\b(5\u0012\u0004\u0012\u0002H'04¢\u0006\f\b1\u0012\b\b2\u0012\u0004\b\b(6\u0012\u0004\u0012\u0002H.00H\u0082\b¢\u0006\u0002\u00107J\u001e\u00108\u001a\u00020\f\"\u0006\b\u0000\u0010'\u0018\u00012\u0006\u0010\u000e\u001a\u00020\u0006H\u0080\b¢\u0006\u0002\b9J\"\u0010:\u001a\u00020\f\"\u0004\b\u0000\u0010'2\u0006\u0010\u000e\u001a\u00020\u00062\f\u0010;\u001a\b\u0012\u0004\u0012\u0002H'0<J\b\u0010=\u001a\u00020\u001fH\u0016J\b\u00103\u001a\u00020\u001fH\u0007J\u0006\u0010>\u001a\u00020\u0015J\b\u0010?\u001a\u00020\u0006H\u0016R\u001f\u0010\b\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00058F¢\u0006\u0006\u001a\u0004\b\t\u0010\nR\u001c\u0010\u0004\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006B"}, d2 = {"Landroidx/work/Data;", "", "other", "(Landroidx/work/Data;)V", "values", "", "", "(Ljava/util/Map;)V", "keyValueMap", "getKeyValueMap", "()Ljava/util/Map;", "equals", "", "getBoolean", "key", "defaultValue", "getBooleanArray", "", "getByte", "", "getByteArray", "", "getDouble", "", "getDoubleArray", "", "getFloat", "", "getFloatArray", "", "getInt", "", "getIntArray", "", "getLong", "", "getLongArray", "", "getOrDefault", "T", "(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;", "getString", "getStringArray", "", "(Ljava/lang/String;)[Ljava/lang/String;", "getTypedArray", "TArray", "constructor", "Lkotlin/Function2;", "Lkotlin/ParameterName;", "name", "size", "Lkotlin/Function1;", "index", "init", "(Ljava/lang/String;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;", "hasKey", "hasKey$work_runtime_release", "hasKeyWithValueOfType", "klass", "Ljava/lang/Class;", "hashCode", "toByteArray", "toString", "Builder", "Companion", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public final class Data {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    public static final Data EMPTY = new Builder().build();
    public static final int MAX_DATA_BYTES = 10240;
    private static final String NULL_STRING_V1 = "androidx.work.Data-95ed6082-b8e9-46e8-a73f-ff56f00f5d9d";
    private static final short STREAM_MAGIC = -21521;
    private static final short STREAM_VERSION = 1;
    private static final byte TYPE_BOOLEAN = 1;
    private static final byte TYPE_BOOLEAN_ARRAY = 8;
    private static final byte TYPE_BYTE = 2;
    private static final byte TYPE_BYTE_ARRAY = 9;
    private static final byte TYPE_DOUBLE = 6;
    private static final byte TYPE_DOUBLE_ARRAY = 13;
    private static final byte TYPE_FLOAT = 5;
    private static final byte TYPE_FLOAT_ARRAY = 12;
    private static final byte TYPE_INTEGER = 3;
    private static final byte TYPE_INTEGER_ARRAY = 10;
    private static final byte TYPE_LONG = 4;
    private static final byte TYPE_LONG_ARRAY = 11;
    private static final byte TYPE_NULL = 0;
    private static final byte TYPE_STRING = 7;
    private static final byte TYPE_STRING_ARRAY = 14;
    private final Map<String, Object> values;

    public Data(Data other) {
        Intrinsics.checkNotNullParameter(other, "other");
        this.values = new HashMap(other.values);
    }

    public Data(Map<String, ?> values) {
        Intrinsics.checkNotNullParameter(values, "values");
        this.values = new HashMap(values);
    }

    private final /* synthetic */ <T> T getOrDefault(String key, T defaultValue) {
        T t = (T) this.values.get(key);
        Intrinsics.reifiedOperationMarker(3, "T");
        return t instanceof Object ? t : defaultValue;
    }

    private final /* synthetic */ <T, TArray> TArray getTypedArray(String key, Function2<? super Integer, ? super Function1<? super Integer, ? extends T>, ? extends TArray> constructor) {
        final Object value = this.values.get(key);
        if ((value instanceof Object[]) && (((Object[]) value) instanceof Object[])) {
            Integer numValueOf = Integer.valueOf(((Object[]) value).length);
            Intrinsics.needClassReification();
            return constructor.invoke(numValueOf, new Function1<Integer, T>() { // from class: androidx.work.Data.getTypedArray.1
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                public final T invoke(int i) {
                    T t = (T) ((Object[]) value)[i];
                    Intrinsics.reifiedOperationMarker(1, "T");
                    return t;
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Object invoke(Integer num) {
                    return invoke(num.intValue());
                }
            });
        }
        return null;
    }

    public final boolean getBoolean(String key, boolean defaultValue) {
        Intrinsics.checkNotNullParameter(key, "key");
        Object defaultValue$iv = Boolean.valueOf(defaultValue);
        Object value$iv = this.values.get(key);
        if (value$iv instanceof Boolean) {
            defaultValue$iv = value$iv;
        }
        return ((Boolean) defaultValue$iv).booleanValue();
    }

    public final boolean[] getBooleanArray(String key) {
        Intrinsics.checkNotNullParameter(key, "key");
        final Object value$iv = this.values.get(key);
        if ((value$iv instanceof Object[]) && (((Object[]) value$iv) instanceof Object[])) {
            int p0 = ((Object[]) value$iv).length;
            Function1<Integer, Boolean> function1 = new Function1<Integer, Boolean>() { // from class: androidx.work.Data$getBooleanArray$$inlined$getTypedArray$1
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                public final Boolean invoke(int i) {
                    Object obj = ((Object[]) value$iv)[i];
                    if (obj != null) {
                        return (Boolean) obj;
                    }
                    throw new NullPointerException("null cannot be cast to non-null type kotlin.Boolean");
                }

                /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Boolean, java.lang.Object] */
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Boolean invoke(Integer num) {
                    return invoke(num.intValue());
                }
            };
            boolean[] zArr = new boolean[p0];
            for (int i = 0; i < p0; i++) {
                zArr[i] = function1.invoke(Integer.valueOf(i)).booleanValue();
            }
            return zArr;
        }
        return null;
    }

    public final byte getByte(String key, byte defaultValue) {
        Intrinsics.checkNotNullParameter(key, "key");
        Object defaultValue$iv = Byte.valueOf(defaultValue);
        Object value$iv = this.values.get(key);
        if (value$iv instanceof Byte) {
            defaultValue$iv = value$iv;
        }
        return ((Number) defaultValue$iv).byteValue();
    }

    public final byte[] getByteArray(String key) {
        Intrinsics.checkNotNullParameter(key, "key");
        final Object value$iv = this.values.get(key);
        if ((value$iv instanceof Object[]) && (((Object[]) value$iv) instanceof Object[])) {
            int p0 = ((Object[]) value$iv).length;
            Function1<Integer, Byte> function1 = new Function1<Integer, Byte>() { // from class: androidx.work.Data$getByteArray$$inlined$getTypedArray$1
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                public final Byte invoke(int i) {
                    Object obj = ((Object[]) value$iv)[i];
                    if (obj != null) {
                        return (Byte) obj;
                    }
                    throw new NullPointerException("null cannot be cast to non-null type kotlin.Byte");
                }

                /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Byte, java.lang.Object] */
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Byte invoke(Integer num) {
                    return invoke(num.intValue());
                }
            };
            byte[] bArr = new byte[p0];
            for (int i = 0; i < p0; i++) {
                bArr[i] = function1.invoke(Integer.valueOf(i)).byteValue();
            }
            return bArr;
        }
        return null;
    }

    public final int getInt(String key, int defaultValue) {
        Intrinsics.checkNotNullParameter(key, "key");
        Object defaultValue$iv = Integer.valueOf(defaultValue);
        Object value$iv = this.values.get(key);
        if (value$iv instanceof Integer) {
            defaultValue$iv = value$iv;
        }
        return ((Number) defaultValue$iv).intValue();
    }

    public final int[] getIntArray(String key) {
        Intrinsics.checkNotNullParameter(key, "key");
        final Object value$iv = this.values.get(key);
        if ((value$iv instanceof Object[]) && (((Object[]) value$iv) instanceof Object[])) {
            int p0 = ((Object[]) value$iv).length;
            Function1<Integer, Integer> function1 = new Function1<Integer, Integer>() { // from class: androidx.work.Data$getIntArray$$inlined$getTypedArray$1
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                public final Integer invoke(int i) {
                    Object obj = ((Object[]) value$iv)[i];
                    if (obj != null) {
                        return (Integer) obj;
                    }
                    throw new NullPointerException("null cannot be cast to non-null type kotlin.Int");
                }

                /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Integer, java.lang.Object] */
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Integer invoke(Integer num) {
                    return invoke(num.intValue());
                }
            };
            int[] iArr = new int[p0];
            for (int i = 0; i < p0; i++) {
                iArr[i] = function1.invoke(Integer.valueOf(i)).intValue();
            }
            return iArr;
        }
        return null;
    }

    public final long getLong(String key, long defaultValue) {
        Intrinsics.checkNotNullParameter(key, "key");
        Object defaultValue$iv = Long.valueOf(defaultValue);
        Object value$iv = this.values.get(key);
        if (value$iv instanceof Long) {
            defaultValue$iv = value$iv;
        }
        return ((Number) defaultValue$iv).longValue();
    }

    public final long[] getLongArray(String key) {
        Intrinsics.checkNotNullParameter(key, "key");
        final Object value$iv = this.values.get(key);
        if ((value$iv instanceof Object[]) && (((Object[]) value$iv) instanceof Object[])) {
            int p0 = ((Object[]) value$iv).length;
            Function1<Integer, Long> function1 = new Function1<Integer, Long>() { // from class: androidx.work.Data$getLongArray$$inlined$getTypedArray$1
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                public final Long invoke(int i) {
                    Object obj = ((Object[]) value$iv)[i];
                    if (obj != null) {
                        return (Long) obj;
                    }
                    throw new NullPointerException("null cannot be cast to non-null type kotlin.Long");
                }

                /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Long, java.lang.Object] */
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Long invoke(Integer num) {
                    return invoke(num.intValue());
                }
            };
            long[] jArr = new long[p0];
            for (int i = 0; i < p0; i++) {
                jArr[i] = function1.invoke(Integer.valueOf(i)).longValue();
            }
            return jArr;
        }
        return null;
    }

    public final float getFloat(String key, float defaultValue) {
        Intrinsics.checkNotNullParameter(key, "key");
        Object defaultValue$iv = Float.valueOf(defaultValue);
        Object value$iv = this.values.get(key);
        if (value$iv instanceof Float) {
            defaultValue$iv = value$iv;
        }
        return ((Number) defaultValue$iv).floatValue();
    }

    public final float[] getFloatArray(String key) {
        Intrinsics.checkNotNullParameter(key, "key");
        final Object value$iv = this.values.get(key);
        if ((value$iv instanceof Object[]) && (((Object[]) value$iv) instanceof Object[])) {
            int p0 = ((Object[]) value$iv).length;
            Function1<Integer, Float> function1 = new Function1<Integer, Float>() { // from class: androidx.work.Data$getFloatArray$$inlined$getTypedArray$1
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                public final Float invoke(int i) {
                    Object obj = ((Object[]) value$iv)[i];
                    if (obj != null) {
                        return (Float) obj;
                    }
                    throw new NullPointerException("null cannot be cast to non-null type kotlin.Float");
                }

                /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Float, java.lang.Object] */
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Float invoke(Integer num) {
                    return invoke(num.intValue());
                }
            };
            float[] fArr = new float[p0];
            for (int i = 0; i < p0; i++) {
                fArr[i] = function1.invoke(Integer.valueOf(i)).floatValue();
            }
            return fArr;
        }
        return null;
    }

    public final double getDouble(String key, double defaultValue) {
        Intrinsics.checkNotNullParameter(key, "key");
        Object defaultValue$iv = Double.valueOf(defaultValue);
        Object value$iv = this.values.get(key);
        if (value$iv instanceof Double) {
            defaultValue$iv = value$iv;
        }
        return ((Number) defaultValue$iv).doubleValue();
    }

    public final double[] getDoubleArray(String key) {
        Intrinsics.checkNotNullParameter(key, "key");
        final Object value$iv = this.values.get(key);
        if ((value$iv instanceof Object[]) && (((Object[]) value$iv) instanceof Object[])) {
            int p0 = ((Object[]) value$iv).length;
            Function1<Integer, Double> function1 = new Function1<Integer, Double>() { // from class: androidx.work.Data$getDoubleArray$$inlined$getTypedArray$1
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                public final Double invoke(int i) {
                    Object obj = ((Object[]) value$iv)[i];
                    if (obj != null) {
                        return (Double) obj;
                    }
                    throw new NullPointerException("null cannot be cast to non-null type kotlin.Double");
                }

                /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Double, java.lang.Object] */
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Double invoke(Integer num) {
                    return invoke(num.intValue());
                }
            };
            double[] dArr = new double[p0];
            for (int i = 0; i < p0; i++) {
                dArr[i] = function1.invoke(Integer.valueOf(i)).doubleValue();
            }
            return dArr;
        }
        return null;
    }

    public final String getString(String key) {
        Intrinsics.checkNotNullParameter(key, "key");
        Object obj = this.values.get(key);
        if (obj instanceof String) {
            return (String) obj;
        }
        return null;
    }

    public final String[] getStringArray(String key) {
        Intrinsics.checkNotNullParameter(key, "key");
        final Object value$iv = this.values.get(key);
        if ((value$iv instanceof Object[]) && (((Object[]) value$iv) instanceof Object[])) {
            int p0 = ((Object[]) value$iv).length;
            Function1<Integer, String> function1 = new Function1<Integer, String>() { // from class: androidx.work.Data$getStringArray$$inlined$getTypedArray$1
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                public final String invoke(int i) {
                    Object obj = ((Object[]) value$iv)[i];
                    if (obj != null) {
                        return (String) obj;
                    }
                    throw new NullPointerException("null cannot be cast to non-null type kotlin.String");
                }

                /* JADX WARN: Type inference failed for: r0v3, types: [java.lang.Object, java.lang.String] */
                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ String invoke(Integer num) {
                    return invoke(num.intValue());
                }
            };
            String[] strArr = new String[p0];
            for (int i = 0; i < p0; i++) {
                strArr[i] = function1.invoke(Integer.valueOf(i));
            }
            return strArr;
        }
        return null;
    }

    public final Map<String, Object> getKeyValueMap() {
        Map<String, Object> mapUnmodifiableMap = Collections.unmodifiableMap(this.values);
        Intrinsics.checkNotNullExpressionValue(mapUnmodifiableMap, "unmodifiableMap(values)");
        return mapUnmodifiableMap;
    }

    public final byte[] toByteArray() {
        return INSTANCE.toByteArrayInternalV1(this);
    }

    public final <T> boolean hasKeyWithValueOfType(String key, Class<T> klass) {
        Intrinsics.checkNotNullParameter(key, "key");
        Intrinsics.checkNotNullParameter(klass, "klass");
        Object value = this.values.get(key);
        return value != null && klass.isAssignableFrom(value.getClass());
    }

    public final /* synthetic */ <T> boolean hasKey$work_runtime_release(String key) {
        Intrinsics.checkNotNullParameter(key, "key");
        Intrinsics.reifiedOperationMarker(4, "T");
        return hasKeyWithValueOfType(key, Object.class);
    }

    public final int size() {
        return this.values.size();
    }

    public boolean equals(Object other) {
        boolean equal;
        if (this == other) {
            return true;
        }
        if (other == null || !Intrinsics.areEqual(getClass(), other.getClass())) {
            return false;
        }
        Data otherData = (Data) other;
        Set<String> setKeySet = this.values.keySet();
        if (!Intrinsics.areEqual(setKeySet, otherData.values.keySet())) {
            return false;
        }
        for (String key : setKeySet) {
            Object value = this.values.get(key);
            Object otherValue = otherData.values.get(key);
            if (value == null || otherValue == null) {
                if (value == otherValue) {
                    equal = true;
                } else {
                    equal = false;
                }
            } else if ((value instanceof Object[]) && (((Object[]) value) instanceof Object[]) && (otherValue instanceof Object[]) && (((Object[]) otherValue) instanceof Object[])) {
                equal = ArraysKt.contentDeepEquals((Object[]) value, (Object[]) otherValue);
            } else {
                equal = Intrinsics.areEqual(value, otherValue);
            }
            if (!equal) {
                return false;
            }
        }
        return true;
    }

    public int hashCode() {
        int iHashCode;
        int h = 0;
        for (Map.Entry<String, Object> entry : this.values.entrySet()) {
            Object value = entry.getValue();
            if (value instanceof Object[]) {
                iHashCode = Objects.hashCode(entry.getKey()) ^ ArraysKt.contentDeepHashCode((Object[]) value);
            } else {
                iHashCode = entry.hashCode();
            }
            h += iHashCode;
        }
        return h * 31;
    }

    public String toString() {
        StringBuilder $this$toString_u24lambda_u246 = new StringBuilder();
        $this$toString_u24lambda_u246.append("Data {");
        String content = CollectionsKt.joinToString$default(this.values.entrySet(), null, null, null, 0, null, new Function1<Map.Entry<? extends String, ? extends Object>, CharSequence>() { // from class: androidx.work.Data$toString$1$content$1
            /* JADX INFO: renamed from: invoke, reason: avoid collision after fix types in other method */
            public final CharSequence invoke2(Map.Entry<String, ? extends Object> entry) {
                Object string;
                Intrinsics.checkNotNullParameter(entry, "<name for destructuring parameter 0>");
                String key = entry.getKey();
                Object value = entry.getValue();
                StringBuilder sbAppend = new StringBuilder().append(key).append(" : ");
                if (value instanceof Object[]) {
                    string = Arrays.toString((Object[]) value);
                    Intrinsics.checkNotNullExpressionValue(string, "toString(this)");
                } else {
                    string = value;
                }
                return sbAppend.append(string).toString();
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ CharSequence invoke(Map.Entry<? extends String, ? extends Object> entry) {
                return invoke2((Map.Entry<String, ? extends Object>) entry);
            }
        }, 31, null);
        $this$toString_u24lambda_u246.append(content);
        $this$toString_u24lambda_u246.append("}");
        String string = $this$toString_u24lambda_u246.toString();
        Intrinsics.checkNotNullExpressionValue(string, "StringBuilder().apply(builderAction).toString()");
        return string;
    }

    /* JADX INFO: compiled from: Data_.kt */
    @Metadata(d1 = {"\u0000x\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010$\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0018\n\u0000\n\u0002\u0010\u0005\n\u0000\n\u0002\u0010\u0012\n\u0002\b\u0002\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u0013\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0014\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0015\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0016\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0002\b\u0002\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J\u0006\u0010\u0006\u001a\u00020\u0007J\u001a\u0010\b\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u00052\b\u0010\n\u001a\u0004\u0018\u00010\u0001H\u0007J\u000e\u0010\u000b\u001a\u00020\u00002\u0006\u0010\f\u001a\u00020\u0007J\u001c\u0010\u000b\u001a\u00020\u00002\u0014\u0010\u0003\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\rJ\u0016\u0010\u000e\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020\u000fJ\u0016\u0010\u0010\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020\u0011J\u0016\u0010\u0012\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020\u0013J\u0016\u0010\u0014\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020\u0015J\u001a\u0010\u0016\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u00052\b\u0010\n\u001a\u0004\u0018\u00010\u0001H\u0002J\u0016\u0010\u0017\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020\u0018J\u0016\u0010\u0019\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020\u001aJ\u0016\u0010\u001b\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020\u001cJ\u0016\u0010\u001d\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020\u001eJ\u0016\u0010\u001f\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020 J\u0016\u0010!\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020\"J\u0016\u0010#\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020$J\u0016\u0010%\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u00052\u0006\u0010\n\u001a\u00020&J\u0018\u0010'\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u00052\b\u0010\n\u001a\u0004\u0018\u00010\u0005J#\u0010(\u001a\u00020\u00002\u0006\u0010\t\u001a\u00020\u00052\u000e\u0010\n\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050)¢\u0006\u0002\u0010*R\u001c\u0010\u0003\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0004X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006+"}, d2 = {"Landroidx/work/Data$Builder;", "", "()V", "values", "", "", "build", "Landroidx/work/Data;", "put", "key", "value", "putAll", "data", "", "putBoolean", "", "putBooleanArray", "", "putByte", "", "putByteArray", "", "putDirect", "putDouble", "", "putDoubleArray", "", "putFloat", "", "putFloatArray", "", "putInt", "", "putIntArray", "", "putLong", "", "putLongArray", "", "putString", "putStringArray", "", "(Ljava/lang/String;[Ljava/lang/String;)Landroidx/work/Data$Builder;", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
    public static final class Builder {
        private final Map<String, Object> values = new LinkedHashMap();

        private final Builder putDirect(String key, Object value) {
            this.values.put(key, value);
            return this;
        }

        public final Builder putBoolean(String key, boolean value) {
            Intrinsics.checkNotNullParameter(key, "key");
            return putDirect(key, Boolean.valueOf(value));
        }

        public final Builder putBooleanArray(String key, boolean[] value) {
            Intrinsics.checkNotNullParameter(key, "key");
            Intrinsics.checkNotNullParameter(value, "value");
            this.values.put(key, Data_Kt.convertPrimitiveArray(value));
            return this;
        }

        public final Builder putByte(String key, byte value) {
            Intrinsics.checkNotNullParameter(key, "key");
            return putDirect(key, Byte.valueOf(value));
        }

        public final Builder putByteArray(String key, byte[] value) {
            Intrinsics.checkNotNullParameter(key, "key");
            Intrinsics.checkNotNullParameter(value, "value");
            this.values.put(key, Data_Kt.convertPrimitiveArray(value));
            return this;
        }

        public final Builder putInt(String key, int value) {
            Intrinsics.checkNotNullParameter(key, "key");
            return putDirect(key, Integer.valueOf(value));
        }

        public final Builder putIntArray(String key, int[] value) {
            Intrinsics.checkNotNullParameter(key, "key");
            Intrinsics.checkNotNullParameter(value, "value");
            this.values.put(key, Data_Kt.convertPrimitiveArray(value));
            return this;
        }

        public final Builder putLong(String key, long value) {
            Intrinsics.checkNotNullParameter(key, "key");
            return putDirect(key, Long.valueOf(value));
        }

        public final Builder putLongArray(String key, long[] value) {
            Intrinsics.checkNotNullParameter(key, "key");
            Intrinsics.checkNotNullParameter(value, "value");
            this.values.put(key, Data_Kt.convertPrimitiveArray(value));
            return this;
        }

        public final Builder putFloat(String key, float value) {
            Intrinsics.checkNotNullParameter(key, "key");
            return putDirect(key, Float.valueOf(value));
        }

        public final Builder putFloatArray(String key, float[] value) {
            Intrinsics.checkNotNullParameter(key, "key");
            Intrinsics.checkNotNullParameter(value, "value");
            this.values.put(key, Data_Kt.convertPrimitiveArray(value));
            return this;
        }

        public final Builder putDouble(String key, double value) {
            Intrinsics.checkNotNullParameter(key, "key");
            return putDirect(key, Double.valueOf(value));
        }

        public final Builder putDoubleArray(String key, double[] value) {
            Intrinsics.checkNotNullParameter(key, "key");
            Intrinsics.checkNotNullParameter(value, "value");
            this.values.put(key, Data_Kt.convertPrimitiveArray(value));
            return this;
        }

        public final Builder putString(String key, String value) {
            Intrinsics.checkNotNullParameter(key, "key");
            return putDirect(key, value);
        }

        public final Builder putStringArray(String key, String[] value) {
            Intrinsics.checkNotNullParameter(key, "key");
            Intrinsics.checkNotNullParameter(value, "value");
            return putDirect(key, value);
        }

        public final Builder putAll(Data data) {
            Intrinsics.checkNotNullParameter(data, "data");
            putAll(data.values);
            return this;
        }

        public final Builder putAll(Map<String, ? extends Object> values) {
            Intrinsics.checkNotNullParameter(values, "values");
            for (Map.Entry<String, ? extends Object> entry : values.entrySet()) {
                String key = entry.getKey();
                Object value = entry.getValue();
                put(key, value);
            }
            return this;
        }

        public final Builder put(String key, Object value) {
            Object objConvertPrimitiveArray;
            Intrinsics.checkNotNullParameter(key, "key");
            Map<String, Object> map = this.values;
            if (value == null) {
                objConvertPrimitiveArray = null;
            } else {
                KClass valueType = Reflection.getOrCreateKotlinClass(value.getClass());
                if (Intrinsics.areEqual(valueType, Reflection.getOrCreateKotlinClass(Boolean.TYPE)) ? true : Intrinsics.areEqual(valueType, Reflection.getOrCreateKotlinClass(Byte.TYPE)) ? true : Intrinsics.areEqual(valueType, Reflection.getOrCreateKotlinClass(Integer.TYPE)) ? true : Intrinsics.areEqual(valueType, Reflection.getOrCreateKotlinClass(Long.TYPE)) ? true : Intrinsics.areEqual(valueType, Reflection.getOrCreateKotlinClass(Float.TYPE)) ? true : Intrinsics.areEqual(valueType, Reflection.getOrCreateKotlinClass(Double.TYPE)) ? true : Intrinsics.areEqual(valueType, Reflection.getOrCreateKotlinClass(String.class)) ? true : Intrinsics.areEqual(valueType, Reflection.getOrCreateKotlinClass(Boolean[].class)) ? true : Intrinsics.areEqual(valueType, Reflection.getOrCreateKotlinClass(Byte[].class)) ? true : Intrinsics.areEqual(valueType, Reflection.getOrCreateKotlinClass(Integer[].class)) ? true : Intrinsics.areEqual(valueType, Reflection.getOrCreateKotlinClass(Long[].class)) ? true : Intrinsics.areEqual(valueType, Reflection.getOrCreateKotlinClass(Float[].class)) ? true : Intrinsics.areEqual(valueType, Reflection.getOrCreateKotlinClass(Double[].class)) ? true : Intrinsics.areEqual(valueType, Reflection.getOrCreateKotlinClass(String[].class))) {
                    objConvertPrimitiveArray = value;
                } else if (Intrinsics.areEqual(valueType, Reflection.getOrCreateKotlinClass(boolean[].class))) {
                    objConvertPrimitiveArray = Data_Kt.convertPrimitiveArray((boolean[]) value);
                } else if (Intrinsics.areEqual(valueType, Reflection.getOrCreateKotlinClass(byte[].class))) {
                    objConvertPrimitiveArray = Data_Kt.convertPrimitiveArray((byte[]) value);
                } else if (Intrinsics.areEqual(valueType, Reflection.getOrCreateKotlinClass(int[].class))) {
                    objConvertPrimitiveArray = Data_Kt.convertPrimitiveArray((int[]) value);
                } else if (Intrinsics.areEqual(valueType, Reflection.getOrCreateKotlinClass(long[].class))) {
                    objConvertPrimitiveArray = Data_Kt.convertPrimitiveArray((long[]) value);
                } else if (Intrinsics.areEqual(valueType, Reflection.getOrCreateKotlinClass(float[].class))) {
                    objConvertPrimitiveArray = Data_Kt.convertPrimitiveArray((float[]) value);
                } else if (Intrinsics.areEqual(valueType, Reflection.getOrCreateKotlinClass(double[].class))) {
                    objConvertPrimitiveArray = Data_Kt.convertPrimitiveArray((double[]) value);
                } else {
                    throw new IllegalArgumentException("Key " + key + " has invalid type " + valueType);
                }
            }
            map.put(key, objConvertPrimitiveArray);
            return this;
        }

        public final Data build() {
            Data data = new Data((Map<String, ?>) this.values);
            Data.INSTANCE.toByteArrayInternalV1(data);
            return data;
        }
    }

    /* JADX INFO: compiled from: Data_.kt */
    @Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\n\n\u0002\b\u0002\n\u0002\u0010\u0005\n\u0002\b\u0010\n\u0002\u0010\u0012\n\u0002\b\u0004\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\u0010\u0010\u001c\u001a\u00020\u00042\u0006\u0010\u001d\u001a\u00020\u001eH\u0007J\u0010\u0010\u001f\u001a\u00020\u001e2\u0006\u0010 \u001a\u00020\u0004H\u0007J\u0010\u0010!\u001a\u00020\u001e2\u0006\u0010 \u001a\u00020\u0004H\u0007R\u0010\u0010\u0003\u001a\u00020\u00048\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0005\u001a\u00020\u00068\u0006X\u0087T¢\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\bX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\nX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\rX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\rX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\rX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\rX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\rX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\rX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\rX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\rX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0015\u001a\u00020\rX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\rX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0017\u001a\u00020\rX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\rX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\rX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u001a\u001a\u00020\rX\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u001b\u001a\u00020\rX\u0082T¢\u0006\u0002\n\u0000¨\u0006\""}, d2 = {"Landroidx/work/Data$Companion;", "", "()V", "EMPTY", "Landroidx/work/Data;", "MAX_DATA_BYTES", "", "NULL_STRING_V1", "", "STREAM_MAGIC", "", "STREAM_VERSION", "TYPE_BOOLEAN", "", "TYPE_BOOLEAN_ARRAY", "TYPE_BYTE", "TYPE_BYTE_ARRAY", "TYPE_DOUBLE", "TYPE_DOUBLE_ARRAY", "TYPE_FLOAT", "TYPE_FLOAT_ARRAY", "TYPE_INTEGER", "TYPE_INTEGER_ARRAY", "TYPE_LONG", "TYPE_LONG_ARRAY", "TYPE_NULL", "TYPE_STRING", "TYPE_STRING_ARRAY", "fromByteArray", "bytes", "", "toByteArrayInternalV0", "data", "toByteArrayInternalV1", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        @Deprecated(message = "This is kept for testing migration", replaceWith = @ReplaceWith(expression = "toByteArrayInternalV1", imports = {}))
        @JvmStatic
        public final byte[] toByteArrayInternalV0(Data data) {
            Intrinsics.checkNotNullParameter(data, "data");
            try {
                ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                try {
                    ByteArrayOutputStream stream = byteArrayOutputStream;
                    ObjectOutputStream objectOutputStream = new ObjectOutputStream(stream);
                    try {
                        ObjectOutputStream objectOutputStream2 = objectOutputStream;
                        objectOutputStream2.writeInt(data.size());
                        for (Map.Entry entry : data.values.entrySet()) {
                            String key = (String) entry.getKey();
                            Object value = entry.getValue();
                            objectOutputStream2.writeUTF(key);
                            objectOutputStream2.writeObject(value);
                        }
                        Unit unit = Unit.INSTANCE;
                        CloseableKt.closeFinally(objectOutputStream, null);
                        CloseableKt.closeFinally(byteArrayOutputStream, null);
                        if (stream.size() > 10240) {
                            throw new IllegalStateException("Data cannot occupy more than 10240 bytes when serialized");
                        }
                        byte[] byteArray = stream.toByteArray();
                        Intrinsics.checkNotNullExpressionValue(byteArray, "{\n                val st…ByteArray()\n            }");
                        return byteArray;
                    } catch (Throwable th) {
                        try {
                            throw th;
                        } catch (Throwable th2) {
                            CloseableKt.closeFinally(objectOutputStream, th);
                            throw th2;
                        }
                    }
                } catch (Throwable th3) {
                    try {
                        throw th3;
                    } catch (Throwable th4) {
                        CloseableKt.closeFinally(byteArrayOutputStream, th3);
                        throw th4;
                    }
                }
            } catch (IOException e) {
                String tag$iv = Data_Kt.TAG;
                Logger.get().error(tag$iv, "Error in Data#toByteArray: ", e);
                return new byte[0];
            }
        }

        private static final void toByteArrayInternalV1$writeHeader(DataOutputStream $this$toByteArrayInternalV1_u24writeHeader) throws IOException {
            $this$toByteArrayInternalV1_u24writeHeader.writeShort(-21521);
            $this$toByteArrayInternalV1_u24writeHeader.writeShort(1);
        }

        private static final void toByteArrayInternalV1$writeArray(DataOutputStream dataOutputStream, Object[] objArr) throws IOException {
            int i;
            KClass orCreateKotlinClass = Reflection.getOrCreateKotlinClass(objArr.getClass());
            if (Intrinsics.areEqual(orCreateKotlinClass, Reflection.getOrCreateKotlinClass(Boolean[].class))) {
                i = 8;
            } else if (Intrinsics.areEqual(orCreateKotlinClass, Reflection.getOrCreateKotlinClass(Byte[].class))) {
                i = 9;
            } else if (Intrinsics.areEqual(orCreateKotlinClass, Reflection.getOrCreateKotlinClass(Integer[].class))) {
                i = 10;
            } else if (Intrinsics.areEqual(orCreateKotlinClass, Reflection.getOrCreateKotlinClass(Long[].class))) {
                i = 11;
            } else if (Intrinsics.areEqual(orCreateKotlinClass, Reflection.getOrCreateKotlinClass(Float[].class))) {
                i = 12;
            } else if (Intrinsics.areEqual(orCreateKotlinClass, Reflection.getOrCreateKotlinClass(Double[].class))) {
                i = 13;
            } else {
                if (!Intrinsics.areEqual(orCreateKotlinClass, Reflection.getOrCreateKotlinClass(String[].class))) {
                    throw new IllegalArgumentException("Unsupported value type " + Reflection.getOrCreateKotlinClass(objArr.getClass()).getQualifiedName());
                }
                i = 14;
            }
            dataOutputStream.writeByte(i);
            dataOutputStream.writeInt(objArr.length);
            for (Object obj : objArr) {
                if (i == 8) {
                    Boolean bool = obj instanceof Boolean ? (Boolean) obj : null;
                    dataOutputStream.writeBoolean(bool != null ? bool.booleanValue() : false);
                } else if (i == 9) {
                    Byte b = obj instanceof Byte ? (Byte) obj : null;
                    dataOutputStream.writeByte(b != null ? b.byteValue() : (byte) 0);
                } else if (i == 10) {
                    Integer num = obj instanceof Integer ? (Integer) obj : null;
                    dataOutputStream.writeInt(num != null ? num.intValue() : 0);
                } else if (i == 11) {
                    Long l = obj instanceof Long ? (Long) obj : null;
                    dataOutputStream.writeLong(l != null ? l.longValue() : 0L);
                } else if (i == 12) {
                    Float f = obj instanceof Float ? (Float) obj : null;
                    dataOutputStream.writeFloat(f != null ? f.floatValue() : 0.0f);
                } else if (i == 13) {
                    Double d = obj instanceof Double ? (Double) obj : null;
                    dataOutputStream.writeDouble(d != null ? d.doubleValue() : 0.0d);
                } else if (i == 14) {
                    String str = obj instanceof String ? (String) obj : null;
                    if (str == null) {
                        str = Data.NULL_STRING_V1;
                    }
                    dataOutputStream.writeUTF(str);
                }
            }
        }

        private static final void toByteArrayInternalV1$writeEntry(DataOutputStream $this$toByteArrayInternalV1_u24writeEntry, String key, Object value) throws IOException {
            if (value == null) {
                $this$toByteArrayInternalV1_u24writeEntry.writeByte(0);
            } else if (value instanceof Boolean) {
                $this$toByteArrayInternalV1_u24writeEntry.writeByte(1);
                $this$toByteArrayInternalV1_u24writeEntry.writeBoolean(((Boolean) value).booleanValue());
            } else if (value instanceof Byte) {
                $this$toByteArrayInternalV1_u24writeEntry.writeByte(2);
                $this$toByteArrayInternalV1_u24writeEntry.writeByte(((Number) value).byteValue());
            } else if (value instanceof Integer) {
                $this$toByteArrayInternalV1_u24writeEntry.writeByte(3);
                $this$toByteArrayInternalV1_u24writeEntry.writeInt(((Number) value).intValue());
            } else if (value instanceof Long) {
                $this$toByteArrayInternalV1_u24writeEntry.writeByte(4);
                $this$toByteArrayInternalV1_u24writeEntry.writeLong(((Number) value).longValue());
            } else if (value instanceof Float) {
                $this$toByteArrayInternalV1_u24writeEntry.writeByte(5);
                $this$toByteArrayInternalV1_u24writeEntry.writeFloat(((Number) value).floatValue());
            } else if (value instanceof Double) {
                $this$toByteArrayInternalV1_u24writeEntry.writeByte(6);
                $this$toByteArrayInternalV1_u24writeEntry.writeDouble(((Number) value).doubleValue());
            } else if (value instanceof String) {
                $this$toByteArrayInternalV1_u24writeEntry.writeByte(7);
                $this$toByteArrayInternalV1_u24writeEntry.writeUTF((String) value);
            } else if (value instanceof Object[]) {
                toByteArrayInternalV1$writeArray($this$toByteArrayInternalV1_u24writeEntry, (Object[]) value);
            } else {
                throw new IllegalArgumentException("Unsupported value type " + Reflection.getOrCreateKotlinClass(value.getClass()).getSimpleName());
            }
            $this$toByteArrayInternalV1_u24writeEntry.writeUTF(key);
        }

        @JvmStatic
        public final byte[] toByteArrayInternalV1(Data data) {
            Intrinsics.checkNotNullParameter(data, "data");
            try {
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                DataOutputStream dataOutputStream = new DataOutputStream(outputStream);
                try {
                    DataOutputStream it = dataOutputStream;
                    toByteArrayInternalV1$writeHeader(it);
                    it.writeInt(data.size());
                    for (Map.Entry entry : data.values.entrySet()) {
                        String key = (String) entry.getKey();
                        Object value = entry.getValue();
                        toByteArrayInternalV1$writeEntry(it, key, value);
                    }
                    it.flush();
                    if (!(it.size() <= 10240)) {
                        throw new IllegalStateException("Data cannot occupy more than 10240 bytes when serialized".toString());
                    }
                    byte[] byteArray = outputStream.toByteArray();
                    CloseableKt.closeFinally(dataOutputStream, null);
                    Intrinsics.checkNotNullExpressionValue(byteArray, "{\n                ByteAr…          }\n            }");
                    return byteArray;
                } catch (Throwable th) {
                    try {
                        throw th;
                    } catch (Throwable th2) {
                        CloseableKt.closeFinally(dataOutputStream, th);
                        throw th2;
                    }
                }
            } catch (IOException e) {
                String tag$iv = Data_Kt.TAG;
                Logger.get().error(tag$iv, "Error in Data#toByteArray: ", e);
                return new byte[0];
            }
        }

        private static final boolean fromByteArray$isObjectStream(ByteArrayInputStream $this$fromByteArray_u24isObjectStream) {
            byte[] header = new byte[2];
            $this$fromByteArray_u24isObjectStream.read(header);
            byte magicLow = (byte) (-21267);
            byte magicHigh = (byte) ((-21267) >>> 8);
            boolean result = false;
            if (header[0] == magicHigh && header[1] == magicLow) {
                result = true;
            }
            $this$fromByteArray_u24isObjectStream.reset();
            return result;
        }

        private static final void fromByteArray$readHeader(DataInputStream $this$fromByteArray_u24readHeader) throws IOException {
            short magic = $this$fromByteArray_u24readHeader.readShort();
            if (!(magic == -21521)) {
                throw new IllegalStateException(("Magic number doesn't match: " + ((int) magic)).toString());
            }
            short version = $this$fromByteArray_u24readHeader.readShort();
            if (!(version == 1)) {
                throw new IllegalStateException(("Unsupported version number: " + ((int) version)).toString());
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        private static final Object fromByteArray$readValue(DataInputStream $this$fromByteArray_u24readValue, byte type) throws IOException {
            String str;
            if (type == 0) {
                return null;
            }
            if (type == 1) {
                return Boolean.valueOf($this$fromByteArray_u24readValue.readBoolean());
            }
            if (type == 2) {
                return Byte.valueOf($this$fromByteArray_u24readValue.readByte());
            }
            if (type == 3) {
                return Integer.valueOf($this$fromByteArray_u24readValue.readInt());
            }
            if (type == 4) {
                return Long.valueOf($this$fromByteArray_u24readValue.readLong());
            }
            if (type == 5) {
                return Float.valueOf($this$fromByteArray_u24readValue.readFloat());
            }
            if (type == 6) {
                return Double.valueOf($this$fromByteArray_u24readValue.readDouble());
            }
            if (type == 7) {
                return $this$fromByteArray_u24readValue.readUTF();
            }
            int i = 0;
            if (type == 8) {
                int i2 = $this$fromByteArray_u24readValue.readInt();
                Boolean[] boolArr = new Boolean[i2];
                while (i < i2) {
                    boolArr[i] = Boolean.valueOf($this$fromByteArray_u24readValue.readBoolean());
                    i++;
                }
                return (Serializable) boolArr;
            }
            if (type == 9) {
                int i3 = $this$fromByteArray_u24readValue.readInt();
                Byte[] bArr = new Byte[i3];
                while (i < i3) {
                    bArr[i] = Byte.valueOf($this$fromByteArray_u24readValue.readByte());
                    i++;
                }
                return (Serializable) bArr;
            }
            if (type == 10) {
                int i4 = $this$fromByteArray_u24readValue.readInt();
                Integer[] numArr = new Integer[i4];
                while (i < i4) {
                    numArr[i] = Integer.valueOf($this$fromByteArray_u24readValue.readInt());
                    i++;
                }
                return (Serializable) numArr;
            }
            if (type == 11) {
                int i5 = $this$fromByteArray_u24readValue.readInt();
                Long[] lArr = new Long[i5];
                while (i < i5) {
                    lArr[i] = Long.valueOf($this$fromByteArray_u24readValue.readLong());
                    i++;
                }
                return (Serializable) lArr;
            }
            if (type == 12) {
                int i6 = $this$fromByteArray_u24readValue.readInt();
                Float[] fArr = new Float[i6];
                while (i < i6) {
                    fArr[i] = Float.valueOf($this$fromByteArray_u24readValue.readFloat());
                    i++;
                }
                return (Serializable) fArr;
            }
            if (type == 13) {
                int i7 = $this$fromByteArray_u24readValue.readInt();
                Double[] dArr = new Double[i7];
                while (i < i7) {
                    dArr[i] = Double.valueOf($this$fromByteArray_u24readValue.readDouble());
                    i++;
                }
                return (Serializable) dArr;
            }
            if (type == 14) {
                int i8 = $this$fromByteArray_u24readValue.readInt();
                String[] strArr = new String[i8];
                while (i < i8) {
                    String it = $this$fromByteArray_u24readValue.readUTF();
                    if (Intrinsics.areEqual(it, Data.NULL_STRING_V1)) {
                        str = null;
                    } else {
                        str = it;
                    }
                    strArr[i] = str;
                    i++;
                }
                return (Serializable) strArr;
            }
            throw new IllegalStateException("Unsupported type " + ((int) type));
        }

        @JvmStatic
        public final Data fromByteArray(byte[] bytes) {
            Intrinsics.checkNotNullParameter(bytes, "bytes");
            int i = 0;
            if (!(bytes.length <= 10240)) {
                throw new IllegalStateException("Data cannot occupy more than 10240 bytes when serialized".toString());
            }
            if (bytes.length == 0) {
                return Data.EMPTY;
            }
            Map map = new LinkedHashMap();
            try {
                ByteArrayInputStream inputStream = new ByteArrayInputStream(bytes);
                if (fromByteArray$isObjectStream(inputStream)) {
                    ObjectInputStream objectInputStream = new ObjectInputStream(inputStream);
                    try {
                        ObjectInputStream it = objectInputStream;
                        int i2 = it.readInt();
                        while (i < i2) {
                            String utf = it.readUTF();
                            Intrinsics.checkNotNullExpressionValue(utf, "readUTF()");
                            map.put(utf, it.readObject());
                            i++;
                        }
                        CloseableKt.closeFinally(objectInputStream, null);
                    } catch (Throwable th) {
                        try {
                            throw th;
                        } catch (Throwable th2) {
                            CloseableKt.closeFinally(objectInputStream, th);
                            throw th2;
                        }
                    }
                } else {
                    DataInputStream dataInputStream = new DataInputStream(inputStream);
                    try {
                        DataInputStream it2 = dataInputStream;
                        fromByteArray$readHeader(it2);
                        int i3 = it2.readInt();
                        while (i < i3) {
                            byte type = it2.readByte();
                            Object value = fromByteArray$readValue(it2, type);
                            String key = it2.readUTF();
                            DataInputStream it3 = it2;
                            Intrinsics.checkNotNullExpressionValue(key, "key");
                            map.put(key, value);
                            i++;
                            it2 = it3;
                        }
                        CloseableKt.closeFinally(dataInputStream, null);
                    } catch (Throwable th3) {
                        try {
                            throw th3;
                        } catch (Throwable th4) {
                            CloseableKt.closeFinally(dataInputStream, th3);
                            throw th4;
                        }
                    }
                }
            } catch (IOException e) {
                String tag$iv = Data_Kt.TAG;
                Logger.get().error(tag$iv, "Error in Data#fromByteArray: ", e);
            } catch (ClassNotFoundException e2) {
                String tag$iv2 = Data_Kt.TAG;
                Logger.get().error(tag$iv2, "Error in Data#fromByteArray: ", e2);
            }
            return new Data((Map<String, ?>) map);
        }
    }

    @Deprecated(message = "This is kept for testing migration", replaceWith = @ReplaceWith(expression = "toByteArrayInternalV1", imports = {}))
    @JvmStatic
    public static final byte[] toByteArrayInternalV0(Data data) {
        return INSTANCE.toByteArrayInternalV0(data);
    }

    @JvmStatic
    public static final byte[] toByteArrayInternalV1(Data data) {
        return INSTANCE.toByteArrayInternalV1(data);
    }

    @JvmStatic
    public static final Data fromByteArray(byte[] bytes) {
        return INSTANCE.fromByteArray(bytes);
    }
}
