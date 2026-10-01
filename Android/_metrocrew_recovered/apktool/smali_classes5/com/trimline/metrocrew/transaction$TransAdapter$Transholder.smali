.class Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "transaction.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/transaction$TransAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Transholder"
.end annotation


# instance fields
.field private amount:Landroid/widget/TextView;

.field private cancel:Landroid/widget/ImageButton;

.field private tMemberNo:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/trimline/metrocrew/transaction$TransAdapter;

.field private type:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/trimline/metrocrew/transaction$TransAdapter;Landroid/view/View;)V
    .locals 1
    .param p1, "this$0"    # Lcom/trimline/metrocrew/transaction$TransAdapter;
    .param p2, "itemView"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            "this$0",
            "itemView"
        }
    .end annotation

    .line 393
    iput-object p1, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;->this$0:Lcom/trimline/metrocrew/transaction$TransAdapter;

    .line 394
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 395
    const v0, 0x7f0a0141

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;->type:Landroid/widget/TextView;

    .line 396
    const v0, 0x7f0a01b3

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;->tMemberNo:Landroid/widget/TextView;

    .line 397
    const v0, 0x7f0a005d

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;->amount:Landroid/widget/TextView;

    .line 398
    const v0, 0x7f0a01b7

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;->cancel:Landroid/widget/ImageButton;

    .line 399
    new-instance v0, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder$1;

    invoke-direct {v0, p0, p1}, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder$1;-><init>(Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;Lcom/trimline/metrocrew/transaction$TransAdapter;)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 408
    return-void
.end method

.method static synthetic access$1000(Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;)Landroid/widget/ImageButton;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;

    .line 388
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;->cancel:Landroid/widget/ImageButton;

    return-object v0
.end method

.method static synthetic access$600(Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;

    .line 388
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;->type:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$700(Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;

    .line 388
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;->tMemberNo:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$800(Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;

    .line 388
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction$TransAdapter$Transholder;->amount:Landroid/widget/TextView;

    return-object v0
.end method
