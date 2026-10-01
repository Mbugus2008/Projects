.class final Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor;
.super Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;
.source "ApplicationDescriptor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor$ElementContext;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<",
        "Landroid/app/Application;",
        ">;"
    }
.end annotation


# instance fields
.field private final mActivityTracker:Lcom/facebook/stetho/inspector/elements/android/ActivityTracker;

.field private final mElementToContextMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/app/Application;",
            "Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor$ElementContext;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 26
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;-><init>()V

    .line 27
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    .line 28
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor;->mElementToContextMap:Ljava/util/Map;

    .line 30
    invoke-static {}, Lcom/facebook/stetho/inspector/elements/android/ActivityTracker;->get()Lcom/facebook/stetho/inspector/elements/android/ActivityTracker;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor;->mActivityTracker:Lcom/facebook/stetho/inspector/elements/android/ActivityTracker;

    return-void
.end method

.method static synthetic access$000(Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor;)Lcom/facebook/stetho/inspector/elements/android/ActivityTracker;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor;

    .line 26
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor;->mActivityTracker:Lcom/facebook/stetho/inspector/elements/android/ActivityTracker;

    return-object v0
.end method

.method private getContext(Landroid/app/Application;)Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor$ElementContext;
    .locals 1
    .param p1, "element"    # Landroid/app/Application;

    .line 33
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor;->mElementToContextMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor$ElementContext;

    return-object v0
.end method

.method private static isDecorViewOfActivity(Landroid/view/View;Ljava/util/List;)Z
    .locals 4
    .param p0, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/util/List<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;>;)Z"
        }
    .end annotation

    .line 78
    .local p1, "references":Ljava/util/List;, "Ljava/util/List<Ljava/lang/ref/WeakReference<Landroid/app/Activity;>;>;"
    invoke-static {p1}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/WeakReference;

    .line 80
    .local v1, "reference":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/app/Activity;>;"
    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    .line 81
    .local v2, "activity":Landroid/app/Activity;
    if-nez v2, :cond_0

    .line 82
    goto :goto_0

    .line 84
    :cond_0
    invoke-virtual {v2}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v3

    if-ne v3, p0, :cond_1

    .line 85
    const/4 v0, 0x1

    return v0

    .line 87
    .end local v1    # "reference":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Landroid/app/Activity;>;"
    .end local v2    # "activity":Landroid/app/Activity;
    :cond_1
    goto :goto_0

    .line 88
    :cond_2
    const/4 v0, 0x0

    return v0
.end method

.method private storeWindowIfNeeded(Landroid/app/Application;Lcom/facebook/stetho/common/Accumulator;Ljava/util/List;)V
    .locals 4
    .param p1, "application"    # Landroid/app/Application;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Application;",
            "Lcom/facebook/stetho/common/Accumulator<",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;>;)V"
        }
    .end annotation

    .line 69
    .local p2, "children":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    .local p3, "activities":Ljava/util/List;, "Ljava/util/List<Ljava/lang/ref/WeakReference<Landroid/app/Activity;>;>;"
    invoke-static {p1}, Lcom/facebook/stetho/inspector/elements/android/window/WindowRootViewCompat;->get(Landroid/content/Context;)Lcom/facebook/stetho/inspector/elements/android/window/WindowRootViewCompat;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/elements/android/window/WindowRootViewCompat;->getRootViews()Ljava/util/List;

    move-result-object v0

    .line 70
    .local v0, "rootViews":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 71
    .local v2, "view":Landroid/view/View;
    invoke-static {v2, p3}, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor;->isDecorViewOfActivity(Landroid/view/View;Ljava/util/List;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 72
    invoke-interface {p2, v2}, Lcom/facebook/stetho/common/Accumulator;->store(Ljava/lang/Object;)V

    .line 74
    .end local v2    # "view":Landroid/view/View;
    :cond_0
    goto :goto_0

    .line 75
    :cond_1
    return-void
.end method


# virtual methods
.method protected onGetChildren(Landroid/app/Application;Lcom/facebook/stetho/common/Accumulator;)V
    .locals 4
    .param p1, "element"    # Landroid/app/Application;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Application;",
            "Lcom/facebook/stetho/common/Accumulator<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 56
    .local p2, "children":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor;->getContext(Landroid/app/Application;)Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor$ElementContext;

    move-result-object v0

    .line 57
    .local v0, "context":Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor$ElementContext;
    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor$ElementContext;->getActivitiesList()Ljava/util/List;

    move-result-object v1

    .line 59
    .local v1, "activities":Ljava/util/List;, "Ljava/util/List<Ljava/lang/ref/WeakReference<Landroid/app/Activity;>;>;"
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    .local v2, "i":I
    :goto_0
    if-ltz v2, :cond_1

    .line 60
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/Activity;

    .line 61
    .local v3, "activity":Landroid/app/Activity;
    if-eqz v3, :cond_0

    .line 62
    invoke-interface {p2, v3}, Lcom/facebook/stetho/common/Accumulator;->store(Ljava/lang/Object;)V

    .line 59
    .end local v3    # "activity":Landroid/app/Activity;
    :cond_0
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 65
    .end local v2    # "i":I
    :cond_1
    invoke-direct {p0, p1, p2, v1}, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor;->storeWindowIfNeeded(Landroid/app/Application;Lcom/facebook/stetho/common/Accumulator;Ljava/util/List;)V

    .line 66
    return-void
.end method

.method protected bridge synthetic onGetChildren(Ljava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V
    .locals 0

    .line 26
    check-cast p1, Landroid/app/Application;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor;->onGetChildren(Landroid/app/Application;Lcom/facebook/stetho/common/Accumulator;)V

    return-void
.end method

.method protected onGetNodeType(Landroid/app/Application;)Lcom/facebook/stetho/inspector/elements/NodeType;
    .locals 1
    .param p1, "element"    # Landroid/app/Application;

    .line 51
    sget-object v0, Lcom/facebook/stetho/inspector/elements/NodeType;->ELEMENT_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

    return-object v0
.end method

.method protected bridge synthetic onGetNodeType(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeType;
    .locals 0

    .line 26
    check-cast p1, Landroid/app/Application;

    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor;->onGetNodeType(Landroid/app/Application;)Lcom/facebook/stetho/inspector/elements/NodeType;

    move-result-object p1

    return-object p1
.end method

.method protected onHook(Landroid/app/Application;)V
    .locals 2
    .param p1, "element"    # Landroid/app/Application;

    .line 38
    new-instance v0, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor$ElementContext;

    invoke-direct {v0, p0}, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor$ElementContext;-><init>(Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor;)V

    .line 39
    .local v0, "context":Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor$ElementContext;
    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor$ElementContext;->hook(Landroid/app/Application;)V

    .line 40
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor;->mElementToContextMap:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    return-void
.end method

.method protected bridge synthetic onHook(Ljava/lang/Object;)V
    .locals 0

    .line 26
    check-cast p1, Landroid/app/Application;

    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor;->onHook(Landroid/app/Application;)V

    return-void
.end method

.method protected onUnhook(Landroid/app/Application;)V
    .locals 1
    .param p1, "element"    # Landroid/app/Application;

    .line 45
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor;->mElementToContextMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor$ElementContext;

    .line 46
    .local v0, "context":Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor$ElementContext;
    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor$ElementContext;->unhook()V

    .line 47
    return-void
.end method

.method protected bridge synthetic onUnhook(Ljava/lang/Object;)V
    .locals 0

    .line 26
    check-cast p1, Landroid/app/Application;

    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/android/ApplicationDescriptor;->onUnhook(Landroid/app/Application;)V

    return-void
.end method
