.class public final Landroidx/wear/ambient/AmbientLifecycleObserverImpl;
.super Ljava/lang/Object;
.source "AmbientLifecycleObserverImpl.kt"

# interfaces
.implements Landroidx/wear/ambient/AmbientLifecycleObserver;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000C\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005*\u0001\u000b\u0008\u0000\u0018\u00002\u00020\u0001B\u0017\u0008\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006B\u001d\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\tJ\u0010\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0015H\u0016J\u0010\u0010\u0016\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0015H\u0016J\u0010\u0010\u0017\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0015H\u0016J\u0010\u0010\u0018\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0015H\u0016J\u0010\u0010\u0019\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0015H\u0016R\u0010\u0010\n\u001a\u00020\u000bX\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\u000cR\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000f\u001a\u00020\u00108VX\u0096\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u000f\u0010\u0011\u00a8\u0006\u001a"
    }
    d2 = {
        "Landroidx/wear/ambient/AmbientLifecycleObserverImpl;",
        "Landroidx/wear/ambient/AmbientLifecycleObserver;",
        "activity",
        "Landroid/app/Activity;",
        "callback",
        "Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;",
        "(Landroid/app/Activity;Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;)V",
        "callbackExecutor",
        "Ljava/util/concurrent/Executor;",
        "(Landroid/app/Activity;Ljava/util/concurrent/Executor;Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;)V",
        "callbackTranslator",
        "androidx/wear/ambient/AmbientLifecycleObserverImpl$callbackTranslator$1",
        "Landroidx/wear/ambient/AmbientLifecycleObserverImpl$callbackTranslator$1;",
        "delegate",
        "Landroidx/wear/ambient/AmbientDelegate;",
        "isAmbient",
        "",
        "()Z",
        "onCreate",
        "",
        "owner",
        "Landroidx/lifecycle/LifecycleOwner;",
        "onDestroy",
        "onPause",
        "onResume",
        "onStop",
        "wear_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final callbackTranslator:Landroidx/wear/ambient/AmbientLifecycleObserverImpl$callbackTranslator$1;

.field private final delegate:Landroidx/wear/ambient/AmbientDelegate;


# direct methods
.method public static synthetic $r8$lambda$diKW5WdS0-l3AgqQGEwkPy29olo(Ljava/lang/Runnable;)V
    .locals 0

    invoke-static {p0}, Landroidx/wear/ambient/AmbientLifecycleObserverImpl;->_init_$lambda$0(Ljava/lang/Runnable;)V

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "callback"    # Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callback"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 101
    new-instance v0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl$$ExternalSyntheticLambda0;

    invoke-direct {v0}, Landroidx/wear/ambient/AmbientLifecycleObserverImpl$$ExternalSyntheticLambda0;-><init>()V

    invoke-direct {p0, p1, v0, p2}, Landroidx/wear/ambient/AmbientLifecycleObserverImpl;-><init>(Landroid/app/Activity;Ljava/util/concurrent/Executor;Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;)V

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Ljava/util/concurrent/Executor;Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "callbackExecutor"    # Ljava/util/concurrent/Executor;
    .param p3, "callback"    # Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callbackExecutor"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callback"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl$callbackTranslator$1;

    invoke-direct {v0, p2, p3}, Landroidx/wear/ambient/AmbientLifecycleObserverImpl$callbackTranslator$1;-><init>(Ljava/util/concurrent/Executor;Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;)V

    iput-object v0, p0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl;->callbackTranslator:Landroidx/wear/ambient/AmbientLifecycleObserverImpl$callbackTranslator$1;

    .line 103
    nop

    .line 104
    new-instance v0, Landroidx/wear/ambient/AmbientDelegate;

    new-instance v1, Landroidx/wear/ambient/WearableControllerProvider;

    invoke-direct {v1}, Landroidx/wear/ambient/WearableControllerProvider;-><init>()V

    iget-object v2, p0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl;->callbackTranslator:Landroidx/wear/ambient/AmbientLifecycleObserverImpl$callbackTranslator$1;

    check-cast v2, Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;

    invoke-direct {v0, p1, v1, v2}, Landroidx/wear/ambient/AmbientDelegate;-><init>(Landroid/app/Activity;Landroidx/wear/ambient/WearableControllerProvider;Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;)V

    iput-object v0, p0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl;->delegate:Landroidx/wear/ambient/AmbientDelegate;

    .line 105
    nop

    .line 58
    return-void
.end method

.method private static final _init_$lambda$0(Ljava/lang/Runnable;)V
    .locals 0
    .param p0, "r"    # Ljava/lang/Runnable;

    .line 101
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method


# virtual methods
.method public isAmbient()Z
    .locals 1

    .line 108
    iget-object v0, p0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl;->delegate:Landroidx/wear/ambient/AmbientDelegate;

    invoke-virtual {v0}, Landroidx/wear/ambient/AmbientDelegate;->isAmbient()Z

    move-result v0

    return v0
.end method

.method public onCreate(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 1
    .param p1, "owner"    # Landroidx/lifecycle/LifecycleOwner;

    const-string v0, "owner"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 111
    invoke-super {p0, p1}, Landroidx/wear/ambient/AmbientLifecycleObserver;->onCreate(Landroidx/lifecycle/LifecycleOwner;)V

    .line 112
    iget-object v0, p0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl;->delegate:Landroidx/wear/ambient/AmbientDelegate;

    invoke-virtual {v0}, Landroidx/wear/ambient/AmbientDelegate;->onCreate()V

    .line 113
    iget-object v0, p0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl;->delegate:Landroidx/wear/ambient/AmbientDelegate;

    invoke-virtual {v0}, Landroidx/wear/ambient/AmbientDelegate;->setAmbientEnabled()V

    .line 114
    return-void
.end method

.method public onDestroy(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 1
    .param p1, "owner"    # Landroidx/lifecycle/LifecycleOwner;

    const-string v0, "owner"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 132
    invoke-super {p0, p1}, Landroidx/wear/ambient/AmbientLifecycleObserver;->onDestroy(Landroidx/lifecycle/LifecycleOwner;)V

    .line 133
    iget-object v0, p0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl;->delegate:Landroidx/wear/ambient/AmbientDelegate;

    invoke-virtual {v0}, Landroidx/wear/ambient/AmbientDelegate;->onDestroy()V

    .line 134
    return-void
.end method

.method public onPause(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 1
    .param p1, "owner"    # Landroidx/lifecycle/LifecycleOwner;

    const-string v0, "owner"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 122
    invoke-super {p0, p1}, Landroidx/wear/ambient/AmbientLifecycleObserver;->onPause(Landroidx/lifecycle/LifecycleOwner;)V

    .line 123
    iget-object v0, p0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl;->delegate:Landroidx/wear/ambient/AmbientDelegate;

    invoke-virtual {v0}, Landroidx/wear/ambient/AmbientDelegate;->onPause()V

    .line 124
    return-void
.end method

.method public onResume(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 1
    .param p1, "owner"    # Landroidx/lifecycle/LifecycleOwner;

    const-string v0, "owner"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 117
    invoke-super {p0, p1}, Landroidx/wear/ambient/AmbientLifecycleObserver;->onResume(Landroidx/lifecycle/LifecycleOwner;)V

    .line 118
    iget-object v0, p0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl;->delegate:Landroidx/wear/ambient/AmbientDelegate;

    invoke-virtual {v0}, Landroidx/wear/ambient/AmbientDelegate;->onResume()V

    .line 119
    return-void
.end method

.method public onStop(Landroidx/lifecycle/LifecycleOwner;)V
    .locals 1
    .param p1, "owner"    # Landroidx/lifecycle/LifecycleOwner;

    const-string v0, "owner"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 127
    invoke-super {p0, p1}, Landroidx/wear/ambient/AmbientLifecycleObserver;->onStop(Landroidx/lifecycle/LifecycleOwner;)V

    .line 128
    iget-object v0, p0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl;->delegate:Landroidx/wear/ambient/AmbientDelegate;

    invoke-virtual {v0}, Landroidx/wear/ambient/AmbientDelegate;->onStop()V

    .line 129
    return-void
.end method
