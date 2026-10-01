.class public Lcom/facebook/stetho/inspector/protocol/module/Runtime;
.super Ljava/lang/Object;
.source "Runtime.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;,
        Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;,
        Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;,
        Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;,
        Lcom/facebook/stetho/inspector/protocol/module/Runtime$ExceptionDetails;,
        Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse;,
        Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateRequest;,
        Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;,
        Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesRequest;,
        Lcom/facebook/stetho/inspector/protocol/module/Runtime$CallArgument;,
        Lcom/facebook/stetho/inspector/protocol/module/Runtime$CallFunctionOnResponse;,
        Lcom/facebook/stetho/inspector/protocol/module/Runtime$CallFunctionOnRequest;,
        Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;,
        Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectProtoContainer;
    }
.end annotation


# static fields
.field private static final sSessions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;",
            "Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

.field private final mReplFactory:Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 48
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 49
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime;->sSessions:Ljava/util/Map;

    .line 48
    return-void
.end method

.method public constructor <init>()V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 61
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$1;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$1;-><init>()V

    invoke-direct {p0, v0}, Lcom/facebook/stetho/inspector/protocol/module/Runtime;-><init>(Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;)V

    .line 72
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 79
    new-instance v0, Lcom/facebook/stetho/inspector/runtime/RhinoDetectingRuntimeReplFactory;

    invoke-direct {v0, p1}, Lcom/facebook/stetho/inspector/runtime/RhinoDetectingRuntimeReplFactory;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v0}, Lcom/facebook/stetho/inspector/protocol/module/Runtime;-><init>(Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;)V

    .line 80
    return-void
.end method

.method public constructor <init>(Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;)V
    .locals 1
    .param p1, "replFactory"    # Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Lcom/facebook/stetho/json/ObjectMapper;

    invoke-direct {v0}, Lcom/facebook/stetho/json/ObjectMapper;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    .line 83
    iput-object p1, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime;->mReplFactory:Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;

    .line 84
    return-void
.end method

.method static synthetic access$100()Ljava/util/Map;
    .locals 1

    .line 45
    sget-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime;->sSessions:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$300(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Ljava/lang/Object;

    .line 45
    invoke-static {p0}, Lcom/facebook/stetho/inspector/protocol/module/Runtime;->getPropertyClassName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static getPropertyClassName(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "o"    # Ljava/lang/Object;

    .line 172
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    .line 173
    .local v0, "name":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 175
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 177
    :cond_1
    return-object v0
.end method

.method private static declared-synchronized getSession(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;
    .locals 4
    .param p0, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    const-class v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime;

    monitor-enter v0

    .line 92
    :try_start_0
    sget-object v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime;->sSessions:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;

    .line 93
    .local v1, "session":Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;
    if-nez v1, :cond_0

    .line 94
    new-instance v2, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;-><init>(Lcom/facebook/stetho/inspector/protocol/module/Runtime$1;)V

    move-object v1, v2

    .line 95
    sget-object v2, Lcom/facebook/stetho/inspector/protocol/module/Runtime;->sSessions:Ljava/util/Map;

    invoke-interface {v2, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    new-instance v2, Lcom/facebook/stetho/inspector/protocol/module/Runtime$2;

    invoke-direct {v2, p0}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$2;-><init>(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;)V

    invoke-virtual {p0, v2}, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;->registerDisconnectReceiver(Lcom/facebook/stetho/inspector/jsonrpc/DisconnectReceiver;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    :cond_0
    monitor-exit v0

    return-object v1

    .line 91
    .end local v1    # "session":Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;
    .end local p0    # "peer":Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static mapObject(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Ljava/lang/Object;)I
    .locals 1
    .param p0, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p1, "object"    # Ljava/lang/Object;

    .line 87
    invoke-static {p0}, Lcom/facebook/stetho/inspector/protocol/module/Runtime;->getSession(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->getObjects()Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->putObject(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public static releaseObject(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Ljava/lang/Integer;)V
    .locals 2
    .param p0, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p1, "id"    # Ljava/lang/Integer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 110
    invoke-static {p0}, Lcom/facebook/stetho/inspector/protocol/module/Runtime;->getSession(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->getObjects()Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->removeObjectById(I)Ljava/lang/Object;

    .line 111
    return-void
.end method


# virtual methods
.method public callFunctionOn(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcResult;
    .locals 9
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;
        }
    .end annotation

    .line 127
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime$CallFunctionOnRequest;

    invoke-virtual {v0, p2, v1}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$CallFunctionOnRequest;

    .line 129
    .local v0, "args":Lcom/facebook/stetho/inspector/protocol/module/Runtime$CallFunctionOnRequest;
    invoke-static {p1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime;->getSession(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;

    move-result-object v1

    .line 130
    .local v1, "session":Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;
    iget-object v2, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$CallFunctionOnRequest;->objectId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->getObjectOrThrow(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    .line 136
    .local v2, "object":Ljava/lang/Object;
    iget-object v3, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$CallFunctionOnRequest;->functionDeclaration:Ljava/lang/String;

    const-string v4, "function protoList("

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_0

    .line 146
    new-instance v3, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectProtoContainer;

    invoke-direct {v3, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectProtoContainer;-><init>(Ljava/lang/Object;)V

    .line 147
    .local v3, "objectContainer":Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectProtoContainer;
    new-instance v5, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;

    invoke-direct {v5}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;-><init>()V

    .line 148
    .local v5, "result":Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;
    sget-object v6, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->OBJECT:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    iput-object v6, v5, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->type:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    .line 149
    sget-object v6, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->NODE:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    iput-object v6, v5, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->subtype:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    .line 150
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->className:Ljava/lang/String;

    .line 151
    invoke-static {v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime;->getPropertyClassName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->description:Ljava/lang/String;

    .line 152
    invoke-virtual {v1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->getObjects()Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    move-result-object v6

    invoke-virtual {v6, v3}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->putObject(Ljava/lang/Object;)I

    move-result v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->objectId:Ljava/lang/String;

    .line 154
    new-instance v6, Lcom/facebook/stetho/inspector/protocol/module/Runtime$CallFunctionOnResponse;

    invoke-direct {v6, v4}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$CallFunctionOnResponse;-><init>(Lcom/facebook/stetho/inspector/protocol/module/Runtime$1;)V

    .line 155
    .local v6, "response":Lcom/facebook/stetho/inspector/protocol/module/Runtime$CallFunctionOnResponse;
    iput-object v5, v6, Lcom/facebook/stetho/inspector/protocol/module/Runtime$CallFunctionOnResponse;->result:Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;

    .line 156
    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iput-object v4, v6, Lcom/facebook/stetho/inspector/protocol/module/Runtime$CallFunctionOnResponse;->wasThrown:Ljava/lang/Boolean;

    .line 158
    return-object v6

    .line 137
    .end local v3    # "objectContainer":Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectProtoContainer;
    .end local v5    # "result":Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;
    .end local v6    # "response":Lcom/facebook/stetho/inspector/protocol/module/Runtime$CallFunctionOnResponse;
    :cond_0
    new-instance v3, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;

    new-instance v5, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;

    sget-object v6, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;->INTERNAL_ERROR:Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Expected protoList, got: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$CallFunctionOnRequest;->functionDeclaration:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7, v4}, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;-><init>(Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;Ljava/lang/String;Lorg/json/JSONObject;)V

    invoke-direct {v3, v5}, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;-><init>(Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;)V

    throw v3
.end method

.method public evaluate(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcResult;
    .locals 2
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 163
    invoke-static {p1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime;->getSession(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime;->mReplFactory:Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;

    invoke-virtual {v0, v1, p2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->evaluate(Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;Lorg/json/JSONObject;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$EvaluateResponse;

    move-result-object v0

    return-object v0
.end method

.method public getProperties(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcResult;
    .locals 1
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;
        }
    .end annotation

    .line 168
    invoke-static {p1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime;->getSession(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->getProperties(Lorg/json/JSONObject;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$GetPropertiesResponse;

    move-result-object v0

    return-object v0
.end method

.method public releaseObject(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 115
    const-string v0, "objectId"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, "objectId":Ljava/lang/String;
    invoke-static {p1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime;->getSession(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;

    move-result-object v1

    invoke-virtual {v1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$Session;->getObjects()Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->removeObjectById(I)Ljava/lang/Object;

    .line 117
    return-void
.end method

.method public releaseObjectGroup(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Ignoring request to releaseObjectGroup: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/stetho/common/LogUtil;->w(Ljava/lang/String;)V

    .line 122
    return-void
.end method
