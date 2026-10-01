.class Lcom/trimline/metrocrew/Receipts$2;
.super Ljava/lang/Object;
.source "Receipts.java"

# interfaces
.implements Landroidx/lifecycle/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/Receipts;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/lifecycle/Observer<",
        "Ljava/util/List<",
        "Lcom/trimline/metrocrew/transaction;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/Receipts;

.field final synthetic val$adapter:Lcom/trimline/metrocrew/transaction$TransAdapter;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/Receipts;Lcom/trimline/metrocrew/transaction$TransAdapter;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/Receipts;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$adapter"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 112
    iput-object p1, p0, Lcom/trimline/metrocrew/Receipts$2;->this$0:Lcom/trimline/metrocrew/Receipts;

    iput-object p2, p0, Lcom/trimline/metrocrew/Receipts$2;->val$adapter:Lcom/trimline/metrocrew/transaction$TransAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic onChanged(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "notes"
        }
    .end annotation

    .line 112
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/Receipts$2;->onChanged(Ljava/util/List;)V

    return-void
.end method

.method public onChanged(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "notes"
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

    .line 115
    .local p1, "notes":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$2;->this$0:Lcom/trimline/metrocrew/Receipts;

    iput-object p1, v0, Lcom/trimline/metrocrew/Receipts;->transactionList:Ljava/util/List;

    .line 118
    const-string v0, "items"

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 119
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$2;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v0, v0, Lcom/trimline/metrocrew/Receipts;->recordCount:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Receipt lines ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 120
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$2;->val$adapter:Lcom/trimline/metrocrew/transaction$TransAdapter;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/transaction$TransAdapter;->submitList(Ljava/util/List;)V

    .line 121
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$2;->val$adapter:Lcom/trimline/metrocrew/transaction$TransAdapter;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/transaction$TransAdapter;->notifyDataSetChanged()V

    .line 122
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$2;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v0, v0, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    const/4 v1, 0x0

    iput v1, v0, Lcom/trimline/metrocrew/theader;->Total_Amount:F

    .line 123
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trimline/metrocrew/transaction;

    .line 125
    .local v1, "t":Lcom/trimline/metrocrew/transaction;
    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts$2;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v2, v2, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    iget v3, v2, Lcom/trimline/metrocrew/theader;->Total_Amount:F

    float-to-double v3, v3

    iget-object v5, v1, Lcom/trimline/metrocrew/transaction;->Amount:Ljava/lang/Double;

    invoke-virtual {v5}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v5

    add-double/2addr v3, v5

    double-to-float v3, v3

    iput v3, v2, Lcom/trimline/metrocrew/theader;->Total_Amount:F

    .end local v1    # "t":Lcom/trimline/metrocrew/transaction;
    goto :goto_0

    .line 126
    :cond_0
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$2;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v0, v0, Lcom/trimline/metrocrew/Receipts;->total:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    .line 127
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$2;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v0, v0, Lcom/trimline/metrocrew/Receipts;->total:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts$2;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v1, v1, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    iget v1, v1, Lcom/trimline/metrocrew/theader;->Total_Amount:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "%,.2f"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 129
    :cond_1
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$2;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v0, v0, Lcom/trimline/metrocrew/Receipts;->theaderModel:Lcom/trimline/metrocrew/theader$Model;

    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts$2;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v1, v1, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/theader$Model;->updateHeader(Lcom/trimline/metrocrew/theader;)V

    .line 130
    return-void
.end method
