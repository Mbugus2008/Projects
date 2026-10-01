.class Lcom/trimline/metrocrew/Receipts$4;
.super Ljava/lang/Object;
.source "Receipts.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


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

    .line 150
    iput-object p1, p0, Lcom/trimline/metrocrew/Receipts$4;->this$0:Lcom/trimline/metrocrew/Receipts;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
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

    .line 153
    .local p1, "adapterView":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$4;->this$0:Lcom/trimline/metrocrew/Receipts;

    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trimline/metrocrew/Member;

    iput-object v1, v0, Lcom/trimline/metrocrew/Receipts;->member:Lcom/trimline/metrocrew/Member;

    .line 154
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$4;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v0, v0, Lcom/trimline/metrocrew/Receipts;->member:Lcom/trimline/metrocrew/Member;

    iget-object v0, v0, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    const-string v1, "New"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 156
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$4;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v0, v0, Lcom/trimline/metrocrew/Receipts;->member:Lcom/trimline/metrocrew/Member;

    const-string v1, ""

    iput-object v1, v0, Lcom/trimline/metrocrew/Member;->Name:Ljava/lang/String;

    .line 157
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts$4;->this$0:Lcom/trimline/metrocrew/Receipts;

    const-class v2, Lcom/trimline/metrocrew/add_edit_member;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 158
    .local v0, "inte":Landroid/content/Intent;
    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts$4;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v1, v1, Lcom/trimline/metrocrew/Receipts;->member:Lcom/trimline/metrocrew/Member;

    const-string v2, "member"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 159
    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts$4;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts$4;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget v2, v2, Lcom/trimline/metrocrew/Receipts;->LAUNCH_SECOND_ACTIVITY:I

    invoke-virtual {v1, v0, v2}, Lcom/trimline/metrocrew/Receipts;->startActivityForResult(Landroid/content/Intent;I)V

    .line 160
    .end local v0    # "inte":Landroid/content/Intent;
    goto :goto_0

    .line 163
    :cond_0
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$4;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts$4;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v1, v1, Lcom/trimline/metrocrew/Receipts;->member:Lcom/trimline/metrocrew/Member;

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/Receipts;->getmember(Lcom/trimline/metrocrew/Member;)V

    .line 167
    :goto_0
    return-void
.end method
