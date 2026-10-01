.class public Lcom/facebook/stetho/server/http/HandlerRegistry;
.super Ljava/lang/Object;
.source "HandlerRegistry.java"


# instance fields
.field private final mHttpHandlers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/facebook/stetho/server/http/HttpHandler;",
            ">;"
        }
    .end annotation
.end field

.field private final mPathMatchers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/facebook/stetho/server/http/PathMatcher;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/server/http/HandlerRegistry;->mPathMatchers:Ljava/util/ArrayList;

    .line 16
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/server/http/HandlerRegistry;->mHttpHandlers:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public declared-synchronized lookup(Ljava/lang/String;)Lcom/facebook/stetho/server/http/HttpHandler;
    .locals 3
    .param p1, "path"    # Ljava/lang/String;

    monitor-enter p0

    .line 37
    const/4 v0, 0x0

    .local v0, "i":I
    :try_start_0
    iget-object v1, p0, Lcom/facebook/stetho/server/http/HandlerRegistry;->mPathMatchers:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    .local v1, "N":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 38
    iget-object v2, p0, Lcom/facebook/stetho/server/http/HandlerRegistry;->mPathMatchers:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/stetho/server/http/PathMatcher;

    invoke-interface {v2, p1}, Lcom/facebook/stetho/server/http/PathMatcher;->match(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 39
    iget-object v2, p0, Lcom/facebook/stetho/server/http/HandlerRegistry;->mHttpHandlers:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/stetho/server/http/HttpHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v2

    .line 37
    .end local p0    # "this":Lcom/facebook/stetho/server/http/HandlerRegistry;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 42
    .end local v0    # "i":I
    .end local v1    # "N":I
    :cond_1
    monitor-exit p0

    const/4 v0, 0x0

    return-object v0

    .line 36
    .end local p1    # "path":Ljava/lang/String;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized register(Lcom/facebook/stetho/server/http/PathMatcher;Lcom/facebook/stetho/server/http/HttpHandler;)V
    .locals 1
    .param p1, "path"    # Lcom/facebook/stetho/server/http/PathMatcher;
    .param p2, "handler"    # Lcom/facebook/stetho/server/http/HttpHandler;

    monitor-enter p0

    .line 19
    :try_start_0
    iget-object v0, p0, Lcom/facebook/stetho/server/http/HandlerRegistry;->mPathMatchers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    iget-object v0, p0, Lcom/facebook/stetho/server/http/HandlerRegistry;->mHttpHandlers:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    monitor-exit p0

    return-void

    .line 18
    .end local p0    # "this":Lcom/facebook/stetho/server/http/HandlerRegistry;
    .end local p1    # "path":Lcom/facebook/stetho/server/http/PathMatcher;
    .end local p2    # "handler":Lcom/facebook/stetho/server/http/HttpHandler;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized unregister(Lcom/facebook/stetho/server/http/PathMatcher;Lcom/facebook/stetho/server/http/HttpHandler;)Z
    .locals 2
    .param p1, "path"    # Lcom/facebook/stetho/server/http/PathMatcher;
    .param p2, "handler"    # Lcom/facebook/stetho/server/http/HttpHandler;

    monitor-enter p0

    .line 24
    :try_start_0
    iget-object v0, p0, Lcom/facebook/stetho/server/http/HandlerRegistry;->mPathMatchers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 25
    .local v0, "index":I
    if-ltz v0, :cond_0

    .line 26
    iget-object v1, p0, Lcom/facebook/stetho/server/http/HandlerRegistry;->mHttpHandlers:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-ne p2, v1, :cond_0

    .line 27
    iget-object v1, p0, Lcom/facebook/stetho/server/http/HandlerRegistry;->mPathMatchers:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 28
    iget-object v1, p0, Lcom/facebook/stetho/server/http/HandlerRegistry;->mHttpHandlers:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    monitor-exit p0

    const/4 v1, 0x1

    return v1

    .line 32
    .end local p0    # "this":Lcom/facebook/stetho/server/http/HandlerRegistry;
    :cond_0
    monitor-exit p0

    const/4 v1, 0x0

    return v1

    .line 23
    .end local v0    # "index":I
    .end local p1    # "path":Lcom/facebook/stetho/server/http/PathMatcher;
    .end local p2    # "handler":Lcom/facebook/stetho/server/http/HttpHandler;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
