.class public Lcom/facebook/stetho/inspector/network/SimpleBinaryInspectorWebSocketFrame;
.super Ljava/lang/Object;
.source "SimpleBinaryInspectorWebSocketFrame.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/network/NetworkEventReporter$InspectorWebSocketFrame;


# instance fields
.field private final mPayload:[B

.field private final mRequestId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 0
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "payload"    # [B

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/facebook/stetho/inspector/network/SimpleBinaryInspectorWebSocketFrame;->mRequestId:Ljava/lang/String;

    .line 19
    iput-object p2, p0, Lcom/facebook/stetho/inspector/network/SimpleBinaryInspectorWebSocketFrame;->mPayload:[B

    .line 20
    return-void
.end method


# virtual methods
.method public mask()Z
    .locals 1

    .line 34
    const/4 v0, 0x0

    return v0
.end method

.method public opcode()I
    .locals 1

    .line 29
    const/4 v0, 0x2

    return v0
.end method

.method public payloadData()Ljava/lang/String;
    .locals 3

    .line 41
    :try_start_0
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/facebook/stetho/inspector/network/SimpleBinaryInspectorWebSocketFrame;->mPayload:[B

    const-string v2, "UTF-8"

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 42
    :catch_0
    move-exception v0

    .line 43
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public requestId()Ljava/lang/String;
    .locals 1

    .line 24
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/SimpleBinaryInspectorWebSocketFrame;->mRequestId:Ljava/lang/String;

    return-object v0
.end method
