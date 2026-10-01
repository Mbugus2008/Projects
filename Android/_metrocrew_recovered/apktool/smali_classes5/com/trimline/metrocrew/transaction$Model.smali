.class public Lcom/trimline/metrocrew/transaction$Model;
.super Landroidx/lifecycle/AndroidViewModel;
.source "transaction.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/transaction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Model"
.end annotation


# instance fields
.field private repository:Lcom/trimline/metrocrew/transaction$Repository;

.field public trans:Lcom/trimline/metrocrew/transaction;

.field public transline:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;"
        }
    .end annotation
.end field

.field public translinelive:Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;>;"
        }
    .end annotation
.end field

.field public translines:Landroidx/lifecycle/MutableLiveData;
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
    .locals 1
    .param p1, "application"    # Landroid/app/Application;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "application"
        }
    .end annotation

    .line 307
    invoke-direct {p0, p1}, Landroidx/lifecycle/AndroidViewModel;-><init>(Landroid/app/Application;)V

    .line 299
    new-instance v0, Lcom/trimline/metrocrew/transaction;

    invoke-direct {v0}, Lcom/trimline/metrocrew/transaction;-><init>()V

    iput-object v0, p0, Lcom/trimline/metrocrew/transaction$Model;->trans:Lcom/trimline/metrocrew/transaction;

    .line 300
    new-instance v0, Landroidx/lifecycle/MutableLiveData;

    invoke-direct {v0}, Landroidx/lifecycle/MutableLiveData;-><init>()V

    iput-object v0, p0, Lcom/trimline/metrocrew/transaction$Model;->translines:Landroidx/lifecycle/MutableLiveData;

    .line 302
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trimline/metrocrew/transaction$Model;->transline:Ljava/util/List;

    .line 308
    new-instance v0, Lcom/trimline/metrocrew/transaction$Repository;

    invoke-direct {v0, p1}, Lcom/trimline/metrocrew/transaction$Repository;-><init>(Landroid/app/Application;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/transaction$Model;->repository:Lcom/trimline/metrocrew/transaction$Repository;

    .line 309
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$Model;->repository:Lcom/trimline/metrocrew/transaction$Repository;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/transaction$Repository;->getall()Landroidx/lifecycle/LiveData;

    move-result-object v0

    iput-object v0, p0, Lcom/trimline/metrocrew/transaction$Model;->translinelive:Landroidx/lifecycle/LiveData;

    .line 310
    return-void
.end method


# virtual methods
.method public delete(Lcom/trimline/metrocrew/transaction;)V
    .locals 1
    .param p1, "transaction"    # Lcom/trimline/metrocrew/transaction;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "transaction"
        }
    .end annotation

    .line 327
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$Model;->repository:Lcom/trimline/metrocrew/transaction$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/transaction$Repository;->delete(Lcom/trimline/metrocrew/transaction;)V

    .line 328
    return-void
.end method

.method public findTransactions()V
    .locals 1

    .line 331
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$Model;->repository:Lcom/trimline/metrocrew/transaction$Repository;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/transaction$Repository;->findAll()V

    .line 332
    return-void
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

    .line 314
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$Model;->translinelive:Landroidx/lifecycle/LiveData;

    return-object v0
.end method

.method public gettransactions()Landroidx/lifecycle/LiveData;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;>;"
        }
    .end annotation

    .line 335
    const-string v0, "trans"

    const-string v1, "here"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 336
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$Model;->translines:Landroidx/lifecycle/MutableLiveData;

    return-object v0
.end method

.method public insert(Lcom/trimline/metrocrew/transaction;)V
    .locals 1
    .param p1, "transaction"    # Lcom/trimline/metrocrew/transaction;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "transaction"
        }
    .end annotation

    .line 317
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$Model;->repository:Lcom/trimline/metrocrew/transaction$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/transaction$Repository;->insert(Lcom/trimline/metrocrew/transaction;)V

    .line 318
    return-void
.end method

.method public insert(Ljava/util/List;)V
    .locals 1
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

    .line 320
    .local p1, "transaction":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$Model;->repository:Lcom/trimline/metrocrew/transaction$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/transaction$Repository;->insert(Ljava/util/List;)V

    .line 321
    return-void
.end method

.method public update(Lcom/trimline/metrocrew/transaction;)V
    .locals 1
    .param p1, "transaction"    # Lcom/trimline/metrocrew/transaction;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "transaction"
        }
    .end annotation

    .line 323
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$Model;->repository:Lcom/trimline/metrocrew/transaction$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/transaction$Repository;->update(Lcom/trimline/metrocrew/transaction;)V

    .line 324
    return-void
.end method
