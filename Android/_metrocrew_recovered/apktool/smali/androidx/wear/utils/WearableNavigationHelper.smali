.class public final Landroidx/wear/utils/WearableNavigationHelper;
.super Ljava/lang/Object;
.source "WearableNavigationHelper.java"


# static fields
.field private static final ITEM_NAME:Ljava/lang/String; = "config_windowSwipeToDismiss"

.field private static final ITEM_TYPE:Ljava/lang/String; = "bool"

.field private static final PACKAGE_NAME:Ljava/lang/String; = "android"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    return-void
.end method

.method public static isSwipeToDismissEnabled()Z
    .locals 4

    .line 44
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    .line 45
    .local v0, "res":Landroid/content/res/Resources;
    const-string v1, "bool"

    const-string v2, "android"

    const-string v3, "config_windowSwipeToDismiss"

    invoke-virtual {v0, v3, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 46
    .local v1, "identifier":I
    if-eqz v1, :cond_0

    .line 47
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    return v2

    .line 49
    :cond_0
    const/4 v2, 0x0

    return v2
.end method

.method public static isSwipeToDismissEnabled(Landroid/content/Context;)Z
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .line 57
    const v0, 0x10103f3

    filled-new-array {v0}, [I

    move-result-object v0

    .line 58
    invoke-virtual {p0, v0}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 59
    .local v0, "windowAttr":Landroid/content/res/TypedArray;
    const/4 v1, 0x0

    .line 60
    .local v1, "enabled":Z
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v2

    if-lez v2, :cond_0

    .line 61
    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    .line 63
    :cond_0
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 64
    return v1
.end method
