.class public final Landroidx/work/impl/utils/StatusRunnable;
.super Ljava/lang/Object;
.source "StatusRunnable.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\u001a.\u0010\u0000\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00030\u00020\u0001*\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u000c\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0002H\u0000\u001a(\u0010\t\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00030\u00020\u0001*\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\n\u001a\u00020\u0008H\u0000\u001a$\u0010\u000b\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0001*\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u000c\u001a\u00020\rH\u0000\u001a(\u0010\u000e\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00030\u00020\u0001*\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u000f\u001a\u00020\u0008H\u0000\u001a(\u0010\u0010\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00030\u00020\u0001*\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0011\u001a\u00020\u0012H\u0000\u001a4\u0010\u0013\u001a\u0008\u0012\u0004\u0012\u0002H\u00140\u0001\"\u0004\u0008\u0000\u0010\u0014*\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0012\u0010\u0015\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u0002H\u00140\u0016H\u0002\u00a8\u0006\u0017"
    }
    d2 = {
        "forStringIds",
        "Lcom/google/common/util/concurrent/ListenableFuture;",
        "",
        "Landroidx/work/WorkInfo;",
        "Landroidx/work/impl/WorkDatabase;",
        "executor",
        "Landroidx/work/impl/utils/taskexecutor/TaskExecutor;",
        "ids",
        "",
        "forTag",
        "tag",
        "forUUID",
        "id",
        "Ljava/util/UUID;",
        "forUniqueWork",
        "name",
        "forWorkQuerySpec",
        "querySpec",
        "Landroidx/work/WorkQuery;",
        "loadStatusFuture",
        "T",
        "block",
        "Lkotlin/Function1;",
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


# direct methods
.method public static final forStringIds(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Ljava/util/List;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p0, "$this$forStringIds"    # Landroidx/work/impl/WorkDatabase;
    .param p1, "executor"    # Landroidx/work/impl/utils/taskexecutor/TaskExecutor;
    .param p2, "ids"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/work/impl/WorkDatabase;",
            "Landroidx/work/impl/utils/taskexecutor/TaskExecutor;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/util/List<",
            "Landroidx/work/WorkInfo;",
            ">;>;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "ids"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    new-instance v0, Landroidx/work/impl/utils/StatusRunnable$forStringIds$1;

    invoke-direct {v0, p2}, Landroidx/work/impl/utils/StatusRunnable$forStringIds$1;-><init>(Ljava/util/List;)V

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-static {p0, p1, v0}, Landroidx/work/impl/utils/StatusRunnable;->loadStatusFuture(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Lkotlin/jvm/functions/Function1;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 35
    return-object v0
.end method

.method public static final forTag(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Ljava/lang/String;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p0, "$this$forTag"    # Landroidx/work/impl/WorkDatabase;
    .param p1, "executor"    # Landroidx/work/impl/utils/taskexecutor/TaskExecutor;
    .param p2, "tag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/work/impl/WorkDatabase;",
            "Landroidx/work/impl/utils/taskexecutor/TaskExecutor;",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/util/List<",
            "Landroidx/work/WorkInfo;",
            ">;>;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "tag"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 49
    new-instance v0, Landroidx/work/impl/utils/StatusRunnable$forTag$1;

    invoke-direct {v0, p2}, Landroidx/work/impl/utils/StatusRunnable$forTag$1;-><init>(Ljava/lang/String;)V

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-static {p0, p1, v0}, Landroidx/work/impl/utils/StatusRunnable;->loadStatusFuture(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Lkotlin/jvm/functions/Function1;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 51
    return-object v0
.end method

.method public static final forUUID(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Ljava/util/UUID;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p0, "$this$forUUID"    # Landroidx/work/impl/WorkDatabase;
    .param p1, "executor"    # Landroidx/work/impl/utils/taskexecutor/TaskExecutor;
    .param p2, "id"    # Ljava/util/UUID;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/work/impl/WorkDatabase;",
            "Landroidx/work/impl/utils/taskexecutor/TaskExecutor;",
            "Ljava/util/UUID;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/work/WorkInfo;",
            ">;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "id"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    new-instance v0, Landroidx/work/impl/utils/StatusRunnable$forUUID$1;

    invoke-direct {v0, p2}, Landroidx/work/impl/utils/StatusRunnable$forUUID$1;-><init>(Ljava/util/UUID;)V

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-static {p0, p1, v0}, Landroidx/work/impl/utils/StatusRunnable;->loadStatusFuture(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Lkotlin/jvm/functions/Function1;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 43
    return-object v0
.end method

.method public static final forUniqueWork(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Ljava/lang/String;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p0, "$this$forUniqueWork"    # Landroidx/work/impl/WorkDatabase;
    .param p1, "executor"    # Landroidx/work/impl/utils/taskexecutor/TaskExecutor;
    .param p2, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/work/impl/WorkDatabase;",
            "Landroidx/work/impl/utils/taskexecutor/TaskExecutor;",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/util/List<",
            "Landroidx/work/WorkInfo;",
            ">;>;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "name"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 57
    new-instance v0, Landroidx/work/impl/utils/StatusRunnable$forUniqueWork$1;

    invoke-direct {v0, p2}, Landroidx/work/impl/utils/StatusRunnable$forUniqueWork$1;-><init>(Ljava/lang/String;)V

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-static {p0, p1, v0}, Landroidx/work/impl/utils/StatusRunnable;->loadStatusFuture(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Lkotlin/jvm/functions/Function1;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 59
    return-object v0
.end method

.method public static final forWorkQuerySpec(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Landroidx/work/WorkQuery;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 1
    .param p0, "$this$forWorkQuerySpec"    # Landroidx/work/impl/WorkDatabase;
    .param p1, "executor"    # Landroidx/work/impl/utils/taskexecutor/TaskExecutor;
    .param p2, "querySpec"    # Landroidx/work/WorkQuery;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/work/impl/WorkDatabase;",
            "Landroidx/work/impl/utils/taskexecutor/TaskExecutor;",
            "Landroidx/work/WorkQuery;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/util/List<",
            "Landroidx/work/WorkInfo;",
            ">;>;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "querySpec"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 65
    new-instance v0, Landroidx/work/impl/utils/StatusRunnable$forWorkQuerySpec$1;

    invoke-direct {v0, p2}, Landroidx/work/impl/utils/StatusRunnable$forWorkQuerySpec$1;-><init>(Landroidx/work/WorkQuery;)V

    check-cast v0, Lkotlin/jvm/functions/Function1;

    invoke-static {p0, p1, v0}, Landroidx/work/impl/utils/StatusRunnable;->loadStatusFuture(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Lkotlin/jvm/functions/Function1;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 67
    return-object v0
.end method

.method private static final loadStatusFuture(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Lkotlin/jvm/functions/Function1;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 3
    .param p0, "$this$loadStatusFuture"    # Landroidx/work/impl/WorkDatabase;
    .param p1, "executor"    # Landroidx/work/impl/utils/taskexecutor/TaskExecutor;
    .param p2, "block"    # Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroidx/work/impl/WorkDatabase;",
            "Landroidx/work/impl/utils/taskexecutor/TaskExecutor;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/work/impl/WorkDatabase;",
            "+TT;>;)",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "TT;>;"
        }
    .end annotation

    .line 74
    invoke-interface {p1}, Landroidx/work/impl/utils/taskexecutor/TaskExecutor;->getSerialTaskExecutor()Landroidx/work/impl/utils/taskexecutor/SerialExecutor;

    move-result-object v0

    const-string v1, "executor.serialTaskExecutor"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/work/impl/utils/StatusRunnable$loadStatusFuture$1;

    invoke-direct {v1, p2, p0}, Landroidx/work/impl/utils/StatusRunnable$loadStatusFuture$1;-><init>(Lkotlin/jvm/functions/Function1;Landroidx/work/impl/WorkDatabase;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    const-string v2, "loadStatusFuture"

    invoke-static {v0, v2, v1}, Landroidx/work/ListenableFutureKt;->executeAsync(Ljava/util/concurrent/Executor;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method
