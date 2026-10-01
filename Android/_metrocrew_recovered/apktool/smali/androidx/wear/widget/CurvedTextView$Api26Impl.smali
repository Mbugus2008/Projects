.class Landroidx/wear/widget/CurvedTextView$Api26Impl;
.super Ljava/lang/Object;
.source "CurvedTextView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/CurvedTextView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Api26Impl"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 946
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 947
    return-void
.end method

.method static paintSetFontVariationSettings(Landroid/graphics/Paint;Ljava/lang/String;)V
    .locals 0
    .param p0, "paint"    # Landroid/graphics/Paint;
    .param p1, "fontVariationSettings"    # Ljava/lang/String;

    .line 952
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setFontVariationSettings(Ljava/lang/String;)Z

    .line 953
    return-void
.end method
