.class public Landroidx/wear/widget/CurvedTextView;
.super Landroid/view/View;
.source "CurvedTextView.java"

# interfaces
.implements Landroidx/wear/widget/ArcLayout$Widget;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;,
        Landroidx/wear/widget/CurvedTextView$Api28Impl;,
        Landroidx/wear/widget/CurvedTextView$Api26Impl;
    }
.end annotation


# static fields
.field private static final ANCHOR_DEGREE_OFFSET:F = -90.0f

.field private static final DEFAULT_CLOCKWISE:Z = true

.field private static final DEFAULT_TEXT_COLOR:I = -0x1

.field private static final DEFAULT_TEXT_SIZE:F = 24.0f

.field private static final DEFAULT_TEXT_STYLE:I = 0x0

.field private static final FONT_WEIGHT_MAX:I = 0x3e8

.field private static final ITALIC_SKEW_X:F = -0.25f

.field private static final MAX_SWEEP_DEGREE:F = 359.9f

.field private static final MIN_SWEEP_DEGREE:F = 0.0f

.field private static final UNSET_ANCHOR_DEGREE:F = -1.0f

.field private static final UNSET_ANCHOR_TYPE:I = -0x1


# instance fields
.field private mAnchorAngleDegrees:F

.field private mAnchorType:I

.field private mBackgroundSweepDegrees:F

.field private final mBgBounds:Landroid/graphics/Rect;

.field private final mBgPath:Landroid/graphics/Path;

.field private final mBounds:Landroid/graphics/Rect;

.field private mClockwise:Z

.field private mDirty:Z

.field private mEllipsize:Landroid/text/TextUtils$TruncateAt;

.field private mFontFeatureSettings:Ljava/lang/String;

.field private mFontVariationSettings:Ljava/lang/String;

.field private mHandlingTouch:Z

.field private mLastUsedTextAlignment:I

.field private mLetterSpacing:F

.field private mLocalRotateAngle:F

.field private mMaxSweepDegrees:F

.field private mMinSweepDegrees:F

.field private final mPaint:Landroid/text/TextPaint;

.field private final mPath:Landroid/graphics/Path;

.field private mPathRadius:F

.field private mText:Ljava/lang/String;

.field private mTextColor:I

.field private mTextSize:F

.field private mTextSweepDegrees:F

.field private mTextToDraw:Ljava/lang/String;

.field private mTypeface:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 112
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/wear/widget/CurvedTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 113
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 116
    const v0, 0x1010084

    invoke-direct {p0, p1, p2, v0}, Landroidx/wear/widget/CurvedTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 117
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .line 123
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroidx/wear/widget/CurvedTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 124
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 16
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I
    .param p4, "defStyleRes"    # I

    .line 131
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move/from16 v2, p3

    move/from16 v3, p4

    invoke-direct/range {p0 .. p4}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 74
    new-instance v4, Landroid/graphics/Path;

    invoke-direct {v4}, Landroid/graphics/Path;-><init>()V

    iput-object v4, v0, Landroidx/wear/widget/CurvedTextView;->mPath:Landroid/graphics/Path;

    .line 75
    new-instance v4, Landroid/graphics/Path;

    invoke-direct {v4}, Landroid/graphics/Path;-><init>()V

    iput-object v4, v0, Landroidx/wear/widget/CurvedTextView;->mBgPath:Landroid/graphics/Path;

    .line 76
    new-instance v4, Landroid/text/TextPaint;

    invoke-direct {v4}, Landroid/text/TextPaint;-><init>()V

    iput-object v4, v0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    .line 77
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    iput-object v4, v0, Landroidx/wear/widget/CurvedTextView;->mBounds:Landroid/graphics/Rect;

    .line 78
    new-instance v4, Landroid/graphics/Rect;

    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    iput-object v4, v0, Landroidx/wear/widget/CurvedTextView;->mBgBounds:Landroid/graphics/Rect;

    .line 79
    const/4 v4, 0x1

    iput-boolean v4, v0, Landroidx/wear/widget/CurvedTextView;->mDirty:Z

    .line 80
    const-string v5, ""

    iput-object v5, v0, Landroidx/wear/widget/CurvedTextView;->mTextToDraw:Ljava/lang/String;

    .line 81
    const/4 v6, 0x0

    iput v6, v0, Landroidx/wear/widget/CurvedTextView;->mPathRadius:F

    .line 82
    iput v6, v0, Landroidx/wear/widget/CurvedTextView;->mTextSweepDegrees:F

    .line 83
    const v7, 0x43b3f333    # 359.9f

    iput v7, v0, Landroidx/wear/widget/CurvedTextView;->mBackgroundSweepDegrees:F

    .line 84
    const/4 v8, -0x1

    iput v8, v0, Landroidx/wear/widget/CurvedTextView;->mLastUsedTextAlignment:I

    .line 85
    iput v6, v0, Landroidx/wear/widget/CurvedTextView;->mLocalRotateAngle:F

    .line 92
    iput-object v5, v0, Landroidx/wear/widget/CurvedTextView;->mText:Ljava/lang/String;

    .line 93
    const/high16 v5, 0x41c00000    # 24.0f

    iput v5, v0, Landroidx/wear/widget/CurvedTextView;->mTextSize:F

    .line 94
    const/4 v5, 0x0

    iput-object v5, v0, Landroidx/wear/widget/CurvedTextView;->mTypeface:Landroid/graphics/Typeface;

    .line 96
    iput-boolean v4, v0, Landroidx/wear/widget/CurvedTextView;->mClockwise:Z

    .line 97
    iput v8, v0, Landroidx/wear/widget/CurvedTextView;->mTextColor:I

    .line 99
    iput-object v5, v0, Landroidx/wear/widget/CurvedTextView;->mEllipsize:Landroid/text/TextUtils$TruncateAt;

    .line 101
    iput v6, v0, Landroidx/wear/widget/CurvedTextView;->mLetterSpacing:F

    .line 102
    iput-object v5, v0, Landroidx/wear/widget/CurvedTextView;->mFontFeatureSettings:Ljava/lang/String;

    .line 104
    iput-object v5, v0, Landroidx/wear/widget/CurvedTextView;->mFontVariationSettings:Ljava/lang/String;

    .line 108
    const/4 v9, 0x0

    iput-boolean v9, v0, Landroidx/wear/widget/CurvedTextView;->mHandlingTouch:Z

    .line 133
    iget-object v10, v0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v10, v4}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    .line 135
    new-instance v10, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;

    invoke-direct {v10}, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;-><init>()V

    .line 136
    .local v10, "attributes":Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;
    invoke-static {v8}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v11

    iput-object v11, v10, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mTextColor:Landroid/content/res/ColorStateList;

    .line 138
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v11

    .line 139
    .local v11, "theme":Landroid/content/res/Resources$Theme;
    sget-object v12, Landroidx/wear/R$styleable;->TextViewAppearance:[I

    invoke-virtual {v11, v1, v12, v2, v3}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v12

    .line 142
    .local v12, "a":Landroid/content/res/TypedArray;
    const/4 v13, 0x0

    .line 143
    .local v13, "appearance":Landroid/content/res/TypedArray;
    sget v14, Landroidx/wear/R$styleable;->TextViewAppearance_android_textAppearance:I

    invoke-virtual {v12, v14, v8}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v14

    .line 144
    .local v14, "ap":I
    invoke-virtual {v12}, Landroid/content/res/TypedArray;->recycle()V

    .line 146
    if-eq v14, v8, :cond_0

    .line 147
    sget-object v15, Landroidx/wear/R$styleable;->TextAppearance:[I

    invoke-virtual {v11, v14, v15}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v13

    .line 149
    :cond_0
    if-eqz v13, :cond_1

    .line 150
    invoke-direct {v0, v13, v10, v4}, Landroidx/wear/widget/CurvedTextView;->readTextAppearance(Landroid/content/res/TypedArray;Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;Z)V

    .line 151
    invoke-virtual {v13}, Landroid/content/res/TypedArray;->recycle()V

    .line 154
    :cond_1
    sget-object v15, Landroidx/wear/R$styleable;->CurvedTextView:[I

    move-object/from16 v4, p1

    invoke-virtual {v4, v1, v15, v2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v12

    .line 157
    invoke-direct {v0, v12, v10, v9}, Landroidx/wear/widget/CurvedTextView;->readTextAppearance(Landroid/content/res/TypedArray;Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;Z)V

    .line 160
    sget v15, Landroidx/wear/R$styleable;->CurvedTextView_android_text:I

    invoke-virtual {v12, v15}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v15

    if-eqz v15, :cond_2

    .line 161
    sget v15, Landroidx/wear/R$styleable;->CurvedTextView_android_text:I

    invoke-virtual {v12, v15}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v15

    iput-object v15, v0, Landroidx/wear/widget/CurvedTextView;->mText:Ljava/lang/String;

    .line 164
    :cond_2
    sget v15, Landroidx/wear/R$styleable;->CurvedTextView_android_ellipsize:I

    invoke-virtual {v12, v15, v9}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v9

    .line 165
    .local v9, "textEllipsize":I
    packed-switch v9, :pswitch_data_0

    .line 176
    iput-object v5, v0, Landroidx/wear/widget/CurvedTextView;->mEllipsize:Landroid/text/TextUtils$TruncateAt;

    goto :goto_0

    .line 173
    :pswitch_0
    sget-object v5, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    iput-object v5, v0, Landroidx/wear/widget/CurvedTextView;->mEllipsize:Landroid/text/TextUtils$TruncateAt;

    .line 174
    goto :goto_0

    .line 170
    :pswitch_1
    sget-object v5, Landroid/text/TextUtils$TruncateAt;->MIDDLE:Landroid/text/TextUtils$TruncateAt;

    iput-object v5, v0, Landroidx/wear/widget/CurvedTextView;->mEllipsize:Landroid/text/TextUtils$TruncateAt;

    .line 171
    goto :goto_0

    .line 167
    :pswitch_2
    sget-object v5, Landroid/text/TextUtils$TruncateAt;->START:Landroid/text/TextUtils$TruncateAt;

    iput-object v5, v0, Landroidx/wear/widget/CurvedTextView;->mEllipsize:Landroid/text/TextUtils$TruncateAt;

    .line 168
    nop

    .line 180
    :goto_0
    sget v5, Landroidx/wear/R$styleable;->CurvedTextView_maxSweepDegrees:I

    .line 181
    invoke-virtual {v12, v5, v7}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    iput v5, v0, Landroidx/wear/widget/CurvedTextView;->mMaxSweepDegrees:F

    .line 182
    iget v5, v0, Landroidx/wear/widget/CurvedTextView;->mMaxSweepDegrees:F

    invoke-static {v5, v7}, Ljava/lang/Math;->min(FF)F

    move-result v5

    iput v5, v0, Landroidx/wear/widget/CurvedTextView;->mMaxSweepDegrees:F

    .line 183
    sget v5, Landroidx/wear/R$styleable;->CurvedTextView_minSweepDegrees:I

    .line 184
    invoke-virtual {v12, v5, v6}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    iput v5, v0, Landroidx/wear/widget/CurvedTextView;->mMinSweepDegrees:F

    .line 185
    iget v5, v0, Landroidx/wear/widget/CurvedTextView;->mMinSweepDegrees:F

    iget v6, v0, Landroidx/wear/widget/CurvedTextView;->mMaxSweepDegrees:F

    cmpl-float v5, v5, v6

    if-gtz v5, :cond_3

    .line 190
    sget v5, Landroidx/wear/R$styleable;->CurvedTextView_anchorPosition:I

    invoke-virtual {v12, v5, v8}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    iput v5, v0, Landroidx/wear/widget/CurvedTextView;->mAnchorType:I

    .line 191
    sget v5, Landroidx/wear/R$styleable;->CurvedTextView_anchorAngleDegrees:I

    const/high16 v6, -0x40800000    # -1.0f

    invoke-virtual {v12, v5, v6}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v5

    iput v5, v0, Landroidx/wear/widget/CurvedTextView;->mAnchorAngleDegrees:F

    .line 194
    iget v5, v0, Landroidx/wear/widget/CurvedTextView;->mAnchorAngleDegrees:F

    const/high16 v6, 0x43b40000    # 360.0f

    rem-float/2addr v5, v6

    iput v5, v0, Landroidx/wear/widget/CurvedTextView;->mAnchorAngleDegrees:F

    .line 195
    sget v5, Landroidx/wear/R$styleable;->CurvedTextView_clockwise:I

    const/4 v6, 0x1

    invoke-virtual {v12, v5, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    iput-boolean v5, v0, Landroidx/wear/widget/CurvedTextView;->mClockwise:Z

    .line 197
    invoke-virtual {v12}, Landroid/content/res/TypedArray;->recycle()V

    .line 199
    invoke-direct {v0, v10}, Landroidx/wear/widget/CurvedTextView;->applyTextAppearance(Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;)V

    .line 201
    iget-object v5, v0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    iget v6, v0, Landroidx/wear/widget/CurvedTextView;->mTextSize:F

    invoke-virtual {v5, v6}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 202
    return-void

    .line 186
    :cond_3
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "MinSweepDegrees cannot be bigger than MaxSweepDegrees"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private applyTextAppearance(Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;)V
    .locals 4
    .param p1, "attributes"    # Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;

    .line 620
    iget-object v0, p1, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mTextColor:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_0

    .line 621
    iget-object v0, p1, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mTextColor:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    iput v0, p0, Landroidx/wear/widget/CurvedTextView;->mTextColor:I

    .line 624
    :cond_0
    iget v0, p1, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mTextSize:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_1

    .line 625
    iget v0, p1, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mTextSize:F

    iput v0, p0, Landroidx/wear/widget/CurvedTextView;->mTextSize:F

    .line 628
    :cond_1
    iget-object v0, p1, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mFontFamily:Ljava/lang/String;

    iget v1, p1, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mTypefaceIndex:I

    iget v2, p1, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mTextStyle:I

    iget v3, p1, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mFontWeight:I

    invoke-direct {p0, v0, v1, v2, v3}, Landroidx/wear/widget/CurvedTextView;->setTypefaceFromAttrs(Ljava/lang/String;III)V

    .line 635
    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    iget v1, p1, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mLetterSpacing:F

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setLetterSpacing(F)V

    .line 636
    iget v0, p1, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mLetterSpacing:F

    iput v0, p0, Landroidx/wear/widget/CurvedTextView;->mLetterSpacing:F

    .line 637
    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    iget-object v1, p1, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mFontFeatureSettings:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setFontFeatureSettings(Ljava/lang/String;)V

    .line 638
    iget-object v0, p1, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mFontFeatureSettings:Ljava/lang/String;

    iput-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mFontFeatureSettings:Ljava/lang/String;

    .line 639
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_2

    .line 640
    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    iget-object v1, p1, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mFontVariationSettings:Ljava/lang/String;

    invoke-static {v0, v1}, Landroidx/wear/widget/CurvedTextView$Api26Impl;->paintSetFontVariationSettings(Landroid/graphics/Paint;Ljava/lang/String;)V

    .line 642
    :cond_2
    iget-object v0, p1, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mFontVariationSettings:Ljava/lang/String;

    iput-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mFontVariationSettings:Ljava/lang/String;

    .line 643
    return-void
.end method

.method private doRedraw()V
    .locals 1

    .line 722
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/wear/widget/CurvedTextView;->mDirty:Z

    .line 723
    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->postInvalidate()V

    .line 724
    return-void
.end method

.method private doUpdate()V
    .locals 1

    .line 716
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/wear/widget/CurvedTextView;->mDirty:Z

    .line 717
    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->requestLayout()V

    .line 718
    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->postInvalidate()V

    .line 719
    return-void
.end method

.method private ellipsize(I)Ljava/lang/String;
    .locals 7
    .param p1, "ellipsizedWidth"    # I

    .line 294
    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mText:Ljava/lang/String;

    iget-object v1, p0, Landroidx/wear/widget/CurvedTextView;->mText:Ljava/lang/String;

    .line 295
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    iget-object v2, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    const/4 v3, 0x0

    invoke-static {v0, v3, v1, v2, p1}, Landroid/text/StaticLayout$Builder;->obtain(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    move-result-object v0

    .line 296
    .local v0, "layoutBuilder":Landroid/text/StaticLayout$Builder;
    iget-object v1, p0, Landroidx/wear/widget/CurvedTextView;->mEllipsize:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v1}, Landroid/text/StaticLayout$Builder;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)Landroid/text/StaticLayout$Builder;

    .line 297
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/text/StaticLayout$Builder;->setMaxLines(I)Landroid/text/StaticLayout$Builder;

    .line 298
    invoke-virtual {v0}, Landroid/text/StaticLayout$Builder;->build()Landroid/text/StaticLayout;

    move-result-object v1

    .line 301
    .local v1, "layout":Landroid/text/StaticLayout;
    iget-object v2, p0, Landroidx/wear/widget/CurvedTextView;->mEllipsize:Landroid/text/TextUtils$TruncateAt;

    if-nez v2, :cond_0

    .line 302
    iget-object v2, p0, Landroidx/wear/widget/CurvedTextView;->mText:Ljava/lang/String;

    invoke-virtual {v1, v3}, Landroid/text/StaticLayout;->getLineEnd(I)I

    move-result v4

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 305
    :cond_0
    invoke-virtual {v1, v3}, Landroid/text/StaticLayout;->getEllipsisCount(I)I

    move-result v2

    .line 306
    .local v2, "ellipsisCount":I
    if-nez v2, :cond_1

    .line 307
    iget-object v3, p0, Landroidx/wear/widget/CurvedTextView;->mText:Ljava/lang/String;

    return-object v3

    .line 310
    :cond_1
    invoke-virtual {v1, v3}, Landroid/text/StaticLayout;->getEllipsisStart(I)I

    move-result v3

    .line 311
    .local v3, "ellipsisStart":I
    iget-object v4, p0, Landroidx/wear/widget/CurvedTextView;->mText:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->toCharArray()[C

    move-result-object v4

    .line 312
    .local v4, "textToDrawArray":[C
    const/16 v5, 0x2026

    aput-char v5, v4, v3

    .line 313
    add-int/lit8 v5, v3, 0x1

    .local v5, "i":I
    :goto_0
    add-int v6, v3, v2

    if-ge v5, v6, :cond_3

    .line 314
    if-ltz v5, :cond_2

    iget-object v6, p0, Landroidx/wear/widget/CurvedTextView;->mText:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-ge v5, v6, :cond_2

    .line 315
    const v6, 0xfeff

    aput-char v6, v4, v5

    .line 313
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 318
    .end local v5    # "i":I
    :cond_3
    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v4}, Ljava/lang/String;-><init>([C)V

    return-object v5
.end method

.method private getWidthSelf()F
    .locals 2

    .line 290
    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->getPaddingLeft()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v0, v1

    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->getPaddingRight()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v0, v1

    return v0
.end method

.method private readTextAppearance(Landroid/content/res/TypedArray;Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;Z)V
    .locals 3
    .param p1, "appearance"    # Landroid/content/res/TypedArray;
    .param p2, "attributes"    # Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;
    .param p3, "isTextAppearance"    # Z

    .line 655
    if-eqz p3, :cond_0

    sget v0, Landroidx/wear/R$styleable;->TextAppearance_android_textColor:I

    goto :goto_0

    .line 656
    :cond_0
    sget v0, Landroidx/wear/R$styleable;->CurvedTextView_android_textColor:I

    :goto_0
    nop

    .line 657
    .local v0, "attrIndex":I
    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 658
    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    iput-object v1, p2, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mTextColor:Landroid/content/res/ColorStateList;

    .line 661
    :cond_1
    nop

    .line 662
    if-eqz p3, :cond_2

    sget v1, Landroidx/wear/R$styleable;->TextAppearance_android_textSize:I

    goto :goto_1

    .line 663
    :cond_2
    sget v1, Landroidx/wear/R$styleable;->CurvedTextView_android_textSize:I

    :goto_1
    iget v2, p2, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mTextSize:F

    float-to-int v2, v2

    .line 661
    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    int-to-float v1, v1

    iput v1, p2, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mTextSize:F

    .line 667
    nop

    .line 668
    if-eqz p3, :cond_3

    sget v1, Landroidx/wear/R$styleable;->TextAppearance_android_textStyle:I

    goto :goto_2

    .line 669
    :cond_3
    sget v1, Landroidx/wear/R$styleable;->CurvedTextView_android_textStyle:I

    :goto_2
    iget v2, p2, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mTextStyle:I

    .line 667
    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p2, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mTextStyle:I

    .line 674
    nop

    .line 675
    if-eqz p3, :cond_4

    sget v1, Landroidx/wear/R$styleable;->TextAppearance_android_typeface:I

    goto :goto_3

    .line 676
    :cond_4
    sget v1, Landroidx/wear/R$styleable;->CurvedTextView_android_typeface:I

    :goto_3
    iget v2, p2, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mTypefaceIndex:I

    .line 674
    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    iput v1, p2, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mTypefaceIndex:I

    .line 679
    iget v1, p2, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mTypefaceIndex:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_5

    iget-boolean v1, p2, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mFontFamilyExplicit:Z

    if-nez v1, :cond_5

    .line 680
    const/4 v1, 0x0

    iput-object v1, p2, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mFontFamily:Ljava/lang/String;

    .line 683
    :cond_5
    if-eqz p3, :cond_6

    sget v1, Landroidx/wear/R$styleable;->TextAppearance_android_fontFamily:I

    goto :goto_4

    .line 684
    :cond_6
    sget v1, Landroidx/wear/R$styleable;->CurvedTextView_android_fontFamily:I

    :goto_4
    nop

    .line 685
    .end local v0    # "attrIndex":I
    .local v1, "attrIndex":I
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 686
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p2, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mFontFamily:Ljava/lang/String;

    .line 687
    xor-int/lit8 v0, p3, 0x1

    iput-boolean v0, p2, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mFontFamilyExplicit:Z

    .line 690
    :cond_7
    nop

    .line 691
    if-eqz p3, :cond_8

    sget v0, Landroidx/wear/R$styleable;->TextAppearance_android_textFontWeight:I

    goto :goto_5

    .line 692
    :cond_8
    sget v0, Landroidx/wear/R$styleable;->CurvedTextView_android_textFontWeight:I

    :goto_5
    iget v2, p2, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mFontWeight:I

    .line 690
    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p2, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mFontWeight:I

    .line 696
    nop

    .line 697
    if-eqz p3, :cond_9

    sget v0, Landroidx/wear/R$styleable;->TextAppearance_android_letterSpacing:I

    goto :goto_6

    .line 698
    :cond_9
    sget v0, Landroidx/wear/R$styleable;->CurvedTextView_android_letterSpacing:I

    :goto_6
    iget v2, p2, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mLetterSpacing:F

    .line 696
    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v0

    iput v0, p2, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mLetterSpacing:F

    .line 702
    if-eqz p3, :cond_a

    sget v0, Landroidx/wear/R$styleable;->TextAppearance_android_fontFeatureSettings:I

    goto :goto_7

    .line 703
    :cond_a
    sget v0, Landroidx/wear/R$styleable;->CurvedTextView_android_fontFeatureSettings:I

    :goto_7
    nop

    .line 704
    .end local v1    # "attrIndex":I
    .restart local v0    # "attrIndex":I
    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 705
    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p2, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mFontFeatureSettings:Ljava/lang/String;

    .line 708
    :cond_b
    if-eqz p3, :cond_c

    sget v1, Landroidx/wear/R$styleable;->TextAppearance_android_fontVariationSettings:I

    goto :goto_8

    .line 709
    :cond_c
    sget v1, Landroidx/wear/R$styleable;->CurvedTextView_android_fontVariationSettings:I

    :goto_8
    nop

    .line 710
    .end local v0    # "attrIndex":I
    .restart local v1    # "attrIndex":I
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 711
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p2, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mFontVariationSettings:Ljava/lang/String;

    .line 713
    :cond_d
    return-void
.end method

.method private resolveStyleAndSetTypeface(Landroid/graphics/Typeface;II)V
    .locals 4
    .param p1, "tf"    # Landroid/graphics/Typeface;
    .param p2, "style"    # I
    .param p3, "weight"    # I

    .line 550
    if-ltz p3, :cond_1

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_1

    .line 551
    const/16 v0, 0x3e8

    invoke-static {v0, p3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 552
    .local v0, "clampedWeight":I
    and-int/lit8 v1, p2, 0x2

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 553
    .local v1, "italic":Z
    :goto_0
    invoke-static {p1, v0, v1}, Landroidx/wear/widget/CurvedTextView$Api28Impl;->createTypeface(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    move-result-object v2

    iput-object v2, p0, Landroidx/wear/widget/CurvedTextView;->mTypeface:Landroid/graphics/Typeface;

    .line 554
    iget-object v2, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    iget-object v3, p0, Landroidx/wear/widget/CurvedTextView;->mTypeface:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 555
    .end local v0    # "clampedWeight":I
    .end local v1    # "italic":Z
    goto :goto_1

    .line 556
    :cond_1
    invoke-virtual {p0, p1, p2}, Landroidx/wear/widget/CurvedTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 558
    :goto_1
    return-void
.end method

.method private setTypefaceFromAttrs(Ljava/lang/String;III)V
    .locals 1
    .param p1, "familyName"    # Ljava/lang/String;
    .param p2, "typefaceIndex"    # I
    .param p3, "style"    # I
    .param p4, "weight"    # I

    .line 526
    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mTypeface:Landroid/graphics/Typeface;

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    .line 528
    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v0

    .line 529
    .local v0, "normalTypeface":Landroid/graphics/Typeface;
    invoke-direct {p0, v0, p3, p4}, Landroidx/wear/widget/CurvedTextView;->resolveStyleAndSetTypeface(Landroid/graphics/Typeface;II)V

    .line 530
    .end local v0    # "normalTypeface":Landroid/graphics/Typeface;
    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mTypeface:Landroid/graphics/Typeface;

    if-eqz v0, :cond_1

    .line 531
    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mTypeface:Landroid/graphics/Typeface;

    invoke-direct {p0, v0, p3, p4}, Landroidx/wear/widget/CurvedTextView;->resolveStyleAndSetTypeface(Landroid/graphics/Typeface;II)V

    goto :goto_0

    .line 533
    :cond_1
    packed-switch p2, :pswitch_data_0

    .line 544
    const/4 v0, 0x0

    invoke-direct {p0, v0, p3, p4}, Landroidx/wear/widget/CurvedTextView;->resolveStyleAndSetTypeface(Landroid/graphics/Typeface;II)V

    goto :goto_0

    .line 541
    :pswitch_0
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    invoke-direct {p0, v0, p3, p4}, Landroidx/wear/widget/CurvedTextView;->resolveStyleAndSetTypeface(Landroid/graphics/Typeface;II)V

    .line 542
    goto :goto_0

    .line 538
    :pswitch_1
    sget-object v0, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    invoke-direct {p0, v0, p3, p4}, Landroidx/wear/widget/CurvedTextView;->resolveStyleAndSetTypeface(Landroid/graphics/Typeface;II)V

    .line 539
    goto :goto_0

    .line 535
    :pswitch_2
    sget-object v0, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    invoke-direct {p0, v0, p3, p4}, Landroidx/wear/widget/CurvedTextView;->resolveStyleAndSetTypeface(Landroid/graphics/Typeface;II)V

    .line 536
    nop

    .line 547
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private updatePathsIfNeeded(Z)V
    .locals 34
    .param p1, "withBackground"    # Z

    .line 323
    move-object/from16 v0, p0

    iget-boolean v1, v0, Landroidx/wear/widget/CurvedTextView;->mDirty:Z

    if-nez v1, :cond_0

    invoke-virtual {v0}, Landroidx/wear/widget/CurvedTextView;->getTextAlignment()I

    move-result v1

    iget v2, v0, Landroidx/wear/widget/CurvedTextView;->mLastUsedTextAlignment:I

    if-ne v1, v2, :cond_0

    .line 324
    return-void

    .line 327
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, v0, Landroidx/wear/widget/CurvedTextView;->mDirty:Z

    .line 328
    invoke-virtual {v0}, Landroidx/wear/widget/CurvedTextView;->getTextAlignment()I

    move-result v1

    iput v1, v0, Landroidx/wear/widget/CurvedTextView;->mLastUsedTextAlignment:I

    .line 330
    iget v1, v0, Landroidx/wear/widget/CurvedTextView;->mTextSweepDegrees:F

    iget v2, v0, Landroidx/wear/widget/CurvedTextView;->mMaxSweepDegrees:F

    cmpg-float v1, v1, v2

    const/high16 v2, 0x43340000    # 180.0f

    const-wide v3, 0x400921fb54442d18L    # Math.PI

    if-gtz v1, :cond_1

    .line 331
    iget-object v1, v0, Landroidx/wear/widget/CurvedTextView;->mText:Ljava/lang/String;

    iput-object v1, v0, Landroidx/wear/widget/CurvedTextView;->mTextToDraw:Ljava/lang/String;

    goto :goto_0

    .line 333
    :cond_1
    iget v1, v0, Landroidx/wear/widget/CurvedTextView;->mMaxSweepDegrees:F

    div-float/2addr v1, v2

    float-to-double v5, v1

    mul-double/2addr v5, v3

    iget v1, v0, Landroidx/wear/widget/CurvedTextView;->mPathRadius:F

    float-to-double v7, v1

    mul-double/2addr v5, v7

    double-to-int v1, v5

    .line 334
    invoke-virtual {v0}, Landroidx/wear/widget/CurvedTextView;->getPaddingLeft()I

    move-result v5

    sub-int/2addr v1, v5

    .line 335
    invoke-virtual {v0}, Landroidx/wear/widget/CurvedTextView;->getPaddingRight()I

    move-result v5

    sub-int/2addr v1, v5

    .line 333
    invoke-direct {v0, v1}, Landroidx/wear/widget/CurvedTextView;->ellipsize(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Landroidx/wear/widget/CurvedTextView;->mTextToDraw:Ljava/lang/String;

    .line 337
    iget v1, v0, Landroidx/wear/widget/CurvedTextView;->mMaxSweepDegrees:F

    iput v1, v0, Landroidx/wear/widget/CurvedTextView;->mTextSweepDegrees:F

    .line 340
    :goto_0
    iget-boolean v1, v0, Landroidx/wear/widget/CurvedTextView;->mClockwise:Z

    const/high16 v5, -0x40800000    # -1.0f

    if-eqz v1, :cond_2

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_1

    :cond_2
    move v1, v5

    .line 342
    .local v1, "clockwiseFactor":F
    :goto_1
    const/high16 v6, 0x3f000000    # 0.5f

    .line 343
    .local v6, "alignmentFactor":F
    invoke-virtual {v0}, Landroidx/wear/widget/CurvedTextView;->getTextAlignment()I

    move-result v7

    packed-switch v7, :pswitch_data_0

    .line 353
    :pswitch_0
    const/high16 v6, 0x3f000000    # 0.5f

    goto :goto_2

    .line 350
    :pswitch_1
    const/high16 v6, 0x3f800000    # 1.0f

    .line 351
    goto :goto_2

    .line 346
    :pswitch_2
    const/4 v6, 0x0

    .line 347
    nop

    .line 357
    :goto_2
    iget v7, v0, Landroidx/wear/widget/CurvedTextView;->mAnchorType:I

    packed-switch v7, :pswitch_data_1

    .line 366
    :pswitch_3
    const/4 v7, 0x0

    .local v7, "anchorTypeFactor":F
    goto :goto_3

    .line 362
    .end local v7    # "anchorTypeFactor":F
    :pswitch_4
    const/high16 v7, -0x41000000    # -0.5f

    .line 363
    .restart local v7    # "anchorTypeFactor":F
    goto :goto_3

    .line 359
    .end local v7    # "anchorTypeFactor":F
    :pswitch_5
    const/high16 v7, 0x3f000000    # 0.5f

    .line 360
    .restart local v7    # "anchorTypeFactor":F
    nop

    .line 369
    :goto_3
    iget v8, v0, Landroidx/wear/widget/CurvedTextView;->mAnchorAngleDegrees:F

    cmpl-float v5, v8, v5

    if-nez v5, :cond_3

    const/4 v5, 0x0

    goto :goto_4

    :cond_3
    iget v5, v0, Landroidx/wear/widget/CurvedTextView;->mAnchorAngleDegrees:F

    :goto_4
    mul-float v8, v1, v7

    iget v9, v0, Landroidx/wear/widget/CurvedTextView;->mBackgroundSweepDegrees:F

    mul-float/2addr v8, v9

    add-float/2addr v5, v8

    iput v5, v0, Landroidx/wear/widget/CurvedTextView;->mLocalRotateAngle:F

    .line 373
    neg-float v5, v1

    const/high16 v8, 0x3f000000    # 0.5f

    mul-float/2addr v5, v8

    iget v8, v0, Landroidx/wear/widget/CurvedTextView;->mBackgroundSweepDegrees:F

    mul-float/2addr v5, v8

    const/high16 v8, -0x3d4c0000    # -90.0f

    add-float v14, v5, v8

    .line 376
    .local v14, "backgroundStartAngle":F
    iget v5, v0, Landroidx/wear/widget/CurvedTextView;->mBackgroundSweepDegrees:F

    iget v8, v0, Landroidx/wear/widget/CurvedTextView;->mTextSweepDegrees:F

    sub-float/2addr v5, v8

    mul-float/2addr v5, v6

    float-to-double v8, v5

    .line 379
    invoke-virtual {v0}, Landroidx/wear/widget/CurvedTextView;->getPaddingLeft()I

    move-result v5

    int-to-float v5, v5

    iget v10, v0, Landroidx/wear/widget/CurvedTextView;->mPathRadius:F

    div-float/2addr v5, v10

    float-to-double v10, v5

    div-double/2addr v10, v3

    const-wide v17, 0x4066800000000000L    # 180.0

    mul-double v10, v10, v17

    add-double/2addr v8, v10

    double-to-float v5, v8

    mul-float/2addr v5, v1

    add-float v24, v14, v5

    .line 381
    .local v24, "textStartAngle":F
    invoke-virtual {v0}, Landroidx/wear/widget/CurvedTextView;->getWidth()I

    move-result v5

    int-to-float v5, v5

    const/high16 v8, 0x40000000    # 2.0f

    div-float/2addr v5, v8

    .line 382
    .local v5, "centerX":F
    invoke-virtual {v0}, Landroidx/wear/widget/CurvedTextView;->getHeight()I

    move-result v9

    int-to-float v9, v9

    div-float v8, v9, v8

    .line 383
    .local v8, "centerY":F
    iget-object v9, v0, Landroidx/wear/widget/CurvedTextView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v9}, Landroid/graphics/Path;->reset()V

    .line 384
    iget-object v9, v0, Landroidx/wear/widget/CurvedTextView;->mPath:Landroid/graphics/Path;

    iget v10, v0, Landroidx/wear/widget/CurvedTextView;->mPathRadius:F

    sub-float v20, v5, v10

    iget v10, v0, Landroidx/wear/widget/CurvedTextView;->mPathRadius:F

    sub-float v21, v8, v10

    iget v10, v0, Landroidx/wear/widget/CurvedTextView;->mPathRadius:F

    add-float v22, v5, v10

    iget v10, v0, Landroidx/wear/widget/CurvedTextView;->mPathRadius:F

    add-float v23, v8, v10

    iget v10, v0, Landroidx/wear/widget/CurvedTextView;->mTextSweepDegrees:F

    mul-float v25, v1, v10

    move-object/from16 v19, v9

    invoke-virtual/range {v19 .. v25}, Landroid/graphics/Path;->addArc(FFFFFF)V

    .line 393
    if-eqz p1, :cond_6

    .line 394
    iget-object v9, v0, Landroidx/wear/widget/CurvedTextView;->mBgPath:Landroid/graphics/Path;

    invoke-virtual {v9}, Landroid/graphics/Path;->reset()V

    .line 397
    iget v9, v0, Landroidx/wear/widget/CurvedTextView;->mPathRadius:F

    iget-object v10, v0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v10}, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v10

    iget v10, v10, Landroid/graphics/Paint$FontMetrics;->descent:F

    mul-float/2addr v10, v1

    sub-float/2addr v9, v10

    .line 398
    .local v9, "radius1":F
    iget v10, v0, Landroidx/wear/widget/CurvedTextView;->mPathRadius:F

    iget-object v11, v0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v11}, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v11

    iget v11, v11, Landroid/graphics/Paint$FontMetrics;->ascent:F

    mul-float/2addr v11, v1

    sub-float/2addr v10, v11

    .line 399
    .local v10, "radius2":F
    move v11, v9

    .end local v9    # "radius1":F
    .local v11, "radius1":F
    iget-object v9, v0, Landroidx/wear/widget/CurvedTextView;->mBgPath:Landroid/graphics/Path;

    move v12, v10

    .end local v10    # "radius2":F
    .local v12, "radius2":F
    sub-float v10, v5, v12

    move v13, v11

    .end local v11    # "radius1":F
    .local v13, "radius1":F
    sub-float v11, v8, v12

    move v15, v12

    .end local v12    # "radius2":F
    .local v15, "radius2":F
    add-float v12, v5, v15

    move/from16 v16, v13

    .end local v13    # "radius1":F
    .local v16, "radius1":F
    add-float v13, v8, v15

    move/from16 v19, v2

    iget v2, v0, Landroidx/wear/widget/CurvedTextView;->mBackgroundSweepDegrees:F

    mul-float/2addr v2, v1

    move/from16 v20, v16

    .end local v16    # "radius1":F
    .local v20, "radius1":F
    const/16 v16, 0x0

    move/from16 v33, v15

    move v15, v2

    move/from16 v2, v20

    move-wide/from16 v20, v3

    move/from16 v3, v33

    .end local v15    # "radius2":F
    .end local v20    # "radius1":F
    .local v2, "radius1":F
    .local v3, "radius2":F
    invoke-virtual/range {v9 .. v16}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    .line 407
    iget-object v4, v0, Landroidx/wear/widget/CurvedTextView;->mBgPath:Landroid/graphics/Path;

    sub-float v26, v5, v2

    sub-float v27, v8, v2

    add-float v28, v5, v2

    add-float v29, v8, v2

    iget v9, v0, Landroidx/wear/widget/CurvedTextView;->mBackgroundSweepDegrees:F

    mul-float/2addr v9, v1

    add-float v30, v14, v9

    neg-float v9, v1

    iget v10, v0, Landroidx/wear/widget/CurvedTextView;->mBackgroundSweepDegrees:F

    mul-float v31, v9, v10

    const/16 v32, 0x0

    move-object/from16 v25, v4

    invoke-virtual/range {v25 .. v32}, Landroid/graphics/Path;->arcTo(FFFFFFZ)V

    .line 415
    iget-object v4, v0, Landroidx/wear/widget/CurvedTextView;->mBgPath:Landroid/graphics/Path;

    invoke-virtual {v4}, Landroid/graphics/Path;->close()V

    .line 417
    move v4, v14

    .line 418
    .local v4, "angle":F
    float-to-double v9, v5

    float-to-double v11, v3

    move v13, v6

    move v15, v7

    .end local v6    # "alignmentFactor":F
    .end local v7    # "anchorTypeFactor":F
    .local v13, "alignmentFactor":F
    .local v15, "anchorTypeFactor":F
    float-to-double v6, v4

    mul-double v6, v6, v20

    div-double v6, v6, v17

    invoke-static {v6, v7}, Ljava/lang/Math;->cos(D)D

    move-result-wide v6

    mul-double/2addr v11, v6

    add-double/2addr v9, v11

    double-to-float v6, v9

    .line 419
    .local v6, "x0":F
    float-to-double v9, v5

    float-to-double v11, v2

    move-wide/from16 v22, v9

    float-to-double v9, v4

    mul-double v9, v9, v20

    div-double v9, v9, v17

    invoke-static {v9, v10}, Ljava/lang/Math;->cos(D)D

    move-result-wide v9

    mul-double/2addr v11, v9

    add-double v9, v22, v11

    double-to-float v7, v9

    .line 420
    .local v7, "x1":F
    float-to-double v9, v8

    float-to-double v11, v3

    move-wide/from16 v22, v9

    float-to-double v9, v4

    mul-double v9, v9, v20

    div-double v9, v9, v17

    invoke-static {v9, v10}, Ljava/lang/Math;->sin(D)D

    move-result-wide v9

    mul-double/2addr v11, v9

    add-double v9, v22, v11

    double-to-float v9, v9

    .line 421
    .local v9, "y0":F
    float-to-double v10, v8

    move-wide/from16 v22, v10

    float-to-double v10, v2

    move-wide/from16 v25, v10

    float-to-double v10, v4

    mul-double v10, v10, v20

    div-double v10, v10, v17

    invoke-static {v10, v11}, Ljava/lang/Math;->sin(D)D

    move-result-wide v10

    mul-double v10, v10, v25

    add-double v10, v22, v10

    double-to-float v10, v10

    .line 422
    .local v10, "y1":F
    iget v11, v0, Landroidx/wear/widget/CurvedTextView;->mBackgroundSweepDegrees:F

    mul-float/2addr v11, v1

    add-float v4, v14, v11

    .line 423
    float-to-double v11, v5

    move-wide/from16 v22, v11

    float-to-double v11, v3

    move-wide/from16 v25, v11

    float-to-double v11, v4

    mul-double v11, v11, v20

    div-double v11, v11, v17

    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    move-result-wide v11

    mul-double v11, v11, v25

    add-double v11, v22, v11

    double-to-float v11, v11

    .line 424
    .local v11, "x2":F
    move/from16 v16, v13

    .end local v13    # "alignmentFactor":F
    .local v16, "alignmentFactor":F
    float-to-double v12, v5

    move-wide/from16 v22, v12

    float-to-double v12, v2

    move-wide/from16 v25, v12

    float-to-double v12, v4

    mul-double v12, v12, v20

    div-double v12, v12, v17

    invoke-static {v12, v13}, Ljava/lang/Math;->cos(D)D

    move-result-wide v12

    mul-double v12, v12, v25

    add-double v12, v22, v12

    double-to-float v12, v12

    .line 433
    .local v12, "x3":F
    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v13

    .line 434
    .local v13, "outerRadius":F
    move/from16 v17, v1

    .end local v1    # "clockwiseFactor":F
    .local v17, "clockwiseFactor":F
    iget-object v1, v0, Landroidx/wear/widget/CurvedTextView;->mBgBounds:Landroid/graphics/Rect;

    move/from16 v20, v2

    .end local v2    # "radius1":F
    .restart local v20    # "radius1":F
    sub-float v2, v8, v13

    float-to-int v2, v2

    iput v2, v1, Landroid/graphics/Rect;->top:I

    .line 435
    iget-object v1, v0, Landroidx/wear/widget/CurvedTextView;->mBgBounds:Landroid/graphics/Rect;

    invoke-static {v9, v10}, Ljava/lang/Math;->max(FF)F

    move-result v2

    float-to-int v2, v2

    iput v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 436
    iget-object v1, v0, Landroidx/wear/widget/CurvedTextView;->mBgBounds:Landroid/graphics/Rect;

    .line 437
    iget v2, v0, Landroidx/wear/widget/CurvedTextView;->mBackgroundSweepDegrees:F

    cmpl-float v2, v2, v19

    if-ltz v2, :cond_4

    .line 438
    sub-float v2, v5, v13

    float-to-int v2, v2

    goto :goto_5

    .line 439
    :cond_4
    invoke-static {v11, v12}, Ljava/lang/Math;->min(FF)F

    move-result v2

    invoke-static {v7, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    invoke-static {v6, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    float-to-int v2, v2

    :goto_5
    iput v2, v1, Landroid/graphics/Rect;->left:I

    .line 440
    iget-object v1, v0, Landroidx/wear/widget/CurvedTextView;->mBgBounds:Landroid/graphics/Rect;

    .line 441
    iget v2, v0, Landroidx/wear/widget/CurvedTextView;->mBackgroundSweepDegrees:F

    cmpl-float v2, v2, v19

    if-ltz v2, :cond_5

    .line 442
    add-float v2, v5, v13

    float-to-int v2, v2

    goto :goto_6

    .line 443
    :cond_5
    invoke-static {v11, v12}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-static {v7, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-static {v6, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    float-to-int v2, v2

    :goto_6
    iput v2, v1, Landroid/graphics/Rect;->right:I

    goto :goto_7

    .line 393
    .end local v3    # "radius2":F
    .end local v4    # "angle":F
    .end local v9    # "y0":F
    .end local v10    # "y1":F
    .end local v11    # "x2":F
    .end local v12    # "x3":F
    .end local v13    # "outerRadius":F
    .end local v15    # "anchorTypeFactor":F
    .end local v16    # "alignmentFactor":F
    .end local v17    # "clockwiseFactor":F
    .end local v20    # "radius1":F
    .restart local v1    # "clockwiseFactor":F
    .local v6, "alignmentFactor":F
    .local v7, "anchorTypeFactor":F
    :cond_6
    move/from16 v17, v1

    move/from16 v16, v6

    move v15, v7

    .line 445
    .end local v1    # "clockwiseFactor":F
    .end local v6    # "alignmentFactor":F
    .end local v7    # "anchorTypeFactor":F
    .restart local v15    # "anchorTypeFactor":F
    .restart local v16    # "alignmentFactor":F
    .restart local v17    # "clockwiseFactor":F
    :goto_7
    return-void

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_5
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method


# virtual methods
.method public checkInvalidAttributeAsChild()V
    .locals 2

    .line 229
    iget v0, p0, Landroidx/wear/widget/CurvedTextView;->mAnchorType:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 236
    iget v0, p0, Landroidx/wear/widget/CurvedTextView;->mAnchorAngleDegrees:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    .line 242
    return-void

    .line 237
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "CurvedTextView shall not set anchorAngleDegrees value when added into ArcLayout"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 230
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "CurvedTextView shall not set anchorType value when added intoArcLayout"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 5
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 486
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 488
    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 489
    .local v0, "withBackground":Z
    :goto_0
    invoke-direct {p0, v0}, Landroidx/wear/widget/CurvedTextView;->updatePathsIfNeeded(Z)V

    .line 490
    iget v1, p0, Landroidx/wear/widget/CurvedTextView;->mLocalRotateAngle:F

    .line 492
    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->getWidth()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    .line 493
    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->getHeight()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v4, v3

    .line 490
    invoke-virtual {p1, v1, v2, v4}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 495
    if-eqz v0, :cond_1

    .line 496
    iget-object v1, p0, Landroidx/wear/widget/CurvedTextView;->mBgPath:Landroid/graphics/Path;

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 497
    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iget-object v2, p0, Landroidx/wear/widget/CurvedTextView;->mBgBounds:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 499
    :cond_1
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 501
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 502
    return-void
.end method

.method public getAnchorAngleDegrees()F
    .locals 1

    .line 745
    iget v0, p0, Landroidx/wear/widget/CurvedTextView;->mAnchorAngleDegrees:F

    return v0
.end method

.method public getAnchorType()I
    .locals 1

    .line 729
    iget v0, p0, Landroidx/wear/widget/CurvedTextView;->mAnchorType:I

    return v0
.end method

.method public getEllipsize()Landroid/text/TextUtils$TruncateAt;
    .locals 1

    .line 856
    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mEllipsize:Landroid/text/TextUtils$TruncateAt;

    return-object v0
.end method

.method public getFontFeatureSettings()Ljava/lang/String;
    .locals 1

    .line 897
    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mFontFeatureSettings:Ljava/lang/String;

    return-object v0
.end method

.method public getFontVariationSettings()Ljava/lang/String;
    .locals 1

    .line 915
    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mFontVariationSettings:Ljava/lang/String;

    return-object v0
.end method

.method public getLetterSpacing()F
    .locals 1

    .line 875
    iget v0, p0, Landroidx/wear/widget/CurvedTextView;->mLetterSpacing:F

    return v0
.end method

.method public getMaxSweepDegrees()F
    .locals 1

    .line 785
    iget v0, p0, Landroidx/wear/widget/CurvedTextView;->mMaxSweepDegrees:F

    return v0
.end method

.method public getMinSweepDegrees()F
    .locals 1

    .line 779
    iget v0, p0, Landroidx/wear/widget/CurvedTextView;->mMinSweepDegrees:F

    return v0
.end method

.method public getSweepAngleDegrees()F
    .locals 1

    .line 207
    iget v0, p0, Landroidx/wear/widget/CurvedTextView;->mBackgroundSweepDegrees:F

    return v0
.end method

.method public getText()Ljava/lang/String;
    .locals 1

    .line 791
    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mText:Ljava/lang/String;

    return-object v0
.end method

.method public getTextColor()I
    .locals 1

    .line 841
    iget v0, p0, Landroidx/wear/widget/CurvedTextView;->mTextColor:I

    return v0
.end method

.method public getTextSize()F
    .locals 1

    .line 802
    iget v0, p0, Landroidx/wear/widget/CurvedTextView;->mTextSize:F

    return v0
.end method

.method public getThickness()I
    .locals 2

    .line 220
    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v0

    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->descent:F

    iget-object v1, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v1}, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Paint$FontMetrics;->ascent:F

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method public getTypeface()Landroid/graphics/Typeface;
    .locals 1

    .line 815
    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mTypeface:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public isClockwise()Z
    .locals 1

    .line 829
    iget-boolean v0, p0, Landroidx/wear/widget/CurvedTextView;->mClockwise:Z

    return v0
.end method

.method public isPointInsideClickArea(FF)Z
    .locals 12
    .param p1, "x"    # F
    .param p2, "y"    # F

    .line 249
    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    .line 250
    iget-boolean v2, p0, Landroidx/wear/widget/CurvedTextView;->mClockwise:Z

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->getPaddingTop()I

    move-result v2

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->getPaddingBottom()I

    move-result v2

    :goto_0
    int-to-float v2, v2

    sub-float/2addr v0, v2

    .line 251
    .local v0, "radius2":F
    iget-object v2, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    .line 252
    invoke-virtual {v2}, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Paint$FontMetrics;->descent:F

    sub-float v2, v0, v2

    iget-object v3, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v3}, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Paint$FontMetrics;->ascent:F

    add-float/2addr v2, v3

    .line 254
    .local v2, "radius1":F
    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    sub-float v3, p1, v3

    .line 255
    .local v3, "dx":F
    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->getHeight()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    sub-float v4, p2, v4

    .line 257
    .local v4, "dy":F
    mul-float v5, v3, v3

    mul-float v6, v4, v4

    add-float/2addr v5, v6

    .line 258
    .local v5, "r2":F
    mul-float v6, v2, v2

    cmpg-float v6, v5, v6

    const/4 v7, 0x0

    if-ltz v6, :cond_3

    mul-float v6, v0, v0

    cmpl-float v6, v5, v6

    if-lez v6, :cond_1

    goto :goto_1

    .line 263
    :cond_1
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v6

    float-to-double v8, v6

    neg-float v6, v4

    float-to-double v10, v6

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v8

    double-to-float v6, v8

    .line 264
    .local v6, "angle":F
    iget v8, p0, Landroidx/wear/widget/CurvedTextView;->mBackgroundSweepDegrees:F

    div-float/2addr v8, v1

    cmpg-float v1, v6, v8

    if-gez v1, :cond_2

    const/4 v7, 0x1

    :cond_2
    return v7

    .line 259
    .end local v6    # "angle":F
    :cond_3
    :goto_1
    return v7
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 8
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 506
    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    iget v1, p0, Landroidx/wear/widget/CurvedTextView;->mTextColor:I

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setColor(I)V

    .line 507
    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 508
    iget-object v3, p0, Landroidx/wear/widget/CurvedTextView;->mTextToDraw:Ljava/lang/String;

    iget-object v4, p0, Landroidx/wear/widget/CurvedTextView;->mPath:Landroid/graphics/Path;

    const/4 v6, 0x0

    iget-object v7, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    const/4 v5, 0x0

    move-object v2, p1

    .end local p1    # "canvas":Landroid/graphics/Canvas;
    .local v2, "canvas":Landroid/graphics/Canvas;
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawTextOnPath(Ljava/lang/String;Landroid/graphics/Path;FFLandroid/graphics/Paint;)V

    .line 509
    return-void
.end method

.method public onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V
    .locals 1
    .param p1, "info"    # Landroid/view/accessibility/AccessibilityNodeInfo;

    .line 931
    invoke-super {p0, p1}, Landroid/view/View;->onInitializeAccessibilityNodeInfo(Landroid/view/accessibility/AccessibilityNodeInfo;)V

    .line 932
    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mText:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityNodeInfo;->setText(Ljava/lang/CharSequence;)V

    .line 933
    return-void
.end method

.method protected onMeasure(II)V
    .locals 5
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .line 275
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 277
    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    iget-object v1, p0, Landroidx/wear/widget/CurvedTextView;->mText:Ljava/lang/String;

    iget-object v2, p0, Landroidx/wear/widget/CurvedTextView;->mText:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    iget-object v3, p0, Landroidx/wear/widget/CurvedTextView;->mBounds:Landroid/graphics/Rect;

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v4, v2, v3}, Landroid/text/TextPaint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 280
    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->getMeasuredHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    .line 281
    iget-boolean v1, p0, Landroidx/wear/widget/CurvedTextView;->mClockwise:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v1}, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Paint$FontMetrics;->ascent:F

    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->getPaddingTop()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    goto :goto_0

    .line 282
    :cond_0
    iget-object v1, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v1}, Landroid/text/TextPaint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Paint$FontMetrics;->descent:F

    neg-float v1, v1

    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->getPaddingBottom()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    :goto_0
    add-float/2addr v0, v1

    iput v0, p0, Landroidx/wear/widget/CurvedTextView;->mPathRadius:F

    .line 283
    nop

    .line 284
    invoke-direct {p0}, Landroidx/wear/widget/CurvedTextView;->getWidthSelf()F

    move-result v0

    iget v1, p0, Landroidx/wear/widget/CurvedTextView;->mPathRadius:F

    div-float/2addr v0, v1

    const v1, 0x40490fdb    # (float)Math.PI

    div-float/2addr v0, v1

    const/high16 v1, 0x43340000    # 180.0f

    mul-float/2addr v0, v1

    .line 283
    const v1, 0x43b3f333    # 359.9f

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Landroidx/wear/widget/CurvedTextView;->mTextSweepDegrees:F

    .line 286
    iget v0, p0, Landroidx/wear/widget/CurvedTextView;->mMaxSweepDegrees:F

    iget v1, p0, Landroidx/wear/widget/CurvedTextView;->mTextSweepDegrees:F

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iget v1, p0, Landroidx/wear/widget/CurvedTextView;->mMinSweepDegrees:F

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Landroidx/wear/widget/CurvedTextView;->mBackgroundSweepDegrees:F

    .line 287
    return-void
.end method

.method public onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 2
    .param p1, "event"    # Landroid/view/accessibility/AccessibilityEvent;

    .line 937
    invoke-super {p0, p1}, Landroid/view/View;->onPopulateAccessibilityEvent(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 938
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityEvent;->getText()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Landroidx/wear/widget/CurvedTextView;->mText:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 939
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0
    .param p1, "w"    # I
    .param p2, "h"    # I
    .param p3, "oldw"    # I
    .param p4, "oldh"    # I

    .line 269
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 270
    invoke-direct {p0}, Landroidx/wear/widget/CurvedTextView;->doUpdate()V

    .line 271
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 12
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 451
    iget-boolean v0, p0, Landroidx/wear/widget/CurvedTextView;->mHandlingTouch:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-eqz v0, :cond_0

    .line 452
    return v1

    .line 455
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->getWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    sub-float/2addr v0, v2

    .line 456
    .local v0, "x0":F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->getHeight()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    int-to-float v3, v3

    sub-float/2addr v2, v3

    .line 458
    .local v2, "y0":F
    iget v3, p0, Landroidx/wear/widget/CurvedTextView;->mLocalRotateAngle:F

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v3

    neg-double v3, v3

    .line 460
    .local v3, "rotAngle":D
    float-to-double v5, v0

    .line 461
    invoke-static {v3, v4}, Ljava/lang/Math;->cos(D)D

    move-result-wide v7

    mul-double/2addr v5, v7

    float-to-double v7, v2

    invoke-static {v3, v4}, Ljava/lang/Math;->sin(D)D

    move-result-wide v9

    mul-double/2addr v7, v9

    sub-double/2addr v5, v7

    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->getWidth()I

    move-result v7

    div-int/lit8 v7, v7, 0x2

    int-to-double v7, v7

    add-double/2addr v5, v7

    double-to-float v5, v5

    .line 462
    .local v5, "tempX":F
    float-to-double v6, v0

    invoke-static {v3, v4}, Ljava/lang/Math;->sin(D)D

    move-result-wide v8

    mul-double/2addr v6, v8

    float-to-double v8, v2

    invoke-static {v3, v4}, Ljava/lang/Math;->cos(D)D

    move-result-wide v10

    mul-double/2addr v8, v10

    add-double/2addr v6, v8

    invoke-virtual {p0}, Landroidx/wear/widget/CurvedTextView;->getHeight()I

    move-result v8

    div-int/lit8 v8, v8, 0x2

    int-to-double v8, v8

    add-double/2addr v6, v8

    double-to-float v2, v6

    .line 463
    move v0, v5

    .line 466
    iget-boolean v6, p0, Landroidx/wear/widget/CurvedTextView;->mHandlingTouch:Z

    const/4 v7, 0x1

    if-nez v6, :cond_1

    invoke-virtual {p0, v0, v2}, Landroidx/wear/widget/CurvedTextView;->isPointInsideClickArea(FF)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 467
    iput-boolean v7, p0, Landroidx/wear/widget/CurvedTextView;->mHandlingTouch:Z

    .line 471
    :cond_1
    iget-boolean v6, p0, Landroidx/wear/widget/CurvedTextView;->mHandlingTouch:Z

    if-eqz v6, :cond_4

    .line 472
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    if-eq v6, v7, :cond_2

    .line 473
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v6

    const/4 v7, 0x3

    if-ne v6, v7, :cond_3

    .line 475
    :cond_2
    iput-boolean v1, p0, Landroidx/wear/widget/CurvedTextView;->mHandlingTouch:Z

    .line 477
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    sub-float v1, v0, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    sub-float v6, v2, v6

    invoke-virtual {p1, v1, v6}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 478
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v1

    return v1

    .line 481
    :cond_4
    return v1
.end method

.method public setAnchorAngleDegrees(F)V
    .locals 0
    .param p1, "value"    # F

    .line 751
    iput p1, p0, Landroidx/wear/widget/CurvedTextView;->mAnchorAngleDegrees:F

    .line 752
    invoke-direct {p0}, Landroidx/wear/widget/CurvedTextView;->doRedraw()V

    .line 753
    return-void
.end method

.method public setAnchorType(I)V
    .locals 0
    .param p1, "value"    # I

    .line 738
    iput p1, p0, Landroidx/wear/widget/CurvedTextView;->mAnchorType:I

    .line 739
    invoke-direct {p0}, Landroidx/wear/widget/CurvedTextView;->doUpdate()V

    .line 740
    return-void
.end method

.method public setClockwise(Z)V
    .locals 0
    .param p1, "value"    # Z

    .line 834
    iput-boolean p1, p0, Landroidx/wear/widget/CurvedTextView;->mClockwise:Z

    .line 835
    invoke-direct {p0}, Landroidx/wear/widget/CurvedTextView;->doUpdate()V

    .line 836
    return-void
.end method

.method public setEllipsize(Landroid/text/TextUtils$TruncateAt;)V
    .locals 0
    .param p1, "value"    # Landroid/text/TextUtils$TruncateAt;

    .line 864
    iput-object p1, p0, Landroidx/wear/widget/CurvedTextView;->mEllipsize:Landroid/text/TextUtils$TruncateAt;

    .line 865
    invoke-direct {p0}, Landroidx/wear/widget/CurvedTextView;->doRedraw()V

    .line 866
    return-void
.end method

.method public setFontFeatureSettings(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .line 908
    iput-object p1, p0, Landroidx/wear/widget/CurvedTextView;->mFontFeatureSettings:Ljava/lang/String;

    .line 909
    invoke-direct {p0}, Landroidx/wear/widget/CurvedTextView;->doUpdate()V

    .line 910
    return-void
.end method

.method public setFontVariationSettings(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .line 925
    iput-object p1, p0, Landroidx/wear/widget/CurvedTextView;->mFontVariationSettings:Ljava/lang/String;

    .line 926
    invoke-direct {p0}, Landroidx/wear/widget/CurvedTextView;->doUpdate()V

    .line 927
    return-void
.end method

.method public setLetterSpacing(F)V
    .locals 0
    .param p1, "value"    # F

    .line 885
    iput p1, p0, Landroidx/wear/widget/CurvedTextView;->mLetterSpacing:F

    .line 886
    invoke-direct {p0}, Landroidx/wear/widget/CurvedTextView;->doUpdate()V

    .line 887
    return-void
.end method

.method public setSweepAngleDegrees(F)V
    .locals 0
    .param p1, "angleDegrees"    # F

    .line 214
    iput p1, p0, Landroidx/wear/widget/CurvedTextView;->mBackgroundSweepDegrees:F

    .line 215
    return-void
.end method

.method public setSweepRangeDegrees(FF)V
    .locals 2
    .param p1, "minSweep"    # F
    .param p2, "maxSweep"    # F

    .line 766
    cmpl-float v0, p1, p2

    if-gtz v0, :cond_0

    .line 771
    const/4 v0, 0x0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    const v1, 0x43b3f333    # 359.9f

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Landroidx/wear/widget/CurvedTextView;->mMinSweepDegrees:F

    .line 772
    invoke-static {p2, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Landroidx/wear/widget/CurvedTextView;->mMaxSweepDegrees:F

    .line 773
    invoke-direct {p0}, Landroidx/wear/widget/CurvedTextView;->doUpdate()V

    .line 774
    return-void

    .line 767
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "MaxSweepDegrees cannot be smaller than MinSweepDegrees"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setText(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .line 796
    if-nez p1, :cond_0

    const-string v0, ""

    goto :goto_0

    :cond_0
    move-object v0, p1

    :goto_0
    iput-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mText:Ljava/lang/String;

    .line 797
    invoke-direct {p0}, Landroidx/wear/widget/CurvedTextView;->doUpdate()V

    .line 798
    return-void
.end method

.method public setTextColor(I)V
    .locals 0
    .param p1, "value"    # I

    .line 846
    iput p1, p0, Landroidx/wear/widget/CurvedTextView;->mTextColor:I

    .line 847
    invoke-direct {p0}, Landroidx/wear/widget/CurvedTextView;->doRedraw()V

    .line 848
    return-void
.end method

.method public setTextSize(F)V
    .locals 2
    .param p1, "value"    # F

    .line 807
    iput p1, p0, Landroidx/wear/widget/CurvedTextView;->mTextSize:F

    .line 808
    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    iget v1, p0, Landroidx/wear/widget/CurvedTextView;->mTextSize:F

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 809
    invoke-direct {p0}, Landroidx/wear/widget/CurvedTextView;->doUpdate()V

    .line 810
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .locals 0
    .param p1, "value"    # Landroid/graphics/Typeface;

    .line 823
    iput-object p1, p0, Landroidx/wear/widget/CurvedTextView;->mTypeface:Landroid/graphics/Typeface;

    .line 824
    invoke-direct {p0}, Landroidx/wear/widget/CurvedTextView;->doUpdate()V

    .line 825
    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;I)V
    .locals 6
    .param p1, "tf"    # Landroid/graphics/Typeface;
    .param p2, "style"    # I

    .line 566
    const/4 v0, 0x0

    const/4 v1, 0x0

    if-lez p2, :cond_5

    .line 567
    if-nez p1, :cond_0

    .line 568
    invoke-static {p2}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    move-result-object p1

    goto :goto_0

    .line 570
    :cond_0
    invoke-static {p1, p2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object p1

    .line 572
    :goto_0
    iget-object v2, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v2}, Landroid/text/TextPaint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/graphics/Typeface;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 573
    iget-object v2, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v2, p1}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 574
    iput-object p1, p0, Landroidx/wear/widget/CurvedTextView;->mTypeface:Landroid/graphics/Typeface;

    .line 577
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/graphics/Typeface;->getStyle()I

    move-result v2

    goto :goto_1

    :cond_2
    move v2, v1

    .line 578
    .local v2, "typefaceStyle":I
    :goto_1
    not-int v3, v2

    and-int/2addr v3, p2

    .line 579
    .local v3, "need":I
    iget-object v4, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    and-int/lit8 v5, v3, 0x1

    if-eqz v5, :cond_3

    const/4 v1, 0x1

    :cond_3
    invoke-virtual {v4, v1}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 580
    iget-object v1, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    and-int/lit8 v4, v3, 0x2

    if-eqz v4, :cond_4

    const/high16 v0, -0x41800000    # -0.25f

    :cond_4
    invoke-virtual {v1, v0}, Landroid/text/TextPaint;->setTextSkewX(F)V

    .line 581
    .end local v2    # "typefaceStyle":I
    .end local v3    # "need":I
    goto :goto_2

    .line 582
    :cond_5
    iget-object v2, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v2, v1}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    .line 583
    iget-object v1, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v1, v0}, Landroid/text/TextPaint;->setTextSkewX(F)V

    .line 584
    if-eqz p1, :cond_6

    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/Typeface;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    :cond_6
    if-nez p1, :cond_8

    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    .line 585
    invoke-virtual {v0}, Landroid/text/TextPaint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v0

    if-eqz v0, :cond_8

    .line 586
    :cond_7
    iget-object v0, p0, Landroidx/wear/widget/CurvedTextView;->mPaint:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 587
    iput-object p1, p0, Landroidx/wear/widget/CurvedTextView;->mTypeface:Landroid/graphics/Typeface;

    .line 590
    :cond_8
    :goto_2
    invoke-direct {p0}, Landroidx/wear/widget/CurvedTextView;->doUpdate()V

    .line 591
    return-void
.end method
