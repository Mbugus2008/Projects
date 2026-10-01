.class public Lcom/trimline/metrocrew/theader$adapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "theader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/theader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "adapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/theader$adapter$OnItemClickListener;,
        Lcom/trimline/metrocrew/theader$adapter$Holder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/trimline/metrocrew/theader$adapter$Holder;",
        ">;"
    }
.end annotation


# instance fields
.field private listener:Lcom/trimline/metrocrew/theader$adapter$OnItemClickListener;

.field private final mInflater:Landroid/view/LayoutInflater;

.field private theaders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/theader;",
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

    .line 450
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 451
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/trimline/metrocrew/theader$adapter;->mInflater:Landroid/view/LayoutInflater;

    .line 452
    return-void
.end method

.method static synthetic access$1000(Lcom/trimline/metrocrew/theader$adapter;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/theader$adapter;

    .line 445
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$adapter;->theaders:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$900(Lcom/trimline/metrocrew/theader$adapter;)Lcom/trimline/metrocrew/theader$adapter$OnItemClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/theader$adapter;

    .line 445
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$adapter;->listener:Lcom/trimline/metrocrew/theader$adapter$OnItemClickListener;

    return-object v0
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 485
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$adapter;->theaders:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 486
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$adapter;->theaders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0

    .line 487
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

    .line 445
    check-cast p1, Lcom/trimline/metrocrew/theader$adapter$Holder;

    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/theader$adapter;->onBindViewHolder(Lcom/trimline/metrocrew/theader$adapter$Holder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/trimline/metrocrew/theader$adapter$Holder;I)V
    .locals 5
    .param p1, "holder"    # Lcom/trimline/metrocrew/theader$adapter$Holder;
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

    .line 462
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$adapter;->theaders:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/theader;

    .line 463
    .local v0, "currentNote":Lcom/trimline/metrocrew/theader;
    new-instance v1, Ljava/text/SimpleDateFormat;

    const-string v2, "dd-MM-yy HH:mm:ss"

    invoke-direct {v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 466
    .local v1, "df":Ljava/text/SimpleDateFormat;
    invoke-static {p1}, Lcom/trimline/metrocrew/theader$adapter$Holder;->access$600(Lcom/trimline/metrocrew/theader$adapter$Holder;)Landroid/widget/TextView;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v0, Lcom/trimline/metrocrew/theader;->Received_From:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/trimline/metrocrew/theader;->Account_No:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 467
    invoke-static {p1}, Lcom/trimline/metrocrew/theader$adapter$Holder;->access$700(Lcom/trimline/metrocrew/theader$adapter$Holder;)Landroid/widget/TextView;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v0, Lcom/trimline/metrocrew/theader;->No:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " | "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/trimline/metrocrew/theader;->Created_Date_Time:Ljava/sql/Date;

    invoke-virtual {v1, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "  | "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, v0, Lcom/trimline/metrocrew/theader;->From_Entry_No:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 468
    invoke-static {p1}, Lcom/trimline/metrocrew/theader$adapter$Holder;->access$800(Lcom/trimline/metrocrew/theader$adapter$Holder;)Landroid/widget/TextView;

    move-result-object v2

    iget v3, v0, Lcom/trimline/metrocrew/theader;->Amount_Recieved:F

    invoke-static {v3}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 469
    iget v2, v0, Lcom/trimline/metrocrew/theader;->Print_No:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    .line 470
    invoke-static {p1}, Lcom/trimline/metrocrew/theader$adapter$Holder;->access$600(Lcom/trimline/metrocrew/theader$adapter$Holder;)Landroid/widget/TextView;

    move-result-object v2

    const/16 v3, 0x10

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setPaintFlags(I)V

    .line 471
    invoke-static {p1}, Lcom/trimline/metrocrew/theader$adapter$Holder;->access$700(Lcom/trimline/metrocrew/theader$adapter$Holder;)Landroid/widget/TextView;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setPaintFlags(I)V

    .line 474
    :cond_0
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

    .line 445
    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/theader$adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/trimline/metrocrew/theader$adapter$Holder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/trimline/metrocrew/theader$adapter$Holder;
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

    .line 456
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$adapter;->mInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f0d0080

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 457
    .local v0, "itemView":Landroid/view/View;
    new-instance v1, Lcom/trimline/metrocrew/theader$adapter$Holder;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v0, v2}, Lcom/trimline/metrocrew/theader$adapter$Holder;-><init>(Lcom/trimline/metrocrew/theader$adapter;Landroid/view/View;Lcom/trimline/metrocrew/theader$1;)V

    return-object v1
.end method

.method public setOnItemClickListener(Lcom/trimline/metrocrew/theader$adapter$OnItemClickListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/trimline/metrocrew/theader$adapter$OnItemClickListener;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "listener"
        }
    .end annotation

    .line 516
    iput-object p1, p0, Lcom/trimline/metrocrew/theader$adapter;->listener:Lcom/trimline/metrocrew/theader$adapter$OnItemClickListener;

    .line 517
    return-void
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
            "Lcom/trimline/metrocrew/theader;",
            ">;)V"
        }
    .end annotation

    .line 477
    .local p1, "words":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/theader;>;"
    iput-object p1, p0, Lcom/trimline/metrocrew/theader$adapter;->theaders:Ljava/util/List;

    .line 478
    invoke-virtual {p0}, Lcom/trimline/metrocrew/theader$adapter;->notifyDataSetChanged()V

    .line 479
    return-void
.end method
