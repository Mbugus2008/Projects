.class public Landroidx/wear/internal/widget/drawer/MultiPagePresenter;
.super Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;
.source "MultiPagePresenter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/internal/widget/drawer/MultiPagePresenter$Ui;
    }
.end annotation


# instance fields
.field private mAdapter:Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;

.field private final mDrawer:Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

.field private final mIsAccessibilityEnabled:Z

.field private final mUi:Landroidx/wear/internal/widget/drawer/MultiPagePresenter$Ui;


# direct methods
.method public constructor <init>(Landroidx/wear/widget/drawer/WearableNavigationDrawerView;Landroidx/wear/internal/widget/drawer/MultiPagePresenter$Ui;Z)V
    .locals 2
    .param p1, "drawer"    # Landroidx/wear/widget/drawer/WearableNavigationDrawerView;
    .param p2, "ui"    # Landroidx/wear/internal/widget/drawer/MultiPagePresenter$Ui;
    .param p3, "isAccessibilityEnabled"    # Z

    .line 71
    invoke-direct {p0}, Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;-><init>()V

    .line 72
    if-eqz p1, :cond_1

    .line 75
    if-eqz p2, :cond_0

    .line 78
    iput-object p1, p0, Landroidx/wear/internal/widget/drawer/MultiPagePresenter;->mDrawer:Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

    .line 79
    iput-object p2, p0, Landroidx/wear/internal/widget/drawer/MultiPagePresenter;->mUi:Landroidx/wear/internal/widget/drawer/MultiPagePresenter$Ui;

    .line 80
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/MultiPagePresenter;->mUi:Landroidx/wear/internal/widget/drawer/MultiPagePresenter$Ui;

    invoke-interface {v0, p1, p0}, Landroidx/wear/internal/widget/drawer/MultiPagePresenter$Ui;->initialize(Landroidx/wear/widget/drawer/WearableNavigationDrawerView;Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;)V

    .line 81
    iput-boolean p3, p0, Landroidx/wear/internal/widget/drawer/MultiPagePresenter;->mIsAccessibilityEnabled:Z

    .line 82
    return-void

    .line 76
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Received null ui."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 73
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Received null drawer."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public onDataSetChanged()V
    .locals 1

    .line 86
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/MultiPagePresenter;->mUi:Landroidx/wear/internal/widget/drawer/MultiPagePresenter$Ui;

    invoke-interface {v0}, Landroidx/wear/internal/widget/drawer/MultiPagePresenter$Ui;->notifyNavigationPagerAdapterDataChanged()V

    .line 87
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/MultiPagePresenter;->mUi:Landroidx/wear/internal/widget/drawer/MultiPagePresenter$Ui;

    invoke-interface {v0}, Landroidx/wear/internal/widget/drawer/MultiPagePresenter$Ui;->notifyPageIndicatorDataChanged()V

    .line 88
    return-void
.end method

.method public onDrawerTapped()Z
    .locals 1

    .line 112
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/MultiPagePresenter;->mDrawer:Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->isOpened()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 113
    iget-boolean v0, p0, Landroidx/wear/internal/widget/drawer/MultiPagePresenter;->mIsAccessibilityEnabled:Z

    if-eqz v0, :cond_0

    .line 116
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/MultiPagePresenter;->mDrawer:Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->getController()Landroidx/wear/widget/drawer/WearableDrawerController;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerController;->peekDrawer()V

    goto :goto_0

    .line 118
    :cond_0
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/MultiPagePresenter;->mDrawer:Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->getController()Landroidx/wear/widget/drawer/WearableDrawerController;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerController;->closeDrawer()V

    .line 120
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 122
    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method public onNewAdapter(Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;)V
    .locals 2
    .param p1, "adapter"    # Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;

    .line 92
    if-eqz p1, :cond_0

    .line 95
    iput-object p1, p0, Landroidx/wear/internal/widget/drawer/MultiPagePresenter;->mAdapter:Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;

    .line 96
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/MultiPagePresenter;->mAdapter:Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;

    invoke-virtual {v0, p0}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;->setPresenter(Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;)V

    .line 97
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/MultiPagePresenter;->mUi:Landroidx/wear/internal/widget/drawer/MultiPagePresenter$Ui;

    invoke-interface {v0, p1}, Landroidx/wear/internal/widget/drawer/MultiPagePresenter$Ui;->setNavigationPagerAdapter(Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;)V

    .line 98
    return-void

    .line 93
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Received null adapter."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onSelected(I)V
    .locals 0
    .param p1, "index"    # I

    .line 102
    invoke-virtual {p0, p1}, Landroidx/wear/internal/widget/drawer/MultiPagePresenter;->notifyItemSelectedListeners(I)V

    .line 103
    return-void
.end method

.method public onSetCurrentItemRequested(IZ)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "smoothScrollTo"    # Z

    .line 107
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/MultiPagePresenter;->mUi:Landroidx/wear/internal/widget/drawer/MultiPagePresenter$Ui;

    invoke-interface {v0, p1, p2}, Landroidx/wear/internal/widget/drawer/MultiPagePresenter$Ui;->setNavigationPagerSelectedItem(IZ)V

    .line 108
    return-void
.end method
