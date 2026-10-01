.class public Lcom/facebook/stetho/server/LocalSocketServer;
.super Ljava/lang/Object;
.source "LocalSocketServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/server/LocalSocketServer$WorkerThread;
    }
.end annotation


# static fields
.field private static final MAX_BIND_RETRIES:I = 0x2

.field private static final TIME_BETWEEN_BIND_RETRIES_MS:I = 0x3e8

.field private static final WORKER_THREAD_NAME_PREFIX:Ljava/lang/String; = "StethoWorker"


# instance fields
.field private final mAddress:Ljava/lang/String;

.field private final mFriendlyName:Ljava/lang/String;

.field private mListenerThread:Ljava/lang/Thread;

.field private mServerSocket:Landroid/net/LocalServerSocket;

.field private final mSocketHandler:Lcom/facebook/stetho/server/SocketHandler;

.field private mStopped:Z

.field private final mThreadId:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/stetho/server/SocketHandler;)V
    .locals 1
    .param p1, "friendlyName"    # Ljava/lang/String;
    .param p2, "address"    # Ljava/lang/String;
    .param p3, "socketHandler"    # Lcom/facebook/stetho/server/SocketHandler;

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mThreadId:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 47
    invoke-static {p1}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mFriendlyName:Ljava/lang/String;

    .line 48
    invoke-static {p2}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mAddress:Ljava/lang/String;

    .line 49
    iput-object p3, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mSocketHandler:Lcom/facebook/stetho/server/SocketHandler;

    .line 50
    return-void
.end method

.method private static bindToSocket(Ljava/lang/String;)Landroid/net/LocalServerSocket;
    .locals 5
    .param p0, "address"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 133
    const/4 v0, 0x2

    .line 134
    .local v0, "retries":I
    const/4 v1, 0x0

    .line 137
    .local v1, "firstException":Ljava/io/IOException;
    :goto_0
    const/4 v2, 0x3

    :try_start_0
    invoke-static {v2}, Lcom/facebook/stetho/common/LogUtil;->isLoggable(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 138
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Trying to bind to @"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/stetho/common/LogUtil;->d(Ljava/lang/String;)V

    .line 140
    :cond_0
    new-instance v2, Landroid/net/LocalServerSocket;

    invoke-direct {v2, p0}, Landroid/net/LocalServerSocket;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/BindException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 141
    :catch_0
    move-exception v2

    .line 142
    .local v2, "be":Ljava/net/BindException;
    const-string v3, "Binding error, sleep 1000 ms..."

    invoke-static {v2, v3}, Lcom/facebook/stetho/common/LogUtil;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 143
    if-nez v1, :cond_1

    .line 144
    move-object v1, v2

    .line 146
    :cond_1
    const-wide/16 v3, 0x3e8

    invoke-static {v3, v4}, Lcom/facebook/stetho/common/Util;->sleepUninterruptibly(J)V

    .line 148
    .end local v2    # "be":Ljava/net/BindException;
    add-int/lit8 v2, v0, -0x1

    .end local v0    # "retries":I
    .local v2, "retries":I
    if-lez v0, :cond_2

    move v0, v2

    goto :goto_0

    .line 150
    :cond_2
    throw v1
.end method

.method private listenOnAddress(Ljava/lang/String;)V
    .locals 4
    .param p1, "address"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 76
    invoke-static {p1}, Lcom/facebook/stetho/server/LocalSocketServer;->bindToSocket(Ljava/lang/String;)Landroid/net/LocalServerSocket;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mServerSocket:Landroid/net/LocalServerSocket;

    .line 77
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Listening on @"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/stetho/common/LogUtil;->i(Ljava/lang/String;)V

    .line 79
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-nez v0, :cond_1

    .line 83
    :try_start_0
    iget-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mServerSocket:Landroid/net/LocalServerSocket;

    invoke-virtual {v0}, Landroid/net/LocalServerSocket;->accept()Landroid/net/LocalSocket;

    move-result-object v0

    .line 86
    .local v0, "socket":Landroid/net/LocalSocket;
    new-instance v1, Lcom/facebook/stetho/server/LocalSocketServer$WorkerThread;

    iget-object v2, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mSocketHandler:Lcom/facebook/stetho/server/SocketHandler;

    invoke-direct {v1, v0, v2}, Lcom/facebook/stetho/server/LocalSocketServer$WorkerThread;-><init>(Landroid/net/LocalSocket;Lcom/facebook/stetho/server/SocketHandler;)V

    .line 87
    .local v1, "t":Ljava/lang/Thread;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "StethoWorker-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mFriendlyName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "-"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mThreadId:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 90
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 87
    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 91
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 92
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/InterruptedIOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v0    # "socket":Landroid/net/LocalSocket;
    .end local v1    # "t":Ljava/lang/Thread;
    goto :goto_1

    .line 101
    :catch_0
    move-exception v0

    .line 102
    .local v0, "e":Ljava/io/IOException;
    const-string v1, "I/O error initialising connection thread"

    invoke-static {v0, v1}, Lcom/facebook/stetho/common/LogUtil;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 103
    goto :goto_2

    .line 99
    .end local v0    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v0

    .line 100
    .local v0, "ex":Ljava/io/InterruptedIOException;
    goto :goto_2

    .line 93
    .end local v0    # "ex":Ljava/io/InterruptedIOException;
    :catch_2
    move-exception v0

    .line 95
    .local v0, "se":Ljava/net/SocketException;
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 96
    goto :goto_2

    .line 98
    :cond_0
    const-string v1, "I/O error"

    invoke-static {v0, v1}, Lcom/facebook/stetho/common/LogUtil;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 104
    .end local v0    # "se":Ljava/net/SocketException;
    :goto_1
    goto :goto_0

    .line 107
    :cond_1
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Server shutdown on @"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/stetho/common/LogUtil;->i(Ljava/lang/String;)V

    .line 108
    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mFriendlyName:Ljava/lang/String;

    return-object v0
.end method

.method public run()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 65
    monitor-enter p0

    .line 66
    :try_start_0
    iget-boolean v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mStopped:Z

    if-eqz v0, :cond_0

    .line 67
    monitor-exit p0

    return-void

    .line 69
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mListenerThread:Ljava/lang/Thread;

    .line 70
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    iget-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mAddress:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/facebook/stetho/server/LocalSocketServer;->listenOnAddress(Ljava/lang/String;)V

    .line 73
    return-void

    .line 70
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public stop()V
    .locals 1

    .line 114
    monitor-enter p0

    .line 115
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mStopped:Z

    .line 116
    iget-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mListenerThread:Ljava/lang/Thread;

    if-nez v0, :cond_0

    .line 117
    monitor-exit p0

    return-void

    .line 119
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    iget-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mListenerThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 123
    :try_start_1
    iget-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mServerSocket:Landroid/net/LocalServerSocket;

    if-eqz v0, :cond_1

    .line 124
    iget-object v0, p0, Lcom/facebook/stetho/server/LocalSocketServer;->mServerSocket:Landroid/net/LocalServerSocket;

    invoke-virtual {v0}, Landroid/net/LocalServerSocket;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 128
    :cond_1
    goto :goto_0

    .line 126
    :catch_0
    move-exception v0

    .line 129
    :goto_0
    return-void

    .line 119
    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method
