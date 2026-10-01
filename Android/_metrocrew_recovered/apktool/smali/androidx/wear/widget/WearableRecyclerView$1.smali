.class Landroidx/wear/widget/WearableRecyclerView$1;
.super Ljava/lang/Object;
.source "WearableRecyclerView.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/WearableRecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/wear/widget/WearableRecyclerView;


# direct methods
.method constructor <init>(Landroidx/wear/widget/WearableRecyclerView;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/wear/widget/WearableRecyclerView;

    .line 53
    iput-object p1, p0, Landroidx/wear/widget/WearableRecyclerView$1;->this$0:Landroidx/wear/widget/WearableRecyclerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 2

    .line 56
    iget-object v0, p0, Landroidx/wear/widget/WearableRecyclerView$1;->this$0:Landroidx/wear/widget/WearableRecyclerView;

    iget-boolean v0, v0, Landroidx/wear/widget/WearableRecyclerView;->mCenterEdgeItemsWhenThereAreChildren:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/wear/widget/WearableRecyclerView$1;->this$0:Landroidx/wear/widget/WearableRecyclerView;

    invoke-virtual {v0}, Landroidx/wear/widget/WearableRecyclerView;->getChildCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 57
    iget-object v0, p0, Landroidx/wear/widget/WearableRecyclerView$1;->this$0:Landroidx/wear/widget/WearableRecyclerView;

    invoke-virtual {v0}, Landroidx/wear/widget/WearableRecyclerView;->setupCenteredPadding()V

    .line 58
    iget-object v0, p0, Landroidx/wear/widget/WearableRecyclerView$1;->this$0:Landroidx/wear/widget/WearableRecyclerView;

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroidx/wear/widget/WearableRecyclerView;->mCenterEdgeItemsWhenThereAreChildren:Z

    .line 60
    :cond_0
    const/4 v0, 0x1

    return v0
.end method
