.class Landroidx/wear/widget/drawer/FlingWatcherFactory;
.super Ljava/lang/Object;
.source "FlingWatcherFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;,
        Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingWatcher;
    }
.end annotation


# instance fields
.field private final mListener:Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;

.field private final mWatchers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingWatcher;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;)V
    .locals 2
    .param p1, "listener"    # Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Landroidx/wear/widget/drawer/FlingWatcherFactory;->mWatchers:Ljava/util/Map;

    .line 59
    if-eqz p1, :cond_0

    .line 63
    iput-object p1, p0, Landroidx/wear/widget/drawer/FlingWatcherFactory;->mListener:Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;

    .line 64
    return-void

    .line 60
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "FlingListener was null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private createFor(Landroid/view/View;)Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingWatcher;
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .line 87
    if-eqz p1, :cond_4

    .line 91
    instance-of v0, p1, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_0

    .line 92
    new-instance v0, Landroidx/wear/widget/drawer/RecyclerViewFlingWatcher;

    iget-object v1, p0, Landroidx/wear/widget/drawer/FlingWatcherFactory;->mListener:Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;

    move-object v2, p1

    check-cast v2, Landroidx/recyclerview/widget/RecyclerView;

    invoke-direct {v0, v1, v2}, Landroidx/wear/widget/drawer/RecyclerViewFlingWatcher;-><init>(Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;Landroidx/recyclerview/widget/RecyclerView;)V

    return-object v0

    .line 93
    :cond_0
    instance-of v0, p1, Landroid/widget/AbsListView;

    if-eqz v0, :cond_1

    .line 94
    new-instance v0, Landroidx/wear/widget/drawer/AbsListViewFlingWatcher;

    iget-object v1, p0, Landroidx/wear/widget/drawer/FlingWatcherFactory;->mListener:Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;

    move-object v2, p1

    check-cast v2, Landroid/widget/AbsListView;

    invoke-direct {v0, v1, v2}, Landroidx/wear/widget/drawer/AbsListViewFlingWatcher;-><init>(Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;Landroid/widget/AbsListView;)V

    return-object v0

    .line 95
    :cond_1
    instance-of v0, p1, Landroid/widget/ScrollView;

    if-eqz v0, :cond_2

    .line 96
    new-instance v0, Landroidx/wear/widget/drawer/ScrollViewFlingWatcher;

    iget-object v1, p0, Landroidx/wear/widget/drawer/FlingWatcherFactory;->mListener:Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;

    move-object v2, p1

    check-cast v2, Landroid/widget/ScrollView;

    invoke-direct {v0, v1, v2}, Landroidx/wear/widget/drawer/ScrollViewFlingWatcher;-><init>(Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;Landroid/widget/ScrollView;)V

    return-object v0

    .line 97
    :cond_2
    instance-of v0, p1, Landroidx/core/widget/NestedScrollView;

    if-eqz v0, :cond_3

    .line 98
    new-instance v0, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;

    iget-object v1, p0, Landroidx/wear/widget/drawer/FlingWatcherFactory;->mListener:Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;

    move-object v2, p1

    check-cast v2, Landroidx/core/widget/NestedScrollView;

    invoke-direct {v0, v1, v2}, Landroidx/wear/widget/drawer/NestedScrollViewFlingWatcher;-><init>(Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingListener;Landroidx/core/widget/NestedScrollView;)V

    return-object v0

    .line 100
    :cond_3
    const/4 v0, 0x0

    return-object v0

    .line 88
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "View was null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method getFor(Landroid/view/View;)Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingWatcher;
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .line 71
    iget-object v0, p0, Landroidx/wear/widget/drawer/FlingWatcherFactory;->mWatchers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingWatcher;

    .line 72
    .local v0, "watcher":Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingWatcher;
    if-nez v0, :cond_0

    .line 73
    invoke-direct {p0, p1}, Landroidx/wear/widget/drawer/FlingWatcherFactory;->createFor(Landroid/view/View;)Landroidx/wear/widget/drawer/FlingWatcherFactory$FlingWatcher;

    move-result-object v0

    .line 74
    if-eqz v0, :cond_0

    .line 75
    iget-object v1, p0, Landroidx/wear/widget/drawer/FlingWatcherFactory;->mWatchers:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    :cond_0
    return-object v0
.end method
