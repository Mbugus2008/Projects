package com.google.gson.internal;

import com.google.gson.InstanceCreator;
import com.google.gson.JsonIOException;
import com.google.gson.ReflectionAccessFilter;
import com.google.gson.internal.reflect.ReflectionHelper;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collection;
import java.util.EnumMap;
import java.util.EnumSet;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentSkipListMap;

/* JADX INFO: loaded from: classes.dex */
public final class ConstructorConstructor {
    private final Map<Type, InstanceCreator<?>> instanceCreators;
    private final List<ReflectionAccessFilter> reflectionFilters;
    private final boolean useJdkUnsafe;

    public ConstructorConstructor(Map<Type, InstanceCreator<?>> instanceCreators, boolean useJdkUnsafe, List<ReflectionAccessFilter> reflectionFilters) {
        this.instanceCreators = instanceCreators;
        this.useJdkUnsafe = useJdkUnsafe;
        this.reflectionFilters = reflectionFilters;
    }

    static String checkInstantiable(Class<?> c) {
        int modifiers = c.getModifiers();
        if (Modifier.isInterface(modifiers)) {
            return "Interfaces can't be instantiated! Register an InstanceCreator or a TypeAdapter for this type. Interface name: " + c.getName();
        }
        if (Modifier.isAbstract(modifiers)) {
            return "Abstract classes can't be instantiated! Adjust the R8 configuration or register an InstanceCreator or a TypeAdapter for this type. Class name: " + c.getName() + "\nSee " + TroubleshootingGuide.createUrl("r8-abstract-class");
        }
        return null;
    }

    public <T> ObjectConstructor<T> get(TypeToken<T> typeToken) {
        return get(typeToken, true);
    }

    public <T> ObjectConstructor<T> get(TypeToken<T> typeToken, boolean allowUnsafe) {
        final Type type = typeToken.getType();
        Class<? super T> rawType = typeToken.getRawType();
        final InstanceCreator<?> instanceCreator = this.instanceCreators.get(type);
        if (instanceCreator != null) {
            return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda0
                @Override // com.google.gson.internal.ObjectConstructor
                public final Object construct() {
                    return instanceCreator.createInstance(type);
                }
            };
        }
        final InstanceCreator<?> instanceCreator2 = this.instanceCreators.get(rawType);
        if (instanceCreator2 != null) {
            return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda11
                @Override // com.google.gson.internal.ObjectConstructor
                public final Object construct() {
                    return instanceCreator2.createInstance(type);
                }
            };
        }
        ObjectConstructor<T> specialConstructor = newSpecialCollectionConstructor(type, rawType);
        if (specialConstructor != null) {
            return specialConstructor;
        }
        ReflectionAccessFilter.FilterResult filterResult = ReflectionAccessFilterHelper.getFilterResult(this.reflectionFilters, rawType);
        ObjectConstructor<T> defaultConstructor = newDefaultConstructor(rawType, filterResult);
        if (defaultConstructor != null) {
            return defaultConstructor;
        }
        ObjectConstructor<T> defaultImplementation = newDefaultImplementationConstructor(type, rawType);
        if (defaultImplementation != null) {
            return defaultImplementation;
        }
        final String exceptionMessage = checkInstantiable(rawType);
        if (exceptionMessage != null) {
            return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda13
                @Override // com.google.gson.internal.ObjectConstructor
                public final Object construct() {
                    return ConstructorConstructor.lambda$get$2(exceptionMessage);
                }
            };
        }
        if (!allowUnsafe) {
            final String message = "Unable to create instance of " + rawType + "; Register an InstanceCreator or a TypeAdapter for this type.";
            return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda14
                @Override // com.google.gson.internal.ObjectConstructor
                public final Object construct() {
                    return ConstructorConstructor.lambda$get$3(message);
                }
            };
        }
        if (filterResult != ReflectionAccessFilter.FilterResult.ALLOW) {
            final String message2 = "Unable to create instance of " + rawType + "; ReflectionAccessFilter does not permit using reflection or Unsafe. Register an InstanceCreator or a TypeAdapter for this type or adjust the access filter to allow using reflection.";
            return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda15
                @Override // com.google.gson.internal.ObjectConstructor
                public final Object construct() {
                    return ConstructorConstructor.lambda$get$4(message2);
                }
            };
        }
        return newUnsafeAllocator(rawType);
    }

    static /* synthetic */ Object lambda$get$2(String exceptionMessage) {
        throw new JsonIOException(exceptionMessage);
    }

    static /* synthetic */ Object lambda$get$3(String message) {
        throw new JsonIOException(message);
    }

    static /* synthetic */ Object lambda$get$4(String message) {
        throw new JsonIOException(message);
    }

    private static <T> ObjectConstructor<T> newSpecialCollectionConstructor(final Type type, Class<? super T> rawType) {
        if (EnumSet.class.isAssignableFrom(rawType)) {
            return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda2
                @Override // com.google.gson.internal.ObjectConstructor
                public final Object construct() {
                    return ConstructorConstructor.lambda$newSpecialCollectionConstructor$5(type);
                }
            };
        }
        if (rawType == EnumMap.class) {
            return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda3
                @Override // com.google.gson.internal.ObjectConstructor
                public final Object construct() {
                    return ConstructorConstructor.lambda$newSpecialCollectionConstructor$6(type);
                }
            };
        }
        return null;
    }

    static /* synthetic */ Object lambda$newSpecialCollectionConstructor$5(Type type) {
        if (type instanceof ParameterizedType) {
            Type elementType = ((ParameterizedType) type).getActualTypeArguments()[0];
            if (elementType instanceof Class) {
                return EnumSet.noneOf((Class) elementType);
            }
            throw new JsonIOException("Invalid EnumSet type: " + type.toString());
        }
        throw new JsonIOException("Invalid EnumSet type: " + type.toString());
    }

    static /* synthetic */ Object lambda$newSpecialCollectionConstructor$6(Type type) {
        if (type instanceof ParameterizedType) {
            Type elementType = ((ParameterizedType) type).getActualTypeArguments()[0];
            if (elementType instanceof Class) {
                return new EnumMap((Class) elementType);
            }
            throw new JsonIOException("Invalid EnumMap type: " + type.toString());
        }
        throw new JsonIOException("Invalid EnumMap type: " + type.toString());
    }

    private static <T> ObjectConstructor<T> newDefaultConstructor(Class<? super T> rawType, ReflectionAccessFilter.FilterResult filterResult) {
        final String exceptionMessage;
        if (Modifier.isAbstract(rawType.getModifiers())) {
            return null;
        }
        boolean canAccess = false;
        try {
            final Constructor<? super T> constructor = rawType.getDeclaredConstructor(new Class[0]);
            if (filterResult == ReflectionAccessFilter.FilterResult.ALLOW || (ReflectionAccessFilterHelper.canAccess(constructor, null) && (filterResult != ReflectionAccessFilter.FilterResult.BLOCK_ALL || Modifier.isPublic(constructor.getModifiers())))) {
                canAccess = true;
            }
            if (!canAccess) {
                final String message = "Unable to invoke no-args constructor of " + rawType + "; constructor is not accessible and ReflectionAccessFilter does not permit making it accessible. Register an InstanceCreator or a TypeAdapter for this type, change the visibility of the constructor or adjust the access filter.";
                return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda9
                    @Override // com.google.gson.internal.ObjectConstructor
                    public final Object construct() {
                        return ConstructorConstructor.lambda$newDefaultConstructor$7(message);
                    }
                };
            }
            if (filterResult == ReflectionAccessFilter.FilterResult.ALLOW && (exceptionMessage = ReflectionHelper.tryMakeAccessible(constructor)) != null) {
                return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda10
                    @Override // com.google.gson.internal.ObjectConstructor
                    public final Object construct() {
                        return ConstructorConstructor.lambda$newDefaultConstructor$8(exceptionMessage);
                    }
                };
            }
            return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda12
                @Override // com.google.gson.internal.ObjectConstructor
                public final Object construct() {
                    return ConstructorConstructor.lambda$newDefaultConstructor$9(constructor);
                }
            };
        } catch (NoSuchMethodException e) {
            return null;
        }
    }

    static /* synthetic */ Object lambda$newDefaultConstructor$7(String message) {
        throw new JsonIOException(message);
    }

    static /* synthetic */ Object lambda$newDefaultConstructor$8(String exceptionMessage) {
        throw new JsonIOException(exceptionMessage);
    }

    static /* synthetic */ Object lambda$newDefaultConstructor$9(Constructor constructor) {
        try {
            return constructor.newInstance(new Object[0]);
        } catch (IllegalAccessException e) {
            throw ReflectionHelper.createExceptionForUnexpectedIllegalAccess(e);
        } catch (InstantiationException e2) {
            throw new RuntimeException("Failed to invoke constructor '" + ReflectionHelper.constructorToString(constructor) + "' with no args", e2);
        } catch (InvocationTargetException e3) {
            throw new RuntimeException("Failed to invoke constructor '" + ReflectionHelper.constructorToString(constructor) + "' with no args", e3.getCause());
        }
    }

    private static <T> ObjectConstructor<T> newDefaultImplementationConstructor(Type type, Class<? super T> cls) {
        if (Collection.class.isAssignableFrom(cls)) {
            return (ObjectConstructor<T>) newCollectionConstructor(cls);
        }
        if (Map.class.isAssignableFrom(cls)) {
            return (ObjectConstructor<T>) newMapConstructor(type, cls);
        }
        return null;
    }

    private static ObjectConstructor<? extends Collection<? extends Object>> newCollectionConstructor(Class<?> rawType) {
        if (rawType.isAssignableFrom(ArrayList.class)) {
            return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda16
                @Override // com.google.gson.internal.ObjectConstructor
                public final Object construct() {
                    return ConstructorConstructor.lambda$newCollectionConstructor$10();
                }
            };
        }
        if (rawType.isAssignableFrom(LinkedHashSet.class)) {
            return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda17
                @Override // com.google.gson.internal.ObjectConstructor
                public final Object construct() {
                    return ConstructorConstructor.lambda$newCollectionConstructor$11();
                }
            };
        }
        if (rawType.isAssignableFrom(TreeSet.class)) {
            return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda18
                @Override // com.google.gson.internal.ObjectConstructor
                public final Object construct() {
                    return ConstructorConstructor.lambda$newCollectionConstructor$12();
                }
            };
        }
        if (rawType.isAssignableFrom(ArrayDeque.class)) {
            return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda19
                @Override // com.google.gson.internal.ObjectConstructor
                public final Object construct() {
                    return ConstructorConstructor.lambda$newCollectionConstructor$13();
                }
            };
        }
        return null;
    }

    static /* synthetic */ Collection lambda$newCollectionConstructor$10() {
        return new ArrayList();
    }

    static /* synthetic */ Collection lambda$newCollectionConstructor$11() {
        return new LinkedHashSet();
    }

    static /* synthetic */ Collection lambda$newCollectionConstructor$12() {
        return new TreeSet();
    }

    static /* synthetic */ Collection lambda$newCollectionConstructor$13() {
        return new ArrayDeque();
    }

    private static boolean hasStringKeyType(Type mapType) {
        if (!(mapType instanceof ParameterizedType)) {
            return true;
        }
        Type[] typeArguments = ((ParameterizedType) mapType).getActualTypeArguments();
        return typeArguments.length != 0 && GsonTypes.getRawType(typeArguments[0]) == String.class;
    }

    private static ObjectConstructor<? extends Map<? extends Object, Object>> newMapConstructor(Type type, Class<?> rawType) {
        if (rawType.isAssignableFrom(LinkedTreeMap.class) && hasStringKeyType(type)) {
            return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda4
                @Override // com.google.gson.internal.ObjectConstructor
                public final Object construct() {
                    return ConstructorConstructor.lambda$newMapConstructor$14();
                }
            };
        }
        if (rawType.isAssignableFrom(LinkedHashMap.class)) {
            return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda5
                @Override // com.google.gson.internal.ObjectConstructor
                public final Object construct() {
                    return ConstructorConstructor.lambda$newMapConstructor$15();
                }
            };
        }
        if (rawType.isAssignableFrom(TreeMap.class)) {
            return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda6
                @Override // com.google.gson.internal.ObjectConstructor
                public final Object construct() {
                    return ConstructorConstructor.lambda$newMapConstructor$16();
                }
            };
        }
        if (rawType.isAssignableFrom(ConcurrentHashMap.class)) {
            return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda7
                @Override // com.google.gson.internal.ObjectConstructor
                public final Object construct() {
                    return ConstructorConstructor.lambda$newMapConstructor$17();
                }
            };
        }
        if (rawType.isAssignableFrom(ConcurrentSkipListMap.class)) {
            return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda8
                @Override // com.google.gson.internal.ObjectConstructor
                public final Object construct() {
                    return ConstructorConstructor.lambda$newMapConstructor$18();
                }
            };
        }
        return null;
    }

    static /* synthetic */ Map lambda$newMapConstructor$14() {
        return new LinkedTreeMap();
    }

    static /* synthetic */ Map lambda$newMapConstructor$15() {
        return new LinkedHashMap();
    }

    static /* synthetic */ Map lambda$newMapConstructor$16() {
        return new TreeMap();
    }

    static /* synthetic */ Map lambda$newMapConstructor$17() {
        return new ConcurrentHashMap();
    }

    static /* synthetic */ Map lambda$newMapConstructor$18() {
        return new ConcurrentSkipListMap();
    }

    private <T> ObjectConstructor<T> newUnsafeAllocator(final Class<? super T> rawType) {
        if (this.useJdkUnsafe) {
            return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda20
                @Override // com.google.gson.internal.ObjectConstructor
                public final Object construct() {
                    return ConstructorConstructor.lambda$newUnsafeAllocator$19(rawType);
                }
            };
        }
        String exceptionMessage = "Unable to create instance of " + rawType + "; usage of JDK Unsafe is disabled. Registering an InstanceCreator or a TypeAdapter for this type, adding a no-args constructor, or enabling usage of JDK Unsafe may fix this problem.";
        if (rawType.getDeclaredConstructors().length == 0) {
            exceptionMessage = exceptionMessage + " Or adjust your R8 configuration to keep the no-args constructor of the class.";
        }
        final String exceptionMessageF = exceptionMessage;
        return new ObjectConstructor() { // from class: com.google.gson.internal.ConstructorConstructor$$ExternalSyntheticLambda1
            @Override // com.google.gson.internal.ObjectConstructor
            public final Object construct() {
                return ConstructorConstructor.lambda$newUnsafeAllocator$20(exceptionMessageF);
            }
        };
    }

    static /* synthetic */ Object lambda$newUnsafeAllocator$19(Class rawType) {
        try {
            return UnsafeAllocator.INSTANCE.newInstance(rawType);
        } catch (Exception e) {
            throw new RuntimeException("Unable to create instance of " + rawType + ". Registering an InstanceCreator or a TypeAdapter for this type, or adding a no-args constructor may fix this problem.", e);
        }
    }

    static /* synthetic */ Object lambda$newUnsafeAllocator$20(String exceptionMessageF) {
        throw new JsonIOException(exceptionMessageF);
    }

    public String toString() {
        return this.instanceCreators.toString();
    }
}
