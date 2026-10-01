package com.google.gson.internal;

import java.io.Serializable;
import java.lang.reflect.Array;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.GenericDeclaration;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.Objects;
import java.util.Properties;

/* JADX INFO: loaded from: classes.dex */
public final class GsonTypes {
    static final /* synthetic */ boolean $assertionsDisabled = false;
    static final Type[] EMPTY_TYPE_ARRAY = new Type[0];

    private GsonTypes() {
        throw new UnsupportedOperationException();
    }

    public static ParameterizedType newParameterizedTypeWithOwner(Type ownerType, Class<?> rawType, Type... typeArguments) {
        return new ParameterizedTypeImpl(ownerType, rawType, typeArguments);
    }

    public static GenericArrayType arrayOf(Type componentType) {
        return new GenericArrayTypeImpl(componentType);
    }

    public static WildcardType subtypeOf(Type bound) {
        Type[] upperBounds;
        if (bound instanceof WildcardType) {
            upperBounds = ((WildcardType) bound).getUpperBounds();
        } else {
            upperBounds = new Type[]{bound};
        }
        return new WildcardTypeImpl(upperBounds, EMPTY_TYPE_ARRAY);
    }

    public static WildcardType supertypeOf(Type bound) {
        Type[] lowerBounds;
        if (bound instanceof WildcardType) {
            lowerBounds = ((WildcardType) bound).getLowerBounds();
        } else {
            lowerBounds = new Type[]{bound};
        }
        return new WildcardTypeImpl(new Type[]{Object.class}, lowerBounds);
    }

    public static Type canonicalize(Type type) {
        if (type instanceof Class) {
            Class<?> c = (Class) type;
            return c.isArray() ? new GenericArrayTypeImpl(canonicalize(c.getComponentType())) : c;
        }
        if (type instanceof ParameterizedType) {
            ParameterizedType p = (ParameterizedType) type;
            return new ParameterizedTypeImpl(p.getOwnerType(), (Class) p.getRawType(), p.getActualTypeArguments());
        }
        if (type instanceof GenericArrayType) {
            GenericArrayType g = (GenericArrayType) type;
            return new GenericArrayTypeImpl(g.getGenericComponentType());
        }
        if (type instanceof WildcardType) {
            WildcardType w = (WildcardType) type;
            return new WildcardTypeImpl(w.getUpperBounds(), w.getLowerBounds());
        }
        return type;
    }

    public static Class<?> getRawType(Type type) {
        if (type instanceof Class) {
            return (Class) type;
        }
        if (type instanceof ParameterizedType) {
            ParameterizedType parameterizedType = (ParameterizedType) type;
            Type rawType = parameterizedType.getRawType();
            return (Class) rawType;
        }
        if (type instanceof GenericArrayType) {
            Type componentType = ((GenericArrayType) type).getGenericComponentType();
            return Array.newInstance(getRawType(componentType), 0).getClass();
        }
        if (type instanceof TypeVariable) {
            return Object.class;
        }
        if (type instanceof WildcardType) {
            Type[] bounds = ((WildcardType) type).getUpperBounds();
            if (bounds.length != 1) {
                throw new AssertionError();
            }
            return getRawType(bounds[0]);
        }
        String className = type == null ? "null" : type.getClass().getName();
        throw new IllegalArgumentException("Expected a Class, ParameterizedType, or GenericArrayType, but <" + type + "> is of type " + className);
    }

    private static boolean equal(Object a, Object b) {
        return Objects.equals(a, b);
    }

    public static boolean equals(Type a, Type b) {
        if (a == b) {
            return true;
        }
        if (a instanceof Class) {
            return a.equals(b);
        }
        if (a instanceof ParameterizedType) {
            if (!(b instanceof ParameterizedType)) {
                return false;
            }
            ParameterizedType pa = (ParameterizedType) a;
            ParameterizedType pb = (ParameterizedType) b;
            return equal(pa.getOwnerType(), pb.getOwnerType()) && pa.getRawType().equals(pb.getRawType()) && Arrays.equals(pa.getActualTypeArguments(), pb.getActualTypeArguments());
        }
        if (a instanceof GenericArrayType) {
            if (!(b instanceof GenericArrayType)) {
                return false;
            }
            GenericArrayType ga = (GenericArrayType) a;
            GenericArrayType gb = (GenericArrayType) b;
            return equals(ga.getGenericComponentType(), gb.getGenericComponentType());
        }
        if (a instanceof WildcardType) {
            if (!(b instanceof WildcardType)) {
                return false;
            }
            WildcardType wa = (WildcardType) a;
            WildcardType wb = (WildcardType) b;
            return Arrays.equals(wa.getUpperBounds(), wb.getUpperBounds()) && Arrays.equals(wa.getLowerBounds(), wb.getLowerBounds());
        }
        if (!(a instanceof TypeVariable) || !(b instanceof TypeVariable)) {
            return false;
        }
        TypeVariable<?> va = (TypeVariable) a;
        TypeVariable<?> vb = (TypeVariable) b;
        return Objects.equals(va.getGenericDeclaration(), vb.getGenericDeclaration()) && va.getName().equals(vb.getName());
    }

    public static String typeToString(Type type) {
        return type instanceof Class ? ((Class) type).getName() : type.toString();
    }

    private static Type getGenericSupertype(Type context, Class<?> rawType, Class<?> supertype) {
        if (supertype == rawType) {
            return context;
        }
        if (supertype.isInterface()) {
            Class<?>[] interfaces = rawType.getInterfaces();
            int length = interfaces.length;
            for (int i = 0; i < length; i++) {
                if (interfaces[i] == supertype) {
                    return rawType.getGenericInterfaces()[i];
                }
                if (supertype.isAssignableFrom(interfaces[i])) {
                    return getGenericSupertype(rawType.getGenericInterfaces()[i], interfaces[i], supertype);
                }
            }
        }
        if (!rawType.isInterface()) {
            while (rawType != Object.class) {
                Class<?> rawSupertype = rawType.getSuperclass();
                if (rawSupertype == supertype) {
                    return rawType.getGenericSuperclass();
                }
                if (supertype.isAssignableFrom(rawSupertype)) {
                    return getGenericSupertype(rawType.getGenericSuperclass(), rawSupertype, supertype);
                }
                rawType = rawSupertype;
            }
        }
        return supertype;
    }

    private static Type getSupertype(Type context, Class<?> contextRawType, Class<?> supertype) {
        if (context instanceof WildcardType) {
            Type[] bounds = ((WildcardType) context).getUpperBounds();
            if (bounds.length != 1) {
                throw new AssertionError();
            }
            context = bounds[0];
        }
        if (!supertype.isAssignableFrom(contextRawType)) {
            throw new IllegalArgumentException(contextRawType + " is not the same as or a subtype of " + supertype);
        }
        return resolve(context, contextRawType, getGenericSupertype(context, contextRawType, supertype));
    }

    public static Type getArrayComponentType(Type array) {
        if (array instanceof GenericArrayType) {
            return ((GenericArrayType) array).getGenericComponentType();
        }
        return ((Class) array).getComponentType();
    }

    public static Type getCollectionElementType(Type context, Class<?> contextRawType) {
        Type collectionType = getSupertype(context, contextRawType, Collection.class);
        if (collectionType instanceof ParameterizedType) {
            return ((ParameterizedType) collectionType).getActualTypeArguments()[0];
        }
        return Object.class;
    }

    public static Type[] getMapKeyAndValueTypes(Type context, Class<?> contextRawType) {
        if (Properties.class.isAssignableFrom(contextRawType)) {
            return new Type[]{String.class, String.class};
        }
        Type mapType = getSupertype(context, contextRawType, Map.class);
        if (mapType instanceof ParameterizedType) {
            ParameterizedType mapParameterizedType = (ParameterizedType) mapType;
            return mapParameterizedType.getActualTypeArguments();
        }
        return new Type[]{Object.class, Object.class};
    }

    public static Type resolve(Type context, Class<?> contextRawType, Type toResolve) {
        return resolve(context, contextRawType, toResolve, new HashMap());
    }

    /* JADX WARN: Code duplicated, block: B:65:0x00f5 A[EDGE_INSN: B:65:0x00f5->B:66:0x00f7 BREAK  A[LOOP:0: B:3:0x0001->B:72:?]] */
    private static Type resolve(Type context, Class<?> contextRawType, Type toResolve, Map<TypeVariable<?>, Type> visitedTypeVariables) {
        Type upperBound;
        ParameterizedType parameterizedTypeNewParameterizedTypeWithOwner;
        TypeVariable<?> typeVariable;
        TypeVariable<?> resolving = null;
        do {
            if (!(toResolve instanceof TypeVariable)) {
                if ((toResolve instanceof Class) && ((Class) toResolve).isArray()) {
                    Class<?> original = (Class) toResolve;
                    Type componentType = original.getComponentType();
                    Type newComponentType = resolve(context, contextRawType, componentType, visitedTypeVariables);
                    toResolve = equal(componentType, newComponentType) ? original : arrayOf(newComponentType);
                    break;
                }
                if (toResolve instanceof GenericArrayType) {
                    GenericArrayType original2 = (GenericArrayType) toResolve;
                    Type componentType2 = original2.getGenericComponentType();
                    Type newComponentType2 = resolve(context, contextRawType, componentType2, visitedTypeVariables);
                    toResolve = equal(componentType2, newComponentType2) ? original2 : arrayOf(newComponentType2);
                    break;
                }
                if (toResolve instanceof ParameterizedType) {
                    ParameterizedType original3 = (ParameterizedType) toResolve;
                    Type ownerType = original3.getOwnerType();
                    Type newOwnerType = resolve(context, contextRawType, ownerType, visitedTypeVariables);
                    boolean ownerChanged = true ^ equal(newOwnerType, ownerType);
                    Type[] args = original3.getActualTypeArguments();
                    boolean argsChanged = false;
                    int length = args.length;
                    for (int t = 0; t < length; t++) {
                        Type resolvedTypeArgument = resolve(context, contextRawType, args[t], visitedTypeVariables);
                        if (!equal(resolvedTypeArgument, args[t])) {
                            if (!argsChanged) {
                                args = (Type[]) args.clone();
                                argsChanged = true;
                            }
                            args[t] = resolvedTypeArgument;
                        }
                    }
                    if (ownerChanged || argsChanged) {
                        parameterizedTypeNewParameterizedTypeWithOwner = newParameterizedTypeWithOwner(newOwnerType, (Class) original3.getRawType(), args);
                    } else {
                        parameterizedTypeNewParameterizedTypeWithOwner = original3;
                    }
                    toResolve = parameterizedTypeNewParameterizedTypeWithOwner;
                    break;
                }
                if (!(toResolve instanceof WildcardType)) {
                    break;
                }
                WildcardType original4 = (WildcardType) toResolve;
                Type[] originalLowerBound = original4.getLowerBounds();
                Type[] originalUpperBound = original4.getUpperBounds();
                if (originalLowerBound.length == 1) {
                    Type lowerBound = resolve(context, contextRawType, originalLowerBound[0], visitedTypeVariables);
                    if (lowerBound != originalLowerBound[0]) {
                        toResolve = supertypeOf(lowerBound);
                        break;
                    }
                    toResolve = original4;
                    break;
                }
                if (originalUpperBound.length == 1 && (upperBound = resolve(context, contextRawType, originalUpperBound[0], visitedTypeVariables)) != originalUpperBound[0]) {
                    toResolve = subtypeOf(upperBound);
                    break;
                }
                toResolve = original4;
                break;
            }
            typeVariable = (TypeVariable) toResolve;
            Type previouslyResolved = visitedTypeVariables.get(typeVariable);
            if (previouslyResolved != null) {
                return previouslyResolved == Void.TYPE ? toResolve : previouslyResolved;
            }
            visitedTypeVariables.put(typeVariable, Void.TYPE);
            if (resolving == null) {
                resolving = typeVariable;
            }
            toResolve = resolveTypeVariable(context, contextRawType, typeVariable);
        } while (toResolve != typeVariable);
        if (resolving != null) {
            visitedTypeVariables.put(resolving, toResolve);
        }
        return toResolve;
    }

    private static Type resolveTypeVariable(Type context, Class<?> contextRawType, TypeVariable<?> unknown) {
        Class<?> declaredByRaw = declaringClassOf(unknown);
        if (declaredByRaw == null) {
            return unknown;
        }
        Type declaredBy = getGenericSupertype(context, contextRawType, declaredByRaw);
        if (declaredBy instanceof ParameterizedType) {
            int index = indexOf(declaredByRaw.getTypeParameters(), unknown);
            return ((ParameterizedType) declaredBy).getActualTypeArguments()[index];
        }
        return unknown;
    }

    private static int indexOf(Object[] array, Object toFind) {
        int length = array.length;
        for (int i = 0; i < length; i++) {
            if (toFind.equals(array[i])) {
                return i;
            }
        }
        throw new NoSuchElementException();
    }

    private static Class<?> declaringClassOf(TypeVariable<?> typeVariable) {
        GenericDeclaration genericDeclaration = typeVariable.getGenericDeclaration();
        if (genericDeclaration instanceof Class) {
            return (Class) genericDeclaration;
        }
        return null;
    }

    static void checkNotPrimitive(Type type) {
        if ((type instanceof Class) && ((Class) type).isPrimitive()) {
            throw new IllegalArgumentException("Primitive type is not allowed");
        }
    }

    public static boolean requiresOwnerType(Type rawType) {
        if (!(rawType instanceof Class)) {
            return false;
        }
        Class<?> rawTypeAsClass = (Class) rawType;
        return (Modifier.isStatic(rawTypeAsClass.getModifiers()) || rawTypeAsClass.getDeclaringClass() == null) ? false : true;
    }

    private static final class ParameterizedTypeImpl implements ParameterizedType, Serializable {
        private static final long serialVersionUID = 0;
        private final Type ownerType;
        private final Type rawType;
        private final Type[] typeArguments;

        ParameterizedTypeImpl(Type ownerType, Class<?> rawType, Type... typeArguments) {
            Objects.requireNonNull(rawType);
            if (ownerType == null && GsonTypes.requiresOwnerType(rawType)) {
                throw new IllegalArgumentException("Must specify owner type for " + rawType);
            }
            this.ownerType = ownerType == null ? null : GsonTypes.canonicalize(ownerType);
            this.rawType = GsonTypes.canonicalize(rawType);
            this.typeArguments = (Type[]) typeArguments.clone();
            int length = this.typeArguments.length;
            for (int t = 0; t < length; t++) {
                Objects.requireNonNull(this.typeArguments[t]);
                GsonTypes.checkNotPrimitive(this.typeArguments[t]);
                this.typeArguments[t] = GsonTypes.canonicalize(this.typeArguments[t]);
            }
        }

        @Override // java.lang.reflect.ParameterizedType
        public Type[] getActualTypeArguments() {
            return (Type[]) this.typeArguments.clone();
        }

        @Override // java.lang.reflect.ParameterizedType
        public Type getRawType() {
            return this.rawType;
        }

        @Override // java.lang.reflect.ParameterizedType
        public Type getOwnerType() {
            return this.ownerType;
        }

        public boolean equals(Object other) {
            return (other instanceof ParameterizedType) && GsonTypes.equals(this, (ParameterizedType) other);
        }

        private static int hashCodeOrZero(Object o) {
            if (o != null) {
                return o.hashCode();
            }
            return 0;
        }

        public int hashCode() {
            return (Arrays.hashCode(this.typeArguments) ^ this.rawType.hashCode()) ^ hashCodeOrZero(this.ownerType);
        }

        public String toString() {
            int length = this.typeArguments.length;
            if (length == 0) {
                return GsonTypes.typeToString(this.rawType);
            }
            StringBuilder stringBuilder = new StringBuilder((length + 1) * 30);
            stringBuilder.append(GsonTypes.typeToString(this.rawType)).append("<").append(GsonTypes.typeToString(this.typeArguments[0]));
            for (int i = 1; i < length; i++) {
                stringBuilder.append(", ").append(GsonTypes.typeToString(this.typeArguments[i]));
            }
            return stringBuilder.append(">").toString();
        }
    }

    private static final class GenericArrayTypeImpl implements GenericArrayType, Serializable {
        private static final long serialVersionUID = 0;
        private final Type componentType;

        GenericArrayTypeImpl(Type componentType) {
            Objects.requireNonNull(componentType);
            this.componentType = GsonTypes.canonicalize(componentType);
        }

        @Override // java.lang.reflect.GenericArrayType
        public Type getGenericComponentType() {
            return this.componentType;
        }

        public boolean equals(Object o) {
            return (o instanceof GenericArrayType) && GsonTypes.equals(this, (GenericArrayType) o);
        }

        public int hashCode() {
            return this.componentType.hashCode();
        }

        public String toString() {
            return GsonTypes.typeToString(this.componentType) + "[]";
        }
    }

    private static final class WildcardTypeImpl implements WildcardType, Serializable {
        private static final long serialVersionUID = 0;
        private final Type lowerBound;
        private final Type upperBound;

        WildcardTypeImpl(Type[] upperBounds, Type[] lowerBounds) {
            if (lowerBounds.length > 1) {
                throw new IllegalArgumentException("At most one lower bound is supported");
            }
            if (upperBounds.length != 1) {
                throw new IllegalArgumentException("Exactly one upper bound must be specified");
            }
            if (lowerBounds.length == 1) {
                Objects.requireNonNull(lowerBounds[0]);
                GsonTypes.checkNotPrimitive(lowerBounds[0]);
                if (upperBounds[0] != Object.class) {
                    throw new IllegalArgumentException("When lower bound is specified, upper bound must be Object");
                }
                this.lowerBound = GsonTypes.canonicalize(lowerBounds[0]);
                this.upperBound = Object.class;
                return;
            }
            Objects.requireNonNull(upperBounds[0]);
            GsonTypes.checkNotPrimitive(upperBounds[0]);
            this.lowerBound = null;
            this.upperBound = GsonTypes.canonicalize(upperBounds[0]);
        }

        @Override // java.lang.reflect.WildcardType
        public Type[] getUpperBounds() {
            return new Type[]{this.upperBound};
        }

        @Override // java.lang.reflect.WildcardType
        public Type[] getLowerBounds() {
            return this.lowerBound != null ? new Type[]{this.lowerBound} : GsonTypes.EMPTY_TYPE_ARRAY;
        }

        public boolean equals(Object other) {
            return (other instanceof WildcardType) && GsonTypes.equals(this, (WildcardType) other);
        }

        public int hashCode() {
            return (this.lowerBound != null ? this.lowerBound.hashCode() + 31 : 1) ^ (this.upperBound.hashCode() + 31);
        }

        public String toString() {
            if (this.lowerBound != null) {
                return "? super " + GsonTypes.typeToString(this.lowerBound);
            }
            if (this.upperBound == Object.class) {
                return "?";
            }
            return "? extends " + GsonTypes.typeToString(this.upperBound);
        }
    }
}
