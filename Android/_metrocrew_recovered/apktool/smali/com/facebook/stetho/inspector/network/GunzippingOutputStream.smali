.class Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;
.super Ljava/io/FilterOutputStream;
.source "GunzippingOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/network/GunzippingOutputStream$GunzippingCallable;
    }
.end annotation


# static fields
.field private static final sExecutor:Ljava/util/concurrent/ExecutorService;


# instance fields
.field private final mCopyFuture:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;->sExecutor:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private constructor <init>(Ljava/io/OutputStream;Ljava/util/concurrent/Future;)V
    .locals 0
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/OutputStream;",
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Void;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 48
    .local p2, "copyFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Ljava/lang/Void;>;"
    invoke-direct {p0, p1}, Ljava/io/FilterOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 49
    iput-object p2, p0, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;->mCopyFuture:Ljava/util/concurrent/Future;

    .line 50
    return-void
.end method

.method public static create(Ljava/io/OutputStream;)Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;
    .locals 4
    .param p0, "finalOut"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 38
    new-instance v0, Ljava/io/PipedInputStream;

    invoke-direct {v0}, Ljava/io/PipedInputStream;-><init>()V

    .line 39
    .local v0, "pipeIn":Ljava/io/PipedInputStream;
    new-instance v1, Ljava/io/PipedOutputStream;

    invoke-direct {v1, v0}, Ljava/io/PipedOutputStream;-><init>(Ljava/io/PipedInputStream;)V

    .line 41
    .local v1, "pipeOut":Ljava/io/PipedOutputStream;
    sget-object v2, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;->sExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v3, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream$GunzippingCallable;

    invoke-direct {v3, v0, p0}, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream$GunzippingCallable;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v2

    .line 44
    .local v2, "copyFuture":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Ljava/lang/Void;>;"
    new-instance v3, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;

    invoke-direct {v3, v1, v2}, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;-><init>(Ljava/io/OutputStream;Ljava/util/concurrent/Future;)V

    return-object v3
.end method

.method private static getAndRethrow(Ljava/util/concurrent/Future;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Future<",
            "TT;>;)TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 72
    .local p0, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<TT;>;"
    nop

    :goto_0
    :try_start_0
    invoke-interface {p0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 75
    :catch_0
    move-exception v0

    .line 76
    .local v0, "e":Ljava/util/concurrent/ExecutionException;
    invoke-virtual {v0}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    .line 77
    .local v1, "cause":Ljava/lang/Throwable;
    const-class v2, Ljava/io/IOException;

    invoke-static {v1, v2}, Lcom/facebook/stetho/common/ExceptionUtil;->propagateIfInstanceOf(Ljava/lang/Throwable;Ljava/lang/Class;)V

    .line 78
    invoke-static {v1}, Lcom/facebook/stetho/common/ExceptionUtil;->propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    .end local v0    # "e":Ljava/util/concurrent/ExecutionException;
    .end local v1    # "cause":Ljava/lang/Throwable;
    goto :goto_1

    .line 73
    :catch_1
    move-exception v0

    .line 79
    :goto_1
    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    const/4 v0, 0x0

    .line 56
    .local v0, "success":Z
    :try_start_0
    invoke-super {p0}, Ljava/io/FilterOutputStream;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    const/4 v0, 0x1

    .line 60
    :try_start_1
    iget-object v1, p0, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;->mCopyFuture:Ljava/util/concurrent/Future;

    invoke-static {v1}, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;->getAndRethrow(Ljava/util/concurrent/Future;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 65
    goto :goto_0

    .line 61
    :catch_0
    move-exception v1

    .line 62
    .local v1, "e":Ljava/io/IOException;
    if-nez v0, :cond_0

    .line 66
    .end local v1    # "e":Ljava/io/IOException;
    nop

    .line 67
    :goto_0
    return-void

    .line 63
    .restart local v1    # "e":Ljava/io/IOException;
    :cond_0
    throw v1

    .line 59
    .end local v1    # "e":Ljava/io/IOException;
    :catchall_0
    move-exception v1

    .line 60
    :try_start_2
    iget-object v2, p0, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;->mCopyFuture:Ljava/util/concurrent/Future;

    invoke-static {v2}, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;->getAndRethrow(Ljava/util/concurrent/Future;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    .line 65
    goto :goto_1

    .line 61
    :catch_1
    move-exception v2

    .line 62
    .local v2, "e":Ljava/io/IOException;
    if-eqz v0, :cond_1

    .line 63
    throw v2

    .line 66
    .end local v2    # "e":Ljava/io/IOException;
    :cond_1
    :goto_1
    throw v1
.end method
