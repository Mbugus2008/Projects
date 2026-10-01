.class Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;
.super Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;
.source "WearableDrawerLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/drawer/WearableDrawerLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TopDrawerDraggerCallback"
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;


# direct methods
.method constructor <init>(Landroidx/wear/widget/drawer/WearableDrawerLayout;)V
    .locals 1

    .line 1049
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;-><init>(Landroidx/wear/widget/drawer/WearableDrawerLayout;Landroidx/wear/widget/drawer/WearableDrawerLayout$1;)V

    .line 1050
    return-void
.end method


# virtual methods
.method public clampViewPositionVertical(Landroid/view/View;II)I
    .locals 3
    .param p1, "child"    # Landroid/view/View;
    .param p2, "top"    # I
    .param p3, "dy"    # I

    .line 1054
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    const/4 v1, 0x0

    if-ne v0, p1, :cond_0

    .line 1055
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->getPeekContainer()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v0

    .line 1057
    .local v0, "peekHeight":I
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    sub-int v2, v0, v2

    invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    return v1

    .line 1059
    .end local v0    # "peekHeight":I
    :cond_0
    return v1
.end method

.method public getDrawerView()Landroidx/wear/widget/drawer/WearableDrawerView;
    .locals 1

    .line 1117
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    return-object v0
.end method

.method public onEdgeDragStarted(II)V
    .locals 3
    .param p1, "edgeFlags"    # I
    .param p2, "pointerId"    # I

    .line 1064
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-eqz v0, :cond_4

    const/4 v0, 0x4

    if-ne p1, v0, :cond_4

    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 1066
    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->isLocked()Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 1067
    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->isOpened()Z

    move-result v0

    if-nez v0, :cond_4

    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 1068
    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->getDrawerContent()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 1070
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mScrollingContentView:Landroid/view/View;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mScrollingContentView:Landroid/view/View;

    .line 1072
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v0

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v0, 0x1

    .line 1073
    .local v0, "atTop":Z
    :goto_1
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v1, v1, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v1}, Landroidx/wear/widget/drawer/WearableDrawerView;->isOpenOnlyAtTopEnabled()Z

    move-result v1

    if-eqz v1, :cond_3

    if-eqz v0, :cond_4

    .line 1074
    :cond_3
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v1, v1, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v2, v2, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v1, v2, p2}, Landroidx/customview/widget/ViewDragHelper;->captureChildView(Landroid/view/View;I)V

    .line 1077
    .end local v0    # "atTop":Z
    :cond_4
    return-void
.end method

.method public onViewPositionChanged(Landroid/view/View;IIII)V
    .locals 4
    .param p1, "changedView"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "dx"    # I
    .param p5, "dy"    # I

    .line 1107
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-ne p1, v0, :cond_0

    .line 1109
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    .line 1110
    .local v0, "height":I
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v1, v1, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    add-int v2, p3, v0

    int-to-float v2, v2

    int-to-float v3, v0

    div-float/2addr v2, v3

    invoke-virtual {v1, v2}, Landroidx/wear/widget/drawer/WearableDrawerView;->setOpenedPercent(F)V

    .line 1111
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    invoke-virtual {v1}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->invalidate()V

    .line 1113
    .end local v0    # "height":I
    :cond_0
    return-void
.end method

.method public onViewReleased(Landroid/view/View;FF)V
    .locals 6
    .param p1, "releasedChild"    # Landroid/view/View;
    .param p2, "xvel"    # F
    .param p3, "yvel"    # F

    .line 1081
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-ne p1, v0, :cond_3

    .line 1083
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->getOpenedPercent()F

    move-result v0

    .line 1086
    .local v0, "openedPercent":F
    const/4 v1, 0x0

    cmpl-float v2, p3, v1

    if-gtz v2, :cond_1

    cmpl-float v1, p3, v1

    if-nez v1, :cond_0

    const/high16 v1, 0x3f000000    # 0.5f

    cmpl-float v1, v0, v1

    if-lez v1, :cond_0

    goto :goto_0

    .line 1091
    :cond_0
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v1, v1, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-static {v1}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->animatePeekVisibleAfterBeingClosed(Landroidx/wear/widget/drawer/WearableDrawerView;)V

    .line 1092
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v1, v1, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v1}, Landroidx/wear/widget/drawer/WearableDrawerView;->getPeekContainer()Landroid/view/ViewGroup;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getHeight()I

    move-result v1

    .line 1093
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    sub-int/2addr v1, v2

    .line 1094
    .local v1, "finalTop":I
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v2, v2, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v2}, Landroidx/wear/widget/drawer/WearableDrawerView;->isAutoPeekEnabled()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1095
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    const/16 v3, 0x30

    const-wide/16 v4, 0x3e8

    invoke-virtual {v2, v3, v4, v5}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->closeDrawerDelayed(IJ)V

    goto :goto_1

    .line 1088
    .end local v1    # "finalTop":I
    :cond_1
    :goto_0
    const/4 v1, 0x0

    .line 1099
    .restart local v1    # "finalTop":I
    :cond_2
    :goto_1
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v2, v2, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v1}, Landroidx/customview/widget/ViewDragHelper;->settleCapturedViewAt(II)Z

    .line 1100
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    invoke-virtual {v2}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->invalidate()V

    .line 1102
    .end local v0    # "openedPercent":F
    .end local v1    # "finalTop":I
    :cond_3
    return-void
.end method
