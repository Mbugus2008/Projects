.class Landroidx/wear/widget/drawer/WearableActionDrawerView$1;
.super Ljava/lang/Object;
.source "WearableActionDrawerView.java"

# interfaces
.implements Landroidx/wear/widget/drawer/WearableActionDrawerMenu$WearableActionDrawerMenuListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/wear/widget/drawer/WearableActionDrawerView;->getMenu()Landroid/view/Menu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;


# direct methods
.method constructor <init>(Landroidx/wear/widget/drawer/WearableActionDrawerView;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/wear/widget/drawer/WearableActionDrawerView;

    .line 324
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$1;->this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public menuChanged()V
    .locals 1

    .line 365
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$1;->this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionListAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    if-eqz v0, :cond_0

    .line 366
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$1;->this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionListAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 368
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$1;->this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->updatePeekIcons()V

    .line 369
    return-void
.end method

.method public menuItemAdded(I)V
    .locals 2
    .param p1, "position"    # I

    .line 338
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$1;->this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionListAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    if-eqz v0, :cond_1

    .line 339
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$1;->this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->hasTitle()Z

    move-result v0

    if-eqz v0, :cond_0

    add-int/lit8 v0, p1, 0x1

    goto :goto_0

    :cond_0
    move v0, p1

    .line 340
    .local v0, "listPosition":I
    :goto_0
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$1;->this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

    iget-object v1, v1, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionListAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemInserted(I)V

    .line 344
    .end local v0    # "listPosition":I
    :cond_1
    const/4 v0, 0x1

    if-gt p1, v0, :cond_2

    .line 345
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$1;->this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->updatePeekIcons()V

    .line 347
    :cond_2
    return-void
.end method

.method public menuItemChanged(I)V
    .locals 2
    .param p1, "position"    # I

    .line 327
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$1;->this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionListAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    if-eqz v0, :cond_1

    .line 328
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$1;->this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->hasTitle()Z

    move-result v0

    if-eqz v0, :cond_0

    add-int/lit8 v0, p1, 0x1

    goto :goto_0

    :cond_0
    move v0, p1

    .line 329
    .local v0, "listPosition":I
    :goto_0
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$1;->this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

    iget-object v1, v1, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionListAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 331
    .end local v0    # "listPosition":I
    :cond_1
    if-nez p1, :cond_2

    .line 332
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$1;->this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->updatePeekIcons()V

    .line 334
    :cond_2
    return-void
.end method

.method public menuItemRemoved(I)V
    .locals 2
    .param p1, "position"    # I

    .line 351
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$1;->this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionListAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    if-eqz v0, :cond_1

    .line 352
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$1;->this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->hasTitle()Z

    move-result v0

    if-eqz v0, :cond_0

    add-int/lit8 v0, p1, 0x1

    goto :goto_0

    :cond_0
    move v0, p1

    .line 353
    .local v0, "listPosition":I
    :goto_0
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$1;->this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

    iget-object v1, v1, Landroidx/wear/widget/drawer/WearableActionDrawerView;->mActionListAdapter:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRemoved(I)V

    .line 358
    .end local v0    # "listPosition":I
    :cond_1
    const/4 v0, 0x1

    if-gt p1, v0, :cond_2

    .line 359
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableActionDrawerView$1;->this$0:Landroidx/wear/widget/drawer/WearableActionDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableActionDrawerView;->updatePeekIcons()V

    .line 361
    :cond_2
    return-void
.end method
