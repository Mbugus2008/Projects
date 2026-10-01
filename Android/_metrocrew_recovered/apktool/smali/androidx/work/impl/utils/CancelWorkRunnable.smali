.class public final Landroidx/work/impl/utils/CancelWorkRunnable;
.super Ljava/lang/Object;
.source "CancelWorkRunnable.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000,\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001a\u0018\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0002\u001a\u000e\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0002\u001a\u00020\u0003\u001a\u0016\u0010\u0008\u001a\u00020\u00072\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u0002\u001a\u00020\u0003\u001a\u0016\u0010\u000b\u001a\u00020\u00072\u0006\u0010\u000c\u001a\u00020\u00052\u0006\u0010\u0002\u001a\u00020\u0003\u001a\u0016\u0010\r\u001a\u00020\u00012\u0006\u0010\u000c\u001a\u00020\u00052\u0006\u0010\u0002\u001a\u00020\u0003\u001a\u0016\u0010\u000e\u001a\u00020\u00072\u0006\u0010\u000f\u001a\u00020\u00052\u0006\u0010\u0002\u001a\u00020\u0003\u001a\u0018\u0010\u0010\u001a\u00020\u00012\u0006\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0004\u001a\u00020\u0005H\u0002\u001a\u0010\u0010\u0013\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\u0002\u00a8\u0006\u0014"
    }
    d2 = {
        "cancel",
        "",
        "workManagerImpl",
        "Landroidx/work/impl/WorkManagerImpl;",
        "workSpecId",
        "",
        "forAll",
        "Landroidx/work/Operation;",
        "forId",
        "id",
        "Ljava/util/UUID;",
        "forName",
        "name",
        "forNameInline",
        "forTag",
        "tag",
        "iterativelyCancelWorkAndDependents",
        "workDatabase",
        "Landroidx/work/impl/WorkDatabase;",
        "reschedulePendingWorkers",
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
.method public static synthetic $r8$lambda$gmz-7SyxTGDd6CwHjvOsJ11-hcc(Landroidx/work/impl/WorkDatabase;Ljava/lang/String;Landroidx/work/impl/WorkManagerImpl;)V
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/work/impl/utils/CancelWorkRunnable;->forNameInline$lambda$0(Landroidx/work/impl/WorkDatabase;Ljava/lang/String;Landroidx/work/impl/WorkManagerImpl;)V

    return-void
.end method

.method public static final synthetic access$cancel(Landroidx/work/impl/WorkManagerImpl;Ljava/lang/String;)V
    .locals 0
    .param p0, "workManagerImpl"    # Landroidx/work/impl/WorkManagerImpl;
    .param p1, "workSpecId"    # Ljava/lang/String;

    .line 1
    invoke-static {p0, p1}, Landroidx/work/impl/utils/CancelWorkRunnable;->cancel(Landroidx/work/impl/WorkManagerImpl;Ljava/lang/String;)V

    return-void
.end method

.method public static final synthetic access$reschedulePendingWorkers(Landroidx/work/impl/WorkManagerImpl;)V
    .locals 0
    .param p0, "workManagerImpl"    # Landroidx/work/impl/WorkManagerImpl;

    .line 1
    invoke-static {p0}, Landroidx/work/impl/utils/CancelWorkRunnable;->reschedulePendingWorkers(Landroidx/work/impl/WorkManagerImpl;)V

    return-void
.end method

.method private static final cancel(Landroidx/work/impl/WorkManagerImpl;Ljava/lang/String;)V
    .locals 3
    .param p0, "workManagerImpl"    # Landroidx/work/impl/WorkManagerImpl;
    .param p1, "workSpecId"    # Ljava/lang/String;

    .line 31
    invoke-virtual {p0}, Landroidx/work/impl/WorkManagerImpl;->getWorkDatabase()Landroidx/work/impl/WorkDatabase;

    move-result-object v0

    const-string/jumbo v1, "workManagerImpl.workDatabase"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v0, p1}, Landroidx/work/impl/utils/CancelWorkRunnable;->iterativelyCancelWorkAndDependents(Landroidx/work/impl/WorkDatabase;Ljava/lang/String;)V

    .line 32
    invoke-virtual {p0}, Landroidx/work/impl/WorkManagerImpl;->getProcessor()Landroidx/work/impl/Processor;

    move-result-object v0

    const-string/jumbo v1, "workManagerImpl.processor"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    .local v0, "processor":Landroidx/work/impl/Processor;
    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroidx/work/impl/Processor;->stopAndCancelWork(Ljava/lang/String;I)Z

    .line 34
    invoke-virtual {p0}, Landroidx/work/impl/WorkManagerImpl;->getSchedulers()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/work/impl/Scheduler;

    .line 35
    .local v2, "scheduler":Landroidx/work/impl/Scheduler;
    invoke-interface {v2, p1}, Landroidx/work/impl/Scheduler;->cancel(Ljava/lang/String;)V

    .end local v2    # "scheduler":Landroidx/work/impl/Scheduler;
    goto :goto_0

    .line 37
    :cond_0
    return-void
.end method

.method public static final forAll(Landroidx/work/impl/WorkManagerImpl;)Landroidx/work/Operation;
    .locals 4
    .param p0, "workManagerImpl"    # Landroidx/work/impl/WorkManagerImpl;

    const-string/jumbo v0, "workManagerImpl"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 140
    invoke-virtual {p0}, Landroidx/work/impl/WorkManagerImpl;->getConfiguration()Landroidx/work/Configuration;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/work/Configuration;->getTracer()Landroidx/work/Tracer;

    move-result-object v0

    .line 141
    nop

    .line 142
    invoke-virtual {p0}, Landroidx/work/impl/WorkManagerImpl;->getWorkTaskExecutor()Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    move-result-object v1

    invoke-interface {v1}, Landroidx/work/impl/utils/taskexecutor/TaskExecutor;->getSerialTaskExecutor()Landroidx/work/impl/utils/taskexecutor/SerialExecutor;

    move-result-object v1

    const-string/jumbo v2, "workManagerImpl.workTask\u2026ecutor.serialTaskExecutor"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/util/concurrent/Executor;

    .line 139
    new-instance v2, Landroidx/work/impl/utils/CancelWorkRunnable$forAll$1;

    invoke-direct {v2, p0}, Landroidx/work/impl/utils/CancelWorkRunnable$forAll$1;-><init>(Landroidx/work/impl/WorkManagerImpl;)V

    check-cast v2, Lkotlin/jvm/functions/Function0;

    const-string v3, "CancelAllWork"

    invoke-static {v0, v3, v1, v2}, Landroidx/work/OperationKt;->launchOperation(Landroidx/work/Tracer;Ljava/lang/String;Ljava/util/concurrent/Executor;Lkotlin/jvm/functions/Function0;)Landroidx/work/Operation;

    move-result-object v0

    .line 156
    return-object v0
.end method

.method public static final forId(Ljava/util/UUID;Landroidx/work/impl/WorkManagerImpl;)Landroidx/work/Operation;
    .locals 4
    .param p0, "id"    # Ljava/util/UUID;
    .param p1, "workManagerImpl"    # Landroidx/work/impl/WorkManagerImpl;

    const-string v0, "id"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "workManagerImpl"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    invoke-virtual {p1}, Landroidx/work/impl/WorkManagerImpl;->getConfiguration()Landroidx/work/Configuration;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/work/Configuration;->getTracer()Landroidx/work/Tracer;

    move-result-object v0

    .line 72
    nop

    .line 73
    invoke-virtual {p1}, Landroidx/work/impl/WorkManagerImpl;->getWorkTaskExecutor()Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    move-result-object v1

    invoke-interface {v1}, Landroidx/work/impl/utils/taskexecutor/TaskExecutor;->getSerialTaskExecutor()Landroidx/work/impl/utils/taskexecutor/SerialExecutor;

    move-result-object v1

    const-string/jumbo v2, "workManagerImpl.workTask\u2026ecutor.serialTaskExecutor"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v1, Ljava/util/concurrent/Executor;

    .line 70
    new-instance v2, Landroidx/work/impl/utils/CancelWorkRunnable$forId$1;

    invoke-direct {v2, p1, p0}, Landroidx/work/impl/utils/CancelWorkRunnable$forId$1;-><init>(Landroidx/work/impl/WorkManagerImpl;Ljava/util/UUID;)V

    check-cast v2, Lkotlin/jvm/functions/Function0;

    const-string v3, "CancelWorkById"

    invoke-static {v0, v3, v1, v2}, Landroidx/work/OperationKt;->launchOperation(Landroidx/work/Tracer;Ljava/lang/String;Ljava/util/concurrent/Executor;Lkotlin/jvm/functions/Function0;)Landroidx/work/Operation;

    move-result-object v0

    .line 78
    return-object v0
.end method

.method public static final forName(Ljava/lang/String;Landroidx/work/impl/WorkManagerImpl;)Landroidx/work/Operation;
    .locals 4
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "workManagerImpl"    # Landroidx/work/impl/WorkManagerImpl;

    const-string v0, "name"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "workManagerImpl"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 113
    invoke-virtual {p1}, Landroidx/work/impl/WorkManagerImpl;->getConfiguration()Landroidx/work/Configuration;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/work/Configuration;->getTracer()Landroidx/work/Tracer;

    move-result-object v0

    .line 114
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "CancelWorkByName_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 115
    invoke-virtual {p1}, Landroidx/work/impl/WorkManagerImpl;->getWorkTaskExecutor()Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    move-result-object v2

    invoke-interface {v2}, Landroidx/work/impl/utils/taskexecutor/TaskExecutor;->getSerialTaskExecutor()Landroidx/work/impl/utils/taskexecutor/SerialExecutor;

    move-result-object v2

    const-string/jumbo v3, "workManagerImpl.workTask\u2026ecutor.serialTaskExecutor"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Ljava/util/concurrent/Executor;

    .line 112
    new-instance v3, Landroidx/work/impl/utils/CancelWorkRunnable$forName$1;

    invoke-direct {v3, p0, p1}, Landroidx/work/impl/utils/CancelWorkRunnable$forName$1;-><init>(Ljava/lang/String;Landroidx/work/impl/WorkManagerImpl;)V

    check-cast v3, Lkotlin/jvm/functions/Function0;

    invoke-static {v0, v1, v2, v3}, Landroidx/work/OperationKt;->launchOperation(Landroidx/work/Tracer;Ljava/lang/String;Ljava/util/concurrent/Executor;Lkotlin/jvm/functions/Function0;)Landroidx/work/Operation;

    move-result-object v0

    .line 119
    return-object v0
.end method

.method public static final forNameInline(Ljava/lang/String;Landroidx/work/impl/WorkManagerImpl;)V
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "workManagerImpl"    # Landroidx/work/impl/WorkManagerImpl;

    const-string v0, "name"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "workManagerImpl"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 122
    invoke-virtual {p1}, Landroidx/work/impl/WorkManagerImpl;->getWorkDatabase()Landroidx/work/impl/WorkDatabase;

    move-result-object v0

    const-string/jumbo v1, "workManagerImpl.workDatabase"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 123
    .local v0, "workDatabase":Landroidx/work/impl/WorkDatabase;
    new-instance v1, Landroidx/work/impl/utils/CancelWorkRunnable$$ExternalSyntheticLambda0;

    invoke-direct {v1, v0, p0, p1}, Landroidx/work/impl/utils/CancelWorkRunnable$$ExternalSyntheticLambda0;-><init>(Landroidx/work/impl/WorkDatabase;Ljava/lang/String;Landroidx/work/impl/WorkManagerImpl;)V

    invoke-virtual {v0, v1}, Landroidx/work/impl/WorkDatabase;->runInTransaction(Ljava/lang/Runnable;)V

    .line 130
    return-void
.end method

.method private static final forNameInline$lambda$0(Landroidx/work/impl/WorkDatabase;Ljava/lang/String;Landroidx/work/impl/WorkManagerImpl;)V
    .locals 4
    .param p0, "$workDatabase"    # Landroidx/work/impl/WorkDatabase;
    .param p1, "$name"    # Ljava/lang/String;
    .param p2, "$workManagerImpl"    # Landroidx/work/impl/WorkManagerImpl;

    .line 124
    invoke-virtual {p0}, Landroidx/work/impl/WorkDatabase;->workSpecDao()Landroidx/work/impl/model/WorkSpecDao;

    move-result-object v0

    .line 125
    .local v0, "workSpecDao":Landroidx/work/impl/model/WorkSpecDao;
    invoke-interface {v0, p1}, Landroidx/work/impl/model/WorkSpecDao;->getUnfinishedWorkWithName(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 126
    .local v1, "workSpecIds":Ljava/util/List;
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 127
    .local v3, "workSpecId":Ljava/lang/String;
    invoke-static {p2, v3}, Landroidx/work/impl/utils/CancelWorkRunnable;->cancel(Landroidx/work/impl/WorkManagerImpl;Ljava/lang/String;)V

    .end local v3    # "workSpecId":Ljava/lang/String;
    goto :goto_0

    .line 129
    :cond_0
    return-void
.end method

.method public static final forTag(Ljava/lang/String;Landroidx/work/impl/WorkManagerImpl;)Landroidx/work/Operation;
    .locals 4
    .param p0, "tag"    # Ljava/lang/String;
    .param p1, "workManagerImpl"    # Landroidx/work/impl/WorkManagerImpl;

    const-string/jumbo v0, "tag"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "workManagerImpl"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 89
    invoke-virtual {p1}, Landroidx/work/impl/WorkManagerImpl;->getConfiguration()Landroidx/work/Configuration;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/work/Configuration;->getTracer()Landroidx/work/Tracer;

    move-result-object v0

    .line 90
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "CancelWorkByTag_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 91
    invoke-virtual {p1}, Landroidx/work/impl/WorkManagerImpl;->getWorkTaskExecutor()Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    move-result-object v2

    invoke-interface {v2}, Landroidx/work/impl/utils/taskexecutor/TaskExecutor;->getSerialTaskExecutor()Landroidx/work/impl/utils/taskexecutor/SerialExecutor;

    move-result-object v2

    const-string/jumbo v3, "workManagerImpl.workTask\u2026ecutor.serialTaskExecutor"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Ljava/util/concurrent/Executor;

    .line 88
    new-instance v3, Landroidx/work/impl/utils/CancelWorkRunnable$forTag$1;

    invoke-direct {v3, p1, p0}, Landroidx/work/impl/utils/CancelWorkRunnable$forTag$1;-><init>(Landroidx/work/impl/WorkManagerImpl;Ljava/lang/String;)V

    check-cast v3, Lkotlin/jvm/functions/Function0;

    invoke-static {v0, v1, v2, v3}, Landroidx/work/OperationKt;->launchOperation(Landroidx/work/Tracer;Ljava/lang/String;Ljava/util/concurrent/Executor;Lkotlin/jvm/functions/Function0;)Landroidx/work/Operation;

    move-result-object v0

    .line 102
    return-object v0
.end method

.method private static final iterativelyCancelWorkAndDependents(Landroidx/work/impl/WorkDatabase;Ljava/lang/String;)V
    .locals 6
    .param p0, "workDatabase"    # Landroidx/work/impl/WorkDatabase;
    .param p1, "workSpecId"    # Ljava/lang/String;

    .line 48
    invoke-virtual {p0}, Landroidx/work/impl/WorkDatabase;->workSpecDao()Landroidx/work/impl/model/WorkSpecDao;

    move-result-object v0

    .line 49
    .local v0, "workSpecDao":Landroidx/work/impl/model/WorkSpecDao;
    invoke-virtual {p0}, Landroidx/work/impl/WorkDatabase;->dependencyDao()Landroidx/work/impl/model/DependencyDao;

    move-result-object v1

    .line 50
    .local v1, "dependencyDao":Landroidx/work/impl/model/DependencyDao;
    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->mutableListOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 51
    .local v2, "idsToProcess":Ljava/util/List;
    :goto_0
    move-object v3, v2

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 52
    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->removeLast(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 54
    .local v3, "id":Ljava/lang/String;
    invoke-interface {v0, v3}, Landroidx/work/impl/model/WorkSpecDao;->getState(Ljava/lang/String;)Landroidx/work/WorkInfo$State;

    move-result-object v4

    .line 55
    .local v4, "state":Landroidx/work/WorkInfo$State;
    sget-object v5, Landroidx/work/WorkInfo$State;->SUCCEEDED:Landroidx/work/WorkInfo$State;

    if-eq v4, v5, :cond_0

    sget-object v5, Landroidx/work/WorkInfo$State;->FAILED:Landroidx/work/WorkInfo$State;

    if-eq v4, v5, :cond_0

    .line 56
    invoke-interface {v0, v3}, Landroidx/work/impl/model/WorkSpecDao;->setCancelledState(Ljava/lang/String;)I

    .line 58
    :cond_0
    invoke-interface {v1, v3}, Landroidx/work/impl/model/DependencyDao;->getDependentWorkIds(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    check-cast v5, Ljava/util/Collection;

    invoke-interface {v2, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 60
    .end local v3    # "id":Ljava/lang/String;
    .end local v4    # "state":Landroidx/work/WorkInfo$State;
    :cond_1
    return-void
.end method

.method private static final reschedulePendingWorkers(Landroidx/work/impl/WorkManagerImpl;)V
    .locals 3
    .param p0, "workManagerImpl"    # Landroidx/work/impl/WorkManagerImpl;

    .line 41
    invoke-virtual {p0}, Landroidx/work/impl/WorkManagerImpl;->getConfiguration()Landroidx/work/Configuration;

    move-result-object v0

    .line 42
    invoke-virtual {p0}, Landroidx/work/impl/WorkManagerImpl;->getWorkDatabase()Landroidx/work/impl/WorkDatabase;

    move-result-object v1

    .line 43
    invoke-virtual {p0}, Landroidx/work/impl/WorkManagerImpl;->getSchedulers()Ljava/util/List;

    move-result-object v2

    .line 40
    invoke-static {v0, v1, v2}, Landroidx/work/impl/Schedulers;->schedule(Landroidx/work/Configuration;Landroidx/work/impl/WorkDatabase;Ljava/util/List;)V

    .line 45
    return-void
.end method
