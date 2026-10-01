.class public final Landroidx/wear/ambient/AmbientLifecycleObserverKt;
.super Ljava/lang/Object;
.source "AmbientLifecycleObserver.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a\u0016\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005\u001a\u001e\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0004\u001a\u00020\u0005\u00a8\u0006\u0008"
    }
    d2 = {
        "AmbientLifecycleObserver",
        "Landroidx/wear/ambient/AmbientLifecycleObserver;",
        "activity",
        "Landroid/app/Activity;",
        "callbacks",
        "Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;",
        "callbackExecutor",
        "Ljava/util/concurrent/Executor;",
        "wear_release"
    }
    k = 0x2
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final AmbientLifecycleObserver(Landroid/app/Activity;Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;)Landroidx/wear/ambient/AmbientLifecycleObserver;
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "callbacks"    # Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;

    const-string v0, "activity"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callbacks"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 101
    new-instance v0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl;

    invoke-direct {v0, p0, p1}, Landroidx/wear/ambient/AmbientLifecycleObserverImpl;-><init>(Landroid/app/Activity;Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;)V

    check-cast v0, Landroidx/wear/ambient/AmbientLifecycleObserver;

    return-object v0
.end method

.method public static final AmbientLifecycleObserver(Landroid/app/Activity;Ljava/util/concurrent/Executor;Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;)Landroidx/wear/ambient/AmbientLifecycleObserver;
    .locals 1
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "callbackExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "callbacks"    # Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;

    const-string v0, "activity"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callbackExecutor"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callbacks"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 65
    new-instance v0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl;

    invoke-direct {v0, p0, p1, p2}, Landroidx/wear/ambient/AmbientLifecycleObserverImpl;-><init>(Landroid/app/Activity;Ljava/util/concurrent/Executor;Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;)V

    check-cast v0, Landroidx/wear/ambient/AmbientLifecycleObserver;

    return-object v0
.end method
