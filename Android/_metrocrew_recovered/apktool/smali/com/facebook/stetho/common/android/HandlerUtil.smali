.class public final Lcom/facebook/stetho/common/android/HandlerUtil;
.super Ljava/lang/Object;
.source "HandlerUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    return-void
.end method

.method public static checkThreadAccess(Landroid/os/Handler;)Z
    .locals 2
    .param p0, "handler"    # Landroid/os/Handler;

    .line 26
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {p0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static postAndWait(Landroid/os/Handler;Lcom/facebook/stetho/common/UncheckedCallable;)Ljava/lang/Object;
    .locals 2
    .param p0, "handler"    # Landroid/os/Handler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/os/Handler;",
            "Lcom/facebook/stetho/common/UncheckedCallable<",
            "TV;>;)TV;"
        }
    .end annotation

    .line 50
    .local p1, "c":Lcom/facebook/stetho/common/UncheckedCallable;, "Lcom/facebook/stetho/common/UncheckedCallable<TV;>;"
    invoke-static {p0}, Lcom/facebook/stetho/common/android/HandlerUtil;->checkThreadAccess(Landroid/os/Handler;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 52
    :try_start_0
    invoke-interface {p1}, Lcom/facebook/stetho/common/UncheckedCallable;->call()Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 53
    :catch_0
    move-exception v0

    .line 54
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 58
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    new-instance v0, Lcom/facebook/stetho/common/android/HandlerUtil$1;

    invoke-direct {v0, p1}, Lcom/facebook/stetho/common/android/HandlerUtil$1;-><init>(Lcom/facebook/stetho/common/UncheckedCallable;)V

    .line 65
    .local v0, "wrapper":Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;, "Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable<TV;>;"
    invoke-virtual {v0, p0}, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->invoke(Landroid/os/Handler;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public static postAndWait(Landroid/os/Handler;Ljava/lang/Runnable;)V
    .locals 2
    .param p0, "handler"    # Landroid/os/Handler;
    .param p1, "r"    # Ljava/lang/Runnable;

    .line 76
    invoke-static {p0}, Lcom/facebook/stetho/common/android/HandlerUtil;->checkThreadAccess(Landroid/os/Handler;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 78
    :try_start_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    return-void

    .line 80
    :catch_0
    move-exception v0

    .line 81
    .local v0, "e":Ljava/lang/RuntimeException;
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 85
    .end local v0    # "e":Ljava/lang/RuntimeException;
    :cond_0
    new-instance v0, Lcom/facebook/stetho/common/android/HandlerUtil$2;

    invoke-direct {v0, p1}, Lcom/facebook/stetho/common/android/HandlerUtil$2;-><init>(Ljava/lang/Runnable;)V

    .line 93
    .local v0, "wrapper":Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;, "Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable<Ljava/lang/Void;>;"
    invoke-virtual {v0, p0}, Lcom/facebook/stetho/common/android/HandlerUtil$WaitableRunnable;->invoke(Landroid/os/Handler;)Ljava/lang/Object;

    .line 94
    return-void
.end method

.method public static verifyThreadAccess(Landroid/os/Handler;)V
    .locals 1
    .param p0, "handler"    # Landroid/os/Handler;

    .line 36
    invoke-static {p0}, Lcom/facebook/stetho/common/android/HandlerUtil;->checkThreadAccess(Landroid/os/Handler;)Z

    move-result v0

    invoke-static {v0}, Lcom/facebook/stetho/common/Util;->throwIfNot(Z)V

    .line 37
    return-void
.end method
