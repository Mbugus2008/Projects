.class Lcom/trimline/metrocrew/transaction$Repository$InserttransactionAsyncTask;
.super Landroid/os/AsyncTask;
.source "transaction.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/transaction$Repository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InserttransactionAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Lcom/trimline/metrocrew/transaction;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private dao:Lcom/trimline/metrocrew/transaction$dao;

.field final synthetic this$0:Lcom/trimline/metrocrew/transaction$Repository;

.field private transaction:Lcom/trimline/metrocrew/transaction;


# direct methods
.method private constructor <init>(Lcom/trimline/metrocrew/transaction$Repository;Lcom/trimline/metrocrew/transaction$dao;Lcom/trimline/metrocrew/transaction;)V
    .locals 0
    .param p2, "dao"    # Lcom/trimline/metrocrew/transaction$dao;
    .param p3, "transaction1"    # Lcom/trimline/metrocrew/transaction;
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

    .line 241
    iput-object p1, p0, Lcom/trimline/metrocrew/transaction$Repository$InserttransactionAsyncTask;->this$0:Lcom/trimline/metrocrew/transaction$Repository;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 242
    iput-object p2, p0, Lcom/trimline/metrocrew/transaction$Repository$InserttransactionAsyncTask;->dao:Lcom/trimline/metrocrew/transaction$dao;

    .line 243
    iput-object p3, p0, Lcom/trimline/metrocrew/transaction$Repository$InserttransactionAsyncTask;->transaction:Lcom/trimline/metrocrew/transaction;

    .line 244
    return-void
.end method

.method synthetic constructor <init>(Lcom/trimline/metrocrew/transaction$Repository;Lcom/trimline/metrocrew/transaction$dao;Lcom/trimline/metrocrew/transaction;Lcom/trimline/metrocrew/transaction$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trimline/metrocrew/transaction$Repository;
    .param p2, "x1"    # Lcom/trimline/metrocrew/transaction$dao;
    .param p3, "x2"    # Lcom/trimline/metrocrew/transaction;
    .param p4, "x3"    # Lcom/trimline/metrocrew/transaction$1;

    .line 237
    invoke-direct {p0, p1, p2, p3}, Lcom/trimline/metrocrew/transaction$Repository$InserttransactionAsyncTask;-><init>(Lcom/trimline/metrocrew/transaction$Repository;Lcom/trimline/metrocrew/transaction$dao;Lcom/trimline/metrocrew/transaction;)V

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

    .line 237
    check-cast p1, [Lcom/trimline/metrocrew/transaction;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/transaction$Repository$InserttransactionAsyncTask;->doInBackground([Lcom/trimline/metrocrew/transaction;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Lcom/trimline/metrocrew/transaction;)Ljava/lang/Void;
    .locals 2
    .param p1, "transactions"    # [Lcom/trimline/metrocrew/transaction;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "transactions"
        }
    .end annotation

    .line 248
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$Repository$InserttransactionAsyncTask;->dao:Lcom/trimline/metrocrew/transaction$dao;

    iget-object v1, p0, Lcom/trimline/metrocrew/transaction$Repository$InserttransactionAsyncTask;->transaction:Lcom/trimline/metrocrew/transaction;

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/transaction$dao;->insert(Lcom/trimline/metrocrew/transaction;)V

    .line 249
    const/4 v0, 0x0

    return-object v0
.end method
