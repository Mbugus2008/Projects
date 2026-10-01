.class abstract Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;
.super Ljava/lang/Object;
.source "HandlerUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/common/android/HandlerUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "WaitableRunnable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field private mException:Ljava/lang/Exception;

.field private mIsDone:Z

.field private mValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 101
    .local p0, "this":Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;, "Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable<TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    return-void
.end method

.method private join()V
    .locals 1

    .line 137
    .local p0, "this":Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;, "Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable<TV;>;"
    monitor-enter p0

    .line 138
    :goto_0
    :try_start_0
    iget-boolean v0, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mIsDone:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 140
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 142
    :goto_1
    goto :goto_0

    .line 141
    :catch_0
    move-exception v0

    goto :goto_1

    .line 144
    :cond_0
    :try_start_2
    monitor-exit p0

    .line 145
    return-void

    .line 144
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method


# virtual methods
.method public invoke(Landroid/os/Handler;)Ljava/lang/Object;
    .locals 2
    .param p1, "handler"    # Landroid/os/Handler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Handler;",
            ")TV;"
        }
    .end annotation

    .line 123
    .local p0, "this":Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;, "Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable<TV;>;"
    invoke-virtual {p1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 127
    invoke-direct {p0}, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->join()V

    .line 129
    iget-object v0, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mException:Ljava/lang/Exception;

    if-nez v0, :cond_0

    .line 133
    iget-object v0, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mValue:Ljava/lang/Object;

    return-object v0

    .line 130
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    iget-object v1, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mException:Ljava/lang/Exception;

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v0

    .line 124
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Handler.post() returned false"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected abstract onRun()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation
.end method

.method public final run()V
    .locals 3

    .line 107
    .local p0, "this":Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;, "Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable<TV;>;"
    const/4 v0, 0x0

    const/4 v1, 0x1

    :try_start_0
    invoke-virtual {p0}, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->onRun()Ljava/lang/Object;

    move-result-object v2

    iput-object v2, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mValue:Ljava/lang/Object;

    .line 108
    iput-object v0, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mException:Ljava/lang/Exception;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 113
    monitor-enter p0

    .line 114
    :try_start_1
    iput-boolean v1, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mIsDone:Z

    .line 115
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 116
    monitor-exit p0

    .line 117
    :goto_0
    goto :goto_1

    .line 116
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 113
    :catchall_1
    move-exception v0

    goto :goto_2

    .line 109
    :catch_0
    move-exception v2

    .line 110
    .local v2, "e":Ljava/lang/Exception;
    :try_start_2
    iput-object v0, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mValue:Ljava/lang/Object;

    .line 111
    iput-object v2, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mException:Ljava/lang/Exception;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 113
    .end local v2    # "e":Ljava/lang/Exception;
    monitor-enter p0

    .line 114
    :try_start_3
    iput-boolean v1, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mIsDone:Z

    .line 115
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 116
    monitor-exit p0

    goto :goto_0

    .line 118
    :goto_1
    return-void

    .line 116
    :catchall_2
    move-exception v0

    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v0

    .line 113
    :goto_2
    monitor-enter p0

    .line 114
    :try_start_4
    iput-boolean v1, p0, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->mIsDone:Z

    .line 115
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 116
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 117
    throw v0

    .line 116
    :catchall_3
    move-exception v0

    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    throw v0
.end method
