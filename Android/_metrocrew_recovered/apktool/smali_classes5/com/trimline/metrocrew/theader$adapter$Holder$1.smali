.class Lcom/trimline/metrocrew/theader$adapter$Holder$1;
.super Ljava/lang/Object;
.source "theader.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/theader$adapter$Holder;-><init>(Lcom/trimline/metrocrew/theader$adapter;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/trimline/metrocrew/theader$adapter$Holder;

.field final synthetic val$this$0:Lcom/trimline/metrocrew/theader$adapter;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/theader$adapter$Holder;Lcom/trimline/metrocrew/theader$adapter;)V
    .locals 0
    .param p1, "this$1"    # Lcom/trimline/metrocrew/theader$adapter$Holder;
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

    .line 499
    iput-object p1, p0, Lcom/trimline/metrocrew/theader$adapter$Holder$1;->this$1:Lcom/trimline/metrocrew/theader$adapter$Holder;

    iput-object p2, p0, Lcom/trimline/metrocrew/theader$adapter$Holder$1;->val$this$0:Lcom/trimline/metrocrew/theader$adapter;

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

    .line 502
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$adapter$Holder$1;->this$1:Lcom/trimline/metrocrew/theader$adapter$Holder;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/theader$adapter$Holder;->getAdapterPosition()I

    move-result v0

    .line 503
    .local v0, "position":I
    iget-object v1, p0, Lcom/trimline/metrocrew/theader$adapter$Holder$1;->this$1:Lcom/trimline/metrocrew/theader$adapter$Holder;

    iget-object v1, v1, Lcom/trimline/metrocrew/theader$adapter$Holder;->this$0:Lcom/trimline/metrocrew/theader$adapter;

    invoke-static {v1}, Lcom/trimline/metrocrew/theader$adapter;->access$900(Lcom/trimline/metrocrew/theader$adapter;)Lcom/trimline/metrocrew/theader$adapter$OnItemClickListener;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 504
    iget-object v1, p0, Lcom/trimline/metrocrew/theader$adapter$Holder$1;->this$1:Lcom/trimline/metrocrew/theader$adapter$Holder;

    iget-object v1, v1, Lcom/trimline/metrocrew/theader$adapter$Holder;->this$0:Lcom/trimline/metrocrew/theader$adapter;

    invoke-static {v1}, Lcom/trimline/metrocrew/theader$adapter;->access$900(Lcom/trimline/metrocrew/theader$adapter;)Lcom/trimline/metrocrew/theader$adapter$OnItemClickListener;

    move-result-object v1

    iget-object v2, p0, Lcom/trimline/metrocrew/theader$adapter$Holder$1;->this$1:Lcom/trimline/metrocrew/theader$adapter$Holder;

    iget-object v2, v2, Lcom/trimline/metrocrew/theader$adapter$Holder;->this$0:Lcom/trimline/metrocrew/theader$adapter;

    invoke-static {v2}, Lcom/trimline/metrocrew/theader$adapter;->access$1000(Lcom/trimline/metrocrew/theader$adapter;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trimline/metrocrew/theader;

    invoke-interface {v1, v2}, Lcom/trimline/metrocrew/theader$adapter$OnItemClickListener;->onItemClick(Lcom/trimline/metrocrew/theader;)V

    .line 506
    :cond_0
    return-void
.end method
