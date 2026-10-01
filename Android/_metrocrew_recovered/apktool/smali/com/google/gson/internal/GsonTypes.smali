.class public final Lcom/google/gson/internal/GsonTypes;
.super Ljava/lang/Object;
.source "GsonTypes.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;,
        Lcom/google/gson/internal/GsonTypes$GenericArrayTypeImpl;,
        Lcom/google/gson/internal/GsonTypes$WildcardTypeImpl;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field static final EMPTY_TYPE_ARRAY:[Ljava/lang/reflect/Type;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 44
    nop

    .line 45
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/reflect/Type;

    sput-object v0, Lcom/google/gson/internal/GsonTypes;->EMPTY_TYPE_ARRAY:[Ljava/lang/reflect/Type;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public static arrayOf(Ljava/lang/reflect/Type;)Ljava/lang/reflect/GenericArrayType;
    .locals 1
    .param p0, "componentType"    # Ljava/lang/reflect/Type;

    .line 68
    new-instance v0, Lcom/google/gson/internal/GsonTypes$GenericArrayTypeImpl;

    invoke-direct {v0, p0}, Lcom/google/gson/internal/GsonTypes$GenericArrayTypeImpl;-><init>(Ljava/lang/reflect/Type;)V

    return-object v0
.end method

.method public static canonicalize(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;
    .locals 5
    .param p0, "type"    # Ljava/lang/reflect/Type;

    .line 106
    instance-of v0, p0, Ljava/lang/Class;

    if-eqz v0, :cond_1

    .line 107
    move-object v0, p0

    check-cast v0, Ljava/lang/Class;

    .line 108
    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/google/gson/internal/GsonTypes$GenericArrayTypeImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    invoke-static {v2}, Lcom/google/gson/internal/GsonTypes;->canonicalize(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/gson/internal/GsonTypes$GenericArrayTypeImpl;-><init>(Ljava/lang/reflect/Type;)V

    goto :goto_0

    :cond_0
    move-object v1, v0

    :goto_0
    return-object v1

    .line 110
    .end local v0    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1
    instance-of v0, p0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v0, :cond_2

    .line 111
    move-object v0, p0

    check-cast v0, Ljava/lang/reflect/ParameterizedType;

    .line 112
    .local v0, "p":Ljava/lang/reflect/ParameterizedType;
    new-instance v1, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;

    .line 113
    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getOwnerType()Ljava/lang/reflect/Type;

    move-result-object v2

    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v3

    check-cast v3, Ljava/lang/Class;

    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;-><init>(Ljava/lang/reflect/Type;Ljava/lang/Class;[Ljava/lang/reflect/Type;)V

    .line 112
    return-object v1

    .line 115
    .end local v0    # "p":Ljava/lang/reflect/ParameterizedType;
    :cond_2
    instance-of v0, p0, Ljava/lang/reflect/GenericArrayType;

    if-eqz v0, :cond_3

    .line 116
    move-object v0, p0

    check-cast v0, Ljava/lang/reflect/GenericArrayType;

    .line 117
    .local v0, "g":Ljava/lang/reflect/GenericArrayType;
    new-instance v1, Lcom/google/gson/internal/GsonTypes$GenericArrayTypeImpl;

    invoke-interface {v0}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/google/gson/internal/GsonTypes$GenericArrayTypeImpl;-><init>(Ljava/lang/reflect/Type;)V

    return-object v1

    .line 119
    .end local v0    # "g":Ljava/lang/reflect/GenericArrayType;
    :cond_3
    instance-of v0, p0, Ljava/lang/reflect/WildcardType;

    if-eqz v0, :cond_4

    .line 120
    move-object v0, p0

    check-cast v0, Ljava/lang/reflect/WildcardType;

    .line 121
    .local v0, "w":Ljava/lang/reflect/WildcardType;
    new-instance v1, Lcom/google/gson/internal/GsonTypes$WildcardTypeImpl;

    invoke-interface {v0}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v2

    invoke-interface {v0}, Ljava/lang/reflect/WildcardType;->getLowerBounds()[Ljava/lang/reflect/Type;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/google/gson/internal/GsonTypes$WildcardTypeImpl;-><init>([Ljava/lang/reflect/Type;[Ljava/lang/reflect/Type;)V

    return-object v1

    .line 125
    .end local v0    # "w":Ljava/lang/reflect/WildcardType;
    :cond_4
    return-object p0
.end method

.method static checkNotPrimitive(Ljava/lang/reflect/Type;)V
    .locals 2
    .param p0, "type"    # Ljava/lang/reflect/Type;

    .line 488
    instance-of v0, p0, Ljava/lang/Class;

    if-eqz v0, :cond_1

    move-object v0, p0

    check-cast v0, Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->isPrimitive()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 489
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Primitive type is not allowed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 491
    :cond_1
    :goto_0
    return-void
.end method

.method private static declaringClassOf(Ljava/lang/reflect/TypeVariable;)Ljava/lang/Class;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/TypeVariable<",
            "*>;)",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 483
    .local p0, "typeVariable":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    invoke-interface {p0}, Ljava/lang/reflect/TypeVariable;->getGenericDeclaration()Ljava/lang/reflect/GenericDeclaration;

    move-result-object v0

    .line 484
    .local v0, "genericDeclaration":Ljava/lang/reflect/GenericDeclaration;
    instance-of v1, v0, Ljava/lang/Class;

    if-eqz v1, :cond_0

    move-object v1, v0

    check-cast v1, Ljava/lang/Class;

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method private static equal(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p0, "a"    # Ljava/lang/Object;
    .param p1, "b"    # Ljava/lang/Object;

    .line 168
    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static equals(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z
    .locals 6
    .param p0, "a"    # Ljava/lang/reflect/Type;
    .param p1, "b"    # Ljava/lang/reflect/Type;

    .line 173
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 175
    return v0

    .line 177
    :cond_0
    instance-of v1, p0, Ljava/lang/Class;

    if-eqz v1, :cond_1

    .line 179
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0

    .line 181
    :cond_1
    instance-of v1, p0, Ljava/lang/reflect/ParameterizedType;

    const/4 v2, 0x0

    if-eqz v1, :cond_4

    .line 182
    instance-of v1, p1, Ljava/lang/reflect/ParameterizedType;

    if-nez v1, :cond_2

    .line 183
    return v2

    .line 187
    :cond_2
    move-object v1, p0

    check-cast v1, Ljava/lang/reflect/ParameterizedType;

    .line 188
    .local v1, "pa":Ljava/lang/reflect/ParameterizedType;
    move-object v3, p1

    check-cast v3, Ljava/lang/reflect/ParameterizedType;

    .line 189
    .local v3, "pb":Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v1}, Ljava/lang/reflect/ParameterizedType;->getOwnerType()Ljava/lang/reflect/Type;

    move-result-object v4

    invoke-interface {v3}, Ljava/lang/reflect/ParameterizedType;->getOwnerType()Ljava/lang/reflect/Type;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/google/gson/internal/GsonTypes;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 190
    invoke-interface {v1}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v4

    invoke-interface {v3}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 191
    invoke-interface {v1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v4

    invoke-interface {v3}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v5

    invoke-static {v4, v5}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    goto :goto_0

    :cond_3
    move v0, v2

    .line 189
    :goto_0
    return v0

    .line 193
    .end local v1    # "pa":Ljava/lang/reflect/ParameterizedType;
    .end local v3    # "pb":Ljava/lang/reflect/ParameterizedType;
    :cond_4
    instance-of v1, p0, Ljava/lang/reflect/GenericArrayType;

    if-eqz v1, :cond_6

    .line 194
    instance-of v0, p1, Ljava/lang/reflect/GenericArrayType;

    if-nez v0, :cond_5

    .line 195
    return v2

    .line 198
    :cond_5
    move-object v0, p0

    check-cast v0, Ljava/lang/reflect/GenericArrayType;

    .line 199
    .local v0, "ga":Ljava/lang/reflect/GenericArrayType;
    move-object v1, p1

    check-cast v1, Ljava/lang/reflect/GenericArrayType;

    .line 200
    .local v1, "gb":Ljava/lang/reflect/GenericArrayType;
    invoke-interface {v0}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v2

    invoke-interface {v1}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/gson/internal/GsonTypes;->equals(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v2

    return v2

    .line 202
    .end local v0    # "ga":Ljava/lang/reflect/GenericArrayType;
    .end local v1    # "gb":Ljava/lang/reflect/GenericArrayType;
    :cond_6
    instance-of v1, p0, Ljava/lang/reflect/WildcardType;

    if-eqz v1, :cond_9

    .line 203
    instance-of v1, p1, Ljava/lang/reflect/WildcardType;

    if-nez v1, :cond_7

    .line 204
    return v2

    .line 207
    :cond_7
    move-object v1, p0

    check-cast v1, Ljava/lang/reflect/WildcardType;

    .line 208
    .local v1, "wa":Ljava/lang/reflect/WildcardType;
    move-object v3, p1

    check-cast v3, Ljava/lang/reflect/WildcardType;

    .line 209
    .local v3, "wb":Ljava/lang/reflect/WildcardType;
    invoke-interface {v1}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v4

    invoke-interface {v3}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v5

    invoke-static {v4, v5}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 210
    invoke-interface {v1}, Ljava/lang/reflect/WildcardType;->getLowerBounds()[Ljava/lang/reflect/Type;

    move-result-object v4

    invoke-interface {v3}, Ljava/lang/reflect/WildcardType;->getLowerBounds()[Ljava/lang/reflect/Type;

    move-result-object v5

    invoke-static {v4, v5}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    goto :goto_1

    :cond_8
    move v0, v2

    .line 209
    :goto_1
    return v0

    .line 212
    .end local v1    # "wa":Ljava/lang/reflect/WildcardType;
    .end local v3    # "wb":Ljava/lang/reflect/WildcardType;
    :cond_9
    instance-of v1, p0, Ljava/lang/reflect/TypeVariable;

    if-eqz v1, :cond_c

    .line 213
    instance-of v1, p1, Ljava/lang/reflect/TypeVariable;

    if-nez v1, :cond_a

    .line 214
    return v2

    .line 216
    :cond_a
    move-object v1, p0

    check-cast v1, Ljava/lang/reflect/TypeVariable;

    .line 217
    .local v1, "va":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    move-object v3, p1

    check-cast v3, Ljava/lang/reflect/TypeVariable;

    .line 218
    .local v3, "vb":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    invoke-interface {v1}, Ljava/lang/reflect/TypeVariable;->getGenericDeclaration()Ljava/lang/reflect/GenericDeclaration;

    move-result-object v4

    invoke-interface {v3}, Ljava/lang/reflect/TypeVariable;->getGenericDeclaration()Ljava/lang/reflect/GenericDeclaration;

    move-result-object v5

    invoke-static {v4, v5}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 219
    invoke-interface {v1}, Ljava/lang/reflect/TypeVariable;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3}, Ljava/lang/reflect/TypeVariable;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    goto :goto_2

    :cond_b
    move v0, v2

    .line 218
    :goto_2
    return v0

    .line 223
    .end local v1    # "va":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    .end local v3    # "vb":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    :cond_c
    return v2
.end method

.method public static getArrayComponentType(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;
    .locals 1
    .param p0, "array"    # Ljava/lang/reflect/Type;

    .line 300
    instance-of v0, p0, Ljava/lang/reflect/GenericArrayType;

    if-eqz v0, :cond_0

    .line 301
    move-object v0, p0

    check-cast v0, Ljava/lang/reflect/GenericArrayType;

    invoke-interface {v0}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v0

    goto :goto_0

    .line 302
    :cond_0
    move-object v0, p0

    check-cast v0, Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v0

    .line 300
    :goto_0
    return-object v0
.end method

.method public static getCollectionElementType(Ljava/lang/reflect/Type;Ljava/lang/Class;)Ljava/lang/reflect/Type;
    .locals 3
    .param p0, "context"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .line 311
    .local p1, "contextRawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Ljava/util/Collection;

    invoke-static {p0, p1, v0}, Lcom/google/gson/internal/GsonTypes;->getSupertype(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/reflect/Type;

    move-result-object v0

    .line 313
    .local v0, "collectionType":Ljava/lang/reflect/Type;
    instance-of v1, v0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v1, :cond_0

    .line 314
    move-object v1, v0

    check-cast v1, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    return-object v1

    .line 316
    :cond_0
    const-class v1, Ljava/lang/Object;

    return-object v1
.end method

.method private static getGenericSupertype(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/reflect/Type;
    .locals 5
    .param p0, "context"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .line 237
    .local p1, "rawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "supertype":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-ne p2, p1, :cond_0

    .line 238
    return-object p0

    .line 242
    :cond_0
    invoke-virtual {p2}, Ljava/lang/Class;->isInterface()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 243
    invoke-virtual {p1}, Ljava/lang/Class;->getInterfaces()[Ljava/lang/Class;

    move-result-object v0

    .line 244
    .local v0, "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/4 v1, 0x0

    .local v1, "i":I
    array-length v2, v0

    .local v2, "length":I
    :goto_0
    if-ge v1, v2, :cond_3

    .line 245
    aget-object v3, v0, v1

    if-ne v3, p2, :cond_1

    .line 246
    invoke-virtual {p1}, Ljava/lang/Class;->getGenericInterfaces()[Ljava/lang/reflect/Type;

    move-result-object v3

    aget-object v3, v3, v1

    return-object v3

    .line 247
    :cond_1
    aget-object v3, v0, v1

    invoke-virtual {p2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 248
    invoke-virtual {p1}, Ljava/lang/Class;->getGenericInterfaces()[Ljava/lang/reflect/Type;

    move-result-object v3

    aget-object v3, v3, v1

    aget-object v4, v0, v1

    invoke-static {v3, v4, p2}, Lcom/google/gson/internal/GsonTypes;->getGenericSupertype(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/reflect/Type;

    move-result-object v3

    return-object v3

    .line 244
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 254
    .end local v0    # "interfaces":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v1    # "i":I
    .end local v2    # "length":I
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Class;->isInterface()Z

    move-result v0

    if-nez v0, :cond_6

    .line 255
    :goto_1
    const-class v0, Ljava/lang/Object;

    if-eq p1, v0, :cond_6

    .line 256
    invoke-virtual {p1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    .line 257
    .local v0, "rawSupertype":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-ne v0, p2, :cond_4

    .line 258
    invoke-virtual {p1}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v1

    return-object v1

    .line 259
    :cond_4
    invoke-virtual {p2, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 260
    invoke-virtual {p1}, Ljava/lang/Class;->getGenericSuperclass()Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-static {v1, v0, p2}, Lcom/google/gson/internal/GsonTypes;->getGenericSupertype(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/reflect/Type;

    move-result-object v1

    return-object v1

    .line 262
    :cond_5
    move-object p1, v0

    .line 263
    .end local v0    # "rawSupertype":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    goto :goto_1

    .line 267
    :cond_6
    return-object p2
.end method

.method public static getMapKeyAndValueTypes(Ljava/lang/reflect/Type;Ljava/lang/Class;)[Ljava/lang/reflect/Type;
    .locals 5
    .param p0, "context"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class<",
            "*>;)[",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .line 329
    .local p1, "contextRawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Ljava/util/Properties;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-eqz v0, :cond_0

    .line 330
    new-array v0, v3, [Ljava/lang/reflect/Type;

    const-class v3, Ljava/lang/String;

    aput-object v3, v0, v2

    const-class v2, Ljava/lang/String;

    aput-object v2, v0, v1

    return-object v0

    .line 333
    :cond_0
    const-class v0, Ljava/util/Map;

    invoke-static {p0, p1, v0}, Lcom/google/gson/internal/GsonTypes;->getSupertype(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/reflect/Type;

    move-result-object v0

    .line 335
    .local v0, "mapType":Ljava/lang/reflect/Type;
    instance-of v4, v0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v4, :cond_1

    .line 336
    move-object v1, v0

    check-cast v1, Ljava/lang/reflect/ParameterizedType;

    .line 337
    .local v1, "mapParameterizedType":Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v2

    return-object v2

    .line 339
    .end local v1    # "mapParameterizedType":Ljava/lang/reflect/ParameterizedType;
    :cond_1
    new-array v3, v3, [Ljava/lang/reflect/Type;

    const-class v4, Ljava/lang/Object;

    aput-object v4, v3, v2

    const-class v2, Ljava/lang/Object;

    aput-object v2, v3, v1

    return-object v3
.end method

.method public static getRawType(Ljava/lang/reflect/Type;)Ljava/lang/Class;
    .locals 4
    .param p0, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            ")",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 130
    instance-of v0, p0, Ljava/lang/Class;

    if-eqz v0, :cond_0

    .line 132
    move-object v0, p0

    check-cast v0, Ljava/lang/Class;

    return-object v0

    .line 134
    :cond_0
    instance-of v0, p0, Ljava/lang/reflect/ParameterizedType;

    if-eqz v0, :cond_1

    .line 135
    move-object v0, p0

    check-cast v0, Ljava/lang/reflect/ParameterizedType;

    .line 139
    .local v0, "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v1

    .line 140
    .local v1, "rawType":Ljava/lang/reflect/Type;
    move-object v2, v1

    check-cast v2, Ljava/lang/Class;

    return-object v2

    .line 142
    .end local v0    # "parameterizedType":Ljava/lang/reflect/ParameterizedType;
    .end local v1    # "rawType":Ljava/lang/reflect/Type;
    :cond_1
    instance-of v0, p0, Ljava/lang/reflect/GenericArrayType;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 143
    move-object v0, p0

    check-cast v0, Ljava/lang/reflect/GenericArrayType;

    invoke-interface {v0}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 144
    .local v0, "componentType":Ljava/lang/reflect/Type;
    invoke-static {v0}, Lcom/google/gson/internal/GsonTypes;->getRawType(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v2

    invoke-static {v2, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    return-object v1

    .line 146
    .end local v0    # "componentType":Ljava/lang/reflect/Type;
    :cond_2
    instance-of v0, p0, Ljava/lang/reflect/TypeVariable;

    if-eqz v0, :cond_3

    .line 149
    const-class v0, Ljava/lang/Object;

    return-object v0

    .line 151
    :cond_3
    instance-of v0, p0, Ljava/lang/reflect/WildcardType;

    if-eqz v0, :cond_5

    .line 152
    move-object v0, p0

    check-cast v0, Ljava/lang/reflect/WildcardType;

    invoke-interface {v0}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    .line 154
    .local v0, "bounds":[Ljava/lang/reflect/Type;
    array-length v2, v0

    const/4 v3, 0x1

    if-ne v2, v3, :cond_4

    .line 155
    aget-object v1, v0, v1

    invoke-static {v1}, Lcom/google/gson/internal/GsonTypes;->getRawType(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v1

    return-object v1

    .line 154
    :cond_4
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 158
    .end local v0    # "bounds":[Ljava/lang/reflect/Type;
    :cond_5
    if-nez p0, :cond_6

    const-string v0, "null"

    goto :goto_0

    :cond_6
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 159
    .local v0, "className":Ljava/lang/String;
    :goto_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected a Class, ParameterizedType, or GenericArrayType, but <"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "> is of type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private static getSupertype(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/reflect/Type;
    .locals 3
    .param p0, "context"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .line 278
    .local p1, "contextRawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "supertype":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    instance-of v0, p0, Ljava/lang/reflect/WildcardType;

    if-eqz v0, :cond_1

    .line 281
    move-object v0, p0

    check-cast v0, Ljava/lang/reflect/WildcardType;

    invoke-interface {v0}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    .line 283
    .local v0, "bounds":[Ljava/lang/reflect/Type;
    array-length v1, v0

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 284
    const/4 v1, 0x0

    aget-object p0, v0, v1

    goto :goto_0

    .line 283
    :cond_0
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 286
    .end local v0    # "bounds":[Ljava/lang/reflect/Type;
    :cond_1
    :goto_0
    invoke-virtual {p2, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 290
    nop

    .line 291
    invoke-static {p0, p1, p2}, Lcom/google/gson/internal/GsonTypes;->getGenericSupertype(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/reflect/Type;

    move-result-object v0

    .line 290
    invoke-static {p0, p1, v0}, Lcom/google/gson/internal/GsonTypes;->resolve(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v0

    return-object v0

    .line 287
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not the same as or a subtype of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static indexOf([Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 3
    .param p0, "array"    # [Ljava/lang/Object;
    .param p1, "toFind"    # Ljava/lang/Object;

    .line 470
    const/4 v0, 0x0

    .local v0, "i":I
    array-length v1, p0

    .local v1, "length":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 471
    aget-object v2, p0, v0

    invoke-virtual {p1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 472
    return v0

    .line 470
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 475
    .end local v0    # "i":I
    .end local v1    # "length":I
    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public static varargs newParameterizedTypeWithOwner(Ljava/lang/reflect/Type;Ljava/lang/Class;[Ljava/lang/reflect/Type;)Ljava/lang/reflect/ParameterizedType;
    .locals 1
    .param p0, "ownerType"    # Ljava/lang/reflect/Type;
    .param p2, "typeArguments"    # [Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/reflect/Type;",
            ")",
            "Ljava/lang/reflect/ParameterizedType;"
        }
    .end annotation

    .line 59
    .local p1, "rawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;-><init>(Ljava/lang/reflect/Type;Ljava/lang/Class;[Ljava/lang/reflect/Type;)V

    return-object v0
.end method

.method public static requiresOwnerType(Ljava/lang/reflect/Type;)Z
    .locals 3
    .param p0, "rawType"    # Ljava/lang/reflect/Type;

    .line 501
    instance-of v0, p0, Ljava/lang/Class;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 502
    move-object v0, p0

    check-cast v0, Ljava/lang/Class;

    .line 503
    .local v0, "rawTypeAsClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getModifiers()I

    move-result v2

    invoke-static {v2}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 504
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    nop

    .line 503
    :goto_0
    return v1

    .line 506
    .end local v0    # "rawTypeAsClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_1
    return v1
.end method

.method public static resolve(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;
    .locals 1
    .param p0, "context"    # Ljava/lang/reflect/Type;
    .param p2, "toResolve"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/reflect/Type;",
            ")",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .line 344
    .local p1, "contextRawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {p0, p1, p2, v0}, Lcom/google/gson/internal/GsonTypes;->resolve(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/util/Map;)Ljava/lang/reflect/Type;

    move-result-object v0

    return-object v0
.end method

.method private static resolve(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/util/Map;)Ljava/lang/reflect/Type;
    .locals 11
    .param p0, "context"    # Ljava/lang/reflect/Type;
    .param p2, "toResolve"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/reflect/Type;",
            "Ljava/util/Map<",
            "Ljava/lang/reflect/TypeVariable<",
            "*>;",
            "Ljava/lang/reflect/Type;",
            ">;)",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .line 353
    .local p1, "contextRawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p3, "visitedTypeVariables":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/TypeVariable<*>;Ljava/lang/reflect/Type;>;"
    const/4 v0, 0x0

    .line 355
    .local v0, "resolving":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    :goto_0
    instance-of v1, p2, Ljava/lang/reflect/TypeVariable;

    if-eqz v1, :cond_4

    .line 356
    move-object v1, p2

    check-cast v1, Ljava/lang/reflect/TypeVariable;

    .line 357
    .local v1, "typeVariable":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    invoke-interface {p3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/reflect/Type;

    .line 358
    .local v2, "previouslyResolved":Ljava/lang/reflect/Type;
    if-eqz v2, :cond_1

    .line 360
    sget-object v3, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    if-ne v2, v3, :cond_0

    move-object v3, p2

    goto :goto_1

    :cond_0
    move-object v3, v2

    :goto_1
    return-object v3

    .line 364
    :cond_1
    sget-object v3, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-interface {p3, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 365
    if-nez v0, :cond_2

    .line 366
    move-object v0, v1

    .line 369
    :cond_2
    invoke-static {p0, p1, v1}, Lcom/google/gson/internal/GsonTypes;->resolveTypeVariable(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/TypeVariable;)Ljava/lang/reflect/Type;

    move-result-object p2

    .line 370
    if-ne p2, v1, :cond_3

    .line 371
    goto/16 :goto_8

    .line 374
    .end local v1    # "typeVariable":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    .end local v2    # "previouslyResolved":Ljava/lang/reflect/Type;
    :cond_3
    goto :goto_0

    :cond_4
    instance-of v1, p2, Ljava/lang/Class;

    if-eqz v1, :cond_6

    move-object v1, p2

    check-cast v1, Ljava/lang/Class;

    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 375
    move-object v1, p2

    check-cast v1, Ljava/lang/Class;

    .line 376
    .local v1, "original":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    .line 377
    .local v2, "componentType":Ljava/lang/reflect/Type;
    nop

    .line 378
    invoke-static {p0, p1, v2, p3}, Lcom/google/gson/internal/GsonTypes;->resolve(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/util/Map;)Ljava/lang/reflect/Type;

    move-result-object v3

    .line 379
    .local v3, "newComponentType":Ljava/lang/reflect/Type;
    invoke-static {v2, v3}, Lcom/google/gson/internal/GsonTypes;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    move-object v4, v1

    goto :goto_2

    :cond_5
    invoke-static {v3}, Lcom/google/gson/internal/GsonTypes;->arrayOf(Ljava/lang/reflect/Type;)Ljava/lang/reflect/GenericArrayType;

    move-result-object v4

    :goto_2
    move-object p2, v4

    .line 380
    goto/16 :goto_8

    .line 382
    .end local v1    # "original":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "componentType":Ljava/lang/reflect/Type;
    .end local v3    # "newComponentType":Ljava/lang/reflect/Type;
    :cond_6
    instance-of v1, p2, Ljava/lang/reflect/GenericArrayType;

    if-eqz v1, :cond_8

    .line 383
    move-object v1, p2

    check-cast v1, Ljava/lang/reflect/GenericArrayType;

    .line 384
    .local v1, "original":Ljava/lang/reflect/GenericArrayType;
    invoke-interface {v1}, Ljava/lang/reflect/GenericArrayType;->getGenericComponentType()Ljava/lang/reflect/Type;

    move-result-object v2

    .line 385
    .restart local v2    # "componentType":Ljava/lang/reflect/Type;
    nop

    .line 386
    invoke-static {p0, p1, v2, p3}, Lcom/google/gson/internal/GsonTypes;->resolve(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/util/Map;)Ljava/lang/reflect/Type;

    move-result-object v3

    .line 387
    .restart local v3    # "newComponentType":Ljava/lang/reflect/Type;
    invoke-static {v2, v3}, Lcom/google/gson/internal/GsonTypes;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    move-object v4, v1

    goto :goto_3

    :cond_7
    invoke-static {v3}, Lcom/google/gson/internal/GsonTypes;->arrayOf(Ljava/lang/reflect/Type;)Ljava/lang/reflect/GenericArrayType;

    move-result-object v4

    :goto_3
    move-object p2, v4

    .line 388
    goto/16 :goto_8

    .line 390
    .end local v1    # "original":Ljava/lang/reflect/GenericArrayType;
    .end local v2    # "componentType":Ljava/lang/reflect/Type;
    .end local v3    # "newComponentType":Ljava/lang/reflect/Type;
    :cond_8
    instance-of v1, p2, Ljava/lang/reflect/ParameterizedType;

    const/4 v2, 0x1

    if-eqz v1, :cond_e

    .line 391
    move-object v1, p2

    check-cast v1, Ljava/lang/reflect/ParameterizedType;

    .line 392
    .local v1, "original":Ljava/lang/reflect/ParameterizedType;
    invoke-interface {v1}, Ljava/lang/reflect/ParameterizedType;->getOwnerType()Ljava/lang/reflect/Type;

    move-result-object v3

    .line 393
    .local v3, "ownerType":Ljava/lang/reflect/Type;
    invoke-static {p0, p1, v3, p3}, Lcom/google/gson/internal/GsonTypes;->resolve(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/util/Map;)Ljava/lang/reflect/Type;

    move-result-object v4

    .line 394
    .local v4, "newOwnerType":Ljava/lang/reflect/Type;
    invoke-static {v4, v3}, Lcom/google/gson/internal/GsonTypes;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    xor-int/2addr v2, v5

    .line 396
    .local v2, "ownerChanged":Z
    invoke-interface {v1}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v5

    .line 397
    .local v5, "args":[Ljava/lang/reflect/Type;
    const/4 v6, 0x0

    .line 398
    .local v6, "argsChanged":Z
    const/4 v7, 0x0

    .local v7, "t":I
    array-length v8, v5

    .local v8, "length":I
    :goto_4
    if-ge v7, v8, :cond_b

    .line 399
    aget-object v9, v5, v7

    .line 400
    invoke-static {p0, p1, v9, p3}, Lcom/google/gson/internal/GsonTypes;->resolve(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/util/Map;)Ljava/lang/reflect/Type;

    move-result-object v9

    .line 401
    .local v9, "resolvedTypeArgument":Ljava/lang/reflect/Type;
    aget-object v10, v5, v7

    invoke-static {v9, v10}, Lcom/google/gson/internal/GsonTypes;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_a

    .line 402
    if-nez v6, :cond_9

    .line 403
    invoke-virtual {v5}, [Ljava/lang/reflect/Type;->clone()Ljava/lang/Object;

    move-result-object v10

    move-object v5, v10

    check-cast v5, [Ljava/lang/reflect/Type;

    .line 404
    const/4 v6, 0x1

    .line 406
    :cond_9
    aput-object v9, v5, v7

    .line 398
    .end local v9    # "resolvedTypeArgument":Ljava/lang/reflect/Type;
    :cond_a
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 411
    .end local v7    # "t":I
    .end local v8    # "length":I
    :cond_b
    if-nez v2, :cond_d

    if-eqz v6, :cond_c

    goto :goto_5

    .line 414
    :cond_c
    move-object v7, v1

    goto :goto_6

    .line 412
    :cond_d
    :goto_5
    nop

    .line 413
    invoke-interface {v1}, Ljava/lang/reflect/ParameterizedType;->getRawType()Ljava/lang/reflect/Type;

    move-result-object v7

    check-cast v7, Ljava/lang/Class;

    .line 412
    invoke-static {v4, v7, v5}, Lcom/google/gson/internal/GsonTypes;->newParameterizedTypeWithOwner(Ljava/lang/reflect/Type;Ljava/lang/Class;[Ljava/lang/reflect/Type;)Ljava/lang/reflect/ParameterizedType;

    move-result-object v7

    .line 414
    :goto_6
    move-object p2, v7

    .line 415
    goto :goto_8

    .line 417
    .end local v1    # "original":Ljava/lang/reflect/ParameterizedType;
    .end local v2    # "ownerChanged":Z
    .end local v3    # "ownerType":Ljava/lang/reflect/Type;
    .end local v4    # "newOwnerType":Ljava/lang/reflect/Type;
    .end local v5    # "args":[Ljava/lang/reflect/Type;
    .end local v6    # "argsChanged":Z
    :cond_e
    instance-of v1, p2, Ljava/lang/reflect/WildcardType;

    if-eqz v1, :cond_13

    .line 418
    move-object v1, p2

    check-cast v1, Ljava/lang/reflect/WildcardType;

    .line 419
    .local v1, "original":Ljava/lang/reflect/WildcardType;
    invoke-interface {v1}, Ljava/lang/reflect/WildcardType;->getLowerBounds()[Ljava/lang/reflect/Type;

    move-result-object v3

    .line 420
    .local v3, "originalLowerBound":[Ljava/lang/reflect/Type;
    invoke-interface {v1}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v4

    .line 422
    .local v4, "originalUpperBound":[Ljava/lang/reflect/Type;
    array-length v5, v3

    const/4 v6, 0x0

    if-ne v5, v2, :cond_10

    .line 423
    aget-object v2, v3, v6

    .line 424
    invoke-static {p0, p1, v2, p3}, Lcom/google/gson/internal/GsonTypes;->resolve(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/util/Map;)Ljava/lang/reflect/Type;

    move-result-object v2

    .line 425
    .local v2, "lowerBound":Ljava/lang/reflect/Type;
    aget-object v5, v3, v6

    if-eq v2, v5, :cond_f

    .line 426
    invoke-static {v2}, Lcom/google/gson/internal/GsonTypes;->supertypeOf(Ljava/lang/reflect/Type;)Ljava/lang/reflect/WildcardType;

    move-result-object p2

    .line 427
    goto :goto_8

    .line 425
    .end local v2    # "lowerBound":Ljava/lang/reflect/Type;
    :cond_f
    goto :goto_7

    .line 429
    :cond_10
    array-length v5, v4

    if-ne v5, v2, :cond_11

    .line 430
    aget-object v2, v4, v6

    .line 431
    invoke-static {p0, p1, v2, p3}, Lcom/google/gson/internal/GsonTypes;->resolve(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/Type;Ljava/util/Map;)Ljava/lang/reflect/Type;

    move-result-object v2

    .line 432
    .local v2, "upperBound":Ljava/lang/reflect/Type;
    aget-object v5, v4, v6

    if-eq v2, v5, :cond_12

    .line 433
    invoke-static {v2}, Lcom/google/gson/internal/GsonTypes;->subtypeOf(Ljava/lang/reflect/Type;)Ljava/lang/reflect/WildcardType;

    move-result-object p2

    .line 434
    goto :goto_8

    .line 429
    .end local v2    # "upperBound":Ljava/lang/reflect/Type;
    :cond_11
    :goto_7
    nop

    .line 437
    :cond_12
    move-object p2, v1

    .line 438
    nop

    .line 445
    .end local v1    # "original":Ljava/lang/reflect/WildcardType;
    .end local v3    # "originalLowerBound":[Ljava/lang/reflect/Type;
    .end local v4    # "originalUpperBound":[Ljava/lang/reflect/Type;
    :cond_13
    :goto_8
    if-eqz v0, :cond_14

    .line 446
    invoke-interface {p3, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 448
    :cond_14
    return-object p2
.end method

.method private static resolveTypeVariable(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/reflect/TypeVariable;)Ljava/lang/reflect/Type;
    .locals 4
    .param p0, "context"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/reflect/TypeVariable<",
            "*>;)",
            "Ljava/lang/reflect/Type;"
        }
    .end annotation

    .line 453
    .local p1, "contextRawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .local p2, "unknown":Ljava/lang/reflect/TypeVariable;, "Ljava/lang/reflect/TypeVariable<*>;"
    invoke-static {p2}, Lcom/google/gson/internal/GsonTypes;->declaringClassOf(Ljava/lang/reflect/TypeVariable;)Ljava/lang/Class;

    move-result-object v0

    .line 456
    .local v0, "declaredByRaw":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    if-nez v0, :cond_0

    .line 457
    return-object p2

    .line 460
    :cond_0
    invoke-static {p0, p1, v0}, Lcom/google/gson/internal/GsonTypes;->getGenericSupertype(Ljava/lang/reflect/Type;Ljava/lang/Class;Ljava/lang/Class;)Ljava/lang/reflect/Type;

    move-result-object v1

    .line 461
    .local v1, "declaredBy":Ljava/lang/reflect/Type;
    instance-of v2, v1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v2, :cond_1

    .line 462
    invoke-virtual {v0}, Ljava/lang/Class;->getTypeParameters()[Ljava/lang/reflect/TypeVariable;

    move-result-object v2

    invoke-static {v2, p2}, Lcom/google/gson/internal/GsonTypes;->indexOf([Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v2

    .line 463
    .local v2, "index":I
    move-object v3, v1

    check-cast v3, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v3}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v3

    aget-object v3, v3, v2

    return-object v3

    .line 466
    .end local v2    # "index":I
    :cond_1
    return-object p2
.end method

.method public static subtypeOf(Ljava/lang/reflect/Type;)Ljava/lang/reflect/WildcardType;
    .locals 3
    .param p0, "bound"    # Ljava/lang/reflect/Type;

    .line 79
    instance-of v0, p0, Ljava/lang/reflect/WildcardType;

    if-eqz v0, :cond_0

    .line 80
    move-object v0, p0

    check-cast v0, Ljava/lang/reflect/WildcardType;

    invoke-interface {v0}, Ljava/lang/reflect/WildcardType;->getUpperBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    .local v0, "upperBounds":[Ljava/lang/reflect/Type;
    goto :goto_0

    .line 82
    .end local v0    # "upperBounds":[Ljava/lang/reflect/Type;
    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/reflect/Type;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    .line 84
    .restart local v0    # "upperBounds":[Ljava/lang/reflect/Type;
    :goto_0
    new-instance v1, Lcom/google/gson/internal/GsonTypes$WildcardTypeImpl;

    sget-object v2, Lcom/google/gson/internal/GsonTypes;->EMPTY_TYPE_ARRAY:[Ljava/lang/reflect/Type;

    invoke-direct {v1, v0, v2}, Lcom/google/gson/internal/GsonTypes$WildcardTypeImpl;-><init>([Ljava/lang/reflect/Type;[Ljava/lang/reflect/Type;)V

    return-object v1
.end method

.method public static supertypeOf(Ljava/lang/reflect/Type;)Ljava/lang/reflect/WildcardType;
    .locals 5
    .param p0, "bound"    # Ljava/lang/reflect/Type;

    .line 93
    instance-of v0, p0, Ljava/lang/reflect/WildcardType;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 94
    move-object v0, p0

    check-cast v0, Ljava/lang/reflect/WildcardType;

    invoke-interface {v0}, Ljava/lang/reflect/WildcardType;->getLowerBounds()[Ljava/lang/reflect/Type;

    move-result-object v0

    .local v0, "lowerBounds":[Ljava/lang/reflect/Type;
    goto :goto_0

    .line 96
    .end local v0    # "lowerBounds":[Ljava/lang/reflect/Type;
    :cond_0
    new-array v0, v2, [Ljava/lang/reflect/Type;

    aput-object p0, v0, v1

    .line 98
    .restart local v0    # "lowerBounds":[Ljava/lang/reflect/Type;
    :goto_0
    new-instance v3, Lcom/google/gson/internal/GsonTypes$WildcardTypeImpl;

    new-array v2, v2, [Ljava/lang/reflect/Type;

    const-class v4, Ljava/lang/Object;

    aput-object v4, v2, v1

    invoke-direct {v3, v2, v0}, Lcom/google/gson/internal/GsonTypes$WildcardTypeImpl;-><init>([Ljava/lang/reflect/Type;[Ljava/lang/reflect/Type;)V

    return-object v3
.end method

.method public static typeToString(Ljava/lang/reflect/Type;)Ljava/lang/String;
    .locals 1
    .param p0, "type"    # Ljava/lang/reflect/Type;

    .line 228
    instance-of v0, p0, Ljava/lang/Class;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method
