.class Lcom/trimline/metrocrew/Receipts$1;
.super Ljava/lang/Object;
.source "Receipts.java"

# interfaces
.implements Lcom/trimline/metrocrew/DeleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/Receipts;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/Receipts;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/Receipts;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/Receipts;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 101
    iput-object p1, p0, Lcom/trimline/metrocrew/Receipts$1;->this$0:Lcom/trimline/metrocrew/Receipts;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDelete(Lcom/trimline/metrocrew/transaction;I)V
    .locals 2
    .param p1, "transaction"    # Lcom/trimline/metrocrew/transaction;
    .param p2, "i"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "transaction",
            "i"
        }
    .end annotation

    .line 104
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$1;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v0, v0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/transaction$Model;->delete(Lcom/trimline/metrocrew/transaction;)V

    .line 105
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$1;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v0, v0, Lcom/trimline/metrocrew/Receipts;->transactionList:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 106
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$1;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v0, v0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts$1;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v1, v1, Lcom/trimline/metrocrew/Receipts;->transactionList:Ljava/util/List;

    iput-object v1, v0, Lcom/trimline/metrocrew/transaction$Model;->transline:Ljava/util/List;

    .line 107
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$1;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v0, v0, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v0, v0, Lcom/trimline/metrocrew/transaction$Model;->translines:Landroidx/lifecycle/MutableLiveData;

    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts$1;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v1, v1, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v1, v1, Lcom/trimline/metrocrew/transaction$Model;->transline:Ljava/util/List;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/MutableLiveData;->setValue(Ljava/lang/Object;)V

    .line 108
    return-void
.end method
