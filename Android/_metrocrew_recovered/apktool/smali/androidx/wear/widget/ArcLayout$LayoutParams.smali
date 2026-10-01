.class public Landroidx/wear/widget/ArcLayout$LayoutParams;
.super Landroid/view/ViewGroup$MarginLayoutParams;
.source "ArcLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/ArcLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/widget/ArcLayout$LayoutParams$VerticalAlignment;
    }
.end annotation


# static fields
.field public static final VERTICAL_ALIGN_CENTER:I = 0x1

.field public static final VERTICAL_ALIGN_INNER:I = 0x2

.field public static final VERTICAL_ALIGN_OUTER:I


# instance fields
.field mCenterX:F

.field mCenterY:F

.field mMiddleAngle:F

.field private mRotated:Z

.field private mVerticalAlignment:I

.field mWeight:F


# direct methods
.method public constructor <init>(II)V
    .locals 1
    .param p1, "width"    # I
    .param p2, "height"    # I

    .line 193
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 149
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/wear/widget/ArcLayout$LayoutParams;->mRotated:Z

    .line 150
    iput v0, p0, Landroidx/wear/widget/ArcLayout$LayoutParams;->mVerticalAlignment:I

    .line 194
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 174
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 149
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/wear/widget/ArcLayout$LayoutParams;->mRotated:Z

    .line 150
    iput v0, p0, Landroidx/wear/widget/ArcLayout$LayoutParams;->mVerticalAlignment:I

    .line 176
    sget-object v1, Landroidx/wear/R$styleable;->ArcLayout_Layout:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 178
    .local v1, "a":Landroid/content/res/TypedArray;
    sget v2, Landroidx/wear/R$styleable;->ArcLayout_Layout_layout_rotate:I

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Landroidx/wear/widget/ArcLayout$LayoutParams;->mRotated:Z

    .line 179
    sget v2, Landroidx/wear/R$styleable;->ArcLayout_Layout_layout_valign:I

    .line 180
    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Landroidx/wear/widget/ArcLayout$LayoutParams;->mVerticalAlignment:I

    .line 181
    sget v0, Landroidx/wear/R$styleable;->ArcLayout_Layout_layout_weight:I

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    iput v0, p0, Landroidx/wear/widget/ArcLayout$LayoutParams;->mWeight:F

    .line 183
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 184
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup$LayoutParams;)V
    .locals 1
    .param p1, "source"    # Landroid/view/ViewGroup$LayoutParams;

    .line 198
    invoke-direct {p0, p1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    .line 149
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/wear/widget/ArcLayout$LayoutParams;->mRotated:Z

    .line 150
    iput v0, p0, Landroidx/wear/widget/ArcLayout$LayoutParams;->mVerticalAlignment:I

    .line 199
    return-void
.end method


# virtual methods
.method public getVerticalAlignment()I
    .locals 1

    .line 222
    iget v0, p0, Landroidx/wear/widget/ArcLayout$LayoutParams;->mVerticalAlignment:I

    return v0
.end method

.method public getWeight()F
    .locals 1

    .line 236
    iget v0, p0, Landroidx/wear/widget/ArcLayout$LayoutParams;->mWeight:F

    return v0
.end method

.method public isRotated()Z
    .locals 1

    .line 206
    iget-boolean v0, p0, Landroidx/wear/widget/ArcLayout$LayoutParams;->mRotated:Z

    return v0
.end method

.method public setRotated(Z)V
    .locals 0
    .param p1, "rotated"    # Z

    .line 214
    iput-boolean p1, p0, Landroidx/wear/widget/ArcLayout$LayoutParams;->mRotated:Z

    .line 215
    return-void
.end method

.method public setVerticalAlignment(I)V
    .locals 0
    .param p1, "verticalAlignment"    # I

    .line 231
    iput p1, p0, Landroidx/wear/widget/ArcLayout$LayoutParams;->mVerticalAlignment:I

    .line 232
    return-void
.end method

.method public setWeight(F)V
    .locals 0
    .param p1, "weight"    # F

    .line 251
    iput p1, p0, Landroidx/wear/widget/ArcLayout$LayoutParams;->mWeight:F

    .line 252
    return-void
.end method
