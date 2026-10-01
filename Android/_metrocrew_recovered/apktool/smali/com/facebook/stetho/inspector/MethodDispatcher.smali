.class public Lcom/facebook/stetho/inspector/MethodDispatcher;
.super Ljava/lang/Object;
.source "MethodDispatcher.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/MethodDispatcher$MethodDispatchHelper;
    }
.end annotation


# instance fields
.field private final mDomainHandlers:Ljava/lang/Iterable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Iterable<",
            "Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;",
            ">;"
        }
    .end annotation
.end field

.field private mMethods:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/stetho/inspector/MethodDispatcher$MethodDispatchHelper;",
            ">;"
        }
    .end annotation
.end field

.field private final mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;


# direct methods
.method public constructor <init>(Lcom/facebook/stetho/json/ObjectMapper;Ljava/lang/Iterable;)V
    .locals 0
    .param p1, "objectMapper"    # Lcom/facebook/stetho/json/ObjectMapper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/stetho/json/ObjectMapper;",
            "Ljava/lang/Iterable<",
            "Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;",
            ">;)V"
        }
    .end annotation

    .line 44
    .local p2, "domainHandlers":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    iput-object p1, p0, Lcom/facebook/stetho/inspector/MethodDispatcher;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    .line 46
    iput-object p2, p0, Lcom/facebook/stetho/inspector/MethodDispatcher;->mDomainHandlers:Ljava/lang/Iterable;

    .line 47
    return-void
.end method

.method private static buildDispatchTable(Lcom/facebook/stetho/json/ObjectMapper;Ljava/lang/Iterable;)Ljava/util/Map;
    .locals 12
    .param p0, "objectMapper"    # Lcom/facebook/stetho/json/ObjectMapper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/stetho/json/ObjectMapper;",
            "Ljava/lang/Iterable<",
            "Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/stetho/inspector/MethodDispatcher$MethodDispatchHelper;",
            ">;"
        }
    .end annotation

    .line 107
    .local p1, "domainHandlers":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;>;"
    invoke-static {p0}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 109
    .local v0, "methods":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Lcom/facebook/stetho/inspector/MethodDispatcher$MethodDispatchHelper;>;"
    invoke-static {p1}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;

    .line 110
    .local v2, "domainHandler":Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    .line 111
    .local v3, "handlerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    .line 113
    .local v4, "domainName":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v5

    array-length v6, v5

    const/4 v7, 0x0

    :goto_1
    if-ge v7, v6, :cond_1

    aget-object v8, v5, v7

    .line 114
    .local v8, "method":Ljava/lang/reflect/Method;
    invoke-static {v8}, Lcom/facebook/stetho/inspector/MethodDispatcher;->isDevtoolsMethod(Ljava/lang/reflect/Method;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 115
    new-instance v9, Lcom/facebook/stetho/inspector/MethodDispatcher$MethodDispatchHelper;

    invoke-direct {v9, p0, v2, v8}, Lcom/facebook/stetho/inspector/MethodDispatcher$MethodDispatchHelper;-><init>(Lcom/facebook/stetho/json/ObjectMapper;Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;Ljava/lang/reflect/Method;)V

    .line 119
    .local v9, "dispatchHelper":Lcom/facebook/stetho/inspector/MethodDispatcher$MethodDispatchHelper;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "."

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v8}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10, v9}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .end local v8    # "method":Ljava/lang/reflect/Method;
    .end local v9    # "dispatchHelper":Lcom/facebook/stetho/inspector/MethodDispatcher$MethodDispatchHelper;
    :cond_0
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 122
    .end local v2    # "domainHandler":Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;
    .end local v3    # "handlerClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "domainName":Ljava/lang/String;
    :cond_1
    goto :goto_0

    .line 123
    :cond_2
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    return-object v1
.end method

.method private declared-synchronized findMethodDispatcher(Ljava/lang/String;)Lcom/facebook/stetho/inspector/MethodDispatcher$MethodDispatchHelper;
    .locals 2
    .param p1, "methodName"    # Ljava/lang/String;

    monitor-enter p0

    .line 50
    :try_start_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/MethodDispatcher;->mMethods:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 51
    iget-object v0, p0, Lcom/facebook/stetho/inspector/MethodDispatcher;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    iget-object v1, p0, Lcom/facebook/stetho/inspector/MethodDispatcher;->mDomainHandlers:Ljava/lang/Iterable;

    invoke-static {v0, v1}, Lcom/facebook/stetho/inspector/MethodDispatcher;->buildDispatchTable(Lcom/facebook/stetho/json/ObjectMapper;Ljava/lang/Iterable;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/MethodDispatcher;->mMethods:Ljava/util/Map;

    .line 53
    .end local p0    # "this":Lcom/facebook/stetho/inspector/MethodDispatcher;
    :cond_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/MethodDispatcher;->mMethods:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/MethodDispatcher$MethodDispatchHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 49
    .end local p1    # "methodName":Ljava/lang/String;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private static isDevtoolsMethod(Ljava/lang/reflect/Method;)Z
    .locals 7
    .param p0, "method"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 134
    const-class v0, Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 135
    return v1

    .line 137
    :cond_0
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v0

    .line 138
    .local v0, "args":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 139
    .local v2, "methodName":Ljava/lang/String;
    array-length v3, v0

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-ne v3, v4, :cond_1

    move v3, v5

    goto :goto_0

    :cond_1
    move v3, v1

    :goto_0
    array-length v4, v0

    .line 142
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v2, v4}, [Ljava/lang/Object;

    move-result-object v4

    .line 139
    const-string v6, "%s: expected 2 args, got %s"

    invoke-static {v3, v6, v4}, Lcom/facebook/stetho/common/Util;->throwIfNot(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 143
    aget-object v3, v0, v1

    const-class v4, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    aget-object v1, v0, v1

    .line 146
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    filled-new-array {v2, v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 143
    const-string v4, "%s: expected 1st arg of JsonRpcPeer, got %s"

    invoke-static {v3, v4, v1}, Lcom/facebook/stetho/common/Util;->throwIfNot(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 147
    aget-object v1, v0, v5

    const-class v3, Lorg/json/JSONObject;

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    aget-object v3, v0, v5

    .line 150
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v3

    .line 147
    const-string v4, "%s: expected 2nd arg of JSONObject, got %s"

    invoke-static {v1, v4, v3}, Lcom/facebook/stetho/common/Util;->throwIfNot(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 152
    invoke-virtual {p0}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v1

    .line 153
    .local v1, "returnType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v3, Ljava/lang/Void;->TYPE:Ljava/lang/Class;

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 154
    const-class v3, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcResult;

    invoke-virtual {v3, v1}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    .line 157
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    filled-new-array {v2, v4}, [Ljava/lang/Object;

    move-result-object v4

    .line 154
    const-string v6, "%s: expected JsonRpcResult return type, got %s"

    invoke-static {v3, v6, v4}, Lcom/facebook/stetho/common/Util;->throwIfNot(ZLjava/lang/String;[Ljava/lang/Object;)V

    .line 159
    :cond_2
    return v5
.end method


# virtual methods
.method public dispatch(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 7
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "methodName"    # Ljava/lang/String;
    .param p3, "params"    # Lorg/json/JSONObject;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;
        }
    .end annotation

    .line 58
    invoke-direct {p0, p2}, Lcom/facebook/stetho/inspector/MethodDispatcher;->findMethodDispatcher(Ljava/lang/String;)Lcom/facebook/stetho/inspector/MethodDispatcher$MethodDispatchHelper;

    move-result-object v0

    .line 59
    .local v0, "dispatchHelper":Lcom/facebook/stetho/inspector/MethodDispatcher$MethodDispatchHelper;
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 65
    :try_start_0
    invoke-virtual {v0, p1, p3}, Lcom/facebook/stetho/inspector/MethodDispatcher$MethodDispatchHelper;->invoke(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 72
    :catch_0
    move-exception v2

    .line 73
    .local v2, "e":Lorg/json/JSONException;
    new-instance v3, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;

    new-instance v4, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;

    sget-object v5, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;->INTERNAL_ERROR:Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;

    .line 74
    invoke-virtual {v2}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, v1}, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;-><init>(Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;Ljava/lang/String;Lorg/json/JSONObject;)V

    invoke-direct {v3, v4}, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;-><init>(Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;)V

    throw v3

    .line 70
    .end local v2    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v1

    .line 71
    .local v1, "e":Ljava/lang/IllegalAccessException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 66
    .end local v1    # "e":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v1

    .line 67
    .local v1, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    .line 68
    .local v2, "cause":Ljava/lang/Throwable;
    const-class v3, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;

    invoke-static {v2, v3}, Lcom/facebook/stetho/common/ExceptionUtil;->propagateIfInstanceOf(Ljava/lang/Throwable;Ljava/lang/Class;)V

    .line 69
    invoke-static {v2}, Lcom/facebook/stetho/common/ExceptionUtil;->propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v3

    throw v3

    .line 60
    .end local v1    # "e":Ljava/lang/reflect/InvocationTargetException;
    .end local v2    # "cause":Ljava/lang/Throwable;
    :cond_0
    new-instance v2, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;

    new-instance v3, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;

    sget-object v4, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;->METHOD_NOT_FOUND:Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Not implemented: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5, v1}, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;-><init>(Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;Ljava/lang/String;Lorg/json/JSONObject;)V

    invoke-direct {v2, v3}, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;-><init>(Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;)V

    throw v2
.end method
