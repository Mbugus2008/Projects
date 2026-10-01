.class Lcom/trimline/metrocrew/Receipts$5;
.super Ljava/lang/Object;
.source "Receipts.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


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

    .line 169
    iput-object p1, p0, Lcom/trimline/metrocrew/Receipts$5;->this$0:Lcom/trimline/metrocrew/Receipts;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .param p2, "view"    # Landroid/view/View;
    .param p3, "i"    # I
    .param p4, "l"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "adapterView",
            "view",
            "i",
            "l"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 172
    .local p1, "adapterView":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/types;

    .line 173
    .local v0, "type":Lcom/trimline/metrocrew/types;
    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts$5;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v1, v1, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v1, v1, Lcom/trimline/metrocrew/transaction$Model;->trans:Lcom/trimline/metrocrew/transaction;

    iget-object v2, v0, Lcom/trimline/metrocrew/types;->Code:Ljava/lang/String;

    iput-object v2, v1, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    .line 174
    iget-object v1, v0, Lcom/trimline/metrocrew/types;->Code:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 175
    iget-object v1, v0, Lcom/trimline/metrocrew/types;->Code:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, "loan"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 176
    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts$5;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v1, v1, Lcom/trimline/metrocrew/Receipts;->loanspinner:Landroid/widget/Spinner;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setVisibility(I)V

    goto :goto_0

    .line 178
    :cond_0
    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts$5;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v1, v1, Lcom/trimline/metrocrew/Receipts;->loanspinner:Landroid/widget/Spinner;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/Spinner;->setVisibility(I)V

    .line 179
    :cond_1
    :goto_0
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "parent"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;)V"
        }
    .end annotation

    .line 183
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method
