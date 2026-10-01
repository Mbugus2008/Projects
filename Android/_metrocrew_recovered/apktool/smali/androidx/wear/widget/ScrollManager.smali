.class Landroidx/wear/widget/ScrollManager;
.super Ljava/lang/Object;
.source "ScrollManager.java"


# static fields
.field private static final FLING_EDGE_RATIO:F = 1.5f

.field private static final ONE_SEC_IN_MS:I = 0x3e8

.field private static final VELOCITY_MULTIPLIER:F = 1.5f


# instance fields
.field private mDown:Z

.field private mLastAngleRadians:F

.field private mMinRadiusFraction:F

.field private mMinRadiusFractionSquared:F

.field private mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

.field private mScreenRadiusPx:F

.field private mScreenRadiusPxSquared:F

.field private mScrollDegreesPerScreen:F

.field private mScrollPixelsPerRadian:F

.field private mScrollRadiansPerScreen:F

.field private mScrolling:Z

.field mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method constructor <init>()V
    .locals 2

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const/4 v0, 0x0

    iput v0, p0, Landroidx/wear/widget/ScrollManager;->mMinRadiusFraction:F

    .line 43
    iget v0, p0, Landroidx/wear/widget/ScrollManager;->mMinRadiusFraction:F

    iget v1, p0, Landroidx/wear/widget/ScrollManager;->mMinRadiusFraction:F

    mul-float/2addr v0, v1

    iput v0, p0, Landroidx/wear/widget/ScrollManager;->mMinRadiusFractionSquared:F

    .line 46
    const/high16 v0, 0x43340000    # 180.0f

    iput v0, p0, Landroidx/wear/widget/ScrollManager;->mScrollDegreesPerScreen:F

    .line 48
    iget v0, p0, Landroidx/wear/widget/ScrollManager;->mScrollDegreesPerScreen:F

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v0

    double-to-float v0, v0

    iput v0, p0, Landroidx/wear/widget/ScrollManager;->mScrollRadiansPerScreen:F

    return-void
.end method

.method private static normalizeAngleRadians(F)F
    .locals 7
    .param p0, "angleRadians"    # F

    .line 186
    float-to-double v0, p0

    const-wide v2, -0x3ff6de04abbbd2e8L    # -3.141592653589793

    cmpg-double v0, v0, v2

    const-wide v1, 0x401921fb54442d18L    # 6.283185307179586

    if-gez v0, :cond_0

    .line 187
    float-to-double v3, p0

    add-double/2addr v3, v1

    double-to-float p0, v3

    .line 189
    :cond_0
    float-to-double v3, p0

    const-wide v5, 0x400921fb54442d18L    # Math.PI

    cmpl-double v0, v3, v5

    if-lez v0, :cond_1

    .line 190
    float-to-double v3, p0

    sub-double/2addr v3, v1

    double-to-float p0, v3

    .line 192
    :cond_1
    return p0
.end method


# virtual methods
.method clearRecyclerView()V
    .locals 1

    .line 86
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/wear/widget/ScrollManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 87
    return-void
.end method

.method public getBezelWidth()F
    .locals 2

    .line 230
    const/high16 v0, 0x3f800000    # 1.0f

    iget v1, p0, Landroidx/wear/widget/ScrollManager;->mMinRadiusFraction:F

    sub-float/2addr v0, v1

    return v0
.end method

.method public getScrollDegreesPerScreen()F
    .locals 1

    .line 222
    iget v0, p0, Landroidx/wear/widget/ScrollManager;->mScrollDegreesPerScreen:F

    return v0
.end method

.method onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 13
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 96
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    iget v1, p0, Landroidx/wear/widget/ScrollManager;->mScreenRadiusPx:F

    sub-float/2addr v0, v1

    .line 97
    .local v0, "deltaX":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v1

    iget v2, p0, Landroidx/wear/widget/ScrollManager;->mScreenRadiusPx:F

    sub-float/2addr v1, v2

    .line 98
    .local v1, "deltaY":F
    mul-float v2, v0, v0

    mul-float v3, v1, v1

    add-float/2addr v2, v3

    .line 99
    .local v2, "radiusSquared":F
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v3

    .line 100
    .local v3, "vtev":Landroid/view/MotionEvent;
    iget-object v4, p0, Landroidx/wear/widget/ScrollManager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v4, v3}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 101
    invoke-virtual {v3}, Landroid/view/MotionEvent;->recycle()V

    .line 103
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v4

    const/4 v5, 0x0

    const/4 v6, 0x1

    packed-switch v4, :pswitch_data_0

    goto/16 :goto_0

    .line 167
    :pswitch_0
    iget-boolean v4, p0, Landroidx/wear/widget/ScrollManager;->mDown:Z

    if-eqz v4, :cond_5

    .line 168
    iput-boolean v5, p0, Landroidx/wear/widget/ScrollManager;->mDown:Z

    .line 169
    iput-boolean v5, p0, Landroidx/wear/widget/ScrollManager;->mScrolling:Z

    .line 170
    iget-object v4, p0, Landroidx/wear/widget/ScrollManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v4}, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V

    .line 171
    return v6

    .line 112
    :pswitch_1
    iget-boolean v4, p0, Landroidx/wear/widget/ScrollManager;->mScrolling:Z

    if-eqz v4, :cond_1

    .line 113
    float-to-double v7, v1

    float-to-double v9, v0

    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v7

    double-to-float v4, v7

    .line 114
    .local v4, "angleRadians":F
    iget v7, p0, Landroidx/wear/widget/ScrollManager;->mLastAngleRadians:F

    sub-float v7, v4, v7

    .line 115
    .local v7, "deltaRadians":F
    invoke-static {v7}, Landroidx/wear/widget/ScrollManager;->normalizeAngleRadians(F)F

    move-result v7

    .line 116
    iget v8, p0, Landroidx/wear/widget/ScrollManager;->mScrollPixelsPerRadian:F

    mul-float/2addr v8, v7

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    .line 117
    .local v8, "scrollPixels":I
    if-eqz v8, :cond_0

    .line 118
    iget-object v9, p0, Landroidx/wear/widget/ScrollManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v9, v5, v8}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 120
    int-to-float v5, v8

    iget v9, p0, Landroidx/wear/widget/ScrollManager;->mScrollPixelsPerRadian:F

    div-float v7, v5, v9

    .line 121
    iget v5, p0, Landroidx/wear/widget/ScrollManager;->mLastAngleRadians:F

    add-float/2addr v5, v7

    iput v5, p0, Landroidx/wear/widget/ScrollManager;->mLastAngleRadians:F

    .line 122
    iget v5, p0, Landroidx/wear/widget/ScrollManager;->mLastAngleRadians:F

    invoke-static {v5}, Landroidx/wear/widget/ScrollManager;->normalizeAngleRadians(F)F

    move-result v5

    iput v5, p0, Landroidx/wear/widget/ScrollManager;->mLastAngleRadians:F

    .line 126
    :cond_0
    return v6

    .line 129
    .end local v4    # "angleRadians":F
    .end local v7    # "deltaRadians":F
    .end local v8    # "scrollPixels":I
    :cond_1
    iget-boolean v4, p0, Landroidx/wear/widget/ScrollManager;->mDown:Z

    if-eqz v4, :cond_3

    .line 130
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v4

    iget v7, p0, Landroidx/wear/widget/ScrollManager;->mScreenRadiusPx:F

    sub-float/2addr v4, v7

    .line 131
    .local v4, "deltaXFromCenter":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v7

    iget v8, p0, Landroidx/wear/widget/ScrollManager;->mScreenRadiusPx:F

    sub-float/2addr v7, v8

    .line 132
    .local v7, "deltaYFromCenter":F
    float-to-double v8, v4

    float-to-double v10, v7

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v8

    double-to-float v8, v8

    .line 133
    .local v8, "distFromCenter":F
    const/4 v9, 0x0

    cmpl-float v9, v8, v9

    if-eqz v9, :cond_2

    .line 134
    div-float/2addr v4, v8

    .line 135
    div-float/2addr v7, v8

    .line 137
    iput-boolean v6, p0, Landroidx/wear/widget/ScrollManager;->mScrolling:Z

    .line 138
    iget-object v5, p0, Landroidx/wear/widget/ScrollManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v5}, Landroidx/recyclerview/widget/RecyclerView;->invalidate()V

    .line 139
    float-to-double v9, v7

    float-to-double v11, v4

    invoke-static {v9, v10, v11, v12}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v9

    double-to-float v5, v9

    iput v5, p0, Landroidx/wear/widget/ScrollManager;->mLastAngleRadians:F

    .line 140
    return v6

    .line 142
    .end local v4    # "deltaXFromCenter":F
    .end local v7    # "deltaYFromCenter":F
    .end local v8    # "distFromCenter":F
    :cond_2
    goto :goto_0

    .line 144
    :cond_3
    iget v4, p0, Landroidx/wear/widget/ScrollManager;->mScreenRadiusPxSquared:F

    div-float v4, v2, v4

    iget v7, p0, Landroidx/wear/widget/ScrollManager;->mMinRadiusFractionSquared:F

    cmpl-float v4, v4, v7

    if-lez v4, :cond_5

    .line 145
    iput-boolean v6, p0, Landroidx/wear/widget/ScrollManager;->mDown:Z

    .line 146
    return v6

    .line 152
    :pswitch_2
    iput-boolean v5, p0, Landroidx/wear/widget/ScrollManager;->mDown:Z

    .line 153
    iput-boolean v5, p0, Landroidx/wear/widget/ScrollManager;->mScrolling:Z

    .line 154
    iget-object v4, p0, Landroidx/wear/widget/ScrollManager;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget-object v6, p0, Landroidx/wear/widget/ScrollManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 155
    invoke-virtual {v6}, Landroidx/recyclerview/widget/RecyclerView;->getMaxFlingVelocity()I

    move-result v6

    int-to-float v6, v6

    .line 154
    const/16 v7, 0x3e8

    invoke-virtual {v4, v7, v6}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 156
    iget-object v4, p0, Landroidx/wear/widget/ScrollManager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v4}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v4

    float-to-int v4, v4

    .line 157
    .local v4, "velocityY":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    iget v7, p0, Landroidx/wear/widget/ScrollManager;->mScreenRadiusPx:F

    const/high16 v8, 0x3fc00000    # 1.5f

    mul-float/2addr v7, v8

    cmpg-float v6, v6, v7

    if-gez v6, :cond_4

    .line 158
    neg-int v4, v4

    .line 160
    :cond_4
    iget-object v6, p0, Landroidx/wear/widget/ScrollManager;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6}, Landroid/view/VelocityTracker;->clear()V

    .line 161
    invoke-static {v4}, Ljava/lang/Math;->abs(I)I

    move-result v6

    iget-object v7, p0, Landroidx/wear/widget/ScrollManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v7}, Landroidx/recyclerview/widget/RecyclerView;->getMinFlingVelocity()I

    move-result v7

    if-le v6, v7, :cond_5

    .line 162
    iget-object v6, p0, Landroidx/wear/widget/ScrollManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    int-to-float v7, v4

    mul-float/2addr v7, v8

    float-to-int v7, v7

    invoke-virtual {v6, v5, v7}, Landroidx/recyclerview/widget/RecyclerView;->fling(II)Z

    move-result v5

    return v5

    .line 105
    .end local v4    # "velocityY":I
    :pswitch_3
    iget v4, p0, Landroidx/wear/widget/ScrollManager;->mScreenRadiusPxSquared:F

    div-float v4, v2, v4

    iget v7, p0, Landroidx/wear/widget/ScrollManager;->mMinRadiusFractionSquared:F

    cmpl-float v4, v4, v7

    if-lez v4, :cond_5

    .line 106
    iput-boolean v6, p0, Landroidx/wear/widget/ScrollManager;->mDown:Z

    .line 107
    return v6

    .line 176
    :cond_5
    :goto_0
    return v5

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setBezelWidth(F)V
    .locals 2
    .param p1, "fraction"    # F

    .line 213
    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr v0, p1

    iput v0, p0, Landroidx/wear/widget/ScrollManager;->mMinRadiusFraction:F

    .line 214
    iget v0, p0, Landroidx/wear/widget/ScrollManager;->mMinRadiusFraction:F

    iget v1, p0, Landroidx/wear/widget/ScrollManager;->mMinRadiusFraction:F

    mul-float/2addr v0, v1

    iput v0, p0, Landroidx/wear/widget/ScrollManager;->mMinRadiusFractionSquared:F

    .line 215
    return-void
.end method

.method setRecyclerView(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 2
    .param p1, "recyclerView"    # Landroidx/recyclerview/widget/RecyclerView;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .line 77
    iput-object p1, p0, Landroidx/wear/widget/ScrollManager;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    .line 78
    invoke-static {p2, p3}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iput v0, p0, Landroidx/wear/widget/ScrollManager;->mScreenRadiusPx:F

    .line 79
    iget v0, p0, Landroidx/wear/widget/ScrollManager;->mScreenRadiusPx:F

    iget v1, p0, Landroidx/wear/widget/ScrollManager;->mScreenRadiusPx:F

    mul-float/2addr v0, v1

    iput v0, p0, Landroidx/wear/widget/ScrollManager;->mScreenRadiusPxSquared:F

    .line 80
    int-to-float v0, p3

    iget v1, p0, Landroidx/wear/widget/ScrollManager;->mScrollRadiansPerScreen:F

    div-float/2addr v0, v1

    iput v0, p0, Landroidx/wear/widget/ScrollManager;->mScrollPixelsPerRadian:F

    .line 81
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Landroidx/wear/widget/ScrollManager;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 82
    return-void
.end method

.method public setScrollDegreesPerScreen(F)V
    .locals 2
    .param p1, "degreesPerScreen"    # F

    .line 201
    iput p1, p0, Landroidx/wear/widget/ScrollManager;->mScrollDegreesPerScreen:F

    .line 202
    iget v0, p0, Landroidx/wear/widget/ScrollManager;->mScrollDegreesPerScreen:F

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v0

    double-to-float v0, v0

    iput v0, p0, Landroidx/wear/widget/ScrollManager;->mScrollRadiansPerScreen:F

    .line 203
    return-void
.end method
