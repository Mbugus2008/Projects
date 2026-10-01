.class final Lcom/facebook/stetho/common/android/ViewUtil;
.super Ljava/lang/Object;
.source "ViewUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    return-void
.end method

.method private static tryGetActivity(Landroid/content/Context;)Landroid/app/Activity;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 46
    nop

    :goto_0
    const/4 v0, 0x0

    if-eqz p0, :cond_2

    .line 47
    instance-of v1, p0, Landroid/app/Activity;

    if-eqz v1, :cond_0

    .line 48
    move-object v0, p0

    check-cast v0, Landroid/app/Activity;

    return-object v0

    .line 49
    :cond_0
    instance-of v1, p0, Landroid/content/ContextWrapper;

    if-eqz v1, :cond_1

    .line 50
    move-object v0, p0

    check-cast v0, Landroid/content/ContextWrapper;

    invoke-virtual {v0}, Landroid/content/ContextWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p0

    goto :goto_0

    .line 52
    :cond_1
    return-object v0

    .line 56
    :cond_2
    return-object v0
.end method

.method static tryGetActivity(Landroid/view/View;)Landroid/app/Activity;
    .locals 5
    .param p0, "view"    # Landroid/view/View;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 24
    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 25
    return-object v0

    .line 28
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 30
    .local v1, "context":Landroid/content/Context;
    invoke-static {v1}, Lcom/facebook/stetho/common/android/ViewUtil;->tryGetActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v2

    .line 31
    .local v2, "activityFromContext":Landroid/app/Activity;
    if-eqz v2, :cond_1

    .line 32
    return-object v2

    .line 35
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    .line 36
    .local v3, "parent":Landroid/view/ViewParent;
    instance-of v4, v3, Landroid/view/View;

    if-eqz v4, :cond_2

    .line 37
    move-object v0, v3

    check-cast v0, Landroid/view/View;

    .line 38
    .local v0, "parentView":Landroid/view/View;
    invoke-static {v0}, Lcom/facebook/stetho/common/android/ViewUtil;->tryGetActivity(Landroid/view/View;)Landroid/app/Activity;

    move-result-object v4

    return-object v4

    .line 41
    .end local v0    # "parentView":Landroid/view/View;
    :cond_2
    return-object v0
.end method
