.class Lcom/facebook/stetho/inspector/MethodDispatcher$MethodDispatchHelper;
.super Ljava/lang/Object;
.source "MethodDispatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/MethodDispatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MethodDispatchHelper"
.end annotation


# instance fields
.field private final mInstance:Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;

.field private final mMethod:Ljava/lang/reflect/Method;

.field private final mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;


# direct methods
.method public constructor <init>(Lcom/facebook/stetho/json/ObjectMapper;Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;Ljava/lang/reflect/Method;)V
    .locals 0
    .param p1, "objectMapper"    # Lcom/facebook/stetho/json/ObjectMapper;
    .param p2, "instance"    # Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;
    .param p3, "method"    # Ljava/lang/reflect/Method;

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    iput-object p1, p0, Lcom/facebook/stetho/inspector/MethodDispatcher$MethodDispatchHelper;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    .line 88
    iput-object p2, p0, Lcom/facebook/stetho/inspector/MethodDispatcher$MethodDispatchHelper;->mInstance:Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;

    .line 89
    iput-object p3, p0, Lcom/facebook/stetho/inspector/MethodDispatcher$MethodDispatchHelper;->mMethod:Ljava/lang/reflect/Method;

    .line 90
    return-void
.end method


# virtual methods
.method public invoke(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;,
            Lorg/json/JSONException;,
            Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;
        }
    .end annotation

    .line 94
    iget-object v0, p0, Lcom/facebook/stetho/inspector/MethodDispatcher$MethodDispatchHelper;->mMethod:Ljava/lang/reflect/Method;

    iget-object v1, p0, Lcom/facebook/stetho/inspector/MethodDispatcher$MethodDispatchHelper;->mInstance:Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;

    filled-new-array {p1, p2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 95
    .local v0, "internalResult":Ljava/lang/Object;
    if-eqz v0, :cond_1

    instance-of v1, v0, Lcom/facebook/stetho/inspector/jsonrpc/protocol/EmptyResult;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 98
    :cond_0
    move-object v1, v0

    check-cast v1, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcResult;

    .line 99
    .local v1, "convertableResult":Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcResult;
    iget-object v2, p0, Lcom/facebook/stetho/inspector/MethodDispatcher$MethodDispatchHelper;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v3, Lorg/json/JSONObject;

    invoke-virtual {v2, v1, v3}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/json/JSONObject;

    return-object v2

    .line 96
    .end local v1    # "convertableResult":Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcResult;
    :cond_1
    :goto_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    return-object v1
.end method
