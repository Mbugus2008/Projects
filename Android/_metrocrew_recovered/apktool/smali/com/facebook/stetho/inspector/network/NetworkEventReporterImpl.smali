.class public Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;
.super Ljava/lang/Object;
.source "NetworkEventReporterImpl.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/network/NetworkEventReporter;


# static fields
.field private static sInstance:Lcom/facebook/stetho/inspector/network/NetworkEventReporter;


# instance fields
.field private final mNextRequestId:Ljava/util/concurrent/atomic/AtomicInteger;

.field private mResourceTypeHelper:Lcom/facebook/stetho/inspector/network/ResourceTypeHelper;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->mNextRequestId:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 41
    return-void
.end method

.method private static convertFrame(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketFrame;)Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrame;
    .locals 2
    .param p0, "in"    # Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketFrame;

    .line 414
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrame;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrame;-><init>()V

    .line 415
    .local v0, "out":Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrame;
    invoke-interface {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketFrame;->opcode()I

    move-result v1

    iput v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrame;->opcode:I

    .line 416
    invoke-interface {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketFrame;->mask()Z

    move-result v1

    iput-boolean v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrame;->mask:Z

    .line 417
    invoke-interface {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketFrame;->payloadData()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrame;->payloadData:Ljava/lang/String;

    .line 418
    return-object v0
.end method

.method static createPrettyPrinterForResponse(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse;Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterRegistry;)Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;
    .locals 5
    .param p0, "response"    # Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse;
    .param p1, "registry"    # Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterRegistry;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 191
    if-eqz p1, :cond_1

    .line 192
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-interface {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse;->headerCount()I

    move-result v1

    .local v1, "count":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 193
    invoke-interface {p0, v0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse;->headerName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterRegistry;->lookup(Ljava/lang/String;)Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterFactory;

    move-result-object v2

    .line 194
    .local v2, "factory":Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterFactory;
    if-eqz v2, :cond_0

    .line 195
    nop

    .line 196
    invoke-interface {p0, v0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse;->headerName(I)Ljava/lang/String;

    move-result-object v3

    .line 197
    invoke-interface {p0, v0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse;->headerValue(I)Ljava/lang/String;

    move-result-object v4

    .line 195
    invoke-interface {v2, v3, v4}, Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterFactory;->getInstance(Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;

    move-result-object v3

    .line 198
    .local v3, "asyncPrettyPrinter":Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;
    return-object v3

    .line 192
    .end local v2    # "factory":Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterFactory;
    .end local v3    # "asyncPrettyPrinter":Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 202
    .end local v0    # "i":I
    .end local v1    # "count":I
    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private static determineResourceType(Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;Ljava/lang/String;Lcom/facebook/stetho/inspector/network/ResourceTypeHelper;)Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;
    .locals 1
    .param p0, "asyncPrettyPrinter"    # Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;
    .param p1, "contentType"    # Ljava/lang/String;
    .param p2, "resourceTypeHelper"    # Lcom/facebook/stetho/inspector/network/ResourceTypeHelper;

    .line 177
    if-eqz p0, :cond_0

    .line 178
    invoke-interface {p0}, Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;->getPrettifiedType()Lcom/facebook/stetho/inspector/network/PrettyPrinterDisplayType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/network/PrettyPrinterDisplayType;->getResourceType()Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    move-result-object v0

    return-object v0

    .line 180
    :cond_0
    if-eqz p1, :cond_1

    .line 181
    invoke-virtual {p2, p1}, Lcom/facebook/stetho/inspector/network/ResourceTypeHelper;->determineResourceType(Ljava/lang/String;)Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    move-result-object v0

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->OTHER:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    .line 180
    :goto_0
    return-object v0
.end method

.method private static formatHeadersAsJSON(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorHeaders;)Lorg/json/JSONObject;
    .locals 6
    .param p0, "headers"    # Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorHeaders;

    .line 434
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 435
    .local v0, "json":Lorg/json/JSONObject;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorHeaders;->headerCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 436
    invoke-interface {p0, v1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorHeaders;->headerName(I)Ljava/lang/String;

    move-result-object v2

    .line 437
    .local v2, "name":Ljava/lang/String;
    invoke-interface {p0, v1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorHeaders;->headerValue(I)Ljava/lang/String;

    move-result-object v3

    .line 439
    .local v3, "value":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 441
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    .line 443
    :cond_0
    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 447
    :goto_1
    nop

    .line 435
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 445
    .restart local v2    # "name":Ljava/lang/String;
    .restart local v3    # "value":Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 446
    .local v4, "e":Lorg/json/JSONException;
    new-instance v5, Ljava/lang/RuntimeException;

    invoke-direct {v5, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 449
    .end local v1    # "i":I
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    .end local v4    # "e":Lorg/json/JSONException;
    :cond_1
    return-object v0
.end method

.method public static declared-synchronized get()Lcom/facebook/stetho/inspector/network/NetworkEventReporter;
    .locals 2

    const-class v0, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;

    monitor-enter v0

    .line 48
    :try_start_0
    sget-object v1, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->sInstance:Lcom/facebook/stetho/inspector/network/NetworkEventReporter;

    if-nez v1, :cond_0

    .line 49
    new-instance v1, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;-><init>()V

    sput-object v1, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->sInstance:Lcom/facebook/stetho/inspector/network/NetworkEventReporter;

    .line 51
    :cond_0
    sget-object v1, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->sInstance:Lcom/facebook/stetho/inspector/network/NetworkEventReporter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 47
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private getContentType(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorHeaders;)Ljava/lang/String;
    .locals 1
    .param p1, "headers"    # Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorHeaders;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 326
    const-string v0, "Content-Type"

    invoke-interface {p1, v0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorHeaders;->firstHeaderValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getPeerManagerIfEnabled()Lcom/facebook/stetho/inspector/network/NetworkPeerManager;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 62
    invoke-static {}, Lcom/facebook/stetho/inspector/network/NetworkPeerManager;->getInstanceOrNull()Lcom/facebook/stetho/inspector/network/NetworkPeerManager;

    move-result-object v0

    .line 63
    .local v0, "peerManager":Lcom/facebook/stetho/inspector/network/NetworkPeerManager;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/network/NetworkPeerManager;->hasRegisteredPeers()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 64
    return-object v0

    .line 66
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method private getResourceTypeHelper()Lcom/facebook/stetho/inspector/network/ResourceTypeHelper;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 454
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->mResourceTypeHelper:Lcom/facebook/stetho/inspector/network/ResourceTypeHelper;

    if-nez v0, :cond_0

    .line 455
    new-instance v0, Lcom/facebook/stetho/inspector/network/ResourceTypeHelper;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/network/ResourceTypeHelper;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->mResourceTypeHelper:Lcom/facebook/stetho/inspector/network/ResourceTypeHelper;

    .line 457
    :cond_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->mResourceTypeHelper:Lcom/facebook/stetho/inspector/network/ResourceTypeHelper;

    return-object v0
.end method

.method private static initAsyncPrettyPrinterForResponse(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse;Lcom/facebook/stetho/inspector/network/NetworkPeerManager;)Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;
    .locals 4
    .param p0, "response"    # Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse;
    .param p1, "peerManager"    # Lcom/facebook/stetho/inspector/network/NetworkPeerManager;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 163
    invoke-virtual {p1}, Lcom/facebook/stetho/inspector/network/NetworkPeerManager;->getAsyncPrettyPrinterRegistry()Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterRegistry;

    move-result-object v0

    .line 164
    .local v0, "registry":Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterRegistry;
    invoke-static {p0, v0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->createPrettyPrinterForResponse(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse;Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterRegistry;)Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;

    move-result-object v1

    .line 165
    .local v1, "asyncPrettyPrinter":Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;
    if-eqz v1, :cond_0

    .line 166
    invoke-virtual {p1}, Lcom/facebook/stetho/inspector/network/NetworkPeerManager;->getResponseBodyFileManager()Lcom/facebook/stetho/inspector/network/ResponseBodyFileManager;

    move-result-object v2

    .line 167
    invoke-interface {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse;->requestId()Ljava/lang/String;

    move-result-object v3

    .line 166
    invoke-virtual {v2, v3, v1}, Lcom/facebook/stetho/inspector/network/ResponseBodyFileManager;->associateAsyncPrettyPrinterWithId(Ljava/lang/String;Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;)V

    .line 170
    :cond_0
    return-object v1
.end method

.method private loadingFailed(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "errorText"    # Ljava/lang/String;

    .line 279
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->getPeerManagerIfEnabled()Lcom/facebook/stetho/inspector/network/NetworkPeerManager;

    move-result-object v0

    .line 280
    .local v0, "peerManager":Lcom/facebook/stetho/inspector/network/NetworkPeerManager;
    if-eqz v0, :cond_0

    .line 281
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Network$LoadingFailedParams;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/protocol/module/Network$LoadingFailedParams;-><init>()V

    .line 282
    .local v1, "failedParams":Lcom/facebook/stetho/inspector/protocol/module/Network$LoadingFailedParams;
    iput-object p1, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$LoadingFailedParams;->requestId:Ljava/lang/String;

    .line 283
    invoke-static {}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->stethoNow()J

    move-result-wide v2

    long-to-double v2, v2

    const-wide v4, 0x408f400000000000L    # 1000.0

    div-double/2addr v2, v4

    iput-wide v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$LoadingFailedParams;->timestamp:D

    .line 284
    iput-object p2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$LoadingFailedParams;->errorText:Ljava/lang/String;

    .line 285
    sget-object v2, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->OTHER:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$LoadingFailedParams;->type:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    .line 286
    const-string v2, "Network.loadingFailed"

    invoke-virtual {v0, v2, v1}, Lcom/facebook/stetho/inspector/network/NetworkPeerManager;->sendNotificationToPeers(Ljava/lang/String;Ljava/lang/Object;)V

    .line 288
    .end local v1    # "failedParams":Lcom/facebook/stetho/inspector/protocol/module/Network$LoadingFailedParams;
    :cond_0
    return-void
.end method

.method private loadingFinished(Ljava/lang/String;)V
    .locals 6
    .param p1, "requestId"    # Ljava/lang/String;

    .line 264
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->getPeerManagerIfEnabled()Lcom/facebook/stetho/inspector/network/NetworkPeerManager;

    move-result-object v0

    .line 265
    .local v0, "peerManager":Lcom/facebook/stetho/inspector/network/NetworkPeerManager;
    if-eqz v0, :cond_0

    .line 266
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Network$LoadingFinishedParams;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/protocol/module/Network$LoadingFinishedParams;-><init>()V

    .line 267
    .local v1, "finishedParams":Lcom/facebook/stetho/inspector/protocol/module/Network$LoadingFinishedParams;
    iput-object p1, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$LoadingFinishedParams;->requestId:Ljava/lang/String;

    .line 268
    invoke-static {}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->stethoNow()J

    move-result-wide v2

    long-to-double v2, v2

    const-wide v4, 0x408f400000000000L    # 1000.0

    div-double/2addr v2, v4

    iput-wide v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$LoadingFinishedParams;->timestamp:D

    .line 269
    const-string v2, "Network.loadingFinished"

    invoke-virtual {v0, v2, v1}, Lcom/facebook/stetho/inspector/network/NetworkPeerManager;->sendNotificationToPeers(Ljava/lang/String;Ljava/lang/Object;)V

    .line 271
    .end local v1    # "finishedParams":Lcom/facebook/stetho/inspector/protocol/module/Network$LoadingFinishedParams;
    :cond_0
    return-void
.end method

.method private static readBodyAsString(Lcom/facebook/stetho/inspector/network/NetworkPeerManager;Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorRequest;)Ljava/lang/String;
    .locals 5
    .param p0, "peerManager"    # Lcom/facebook/stetho/inspector/network/NetworkPeerManager;
    .param p1, "request"    # Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorRequest;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 115
    :try_start_0
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorRequest;->body()[B

    move-result-object v0

    .line 116
    .local v0, "body":[B
    if-eqz v0, :cond_0

    .line 117
    new-instance v1, Ljava/lang/String;

    sget-object v2, Lcom/facebook/stetho/common/Utf8Charset;->INSTANCE:Ljava/nio/charset/Charset;

    invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 125
    .end local v0    # "body":[B
    :cond_0
    goto :goto_1

    .line 119
    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 120
    .local v0, "e":Ljava/lang/Throwable;
    :goto_0
    sget-object v1, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;->WARNING:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;

    sget-object v2, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->NETWORK:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not reproduce POST body: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {p0, v1, v2, v3}, Lcom/facebook/stetho/inspector/console/CLog;->writeToConsole(Lcom/facebook/stetho/inspector/helper/ChromePeerManager;Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;Ljava/lang/String;)V

    .line 126
    .end local v0    # "e":Ljava/lang/Throwable;
    :goto_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private static stethoNow()J
    .locals 2

    .line 461
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    return-wide v0
.end method


# virtual methods
.method public dataReceived(Ljava/lang/String;II)V
    .locals 6
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "dataLength"    # I
    .param p3, "encodedDataLength"    # I

    .line 306
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->getPeerManagerIfEnabled()Lcom/facebook/stetho/inspector/network/NetworkPeerManager;

    move-result-object v0

    .line 307
    .local v0, "peerManager":Lcom/facebook/stetho/inspector/network/NetworkPeerManager;
    if-eqz v0, :cond_0

    .line 308
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Network$DataReceivedParams;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/protocol/module/Network$DataReceivedParams;-><init>()V

    .line 309
    .local v1, "dataReceivedParams":Lcom/facebook/stetho/inspector/protocol/module/Network$DataReceivedParams;
    iput-object p1, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$DataReceivedParams;->requestId:Ljava/lang/String;

    .line 310
    invoke-static {}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->stethoNow()J

    move-result-wide v2

    long-to-double v2, v2

    const-wide v4, 0x408f400000000000L    # 1000.0

    div-double/2addr v2, v4

    iput-wide v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$DataReceivedParams;->timestamp:D

    .line 311
    iput p2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$DataReceivedParams;->dataLength:I

    .line 312
    iput p3, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$DataReceivedParams;->encodedDataLength:I

    .line 313
    const-string v2, "Network.dataReceived"

    invoke-virtual {v0, v2, v1}, Lcom/facebook/stetho/inspector/network/NetworkPeerManager;->sendNotificationToPeers(Ljava/lang/String;Ljava/lang/Object;)V

    .line 315
    .end local v1    # "dataReceivedParams":Lcom/facebook/stetho/inspector/protocol/module/Network$DataReceivedParams;
    :cond_0
    return-void
.end method

.method public dataSent(Ljava/lang/String;II)V
    .locals 0
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "dataLength"    # I
    .param p3, "encodedDataLength"    # I

    .line 298
    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->dataReceived(Ljava/lang/String;II)V

    .line 299
    return-void
.end method

.method public httpExchangeFailed(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "errorText"    # Ljava/lang/String;

    .line 255
    invoke-direct {p0, p1, p2}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->loadingFailed(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    return-void
.end method

.method public interpretResponseStream(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/InputStream;Lcom/facebook/stetho/inspector/network/ResponseHandler;)Ljava/io/InputStream;
    .locals 9
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "contentType"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "contentEncoding"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "availableInputStream"    # Ljava/io/InputStream;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "responseHandler"    # Lcom/facebook/stetho/inspector/network/ResponseHandler;

    .line 212
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->getPeerManagerIfEnabled()Lcom/facebook/stetho/inspector/network/NetworkPeerManager;

    move-result-object v1

    .line 213
    .local v1, "peerManager":Lcom/facebook/stetho/inspector/network/NetworkPeerManager;
    if-eqz v1, :cond_3

    .line 214
    const/4 v0, 0x0

    if-nez p4, :cond_0

    .line 215
    invoke-interface {p5}, Lcom/facebook/stetho/inspector/network/ResponseHandler;->onEOF()V

    .line 216
    return-object v0

    .line 218
    :cond_0
    if-eqz p2, :cond_1

    .line 220
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->getResourceTypeHelper()Lcom/facebook/stetho/inspector/network/ResourceTypeHelper;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/facebook/stetho/inspector/network/ResourceTypeHelper;->determineResourceType(Ljava/lang/String;)Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    move-result-object v0

    goto :goto_0

    :cond_1
    nop

    :goto_0
    move-object v7, v0

    .line 225
    .local v7, "resourceType":Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;
    const/4 v0, 0x0

    .line 226
    .local v0, "base64Encode":Z
    if-eqz v7, :cond_2

    sget-object v2, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->IMAGE:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    if-ne v7, v2, :cond_2

    .line 227
    const/4 v0, 0x1

    move v8, v0

    goto :goto_1

    .line 231
    :cond_2
    move v8, v0

    .end local v0    # "base64Encode":Z
    .local v8, "base64Encode":Z
    :goto_1
    nop

    .line 232
    :try_start_0
    invoke-virtual {v1}, Lcom/facebook/stetho/inspector/network/NetworkPeerManager;->getResponseBodyFileManager()Lcom/facebook/stetho/inspector/network/ResponseBodyFileManager;

    move-result-object v0

    invoke-virtual {v0, p1, v8}, Lcom/facebook/stetho/inspector/network/ResponseBodyFileManager;->openResponseBodyFile(Ljava/lang/String;Z)Ljava/io/OutputStream;

    move-result-object v4
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 235
    .local v4, "fileOutputStream":Ljava/io/OutputStream;
    move-object v2, p1

    move-object v5, p3

    move-object v3, p4

    move-object v6, p5

    .end local p1    # "requestId":Ljava/lang/String;
    .end local p3    # "contentEncoding":Ljava/lang/String;
    .end local p4    # "availableInputStream":Ljava/io/InputStream;
    .end local p5    # "responseHandler":Lcom/facebook/stetho/inspector/network/ResponseHandler;
    .local v2, "requestId":Ljava/lang/String;
    .local v3, "availableInputStream":Ljava/io/InputStream;
    .local v5, "contentEncoding":Ljava/lang/String;
    .local v6, "responseHandler":Lcom/facebook/stetho/inspector/network/ResponseHandler;
    :try_start_1
    invoke-static/range {v1 .. v6}, Lcom/facebook/stetho/inspector/network/DecompressionHelper;->teeInputWithDecompression(Lcom/facebook/stetho/inspector/network/NetworkPeerManager;Ljava/lang/String;Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/lang/String;Lcom/facebook/stetho/inspector/network/ResponseHandler;)Ljava/io/InputStream;

    move-result-object p1
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    return-object p1

    .line 242
    .end local v4    # "fileOutputStream":Ljava/io/OutputStream;
    :catch_0
    move-exception v0

    move-object p1, v0

    goto :goto_2

    .end local v2    # "requestId":Ljava/lang/String;
    .end local v3    # "availableInputStream":Ljava/io/InputStream;
    .end local v5    # "contentEncoding":Ljava/lang/String;
    .end local v6    # "responseHandler":Lcom/facebook/stetho/inspector/network/ResponseHandler;
    .restart local p1    # "requestId":Ljava/lang/String;
    .restart local p3    # "contentEncoding":Ljava/lang/String;
    .restart local p4    # "availableInputStream":Ljava/io/InputStream;
    .restart local p5    # "responseHandler":Lcom/facebook/stetho/inspector/network/ResponseHandler;
    :catch_1
    move-exception v0

    move-object v2, p1

    move-object v5, p3

    move-object v3, p4

    move-object v6, p5

    move-object p1, v0

    .line 243
    .end local p3    # "contentEncoding":Ljava/lang/String;
    .end local p4    # "availableInputStream":Ljava/io/InputStream;
    .end local p5    # "responseHandler":Lcom/facebook/stetho/inspector/network/ResponseHandler;
    .restart local v2    # "requestId":Ljava/lang/String;
    .restart local v3    # "availableInputStream":Ljava/io/InputStream;
    .restart local v5    # "contentEncoding":Ljava/lang/String;
    .restart local v6    # "responseHandler":Lcom/facebook/stetho/inspector/network/ResponseHandler;
    .local p1, "e":Ljava/io/IOException;
    :goto_2
    sget-object p3, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;->ERROR:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;

    sget-object p4, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->NETWORK:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    new-instance p5, Ljava/lang/StringBuilder;

    invoke-direct {p5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Error writing response body data for request #"

    invoke-virtual {p5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p5

    invoke-virtual {p5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p5

    invoke-virtual {p5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p5

    invoke-static {v1, p3, p4, p5}, Lcom/facebook/stetho/inspector/console/CLog;->writeToConsole(Lcom/facebook/stetho/inspector/helper/ChromePeerManager;Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;Ljava/lang/String;)V

    goto :goto_3

    .line 213
    .end local v2    # "requestId":Ljava/lang/String;
    .end local v3    # "availableInputStream":Ljava/io/InputStream;
    .end local v5    # "contentEncoding":Ljava/lang/String;
    .end local v6    # "responseHandler":Lcom/facebook/stetho/inspector/network/ResponseHandler;
    .end local v7    # "resourceType":Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;
    .end local v8    # "base64Encode":Z
    .local p1, "requestId":Ljava/lang/String;
    .restart local p3    # "contentEncoding":Ljava/lang/String;
    .restart local p4    # "availableInputStream":Ljava/io/InputStream;
    .restart local p5    # "responseHandler":Lcom/facebook/stetho/inspector/network/ResponseHandler;
    :cond_3
    move-object v2, p1

    move-object v5, p3

    move-object v3, p4

    move-object v6, p5

    .line 250
    .end local p1    # "requestId":Ljava/lang/String;
    .end local p3    # "contentEncoding":Ljava/lang/String;
    .end local p4    # "availableInputStream":Ljava/io/InputStream;
    .end local p5    # "responseHandler":Lcom/facebook/stetho/inspector/network/ResponseHandler;
    .restart local v2    # "requestId":Ljava/lang/String;
    .restart local v3    # "availableInputStream":Ljava/io/InputStream;
    .restart local v5    # "contentEncoding":Ljava/lang/String;
    .restart local v6    # "responseHandler":Lcom/facebook/stetho/inspector/network/ResponseHandler;
    :goto_3
    return-object v3
.end method

.method public isEnabled()Z
    .locals 2

    .line 56
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->getPeerManagerIfEnabled()Lcom/facebook/stetho/inspector/network/NetworkPeerManager;

    move-result-object v0

    .line 57
    .local v0, "peerManager":Lcom/facebook/stetho/inspector/network/NetworkPeerManager;
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public nextRequestId()Ljava/lang/String;
    .locals 1

    .line 319
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->mNextRequestId:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public requestWillBeSent(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorRequest;)V
    .locals 10
    .param p1, "request"    # Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorRequest;

    .line 71
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->getPeerManagerIfEnabled()Lcom/facebook/stetho/inspector/network/NetworkPeerManager;

    move-result-object v0

    .line 72
    .local v0, "peerManager":Lcom/facebook/stetho/inspector/network/NetworkPeerManager;
    if-eqz v0, :cond_1

    .line 73
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Network$Request;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/protocol/module/Network$Request;-><init>()V

    .line 74
    .local v1, "requestJSON":Lcom/facebook/stetho/inspector/protocol/module/Network$Request;
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorRequest;->url()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$Request;->url:Ljava/lang/String;

    .line 75
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorRequest;->method()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$Request;->method:Ljava/lang/String;

    .line 76
    invoke-static {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->formatHeadersAsJSON(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorHeaders;)Lorg/json/JSONObject;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$Request;->headers:Lorg/json/JSONObject;

    .line 77
    invoke-static {v0, p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->readBodyAsString(Lcom/facebook/stetho/inspector/network/NetworkPeerManager;Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorRequest;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$Request;->postData:Ljava/lang/String;

    .line 81
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorRequest;->friendlyName()Ljava/lang/String;

    move-result-object v2

    .line 82
    .local v2, "requestFriendlyName":Ljava/lang/String;
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorRequest;->friendlyNameExtra()Ljava/lang/Integer;

    move-result-object v3

    .line 83
    .local v3, "requestPriority":Ljava/lang/Integer;
    new-instance v4, Lcom/facebook/stetho/inspector/protocol/module/Network$Initiator;

    invoke-direct {v4}, Lcom/facebook/stetho/inspector/protocol/module/Network$Initiator;-><init>()V

    .line 84
    .local v4, "initiatorJSON":Lcom/facebook/stetho/inspector/protocol/module/Network$Initiator;
    sget-object v5, Lcom/facebook/stetho/inspector/protocol/module/Network$InitiatorType;->SCRIPT:Lcom/facebook/stetho/inspector/protocol/module/Network$InitiatorType;

    iput-object v5, v4, Lcom/facebook/stetho/inspector/protocol/module/Network$Initiator;->type:Lcom/facebook/stetho/inspector/protocol/module/Network$InitiatorType;

    .line 85
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, v4, Lcom/facebook/stetho/inspector/protocol/module/Network$Initiator;->stackTrace:Ljava/util/List;

    .line 86
    iget-object v5, v4, Lcom/facebook/stetho/inspector/protocol/module/Network$Initiator;->stackTrace:Ljava/util/List;

    new-instance v6, Lcom/facebook/stetho/inspector/protocol/module/Console$CallFrame;

    const/4 v7, 0x0

    if-eqz v3, :cond_0

    .line 88
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v8

    goto :goto_0

    :cond_0
    move v8, v7

    :goto_0
    invoke-direct {v6, v2, v2, v8, v7}, Lcom/facebook/stetho/inspector/protocol/module/Console$CallFrame;-><init>(Ljava/lang/String;Ljava/lang/String;II)V

    .line 86
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 91
    new-instance v5, Lcom/facebook/stetho/inspector/protocol/module/Network$RequestWillBeSentParams;

    invoke-direct {v5}, Lcom/facebook/stetho/inspector/protocol/module/Network$RequestWillBeSentParams;-><init>()V

    .line 92
    .local v5, "params":Lcom/facebook/stetho/inspector/protocol/module/Network$RequestWillBeSentParams;
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorRequest;->id()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/facebook/stetho/inspector/protocol/module/Network$RequestWillBeSentParams;->requestId:Ljava/lang/String;

    .line 93
    const-string v6, "1"

    iput-object v6, v5, Lcom/facebook/stetho/inspector/protocol/module/Network$RequestWillBeSentParams;->frameId:Ljava/lang/String;

    .line 94
    iput-object v6, v5, Lcom/facebook/stetho/inspector/protocol/module/Network$RequestWillBeSentParams;->loaderId:Ljava/lang/String;

    .line 95
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorRequest;->url()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/facebook/stetho/inspector/protocol/module/Network$RequestWillBeSentParams;->documentURL:Ljava/lang/String;

    .line 96
    iput-object v1, v5, Lcom/facebook/stetho/inspector/protocol/module/Network$RequestWillBeSentParams;->request:Lcom/facebook/stetho/inspector/protocol/module/Network$Request;

    .line 97
    invoke-static {}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->stethoNow()J

    move-result-wide v6

    long-to-double v6, v6

    const-wide v8, 0x408f400000000000L    # 1000.0

    div-double/2addr v6, v8

    iput-wide v6, v5, Lcom/facebook/stetho/inspector/protocol/module/Network$RequestWillBeSentParams;->timestamp:D

    .line 98
    iput-object v4, v5, Lcom/facebook/stetho/inspector/protocol/module/Network$RequestWillBeSentParams;->initiator:Lcom/facebook/stetho/inspector/protocol/module/Network$Initiator;

    .line 99
    const/4 v6, 0x0

    iput-object v6, v5, Lcom/facebook/stetho/inspector/protocol/module/Network$RequestWillBeSentParams;->redirectResponse:Lcom/facebook/stetho/inspector/protocol/module/Network$Response;

    .line 104
    sget-object v6, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->OTHER:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    iput-object v6, v5, Lcom/facebook/stetho/inspector/protocol/module/Network$RequestWillBeSentParams;->type:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    .line 106
    const-string v6, "Network.requestWillBeSent"

    invoke-virtual {v0, v6, v5}, Lcom/facebook/stetho/inspector/network/NetworkPeerManager;->sendNotificationToPeers(Ljava/lang/String;Ljava/lang/Object;)V

    .line 108
    .end local v1    # "requestJSON":Lcom/facebook/stetho/inspector/protocol/module/Network$Request;
    .end local v2    # "requestFriendlyName":Ljava/lang/String;
    .end local v3    # "requestPriority":Ljava/lang/Integer;
    .end local v4    # "initiatorJSON":Lcom/facebook/stetho/inspector/protocol/module/Network$Initiator;
    .end local v5    # "params":Lcom/facebook/stetho/inspector/protocol/module/Network$RequestWillBeSentParams;
    :cond_1
    return-void
.end method

.method public responseHeadersReceived(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse;)V
    .locals 8
    .param p1, "response"    # Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse;

    .line 131
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->getPeerManagerIfEnabled()Lcom/facebook/stetho/inspector/network/NetworkPeerManager;

    move-result-object v0

    .line 132
    .local v0, "peerManager":Lcom/facebook/stetho/inspector/network/NetworkPeerManager;
    if-eqz v0, :cond_1

    .line 133
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Network$Response;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/protocol/module/Network$Response;-><init>()V

    .line 134
    .local v1, "responseJSON":Lcom/facebook/stetho/inspector/protocol/module/Network$Response;
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse;->url()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$Response;->url:Ljava/lang/String;

    .line 135
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse;->statusCode()I

    move-result v2

    iput v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$Response;->status:I

    .line 136
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse;->reasonPhrase()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$Response;->statusText:Ljava/lang/String;

    .line 137
    invoke-static {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->formatHeadersAsJSON(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorHeaders;)Lorg/json/JSONObject;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$Response;->headers:Lorg/json/JSONObject;

    .line 138
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->getContentType(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorHeaders;)Ljava/lang/String;

    move-result-object v2

    .line 139
    .local v2, "contentType":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 140
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->getResourceTypeHelper()Lcom/facebook/stetho/inspector/network/ResourceTypeHelper;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/facebook/stetho/inspector/network/ResourceTypeHelper;->stripContentExtras(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :cond_0
    const-string v3, "application/octet-stream"

    :goto_0
    iput-object v3, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$Response;->mimeType:Ljava/lang/String;

    .line 142
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse;->connectionReused()Z

    move-result v3

    iput-boolean v3, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$Response;->connectionReused:Z

    .line 143
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse;->connectionId()I

    move-result v3

    iput v3, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$Response;->connectionId:I

    .line 144
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse;->fromDiskCache()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    iput-object v3, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$Response;->fromDiskCache:Ljava/lang/Boolean;

    .line 145
    new-instance v3, Lcom/facebook/stetho/inspector/protocol/module/Network$ResponseReceivedParams;

    invoke-direct {v3}, Lcom/facebook/stetho/inspector/protocol/module/Network$ResponseReceivedParams;-><init>()V

    .line 146
    .local v3, "receivedParams":Lcom/facebook/stetho/inspector/protocol/module/Network$ResponseReceivedParams;
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse;->requestId()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/facebook/stetho/inspector/protocol/module/Network$ResponseReceivedParams;->requestId:Ljava/lang/String;

    .line 147
    const-string v4, "1"

    iput-object v4, v3, Lcom/facebook/stetho/inspector/protocol/module/Network$ResponseReceivedParams;->frameId:Ljava/lang/String;

    .line 148
    iput-object v4, v3, Lcom/facebook/stetho/inspector/protocol/module/Network$ResponseReceivedParams;->loaderId:Ljava/lang/String;

    .line 149
    invoke-static {}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->stethoNow()J

    move-result-wide v4

    long-to-double v4, v4

    const-wide v6, 0x408f400000000000L    # 1000.0

    div-double/2addr v4, v6

    iput-wide v4, v3, Lcom/facebook/stetho/inspector/protocol/module/Network$ResponseReceivedParams;->timestamp:D

    .line 150
    iput-object v1, v3, Lcom/facebook/stetho/inspector/protocol/module/Network$ResponseReceivedParams;->response:Lcom/facebook/stetho/inspector/protocol/module/Network$Response;

    .line 151
    nop

    .line 152
    invoke-static {p1, v0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->initAsyncPrettyPrinterForResponse(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorResponse;Lcom/facebook/stetho/inspector/network/NetworkPeerManager;)Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;

    move-result-object v4

    .line 153
    .local v4, "asyncPrettyPrinter":Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;
    nop

    .line 154
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->getResourceTypeHelper()Lcom/facebook/stetho/inspector/network/ResourceTypeHelper;

    move-result-object v5

    invoke-static {v4, v2, v5}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->determineResourceType(Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;Ljava/lang/String;Lcom/facebook/stetho/inspector/network/ResourceTypeHelper;)Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    move-result-object v5

    iput-object v5, v3, Lcom/facebook/stetho/inspector/protocol/module/Network$ResponseReceivedParams;->type:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    .line 155
    const-string v5, "Network.responseReceived"

    invoke-virtual {v0, v5, v3}, Lcom/facebook/stetho/inspector/network/NetworkPeerManager;->sendNotificationToPeers(Ljava/lang/String;Ljava/lang/Object;)V

    .line 157
    .end local v1    # "responseJSON":Lcom/facebook/stetho/inspector/protocol/module/Network$Response;
    .end local v2    # "contentType":Ljava/lang/String;
    .end local v3    # "receivedParams":Lcom/facebook/stetho/inspector/protocol/module/Network$ResponseReceivedParams;
    .end local v4    # "asyncPrettyPrinter":Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;
    :cond_1
    return-void
.end method

.method public responseReadFailed(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "errorText"    # Ljava/lang/String;

    .line 275
    invoke-direct {p0, p1, p2}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->loadingFailed(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    return-void
.end method

.method public responseReadFinished(Ljava/lang/String;)V
    .locals 0
    .param p1, "requestId"    # Ljava/lang/String;

    .line 260
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->loadingFinished(Ljava/lang/String;)V

    .line 261
    return-void
.end method

.method public webSocketClosed(Ljava/lang/String;)V
    .locals 6
    .param p1, "requestId"    # Ljava/lang/String;

    .line 342
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->getPeerManagerIfEnabled()Lcom/facebook/stetho/inspector/network/NetworkPeerManager;

    move-result-object v0

    .line 343
    .local v0, "peerManager":Lcom/facebook/stetho/inspector/network/NetworkPeerManager;
    if-eqz v0, :cond_0

    .line 344
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketClosedParams;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketClosedParams;-><init>()V

    .line 345
    .local v1, "params":Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketClosedParams;
    iput-object p1, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketClosedParams;->requestId:Ljava/lang/String;

    .line 346
    invoke-static {}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->stethoNow()J

    move-result-wide v2

    long-to-double v2, v2

    const-wide v4, 0x408f400000000000L    # 1000.0

    div-double/2addr v2, v4

    iput-wide v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketClosedParams;->timestamp:D

    .line 347
    const-string v2, "Network.webSocketClosed"

    invoke-virtual {v0, v2, v1}, Lcom/facebook/stetho/inspector/network/NetworkPeerManager;->sendNotificationToPeers(Ljava/lang/String;Ljava/lang/Object;)V

    .line 349
    .end local v1    # "params":Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketClosedParams;
    :cond_0
    return-void
.end method

.method public webSocketCreated(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;

    .line 331
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->getPeerManagerIfEnabled()Lcom/facebook/stetho/inspector/network/NetworkPeerManager;

    move-result-object v0

    .line 332
    .local v0, "peerManager":Lcom/facebook/stetho/inspector/network/NetworkPeerManager;
    if-eqz v0, :cond_0

    .line 333
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketCreatedParams;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketCreatedParams;-><init>()V

    .line 334
    .local v1, "params":Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketCreatedParams;
    iput-object p1, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketCreatedParams;->requestId:Ljava/lang/String;

    .line 335
    iput-object p2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketCreatedParams;->url:Ljava/lang/String;

    .line 336
    const-string v2, "Network.webSocketCreated"

    invoke-virtual {v0, v2, v1}, Lcom/facebook/stetho/inspector/network/NetworkPeerManager;->sendNotificationToPeers(Ljava/lang/String;Ljava/lang/Object;)V

    .line 338
    .end local v1    # "params":Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketCreatedParams;
    :cond_0
    return-void
.end method

.method public webSocketFrameError(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "errorMessage"    # Ljava/lang/String;

    .line 423
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->getPeerManagerIfEnabled()Lcom/facebook/stetho/inspector/network/NetworkPeerManager;

    move-result-object v0

    .line 424
    .local v0, "peerManager":Lcom/facebook/stetho/inspector/network/NetworkPeerManager;
    if-eqz v0, :cond_0

    .line 425
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameErrorParams;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameErrorParams;-><init>()V

    .line 426
    .local v1, "params":Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameErrorParams;
    iput-object p1, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameErrorParams;->requestId:Ljava/lang/String;

    .line 427
    invoke-static {}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->stethoNow()J

    move-result-wide v2

    long-to-double v2, v2

    const-wide v4, 0x408f400000000000L    # 1000.0

    div-double/2addr v2, v4

    iput-wide v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameErrorParams;->timestamp:D

    .line 428
    iput-object p2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameErrorParams;->errorMessage:Ljava/lang/String;

    .line 429
    const-string v2, "Network.webSocketFrameError"

    invoke-virtual {v0, v2, v1}, Lcom/facebook/stetho/inspector/network/NetworkPeerManager;->sendNotificationToPeers(Ljava/lang/String;Ljava/lang/Object;)V

    .line 431
    .end local v1    # "params":Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameErrorParams;
    :cond_0
    return-void
.end method

.method public webSocketFrameReceived(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketFrame;)V
    .locals 6
    .param p1, "frame"    # Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketFrame;

    .line 403
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->getPeerManagerIfEnabled()Lcom/facebook/stetho/inspector/network/NetworkPeerManager;

    move-result-object v0

    .line 404
    .local v0, "peerManager":Lcom/facebook/stetho/inspector/network/NetworkPeerManager;
    if-eqz v0, :cond_0

    .line 405
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameReceivedParams;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameReceivedParams;-><init>()V

    .line 406
    .local v1, "params":Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameReceivedParams;
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketFrame;->requestId()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameReceivedParams;->requestId:Ljava/lang/String;

    .line 407
    invoke-static {}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->stethoNow()J

    move-result-wide v2

    long-to-double v2, v2

    const-wide v4, 0x408f400000000000L    # 1000.0

    div-double/2addr v2, v4

    iput-wide v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameReceivedParams;->timestamp:D

    .line 408
    invoke-static {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->convertFrame(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketFrame;)Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrame;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameReceivedParams;->response:Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrame;

    .line 409
    const-string v2, "Network.webSocketFrameReceived"

    invoke-virtual {v0, v2, v1}, Lcom/facebook/stetho/inspector/network/NetworkPeerManager;->sendNotificationToPeers(Ljava/lang/String;Ljava/lang/Object;)V

    .line 411
    .end local v1    # "params":Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameReceivedParams;
    :cond_0
    return-void
.end method

.method public webSocketFrameSent(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketFrame;)V
    .locals 6
    .param p1, "frame"    # Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketFrame;

    .line 391
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->getPeerManagerIfEnabled()Lcom/facebook/stetho/inspector/network/NetworkPeerManager;

    move-result-object v0

    .line 392
    .local v0, "peerManager":Lcom/facebook/stetho/inspector/network/NetworkPeerManager;
    if-eqz v0, :cond_0

    .line 393
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameSentParams;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameSentParams;-><init>()V

    .line 394
    .local v1, "params":Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameSentParams;
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketFrame;->requestId()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameSentParams;->requestId:Ljava/lang/String;

    .line 395
    invoke-static {}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->stethoNow()J

    move-result-wide v2

    long-to-double v2, v2

    const-wide v4, 0x408f400000000000L    # 1000.0

    div-double/2addr v2, v4

    iput-wide v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameSentParams;->timestamp:D

    .line 396
    invoke-static {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->convertFrame(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketFrame;)Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrame;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameSentParams;->response:Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrame;

    .line 397
    const-string v2, "Network.webSocketFrameSent"

    invoke-virtual {v0, v2, v1}, Lcom/facebook/stetho/inspector/network/NetworkPeerManager;->sendNotificationToPeers(Ljava/lang/String;Ljava/lang/Object;)V

    .line 399
    .end local v1    # "params":Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketFrameSentParams;
    :cond_0
    return-void
.end method

.method public webSocketHandshakeResponseReceived(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketResponse;)V
    .locals 6
    .param p1, "response"    # Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketResponse;

    .line 369
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->getPeerManagerIfEnabled()Lcom/facebook/stetho/inspector/network/NetworkPeerManager;

    move-result-object v0

    .line 370
    .local v0, "peerManager":Lcom/facebook/stetho/inspector/network/NetworkPeerManager;
    if-eqz v0, :cond_1

    .line 371
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketHandshakeResponseReceivedParams;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketHandshakeResponseReceivedParams;-><init>()V

    .line 373
    .local v1, "params":Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketHandshakeResponseReceivedParams;
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketResponse;->requestId()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketHandshakeResponseReceivedParams;->requestId:Ljava/lang/String;

    .line 374
    invoke-static {}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->stethoNow()J

    move-result-wide v2

    long-to-double v2, v2

    const-wide v4, 0x408f400000000000L    # 1000.0

    div-double/2addr v2, v4

    iput-wide v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketHandshakeResponseReceivedParams;->timestamp:D

    .line 375
    new-instance v2, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketResponse;

    invoke-direct {v2}, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketResponse;-><init>()V

    .line 376
    .local v2, "responseJSON":Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketResponse;
    invoke-static {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->formatHeadersAsJSON(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorHeaders;)Lorg/json/JSONObject;

    move-result-object v3

    iput-object v3, v2, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketResponse;->headers:Lorg/json/JSONObject;

    .line 377
    const/4 v3, 0x0

    iput-object v3, v2, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketResponse;->headersText:Ljava/lang/String;

    .line 378
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketResponse;->requestHeaders()Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorHeaders;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 379
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketResponse;->requestHeaders()Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorHeaders;

    move-result-object v4

    invoke-static {v4}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->formatHeadersAsJSON(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorHeaders;)Lorg/json/JSONObject;

    move-result-object v4

    iput-object v4, v2, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketResponse;->requestHeaders:Lorg/json/JSONObject;

    .line 380
    iput-object v3, v2, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketResponse;->requestHeadersText:Ljava/lang/String;

    .line 382
    :cond_0
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketResponse;->statusCode()I

    move-result v3

    iput v3, v2, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketResponse;->status:I

    .line 383
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketResponse;->reasonPhrase()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketResponse;->statusText:Ljava/lang/String;

    .line 384
    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketHandshakeResponseReceivedParams;->response:Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketResponse;

    .line 385
    const-string v3, "Network.webSocketHandshakeResponseReceived"

    invoke-virtual {v0, v3, v1}, Lcom/facebook/stetho/inspector/network/NetworkPeerManager;->sendNotificationToPeers(Ljava/lang/String;Ljava/lang/Object;)V

    .line 387
    .end local v1    # "params":Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketHandshakeResponseReceivedParams;
    .end local v2    # "responseJSON":Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketResponse;
    :cond_1
    return-void
.end method

.method public webSocketWillSendHandshakeRequest(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketRequest;)V
    .locals 6
    .param p1, "request"    # Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketRequest;

    .line 353
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->getPeerManagerIfEnabled()Lcom/facebook/stetho/inspector/network/NetworkPeerManager;

    move-result-object v0

    .line 354
    .local v0, "peerManager":Lcom/facebook/stetho/inspector/network/NetworkPeerManager;
    if-eqz v0, :cond_0

    .line 355
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketWillSendHandshakeRequestParams;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketWillSendHandshakeRequestParams;-><init>()V

    .line 357
    .local v1, "params":Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketWillSendHandshakeRequestParams;
    invoke-interface {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketRequest;->id()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketWillSendHandshakeRequestParams;->requestId:Ljava/lang/String;

    .line 358
    invoke-static {}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->stethoNow()J

    move-result-wide v2

    long-to-double v2, v2

    const-wide v4, 0x408f400000000000L    # 1000.0

    div-double/2addr v2, v4

    iput-wide v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketWillSendHandshakeRequestParams;->timestamp:D

    .line 359
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    long-to-double v2, v2

    div-double/2addr v2, v4

    iput-wide v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketWillSendHandshakeRequestParams;->wallTime:D

    .line 360
    new-instance v2, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketRequest;

    invoke-direct {v2}, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketRequest;-><init>()V

    .line 361
    .local v2, "requestJSON":Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketRequest;
    invoke-static {p1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporterImpl;->formatHeadersAsJSON(Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorHeaders;)Lorg/json/JSONObject;

    move-result-object v3

    iput-object v3, v2, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketRequest;->headers:Lorg/json/JSONObject;

    .line 362
    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketWillSendHandshakeRequestParams;->request:Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketRequest;

    .line 363
    const-string v3, "Network.webSocketWillSendHandshakeRequest"

    invoke-virtual {v0, v3, v1}, Lcom/facebook/stetho/inspector/network/NetworkPeerManager;->sendNotificationToPeers(Ljava/lang/String;Ljava/lang/Object;)V

    .line 365
    .end local v1    # "params":Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketWillSendHandshakeRequestParams;
    .end local v2    # "requestJSON":Lcom/facebook/stetho/inspector/protocol/module/Network$WebSocketRequest;
    :cond_0
    return-void
.end method
