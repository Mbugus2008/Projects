.class Lcom/trimline/metrocrew/transaction$TransAdapter$1;
.super Landroidx/recyclerview/widget/DiffUtil$ItemCallback;
.source "transaction.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/transaction$TransAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/DiffUtil$ItemCallback<",
        "Lcom/trimline/metrocrew/transaction;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 349
    invoke-direct {p0}, Landroidx/recyclerview/widget/DiffUtil$ItemCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public areContentsTheSame(Lcom/trimline/metrocrew/transaction;Lcom/trimline/metrocrew/transaction;)Z
    .locals 2
    .param p1, "oldItem"    # Lcom/trimline/metrocrew/transaction;
    .param p2, "newItem"    # Lcom/trimline/metrocrew/transaction;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "oldItem",
            "newItem"
        }
    .end annotation

    .line 357
    iget v0, p1, Lcom/trimline/metrocrew/transaction;->Entry_No:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    iget v1, p2, Lcom/trimline/metrocrew/transaction;->Entry_No:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "oldItem",
            "newItem"
        }
    .end annotation

    .line 349
    check-cast p1, Lcom/trimline/metrocrew/transaction;

    check-cast p2, Lcom/trimline/metrocrew/transaction;

    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/transaction$TransAdapter$1;->areContentsTheSame(Lcom/trimline/metrocrew/transaction;Lcom/trimline/metrocrew/transaction;)Z

    move-result p1

    return p1
.end method

.method public areItemsTheSame(Lcom/trimline/metrocrew/transaction;Lcom/trimline/metrocrew/transaction;)Z
    .locals 2
    .param p1, "oldItem"    # Lcom/trimline/metrocrew/transaction;
    .param p2, "newItem"    # Lcom/trimline/metrocrew/transaction;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "oldItem",
            "newItem"
        }
    .end annotation

    .line 352
    iget v0, p1, Lcom/trimline/metrocrew/transaction;->Entry_No:I

    iget v1, p2, Lcom/trimline/metrocrew/transaction;->Entry_No:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public bridge synthetic areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "oldItem",
            "newItem"
        }
    .end annotation

    .line 349
    check-cast p1, Lcom/trimline/metrocrew/transaction;

    check-cast p2, Lcom/trimline/metrocrew/transaction;

    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/transaction$TransAdapter$1;->areItemsTheSame(Lcom/trimline/metrocrew/transaction;Lcom/trimline/metrocrew/transaction;)Z

    move-result p1

    return p1
.end method
