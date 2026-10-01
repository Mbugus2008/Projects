.class public Lcom/trimline/metrocrew/transaction$TransAdapter;
.super Landroidx/recyclerview/widget/ListAdapter;
.source "transaction.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/transaction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TransAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/transaction$TransAdapter$OnItemClickListener;,
        Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/ListAdapter<",
        "Lcom/trimline/metrocrew/transaction;",
        "Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;",
        ">;"
    }
.end annotation


# static fields
.field private static final DIFF_CALLBACK:Landroidx/recyclerview/widget/DiffUtil$ItemCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/recyclerview/widget/DiffUtil$ItemCallback<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private deleteListener:Lcom/trimline/metrocrew/DeleteListener;

.field private listener:Lcom/trimline/metrocrew/transaction$TransAdapter$OnItemClickListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 349
    new-instance v0, Lcom/trimline/metrocrew/transaction$TransAdapter$1;

    invoke-direct {v0}, Lcom/trimline/metrocrew/transaction$TransAdapter$1;-><init>()V

    sput-object v0, Lcom/trimline/metrocrew/transaction$TransAdapter;->DIFF_CALLBACK:Landroidx/recyclerview/widget/DiffUtil$ItemCallback;

    return-void
.end method

.method public constructor <init>(Lcom/trimline/metrocrew/DeleteListener;)V
    .locals 1
    .param p1, "deleteListener"    # Lcom/trimline/metrocrew/DeleteListener;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "deleteListener"
        }
    .end annotation

    .line 345
    sget-object v0, Lcom/trimline/metrocrew/transaction$TransAdapter;->DIFF_CALLBACK:Landroidx/recyclerview/widget/DiffUtil$ItemCallback;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/ListAdapter;-><init>(Landroidx/recyclerview/widget/DiffUtil$ItemCallback;)V

    .line 346
    iput-object p1, p0, Lcom/trimline/metrocrew/transaction$TransAdapter;->deleteListener:Lcom/trimline/metrocrew/DeleteListener;

    .line 347
    return-void
.end method

.method static synthetic access$1100(Lcom/trimline/metrocrew/transaction$TransAdapter;)Lcom/trimline/metrocrew/transaction$TransAdapter$OnItemClickListener;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/transaction$TransAdapter;

    .line 340
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$TransAdapter;->listener:Lcom/trimline/metrocrew/transaction$TransAdapter$OnItemClickListener;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/trimline/metrocrew/transaction$TransAdapter;I)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/transaction$TransAdapter;
    .param p1, "x1"    # I

    .line 340
    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/transaction$TransAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$900(Lcom/trimline/metrocrew/transaction$TransAdapter;)Lcom/trimline/metrocrew/DeleteListener;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/transaction$TransAdapter;

    .line 340
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$TransAdapter;->deleteListener:Lcom/trimline/metrocrew/DeleteListener;

    return-object v0
.end method


# virtual methods
.method public getNoteAt(I)Lcom/trimline/metrocrew/transaction;
    .locals 1
    .param p1, "position"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "position"
        }
    .end annotation

    .line 385
    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/transaction$TransAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/transaction;

    return-object v0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x1010
        }
        names = {
            "holder",
            "position"
        }
    .end annotation

    .line 340
    check-cast p1, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;

    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/transaction$TransAdapter;->onBindViewHolder(Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;I)V
    .locals 4
    .param p1, "holder"    # Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;
    .param p2, "position"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "holder",
            "position"
        }
    .end annotation

    .line 371
    invoke-virtual {p0, p2}, Lcom/trimline/metrocrew/transaction$TransAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/transaction;

    .line 373
    .local v0, "currentNote":Lcom/trimline/metrocrew/transaction;
    invoke-static {p1}, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;->access$600(Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;)Landroid/widget/TextView;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v0, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/trimline/metrocrew/transaction;->PayMode:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 374
    invoke-static {p1}, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;->access$700(Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;)Landroid/widget/TextView;

    move-result-object v1

    iget-object v2, v0, Lcom/trimline/metrocrew/transaction;->Account_No:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 375
    invoke-static {p1}, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;->access$800(Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;)Landroid/widget/TextView;

    move-result-object v1

    iget-object v2, v0, Lcom/trimline/metrocrew/transaction;->Amount:Ljava/lang/Double;

    invoke-virtual {v2}, Ljava/lang/Double;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 376
    invoke-static {p1}, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;->access$1000(Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;)Landroid/widget/ImageButton;

    move-result-object v1

    new-instance v2, Lcom/trimline/metrocrew/transaction$TransAdapter$2;

    invoke-direct {v2, p0, v0, p2}, Lcom/trimline/metrocrew/transaction$TransAdapter$2;-><init>(Lcom/trimline/metrocrew/transaction$TransAdapter;Lcom/trimline/metrocrew/transaction;I)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 382
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

    .line 340
    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/transaction$TransAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;
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

    .line 364
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 365
    const v1, 0x7f0d0083

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 366
    .local v0, "itemView":Landroid/view/View;
    new-instance v1, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;

    invoke-direct {v1, p0, v0}, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;-><init>(Lcom/trimline/metrocrew/transaction$TransAdapter;Landroid/view/View;)V

    return-object v1
.end method

.method public setOnItemClickListener(Lcom/trimline/metrocrew/transaction$TransAdapter$OnItemClickListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/trimline/metrocrew/transaction$TransAdapter$OnItemClickListener;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "listener"
        }
    .end annotation

    .line 416
    iput-object p1, p0, Lcom/trimline/metrocrew/transaction$TransAdapter;->listener:Lcom/trimline/metrocrew/transaction$TransAdapter$OnItemClickListener;

    .line 417
    return-void
.end method
