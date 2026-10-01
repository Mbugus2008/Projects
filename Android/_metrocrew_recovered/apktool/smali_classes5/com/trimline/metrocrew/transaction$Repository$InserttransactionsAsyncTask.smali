.class Lcom/trimline/metrocrew/transaction$Repository$InserttransactionsAsyncTask;
.super Landroid/os/AsyncTask;
.source "transaction.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/transaction$Repository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InserttransactionsAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/util/List<",
        "Lcom/trimline/metrocrew/transaction;",
        ">;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private dao:Lcom/trimline/metrocrew/transaction$dao;

.field final synthetic this$0:Lcom/trimline/metrocrew/transaction$Repository;

.field private transaction:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/trimline/metrocrew/transaction$Repository;Lcom/trimline/metrocrew/transaction$dao;Ljava/util/List;)V
    .locals 0
    .param p2, "dao"    # Lcom/trimline/metrocrew/transaction$dao;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0,
            0x0
        }
        names = {
            "this$0",
            "dao",
            "transaction1"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trimline/metrocrew/transaction$dao;",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;)V"
        }
    .end annotation

    .line 256
    .local p3, "transaction1":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    iput-object p1, p0, Lcom/trimline/metrocrew/transaction$Repository$InserttransactionsAsyncTask;->this$0:Lcom/trimline/metrocrew/transaction$Repository;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 257
    iput-object p2, p0, Lcom/trimline/metrocrew/transaction$Repository$InserttransactionsAsyncTask;->dao:Lcom/trimline/metrocrew/transaction$dao;

    .line 258
    iput-object p3, p0, Lcom/trimline/metrocrew/transaction$Repository$InserttransactionsAsyncTask;->transaction:Ljava/util/List;

    .line 259
    return-void
.end method

.method synthetic constructor <init>(Lcom/trimline/metrocrew/transaction$Repository;Lcom/trimline/metrocrew/transaction$dao;Ljava/util/List;Lcom/trimline/metrocrew/transaction$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trimline/metrocrew/transaction$Repository;
    .param p2, "x1"    # Lcom/trimline/metrocrew/transaction$dao;
    .param p3, "x2"    # Ljava/util/List;
    .param p4, "x3"    # Lcom/trimline/metrocrew/transaction$1;

    .line 252
    invoke-direct {p0, p1, p2, p3}, Lcom/trimline/metrocrew/transaction$Repository$InserttransactionsAsyncTask;-><init>(Lcom/trimline/metrocrew/transaction$Repository;Lcom/trimline/metrocrew/transaction$dao;Ljava/util/List;)V

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
            "transactions"
        }
    .end annotation

    .line 252
    check-cast p1, [Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/transaction$Repository$InserttransactionsAsyncTask;->doInBackground([Ljava/util/List;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/util/List;)Ljava/lang/Void;
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "transactions"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;)",
            "Ljava/lang/Void;"
        }
    .end annotation

    .line 263
    .local p1, "transactions":[Ljava/util/List;, "[Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$Repository$InserttransactionsAsyncTask;->dao:Lcom/trimline/metrocrew/transaction$dao;

    iget-object v1, p0, Lcom/trimline/metrocrew/transaction$Repository$InserttransactionsAsyncTask;->transaction:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/transaction$dao;->Insertall(Ljava/lang/Iterable;)V

    .line 264
    const/4 v0, 0x0

    return-object v0
.end method
