.class public Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterRegistry;
.super Ljava/lang/Object;
.source "AsyncPrettyPrinterRegistry.java"


# instance fields
.field private final mRegistry:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterFactory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterRegistry;->mRegistry:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public declared-synchronized lookup(Ljava/lang/String;)Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterFactory;
    .locals 1
    .param p1, "headerName"    # Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    monitor-enter p0

    .line 28
    :try_start_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterRegistry;->mRegistry:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterFactory;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 28
    .end local p0    # "this":Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterRegistry;
    .end local p1    # "headerName":Ljava/lang/String;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized register(Ljava/lang/String;Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterFactory;)V
    .locals 1
    .param p1, "headerName"    # Ljava/lang/String;
    .param p2, "factory"    # Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterFactory;

    monitor-enter p0

    .line 23
    :try_start_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterRegistry;->mRegistry:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    monitor-exit p0

    return-void

    .line 22
    .end local p0    # "this":Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterRegistry;
    .end local p1    # "headerName":Ljava/lang/String;
    .end local p2    # "factory":Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterFactory;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized unregister(Ljava/lang/String;)Z
    .locals 1
    .param p1, "headerName"    # Ljava/lang/String;

    monitor-enter p0

    .line 32
    :try_start_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterRegistry;->mRegistry:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    .line 32
    .end local p0    # "this":Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterRegistry;
    .end local p1    # "headerName":Ljava/lang/String;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
