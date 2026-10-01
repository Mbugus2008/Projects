.class Landroidx/wear/widget/CurvedTextView$Api28Impl;
.super Ljava/lang/Object;
.source "CurvedTextView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/CurvedTextView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Api28Impl"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 961
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 962
    return-void
.end method

.method static createTypeface(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;
    .locals 1
    .param p0, "family"    # Landroid/graphics/Typeface;
    .param p1, "weight"    # I
    .param p2, "italic"    # Z

    .line 965
    invoke-static {p0, p1, p2}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;IZ)Landroid/graphics/Typeface;

    move-result-object v0

    return-object v0
.end method
