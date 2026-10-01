.class public Landroidx/wear/widget/drawer/PageIndicatorView;
.super Landroid/view/View;
.source "PageIndicatorView.java"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;


# static fields
.field private static final TAG:Ljava/lang/String; = "Dots"


# instance fields
.field private mAdapter:Landroidx/viewpager/widget/PagerAdapter;

.field private mCurrentViewPagerState:I

.field private mDotColor:I

.field private mDotColorSelected:I

.field private mDotFadeInDuration:I

.field mDotFadeOutDelay:I

.field mDotFadeOutDuration:I

.field private mDotFadeWhenIdle:Z

.field private final mDotPaint:Landroid/graphics/Paint;

.field private final mDotPaintSelected:Landroid/graphics/Paint;

.field private final mDotPaintShadow:Landroid/graphics/Paint;

.field private final mDotPaintShadowSelected:Landroid/graphics/Paint;

.field private mDotRadius:F

.field private mDotRadiusSelected:F

.field private mDotShadowColor:I

.field private mDotShadowDx:F

.field private mDotShadowDy:F

.field private mDotShadowRadius:F

.field private mDotSpacing:I

.field private mNumberOfPositions:I

.field private mSelectedPosition:I

.field mVisible:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 83
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/wear/widget/drawer/PageIndicatorView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 84
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 87
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/wear/widget/drawer/PageIndicatorView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 88
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .line 91
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 93
    nop

    .line 94
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Landroidx/wear/R$styleable;->PageIndicatorView:[I

    sget v2, Landroidx/wear/R$style;->WsPageIndicatorViewStyle:I

    .line 95
    invoke-virtual {v0, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 99
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Landroidx/wear/R$styleable;->PageIndicatorView_wsPageIndicatorDotSpacing:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v1

    iput v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotSpacing:I

    .line 101
    sget v1, Landroidx/wear/R$styleable;->PageIndicatorView_wsPageIndicatorDotRadius:I

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    iput v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotRadius:F

    .line 102
    sget v1, Landroidx/wear/R$styleable;->PageIndicatorView_wsPageIndicatorDotRadiusSelected:I

    .line 103
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    iput v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotRadiusSelected:F

    .line 104
    sget v1, Landroidx/wear/R$styleable;->PageIndicatorView_wsPageIndicatorDotColor:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotColor:I

    .line 105
    sget v1, Landroidx/wear/R$styleable;->PageIndicatorView_wsPageIndicatorDotColorSelected:I

    .line 106
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotColorSelected:I

    .line 107
    sget v1, Landroidx/wear/R$styleable;->PageIndicatorView_wsPageIndicatorDotFadeOutDelay:I

    .line 108
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeOutDelay:I

    .line 109
    sget v1, Landroidx/wear/R$styleable;->PageIndicatorView_wsPageIndicatorDotFadeOutDuration:I

    .line 110
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeOutDuration:I

    .line 111
    sget v1, Landroidx/wear/R$styleable;->PageIndicatorView_wsPageIndicatorDotFadeInDuration:I

    .line 112
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeInDuration:I

    .line 113
    sget v1, Landroidx/wear/R$styleable;->PageIndicatorView_wsPageIndicatorDotFadeWhenIdle:I

    .line 114
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeWhenIdle:Z

    .line 115
    sget v1, Landroidx/wear/R$styleable;->PageIndicatorView_wsPageIndicatorDotShadowDx:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    iput v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowDx:F

    .line 116
    sget v1, Landroidx/wear/R$styleable;->PageIndicatorView_wsPageIndicatorDotShadowDy:I

    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    iput v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowDy:F

    .line 117
    sget v1, Landroidx/wear/R$styleable;->PageIndicatorView_wsPageIndicatorDotShadowRadius:I

    .line 118
    invoke-virtual {v0, v1, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v1

    iput v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowRadius:F

    .line 119
    sget v1, Landroidx/wear/R$styleable;->PageIndicatorView_wsPageIndicatorDotShadowColor:I

    .line 120
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    iput v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowColor:I

    .line 121
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 123
    new-instance v1, Landroid/graphics/Paint;

    const/4 v4, 0x1

    invoke-direct {v1, v4}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotPaint:Landroid/graphics/Paint;

    .line 124
    iget-object v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotPaint:Landroid/graphics/Paint;

    iget v5, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotColor:I

    invoke-virtual {v1, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 125
    iget-object v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotPaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 127
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v4}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotPaintSelected:Landroid/graphics/Paint;

    .line 128
    iget-object v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotPaintSelected:Landroid/graphics/Paint;

    iget v5, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotColorSelected:I

    invoke-virtual {v1, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 129
    iget-object v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotPaintSelected:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 130
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v4}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotPaintShadow:Landroid/graphics/Paint;

    .line 131
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v4}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotPaintShadowSelected:Landroid/graphics/Paint;

    .line 133
    iput v2, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mCurrentViewPagerState:I

    .line 134
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->isInEditMode()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 137
    const/4 v1, 0x5

    iput v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mNumberOfPositions:I

    .line 138
    const/4 v1, 0x2

    iput v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mSelectedPosition:I

    .line 139
    iput-boolean v2, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeWhenIdle:Z

    .line 142
    :cond_0
    iget-boolean v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeWhenIdle:Z

    if-eqz v1, :cond_1

    .line 143
    iput-boolean v2, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mVisible:Z

    .line 144
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    const-wide/16 v2, 0x7d0

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    iget v2, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeOutDuration:I

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0

    .line 146
    :cond_1
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 147
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p0, v1}, Landroidx/wear/widget/drawer/PageIndicatorView;->setAlpha(F)V

    .line 149
    :goto_0
    invoke-direct {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->updateShadows()V

    .line 150
    return-void
.end method

.method private fadeIn()V
    .locals 3

    .line 481
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mVisible:Z

    .line 482
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 483
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeInDuration:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 484
    return-void
.end method

.method private fadeInOut()V
    .locals 3

    .line 493
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mVisible:Z

    .line 494
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 495
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 496
    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 497
    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeInDuration:I

    int-to-long v1, v1

    .line 498
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Landroidx/wear/widget/drawer/PageIndicatorView$1;

    invoke-direct {v1, p0}, Landroidx/wear/widget/drawer/PageIndicatorView$1;-><init>(Landroidx/wear/widget/drawer/PageIndicatorView;)V

    .line 499
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 512
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 513
    return-void
.end method

.method private fadeOut(J)V
    .locals 3
    .param p1, "delayMillis"    # J

    .line 487
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mVisible:Z

    .line 488
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 489
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeOutDuration:I

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 490
    return-void
.end method

.method private positionChanged(I)V
    .locals 0
    .param p1, "position"    # I

    .line 468
    iput p1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mSelectedPosition:I

    .line 469
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->invalidate()V

    .line 470
    return-void
.end method

.method private updateDotPaint(Landroid/graphics/Paint;Landroid/graphics/Paint;FFII)V
    .locals 8
    .param p1, "dotPaint"    # Landroid/graphics/Paint;
    .param p2, "shadowPaint"    # Landroid/graphics/Paint;
    .param p3, "baseRadius"    # F
    .param p4, "shadowRadius"    # F
    .param p5, "color"    # I
    .param p6, "shadowColor"    # I

    .line 172
    add-float v3, p3, p4

    .line 173
    .local v3, "radius":F
    div-float v7, p3, v3

    .line 174
    .local v7, "shadowStart":F
    new-instance v0, Landroid/graphics/RadialGradient;

    const/4 v1, 0x0

    filled-new-array {p6, p6, v1}, [I

    move-result-object v4

    const/4 v2, 0x3

    new-array v5, v2, [F

    const/4 v2, 0x0

    aput v2, v5, v1

    const/4 v1, 0x1

    aput v7, v5, v1

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x2

    aput v1, v5, v2

    sget-object v6, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct/range {v0 .. v6}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 183
    .local v0, "gradient":Landroid/graphics/Shader;
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 184
    invoke-virtual {p1, p5}, Landroid/graphics/Paint;->setColor(I)V

    .line 185
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 186
    return-void
.end method

.method private updateNumberOfPositions()V
    .locals 2

    .line 473
    iget-object v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mAdapter:Landroidx/viewpager/widget/PagerAdapter;

    invoke-virtual {v0}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v0

    .line 474
    .local v0, "count":I
    iget v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mNumberOfPositions:I

    if-eq v0, v1, :cond_0

    .line 475
    iput v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mNumberOfPositions:I

    .line 476
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->requestLayout()V

    .line 478
    :cond_0
    return-void
.end method

.method private updateShadows()V
    .locals 14

    .line 153
    iget-object v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotPaint:Landroid/graphics/Paint;

    iget-object v2, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotPaintShadow:Landroid/graphics/Paint;

    iget v3, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotRadius:F

    iget v4, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowRadius:F

    iget v5, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotColor:I

    iget v6, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowColor:I

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Landroidx/wear/widget/drawer/PageIndicatorView;->updateDotPaint(Landroid/graphics/Paint;Landroid/graphics/Paint;FFII)V

    .line 156
    iget-object v8, v0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotPaintSelected:Landroid/graphics/Paint;

    iget-object v9, v0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotPaintShadowSelected:Landroid/graphics/Paint;

    iget v10, v0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotRadiusSelected:F

    iget v11, v0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowRadius:F

    iget v12, v0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotColorSelected:I

    iget v13, v0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowColor:I

    move-object v7, v0

    invoke-direct/range {v7 .. v13}, Landroidx/wear/widget/drawer/PageIndicatorView;->updateDotPaint(Landroid/graphics/Paint;Landroid/graphics/Paint;FFII)V

    .line 163
    return-void
.end method


# virtual methods
.method public getDotColor()I
    .locals 1

    .line 274
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotColor:I

    return v0
.end method

.method public getDotColorSelected()I
    .locals 1

    .line 295
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotColorSelected:I

    return v0
.end method

.method public getDotFadeInDuration()I
    .locals 1

    .line 355
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeInDuration:I

    return v0
.end method

.method public getDotFadeOutDelay()I
    .locals 1

    .line 374
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeOutDelay:I

    return v0
.end method

.method public getDotFadeOutDuration()I
    .locals 1

    .line 337
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeOutDuration:I

    return v0
.end method

.method public getDotFadeWhenIdle()Z
    .locals 1

    .line 316
    iget-boolean v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeWhenIdle:Z

    return v0
.end method

.method public getDotRadius()F
    .locals 1

    .line 230
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotRadius:F

    return v0
.end method

.method public getDotRadiusSelected()F
    .locals 1

    .line 252
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotRadiusSelected:F

    return v0
.end method

.method public getDotShadowColor()I
    .locals 1

    .line 453
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowColor:I

    return v0
.end method

.method public getDotShadowDx()F
    .locals 1

    .line 415
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowDx:F

    return v0
.end method

.method public getDotShadowDy()F
    .locals 1

    .line 434
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowDy:F

    return v0
.end method

.method public getDotShadowRadius()F
    .locals 1

    .line 393
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowRadius:F

    return v0
.end method

.method public getDotSpacing()F
    .locals 1

    .line 209
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotSpacing:I

    int-to-float v0, v0

    return v0
.end method

.method public notifyDataSetChanged()V
    .locals 1

    .line 621
    iget-object v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mAdapter:Landroidx/viewpager/widget/PagerAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mAdapter:Landroidx/viewpager/widget/PagerAdapter;

    invoke-virtual {v0}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 622
    invoke-direct {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->updateNumberOfPositions()V

    .line 624
    :cond_0
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 594
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 596
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mNumberOfPositions:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_2

    .line 597
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->getPaddingLeft()I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotSpacing:I

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    .line 598
    .local v0, "dotCenterLeft":F
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v2

    .line 599
    .local v1, "dotCenterTop":F
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 600
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 601
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    iget v3, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mNumberOfPositions:I

    if-ge v2, v3, :cond_1

    .line 602
    iget v3, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mSelectedPosition:I

    const/4 v4, 0x0

    if-ne v2, v3, :cond_0

    .line 603
    iget v3, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotRadiusSelected:F

    iget v5, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowRadius:F

    add-float/2addr v3, v5

    .line 604
    .local v3, "radius":F
    iget v5, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowDx:F

    iget v6, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowDy:F

    iget-object v7, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotPaintShadowSelected:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v6, v3, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 605
    iget v5, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotRadiusSelected:F

    iget-object v6, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotPaintSelected:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v4, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 606
    .end local v3    # "radius":F
    goto :goto_1

    .line 607
    :cond_0
    iget v3, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotRadius:F

    iget v5, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowRadius:F

    add-float/2addr v3, v5

    .line 608
    .restart local v3    # "radius":F
    iget v5, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowDx:F

    iget v6, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowDy:F

    iget-object v7, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotPaintShadow:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v6, v3, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 609
    iget v5, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotRadius:F

    iget-object v6, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v4, v5, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 611
    .end local v3    # "radius":F
    :goto_1
    iget v3, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotSpacing:I

    int-to-float v3, v3

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    .line 601
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 613
    .end local v2    # "i":I
    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 615
    .end local v0    # "dotCenterLeft":F
    .end local v1    # "dotCenterTop":F
    :cond_2
    return-void
.end method

.method protected onMeasure(II)V
    .locals 5
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .line 571
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    if-ne v0, v1, :cond_0

    .line 572
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .local v0, "totalWidth":I
    goto :goto_0

    .line 574
    .end local v0    # "totalWidth":I
    :cond_0
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mNumberOfPositions:I

    iget v2, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotSpacing:I

    mul-int/2addr v0, v2

    .line 575
    .local v0, "contentWidth":I
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->getPaddingLeft()I

    move-result v2

    add-int/2addr v2, v0

    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->getPaddingRight()I

    move-result v3

    add-int/2addr v2, v3

    move v0, v2

    .line 578
    .local v0, "totalWidth":I
    :goto_0
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    if-ne v2, v1, :cond_1

    .line 579
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .local v1, "totalHeight":I
    goto :goto_1

    .line 581
    .end local v1    # "totalHeight":I
    :cond_1
    iget v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotRadius:F

    iget v2, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowRadius:F

    add-float/2addr v1, v2

    iget v2, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotRadiusSelected:F

    iget v3, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowRadius:F

    add-float/2addr v2, v3

    .line 582
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 583
    .local v1, "maxRadius":F
    const/high16 v2, 0x40000000    # 2.0f

    mul-float/2addr v2, v1

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v2, v2

    .line 584
    .local v2, "contentHeight":I
    int-to-float v3, v2

    iget v4, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowDy:F

    add-float/2addr v3, v4

    float-to-int v2, v3

    .line 585
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->getPaddingTop()I

    move-result v3

    add-int/2addr v3, v2

    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->getPaddingBottom()I

    move-result v4

    add-int/2addr v3, v4

    move v1, v3

    .line 587
    .end local v2    # "contentHeight":I
    .local v1, "totalHeight":I
    :goto_1
    nop

    .line 588
    const/4 v2, 0x0

    invoke-static {v0, p1, v2}, Landroidx/wear/widget/drawer/PageIndicatorView;->resolveSizeAndState(III)I

    move-result v3

    .line 589
    invoke-static {v1, p2, v2}, Landroidx/wear/widget/drawer/PageIndicatorView;->resolveSizeAndState(III)I

    move-result v2

    .line 587
    invoke-virtual {p0, v3, v2}, Landroidx/wear/widget/drawer/PageIndicatorView;->setMeasuredDimension(II)V

    .line 590
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 2
    .param p1, "state"    # I

    .line 541
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mCurrentViewPagerState:I

    if-eq v0, p1, :cond_1

    .line 542
    iput p1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mCurrentViewPagerState:I

    .line 543
    iget-boolean v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeWhenIdle:Z

    if-eqz v0, :cond_1

    .line 544
    if-nez p1, :cond_1

    .line 545
    iget-boolean v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mVisible:Z

    if-eqz v0, :cond_0

    .line 546
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeOutDelay:I

    int-to-long v0, v0

    invoke-direct {p0, v0, v1}, Landroidx/wear/widget/drawer/PageIndicatorView;->fadeOut(J)V

    goto :goto_0

    .line 548
    :cond_0
    invoke-direct {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->fadeInOut()V

    .line 553
    :cond_1
    :goto_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 2
    .param p1, "position"    # I
    .param p2, "positionOffset"    # F
    .param p3, "positionOffsetPixels"    # I

    .line 517
    iget-boolean v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeWhenIdle:Z

    if-eqz v0, :cond_1

    .line 518
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mCurrentViewPagerState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 519
    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-eqz v0, :cond_0

    .line 520
    iget-boolean v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mVisible:Z

    if-nez v0, :cond_1

    .line 521
    invoke-direct {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->fadeIn()V

    goto :goto_0

    .line 524
    :cond_0
    iget-boolean v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mVisible:Z

    if-eqz v0, :cond_1

    .line 525
    const-wide/16 v0, 0x0

    invoke-direct {p0, v0, v1}, Landroidx/wear/widget/drawer/PageIndicatorView;->fadeOut(J)V

    .line 530
    :cond_1
    :goto_0
    return-void
.end method

.method public onPageSelected(I)V
    .locals 1
    .param p1, "position"    # I

    .line 534
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mSelectedPosition:I

    if-eq p1, v0, :cond_0

    .line 535
    invoke-direct {p0, p1}, Landroidx/wear/widget/drawer/PageIndicatorView;->positionChanged(I)V

    .line 537
    :cond_0
    return-void
.end method

.method public setDotColor(I)V
    .locals 1
    .param p1, "color"    # I

    .line 283
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotColor:I

    if-eq v0, p1, :cond_0

    .line 284
    iput p1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotColor:I

    .line 285
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->invalidate()V

    .line 287
    :cond_0
    return-void
.end method

.method public setDotColorSelected(I)V
    .locals 1
    .param p1, "color"    # I

    .line 304
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotColorSelected:I

    if-eq v0, p1, :cond_0

    .line 305
    iput p1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotColorSelected:I

    .line 306
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->invalidate()V

    .line 308
    :cond_0
    return-void
.end method

.method public setDotFadeInDuration(ILjava/util/concurrent/TimeUnit;)V
    .locals 3
    .param p1, "duration"    # I
    .param p2, "unit"    # Ljava/util/concurrent/TimeUnit;

    .line 364
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2, p2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    long-to-int v0, v0

    iput v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeInDuration:I

    .line 365
    return-void
.end method

.method public setDotFadeOutDelay(I)V
    .locals 0
    .param p1, "delay"    # I

    .line 384
    iput p1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeOutDelay:I

    .line 385
    return-void
.end method

.method public setDotFadeOutDuration(ILjava/util/concurrent/TimeUnit;)V
    .locals 3
    .param p1, "duration"    # I
    .param p2, "unit"    # Ljava/util/concurrent/TimeUnit;

    .line 346
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2, p2}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    long-to-int v0, v0

    iput v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeOutDuration:I

    .line 347
    return-void
.end method

.method public setDotFadeWhenIdle(Z)V
    .locals 0
    .param p1, "fade"    # Z

    .line 325
    iput-boolean p1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeWhenIdle:Z

    .line 326
    if-nez p1, :cond_0

    .line 327
    invoke-direct {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->fadeIn()V

    .line 329
    :cond_0
    return-void
.end method

.method public setDotRadius(I)V
    .locals 2
    .param p1, "radius"    # I

    .line 239
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotRadius:F

    int-to-float v1, p1

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    .line 240
    int-to-float v0, p1

    iput v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotRadius:F

    .line 241
    invoke-direct {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->updateShadows()V

    .line 242
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->invalidate()V

    .line 244
    :cond_0
    return-void
.end method

.method public setDotRadiusSelected(I)V
    .locals 2
    .param p1, "radius"    # I

    .line 261
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotRadiusSelected:F

    int-to-float v1, p1

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    .line 262
    int-to-float v0, p1

    iput v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotRadiusSelected:F

    .line 263
    invoke-direct {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->updateShadows()V

    .line 264
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->invalidate()V

    .line 266
    :cond_0
    return-void
.end method

.method public setDotShadowColor(I)V
    .locals 0
    .param p1, "color"    # I

    .line 462
    iput p1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowColor:I

    .line 463
    invoke-direct {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->updateShadows()V

    .line 464
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->invalidate()V

    .line 465
    return-void
.end method

.method public setDotShadowDx(F)V
    .locals 0
    .param p1, "dx"    # F

    .line 424
    iput p1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowDx:F

    .line 425
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->invalidate()V

    .line 426
    return-void
.end method

.method public setDotShadowDy(F)V
    .locals 0
    .param p1, "dy"    # F

    .line 443
    iput p1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowDy:F

    .line 444
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->invalidate()V

    .line 445
    return-void
.end method

.method public setDotShadowRadius(F)V
    .locals 1
    .param p1, "radius"    # F

    .line 402
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowRadius:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_0

    .line 403
    iput p1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotShadowRadius:F

    .line 404
    invoke-direct {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->updateShadows()V

    .line 405
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->invalidate()V

    .line 407
    :cond_0
    return-void
.end method

.method public setDotSpacing(I)V
    .locals 1
    .param p1, "spacing"    # I

    .line 218
    iget v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotSpacing:I

    if-eq v0, p1, :cond_0

    .line 219
    iput p1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotSpacing:I

    .line 220
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->requestLayout()V

    .line 222
    :cond_0
    return-void
.end method

.method public setPager(Landroidx/viewpager/widget/ViewPager;)V
    .locals 1
    .param p1, "pager"    # Landroidx/viewpager/widget/ViewPager;

    .line 195
    invoke-virtual {p1, p0}, Landroidx/viewpager/widget/ViewPager;->addOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;)V

    .line 196
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/wear/widget/drawer/PageIndicatorView;->setPagerAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    .line 197
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object v0

    iput-object v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mAdapter:Landroidx/viewpager/widget/PagerAdapter;

    .line 198
    iget-object v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mAdapter:Landroidx/viewpager/widget/PagerAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mAdapter:Landroidx/viewpager/widget/PagerAdapter;

    invoke-virtual {v0}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 199
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroidx/wear/widget/drawer/PageIndicatorView;->positionChanged(I)V

    .line 201
    :cond_0
    return-void
.end method

.method public setPagerAdapter(Landroidx/viewpager/widget/PagerAdapter;)V
    .locals 1
    .param p1, "adapter"    # Landroidx/viewpager/widget/PagerAdapter;

    .line 559
    iput-object p1, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mAdapter:Landroidx/viewpager/widget/PagerAdapter;

    .line 560
    iget-object v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mAdapter:Landroidx/viewpager/widget/PagerAdapter;

    if-eqz v0, :cond_0

    .line 561
    invoke-direct {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->updateNumberOfPositions()V

    .line 562
    iget-boolean v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeWhenIdle:Z

    if-eqz v0, :cond_0

    .line 563
    invoke-direct {p0}, Landroidx/wear/widget/drawer/PageIndicatorView;->fadeInOut()V

    .line 566
    :cond_0
    return-void
.end method
