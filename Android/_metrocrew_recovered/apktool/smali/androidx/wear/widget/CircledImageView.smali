.class public Landroidx/wear/widget/CircledImageView;
.super Landroid/view/View;
.source "CircledImageView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/widget/CircledImageView$OvalShadowPainter;
    }
.end annotation


# static fields
.field private static final ARGB_EVALUATOR:Landroid/animation/ArgbEvaluator;

.field private static final SQUARE_DIMEN_HEIGHT:I = 0x1

.field private static final SQUARE_DIMEN_NONE:I = 0x0

.field private static final SQUARE_DIMEN_WIDTH:I = 0x2


# instance fields
.field private final mAnimationListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

.field private mCircleBorderCap:Landroid/graphics/Paint$Cap;

.field private mCircleBorderColor:I

.field private mCircleBorderWidth:F

.field private mCircleColor:Landroid/content/res/ColorStateList;

.field private mCircleHidden:Z

.field private mCircleRadius:F

.field private mCircleRadiusPercent:F

.field private mCircleRadiusPressed:F

.field private mCircleRadiusPressedPercent:F

.field private mColorAnimator:Landroid/animation/ValueAnimator;

.field private mColorChangeAnimationDurationMs:J

.field mCurrentColor:I

.field private mDrawable:Landroid/graphics/drawable/Drawable;

.field private final mDrawableCallback:Landroid/graphics/drawable/Drawable$Callback;

.field private mImageCirclePercentage:F

.field private mImageHorizontalOffcenterPercentage:F

.field private mImageTint:Ljava/lang/Integer;

.field private final mIndeterminateBounds:Landroid/graphics/Rect;

.field private final mIndeterminateDrawable:Landroidx/wear/widget/ProgressDrawable;

.field private final mInitialCircleRadius:F

.field private final mOval:Landroid/graphics/RectF;

.field private final mPaint:Landroid/graphics/Paint;

.field private mPressed:Z

.field private mProgress:F

.field private mProgressIndeterminate:Z

.field private mRadiusInset:F

.field private final mShadowPainter:Landroidx/wear/widget/CircledImageView$OvalShadowPainter;

.field private mSquareDimen:Ljava/lang/Integer;

.field private mVisible:Z

.field private mWindowVisible:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 53
    new-instance v0, Landroid/animation/ArgbEvaluator;

    invoke-direct {v0}, Landroid/animation/ArgbEvaluator;-><init>()V

    sput-object v0, Landroidx/wear/widget/CircledImageView;->ARGB_EVALUATOR:Landroid/animation/ArgbEvaluator;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 120
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/wear/widget/CircledImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 121
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 124
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/wear/widget/CircledImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 125
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 11
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .line 128
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 64
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroidx/wear/widget/CircledImageView;->mIndeterminateBounds:Landroid/graphics/Rect;

    .line 65
    new-instance v0, Landroidx/wear/widget/CircledImageView$1;

    invoke-direct {v0, p0}, Landroidx/wear/widget/CircledImageView$1;-><init>(Landroidx/wear/widget/CircledImageView;)V

    iput-object v0, p0, Landroidx/wear/widget/CircledImageView;->mDrawableCallback:Landroid/graphics/drawable/Drawable$Callback;

    .line 92
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/wear/widget/CircledImageView;->mCircleHidden:Z

    .line 93
    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p0, Landroidx/wear/widget/CircledImageView;->mProgress:F

    .line 94
    iput-boolean v0, p0, Landroidx/wear/widget/CircledImageView;->mPressed:Z

    .line 98
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Landroidx/wear/widget/CircledImageView;->mColorChangeAnimationDurationMs:J

    .line 99
    iput v1, p0, Landroidx/wear/widget/CircledImageView;->mImageCirclePercentage:F

    .line 100
    const/4 v1, 0x0

    iput v1, p0, Landroidx/wear/widget/CircledImageView;->mImageHorizontalOffcenterPercentage:F

    .line 105
    new-instance v2, Landroidx/wear/widget/CircledImageView$2;

    invoke-direct {v2, p0}, Landroidx/wear/widget/CircledImageView$2;-><init>(Landroidx/wear/widget/CircledImageView;)V

    iput-object v2, p0, Landroidx/wear/widget/CircledImageView;->mAnimationListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    .line 130
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Landroidx/wear/R$styleable;->CircledImageView:[I

    invoke-virtual {v2, p2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v8

    .line 131
    .local v8, "a":Landroid/content/res/TypedArray;
    sget-object v6, Landroidx/wear/R$styleable;->CircledImageView:[I

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v4, p0

    move-object v5, p1

    move-object v7, p2

    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "attrs":Landroid/util/AttributeSet;
    .local v5, "context":Landroid/content/Context;
    .local v7, "attrs":Landroid/util/AttributeSet;
    invoke-static/range {v4 .. v10}, Landroidx/core/view/ViewCompat;->saveAttributeDataForStyleable(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 133
    sget p1, Landroidx/wear/R$styleable;->CircledImageView_android_src:I

    invoke-virtual {v8, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, v4, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 134
    iget-object p1, v4, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_0

    iget-object p1, v4, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 137
    iget-object p1, v4, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 138
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object p1

    .line 139
    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {v5}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    invoke-virtual {p1, p2, v2}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, v4, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 140
    iget-object p1, v4, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, v4, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 143
    :cond_0
    sget p1, Landroidx/wear/R$styleable;->CircledImageView_background_color:I

    invoke-virtual {v8, p1}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iput-object p1, v4, Landroidx/wear/widget/CircledImageView;->mCircleColor:Landroid/content/res/ColorStateList;

    .line 144
    iget-object p1, v4, Landroidx/wear/widget/CircledImageView;->mCircleColor:Landroid/content/res/ColorStateList;

    if-nez p1, :cond_1

    .line 145
    const/high16 p1, 0x1060000

    invoke-virtual {v5, p1}, Landroid/content/Context;->getColor(I)I

    move-result p1

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iput-object p1, v4, Landroidx/wear/widget/CircledImageView;->mCircleColor:Landroid/content/res/ColorStateList;

    .line 148
    :cond_1
    sget p1, Landroidx/wear/R$styleable;->CircledImageView_background_radius:I

    invoke-virtual {v8, p1, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p1

    iput p1, v4, Landroidx/wear/widget/CircledImageView;->mCircleRadius:F

    .line 149
    iget p1, v4, Landroidx/wear/widget/CircledImageView;->mCircleRadius:F

    iput p1, v4, Landroidx/wear/widget/CircledImageView;->mInitialCircleRadius:F

    .line 150
    sget p1, Landroidx/wear/R$styleable;->CircledImageView_background_radius_pressed:I

    iget p2, v4, Landroidx/wear/widget/CircledImageView;->mCircleRadius:F

    invoke-virtual {v8, p1, p2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p1

    iput p1, v4, Landroidx/wear/widget/CircledImageView;->mCircleRadiusPressed:F

    .line 152
    sget p1, Landroidx/wear/R$styleable;->CircledImageView_background_border_color:I

    .line 153
    const/high16 p2, -0x1000000

    invoke-virtual {v8, p1, p2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    iput p1, v4, Landroidx/wear/widget/CircledImageView;->mCircleBorderColor:I

    .line 154
    nop

    .line 155
    invoke-static {}, Landroid/graphics/Paint$Cap;->values()[Landroid/graphics/Paint$Cap;

    move-result-object p1

    sget p2, Landroidx/wear/R$styleable;->CircledImageView_background_border_cap:I

    invoke-virtual {v8, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    aget-object p1, p1, p2

    iput-object p1, v4, Landroidx/wear/widget/CircledImageView;->mCircleBorderCap:Landroid/graphics/Paint$Cap;

    .line 156
    sget p1, Landroidx/wear/R$styleable;->CircledImageView_background_border_width:I

    invoke-virtual {v8, p1, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p1

    iput p1, v4, Landroidx/wear/widget/CircledImageView;->mCircleBorderWidth:F

    .line 159
    iget p1, v4, Landroidx/wear/widget/CircledImageView;->mCircleBorderWidth:F

    cmpl-float p1, p1, v1

    if-lez p1, :cond_2

    .line 161
    iget p1, v4, Landroidx/wear/widget/CircledImageView;->mRadiusInset:F

    iget p2, v4, Landroidx/wear/widget/CircledImageView;->mCircleBorderWidth:F

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr p2, v2

    add-float/2addr p1, p2

    iput p1, v4, Landroidx/wear/widget/CircledImageView;->mRadiusInset:F

    .line 164
    :cond_2
    sget p1, Landroidx/wear/R$styleable;->CircledImageView_img_padding:I

    invoke-virtual {v8, p1, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p1

    .line 165
    .local p1, "circlePadding":F
    cmpl-float p2, p1, v1

    if-lez p2, :cond_3

    .line 166
    iget p2, v4, Landroidx/wear/widget/CircledImageView;->mRadiusInset:F

    add-float/2addr p2, p1

    iput p2, v4, Landroidx/wear/widget/CircledImageView;->mRadiusInset:F

    .line 169
    :cond_3
    sget p2, Landroidx/wear/R$styleable;->CircledImageView_img_circle_percentage:I

    .line 170
    invoke-virtual {v8, p2, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p2

    iput p2, v4, Landroidx/wear/widget/CircledImageView;->mImageCirclePercentage:F

    .line 172
    sget p2, Landroidx/wear/R$styleable;->CircledImageView_img_horizontal_offset_percentage:I

    .line 173
    invoke-virtual {v8, p2, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p2

    iput p2, v4, Landroidx/wear/widget/CircledImageView;->mImageHorizontalOffcenterPercentage:F

    .line 175
    sget p2, Landroidx/wear/R$styleable;->CircledImageView_img_tint:I

    invoke-virtual {v8, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_4

    .line 176
    sget p2, Landroidx/wear/R$styleable;->CircledImageView_img_tint:I

    invoke-virtual {v8, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    iput-object p2, v4, Landroidx/wear/widget/CircledImageView;->mImageTint:Ljava/lang/Integer;

    .line 179
    :cond_4
    sget p2, Landroidx/wear/R$styleable;->CircledImageView_clip_dimen:I

    invoke-virtual {v8, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_5

    .line 180
    sget p2, Landroidx/wear/R$styleable;->CircledImageView_clip_dimen:I

    invoke-virtual {v8, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    iput-object p2, v4, Landroidx/wear/widget/CircledImageView;->mSquareDimen:Ljava/lang/Integer;

    .line 183
    :cond_5
    sget p2, Landroidx/wear/R$styleable;->CircledImageView_background_radius_percent:I

    .line 184
    const/4 v2, 0x1

    invoke-virtual {v8, p2, v2, v2, v1}, Landroid/content/res/TypedArray;->getFraction(IIIF)F

    move-result p2

    iput p2, v4, Landroidx/wear/widget/CircledImageView;->mCircleRadiusPercent:F

    .line 186
    sget p2, Landroidx/wear/R$styleable;->CircledImageView_background_radius_pressed_percent:I

    iget v3, v4, Landroidx/wear/widget/CircledImageView;->mCircleRadiusPercent:F

    .line 187
    invoke-virtual {v8, p2, v2, v2, v3}, Landroid/content/res/TypedArray;->getFraction(IIIF)F

    move-result p2

    iput p2, v4, Landroidx/wear/widget/CircledImageView;->mCircleRadiusPressedPercent:F

    .line 191
    sget p2, Landroidx/wear/R$styleable;->CircledImageView_background_shadow_width:I

    invoke-virtual {v8, p2, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p2

    .line 193
    .local p2, "shadowWidth":F
    invoke-virtual {v8}, Landroid/content/res/TypedArray;->recycle()V

    .line 195
    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    iput-object v3, v4, Landroidx/wear/widget/CircledImageView;->mOval:Landroid/graphics/RectF;

    .line 196
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    iput-object v3, v4, Landroidx/wear/widget/CircledImageView;->mPaint:Landroid/graphics/Paint;

    .line 197
    iget-object v3, v4, Landroidx/wear/widget/CircledImageView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 198
    new-instance v2, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;

    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getCircleRadius()F

    move-result v3

    iget v6, v4, Landroidx/wear/widget/CircledImageView;->mCircleBorderWidth:F

    invoke-direct {v2, p2, v1, v3, v6}, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;-><init>(FFFF)V

    iput-object v2, v4, Landroidx/wear/widget/CircledImageView;->mShadowPainter:Landroidx/wear/widget/CircledImageView$OvalShadowPainter;

    .line 201
    new-instance v1, Landroidx/wear/widget/ProgressDrawable;

    invoke-direct {v1}, Landroidx/wear/widget/ProgressDrawable;-><init>()V

    iput-object v1, v4, Landroidx/wear/widget/CircledImageView;->mIndeterminateDrawable:Landroidx/wear/widget/ProgressDrawable;

    .line 204
    iget-object v1, v4, Landroidx/wear/widget/CircledImageView;->mIndeterminateDrawable:Landroidx/wear/widget/ProgressDrawable;

    iget-object v2, v4, Landroidx/wear/widget/CircledImageView;->mDrawableCallback:Landroid/graphics/drawable/Drawable$Callback;

    invoke-virtual {v1, v2}, Landroidx/wear/widget/ProgressDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 206
    invoke-virtual {p0, v0}, Landroidx/wear/widget/CircledImageView;->setWillNotDraw(Z)V

    .line 208
    invoke-direct {p0}, Landroidx/wear/widget/CircledImageView;->setColorForCurrentState()V

    .line 209
    return-void
.end method

.method private setColorForCurrentState()V
    .locals 5

    .line 295
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mCircleColor:Landroid/content/res/ColorStateList;

    .line 296
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getDrawableState()[I

    move-result-object v1

    iget-object v2, p0, Landroidx/wear/widget/CircledImageView;->mCircleColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    .line 297
    .local v0, "newColor":I
    iget-wide v1, p0, Landroidx/wear/widget/CircledImageView;->mColorChangeAnimationDurationMs:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-lez v1, :cond_1

    .line 298
    iget-object v1, p0, Landroidx/wear/widget/CircledImageView;->mColorAnimator:Landroid/animation/ValueAnimator;

    if-eqz v1, :cond_0

    .line 299
    iget-object v1, p0, Landroidx/wear/widget/CircledImageView;->mColorAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    goto :goto_0

    .line 301
    :cond_0
    new-instance v1, Landroid/animation/ValueAnimator;

    invoke-direct {v1}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v1, p0, Landroidx/wear/widget/CircledImageView;->mColorAnimator:Landroid/animation/ValueAnimator;

    .line 303
    :goto_0
    iget-object v1, p0, Landroidx/wear/widget/CircledImageView;->mColorAnimator:Landroid/animation/ValueAnimator;

    iget v2, p0, Landroidx/wear/widget/CircledImageView;->mCurrentColor:I

    filled-new-array {v2, v0}, [I

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setIntValues([I)V

    .line 304
    iget-object v1, p0, Landroidx/wear/widget/CircledImageView;->mColorAnimator:Landroid/animation/ValueAnimator;

    sget-object v2, Landroidx/wear/widget/CircledImageView;->ARGB_EVALUATOR:Landroid/animation/ArgbEvaluator;

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    .line 305
    iget-object v1, p0, Landroidx/wear/widget/CircledImageView;->mColorAnimator:Landroid/animation/ValueAnimator;

    iget-wide v2, p0, Landroidx/wear/widget/CircledImageView;->mColorChangeAnimationDurationMs:J

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 306
    iget-object v1, p0, Landroidx/wear/widget/CircledImageView;->mColorAnimator:Landroid/animation/ValueAnimator;

    iget-object v2, p0, Landroidx/wear/widget/CircledImageView;->mAnimationListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 307
    iget-object v1, p0, Landroidx/wear/widget/CircledImageView;->mColorAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_1

    .line 309
    :cond_1
    iget v1, p0, Landroidx/wear/widget/CircledImageView;->mCurrentColor:I

    if-eq v0, v1, :cond_2

    .line 310
    iput v0, p0, Landroidx/wear/widget/CircledImageView;->mCurrentColor:I

    .line 311
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->invalidate()V

    .line 314
    :cond_2
    :goto_1
    return-void
.end method


# virtual methods
.method protected drawableStateChanged()V
    .locals 0

    .line 520
    invoke-super {p0}, Landroid/view/View;->drawableStateChanged()V

    .line 521
    invoke-direct {p0}, Landroidx/wear/widget/CircledImageView;->setColorForCurrentState()V

    .line 522
    return-void
.end method

.method public getCircleColorStateList()Landroid/content/res/ColorStateList;
    .locals 1

    .line 531
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mCircleColor:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getCircleRadius()F
    .locals 3

    .line 440
    iget v0, p0, Landroidx/wear/widget/CircledImageView;->mCircleRadius:F

    .line 441
    .local v0, "radius":F
    iget v1, p0, Landroidx/wear/widget/CircledImageView;->mCircleRadius:F

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_0

    iget v1, p0, Landroidx/wear/widget/CircledImageView;->mCircleRadiusPercent:F

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    .line 442
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getMeasuredHeight()I

    move-result v1

    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getMeasuredWidth()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Landroidx/wear/widget/CircledImageView;->mCircleRadiusPercent:F

    mul-float v0, v1, v2

    .line 445
    :cond_0
    iget v1, p0, Landroidx/wear/widget/CircledImageView;->mRadiusInset:F

    sub-float v1, v0, v1

    return v1
.end method

.method public getCircleRadiusPercent()F
    .locals 1

    .line 460
    iget v0, p0, Landroidx/wear/widget/CircledImageView;->mCircleRadiusPercent:F

    return v0
.end method

.method public getCircleRadiusPressed()F
    .locals 3

    .line 479
    iget v0, p0, Landroidx/wear/widget/CircledImageView;->mCircleRadiusPressed:F

    .line 481
    .local v0, "radius":F
    iget v1, p0, Landroidx/wear/widget/CircledImageView;->mCircleRadiusPressed:F

    const/4 v2, 0x0

    cmpg-float v1, v1, v2

    if-gtz v1, :cond_0

    iget v1, p0, Landroidx/wear/widget/CircledImageView;->mCircleRadiusPressedPercent:F

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    .line 482
    nop

    .line 483
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getMeasuredHeight()I

    move-result v1

    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getMeasuredWidth()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Landroidx/wear/widget/CircledImageView;->mCircleRadiusPressedPercent:F

    mul-float v0, v1, v2

    .line 486
    :cond_0
    iget v1, p0, Landroidx/wear/widget/CircledImageView;->mRadiusInset:F

    sub-float v1, v0, v1

    return v1
.end method

.method public getCircleRadiusPressedPercent()F
    .locals 1

    .line 499
    iget v0, p0, Landroidx/wear/widget/CircledImageView;->mCircleRadiusPressedPercent:F

    return v0
.end method

.method public getColorChangeAnimationDuration()J
    .locals 2

    .line 705
    iget-wide v0, p0, Landroidx/wear/widget/CircledImageView;->mColorChangeAnimationDurationMs:J

    return-wide v0
.end method

.method public getDefaultCircleColor()I
    .locals 1

    .line 545
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mCircleColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    return v0
.end method

.method public getImageDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 666
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getInitialCircleRadius()F
    .locals 1

    .line 600
    iget v0, p0, Landroidx/wear/widget/CircledImageView;->mInitialCircleRadius:F

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 10
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 226
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getPaddingLeft()I

    move-result v0

    .line 227
    .local v0, "paddingLeft":I
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getPaddingTop()I

    move-result v1

    .line 229
    .local v1, "paddingTop":I
    iget-boolean v2, p0, Landroidx/wear/widget/CircledImageView;->mPressed:Z

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getCircleRadiusPressed()F

    move-result v2

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getCircleRadius()F

    move-result v2

    .line 232
    .local v2, "circleRadius":F
    :goto_0
    iget-object v3, p0, Landroidx/wear/widget/CircledImageView;->mShadowPainter:Landroidx/wear/widget/CircledImageView$OvalShadowPainter;

    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getAlpha()F

    move-result v4

    invoke-virtual {v3, p1, v4}, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->draw(Landroid/graphics/Canvas;F)V

    .line 233
    iget v3, p0, Landroidx/wear/widget/CircledImageView;->mCircleBorderWidth:F

    const/4 v4, 0x0

    cmpl-float v3, v3, v4

    if-lez v3, :cond_2

    .line 235
    iget-object v3, p0, Landroidx/wear/widget/CircledImageView;->mOval:Landroid/graphics/RectF;

    int-to-float v4, v0

    int-to-float v5, v1

    .line 238
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getWidth()I

    move-result v6

    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getPaddingRight()I

    move-result v7

    sub-int/2addr v6, v7

    int-to-float v6, v6

    .line 239
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getHeight()I

    move-result v7

    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getPaddingBottom()I

    move-result v8

    sub-int/2addr v7, v8

    int-to-float v7, v7

    .line 235
    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 241
    iget-object v3, p0, Landroidx/wear/widget/CircledImageView;->mOval:Landroid/graphics/RectF;

    iget-object v4, p0, Landroidx/wear/widget/CircledImageView;->mOval:Landroid/graphics/RectF;

    .line 242
    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    sub-float/2addr v4, v2

    iget-object v5, p0, Landroidx/wear/widget/CircledImageView;->mOval:Landroid/graphics/RectF;

    .line 243
    invoke-virtual {v5}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    sub-float/2addr v5, v2

    iget-object v6, p0, Landroidx/wear/widget/CircledImageView;->mOval:Landroid/graphics/RectF;

    .line 244
    invoke-virtual {v6}, Landroid/graphics/RectF;->centerX()F

    move-result v6

    add-float/2addr v6, v2

    iget-object v7, p0, Landroidx/wear/widget/CircledImageView;->mOval:Landroid/graphics/RectF;

    .line 245
    invoke-virtual {v7}, Landroid/graphics/RectF;->centerY()F

    move-result v7

    add-float/2addr v7, v2

    .line 241
    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 246
    iget-object v3, p0, Landroidx/wear/widget/CircledImageView;->mPaint:Landroid/graphics/Paint;

    iget v4, p0, Landroidx/wear/widget/CircledImageView;->mCircleBorderColor:I

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 249
    iget-object v3, p0, Landroidx/wear/widget/CircledImageView;->mPaint:Landroid/graphics/Paint;

    iget-object v4, p0, Landroidx/wear/widget/CircledImageView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v4}, Landroid/graphics/Paint;->getAlpha()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getAlpha()F

    move-result v5

    mul-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 250
    iget-object v3, p0, Landroidx/wear/widget/CircledImageView;->mPaint:Landroid/graphics/Paint;

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 251
    iget-object v3, p0, Landroidx/wear/widget/CircledImageView;->mPaint:Landroid/graphics/Paint;

    iget v4, p0, Landroidx/wear/widget/CircledImageView;->mCircleBorderWidth:F

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 252
    iget-object v3, p0, Landroidx/wear/widget/CircledImageView;->mPaint:Landroid/graphics/Paint;

    iget-object v4, p0, Landroidx/wear/widget/CircledImageView;->mCircleBorderCap:Landroid/graphics/Paint$Cap;

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 254
    iget-boolean v3, p0, Landroidx/wear/widget/CircledImageView;->mProgressIndeterminate:Z

    if-eqz v3, :cond_1

    .line 255
    iget-object v3, p0, Landroidx/wear/widget/CircledImageView;->mOval:Landroid/graphics/RectF;

    iget-object v4, p0, Landroidx/wear/widget/CircledImageView;->mIndeterminateBounds:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->roundOut(Landroid/graphics/Rect;)V

    .line 256
    iget-object v3, p0, Landroidx/wear/widget/CircledImageView;->mIndeterminateDrawable:Landroidx/wear/widget/ProgressDrawable;

    iget-object v4, p0, Landroidx/wear/widget/CircledImageView;->mIndeterminateBounds:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroidx/wear/widget/ProgressDrawable;->setBounds(Landroid/graphics/Rect;)V

    .line 257
    iget-object v3, p0, Landroidx/wear/widget/CircledImageView;->mIndeterminateDrawable:Landroidx/wear/widget/ProgressDrawable;

    iget v4, p0, Landroidx/wear/widget/CircledImageView;->mCircleBorderColor:I

    invoke-virtual {v3, v4}, Landroidx/wear/widget/ProgressDrawable;->setRingColor(I)V

    .line 258
    iget-object v3, p0, Landroidx/wear/widget/CircledImageView;->mIndeterminateDrawable:Landroidx/wear/widget/ProgressDrawable;

    iget v4, p0, Landroidx/wear/widget/CircledImageView;->mCircleBorderWidth:F

    invoke-virtual {v3, v4}, Landroidx/wear/widget/ProgressDrawable;->setRingWidth(F)V

    .line 259
    iget-object v3, p0, Landroidx/wear/widget/CircledImageView;->mIndeterminateDrawable:Landroidx/wear/widget/ProgressDrawable;

    invoke-virtual {v3, p1}, Landroidx/wear/widget/ProgressDrawable;->draw(Landroid/graphics/Canvas;)V

    move-object v4, p1

    goto :goto_1

    .line 261
    :cond_1
    iget-object v5, p0, Landroidx/wear/widget/CircledImageView;->mOval:Landroid/graphics/RectF;

    const/high16 v3, 0x43b40000    # 360.0f

    iget v4, p0, Landroidx/wear/widget/CircledImageView;->mProgress:F

    mul-float v7, v4, v3

    const/4 v8, 0x0

    iget-object v9, p0, Landroidx/wear/widget/CircledImageView;->mPaint:Landroid/graphics/Paint;

    const/high16 v6, -0x3d4c0000    # -90.0f

    move-object v4, p1

    .end local p1    # "canvas":Landroid/graphics/Canvas;
    .local v4, "canvas":Landroid/graphics/Canvas;
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    goto :goto_1

    .line 233
    .end local v4    # "canvas":Landroid/graphics/Canvas;
    .restart local p1    # "canvas":Landroid/graphics/Canvas;
    :cond_2
    move-object v4, p1

    .line 264
    .end local p1    # "canvas":Landroid/graphics/Canvas;
    .restart local v4    # "canvas":Landroid/graphics/Canvas;
    :goto_1
    iget-boolean p1, p0, Landroidx/wear/widget/CircledImageView;->mCircleHidden:Z

    if-nez p1, :cond_3

    .line 265
    iget-object p1, p0, Landroidx/wear/widget/CircledImageView;->mOval:Landroid/graphics/RectF;

    int-to-float v3, v0

    int-to-float v5, v1

    .line 268
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getWidth()I

    move-result v6

    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getPaddingRight()I

    move-result v7

    sub-int/2addr v6, v7

    int-to-float v6, v6

    .line 269
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getHeight()I

    move-result v7

    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getPaddingBottom()I

    move-result v8

    sub-int/2addr v7, v8

    int-to-float v7, v7

    .line 265
    invoke-virtual {p1, v3, v5, v6, v7}, Landroid/graphics/RectF;->set(FFFF)V

    .line 272
    iget-object p1, p0, Landroidx/wear/widget/CircledImageView;->mPaint:Landroid/graphics/Paint;

    iget v3, p0, Landroidx/wear/widget/CircledImageView;->mCurrentColor:I

    invoke-virtual {p1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 273
    iget-object p1, p0, Landroidx/wear/widget/CircledImageView;->mPaint:Landroid/graphics/Paint;

    iget-object v3, p0, Landroidx/wear/widget/CircledImageView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->getAlpha()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getAlpha()F

    move-result v5

    mul-float/2addr v3, v5

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-virtual {p1, v3}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 275
    iget-object p1, p0, Landroidx/wear/widget/CircledImageView;->mPaint:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 276
    iget-object p1, p0, Landroidx/wear/widget/CircledImageView;->mOval:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    move-result p1

    .line 277
    .local p1, "centerX":F
    iget-object v3, p0, Landroidx/wear/widget/CircledImageView;->mOval:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    .line 279
    .local v3, "centerY":F
    iget-object v5, p0, Landroidx/wear/widget/CircledImageView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v4, p1, v3, v2, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 282
    .end local v3    # "centerY":F
    .end local p1    # "centerX":F
    :cond_3
    iget-object p1, p0, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_5

    .line 283
    iget-object p1, p0, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getAlpha()F

    move-result v3

    const/high16 v5, 0x437f0000    # 255.0f

    mul-float/2addr v3, v5

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-virtual {p1, v3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 285
    iget-object p1, p0, Landroidx/wear/widget/CircledImageView;->mImageTint:Ljava/lang/Integer;

    if-eqz p1, :cond_4

    .line 286
    iget-object p1, p0, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v3, p0, Landroidx/wear/widget/CircledImageView;->mImageTint:Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p1, v3}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 288
    :cond_4
    iget-object p1, p0, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v4}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 291
    :cond_5
    invoke-super {p0, v4}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 292
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 13
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .line 368
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_3

    .line 370
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    .line 371
    .local v0, "nativeDrawableWidth":I
    iget-object v1, p0, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    .line 372
    .local v1, "nativeDrawableHeight":I
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getMeasuredWidth()I

    move-result v2

    .line 373
    .local v2, "viewWidth":I
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getMeasuredHeight()I

    move-result v3

    .line 375
    .local v3, "viewHeight":I
    iget v4, p0, Landroidx/wear/widget/CircledImageView;->mImageCirclePercentage:F

    const/4 v5, 0x0

    cmpl-float v4, v4, v5

    const/high16 v6, 0x3f800000    # 1.0f

    if-lez v4, :cond_0

    iget v4, p0, Landroidx/wear/widget/CircledImageView;->mImageCirclePercentage:F

    goto :goto_0

    :cond_0
    move v4, v6

    .line 377
    .local v4, "imageCirclePercentage":F
    :goto_0
    nop

    .line 381
    int-to-float v7, v0

    cmpl-float v7, v7, v5

    if-eqz v7, :cond_1

    .line 383
    int-to-float v7, v2

    mul-float/2addr v7, v4

    int-to-float v8, v0

    div-float/2addr v7, v8

    goto :goto_1

    .line 384
    :cond_1
    move v7, v6

    .line 385
    :goto_1
    int-to-float v8, v1

    cmpl-float v5, v8, v5

    if-eqz v5, :cond_2

    .line 387
    int-to-float v5, v3

    mul-float/2addr v5, v4

    int-to-float v8, v1

    div-float/2addr v5, v8

    goto :goto_2

    .line 388
    :cond_2
    move v5, v6

    .line 380
    :goto_2
    invoke-static {v7, v5}, Ljava/lang/Math;->min(FF)F

    move-result v5

    .line 378
    invoke-static {v6, v5}, Ljava/lang/Math;->min(FF)F

    move-result v5

    .line 391
    .local v5, "scaleFactor":F
    int-to-float v6, v0

    mul-float/2addr v6, v5

    invoke-static {v6}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 392
    .local v6, "drawableWidth":I
    int-to-float v7, v1

    mul-float/2addr v7, v5

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    .line 395
    .local v7, "drawableHeight":I
    sub-int v8, v2, v6

    div-int/lit8 v8, v8, 0x2

    iget v9, p0, Landroidx/wear/widget/CircledImageView;->mImageHorizontalOffcenterPercentage:F

    int-to-float v10, v6

    mul-float/2addr v9, v10

    .line 397
    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    add-int/2addr v8, v9

    .line 398
    .local v8, "drawableLeft":I
    sub-int v9, v3, v7

    div-int/lit8 v9, v9, 0x2

    .line 400
    .local v9, "drawableTop":I
    iget-object v10, p0, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    add-int v11, v8, v6

    add-int v12, v9, v7

    invoke-virtual {v10, v8, v9, v11, v12}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 405
    .end local v0    # "nativeDrawableWidth":I
    .end local v1    # "nativeDrawableHeight":I
    .end local v2    # "viewWidth":I
    .end local v3    # "viewHeight":I
    .end local v4    # "imageCirclePercentage":F
    .end local v5    # "scaleFactor":F
    .end local v6    # "drawableWidth":I
    .end local v7    # "drawableHeight":I
    .end local v8    # "drawableLeft":I
    .end local v9    # "drawableTop":I
    :cond_3
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 406
    return-void
.end method

.method protected onMeasure(II)V
    .locals 11
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .line 319
    nop

    .line 320
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getCircleRadius()F

    move-result v0

    iget v1, p0, Landroidx/wear/widget/CircledImageView;->mCircleBorderWidth:F

    add-float/2addr v0, v1

    iget-object v1, p0, Landroidx/wear/widget/CircledImageView;->mShadowPainter:Landroidx/wear/widget/CircledImageView$OvalShadowPainter;

    iget v1, v1, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowWidth:F

    iget-object v2, p0, Landroidx/wear/widget/CircledImageView;->mShadowPainter:Landroidx/wear/widget/CircledImageView$OvalShadowPainter;

    iget v2, v2, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowVisibility:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    .line 323
    .local v0, "radius":F
    const/high16 v1, 0x40000000    # 2.0f

    mul-float v2, v0, v1

    .line 324
    .local v2, "desiredWidth":F
    mul-float/2addr v1, v0

    .line 326
    .local v1, "desiredHeight":F
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    .line 327
    .local v3, "widthMode":I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v4

    .line 328
    .local v4, "widthSize":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v5

    .line 329
    .local v5, "heightMode":I
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v6

    .line 334
    .local v6, "heightSize":I
    const/high16 v7, -0x80000000

    const/high16 v8, 0x40000000    # 2.0f

    if-ne v3, v8, :cond_0

    .line 335
    move v9, v4

    .local v9, "width":I
    goto :goto_0

    .line 336
    .end local v9    # "width":I
    :cond_0
    if-ne v3, v7, :cond_1

    .line 337
    int-to-float v9, v4

    invoke-static {v2, v9}, Ljava/lang/Math;->min(FF)F

    move-result v9

    float-to-int v9, v9

    .restart local v9    # "width":I
    goto :goto_0

    .line 339
    .end local v9    # "width":I
    :cond_1
    float-to-int v9, v2

    .line 342
    .restart local v9    # "width":I
    :goto_0
    if-ne v5, v8, :cond_2

    .line 343
    move v7, v6

    .local v7, "height":I
    goto :goto_1

    .line 344
    .end local v7    # "height":I
    :cond_2
    if-ne v5, v7, :cond_3

    .line 345
    int-to-float v7, v6

    invoke-static {v1, v7}, Ljava/lang/Math;->min(FF)F

    move-result v7

    float-to-int v7, v7

    .restart local v7    # "height":I
    goto :goto_1

    .line 347
    .end local v7    # "height":I
    :cond_3
    float-to-int v7, v1

    .line 350
    .restart local v7    # "height":I
    :goto_1
    iget-object v10, p0, Landroidx/wear/widget/CircledImageView;->mSquareDimen:Ljava/lang/Integer;

    if-eqz v10, :cond_4

    .line 351
    iget-object v10, p0, Landroidx/wear/widget/CircledImageView;->mSquareDimen:Ljava/lang/Integer;

    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v10

    packed-switch v10, :pswitch_data_0

    goto :goto_2

    .line 356
    :pswitch_0
    move v7, v9

    goto :goto_2

    .line 353
    :pswitch_1
    move v9, v7

    .line 354
    nop

    .line 361
    :cond_4
    :goto_2
    nop

    .line 362
    invoke-static {v9, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v10

    .line 363
    invoke-static {v7, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    .line 361
    invoke-super {p0, v10, v8}, Landroid/view/View;->onMeasure(II)V

    .line 364
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected onSetAlpha(I)Z
    .locals 1
    .param p1, "alpha"    # I

    .line 221
    const/4 v0, 0x1

    return v0
.end method

.method public onSizeChanged(IIII)V
    .locals 5
    .param p1, "newWidth"    # I
    .param p2, "newHeight"    # I
    .param p3, "oldWidth"    # I
    .param p4, "oldHeight"    # I

    .line 656
    if-ne p1, p3, :cond_0

    if-eq p2, p4, :cond_1

    .line 657
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mShadowPainter:Landroidx/wear/widget/CircledImageView$OvalShadowPainter;

    .line 658
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getPaddingLeft()I

    move-result v1

    .line 659
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getPaddingTop()I

    move-result v2

    .line 660
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getPaddingRight()I

    move-result v3

    sub-int v3, p1, v3

    .line 661
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getPaddingBottom()I

    move-result v4

    sub-int v4, p2, v4

    .line 657
    invoke-virtual {v0, v1, v2, v3, v4}, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->setBounds(IIII)V

    .line 663
    :cond_1
    return-void
.end method

.method protected onVisibilityChanged(Landroid/view/View;I)V
    .locals 1
    .param p1, "changedView"    # Landroid/view/View;
    .param p2, "visibility"    # I

    .line 567
    invoke-super {p0, p1, p2}, Landroid/view/View;->onVisibilityChanged(Landroid/view/View;I)V

    .line 568
    if-nez p2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Landroidx/wear/widget/CircledImageView;->mVisible:Z

    .line 569
    iget-boolean v0, p0, Landroidx/wear/widget/CircledImageView;->mProgressIndeterminate:Z

    invoke-virtual {p0, v0}, Landroidx/wear/widget/CircledImageView;->showIndeterminateProgress(Z)V

    .line 570
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .locals 1
    .param p1, "visibility"    # I

    .line 574
    invoke-super {p0, p1}, Landroid/view/View;->onWindowVisibilityChanged(I)V

    .line 575
    if-nez p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Landroidx/wear/widget/CircledImageView;->mWindowVisible:Z

    .line 576
    iget-boolean v0, p0, Landroidx/wear/widget/CircledImageView;->mProgressIndeterminate:Z

    invoke-virtual {p0, v0}, Landroidx/wear/widget/CircledImageView;->showIndeterminateProgress(Z)V

    .line 577
    return-void
.end method

.method public setCircleBorderCap(Landroid/graphics/Paint$Cap;)V
    .locals 1
    .param p1, "circleBorderCap"    # Landroid/graphics/Paint$Cap;

    .line 626
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mCircleBorderCap:Landroid/graphics/Paint$Cap;

    if-eq p1, v0, :cond_0

    .line 627
    iput-object p1, p0, Landroidx/wear/widget/CircledImageView;->mCircleBorderCap:Landroid/graphics/Paint$Cap;

    .line 628
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->invalidate()V

    .line 630
    :cond_0
    return-void
.end method

.method public setCircleBorderColor(I)V
    .locals 0
    .param p1, "circleBorderColor"    # I

    .line 604
    iput p1, p0, Landroidx/wear/widget/CircledImageView;->mCircleBorderColor:I

    .line 605
    return-void
.end method

.method public setCircleBorderWidth(F)V
    .locals 1
    .param p1, "circleBorderWidth"    # F

    .line 613
    iget v0, p0, Landroidx/wear/widget/CircledImageView;->mCircleBorderWidth:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    .line 614
    iput p1, p0, Landroidx/wear/widget/CircledImageView;->mCircleBorderWidth:F

    .line 615
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mShadowPainter:Landroidx/wear/widget/CircledImageView$OvalShadowPainter;

    invoke-virtual {v0, p1}, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->setInnerCircleBorderWidth(F)V

    .line 616
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->invalidate()V

    .line 618
    :cond_0
    return-void
.end method

.method public setCircleColor(I)V
    .locals 1
    .param p1, "circleColor"    # I

    .line 526
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/wear/widget/CircledImageView;->setCircleColorStateList(Landroid/content/res/ColorStateList;)V

    .line 527
    return-void
.end method

.method public setCircleColorStateList(Landroid/content/res/ColorStateList;)V
    .locals 1
    .param p1, "circleColor"    # Landroid/content/res/ColorStateList;

    .line 536
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mCircleColor:Landroid/content/res/ColorStateList;

    invoke-static {p1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 537
    iput-object p1, p0, Landroidx/wear/widget/CircledImageView;->mCircleColor:Landroid/content/res/ColorStateList;

    .line 538
    invoke-direct {p0}, Landroidx/wear/widget/CircledImageView;->setColorForCurrentState()V

    .line 539
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->invalidate()V

    .line 541
    :cond_0
    return-void
.end method

.method public setCircleHidden(Z)V
    .locals 1
    .param p1, "circleHidden"    # Z

    .line 213
    iget-boolean v0, p0, Landroidx/wear/widget/CircledImageView;->mCircleHidden:Z

    if-eq p1, v0, :cond_0

    .line 214
    iput-boolean p1, p0, Landroidx/wear/widget/CircledImageView;->mCircleHidden:Z

    .line 215
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->invalidate()V

    .line 217
    :cond_0
    return-void
.end method

.method public setCircleRadius(F)V
    .locals 2
    .param p1, "circleRadius"    # F

    .line 450
    iget v0, p0, Landroidx/wear/widget/CircledImageView;->mCircleRadius:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_1

    .line 451
    iput p1, p0, Landroidx/wear/widget/CircledImageView;->mCircleRadius:F

    .line 452
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mShadowPainter:Landroidx/wear/widget/CircledImageView$OvalShadowPainter;

    .line 453
    iget-boolean v1, p0, Landroidx/wear/widget/CircledImageView;->mPressed:Z

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getCircleRadiusPressed()F

    move-result v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getCircleRadius()F

    move-result v1

    :goto_0
    invoke-virtual {v0, v1}, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->setInnerCircleRadius(F)V

    .line 454
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->invalidate()V

    .line 456
    :cond_1
    return-void
.end method

.method public setCircleRadiusPercent(F)V
    .locals 2
    .param p1, "circleRadiusPercent"    # F

    .line 469
    iget v0, p0, Landroidx/wear/widget/CircledImageView;->mCircleRadiusPercent:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_1

    .line 470
    iput p1, p0, Landroidx/wear/widget/CircledImageView;->mCircleRadiusPercent:F

    .line 471
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mShadowPainter:Landroidx/wear/widget/CircledImageView$OvalShadowPainter;

    .line 472
    iget-boolean v1, p0, Landroidx/wear/widget/CircledImageView;->mPressed:Z

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getCircleRadiusPressed()F

    move-result v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getCircleRadius()F

    move-result v1

    :goto_0
    invoke-virtual {v0, v1}, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->setInnerCircleRadius(F)V

    .line 473
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->invalidate()V

    .line 475
    :cond_1
    return-void
.end method

.method public setCircleRadiusPressed(F)V
    .locals 1
    .param p1, "circleRadiusPressed"    # F

    .line 491
    iget v0, p0, Landroidx/wear/widget/CircledImageView;->mCircleRadiusPressed:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    .line 492
    iput p1, p0, Landroidx/wear/widget/CircledImageView;->mCircleRadiusPressed:F

    .line 493
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->invalidate()V

    .line 495
    :cond_0
    return-void
.end method

.method public setCircleRadiusPressedPercent(F)V
    .locals 2
    .param p1, "circleRadiusPressedPercent"    # F

    .line 510
    iget v0, p0, Landroidx/wear/widget/CircledImageView;->mCircleRadiusPressedPercent:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_1

    .line 511
    iput p1, p0, Landroidx/wear/widget/CircledImageView;->mCircleRadiusPressedPercent:F

    .line 512
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mShadowPainter:Landroidx/wear/widget/CircledImageView$OvalShadowPainter;

    .line 513
    iget-boolean v1, p0, Landroidx/wear/widget/CircledImageView;->mPressed:Z

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getCircleRadiusPressed()F

    move-result v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getCircleRadius()F

    move-result v1

    :goto_0
    invoke-virtual {v0, v1}, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->setInnerCircleRadius(F)V

    .line 514
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->invalidate()V

    .line 516
    :cond_1
    return-void
.end method

.method public setColorChangeAnimationDuration(J)V
    .locals 0
    .param p1, "mColorChangeAnimationDurationMs"    # J

    .line 714
    iput-wide p1, p0, Landroidx/wear/widget/CircledImageView;->mColorChangeAnimationDurationMs:J

    .line 715
    return-void
.end method

.method public setImageCirclePercentage(F)V
    .locals 2
    .param p1, "percentage"    # F

    .line 415
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 416
    .local v0, "clamped":F
    iget v1, p0, Landroidx/wear/widget/CircledImageView;->mImageCirclePercentage:F

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_0

    .line 417
    iput v0, p0, Landroidx/wear/widget/CircledImageView;->mImageCirclePercentage:F

    .line 418
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->invalidate()V

    .line 420
    :cond_0
    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 4
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .line 671
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eq p1, v0, :cond_3

    .line 672
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 673
    .local v0, "existingDrawable":Landroid/graphics/drawable/Drawable;
    iput-object p1, p0, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 674
    iget-object v1, p0, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 677
    iget-object v1, p0, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 679
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v1

    .line 680
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 681
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, p0, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 684
    :cond_0
    if-eqz p1, :cond_1

    if-eqz v0, :cond_1

    .line 687
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    .line 688
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 689
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    if-ne v1, v2, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    .line 691
    .local v1, "skipLayout":Z
    :goto_0
    if-eqz v1, :cond_2

    .line 692
    iget-object v2, p0, Landroidx/wear/widget/CircledImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    goto :goto_1

    .line 694
    :cond_2
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->requestLayout()V

    .line 697
    :goto_1
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->invalidate()V

    .line 699
    .end local v0    # "existingDrawable":Landroid/graphics/drawable/Drawable;
    .end local v1    # "skipLayout":Z
    :cond_3
    return-void
.end method

.method public setImageHorizontalOffcenterPercentage(F)V
    .locals 1
    .param p1, "percentage"    # F

    .line 424
    iget v0, p0, Landroidx/wear/widget/CircledImageView;->mImageHorizontalOffcenterPercentage:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    .line 425
    iput p1, p0, Landroidx/wear/widget/CircledImageView;->mImageHorizontalOffcenterPercentage:F

    .line 426
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->invalidate()V

    .line 428
    :cond_0
    return-void
.end method

.method public setImageResource(I)V
    .locals 1
    .param p1, "resId"    # I

    .line 410
    if-nez p1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    :goto_0
    invoke-virtual {p0, v0}, Landroidx/wear/widget/CircledImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 411
    return-void
.end method

.method public setImageTint(I)V
    .locals 1
    .param p1, "tint"    # I

    .line 432
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mImageTint:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mImageTint:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eq p1, v0, :cond_1

    .line 433
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Landroidx/wear/widget/CircledImageView;->mImageTint:Ljava/lang/Integer;

    .line 434
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->invalidate()V

    .line 436
    :cond_1
    return-void
.end method

.method public setPadding(IIII)V
    .locals 3
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .line 645
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getPaddingLeft()I

    move-result v0

    if-ne p1, v0, :cond_0

    .line 646
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getPaddingTop()I

    move-result v0

    if-ne p2, v0, :cond_0

    .line 647
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getPaddingRight()I

    move-result v0

    if-ne p3, v0, :cond_0

    .line 648
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getPaddingBottom()I

    move-result v0

    if-eq p4, v0, :cond_1

    .line 649
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mShadowPainter:Landroidx/wear/widget/CircledImageView$OvalShadowPainter;

    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getWidth()I

    move-result v1

    sub-int/2addr v1, p3

    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getHeight()I

    move-result v2

    sub-int/2addr v2, p4

    invoke-virtual {v0, p1, p2, v1, v2}, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->setBounds(IIII)V

    .line 651
    :cond_1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->setPadding(IIII)V

    .line 652
    return-void
.end method

.method public setPressed(Z)V
    .locals 2
    .param p1, "pressed"    # Z

    .line 634
    invoke-super {p0, p1}, Landroid/view/View;->setPressed(Z)V

    .line 635
    iget-boolean v0, p0, Landroidx/wear/widget/CircledImageView;->mPressed:Z

    if-eq p1, v0, :cond_1

    .line 636
    iput-boolean p1, p0, Landroidx/wear/widget/CircledImageView;->mPressed:Z

    .line 637
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mShadowPainter:Landroidx/wear/widget/CircledImageView$OvalShadowPainter;

    .line 638
    iget-boolean v1, p0, Landroidx/wear/widget/CircledImageView;->mPressed:Z

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getCircleRadiusPressed()F

    move-result v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->getCircleRadius()F

    move-result v1

    :goto_0
    invoke-virtual {v0, v1}, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->setInnerCircleRadius(F)V

    .line 639
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->invalidate()V

    .line 641
    :cond_1
    return-void
.end method

.method public setProgress(F)V
    .locals 1
    .param p1, "progress"    # F

    .line 581
    iget v0, p0, Landroidx/wear/widget/CircledImageView;->mProgress:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    .line 582
    iput p1, p0, Landroidx/wear/widget/CircledImageView;->mProgress:F

    .line 583
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->invalidate()V

    .line 585
    :cond_0
    return-void
.end method

.method public setShadowVisibility(F)V
    .locals 1
    .param p1, "shadowVisibility"    # F

    .line 593
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mShadowPainter:Landroidx/wear/widget/CircledImageView$OvalShadowPainter;

    iget v0, v0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowVisibility:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_0

    .line 594
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mShadowPainter:Landroidx/wear/widget/CircledImageView$OvalShadowPainter;

    invoke-virtual {v0, p1}, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->setShadowVisibility(F)V

    .line 595
    invoke-virtual {p0}, Landroidx/wear/widget/CircledImageView;->invalidate()V

    .line 597
    :cond_0
    return-void
.end method

.method public showIndeterminateProgress(Z)V
    .locals 1
    .param p1, "show"    # Z

    .line 555
    iput-boolean p1, p0, Landroidx/wear/widget/CircledImageView;->mProgressIndeterminate:Z

    .line 556
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mIndeterminateDrawable:Landroidx/wear/widget/ProgressDrawable;

    if-eqz v0, :cond_1

    .line 557
    if-eqz p1, :cond_0

    iget-boolean v0, p0, Landroidx/wear/widget/CircledImageView;->mVisible:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Landroidx/wear/widget/CircledImageView;->mWindowVisible:Z

    if-eqz v0, :cond_0

    .line 558
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mIndeterminateDrawable:Landroidx/wear/widget/ProgressDrawable;

    invoke-virtual {v0}, Landroidx/wear/widget/ProgressDrawable;->startAnimation()V

    goto :goto_0

    .line 560
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView;->mIndeterminateDrawable:Landroidx/wear/widget/ProgressDrawable;

    invoke-virtual {v0}, Landroidx/wear/widget/ProgressDrawable;->stopAnimation()V

    .line 563
    :cond_1
    :goto_0
    return-void
.end method
