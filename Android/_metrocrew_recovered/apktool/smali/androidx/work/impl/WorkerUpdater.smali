.class public final Landroidx/work/impl/WorkerUpdater;
.super Ljava/lang/Object;
.source "WorkerUpdater.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nWorkerUpdater.kt\nKotlin\n*S Kotlin\n*F\n+ 1 WorkerUpdater.kt\nandroidx/work/impl/WorkerUpdater\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,165:1\n1855#2,2:166\n*S KotlinDebug\n*F\n+ 1 WorkerUpdater.kt\nandroidx/work/impl/WorkerUpdater\n*L\n56#1:166,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000J\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\"\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001aD\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u000c\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\n0\t2\u0006\u0010\u000b\u001a\u00020\u000c2\u000c\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u000eH\u0002\u001a\u001c\u0010\u0010\u001a\u00020\u0011*\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u000f2\u0006\u0010\u0014\u001a\u00020\u0015H\u0007\u001a\u001a\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u00020\u00010\u0016*\u00020\u00122\u0006\u0010\u0014\u001a\u00020\u0015H\u0000\u00a8\u0006\u0017"
    }
    d2 = {
        "updateWorkImpl",
        "Landroidx/work/WorkManager$UpdateResult;",
        "processor",
        "Landroidx/work/impl/Processor;",
        "workDatabase",
        "Landroidx/work/impl/WorkDatabase;",
        "configuration",
        "Landroidx/work/Configuration;",
        "schedulers",
        "",
        "Landroidx/work/impl/Scheduler;",
        "newWorkSpec",
        "Landroidx/work/impl/model/WorkSpec;",
        "tags",
        "",
        "",
        "enqueueUniquelyNamedPeriodic",
        "Landroidx/work/Operation;",
        "Landroidx/work/impl/WorkManagerImpl;",
        "name",
        "workRequest",
        "Landroidx/work/WorkRequest;",
        "Lcom/google/common/util/concurrent/ListenableFuture;",
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
.method public static synthetic $r8$lambda$tVg6EDB7tRl2_Gkh3Gh2mZTMa58(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/model/WorkSpec;Landroidx/work/impl/model/WorkSpec;Ljava/util/List;Ljava/lang/String;Ljava/util/Set;Z)V
    .locals 0

    invoke-static/range {p0 .. p6}, Landroidx/work/impl/WorkerUpdater;->updateWorkImpl$lambda$2(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/model/WorkSpec;Landroidx/work/impl/model/WorkSpec;Ljava/util/List;Ljava/lang/String;Ljava/util/Set;Z)V

    return-void
.end method

.method public static final synthetic access$updateWorkImpl(Landroidx/work/impl/Processor;Landroidx/work/impl/WorkDatabase;Landroidx/work/Configuration;Ljava/util/List;Landroidx/work/impl/model/WorkSpec;Ljava/util/Set;)Landroidx/work/WorkManager$UpdateResult;
    .locals 1
    .param p0, "processor"    # Landroidx/work/impl/Processor;
    .param p1, "workDatabase"    # Landroidx/work/impl/WorkDatabase;
    .param p2, "configuration"    # Landroidx/work/Configuration;
    .param p3, "schedulers"    # Ljava/util/List;
    .param p4, "newWorkSpec"    # Landroidx/work/impl/model/WorkSpec;
    .param p5, "tags"    # Ljava/util/Set;

    .line 1
    invoke-static/range {p0 .. p5}, Landroidx/work/impl/WorkerUpdater;->updateWorkImpl(Landroidx/work/impl/Processor;Landroidx/work/impl/WorkDatabase;Landroidx/work/Configuration;Ljava/util/List;Landroidx/work/impl/model/WorkSpec;Ljava/util/Set;)Landroidx/work/WorkManager$UpdateResult;

    move-result-object v0

    return-object v0
.end method

.method public static final enqueueUniquelyNamedPeriodic(Landroidx/work/impl/WorkManagerImpl;Ljava/lang/String;Landroidx/work/WorkRequest;)Landroidx/work/Operation;
    .locals 4
    .param p0, "$this$enqueueUniquelyNamedPeriodic"    # Landroidx/work/impl/WorkManagerImpl;
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "workRequest"    # Landroidx/work/WorkRequest;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "workRequest"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 118
    invoke-virtual {p0}, Landroidx/work/impl/WorkManagerImpl;->getConfiguration()Landroidx/work/Configuration;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/work/Configuration;->getTracer()Landroidx/work/Tracer;

    move-result-object v0

    .line 119
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "enqueueUniquePeriodic_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 120
    invoke-virtual {p0}, Landroidx/work/impl/WorkManagerImpl;->getWorkTaskExecutor()Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    move-result-object v2

    invoke-interface {v2}, Landroidx/work/impl/utils/taskexecutor/TaskExecutor;->getSerialTaskExecutor()Landroidx/work/impl/utils/taskexecutor/SerialExecutor;

    move-result-object v2

    const-string/jumbo v3, "workTaskExecutor.serialTaskExecutor"

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v2, Ljava/util/concurrent/Executor;

    .line 117
    new-instance v3, Landroidx/work/impl/WorkerUpdater$enqueueUniquelyNamedPeriodic$1;

    invoke-direct {v3, p0, p1, p2}, Landroidx/work/impl/WorkerUpdater$enqueueUniquelyNamedPeriodic$1;-><init>(Landroidx/work/impl/WorkManagerImpl;Ljava/lang/String;Landroidx/work/WorkRequest;)V

    check-cast v3, Lkotlin/jvm/functions/Function0;

    invoke-static {v0, v1, v2, v3}, Landroidx/work/OperationKt;->launchOperation(Landroidx/work/Tracer;Ljava/lang/String;Ljava/util/concurrent/Executor;Lkotlin/jvm/functions/Function0;)Landroidx/work/Operation;

    move-result-object v0

    .line 164
    return-object v0
.end method

.method private static final updateWorkImpl(Landroidx/work/impl/Processor;Landroidx/work/impl/WorkDatabase;Landroidx/work/Configuration;Ljava/util/List;Landroidx/work/impl/model/WorkSpec;Ljava/util/Set;)Landroidx/work/WorkManager$UpdateResult;
    .locals 9
    .param p0, "processor"    # Landroidx/work/impl/Processor;
    .param p1, "workDatabase"    # Landroidx/work/impl/WorkDatabase;
    .param p2, "configuration"    # Landroidx/work/Configuration;
    .param p3, "schedulers"    # Ljava/util/List;
    .param p4, "newWorkSpec"    # Landroidx/work/impl/model/WorkSpec;
    .param p5, "tags"    # Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/work/impl/Processor;",
            "Landroidx/work/impl/WorkDatabase;",
            "Landroidx/work/Configuration;",
            "Ljava/util/List<",
            "+",
            "Landroidx/work/impl/Scheduler;",
            ">;",
            "Landroidx/work/impl/model/WorkSpec;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)",
            "Landroidx/work/WorkManager$UpdateResult;"
        }
    .end annotation

    .line 43
    iget-object v5, p4, Landroidx/work/impl/model/WorkSpec;->id:Ljava/lang/String;

    .line 45
    .local v5, "workSpecId":Ljava/lang/String;
    invoke-virtual {p1}, Landroidx/work/impl/WorkDatabase;->workSpecDao()Landroidx/work/impl/model/WorkSpecDao;

    move-result-object v0

    invoke-interface {v0, v5}, Landroidx/work/impl/model/WorkSpecDao;->getWorkSpec(Ljava/lang/String;)Landroidx/work/impl/model/WorkSpec;

    move-result-object v2

    if-eqz v2, :cond_6

    .line 44
    nop

    .line 47
    .local v2, "oldWorkSpec":Landroidx/work/impl/model/WorkSpec;
    iget-object v0, v2, Landroidx/work/impl/model/WorkSpec;->state:Landroidx/work/WorkInfo$State;

    invoke-virtual {v0}, Landroidx/work/WorkInfo$State;->isFinished()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Landroidx/work/WorkManager$UpdateResult;->NOT_APPLIED:Landroidx/work/WorkManager$UpdateResult;

    return-object v0

    .line 48
    :cond_0
    invoke-virtual {v2}, Landroidx/work/impl/model/WorkSpec;->isPeriodic()Z

    move-result v0

    invoke-virtual {p4}, Landroidx/work/impl/model/WorkSpec;->isPeriodic()Z

    move-result v1

    xor-int/2addr v0, v1

    if-nez v0, :cond_5

    .line 55
    invoke-virtual {p0, v5}, Landroidx/work/impl/Processor;->isEnqueued(Ljava/lang/String;)Z

    move-result v7

    .line 56
    .local v7, "isEnqueued":Z
    if-nez v7, :cond_2

    move-object v0, p3

    check-cast v0, Ljava/lang/Iterable;

    .local v0, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v1, 0x0

    .line 166
    .local v1, "$i$f$forEach":I
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .local v4, "element$iv":Ljava/lang/Object;
    move-object v6, v4

    check-cast v6, Landroidx/work/impl/Scheduler;

    .local v6, "scheduler":Landroidx/work/impl/Scheduler;
    const/4 v8, 0x0

    .line 56
    .local v8, "$i$a$-forEach-WorkerUpdater$updateWorkImpl$1":I
    invoke-interface {v6, v5}, Landroidx/work/impl/Scheduler;->cancel(Ljava/lang/String;)V

    .line 166
    .end local v6    # "scheduler":Landroidx/work/impl/Scheduler;
    .end local v8    # "$i$a$-forEach-WorkerUpdater$updateWorkImpl$1":I
    nop

    .end local v4    # "element$iv":Ljava/lang/Object;
    goto :goto_0

    .line 167
    :cond_1
    nop

    .line 57
    .end local v0    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v1    # "$i$f$forEach":I
    :cond_2
    new-instance v0, Landroidx/work/impl/WorkerUpdater$$ExternalSyntheticLambda0;

    move-object v1, p1

    move-object v4, p3

    move-object v3, p4

    move-object v6, p5

    .end local p1    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    .end local p3    # "schedulers":Ljava/util/List;
    .end local p4    # "newWorkSpec":Landroidx/work/impl/model/WorkSpec;
    .end local p5    # "tags":Ljava/util/Set;
    .local v1, "workDatabase":Landroidx/work/impl/WorkDatabase;
    .local v3, "newWorkSpec":Landroidx/work/impl/model/WorkSpec;
    .local v4, "schedulers":Ljava/util/List;
    .local v6, "tags":Ljava/util/Set;
    invoke-direct/range {v0 .. v7}, Landroidx/work/impl/WorkerUpdater$$ExternalSyntheticLambda0;-><init>(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/model/WorkSpec;Landroidx/work/impl/model/WorkSpec;Ljava/util/List;Ljava/lang/String;Ljava/util/Set;Z)V

    invoke-virtual {v1, v0}, Landroidx/work/impl/WorkDatabase;->runInTransaction(Ljava/lang/Runnable;)V

    .line 92
    if-nez v7, :cond_3

    invoke-static {p2, v1, v4}, Landroidx/work/impl/Schedulers;->schedule(Landroidx/work/Configuration;Landroidx/work/impl/WorkDatabase;Ljava/util/List;)V

    .line 93
    :cond_3
    if-eqz v7, :cond_4

    sget-object p1, Landroidx/work/WorkManager$UpdateResult;->APPLIED_FOR_NEXT_RUN:Landroidx/work/WorkManager$UpdateResult;

    goto :goto_1

    :cond_4
    sget-object p1, Landroidx/work/WorkManager$UpdateResult;->APPLIED_IMMEDIATELY:Landroidx/work/WorkManager$UpdateResult;

    :goto_1
    return-object p1

    .line 49
    .end local v1    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    .end local v3    # "newWorkSpec":Landroidx/work/impl/model/WorkSpec;
    .end local v4    # "schedulers":Ljava/util/List;
    .end local v6    # "tags":Ljava/util/Set;
    .end local v7    # "isEnqueued":Z
    .restart local p1    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    .restart local p3    # "schedulers":Ljava/util/List;
    .restart local p4    # "newWorkSpec":Landroidx/work/impl/model/WorkSpec;
    .restart local p5    # "tags":Ljava/util/Set;
    :cond_5
    move-object v1, p1

    move-object v4, p3

    move-object v3, p4

    move-object v6, p5

    .end local p1    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    .end local p3    # "schedulers":Ljava/util/List;
    .end local p4    # "newWorkSpec":Landroidx/work/impl/model/WorkSpec;
    .end local p5    # "tags":Ljava/util/Set;
    .restart local v1    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    .restart local v3    # "newWorkSpec":Landroidx/work/impl/model/WorkSpec;
    .restart local v4    # "schedulers":Ljava/util/List;
    .restart local v6    # "tags":Ljava/util/Set;
    sget-object p1, Landroidx/work/impl/WorkerUpdater$updateWorkImpl$type$1;->INSTANCE:Landroidx/work/impl/WorkerUpdater$updateWorkImpl$type$1;

    check-cast p1, Lkotlin/jvm/functions/Function1;

    .line 50
    .local p1, "type":Lkotlin/jvm/functions/Function1;
    new-instance p3, Ljava/lang/UnsupportedOperationException;

    .line 51
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "Can\'t update "

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-interface {p1, v2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/String;

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    const-string p5, " Worker to "

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-interface {p1, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/String;

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    const-string p5, " Worker. Update operation must preserve worker\'s type."

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p4

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    .line 50
    invoke-direct {p3, p4}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p3

    .line 46
    .end local v1    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    .end local v2    # "oldWorkSpec":Landroidx/work/impl/model/WorkSpec;
    .end local v3    # "newWorkSpec":Landroidx/work/impl/model/WorkSpec;
    .end local v4    # "schedulers":Ljava/util/List;
    .end local v6    # "tags":Ljava/util/Set;
    .local p1, "workDatabase":Landroidx/work/impl/WorkDatabase;
    .restart local p3    # "schedulers":Ljava/util/List;
    .restart local p4    # "newWorkSpec":Landroidx/work/impl/model/WorkSpec;
    .restart local p5    # "tags":Ljava/util/Set;
    :cond_6
    move-object v1, p1

    move-object v4, p3

    move-object v3, p4

    .end local p1    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    .end local p3    # "schedulers":Ljava/util/List;
    .end local p4    # "newWorkSpec":Landroidx/work/impl/model/WorkSpec;
    .restart local v1    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    .restart local v3    # "newWorkSpec":Landroidx/work/impl/model/WorkSpec;
    .restart local v4    # "schedulers":Ljava/util/List;
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Worker with "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string p4, " doesn\'t exist"

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p1, p3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static final updateWorkImpl(Landroidx/work/impl/WorkManagerImpl;Landroidx/work/WorkRequest;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 3
    .param p0, "$this$updateWorkImpl"    # Landroidx/work/impl/WorkManagerImpl;
    .param p1, "workRequest"    # Landroidx/work/WorkRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/work/impl/WorkManagerImpl;",
            "Landroidx/work/WorkRequest;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/work/WorkManager$UpdateResult;",
            ">;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "workRequest"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 99
    invoke-virtual {p0}, Landroidx/work/impl/WorkManagerImpl;->getWorkTaskExecutor()Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    move-result-object v0

    invoke-interface {v0}, Landroidx/work/impl/utils/taskexecutor/TaskExecutor;->getSerialTaskExecutor()Landroidx/work/impl/utils/taskexecutor/SerialExecutor;

    move-result-object v0

    const-string/jumbo v1, "workTaskExecutor.serialTaskExecutor"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/util/concurrent/Executor;

    new-instance v1, Landroidx/work/impl/WorkerUpdater$updateWorkImpl$3;

    invoke-direct {v1, p0, p1}, Landroidx/work/impl/WorkerUpdater$updateWorkImpl$3;-><init>(Landroidx/work/impl/WorkManagerImpl;Landroidx/work/WorkRequest;)V

    check-cast v1, Lkotlin/jvm/functions/Function0;

    const-string/jumbo v2, "updateWorkImpl"

    invoke-static {v0, v2, v1}, Landroidx/work/ListenableFutureKt;->executeAsync(Ljava/util/concurrent/Executor;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method

.method private static final updateWorkImpl$lambda$2(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/model/WorkSpec;Landroidx/work/impl/model/WorkSpec;Ljava/util/List;Ljava/lang/String;Ljava/util/Set;Z)V
    .locals 39
    .param p0, "$workDatabase"    # Landroidx/work/impl/WorkDatabase;
    .param p1, "$oldWorkSpec"    # Landroidx/work/impl/model/WorkSpec;
    .param p2, "$newWorkSpec"    # Landroidx/work/impl/model/WorkSpec;
    .param p3, "$schedulers"    # Ljava/util/List;
    .param p4, "$workSpecId"    # Ljava/lang/String;
    .param p5, "$tags"    # Ljava/util/Set;
    .param p6, "$isEnqueued"    # Z

    .line 58
    move-object/from16 v0, p1

    move-object/from16 v1, p4

    invoke-virtual/range {p0 .. p0}, Landroidx/work/impl/WorkDatabase;->workSpecDao()Landroidx/work/impl/model/WorkSpecDao;

    move-result-object v2

    .line 59
    .local v2, "workSpecDao":Landroidx/work/impl/model/WorkSpecDao;
    invoke-virtual/range {p0 .. p0}, Landroidx/work/impl/WorkDatabase;->workTagDao()Landroidx/work/impl/model/WorkTagDao;

    move-result-object v3

    .line 66
    .local v3, "workTagDao":Landroidx/work/impl/model/WorkTagDao;
    iget-object v6, v0, Landroidx/work/impl/model/WorkSpec;->state:Landroidx/work/WorkInfo$State;

    .line 67
    iget v4, v0, Landroidx/work/impl/model/WorkSpec;->runAttemptCount:I

    .line 68
    iget-wide v7, v0, Landroidx/work/impl/model/WorkSpec;->lastEnqueueTime:J

    .line 69
    invoke-virtual {v0}, Landroidx/work/impl/model/WorkSpec;->getGeneration()I

    move-result v5

    const/4 v9, 0x1

    add-int/lit8 v31, v5, 0x1

    .line 70
    invoke-virtual {v0}, Landroidx/work/impl/model/WorkSpec;->getPeriodCount()I

    move-result v30

    .line 71
    invoke-virtual {v0}, Landroidx/work/impl/model/WorkSpec;->getNextScheduleTimeOverride()J

    move-result-wide v32

    .line 73
    invoke-virtual {v0}, Landroidx/work/impl/model/WorkSpec;->getNextScheduleTimeOverrideGeneration()I

    move-result v34

    .line 64
    nop

    .line 65
    nop

    .line 66
    nop

    .line 65
    nop

    .line 67
    nop

    .line 65
    nop

    .line 68
    nop

    .line 65
    nop

    .line 70
    nop

    .line 69
    nop

    .line 71
    nop

    .line 73
    nop

    .line 65
    const v37, 0xc3dbfd

    const/16 v38, 0x0

    const/4 v5, 0x0

    move-wide/from16 v22, v7

    const/4 v7, 0x0

    const/4 v8, 0x0

    move v10, v9

    const/4 v9, 0x0

    move v11, v10

    const/4 v10, 0x0

    move v13, v11

    const-wide/16 v11, 0x0

    move v15, v13

    const-wide/16 v13, 0x0

    move/from16 v17, v15

    const-wide/16 v15, 0x0

    move/from16 v18, v17

    const/16 v17, 0x0

    const/16 v19, 0x0

    const-wide/16 v20, 0x0

    const-wide/16 v24, 0x0

    const-wide/16 v26, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    const/16 v35, 0x0

    const/16 v36, 0x0

    move/from16 v0, v18

    move/from16 v18, v4

    move-object/from16 v4, p2

    invoke-static/range {v4 .. v38}, Landroidx/work/impl/model/WorkSpec;->copy$default(Landroidx/work/impl/model/WorkSpec;Ljava/lang/String;Landroidx/work/WorkInfo$State;Ljava/lang/String;Ljava/lang/String;Landroidx/work/Data;Landroidx/work/Data;JJJLandroidx/work/Constraints;ILandroidx/work/BackoffPolicy;JJJJZLandroidx/work/OutOfQuotaPolicy;IIJIILjava/lang/String;ILjava/lang/Object;)Landroidx/work/impl/model/WorkSpec;

    move-result-object v5

    .line 75
    move-object v4, v5

    .local v4, "$this$updateWorkImpl_u24lambda_u242_u24lambda_u241":Landroidx/work/impl/model/WorkSpec;
    const/4 v6, 0x0

    .line 76
    .local v6, "$i$a$-apply-WorkerUpdater$updateWorkImpl$2$updatedSpec$1":I
    invoke-virtual/range {p2 .. p2}, Landroidx/work/impl/model/WorkSpec;->getNextScheduleTimeOverrideGeneration()I

    move-result v7

    if-ne v7, v0, :cond_0

    .line 77
    invoke-virtual/range {p2 .. p2}, Landroidx/work/impl/model/WorkSpec;->getNextScheduleTimeOverride()J

    move-result-wide v7

    invoke-virtual {v4, v7, v8}, Landroidx/work/impl/model/WorkSpec;->setNextScheduleTimeOverride(J)V

    .line 78
    invoke-virtual {v4}, Landroidx/work/impl/model/WorkSpec;->getNextScheduleTimeOverrideGeneration()I

    move-result v7

    add-int/2addr v7, v0

    invoke-virtual {v4, v7}, Landroidx/work/impl/model/WorkSpec;->setNextScheduleTimeOverrideGeneration(I)V

    .line 82
    :cond_0
    nop

    .line 75
    .end local v4    # "$this$updateWorkImpl_u24lambda_u242_u24lambda_u241":Landroidx/work/impl/model/WorkSpec;
    .end local v6    # "$i$a$-apply-WorkerUpdater$updateWorkImpl$2$updatedSpec$1":I
    nop

    .line 63
    nop

    .line 84
    .local v5, "updatedSpec":Landroidx/work/impl/model/WorkSpec;
    move-object/from16 v0, p3

    invoke-static {v0, v5}, Landroidx/work/impl/utils/EnqueueUtilsKt;->wrapWorkSpecIfNeeded(Ljava/util/List;Landroidx/work/impl/model/WorkSpec;)Landroidx/work/impl/model/WorkSpec;

    move-result-object v4

    invoke-interface {v2, v4}, Landroidx/work/impl/model/WorkSpecDao;->updateWorkSpec(Landroidx/work/impl/model/WorkSpec;)V

    .line 85
    invoke-interface {v3, v1}, Landroidx/work/impl/model/WorkTagDao;->deleteByWorkSpecId(Ljava/lang/String;)V

    .line 86
    move-object/from16 v4, p5

    invoke-interface {v3, v1, v4}, Landroidx/work/impl/model/WorkTagDao;->insertTags(Ljava/lang/String;Ljava/util/Set;)V

    .line 87
    if-nez p6, :cond_1

    .line 88
    const-wide/16 v6, -0x1

    invoke-interface {v2, v1, v6, v7}, Landroidx/work/impl/model/WorkSpecDao;->markWorkSpecScheduled(Ljava/lang/String;J)I

    .line 89
    invoke-virtual/range {p0 .. p0}, Landroidx/work/impl/WorkDatabase;->workProgressDao()Landroidx/work/impl/model/WorkProgressDao;

    move-result-object v6

    invoke-interface {v6, v1}, Landroidx/work/impl/model/WorkProgressDao;->delete(Ljava/lang/String;)V

    .line 91
    :cond_1
    return-void
.end method
