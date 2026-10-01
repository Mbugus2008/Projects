.class public Lcom/trimline/metrocrew/MainActivity$adapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "adapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/MainActivity$adapter$Holder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/trimline/metrocrew/MainActivity$adapter$Holder;",
        ">;"
    }
.end annotation


# instance fields
.field private final mInflater:Landroid/view/LayoutInflater;

.field private theaders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    .line 441
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 442
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/trimline/metrocrew/MainActivity$adapter;->mInflater:Landroid/view/LayoutInflater;

    .line 443
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 470
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$adapter;->theaders:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 471
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$adapter;->theaders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0

    .line 472
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "holder",
            "position"
        }
    .end annotation

    .line 436
    check-cast p1, Lcom/trimline/metrocrew/MainActivity$adapter$Holder;

    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/MainActivity$adapter;->onBindViewHolder(Lcom/trimline/metrocrew/MainActivity$adapter$Holder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/trimline/metrocrew/MainActivity$adapter$Holder;I)V
    .locals 4
    .param p1, "holder"    # Lcom/trimline/metrocrew/MainActivity$adapter$Holder;
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "holder",
            "position"
        }
    .end annotation

    .line 453
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$adapter;->theaders:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/transaction;

    .line 454
    .local v0, "currentNote":Lcom/trimline/metrocrew/transaction;
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "dd-MM-yy HH:mm:ss"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 455
    .local v1, "df":Ljava/text/SimpleDateFormat;
    invoke-static {p1}, Lcom/trimline/metrocrew/MainActivity$adapter$Holder;->access$300(Lcom/trimline/metrocrew/MainActivity$adapter$Holder;)Landroid/widget/TextView;

    move-result-object v2

    iget-object v3, v0, Lcom/trimline/metrocrew/transaction;->PayMode:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 456
    invoke-static {p1}, Lcom/trimline/metrocrew/MainActivity$adapter$Holder;->access$400(Lcom/trimline/metrocrew/MainActivity$adapter$Holder;)Landroid/widget/TextView;

    move-result-object v2

    iget-object v3, v0, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 457
    invoke-static {p1}, Lcom/trimline/metrocrew/MainActivity$adapter$Holder;->access$500(Lcom/trimline/metrocrew/MainActivity$adapter$Holder;)Landroid/widget/TextView;

    move-result-object v2

    iget-object v3, v0, Lcom/trimline/metrocrew/transaction;->Amount:Ljava/lang/Double;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 459
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "parent",
            "viewType"
        }
    .end annotation

    .line 436
    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/MainActivity$adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/trimline/metrocrew/MainActivity$adapter$Holder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/trimline/metrocrew/MainActivity$adapter$Holder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "parent",
            "viewType"
        }
    .end annotation

    .line 447
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$adapter;->mInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f0d0082

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 448
    .local v0, "itemView":Landroid/view/View;
    new-instance v1, Lcom/trimline/metrocrew/MainActivity$adapter$Holder;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v0, v2}, Lcom/trimline/metrocrew/MainActivity$adapter$Holder;-><init>(Lcom/trimline/metrocrew/MainActivity$adapter;Landroid/view/View;Lcom/trimline/metrocrew/MainActivity$1;)V

    return-object v1
.end method

.method setTransactions(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "words"
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

    .line 462
    .local p1, "words":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    iput-object p1, p0, Lcom/trimline/metrocrew/MainActivity$adapter;->theaders:Ljava/util/List;

    .line 463
    invoke-virtual {p0}, Lcom/trimline/metrocrew/MainActivity$adapter;->notifyDataSetChanged()V

    .line 464
    return-void
.end method
