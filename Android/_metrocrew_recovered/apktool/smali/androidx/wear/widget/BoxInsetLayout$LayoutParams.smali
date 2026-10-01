.class public Landroidx/wear/widget/BoxInsetLayout$LayoutParams;
.super Landroid/widget/FrameLayout$LayoutParams;
.source "BoxInsetLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/BoxInsetLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/widget/BoxInsetLayout$LayoutParams$BoxedEdges;
    }
.end annotation


# static fields
.field public static final BOX_ALL:I = 0xf

.field public static final BOX_BOTTOM:I = 0x8

.field public static final BOX_LEFT:I = 0x1

.field public static final BOX_NONE:I = 0x0

.field public static final BOX_RIGHT:I = 0x4

.field public static final BOX_TOP:I = 0x2


# instance fields
.field public boxedEdges:I


# direct methods
.method public constructor <init>(II)V
    .locals 1
    .param p1, "width"    # I
    .param p2, "height"    # I

    .line 448
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 416
    const/4 v0, 0x0

    iput v0, p0, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->boxedEdges:I

    .line 449
    return-void
.end method

.method public constructor <init>(III)V
    .locals 1
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "gravity"    # I

    .line 464
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 416
    const/4 v0, 0x0

    iput v0, p0, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->boxedEdges:I

    .line 465
    return-void
.end method

.method public constructor <init>(IIII)V
    .locals 1
    .param p1, "width"    # I
    .param p2, "height"    # I
    .param p3, "gravity"    # I
    .param p4, "boxed"    # I

    .line 469
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    .line 416
    const/4 v0, 0x0

    iput v0, p0, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->boxedEdges:I

    .line 470
    iput p4, p0, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->boxedEdges:I

    .line 471
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 428
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 416
    const/4 v0, 0x0

    iput v0, p0, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->boxedEdges:I

    .line 429
    sget-object v1, Landroidx/wear/R$styleable;->BoxInsetLayout_Layout:[I

    invoke-virtual {p1, p2, v1, v0, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 431
    .local v1, "a":Landroid/content/res/TypedArray;
    sget v2, Landroidx/wear/R$styleable;->BoxInsetLayout_Layout_layout_boxedEdges:I

    .line 432
    .local v2, "boxedEdgesResourceKey":I
    sget v3, Landroidx/wear/R$styleable;->BoxInsetLayout_Layout_layout_boxedEdges:I

    invoke-virtual {v1, v3}, Landroid/content/res/TypedArray;->hasValueOrEmpty(I)Z

    move-result v3

    if-nez v3, :cond_0

    .line 433
    sget v2, Landroidx/wear/R$styleable;->BoxInsetLayout_Layout_boxedEdges:I

    .line 435
    :cond_0
    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->boxedEdges:I

    .line 436
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 437
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .locals 1
    .param p1, "source"    # Landroid/view/ViewGroup$LayoutParams;

    .line 479
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 416
    const/4 v0, 0x0

    iput v0, p0, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->boxedEdges:I

    .line 480
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$MarginLayoutParams;)V
    .locals 1
    .param p1, "source"    # Landroid/view/ViewGroup$MarginLayoutParams;

    .line 488
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    .line 416
    const/4 v0, 0x0

    iput v0, p0, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->boxedEdges:I

    .line 489
    return-void
.end method

.method public constructor <init>(Landroid/widget/FrameLayout$LayoutParams;)V
    .locals 1
    .param p1, "source"    # Landroid/widget/FrameLayout$LayoutParams;

    .line 498
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 416
    const/4 v0, 0x0

    iput v0, p0, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->boxedEdges:I

    .line 499
    return-void
.end method

.method public constructor <init>(Landroidx/wear/widget/BoxInsetLayout$LayoutParams;)V
    .locals 1
    .param p1, "source"    # Landroidx/wear/widget/BoxInsetLayout$LayoutParams;

    .line 508
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(Landroid/widget/FrameLayout$LayoutParams;)V

    .line 416
    const/4 v0, 0x0

    iput v0, p0, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->boxedEdges:I

    .line 509
    iget v0, p1, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->boxedEdges:I

    iput v0, p0, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->boxedEdges:I

    .line 510
    iget v0, p1, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->gravity:I

    iput v0, p0, Landroidx/wear/widget/BoxInsetLayout$LayoutParams;->gravity:I

    .line 511
    return-void
.end method
