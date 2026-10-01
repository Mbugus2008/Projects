package com.facebook.stetho.json;

import com.facebook.stetho.common.ExceptionUtil;
import com.facebook.stetho.json.annotation.JsonProperty;
import com.facebook.stetho.json.annotation.JsonValue;
import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Nullable;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class ObjectMapper {
    private final Map<Class<?>, Method> mJsonValueMethodCache = new IdentityHashMap();

    /* JADX WARN: Multi-variable type inference failed */
    public <T> T convertValue(Object obj, Class<T> cls) throws IllegalArgumentException {
        if (obj == 0) {
            return null;
        }
        if (cls != Object.class && cls.isAssignableFrom(obj.getClass())) {
            return obj;
        }
        try {
            if (obj instanceof JSONObject) {
                return (T) _convertFromJSONObject((JSONObject) obj, cls);
            }
            if (cls == JSONObject.class) {
                return (T) _convertToJSONObject(obj);
            }
            throw new IllegalArgumentException("Expecting either fromValue or toValueType to be a JSONObject");
        } catch (IllegalAccessException e) {
            throw new IllegalArgumentException(e);
        } catch (InstantiationException e2) {
            throw new IllegalArgumentException(e2);
        } catch (NoSuchMethodException e3) {
            throw new IllegalArgumentException(e3);
        } catch (InvocationTargetException e4) {
            throw ExceptionUtil.propagate(e4.getCause());
        } catch (JSONException e5) {
            throw new IllegalArgumentException(e5);
        }
    }

    private <T> T _convertFromJSONObject(JSONObject jsonObject, Class<T> type) throws IllegalAccessException, JSONException, NoSuchMethodException, InstantiationException, InvocationTargetException {
        Constructor<T> constructor = type.getDeclaredConstructor(null);
        constructor.setAccessible(true);
        T instance = constructor.newInstance(new Object[0]);
        Field[] fields = type.getFields();
        for (Field field : fields) {
            if (!Modifier.isStatic(field.getModifiers())) {
                Object value = jsonObject.opt(field.getName());
                Object setValue = getValueForField(field, value);
                try {
                    field.set(instance, setValue);
                } catch (IllegalArgumentException e) {
                    throw new IllegalArgumentException("Class: " + type.getSimpleName() + " Field: " + field.getName() + " type " + (setValue != null ? setValue.getClass().getName() : "null"), e);
                }
            }
        }
        return instance;
    }

    private Object getValueForField(Field field, Object value) throws JSONException {
        if (value != null) {
            try {
                if (value == JSONObject.NULL) {
                    return null;
                }
                if (value.getClass() == field.getType()) {
                    return value;
                }
                if (value instanceof JSONObject) {
                    return convertValue(value, field.getType());
                }
                if (field.getType().isEnum()) {
                    return getEnumValue((String) value, field.getType().asSubclass(Enum.class));
                }
                if (value instanceof JSONArray) {
                    return convertArrayToList(field, (JSONArray) value);
                }
                if (value instanceof Number) {
                    Number numberValue = (Number) value;
                    Class<?> clazz = field.getType();
                    if (clazz != Integer.class && clazz != Integer.TYPE) {
                        if (clazz != Long.class && clazz != Long.TYPE) {
                            if (clazz != Double.class && clazz != Double.TYPE) {
                                if (clazz != Float.class && clazz != Float.TYPE) {
                                    if (clazz != Byte.class && clazz != Byte.TYPE) {
                                        if (clazz != Short.class && clazz != Short.TYPE) {
                                            throw new IllegalArgumentException("Not setup to handle class " + clazz.getName());
                                        }
                                        return Short.valueOf(numberValue.shortValue());
                                    }
                                    return Byte.valueOf(numberValue.byteValue());
                                }
                                return Float.valueOf(numberValue.floatValue());
                            }
                            return Double.valueOf(numberValue.doubleValue());
                        }
                        return Long.valueOf(numberValue.longValue());
                    }
                    return Integer.valueOf(numberValue.intValue());
                }
            } catch (IllegalAccessException e) {
                throw new IllegalArgumentException("Unable to set value for field " + field.getName(), e);
            }
        }
        return value;
    }

    private Enum getEnumValue(String value, Class<? extends Enum> clazz) {
        Method method = getJsonValueMethod(clazz);
        if (method != null) {
            return getEnumByMethod(value, clazz, method);
        }
        return Enum.valueOf(clazz, value);
    }

    private Enum getEnumByMethod(String value, Class<? extends Enum> clazz, Method method) {
        Enum[] enumValues = (Enum[]) clazz.getEnumConstants();
        for (Enum enumValue : enumValues) {
            try {
                Object o = method.invoke(enumValue, new Object[0]);
                if (o != null && o.toString().equals(value)) {
                    return enumValue;
                }
            } catch (Exception ex) {
                throw new IllegalArgumentException(ex);
            }
        }
        throw new IllegalArgumentException("No enum constant " + clazz.getName() + "." + value);
    }

    private List<Object> convertArrayToList(Field field, JSONArray array) throws JSONException, IllegalAccessException {
        if (List.class.isAssignableFrom(field.getType())) {
            ParameterizedType parameterizedType = (ParameterizedType) field.getGenericType();
            Type[] types = parameterizedType.getActualTypeArguments();
            if (types.length != 1) {
                throw new IllegalArgumentException("Only able to handle a single type in a list " + field.getName());
            }
            Class<? extends Enum> cls = (Class) types[0];
            List<Object> objectList = new ArrayList<>();
            for (int i = 0; i < array.length(); i++) {
                if (cls.isEnum()) {
                    objectList.add(getEnumValue(array.getString(i), cls));
                } else if (canDirectlySerializeClass(cls)) {
                    objectList.add(array.get(i));
                } else {
                    JSONObject jsonObject = array.getJSONObject(i);
                    if (jsonObject == null) {
                        objectList.add(null);
                    } else {
                        objectList.add(convertValue(jsonObject, cls));
                    }
                }
            }
            return objectList;
        }
        throw new IllegalArgumentException("only know how to deserialize List<?> on field " + field.getName());
    }

    private JSONObject _convertToJSONObject(Object fromValue) throws IllegalAccessException, JSONException, InvocationTargetException {
        JsonProperty property;
        JSONObject jsonObject = new JSONObject();
        Field[] fields = fromValue.getClass().getFields();
        for (Field field : fields) {
            if (!Modifier.isStatic(field.getModifiers()) && (property = (JsonProperty) field.getAnnotation(JsonProperty.class)) != null) {
                Object value = field.get(fromValue);
                Class<?> type = field.getType();
                if (value != null) {
                    type = value.getClass();
                }
                String name = field.getName();
                if (property.required() && value == null) {
                    value = JSONObject.NULL;
                } else if (value != JSONObject.NULL) {
                    value = getJsonValue(value, type, field);
                }
                jsonObject.put(name, value);
            }
        }
        return jsonObject;
    }

    private Object getJsonValue(Object value, Class<?> clazz, Field field) throws IllegalAccessException, InvocationTargetException {
        if (value == null) {
            return null;
        }
        if (List.class.isAssignableFrom(clazz)) {
            return convertListToJsonArray(value);
        }
        Method m = getJsonValueMethod(clazz);
        if (m != null) {
            return m.invoke(value, new Object[0]);
        }
        if (!canDirectlySerializeClass(clazz)) {
            return convertValue(value, JSONObject.class);
        }
        if (clazz.equals(Double.class) || clazz.equals(Float.class)) {
            double doubleValue = ((Number) value).doubleValue();
            if (Double.isNaN(doubleValue)) {
                return "NaN";
            }
            if (doubleValue == Double.POSITIVE_INFINITY) {
                return "Infinity";
            }
            if (doubleValue == Double.NEGATIVE_INFINITY) {
                return "-Infinity";
            }
        }
        return value;
    }

    private JSONArray convertListToJsonArray(Object value) throws IllegalAccessException, InvocationTargetException {
        JSONArray array = new JSONArray();
        List<Object> list = (List) value;
        for (Object obj : list) {
            Object jsonValue = null;
            if (obj != null) {
                jsonValue = getJsonValue(obj, obj.getClass(), null);
            }
            array.put(jsonValue);
        }
        return array;
    }

    @Nullable
    private Method getJsonValueMethod(Class<?> clazz) {
        Method method;
        synchronized (this.mJsonValueMethodCache) {
            method = this.mJsonValueMethodCache.get(clazz);
            if (method == null && !this.mJsonValueMethodCache.containsKey(clazz)) {
                method = getJsonValueMethodImpl(clazz);
                this.mJsonValueMethodCache.put(clazz, method);
            }
        }
        return method;
    }

    @Nullable
    private static Method getJsonValueMethodImpl(Class<?> clazz) {
        Method[] methods = clazz.getMethods();
        for (int i = 0; i < methods.length; i++) {
            Annotation jsonValue = methods[i].getAnnotation(JsonValue.class);
            if (jsonValue != null) {
                return methods[i];
            }
        }
        return null;
    }

    private static boolean canDirectlySerializeClass(Class clazz) {
        return isWrapperOrPrimitiveType(clazz) || clazz.equals(String.class);
    }

    private static boolean isWrapperOrPrimitiveType(Class<?> clazz) {
        return clazz.isPrimitive() || clazz.equals(Boolean.class) || clazz.equals(Integer.class) || clazz.equals(Character.class) || clazz.equals(Byte.class) || clazz.equals(Short.class) || clazz.equals(Double.class) || clazz.equals(Long.class) || clazz.equals(Float.class);
    }
}
