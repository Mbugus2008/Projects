.class public final Lcom/facebook/stetho/common/android/ViewGroupUtil;
.super Ljava/lang/Object;
.source "ViewGroupUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    return-void
.end method

.method public static findChildIndex(Landroid/view/ViewGroup;Landroid/view/View;)I
    .locals 3
    .param p0, "parent"    # Landroid/view/ViewGroup;
    .param p1, "child"    # Landroid/view/View;

    .line 18
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .line 19
    .local v0, "count":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 20
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    if-ne v2, p1, :cond_0

    .line 21
    return v1

    .line 19
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 24
    .end local v1    # "i":I
    :cond_1
    const/4 v1, -0x1

    return v1
.end method
