.class Lcom/trimline/metrocrew/theader$adapter$Holder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "theader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/theader$adapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Holder"
.end annotation


# instance fields
.field private amount:Landroid/widget/TextView;

.field private member:Landroid/widget/TextView;

.field private receipt:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/trimline/metrocrew/theader$adapter;


# direct methods
.method private constructor <init>(Lcom/trimline/metrocrew/theader$adapter;Landroid/view/View;)V
    .locals 2
    .param p1, "this$0"    # Lcom/trimline/metrocrew/theader$adapter;
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

    .line 494
    iput-object p1, p0, Lcom/trimline/metrocrew/theader$adapter$Holder;->this$0:Lcom/trimline/metrocrew/theader$adapter;

    .line 495
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 496
    const v0, 0x7f0a0141

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trimline/metrocrew/theader$adapter$Holder;->member:Landroid/widget/TextView;

    .line 497
    const v0, 0x7f0a01b3

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trimline/metrocrew/theader$adapter$Holder;->receipt:Landroid/widget/TextView;

    .line 498
    const v0, 0x7f0a005d

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trimline/metrocrew/theader$adapter$Holder;->amount:Landroid/widget/TextView;

    .line 499
    invoke-virtual {p2}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/trimline/metrocrew/theader$adapter$Holder$1;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/theader$adapter$Holder$1;-><init>(Lcom/trimline/metrocrew/theader$adapter$Holder;Lcom/trimline/metrocrew/theader$adapter;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 509
    return-void
.end method

.method synthetic constructor <init>(Lcom/trimline/metrocrew/theader$adapter;Landroid/view/View;Lcom/trimline/metrocrew/theader$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trimline/metrocrew/theader$adapter;
    .param p2, "x1"    # Landroid/view/View;
    .param p3, "x2"    # Lcom/trimline/metrocrew/theader$1;

    .line 490
    invoke-direct {p0, p1, p2}, Lcom/trimline/metrocrew/theader$adapter$Holder;-><init>(Lcom/trimline/metrocrew/theader$adapter;Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$600(Lcom/trimline/metrocrew/theader$adapter$Holder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/theader$adapter$Holder;

    .line 490
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$adapter$Holder;->member:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$700(Lcom/trimline/metrocrew/theader$adapter$Holder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/theader$adapter$Holder;

    .line 490
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$adapter$Holder;->receipt:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$800(Lcom/trimline/metrocrew/theader$adapter$Holder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/theader$adapter$Holder;

    .line 490
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$adapter$Holder;->amount:Landroid/widget/TextView;

    return-object v0
.end method
