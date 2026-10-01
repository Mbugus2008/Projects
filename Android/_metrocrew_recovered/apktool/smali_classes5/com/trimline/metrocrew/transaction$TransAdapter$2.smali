.class Lcom/trimline/metrocrew/transaction$TransAdapter$2;
.super Ljava/lang/Object;
.source "transaction.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/transaction$TransAdapter;->onBindViewHolder(Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/transaction$TransAdapter;

.field final synthetic val$currentNote:Lcom/trimline/metrocrew/transaction;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/transaction$TransAdapter;Lcom/trimline/metrocrew/transaction;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/transaction$TransAdapter;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            "this$0",
            "val$currentNote",
            "val$position"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 376
    iput-object p1, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$2;->this$0:Lcom/trimline/metrocrew/transaction$TransAdapter;

    iput-object p2, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$2;->val$currentNote:Lcom/trimline/metrocrew/transaction;

    iput p3, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$2;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "view"
        }
    .end annotation

    .line 379
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$2;->this$0:Lcom/trimline/metrocrew/transaction$TransAdapter;

    invoke-static {v0}, Lcom/trimline/metrocrew/transaction$TransAdapter;->access$900(Lcom/trimline/metrocrew/transaction$TransAdapter;)Lcom/trimline/metrocrew/DeleteListener;

    move-result-object v0

    iget-object v1, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$2;->val$currentNote:Lcom/trimline/metrocrew/transaction;

    iget v2, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$2;->val$position:I

    invoke-interface {v0, v1, v2}, Lcom/trimline/metrocrew/DeleteListener;->onDelete(Lcom/trimline/metrocrew/transaction;I)V

    .line 380
    return-void
.end method
