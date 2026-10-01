.class public abstract Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;
.super Ljava/lang/Object;
.source "WearableNavigationDrawerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/drawer/WearableNavigationDrawerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "WearableNavigationDrawerAdapter"
.end annotation


# instance fields
.field private mPresenter:Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 249
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract getCount()I
.end method

.method public abstract getItemDrawable(I)Landroid/graphics/drawable/Drawable;
.end method

.method public abstract getItemText(I)Ljava/lang/CharSequence;
.end method

.method public notifyDataSetChanged()V
    .locals 2

    .line 276
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;->mPresenter:Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;

    if-eqz v0, :cond_0

    .line 277
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;->mPresenter:Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;

    invoke-virtual {v0}, Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;->onDataSetChanged()V

    goto :goto_0

    .line 279
    :cond_0
    const-string v0, "WearableNavDrawer"

    const-string v1, "adapter.notifyDataSetChanged called before drawer.setAdapter; ignoring."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 282
    :goto_0
    return-void
.end method

.method public setPresenter(Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;)V
    .locals 0
    .param p1, "presenter"    # Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;

    .line 288
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;->mPresenter:Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;

    .line 289
    return-void
.end method
