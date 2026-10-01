.class Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;
.super Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;
.source "WearableDrawerLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/drawer/WearableDrawerLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BottomDrawerDraggerCallback"
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;


# direct methods
.method constructor <init>(Landroidx/wear/widget/drawer/WearableDrawerLayout;)V
    .locals 1

    .line 1125
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;-><init>(Landroidx/wear/widget/drawer/WearableDrawerLayout;Landroidx/wear/widget/drawer/WearableDrawerLayout$1;)V

    .line 1126
    return-void
.end method


# virtual methods
.method public clampViewPositionVertical(Landroid/view/View;II)I
    .locals 4
    .param p1, "child"    # Landroid/view/View;
    .param p2, "top"    # I
    .param p3, "dy"    # I

    .line 1130
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-ne v0, p1, :cond_0

    .line 1133
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->getHeight()I

    move-result v0

    .line 1134
    .local v0, "parentHeight":I
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v1, v1, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v1}, Landroidx/wear/widget/drawer/WearableDrawerView;->getPeekContainer()Landroid/view/ViewGroup;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getHeight()I

    move-result v1

    .line 1135
    .local v1, "peekHeight":I
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    sub-int v2, v0, v2

    sub-int v3, v0, v1

    .line 1136
    invoke-static {p2, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    .line 1135
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    return v2

    .line 1138
    .end local v0    # "parentHeight":I
    .end local v1    # "peekHeight":I
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getDrawerView()Landroidx/wear/widget/drawer/WearableDrawerView;
    .locals 1

    .line 1188
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    return-object v0
.end method

.method public onEdgeDragStarted(II)V
    .locals 2
    .param p1, "edgeFlags"    # I
    .param p2, "pointerId"    # I

    .line 1143
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-eqz v0, :cond_1

    const/16 v0, 0x8

    if-ne p1, v0, :cond_1

    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 1145
    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->isLocked()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 1146
    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->isOpened()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 1147
    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->getDrawerContent()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1149
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v1, v1, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v0, v1, p2}, Landroidx/customview/widget/ViewDragHelper;->captureChildView(Landroid/view/View;I)V

    .line 1151
    :cond_1
    return-void
.end method

.method public onViewPositionChanged(Landroid/view/View;IIII)V
    .locals 5
    .param p1, "changedView"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "dx"    # I
    .param p5, "dy"    # I

    .line 1176
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-ne p1, v0, :cond_0

    .line 1178
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    .line 1179
    .local v0, "height":I
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    invoke-virtual {v1}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->getHeight()I

    move-result v1

    .line 1181
    .local v1, "parentHeight":I
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v2, v2, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    sub-int v3, v1, p3

    int-to-float v3, v3

    int-to-float v4, v0

    div-float/2addr v3, v4

    invoke-virtual {v2, v3}, Landroidx/wear/widget/drawer/WearableDrawerView;->setOpenedPercent(F)V

    .line 1182
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    invoke-virtual {v2}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->invalidate()V

    .line 1184
    .end local v0    # "height":I
    .end local v1    # "parentHeight":I
    :cond_0
    return-void
.end method

.method public onViewReleased(Landroid/view/View;FF)V
    .locals 5
    .param p1, "releasedChild"    # Landroid/view/View;
    .param p2, "xvel"    # F
    .param p3, "yvel"    # F

    .line 1155
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-ne p1, v0, :cond_2

    .line 1157
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->getHeight()I

    move-result v0

    .line 1158
    .local v0, "parentHeight":I
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v1, v1, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v1}, Landroidx/wear/widget/drawer/WearableDrawerView;->getOpenedPercent()F

    move-result v1

    .line 1160
    .local v1, "openedPercent":F
    const/4 v2, 0x0

    cmpg-float v3, p3, v2

    if-ltz v3, :cond_1

    cmpl-float v2, p3, v2

    if-nez v2, :cond_0

    const/high16 v2, 0x3f000000    # 0.5f

    cmpl-float v2, v1, v2

    if-lez v2, :cond_0

    goto :goto_0

    .line 1165
    :cond_0
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v2, v2, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-static {v2}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->animatePeekVisibleAfterBeingClosed(Landroidx/wear/widget/drawer/WearableDrawerView;)V

    .line 1166
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    invoke-virtual {v2}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->getHeight()I

    move-result v2

    iget-object v3, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v3, v3, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v3}, Landroidx/wear/widget/drawer/WearableDrawerView;->getPeekContainer()Landroid/view/ViewGroup;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/ViewGroup;->getHeight()I

    move-result v3

    sub-int/2addr v2, v3

    .local v2, "finalTop":I
    goto :goto_1

    .line 1162
    .end local v2    # "finalTop":I
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    sub-int v2, v0, v2

    .line 1168
    .restart local v2    # "finalTop":I
    :goto_1
    iget-object v3, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v3, v3, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v2}, Landroidx/customview/widget/ViewDragHelper;->settleCapturedViewAt(II)Z

    .line 1169
    iget-object v3, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    invoke-virtual {v3}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->invalidate()V

    .line 1171
    .end local v0    # "parentHeight":I
    .end local v1    # "openedPercent":F
    .end local v2    # "finalTop":I
    :cond_2
    return-void
.end method
