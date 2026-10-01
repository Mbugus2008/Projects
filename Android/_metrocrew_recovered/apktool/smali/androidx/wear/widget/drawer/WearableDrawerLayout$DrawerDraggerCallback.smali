.class abstract Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;
.super Landroidx/customview/widget/ViewDragHelper$Callback;
.source "WearableDrawerLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/drawer/WearableDrawerLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "DrawerDraggerCallback"
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;


# direct methods
.method private constructor <init>(Landroidx/wear/widget/drawer/WearableDrawerLayout;)V
    .locals 0

    .line 971
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    invoke-direct {p0}, Landroidx/customview/widget/ViewDragHelper$Callback;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Landroidx/wear/widget/drawer/WearableDrawerLayout;Landroidx/wear/widget/drawer/WearableDrawerLayout$1;)V
    .locals 0
    .param p1, "x0"    # Landroidx/wear/widget/drawer/WearableDrawerLayout;
    .param p2, "x1"    # Landroidx/wear/widget/drawer/WearableDrawerLayout$1;

    .line 971
    invoke-direct {p0, p1}, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;-><init>(Landroidx/wear/widget/drawer/WearableDrawerLayout;)V

    return-void
.end method


# virtual methods
.method public abstract getDrawerView()Landroidx/wear/widget/drawer/WearableDrawerView;
.end method

.method public getViewVerticalDragRange(Landroid/view/View;)I
    .locals 1
    .param p1, "child"    # Landroid/view/View;

    .line 986
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->getDrawerView()Landroidx/wear/widget/drawer/WearableDrawerView;

    move-result-object v0

    if-ne p1, v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onViewCaptured(Landroid/view/View;I)V
    .locals 1
    .param p1, "capturedChild"    # Landroid/view/View;
    .param p2, "activePointerId"    # I

    .line 991
    move-object v0, p1

    check-cast v0, Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-static {v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->showDrawerContentMaybeAnimate(Landroidx/wear/widget/drawer/WearableDrawerView;)V

    .line 992
    return-void
.end method

.method public onViewDragStateChanged(I)V
    .locals 7
    .param p1, "state"    # I

    .line 996
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->getDrawerView()Landroidx/wear/widget/drawer/WearableDrawerView;

    move-result-object v0

    .line 997
    .local v0, "drawerView":Landroidx/wear/widget/drawer/WearableDrawerView;
    packed-switch p1, :pswitch_data_0

    goto/16 :goto_1

    .line 999
    :pswitch_0
    const/4 v1, 0x0

    .line 1000
    .local v1, "openedOrClosed":Z
    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->isOpened()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1001
    const/4 v1, 0x1

    .line 1002
    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->onDrawerOpened()V

    .line 1003
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    invoke-virtual {v2, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->allowAccessibilityFocusOnOnly(Landroidx/wear/widget/drawer/WearableDrawerView;)V

    .line 1004
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v2, v2, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mDrawerStateCallback:Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerStateCallback;

    if-eqz v2, :cond_0

    .line 1005
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v2, v2, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mDrawerStateCallback:Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerStateCallback;

    iget-object v3, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    .line 1006
    invoke-virtual {v2, v3, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerStateCallback;->onDrawerOpened(Landroidx/wear/widget/drawer/WearableDrawerLayout;Landroidx/wear/widget/drawer/WearableDrawerView;)V

    .line 1010
    :cond_0
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v3, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v4, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v4, v4, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->canDrawerContentScrollVertically(Landroidx/wear/widget/drawer/WearableDrawerView;I)Z

    move-result v3

    xor-int/2addr v3, v5

    iput-boolean v3, v2, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mCanTopDrawerBeClosed:Z

    .line 1012
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v3, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v4, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v4, v4, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    const/4 v6, -0x1

    invoke-virtual {v3, v4, v6}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->canDrawerContentScrollVertically(Landroidx/wear/widget/drawer/WearableDrawerView;I)Z

    move-result v3

    xor-int/2addr v3, v5

    iput-boolean v3, v2, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mCanBottomDrawerBeClosed:Z

    goto :goto_0

    .line 1014
    :cond_1
    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->isClosed()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1015
    const/4 v1, 0x1

    .line 1016
    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->onDrawerClosed()V

    .line 1017
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    invoke-virtual {v2}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->allowAccessibilityFocusOnAllChildren()V

    .line 1018
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v2, v2, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mDrawerStateCallback:Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerStateCallback;

    if-eqz v2, :cond_3

    .line 1019
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v2, v2, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mDrawerStateCallback:Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerStateCallback;

    iget-object v3, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    .line 1020
    invoke-virtual {v2, v3, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerStateCallback;->onDrawerClosed(Landroidx/wear/widget/drawer/WearableDrawerLayout;Landroidx/wear/widget/drawer/WearableDrawerView;)V

    goto :goto_0

    .line 1023
    :cond_2
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    invoke-virtual {v2}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->allowAccessibilityFocusOnAllChildren()V

    .line 1027
    :cond_3
    :goto_0
    if-eqz v1, :cond_4

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->isPeeking()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1028
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroidx/wear/widget/drawer/WearableDrawerView;->setIsPeeking(Z)V

    .line 1029
    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->getPeekContainer()Landroid/view/ViewGroup;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 1035
    .end local v1    # "openedOrClosed":Z
    :cond_4
    :goto_1
    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->getDrawerState()I

    move-result v1

    if-eq v1, p1, :cond_5

    .line 1036
    invoke-virtual {v0, p1}, Landroidx/wear/widget/drawer/WearableDrawerView;->setDrawerState(I)V

    .line 1037
    invoke-virtual {v0, p1}, Landroidx/wear/widget/drawer/WearableDrawerView;->onDrawerStateChanged(I)V

    .line 1038
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v1, v1, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mDrawerStateCallback:Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerStateCallback;

    if-eqz v1, :cond_5

    .line 1039
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v1, v1, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mDrawerStateCallback:Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerStateCallback;

    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    invoke-virtual {v1, v2, p1}, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerStateCallback;->onDrawerStateChanged(Landroidx/wear/widget/drawer/WearableDrawerLayout;I)V

    .line 1042
    :cond_5
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public tryCaptureView(Landroid/view/View;I)Z
    .locals 2
    .param p1, "child"    # Landroid/view/View;
    .param p2, "pointerId"    # I

    .line 977
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;->getDrawerView()Landroidx/wear/widget/drawer/WearableDrawerView;

    move-result-object v0

    .line 979
    .local v0, "drawerView":Landroidx/wear/widget/drawer/WearableDrawerView;
    if-ne p1, v0, :cond_0

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->isLocked()Z

    move-result v1

    if-nez v1, :cond_0

    .line 980
    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->getDrawerContent()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 979
    :goto_0
    return v1
.end method
