.class Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;
.super Ljava/lang/Object;
.source "CurvedTextView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/CurvedTextView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TextAppearanceAttributes"
.end annotation


# instance fields
.field mFontFamily:Ljava/lang/String;

.field mFontFamilyExplicit:Z

.field mFontFeatureSettings:Ljava/lang/String;

.field mFontVariationSettings:Ljava/lang/String;

.field mFontWeight:I

.field mLetterSpacing:F

.field mTextColor:Landroid/content/res/ColorStateList;

.field mTextSize:F

.field mTextStyle:I

.field mTypefaceIndex:I


# direct methods
.method constructor <init>()V
    .locals 3

    .line 612
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 597
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mTextColor:Landroid/content/res/ColorStateList;

    .line 599
    const/high16 v1, 0x41c00000    # 24.0f

    iput v1, p0, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mTextSize:F

    .line 600
    iput-object v0, p0, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mFontFamily:Ljava/lang/String;

    .line 602
    const/4 v1, 0x0

    iput-boolean v1, p0, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mFontFamilyExplicit:Z

    .line 603
    const/4 v2, -0x1

    iput v2, p0, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mTypefaceIndex:I

    .line 604
    iput v1, p0, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mTextStyle:I

    .line 605
    iput v2, p0, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mFontWeight:I

    .line 606
    const/4 v1, 0x0

    iput v1, p0, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mLetterSpacing:F

    .line 607
    iput-object v0, p0, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mFontFeatureSettings:Ljava/lang/String;

    .line 609
    iput-object v0, p0, Landroidx/wear/widget/CurvedTextView$TextAppearanceAttributes;->mFontVariationSettings:Ljava/lang/String;

    .line 613
    return-void
.end method
