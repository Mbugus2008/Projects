.class Landroidx/wear/widget/SwipeDismissController;
.super Landroidx/wear/widget/DismissController;
.source "SwipeDismissController.java"


# static fields
.field public static final DEFAULT_DISMISS_DRAG_WIDTH_RATIO:F = 0.33f

.field private static final EDGE_SWIPE_THRESHOLD:F = 0.1f

.field private static final TAG:Ljava/lang/String; = "SwipeDismissController"

.field private static final VELOCITY_UNIT:I = 0x3e8


# instance fields
.field private mActiveTouchId:I

.field private mBlockGesture:Z

.field private mDiscardIntercept:Z

.field private mDismissMinDragWidthRatio:F

.field private mDismissed:Z

.field private mDownX:F

.field private mDownY:F

.field private final mGestureThresholdPx:F

.field private mLastX:F

.field private final mMinFlingVelocity:I

.field private final mSlop:I

.field private final mSwipeDismissTransitionHelper:Landroidx/wear/widget/SwipeDismissTransitionHelper;

.field private mSwiping:Z


# direct methods
.method constructor <init>(Landroid/content/Context;Landroidx/wear/widget/DismissibleFrameLayout;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "layout"    # Landroidx/wear/widget/DismissibleFrameLayout;

    .line 63
    invoke-direct {p0, p1, p2}, Landroidx/wear/widget/DismissController;-><init>(Landroid/content/Context;Landroidx/wear/widget/DismissibleFrameLayout;)V

    .line 42
    const v0, 0x3ea8f5c3    # 0.33f

    iput v0, p0, Landroidx/wear/widget/SwipeDismissController;->mDismissMinDragWidthRatio:F

    .line 60
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/wear/widget/SwipeDismissController;->mBlockGesture:Z

    .line 65
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    .line 66
    .local v0, "vc":Landroid/view/ViewConfiguration;
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Landroidx/wear/widget/SwipeDismissController;->mSlop:I

    .line 67
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v1

    iput v1, p0, Landroidx/wear/widget/SwipeDismissController;->mMinFlingVelocity:I

    .line 68
    nop

    .line 69
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float v1, v1

    const v2, 0x3dcccccd    # 0.1f

    mul-float/2addr v1, v2

    iput v1, p0, Landroidx/wear/widget/SwipeDismissController;->mGestureThresholdPx:F

    .line 71
    new-instance v1, Landroidx/wear/widget/SwipeDismissTransitionHelper;

    invoke-direct {v1, p1, p2}, Landroidx/wear/widget/SwipeDismissTransitionHelper;-><init>(Landroid/content/Context;Landroidx/wear/widget/DismissibleFrameLayout;)V

    iput-object v1, p0, Landroidx/wear/widget/SwipeDismissController;->mSwipeDismissTransitionHelper:Landroidx/wear/widget/SwipeDismissTransitionHelper;

    .line 72
    return-void
.end method

.method private checkGesture(Landroid/view/MotionEvent;)V
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .line 313
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_0

    .line 314
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissController;->mSwipeDismissTransitionHelper:Landroidx/wear/widget/SwipeDismissTransitionHelper;

    invoke-virtual {v0}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->isAnimating()Z

    move-result v0

    iput-boolean v0, p0, Landroidx/wear/widget/SwipeDismissController;->mBlockGesture:Z

    .line 316
    :cond_0
    return-void
.end method

.method private isPotentialSwipe(FF)Z
    .locals 3
    .param p1, "dx"    # F
    .param p2, "dy"    # F

    .line 173
    mul-float v0, p1, p1

    mul-float v1, p2, p2

    add-float/2addr v0, v1

    iget v1, p0, Landroidx/wear/widget/SwipeDismissController;->mSlop:I

    iget v2, p0, Landroidx/wear/widget/SwipeDismissController;->mSlop:I

    mul-int/2addr v1, v2

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private resetSwipeDetectMembers()V
    .locals 2

    .line 222
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissController;->mSwipeDismissTransitionHelper:Landroidx/wear/widget/SwipeDismissTransitionHelper;

    invoke-virtual {v0}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->getVelocityTracker()Landroid/view/VelocityTracker;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 223
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissController;->mSwipeDismissTransitionHelper:Landroidx/wear/widget/SwipeDismissTransitionHelper;

    invoke-virtual {v0}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->getVelocityTracker()Landroid/view/VelocityTracker;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    .line 225
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissController;->mSwipeDismissTransitionHelper:Landroidx/wear/widget/SwipeDismissTransitionHelper;

    invoke-virtual {v0}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->resetVelocityTracker()V

    .line 226
    const/4 v0, 0x0

    iput v0, p0, Landroidx/wear/widget/SwipeDismissController;->mDownX:F

    .line 227
    iput v0, p0, Landroidx/wear/widget/SwipeDismissController;->mDownY:F

    .line 228
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/wear/widget/SwipeDismissController;->mSwiping:Z

    .line 229
    const/high16 v1, -0x31000000

    iput v1, p0, Landroidx/wear/widget/SwipeDismissController;->mLastX:F

    .line 230
    iput-boolean v0, p0, Landroidx/wear/widget/SwipeDismissController;->mDismissed:Z

    .line 231
    iput-boolean v0, p0, Landroidx/wear/widget/SwipeDismissController;->mDiscardIntercept:Z

    .line 232
    return-void
.end method

.method private updateDismiss(Landroid/view/MotionEvent;)V
    .locals 8
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .line 248
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iget v1, p0, Landroidx/wear/widget/SwipeDismissController;->mDownX:F

    sub-float/2addr v0, v1

    .line 250
    .local v0, "deltaX":F
    iget-object v1, p0, Landroidx/wear/widget/SwipeDismissController;->mSwipeDismissTransitionHelper:Landroidx/wear/widget/SwipeDismissTransitionHelper;

    invoke-virtual {v1}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->getVelocityTracker()Landroid/view/VelocityTracker;

    move-result-object v1

    .line 251
    .local v1, "velocityTracker":Landroid/view/VelocityTracker;
    const/16 v2, 0x3e8

    invoke-virtual {v1, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 252
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v2

    .line 253
    .local v2, "xVelocity":F
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v3

    .line 254
    .local v3, "yVelocity":F
    iget v4, p0, Landroidx/wear/widget/SwipeDismissController;->mLastX:F

    const/high16 v5, -0x31000000

    cmpl-float v4, v4, v5

    if-nez v4, :cond_0

    .line 257
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getDownTime()J

    move-result-wide v6

    sub-long/2addr v4, v6

    long-to-float v4, v4

    const/high16 v5, 0x447a0000    # 1000.0f

    div-float/2addr v4, v5

    div-float v2, v0, v4

    .line 260
    :cond_0
    iget-boolean v4, p0, Landroidx/wear/widget/SwipeDismissController;->mDismissed:Z

    if-nez v4, :cond_3

    .line 261
    iget-object v4, p0, Landroidx/wear/widget/SwipeDismissController;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    invoke-virtual {v4}, Landroidx/wear/widget/DismissibleFrameLayout;->getWidth()I

    move-result v4

    int-to-float v4, v4

    iget v5, p0, Landroidx/wear/widget/SwipeDismissController;->mDismissMinDragWidthRatio:F

    mul-float/2addr v4, v5

    cmpl-float v4, v0, v4

    if-lez v4, :cond_1

    .line 262
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v4

    iget v5, p0, Landroidx/wear/widget/SwipeDismissController;->mLastX:F

    cmpl-float v4, v4, v5

    if-gez v4, :cond_2

    :cond_1
    iget v4, p0, Landroidx/wear/widget/SwipeDismissController;->mMinFlingVelocity:I

    int-to-float v4, v4

    cmpl-float v4, v2, v4

    if-ltz v4, :cond_3

    .line 264
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpl-float v4, v2, v4

    if-lez v4, :cond_3

    .line 266
    :cond_2
    const/4 v4, 0x1

    iput-boolean v4, p0, Landroidx/wear/widget/SwipeDismissController;->mDismissed:Z

    .line 270
    :cond_3
    iget-boolean v4, p0, Landroidx/wear/widget/SwipeDismissController;->mDismissed:Z

    if-eqz v4, :cond_4

    iget-boolean v4, p0, Landroidx/wear/widget/SwipeDismissController;->mSwiping:Z

    if-eqz v4, :cond_4

    .line 272
    iget v4, p0, Landroidx/wear/widget/SwipeDismissController;->mMinFlingVelocity:I

    neg-int v4, v4

    int-to-float v4, v4

    cmpg-float v4, v2, v4

    if-gez v4, :cond_4

    .line 273
    const/4 v4, 0x0

    iput-boolean v4, p0, Landroidx/wear/widget/SwipeDismissController;->mDismissed:Z

    .line 276
    :cond_4
    return-void
.end method

.method private updateSwiping(Landroid/view/MotionEvent;)V
    .locals 5
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .line 235
    iget-boolean v0, p0, Landroidx/wear/widget/SwipeDismissController;->mSwiping:Z

    if-nez v0, :cond_2

    .line 236
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iget v1, p0, Landroidx/wear/widget/SwipeDismissController;->mDownX:F

    sub-float/2addr v0, v1

    .line 237
    .local v0, "deltaX":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v1

    iget v2, p0, Landroidx/wear/widget/SwipeDismissController;->mDownY:F

    sub-float/2addr v1, v2

    .line 238
    .local v1, "deltaY":F
    invoke-direct {p0, v0, v1}, Landroidx/wear/widget/SwipeDismissController;->isPotentialSwipe(FF)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 239
    iget v2, p0, Landroidx/wear/widget/SwipeDismissController;->mSlop:I

    mul-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    cmpl-float v2, v0, v2

    if-lez v2, :cond_0

    .line 240
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v4

    cmpg-float v2, v2, v4

    if-gez v2, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    nop

    :goto_0
    iput-boolean v3, p0, Landroidx/wear/widget/SwipeDismissController;->mSwiping:Z

    goto :goto_1

    .line 242
    :cond_1
    iput-boolean v3, p0, Landroidx/wear/widget/SwipeDismissController;->mSwiping:Z

    .line 245
    .end local v0    # "deltaX":F
    .end local v1    # "deltaY":F
    :cond_2
    :goto_1
    return-void
.end method


# virtual methods
.method protected canScroll(Landroid/view/View;ZFFF)Z
    .locals 12
    .param p1, "v"    # Landroid/view/View;
    .param p2, "checkV"    # Z
    .param p3, "dx"    # F
    .param p4, "x"    # F
    .param p5, "y"    # F

    .line 290
    instance-of v0, p1, Landroid/view/ViewGroup;

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    .line 291
    move-object v0, p1

    check-cast v0, Landroid/view/ViewGroup;

    .line 292
    .local v0, "group":Landroid/view/ViewGroup;
    invoke-virtual {p1}, Landroid/view/View;->getScrollX()I

    move-result v2

    .line 293
    .local v2, "scrollX":I
    invoke-virtual {p1}, Landroid/view/View;->getScrollY()I

    move-result v3

    .line 294
    .local v3, "scrollY":I
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    .line 295
    .local v4, "count":I
    add-int/lit8 v5, v4, -0x1

    .local v5, "i":I
    :goto_0
    if-ltz v5, :cond_1

    .line 296
    invoke-virtual {v0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 297
    .local v7, "child":Landroid/view/View;
    int-to-float v6, v2

    add-float v6, p4, v6

    invoke-virtual {v7}, Landroid/view/View;->getLeft()I

    move-result v8

    int-to-float v8, v8

    cmpl-float v6, v6, v8

    if-ltz v6, :cond_0

    int-to-float v6, v2

    add-float v6, p4, v6

    .line 298
    invoke-virtual {v7}, Landroid/view/View;->getRight()I

    move-result v8

    int-to-float v8, v8

    cmpg-float v6, v6, v8

    if-gez v6, :cond_0

    int-to-float v6, v3

    add-float v6, p5, v6

    .line 299
    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    move-result v8

    int-to-float v8, v8

    cmpl-float v6, v6, v8

    if-ltz v6, :cond_0

    int-to-float v6, v3

    add-float v6, p5, v6

    .line 300
    invoke-virtual {v7}, Landroid/view/View;->getBottom()I

    move-result v8

    int-to-float v8, v8

    cmpg-float v6, v6, v8

    if-gez v6, :cond_0

    int-to-float v6, v2

    add-float v6, p4, v6

    .line 302
    invoke-virtual {v7}, Landroid/view/View;->getLeft()I

    move-result v8

    int-to-float v8, v8

    sub-float v10, v6, v8

    int-to-float v6, v3

    add-float v6, p5, v6

    .line 303
    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    move-result v8

    int-to-float v8, v8

    sub-float v11, v6, v8

    .line 301
    const/4 v8, 0x1

    move-object v6, p0

    move v9, p3

    invoke-virtual/range {v6 .. v11}, Landroidx/wear/widget/SwipeDismissController;->canScroll(Landroid/view/View;ZFFF)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 304
    return v1

    .line 295
    .end local v7    # "child":Landroid/view/View;
    :cond_0
    add-int/lit8 v5, v5, -0x1

    goto :goto_0

    .line 309
    .end local v0    # "group":Landroid/view/ViewGroup;
    .end local v2    # "scrollX":I
    .end local v3    # "scrollY":I
    .end local v4    # "count":I
    .end local v5    # "i":I
    :cond_1
    if-eqz p2, :cond_2

    neg-float v0, p3

    float-to-int v0, v0

    invoke-virtual {p1, v0}, Landroid/view/View;->canScrollHorizontally(I)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    return v1
.end method

.method public canScrollHorizontally(I)Z
    .locals 1
    .param p1, "direction"    # I

    .line 161
    if-gez p1, :cond_0

    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissController;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    invoke-virtual {v0}, Landroidx/wear/widget/DismissibleFrameLayout;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method getDismissMinDragWidthRatio()F
    .locals 1

    .line 85
    iget v0, p0, Landroidx/wear/widget/SwipeDismissController;->mDismissMinDragWidthRatio:F

    return v0
.end method

.method onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 13
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .line 89
    invoke-direct {p0, p1}, Landroidx/wear/widget/SwipeDismissController;->checkGesture(Landroid/view/MotionEvent;)V

    .line 90
    iget-boolean v0, p0, Landroidx/wear/widget/SwipeDismissController;->mBlockGesture:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 91
    return v1

    .line 96
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    sub-float/2addr v0, v2

    .line 97
    .local v0, "offsetX":F
    const/4 v2, 0x0

    .line 98
    .local v2, "offsetY":F
    invoke-virtual {p1, v0, v2}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 100
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v3

    const/4 v4, 0x0

    packed-switch v3, :pswitch_data_0

    :pswitch_0
    move-object v7, p0

    goto/16 :goto_1

    .line 115
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v3

    .line 116
    .local v3, "actionIndex":I
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    .line 117
    .local v5, "pointerId":I
    iget v6, p0, Landroidx/wear/widget/SwipeDismissController;->mActiveTouchId:I

    if-ne v5, v6, :cond_2

    .line 119
    if-nez v3, :cond_1

    move v6, v1

    goto :goto_0

    :cond_1
    move v6, v4

    .line 120
    .local v6, "newActionIndex":I
    :goto_0
    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v7

    iput v7, p0, Landroidx/wear/widget/SwipeDismissController;->mActiveTouchId:I

    .line 121
    .end local v6    # "newActionIndex":I
    move-object v7, p0

    goto/16 :goto_1

    .line 117
    :cond_2
    move-object v7, p0

    goto/16 :goto_1

    .line 111
    .end local v3    # "actionIndex":I
    .end local v5    # "pointerId":I
    :pswitch_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v3

    .line 112
    .restart local v3    # "actionIndex":I
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v5

    iput v5, p0, Landroidx/wear/widget/SwipeDismissController;->mActiveTouchId:I

    .line 113
    move-object v7, p0

    goto/16 :goto_1

    .line 130
    .end local v3    # "actionIndex":I
    :pswitch_3
    iget-object v3, p0, Landroidx/wear/widget/SwipeDismissController;->mSwipeDismissTransitionHelper:Landroidx/wear/widget/SwipeDismissTransitionHelper;

    invoke-virtual {v3}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->getVelocityTracker()Landroid/view/VelocityTracker;

    move-result-object v3

    if-eqz v3, :cond_7

    iget-boolean v3, p0, Landroidx/wear/widget/SwipeDismissController;->mDiscardIntercept:Z

    if-eqz v3, :cond_3

    .line 132
    move-object v7, p0

    goto/16 :goto_1

    .line 135
    :cond_3
    iget v3, p0, Landroidx/wear/widget/SwipeDismissController;->mActiveTouchId:I

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v3

    .line 136
    .local v3, "pointerIndex":I
    const/4 v5, -0x1

    if-ne v3, v5, :cond_4

    .line 137
    const-string v5, "SwipeDismissController"

    const-string v6, "Invalid pointer index: ignoring."

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    iput-boolean v1, p0, Landroidx/wear/widget/SwipeDismissController;->mDiscardIntercept:Z

    .line 139
    move-object v7, p0

    goto :goto_1

    .line 141
    :cond_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v5

    iget v6, p0, Landroidx/wear/widget/SwipeDismissController;->mDownX:F

    sub-float v10, v5, v6

    .line 142
    .local v10, "dx":F
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v11

    .line 143
    .local v11, "x":F
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v12

    .line 145
    .local v12, "y":F
    const/4 v5, 0x0

    cmpl-float v5, v10, v5

    if-eqz v5, :cond_5

    iget v5, p0, Landroidx/wear/widget/SwipeDismissController;->mDownX:F

    iget v6, p0, Landroidx/wear/widget/SwipeDismissController;->mGestureThresholdPx:F

    cmpl-float v5, v5, v6

    if-ltz v5, :cond_5

    iget-object v8, p0, Landroidx/wear/widget/SwipeDismissController;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    const/4 v9, 0x0

    move-object v7, p0

    invoke-virtual/range {v7 .. v12}, Landroidx/wear/widget/SwipeDismissController;->canScroll(Landroid/view/View;ZFFF)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 147
    iput-boolean v1, v7, Landroidx/wear/widget/SwipeDismissController;->mDiscardIntercept:Z

    .line 148
    goto :goto_1

    .line 145
    :cond_5
    move-object v7, p0

    .line 150
    :cond_6
    invoke-direct {p0, p1}, Landroidx/wear/widget/SwipeDismissController;->updateSwiping(Landroid/view/MotionEvent;)V

    goto :goto_1

    .line 130
    .end local v3    # "pointerIndex":I
    .end local v10    # "dx":F
    .end local v11    # "x":F
    .end local v12    # "y":F
    :cond_7
    move-object v7, p0

    goto :goto_1

    .line 126
    :pswitch_4
    move-object v7, p0

    invoke-direct {p0}, Landroidx/wear/widget/SwipeDismissController;->resetSwipeDetectMembers()V

    .line 127
    goto :goto_1

    .line 102
    :pswitch_5
    move-object v7, p0

    invoke-direct {p0}, Landroidx/wear/widget/SwipeDismissController;->resetSwipeDetectMembers()V

    .line 103
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v3

    iput v3, v7, Landroidx/wear/widget/SwipeDismissController;->mDownX:F

    .line 104
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v3

    iput v3, v7, Landroidx/wear/widget/SwipeDismissController;->mDownY:F

    .line 105
    invoke-virtual {p1, v4}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    iput v3, v7, Landroidx/wear/widget/SwipeDismissController;->mActiveTouchId:I

    .line 106
    iget-object v3, v7, Landroidx/wear/widget/SwipeDismissController;->mSwipeDismissTransitionHelper:Landroidx/wear/widget/SwipeDismissTransitionHelper;

    invoke-virtual {v3}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->obtainVelocityTracker()V

    .line 107
    iget-object v3, v7, Landroidx/wear/widget/SwipeDismissController;->mSwipeDismissTransitionHelper:Landroidx/wear/widget/SwipeDismissTransitionHelper;

    invoke-virtual {v3}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->getVelocityTracker()Landroid/view/VelocityTracker;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 108
    nop

    .line 153
    :goto_1
    neg-float v3, v0

    neg-float v5, v2

    invoke-virtual {p1, v3, v5}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 154
    iget-boolean v3, v7, Landroidx/wear/widget/SwipeDismissController;->mDiscardIntercept:Z

    if-nez v3, :cond_8

    iget-boolean v3, v7, Landroidx/wear/widget/SwipeDismissController;->mSwiping:Z

    if-eqz v3, :cond_8

    goto :goto_2

    :cond_8
    move v1, v4

    :goto_2
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .line 177
    invoke-direct {p0, p1}, Landroidx/wear/widget/SwipeDismissController;->checkGesture(Landroid/view/MotionEvent;)V

    .line 178
    iget-boolean v0, p0, Landroidx/wear/widget/SwipeDismissController;->mBlockGesture:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 179
    return v1

    .line 182
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissController;->mSwipeDismissTransitionHelper:Landroidx/wear/widget/SwipeDismissTransitionHelper;

    invoke-virtual {v0}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->getVelocityTracker()Landroid/view/VelocityTracker;

    move-result-object v0

    if-nez v0, :cond_1

    .line 183
    const/4 v0, 0x0

    return v0

    .line 189
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    sub-float/2addr v0, v2

    .line 190
    .local v0, "offsetX":F
    const/4 v2, 0x0

    .line 191
    .local v2, "offsetY":F
    invoke-virtual {p1, v0, v2}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 192
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v3

    packed-switch v3, :pswitch_data_0

    goto :goto_1

    .line 208
    :pswitch_0
    iget-object v3, p0, Landroidx/wear/widget/SwipeDismissController;->mSwipeDismissTransitionHelper:Landroidx/wear/widget/SwipeDismissTransitionHelper;

    invoke-virtual {v3}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->getVelocityTracker()Landroid/view/VelocityTracker;

    move-result-object v3

    invoke-virtual {v3, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 209
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v3

    iput v3, p0, Landroidx/wear/widget/SwipeDismissController;->mLastX:F

    .line 210
    invoke-direct {p0, p1}, Landroidx/wear/widget/SwipeDismissController;->updateSwiping(Landroid/view/MotionEvent;)V

    .line 211
    iget-boolean v3, p0, Landroidx/wear/widget/SwipeDismissController;->mSwiping:Z

    if-eqz v3, :cond_4

    .line 212
    iget-object v3, p0, Landroidx/wear/widget/SwipeDismissController;->mSwipeDismissTransitionHelper:Landroidx/wear/widget/SwipeDismissTransitionHelper;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v4

    iget v5, p0, Landroidx/wear/widget/SwipeDismissController;->mDownX:F

    sub-float/2addr v4, v5

    invoke-virtual {v3, v4, p1}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->onSwipeProgressChanged(FLandroid/view/MotionEvent;)V

    goto :goto_1

    .line 194
    :pswitch_1
    invoke-direct {p0, p1}, Landroidx/wear/widget/SwipeDismissController;->updateDismiss(Landroid/view/MotionEvent;)V

    .line 197
    :pswitch_2
    iget-boolean v3, p0, Landroidx/wear/widget/SwipeDismissController;->mDismissed:Z

    if-eqz v3, :cond_2

    .line 198
    iget-object v3, p0, Landroidx/wear/widget/SwipeDismissController;->mSwipeDismissTransitionHelper:Landroidx/wear/widget/SwipeDismissTransitionHelper;

    iget-object v4, p0, Landroidx/wear/widget/SwipeDismissController;->mDismissListener:Landroidx/wear/widget/DismissController$OnDismissListener;

    invoke-virtual {v3, v4}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->animateDismissal(Landroidx/wear/widget/DismissController$OnDismissListener;)V

    goto :goto_0

    .line 199
    :cond_2
    iget-boolean v3, p0, Landroidx/wear/widget/SwipeDismissController;->mSwiping:Z

    if-eqz v3, :cond_3

    iget v3, p0, Landroidx/wear/widget/SwipeDismissController;->mLastX:F

    const/high16 v4, -0x31000000

    cmpl-float v3, v3, v4

    if-eqz v3, :cond_3

    .line 203
    iget-object v3, p0, Landroidx/wear/widget/SwipeDismissController;->mSwipeDismissTransitionHelper:Landroidx/wear/widget/SwipeDismissTransitionHelper;

    iget-object v4, p0, Landroidx/wear/widget/SwipeDismissController;->mDismissListener:Landroidx/wear/widget/DismissController$OnDismissListener;

    invoke-virtual {v3, v4}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->animateRecovery(Landroidx/wear/widget/DismissController$OnDismissListener;)V

    .line 205
    :cond_3
    :goto_0
    invoke-direct {p0}, Landroidx/wear/widget/SwipeDismissController;->resetSwipeDetectMembers()V

    .line 206
    nop

    .line 216
    :cond_4
    :goto_1
    neg-float v3, v0

    neg-float v4, v2

    invoke-virtual {p1, v3, v4}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 217
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .locals 1
    .param p1, "disallowIntercept"    # Z

    .line 75
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissController;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    invoke-virtual {v0}, Landroidx/wear/widget/DismissibleFrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 76
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissController;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    invoke-virtual {v0}, Landroidx/wear/widget/DismissibleFrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-interface {v0, p1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 78
    :cond_0
    return-void
.end method

.method setDismissMinDragWidthRatio(F)V
    .locals 0
    .param p1, "ratio"    # F

    .line 81
    iput p1, p0, Landroidx/wear/widget/SwipeDismissController;->mDismissMinDragWidthRatio:F

    .line 82
    return-void
.end method
