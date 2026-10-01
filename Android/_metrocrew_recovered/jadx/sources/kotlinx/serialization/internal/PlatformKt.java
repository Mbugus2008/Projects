package kotlinx.serialization.internal;

import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.UByte;
import kotlin.UByteArray;
import kotlin.UInt;
import kotlin.UIntArray;
import kotlin.ULong;
import kotlin.ULongArray;
import kotlin.UShort;
import kotlin.UShortArray;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.jvm.JvmClassMappingKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.BooleanCompanionObject;
import kotlin.jvm.internal.ByteCompanionObject;
import kotlin.jvm.internal.CharCompanionObject;
import kotlin.jvm.internal.DoubleCompanionObject;
import kotlin.jvm.internal.FloatCompanionObject;
import kotlin.jvm.internal.IntCompanionObject;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.LongCompanionObject;
import kotlin.jvm.internal.Reflection;
import kotlin.jvm.internal.ShortCompanionObject;
import kotlin.jvm.internal.StringCompanionObject;
import kotlin.reflect.KClass;
import kotlin.text.StringsKt;
import kotlin.time.Duration;
import kotlin.uuid.Uuid;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.Polymorphic;
import kotlinx.serialization.PolymorphicSerializer;
import kotlinx.serialization.Serializable;
import kotlinx.serialization.SerializationException;
import kotlinx.serialization.builtins.BuiltinSerializersKt;

/* JADX INFO: compiled from: Platform.kt */
/* JADX INFO: loaded from: classes7.dex */
@Metadata(d1 = {"\u0000`\n\u0002\b\u0002\n\u0002\u0010\u0011\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u000b\n\u0002\u0010\u0018\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0001\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000f\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010$\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a&\u0010\u0000\u001a\u0002H\u0001\"\u0004\b\u0000\u0010\u0001*\b\u0012\u0004\u0012\u0002H\u00010\u00022\u0006\u0010\u0003\u001a\u00020\u0004H\u0080\b¢\u0006\u0002\u0010\u0005\u001a\u0015\u0010\u0000\u001a\u00020\u0006*\u00020\u00072\u0006\u0010\u0003\u001a\u00020\u0004H\u0080\b\u001a\u001c\u0010\b\u001a\u00020\u0006\"\b\b\u0000\u0010\u0001*\u00020\t*\b\u0012\u0004\u0012\u0002H\u00010\nH\u0000\u001a$\u0010\u000b\u001a\n\u0012\u0004\u0012\u0002H\u0001\u0018\u00010\f\"\b\b\u0000\u0010\u0001*\u00020\t*\b\u0012\u0004\u0012\u0002H\u00010\nH\u0000\u001aK\u0010\r\u001a\b\u0012\u0004\u0012\u0002H\u000e0\u0002\"\b\b\u0000\u0010\u0001*\u00020\t\"\n\b\u0001\u0010\u000e*\u0004\u0018\u0001H\u0001*\u0012\u0012\u0004\u0012\u0002H\u000e0\u000fj\b\u0012\u0004\u0012\u0002H\u000e`\u00102\f\u0010\u0011\u001a\b\u0012\u0004\u0012\u0002H\u00010\nH\u0000¢\u0006\u0002\u0010\u0012\u001a\u0010\u0010\u0013\u001a\u00020\u0014*\u0006\u0012\u0002\b\u00030\nH\u0000\u001a\u0010\u0010\u0015\u001a\u00020\u0014*\u0006\u0012\u0002\b\u00030\u0016H\u0000\u001aM\u0010\u0017\u001a\n\u0012\u0004\u0012\u0002H\u0001\u0018\u00010\f\"\b\b\u0000\u0010\u0001*\u00020\t*\b\u0012\u0004\u0012\u0002H\u00010\n2\"\u0010\u0018\u001a\u0012\u0012\u000e\b\u0001\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\f0\u0002\"\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\fH\u0000¢\u0006\u0002\u0010\u0019\u001aM\u0010\u0017\u001a\n\u0012\u0004\u0012\u0002H\u0001\u0018\u00010\f\"\b\b\u0000\u0010\u0001*\u00020\t*\b\u0012\u0004\u0012\u0002H\u00010\u00162\"\u0010\u0018\u001a\u0012\u0012\u000e\b\u0001\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\f0\u0002\"\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\fH\u0000¢\u0006\u0002\u0010\u001a\u001aM\u0010\u001b\u001a\n\u0012\u0004\u0012\u0002H\u0001\u0018\u00010\f\"\b\b\u0000\u0010\u0001*\u00020\t*\b\u0012\u0004\u0012\u0002H\u00010\u00162\"\u0010\u0018\u001a\u0012\u0012\u000e\b\u0001\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\f0\u0002\"\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\fH\u0002¢\u0006\u0002\u0010\u001a\u001a\u001e\u0010\u001c\u001a\u0004\u0018\u00010\t\"\b\b\u0000\u0010\u0001*\u00020\t*\b\u0012\u0004\u0012\u0002H\u00010\u0016H\u0002\u001a\u001c\u0010\u001d\u001a\u00020\u0006\"\b\b\u0000\u0010\u0001*\u00020\t*\b\u0012\u0004\u0012\u0002H\u00010\u0016H\u0002\u001a\u001c\u0010\u001e\u001a\u00020\u0006\"\b\b\u0000\u0010\u0001*\u00020\t*\b\u0012\u0004\u0012\u0002H\u00010\u0016H\u0002\u001aO\u0010\u001f\u001a\n\u0012\u0004\u0012\u0002H\u0001\u0018\u00010\f\"\b\b\u0000\u0010\u0001*\u00020\t2\n\u0010 \u001a\u0006\u0012\u0002\b\u00030\u00162\"\u0010\u0018\u001a\u0012\u0012\u000e\b\u0001\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\f0\u0002\"\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\fH\u0002¢\u0006\u0002\u0010\u001a\u001aK\u0010!\u001a\n\u0012\u0004\u0012\u0002H\u0001\u0018\u00010\f\"\b\b\u0000\u0010\u0001*\u00020\t2\u0006\u0010\"\u001a\u00020\t2\"\u0010\u0018\u001a\u0012\u0012\u000e\b\u0001\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\f0\u0002\"\n\u0012\u0006\u0012\u0004\u0018\u00010\t0\fH\u0002¢\u0006\u0002\u0010#\u001a\u001a\u0010$\u001a\u0004\u0018\u00010\t*\u0006\u0012\u0002\b\u00030\u00162\u0006\u0010%\u001a\u00020&H\u0002\u001a\"\u0010'\u001a\b\u0012\u0004\u0012\u0002H\u00010\f\"\b\b\u0000\u0010\u0001*\u00020\t*\b\u0012\u0004\u0012\u0002H\u00010\u0016H\u0002\u001a$\u0010(\u001a\n\u0012\u0004\u0012\u0002H\u0001\u0018\u00010\f\"\b\b\u0000\u0010\u0001*\u00020\t*\b\u0012\u0004\u0012\u0002H\u00010\u0016H\u0002\u001a\u0016\u0010)\u001a\u00020\u00062\f\u0010*\u001a\b\u0012\u0004\u0012\u00020\t0\nH\u0000\u001a\u001c\u0010+\u001a\u0016\u0012\b\u0012\u0006\u0012\u0002\b\u00030\n\u0012\b\u0012\u0006\u0012\u0002\b\u00030\f0,H\u0000\u001a\u0017\u0010-\u001a\u00020.2\f\u0010/\u001a\b\u0012\u0004\u0012\u00020.00H\u0082\b¨\u00061"}, d2 = {"getChecked", "T", "", "index", "", "([Ljava/lang/Object;I)Ljava/lang/Object;", "", "", "isInterface", "", "Lkotlin/reflect/KClass;", "compiledSerializerImpl", "Lkotlinx/serialization/KSerializer;", "toNativeArrayImpl", "E", "Ljava/util/ArrayList;", "Lkotlin/collections/ArrayList;", "eClass", "(Ljava/util/ArrayList;Lkotlin/reflect/KClass;)[Ljava/lang/Object;", "platformSpecificSerializerNotRegistered", "", "serializerNotRegistered", "Ljava/lang/Class;", "constructSerializerForGivenTypeArgs", "args", "(Lkotlin/reflect/KClass;[Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;", "(Ljava/lang/Class;[Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;", "findInNamedCompanion", "findNamedCompanionByAnnotation", "isNotAnnotated", "isPolymorphicSerializer", "invokeSerializerOnDefaultCompanion", "jClass", "invokeSerializerOnCompanion", "companion", "(Ljava/lang/Object;[Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;", "companionOrNull", "companionName", "", "createEnumSerializer", "findObjectSerializer", "isReferenceArray", "rootClass", "initBuiltins", "", "loadSafe", "", "block", "Lkotlin/Function0;", "kotlinx-serialization-core"}, k = 2, mv = {2, 0, 0}, xi = 48)
public final class PlatformKt {
    public static final <T> T getChecked(T[] tArr, int index) {
        Intrinsics.checkNotNullParameter(tArr, "<this>");
        return tArr[index];
    }

    public static final boolean getChecked(boolean[] $this$getChecked, int index) {
        Intrinsics.checkNotNullParameter($this$getChecked, "<this>");
        return $this$getChecked[index];
    }

    public static final <T> boolean isInterface(KClass<T> kClass) {
        Intrinsics.checkNotNullParameter(kClass, "<this>");
        return JvmClassMappingKt.getJavaClass((KClass) kClass).isInterface();
    }

    public static final <T> KSerializer<T> compiledSerializerImpl(KClass<T> kClass) {
        Intrinsics.checkNotNullParameter(kClass, "<this>");
        return constructSerializerForGivenTypeArgs(kClass, (KSerializer<Object>[]) new KSerializer[0]);
    }

    public static final <T, E extends T> E[] toNativeArrayImpl(ArrayList<E> arrayList, KClass<T> eClass) {
        Intrinsics.checkNotNullParameter(arrayList, "<this>");
        Intrinsics.checkNotNullParameter(eClass, "eClass");
        Object objNewInstance = Array.newInstance((Class<?>) JvmClassMappingKt.getJavaClass((KClass) eClass), arrayList.size());
        Intrinsics.checkNotNull(objNewInstance, "null cannot be cast to non-null type kotlin.Array<E of kotlinx.serialization.internal.PlatformKt.toNativeArrayImpl>");
        E[] eArr = (E[]) arrayList.toArray((Object[]) objNewInstance);
        Intrinsics.checkNotNullExpressionValue(eArr, "toArray(...)");
        return eArr;
    }

    public static final Void platformSpecificSerializerNotRegistered(KClass<?> kClass) {
        Intrinsics.checkNotNullParameter(kClass, "<this>");
        Platform_commonKt.serializerNotRegistered(kClass);
        throw new KotlinNothingValueException();
    }

    public static final Void serializerNotRegistered(Class<?> cls) {
        Intrinsics.checkNotNullParameter(cls, "<this>");
        throw new SerializationException(Platform_commonKt.notRegisteredMessage((KClass<?>) JvmClassMappingKt.getKotlinClass(cls)));
    }

    public static final <T> KSerializer<T> constructSerializerForGivenTypeArgs(KClass<T> kClass, KSerializer<Object>... args) {
        Intrinsics.checkNotNullParameter(kClass, "<this>");
        Intrinsics.checkNotNullParameter(args, "args");
        return constructSerializerForGivenTypeArgs(JvmClassMappingKt.getJavaClass((KClass) kClass), (KSerializer<Object>[]) Arrays.copyOf(args, args.length));
    }

    public static final <T> KSerializer<T> constructSerializerForGivenTypeArgs(Class<T> cls, KSerializer<Object>... args) {
        Intrinsics.checkNotNullParameter(cls, "<this>");
        Intrinsics.checkNotNullParameter(args, "args");
        if (cls.isEnum() && isNotAnnotated(cls)) {
            return createEnumSerializer(cls);
        }
        KSerializer<T> kSerializerInvokeSerializerOnDefaultCompanion = invokeSerializerOnDefaultCompanion(cls, (KSerializer[]) Arrays.copyOf(args, args.length));
        if (kSerializerInvokeSerializerOnDefaultCompanion != null) {
            return kSerializerInvokeSerializerOnDefaultCompanion;
        }
        KSerializer<T> kSerializerFindObjectSerializer = findObjectSerializer(cls);
        if (kSerializerFindObjectSerializer != null) {
            return kSerializerFindObjectSerializer;
        }
        KSerializer<T> kSerializerFindInNamedCompanion = findInNamedCompanion(cls, (KSerializer[]) Arrays.copyOf(args, args.length));
        if (kSerializerFindInNamedCompanion != null) {
            return kSerializerFindInNamedCompanion;
        }
        if (isPolymorphicSerializer(cls)) {
            return new PolymorphicSerializer(JvmClassMappingKt.getKotlinClass(cls));
        }
        return null;
    }

    private static final <T> KSerializer<T> findInNamedCompanion(Class<T> cls, KSerializer<Object>... kSerializerArr) {
        Field field;
        KSerializer<T> kSerializerInvokeSerializerOnCompanion;
        Object namedCompanion = findNamedCompanionByAnnotation(cls);
        if (namedCompanion != null && (kSerializerInvokeSerializerOnCompanion = invokeSerializerOnCompanion(namedCompanion, (KSerializer[]) Arrays.copyOf(kSerializerArr, kSerializerArr.length))) != null) {
            return kSerializerInvokeSerializerOnCompanion;
        }
        try {
            Object[] declaredClasses = cls.getDeclaredClasses();
            Intrinsics.checkNotNullExpressionValue(declaredClasses, "getDeclaredClasses(...)");
            Object[] $this$singleOrNull$iv = declaredClasses;
            Object single$iv = null;
            boolean found$iv = false;
            int length = $this$singleOrNull$iv.length;
            int i = 0;
            while (true) {
                if (i >= length) {
                    if (!found$iv) {
                        single$iv = null;
                        break;
                    }
                    break;
                }
                Object element$iv = $this$singleOrNull$iv[i];
                if (Intrinsics.areEqual(((Class) element$iv).getSimpleName(), "$serializer")) {
                    if (found$iv) {
                        single$iv = null;
                        break;
                    }
                    single$iv = element$iv;
                    found$iv = true;
                }
                i++;
            }
            Class<?> cls2 = (Class) single$iv;
            Object obj = (cls2 == null || (field = cls2.getField("INSTANCE")) == null) ? null : field.get(null);
            if (obj instanceof KSerializer) {
                return (KSerializer) obj;
            }
            return null;
        } catch (NoSuchFieldException e) {
            return null;
        }
    }

    private static final <T> Object findNamedCompanionByAnnotation(Class<T> cls) {
        Object element$iv;
        Object[] declaredClasses = cls.getDeclaredClasses();
        Intrinsics.checkNotNullExpressionValue(declaredClasses, "getDeclaredClasses(...)");
        Object[] $this$firstOrNull$iv = declaredClasses;
        int length = $this$firstOrNull$iv.length;
        int i = 0;
        while (true) {
            if (i < length) {
                element$iv = $this$firstOrNull$iv[i];
                if (((Class) element$iv).getAnnotation(NamedCompanion.class) != null) {
                    break;
                }
                i++;
            } else {
                element$iv = null;
                break;
            }
        }
        Class<?> cls2 = (Class) element$iv;
        if (cls2 == null) {
            return null;
        }
        String simpleName = cls2.getSimpleName();
        Intrinsics.checkNotNullExpressionValue(simpleName, "getSimpleName(...)");
        return companionOrNull(cls, simpleName);
    }

    private static final <T> boolean isNotAnnotated(Class<T> cls) {
        return cls.getAnnotation(Serializable.class) == null && cls.getAnnotation(Polymorphic.class) == null;
    }

    private static final <T> boolean isPolymorphicSerializer(Class<T> cls) {
        if (cls.getAnnotation(Polymorphic.class) != null) {
            return true;
        }
        Serializable serializable = (Serializable) cls.getAnnotation(Serializable.class);
        return serializable != null && Intrinsics.areEqual(Reflection.getOrCreateKotlinClass(serializable.with()), Reflection.getOrCreateKotlinClass(PolymorphicSerializer.class));
    }

    private static final <T> KSerializer<T> invokeSerializerOnDefaultCompanion(Class<?> cls, KSerializer<Object>... kSerializerArr) {
        Object companion = companionOrNull(cls, "Companion");
        if (companion == null) {
            return null;
        }
        return invokeSerializerOnCompanion(companion, (KSerializer[]) Arrays.copyOf(kSerializerArr, kSerializerArr.length));
    }

    private static final <T> KSerializer<T> invokeSerializerOnCompanion(Object companion, KSerializer<Object>... kSerializerArr) throws IllegalAccessException, InvocationTargetException {
        Class[] types;
        try {
            if (kSerializerArr.length == 0) {
                types = new Class[0];
            } else {
                int length = kSerializerArr.length;
                Class[] clsArr = new Class[length];
                for (int i = 0; i < length; i++) {
                    clsArr[i] = KSerializer.class;
                }
                types = clsArr;
            }
            Object objInvoke = companion.getClass().getDeclaredMethod("serializer", (Class[]) Arrays.copyOf(types, types.length)).invoke(companion, Arrays.copyOf(kSerializerArr, kSerializerArr.length));
            if (objInvoke instanceof KSerializer) {
                return (KSerializer) objInvoke;
            }
            return null;
        } catch (NoSuchMethodException e) {
            return null;
        } catch (InvocationTargetException e2) {
            Throwable cause = e2.getCause();
            if (cause == null) {
                throw e2;
            }
            String message = cause.getMessage();
            if (message == null) {
                message = e2.getMessage();
            }
            throw new InvocationTargetException(cause, message);
        }
    }

    private static final Object companionOrNull(Class<?> cls, String companionName) {
        try {
            Field companion = cls.getDeclaredField(companionName);
            companion.setAccessible(true);
            return companion.get(null);
        } catch (Throwable th) {
            return null;
        }
    }

    private static final <T> KSerializer<T> createEnumSerializer(Class<T> cls) {
        Object[] constants = cls.getEnumConstants();
        String canonicalName = cls.getCanonicalName();
        Intrinsics.checkNotNullExpressionValue(canonicalName, "getCanonicalName(...)");
        Intrinsics.checkNotNull(constants, "null cannot be cast to non-null type kotlin.Array<out kotlin.Enum<*>>");
        return new EnumSerializer(canonicalName, (Enum[]) constants);
    }

    /* JADX WARN: Code duplicated, block: B:13:0x0022  */
    /* JADX WARN: Code duplicated, block: B:28:0x0067 A[DONT_INVERT] */
    /* JADX WARN: Code duplicated, block: B:30:0x006b  */
    /* JADX WARN: Code duplicated, block: B:51:0x00c6  */
    /* JADX WARN: Code duplicated, block: B:68:0x0069 A[SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:70:0x006d A[SYNTHETIC] */
    private static final <T> KSerializer<T> findObjectSerializer(Class<T> cls) throws IllegalAccessException, InvocationTargetException {
        boolean z;
        Class<T> cls2;
        boolean z2;
        boolean z3;
        String it = cls.getCanonicalName();
        if (it == null) {
            z = false;
        } else {
            if (StringsKt.startsWith$default(it, "java.", false, 2, (Object) null) || StringsKt.startsWith$default(it, "kotlin.", false, 2, (Object) null)) {
                z = false;
            } else {
                z = true;
            }
        }
        if (!z) {
            return null;
        }
        Object[] declaredFields = cls.getDeclaredFields();
        Intrinsics.checkNotNullExpressionValue(declaredFields, "getDeclaredFields(...)");
        Object[] $this$singleOrNull$iv = declaredFields;
        Object single$iv = null;
        boolean found$iv = false;
        int length = $this$singleOrNull$iv.length;
        int i = 0;
        while (true) {
            if (i < length) {
                Object element$iv = $this$singleOrNull$iv[i];
                Field it2 = (Field) element$iv;
                if (Intrinsics.areEqual(it2.getName(), "INSTANCE")) {
                    cls2 = cls;
                    if (Intrinsics.areEqual(it2.getType(), cls2) && Modifier.isStatic(it2.getModifiers())) {
                        z3 = true;
                    }
                    if (!z3) {
                        if (found$iv) {
                            single$iv = null;
                            break;
                        }
                        single$iv = element$iv;
                        found$iv = true;
                    }
                    i++;
                } else {
                    cls2 = cls;
                }
                z3 = false;
                if (!z3) {
                    if (found$iv) {
                        single$iv = null;
                        break;
                    }
                    single$iv = element$iv;
                    found$iv = true;
                }
                i++;
            } else {
                cls2 = cls;
                if (!found$iv) {
                    single$iv = null;
                    break;
                }
                break;
            }
        }
        Field field = (Field) single$iv;
        if (field == null) {
            return null;
        }
        Object instance = field.get(null);
        Object[] methods = cls2.getMethods();
        Intrinsics.checkNotNullExpressionValue(methods, "getMethods(...)");
        Object[] $this$singleOrNull$iv2 = methods;
        Object single$iv2 = null;
        boolean found$iv2 = false;
        int length2 = $this$singleOrNull$iv2.length;
        int i2 = 0;
        while (true) {
            if (i2 < length2) {
                Object element$iv2 = $this$singleOrNull$iv2[i2];
                Method it3 = (Method) element$iv2;
                if (Intrinsics.areEqual(it3.getName(), "serializer")) {
                    Class<?>[] parameterTypes = it3.getParameterTypes();
                    Intrinsics.checkNotNullExpressionValue(parameterTypes, "getParameterTypes(...)");
                    if ((parameterTypes.length == 0) && Intrinsics.areEqual(it3.getReturnType(), KSerializer.class)) {
                        z2 = true;
                    } else {
                        z2 = false;
                    }
                } else {
                    z2 = false;
                }
                if (z2) {
                    if (found$iv2) {
                        single$iv2 = null;
                        break;
                    }
                    found$iv2 = true;
                    single$iv2 = element$iv2;
                }
                i2++;
            } else {
                if (!found$iv2) {
                    single$iv2 = null;
                    break;
                }
                break;
            }
        }
        Method method = (Method) single$iv2;
        if (method == null) {
            return null;
        }
        Object result = method.invoke(instance, new Object[0]);
        if (result instanceof KSerializer) {
            return (KSerializer) result;
        }
        return null;
    }

    public static final boolean isReferenceArray(KClass<Object> rootClass) {
        Intrinsics.checkNotNullParameter(rootClass, "rootClass");
        return JvmClassMappingKt.getJavaClass((KClass) rootClass).isArray();
    }

    public static final Map<KClass<?>, KSerializer<?>> initBuiltins() {
        Map $this$initBuiltins_u24lambda_u2414 = MapsKt.createMapBuilder();
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(String.class), BuiltinSerializersKt.serializer(StringCompanionObject.INSTANCE));
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(Character.TYPE), BuiltinSerializersKt.serializer(CharCompanionObject.INSTANCE));
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(char[].class), BuiltinSerializersKt.CharArraySerializer());
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(Double.TYPE), BuiltinSerializersKt.serializer(DoubleCompanionObject.INSTANCE));
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(double[].class), BuiltinSerializersKt.DoubleArraySerializer());
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(Float.TYPE), BuiltinSerializersKt.serializer(FloatCompanionObject.INSTANCE));
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(float[].class), BuiltinSerializersKt.FloatArraySerializer());
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(Long.TYPE), BuiltinSerializersKt.serializer(LongCompanionObject.INSTANCE));
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(long[].class), BuiltinSerializersKt.LongArraySerializer());
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(ULong.class), BuiltinSerializersKt.serializer(ULong.INSTANCE));
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(Integer.TYPE), BuiltinSerializersKt.serializer(IntCompanionObject.INSTANCE));
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(int[].class), BuiltinSerializersKt.IntArraySerializer());
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(UInt.class), BuiltinSerializersKt.serializer(UInt.INSTANCE));
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(Short.TYPE), BuiltinSerializersKt.serializer(ShortCompanionObject.INSTANCE));
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(short[].class), BuiltinSerializersKt.ShortArraySerializer());
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(UShort.class), BuiltinSerializersKt.serializer(UShort.INSTANCE));
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(Byte.TYPE), BuiltinSerializersKt.serializer(ByteCompanionObject.INSTANCE));
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(byte[].class), BuiltinSerializersKt.ByteArraySerializer());
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(UByte.class), BuiltinSerializersKt.serializer(UByte.INSTANCE));
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(Boolean.TYPE), BuiltinSerializersKt.serializer(BooleanCompanionObject.INSTANCE));
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(boolean[].class), BuiltinSerializersKt.BooleanArraySerializer());
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(Unit.class), BuiltinSerializersKt.serializer(Unit.INSTANCE));
        $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(Void.class), BuiltinSerializersKt.NothingSerializer());
        try {
            $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(Duration.class), BuiltinSerializersKt.serializer(Duration.INSTANCE));
        } catch (ClassNotFoundException e) {
        } catch (NoClassDefFoundError e2) {
        }
        try {
            $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(ULongArray.class), BuiltinSerializersKt.ULongArraySerializer());
        } catch (ClassNotFoundException e3) {
        } catch (NoClassDefFoundError e4) {
        }
        try {
            $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(UIntArray.class), BuiltinSerializersKt.UIntArraySerializer());
        } catch (ClassNotFoundException e5) {
        } catch (NoClassDefFoundError e6) {
        }
        try {
            $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(UShortArray.class), BuiltinSerializersKt.UShortArraySerializer());
        } catch (ClassNotFoundException e7) {
        } catch (NoClassDefFoundError e8) {
        }
        try {
            $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(UByteArray.class), BuiltinSerializersKt.UByteArraySerializer());
        } catch (ClassNotFoundException e9) {
        } catch (NoClassDefFoundError e10) {
        }
        try {
            $this$initBuiltins_u24lambda_u2414.put(Reflection.getOrCreateKotlinClass(Uuid.class), BuiltinSerializersKt.serializer(Uuid.INSTANCE));
        } catch (ClassNotFoundException e11) {
        } catch (NoClassDefFoundError e12) {
        }
        return MapsKt.build($this$initBuiltins_u24lambda_u2414);
    }

    private static final void loadSafe(Function0<Unit> function0) {
        try {
            function0.invoke();
        } catch (ClassNotFoundException e) {
        } catch (NoClassDefFoundError e2) {
        }
    }
}
