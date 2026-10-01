.class public Landroidx/wear/widget/BoxInsetLayout;
.super Landroid/view/ViewGroup;
.source "BoxInsetLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/widget/BoxInsetLayout$LayoutParams;
    }
.end annotation


# static fields
.field private static final DEFAULT_CHILD_GRAVITY:I = 0x800033

.field private static final FACTOR:F = 0.146447f


# instance fields
.field private mForegroundDrawable:Landroid/graphics/drawable/Drawable;

.field private mForegroundPadding:Landroid/graphics/Rect;

.field private mInsets:Landroid/graphics/Rect;

.field private mIsRound:Z

.field private final mScreenHeight:I

.field private final mScreenWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 68
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/wear/widget/BoxInsetLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 85
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/wear/widget/BoxInsetLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 86
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .line 101
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 103
    iget-object v0, p0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundPadding:Landroid/graphics/Rect;

    if-nez v0, :cond_0

    .line 104
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundPadding:Landroid/graphics/Rect;

    .line 106
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/BoxInsetLayout;->mInsets:Landroid/graphics/Rect;

    if-nez v0, :cond_1

    .line 107
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroidx/wear/widget/BoxInsetLayout;->mInsets:Landroid/graphics/Rect;

    .line 109
    :cond_1
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    iput v0, p0, Landroidx/wear/widget/BoxInsetLayout;->mScreenHeight:I

    .line 110
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v0, p0, Landroidx/wear/widget/BoxInsetLayout;->mScreenWidth:I

    .line 111
    return-void
.end method

.method private calculateChildBottomMargin(Landroidx/wear/widget/BoxInsetLayout$LayoutParams;II)I
    .locals 2
    .param p1, "lp"    # Landroidx/wear/widget/BoxInsetLayout$LayoutParams;
    .param p2, "verticalGravity"    # I
    .param p3, "desiredMinInset"    # I

    .line 374
    iget-boolean v0, p0, Landroidx/wear/widget/BoxInsetLayout;->mIsRound:Z

    if-eqz v0, :cond_1

    iget v0, p1, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->boxedEdges:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_1

    .line 375
    iget v0, p1, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->height:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/16 v0, 0x50

    if-ne p2, v0, :cond_1

    .line 376
    :cond_0
    iget v0, p1, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v0, p3

    return v0

    .line 379
    :cond_1
    iget v0, p1, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->bottomMargin:I

    return v0
.end method

.method private calculateChildLeftMargin(Landroidx/wear/widget/BoxInsetLayout$LayoutParams;II)I
    .locals 2
    .param p1, "lp"    # Landroidx/wear/widget/BoxInsetLayout$LayoutParams;
    .param p2, "horizontalGravity"    # I
    .param p3, "desiredMinInset"    # I

    .line 345
    iget-boolean v0, p0, Landroidx/wear/widget/BoxInsetLayout;->mIsRound:Z

    if-eqz v0, :cond_1

    iget v0, p1, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->boxedEdges:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    .line 346
    iget v0, p1, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->width:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x3

    if-ne p2, v0, :cond_1

    .line 347
    :cond_0
    iget v0, p1, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->leftMargin:I

    add-int/2addr v0, p3

    return v0

    .line 350
    :cond_1
    iget v0, p1, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->leftMargin:I

    return v0
.end method

.method private calculateChildRightMargin(Landroidx/wear/widget/BoxInsetLayout$LayoutParams;II)I
    .locals 2
    .param p1, "lp"    # Landroidx/wear/widget/BoxInsetLayout$LayoutParams;
    .param p2, "horizontalGravity"    # I
    .param p3, "desiredMinInset"    # I

    .line 355
    iget-boolean v0, p0, Landroidx/wear/widget/BoxInsetLayout;->mIsRound:Z

    if-eqz v0, :cond_1

    iget v0, p1, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->boxedEdges:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_1

    .line 356
    iget v0, p1, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->width:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x5

    if-ne p2, v0, :cond_1

    .line 357
    :cond_0
    iget v0, p1, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->rightMargin:I

    add-int/2addr v0, p3

    return v0

    .line 360
    :cond_1
    iget v0, p1, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->rightMargin:I

    return v0
.end method

.method private calculateChildTopMargin(Landroidx/wear/widget/BoxInsetLayout$LayoutParams;II)I
    .locals 2
    .param p1, "lp"    # Landroidx/wear/widget/BoxInsetLayout$LayoutParams;
    .param p2, "verticalGravity"    # I
    .param p3, "desiredMinInset"    # I

    .line 364
    iget-boolean v0, p0, Landroidx/wear/widget/BoxInsetLayout;->mIsRound:Z

    if-eqz v0, :cond_1

    iget v0, p1, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->boxedEdges:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_1

    .line 365
    iget v0, p1, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->height:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/16 v0, 0x30

    if-ne p2, v0, :cond_1

    .line 366
    :cond_0
    iget v0, p1, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->topMargin:I

    add-int/2addr v0, p3

    return v0

    .line 369
    :cond_1
    iget v0, p1, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->topMargin:I

    return v0
.end method

.method private calculateInset(II)I
    .locals 4
    .param p1, "measuredWidth"    # I
    .param p2, "measuredHeight"    # I

    .line 383
    iget v0, p0, Landroidx/wear/widget/BoxInsetLayout;->mScreenWidth:I

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 384
    .local v0, "rightEdge":I
    iget v1, p0, Landroidx/wear/widget/BoxInsetLayout;->mScreenHeight:I

    invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 385
    .local v1, "bottomEdge":I
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v2

    int-to-float v2, v2

    const v3, 0x3e15f634

    mul-float/2addr v2, v3

    float-to-int v2, v2

    return v2
.end method

.method private measureChild(IIII)V
    .locals 17
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I
    .param p3, "desiredMinInset"    # I
    .param p4, "i"    # I

    .line 302
    move-object/from16 v0, p0

    move/from16 v1, p3

    move/from16 v2, p4

    invoke-virtual {v0, v2}, Landroidx/wear/widget/BoxInsetLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 303
    .local v3, "child":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;

    .line 305
    .local v4, "childLayoutParams":Landroidx/wear/widget/BoxInsetLayout$LayoutParams;
    iget v5, v4, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->gravity:I

    .line 306
    .local v5, "gravity":I
    const/4 v6, -0x1

    if-ne v5, v6, :cond_0

    .line 307
    const v5, 0x800033

    .line 309
    :cond_0
    and-int/lit8 v6, v5, 0x70

    .line 310
    .local v6, "verticalGravity":I
    and-int/lit8 v7, v5, 0x7

    .line 315
    .local v7, "horizontalGravity":I
    invoke-virtual {v0}, Landroidx/wear/widget/BoxInsetLayout;->getPaddingLeft()I

    move-result v8

    iget-object v9, v0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundPadding:Landroid/graphics/Rect;

    iget v9, v9, Landroid/graphics/Rect;->left:I

    add-int/2addr v8, v9

    .line 316
    .local v8, "leftParentPadding":I
    invoke-virtual {v0}, Landroidx/wear/widget/BoxInsetLayout;->getPaddingRight()I

    move-result v9

    iget-object v10, v0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundPadding:Landroid/graphics/Rect;

    iget v10, v10, Landroid/graphics/Rect;->right:I

    add-int/2addr v9, v10

    .line 317
    .local v9, "rightParentPadding":I
    invoke-virtual {v0}, Landroidx/wear/widget/BoxInsetLayout;->getPaddingTop()I

    move-result v10

    iget-object v11, v0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundPadding:Landroid/graphics/Rect;

    iget v11, v11, Landroid/graphics/Rect;->top:I

    add-int/2addr v10, v11

    .line 318
    .local v10, "topParentPadding":I
    invoke-virtual {v0}, Landroidx/wear/widget/BoxInsetLayout;->getPaddingBottom()I

    move-result v11

    iget-object v12, v0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundPadding:Landroid/graphics/Rect;

    iget v12, v12, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v11, v12

    .line 321
    .local v11, "bottomParentPadding":I
    add-int v12, v8, v9

    invoke-direct {v0, v4, v7, v1}, Landroidx/wear/widget/BoxInsetLayout;->calculateChildLeftMargin(Landroidx/wear/widget/BoxInsetLayout$LayoutParams;II)I

    move-result v13

    add-int/2addr v12, v13

    .line 322
    invoke-direct {v0, v4, v7, v1}, Landroidx/wear/widget/BoxInsetLayout;->calculateChildRightMargin(Landroidx/wear/widget/BoxInsetLayout$LayoutParams;II)I

    move-result v13

    add-int/2addr v12, v13

    .line 326
    .local v12, "totalWidthMargin":I
    add-int v13, v10, v11

    invoke-direct {v0, v4, v6, v1}, Landroidx/wear/widget/BoxInsetLayout;->calculateChildTopMargin(Landroidx/wear/widget/BoxInsetLayout$LayoutParams;II)I

    move-result v14

    add-int/2addr v13, v14

    .line 327
    invoke-direct {v0, v4, v6, v1}, Landroidx/wear/widget/BoxInsetLayout;->calculateChildBottomMargin(Landroidx/wear/widget/BoxInsetLayout$LayoutParams;II)I

    move-result v14

    add-int/2addr v13, v14

    .line 330
    .local v13, "totalHeightMargin":I
    iget v14, v4, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->width:I

    move/from16 v15, p1

    invoke-static {v15, v12, v14}, Landroidx/wear/widget/BoxInsetLayout;->getChildMeasureSpec(III)I

    move-result v14

    .line 332
    .local v14, "childWidthMeasureSpec":I
    iget v0, v4, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->height:I

    move/from16 v1, p2

    invoke-static {v1, v13, v0}, Landroidx/wear/widget/BoxInsetLayout;->getChildMeasureSpec(III)I

    move-result v0

    .line 335
    .local v0, "childHeightMeasureSpec":I
    invoke-virtual/range {p0 .. p0}, Landroidx/wear/widget/BoxInsetLayout;->getMeasuredWidth()I

    move-result v16

    sub-int v1, v16, v12

    .line 336
    .local v1, "maxAllowedWidth":I
    invoke-virtual/range {p0 .. p0}, Landroidx/wear/widget/BoxInsetLayout;->getMeasuredHeight()I

    move-result v16

    sub-int v2, v16, v13

    .line 337
    .local v2, "maxAllowedHeight":I
    move-object/from16 v16, v4

    .end local v4    # "childLayoutParams":Landroidx/wear/widget/BoxInsetLayout$LayoutParams;
    .local v16, "childLayoutParams":Landroidx/wear/widget/BoxInsetLayout$LayoutParams;
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    if-gt v4, v1, :cond_1

    .line 338
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    if-le v4, v2, :cond_2

    .line 339
    :cond_1
    invoke-virtual {v3, v14, v0}, Landroid/view/View;->measure(II)V

    .line 341
    :cond_2
    return-void
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .line 292
    instance-of v0, p1, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;

    return v0
.end method

.method public bridge synthetic generateLayoutParams(Landroid/util/AttributeSet;)Landroid/view/ViewGroup$LayoutParams;
    .locals 0

    .line 47
    invoke-virtual {p0, p1}, Landroidx/wear/widget/BoxInsetLayout;->generateLayoutParams(Landroid/util/AttributeSet;)Landroidx/wear/widget/BoxInsetLayout$LayoutParams;

    move-result-object p1

    return-object p1
.end method

.method protected generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/view/ViewGroup$LayoutParams;
    .locals 1
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .line 297
    new-instance v0, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;

    invoke-direct {v0, p1}, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public generateLayoutParams(Landroid/util/AttributeSet;)Landroidx/wear/widget/BoxInsetLayout$LayoutParams;
    .locals 2
    .param p1, "attrs"    # Landroid/util/AttributeSet;

    .line 127
    new-instance v0, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;

    invoke-virtual {p0}, Landroidx/wear/widget/BoxInsetLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method protected onAttachedToWindow()V
    .locals 6

    .line 133
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 134
    invoke-virtual {p0}, Landroidx/wear/widget/BoxInsetLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Configuration;->isScreenRound()Z

    move-result v0

    iput-boolean v0, p0, Landroidx/wear/widget/BoxInsetLayout;->mIsRound:Z

    .line 135
    invoke-virtual {p0}, Landroidx/wear/widget/BoxInsetLayout;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object v0

    .line 136
    .local v0, "insets":Landroid/view/WindowInsets;
    iget-object v1, p0, Landroidx/wear/widget/BoxInsetLayout;->mInsets:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetLeft()I

    move-result v2

    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetTop()I

    move-result v3

    .line 137
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetRight()I

    move-result v4

    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    move-result v5

    .line 136
    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/graphics/Rect;->set(IIII)V

    .line 138
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 24
    .param p1, "changed"    # Z
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I

    .line 214
    move-object/from16 v0, p0

    invoke-virtual {v0}, Landroidx/wear/widget/BoxInsetLayout;->getChildCount()I

    move-result v1

    .line 216
    .local v1, "count":I
    invoke-virtual {v0}, Landroidx/wear/widget/BoxInsetLayout;->getPaddingLeft()I

    move-result v2

    iget-object v3, v0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundPadding:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    add-int/2addr v2, v3

    .line 217
    .local v2, "parentLeft":I
    sub-int v3, p4, p2

    invoke-virtual {v0}, Landroidx/wear/widget/BoxInsetLayout;->getPaddingRight()I

    move-result v4

    sub-int/2addr v3, v4

    iget-object v4, v0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundPadding:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    sub-int/2addr v3, v4

    .line 219
    .local v3, "parentRight":I
    invoke-virtual {v0}, Landroidx/wear/widget/BoxInsetLayout;->getPaddingTop()I

    move-result v4

    iget-object v5, v0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundPadding:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    add-int/2addr v4, v5

    .line 220
    .local v4, "parentTop":I
    sub-int v5, p5, p3

    invoke-virtual {v0}, Landroidx/wear/widget/BoxInsetLayout;->getPaddingBottom()I

    move-result v6

    sub-int/2addr v5, v6

    iget-object v6, v0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundPadding:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v5, v6

    .line 222
    .local v5, "parentBottom":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    if-ge v6, v1, :cond_4

    .line 223
    invoke-virtual {v0, v6}, Landroidx/wear/widget/BoxInsetLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    .line 224
    .local v7, "child":Landroid/view/View;
    invoke-virtual {v7}, Landroid/view/View;->getVisibility()I

    move-result v8

    const/16 v9, 0x8

    if-eq v8, v9, :cond_3

    .line 225
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;

    .line 227
    .local v8, "lp":Landroidx/wear/widget/BoxInsetLayout$LayoutParams;
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    move-result v9

    .line 228
    .local v9, "width":I
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    move-result v10

    .line 233
    .local v10, "height":I
    iget v11, v8, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->gravity:I

    .line 234
    .local v11, "gravity":I
    const/4 v12, -0x1

    if-ne v11, v12, :cond_0

    .line 235
    const v11, 0x800033

    .line 238
    :cond_0
    invoke-virtual {v0}, Landroidx/wear/widget/BoxInsetLayout;->getLayoutDirection()I

    move-result v13

    .line 239
    .local v13, "layoutDirection":I
    invoke-static {v11, v13}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result v14

    .line 240
    .local v14, "absoluteGravity":I
    and-int/lit8 v15, v11, 0x70

    .line 241
    .local v15, "verticalGravity":I
    and-int/lit8 v12, v11, 0x7

    .line 242
    .local v12, "horizontalGravity":I
    move/from16 v17, v1

    .end local v1    # "count":I
    .local v17, "count":I
    invoke-virtual {v0}, Landroidx/wear/widget/BoxInsetLayout;->getMeasuredWidth()I

    move-result v1

    move/from16 v18, v2

    .end local v2    # "parentLeft":I
    .local v18, "parentLeft":I
    invoke-virtual {v0}, Landroidx/wear/widget/BoxInsetLayout;->getMeasuredHeight()I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroidx/wear/widget/BoxInsetLayout;->calculateInset(II)I

    move-result v1

    .line 245
    .local v1, "desiredInset":I
    invoke-direct {v0, v8, v12, v1}, Landroidx/wear/widget/BoxInsetLayout;->calculateChildLeftMargin(Landroidx/wear/widget/BoxInsetLayout$LayoutParams;II)I

    move-result v2

    .line 246
    .local v2, "leftChildMargin":I
    invoke-direct {v0, v8, v12, v1}, Landroidx/wear/widget/BoxInsetLayout;->calculateChildRightMargin(Landroidx/wear/widget/BoxInsetLayout$LayoutParams;II)I

    move-result v19

    .line 248
    .local v19, "rightChildMargin":I
    move/from16 v20, v2

    .end local v2    # "leftChildMargin":I
    .local v20, "leftChildMargin":I
    iget v2, v8, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->width:I

    move/from16 v21, v3

    const/4 v3, -0x1

    .end local v3    # "parentRight":I
    .local v21, "parentRight":I
    if-ne v2, v3, :cond_1

    .line 249
    add-int v2, v18, v20

    .local v2, "childLeft":I
    goto :goto_1

    .line 251
    .end local v2    # "childLeft":I
    :cond_1
    and-int/lit8 v2, v14, 0x7

    sparse-switch v2, :sswitch_data_0

    .line 261
    add-int v2, v18, v20

    .restart local v2    # "childLeft":I
    goto :goto_1

    .line 257
    .end local v2    # "childLeft":I
    :sswitch_0
    sub-int v3, v21, v9

    sub-int v2, v3, v19

    .line 258
    .restart local v2    # "childLeft":I
    goto :goto_1

    .line 253
    .end local v2    # "childLeft":I
    :sswitch_1
    sub-int v3, v21, v18

    sub-int/2addr v3, v9

    div-int/lit8 v3, v3, 0x2

    add-int v2, v18, v3

    add-int v2, v2, v20

    sub-int v2, v2, v19

    .line 255
    .restart local v2    # "childLeft":I
    nop

    .line 266
    :goto_1
    invoke-direct {v0, v8, v15, v1}, Landroidx/wear/widget/BoxInsetLayout;->calculateChildTopMargin(Landroidx/wear/widget/BoxInsetLayout$LayoutParams;II)I

    move-result v3

    .line 267
    .local v3, "topChildMargin":I
    invoke-direct {v0, v8, v15, v1}, Landroidx/wear/widget/BoxInsetLayout;->calculateChildBottomMargin(Landroidx/wear/widget/BoxInsetLayout$LayoutParams;II)I

    move-result v22

    .line 269
    .local v22, "bottomChildMargin":I
    iget v0, v8, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->height:I

    move/from16 v23, v1

    const/4 v1, -0x1

    .end local v1    # "desiredInset":I
    .local v23, "desiredInset":I
    if-ne v0, v1, :cond_2

    .line 270
    add-int v0, v4, v3

    .local v0, "childTop":I
    goto :goto_2

    .line 272
    .end local v0    # "childTop":I
    :cond_2
    sparse-switch v15, :sswitch_data_1

    .line 282
    add-int v0, v4, v3

    .restart local v0    # "childTop":I
    goto :goto_2

    .line 278
    .end local v0    # "childTop":I
    :sswitch_2
    sub-int v0, v5, v10

    sub-int v0, v0, v22

    .line 279
    .restart local v0    # "childTop":I
    goto :goto_2

    .line 274
    .end local v0    # "childTop":I
    :sswitch_3
    sub-int v0, v5, v4

    sub-int/2addr v0, v10

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v0, v4

    add-int/2addr v0, v3

    sub-int v0, v0, v22

    .line 276
    .restart local v0    # "childTop":I
    nop

    .line 285
    :goto_2
    add-int v1, v2, v9

    move/from16 v16, v3

    .end local v3    # "topChildMargin":I
    .local v16, "topChildMargin":I
    add-int v3, v0, v10

    invoke-virtual {v7, v2, v0, v1, v3}, Landroid/view/View;->layout(IIII)V

    goto :goto_3

    .line 224
    .end local v0    # "childTop":I
    .end local v8    # "lp":Landroidx/wear/widget/BoxInsetLayout$LayoutParams;
    .end local v9    # "width":I
    .end local v10    # "height":I
    .end local v11    # "gravity":I
    .end local v12    # "horizontalGravity":I
    .end local v13    # "layoutDirection":I
    .end local v14    # "absoluteGravity":I
    .end local v15    # "verticalGravity":I
    .end local v16    # "topChildMargin":I
    .end local v17    # "count":I
    .end local v18    # "parentLeft":I
    .end local v19    # "rightChildMargin":I
    .end local v20    # "leftChildMargin":I
    .end local v21    # "parentRight":I
    .end local v22    # "bottomChildMargin":I
    .end local v23    # "desiredInset":I
    .local v1, "count":I
    .local v2, "parentLeft":I
    .local v3, "parentRight":I
    :cond_3
    move/from16 v17, v1

    move/from16 v18, v2

    move/from16 v21, v3

    .line 222
    .end local v1    # "count":I
    .end local v2    # "parentLeft":I
    .end local v3    # "parentRight":I
    .end local v7    # "child":Landroid/view/View;
    .restart local v17    # "count":I
    .restart local v18    # "parentLeft":I
    .restart local v21    # "parentRight":I
    :goto_3
    add-int/lit8 v6, v6, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    move/from16 v2, v18

    move/from16 v3, v21

    goto/16 :goto_0

    .line 288
    .end local v6    # "i":I
    .end local v17    # "count":I
    .end local v18    # "parentLeft":I
    .end local v21    # "parentRight":I
    .restart local v1    # "count":I
    .restart local v2    # "parentLeft":I
    .restart local v3    # "parentRight":I
    :cond_4
    return-void

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_1
        0x5 -> :sswitch_0
    .end sparse-switch

    :sswitch_data_1
    .sparse-switch
        0x10 -> :sswitch_3
        0x50 -> :sswitch_2
    .end sparse-switch
.end method

.method protected onMeasure(II)V
    .locals 16
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .line 142
    move-object/from16 v0, p0

    invoke-virtual {v0}, Landroidx/wear/widget/BoxInsetLayout;->getChildCount()I

    move-result v6

    .line 144
    .local v6, "count":I
    const/4 v1, 0x0

    .line 145
    .local v1, "maxWidth":I
    const/4 v2, 0x0

    .line 146
    .local v2, "maxHeight":I
    const/4 v3, 0x0

    .line 147
    .local v3, "childState":I
    const/4 v4, 0x0

    move v7, v1

    move v8, v2

    move v9, v3

    move v10, v4

    .end local v1    # "maxWidth":I
    .end local v2    # "maxHeight":I
    .end local v3    # "childState":I
    .local v7, "maxWidth":I
    .local v8, "maxHeight":I
    .local v9, "childState":I
    .local v10, "i":I
    :goto_0
    if-ge v10, v6, :cond_6

    .line 148
    invoke-virtual {v0, v10}, Landroidx/wear/widget/BoxInsetLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 149
    .local v1, "child":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_5

    .line 150
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;

    .line 151
    .local v11, "lp":Landroidx/wear/widget/BoxInsetLayout$LayoutParams;
    const/4 v2, 0x0

    .line 152
    .local v2, "marginLeft":I
    const/4 v4, 0x0

    .line 153
    .local v4, "marginRight":I
    const/4 v5, 0x0

    .line 154
    .local v5, "marginTop":I
    const/4 v12, 0x0

    .line 155
    .local v12, "marginBottom":I
    iget-boolean v13, v0, Landroidx/wear/widget/BoxInsetLayout;->mIsRound:Z

    if-eqz v13, :cond_4

    .line 157
    iget v13, v11, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->boxedEdges:I

    and-int/lit8 v13, v13, 0x1

    if-nez v13, :cond_0

    .line 158
    iget v2, v11, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->leftMargin:I

    .line 160
    :cond_0
    iget v13, v11, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->boxedEdges:I

    and-int/lit8 v13, v13, 0x4

    if-nez v13, :cond_1

    .line 161
    iget v4, v11, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->rightMargin:I

    .line 163
    :cond_1
    iget v13, v11, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->boxedEdges:I

    and-int/lit8 v13, v13, 0x2

    if-nez v13, :cond_2

    .line 164
    iget v5, v11, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->topMargin:I

    .line 166
    :cond_2
    iget v13, v11, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->boxedEdges:I

    and-int/2addr v3, v13

    if-nez v3, :cond_3

    .line 167
    iget v12, v11, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->bottomMargin:I

    move v13, v4

    move v14, v5

    move v15, v12

    move v12, v2

    goto :goto_1

    .line 166
    :cond_3
    move v13, v4

    move v14, v5

    move v15, v12

    move v12, v2

    goto :goto_1

    .line 171
    :cond_4
    iget v2, v11, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->leftMargin:I

    .line 172
    iget v5, v11, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->topMargin:I

    .line 173
    iget v4, v11, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->rightMargin:I

    .line 174
    iget v12, v11, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->bottomMargin:I

    move v13, v4

    move v14, v5

    move v15, v12

    move v12, v2

    .line 176
    .end local v2    # "marginLeft":I
    .end local v4    # "marginRight":I
    .end local v5    # "marginTop":I
    .local v12, "marginLeft":I
    .local v13, "marginRight":I
    .local v14, "marginTop":I
    .local v15, "marginBottom":I
    :goto_1
    const/4 v3, 0x0

    const/4 v5, 0x0

    move/from16 v2, p1

    move/from16 v4, p2

    invoke-virtual/range {v0 .. v5}, Landroidx/wear/widget/BoxInsetLayout;->measureChildWithMargins(Landroid/view/View;IIII)V

    .line 177
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    add-int/2addr v3, v12

    add-int/2addr v3, v13

    invoke-static {v7, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 178
    .end local v7    # "maxWidth":I
    .local v3, "maxWidth":I
    nop

    .line 179
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    add-int/2addr v5, v14

    add-int/2addr v5, v15

    .line 178
    invoke-static {v8, v5}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 180
    .end local v8    # "maxHeight":I
    .local v5, "maxHeight":I
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredState()I

    move-result v7

    invoke-static {v9, v7}, Landroidx/wear/widget/BoxInsetLayout;->combineMeasuredStates(II)I

    move-result v7

    move v8, v5

    move v9, v7

    move v7, v3

    .end local v9    # "childState":I
    .local v7, "childState":I
    goto :goto_2

    .line 149
    .end local v3    # "maxWidth":I
    .end local v5    # "maxHeight":I
    .end local v11    # "lp":Landroidx/wear/widget/BoxInsetLayout$LayoutParams;
    .end local v12    # "marginLeft":I
    .end local v13    # "marginRight":I
    .end local v14    # "marginTop":I
    .end local v15    # "marginBottom":I
    .local v7, "maxWidth":I
    .restart local v8    # "maxHeight":I
    .restart local v9    # "childState":I
    :cond_5
    move/from16 v2, p1

    move/from16 v4, p2

    .line 147
    .end local v1    # "child":Landroid/view/View;
    :goto_2
    add-int/lit8 v10, v10, 0x1

    goto/16 :goto_0

    :cond_6
    move/from16 v2, p1

    move/from16 v4, p2

    .line 184
    .end local v10    # "i":I
    invoke-virtual {v0}, Landroidx/wear/widget/BoxInsetLayout;->getPaddingLeft()I

    move-result v1

    iget-object v3, v0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundPadding:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    add-int/2addr v1, v3

    invoke-virtual {v0}, Landroidx/wear/widget/BoxInsetLayout;->getPaddingRight()I

    move-result v3

    add-int/2addr v1, v3

    iget-object v3, v0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundPadding:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->right:I

    add-int/2addr v1, v3

    add-int/2addr v7, v1

    .line 186
    invoke-virtual {v0}, Landroidx/wear/widget/BoxInsetLayout;->getPaddingTop()I

    move-result v1

    iget-object v3, v0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundPadding:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    add-int/2addr v1, v3

    invoke-virtual {v0}, Landroidx/wear/widget/BoxInsetLayout;->getPaddingBottom()I

    move-result v3

    add-int/2addr v1, v3

    iget-object v3, v0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundPadding:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v1, v3

    add-int/2addr v8, v1

    .line 190
    invoke-virtual {v0}, Landroidx/wear/widget/BoxInsetLayout;->getSuggestedMinimumHeight()I

    move-result v1

    invoke-static {v8, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 191
    .end local v8    # "maxHeight":I
    .local v1, "maxHeight":I
    invoke-virtual {v0}, Landroidx/wear/widget/BoxInsetLayout;->getSuggestedMinimumWidth()I

    move-result v3

    invoke-static {v7, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 194
    .end local v7    # "maxWidth":I
    .restart local v3    # "maxWidth":I
    iget-object v5, v0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v5, :cond_7

    .line 195
    iget-object v5, v0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    move-result v5

    invoke-static {v1, v5}, Ljava/lang/Math;->max(II)I

    move-result v1

    .line 196
    iget-object v5, v0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    move-result v5

    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 199
    :cond_7
    invoke-static {v3, v2, v9}, Landroidx/wear/widget/BoxInsetLayout;->resolveSizeAndState(III)I

    move-result v5

    .line 200
    .local v5, "measuredWidth":I
    shl-int/lit8 v7, v9, 0x10

    invoke-static {v1, v4, v7}, Landroidx/wear/widget/BoxInsetLayout;->resolveSizeAndState(III)I

    move-result v7

    .line 202
    .local v7, "measuredHeight":I
    invoke-virtual {v0, v5, v7}, Landroidx/wear/widget/BoxInsetLayout;->setMeasuredDimension(II)V

    .line 205
    invoke-direct {v0, v5, v7}, Landroidx/wear/widget/BoxInsetLayout;->calculateInset(II)I

    move-result v8

    .line 207
    .local v8, "boxInset":I
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_3
    if-ge v10, v6, :cond_8

    .line 208
    invoke-direct {v0, v2, v4, v8, v10}, Landroidx/wear/widget/BoxInsetLayout;->measureChild(IIII)V

    .line 207
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    .line 210
    .end local v10    # "i":I
    :cond_8
    return-void
.end method

.method public setForeground(Landroid/graphics/drawable/Drawable;)V
    .locals 1
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .line 115
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 116
    iput-object p1, p0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 117
    iget-object v0, p0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundPadding:Landroid/graphics/Rect;

    if-nez v0, :cond_0

    .line 118
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundPadding:Landroid/graphics/Rect;

    .line 120
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1

    .line 121
    iget-object v0, p0, Landroidx/wear/widget/BoxInsetLayout;->mForegroundPadding:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 123
    :cond_1
    return-void
.end method
