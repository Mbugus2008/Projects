.class public final Lcom/facebook/stetho/common/android/FragmentCompatUtil;
.super Ljava/lang/Object;
.source "FragmentCompatUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    return-void
.end method

.method public static findFragmentForView(Landroid/view/View;)Ljava/lang/Object;
    .locals 2
    .param p0, "view"    # Landroid/view/View;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 39
    invoke-static {p0}, Lcom/facebook/stetho/common/android/ViewUtil;->tryGetActivity(Landroid/view/View;)Landroid/app/Activity;

    move-result-object v0

    .line 40
    .local v0, "activity":Landroid/app/Activity;
    if-nez v0, :cond_0

    .line 41
    const/4 v1, 0x0

    return-object v1

    .line 44
    :cond_0
    invoke-static {v0, p0}, Lcom/facebook/stetho/common/android/FragmentCompatUtil;->findFragmentForViewInActivity(Landroid/app/Activity;Landroid/view/View;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method private static findFragmentForViewInActivity(Landroid/app/Activity;Landroid/view/View;)Ljava/lang/Object;
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "view"    # Landroid/view/View;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 49
    invoke-static {}, Lcom/facebook/stetho/common/android/FragmentCompat;->getSupportLibInstance()Lcom/facebook/stetho/common/android/FragmentCompat;

    move-result-object v0

    .line 52
    .local v0, "supportLib":Lcom/facebook/stetho/common/android/FragmentCompat;
    if-eqz v0, :cond_0

    .line 53
    invoke-virtual {v0}, Lcom/facebook/stetho/common/android/FragmentCompat;->getFragmentActivityClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 54
    invoke-static {v0, p0, p1}, Lcom/facebook/stetho/common/android/FragmentCompatUtil;->findFragmentForViewInActivity(Lcom/facebook/stetho/common/android/FragmentCompat;Landroid/app/Activity;Landroid/view/View;)Ljava/lang/Object;

    move-result-object v1

    .line 55
    .local v1, "fragment":Ljava/lang/Object;
    if-eqz v1, :cond_0

    .line 56
    return-object v1

    .line 64
    .end local v1    # "fragment":Ljava/lang/Object;
    :cond_0
    invoke-static {}, Lcom/facebook/stetho/common/android/FragmentCompat;->getFrameworkInstance()Lcom/facebook/stetho/common/android/FragmentCompat;

    move-result-object v1

    .line 65
    .local v1, "framework":Lcom/facebook/stetho/common/android/FragmentCompat;
    if-eqz v1, :cond_1

    .line 66
    invoke-static {v1, p0, p1}, Lcom/facebook/stetho/common/android/FragmentCompatUtil;->findFragmentForViewInActivity(Lcom/facebook/stetho/common/android/FragmentCompat;Landroid/app/Activity;Landroid/view/View;)Ljava/lang/Object;

    move-result-object v2

    .line 67
    .local v2, "fragment":Ljava/lang/Object;
    if-eqz v2, :cond_1

    .line 68
    return-object v2

    .line 72
    .end local v2    # "fragment":Ljava/lang/Object;
    :cond_1
    const/4 v2, 0x0

    return-object v2
.end method

.method private static findFragmentForViewInActivity(Lcom/facebook/stetho/common/android/FragmentCompat;Landroid/app/Activity;Landroid/view/View;)Ljava/lang/Object;
    .locals 2
    .param p0, "compat"    # Lcom/facebook/stetho/common/android/FragmentCompat;
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "view"    # Landroid/view/View;

    .line 79
    invoke-virtual {p0}, Lcom/facebook/stetho/common/android/FragmentCompat;->forFragmentActivity()Lcom/facebook/stetho/common/android/FragmentActivityAccessor;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/facebook/stetho/common/android/FragmentActivityAccessor;->getFragmentManager(Landroid/app/Activity;)Ljava/lang/Object;

    move-result-object v0

    .line 80
    .local v0, "fragmentManager":Ljava/lang/Object;
    if-eqz v0, :cond_0

    .line 81
    invoke-static {p0, v0, p2}, Lcom/facebook/stetho/common/android/FragmentCompatUtil;->findFragmentForViewInFragmentManager(Lcom/facebook/stetho/common/android/FragmentCompat;Ljava/lang/Object;Landroid/view/View;)Ljava/lang/Object;

    move-result-object v1

    return-object v1

    .line 83
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method private static findFragmentForViewInFragment(Lcom/facebook/stetho/common/android/FragmentCompat;Ljava/lang/Object;Landroid/view/View;)Ljava/lang/Object;
    .locals 3
    .param p0, "compat"    # Lcom/facebook/stetho/common/android/FragmentCompat;
    .param p1, "fragment"    # Ljava/lang/Object;
    .param p2, "view"    # Landroid/view/View;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 112
    invoke-virtual {p0}, Lcom/facebook/stetho/common/android/FragmentCompat;->forFragment()Lcom/facebook/stetho/common/android/FragmentAccessor;

    move-result-object v0

    .line 114
    .local v0, "accessor":Lcom/facebook/stetho/common/android/FragmentAccessor;
    invoke-interface {v0, p1}, Lcom/facebook/stetho/common/android/FragmentAccessor;->getView(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    if-ne v1, p2, :cond_0

    .line 115
    return-object p1

    .line 118
    :cond_0
    invoke-interface {v0, p1}, Lcom/facebook/stetho/common/android/FragmentAccessor;->getChildFragmentManager(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 119
    .local v1, "childFragmentManager":Ljava/lang/Object;
    if-eqz v1, :cond_1

    .line 120
    invoke-static {p0, v1, p2}, Lcom/facebook/stetho/common/android/FragmentCompatUtil;->findFragmentForViewInFragmentManager(Lcom/facebook/stetho/common/android/FragmentCompat;Ljava/lang/Object;Landroid/view/View;)Ljava/lang/Object;

    move-result-object v2

    return-object v2

    .line 123
    :cond_1
    const/4 v2, 0x0

    return-object v2
.end method

.method private static findFragmentForViewInFragmentManager(Lcom/facebook/stetho/common/android/FragmentCompat;Ljava/lang/Object;Landroid/view/View;)Ljava/lang/Object;
    .locals 5
    .param p0, "compat"    # Lcom/facebook/stetho/common/android/FragmentCompat;
    .param p1, "fragmentManager"    # Ljava/lang/Object;
    .param p2, "view"    # Landroid/view/View;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 92
    invoke-virtual {p0}, Lcom/facebook/stetho/common/android/FragmentCompat;->forFragmentManager()Lcom/facebook/stetho/common/android/FragmentManagerAccessor;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/facebook/stetho/common/android/FragmentManagerAccessor;->getAddedFragments(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 94
    .local v0, "fragments":Ljava/util/List;, "Ljava/util/List<*>;"
    if-eqz v0, :cond_1

    .line 95
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    .local v2, "N":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 96
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 97
    .local v3, "fragment":Ljava/lang/Object;
    invoke-static {p0, v3, p2}, Lcom/facebook/stetho/common/android/FragmentCompatUtil;->findFragmentForViewInFragment(Lcom/facebook/stetho/common/android/FragmentCompat;Ljava/lang/Object;Landroid/view/View;)Ljava/lang/Object;

    move-result-object v4

    .line 98
    .local v4, "result":Ljava/lang/Object;
    if-eqz v4, :cond_0

    .line 99
    return-object v4

    .line 95
    .end local v3    # "fragment":Ljava/lang/Object;
    .end local v4    # "result":Ljava/lang/Object;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 104
    .end local v1    # "i":I
    .end local v2    # "N":I
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method

.method public static isDialogFragment(Ljava/lang/Object;)Z
    .locals 4
    .param p0, "fragment"    # Ljava/lang/Object;

    .line 22
    invoke-static {}, Lcom/facebook/stetho/common/android/FragmentCompat;->getSupportLibInstance()Lcom/facebook/stetho/common/android/FragmentCompat;

    move-result-object v0

    .line 23
    .local v0, "supportLib":Lcom/facebook/stetho/common/android/FragmentCompat;
    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 24
    invoke-virtual {v0}, Lcom/facebook/stetho/common/android/FragmentCompat;->getDialogFragmentClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 25
    return v1

    .line 28
    :cond_0
    invoke-static {}, Lcom/facebook/stetho/common/android/FragmentCompat;->getFrameworkInstance()Lcom/facebook/stetho/common/android/FragmentCompat;

    move-result-object v2

    .line 29
    .local v2, "framework":Lcom/facebook/stetho/common/android/FragmentCompat;
    if-eqz v2, :cond_1

    .line 30
    invoke-virtual {v2}, Lcom/facebook/stetho/common/android/FragmentCompat;->getDialogFragmentClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 31
    return v1

    .line 34
    :cond_1
    const/4 v1, 0x0

    return v1
.end method
