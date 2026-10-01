.class public Lcom/trimline/metrocrew/theader$Repository;
.super Ljava/lang/Object;
.source "theader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/theader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Repository"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/theader$Repository$InserttheaderAsyncTask;,
        Lcom/trimline/metrocrew/theader$Repository$UpdatetheaderAsyncTask;,
        Lcom/trimline/metrocrew/theader$Repository$DeletetheaderAsyncTask;,
        Lcom/trimline/metrocrew/theader$Repository$UpdateHeaderAsyncTask;
    }
.end annotation


# instance fields
.field private dao:Lcom/trimline/metrocrew/theader$dao;

.field private tdao:Lcom/trimline/metrocrew/transaction$dao;

.field public tranListLive:Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/theader;",
            ">;>;"
        }
    .end annotation
.end field

.field public tranListLive_todays:Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/theader;",
            ">;>;"
        }
    .end annotation
.end field

.field private transList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/app/Application;)V
    .locals 2
    .param p1, "application"    # Landroid/app/Application;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "application"
        }
    .end annotation

    .line 265
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 262
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    invoke-direct {v0}, Landroidx/lifecycle/MutableLiveData;-><init>()V

    iput-object v0, p0, Lcom/trimline/metrocrew/theader$Repository;->tranListLive:Landroidx/lifecycle/LiveData;

    .line 263
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    invoke-direct {v0}, Landroidx/lifecycle/MutableLiveData;-><init>()V

    iput-object v0, p0, Lcom/trimline/metrocrew/theader$Repository;->tranListLive_todays:Landroidx/lifecycle/LiveData;

    .line 266
    invoke-static {p1}, Lcom/trimline/metrocrew/DB;->getInstance(Landroid/content/Context;)Lcom/trimline/metrocrew/DB;

    move-result-object v0

    .line 267
    .local v0, "database":Lcom/trimline/metrocrew/DB;
    invoke-virtual {v0}, Lcom/trimline/metrocrew/DB;->thDao()Lcom/trimline/metrocrew/theader$dao;

    move-result-object v1

    iput-object v1, p0, Lcom/trimline/metrocrew/theader$Repository;->dao:Lcom/trimline/metrocrew/theader$dao;

    .line 268
    iget-object v1, p0, Lcom/trimline/metrocrew/theader$Repository;->dao:Lcom/trimline/metrocrew/theader$dao;

    invoke-virtual {v1}, Lcom/trimline/metrocrew/theader$dao;->loadAll()Landroidx/lifecycle/LiveData;

    move-result-object v1

    iput-object v1, p0, Lcom/trimline/metrocrew/theader$Repository;->tranListLive:Landroidx/lifecycle/LiveData;

    .line 269
    iget-object v1, p0, Lcom/trimline/metrocrew/theader$Repository;->dao:Lcom/trimline/metrocrew/theader$dao;

    invoke-virtual {v1}, Lcom/trimline/metrocrew/theader$dao;->loadtodays()Landroidx/lifecycle/LiveData;

    move-result-object v1

    iput-object v1, p0, Lcom/trimline/metrocrew/theader$Repository;->tranListLive_todays:Landroidx/lifecycle/LiveData;

    .line 270
    return-void
.end method

.method static synthetic access$400(Lcom/trimline/metrocrew/theader$Repository;)Lcom/trimline/metrocrew/theader$dao;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/theader$Repository;

    .line 258
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$Repository;->dao:Lcom/trimline/metrocrew/theader$dao;

    return-object v0
.end method


# virtual methods
.method public delete(Lcom/trimline/metrocrew/theader;)V
    .locals 3
    .param p1, "theader"    # Lcom/trimline/metrocrew/theader;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "theader"
        }
    .end annotation

    .line 292
    new-instance v0, Lcom/trimline/metrocrew/theader$Repository$DeletetheaderAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/theader$Repository;->dao:Lcom/trimline/metrocrew/theader$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/theader$Repository$DeletetheaderAsyncTask;-><init>(Lcom/trimline/metrocrew/theader$Repository;Lcom/trimline/metrocrew/theader$dao;Lcom/trimline/metrocrew/theader$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/theader;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/theader$Repository$DeletetheaderAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 293
    return-void
.end method

.method public findAll()Landroidx/lifecycle/LiveData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/theader;",
            ">;>;"
        }
    .end annotation

    .line 274
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$Repository;->tranListLive:Landroidx/lifecycle/LiveData;

    return-object v0
.end method

.method public findtodays()Landroidx/lifecycle/LiveData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/theader;",
            ">;>;"
        }
    .end annotation

    .line 277
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$Repository;->tranListLive_todays:Landroidx/lifecycle/LiveData;

    return-object v0
.end method

.method public insert(Lcom/trimline/metrocrew/theader;)V
    .locals 3
    .param p1, "theader"    # Lcom/trimline/metrocrew/theader;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "theader"
        }
    .end annotation

    .line 281
    nop

    .line 282
    new-instance v0, Lcom/trimline/metrocrew/theader$Repository$InserttheaderAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/theader$Repository;->dao:Lcom/trimline/metrocrew/theader$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, p1, v2}, Lcom/trimline/metrocrew/theader$Repository$InserttheaderAsyncTask;-><init>(Lcom/trimline/metrocrew/theader$Repository;Lcom/trimline/metrocrew/theader$dao;Lcom/trimline/metrocrew/theader;Lcom/trimline/metrocrew/theader$1;)V

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v2, 0x0

    new-array v2, v2, [Lcom/trimline/metrocrew/theader;

    invoke-virtual {v0, v1, v2}, Lcom/trimline/metrocrew/theader$Repository$InserttheaderAsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 285
    return-void
.end method

.method public update(Lcom/trimline/metrocrew/theader;)V
    .locals 3
    .param p1, "theader"    # Lcom/trimline/metrocrew/theader;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "theader"
        }
    .end annotation

    .line 288
    new-instance v0, Lcom/trimline/metrocrew/theader$Repository$UpdatetheaderAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/theader$Repository;->dao:Lcom/trimline/metrocrew/theader$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, p1, v2}, Lcom/trimline/metrocrew/theader$Repository$UpdatetheaderAsyncTask;-><init>(Lcom/trimline/metrocrew/theader$Repository;Lcom/trimline/metrocrew/theader$dao;Lcom/trimline/metrocrew/theader;Lcom/trimline/metrocrew/theader$1;)V

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v2, 0x0

    new-array v2, v2, [Lcom/trimline/metrocrew/theader;

    invoke-virtual {v0, v1, v2}, Lcom/trimline/metrocrew/theader$Repository$UpdatetheaderAsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 289
    return-void
.end method

.method public updateHeader(Lcom/trimline/metrocrew/theader;)V
    .locals 3
    .param p1, "theader"    # Lcom/trimline/metrocrew/theader;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "theader"
        }
    .end annotation

    .line 296
    new-instance v0, Lcom/trimline/metrocrew/theader$Repository$UpdateHeaderAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/theader$Repository;->dao:Lcom/trimline/metrocrew/theader$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/theader$Repository$UpdateHeaderAsyncTask;-><init>(Lcom/trimline/metrocrew/theader$Repository;Lcom/trimline/metrocrew/theader$dao;Lcom/trimline/metrocrew/theader$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/theader;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/theader$Repository$UpdateHeaderAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 297
    return-void
.end method
