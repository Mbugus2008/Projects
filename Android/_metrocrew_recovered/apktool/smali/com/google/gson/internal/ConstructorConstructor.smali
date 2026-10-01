.class public final Lcom/google/gson/internal/ConstructorConstructor;
.super Ljava/lang/Object;
.source "ConstructorConstructor.java"


# instance fields
.field private final instanceCreators:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/reflect/Type;",
            "Lcom/google/gson/InstanceCreator<",
            "*>;>;"
        }
    .end annotation
.end field

.field private final reflectionFilters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/gson/ReflectionAccessFilter;",
            ">;"
        }
    .end annotation
.end field

.field private final useJdkUnsafe:Z


# direct methods
.method public constructor <init>(Ljava/util/Map;ZLjava/util/List;)V
    .locals 0
    .param p2, "useJdkUnsafe"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/reflect/Type;",
            "Lcom/google/gson/InstanceCreator<",
            "*>;>;Z",
            "Ljava/util/List<",
            "Lcom/google/gson/ReflectionAccessFilter;",
            ">;)V"
        }
    .end annotation

    .line 53
    .local p1, "instanceCreators":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/reflect/Type;Lcom/google/gson/InstanceCreator<*>;>;"
    .local p3, "reflectionFilters":Ljava/util/List;, "Ljava/util/List<Lcom/google/gson/ReflectionAccessFilter;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lcom/google/gson/internal/ConstructorConstructor;->instanceCreators:Ljava/util/Map;

    .line 55
    iput-boolean p2, p0, Lcom/google/gson/internal/ConstructorConstructor;->useJdkUnsafe:Z

    .line 56
    iput-object p3, p0, Lcom/google/gson/internal/ConstructorConstructor;->reflectionFilters:Ljava/util/List;

    .line 57
    return-void
.end method

.method static checkInstantiable(Ljava/lang/Class;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 67
    .local p0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getModifiers()I

    move-result v0

    .line 68
    .local v0, "modifiers":I
    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isInterface(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 69
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Interfaces can\'t be instantiated! Register an InstanceCreator or a TypeAdapter for this type. Interface name: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 71
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 69
    return-object v1

    .line 73
    :cond_0
    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 82
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Abstract classes can\'t be instantiated! Adjust the R8 configuration or register an InstanceCreator or a TypeAdapter for this type. Class name: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 84
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\nSee "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 86
    const-string v2, "r8-abstract-class"

    invoke-static {v2}, Lcom/google/gson/internal/TroubleshootingGuide;->createUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 82
    return-object v1

    .line 88
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method

.method private static hasStringKeyType(Ljava/lang/reflect/Type;)Z
    .locals 5
    .param p0, "mapType"    # Ljava/lang/reflect/Type;

    .line 362
    instance-of v0, p0, Ljava/lang/reflect/ParameterizedType;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 363
    return v1

    .line 366
    :cond_0
    move-object v0, p0

    check-cast v0, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v0

    .line 367
    .local v0, "typeArguments":[Ljava/lang/reflect/Type;
    array-length v2, v0

    const/4 v3, 0x0

    if-nez v2, :cond_1

    .line 368
    return v3

    .line 370
    :cond_1
    aget-object v2, v0, v3

    invoke-static {v2}, Lcom/google/gson/internal/GsonTypes;->getRawType(Ljava/lang/reflect/Type;)Ljava/lang/Class;

    move-result-object v2

    const-class v4, Ljava/lang/String;

    if-ne v2, v4, :cond_2

    goto :goto_0

    :cond_2
    move v1, v3

    :goto_0
    return v1
.end method

.method static synthetic lambda$get$0(Lcom/google/gson/InstanceCreator;Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .locals 1
    .param p0, "typeCreator"    # Lcom/google/gson/InstanceCreator;
    .param p1, "type"    # Ljava/lang/reflect/Type;

    .line 112
    invoke-interface {p0, p1}, Lcom/google/gson/InstanceCreator;->createInstance(Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$get$1(Lcom/google/gson/InstanceCreator;Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .locals 1
    .param p0, "rawTypeCreator"    # Lcom/google/gson/InstanceCreator;
    .param p1, "type"    # Ljava/lang/reflect/Type;

    .line 119
    invoke-interface {p0, p1}, Lcom/google/gson/InstanceCreator;->createInstance(Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$get$2(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "exceptionMessage"    # Ljava/lang/String;

    .line 147
    new-instance v0, Lcom/google/gson/JsonIOException;

    invoke-direct {v0, p0}, Lcom/google/gson/JsonIOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic lambda$get$3(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "message"    # Ljava/lang/String;

    .line 157
    new-instance v0, Lcom/google/gson/JsonIOException;

    invoke-direct {v0, p0}, Lcom/google/gson/JsonIOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic lambda$get$4(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "message"    # Ljava/lang/String;

    .line 171
    new-instance v0, Lcom/google/gson/JsonIOException;

    invoke-direct {v0, p0}, Lcom/google/gson/JsonIOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic lambda$newCollectionConstructor$10()Ljava/util/Collection;
    .locals 1

    .line 341
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$newCollectionConstructor$11()Ljava/util/Collection;
    .locals 1

    .line 345
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$newCollectionConstructor$12()Ljava/util/Collection;
    .locals 1

    .line 349
    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$newCollectionConstructor$13()Ljava/util/Collection;
    .locals 1

    .line 353
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$newDefaultConstructor$7(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "message"    # Ljava/lang/String;

    .line 254
    new-instance v0, Lcom/google/gson/JsonIOException;

    invoke-direct {v0, p0}, Lcom/google/gson/JsonIOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic lambda$newDefaultConstructor$8(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "exceptionMessage"    # Ljava/lang/String;

    .line 275
    new-instance v0, Lcom/google/gson/JsonIOException;

    invoke-direct {v0, p0}, Lcom/google/gson/JsonIOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic lambda$newDefaultConstructor$9(Ljava/lang/reflect/Constructor;)Ljava/lang/Object;
    .locals 5
    .param p0, "constructor"    # Ljava/lang/reflect/Constructor;

    .line 283
    const-string v0, "\' with no args"

    const-string v1, "Failed to invoke constructor \'"

    const/4 v2, 0x0

    :try_start_0
    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 284
    .local v0, "newInstance":Ljava/lang/Object;, "TT;"
    return-object v0

    .line 302
    .end local v0    # "newInstance":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v0

    .line 303
    .local v0, "e":Ljava/lang/IllegalAccessException;
    invoke-static {v0}, Lcom/google/gson/internal/reflect/ReflectionHelper;->createExceptionForUnexpectedIllegalAccess(Ljava/lang/IllegalAccessException;)Ljava/lang/RuntimeException;

    move-result-object v1

    throw v1

    .line 294
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_1
    move-exception v2

    .line 297
    .local v2, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 299
    invoke-static {p0}, Lcom/google/gson/internal/reflect/ReflectionHelper;->constructorToString(Ljava/lang/reflect/Constructor;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 301
    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-direct {v3, v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3

    .line 288
    .end local v2    # "e":Ljava/lang/reflect/InvocationTargetException;
    :catch_2
    move-exception v2

    .line 289
    .local v2, "e":Ljava/lang/InstantiationException;
    new-instance v3, Ljava/lang/RuntimeException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 291
    invoke-static {p0}, Lcom/google/gson/internal/reflect/ReflectionHelper;->constructorToString(Ljava/lang/reflect/Constructor;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method static synthetic lambda$newMapConstructor$14()Ljava/util/Map;
    .locals 1

    .line 381
    new-instance v0, Lcom/google/gson/internal/LinkedTreeMap;

    invoke-direct {v0}, Lcom/google/gson/internal/LinkedTreeMap;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$newMapConstructor$15()Ljava/util/Map;
    .locals 1

    .line 383
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$newMapConstructor$16()Ljava/util/Map;
    .locals 1

    .line 387
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0}, Ljava/util/TreeMap;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$newMapConstructor$17()Ljava/util/Map;
    .locals 1

    .line 391
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$newMapConstructor$18()Ljava/util/Map;
    .locals 1

    .line 395
    new-instance v0, Ljava/util/concurrent/ConcurrentSkipListMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentSkipListMap;-><init>()V

    return-object v0
.end method

.method static synthetic lambda$newSpecialCollectionConstructor$5(Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .locals 4
    .param p0, "type"    # Ljava/lang/reflect/Type;

    .line 187
    instance-of v0, p0, Ljava/lang/reflect/ParameterizedType;

    const-string v1, "Invalid EnumSet type: "

    if-eqz v0, :cond_1

    .line 188
    move-object v0, p0

    check-cast v0, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v0

    const/4 v2, 0x0

    aget-object v0, v0, v2

    .line 189
    .local v0, "elementType":Ljava/lang/reflect/Type;
    instance-of v2, v0, Ljava/lang/Class;

    if-eqz v2, :cond_0

    .line 191
    move-object v1, v0

    check-cast v1, Ljava/lang/Class;

    invoke-static {v1}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v1

    .line 192
    .local v1, "set":Ljava/lang/Object;, "TT;"
    return-object v1

    .line 194
    .end local v1    # "set":Ljava/lang/Object;, "TT;"
    :cond_0
    new-instance v2, Lcom/google/gson/JsonIOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Lcom/google/gson/JsonIOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 197
    .end local v0    # "elementType":Ljava/lang/reflect/Type;
    :cond_1
    new-instance v0, Lcom/google/gson/JsonIOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/gson/JsonIOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic lambda$newSpecialCollectionConstructor$6(Ljava/lang/reflect/Type;)Ljava/lang/Object;
    .locals 4
    .param p0, "type"    # Ljava/lang/reflect/Type;

    .line 205
    instance-of v0, p0, Ljava/lang/reflect/ParameterizedType;

    const-string v1, "Invalid EnumMap type: "

    if-eqz v0, :cond_1

    .line 206
    move-object v0, p0

    check-cast v0, Ljava/lang/reflect/ParameterizedType;

    invoke-interface {v0}, Ljava/lang/reflect/ParameterizedType;->getActualTypeArguments()[Ljava/lang/reflect/Type;

    move-result-object v0

    const/4 v2, 0x0

    aget-object v0, v0, v2

    .line 207
    .local v0, "elementType":Ljava/lang/reflect/Type;
    instance-of v2, v0, Ljava/lang/Class;

    if-eqz v2, :cond_0

    .line 209
    new-instance v1, Ljava/util/EnumMap;

    move-object v2, v0

    check-cast v2, Ljava/lang/Class;

    invoke-direct {v1, v2}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 210
    .local v1, "map":Ljava/lang/Object;, "TT;"
    return-object v1

    .line 212
    .end local v1    # "map":Ljava/lang/Object;, "TT;"
    :cond_0
    new-instance v2, Lcom/google/gson/JsonIOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Lcom/google/gson/JsonIOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 215
    .end local v0    # "elementType":Ljava/lang/reflect/Type;
    :cond_1
    new-instance v0, Lcom/google/gson/JsonIOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/google/gson/JsonIOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic lambda$newUnsafeAllocator$19(Ljava/lang/Class;)Ljava/lang/Object;
    .locals 4
    .param p0, "rawType"    # Ljava/lang/Class;

    .line 407
    :try_start_0
    sget-object v0, Lcom/google/gson/internal/UnsafeAllocator;->INSTANCE:Lcom/google/gson/internal/UnsafeAllocator;

    invoke-virtual {v0, p0}, Lcom/google/gson/internal/UnsafeAllocator;->newInstance(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 408
    .local v0, "newInstance":Ljava/lang/Object;, "TT;"
    return-object v0

    .line 409
    .end local v0    # "newInstance":Ljava/lang/Object;, "TT;"
    :catch_0
    move-exception v0

    .line 410
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to create instance of "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ". Registering an InstanceCreator or a TypeAdapter for this type, or adding a no-args constructor may fix this problem."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method static synthetic lambda$newUnsafeAllocator$20(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1
    .param p0, "exceptionMessageF"    # Ljava/lang/String;

    .line 438
    new-instance v0, Lcom/google/gson/JsonIOException;

    invoke-direct {v0, p0}, Lcom/google/gson/JsonIOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static newCollectionConstructor(Ljava/lang/Class;)Lcom/google/gson/internal/ObjectConstructor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "Lcom/google/gson/internal/ObjectConstructor<",
            "+",
            "Ljava/util/Collection<",
            "+",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 340
    .local p0, "rawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 341
    new-instance v0, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda16;

    invoke-direct {v0}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda16;-><init>()V

    return-object v0

    .line 344
    :cond_0
    const-class v0, Ljava/util/LinkedHashSet;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 345
    new-instance v0, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda17;

    invoke-direct {v0}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda17;-><init>()V

    return-object v0

    .line 348
    :cond_1
    const-class v0, Ljava/util/TreeSet;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 349
    new-instance v0, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda18;

    invoke-direct {v0}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda18;-><init>()V

    return-object v0

    .line 352
    :cond_2
    const-class v0, Ljava/util/ArrayDeque;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 353
    new-instance v0, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda19;

    invoke-direct {v0}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda19;-><init>()V

    return-object v0

    .line 357
    :cond_3
    const/4 v0, 0x0

    return-object v0
.end method

.method private static newDefaultConstructor(Ljava/lang/Class;Lcom/google/gson/ReflectionAccessFilter$FilterResult;)Lcom/google/gson/internal/ObjectConstructor;
    .locals 4
    .param p1, "filterResult"    # Lcom/google/gson/ReflectionAccessFilter$FilterResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "-TT;>;",
            "Lcom/google/gson/ReflectionAccessFilter$FilterResult;",
            ")",
            "Lcom/google/gson/internal/ObjectConstructor<",
            "TT;>;"
        }
    .end annotation

    .line 226
    .local p0, "rawType":Ljava/lang/Class;, "Ljava/lang/Class<-TT;>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getModifiers()I

    move-result v0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isAbstract(I)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 227
    return-object v1

    .line 232
    :cond_0
    const/4 v0, 0x0

    :try_start_0
    new-array v2, v0, [Ljava/lang/Class;

    invoke-virtual {p0, v2}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 235
    .local v2, "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<-TT;>;"
    nop

    .line 237
    sget-object v3, Lcom/google/gson/ReflectionAccessFilter$FilterResult;->ALLOW:Lcom/google/gson/ReflectionAccessFilter$FilterResult;

    if-eq p1, v3, :cond_2

    .line 239
    invoke-static {v2, v1}, Lcom/google/gson/internal/ReflectionAccessFilterHelper;->canAccess(Ljava/lang/reflect/AccessibleObject;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    sget-object v1, Lcom/google/gson/ReflectionAccessFilter$FilterResult;->BLOCK_ALL:Lcom/google/gson/ReflectionAccessFilter$FilterResult;

    if-ne p1, v1, :cond_2

    .line 243
    invoke-virtual {v2}, Ljava/lang/reflect/Constructor;->getModifiers()I

    move-result v1

    invoke-static {v1}, Ljava/lang/reflect/Modifier;->isPublic(I)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    .line 245
    .local v0, "canAccess":Z
    :goto_1
    if-nez v0, :cond_3

    .line 246
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to invoke no-args constructor of "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "; constructor is not accessible and ReflectionAccessFilter does not permit making it accessible. Register an InstanceCreator or a TypeAdapter for this type, change the visibility of the constructor or adjust the access filter."

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 253
    .local v1, "message":Ljava/lang/String;
    new-instance v3, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda9;

    invoke-direct {v3, v1}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda9;-><init>(Ljava/lang/String;)V

    return-object v3

    .line 260
    .end local v1    # "message":Ljava/lang/String;
    :cond_3
    sget-object v1, Lcom/google/gson/ReflectionAccessFilter$FilterResult;->ALLOW:Lcom/google/gson/ReflectionAccessFilter$FilterResult;

    if-ne p1, v1, :cond_4

    .line 261
    invoke-static {v2}, Lcom/google/gson/internal/reflect/ReflectionHelper;->tryMakeAccessible(Ljava/lang/reflect/Constructor;)Ljava/lang/String;

    move-result-object v1

    .line 262
    .local v1, "exceptionMessage":Ljava/lang/String;
    if-eqz v1, :cond_4

    .line 271
    new-instance v3, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda10;

    invoke-direct {v3, v1}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda10;-><init>(Ljava/lang/String;)V

    return-object v3

    .line 280
    .end local v1    # "exceptionMessage":Ljava/lang/String;
    :cond_4
    new-instance v1, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda12;

    invoke-direct {v1, v2}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda12;-><init>(Ljava/lang/reflect/Constructor;)V

    return-object v1

    .line 233
    .end local v0    # "canAccess":Z
    .end local v2    # "constructor":Ljava/lang/reflect/Constructor;, "Ljava/lang/reflect/Constructor<-TT;>;"
    :catch_0
    move-exception v0

    .line 234
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    return-object v1
.end method

.method private static newDefaultImplementationConstructor(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/google/gson/internal/ObjectConstructor;
    .locals 1
    .param p0, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class<",
            "-TT;>;)",
            "Lcom/google/gson/internal/ObjectConstructor<",
            "TT;>;"
        }
    .end annotation

    .line 320
    .local p1, "rawType":Ljava/lang/Class;, "Ljava/lang/Class<-TT;>;"
    const-class v0, Ljava/util/Collection;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 322
    invoke-static {p1}, Lcom/google/gson/internal/ConstructorConstructor;->newCollectionConstructor(Ljava/lang/Class;)Lcom/google/gson/internal/ObjectConstructor;

    move-result-object v0

    .line 323
    .local v0, "constructor":Lcom/google/gson/internal/ObjectConstructor;, "Lcom/google/gson/internal/ObjectConstructor<TT;>;"
    return-object v0

    .line 326
    .end local v0    # "constructor":Lcom/google/gson/internal/ObjectConstructor;, "Lcom/google/gson/internal/ObjectConstructor<TT;>;"
    :cond_0
    const-class v0, Ljava/util/Map;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 328
    invoke-static {p0, p1}, Lcom/google/gson/internal/ConstructorConstructor;->newMapConstructor(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/google/gson/internal/ObjectConstructor;

    move-result-object v0

    .line 329
    .restart local v0    # "constructor":Lcom/google/gson/internal/ObjectConstructor;, "Lcom/google/gson/internal/ObjectConstructor<TT;>;"
    return-object v0

    .line 333
    .end local v0    # "constructor":Lcom/google/gson/internal/ObjectConstructor;, "Lcom/google/gson/internal/ObjectConstructor<TT;>;"
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private static newMapConstructor(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/google/gson/internal/ObjectConstructor;
    .locals 1
    .param p0, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class<",
            "*>;)",
            "Lcom/google/gson/internal/ObjectConstructor<",
            "+",
            "Ljava/util/Map<",
            "+",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .line 380
    .local p1, "rawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-class v0, Lcom/google/gson/internal/LinkedTreeMap;

    invoke-virtual {p1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/google/gson/internal/ConstructorConstructor;->hasStringKeyType(Ljava/lang/reflect/Type;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 381
    new-instance v0, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda4;

    invoke-direct {v0}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda4;-><init>()V

    return-object v0

    .line 382
    :cond_0
    const-class v0, Ljava/util/LinkedHashMap;

    invoke-virtual {p1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 383
    new-instance v0, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda5;

    invoke-direct {v0}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda5;-><init>()V

    return-object v0

    .line 386
    :cond_1
    const-class v0, Ljava/util/TreeMap;

    invoke-virtual {p1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 387
    new-instance v0, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda6;

    invoke-direct {v0}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda6;-><init>()V

    return-object v0

    .line 390
    :cond_2
    const-class v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 391
    new-instance v0, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda7;

    invoke-direct {v0}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda7;-><init>()V

    return-object v0

    .line 394
    :cond_3
    const-class v0, Ljava/util/concurrent/ConcurrentSkipListMap;

    invoke-virtual {p1, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 395
    new-instance v0, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda8;

    invoke-direct {v0}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda8;-><init>()V

    return-object v0

    .line 399
    :cond_4
    const/4 v0, 0x0

    return-object v0
.end method

.method private static newSpecialCollectionConstructor(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/google/gson/internal/ObjectConstructor;
    .locals 1
    .param p0, "type"    # Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class<",
            "-TT;>;)",
            "Lcom/google/gson/internal/ObjectConstructor<",
            "TT;>;"
        }
    .end annotation

    .line 185
    .local p1, "rawType":Ljava/lang/Class;, "Ljava/lang/Class<-TT;>;"
    const-class v0, Ljava/util/EnumSet;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 186
    new-instance v0, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda2;

    invoke-direct {v0, p0}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda2;-><init>(Ljava/lang/reflect/Type;)V

    return-object v0

    .line 203
    :cond_0
    const-class v0, Ljava/util/EnumMap;

    if-ne p1, v0, :cond_1

    .line 204
    new-instance v0, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda3;

    invoke-direct {v0, p0}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda3;-><init>(Ljava/lang/reflect/Type;)V

    return-object v0

    .line 220
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private newUnsafeAllocator(Ljava/lang/Class;)Lcom/google/gson/internal/ObjectConstructor;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "-TT;>;)",
            "Lcom/google/gson/internal/ObjectConstructor<",
            "TT;>;"
        }
    .end annotation

    .line 403
    .local p1, "rawType":Ljava/lang/Class;, "Ljava/lang/Class<-TT;>;"
    iget-boolean v0, p0, Lcom/google/gson/internal/ConstructorConstructor;->useJdkUnsafe:Z

    if-eqz v0, :cond_0

    .line 404
    new-instance v0, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda20;

    invoke-direct {v0, p1}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda20;-><init>(Ljava/lang/Class;)V

    return-object v0

    .line 419
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unable to create instance of "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "; usage of JDK Unsafe is disabled. Registering an InstanceCreator or a TypeAdapter for this type, adding a no-args constructor, or enabling usage of JDK Unsafe may fix this problem."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 427
    .local v0, "exceptionMessage":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/lang/Class;->getDeclaredConstructors()[Ljava/lang/reflect/Constructor;

    move-result-object v1

    array-length v1, v1

    if-nez v1, :cond_1

    .line 430
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " Or adjust your R8 configuration to keep the no-args constructor of the class."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 435
    :cond_1
    move-object v1, v0

    .line 437
    .local v1, "exceptionMessageF":Ljava/lang/String;
    new-instance v2, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda1;

    invoke-direct {v2, v1}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda1;-><init>(Ljava/lang/String;)V

    return-object v2
.end method


# virtual methods
.method public get(Lcom/google/gson/reflect/TypeToken;)Lcom/google/gson/internal/ObjectConstructor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/gson/reflect/TypeToken<",
            "TT;>;)",
            "Lcom/google/gson/internal/ObjectConstructor<",
            "TT;>;"
        }
    .end annotation

    .line 93
    .local p1, "typeToken":Lcom/google/gson/reflect/TypeToken;, "Lcom/google/gson/reflect/TypeToken<TT;>;"
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/google/gson/internal/ConstructorConstructor;->get(Lcom/google/gson/reflect/TypeToken;Z)Lcom/google/gson/internal/ObjectConstructor;

    move-result-object v0

    return-object v0
.end method

.method public get(Lcom/google/gson/reflect/TypeToken;Z)Lcom/google/gson/internal/ObjectConstructor;
    .locals 11
    .param p2, "allowUnsafe"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/gson/reflect/TypeToken<",
            "TT;>;Z)",
            "Lcom/google/gson/internal/ObjectConstructor<",
            "TT;>;"
        }
    .end annotation

    .line 104
    .local p1, "typeToken":Lcom/google/gson/reflect/TypeToken;, "Lcom/google/gson/reflect/TypeToken<TT;>;"
    invoke-virtual {p1}, Lcom/google/gson/reflect/TypeToken;->getType()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 105
    .local v0, "type":Ljava/lang/reflect/Type;
    invoke-virtual {p1}, Lcom/google/gson/reflect/TypeToken;->getRawType()Ljava/lang/Class;

    move-result-object v1

    .line 110
    .local v1, "rawType":Ljava/lang/Class;, "Ljava/lang/Class<-TT;>;"
    iget-object v2, p0, Lcom/google/gson/internal/ConstructorConstructor;->instanceCreators:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/gson/InstanceCreator;

    .line 111
    .local v2, "typeCreator":Lcom/google/gson/InstanceCreator;, "Lcom/google/gson/InstanceCreator<TT;>;"
    if-eqz v2, :cond_0

    .line 112
    new-instance v3, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda0;

    invoke-direct {v3, v2, v0}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda0;-><init>(Lcom/google/gson/InstanceCreator;Ljava/lang/reflect/Type;)V

    return-object v3

    .line 117
    :cond_0
    iget-object v3, p0, Lcom/google/gson/internal/ConstructorConstructor;->instanceCreators:Ljava/util/Map;

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/google/gson/InstanceCreator;

    .line 118
    .local v3, "rawTypeCreator":Lcom/google/gson/InstanceCreator;, "Lcom/google/gson/InstanceCreator<TT;>;"
    if-eqz v3, :cond_1

    .line 119
    new-instance v4, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda11;

    invoke-direct {v4, v3, v0}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda11;-><init>(Lcom/google/gson/InstanceCreator;Ljava/lang/reflect/Type;)V

    return-object v4

    .line 125
    :cond_1
    invoke-static {v0, v1}, Lcom/google/gson/internal/ConstructorConstructor;->newSpecialCollectionConstructor(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/google/gson/internal/ObjectConstructor;

    move-result-object v4

    .line 126
    .local v4, "specialConstructor":Lcom/google/gson/internal/ObjectConstructor;, "Lcom/google/gson/internal/ObjectConstructor<TT;>;"
    if-eqz v4, :cond_2

    .line 127
    return-object v4

    .line 130
    :cond_2
    iget-object v5, p0, Lcom/google/gson/internal/ConstructorConstructor;->reflectionFilters:Ljava/util/List;

    .line 131
    invoke-static {v5, v1}, Lcom/google/gson/internal/ReflectionAccessFilterHelper;->getFilterResult(Ljava/util/List;Ljava/lang/Class;)Lcom/google/gson/ReflectionAccessFilter$FilterResult;

    move-result-object v5

    .line 132
    .local v5, "filterResult":Lcom/google/gson/ReflectionAccessFilter$FilterResult;
    invoke-static {v1, v5}, Lcom/google/gson/internal/ConstructorConstructor;->newDefaultConstructor(Ljava/lang/Class;Lcom/google/gson/ReflectionAccessFilter$FilterResult;)Lcom/google/gson/internal/ObjectConstructor;

    move-result-object v6

    .line 133
    .local v6, "defaultConstructor":Lcom/google/gson/internal/ObjectConstructor;, "Lcom/google/gson/internal/ObjectConstructor<TT;>;"
    if-eqz v6, :cond_3

    .line 134
    return-object v6

    .line 137
    :cond_3
    invoke-static {v0, v1}, Lcom/google/gson/internal/ConstructorConstructor;->newDefaultImplementationConstructor(Ljava/lang/reflect/Type;Ljava/lang/Class;)Lcom/google/gson/internal/ObjectConstructor;

    move-result-object v7

    .line 138
    .local v7, "defaultImplementation":Lcom/google/gson/internal/ObjectConstructor;, "Lcom/google/gson/internal/ObjectConstructor<TT;>;"
    if-eqz v7, :cond_4

    .line 139
    return-object v7

    .line 144
    :cond_4
    invoke-static {v1}, Lcom/google/gson/internal/ConstructorConstructor;->checkInstantiable(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v8

    .line 145
    .local v8, "exceptionMessage":Ljava/lang/String;
    if-eqz v8, :cond_5

    .line 146
    new-instance v9, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda13;

    invoke-direct {v9, v8}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda13;-><init>(Ljava/lang/String;)V

    return-object v9

    .line 151
    :cond_5
    const-string v9, "Unable to create instance of "

    if-nez p2, :cond_6

    .line 152
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "; Register an InstanceCreator or a TypeAdapter for this type."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 156
    .local v9, "message":Ljava/lang/String;
    new-instance v10, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda14;

    invoke-direct {v10, v9}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda14;-><init>(Ljava/lang/String;)V

    return-object v10

    .line 163
    .end local v9    # "message":Ljava/lang/String;
    :cond_6
    sget-object v10, Lcom/google/gson/ReflectionAccessFilter$FilterResult;->ALLOW:Lcom/google/gson/ReflectionAccessFilter$FilterResult;

    if-eq v5, v10, :cond_7

    .line 164
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "; ReflectionAccessFilter does not permit using reflection or Unsafe. Register an InstanceCreator or a TypeAdapter for this type or adjust the access filter to allow using reflection."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 170
    .restart local v9    # "message":Ljava/lang/String;
    new-instance v10, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda15;

    invoke-direct {v10, v9}, Lcom/google/gson/internal/ConstructorConstructor$$ExternalSyntheticLambda15;-><init>(Ljava/lang/String;)V

    return-object v10

    .line 176
    .end local v9    # "message":Ljava/lang/String;
    :cond_7
    invoke-direct {p0, v1}, Lcom/google/gson/internal/ConstructorConstructor;->newUnsafeAllocator(Ljava/lang/Class;)Lcom/google/gson/internal/ObjectConstructor;

    move-result-object v9

    return-object v9
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 445
    iget-object v0, p0, Lcom/google/gson/internal/ConstructorConstructor;->instanceCreators:Ljava/util/Map;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
