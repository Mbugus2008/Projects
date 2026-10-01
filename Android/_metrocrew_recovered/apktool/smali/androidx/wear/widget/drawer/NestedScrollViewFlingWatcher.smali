.class Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;
.super Ljava/lang/Object;
.source "NestedScrollViewFlingWatcher.java"

# interfaces
.implements Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingWatcher;
.implements Landroidx/core/widget/NestedScrollView$OnScrollChangeListener;


# static fields
.field static final MAX_WAIT_TIME_MS:I = 0x64


# instance fields
.field private final mListener:Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;

.field private final mMainThreadHandler:Landroid/os/Handler;

.field private final mNestedScrollView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroidx/core/widget/NestedScrollView;",
            ">;"
        }
    .end annotation
.end field

.field private final mNotifyListenerRunnable:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;Landroidx/core/widget/NestedScrollView;)V
    .locals 2
    .param p1, "listener"    # Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;
    .param p2, "nestedScrollView"    # Landroidx/core/widget/NestedScrollView;

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;->mMainThreadHandler:Landroid/os/Handler;

    .line 48
    new-instance v0, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher$1;

    invoke-direct {v0, p0}, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher$1;-><init>(Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;)V

    iput-object v0, p0, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;->mNotifyListenerRunnable:Ljava/lang/Runnable;

    .line 56
    iput-object p1, p0, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;->mListener:Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;

    .line 57
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;->mNestedScrollView:Ljava/lang/ref/WeakReference;

    .line 58
    return-void
.end method

.method private static isViewAtTopOrBottom(Landroid/view/View;)Z
    .locals 2
    .param p0, "view"    # Landroid/view/View;

    .line 61
    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {p0, v1}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1
.end method

.method private scheduleNext()V
    .locals 4

    .line 94
    iget-object v0, p0, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;->mMainThreadHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;->mNotifyListenerRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 95
    iget-object v0, p0, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;->mMainThreadHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;->mNotifyListenerRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 96
    return-void
.end method


# virtual methods
.method onEndOfFlingFound()V
    .locals 3

    .line 85
    iget-object v0, p0, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;->mMainThreadHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;->mNotifyListenerRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 86
    iget-object v0, p0, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;->mNestedScrollView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/core/widget/NestedScrollView;

    .line 87
    .local v0, "nestedScrollView":Landroidx/core/widget/NestedScrollView;
    if-eqz v0, :cond_0

    .line 88
    const/4 v1, 0x0

    move-object v2, v1

    check-cast v2, Landroidx/core/widget/NestedScrollView$OnScrollChangeListener;

    invoke-virtual {v0, v1}, Landroidx/core/widget/NestedScrollView;->setOnScrollChangeListener(Landroidx/core/widget/NestedScrollView$OnScrollChangeListener;)V

    .line 89
    iget-object v1, p0, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;->mListener:Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;

    invoke-interface {v1, v0}, Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;->onFlingComplete(Landroid/view/View;)V

    .line 91
    :cond_0
    return-void
.end method

.method public onScrollChange(Landroidx/core/widget/NestedScrollView;IIII)V
    .locals 1
    .param p1, "v"    # Landroidx/core/widget/NestedScrollView;
    .param p2, "scrollX"    # I
    .param p3, "scrollY"    # I
    .param p4, "oldScrollX"    # I
    .param p5, "oldScrollY"    # I

    .line 76
    invoke-static {p1}, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;->isViewAtTopOrBottom(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 77
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;->onEndOfFlingFound()V

    goto :goto_0

    .line 79
    :cond_0
    invoke-direct {p0}, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;->scheduleNext()V

    .line 81
    :goto_0
    return-void
.end method

.method public watch()V
    .locals 1

    .line 66
    iget-object v0, p0, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;->mNestedScrollView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/core/widget/NestedScrollView;

    .line 67
    .local v0, "nestedScrollView":Landroidx/core/widget/NestedScrollView;
    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {v0, p0}, Landroidx/core/widget/NestedScrollView;->setOnScrollChangeListener(Landroidx/core/widget/NestedScrollView$OnScrollChangeListener;)V

    .line 69
    invoke-direct {p0}, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;->scheduleNext()V

    .line 71
    :cond_0
    return-void
.end method
