.class public Landroidx/wear/widget/drawer/WearableDrawerLayout;
.super Landroid/widget/FrameLayout;
.source "WearableDrawerLayout.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;
.implements Landroidx/core/view/NestedScrollingParent;
.implements Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/widget/drawer/WearableDrawerLayout$ClosePeekRunnable;,
        Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;,
        Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;,
        Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerStateCallback;,
        Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerDraggerCallback;
    }
.end annotation


# static fields
.field private static final DOWN:I = 0x1

.field private static final GRAVITY_UNDEFINED:I = -0x1

.field private static final NESTED_SCROLL_SLOP_DP:I = 0x5

.field private static final OPENED_PERCENT_THRESHOLD:F = 0.5f

.field private static final PEEK_AUTO_CLOSE_DELAY_MS:I = 0x3e8

.field private static final PEEK_FADE_DURATION_MS:I = 0x96

.field private static final TAG:Ljava/lang/String; = "WearableDrawerLayout"

.field private static final UP:I = -0x1


# instance fields
.field final mBottomDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

.field final mBottomDrawerDraggerCallback:Landroidx/customview/widget/ViewDragHelper$Callback;

.field mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

.field mCanBottomDrawerBeClosed:Z

.field mCanTopDrawerBeClosed:Z

.field private final mCloseBottomPeekRunnable:Landroidx/wear/widget/drawer/WearableDrawerLayout$ClosePeekRunnable;

.field private final mCloseTopPeekRunnable:Landroidx/wear/widget/drawer/WearableDrawerLayout$ClosePeekRunnable;

.field private mCurrentNestedScrollSlopTracker:I

.field private mDrawerOpenLastInterceptedTouchEvent:Landroid/view/MotionEvent;

.field mDrawerStateCallback:Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerStateCallback;

.field private final mFlingWatcher:Landroidx/wear/widget/drawer/FlingWatcherFactory;

.field private final mIsAccessibilityEnabled:Z

.field private mLastScrollWasFling:Z

.field private final mMainThreadHandler:Landroid/os/Handler;

.field private final mNestedScrollSlopPx:I

.field private final mNestedScrollingParentHelper:Landroidx/core/view/NestedScrollingParentHelper;

.field mScrollingContentView:Landroid/view/View;

.field mShouldOpenBottomDrawerAfterLayout:Z

.field mShouldOpenTopDrawerAfterLayout:Z

.field mShouldPeekBottomDrawerAfterLayout:Z

.field mShouldPeekTopDrawerAfterLayout:Z

.field private mSystemWindowInsetBottom:I

.field final mTopDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

.field final mTopDrawerDraggerCallback:Landroidx/customview/widget/ViewDragHelper$Callback;

.field mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 222
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 223
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 226
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 227
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .line 230
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 231
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .line 236
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 143
    new-instance v0, Landroidx/core/view/NestedScrollingParentHelper;

    invoke-direct {v0, p0}, Landroidx/core/view/NestedScrollingParentHelper;-><init>(Landroid/view/ViewGroup;)V

    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mNestedScrollingParentHelper:Landroidx/core/view/NestedScrollingParentHelper;

    .line 155
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mMainThreadHandler:Landroid/os/Handler;

    .line 156
    new-instance v0, Landroidx/wear/widget/drawer/WearableDrawerLayout$ClosePeekRunnable;

    const/16 v1, 0x30

    invoke-direct {v0, p0, v1}, Landroidx/wear/widget/drawer/WearableDrawerLayout$ClosePeekRunnable;-><init>(Landroidx/wear/widget/drawer/WearableDrawerLayout;I)V

    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mCloseTopPeekRunnable:Landroidx/wear/widget/drawer/WearableDrawerLayout$ClosePeekRunnable;

    .line 157
    new-instance v0, Landroidx/wear/widget/drawer/WearableDrawerLayout$ClosePeekRunnable;

    const/16 v1, 0x50

    invoke-direct {v0, p0, v1}, Landroidx/wear/widget/drawer/WearableDrawerLayout$ClosePeekRunnable;-><init>(Landroidx/wear/widget/drawer/WearableDrawerLayout;I)V

    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mCloseBottomPeekRunnable:Landroidx/wear/widget/drawer/WearableDrawerLayout$ClosePeekRunnable;

    .line 238
    new-instance v0, Landroidx/wear/widget/drawer/FlingWatcherFactory;

    invoke-direct {v0, p0}, Landroidx/wear/widget/drawer/FlingWatcherFactory;-><init>(Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;)V

    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mFlingWatcher:Landroidx/wear/widget/drawer/FlingWatcherFactory;

    .line 239
    new-instance v0, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;

    invoke-direct {v0, p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout$TopDrawerDraggerCallback;-><init>(Landroidx/wear/widget/drawer/WearableDrawerLayout;)V

    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerDraggerCallback:Landroidx/customview/widget/ViewDragHelper$Callback;

    .line 240
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerDraggerCallback:Landroidx/customview/widget/ViewDragHelper$Callback;

    .line 241
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {p0, v1, v0}, Landroidx/customview/widget/ViewDragHelper;->create(Landroid/view/ViewGroup;FLandroidx/customview/widget/ViewDragHelper$Callback;)Landroidx/customview/widget/ViewDragHelper;

    move-result-object v0

    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

    .line 242
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Landroidx/customview/widget/ViewDragHelper;->setEdgeTrackingEnabled(I)V

    .line 244
    new-instance v0, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;

    invoke-direct {v0, p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout$BottomDrawerDraggerCallback;-><init>(Landroidx/wear/widget/drawer/WearableDrawerLayout;)V

    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerDraggerCallback:Landroidx/customview/widget/ViewDragHelper$Callback;

    .line 245
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerDraggerCallback:Landroidx/customview/widget/ViewDragHelper$Callback;

    .line 246
    invoke-static {p0, v1, v0}, Landroidx/customview/widget/ViewDragHelper;->create(Landroid/view/ViewGroup;FLandroidx/customview/widget/ViewDragHelper$Callback;)Landroidx/customview/widget/ViewDragHelper;

    move-result-object v0

    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

    .line 247
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroidx/customview/widget/ViewDragHelper;->setEdgeTrackingEnabled(I)V

    .line 249
    nop

    .line 250
    const-string/jumbo v0, "window"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .line 251
    .local v0, "windowManager":Landroid/view/WindowManager;
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .line 252
    .local v1, "metrics":Landroid/util/DisplayMetrics;
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 253
    iget v2, v1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v3, 0x40a00000    # 5.0f

    mul-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iput v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mNestedScrollSlopPx:I

    .line 255
    nop

    .line 256
    const-string v2, "accessibility"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/accessibility/AccessibilityManager;

    .line 257
    .local v2, "accessibilityManager":Landroid/view/accessibility/AccessibilityManager;
    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v3

    iput-boolean v3, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mIsAccessibilityEnabled:Z

    .line 258
    return-void
.end method

.method static animatePeekVisibleAfterBeingClosed(Landroidx/wear/widget/drawer/WearableDrawerView;)V
    .locals 5
    .param p0, "drawer"    # Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 261
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerView;->getDrawerContent()Landroid/view/View;

    move-result-object v0

    .line 262
    .local v0, "content":Landroid/view/View;
    const-wide/16 v1, 0x96

    if-eqz v0, :cond_0

    .line 263
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    .line 264
    invoke-virtual {v3, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    .line 265
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    new-instance v4, Landroidx/wear/widget/drawer/WearableDrawerLayout$1;

    invoke-direct {v4, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout$1;-><init>(Landroid/view/View;)V

    .line 266
    invoke-virtual {v3, v4}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    .line 273
    invoke-virtual {v3}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 276
    :cond_0
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerView;->getPeekContainer()Landroid/view/ViewGroup;

    move-result-object v3

    .line 277
    .local v3, "peek":Landroid/view/ViewGroup;
    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 278
    invoke-virtual {v3}, Landroid/view/ViewGroup;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    .line 279
    invoke-virtual {v4, v1, v2}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    .line 280
    invoke-virtual {v4, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    .line 281
    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    .line 282
    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    .line 283
    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    .line 284
    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 286
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Landroidx/wear/widget/drawer/WearableDrawerView;->setIsPeeking(Z)V

    .line 287
    return-void
.end method

.method private isClosingPeek(Landroidx/wear/widget/drawer/WearableDrawerView;)Z
    .locals 2
    .param p1, "drawerView"    # Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 882
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroidx/wear/widget/drawer/WearableDrawerView;->getDrawerState()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isDrawerOrChildOfDrawer(Landroid/view/View;)Z
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .line 870
    nop

    :goto_0
    if-eqz p1, :cond_1

    if-eq p1, p0, :cond_1

    .line 871
    instance-of v0, p1, Landroidx/wear/widget/drawer/WearableDrawerView;

    if-eqz v0, :cond_0

    .line 872
    const/4 v0, 0x1

    return v0

    .line 875
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    move-object p1, v0

    check-cast p1, Landroid/view/View;

    goto :goto_0

    .line 878
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private maybePeekDrawer(Landroidx/wear/widget/drawer/WearableDrawerView;)V
    .locals 8
    .param p1, "drawerView"    # Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 775
    if-nez p1, :cond_0

    .line 776
    return-void

    .line 778
    :cond_0
    invoke-virtual {p1}, Landroidx/wear/widget/drawer/WearableDrawerView;->getPeekContainer()Landroid/view/ViewGroup;

    move-result-object v0

    .line 779
    .local v0, "peekView":Landroid/view/View;
    if-nez v0, :cond_1

    .line 780
    return-void

    .line 783
    :cond_1
    invoke-virtual {p1}, Landroidx/wear/widget/drawer/WearableDrawerView;->getDrawerContent()Landroid/view/View;

    move-result-object v1

    .line 784
    .local v1, "drawerContent":Landroid/view/View;
    invoke-virtual {p1}, Landroidx/wear/widget/drawer/WearableDrawerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    iget v2, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 786
    .local v2, "layoutGravity":I
    if-nez v2, :cond_2

    invoke-virtual {p1}, Landroidx/wear/widget/drawer/WearableDrawerView;->preferGravity()I

    move-result v3

    goto :goto_0

    :cond_2
    move v3, v2

    .line 788
    .local v3, "gravity":I
    :goto_0
    const/4 v4, 0x1

    invoke-virtual {p1, v4}, Landroidx/wear/widget/drawer/WearableDrawerView;->setIsPeeking(Z)V

    .line 789
    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v0, v4}, Landroid/view/View;->setAlpha(F)V

    .line 790
    invoke-virtual {v0, v4}, Landroid/view/View;->setScaleX(F)V

    .line 791
    invoke-virtual {v0, v4}, Landroid/view/View;->setScaleY(F)V

    .line 792
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 793
    if-eqz v1, :cond_3

    .line 794
    const/4 v5, 0x0

    invoke-virtual {v1, v5}, Landroid/view/View;->setAlpha(F)V

    .line 795
    const/16 v5, 0x8

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 798
    :cond_3
    const/16 v5, 0x50

    if-ne v3, v5, :cond_4

    .line 799
    iget-object v5, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

    .line 800
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->getHeight()I

    move-result v6

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v7

    sub-int/2addr v6, v7

    .line 799
    invoke-virtual {v5, p1, v4, v6}, Landroidx/customview/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    goto :goto_1

    .line 801
    :cond_4
    const/16 v5, 0x30

    if-ne v3, v5, :cond_5

    .line 802
    iget-object v5, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

    .line 804
    invoke-virtual {p1}, Landroidx/wear/widget/drawer/WearableDrawerView;->getHeight()I

    move-result v6

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v7

    sub-int/2addr v6, v7

    neg-int v6, v6

    .line 802
    invoke-virtual {v5, p1, v4, v6}, Landroidx/customview/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    .line 805
    iget-boolean v4, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mIsAccessibilityEnabled:Z

    if-nez v4, :cond_5

    .line 807
    const-wide/16 v4, 0x3e8

    invoke-virtual {p0, v3, v4, v5}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->closeDrawerDelayed(IJ)V

    .line 811
    :cond_5
    :goto_1
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->invalidate()V

    .line 812
    return-void
.end method

.method private maybeUpdateScrollingContentView(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .line 861
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mScrollingContentView:Landroid/view/View;

    if-eq p1, v0, :cond_0

    invoke-direct {p0, p1}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->isDrawerOrChildOfDrawer(Landroid/view/View;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 862
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mScrollingContentView:Landroid/view/View;

    .line 864
    :cond_0
    return-void
.end method

.method static showDrawerContentMaybeAnimate(Landroidx/wear/widget/drawer/WearableDrawerView;)V
    .locals 7
    .param p0, "drawerView"    # Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 294
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerView;->bringToFront()V

    .line 295
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerView;->getDrawerContent()Landroid/view/View;

    move-result-object v0

    .line 296
    .local v0, "contentView":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 297
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 300
    :cond_0
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerView;->isPeeking()Z

    move-result v1

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    if-eqz v1, :cond_2

    .line 301
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerView;->getPeekContainer()Landroid/view/ViewGroup;

    move-result-object v1

    .line 302
    .local v1, "peekView":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    const-wide/16 v5, 0x96

    invoke-virtual {v4, v5, v6}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v4

    .line 303
    invoke-virtual {v4}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 305
    if-eqz v0, :cond_1

    .line 306
    invoke-virtual {v0, v3}, Landroid/view/View;->setAlpha(F)V

    .line 307
    nop

    .line 308
    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    .line 309
    invoke-virtual {v3, v5, v6}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v3

    .line 310
    invoke-virtual {v3, v2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    .line 311
    invoke-virtual {v2, v5, v6}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v2

    .line 312
    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 314
    .end local v1    # "peekView":Landroid/view/View;
    :cond_1
    goto :goto_0

    .line 315
    :cond_2
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerView;->getPeekContainer()Landroid/view/ViewGroup;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 316
    if-eqz v0, :cond_3

    .line 317
    invoke-virtual {v0, v2}, Landroid/view/View;->setAlpha(F)V

    .line 320
    :cond_3
    :goto_0
    return-void
.end method


# virtual methods
.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 4
    .param p1, "child"    # Landroid/view/View;
    .param p2, "index"    # I
    .param p3, "params"    # Landroid/view/ViewGroup$LayoutParams;

    .line 541
    invoke-super {p0, p1, p2, p3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 543
    instance-of v0, p1, Landroidx/wear/widget/drawer/WearableDrawerView;

    if-nez v0, :cond_0

    .line 544
    return-void

    .line 547
    :cond_0
    move-object v0, p1

    check-cast v0, Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 548
    .local v0, "drawerChild":Landroidx/wear/widget/drawer/WearableDrawerView;
    new-instance v1, Landroidx/wear/widget/drawer/WearableDrawerController;

    invoke-direct {v1, p0, v0}, Landroidx/wear/widget/drawer/WearableDrawerController;-><init>(Landroidx/wear/widget/drawer/WearableDrawerLayout;Landroidx/wear/widget/drawer/WearableDrawerView;)V

    invoke-virtual {v0, v1}, Landroidx/wear/widget/drawer/WearableDrawerView;->setDrawerController(Landroidx/wear/widget/drawer/WearableDrawerController;)V

    .line 549
    move-object v1, p3

    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    iget v1, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 551
    .local v1, "childGravity":I
    if-eqz v1, :cond_1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_2

    .line 552
    :cond_1
    move-object v2, p3

    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->preferGravity()I

    move-result v3

    iput v3, v2, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 553
    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->preferGravity()I

    move-result v1

    .line 554
    invoke-virtual {v0, p3}, Landroidx/wear/widget/drawer/WearableDrawerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 557
    :cond_2
    const/16 v2, 0x30

    if-ne v1, v2, :cond_3

    .line 558
    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 559
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    .local v2, "drawerView":Landroidx/wear/widget/drawer/WearableDrawerView;
    goto :goto_0

    .line 560
    .end local v2    # "drawerView":Landroidx/wear/widget/drawer/WearableDrawerView;
    :cond_3
    const/16 v2, 0x50

    if-ne v1, v2, :cond_4

    .line 561
    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 562
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    .restart local v2    # "drawerView":Landroidx/wear/widget/drawer/WearableDrawerView;
    goto :goto_0

    .line 564
    .end local v2    # "drawerView":Landroidx/wear/widget/drawer/WearableDrawerView;
    :cond_4
    const/4 v2, 0x0

    .line 567
    .restart local v2    # "drawerView":Landroidx/wear/widget/drawer/WearableDrawerView;
    :goto_0
    if-eqz v2, :cond_5

    .line 568
    invoke-virtual {v2, p0}, Landroidx/wear/widget/drawer/WearableDrawerView;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    .line 570
    :cond_5
    return-void
.end method

.method allowAccessibilityFocusOnAllChildren()V
    .locals 3

    .line 945
    iget-boolean v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mIsAccessibilityEnabled:Z

    if-nez v0, :cond_0

    .line 946
    return-void

    .line 949
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 950
    invoke-virtual {p0, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 949
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 952
    .end local v0    # "i":I
    :cond_1
    return-void
.end method

.method allowAccessibilityFocusOnOnly(Landroidx/wear/widget/drawer/WearableDrawerView;)V
    .locals 3
    .param p1, "drawer"    # Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 955
    iget-boolean v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mIsAccessibilityEnabled:Z

    if-nez v0, :cond_0

    .line 956
    return-void

    .line 959
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 960
    invoke-virtual {p0, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 961
    .local v1, "child":Landroid/view/View;
    if-eq v1, p1, :cond_1

    .line 962
    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/view/View;->setImportantForAccessibility(I)V

    .line 959
    .end local v1    # "child":Landroid/view/View;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 966
    .end local v0    # "i":I
    :cond_2
    return-void
.end method

.method canDrawerContentScrollVertically(Landroidx/wear/widget/drawer/WearableDrawerView;I)Z
    .locals 2
    .param p1, "drawerView"    # Landroidx/wear/widget/drawer/WearableDrawerView;
    .param p2, "direction"    # I

    .line 905
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 906
    return v0

    .line 909
    :cond_0
    invoke-virtual {p1}, Landroidx/wear/widget/drawer/WearableDrawerView;->getDrawerContent()Landroid/view/View;

    move-result-object v1

    .line 910
    .local v1, "drawerContent":Landroid/view/View;
    if-nez v1, :cond_1

    .line 911
    return v0

    .line 914
    :cond_1
    invoke-virtual {v1, p2}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v0

    return v0
.end method

.method closeDrawer(I)V
    .locals 1
    .param p1, "gravity"    # I

    .line 360
    invoke-virtual {p0, p1}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->findDrawerWithGravity(I)Landroidx/wear/widget/drawer/WearableDrawerView;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->closeDrawer(Landroidx/wear/widget/drawer/WearableDrawerView;)V

    .line 361
    return-void
.end method

.method closeDrawer(Landroidx/wear/widget/drawer/WearableDrawerView;)V
    .locals 4
    .param p1, "drawer"    # Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 369
    if-nez p1, :cond_0

    .line 370
    return-void

    .line 372
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    const/4 v1, 0x0

    if-ne p1, v0, :cond_1

    .line 373
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    iget-object v3, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 374
    invoke-virtual {v3}, Landroidx/wear/widget/drawer/WearableDrawerView;->getHeight()I

    move-result v3

    neg-int v3, v3

    .line 373
    invoke-virtual {v0, v2, v1, v3}, Landroidx/customview/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    .line 375
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->invalidate()V

    goto :goto_0

    .line 376
    :cond_1
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-ne p1, v0, :cond_2

    .line 377
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 378
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->getHeight()I

    move-result v3

    invoke-virtual {v0, v2, v1, v3}, Landroidx/customview/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    .line 379
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->invalidate()V

    goto :goto_0

    .line 381
    :cond_2
    const-string v0, "WearableDrawerLayout"

    const-string v1, "closeDrawer(View) should be passed in the top or bottom drawer"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 383
    :goto_0
    return-void
.end method

.method closeDrawerDelayed(IJ)V
    .locals 2
    .param p1, "gravity"    # I
    .param p2, "delayMs"    # J

    .line 340
    sparse-switch p1, :sswitch_data_0

    .line 350
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invoked a delayed drawer close with an invalid gravity: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "WearableDrawerLayout"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 346
    :sswitch_0
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mMainThreadHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mCloseBottomPeekRunnable:Landroidx/wear/widget/drawer/WearableDrawerLayout$ClosePeekRunnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 347
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mMainThreadHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mCloseBottomPeekRunnable:Landroidx/wear/widget/drawer/WearableDrawerLayout$ClosePeekRunnable;

    invoke-virtual {v0, v1, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 348
    goto :goto_0

    .line 342
    :sswitch_1
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mMainThreadHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mCloseTopPeekRunnable:Landroidx/wear/widget/drawer/WearableDrawerLayout$ClosePeekRunnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 343
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mMainThreadHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mCloseTopPeekRunnable:Landroidx/wear/widget/drawer/WearableDrawerLayout$ClosePeekRunnable;

    invoke-virtual {v0, v1, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 344
    nop

    .line 352
    :goto_0
    return-void

    nop

    :sswitch_data_0
    .sparse-switch
        0x30 -> :sswitch_1
        0x50 -> :sswitch_0
    .end sparse-switch
.end method

.method public computeScroll()V
    .locals 3

    .line 531
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/customview/widget/ViewDragHelper;->continueSettling(Z)Z

    move-result v0

    .line 532
    .local v0, "topSettling":Z
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

    invoke-virtual {v2, v1}, Landroidx/customview/widget/ViewDragHelper;->continueSettling(Z)Z

    move-result v1

    .line 534
    .local v1, "bottomSettling":Z
    if-nez v0, :cond_0

    if-eqz v1, :cond_1

    .line 535
    :cond_0
    invoke-static {p0}, Landroidx/core/view/ViewCompat;->postInvalidateOnAnimation(Landroid/view/View;)V

    .line 537
    :cond_1
    return-void
.end method

.method findDrawerWithGravity(I)Landroidx/wear/widget/drawer/WearableDrawerView;
    .locals 2
    .param p1, "gravity"    # I

    .line 845
    sparse-switch p1, :sswitch_data_0

    .line 851
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invalid drawer gravity: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "WearableDrawerLayout"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 852
    const/4 v0, 0x0

    return-object v0

    .line 849
    :sswitch_0
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    return-object v0

    .line 847
    :sswitch_1
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x30 -> :sswitch_1
        0x50 -> :sswitch_0
    .end sparse-switch
.end method

.method public getNestedScrollAxes()I
    .locals 1

    .line 662
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mNestedScrollingParentHelper:Landroidx/core/view/NestedScrollingParentHelper;

    invoke-virtual {v0}, Landroidx/core/view/NestedScrollingParentHelper;->getNestedScrollAxes()I

    move-result v0

    return v0
.end method

.method public onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .locals 2
    .param p1, "insets"    # Landroid/view/WindowInsets;

    .line 325
    invoke-virtual {p1}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v0

    iput v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mSystemWindowInsetBottom:I

    .line 327
    iget v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mSystemWindowInsetBottom:I

    if-eqz v0, :cond_0

    .line 328
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 329
    .local v0, "layoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    iget v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mSystemWindowInsetBottom:I

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 330
    invoke-virtual {p0, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 333
    .end local v0    # "layoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object v0

    return-object v0
.end method

.method public onFlingComplete(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .line 640
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->isAutoPeekEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    .line 641
    .local v0, "canTopPeek":Z
    :goto_0
    iget-object v3, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-eqz v3, :cond_1

    iget-object v3, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v3}, Landroidx/wear/widget/drawer/WearableDrawerView;->isAutoPeekEnabled()Z

    move-result v3

    if-eqz v3, :cond_1

    move v1, v2

    .line 642
    .local v1, "canBottomPeek":Z
    :cond_1
    const/4 v3, -0x1

    invoke-virtual {p1, v3}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v3

    .line 643
    .local v3, "canScrollUp":Z
    invoke-virtual {p1, v2}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v2

    .line 645
    .local v2, "canScrollDown":Z
    if-nez v3, :cond_2

    if-nez v2, :cond_2

    .line 649
    return-void

    .line 652
    :cond_2
    if-eqz v0, :cond_3

    if-nez v3, :cond_3

    iget-object v4, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v4}, Landroidx/wear/widget/drawer/WearableDrawerView;->isPeeking()Z

    move-result v4

    if-nez v4, :cond_3

    .line 653
    const/16 v4, 0x30

    invoke-virtual {p0, v4}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->peekDrawer(I)V

    .line 655
    :cond_3
    if-eqz v1, :cond_5

    if-eqz v3, :cond_4

    if-nez v2, :cond_5

    :cond_4
    iget-object v4, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v4}, Landroidx/wear/widget/drawer/WearableDrawerView;->isPeeking()Z

    move-result v4

    if-nez v4, :cond_5

    .line 656
    const/16 v4, 0x50

    invoke-virtual {p0, v4}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->peekDrawer(I)V

    .line 658
    :cond_5
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .line 503
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mCanBottomDrawerBeClosed:Z

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 504
    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mCanTopDrawerBeClosed:Z

    if-nez v0, :cond_2

    .line 506
    :cond_1
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mDrawerOpenLastInterceptedTouchEvent:Landroid/view/MotionEvent;

    .line 507
    return v1

    .line 511
    :cond_2
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

    invoke-virtual {v0, p1}, Landroidx/customview/widget/ViewDragHelper;->shouldInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    .line 512
    .local v0, "shouldInterceptTop":Z
    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

    invoke-virtual {v2, p1}, Landroidx/customview/widget/ViewDragHelper;->shouldInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v2

    .line 513
    .local v2, "shouldInterceptBottom":Z
    if-nez v0, :cond_3

    if-eqz v2, :cond_4

    :cond_3
    const/4 v1, 0x1

    :cond_4
    return v1
.end method

.method protected onLayout(ZIIII)V
    .locals 3
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .line 607
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 608
    move v0, p5

    move p5, p4

    move p4, p3

    move p3, p2

    move p2, p1

    move-object p1, p0

    .end local p1    # "changed":Z
    .local v0, "bottom":I
    .local p2, "changed":Z
    .local p3, "left":I
    .local p4, "top":I
    .local p5, "right":I
    iget-boolean v1, p1, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mShouldPeekBottomDrawerAfterLayout:Z

    if-nez v1, :cond_0

    iget-boolean v1, p1, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mShouldPeekTopDrawerAfterLayout:Z

    if-nez v1, :cond_0

    iget-boolean v1, p1, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mShouldOpenTopDrawerAfterLayout:Z

    if-nez v1, :cond_0

    iget-boolean v1, p1, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mShouldOpenBottomDrawerAfterLayout:Z

    if-eqz v1, :cond_1

    .line 612
    :cond_0
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    new-instance v2, Landroidx/wear/widget/drawer/WearableDrawerLayout$2;

    invoke-direct {v2, p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout$2;-><init>(Landroidx/wear/widget/drawer/WearableDrawerLayout;)V

    .line 613
    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 636
    :cond_1
    return-void
.end method

.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I
    .param p6, "oldLeft"    # I
    .param p7, "oldTop"    # I
    .param p8, "oldRight"    # I
    .param p9, "oldBottom"    # I

    .line 583
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-ne p1, v0, :cond_0

    .line 585
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->getOpenedPercent()F

    move-result v0

    .line 586
    .local v0, "openedPercent":F
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    .line 587
    .local v1, "height":I
    neg-int v2, v1

    int-to-float v3, v1

    mul-float/2addr v3, v0

    float-to-int v3, v3

    add-int/2addr v2, v3

    .line 588
    .local v2, "childTop":I
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v4

    add-int v5, v2, v1

    invoke-virtual {p1, v3, v2, v4, v5}, Landroid/view/View;->layout(IIII)V

    .end local v0    # "openedPercent":F
    .end local v1    # "height":I
    .end local v2    # "childTop":I
    goto :goto_0

    .line 589
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-ne p1, v0, :cond_1

    .line 591
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->getOpenedPercent()F

    move-result v0

    .line 592
    .restart local v0    # "openedPercent":F
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    .line 593
    .restart local v1    # "height":I
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->getHeight()I

    move-result v2

    int-to-float v2, v2

    int-to-float v3, v1

    mul-float/2addr v3, v0

    sub-float/2addr v2, v3

    float-to-int v2, v2

    .line 594
    .restart local v2    # "childTop":I
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v4

    add-int v5, v2, v1

    invoke-virtual {p1, v3, v2, v4, v5}, Landroid/view/View;->layout(IIII)V

    goto :goto_1

    .line 589
    .end local v0    # "openedPercent":F
    .end local v1    # "height":I
    .end local v2    # "childTop":I
    :cond_1
    :goto_0
    nop

    .line 596
    :goto_1
    return-void
.end method

.method public onNestedFling(Landroid/view/View;FFZ)Z
    .locals 1
    .param p1, "target"    # Landroid/view/View;
    .param p2, "velocityX"    # F
    .param p3, "velocityY"    # F
    .param p4, "consumed"    # Z

    .line 668
    const/4 v0, 0x0

    return v0
.end method

.method public onNestedPreFling(Landroid/view/View;FF)Z
    .locals 2
    .param p1, "target"    # Landroid/view/View;
    .param p2, "velocityX"    # F
    .param p3, "velocityY"    # F

    .line 673
    invoke-direct {p0, p1}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->maybeUpdateScrollingContentView(Landroid/view/View;)V

    .line 674
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mLastScrollWasFling:Z

    .line 676
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mScrollingContentView:Landroid/view/View;

    if-ne p1, v0, :cond_0

    .line 677
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mFlingWatcher:Landroidx/wear/widget/drawer/FlingWatcherFactory;

    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mScrollingContentView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroidx/wear/widget/drawer/FlingWatcherFactory;->getFor(Landroid/view/View;)Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingWatcher;

    move-result-object v0

    .line 678
    .local v0, "flingWatcher":Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingWatcher;
    if-eqz v0, :cond_0

    .line 679
    invoke-interface {v0}, Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingWatcher;->watch()V

    .line 683
    .end local v0    # "flingWatcher":Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingWatcher;
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onNestedPreScroll(Landroid/view/View;II[I)V
    .locals 0
    .param p1, "target"    # Landroid/view/View;
    .param p2, "dx"    # I
    .param p3, "dy"    # I
    .param p4, "consumed"    # [I

    .line 688
    invoke-direct {p0, p1}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->maybeUpdateScrollingContentView(Landroid/view/View;)V

    .line 689
    return-void
.end method

.method public onNestedScroll(Landroid/view/View;IIII)V
    .locals 14
    .param p1, "target"    # Landroid/view/View;
    .param p2, "dxConsumed"    # I
    .param p3, "dyConsumed"    # I
    .param p4, "dxUnconsumed"    # I
    .param p5, "dyUnconsumed"    # I

    .line 695
    const/4 v0, 0x1

    const/4 v1, 0x0

    if-gez p3, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    .line 696
    .local v2, "scrolledUp":Z
    :goto_0
    if-lez p3, :cond_1

    move v3, v0

    goto :goto_1

    :cond_1
    move v3, v1

    .line 697
    .local v3, "scrolledDown":Z
    :goto_1
    if-gez p5, :cond_2

    move v4, v0

    goto :goto_2

    :cond_2
    move v4, v1

    .line 698
    .local v4, "overScrolledUp":Z
    :goto_2
    if-lez p5, :cond_3

    move v5, v0

    goto :goto_3

    :cond_3
    move v5, v1

    .line 701
    .local v5, "overScrolledDown":Z
    :goto_3
    iget-object v6, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-eqz v6, :cond_7

    iget-object v6, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v6}, Landroidx/wear/widget/drawer/WearableDrawerView;->isOpened()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 704
    if-nez v5, :cond_5

    iget-object v6, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 705
    invoke-virtual {v6}, Landroidx/wear/widget/drawer/WearableDrawerView;->getDrawerContent()Landroid/view/View;

    move-result-object v6

    .line 706
    invoke-virtual {v6, v0}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v6

    if-nez v6, :cond_4

    goto :goto_4

    :cond_4
    move v0, v1

    goto :goto_5

    :cond_5
    :goto_4
    nop

    :goto_5
    iput-boolean v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mCanTopDrawerBeClosed:Z

    .line 710
    iget-boolean v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mCanTopDrawerBeClosed:Z

    if-eqz v0, :cond_6

    iget-boolean v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mLastScrollWasFling:Z

    if-eqz v0, :cond_6

    .line 711
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mDrawerOpenLastInterceptedTouchEvent:Landroid/view/MotionEvent;

    invoke-virtual {p0, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 713
    :cond_6
    iput-boolean v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mLastScrollWasFling:Z

    .line 714
    return-void

    .line 718
    :cond_7
    iget-object v6, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-eqz v6, :cond_9

    iget-object v6, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v6}, Landroidx/wear/widget/drawer/WearableDrawerView;->isOpened()Z

    move-result v6

    if-eqz v6, :cond_9

    .line 720
    iput-boolean v4, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mCanBottomDrawerBeClosed:Z

    .line 724
    iget-boolean v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mCanBottomDrawerBeClosed:Z

    if-eqz v0, :cond_8

    iget-boolean v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mLastScrollWasFling:Z

    if-eqz v0, :cond_8

    .line 725
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mDrawerOpenLastInterceptedTouchEvent:Landroid/view/MotionEvent;

    invoke-virtual {p0, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 727
    :cond_8
    iput-boolean v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mLastScrollWasFling:Z

    .line 728
    return-void

    .line 731
    :cond_9
    iput-boolean v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mLastScrollWasFling:Z

    .line 737
    iget-object v6, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-eqz v6, :cond_a

    iget-object v6, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v6}, Landroidx/wear/widget/drawer/WearableDrawerView;->isAutoPeekEnabled()Z

    move-result v6

    if-eqz v6, :cond_a

    move v6, v0

    goto :goto_6

    :cond_a
    move v6, v1

    .line 738
    .local v6, "canTopAutoPeek":Z
    :goto_6
    iget-object v7, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-eqz v7, :cond_b

    iget-object v7, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 739
    invoke-virtual {v7}, Landroidx/wear/widget/drawer/WearableDrawerView;->isAutoPeekEnabled()Z

    move-result v7

    if-eqz v7, :cond_b

    move v7, v0

    goto :goto_7

    :cond_b
    move v7, v1

    .line 740
    .local v7, "canBottomAutoPeek":Z
    :goto_7
    iget-object v8, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-eqz v8, :cond_c

    iget-object v8, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v8}, Landroidx/wear/widget/drawer/WearableDrawerView;->isPeeking()Z

    move-result v8

    if-eqz v8, :cond_c

    move v8, v0

    goto :goto_8

    :cond_c
    move v8, v1

    .line 741
    .local v8, "isTopDrawerPeeking":Z
    :goto_8
    iget-object v9, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-eqz v9, :cond_d

    iget-object v9, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v9}, Landroidx/wear/widget/drawer/WearableDrawerView;->isPeeking()Z

    move-result v9

    if-eqz v9, :cond_d

    move v9, v0

    goto :goto_9

    :cond_d
    move v9, v1

    .line 742
    .local v9, "isBottomDrawerPeeking":Z
    :goto_9
    const/4 v10, 0x0

    .line 743
    .local v10, "scrolledDownPastSlop":Z
    iget-object v11, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-eqz v11, :cond_e

    iget-object v11, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 744
    invoke-virtual {v11}, Landroidx/wear/widget/drawer/WearableDrawerView;->isPeekOnScrollDownEnabled()Z

    move-result v11

    if-eqz v11, :cond_e

    move v11, v0

    goto :goto_a

    :cond_e
    move v11, v1

    .line 745
    .local v11, "shouldPeekOnScrollDown":Z
    :goto_a
    if-eqz v3, :cond_10

    .line 746
    iget v12, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mCurrentNestedScrollSlopTracker:I

    add-int v12, v12, p3

    iput v12, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mCurrentNestedScrollSlopTracker:I

    .line 747
    iget v12, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mCurrentNestedScrollSlopTracker:I

    iget v13, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mNestedScrollSlopPx:I

    if-le v12, v13, :cond_f

    goto :goto_b

    :cond_f
    move v0, v1

    :goto_b
    move v10, v0

    .line 750
    :cond_10
    if-eqz v6, :cond_12

    .line 751
    const/16 v0, 0x30

    if-eqz v4, :cond_11

    if-nez v8, :cond_11

    .line 752
    invoke-virtual {p0, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->peekDrawer(I)V

    goto :goto_c

    .line 753
    :cond_11
    if-eqz v3, :cond_12

    if-eqz v8, :cond_12

    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-direct {p0, v1}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->isClosingPeek(Landroidx/wear/widget/drawer/WearableDrawerView;)Z

    move-result v1

    if-nez v1, :cond_12

    .line 754
    invoke-virtual {p0, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->closeDrawer(I)V

    .line 758
    :cond_12
    :goto_c
    if-eqz v7, :cond_17

    .line 759
    const/16 v0, 0x50

    if-nez v5, :cond_13

    if-eqz v4, :cond_14

    :cond_13
    if-nez v9, :cond_14

    .line 760
    invoke-virtual {p0, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->peekDrawer(I)V

    goto :goto_d

    .line 761
    :cond_14
    if-eqz v11, :cond_15

    if-eqz v10, :cond_15

    if-nez v9, :cond_15

    .line 762
    invoke-virtual {p0, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->peekDrawer(I)V

    goto :goto_d

    .line 763
    :cond_15
    if-nez v2, :cond_16

    if-nez v11, :cond_17

    if-eqz v3, :cond_17

    :cond_16
    if-eqz v9, :cond_17

    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 765
    invoke-direct {p0, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->isClosingPeek(Landroidx/wear/widget/drawer/WearableDrawerView;)Z

    move-result v0

    if-nez v0, :cond_17

    .line 766
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {p0, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->closeDrawer(Landroidx/wear/widget/drawer/WearableDrawerView;)V

    .line 769
    :cond_17
    :goto_d
    return-void
.end method

.method public onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V
    .locals 1
    .param p1, "child"    # Landroid/view/View;
    .param p2, "target"    # Landroid/view/View;
    .param p3, "axes"    # I

    .line 888
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mNestedScrollingParentHelper:Landroidx/core/view/NestedScrollingParentHelper;

    invoke-virtual {v0, p1, p2, p3}, Landroidx/core/view/NestedScrollingParentHelper;->onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V

    .line 889
    return-void
.end method

.method public onStartNestedScroll(Landroid/view/View;Landroid/view/View;I)Z
    .locals 1
    .param p1, "child"    # Landroid/view/View;
    .param p2, "target"    # Landroid/view/View;
    .param p3, "axes"    # I

    .line 894
    const/4 v0, 0x0

    iput v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mCurrentNestedScrollSlopTracker:I

    .line 895
    const/4 v0, 0x1

    return v0
.end method

.method public onStopNestedScroll(Landroid/view/View;)V
    .locals 1
    .param p1, "target"    # Landroid/view/View;

    .line 900
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mNestedScrollingParentHelper:Landroidx/core/view/NestedScrollingParentHelper;

    invoke-virtual {v0, p1}, Landroidx/core/view/NestedScrollingParentHelper;->onStopNestedScroll(Landroid/view/View;)V

    .line 901
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .line 518
    if-nez p1, :cond_0

    .line 519
    const-string v0, "WearableDrawerLayout"

    const-string v1, "null MotionEvent passed to onTouchEvent"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 520
    const/4 v0, 0x0

    return v0

    .line 523
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

    invoke-virtual {v0, p1}, Landroidx/customview/widget/ViewDragHelper;->processTouchEvent(Landroid/view/MotionEvent;)V

    .line 524
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

    invoke-virtual {v0, p1}, Landroidx/customview/widget/ViewDragHelper;->processTouchEvent(Landroid/view/MotionEvent;)V

    .line 525
    const/4 v0, 0x1

    return v0
.end method

.method openDrawer(I)V
    .locals 1
    .param p1, "gravity"    # I

    .line 391
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->isLaidOut()Z

    move-result v0

    if-nez v0, :cond_0

    .line 392
    const/4 v0, 0x1

    sparse-switch p1, :sswitch_data_0

    goto :goto_0

    .line 397
    :sswitch_0
    iput-boolean v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mShouldOpenBottomDrawerAfterLayout:Z

    .line 398
    goto :goto_0

    .line 394
    :sswitch_1
    iput-boolean v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mShouldOpenTopDrawerAfterLayout:Z

    .line 395
    nop

    .line 401
    :goto_0
    return-void

    .line 403
    :cond_0
    invoke-virtual {p0, p1}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->findDrawerWithGravity(I)Landroidx/wear/widget/drawer/WearableDrawerView;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->openDrawer(Landroidx/wear/widget/drawer/WearableDrawerView;)V

    .line 404
    return-void

    :sswitch_data_0
    .sparse-switch
        0x30 -> :sswitch_1
        0x50 -> :sswitch_0
    .end sparse-switch
.end method

.method openDrawer(Landroidx/wear/widget/drawer/WearableDrawerView;)V
    .locals 5
    .param p1, "drawer"    # Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 412
    if-nez p1, :cond_0

    .line 413
    return-void

    .line 415
    :cond_0
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->isLaidOut()Z

    move-result v0

    if-nez v0, :cond_3

    .line 416
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    const/4 v1, 0x1

    if-ne p1, v0, :cond_1

    .line 417
    iput-boolean v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mShouldOpenTopDrawerAfterLayout:Z

    goto :goto_0

    .line 418
    :cond_1
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-ne p1, v0, :cond_2

    .line 419
    iput-boolean v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mShouldOpenBottomDrawerAfterLayout:Z

    .line 421
    :cond_2
    :goto_0
    return-void

    .line 424
    :cond_3
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    const/4 v1, 0x0

    if-ne p1, v0, :cond_4

    .line 425
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 426
    invoke-virtual {v0, v2, v1, v1}, Landroidx/customview/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    .line 427
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-static {v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->showDrawerContentMaybeAnimate(Landroidx/wear/widget/drawer/WearableDrawerView;)V

    .line 428
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->invalidate()V

    goto :goto_1

    .line 429
    :cond_4
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-ne p1, v0, :cond_5

    .line 430
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerDragger:Landroidx/customview/widget/ViewDragHelper;

    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 432
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->getHeight()I

    move-result v3

    iget-object v4, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v4}, Landroidx/wear/widget/drawer/WearableDrawerView;->getHeight()I

    move-result v4

    sub-int/2addr v3, v4

    .line 430
    invoke-virtual {v0, v2, v1, v3}, Landroidx/customview/widget/ViewDragHelper;->smoothSlideViewTo(Landroid/view/View;II)Z

    .line 433
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-static {v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->showDrawerContentMaybeAnimate(Landroidx/wear/widget/drawer/WearableDrawerView;)V

    .line 434
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->invalidate()V

    goto :goto_1

    .line 436
    :cond_5
    const-string v0, "WearableDrawerLayout"

    const-string v1, "openDrawer(View) should be passed in the top or bottom drawer"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 438
    :goto_1
    return-void
.end method

.method openDrawerWithoutAnimation(Landroidx/wear/widget/drawer/WearableDrawerView;)V
    .locals 2
    .param p1, "drawer"    # Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 815
    if-nez p1, :cond_0

    .line 816
    return-void

    .line 820
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-ne p1, v0, :cond_1

    .line 821
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->getHeight()I

    move-result v0

    .local v0, "offset":I
    goto :goto_0

    .line 822
    .end local v0    # "offset":I
    :cond_1
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-ne p1, v0, :cond_3

    .line 823
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->getHeight()I

    move-result v0

    neg-int v0, v0

    .line 829
    .restart local v0    # "offset":I
    :goto_0
    invoke-virtual {p1, v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->offsetTopAndBottom(I)V

    .line 830
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p1, v1}, Landroidx/wear/widget/drawer/WearableDrawerView;->setOpenedPercent(F)V

    .line 831
    invoke-virtual {p1}, Landroidx/wear/widget/drawer/WearableDrawerView;->onDrawerOpened()V

    .line 832
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mDrawerStateCallback:Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerStateCallback;

    if-eqz v1, :cond_2

    .line 833
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mDrawerStateCallback:Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerStateCallback;

    invoke-virtual {v1, p0, p1}, Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerStateCallback;->onDrawerOpened(Landroidx/wear/widget/drawer/WearableDrawerLayout;Landroidx/wear/widget/drawer/WearableDrawerView;)V

    .line 835
    :cond_2
    invoke-static {p1}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->showDrawerContentMaybeAnimate(Landroidx/wear/widget/drawer/WearableDrawerView;)V

    .line 836
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->invalidate()V

    .line 837
    return-void

    .line 825
    .end local v0    # "offset":I
    :cond_3
    const-string v0, "WearableDrawerLayout"

    const-string v1, "openDrawer(View) should be passed in the top or bottom drawer"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 826
    return-void
.end method

.method peekDrawer(I)V
    .locals 2
    .param p1, "gravity"    # I

    .line 447
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->isLaidOut()Z

    move-result v0

    if-nez v0, :cond_1

    .line 449
    const/4 v0, 0x3

    const-string v1, "WearableDrawerLayout"

    invoke-static {v1, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 450
    const-string v0, "WearableDrawerLayout not laid out yet. Postponing peek."

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 452
    :cond_0
    const/4 v0, 0x1

    sparse-switch p1, :sswitch_data_0

    goto :goto_0

    .line 457
    :sswitch_0
    iput-boolean v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mShouldPeekBottomDrawerAfterLayout:Z

    .line 458
    goto :goto_0

    .line 454
    :sswitch_1
    iput-boolean v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mShouldPeekTopDrawerAfterLayout:Z

    .line 455
    nop

    .line 461
    :goto_0
    return-void

    .line 463
    :cond_1
    invoke-virtual {p0, p1}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->findDrawerWithGravity(I)Landroidx/wear/widget/drawer/WearableDrawerView;

    move-result-object v0

    .line 464
    .local v0, "drawerView":Landroidx/wear/widget/drawer/WearableDrawerView;
    invoke-direct {p0, v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->maybePeekDrawer(Landroidx/wear/widget/drawer/WearableDrawerView;)V

    .line 465
    return-void

    :sswitch_data_0
    .sparse-switch
        0x30 -> :sswitch_1
        0x50 -> :sswitch_0
    .end sparse-switch
.end method

.method peekDrawer(Landroidx/wear/widget/drawer/WearableDrawerView;)V
    .locals 2
    .param p1, "drawer"    # Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 473
    if-eqz p1, :cond_6

    .line 476
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-eq p1, v0, :cond_1

    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-ne p1, v0, :cond_0

    goto :goto_0

    .line 477
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "peekDrawer(WearableDrawerView) received a drawer that isn\'t a child."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 481
    :cond_1
    :goto_0
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->isLaidOut()Z

    move-result v0

    if-nez v0, :cond_5

    .line 483
    const/4 v0, 0x3

    const-string v1, "WearableDrawerLayout"

    invoke-static {v1, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 484
    const-string v0, "WearableDrawerLayout not laid out yet. Postponing peek."

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    :cond_2
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    const/4 v1, 0x1

    if-ne p1, v0, :cond_3

    .line 487
    iput-boolean v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mShouldPeekTopDrawerAfterLayout:Z

    goto :goto_1

    .line 488
    :cond_3
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    if-ne p1, v0, :cond_4

    .line 489
    iput-boolean v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mShouldPeekBottomDrawerAfterLayout:Z

    .line 491
    :cond_4
    :goto_1
    return-void

    .line 494
    :cond_5
    invoke-direct {p0, p1}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->maybePeekDrawer(Landroidx/wear/widget/drawer/WearableDrawerView;)V

    .line 495
    return-void

    .line 474
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "peekDrawer(WearableDrawerView) received a null drawer."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setDrawerStateCallback(Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerStateCallback;)V
    .locals 0
    .param p1, "callback"    # Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerStateCallback;

    .line 602
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mDrawerStateCallback:Landroidx/wear/widget/drawer/WearableDrawerLayout$DrawerStateCallback;

    .line 603
    return-void
.end method
