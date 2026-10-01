.class Lcom/trimline/metrocrew/transaction$Repository$FetchtransactionAsyncTask;
.super Landroid/os/AsyncTask;
.source "transaction.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/transaction$Repository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FetchtransactionAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/util/List<",
        "Lcom/trimline/metrocrew/transaction;",
        ">;>;"
    }
.end annotation


# instance fields
.field private dao:Lcom/trimline/metrocrew/transaction$dao;

.field repository:Lcom/trimline/metrocrew/transaction$Repository;

.field final synthetic this$0:Lcom/trimline/metrocrew/transaction$Repository;

.field private transactionList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/trimline/metrocrew/transaction$Repository;Lcom/trimline/metrocrew/transaction$dao;)V
    .locals 0
    .param p2, "dao"    # Lcom/trimline/metrocrew/transaction$dao;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            "this$0",
            "dao"
        }
    .end annotation

    .line 221
    iput-object p1, p0, Lcom/trimline/metrocrew/transaction$Repository$FetchtransactionAsyncTask;->this$0:Lcom/trimline/metrocrew/transaction$Repository;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 219
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/trimline/metrocrew/transaction$Repository$FetchtransactionAsyncTask;->repository:Lcom/trimline/metrocrew/transaction$Repository;

    .line 222
    iput-object p2, p0, Lcom/trimline/metrocrew/transaction$Repository$FetchtransactionAsyncTask;->dao:Lcom/trimline/metrocrew/transaction$dao;

    .line 223
    return-void
.end method

.method synthetic constructor <init>(Lcom/trimline/metrocrew/transaction$Repository;Lcom/trimline/metrocrew/transaction$dao;Lcom/trimline/metrocrew/transaction$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trimline/metrocrew/transaction$Repository;
    .param p2, "x1"    # Lcom/trimline/metrocrew/transaction$dao;
    .param p3, "x2"    # Lcom/trimline/metrocrew/transaction$1;

    .line 216
    invoke-direct {p0, p1, p2}, Lcom/trimline/metrocrew/transaction$Repository$FetchtransactionAsyncTask;-><init>(Lcom/trimline/metrocrew/transaction$Repository;Lcom/trimline/metrocrew/transaction$dao;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "voids"
        }
    .end annotation

    .line 216
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/transaction$Repository$FetchtransactionAsyncTask;->doInBackground([Ljava/lang/Void;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/util/List;
    .locals 1
    .param p1, "voids"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "voids"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;"
        }
    .end annotation

    .line 227
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$Repository$FetchtransactionAsyncTask;->dao:Lcom/trimline/metrocrew/transaction$dao;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/transaction$dao;->loadAll()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/trimline/metrocrew/transaction$Repository$FetchtransactionAsyncTask;->transactionList:Ljava/util/List;

    .line 228
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$Repository$FetchtransactionAsyncTask;->transactionList:Ljava/util/List;

    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "result"
        }
    .end annotation

    .line 216
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/transaction$Repository$FetchtransactionAsyncTask;->onPostExecute(Ljava/util/List;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "result"
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

    .line 233
    .local p1, "result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$Repository$FetchtransactionAsyncTask;->repository:Lcom/trimline/metrocrew/transaction$Repository;

    invoke-static {v0, p1}, Lcom/trimline/metrocrew/transaction$Repository;->access$500(Lcom/trimline/metrocrew/transaction$Repository;Ljava/util/List;)V

    .line 234
    return-void
.end method
