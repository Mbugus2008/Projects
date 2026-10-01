.class Lcom/trimline/metrocrew/Receipts$6;
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

    .line 185
    iput-object p1, p0, Lcom/trimline/metrocrew/Receipts$6;->this$0:Lcom/trimline/metrocrew/Receipts;

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

    .line 188
    .local p1, "adapterView":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/payment_modes;

    .line 189
    .local v0, "pm":Lcom/trimline/metrocrew/payment_modes;
    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts$6;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v1, v1, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    iget-object v2, v0, Lcom/trimline/metrocrew/payment_modes;->Code:Ljava/lang/String;

    iput-object v2, v1, Lcom/trimline/metrocrew/theader;->PayMode:Ljava/lang/String;

    .line 190
    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts$6;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v1, v1, Lcom/trimline/metrocrew/Receipts;->trmodel:Lcom/trimline/metrocrew/transaction$Model;

    iget-object v1, v1, Lcom/trimline/metrocrew/transaction$Model;->trans:Lcom/trimline/metrocrew/transaction;

    iget-object v2, v0, Lcom/trimline/metrocrew/payment_modes;->Code:Ljava/lang/String;

    iput-object v2, v1, Lcom/trimline/metrocrew/transaction;->PayMode:Ljava/lang/String;

    .line 191
    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts$6;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v1, v1, Lcom/trimline/metrocrew/Receipts;->theaderModel:Lcom/trimline/metrocrew/theader$Model;

    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts$6;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v2, v2, Lcom/trimline/metrocrew/Receipts;->theader:Lcom/trimline/metrocrew/theader;

    invoke-virtual {v1, v2}, Lcom/trimline/metrocrew/theader$Model;->updateHeader(Lcom/trimline/metrocrew/theader;)V

    .line 192
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

    .line 196
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method
