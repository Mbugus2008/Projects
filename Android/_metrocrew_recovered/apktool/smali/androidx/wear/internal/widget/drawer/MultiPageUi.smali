.class public Landroidx/wear/internal/widget/drawer/MultiPageUi;
.super Ljava/lang/Object;
.source "MultiPageUi.java"

# interfaces
.implements Landroidx/wear/internal/widget/drawer/MultiPagePresenter$Ui;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/internal/widget/drawer/MultiPageUi$NavigationPagerAdapter;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "MultiPageUi"


# instance fields
.field private mNavigationPager:Landroidx/viewpager/widget/ViewPager;

.field private mPageIndicatorView:Landroidx/wear/widget/drawer/PageIndicatorView;

.field mPresenter:Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public initialize(Landroidx/wear/widget/drawer/WearableNavigationDrawerView;Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;)V
    .locals 3
    .param p1, "drawer"    # Landroidx/wear/widget/drawer/WearableNavigationDrawerView;
    .param p2, "presenter"    # Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;

    .line 55
    if-eqz p1, :cond_1

    .line 58
    if-eqz p2, :cond_0

    .line 61
    iput-object p2, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi;->mPresenter:Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;

    .line 63
    invoke-virtual {p1}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 64
    .local v0, "inflater":Landroid/view/LayoutInflater;
    sget v1, Landroidx/wear/R$layout;->ws_navigation_drawer_view:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    .line 67
    .local v1, "content":Landroid/view/View;
    sget v2, Landroidx/wear/R$id;->ws_navigation_drawer_view_pager:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/viewpager/widget/ViewPager;

    iput-object v2, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi;->mNavigationPager:Landroidx/viewpager/widget/ViewPager;

    .line 68
    sget v2, Landroidx/wear/R$id;->ws_navigation_drawer_page_indicator:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/wear/widget/drawer/PageIndicatorView;

    iput-object v2, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi;->mPageIndicatorView:Landroidx/wear/widget/drawer/PageIndicatorView;

    .line 70
    invoke-virtual {p1, v1}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->setDrawerContent(Landroid/view/View;)V

    .line 71
    return-void

    .line 59
    .end local v0    # "inflater":Landroid/view/LayoutInflater;
    .end local v1    # "content":Landroid/view/View;
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Received null presenter."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 56
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Received null drawer."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public notifyNavigationPagerAdapterDataChanged()V
    .locals 1

    .line 106
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi;->mNavigationPager:Landroidx/viewpager/widget/ViewPager;

    if-eqz v0, :cond_0

    .line 107
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi;->mNavigationPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object v0

    .line 108
    .local v0, "adapter":Landroidx/viewpager/widget/PagerAdapter;
    if-eqz v0, :cond_0

    .line 109
    invoke-virtual {v0}, Landroidx/viewpager/widget/PagerAdapter;->notifyDataSetChanged()V

    .line 112
    .end local v0    # "adapter":Landroidx/viewpager/widget/PagerAdapter;
    :cond_0
    return-void
.end method

.method public notifyPageIndicatorDataChanged()V
    .locals 1

    .line 99
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi;->mPageIndicatorView:Landroidx/wear/widget/drawer/PageIndicatorView;

    if-eqz v0, :cond_0

    .line 100
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi;->mPageIndicatorView:Landroidx/wear/widget/drawer/PageIndicatorView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/PageIndicatorView;->notifyDataSetChanged()V

    .line 102
    :cond_0
    return-void
.end method

.method public setNavigationPagerAdapter(Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;)V
    .locals 3
    .param p1, "adapter"    # Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;

    .line 75
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi;->mNavigationPager:Landroidx/viewpager/widget/ViewPager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi;->mPageIndicatorView:Landroidx/wear/widget/drawer/PageIndicatorView;

    if-nez v0, :cond_0

    goto :goto_0

    .line 80
    :cond_0
    new-instance v0, Landroidx/wear/internal/widget/drawer/MultiPageUi$NavigationPagerAdapter;

    invoke-direct {v0, p1}, Landroidx/wear/internal/widget/drawer/MultiPageUi$NavigationPagerAdapter;-><init>(Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;)V

    .line 81
    .local v0, "navigationPagerAdapter":Landroidx/wear/internal/widget/drawer/MultiPageUi$NavigationPagerAdapter;
    iget-object v1, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi;->mNavigationPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    .line 84
    iget-object v1, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi;->mNavigationPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->clearOnPageChangeListeners()V

    .line 85
    iget-object v1, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi;->mNavigationPager:Landroidx/viewpager/widget/ViewPager;

    new-instance v2, Landroidx/wear/internal/widget/drawer/MultiPageUi$1;

    invoke-direct {v2, p0}, Landroidx/wear/internal/widget/drawer/MultiPageUi$1;-><init>(Landroidx/wear/internal/widget/drawer/MultiPageUi;)V

    invoke-virtual {v1, v2}, Landroidx/viewpager/widget/ViewPager;->addOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;)V

    .line 94
    iget-object v1, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi;->mPageIndicatorView:Landroidx/wear/widget/drawer/PageIndicatorView;

    iget-object v2, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi;->mNavigationPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v1, v2}, Landroidx/wear/widget/drawer/PageIndicatorView;->setPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 95
    return-void

    .line 76
    .end local v0    # "navigationPagerAdapter":Landroidx/wear/internal/widget/drawer/MultiPageUi$NavigationPagerAdapter;
    :cond_1
    :goto_0
    const-string v0, "MultiPageUi"

    const-string/jumbo v1, "setNavigationPagerAdapter was called before initialize."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 77
    return-void
.end method

.method public setNavigationPagerSelectedItem(IZ)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "smoothScrollTo"    # Z

    .line 116
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi;->mNavigationPager:Landroidx/viewpager/widget/ViewPager;

    if-eqz v0, :cond_0

    .line 117
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi;->mNavigationPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0, p1, p2}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(IZ)V

    .line 119
    :cond_0
    return-void
.end method
