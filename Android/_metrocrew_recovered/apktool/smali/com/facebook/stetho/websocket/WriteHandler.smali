.class Lcom/facebook/stetho/websocket/WriteHandler;
.super Ljava/lang/Object;
.source "WriteHandler.java"


# instance fields
.field private final mBufferedOutput:Ljava/io/BufferedOutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 2
    .param p1, "rawSocketOutput"    # Ljava/io/OutputStream;

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    new-instance v0, Ljava/io/BufferedOutputStream;

    const/16 v1, 0x400

    invoke-direct {v0, p1, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V

    iput-object v0, p0, Lcom/facebook/stetho/websocket/WriteHandler;->mBufferedOutput:Ljava/io/BufferedOutputStream;

    .line 22
    return-void
.end method


# virtual methods
.method public declared-synchronized write(Lcom/facebook/stetho/websocket/Frame;Lcom/facebook/stetho/websocket/WriteCallback;)V
    .locals 1
    .param p1, "frame"    # Lcom/facebook/stetho/websocket/Frame;
    .param p2, "callback"    # Lcom/facebook/stetho/websocket/WriteCallback;

    monitor-enter p0

    .line 26
    :try_start_0
    iget-object v0, p0, Lcom/facebook/stetho/websocket/WriteHandler;->mBufferedOutput:Ljava/io/BufferedOutputStream;

    invoke-virtual {p1, v0}, Lcom/facebook/stetho/websocket/Frame;->writeTo(Ljava/io/BufferedOutputStream;)V

    .line 27
    iget-object v0, p0, Lcom/facebook/stetho/websocket/WriteHandler;->mBufferedOutput:Ljava/io/BufferedOutputStream;

    invoke-virtual {v0}, Ljava/io/BufferedOutputStream;->flush()V

    .line 28
    invoke-interface {p2}, Lcom/facebook/stetho/websocket/WriteCallback;->onSuccess()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    goto :goto_0

    .line 25
    .end local p0    # "this":Lcom/facebook/stetho/websocket/WriteHandler;
    .end local p1    # "frame":Lcom/facebook/stetho/websocket/Frame;
    .end local p2    # "callback":Lcom/facebook/stetho/websocket/WriteCallback;
    :catchall_0
    move-exception p1

    goto :goto_1

    .line 29
    .restart local p1    # "frame":Lcom/facebook/stetho/websocket/Frame;
    .restart local p2    # "callback":Lcom/facebook/stetho/websocket/WriteCallback;
    :catch_0
    move-exception v0

    .line 30
    .local v0, "e":Ljava/io/IOException;
    :try_start_1
    invoke-interface {p2, v0}, Lcom/facebook/stetho/websocket/WriteCallback;->onFailure(Ljava/io/IOException;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    monitor-exit p0

    return-void

    .line 25
    .end local p1    # "frame":Lcom/facebook/stetho/websocket/Frame;
    .end local p2    # "callback":Lcom/facebook/stetho/websocket/WriteCallback;
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method
