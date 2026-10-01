.class public final Landroidx/work/impl/utils/WorkForegroundKt;
.super Ljava/lang/Object;
.source "WorkForeground.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a6\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\rH\u0086@\u00a2\u0006\u0002\u0010\u000e\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000f"
    }
    d2 = {
        "TAG",
        "",
        "workForeground",
        "",
        "context",
        "Landroid/content/Context;",
        "spec",
        "Landroidx/work/impl/model/WorkSpec;",
        "worker",
        "Landroidx/work/ListenableWorker;",
        "foregroundUpdater",
        "Landroidx/work/ForegroundUpdater;",
        "taskExecutor",
        "Landroidx/work/impl/utils/taskexecutor/TaskExecutor;",
        "(Landroid/content/Context;Landroidx/work/impl/model/WorkSpec;Landroidx/work/ListenableWorker;Landroidx/work/ForegroundUpdater;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "work-runtime_release"
    }
    k = 0x2
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 54
    const-string v0, "WorkForegroundRunnable"

    invoke-static {v0}, Landroidx/work/Logger;->tagWithPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "tagWithPrefix(\"WorkForegroundRunnable\")"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    sput-object v0, Landroidx/work/impl/utils/WorkForegroundKt;->TAG:Ljava/lang/String;

    return-void
.end method

.method public static final synthetic access$getTAG$p()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Landroidx/work/impl/utils/WorkForegroundKt;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public static final workForeground(Landroid/content/Context;Landroidx/work/impl/model/WorkSpec;Landroidx/work/ListenableWorker;Landroidx/work/ForegroundUpdater;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "spec"    # Landroidx/work/impl/model/WorkSpec;
    .param p2, "worker"    # Landroidx/work/ListenableWorker;
    .param p3, "foregroundUpdater"    # Landroidx/work/ForegroundUpdater;
    .param p4, "taskExecutor"    # Landroidx/work/impl/utils/taskexecutor/TaskExecutor;
    .param p5, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroidx/work/impl/model/WorkSpec;",
            "Landroidx/work/ListenableWorker;",
            "Landroidx/work/ForegroundUpdater;",
            "Landroidx/work/impl/utils/taskexecutor/TaskExecutor;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 38
    iget-boolean v0, p1, Landroidx/work/impl/model/WorkSpec;->expedited:Z

    if-eqz v0, :cond_2

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_0

    move-object v6, p0

    move-object v4, p1

    move-object v3, p2

    move-object v5, p3

    goto :goto_0

    .line 40
    :cond_0
    invoke-interface {p4}, Landroidx/work/impl/utils/taskexecutor/TaskExecutor;->getMainThreadExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    const-string/jumbo v1, "taskExecutor.mainThreadExecutor"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v0}, Lkotlinx/coroutines/ExecutorsKt;->from(Ljava/util/concurrent/Executor;)Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v0

    .line 41
    .local v0, "dispatcher":Lkotlinx/coroutines/CoroutineDispatcher;
    move-object v1, v0

    check-cast v1, Lkotlin/coroutines/CoroutineContext;

    new-instance v2, Landroidx/work/impl/utils/WorkForegroundKt$workForeground$2;

    const/4 v7, 0x0

    move-object v6, p0

    move-object v4, p1

    move-object v3, p2

    move-object v5, p3

    .end local p0    # "context":Landroid/content/Context;
    .end local p1    # "spec":Landroidx/work/impl/model/WorkSpec;
    .end local p2    # "worker":Landroidx/work/ListenableWorker;
    .end local p3    # "foregroundUpdater":Landroidx/work/ForegroundUpdater;
    .local v3, "worker":Landroidx/work/ListenableWorker;
    .local v4, "spec":Landroidx/work/impl/model/WorkSpec;
    .local v5, "foregroundUpdater":Landroidx/work/ForegroundUpdater;
    .local v6, "context":Landroid/content/Context;
    invoke-direct/range {v2 .. v7}, Landroidx/work/impl/utils/WorkForegroundKt$workForeground$2;-><init>(Landroidx/work/ListenableWorker;Landroidx/work/impl/model/WorkSpec;Landroidx/work/ForegroundUpdater;Landroid/content/Context;Lkotlin/coroutines/Continuation;)V

    check-cast v2, Lkotlin/jvm/functions/Function2;

    invoke-static {v1, v2, p5}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p1

    if-ne p0, p1, :cond_1

    return-object p0

    :cond_1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 52
    return-object p0

    .line 38
    .end local v0    # "dispatcher":Lkotlinx/coroutines/CoroutineDispatcher;
    .end local v3    # "worker":Landroidx/work/ListenableWorker;
    .end local v4    # "spec":Landroidx/work/impl/model/WorkSpec;
    .end local v5    # "foregroundUpdater":Landroidx/work/ForegroundUpdater;
    .end local v6    # "context":Landroid/content/Context;
    .restart local p0    # "context":Landroid/content/Context;
    .restart local p1    # "spec":Landroidx/work/impl/model/WorkSpec;
    .restart local p2    # "worker":Landroidx/work/ListenableWorker;
    .restart local p3    # "foregroundUpdater":Landroidx/work/ForegroundUpdater;
    :cond_2
    move-object v6, p0

    move-object v4, p1

    move-object v3, p2

    move-object v5, p3

    .end local p0    # "context":Landroid/content/Context;
    .end local p1    # "spec":Landroidx/work/impl/model/WorkSpec;
    .end local p2    # "worker":Landroidx/work/ListenableWorker;
    .end local p3    # "foregroundUpdater":Landroidx/work/ForegroundUpdater;
    .restart local v3    # "worker":Landroidx/work/ListenableWorker;
    .restart local v4    # "spec":Landroidx/work/impl/model/WorkSpec;
    .restart local v5    # "foregroundUpdater":Landroidx/work/ForegroundUpdater;
    .restart local v6    # "context":Landroid/content/Context;
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method
