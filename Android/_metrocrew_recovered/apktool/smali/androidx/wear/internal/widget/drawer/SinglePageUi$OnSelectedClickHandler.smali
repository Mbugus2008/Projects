.class Landroidx/wear/internal/widget/drawer/SinglePageUi$OnSelectedClickHandler;
.super Ljava/lang/Object;
.source "SinglePageUi.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/internal/widget/drawer/SinglePageUi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OnSelectedClickHandler"
.end annotation


# instance fields
.field private final mIndex:I

.field private final mPresenter:Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;


# direct methods
.method constructor <init>(ILandroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;)V
    .locals 0
    .param p1, "index"    # I
    .param p2, "presenter"    # Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;

    .line 173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 174
    iput p1, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi$OnSelectedClickHandler;->mIndex:I

    .line 175
    iput-object p2, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi$OnSelectedClickHandler;->mPresenter:Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;

    .line 176
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .line 180
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi$OnSelectedClickHandler;->mPresenter:Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;

    iget v1, p0, Landroidx/wear/internal/widget/drawer/SinglePageUi$OnSelectedClickHandler;->mIndex:I

    invoke-virtual {v0, v1}, Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;->onSelected(I)V

    .line 181
    return-void
.end method
