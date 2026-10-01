.class Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder$1;
.super Ljava/lang/Object;
.source "transaction.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;-><init>(Lcom/trimline/metrocrew/transaction$TransAdapter;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;

.field final synthetic val$this$0:Lcom/trimline/metrocrew/transaction$TransAdapter;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;Lcom/trimline/metrocrew/transaction$TransAdapter;)V
    .locals 0
    .param p1, "this$1"    # Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$1",
            "val$this$0"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 399
    iput-object p1, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder$1;->this$1:Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;

    iput-object p2, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder$1;->val$this$0:Lcom/trimline/metrocrew/transaction$TransAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 402
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder$1;->this$1:Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;->getAdapterPosition()I

    move-result v0

    .line 403
    .local v0, "position":I
    iget-object v1, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder$1;->this$1:Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;

    iget-object v1, v1, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;->this$0:Lcom/trimline/metrocrew/transaction$TransAdapter;

    invoke-static {v1}, Lcom/trimline/metrocrew/transaction$TransAdapter;->access$1100(Lcom/trimline/metrocrew/transaction$TransAdapter;)Lcom/trimline/metrocrew/transaction$TransAdapter$OnItemClickListener;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 404
    iget-object v1, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder$1;->this$1:Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;

    iget-object v1, v1, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;->this$0:Lcom/trimline/metrocrew/transaction$TransAdapter;

    invoke-static {v1}, Lcom/trimline/metrocrew/transaction$TransAdapter;->access$1100(Lcom/trimline/metrocrew/transaction$TransAdapter;)Lcom/trimline/metrocrew/transaction$TransAdapter$OnItemClickListener;

    move-result-object v1

    iget-object v2, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder$1;->this$1:Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;

    iget-object v2, v2, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;->this$0:Lcom/trimline/metrocrew/transaction$TransAdapter;

    invoke-static {v2, v0}, Lcom/trimline/metrocrew/transaction$TransAdapter;->access$1200(Lcom/trimline/metrocrew/transaction$TransAdapter;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trimline/metrocrew/transaction;

    invoke-interface {v1, v2}, Lcom/trimline/metrocrew/transaction$TransAdapter$OnItemClickListener;->onItemClick(Lcom/trimline/metrocrew/transaction;)V

    .line 406
    :cond_0
    return-void
.end method
