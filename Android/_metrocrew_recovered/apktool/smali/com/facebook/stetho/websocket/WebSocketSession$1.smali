.class Lcom/facebook/stetho/websocket/WebSocketSession$1;
.super Ljava/lang/Object;
.source "WebSocketSession.java"

# interfaces
.implements Lcom/facebook/stetho/websocket/ReadCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/websocket/WebSocketSession;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/stetho/websocket/WebSocketSession;


# direct methods
.method constructor <init>(Lcom/facebook/stetho/websocket/WebSocketSession;)V
    .locals 0
    .param p1, "this$0"    # Lcom/facebook/stetho/websocket/WebSocketSession;

    .line 120
    iput-object p1, p0, Lcom/facebook/stetho/websocket/WebSocketSession$1;->this$0:Lcom/facebook/stetho/websocket/WebSocketSession;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private handleBinaryFrame([BI)V
    .locals 2
    .param p1, "payload"    # [B
    .param p2, "payloadLen"    # I

    .line 178
    iget-object v0, p0, Lcom/facebook/stetho/websocket/WebSocketSession$1;->this$0:Lcom/facebook/stetho/websocket/WebSocketSession;

    invoke-static {v0}, Lcom/facebook/stetho/websocket/WebSocketSession;->access$400(Lcom/facebook/stetho/websocket/WebSocketSession;)Lcom/facebook/stetho/websocket/SimpleEndpoint;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/stetho/websocket/WebSocketSession$1;->this$0:Lcom/facebook/stetho/websocket/WebSocketSession;

    invoke-interface {v0, v1, p1, p2}, Lcom/facebook/stetho/websocket/SimpleEndpoint;->onMessage(Lcom/facebook/stetho/websocket/SimpleSession;[BI)V

    .line 179
    return-void
.end method

.method private handleClose([BI)V
    .locals 5
    .param p1, "payload"    # [B
    .param p2, "payloadLen"    # I

    .line 149
    const/4 v0, 0x2

    if-lt p2, v0, :cond_1

    .line 150
    const/4 v1, 0x0

    aget-byte v1, p1, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    const/4 v2, 0x1

    aget-byte v2, p1, v2

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    .line 151
    .local v1, "closeCode":I
    if-le p2, v0, :cond_0

    new-instance v2, Ljava/lang/String;

    add-int/lit8 v3, p2, -0x2

    invoke-direct {v2, p1, v0, v3}, Ljava/lang/String;-><init>([BII)V

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .local v2, "closeReasonPhrase":Ljava/lang/String;
    :goto_0
    goto :goto_1

    .line 153
    .end local v1    # "closeCode":I
    .end local v2    # "closeReasonPhrase":Ljava/lang/String;
    :cond_1
    const/16 v1, 0x3ee

    .line 154
    .restart local v1    # "closeCode":I
    const-string v2, "Unparseable close frame"

    .line 158
    .restart local v2    # "closeReasonPhrase":Ljava/lang/String;
    :goto_1
    iget-object v0, p0, Lcom/facebook/stetho/websocket/WebSocketSession$1;->this$0:Lcom/facebook/stetho/websocket/WebSocketSession;

    invoke-static {v0}, Lcom/facebook/stetho/websocket/WebSocketSession;->access$100(Lcom/facebook/stetho/websocket/WebSocketSession;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 159
    iget-object v0, p0, Lcom/facebook/stetho/websocket/WebSocketSession$1;->this$0:Lcom/facebook/stetho/websocket/WebSocketSession;

    const/16 v3, 0x3e8

    const-string v4, "Received close frame"

    invoke-static {v0, v3, v4}, Lcom/facebook/stetho/websocket/WebSocketSession;->access$200(Lcom/facebook/stetho/websocket/WebSocketSession;ILjava/lang/String;)V

    .line 162
    :cond_2
    iget-object v0, p0, Lcom/facebook/stetho/websocket/WebSocketSession$1;->this$0:Lcom/facebook/stetho/websocket/WebSocketSession;

    invoke-virtual {v0, v1, v2}, Lcom/facebook/stetho/websocket/WebSocketSession;->markAndSignalClosed(ILjava/lang/String;)V

    .line 163
    return-void
.end method

.method private handlePing([BI)V
    .locals 2
    .param p1, "payload"    # [B
    .param p2, "payloadLen"    # I

    .line 166
    iget-object v0, p0, Lcom/facebook/stetho/websocket/WebSocketSession$1;->this$0:Lcom/facebook/stetho/websocket/WebSocketSession;

    invoke-static {p1, p2}, Lcom/facebook/stetho/websocket/FrameHelper;->createPongFrame([BI)Lcom/facebook/stetho/websocket/Frame;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/facebook/stetho/websocket/WebSocketSession;->access$300(Lcom/facebook/stetho/websocket/WebSocketSession;Lcom/facebook/stetho/websocket/Frame;)V

    .line 167
    return-void
.end method

.method private handlePong([BI)V
    .locals 0
    .param p1, "payload"    # [B
    .param p2, "payloadLen"    # I

    .line 171
    return-void
.end method

.method private handleTextFrame([BI)V
    .locals 4
    .param p1, "payload"    # [B
    .param p2, "payloadLen"    # I

    .line 174
    iget-object v0, p0, Lcom/facebook/stetho/websocket/WebSocketSession$1;->this$0:Lcom/facebook/stetho/websocket/WebSocketSession;

    invoke-static {v0}, Lcom/facebook/stetho/websocket/WebSocketSession;->access$400(Lcom/facebook/stetho/websocket/WebSocketSession;)Lcom/facebook/stetho/websocket/SimpleEndpoint;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/stetho/websocket/WebSocketSession$1;->this$0:Lcom/facebook/stetho/websocket/WebSocketSession;

    new-instance v2, Ljava/lang/String;

    const/4 v3, 0x0

    invoke-direct {v2, p1, v3, p2}, Ljava/lang/String;-><init>([BII)V

    invoke-interface {v0, v1, v2}, Lcom/facebook/stetho/websocket/SimpleEndpoint;->onMessage(Lcom/facebook/stetho/websocket/SimpleSession;Ljava/lang/String;)V

    .line 175
    return-void
.end method


# virtual methods
.method public onCompleteFrame(B[BI)V
    .locals 4
    .param p1, "opcode"    # B
    .param p2, "payload"    # [B
    .param p3, "payloadLen"    # I

    .line 123
    sparse-switch p1, :sswitch_data_0

    .line 140
    iget-object v0, p0, Lcom/facebook/stetho/websocket/WebSocketSession$1;->this$0:Lcom/facebook/stetho/websocket/WebSocketSession;

    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unsupported frame opcode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/facebook/stetho/websocket/WebSocketSession;->access$000(Lcom/facebook/stetho/websocket/WebSocketSession;Ljava/io/IOException;)V

    goto :goto_0

    .line 131
    :sswitch_0
    invoke-direct {p0, p2, p3}, Lcom/facebook/stetho/websocket/WebSocketSession$1;->handlePong([BI)V

    .line 132
    goto :goto_0

    .line 128
    :sswitch_1
    invoke-direct {p0, p2, p3}, Lcom/facebook/stetho/websocket/WebSocketSession$1;->handlePing([BI)V

    .line 129
    goto :goto_0

    .line 125
    :sswitch_2
    invoke-direct {p0, p2, p3}, Lcom/facebook/stetho/websocket/WebSocketSession$1;->handleClose([BI)V

    .line 126
    goto :goto_0

    .line 137
    :sswitch_3
    invoke-direct {p0, p2, p3}, Lcom/facebook/stetho/websocket/WebSocketSession$1;->handleBinaryFrame([BI)V

    .line 138
    goto :goto_0

    .line 134
    :sswitch_4
    invoke-direct {p0, p2, p3}, Lcom/facebook/stetho/websocket/WebSocketSession$1;->handleTextFrame([BI)V

    .line 135
    nop

    .line 143
    :goto_0
    return-void

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_4
        0x2 -> :sswitch_3
        0x8 -> :sswitch_2
        0x9 -> :sswitch_1
        0xa -> :sswitch_0
    .end sparse-switch
.end method
