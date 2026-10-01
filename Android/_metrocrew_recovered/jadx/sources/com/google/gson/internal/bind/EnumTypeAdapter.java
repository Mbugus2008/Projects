package com.google.gson.internal.bind;

import com.google.gson.Gson;
import com.google.gson.TypeAdapter;
import com.google.gson.TypeAdapterFactory;
import com.google.gson.annotations.SerializedName;
import com.google.gson.reflect.TypeToken;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonToken;
import com.google.gson.stream.JsonWriter;
import java.io.IOException;
import java.lang.Enum;
import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
class EnumTypeAdapter<T extends Enum<T>> extends TypeAdapter<T> {
    static final TypeAdapterFactory FACTORY = new TypeAdapterFactory() { // from class: com.google.gson.internal.bind.EnumTypeAdapter.1
        @Override // com.google.gson.TypeAdapterFactory
        public <T> TypeAdapter<T> create(Gson gson, TypeToken<T> typeToken) {
            Class<? super T> rawType = typeToken.getRawType();
            if (!Enum.class.isAssignableFrom(rawType) || rawType == Enum.class) {
                return null;
            }
            if (!rawType.isEnum()) {
                rawType = rawType.getSuperclass();
            }
            TypeAdapter<T> adapter = new EnumTypeAdapter<>(rawType);
            return adapter;
        }
    };
    private final Map<T, String> constantToName;
    private final Map<String, T> nameToConstant;
    private final Map<String, T> stringToConstant;

    private EnumTypeAdapter(Class<T> cls) {
        this.nameToConstant = new HashMap();
        this.stringToConstant = new HashMap();
        this.constantToName = new HashMap();
        try {
            Field[] declaredFields = cls.getDeclaredFields();
            int i = 0;
            for (Field field : declaredFields) {
                if (field.isEnumConstant()) {
                    declaredFields[i] = field;
                    i++;
                }
            }
            Field[] fieldArr = (Field[]) Arrays.copyOf(declaredFields, i);
            AccessibleObject.setAccessible(fieldArr, true);
            for (Field field2 : fieldArr) {
                Enum r7 = (Enum) field2.get(null);
                String strName = r7.name();
                String string = r7.toString();
                SerializedName serializedName = (SerializedName) field2.getAnnotation(SerializedName.class);
                if (serializedName != null) {
                    strName = serializedName.value();
                    for (String str : serializedName.alternate()) {
                        this.nameToConstant.put(str, (T) r7);
                    }
                }
                this.nameToConstant.put(strName, (T) r7);
                this.stringToConstant.put(string, (T) r7);
                this.constantToName.put((T) r7, strName);
            }
        } catch (IllegalAccessException e) {
            throw new AssertionError(e);
        }
    }

    @Override // com.google.gson.TypeAdapter
    /* JADX INFO: renamed from: read */
    public T read2(JsonReader in) throws IOException {
        if (in.peek() == JsonToken.NULL) {
            in.nextNull();
            return null;
        }
        String key = in.nextString();
        T constant = this.nameToConstant.get(key);
        return constant == null ? this.stringToConstant.get(key) : constant;
    }

    @Override // com.google.gson.TypeAdapter
    public void write(JsonWriter out, T value) throws IOException {
        out.value(value == null ? null : this.constantToName.get(value));
    }
}
