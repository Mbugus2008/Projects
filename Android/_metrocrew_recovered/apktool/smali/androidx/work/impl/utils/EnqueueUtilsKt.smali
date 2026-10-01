.class public final Landroidx/work/impl/utils/EnqueueUtilsKt;
.super Ljava/lang/Object;
.source "EnqueueUtils.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nEnqueueUtils.kt\nKotlin\n*S Kotlin\n*F\n+ 1 EnqueueUtils.kt\nandroidx/work/impl/utils/EnqueueUtilsKt\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n+ 3 fake.kt\nkotlin/jvm/internal/FakeKt\n+ 4 Data_.kt\nandroidx/work/Data\n*L\n1#1,168:1\n1774#2,4:169\n1747#2,3:177\n1#3:173\n229#4:174\n229#4:175\n229#4:176\n*S KotlinDebug\n*F\n+ 1 EnqueueUtils.kt\nandroidx/work/impl/utils/EnqueueUtilsKt\n*L\n45#1:169,4\n140#1:177,3\n71#1:174\n72#1:175\n73#1:176\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000<\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\u001a \u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000cH\u0000\u001a\u0010\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u000eH\u0000\u001a\u0010\u0010\u0010\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u000eH\u0007\u001a\u001e\u0010\u0011\u001a\u00020\u00122\u000c\u0010\u0013\u001a\u0008\u0012\u0004\u0012\u00020\u00150\u00142\u0006\u0010\u0016\u001a\u00020\u0001H\u0002\u001a\u001e\u0010\u0017\u001a\u00020\u000e2\u000c\u0010\u0013\u001a\u0008\u0012\u0004\u0012\u00020\u00150\u00142\u0006\u0010\u000f\u001a\u00020\u000eH\u0000\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0002\u001a\u00020\u0001X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0003\u001a\u00020\u0001X\u0080T\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0004\u001a\u00020\u0001X\u0080T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0018"
    }
    d2 = {
        "ARGUMENT_REMOTE_LISTENABLE_WORKER_NAME",
        "",
        "ARGUMENT_SERVICE_CLASS_NAME",
        "ARGUMENT_SERVICE_PACKAGE_NAME",
        "REMOTE_DELEGATING_LISTENABLE_WORKER_CLASS_NAME",
        "checkContentUriTriggerWorkerLimits",
        "",
        "workDatabase",
        "Landroidx/work/impl/WorkDatabase;",
        "configuration",
        "Landroidx/work/Configuration;",
        "continuation",
        "Landroidx/work/impl/WorkContinuationImpl;",
        "tryDelegateConstrainedWorkSpec",
        "Landroidx/work/impl/model/WorkSpec;",
        "workSpec",
        "tryDelegateRemoteListenableWorker",
        "usesScheduler",
        "",
        "schedulers",
        "",
        "Landroidx/work/impl/Scheduler;",
        "className",
        "wrapWorkSpecIfNeeded",
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
.field public static final ARGUMENT_REMOTE_LISTENABLE_WORKER_NAME:Ljava/lang/String; = "androidx.work.multiprocess.RemoteListenableDelegatingWorker.ARGUMENT_REMOTE_LISTENABLE_WORKER_NAME"

.field public static final ARGUMENT_SERVICE_CLASS_NAME:Ljava/lang/String; = "androidx.work.impl.workers.RemoteListenableWorker.ARGUMENT_CLASS_NAME"

.field public static final ARGUMENT_SERVICE_PACKAGE_NAME:Ljava/lang/String; = "androidx.work.impl.workers.RemoteListenableWorker.ARGUMENT_PACKAGE_NAME"

.field public static final REMOTE_DELEGATING_LISTENABLE_WORKER_CLASS_NAME:Ljava/lang/String; = "androidx.work.multiprocess.RemoteListenableDelegatingWorker"


# direct methods
.method public static final checkContentUriTriggerWorkerLimits(Landroidx/work/impl/WorkDatabase;Landroidx/work/Configuration;Landroidx/work/impl/WorkContinuationImpl;)V
    .locals 12
    .param p0, "workDatabase"    # Landroidx/work/impl/WorkDatabase;
    .param p1, "configuration"    # Landroidx/work/Configuration;
    .param p2, "continuation"    # Landroidx/work/impl/WorkContinuationImpl;

    const-string/jumbo v0, "workDatabase"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "configuration"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "continuation"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 40
    nop

    .line 41
    const/4 v0, 0x1

    new-array v0, v0, [Landroidx/work/impl/WorkContinuationImpl;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->mutableListOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 42
    .local v0, "continuations":Ljava/util/List;
    const/4 v2, 0x0

    .line 43
    .local v2, "newCount":I
    :goto_0
    move-object v3, v0

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_4

    .line 44
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->removeLast(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/work/impl/WorkContinuationImpl;

    .line 45
    .local v3, "current":Landroidx/work/impl/WorkContinuationImpl;
    invoke-virtual {v3}, Landroidx/work/impl/WorkContinuationImpl;->getWork()Ljava/util/List;

    move-result-object v4

    const-string v5, "current.work"

    invoke-static {v4, v5}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v4, Ljava/lang/Iterable;

    .local v4, "$this$count$iv":Ljava/lang/Iterable;
    const/4 v5, 0x0

    .line 169
    .local v5, "$i$f$count":I
    instance-of v6, v4, Ljava/util/Collection;

    if-eqz v6, :cond_0

    move-object v6, v4

    check-cast v6, Ljava/util/Collection;

    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_0

    move v6, v1

    goto :goto_2

    .line 170
    :cond_0
    const/4 v6, 0x0

    .line 171
    .local v6, "count$iv":I
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_1
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .local v8, "element$iv":Ljava/lang/Object;
    move-object v9, v8

    check-cast v9, Landroidx/work/WorkRequest;

    .local v9, "it":Landroidx/work/WorkRequest;
    const/4 v10, 0x0

    .line 45
    .local v10, "$i$a$-count-EnqueueUtilsKt$checkContentUriTriggerWorkerLimits$1":I
    invoke-virtual {v9}, Landroidx/work/WorkRequest;->getWorkSpec()Landroidx/work/impl/model/WorkSpec;

    move-result-object v11

    iget-object v11, v11, Landroidx/work/impl/model/WorkSpec;->constraints:Landroidx/work/Constraints;

    invoke-virtual {v11}, Landroidx/work/Constraints;->hasContentUriTriggers()Z

    move-result v9

    .line 171
    .end local v9    # "it":Landroidx/work/WorkRequest;
    .end local v10    # "$i$a$-count-EnqueueUtilsKt$checkContentUriTriggerWorkerLimits$1":I
    if-eqz v9, :cond_1

    add-int/lit8 v6, v6, 0x1

    if-gez v6, :cond_1

    invoke-static {}, Lkotlin/collections/CollectionsKt;->throwCountOverflow()V

    .end local v8    # "element$iv":Ljava/lang/Object;
    goto :goto_1

    .line 172
    :cond_2
    nop

    .line 45
    .end local v4    # "$this$count$iv":Ljava/lang/Iterable;
    .end local v5    # "$i$f$count":I
    .end local v6    # "count$iv":I
    :goto_2
    add-int/2addr v2, v6

    .line 46
    invoke-virtual {v3}, Landroidx/work/impl/WorkContinuationImpl;->getParents()Ljava/util/List;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 173
    .local v4, "it":Ljava/util/List;
    const/4 v5, 0x0

    .line 46
    .local v5, "$i$a$-let-EnqueueUtilsKt$checkContentUriTriggerWorkerLimits$2":I
    move-object v6, v4

    check-cast v6, Ljava/util/Collection;

    invoke-interface {v0, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .end local v4    # "it":Ljava/util/List;
    .end local v5    # "$i$a$-let-EnqueueUtilsKt$checkContentUriTriggerWorkerLimits$2":I
    goto :goto_0

    .end local v3    # "current":Landroidx/work/impl/WorkContinuationImpl;
    :cond_3
    goto :goto_0

    .line 48
    :cond_4
    if-nez v2, :cond_5

    return-void

    .line 49
    :cond_5
    invoke-virtual {p0}, Landroidx/work/impl/WorkDatabase;->workSpecDao()Landroidx/work/impl/model/WorkSpecDao;

    move-result-object v1

    invoke-interface {v1}, Landroidx/work/impl/model/WorkSpecDao;->countNonFinishedContentUriTriggerWorkers()I

    move-result v1

    .line 50
    .local v1, "alreadyEnqueuedCount":I
    invoke-virtual {p1}, Landroidx/work/Configuration;->getContentUriTriggerWorkersLimit()I

    move-result v3

    .line 51
    .local v3, "limit":I
    add-int v4, v1, v2

    if-gt v4, v3, :cond_6

    .line 64
    return-void

    .line 52
    :cond_6
    new-instance v4, Ljava/lang/IllegalArgumentException;

    .line 53
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Too many workers with contentUriTriggers are enqueued:\ncontentUriTrigger workers limit: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 54
    nop

    .line 53
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 54
    nop

    .line 53
    const-string v6, ";\nalready enqueued count: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 55
    nop

    .line 53
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 55
    nop

    .line 53
    const-string v6, ";\ncurrent enqueue operation count: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 56
    nop

    .line 53
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 56
    nop

    .line 53
    const-string v6, ".\nTo address this issue you can: \n1. enqueue less workers or batch some of workers with content uri triggers together;\n2. increase limit via Configuration.Builder.setContentUriTriggerWorkersLimit;\nPlease beware that workers with content uri triggers immediately occupy slots in JobScheduler so no updates to content uris are missed."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 52
    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public static final tryDelegateConstrainedWorkSpec(Landroidx/work/impl/model/WorkSpec;)Landroidx/work/impl/model/WorkSpec;
    .locals 38
    .param p0, "workSpec"    # Landroidx/work/impl/model/WorkSpec;

    move-object/from16 v1, p0

    const-string/jumbo v0, "workSpec"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 93
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpec;->constraints:Landroidx/work/Constraints;

    .line 94
    .local v0, "constraints":Landroidx/work/Constraints;
    iget-object v2, v1, Landroidx/work/impl/model/WorkSpec;->workerClassName:Ljava/lang/String;

    .line 102
    .local v2, "workerClassName":Ljava/lang/String;
    const-class v3, Landroidx/work/impl/workers/ConstraintTrackingWorker;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v36

    .line 103
    .local v36, "isConstraintTrackingWorker":Z
    nop

    .line 104
    if-nez v36, :cond_2

    .line 105
    invoke-virtual {v0}, Landroidx/work/Constraints;->requiresBatteryNotLow()Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v0}, Landroidx/work/Constraints;->requiresStorageNotLow()Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    move-object/from16 v37, v2

    goto/16 :goto_1

    .line 108
    :cond_1
    :goto_0
    new-instance v3, Landroidx/work/Data$Builder;

    invoke-direct {v3}, Landroidx/work/Data$Builder;-><init>()V

    .line 109
    iget-object v4, v1, Landroidx/work/impl/model/WorkSpec;->input:Landroidx/work/Data;

    invoke-virtual {v3, v4}, Landroidx/work/Data$Builder;->putAll(Landroidx/work/Data;)Landroidx/work/Data$Builder;

    move-result-object v3

    .line 110
    const-string v4, "androidx.work.impl.workers.ConstraintTrackingWorker.ARGUMENT_CLASS_NAME"

    invoke-virtual {v3, v4, v2}, Landroidx/work/Data$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroidx/work/Data$Builder;

    move-result-object v3

    .line 111
    invoke-virtual {v3}, Landroidx/work/Data$Builder;->build()Landroidx/work/Data;

    move-result-object v6

    .line 107
    nop

    .line 114
    .local v6, "newInputData":Landroidx/work/Data;
    const-class v3, Landroidx/work/impl/workers/ConstraintTrackingWorker;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    .line 112
    nop

    .line 114
    const-string v3, "name"

    invoke-static {v4, v3}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 112
    nop

    .line 113
    nop

    .line 112
    const v34, 0xffffeb

    const/16 v35, 0x0

    move-object v3, v2

    .end local v2    # "workerClassName":Ljava/lang/String;
    .local v3, "workerClassName":Ljava/lang/String;
    const/4 v2, 0x0

    move-object v5, v3

    .end local v3    # "workerClassName":Ljava/lang/String;
    .local v5, "workerClassName":Ljava/lang/String;
    const/4 v3, 0x0

    move-object v7, v5

    .end local v5    # "workerClassName":Ljava/lang/String;
    .local v7, "workerClassName":Ljava/lang/String;
    const/4 v5, 0x0

    move-object v8, v7

    .end local v7    # "workerClassName":Ljava/lang/String;
    .local v8, "workerClassName":Ljava/lang/String;
    const/4 v7, 0x0

    move-object v10, v8

    .end local v8    # "workerClassName":Ljava/lang/String;
    .local v10, "workerClassName":Ljava/lang/String;
    const-wide/16 v8, 0x0

    move-object v12, v10

    .end local v10    # "workerClassName":Ljava/lang/String;
    .local v12, "workerClassName":Ljava/lang/String;
    const-wide/16 v10, 0x0

    move-object v14, v12

    .end local v12    # "workerClassName":Ljava/lang/String;
    .local v14, "workerClassName":Ljava/lang/String;
    const-wide/16 v12, 0x0

    move-object v15, v14

    .end local v14    # "workerClassName":Ljava/lang/String;
    .local v15, "workerClassName":Ljava/lang/String;
    const/4 v14, 0x0

    move-object/from16 v16, v15

    .end local v15    # "workerClassName":Ljava/lang/String;
    .local v16, "workerClassName":Ljava/lang/String;
    const/4 v15, 0x0

    move-object/from16 v17, v16

    .end local v16    # "workerClassName":Ljava/lang/String;
    .local v17, "workerClassName":Ljava/lang/String;
    const/16 v16, 0x0

    move-object/from16 v19, v17

    .end local v17    # "workerClassName":Ljava/lang/String;
    .local v19, "workerClassName":Ljava/lang/String;
    const-wide/16 v17, 0x0

    move-object/from16 v21, v19

    .end local v19    # "workerClassName":Ljava/lang/String;
    .local v21, "workerClassName":Ljava/lang/String;
    const-wide/16 v19, 0x0

    move-object/from16 v23, v21

    .end local v21    # "workerClassName":Ljava/lang/String;
    .local v23, "workerClassName":Ljava/lang/String;
    const-wide/16 v21, 0x0

    move-object/from16 v25, v23

    .end local v23    # "workerClassName":Ljava/lang/String;
    .local v25, "workerClassName":Ljava/lang/String;
    const-wide/16 v23, 0x0

    move-object/from16 v26, v25

    .end local v25    # "workerClassName":Ljava/lang/String;
    .local v26, "workerClassName":Ljava/lang/String;
    const/16 v25, 0x0

    move-object/from16 v27, v26

    .end local v26    # "workerClassName":Ljava/lang/String;
    .local v27, "workerClassName":Ljava/lang/String;
    const/16 v26, 0x0

    move-object/from16 v28, v27

    .end local v27    # "workerClassName":Ljava/lang/String;
    .local v28, "workerClassName":Ljava/lang/String;
    const/16 v27, 0x0

    move-object/from16 v29, v28

    .end local v28    # "workerClassName":Ljava/lang/String;
    .local v29, "workerClassName":Ljava/lang/String;
    const/16 v28, 0x0

    move-object/from16 v31, v29

    .end local v29    # "workerClassName":Ljava/lang/String;
    .local v31, "workerClassName":Ljava/lang/String;
    const-wide/16 v29, 0x0

    move-object/from16 v32, v31

    .end local v31    # "workerClassName":Ljava/lang/String;
    .local v32, "workerClassName":Ljava/lang/String;
    const/16 v31, 0x0

    move-object/from16 v33, v32

    .end local v32    # "workerClassName":Ljava/lang/String;
    .local v33, "workerClassName":Ljava/lang/String;
    const/16 v32, 0x0

    move-object/from16 v37, v33

    .end local v33    # "workerClassName":Ljava/lang/String;
    .local v37, "workerClassName":Ljava/lang/String;
    const/16 v33, 0x0

    invoke-static/range {v1 .. v35}, Landroidx/work/impl/model/WorkSpec;->copy$default(Landroidx/work/impl/model/WorkSpec;Ljava/lang/String;Landroidx/work/WorkInfo$State;Ljava/lang/String;Ljava/lang/String;Landroidx/work/Data;Landroidx/work/Data;JJJLandroidx/work/Constraints;ILandroidx/work/BackoffPolicy;JJJJZLandroidx/work/OutOfQuotaPolicy;IIJIILjava/lang/String;ILjava/lang/Object;)Landroidx/work/impl/model/WorkSpec;

    move-result-object v2

    return-object v2

    .line 104
    .end local v6    # "newInputData":Landroidx/work/Data;
    .end local v37    # "workerClassName":Ljava/lang/String;
    .restart local v2    # "workerClassName":Ljava/lang/String;
    :cond_2
    move-object/from16 v37, v2

    .line 117
    .end local v2    # "workerClassName":Ljava/lang/String;
    .restart local v37    # "workerClassName":Ljava/lang/String;
    :goto_1
    return-object p0
.end method

.method public static final tryDelegateRemoteListenableWorker(Landroidx/work/impl/model/WorkSpec;)Landroidx/work/impl/model/WorkSpec;
    .locals 39
    .param p0, "workSpec"    # Landroidx/work/impl/model/WorkSpec;

    move-object/from16 v1, p0

    const-string/jumbo v0, "workSpec"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpec;->input:Landroidx/work/Data;

    .local v0, "this_$iv":Landroidx/work/Data;
    const-string v2, "androidx.work.multiprocess.RemoteListenableDelegatingWorker.ARGUMENT_REMOTE_LISTENABLE_WORKER_NAME"

    .local v2, "key$iv":Ljava/lang/String;
    const/4 v3, 0x0

    .line 174
    .local v3, "$i$f$hasKey$work_runtime_release":I
    const-class v4, Ljava/lang/String;

    invoke-virtual {v0, v2, v4}, Landroidx/work/Data;->hasKeyWithValueOfType(Ljava/lang/String;Ljava/lang/Class;)Z

    move-result v0

    .line 71
    .end local v0    # "this_$iv":Landroidx/work/Data;
    .end local v2    # "key$iv":Ljava/lang/String;
    .end local v3    # "$i$f$hasKey$work_runtime_release":I
    nop

    .line 72
    .local v0, "hasDelegateWorker":Z
    iget-object v2, v1, Landroidx/work/impl/model/WorkSpec;->input:Landroidx/work/Data;

    .local v2, "this_$iv":Landroidx/work/Data;
    const-string v3, "androidx.work.impl.workers.RemoteListenableWorker.ARGUMENT_PACKAGE_NAME"

    .local v3, "key$iv":Ljava/lang/String;
    const/4 v4, 0x0

    .line 175
    .local v4, "$i$f$hasKey$work_runtime_release":I
    const-class v5, Ljava/lang/String;

    invoke-virtual {v2, v3, v5}, Landroidx/work/Data;->hasKeyWithValueOfType(Ljava/lang/String;Ljava/lang/Class;)Z

    move-result v2

    .line 72
    .end local v2    # "this_$iv":Landroidx/work/Data;
    .end local v3    # "key$iv":Ljava/lang/String;
    .end local v4    # "$i$f$hasKey$work_runtime_release":I
    move/from16 v36, v2

    .line 73
    .local v36, "hasPackageName":Z
    iget-object v2, v1, Landroidx/work/impl/model/WorkSpec;->input:Landroidx/work/Data;

    .restart local v2    # "this_$iv":Landroidx/work/Data;
    const-string v3, "androidx.work.impl.workers.RemoteListenableWorker.ARGUMENT_CLASS_NAME"

    .restart local v3    # "key$iv":Ljava/lang/String;
    const/4 v4, 0x0

    .line 176
    .restart local v4    # "$i$f$hasKey$work_runtime_release":I
    const-class v5, Ljava/lang/String;

    invoke-virtual {v2, v3, v5}, Landroidx/work/Data;->hasKeyWithValueOfType(Ljava/lang/String;Ljava/lang/Class;)Z

    move-result v2

    .line 73
    .end local v2    # "this_$iv":Landroidx/work/Data;
    .end local v3    # "key$iv":Ljava/lang/String;
    .end local v4    # "$i$f$hasKey$work_runtime_release":I
    move/from16 v37, v2

    .line 74
    .local v37, "hasClassName":Z
    if-nez v0, :cond_0

    if-eqz v36, :cond_0

    if-eqz v37, :cond_0

    .line 75
    iget-object v2, v1, Landroidx/work/impl/model/WorkSpec;->workerClassName:Ljava/lang/String;

    .line 77
    .local v2, "workerClassName":Ljava/lang/String;
    new-instance v3, Landroidx/work/Data$Builder;

    invoke-direct {v3}, Landroidx/work/Data$Builder;-><init>()V

    .line 78
    iget-object v4, v1, Landroidx/work/impl/model/WorkSpec;->input:Landroidx/work/Data;

    invoke-virtual {v3, v4}, Landroidx/work/Data$Builder;->putAll(Landroidx/work/Data;)Landroidx/work/Data$Builder;

    move-result-object v3

    .line 79
    const-string v4, "androidx.work.multiprocess.RemoteListenableDelegatingWorker.ARGUMENT_REMOTE_LISTENABLE_WORKER_NAME"

    invoke-virtual {v3, v4, v2}, Landroidx/work/Data$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroidx/work/Data$Builder;

    move-result-object v3

    .line 80
    invoke-virtual {v3}, Landroidx/work/Data$Builder;->build()Landroidx/work/Data;

    move-result-object v6

    .line 76
    nop

    .line 82
    .local v6, "newInputData":Landroidx/work/Data;
    nop

    .line 84
    nop

    .line 82
    nop

    .line 83
    nop

    .line 82
    const v34, 0xffffeb

    const/16 v35, 0x0

    move-object v3, v2

    .end local v2    # "workerClassName":Ljava/lang/String;
    .local v3, "workerClassName":Ljava/lang/String;
    const/4 v2, 0x0

    move-object v4, v3

    .end local v3    # "workerClassName":Ljava/lang/String;
    .local v4, "workerClassName":Ljava/lang/String;
    const/4 v3, 0x0

    move-object v5, v4

    .end local v4    # "workerClassName":Ljava/lang/String;
    .local v5, "workerClassName":Ljava/lang/String;
    const-string v4, "androidx.work.multiprocess.RemoteListenableDelegatingWorker"

    move-object v7, v5

    .end local v5    # "workerClassName":Ljava/lang/String;
    .local v7, "workerClassName":Ljava/lang/String;
    const/4 v5, 0x0

    move-object v8, v7

    .end local v7    # "workerClassName":Ljava/lang/String;
    .local v8, "workerClassName":Ljava/lang/String;
    const/4 v7, 0x0

    move-object v10, v8

    .end local v8    # "workerClassName":Ljava/lang/String;
    .local v10, "workerClassName":Ljava/lang/String;
    const-wide/16 v8, 0x0

    move-object v12, v10

    .end local v10    # "workerClassName":Ljava/lang/String;
    .local v12, "workerClassName":Ljava/lang/String;
    const-wide/16 v10, 0x0

    move-object v14, v12

    .end local v12    # "workerClassName":Ljava/lang/String;
    .local v14, "workerClassName":Ljava/lang/String;
    const-wide/16 v12, 0x0

    move-object v15, v14

    .end local v14    # "workerClassName":Ljava/lang/String;
    .local v15, "workerClassName":Ljava/lang/String;
    const/4 v14, 0x0

    move-object/from16 v16, v15

    .end local v15    # "workerClassName":Ljava/lang/String;
    .local v16, "workerClassName":Ljava/lang/String;
    const/4 v15, 0x0

    move-object/from16 v17, v16

    .end local v16    # "workerClassName":Ljava/lang/String;
    .local v17, "workerClassName":Ljava/lang/String;
    const/16 v16, 0x0

    move-object/from16 v19, v17

    .end local v17    # "workerClassName":Ljava/lang/String;
    .local v19, "workerClassName":Ljava/lang/String;
    const-wide/16 v17, 0x0

    move-object/from16 v21, v19

    .end local v19    # "workerClassName":Ljava/lang/String;
    .local v21, "workerClassName":Ljava/lang/String;
    const-wide/16 v19, 0x0

    move-object/from16 v23, v21

    .end local v21    # "workerClassName":Ljava/lang/String;
    .local v23, "workerClassName":Ljava/lang/String;
    const-wide/16 v21, 0x0

    move-object/from16 v25, v23

    .end local v23    # "workerClassName":Ljava/lang/String;
    .local v25, "workerClassName":Ljava/lang/String;
    const-wide/16 v23, 0x0

    move-object/from16 v26, v25

    .end local v25    # "workerClassName":Ljava/lang/String;
    .local v26, "workerClassName":Ljava/lang/String;
    const/16 v25, 0x0

    move-object/from16 v27, v26

    .end local v26    # "workerClassName":Ljava/lang/String;
    .local v27, "workerClassName":Ljava/lang/String;
    const/16 v26, 0x0

    move-object/from16 v28, v27

    .end local v27    # "workerClassName":Ljava/lang/String;
    .local v28, "workerClassName":Ljava/lang/String;
    const/16 v27, 0x0

    move-object/from16 v29, v28

    .end local v28    # "workerClassName":Ljava/lang/String;
    .local v29, "workerClassName":Ljava/lang/String;
    const/16 v28, 0x0

    move-object/from16 v31, v29

    .end local v29    # "workerClassName":Ljava/lang/String;
    .local v31, "workerClassName":Ljava/lang/String;
    const-wide/16 v29, 0x0

    move-object/from16 v32, v31

    .end local v31    # "workerClassName":Ljava/lang/String;
    .local v32, "workerClassName":Ljava/lang/String;
    const/16 v31, 0x0

    move-object/from16 v33, v32

    .end local v32    # "workerClassName":Ljava/lang/String;
    .local v33, "workerClassName":Ljava/lang/String;
    const/16 v32, 0x0

    move-object/from16 v38, v33

    .end local v33    # "workerClassName":Ljava/lang/String;
    .local v38, "workerClassName":Ljava/lang/String;
    const/16 v33, 0x0

    invoke-static/range {v1 .. v35}, Landroidx/work/impl/model/WorkSpec;->copy$default(Landroidx/work/impl/model/WorkSpec;Ljava/lang/String;Landroidx/work/WorkInfo$State;Ljava/lang/String;Ljava/lang/String;Landroidx/work/Data;Landroidx/work/Data;JJJLandroidx/work/Constraints;ILandroidx/work/BackoffPolicy;JJJJZLandroidx/work/OutOfQuotaPolicy;IIJIILjava/lang/String;ILjava/lang/Object;)Landroidx/work/impl/model/WorkSpec;

    move-result-object v2

    return-object v2

    .line 87
    .end local v6    # "newInputData":Landroidx/work/Data;
    .end local v38    # "workerClassName":Ljava/lang/String;
    :cond_0
    return-object p0
.end method

.method private static final usesScheduler(Ljava/util/List;Ljava/lang/String;)Z
    .locals 9
    .param p0, "schedulers"    # Ljava/util/List;
    .param p1, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroidx/work/impl/Scheduler;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 138
    nop

    .line 139
    const/4 v0, 0x0

    :try_start_0
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 140
    .local v1, "klass":Ljava/lang/Class;
    move-object v2, p0

    check-cast v2, Ljava/lang/Iterable;

    .local v2, "$this$any$iv":Ljava/lang/Iterable;
    const/4 v3, 0x0

    .line 177
    .local v3, "$i$f$any":I
    instance-of v4, v2, Ljava/util/Collection;

    if-eqz v4, :cond_0

    move-object v4, v2

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    .line 178
    :cond_0
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .local v5, "element$iv":Ljava/lang/Object;
    move-object v6, v5

    check-cast v6, Landroidx/work/impl/Scheduler;

    .local v6, "scheduler":Landroidx/work/impl/Scheduler;
    const/4 v7, 0x0

    .line 140
    .local v7, "$i$a$-any-EnqueueUtilsKt$usesScheduler$1":I
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v1, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 178
    .end local v6    # "scheduler":Landroidx/work/impl/Scheduler;
    .end local v7    # "$i$a$-any-EnqueueUtilsKt$usesScheduler$1":I
    if-eqz v8, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    .line 179
    .end local v5    # "element$iv":Ljava/lang/Object;
    :cond_2
    nop

    .line 140
    .end local v2    # "$this$any$iv":Ljava/lang/Iterable;
    .end local v3    # "$i$f$any":I
    :goto_0
    return v0

    .line 141
    .end local v1    # "klass":Ljava/lang/Class;
    :catch_0
    move-exception v1

    .line 142
    .local v1, "ignore":Ljava/lang/ClassNotFoundException;
    nop

    .line 138
    .end local v1    # "ignore":Ljava/lang/ClassNotFoundException;
    return v0
.end method

.method public static final wrapWorkSpecIfNeeded(Ljava/util/List;Landroidx/work/impl/model/WorkSpec;)Landroidx/work/impl/model/WorkSpec;
    .locals 3
    .param p0, "schedulers"    # Ljava/util/List;
    .param p1, "workSpec"    # Landroidx/work/impl/model/WorkSpec;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroidx/work/impl/Scheduler;",
            ">;",
            "Landroidx/work/impl/model/WorkSpec;",
            ")",
            "Landroidx/work/impl/model/WorkSpec;"
        }
    .end annotation

    const-string/jumbo v0, "schedulers"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "workSpec"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 125
    invoke-static {p1}, Landroidx/work/impl/utils/EnqueueUtilsKt;->tryDelegateRemoteListenableWorker(Landroidx/work/impl/model/WorkSpec;)Landroidx/work/impl/model/WorkSpec;

    move-result-object v0

    .line 127
    .local v0, "delegated":Landroidx/work/impl/model/WorkSpec;
    nop

    .line 128
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-ge v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_1

    .line 129
    invoke-static {v0}, Landroidx/work/impl/utils/EnqueueUtilsKt;->tryDelegateConstrainedWorkSpec(Landroidx/work/impl/model/WorkSpec;)Landroidx/work/impl/model/WorkSpec;

    move-result-object v1

    goto :goto_1

    .line 130
    :cond_1
    nop

    .line 133
    move-object v1, v0

    .line 127
    :goto_1
    return-object v1
.end method
