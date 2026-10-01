.class public Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;
.super Ljava/lang/Object;
.source "ChromeDevtoolsServer.java"

# interfaces
.implements Lcom/facebook/stetho/websocket/SimpleEndpoint;


# static fields
.field public static final PATH:Ljava/lang/String; = "/inspector"

.field private static final TAG:Ljava/lang/String; = "ChromeDevtoolsServer"


# instance fields
.field private final mMethodDispatcher:Lcom/facebook/stetho/inspector/MethodDispatcher;

.field private final mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

.field private final mPeers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/facebook/stetho/websocket/SimpleSession;",
            "Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Iterable;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;",
            ">;)V"
        }
    .end annotation

    .line 50
    .local p1, "domainModules":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 47
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->mPeers:Ljava/util/Map;

    .line 51
    new-instance v0, Lcom/facebook/stetho/json/ObjectMapper;

    invoke-direct {v0}, Lcom/facebook/stetho/json/ObjectMapper;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    .line 52
    new-instance v0, Lcom/facebook/stetho/inspector/MethodDispatcher;

    iget-object v1, p0, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    invoke-direct {v0, v1, p1}, Lcom/facebook/stetho/inspector/MethodDispatcher;-><init>(Lcom/facebook/stetho/json/ObjectMapper;Ljava/lang/Iterable;)V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->mMethodDispatcher:Lcom/facebook/stetho/inspector/MethodDispatcher;

    .line 53
    return-void
.end method

.method private closeSafely(Lcom/facebook/stetho/websocket/SimpleSession;ILjava/lang/String;)V
    .locals 0
    .param p1, "session"    # Lcom/facebook/stetho/websocket/SimpleSession;
    .param p2, "code"    # I
    .param p3, "reasonPhrase"    # Ljava/lang/String;

    .line 101
    invoke-interface {p1, p2, p3}, Lcom/facebook/stetho/websocket/SimpleSession;->close(ILjava/lang/String;)V

    .line 102
    return-void
.end method

.method private handleRemoteMessage(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Ljava/lang/String;)V
    .locals 4
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/facebook/stetho/inspector/MessageHandlingException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .line 107
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 108
    .local v0, "messageNode":Lorg/json/JSONObject;
    const-string v1, "method"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 109
    invoke-direct {p0, p1, v0}, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->handleRemoteRequest(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V

    goto :goto_0

    .line 110
    :cond_0
    const-string v1, "result"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 111
    invoke-direct {p0, p1, v0}, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->handleRemoteResponse(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V

    .line 115
    :goto_0
    return-void

    .line 113
    :cond_1
    new-instance v1, Lcom/facebook/stetho/inspector/MessageHandlingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Improper JSON-RPC message: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/facebook/stetho/inspector/MessageHandlingException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private handleRemoteRequest(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .locals 9
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "requestNode"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/inspector/MessageHandlingException;
        }
    .end annotation

    .line 120
    iget-object v0, p0, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v1, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcRequest;

    invoke-virtual {v0, p2, v1}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcRequest;

    .line 124
    .local v0, "request":Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcRequest;
    const/4 v1, 0x0

    .line 125
    .local v1, "result":Lorg/json/JSONObject;
    const/4 v2, 0x0

    .line 127
    .local v2, "error":Lorg/json/JSONObject;
    :try_start_0
    iget-object v3, p0, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->mMethodDispatcher:Lcom/facebook/stetho/inspector/MethodDispatcher;

    iget-object v4, v0, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcRequest;->method:Ljava/lang/String;

    iget-object v5, v0, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcRequest;->params:Lorg/json/JSONObject;

    invoke-virtual {v3, p1, v4, v5}, Lcom/facebook/stetho/inspector/MethodDispatcher;->dispatch(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v3
    :try_end_0
    .catch Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v1, v3

    .line 133
    goto :goto_0

    .line 130
    :catch_0
    move-exception v3

    .line 131
    .local v3, "e":Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;
    invoke-static {v3}, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->logDispatchException(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;)V

    .line 132
    iget-object v4, p0, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    invoke-virtual {v3}, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;->getErrorMessage()Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;

    move-result-object v5

    const-class v6, Lorg/json/JSONObject;

    invoke-virtual {v4, v5, v6}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    move-object v2, v4

    check-cast v2, Lorg/json/JSONObject;

    .line 134
    .end local v3    # "e":Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;
    :goto_0
    iget-object v3, v0, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcRequest;->id:Ljava/lang/Long;

    if-eqz v3, :cond_0

    .line 135
    new-instance v3, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcResponse;

    invoke-direct {v3}, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcResponse;-><init>()V

    .line 136
    .local v3, "response":Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcResponse;
    iget-object v4, v0, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcRequest;->id:Ljava/lang/Long;

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iput-wide v4, v3, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcResponse;->id:J

    .line 137
    iput-object v1, v3, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcResponse;->result:Lorg/json/JSONObject;

    .line 138
    iput-object v2, v3, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcResponse;->error:Lorg/json/JSONObject;

    .line 139
    iget-object v4, p0, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v5, Lorg/json/JSONObject;

    invoke-virtual {v4, v3, v5}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/json/JSONObject;

    .line 142
    .local v4, "jsonObject":Lorg/json/JSONObject;
    :try_start_1
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5
    :try_end_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1

    .line 149
    .local v5, "responseString":Ljava/lang/String;
    goto :goto_1

    .line 143
    .end local v5    # "responseString":Ljava/lang/String;
    :catch_1
    move-exception v5

    .line 145
    .local v5, "e":Ljava/lang/OutOfMemoryError;
    const/4 v6, 0x0

    iput-object v6, v3, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcResponse;->result:Lorg/json/JSONObject;

    .line 146
    iget-object v6, p0, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    invoke-virtual {v5}, Ljava/lang/OutOfMemoryError;->getMessage()Ljava/lang/String;

    move-result-object v7

    const-class v8, Lorg/json/JSONObject;

    invoke-virtual {v6, v7, v8}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lorg/json/JSONObject;

    iput-object v6, v3, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcResponse;->error:Lorg/json/JSONObject;

    .line 147
    iget-object v6, p0, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v7, Lorg/json/JSONObject;

    invoke-virtual {v6, v3, v7}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    move-object v4, v6

    check-cast v4, Lorg/json/JSONObject;

    .line 148
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    move-object v5, v6

    .line 150
    .local v5, "responseString":Ljava/lang/String;
    :goto_1
    invoke-virtual {p1}, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;->getWebSocket()Lcom/facebook/stetho/websocket/SimpleSession;

    move-result-object v6

    invoke-interface {v6, v5}, Lcom/facebook/stetho/websocket/SimpleSession;->sendText(Ljava/lang/String;)V

    .line 152
    .end local v3    # "response":Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcResponse;
    .end local v4    # "jsonObject":Lorg/json/JSONObject;
    .end local v5    # "responseString":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private handleRemoteResponse(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .locals 5
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "responseNode"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/inspector/MismatchedResponseException;
        }
    .end annotation

    .line 167
    iget-object v0, p0, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v1, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcResponse;

    invoke-virtual {v0, p2, v1}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcResponse;

    .line 170
    .local v0, "response":Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcResponse;
    iget-wide v1, v0, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcResponse;->id:J

    invoke-virtual {p1, v1, v2}, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;->getAndRemovePendingRequest(J)Lcom/facebook/stetho/inspector/jsonrpc/PendingRequest;

    move-result-object v1

    .line 171
    .local v1, "pendingRequest":Lcom/facebook/stetho/inspector/jsonrpc/PendingRequest;
    if-eqz v1, :cond_1

    .line 174
    iget-object v2, v1, Lcom/facebook/stetho/inspector/jsonrpc/PendingRequest;->callback:Lcom/facebook/stetho/inspector/jsonrpc/PendingRequestCallback;

    if-eqz v2, :cond_0

    .line 175
    iget-object v2, v1, Lcom/facebook/stetho/inspector/jsonrpc/PendingRequest;->callback:Lcom/facebook/stetho/inspector/jsonrpc/PendingRequestCallback;

    invoke-interface {v2, p1, v0}, Lcom/facebook/stetho/inspector/jsonrpc/PendingRequestCallback;->onResponse(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcResponse;)V

    .line 177
    :cond_0
    return-void

    .line 172
    :cond_1
    new-instance v2, Lcom/facebook/stetho/inspector/MismatchedResponseException;

    iget-wide v3, v0, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcResponse;->id:J

    invoke-direct {v2, v3, v4}, Lcom/facebook/stetho/inspector/MismatchedResponseException;-><init>(J)V

    throw v2
.end method

.method private static logDispatchException(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;)V
    .locals 4
    .param p0, "e"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;

    .line 155
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;->getErrorMessage()Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;

    move-result-object v0

    .line 156
    .local v0, "errorMessage":Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;
    sget-object v1, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer$1;->$SwitchMap$com$facebook$stetho$inspector$jsonrpc$protocol$JsonRpcError$ErrorCode:[I

    iget-object v2, v0, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;->code:Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;

    invoke-virtual {v2}, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const-string v2, "ChromeDevtoolsServer"

    packed-switch v1, :pswitch_data_0

    .line 161
    const-string v1, "Error processing remote message"

    invoke-static {v2, v1, p0}, Lcom/facebook/stetho/common/LogRedirector;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 158
    :pswitch_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Method not implemented: "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, v0, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;->message:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/facebook/stetho/common/LogRedirector;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    nop

    .line 163
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public onClose(Lcom/facebook/stetho/websocket/SimpleSession;ILjava/lang/String;)V
    .locals 2
    .param p1, "session"    # Lcom/facebook/stetho/websocket/SimpleSession;
    .param p2, "code"    # I
    .param p3, "reasonPhrase"    # Ljava/lang/String;

    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onClose: reason="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ChromeDevtoolsServer"

    invoke-static {v1, v0}, Lcom/facebook/stetho/common/LogRedirector;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    iget-object v0, p0, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->mPeers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;

    .line 66
    .local v0, "peer":Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    if-eqz v0, :cond_0

    .line 67
    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;->invokeDisconnectReceivers()V

    .line 69
    :cond_0
    return-void
.end method

.method public onError(Lcom/facebook/stetho/websocket/SimpleSession;Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "session"    # Lcom/facebook/stetho/websocket/SimpleSession;
    .param p2, "ex"    # Ljava/lang/Throwable;

    .line 181
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onError: ex="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ChromeDevtoolsServer"

    invoke-static {v1, v0}, Lcom/facebook/stetho/common/LogRedirector;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    return-void
.end method

.method public onMessage(Lcom/facebook/stetho/websocket/SimpleSession;Ljava/lang/String;)V
    .locals 5
    .param p1, "session"    # Lcom/facebook/stetho/websocket/SimpleSession;
    .param p2, "message"    # Ljava/lang/String;

    .line 78
    const-string v0, "ChromeDevtoolsServer"

    const/4 v1, 0x2

    invoke-static {v0, v1}, Lcom/facebook/stetho/common/LogRedirector;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 79
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onMessage: message="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/facebook/stetho/common/LogRedirector;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    :cond_0
    const/16 v2, 0x3f3

    :try_start_0
    iget-object v3, p0, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->mPeers:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;

    .line 83
    .local v3, "peer":Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    invoke-static {v3}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 85
    invoke-direct {p0, v3, p2}, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->handleRemoteMessage(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/facebook/stetho/inspector/MessageHandlingException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v3    # "peer":Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    goto :goto_0

    .line 94
    :catch_0
    move-exception v1

    .line 95
    .local v1, "e":Lorg/json/JSONException;
    const-string v3, "Unexpected JSON exception processing message"

    invoke-static {v0, v3, v1}, Lcom/facebook/stetho/common/LogRedirector;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 96
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v2, v0}, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->closeSafely(Lcom/facebook/stetho/websocket/SimpleSession;ILjava/lang/String;)V

    goto :goto_1

    .line 91
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v1

    .line 92
    .local v1, "e":Lcom/facebook/stetho/inspector/MessageHandlingException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Message could not be processed by implementation: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/facebook/stetho/common/LogRedirector;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v2, v0}, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->closeSafely(Lcom/facebook/stetho/websocket/SimpleSession;ILjava/lang/String;)V

    .line 97
    .end local v1    # "e":Lcom/facebook/stetho/inspector/MessageHandlingException;
    :goto_0
    goto :goto_1

    .line 86
    :catch_2
    move-exception v3

    .line 87
    .local v3, "e":Ljava/io/IOException;
    invoke-static {v0, v1}, Lcom/facebook/stetho/common/LogRedirector;->isLoggable(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 88
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected I/O exception processing message: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/facebook/stetho/common/LogRedirector;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    :cond_1
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v2, v0}, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->closeSafely(Lcom/facebook/stetho/websocket/SimpleSession;ILjava/lang/String;)V

    .end local v3    # "e":Ljava/io/IOException;
    goto :goto_0

    .line 98
    :goto_1
    return-void
.end method

.method public onMessage(Lcom/facebook/stetho/websocket/SimpleSession;[BI)V
    .locals 2
    .param p1, "session"    # Lcom/facebook/stetho/websocket/SimpleSession;
    .param p2, "message"    # [B
    .param p3, "messageLen"    # I

    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Ignoring binary message of length "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ChromeDevtoolsServer"

    invoke-static {v1, v0}, Lcom/facebook/stetho/common/LogRedirector;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    return-void
.end method

.method public onOpen(Lcom/facebook/stetho/websocket/SimpleSession;)V
    .locals 3
    .param p1, "session"    # Lcom/facebook/stetho/websocket/SimpleSession;

    .line 57
    const-string v0, "ChromeDevtoolsServer"

    const-string v1, "onOpen"

    invoke-static {v0, v1}, Lcom/facebook/stetho/common/LogRedirector;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    iget-object v0, p0, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->mPeers:Ljava/util/Map;

    new-instance v1, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;

    iget-object v2, p0, Lcom/facebook/stetho/inspector/ChromeDevtoolsServer;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    invoke-direct {v1, v2, p1}, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;-><init>(Lcom/facebook/stetho/json/ObjectMapper;Lcom/facebook/stetho/websocket/SimpleSession;)V

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    return-void
.end method
