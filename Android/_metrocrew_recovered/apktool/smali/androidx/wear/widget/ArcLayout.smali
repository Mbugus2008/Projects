.class public Landroidx/wear/widget/ArcLayout;
.super Landroid/view/ViewGroup;
.source "ArcLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/widget/ArcLayout$ChildArcAngles;,
        Landroidx/wear/widget/ArcLayout$Widget;,
        Landroidx/wear/widget/ArcLayout$LayoutParams;,
        Landroidx/wear/widget/ArcLayout$AnchorType;
    }
.end annotation


# static fields
.field public static final ANCHOR_CENTER:I = 0x1

.field public static final ANCHOR_END:I = 0x2

.field public static final ANCHOR_START:I = 0x0

.field private static final DEFAULT_ANCHOR_TYPE:I = 0x0

.field private static final DEFAULT_LAYOUT_DIRECTION_IS_CLOCKWISE:Z = true

.field private static final DEFAULT_START_ANGLE_DEGREES:F


# instance fields
.field private mAnchorAngleDegrees:F

.field private mAnchorType:I

.field private final mChildArcAngles:Landroidx/wear/widget/ArcLayout$ChildArcAngles;

.field private mClockwise:Z

.field private mMaxAngleDegrees:F

.field private mThicknessPx:I

.field private mTouchedView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 313
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/wear/widget/ArcLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 314
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 317
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/wear/widget/ArcLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 318
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .line 321
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroidx/wear/widget/ArcLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 322
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .line 329
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 296
    const/4 v0, 0x0

    iput v0, p0, Landroidx/wear/widget/ArcLayout;->mThicknessPx:I

    .line 305
    const/high16 v1, 0x43b40000    # 360.0f

    iput v1, p0, Landroidx/wear/widget/ArcLayout;->mMaxAngleDegrees:F

    .line 309
    new-instance v1, Landroidx/wear/widget/ArcLayout$ChildArcAngles;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Landroidx/wear/widget/ArcLayout$ChildArcAngles;-><init>(Landroidx/wear/widget/ArcLayout$1;)V

    iput-object v1, p0, Landroidx/wear/widget/ArcLayout;->mChildArcAngles:Landroidx/wear/widget/ArcLayout$ChildArcAngles;

    .line 564
    iput-object v2, p0, Landroidx/wear/widget/ArcLayout;->mTouchedView:Landroid/view/View;

    .line 331
    sget-object v1, Landroidx/wear/R$styleable;->ArcLayout:[I

    .line 332
    invoke-virtual {p1, p2, v1, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 336
    .local v1, "a":Landroid/content/res/TypedArray;
    sget v2, Landroidx/wear/R$styleable;->ArcLayout_anchorPosition:I

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroidx/wear/widget/ArcLayout;->mAnchorType:I

    .line 337
    sget v0, Landroidx/wear/R$styleable;->ArcLayout_anchorAngleDegrees:I

    .line 338
    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    iput v0, p0, Landroidx/wear/widget/ArcLayout;->mAnchorAngleDegrees:F

    .line 341
    sget v0, Landroidx/wear/R$styleable;->ArcLayout_clockwise:I

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, p0, Landroidx/wear/widget/ArcLayout;->mClockwise:Z

    .line 345
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 346
    return-void
.end method

.method private calculateArcAngle(Landroid/view/View;Landroidx/wear/widget/ArcLayout$ChildArcAngles;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "childAngles"    # Landroidx/wear/widget/ArcLayout$ChildArcAngles;

    .line 719
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    .line 720
    const/4 v0, 0x0

    iput v0, p2, Landroidx/wear/widget/ArcLayout$ChildArcAngles;->leftMarginAsAngle:F

    .line 721
    iput v0, p2, Landroidx/wear/widget/ArcLayout$ChildArcAngles;->rightMarginAsAngle:F

    .line 722
    iput v0, p2, Landroidx/wear/widget/ArcLayout$ChildArcAngles;->actualChildAngle:F

    .line 723
    return-void

    .line 726
    :cond_0
    invoke-virtual {p0}, Landroidx/wear/widget/ArcLayout;->getMeasuredWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iget v1, p0, Landroidx/wear/widget/ArcLayout;->mThicknessPx:I

    int-to-float v1, v1

    sub-float/2addr v0, v1

    .line 728
    .local v0, "radiusPx":F
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroidx/wear/widget/ArcLayout$LayoutParams;

    .line 730
    .local v1, "childLayoutParams":Landroidx/wear/widget/ArcLayout$LayoutParams;
    iget v2, v1, Landroidx/wear/widget/ArcLayout$LayoutParams;->leftMargin:I

    int-to-float v2, v2

    .line 731
    invoke-static {v2, v0}, Landroidx/wear/widget/ArcLayout;->widthToAngleDegrees(FF)F

    move-result v2

    iput v2, p2, Landroidx/wear/widget/ArcLayout$ChildArcAngles;->leftMarginAsAngle:F

    .line 732
    iget v2, v1, Landroidx/wear/widget/ArcLayout$LayoutParams;->rightMargin:I

    int-to-float v2, v2

    .line 733
    invoke-static {v2, v0}, Landroidx/wear/widget/ArcLayout;->widthToAngleDegrees(FF)F

    move-result v2

    iput v2, p2, Landroidx/wear/widget/ArcLayout$ChildArcAngles;->rightMarginAsAngle:F

    .line 735
    instance-of v2, p1, Landroidx/wear/widget/ArcLayout$Widget;

    if-eqz v2, :cond_1

    .line 736
    move-object v2, p1

    check-cast v2, Landroidx/wear/widget/ArcLayout$Widget;

    invoke-interface {v2}, Landroidx/wear/widget/ArcLayout$Widget;->getSweepAngleDegrees()F

    move-result v2

    iput v2, p2, Landroidx/wear/widget/ArcLayout$ChildArcAngles;->actualChildAngle:F

    goto :goto_0

    .line 738
    :cond_1
    nop

    .line 739
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    int-to-float v2, v2

    invoke-static {v2, v0}, Landroidx/wear/widget/ArcLayout;->widthToAngleDegrees(FF)F

    move-result v2

    iput v2, p2, Landroidx/wear/widget/ArcLayout$ChildArcAngles;->actualChildAngle:F

    .line 741
    :goto_0
    return-void
.end method

.method private calculateInitialRotation(F)F
    .locals 7
    .param p1, "multiplier"    # F

    .line 684
    iget v0, p0, Landroidx/wear/widget/ArcLayout;->mAnchorType:I

    if-nez v0, :cond_0

    .line 685
    iget v0, p0, Landroidx/wear/widget/ArcLayout;->mAnchorAngleDegrees:F

    mul-float/2addr v0, p1

    return v0

    .line 688
    :cond_0
    const/4 v0, 0x0

    .line 690
    .local v0, "totalArcAngle":F
    const/4 v1, 0x0

    .line 691
    .local v1, "hasWeights":Z
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-virtual {p0}, Landroidx/wear/widget/ArcLayout;->getChildCount()I

    move-result v3

    const/4 v4, 0x0

    if-ge v2, v3, :cond_2

    .line 692
    invoke-virtual {p0, v2}, Landroidx/wear/widget/ArcLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 693
    .local v3, "child":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroidx/wear/widget/ArcLayout$LayoutParams;

    .line 694
    .local v5, "childLayoutParams":Landroidx/wear/widget/ArcLayout$LayoutParams;
    invoke-virtual {v5}, Landroidx/wear/widget/ArcLayout$LayoutParams;->getWeight()F

    move-result v6

    cmpl-float v4, v6, v4

    if-lez v4, :cond_1

    .line 695
    const/4 v1, 0x1

    .line 697
    :cond_1
    iget-object v4, p0, Landroidx/wear/widget/ArcLayout;->mChildArcAngles:Landroidx/wear/widget/ArcLayout$ChildArcAngles;

    invoke-direct {p0, v3, v4}, Landroidx/wear/widget/ArcLayout;->calculateArcAngle(Landroid/view/View;Landroidx/wear/widget/ArcLayout$ChildArcAngles;)V

    .line 698
    iget-object v4, p0, Landroidx/wear/widget/ArcLayout;->mChildArcAngles:Landroidx/wear/widget/ArcLayout$ChildArcAngles;

    invoke-virtual {v4}, Landroidx/wear/widget/ArcLayout$ChildArcAngles;->getTotalAngle()F

    move-result v4

    add-float/2addr v0, v4

    .line 691
    .end local v3    # "child":Landroid/view/View;
    .end local v5    # "childLayoutParams":Landroidx/wear/widget/ArcLayout$LayoutParams;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 701
    .end local v2    # "i":I
    :cond_2
    if-eqz v1, :cond_3

    iget v2, p0, Landroidx/wear/widget/ArcLayout;->mMaxAngleDegrees:F

    cmpg-float v2, v0, v2

    if-gez v2, :cond_3

    .line 702
    iget v0, p0, Landroidx/wear/widget/ArcLayout;->mMaxAngleDegrees:F

    .line 705
    :cond_3
    iget v2, p0, Landroidx/wear/widget/ArcLayout;->mAnchorType:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_4

    .line 706
    iget v2, p0, Landroidx/wear/widget/ArcLayout;->mAnchorAngleDegrees:F

    mul-float/2addr v2, p1

    const/high16 v3, 0x40000000    # 2.0f

    div-float v3, v0, v3

    sub-float/2addr v2, v3

    return v2

    .line 707
    :cond_4
    iget v2, p0, Landroidx/wear/widget/ArcLayout;->mAnchorType:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_5

    .line 708
    iget v2, p0, Landroidx/wear/widget/ArcLayout;->mAnchorAngleDegrees:F

    mul-float/2addr v2, p1

    sub-float/2addr v2, v0

    return v2

    .line 711
    :cond_5
    return v4
.end method

.method private getChildTopInset(Landroid/view/View;)F
    .locals 7
    .param p1, "child"    # Landroid/view/View;

    .line 744
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/wear/widget/ArcLayout$LayoutParams;

    .line 746
    .local v0, "childLayoutParams":Landroidx/wear/widget/ArcLayout$LayoutParams;
    instance-of v1, p1, Landroidx/wear/widget/ArcLayout$Widget;

    if-eqz v1, :cond_0

    .line 747
    move-object v1, p1

    check-cast v1, Landroidx/wear/widget/ArcLayout$Widget;

    invoke-interface {v1}, Landroidx/wear/widget/ArcLayout$Widget;->getThickness()I

    move-result v1

    goto :goto_0

    .line 748
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    :goto_0
    nop

    .line 750
    .local v1, "childHeight":I
    iget v2, p0, Landroidx/wear/widget/ArcLayout;->mThicknessPx:I

    iget v3, v0, Landroidx/wear/widget/ArcLayout$LayoutParams;->topMargin:I

    sub-int/2addr v2, v3

    iget v3, v0, Landroidx/wear/widget/ArcLayout$LayoutParams;->bottomMargin:I

    sub-int/2addr v2, v3

    sub-int/2addr v2, v1

    .line 754
    .local v2, "thicknessDiffPx":I
    iget-boolean v3, p0, Landroidx/wear/widget/ArcLayout;->mClockwise:Z

    if-eqz v3, :cond_1

    iget v3, v0, Landroidx/wear/widget/ArcLayout$LayoutParams;->topMargin:I

    goto :goto_1

    :cond_1
    iget v3, v0, Landroidx/wear/widget/ArcLayout$LayoutParams;->bottomMargin:I

    .line 755
    .local v3, "margin":I
    :goto_1
    int-to-float v4, v3

    invoke-direct {p0, p1}, Landroidx/wear/widget/ArcLayout;->getChildTopOffset(Landroid/view/View;)F

    move-result v5

    add-float/2addr v4, v5

    .line 757
    .local v4, "topInset":F
    invoke-virtual {v0}, Landroidx/wear/widget/ArcLayout$LayoutParams;->getVerticalAlignment()I

    move-result v5

    packed-switch v5, :pswitch_data_0

    .line 766
    const/4 v5, 0x0

    return v5

    .line 763
    :pswitch_0
    int-to-float v5, v2

    add-float/2addr v5, v4

    return v5

    .line 761
    :pswitch_1
    int-to-float v5, v2

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v5, v6

    add-float/2addr v5, v4

    return v5

    .line 759
    :pswitch_2
    return v4

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getChildTopOffset(Landroid/view/View;)F
    .locals 2
    .param p1, "child"    # Landroid/view/View;

    .line 775
    instance-of v0, p1, Landroidx/wear/widget/ArcLayout$Widget;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Landroidx/wear/widget/ArcLayout;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p0}, Landroidx/wear/widget/ArcLayout;->getMeasuredHeight()I

    move-result v1

    if-lt v0, v1, :cond_0

    goto :goto_0

    .line 778
    :cond_0
    invoke-virtual {p0}, Landroidx/wear/widget/ArcLayout;->getMeasuredHeight()I

    move-result v0

    invoke-virtual {p0}, Landroidx/wear/widget/ArcLayout;->getMeasuredWidth()I

    move-result v1

    sub-int/2addr v0, v1

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    int-to-float v0, v0

    return v0

    .line 776
    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method private static insideChildClickArea(Landroid/view/View;FF)Z
    .locals 2
    .param p0, "child"    # Landroid/view/View;
    .param p1, "x"    # F
    .param p2, "y"    # F

    .line 599
    instance-of v0, p0, Landroidx/wear/widget/ArcLayout$Widget;

    if-eqz v0, :cond_0

    .line 600
    move-object v0, p0

    check-cast v0, Landroidx/wear/widget/ArcLayout$Widget;

    invoke-interface {v0, p1, p2}, Landroidx/wear/widget/ArcLayout$Widget;->isPointInsideClickArea(FF)Z

    move-result v0

    return v0

    .line 602
    :cond_0
    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    if-ltz v1, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    int-to-float v1, v1

    cmpg-float v1, p1, v1

    if-gez v1, :cond_1

    cmpl-float v0, p2, v0

    if-ltz v0, :cond_1

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    int-to-float v0, v0

    cmpg-float v0, p2, v0

    if-gez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private mapPoint(Landroid/view/View;F[F)V
    .locals 5
    .param p1, "child"    # Landroid/view/View;
    .param p2, "angle"    # F
    .param p3, "point"    # [F

    .line 607
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 609
    .local v0, "m":Landroid/graphics/Matrix;
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroidx/wear/widget/ArcLayout$LayoutParams;

    .line 610
    .local v1, "childLayoutParams":Landroidx/wear/widget/ArcLayout$LayoutParams;
    instance-of v2, p1, Landroidx/wear/widget/ArcLayout$Widget;

    if-eqz v2, :cond_0

    .line 611
    neg-float v2, p2

    invoke-virtual {p0}, Landroidx/wear/widget/ArcLayout;->getMeasuredWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    invoke-virtual {p0}, Landroidx/wear/widget/ArcLayout;->getMeasuredHeight()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    invoke-virtual {v0, v2, v3, v4}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    .line 612
    invoke-virtual {p1}, Landroid/view/View;->getX()F

    move-result v2

    neg-float v2, v2

    invoke-virtual {p1}, Landroid/view/View;->getY()F

    move-result v3

    neg-float v3, v3

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_0

    .line 614
    :cond_0
    iget v2, v1, Landroidx/wear/widget/ArcLayout$LayoutParams;->mCenterX:F

    neg-float v2, v2

    iget v3, v1, Landroidx/wear/widget/ArcLayout$LayoutParams;->mCenterY:F

    neg-float v3, v3

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 615
    invoke-virtual {v1}, Landroidx/wear/widget/ArcLayout$LayoutParams;->isRotated()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 616
    neg-float v2, p2

    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->postRotate(F)Z

    .line 618
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 620
    :goto_0
    invoke-virtual {v0, p3}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 621
    return-void
.end method

.method private static widthToAngleDegrees(FF)F
    .locals 4
    .param p0, "widthPx"    # F
    .param p1, "radiusPx"    # F

    .line 715
    div-float v0, p0, p1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->asin(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    mul-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .line 783
    instance-of v0, p1, Landroidx/wear/widget/ArcLayout$LayoutParams;

    return v0
.end method

.method protected drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 5
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "child"    # Landroid/view/View;
    .param p3, "drawingTime"    # J

    .line 651
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 653
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/wear/widget/ArcLayout$LayoutParams;

    .line 654
    .local v0, "childLayoutParams":Landroidx/wear/widget/ArcLayout$LayoutParams;
    iget v1, v0, Landroidx/wear/widget/ArcLayout$LayoutParams;->mMiddleAngle:F

    .line 656
    .local v1, "middleAngle":F
    instance-of v2, p2, Landroidx/wear/widget/ArcLayout$Widget;

    if-eqz v2, :cond_0

    .line 659
    nop

    .line 661
    invoke-virtual {p0}, Landroidx/wear/widget/ArcLayout;->getMeasuredWidth()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    .line 662
    invoke-virtual {p0}, Landroidx/wear/widget/ArcLayout;->getMeasuredHeight()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v4, v3

    .line 659
    invoke-virtual {p1, v1, v2, v4}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 664
    move-object v2, p2

    check-cast v2, Landroidx/wear/widget/ArcLayout$Widget;

    invoke-interface {v2}, Landroidx/wear/widget/ArcLayout$Widget;->checkInvalidAttributeAsChild()V

    goto :goto_2

    .line 670
    :cond_0
    invoke-virtual {v0}, Landroidx/wear/widget/ArcLayout$LayoutParams;->isRotated()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    .line 671
    iget-boolean v2, p0, Landroidx/wear/widget/ArcLayout;->mClockwise:Z

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    const/high16 v3, 0x43340000    # 180.0f

    :goto_0
    add-float/2addr v3, v1

    goto :goto_1

    .line 672
    :cond_2
    nop

    :goto_1
    nop

    .line 674
    .local v3, "angleToRotate":F
    iget v2, v0, Landroidx/wear/widget/ArcLayout$LayoutParams;->mCenterX:F

    iget v4, v0, Landroidx/wear/widget/ArcLayout$LayoutParams;->mCenterY:F

    invoke-virtual {p1, v3, v2, v4}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 676
    .end local v3    # "angleToRotate":F
    :goto_2
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result v2

    .line 678
    .local v2, "wasInvalidateIssued":Z
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 680
    return v2
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 2

    .line 801
    new-instance v0, Landroidx/wear/widget/ArcLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroidx/wear/widget/ArcLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 2
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .line 795
    new-instance v0, Landroidx/wear/widget/ArcLayout$LayoutParams;

    invoke-virtual {p0}, Landroidx/wear/widget/ArcLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroidx/wear/widget/ArcLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .line 789
    new-instance v0, Landroidx/wear/widget/ArcLayout$LayoutParams;

    invoke-direct {v0, p1}, Landroidx/wear/widget/ArcLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public getAnchorAngleDegrees()F
    .locals 1

    .line 824
    iget v0, p0, Landroidx/wear/widget/ArcLayout;->mAnchorAngleDegrees:F

    return v0
.end method

.method public getAnchorType()I
    .locals 1

    .line 808
    iget v0, p0, Landroidx/wear/widget/ArcLayout;->mAnchorType:I

    return v0
.end method

.method public getMaxAngleDegrees()F
    .locals 1

    .line 840
    iget v0, p0, Landroidx/wear/widget/ArcLayout;->mMaxAngleDegrees:F

    return v0
.end method

.method public isClockwise()Z
    .locals 1

    .line 858
    iget-boolean v0, p0, Landroidx/wear/widget/ArcLayout;->mClockwise:Z

    return v0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 9
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 568
    iget-object v0, p0, Landroidx/wear/widget/ArcLayout;->mTouchedView:Landroid/view/View;

    const/4 v1, 0x1

    if-nez v0, :cond_2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_2

    .line 569
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Landroidx/wear/widget/ArcLayout;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_2

    .line 570
    invoke-virtual {p0, v0}, Landroidx/wear/widget/ArcLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 572
    .local v2, "child":Landroid/view/View;
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-eqz v3, :cond_0

    .line 573
    goto :goto_1

    .line 577
    :cond_0
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/wear/widget/ArcLayout$LayoutParams;

    .line 578
    .local v3, "childLayoutParams":Landroidx/wear/widget/ArcLayout$LayoutParams;
    iget v4, v3, Landroidx/wear/widget/ArcLayout$LayoutParams;->mMiddleAngle:F

    .line 580
    .local v4, "angle":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    const/4 v7, 0x2

    new-array v7, v7, [F

    const/4 v8, 0x0

    aput v5, v7, v8

    aput v6, v7, v1

    .line 581
    .local v7, "point":[F
    invoke-direct {p0, v2, v4, v7}, Landroidx/wear/widget/ArcLayout;->mapPoint(Landroid/view/View;F[F)V

    .line 584
    aget v5, v7, v8

    .line 585
    .local v5, "x":F
    aget v6, v7, v1

    .line 587
    .local v6, "y":F
    invoke-static {v2, v5, v6}, Landroidx/wear/widget/ArcLayout;->insideChildClickArea(Landroid/view/View;FF)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 588
    iput-object v2, p0, Landroidx/wear/widget/ArcLayout;->mTouchedView:Landroid/view/View;

    .line 589
    goto :goto_2

    .line 569
    .end local v2    # "child":Landroid/view/View;
    .end local v3    # "childLayoutParams":Landroidx/wear/widget/ArcLayout$LayoutParams;
    .end local v4    # "angle":F
    .end local v5    # "x":F
    .end local v6    # "y":F
    .end local v7    # "point":[F
    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 595
    .end local v0    # "i":I
    :cond_2
    :goto_2
    return v1
.end method

.method protected onLayout(ZIIII)V
    .locals 27
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .line 458
    move-object/from16 v0, p0

    invoke-virtual {v0}, Landroidx/wear/widget/ArcLayout;->getLayoutDirection()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 461
    .local v2, "isLayoutRtl":Z
    :goto_0
    iget-boolean v1, v0, Landroidx/wear/widget/ArcLayout;->mClockwise:Z

    if-eq v1, v2, :cond_1

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_1

    :cond_1
    const/high16 v1, -0x40800000    # -1.0f

    .line 464
    .local v1, "multiplier":F
    :goto_1
    invoke-direct {v0, v1}, Landroidx/wear/widget/ArcLayout;->calculateInitialRotation(F)F

    move-result v3

    .line 469
    .local v3, "currentCumulativeAngle":F
    const/4 v4, 0x0

    .line 470
    .local v4, "totalAngle":F
    const/4 v5, 0x0

    .line 471
    .local v5, "weightSum":F
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_2
    invoke-virtual {v0}, Landroidx/wear/widget/ArcLayout;->getChildCount()I

    move-result v7

    const/16 v8, 0x8

    const/4 v9, 0x0

    if-ge v6, v7, :cond_4

    .line 472
    invoke-virtual {v0, v6}, Landroidx/wear/widget/ArcLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 474
    .local v7, "child":Landroid/view/View;
    invoke-virtual {v7}, Landroid/view/View;->getVisibility()I

    move-result v10

    if-ne v10, v8, :cond_2

    .line 475
    goto :goto_3

    .line 478
    :cond_2
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroidx/wear/widget/ArcLayout$LayoutParams;

    .line 479
    .local v8, "childLayoutParams":Landroidx/wear/widget/ArcLayout$LayoutParams;
    iget v10, v8, Landroidx/wear/widget/ArcLayout$LayoutParams;->mWeight:F

    cmpl-float v9, v10, v9

    if-lez v9, :cond_3

    .line 480
    iget v9, v8, Landroidx/wear/widget/ArcLayout$LayoutParams;->mWeight:F

    add-float/2addr v5, v9

    .line 481
    iget-object v9, v0, Landroidx/wear/widget/ArcLayout;->mChildArcAngles:Landroidx/wear/widget/ArcLayout$ChildArcAngles;

    invoke-direct {v0, v7, v9}, Landroidx/wear/widget/ArcLayout;->calculateArcAngle(Landroid/view/View;Landroidx/wear/widget/ArcLayout$ChildArcAngles;)V

    .line 482
    iget-object v9, v0, Landroidx/wear/widget/ArcLayout;->mChildArcAngles:Landroidx/wear/widget/ArcLayout$ChildArcAngles;

    iget v9, v9, Landroidx/wear/widget/ArcLayout$ChildArcAngles;->leftMarginAsAngle:F

    iget-object v10, v0, Landroidx/wear/widget/ArcLayout;->mChildArcAngles:Landroidx/wear/widget/ArcLayout$ChildArcAngles;

    iget v10, v10, Landroidx/wear/widget/ArcLayout$ChildArcAngles;->rightMarginAsAngle:F

    add-float/2addr v9, v10

    add-float/2addr v4, v9

    goto :goto_3

    .line 485
    :cond_3
    iget-object v9, v0, Landroidx/wear/widget/ArcLayout;->mChildArcAngles:Landroidx/wear/widget/ArcLayout$ChildArcAngles;

    invoke-direct {v0, v7, v9}, Landroidx/wear/widget/ArcLayout;->calculateArcAngle(Landroid/view/View;Landroidx/wear/widget/ArcLayout$ChildArcAngles;)V

    .line 486
    iget-object v9, v0, Landroidx/wear/widget/ArcLayout;->mChildArcAngles:Landroidx/wear/widget/ArcLayout$ChildArcAngles;

    invoke-virtual {v9}, Landroidx/wear/widget/ArcLayout$ChildArcAngles;->getTotalAngle()F

    move-result v9

    add-float/2addr v4, v9

    .line 471
    .end local v7    # "child":Landroid/view/View;
    .end local v8    # "childLayoutParams":Landroidx/wear/widget/ArcLayout$LayoutParams;
    :goto_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    .line 490
    .end local v6    # "i":I
    :cond_4
    const/4 v6, 0x0

    .line 491
    .local v6, "weightMultiplier":F
    cmpl-float v7, v5, v9

    if-lez v7, :cond_5

    .line 492
    iget v7, v0, Landroidx/wear/widget/ArcLayout;->mMaxAngleDegrees:F

    sub-float/2addr v7, v4

    div-float v6, v7, v5

    .line 496
    :cond_5
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_4
    invoke-virtual {v0}, Landroidx/wear/widget/ArcLayout;->getChildCount()I

    move-result v10

    if-ge v7, v10, :cond_a

    .line 497
    invoke-virtual {v0, v7}, Landroidx/wear/widget/ArcLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    .line 499
    .local v10, "child":Landroid/view/View;
    invoke-virtual {v10}, Landroid/view/View;->getVisibility()I

    move-result v11

    if-ne v11, v8, :cond_6

    .line 500
    move/from16 v18, v1

    move v8, v2

    goto/16 :goto_6

    .line 503
    :cond_6
    iget-object v11, v0, Landroidx/wear/widget/ArcLayout;->mChildArcAngles:Landroidx/wear/widget/ArcLayout$ChildArcAngles;

    invoke-direct {v0, v10, v11}, Landroidx/wear/widget/ArcLayout;->calculateArcAngle(Landroid/view/View;Landroidx/wear/widget/ArcLayout$ChildArcAngles;)V

    .line 504
    invoke-virtual {v10}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    check-cast v11, Landroidx/wear/widget/ArcLayout$LayoutParams;

    .line 505
    .local v11, "childLayoutParams":Landroidx/wear/widget/ArcLayout$LayoutParams;
    iget v12, v11, Landroidx/wear/widget/ArcLayout$LayoutParams;->mWeight:F

    cmpl-float v12, v12, v9

    if-lez v12, :cond_8

    .line 506
    iget-object v12, v0, Landroidx/wear/widget/ArcLayout;->mChildArcAngles:Landroidx/wear/widget/ArcLayout$ChildArcAngles;

    iget v13, v11, Landroidx/wear/widget/ArcLayout$LayoutParams;->mWeight:F

    mul-float/2addr v13, v6

    iput v13, v12, Landroidx/wear/widget/ArcLayout$ChildArcAngles;->actualChildAngle:F

    .line 507
    instance-of v12, v10, Landroidx/wear/widget/ArcLayout$Widget;

    if-eqz v12, :cond_7

    .line 510
    move-object v12, v10

    check-cast v12, Landroidx/wear/widget/ArcLayout$Widget;

    iget-object v13, v0, Landroidx/wear/widget/ArcLayout;->mChildArcAngles:Landroidx/wear/widget/ArcLayout$ChildArcAngles;

    iget v13, v13, Landroidx/wear/widget/ArcLayout$ChildArcAngles;->actualChildAngle:F

    invoke-interface {v12, v13}, Landroidx/wear/widget/ArcLayout$Widget;->setSweepAngleDegrees(F)V

    goto :goto_5

    .line 512
    :cond_7
    new-instance v8, Ljava/lang/IllegalStateException;

    const-string v9, "ArcLayout.LayoutParams with non zero weights are only supported for views implementing ArcLayout.Widget"

    invoke-direct {v8, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 516
    :cond_8
    :goto_5
    iget-object v12, v0, Landroidx/wear/widget/ArcLayout;->mChildArcAngles:Landroidx/wear/widget/ArcLayout$ChildArcAngles;

    iget v12, v12, Landroidx/wear/widget/ArcLayout$ChildArcAngles;->leftMarginAsAngle:F

    iget-object v13, v0, Landroidx/wear/widget/ArcLayout;->mChildArcAngles:Landroidx/wear/widget/ArcLayout$ChildArcAngles;

    iget v13, v13, Landroidx/wear/widget/ArcLayout$ChildArcAngles;->actualChildAngle:F

    const/high16 v14, 0x40000000    # 2.0f

    div-float/2addr v13, v14

    add-float/2addr v12, v13

    .line 518
    .local v12, "preRotation":F
    add-float v13, v3, v12

    mul-float/2addr v13, v1

    .line 519
    .local v13, "middleAngle":F
    iput v13, v11, Landroidx/wear/widget/ArcLayout$LayoutParams;->mMiddleAngle:F

    .line 522
    invoke-virtual {v0}, Landroidx/wear/widget/ArcLayout;->getMeasuredHeight()I

    move-result v15

    invoke-virtual {v10}, Landroid/view/View;->getMeasuredHeight()I

    move-result v16

    sub-int v15, v15, v16

    div-int/lit8 v15, v15, 0x2

    int-to-float v15, v15

    .line 523
    invoke-direct {v0, v10}, Landroidx/wear/widget/ArcLayout;->getChildTopInset(Landroid/view/View;)F

    move-result v16

    sub-float v15, v15, v16

    .line 526
    .local v15, "centerToCenterDistance":F
    nop

    .line 527
    invoke-virtual {v0}, Landroidx/wear/widget/ArcLayout;->getMeasuredWidth()I

    move-result v8

    int-to-float v8, v8

    div-float/2addr v8, v14

    move-object/from16 v17, v10

    .end local v10    # "child":Landroid/view/View;
    .local v17, "child":Landroid/view/View;
    float-to-double v9, v8

    move/from16 v18, v1

    move v8, v2

    .end local v1    # "multiplier":F
    .end local v2    # "isLayoutRtl":Z
    .local v8, "isLayoutRtl":Z
    .local v18, "multiplier":F
    float-to-double v1, v15

    move/from16 v19, v14

    move/from16 v20, v15

    .end local v15    # "centerToCenterDistance":F
    .local v20, "centerToCenterDistance":F
    float-to-double v14, v13

    const-wide v21, 0x400921fb54442d18L    # Math.PI

    mul-double v14, v14, v21

    const-wide v23, 0x4066800000000000L    # 180.0

    div-double v14, v14, v23

    .line 528
    invoke-static {v14, v15}, Ljava/lang/Math;->sin(D)D

    move-result-wide v14

    mul-double/2addr v1, v14

    add-double/2addr v9, v1

    double-to-float v1, v9

    iput v1, v11, Landroidx/wear/widget/ArcLayout$LayoutParams;->mCenterX:F

    .line 529
    nop

    .line 530
    invoke-virtual {v0}, Landroidx/wear/widget/ArcLayout;->getMeasuredHeight()I

    move-result v1

    int-to-float v1, v1

    div-float v1, v1, v19

    float-to-double v1, v1

    move/from16 v15, v20

    .end local v20    # "centerToCenterDistance":F
    .restart local v15    # "centerToCenterDistance":F
    float-to-double v9, v15

    move-wide/from16 v25, v1

    float-to-double v1, v13

    mul-double v1, v1, v21

    div-double v1, v1, v23

    .line 531
    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    move-result-wide v1

    mul-double/2addr v9, v1

    sub-double v1, v25, v9

    double-to-float v1, v1

    iput v1, v11, Landroidx/wear/widget/ArcLayout$LayoutParams;->mCenterY:F

    .line 533
    iget-object v1, v0, Landroidx/wear/widget/ArcLayout;->mChildArcAngles:Landroidx/wear/widget/ArcLayout$ChildArcAngles;

    invoke-virtual {v1}, Landroidx/wear/widget/ArcLayout$ChildArcAngles;->getTotalAngle()F

    move-result v1

    add-float/2addr v3, v1

    .line 538
    move-object/from16 v1, v17

    .end local v17    # "child":Landroid/view/View;
    .local v1, "child":Landroid/view/View;
    instance-of v2, v1, Landroidx/wear/widget/ArcLayout$Widget;

    if-eqz v2, :cond_9

    .line 539
    nop

    .line 540
    invoke-virtual {v0}, Landroidx/wear/widget/ArcLayout;->getMeasuredWidth()I

    move-result v2

    int-to-float v2, v2

    div-float v2, v2, v19

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v9

    int-to-float v9, v9

    div-float v9, v9, v19

    sub-float/2addr v2, v9

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 541
    .local v2, "leftPx":I
    nop

    .line 542
    invoke-virtual {v0}, Landroidx/wear/widget/ArcLayout;->getMeasuredHeight()I

    move-result v9

    int-to-float v9, v9

    div-float v9, v9, v19

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v10

    int-to-float v10, v10

    div-float v10, v10, v19

    sub-float/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    .line 544
    .local v9, "topPx":I
    nop

    .line 547
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    add-int/2addr v10, v2

    .line 548
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v14

    add-int/2addr v14, v9

    .line 544
    invoke-virtual {v1, v2, v9, v10, v14}, Landroid/view/View;->layout(IIII)V

    .line 550
    .end local v2    # "leftPx":I
    .end local v9    # "topPx":I
    goto :goto_6

    .line 553
    :cond_9
    iget v2, v11, Landroidx/wear/widget/ArcLayout$LayoutParams;->mCenterX:F

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v9

    int-to-float v9, v9

    div-float v9, v9, v19

    sub-float/2addr v2, v9

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    .line 554
    .restart local v2    # "leftPx":I
    iget v9, v11, Landroidx/wear/widget/ArcLayout$LayoutParams;->mCenterY:F

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v10

    int-to-float v10, v10

    div-float v10, v10, v19

    sub-float/2addr v9, v10

    invoke-static {v9}, Ljava/lang/Math;->round(F)I

    move-result v9

    .line 556
    .restart local v9    # "topPx":I
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v10

    add-int/2addr v10, v2

    .line 557
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v14

    add-int/2addr v14, v9

    .line 556
    invoke-virtual {v1, v2, v9, v10, v14}, Landroid/view/View;->layout(IIII)V

    .line 496
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "leftPx":I
    .end local v9    # "topPx":I
    .end local v11    # "childLayoutParams":Landroidx/wear/widget/ArcLayout$LayoutParams;
    .end local v12    # "preRotation":F
    .end local v13    # "middleAngle":F
    .end local v15    # "centerToCenterDistance":F
    :goto_6
    add-int/lit8 v7, v7, 0x1

    move v2, v8

    move/from16 v1, v18

    const/16 v8, 0x8

    const/4 v9, 0x0

    goto/16 :goto_4

    .line 560
    .end local v7    # "i":I
    .end local v8    # "isLayoutRtl":Z
    .end local v18    # "multiplier":F
    .local v1, "multiplier":F
    .local v2, "isLayoutRtl":Z
    :cond_a
    return-void
.end method

.method protected onMeasure(II)V
    .locals 16
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .line 365
    move-object/from16 v0, p0

    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 366
    .local v1, "actualWidthPx":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    .line 368
    .local v2, "actualHeightPx":I
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    if-nez v3, :cond_0

    .line 369
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    if-nez v3, :cond_0

    .line 372
    invoke-virtual {v0}, Landroidx/wear/widget/ArcLayout;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    .line 373
    .local v3, "displayMetrics":Landroid/util/DisplayMetrics;
    iget v1, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 374
    iget v2, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 378
    .end local v3    # "displayMetrics":Landroid/util/DisplayMetrics;
    :cond_0
    if-ge v1, v2, :cond_1

    .line 379
    move v2, v1

    goto :goto_0

    .line 380
    :cond_1
    if-ge v2, v1, :cond_2

    .line 381
    move v1, v2

    .line 384
    :cond_2
    :goto_0
    div-int/lit8 v3, v2, 0x2

    .line 387
    .local v3, "maxChildDimension":I
    const/high16 v4, -0x80000000

    invoke-static {v3, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 393
    .local v4, "childMeasureSpec":I
    const/4 v5, 0x0

    .line 394
    .local v5, "maxChildHeightPx":I
    const/4 v6, 0x0

    .line 395
    .local v6, "childState":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_1
    invoke-virtual {v0}, Landroidx/wear/widget/ArcLayout;->getChildCount()I

    move-result v8

    const/16 v9, 0x8

    const/4 v10, 0x0

    if-ge v7, v8, :cond_5

    .line 396
    invoke-virtual {v0, v7}, Landroidx/wear/widget/ArcLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 398
    .local v8, "child":Landroid/view/View;
    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v11

    if-ne v11, v9, :cond_3

    .line 399
    goto :goto_3

    .line 405
    :cond_3
    instance-of v9, v8, Landroidx/wear/widget/ArcLayout$Widget;

    if-eqz v9, :cond_4

    .line 406
    move-object v9, v8

    check-cast v9, Landroidx/wear/widget/ArcLayout$Widget;

    invoke-interface {v9}, Landroidx/wear/widget/ArcLayout$Widget;->getThickness()I

    move-result v9

    .local v9, "childMeasuredHeight":I
    goto :goto_2

    .line 408
    .end local v9    # "childMeasuredHeight":I
    :cond_4
    nop

    .line 410
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    iget v9, v9, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-static {v4, v10, v9}, Landroidx/wear/widget/ArcLayout;->getChildMeasureSpec(III)I

    move-result v9

    .line 411
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    iget v11, v11, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-static {v4, v10, v11}, Landroidx/wear/widget/ArcLayout;->getChildMeasureSpec(III)I

    move-result v10

    .line 408
    invoke-virtual {v0, v8, v9, v10}, Landroidx/wear/widget/ArcLayout;->measureChild(Landroid/view/View;II)V

    .line 413
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredHeight()I

    move-result v9

    .line 414
    .restart local v9    # "childMeasuredHeight":I
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredState()I

    move-result v10

    invoke-static {v6, v10}, Landroidx/wear/widget/ArcLayout;->combineMeasuredStates(II)I

    move-result v6

    .line 417
    :goto_2
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    check-cast v10, Landroidx/wear/widget/ArcLayout$LayoutParams;

    .line 418
    .local v10, "childLayoutParams":Landroidx/wear/widget/ArcLayout$LayoutParams;
    iget v11, v10, Landroidx/wear/widget/ArcLayout$LayoutParams;->topMargin:I

    add-int/2addr v11, v9

    iget v12, v10, Landroidx/wear/widget/ArcLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v11, v12

    invoke-static {v5, v11}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 395
    .end local v8    # "child":Landroid/view/View;
    .end local v9    # "childMeasuredHeight":I
    .end local v10    # "childLayoutParams":Landroidx/wear/widget/ArcLayout$LayoutParams;
    :goto_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 422
    .end local v7    # "i":I
    :cond_5
    iput v5, v0, Landroidx/wear/widget/ArcLayout;->mThicknessPx:I

    .line 425
    const/4 v7, 0x0

    .restart local v7    # "i":I
    :goto_4
    invoke-virtual {v0}, Landroidx/wear/widget/ArcLayout;->getChildCount()I

    move-result v8

    if-ge v7, v8, :cond_8

    .line 426
    invoke-virtual {v0, v7}, Landroidx/wear/widget/ArcLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    .line 428
    .restart local v8    # "child":Landroid/view/View;
    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v11

    if-ne v11, v9, :cond_6

    .line 429
    goto :goto_5

    .line 432
    :cond_6
    instance-of v11, v8, Landroidx/wear/widget/ArcLayout$Widget;

    if-eqz v11, :cond_7

    .line 433
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v11

    check-cast v11, Landroidx/wear/widget/ArcLayout$LayoutParams;

    .line 435
    .local v11, "childLayoutParams":Landroidx/wear/widget/ArcLayout$LayoutParams;
    invoke-direct {v0, v8}, Landroidx/wear/widget/ArcLayout;->getChildTopInset(Landroid/view/View;)F

    move-result v12

    .line 437
    .local v12, "insetPx":F
    mul-int/lit8 v13, v3, 0x2

    const/high16 v14, 0x40000000    # 2.0f

    mul-float/2addr v14, v12

    .line 439
    invoke-static {v14}, Ljava/lang/Math;->round(F)I

    move-result v14

    sub-int/2addr v13, v14

    .line 438
    const/high16 v14, 0x40000000    # 2.0f

    invoke-static {v13, v14}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v13

    .line 441
    .local v13, "innerChildMeasureSpec":I
    iget v14, v11, Landroidx/wear/widget/ArcLayout$LayoutParams;->width:I

    .line 443
    invoke-static {v13, v10, v14}, Landroidx/wear/widget/ArcLayout;->getChildMeasureSpec(III)I

    move-result v14

    iget v15, v11, Landroidx/wear/widget/ArcLayout$LayoutParams;->height:I

    .line 444
    invoke-static {v13, v10, v15}, Landroidx/wear/widget/ArcLayout;->getChildMeasureSpec(III)I

    move-result v15

    .line 441
    invoke-virtual {v0, v8, v14, v15}, Landroidx/wear/widget/ArcLayout;->measureChild(Landroid/view/View;II)V

    .line 447
    invoke-virtual {v8}, Landroid/view/View;->getMeasuredState()I

    move-result v14

    invoke-static {v6, v14}, Landroidx/wear/widget/ArcLayout;->combineMeasuredStates(II)I

    move-result v6

    .line 425
    .end local v8    # "child":Landroid/view/View;
    .end local v11    # "childLayoutParams":Landroidx/wear/widget/ArcLayout$LayoutParams;
    .end local v12    # "insetPx":F
    .end local v13    # "innerChildMeasureSpec":I
    :cond_7
    :goto_5
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 451
    .end local v7    # "i":I
    :cond_8
    nop

    .line 452
    move/from16 v7, p1

    invoke-static {v1, v7, v6}, Landroidx/wear/widget/ArcLayout;->resolveSizeAndState(III)I

    move-result v8

    .line 453
    move/from16 v9, p2

    invoke-static {v2, v9, v6}, Landroidx/wear/widget/ArcLayout;->resolveSizeAndState(III)I

    move-result v10

    .line 451
    invoke-virtual {v0, v8, v10}, Landroidx/wear/widget/ArcLayout;->setMeasuredDimension(II)V

    .line 454
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 7
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 626
    iget-object v0, p0, Landroidx/wear/widget/ArcLayout;->mTouchedView:Landroid/view/View;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 628
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    const/4 v3, 0x2

    new-array v3, v3, [F

    aput v0, v3, v1

    const/4 v0, 0x1

    aput v2, v3, v0

    .line 629
    .local v3, "point":[F
    iget-object v2, p0, Landroidx/wear/widget/ArcLayout;->mTouchedView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroidx/wear/widget/ArcLayout$LayoutParams;

    .line 630
    .local v2, "touchedViewLayoutParams":Landroidx/wear/widget/ArcLayout$LayoutParams;
    iget-object v4, p0, Landroidx/wear/widget/ArcLayout;->mTouchedView:Landroid/view/View;

    iget v5, v2, Landroidx/wear/widget/ArcLayout$LayoutParams;->mMiddleAngle:F

    invoke-direct {p0, v4, v5, v3}, Landroidx/wear/widget/ArcLayout;->mapPoint(Landroid/view/View;F[F)V

    .line 632
    aget v1, v3, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    sub-float/2addr v1, v4

    .line 633
    .local v1, "dx":F
    aget v4, v3, v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    sub-float/2addr v4, v5

    .line 634
    .local v4, "dy":F
    invoke-virtual {p1, v1, v4}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 636
    iget-object v5, p0, Landroidx/wear/widget/ArcLayout;->mTouchedView:Landroid/view/View;

    invoke-virtual {v5, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 638
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v5

    if-eq v5, v0, :cond_0

    .line 639
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v5

    const/4 v6, 0x3

    if-ne v5, v6, :cond_1

    .line 641
    :cond_0
    const/4 v5, 0x0

    iput-object v5, p0, Landroidx/wear/widget/ArcLayout;->mTouchedView:Landroid/view/View;

    .line 643
    :cond_1
    return v0

    .line 645
    .end local v1    # "dx":F
    .end local v2    # "touchedViewLayoutParams":Landroidx/wear/widget/ArcLayout$LayoutParams;
    .end local v3    # "point":[F
    .end local v4    # "dy":F
    :cond_2
    return v1
.end method

.method public requestLayout()V
    .locals 2

    .line 350
    invoke-super {p0}, Landroid/view/ViewGroup;->requestLayout()V

    .line 352
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Landroidx/wear/widget/ArcLayout;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 353
    invoke-virtual {p0, v0}, Landroidx/wear/widget/ArcLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->forceLayout()V

    .line 352
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 355
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method public setAnchorAngleDegrees(F)V
    .locals 0
    .param p1, "anchorAngleDegrees"    # F

    .line 830
    iput p1, p0, Landroidx/wear/widget/ArcLayout;->mAnchorAngleDegrees:F

    .line 831
    invoke-virtual {p0}, Landroidx/wear/widget/ArcLayout;->invalidate()V

    .line 832
    return-void
.end method

.method public setAnchorType(I)V
    .locals 2
    .param p1, "anchorType"    # I

    .line 813
    if-ltz p1, :cond_0

    const/4 v0, 0x2

    if-gt p1, v0, :cond_0

    .line 817
    iput p1, p0, Landroidx/wear/widget/ArcLayout;->mAnchorType:I

    .line 818
    invoke-virtual {p0}, Landroidx/wear/widget/ArcLayout;->invalidate()V

    .line 819
    return-void

    .line 814
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Unknown anchor type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setClockwise(Z)V
    .locals 0
    .param p1, "clockwise"    # Z

    .line 863
    iput-boolean p1, p0, Landroidx/wear/widget/ArcLayout;->mClockwise:Z

    .line 864
    invoke-virtual {p0}, Landroidx/wear/widget/ArcLayout;->invalidate()V

    .line 865
    return-void
.end method

.method public setMaxAngleDegrees(F)V
    .locals 0
    .param p1, "maxAngleDegrees"    # F

    .line 851
    iput p1, p0, Landroidx/wear/widget/ArcLayout;->mMaxAngleDegrees:F

    .line 852
    invoke-virtual {p0}, Landroidx/wear/widget/ArcLayout;->invalidate()V

    .line 853
    invoke-virtual {p0}, Landroidx/wear/widget/ArcLayout;->requestLayout()V

    .line 854
    return-void
.end method
