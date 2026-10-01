.class public abstract Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;
.super Ljava/lang/Object;
.source "WearableNavigationDrawerPresenter.java"


# instance fields
.field private final mOnItemSelectedListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/wear/widget/drawer/WearableNavigationDrawerView$OnItemSelectedListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;->mOnItemSelectedListeners:Ljava/util/Set;

    return-void
.end method


# virtual methods
.method notifyItemSelectedListeners(I)V
    .locals 2
    .param p1, "selectedPos"    # I

    .line 90
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;->mOnItemSelectedListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/wear/widget/drawer/WearableNavigationDrawerView$OnItemSelectedListener;

    .line 91
    .local v1, "listener":Landroidx/wear/widget/drawer/WearableNavigationDrawerView$OnItemSelectedListener;
    invoke-interface {v1, p1}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView$OnItemSelectedListener;->onItemSelected(I)V

    .line 92
    .end local v1    # "listener":Landroidx/wear/widget/drawer/WearableNavigationDrawerView$OnItemSelectedListener;
    goto :goto_0

    .line 93
    :cond_0
    return-void
.end method

.method public abstract onDataSetChanged()V
.end method

.method public abstract onDrawerTapped()Z
.end method

.method public onItemSelectedListenerAdded(Landroidx/wear/widget/drawer/WearableNavigationDrawerView$OnItemSelectedListener;)V
    .locals 1
    .param p1, "listener"    # Landroidx/wear/widget/drawer/WearableNavigationDrawerView$OnItemSelectedListener;

    .line 74
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;->mOnItemSelectedListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 75
    return-void
.end method

.method public onItemSelectedListenerRemoved(Landroidx/wear/widget/drawer/WearableNavigationDrawerView$OnItemSelectedListener;)V
    .locals 1
    .param p1, "listener"    # Landroidx/wear/widget/drawer/WearableNavigationDrawerView$OnItemSelectedListener;

    .line 82
    iget-object v0, p0, Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;->mOnItemSelectedListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 83
    return-void
.end method

.method public abstract onNewAdapter(Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;)V
.end method

.method public abstract onSelected(I)V
.end method

.method public abstract onSetCurrentItemRequested(IZ)V
.end method
