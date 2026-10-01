.class Landroidx/wear/internal/widget/drawer/MultiPageUi$1;
.super Landroidx/viewpager/widget/ViewPager$SimpleOnPageChangeListener;
.source "MultiPageUi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/wear/internal/widget/drawer/MultiPageUi;->setNavigationPagerAdapter(Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/wear/internal/widget/drawer/MultiPageUi;


# direct methods
.method constructor <init>(Landroidx/wear/internal/widget/drawer/MultiPageUi;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/wear/internal/widget/drawer/MultiPageUi;

    .line 86
    iput-object p1, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi$1;->this$0:Landroidx/wear/internal/widget/drawer/MultiPageUi;

    invoke-direct {p0}, Landroidx/viewpager/widget/ViewPager$SimpleOnPageChangeListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageSelected(I)V
    .locals 1
    .param p1, "position"    # I

    .line 89
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/MultiPageUi$1;->this$0:Landroidx/wear/internal/widget/drawer/MultiPageUi;

    iget-object v0, v0, Landroidx/wear/internal/widget/drawer/MultiPageUi;->mPresenter:Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;

    invoke-virtual {v0, p1}, Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;->onSelected(I)V

    .line 90
    return-void
.end method
