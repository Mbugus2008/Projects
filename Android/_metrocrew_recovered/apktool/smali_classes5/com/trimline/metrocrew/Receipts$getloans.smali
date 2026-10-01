.class Lcom/trimline/metrocrew/Receipts$getloans;
.super Landroid/os/AsyncTask;
.source "Receipts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Receipts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "getloans"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field public Mno:Ljava/lang/String;

.field loans:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/loan;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/trimline/metrocrew/Receipts;


# direct methods
.method public constructor <init>(Lcom/trimline/metrocrew/Receipts;Ljava/lang/String;)V
    .locals 0
    .param p2, "memberno"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            "this$0",
            "memberno"
        }
    .end annotation

    .line 467
    iput-object p1, p0, Lcom/trimline/metrocrew/Receipts$getloans;->this$0:Lcom/trimline/metrocrew/Receipts;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 468
    iput-object p2, p0, Lcom/trimline/metrocrew/Receipts$getloans;->Mno:Ljava/lang/String;

    .line 470
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
            "agents"
        }
    .end annotation

    .line 463
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/Receipts$getloans;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 2
    .param p1, "agents"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "agents"
        }
    .end annotation

    .line 474
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$getloans;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v0, v0, Lcom/trimline/metrocrew/Receipts;->lmodel:Lcom/trimline/metrocrew/loan$Model;

    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts$getloans;->Mno:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/loan$Model;->getcustomerloans(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts$getloans;->loans:Ljava/util/List;

    .line 475
    const/4 v0, 0x0

    return-object v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "res"
        }
    .end annotation

    .line 463
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/Receipts$getloans;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 5
    .param p1, "res"    # Ljava/lang/Void;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "res"
        }
    .end annotation

    .line 480
    new-instance v0, Lcom/trimline/metrocrew/loan;

    invoke-direct {v0}, Lcom/trimline/metrocrew/loan;-><init>()V

    .line 481
    .local v0, "l":Lcom/trimline/metrocrew/loan;
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/trimline/metrocrew/loan;->Loan_No:Ljava/lang/String;

    .line 482
    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts$getloans;->loans:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 484
    new-instance v1, Landroid/widget/ArrayAdapter;

    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts$getloans;->this$0:Lcom/trimline/metrocrew/Receipts;

    const v3, 0x7f0d006d

    iget-object v4, p0, Lcom/trimline/metrocrew/Receipts$getloans;->loans:Ljava/util/List;

    invoke-direct {v1, v2, v3, v4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 485
    .local v1, "dataAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/trimline/metrocrew/loan;>;"
    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts$getloans;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v2, v2, Lcom/trimline/metrocrew/Receipts;->loanspinner:Landroid/widget/Spinner;

    invoke-virtual {v2, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 486
    return-void
.end method
