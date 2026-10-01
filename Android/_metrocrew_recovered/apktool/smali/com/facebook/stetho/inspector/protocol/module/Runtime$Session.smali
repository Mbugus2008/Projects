.class Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;
.super Ljava/lang/Object;
.source "Runtime.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/protocol/module/Runtime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Session"
.end annotation


# instance fields
.field private final mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

.field private final mObjects:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

.field private mRepl:Lcom/facebook/stetho/inspector/console/RuntimeRepl;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 195
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 196
    new-instance v0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->mObjects:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    .line 197
    new-instance v0, Lcom/facebook/stetho/json/ObjectMapper;

    invoke-direct {v0}, Lcom/facebook/stetho/json/ObjectMapper;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/stetho/inspector/protocol/module/Runtime$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/facebook/stetho/inspector/protocol/module/Runtime$1;

    .line 195
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;-><init>()V

    return-void
.end method

.method private arrayToList(Ljava/lang/Object;)Ljava/util/List;
    .locals 6
    .param p1, "object"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List<",
            "*>;"
        }
    .end annotation

    .line 326
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 327
    .local v0, "type":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 330
    invoke-virtual {v0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v1

    .line 332
    .local v1, "component":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v1}, Ljava/lang/Class;->isPrimitive()Z

    move-result v2

    if-nez v2, :cond_0

    .line 333
    move-object v2, p1

    check-cast v2, [Ljava/lang/Object;

    check-cast v2, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    return-object v2

    .line 337
    :cond_0
    invoke-static {p1}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v2

    .line 338
    .local v2, "length":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 339
    .local v3, "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, v2, :cond_1

    .line 340
    invoke-static {p1, v4}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 339
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 342
    .end local v4    # "i":I
    :cond_1
    return-object v3

    .line 328
    .end local v1    # "component":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "length":I
    .end local v3    # "ret":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Argument must be an array.  Was "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private buildExceptionResponse(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse;
    .locals 3
    .param p1, "retval"    # Ljava/lang/Object;

    .line 289
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse;-><init>(Lcom/facebook/stetho/inspector/protocol/module/Runtime$1;)V

    .line 290
    .local v0, "response":Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse;
    const/4 v2, 0x1

    iput-boolean v2, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse;->wasThrown:Z

    .line 291
    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->objectForRemote(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;

    move-result-object v2

    iput-object v2, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse;->result:Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;

    .line 292
    new-instance v2, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ExceptionDetails;

    invoke-direct {v2, v1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ExceptionDetails;-><init>(Lcom/facebook/stetho/inspector/protocol/module/Runtime$1;)V

    iput-object v2, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse;->exceptionDetails:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ExceptionDetails;

    .line 293
    iget-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse;->exceptionDetails:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ExceptionDetails;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ExceptionDetails;->text:Ljava/lang/String;

    .line 294
    return-object v0
.end method

.method private buildNormalResponse(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse;
    .locals 2
    .param p1, "retval"    # Ljava/lang/Object;

    .line 282
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse;-><init>(Lcom/facebook/stetho/inspector/protocol/module/Runtime$1;)V

    .line 283
    .local v0, "response":Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse;
    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse;->wasThrown:Z

    .line 284
    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->objectForRemote(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse;->result:Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;

    .line 285
    return-object v0
.end method

.method private getPropertiesForIterable(Ljava/lang/Iterable;Z)Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;
    .locals 8
    .param p2, "enumerate"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "*>;Z)",
            "Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;"
        }
    .end annotation

    .line 366
    .local p1, "object":Ljava/lang/Iterable;, "Ljava/lang/Iterable<*>;"
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;-><init>(Lcom/facebook/stetho/inspector/protocol/module/Runtime$1;)V

    .line 367
    .local v0, "response":Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 369
    .local v2, "properties":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;>;"
    const/4 v3, 0x0

    .line 370
    .local v3, "index":I
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 371
    .local v5, "value":Ljava/lang/Object;
    new-instance v6, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;

    invoke-direct {v6, v1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;-><init>(Lcom/facebook/stetho/inspector/protocol/module/Runtime$1;)V

    .line 372
    .local v6, "property":Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;
    if-eqz p2, :cond_0

    add-int/lit8 v7, v3, 0x1

    .end local v3    # "index":I
    .local v7, "index":I
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .end local v7    # "index":I
    .restart local v3    # "index":I
    :cond_0
    move v7, v3

    move-object v3, v1

    .end local v3    # "index":I
    .restart local v7    # "index":I
    :goto_1
    iput-object v3, v6, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;->name:Ljava/lang/String;

    .line 373
    invoke-virtual {p0, v5}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->objectForRemote(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;

    move-result-object v3

    iput-object v3, v6, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;->value:Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;

    .line 374
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 375
    .end local v5    # "value":Ljava/lang/Object;
    .end local v6    # "property":Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;
    move v3, v7

    goto :goto_0

    .line 377
    .end local v7    # "index":I
    .restart local v3    # "index":I
    :cond_1
    iput-object v2, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;->result:Ljava/util/List;

    .line 378
    return-object v0
.end method

.method private getPropertiesForMap(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;
    .locals 7
    .param p1, "object"    # Ljava/lang/Object;

    .line 382
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;-><init>(Lcom/facebook/stetho/inspector/protocol/module/Runtime$1;)V

    .line 383
    .local v0, "response":Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 385
    .local v2, "properties":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;>;"
    move-object v3, p1

    check-cast v3, Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 386
    .local v4, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    new-instance v5, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;

    invoke-direct {v5, v1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;-><init>(Lcom/facebook/stetho/inspector/protocol/module/Runtime$1;)V

    .line 387
    .local v5, "property":Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;->name:Ljava/lang/String;

    .line 388
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->objectForRemote(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;

    move-result-object v6

    iput-object v6, v5, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;->value:Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;

    .line 389
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 390
    .end local v4    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<**>;"
    .end local v5    # "property":Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;
    goto :goto_0

    .line 392
    :cond_0
    iput-object v2, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;->result:Ljava/util/List;

    .line 393
    return-object v0
.end method

.method private getPropertiesForObject(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;
    .locals 12
    .param p1, "object"    # Ljava/lang/Object;

    .line 397
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;-><init>(Lcom/facebook/stetho/inspector/protocol/module/Runtime$1;)V

    .line 398
    .local v0, "response":Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 400
    .local v2, "properties":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;>;"
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 401
    .local v3, "declaringClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    if-eqz v3, :cond_3

    .line 407
    new-instance v4, Ljava/util/ArrayList;

    .line 408
    invoke-virtual {v3}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 409
    .local v4, "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    invoke-static {v4}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 410
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    if-ne v3, v5, :cond_0

    const-string v5, ""

    goto :goto_1

    :cond_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 412
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :goto_1
    nop

    .line 413
    .local v5, "prefix":Ljava/lang/String;
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/reflect/Field;

    .line 414
    .local v7, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v8

    invoke-static {v8}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 415
    goto :goto_2

    .line 417
    :cond_1
    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 419
    :try_start_0
    invoke-virtual {v7, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .line 420
    .local v8, "fieldValue":Ljava/lang/Object;
    new-instance v9, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;

    invoke-direct {v9, v1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;-><init>(Lcom/facebook/stetho/inspector/protocol/module/Runtime$1;)V

    .line 421
    .local v9, "property":Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v7}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;->name:Ljava/lang/String;

    .line 422
    invoke-virtual {p0, v8}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->objectForRemote(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;

    move-result-object v10

    iput-object v10, v9, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;->value:Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;

    .line 423
    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 426
    nop

    .line 427
    .end local v7    # "field":Ljava/lang/reflect/Field;
    .end local v8    # "fieldValue":Ljava/lang/Object;
    .end local v9    # "property":Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;
    goto :goto_2

    .line 424
    .restart local v7    # "field":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v1

    .line 425
    .local v1, "e":Ljava/lang/IllegalAccessException;
    new-instance v6, Ljava/lang/RuntimeException;

    invoke-direct {v6, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 402
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    .end local v4    # "fields":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Field;>;"
    .end local v5    # "prefix":Ljava/lang/String;
    .end local v7    # "field":Ljava/lang/reflect/Field;
    :cond_2
    invoke-virtual {v3}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v3

    goto/16 :goto_0

    .line 429
    .end local v3    # "declaringClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_3
    invoke-static {v2}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 430
    iput-object v2, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;->result:Ljava/util/List;

    .line 431
    return-object v0
.end method

.method private getPropertiesForProtoContainer(Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectProtoContainer;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;
    .locals 6
    .param p1, "proto"    # Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectProtoContainer;

    .line 349
    iget-object v0, p1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectProtoContainer;->object:Ljava/lang/Object;

    .line 350
    .local v0, "target":Ljava/lang/Object;
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;-><init>()V

    .line 351
    .local v1, "protoRemote":Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;
    sget-object v2, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->OBJECT:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->type:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    .line 352
    sget-object v2, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->NODE:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->subtype:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    .line 353
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->className:Ljava/lang/String;

    .line 354
    invoke-static {v0}, Lcom/facebook/stetho/inspector/protocol/module/Runtime;->access$300(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->description:Ljava/lang/String;

    .line 355
    iget-object v2, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->mObjects:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    invoke-virtual {v2, v0}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->putObject(Ljava/lang/Object;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->objectId:Ljava/lang/String;

    .line 356
    new-instance v2, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;-><init>(Lcom/facebook/stetho/inspector/protocol/module/Runtime$1;)V

    .line 357
    .local v2, "descriptor":Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;
    const-string v4, "1"

    iput-object v4, v2, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;->name:Ljava/lang/String;

    .line 358
    iput-object v1, v2, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;->value:Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;

    .line 359
    new-instance v4, Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;

    invoke-direct {v4, v3}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;-><init>(Lcom/facebook/stetho/inspector/protocol/module/Runtime$1;)V

    .line 360
    .local v4, "response":Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;
    new-instance v3, Ljava/util/ArrayList;

    const/4 v5, 0x1

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v3, v4, Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;->result:Ljava/util/List;

    .line 361
    iget-object v3, v4, Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;->result:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 362
    return-object v4
.end method

.method private declared-synchronized getRepl(Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;)Lcom/facebook/stetho/inspector/console/RuntimeRepl;
    .locals 1
    .param p1, "replFactory"    # Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    monitor-enter p0

    .line 275
    :try_start_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->mRepl:Lcom/facebook/stetho/inspector/console/RuntimeRepl;

    if-nez v0, :cond_0

    .line 276
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;->newInstance()Lcom/facebook/stetho/inspector/console/RuntimeRepl;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->mRepl:Lcom/facebook/stetho/inspector/console/RuntimeRepl;

    .line 278
    .end local p0    # "this":Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;
    :cond_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->mRepl:Lcom/facebook/stetho/inspector/console/RuntimeRepl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 274
    .end local p1    # "replFactory":Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method


# virtual methods
.method public evaluate(Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;Lorg/json/JSONObject;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse;
    .locals 4
    .param p1, "replFactory"    # Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;
    .param p2, "params"    # Lorg/json/JSONObject;

    .line 258
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateRequest;

    invoke-virtual {v0, p2, v1}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateRequest;

    .line 261
    .local v0, "request":Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateRequest;
    :try_start_0
    iget-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateRequest;->objectGroup:Ljava/lang/String;

    const-string v2, "console"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 262
    const-string v1, "Not supported by FAB"

    invoke-direct {p0, v1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->buildExceptionResponse(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse;

    move-result-object v1

    return-object v1

    .line 265
    :cond_0
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->getRepl(Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;)Lcom/facebook/stetho/inspector/console/RuntimeRepl;

    move-result-object v1

    .line 266
    .local v1, "repl":Lcom/facebook/stetho/inspector/console/RuntimeRepl;
    iget-object v2, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateRequest;->expression:Ljava/lang/String;

    invoke-interface {v1, v2}, Lcom/facebook/stetho/inspector/console/RuntimeRepl;->evaluate(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 267
    .local v2, "result":Ljava/lang/Object;
    invoke-direct {p0, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->buildNormalResponse(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v3

    .line 268
    .end local v1    # "repl":Lcom/facebook/stetho/inspector/console/RuntimeRepl;
    .end local v2    # "result":Ljava/lang/Object;
    :catchall_0
    move-exception v1

    .line 269
    .local v1, "t":Ljava/lang/Throwable;
    invoke-direct {p0, v1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->buildExceptionResponse(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse;

    move-result-object v2

    return-object v2
.end method

.method public getObjectOrThrow(Ljava/lang/String;)Ljava/lang/Object;
    .locals 6
    .param p1, "objectId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;
        }
    .end annotation

    .line 207
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->getObjects()Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->getObjectForId(I)Ljava/lang/Object;

    move-result-object v0

    .line 208
    .local v0, "object":Ljava/lang/Object;
    if-eqz v0, :cond_0

    .line 214
    return-object v0

    .line 209
    :cond_0
    new-instance v1, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;

    new-instance v2, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;

    sget-object v3, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;->INVALID_REQUEST:Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No object found for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct {v2, v3, v4, v5}, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;-><init>(Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;Ljava/lang/String;Lorg/json/JSONObject;)V

    invoke-direct {v1, v2}, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;-><init>(Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;)V

    throw v1
.end method

.method public getObjects()Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;
    .locals 1

    .line 203
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->mObjects:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    return-object v0
.end method

.method public getProperties(Lorg/json/JSONObject;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;
    .locals 4
    .param p1, "params"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;
        }
    .end annotation

    .line 298
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesRequest;

    invoke-virtual {v0, p1, v1}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesRequest;

    .line 300
    .local v0, "request":Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesRequest;
    iget-boolean v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesRequest;->ownProperties:Z

    if-nez v1, :cond_0

    .line 301
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;-><init>(Lcom/facebook/stetho/inspector/protocol/module/Runtime$1;)V

    .line 302
    .local v1, "response":Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;->result:Ljava/util/List;

    .line 303
    return-object v1

    .line 306
    .end local v1    # "response":Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;
    :cond_0
    iget-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesRequest;->objectId:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->getObjectOrThrow(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 308
    .local v1, "object":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->isArray()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 309
    invoke-direct {p0, v1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->arrayToList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 312
    :cond_1
    instance-of v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectProtoContainer;

    if-eqz v2, :cond_2

    .line 313
    move-object v2, v1

    check-cast v2, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectProtoContainer;

    invoke-direct {p0, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->getPropertiesForProtoContainer(Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectProtoContainer;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;

    move-result-object v2

    return-object v2

    .line 314
    :cond_2
    instance-of v2, v1, Ljava/util/List;

    if-eqz v2, :cond_3

    .line 315
    move-object v2, v1

    check-cast v2, Ljava/util/List;

    const/4 v3, 0x1

    invoke-direct {p0, v2, v3}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->getPropertiesForIterable(Ljava/lang/Iterable;Z)Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;

    move-result-object v2

    return-object v2

    .line 316
    :cond_3
    instance-of v2, v1, Ljava/util/Set;

    if-eqz v2, :cond_4

    .line 317
    move-object v2, v1

    check-cast v2, Ljava/util/Set;

    const/4 v3, 0x0

    invoke-direct {p0, v2, v3}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->getPropertiesForIterable(Ljava/lang/Iterable;Z)Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;

    move-result-object v2

    return-object v2

    .line 318
    :cond_4
    instance-of v2, v1, Ljava/util/Map;

    if-eqz v2, :cond_5

    .line 319
    invoke-direct {p0, v1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->getPropertiesForMap(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;

    move-result-object v2

    return-object v2

    .line 321
    :cond_5
    invoke-direct {p0, v1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->getPropertiesForObject(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;

    move-result-object v2

    return-object v2
.end method

.method public objectForRemote(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;
    .locals 2
    .param p1, "value"    # Ljava/lang/Object;

    .line 218
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;-><init>()V

    .line 219
    .local v0, "result":Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;
    if-nez p1, :cond_0

    .line 220
    sget-object v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->OBJECT:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->type:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    .line 221
    sget-object v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->NULL:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->subtype:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    .line 222
    sget-object v1, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->value:Ljava/lang/Object;

    goto/16 :goto_0

    .line 223
    :cond_0
    instance-of v1, p1, Ljava/lang/Boolean;

    if-eqz v1, :cond_1

    .line 224
    sget-object v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->BOOLEAN:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->type:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    .line 225
    iput-object p1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->value:Ljava/lang/Object;

    goto/16 :goto_0

    .line 226
    :cond_1
    instance-of v1, p1, Ljava/lang/Number;

    if-eqz v1, :cond_2

    .line 227
    sget-object v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->NUMBER:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->type:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    .line 228
    iput-object p1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->value:Ljava/lang/Object;

    goto :goto_0

    .line 229
    :cond_2
    instance-of v1, p1, Ljava/lang/Character;

    if-eqz v1, :cond_3

    .line 231
    sget-object v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->NUMBER:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->type:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    .line 232
    move-object v1, p1

    check-cast v1, Ljava/lang/Character;

    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->value:Ljava/lang/Object;

    goto :goto_0

    .line 233
    :cond_3
    instance-of v1, p1, Ljava/lang/String;

    if-eqz v1, :cond_4

    .line 234
    sget-object v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->STRING:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->type:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    .line 235
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->value:Ljava/lang/Object;

    goto :goto_0

    .line 237
    :cond_4
    sget-object v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->OBJECT:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->type:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    .line 238
    const-string v1, "What??"

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->className:Ljava/lang/String;

    .line 239
    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->mObjects:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    invoke-virtual {v1, p1}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->putObject(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->objectId:Ljava/lang/String;

    .line 241
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 242
    const-string v1, "array"

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->description:Ljava/lang/String;

    goto :goto_0

    .line 243
    :cond_5
    instance-of v1, p1, Ljava/util/List;

    if-eqz v1, :cond_6

    .line 244
    const-string v1, "List"

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->description:Ljava/lang/String;

    goto :goto_0

    .line 245
    :cond_6
    instance-of v1, p1, Ljava/util/Set;

    if-eqz v1, :cond_7

    .line 246
    const-string v1, "Set"

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->description:Ljava/lang/String;

    goto :goto_0

    .line 247
    :cond_7
    instance-of v1, p1, Ljava/util/Map;

    if-eqz v1, :cond_8

    .line 248
    const-string v1, "Map"

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->description:Ljava/lang/String;

    goto :goto_0

    .line 250
    :cond_8
    invoke-static {p1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime;->access$300(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->description:Ljava/lang/String;

    .line 254
    :goto_0
    return-object v0
.end method
