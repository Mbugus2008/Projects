.class Landroidx/wear/widget/drawer/RecyclerViewFlingWatcher;
.super Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;
.source "RecyclerViewFlingWatcher.java"

# interfaces
.implements Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingWatcher;


# instance fields
.field private final mListener:Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;

.field private final mRecyclerView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroidx/recyclerview/widget/RecyclerView;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 1
    .param p1, "listener"    # Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;
    .param p2, "view"    # Landroidx/recyclerview/widget/RecyclerView;

    .line 39
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;-><init>()V

    .line 40
    iput-object p1, p0, Landroidx/wear/widget/drawer/RecyclerViewFlingWatcher;->mListener:Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;

    .line 41
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/wear/widget/drawer/RecyclerViewFlingWatcher;->mRecyclerView:Ljava/lang/ref/WeakReference;

    .line 42
    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 1
    .param p1, "recyclerView"    # Landroidx/recyclerview/widget/RecyclerView;
    .param p2, "newState"    # I

    .line 54
    if-nez p2, :cond_0

    .line 55
    iget-object v0, p0, Landroidx/wear/widget/drawer/RecyclerViewFlingWatcher;->mListener:Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;

    invoke-interface {v0, p1}, Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;->onFlingComplete(Landroid/view/View;)V

    .line 56
    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->removeOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    .line 58
    :cond_0
    return-void
.end method

.method public watch()V
    .locals 1

    .line 46
    iget-object v0, p0, Landroidx/wear/widget/drawer/RecyclerViewFlingWatcher;->mRecyclerView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 47
    .local v0, "recyclerView":Landroidx/recyclerview/widget/RecyclerView;
    if-eqz v0, :cond_0

    .line 48
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;)V

    .line 50
    :cond_0
    return-void
.end method
