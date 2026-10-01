.class public Landroidx/wear/internal/widget/drawer/SinglePageUi;
.super Ljava/lang/Object;
.source "SinglePageUi.java"

# interfaces
.implements Landroidx/wear/internal/widget/drawer/SinglePagePresenter$Ui;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/internal/widget/drawer/SinglePageUi$OnSelectedClickHandler;
    }
.end annotation


# static fields
.field private static final SINGLE_PAGE_BUTTON_IDS:[I

.field private static final SINGLE_PAGE_LAYOUT_RES:[I


# instance fields
.field private final mCloseDrawerRunnable:Ljava/lang/Runnable;

.field final mDrawer:Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

.field private final mMainThreadHandler:Landroid/os/Handler;

.field private mPresenter:Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;

.field private mSinglePageImageViews:[Landroidx/wear/widget/CircledImageView;

.field private mTextView:Landroid/widget/TextView;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 45
    sget v0, Landroidx/wear/R$id;->ws_nav_drawer_icon_0:I

    sget v1, Landroidx/wear/R$id;->ws_nav_drawer_icon_1:I

    sget v2, Landroidx/wear/R$id;->ws_nav_drawer_icon_2:I

    sget v3, Landroidx/wear/R$id;->ws_nav_drawer_icon_3:I

    sget v4, Landroidx/wear/R$id;->ws_nav_drawer_icon_4:I

    sget v5, Landroidx/wear/R$id;->ws_nav_drawer_icon_5:I

    sget v6, Landroidx/wear/R$id;->ws_nav_drawer_icon_6:I

    filled-new-array/range {v0 .. v6}, [I

    move-result-object v0

    sput-object v0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->SINGLE_PAGE_BUTTON_IDS:[I

    .line 57
    sget v2, Landroidx/wear/R$layout;->ws_single_page_nav_drawer_1_item:I

    sget v3, Landroidx/wear/R$layout;->ws_single_page_nav_drawer_2_item:I

    sget v4, Landroidx/wear/R$layout;->ws_single_page_nav_drawer_3_item:I

    sget v5, Landroidx/wear/R$layout;->ws_single_page_nav_drawer_4_item:I

    sget v6, Landroidx/wear/R$layout;->ws_single_page_nav_drawer_5_item:I

    sget v7, Landroidx/wear/R$layout;->ws_single_page_nav_drawer_6_item:I

    sget v8, Landroidx/wear/R$layout;->ws_single_page_nav_drawer_7_item:I

    const/4 v1, 0x0

    filled-new-array/range {v1 .. v8}, [I

    move-result-object v0

    sput-object v0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->SINGLE_PAGE_LAYOUT_RES:[I

    return-void
.end method

.method public constructor <init>(Landroidx/wear/widget/drawer/WearableNavigationDrawerView;)V
    .locals 2
    .param p1, "navigationDrawer"    # Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mMainThreadHandler:Landroid/os/Handler;

    .line 72
    new-instance v0, Landroidx/wear/internal/widget/drawer/SinglePageUi$1;

    invoke-direct {v0, p0}, Landroidx/wear/internal/widget/drawer/SinglePageUi$1;-><init>(Landroidx/wear/internal/widget/drawer/SinglePageUi;)V

    iput-object v0, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mCloseDrawerRunnable:Ljava/lang/Runnable;

    .line 88
    if-eqz p1, :cond_0

    .line 91
    iput-object p1, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mDrawer:Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

    .line 92
    return-void

    .line 89
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Received null navigationDrawer."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public closeDrawerDelayed(J)V
    .locals 2
    .param p1, "delayMs"    # J

    .line 156
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mMainThreadHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mCloseDrawerRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 157
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mMainThreadHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mCloseDrawerRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 158
    return-void
.end method

.method public deselectItem(I)V
    .locals 2
    .param p1, "index"    # I

    .line 151
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mSinglePageImageViews:[Landroidx/wear/widget/CircledImageView;

    aget-object v0, v0, p1

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/wear/widget/CircledImageView;->setCircleHidden(Z)V

    .line 152
    return-void
.end method

.method public initialize(I)V
    .locals 8
    .param p1, "count"    # I

    .line 101
    if-ltz p1, :cond_2

    sget-object v0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->SINGLE_PAGE_LAYOUT_RES:[I

    array-length v0, v0

    if-ge p1, v0, :cond_2

    sget-object v0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->SINGLE_PAGE_LAYOUT_RES:[I

    aget v0, v0, p1

    if-nez v0, :cond_0

    goto :goto_1

    .line 107
    :cond_0
    sget-object v0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->SINGLE_PAGE_LAYOUT_RES:[I

    aget v0, v0, p1

    .line 108
    .local v0, "layoutRes":I
    iget-object v1, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mDrawer:Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

    invoke-virtual {v1}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    .line 109
    .local v1, "inflater":Landroid/view/LayoutInflater;
    iget-object v2, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mDrawer:Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    .line 110
    .local v2, "content":Landroid/view/View;
    sget v4, Landroidx/wear/R$layout;->ws_single_page_nav_drawer_peek_view:I

    iget-object v5, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mDrawer:Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

    .line 111
    invoke-virtual {v1, v4, v5, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    .line 115
    .local v3, "peek":Landroid/view/View;
    sget v4, Landroidx/wear/R$id;->ws_nav_drawer_text:I

    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    iput-object v4, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mTextView:Landroid/widget/TextView;

    .line 116
    new-array v4, p1, [Landroidx/wear/widget/CircledImageView;

    iput-object v4, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mSinglePageImageViews:[Landroidx/wear/widget/CircledImageView;

    .line 117
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    if-ge v4, p1, :cond_1

    .line 118
    iget-object v5, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mSinglePageImageViews:[Landroidx/wear/widget/CircledImageView;

    sget-object v6, Landroidx/wear/internal/widget/drawer/SinglePageUi;->SINGLE_PAGE_BUTTON_IDS:[I

    aget v6, v6, v4

    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroidx/wear/widget/CircledImageView;

    aput-object v6, v5, v4

    .line 119
    iget-object v5, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mSinglePageImageViews:[Landroidx/wear/widget/CircledImageView;

    aget-object v5, v5, v4

    new-instance v6, Landroidx/wear/internal/widget/drawer/SinglePageUi$OnSelectedClickHandler;

    iget-object v7, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mPresenter:Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;

    invoke-direct {v6, v4, v7}, Landroidx/wear/internal/widget/drawer/SinglePageUi$OnSelectedClickHandler;-><init>(ILandroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;)V

    invoke-virtual {v5, v6}, Landroidx/wear/widget/CircledImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 120
    iget-object v5, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mSinglePageImageViews:[Landroidx/wear/widget/CircledImageView;

    aget-object v5, v5, v4

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroidx/wear/widget/CircledImageView;->setCircleHidden(Z)V

    .line 117
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 123
    .end local v4    # "i":I
    :cond_1
    iget-object v4, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mDrawer:Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

    invoke-virtual {v4, v2}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->setDrawerContent(Landroid/view/View;)V

    .line 124
    iget-object v4, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mDrawer:Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

    invoke-virtual {v4, v3}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->setPeekContent(Landroid/view/View;)V

    .line 125
    return-void

    .line 103
    .end local v0    # "layoutRes":I
    .end local v1    # "inflater":Landroid/view/LayoutInflater;
    .end local v2    # "content":Landroid/view/View;
    .end local v3    # "peek":Landroid/view/View;
    :cond_2
    :goto_1
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mDrawer:Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->setDrawerContent(Landroid/view/View;)V

    .line 104
    return-void
.end method

.method public peekDrawer()V
    .locals 1

    .line 162
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mDrawer:Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->getController()Landroidx/wear/widget/drawer/WearableDrawerController;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerController;->peekDrawer()V

    .line 163
    return-void
.end method

.method public selectItem(I)V
    .locals 2
    .param p1, "index"    # I

    .line 146
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mSinglePageImageViews:[Landroidx/wear/widget/CircledImageView;

    aget-object v0, v0, p1

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/wear/widget/CircledImageView;->setCircleHidden(Z)V

    .line 147
    return-void
.end method

.method public setIcon(ILandroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p3, "contentDescription"    # Ljava/lang/CharSequence;

    .line 129
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mSinglePageImageViews:[Landroidx/wear/widget/CircledImageView;

    aget-object v0, v0, p1

    invoke-virtual {v0, p2}, Landroidx/wear/widget/CircledImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 130
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mSinglePageImageViews:[Landroidx/wear/widget/CircledImageView;

    aget-object v0, v0, p1

    invoke-virtual {v0, p3}, Landroidx/wear/widget/CircledImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 131
    return-void
.end method

.method public setPresenter(Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;)V
    .locals 0
    .param p1, "presenter"    # Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;

    .line 96
    iput-object p1, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mPresenter:Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;

    .line 97
    return-void
.end method

.method public setText(Ljava/lang/CharSequence;Z)V
    .locals 3
    .param p1, "itemText"    # Ljava/lang/CharSequence;
    .param p2, "showToastIfNoTextView"    # Z

    .line 135
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 136
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 137
    :cond_0
    if-eqz p2, :cond_1

    .line 138
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi;->mDrawer:Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 139
    .local v0, "toast":Landroid/widget/Toast;
    const/16 v2, 0x11

    invoke-virtual {v0, v2, v1, v1}, Landroid/widget/Toast;->setGravity(III)V

    .line 140
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 142
    .end local v0    # "toast":Landroid/widget/Toast;
    :cond_1
    :goto_0
    return-void
.end method
