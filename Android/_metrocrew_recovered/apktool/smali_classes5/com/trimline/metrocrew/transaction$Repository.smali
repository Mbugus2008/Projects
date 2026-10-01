.class public Lcom/trimline/metrocrew/transaction$Repository;
.super Ljava/lang/Object;
.source "transaction.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/transaction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Repository"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/transaction$Repository$FetchtransactionAsyncTask;,
        Lcom/trimline/metrocrew/transaction$Repository$InserttransactionAsyncTask;,
        Lcom/trimline/metrocrew/transaction$Repository$InserttransactionsAsyncTask;,
        Lcom/trimline/metrocrew/transaction$Repository$UpdatetransactionAsyncTask;,
        Lcom/trimline/metrocrew/transaction$Repository$DeletetransactionAsyncTask;
    }
.end annotation


# instance fields
.field private dao:Lcom/trimline/metrocrew/transaction$dao;

.field public tranlineLive:Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;>;"
        }
    .end annotation
.end field

.field private transactionList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;"
        }
    .end annotation
.end field

.field private transactionListLive:Landroidx/lifecycle/MutableLiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/MutableLiveData<",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;>;"
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

    .line 174
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 171
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    invoke-direct {v0}, Landroidx/lifecycle/MutableLiveData;-><init>()V

    iput-object v0, p0, Lcom/trimline/metrocrew/transaction$Repository;->transactionListLive:Landroidx/lifecycle/MutableLiveData;

    .line 172
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    invoke-direct {v0}, Landroidx/lifecycle/MutableLiveData;-><init>()V

    iput-object v0, p0, Lcom/trimline/metrocrew/transaction$Repository;->tranlineLive:Landroidx/lifecycle/LiveData;

    .line 175
    invoke-static {p1}, Lcom/trimline/metrocrew/DB;->getInstance(Landroid/content/Context;)Lcom/trimline/metrocrew/DB;

    move-result-object v0

    .line 176
    .local v0, "database":Lcom/trimline/metrocrew/DB;
    invoke-virtual {v0}, Lcom/trimline/metrocrew/DB;->tdao()Lcom/trimline/metrocrew/transaction$dao;

    move-result-object v1

    iput-object v1, p0, Lcom/trimline/metrocrew/transaction$Repository;->dao:Lcom/trimline/metrocrew/transaction$dao;

    .line 177
    iget-object v1, p0, Lcom/trimline/metrocrew/transaction$Repository;->dao:Lcom/trimline/metrocrew/transaction$dao;

    invoke-virtual {v1}, Lcom/trimline/metrocrew/transaction$dao;->load()Landroidx/lifecycle/LiveData;

    move-result-object v1

    iput-object v1, p0, Lcom/trimline/metrocrew/transaction$Repository;->tranlineLive:Landroidx/lifecycle/LiveData;

    .line 178
    return-void
.end method

.method static synthetic access$500(Lcom/trimline/metrocrew/transaction$Repository;Ljava/util/List;)V
    .locals 0
    .param p0, "x0"    # Lcom/trimline/metrocrew/transaction$Repository;
    .param p1, "x1"    # Ljava/util/List;

    .line 167
    invoke-direct {p0, p1}, Lcom/trimline/metrocrew/transaction$Repository;->asyncFinished(Ljava/util/List;)V

    return-void
.end method

.method private asyncFinished(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "results"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;)V"
        }
    .end annotation

    .line 185
    .local p1, "results":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    iput-object p1, p0, Lcom/trimline/metrocrew/transaction$Repository;->transactionList:Ljava/util/List;

    .line 186
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$Repository;->transactionListLive:Landroidx/lifecycle/MutableLiveData;

    invoke-virtual {v0, p1}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    .line 187
    return-void
.end method


# virtual methods
.method public delete(Lcom/trimline/metrocrew/transaction;)V
    .locals 3
    .param p1, "transaction"    # Lcom/trimline/metrocrew/transaction;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "transaction"
        }
    .end annotation

    .line 209
    new-instance v0, Lcom/trimline/metrocrew/transaction$Repository$DeletetransactionAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/transaction$Repository;->dao:Lcom/trimline/metrocrew/transaction$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/transaction$Repository$DeletetransactionAsyncTask;-><init>(Lcom/trimline/metrocrew/transaction$Repository;Lcom/trimline/metrocrew/transaction$dao;Lcom/trimline/metrocrew/transaction$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/transaction;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/transaction$Repository$DeletetransactionAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 210
    return-void
.end method

.method public findAll()V
    .locals 3

    .line 193
    new-instance v0, Lcom/trimline/metrocrew/transaction$Repository$FetchtransactionAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/transaction$Repository;->dao:Lcom/trimline/metrocrew/transaction$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/transaction$Repository$FetchtransactionAsyncTask;-><init>(Lcom/trimline/metrocrew/transaction$Repository;Lcom/trimline/metrocrew/transaction$dao;Lcom/trimline/metrocrew/transaction$1;)V

    .line 194
    .local v0, "task":Lcom/trimline/metrocrew/transaction$Repository$FetchtransactionAsyncTask;
    iput-object p0, v0, Lcom/trimline/metrocrew/transaction$Repository$FetchtransactionAsyncTask;->repository:Lcom/trimline/metrocrew/transaction$Repository;

    .line 195
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/transaction$Repository$FetchtransactionAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 196
    return-void
.end method

.method public getTransactionList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;"
        }
    .end annotation

    .line 213
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$Repository;->transactionList:Ljava/util/List;

    return-object v0
.end method

.method public getTransactionListLive()Landroidx/lifecycle/MutableLiveData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/MutableLiveData<",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;>;"
        }
    .end annotation

    .line 181
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$Repository;->transactionListLive:Landroidx/lifecycle/MutableLiveData;

    return-object v0
.end method

.method public getall()Landroidx/lifecycle/LiveData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;>;"
        }
    .end annotation

    .line 189
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$Repository;->tranlineLive:Landroidx/lifecycle/LiveData;

    return-object v0
.end method

.method public insert(Lcom/trimline/metrocrew/transaction;)V
    .locals 3
    .param p1, "transaction"    # Lcom/trimline/metrocrew/transaction;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "transaction"
        }
    .end annotation

    .line 199
    new-instance v0, Lcom/trimline/metrocrew/transaction$Repository$InserttransactionAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/transaction$Repository;->dao:Lcom/trimline/metrocrew/transaction$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, p1, v2}, Lcom/trimline/metrocrew/transaction$Repository$InserttransactionAsyncTask;-><init>(Lcom/trimline/metrocrew/transaction$Repository;Lcom/trimline/metrocrew/transaction$dao;Lcom/trimline/metrocrew/transaction;Lcom/trimline/metrocrew/transaction$1;)V

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v2, 0x0

    new-array v2, v2, [Lcom/trimline/metrocrew/transaction;

    invoke-virtual {v0, v1, v2}, Lcom/trimline/metrocrew/transaction$Repository$InserttransactionAsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 200
    return-void
.end method

.method public insert(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "transaction"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;)V"
        }
    .end annotation

    .line 202
    .local p1, "transaction":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    new-instance v0, Lcom/trimline/metrocrew/transaction$Repository$InserttransactionsAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/transaction$Repository;->dao:Lcom/trimline/metrocrew/transaction$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, p1, v2}, Lcom/trimline/metrocrew/transaction$Repository$InserttransactionsAsyncTask;-><init>(Lcom/trimline/metrocrew/transaction$Repository;Lcom/trimline/metrocrew/transaction$dao;Ljava/util/List;Lcom/trimline/metrocrew/transaction$1;)V

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/util/List;

    invoke-virtual {v0, v1, v2}, Lcom/trimline/metrocrew/transaction$Repository$InserttransactionsAsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 203
    return-void
.end method

.method public update(Lcom/trimline/metrocrew/transaction;)V
    .locals 3
    .param p1, "transaction"    # Lcom/trimline/metrocrew/transaction;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "transaction"
        }
    .end annotation

    .line 205
    new-instance v0, Lcom/trimline/metrocrew/transaction$Repository$UpdatetransactionAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/transaction$Repository;->dao:Lcom/trimline/metrocrew/transaction$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/transaction$Repository$UpdatetransactionAsyncTask;-><init>(Lcom/trimline/metrocrew/transaction$Repository;Lcom/trimline/metrocrew/transaction$dao;Lcom/trimline/metrocrew/transaction$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/transaction;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/transaction$Repository$UpdatetransactionAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 206
    return-void
.end method
