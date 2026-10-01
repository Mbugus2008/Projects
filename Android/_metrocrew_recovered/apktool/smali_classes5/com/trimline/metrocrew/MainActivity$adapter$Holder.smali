.class Lcom/trimline/metrocrew/MainActivity$adapter$Holder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/MainActivity$adapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Holder"
.end annotation


# instance fields
.field private amount:Landroid/widget/TextView;

.field private mode:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/trimline/metrocrew/MainActivity$adapter;

.field private type:Landroid/widget/TextView;


# direct methods
.method private constructor <init>(Lcom/trimline/metrocrew/MainActivity$adapter;Landroid/view/View;)V
    .locals 1
    .param p1, "this$0"    # Lcom/trimline/metrocrew/MainActivity$adapter;
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

    .line 479
    iput-object p1, p0, Lcom/trimline/metrocrew/MainActivity$adapter$Holder;->this$0:Lcom/trimline/metrocrew/MainActivity$adapter;

    .line 480
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 481
    const v0, 0x7f0a0247

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trimline/metrocrew/MainActivity$adapter$Holder;->mode:Landroid/widget/TextView;

    .line 482
    const v0, 0x7f0a01a4

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trimline/metrocrew/MainActivity$adapter$Holder;->type:Landroid/widget/TextView;

    .line 483
    const v0, 0x7f0a005d

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/trimline/metrocrew/MainActivity$adapter$Holder;->amount:Landroid/widget/TextView;

    .line 486
    return-void
.end method

.method synthetic constructor <init>(Lcom/trimline/metrocrew/MainActivity$adapter;Landroid/view/View;Lcom/trimline/metrocrew/MainActivity$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trimline/metrocrew/MainActivity$adapter;
    .param p2, "x1"    # Landroid/view/View;
    .param p3, "x2"    # Lcom/trimline/metrocrew/MainActivity$1;

    .line 475
    invoke-direct {p0, p1, p2}, Lcom/trimline/metrocrew/MainActivity$adapter$Holder;-><init>(Lcom/trimline/metrocrew/MainActivity$adapter;Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$300(Lcom/trimline/metrocrew/MainActivity$adapter$Holder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/MainActivity$adapter$Holder;

    .line 475
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$adapter$Holder;->mode:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$400(Lcom/trimline/metrocrew/MainActivity$adapter$Holder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/MainActivity$adapter$Holder;

    .line 475
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$adapter$Holder;->type:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$500(Lcom/trimline/metrocrew/MainActivity$adapter$Holder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/MainActivity$adapter$Holder;

    .line 475
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$adapter$Holder;->amount:Landroid/widget/TextView;

    return-object v0
.end method
