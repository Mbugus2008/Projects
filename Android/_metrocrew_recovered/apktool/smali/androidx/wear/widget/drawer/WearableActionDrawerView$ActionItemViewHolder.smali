.class final Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionItemViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "WearableActionDrawerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/drawer/WearableActionDrawerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ActionItemViewHolder"
.end annotation


# instance fields
.field public final iconView:Landroid/widget/ImageView;

.field public final textView:Landroid/widget/TextView;

.field final synthetic this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

.field public final view:Landroid/view/View;


# direct methods
.method constructor <init>(Landroidx/wear/widget/drawer/WearableActionDrawerView;Landroid/view/View;)V
    .locals 1
    .param p2, "view"    # Landroid/view/View;

    .line 470
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionItemViewHolder;->this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

    .line 471
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 472
    iput-object p2, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionItemViewHolder;->view:Landroid/view/View;

    .line 473
    sget v0, Landroidx/wear/R$id;->ws_action_drawer_item_icon:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionItemViewHolder;->iconView:Landroid/widget/ImageView;

    .line 474
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionItemViewHolder;->iconView:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    iget p1, p1, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mIconRightMargin:I

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 475
    sget p1, Landroidx/wear/R$id;->ws_action_drawer_item_text:I

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionItemViewHolder;->textView:Landroid/widget/TextView;

    .line 476
    return-void
.end method
