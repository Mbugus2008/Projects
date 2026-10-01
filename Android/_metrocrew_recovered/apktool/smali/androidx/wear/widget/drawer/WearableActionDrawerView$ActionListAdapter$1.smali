.class Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionListAdapter$1;
.super Ljava/lang/Object;
.source "WearableActionDrawerView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionListAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionListAdapter;


# direct methods
.method constructor <init>(Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionListAdapter;)V
    .locals 0
    .param p1, "this$1"    # Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionListAdapter;

    .line 391
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionListAdapter$1;->this$1:Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionListAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .line 394
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionListAdapter$1;->this$1:Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionListAdapter;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionListAdapter;->this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionList:Landroidx/recyclerview/widget/RecyclerView;

    .line 395
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v0

    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionListAdapter$1;->this$1:Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionListAdapter;

    iget-object v1, v1, Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionListAdapter;->this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

    invoke-virtual {v1}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->hasTitle()Z

    move-result v1

    sub-int/2addr v0, v1

    .line 396
    .local v0, "childPos":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 397
    const-string v1, "WearableActionDrawer"

    const-string v2, "invalid child position"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 398
    return-void

    .line 400
    :cond_0
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionListAdapter$1;->this$1:Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionListAdapter;

    iget-object v1, v1, Landroidx/wear/widget/drawer/WearableActionDrawerView$ActionListAdapter;->this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

    invoke-virtual {v1, v0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->onMenuItemClicked(I)V

    .line 401
    return-void
.end method
