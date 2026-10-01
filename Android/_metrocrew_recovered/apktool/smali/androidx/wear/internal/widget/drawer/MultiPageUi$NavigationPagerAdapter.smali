.class final Landroidx/wear/internal/widget/drawer/MultiPageUi$NavigationPagerAdapter;
.super Landroidx/viewpager/widget/PagerAdapter;
.source "MultiPageUi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/internal/widget/drawer/MultiPageUi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NavigationPagerAdapter"
.end annotation


# instance fields
.field private final mAdapter:Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;


# direct methods
.method constructor <init>(Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;)V
    .locals 0
    .param p1, "adapter"    # Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;

    .line 128
    invoke-direct {p0}, Landroidx/viewpager/widget/PagerAdapter;-><init>()V

    .line 129
    iput-object p1, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi$NavigationPagerAdapter;->mAdapter:Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;

    .line 130
    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 1
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I
    .param p3, "object"    # Ljava/lang/Object;

    .line 153
    move-object v0, p3

    check-cast v0, Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 154
    return-void
.end method

.method public getCount()I
    .locals 1

    .line 158
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi$NavigationPagerAdapter;->mAdapter:Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .line 163
    const/4 v0, -0x2

    return v0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 4
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I

    .line 137
    nop

    .line 138
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Landroidx/wear/R$layout;->ws_navigation_drawer_item_view:I

    .line 139
    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 140
    .local v0, "view":Landroid/view/View;
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 141
    sget v1, Landroidx/wear/R$id;->ws_navigation_drawer_item_icon:I

    .line 142
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 143
    .local v1, "iconView":Landroid/widget/ImageView;
    sget v2, Landroidx/wear/R$id;->ws_navigation_drawer_item_text:I

    .line 144
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 145
    .local v2, "textView":Landroid/widget/TextView;
    iget-object v3, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi$NavigationPagerAdapter;->mAdapter:Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;

    invoke-virtual {v3, p2}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;->getItemDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 146
    iget-object v3, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi$NavigationPagerAdapter;->mAdapter:Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;

    invoke-virtual {v3, p2}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;->getItemText(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 147
    return-object v0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "object"    # Ljava/lang/Object;

    .line 168
    if-ne p1, p2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
