package androidx.work;

import java.lang.reflect.Array;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

/* JADX INFO: compiled from: ArrayCreatingInputMerger.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0000\u0018\u00002\u00020\u0001B\u0005¢\u0006\u0002\u0010\u0002J&\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00042\b\u0010\u0006\u001a\u0004\u0018\u00010\u00042\n\u0010\u0007\u001a\u0006\u0012\u0002\b\u00030\bH\u0002J\u0018\u0010\t\u001a\u00020\u00042\u0006\u0010\n\u001a\u00020\u00042\u0006\u0010\u000b\u001a\u00020\u0004H\u0002J\u001e\u0010\f\u001a\u00020\u00042\b\u0010\u0006\u001a\u0004\u0018\u00010\u00042\n\u0010\u0007\u001a\u0006\u0012\u0002\b\u00030\bH\u0002J\u0016\u0010\r\u001a\u00020\u000e2\f\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u000e0\u0010H\u0016¨\u0006\u0011"}, d2 = {"Landroidx/work/ArrayCreatingInputMerger;", "Landroidx/work/InputMerger;", "()V", "concatenateArrayAndNonArray", "", "array", "obj", "valueClass", "Ljava/lang/Class;", "concatenateArrays", "array1", "array2", "createArrayFor", "merge", "Landroidx/work/Data;", "inputs", "", "work-runtime_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public final class ArrayCreatingInputMerger extends InputMerger {
    @Override // androidx.work.InputMerger
    public Data merge(List<Data> inputs) {
        Class<?> cls;
        Object objConcatenateArrayAndNonArray;
        Intrinsics.checkNotNullParameter(inputs, "inputs");
        Data.Builder output = new Data.Builder();
        Map mergedValues = new HashMap();
        for (Data input : inputs) {
            for (Map.Entry<String, Object> entry : input.getKeyValueMap().entrySet()) {
                String key = entry.getKey();
                Object value = entry.getValue();
                if (value == null || (cls = value.getClass()) == null) {
                    cls = String.class;
                }
                Object existingValue = mergedValues.get(key);
                if (existingValue == null) {
                    if (cls.isArray()) {
                        Intrinsics.checkNotNull(value, "null cannot be cast to non-null type kotlin.Any");
                        objConcatenateArrayAndNonArray = value;
                    } else {
                        objConcatenateArrayAndNonArray = createArrayFor(value, cls);
                    }
                } else {
                    Class<?> cls2 = existingValue.getClass();
                    if (Intrinsics.areEqual(cls2, cls)) {
                        Intrinsics.checkNotNull(value, "null cannot be cast to non-null type kotlin.Any");
                        objConcatenateArrayAndNonArray = concatenateArrays(existingValue, value);
                    } else if (Intrinsics.areEqual(cls2.getComponentType(), cls)) {
                        objConcatenateArrayAndNonArray = concatenateArrayAndNonArray(existingValue, value, cls);
                    } else {
                        throw new IllegalArgumentException();
                    }
                }
                mergedValues.put(key, objConcatenateArrayAndNonArray);
            }
        }
        output.putAll((Map<String, ? extends Object>) mergedValues);
        return output.build();
    }

    private final Object concatenateArrays(Object array1, Object array2) {
        int length1 = Array.getLength(array1);
        int length2 = Array.getLength(array2);
        Class<?> componentType = array1.getClass().getComponentType();
        Intrinsics.checkNotNull(componentType);
        Object newArray = Array.newInstance(componentType, length1 + length2);
        System.arraycopy(array1, 0, newArray, 0, length1);
        System.arraycopy(array2, 0, newArray, length1, length2);
        Intrinsics.checkNotNullExpressionValue(newArray, "newArray");
        return newArray;
    }

    private final Object concatenateArrayAndNonArray(Object array, Object obj, Class<?> valueClass) {
        int arrayLength = Array.getLength(array);
        Object newArray = Array.newInstance(valueClass, arrayLength + 1);
        System.arraycopy(array, 0, newArray, 0, arrayLength);
        Array.set(newArray, arrayLength, obj);
        Intrinsics.checkNotNullExpressionValue(newArray, "newArray");
        return newArray;
    }

    private final Object createArrayFor(Object obj, Class<?> valueClass) {
        Object newArray = Array.newInstance(valueClass, 1);
        Array.set(newArray, 0, obj);
        Intrinsics.checkNotNullExpressionValue(newArray, "newArray");
        return newArray;
    }
}
