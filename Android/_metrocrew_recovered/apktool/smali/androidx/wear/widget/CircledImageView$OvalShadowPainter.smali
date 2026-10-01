.class Landroidx/wear/widget/CircledImageView$OvalShadowPainter;
.super Ljava/lang/Object;
.source "CircledImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/CircledImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OvalShadowPainter"
.end annotation


# instance fields
.field private final mBounds:Landroid/graphics/RectF;

.field private mInnerCircleBorderWidth:F

.field private mInnerCircleRadius:F

.field private final mShaderColors:[I

.field private final mShaderStops:[F

.field private final mShadowPaint:Landroid/graphics/Paint;

.field private mShadowRadius:F

.field mShadowVisibility:F

.field final mShadowWidth:F


# direct methods
.method constructor <init>(FFFF)V
    .locals 4
    .param p1, "shadowWidth"    # F
    .param p2, "shadowVisibility"    # F
    .param p3, "innerCircleRadius"    # F
    .param p4, "innerCircleBorderWidth"    # F

    .line 738
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 723
    const/4 v0, 0x0

    const/high16 v1, -0x1000000

    filled-new-array {v1, v0}, [I

    move-result-object v0

    iput-object v0, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShaderColors:[I

    .line 724
    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShaderStops:[F

    .line 725
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mBounds:Landroid/graphics/RectF;

    .line 727
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowPaint:Landroid/graphics/Paint;

    .line 739
    iput p1, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowWidth:F

    .line 740
    iput p2, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowVisibility:F

    .line 741
    iput p3, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mInnerCircleRadius:F

    .line 742
    iput p4, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mInnerCircleBorderWidth:F

    .line 743
    iget v0, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mInnerCircleRadius:F

    iget v2, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mInnerCircleBorderWidth:F

    add-float/2addr v0, v2

    iget v2, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowWidth:F

    iget v3, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowVisibility:F

    mul-float/2addr v2, v3

    add-float/2addr v0, v2

    iput v0, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowRadius:F

    .line 745
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 746
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 747
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 748
    invoke-direct {p0}, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->updateRadialGradient()V

    .line 749
    return-void

    nop

    :array_0
    .array-data 4
        0x3f19999a    # 0.6f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private updateRadialGradient()V
    .locals 8

    .line 781
    iget v0, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mInnerCircleRadius:F

    iget v1, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mInnerCircleBorderWidth:F

    add-float/2addr v0, v1

    iget v1, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowWidth:F

    iget v2, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowVisibility:F

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowRadius:F

    .line 787
    iget v0, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowRadius:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 788
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowPaint:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/RadialGradient;

    iget-object v2, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mBounds:Landroid/graphics/RectF;

    .line 790
    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    iget-object v3, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mBounds:Landroid/graphics/RectF;

    .line 791
    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    iget v4, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowRadius:F

    iget-object v5, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShaderColors:[I

    iget-object v6, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShaderStops:[F

    sget-object v7, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    invoke-direct/range {v1 .. v7}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 788
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 797
    :cond_0
    return-void
.end method


# virtual methods
.method draw(Landroid/graphics/Canvas;F)V
    .locals 4
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "alpha"    # F

    .line 752
    iget v0, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowWidth:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    iget v0, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowVisibility:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 753
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowPaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->getAlpha()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, p2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 754
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    iget-object v1, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mBounds:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    iget v2, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowRadius:F

    iget-object v3, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 757
    :cond_0
    return-void
.end method

.method setBounds(IIII)V
    .locals 5
    .param p1, "left"    # I
    .param p2, "top"    # I
    .param p3, "right"    # I
    .param p4, "bottom"    # I

    .line 760
    iget-object v0, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mBounds:Landroid/graphics/RectF;

    int-to-float v1, p1

    int-to-float v2, p2

    int-to-float v3, p3

    int-to-float v4, p4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 761
    invoke-direct {p0}, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->updateRadialGradient()V

    .line 762
    return-void
.end method

.method setInnerCircleBorderWidth(F)V
    .locals 0
    .param p1, "newInnerCircleBorderWidth"    # F

    .line 770
    iput p1, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mInnerCircleBorderWidth:F

    .line 771
    invoke-direct {p0}, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->updateRadialGradient()V

    .line 772
    return-void
.end method

.method setInnerCircleRadius(F)V
    .locals 0
    .param p1, "newInnerCircleRadius"    # F

    .line 765
    iput p1, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mInnerCircleRadius:F

    .line 766
    invoke-direct {p0}, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->updateRadialGradient()V

    .line 767
    return-void
.end method

.method setShadowVisibility(F)V
    .locals 0
    .param p1, "newShadowVisibility"    # F

    .line 775
    iput p1, p0, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->mShadowVisibility:F

    .line 776
    invoke-direct {p0}, Landroidx/wear/widget/CircledImageView$OvalShadowPainter;->updateRadialGradient()V

    .line 777
    return-void
.end method
