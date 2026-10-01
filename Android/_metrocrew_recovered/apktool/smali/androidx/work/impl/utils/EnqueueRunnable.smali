.class public Landroidx/work/impl/utils/EnqueueRunnable;
.super Ljava/lang/Object;
.source "EnqueueRunnable.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 64
    const-string v0, "EnqueueRunnable"

    invoke-static {v0}, Landroidx/work/Logger;->tagWithPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/work/impl/utils/EnqueueRunnable;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    return-void
.end method

.method public static addToDatabase(Landroidx/work/impl/WorkContinuationImpl;)Z
    .locals 3
    .param p0, "workContinuation"    # Landroidx/work/impl/WorkContinuationImpl;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "workContinuation"
        }
    .end annotation

    .line 87
    invoke-virtual {p0}, Landroidx/work/impl/WorkContinuationImpl;->getWorkManagerImpl()Landroidx/work/impl/WorkManagerImpl;

    move-result-object v0

    .line 88
    .local v0, "workManagerImpl":Landroidx/work/impl/WorkManagerImpl;
    invoke-virtual {v0}, Landroidx/work/impl/WorkManagerImpl;->getWorkDatabase()Landroidx/work/impl/WorkDatabase;

    move-result-object v1

    .line 89
    .local v1, "workDatabase":Landroidx/work/impl/WorkDatabase;
    invoke-virtual {v1}, Landroidx/work/impl/WorkDatabase;->beginTransaction()V

    .line 91
    nop

    .line 92
    :try_start_0
    invoke-virtual {v0}, Landroidx/work/impl/WorkManagerImpl;->getConfiguration()Landroidx/work/Configuration;

    move-result-object v2

    .line 91
    invoke-static {v1, v2, p0}, Landroidx/work/impl/utils/EnqueueUtilsKt;->checkContentUriTriggerWorkerLimits(Landroidx/work/impl/WorkDatabase;Landroidx/work/Configuration;Landroidx/work/impl/WorkContinuationImpl;)V

    .line 93
    invoke-static {p0}, Landroidx/work/impl/utils/EnqueueRunnable;->processContinuation(Landroidx/work/impl/WorkContinuationImpl;)Z

    move-result v2

    .line 94
    .local v2, "needsScheduling":Z
    invoke-virtual {v1}, Landroidx/work/impl/WorkDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 95
    nop

    .line 97
    invoke-virtual {v1}, Landroidx/work/impl/WorkDatabase;->endTransaction()V

    .line 95
    return v2

    .line 97
    .end local v2    # "needsScheduling":Z
    :catchall_0
    move-exception v2

    invoke-virtual {v1}, Landroidx/work/impl/WorkDatabase;->endTransaction()V

    .line 98
    throw v2
.end method

.method public static enqueue(Landroidx/work/impl/WorkContinuationImpl;)V
    .locals 3
    .param p0, "workContinuation"    # Landroidx/work/impl/WorkContinuationImpl;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "workContinuation"
        }
    .end annotation

    .line 70
    invoke-virtual {p0}, Landroidx/work/impl/WorkContinuationImpl;->hasCycles()Z

    move-result v0

    if-nez v0, :cond_1

    .line 74
    invoke-static {p0}, Landroidx/work/impl/utils/EnqueueRunnable;->addToDatabase(Landroidx/work/impl/WorkContinuationImpl;)Z

    move-result v0

    .line 75
    .local v0, "needsScheduling":Z
    if-eqz v0, :cond_0

    .line 76
    invoke-static {p0}, Landroidx/work/impl/utils/EnqueueRunnable;->scheduleWorkInBackground(Landroidx/work/impl/WorkContinuationImpl;)V

    .line 78
    :cond_0
    return-void

    .line 71
    .end local v0    # "needsScheduling":Z
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "WorkContinuation has cycles ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static enqueueContinuation(Landroidx/work/impl/WorkContinuationImpl;)Z
    .locals 6
    .param p0, "workContinuation"    # Landroidx/work/impl/WorkContinuationImpl;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "workContinuation"
        }
    .end annotation

    .line 134
    invoke-static {p0}, Landroidx/work/impl/WorkContinuationImpl;->prerequisitesFor(Landroidx/work/impl/WorkContinuationImpl;)Ljava/util/Set;

    move-result-object v0

    .line 136
    .local v0, "prerequisiteIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    nop

    .line 137
    invoke-virtual {p0}, Landroidx/work/impl/WorkContinuationImpl;->getWorkManagerImpl()Landroidx/work/impl/WorkManagerImpl;

    move-result-object v1

    .line 138
    invoke-virtual {p0}, Landroidx/work/impl/WorkContinuationImpl;->getWork()Ljava/util/List;

    move-result-object v2

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/String;

    .line 139
    invoke-interface {v0, v3}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    .line 140
    invoke-virtual {p0}, Landroidx/work/impl/WorkContinuationImpl;->getName()Ljava/lang/String;

    move-result-object v4

    .line 141
    invoke-virtual {p0}, Landroidx/work/impl/WorkContinuationImpl;->getExistingWorkPolicy()Landroidx/work/ExistingWorkPolicy;

    move-result-object v5

    .line 136
    invoke-static {v1, v2, v3, v4, v5}, Landroidx/work/impl/utils/EnqueueRunnable;->enqueueWorkWithPrerequisites(Landroidx/work/impl/WorkManagerImpl;Ljava/util/List;[Ljava/lang/String;Ljava/lang/String;Landroidx/work/ExistingWorkPolicy;)Z

    move-result v1

    .line 143
    .local v1, "needsScheduling":Z
    invoke-virtual {p0}, Landroidx/work/impl/WorkContinuationImpl;->markEnqueued()V

    .line 144
    return v1
.end method

.method private static enqueueWorkWithPrerequisites(Landroidx/work/impl/WorkManagerImpl;Ljava/util/List;[Ljava/lang/String;Ljava/lang/String;Landroidx/work/ExistingWorkPolicy;)Z
    .locals 22
    .param p0, "workManagerImpl"    # Landroidx/work/impl/WorkManagerImpl;
    .param p2, "prerequisiteIds"    # [Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "existingWorkPolicy"    # Landroidx/work/ExistingWorkPolicy;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "workManagerImpl",
            "workList",
            "prerequisiteIds",
            "name",
            "existingWorkPolicy"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/work/impl/WorkManagerImpl;",
            "Ljava/util/List<",
            "+",
            "Landroidx/work/WorkRequest;",
            ">;[",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroidx/work/ExistingWorkPolicy;",
            ")Z"
        }
    .end annotation

    .line 159
    .local p1, "workList":Ljava/util/List;, "Ljava/util/List<+Landroidx/work/WorkRequest;>;"
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    const/4 v3, 0x0

    .line 161
    .local v3, "needsScheduling":Z
    invoke-virtual/range {p0 .. p0}, Landroidx/work/impl/WorkManagerImpl;->getConfiguration()Landroidx/work/Configuration;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/work/Configuration;->getClock()Landroidx/work/Clock;

    move-result-object v4

    invoke-interface {v4}, Landroidx/work/Clock;->currentTimeMillis()J

    move-result-wide v4

    .line 162
    .local v4, "currentTimeMillis":J
    invoke-virtual/range {p0 .. p0}, Landroidx/work/impl/WorkManagerImpl;->getWorkDatabase()Landroidx/work/impl/WorkDatabase;

    move-result-object v6

    .line 164
    .local v6, "workDatabase":Landroidx/work/impl/WorkDatabase;
    if-eqz v0, :cond_0

    array-length v9, v0

    if-lez v9, :cond_0

    const/4 v9, 0x1

    goto :goto_0

    :cond_0
    const/4 v9, 0x0

    .line 165
    .local v9, "hasPrerequisite":Z
    :goto_0
    const/4 v10, 0x1

    .line 166
    .local v10, "hasCompletedAllPrerequisites":Z
    const/4 v11, 0x0

    .line 167
    .local v11, "hasFailedPrerequisites":Z
    const/4 v12, 0x0

    .line 169
    .local v12, "hasCancelledPrerequisites":Z
    if-eqz v9, :cond_6

    .line 173
    array-length v13, v0

    const/4 v14, 0x0

    :goto_1
    if-ge v14, v13, :cond_5

    aget-object v15, v0, v14

    .line 174
    .local v15, "id":Ljava/lang/String;
    const/16 v16, 0x1

    invoke-virtual {v6}, Landroidx/work/impl/WorkDatabase;->workSpecDao()Landroidx/work/impl/model/WorkSpecDao;

    move-result-object v7

    invoke-interface {v7, v15}, Landroidx/work/impl/model/WorkSpecDao;->getWorkSpec(Ljava/lang/String;)Landroidx/work/impl/model/WorkSpec;

    move-result-object v7

    .line 175
    .local v7, "prerequisiteWorkSpec":Landroidx/work/impl/model/WorkSpec;
    if-nez v7, :cond_1

    .line 176
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v13

    sget-object v14, Landroidx/work/impl/utils/EnqueueRunnable;->TAG:Ljava/lang/String;

    const/16 v17, 0x0

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v18, v3

    .end local v3    # "needsScheduling":Z
    .local v18, "needsScheduling":Z
    const-string v3, "Prerequisite "

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v8, " doesn\'t exist; not enqueuing"

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v13, v14, v3}, Landroidx/work/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    return v17

    .line 180
    .end local v18    # "needsScheduling":Z
    .restart local v3    # "needsScheduling":Z
    :cond_1
    move/from16 v18, v3

    const/16 v17, 0x0

    .end local v3    # "needsScheduling":Z
    .restart local v18    # "needsScheduling":Z
    iget-object v3, v7, Landroidx/work/impl/model/WorkSpec;->state:Landroidx/work/WorkInfo$State;

    .line 181
    .local v3, "prerequisiteState":Landroidx/work/WorkInfo$State;
    sget-object v8, Landroidx/work/WorkInfo$State;->SUCCEEDED:Landroidx/work/WorkInfo$State;

    if-ne v3, v8, :cond_2

    move/from16 v8, v16

    goto :goto_2

    :cond_2
    move/from16 v8, v17

    :goto_2
    and-int/2addr v10, v8

    .line 182
    sget-object v8, Landroidx/work/WorkInfo$State;->FAILED:Landroidx/work/WorkInfo$State;

    if-ne v3, v8, :cond_3

    .line 183
    const/4 v8, 0x1

    move v11, v8

    .end local v11    # "hasFailedPrerequisites":Z
    .local v8, "hasFailedPrerequisites":Z
    goto :goto_3

    .line 184
    .end local v8    # "hasFailedPrerequisites":Z
    .restart local v11    # "hasFailedPrerequisites":Z
    :cond_3
    sget-object v8, Landroidx/work/WorkInfo$State;->CANCELLED:Landroidx/work/WorkInfo$State;

    if-ne v3, v8, :cond_4

    .line 185
    const/4 v8, 0x1

    move v12, v8

    .line 173
    .end local v3    # "prerequisiteState":Landroidx/work/WorkInfo$State;
    .end local v7    # "prerequisiteWorkSpec":Landroidx/work/impl/model/WorkSpec;
    .end local v15    # "id":Ljava/lang/String;
    :cond_4
    :goto_3
    add-int/lit8 v14, v14, 0x1

    move/from16 v3, v18

    goto :goto_1

    .end local v18    # "needsScheduling":Z
    .local v3, "needsScheduling":Z
    :cond_5
    move/from16 v18, v3

    const/16 v16, 0x1

    const/16 v17, 0x0

    .end local v3    # "needsScheduling":Z
    .restart local v18    # "needsScheduling":Z
    goto :goto_4

    .line 169
    .end local v18    # "needsScheduling":Z
    .restart local v3    # "needsScheduling":Z
    :cond_6
    move/from16 v18, v3

    const/16 v16, 0x1

    const/16 v17, 0x0

    .line 190
    .end local v3    # "needsScheduling":Z
    .restart local v18    # "needsScheduling":Z
    :goto_4
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    xor-int/lit8 v3, v3, 0x1

    .line 194
    .local v3, "isNamed":Z
    if-eqz v3, :cond_7

    if-nez v9, :cond_7

    move/from16 v7, v16

    goto :goto_5

    :cond_7
    move/from16 v7, v17

    .line 195
    .local v7, "shouldApplyExistingWorkPolicy":Z
    :goto_5
    if-eqz v7, :cond_19

    .line 197
    nop

    .line 198
    invoke-virtual {v6}, Landroidx/work/impl/WorkDatabase;->workSpecDao()Landroidx/work/impl/model/WorkSpecDao;

    move-result-object v8

    invoke-interface {v8, v1}, Landroidx/work/impl/model/WorkSpecDao;->getWorkSpecIdAndStatesForName(Ljava/lang/String;)Ljava/util/List;

    move-result-object v8

    .line 200
    .local v8, "existingWorkSpecIdAndStates":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec$IdAndState;>;"
    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_18

    .line 202
    sget-object v13, Landroidx/work/ExistingWorkPolicy;->APPEND:Landroidx/work/ExistingWorkPolicy;

    if-eq v2, v13, :cond_e

    sget-object v13, Landroidx/work/ExistingWorkPolicy;->APPEND_OR_REPLACE:Landroidx/work/ExistingWorkPolicy;

    if-ne v2, v13, :cond_8

    move/from16 v19, v3

    move-object/from16 v20, v6

    goto :goto_a

    .line 236
    :cond_8
    sget-object v13, Landroidx/work/ExistingWorkPolicy;->KEEP:Landroidx/work/ExistingWorkPolicy;

    if-ne v2, v13, :cond_c

    .line 237
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_6
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_b

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroidx/work/impl/model/WorkSpec$IdAndState;

    .line 238
    .local v14, "idAndState":Landroidx/work/impl/model/WorkSpec$IdAndState;
    iget-object v15, v14, Landroidx/work/impl/model/WorkSpec$IdAndState;->state:Landroidx/work/WorkInfo$State;

    move/from16 v19, v3

    .end local v3    # "isNamed":Z
    .local v19, "isNamed":Z
    sget-object v3, Landroidx/work/WorkInfo$State;->ENQUEUED:Landroidx/work/WorkInfo$State;

    if-eq v15, v3, :cond_a

    iget-object v3, v14, Landroidx/work/impl/model/WorkSpec$IdAndState;->state:Landroidx/work/WorkInfo$State;

    sget-object v15, Landroidx/work/WorkInfo$State;->RUNNING:Landroidx/work/WorkInfo$State;

    if-ne v3, v15, :cond_9

    goto :goto_7

    .line 241
    .end local v14    # "idAndState":Landroidx/work/impl/model/WorkSpec$IdAndState;
    :cond_9
    move/from16 v3, v19

    goto :goto_6

    .line 239
    .restart local v14    # "idAndState":Landroidx/work/impl/model/WorkSpec$IdAndState;
    :cond_a
    :goto_7
    return v17

    .line 237
    .end local v14    # "idAndState":Landroidx/work/impl/model/WorkSpec$IdAndState;
    .end local v19    # "isNamed":Z
    .restart local v3    # "isNamed":Z
    :cond_b
    move/from16 v19, v3

    .end local v3    # "isNamed":Z
    .restart local v19    # "isNamed":Z
    goto :goto_8

    .line 236
    .end local v19    # "isNamed":Z
    .restart local v3    # "isNamed":Z
    :cond_c
    move/from16 v19, v3

    .line 249
    .end local v3    # "isNamed":Z
    .restart local v19    # "isNamed":Z
    :goto_8
    move-object/from16 v3, p0

    invoke-static {v1, v3}, Landroidx/work/impl/utils/CancelWorkRunnable;->forNameInline(Ljava/lang/String;Landroidx/work/impl/WorkManagerImpl;)V

    .line 253
    const/4 v13, 0x1

    .line 256
    .end local v18    # "needsScheduling":Z
    .local v13, "needsScheduling":Z
    invoke-virtual {v6}, Landroidx/work/impl/WorkDatabase;->workSpecDao()Landroidx/work/impl/model/WorkSpecDao;

    move-result-object v14

    .line 257
    .local v14, "workSpecDao":Landroidx/work/impl/model/WorkSpecDao;
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v15

    :goto_9
    invoke-interface {v15}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_d

    invoke-interface {v15}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v3, v16

    check-cast v3, Landroidx/work/impl/model/WorkSpec$IdAndState;

    .line 258
    .local v3, "idAndState":Landroidx/work/impl/model/WorkSpec$IdAndState;
    move-object/from16 v20, v6

    .end local v6    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    .local v20, "workDatabase":Landroidx/work/impl/WorkDatabase;
    iget-object v6, v3, Landroidx/work/impl/model/WorkSpec$IdAndState;->id:Ljava/lang/String;

    invoke-interface {v14, v6}, Landroidx/work/impl/model/WorkSpecDao;->delete(Ljava/lang/String;)V

    .line 259
    .end local v3    # "idAndState":Landroidx/work/impl/model/WorkSpec$IdAndState;
    move-object/from16 v3, p0

    move-object/from16 v6, v20

    goto :goto_9

    .line 257
    .end local v20    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    .restart local v6    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    :cond_d
    move-object/from16 v20, v6

    .end local v6    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    .restart local v20    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    move v3, v13

    goto/16 :goto_12

    .line 202
    .end local v13    # "needsScheduling":Z
    .end local v14    # "workSpecDao":Landroidx/work/impl/model/WorkSpecDao;
    .end local v19    # "isNamed":Z
    .end local v20    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    .local v3, "isNamed":Z
    .restart local v6    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    .restart local v18    # "needsScheduling":Z
    :cond_e
    move/from16 v19, v3

    move-object/from16 v20, v6

    .line 203
    .end local v3    # "isNamed":Z
    .end local v6    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    .restart local v19    # "isNamed":Z
    .restart local v20    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    :goto_a
    invoke-virtual/range {v20 .. v20}, Landroidx/work/impl/WorkDatabase;->dependencyDao()Landroidx/work/impl/model/DependencyDao;

    move-result-object v3

    .line 204
    .local v3, "dependencyDao":Landroidx/work/impl/model/DependencyDao;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 205
    .local v6, "newPrerequisiteIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    :goto_b
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_13

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroidx/work/impl/model/WorkSpec$IdAndState;

    .line 206
    .local v14, "idAndState":Landroidx/work/impl/model/WorkSpec$IdAndState;
    iget-object v15, v14, Landroidx/work/impl/model/WorkSpec$IdAndState;->id:Ljava/lang/String;

    invoke-interface {v3, v15}, Landroidx/work/impl/model/DependencyDao;->hasDependents(Ljava/lang/String;)Z

    move-result v15

    if-nez v15, :cond_12

    .line 207
    iget-object v15, v14, Landroidx/work/impl/model/WorkSpec$IdAndState;->state:Landroidx/work/WorkInfo$State;

    move-object/from16 v21, v3

    .end local v3    # "dependencyDao":Landroidx/work/impl/model/DependencyDao;
    .local v21, "dependencyDao":Landroidx/work/impl/model/DependencyDao;
    sget-object v3, Landroidx/work/WorkInfo$State;->SUCCEEDED:Landroidx/work/WorkInfo$State;

    if-ne v15, v3, :cond_f

    move/from16 v3, v16

    goto :goto_c

    :cond_f
    move/from16 v3, v17

    :goto_c
    and-int/2addr v3, v10

    .line 208
    .end local v10    # "hasCompletedAllPrerequisites":Z
    .local v3, "hasCompletedAllPrerequisites":Z
    iget-object v10, v14, Landroidx/work/impl/model/WorkSpec$IdAndState;->state:Landroidx/work/WorkInfo$State;

    sget-object v15, Landroidx/work/WorkInfo$State;->FAILED:Landroidx/work/WorkInfo$State;

    if-ne v10, v15, :cond_10

    .line 209
    const/4 v11, 0x1

    goto :goto_d

    .line 210
    :cond_10
    iget-object v10, v14, Landroidx/work/impl/model/WorkSpec$IdAndState;->state:Landroidx/work/WorkInfo$State;

    sget-object v15, Landroidx/work/WorkInfo$State;->CANCELLED:Landroidx/work/WorkInfo$State;

    if-ne v10, v15, :cond_11

    .line 211
    const/4 v12, 0x1

    .line 213
    :cond_11
    :goto_d
    iget-object v10, v14, Landroidx/work/impl/model/WorkSpec$IdAndState;->id:Ljava/lang/String;

    invoke-interface {v6, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v10, v3

    goto :goto_e

    .line 206
    .end local v21    # "dependencyDao":Landroidx/work/impl/model/DependencyDao;
    .local v3, "dependencyDao":Landroidx/work/impl/model/DependencyDao;
    .restart local v10    # "hasCompletedAllPrerequisites":Z
    :cond_12
    move-object/from16 v21, v3

    .line 215
    .end local v3    # "dependencyDao":Landroidx/work/impl/model/DependencyDao;
    .end local v14    # "idAndState":Landroidx/work/impl/model/WorkSpec$IdAndState;
    .restart local v21    # "dependencyDao":Landroidx/work/impl/model/DependencyDao;
    :goto_e
    move-object/from16 v3, v21

    goto :goto_b

    .line 216
    .end local v21    # "dependencyDao":Landroidx/work/impl/model/DependencyDao;
    .restart local v3    # "dependencyDao":Landroidx/work/impl/model/DependencyDao;
    :cond_13
    move-object/from16 v21, v3

    .end local v3    # "dependencyDao":Landroidx/work/impl/model/DependencyDao;
    .restart local v21    # "dependencyDao":Landroidx/work/impl/model/DependencyDao;
    sget-object v3, Landroidx/work/ExistingWorkPolicy;->APPEND_OR_REPLACE:Landroidx/work/ExistingWorkPolicy;

    if-ne v2, v3, :cond_16

    .line 217
    if-nez v12, :cond_14

    if-eqz v11, :cond_16

    .line 219
    :cond_14
    invoke-virtual/range {v20 .. v20}, Landroidx/work/impl/WorkDatabase;->workSpecDao()Landroidx/work/impl/model/WorkSpecDao;

    move-result-object v3

    .line 220
    .local v3, "workSpecDao":Landroidx/work/impl/model/WorkSpecDao;
    nop

    .line 221
    invoke-interface {v3, v1}, Landroidx/work/impl/model/WorkSpecDao;->getWorkSpecIdAndStatesForName(Ljava/lang/String;)Ljava/util/List;

    move-result-object v13

    .line 222
    .local v13, "idAndStates":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec$IdAndState;>;"
    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_f
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_15

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroidx/work/impl/model/WorkSpec$IdAndState;

    .line 223
    .local v15, "idAndState":Landroidx/work/impl/model/WorkSpec$IdAndState;
    iget-object v2, v15, Landroidx/work/impl/model/WorkSpec$IdAndState;->id:Ljava/lang/String;

    invoke-interface {v3, v2}, Landroidx/work/impl/model/WorkSpecDao;->delete(Ljava/lang/String;)V

    .line 224
    .end local v15    # "idAndState":Landroidx/work/impl/model/WorkSpec$IdAndState;
    move-object/from16 v2, p4

    goto :goto_f

    .line 226
    :cond_15
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v6

    .line 227
    const/4 v2, 0x0

    .line 228
    .end local v12    # "hasCancelledPrerequisites":Z
    .local v2, "hasCancelledPrerequisites":Z
    const/4 v11, 0x0

    move v12, v2

    .line 231
    .end local v2    # "hasCancelledPrerequisites":Z
    .end local v3    # "workSpecDao":Landroidx/work/impl/model/WorkSpecDao;
    .end local v13    # "idAndStates":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec$IdAndState;>;"
    .restart local v12    # "hasCancelledPrerequisites":Z
    :cond_16
    invoke-interface {v6, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    move-object v0, v2

    check-cast v0, [Ljava/lang/String;

    .line 232
    .end local p2    # "prerequisiteIds":[Ljava/lang/String;
    .local v0, "prerequisiteIds":[Ljava/lang/String;
    array-length v2, v0

    if-lez v2, :cond_17

    goto :goto_10

    :cond_17
    move/from16 v16, v17

    :goto_10
    move/from16 v9, v16

    .line 233
    .end local v6    # "newPrerequisiteIds":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v21    # "dependencyDao":Landroidx/work/impl/model/DependencyDao;
    move/from16 v3, v18

    goto :goto_12

    .line 200
    .end local v0    # "prerequisiteIds":[Ljava/lang/String;
    .end local v19    # "isNamed":Z
    .end local v20    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    .local v3, "isNamed":Z
    .local v6, "workDatabase":Landroidx/work/impl/WorkDatabase;
    .restart local p2    # "prerequisiteIds":[Ljava/lang/String;
    :cond_18
    move/from16 v19, v3

    move-object/from16 v20, v6

    .end local v3    # "isNamed":Z
    .end local v6    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    .restart local v19    # "isNamed":Z
    .restart local v20    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    goto :goto_11

    .line 195
    .end local v8    # "existingWorkSpecIdAndStates":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec$IdAndState;>;"
    .end local v19    # "isNamed":Z
    .end local v20    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    .restart local v3    # "isNamed":Z
    .restart local v6    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    :cond_19
    move/from16 v19, v3

    move-object/from16 v20, v6

    .line 264
    .end local v3    # "isNamed":Z
    .end local v6    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    .restart local v19    # "isNamed":Z
    .restart local v20    # "workDatabase":Landroidx/work/impl/WorkDatabase;
    :goto_11
    move/from16 v3, v18

    .end local v18    # "needsScheduling":Z
    .end local p2    # "prerequisiteIds":[Ljava/lang/String;
    .restart local v0    # "prerequisiteIds":[Ljava/lang/String;
    .local v3, "needsScheduling":Z
    :goto_12
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_13
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_21

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/work/WorkRequest;

    .line 265
    .local v6, "work":Landroidx/work/WorkRequest;
    invoke-virtual {v6}, Landroidx/work/WorkRequest;->getWorkSpec()Landroidx/work/impl/model/WorkSpec;

    move-result-object v8

    .line 267
    .local v8, "workSpec":Landroidx/work/impl/model/WorkSpec;
    if-eqz v9, :cond_1c

    if-nez v10, :cond_1c

    .line 268
    if-eqz v11, :cond_1a

    .line 269
    sget-object v13, Landroidx/work/WorkInfo$State;->FAILED:Landroidx/work/WorkInfo$State;

    iput-object v13, v8, Landroidx/work/impl/model/WorkSpec;->state:Landroidx/work/WorkInfo$State;

    goto :goto_14

    .line 270
    :cond_1a
    if-eqz v12, :cond_1b

    .line 271
    sget-object v13, Landroidx/work/WorkInfo$State;->CANCELLED:Landroidx/work/WorkInfo$State;

    iput-object v13, v8, Landroidx/work/impl/model/WorkSpec;->state:Landroidx/work/WorkInfo$State;

    goto :goto_14

    .line 273
    :cond_1b
    sget-object v13, Landroidx/work/WorkInfo$State;->BLOCKED:Landroidx/work/WorkInfo$State;

    iput-object v13, v8, Landroidx/work/impl/model/WorkSpec;->state:Landroidx/work/WorkInfo$State;

    goto :goto_14

    .line 279
    :cond_1c
    iput-wide v4, v8, Landroidx/work/impl/model/WorkSpec;->lastEnqueueTime:J

    .line 283
    :goto_14
    iget-object v13, v8, Landroidx/work/impl/model/WorkSpec;->state:Landroidx/work/WorkInfo$State;

    sget-object v14, Landroidx/work/WorkInfo$State;->ENQUEUED:Landroidx/work/WorkInfo$State;

    if-ne v13, v14, :cond_1d

    .line 284
    const/4 v3, 0x1

    .line 287
    :cond_1d
    invoke-virtual/range {v20 .. v20}, Landroidx/work/impl/WorkDatabase;->workSpecDao()Landroidx/work/impl/model/WorkSpecDao;

    move-result-object v13

    .line 289
    invoke-virtual/range {p0 .. p0}, Landroidx/work/impl/WorkManagerImpl;->getSchedulers()Ljava/util/List;

    move-result-object v14

    .line 288
    invoke-static {v14, v8}, Landroidx/work/impl/utils/EnqueueUtilsKt;->wrapWorkSpecIfNeeded(Ljava/util/List;Landroidx/work/impl/model/WorkSpec;)Landroidx/work/impl/model/WorkSpec;

    move-result-object v14

    .line 287
    invoke-interface {v13, v14}, Landroidx/work/impl/model/WorkSpecDao;->insertWorkSpec(Landroidx/work/impl/model/WorkSpec;)V

    .line 294
    if-eqz v9, :cond_1f

    .line 295
    array-length v13, v0

    move/from16 v14, v17

    :goto_15
    if-ge v14, v13, :cond_1e

    aget-object v15, v0, v14

    .line 296
    .local v15, "prerequisiteId":Ljava/lang/String;
    move-object/from16 v16, v0

    .end local v0    # "prerequisiteIds":[Ljava/lang/String;
    .local v16, "prerequisiteIds":[Ljava/lang/String;
    new-instance v0, Landroidx/work/impl/model/Dependency;

    move-object/from16 p2, v2

    invoke-virtual {v6}, Landroidx/work/WorkRequest;->getStringId()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2, v15}, Landroidx/work/impl/model/Dependency;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    .local v0, "dep":Landroidx/work/impl/model/Dependency;
    invoke-virtual/range {v20 .. v20}, Landroidx/work/impl/WorkDatabase;->dependencyDao()Landroidx/work/impl/model/DependencyDao;

    move-result-object v2

    invoke-interface {v2, v0}, Landroidx/work/impl/model/DependencyDao;->insertDependency(Landroidx/work/impl/model/Dependency;)V

    .line 295
    .end local v0    # "dep":Landroidx/work/impl/model/Dependency;
    .end local v15    # "prerequisiteId":Ljava/lang/String;
    add-int/lit8 v14, v14, 0x1

    move-object/from16 v2, p2

    move-object/from16 v0, v16

    goto :goto_15

    .end local v16    # "prerequisiteIds":[Ljava/lang/String;
    .local v0, "prerequisiteIds":[Ljava/lang/String;
    :cond_1e
    move-object/from16 v16, v0

    move-object/from16 p2, v2

    .end local v0    # "prerequisiteIds":[Ljava/lang/String;
    .restart local v16    # "prerequisiteIds":[Ljava/lang/String;
    goto :goto_16

    .line 294
    .end local v16    # "prerequisiteIds":[Ljava/lang/String;
    .restart local v0    # "prerequisiteIds":[Ljava/lang/String;
    :cond_1f
    move-object/from16 v16, v0

    move-object/from16 p2, v2

    .line 301
    .end local v0    # "prerequisiteIds":[Ljava/lang/String;
    .restart local v16    # "prerequisiteIds":[Ljava/lang/String;
    :goto_16
    invoke-virtual/range {v20 .. v20}, Landroidx/work/impl/WorkDatabase;->workTagDao()Landroidx/work/impl/model/WorkTagDao;

    move-result-object v0

    invoke-virtual {v6}, Landroidx/work/WorkRequest;->getStringId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6}, Landroidx/work/WorkRequest;->getTags()Ljava/util/Set;

    move-result-object v13

    invoke-interface {v0, v2, v13}, Landroidx/work/impl/model/WorkTagDao;->insertTags(Ljava/lang/String;Ljava/util/Set;)V

    .line 302
    if-eqz v19, :cond_20

    .line 303
    invoke-virtual/range {v20 .. v20}, Landroidx/work/impl/WorkDatabase;->workNameDao()Landroidx/work/impl/model/WorkNameDao;

    move-result-object v0

    new-instance v2, Landroidx/work/impl/model/WorkName;

    invoke-virtual {v6}, Landroidx/work/WorkRequest;->getStringId()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v2, v1, v13}, Landroidx/work/impl/model/WorkName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Landroidx/work/impl/model/WorkNameDao;->insert(Landroidx/work/impl/model/WorkName;)V

    .line 305
    .end local v6    # "work":Landroidx/work/WorkRequest;
    .end local v8    # "workSpec":Landroidx/work/impl/model/WorkSpec;
    :cond_20
    move-object/from16 v2, p2

    move-object/from16 v0, v16

    goto/16 :goto_13

    .line 306
    .end local v16    # "prerequisiteIds":[Ljava/lang/String;
    .restart local v0    # "prerequisiteIds":[Ljava/lang/String;
    :cond_21
    return v3
.end method

.method private static processContinuation(Landroidx/work/impl/WorkContinuationImpl;)Z
    .locals 9
    .param p0, "workContinuation"    # Landroidx/work/impl/WorkContinuationImpl;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "workContinuation"
        }
    .end annotation

    .line 114
    const/4 v0, 0x0

    .line 115
    .local v0, "needsScheduling":Z
    invoke-virtual {p0}, Landroidx/work/impl/WorkContinuationImpl;->getParents()Ljava/util/List;

    move-result-object v1

    .line 116
    .local v1, "parents":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/WorkContinuationImpl;>;"
    if-eqz v1, :cond_1

    .line 117
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroidx/work/impl/WorkContinuationImpl;

    .line 120
    .local v3, "parent":Landroidx/work/impl/WorkContinuationImpl;
    invoke-virtual {v3}, Landroidx/work/impl/WorkContinuationImpl;->isEnqueued()Z

    move-result v4

    if-nez v4, :cond_0

    .line 121
    invoke-static {v3}, Landroidx/work/impl/utils/EnqueueRunnable;->processContinuation(Landroidx/work/impl/WorkContinuationImpl;)Z

    move-result v4

    or-int/2addr v0, v4

    goto :goto_1

    .line 123
    :cond_0
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v4

    sget-object v5, Landroidx/work/impl/utils/EnqueueRunnable;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Already enqueued work ids ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    .line 125
    invoke-virtual {v3}, Landroidx/work/impl/WorkContinuationImpl;->getIds()Ljava/util/List;

    move-result-object v7

    const-string v8, ", "

    invoke-static {v8, v7}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 123
    invoke-virtual {v4, v5, v6}, Landroidx/work/Logger;->warning(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .end local v3    # "parent":Landroidx/work/impl/WorkContinuationImpl;
    :goto_1
    goto :goto_0

    .line 129
    :cond_1
    invoke-static {p0}, Landroidx/work/impl/utils/EnqueueRunnable;->enqueueContinuation(Landroidx/work/impl/WorkContinuationImpl;)Z

    move-result v2

    or-int/2addr v0, v2

    .line 130
    return v0
.end method

.method public static scheduleWorkInBackground(Landroidx/work/impl/WorkContinuationImpl;)V
    .locals 4
    .param p0, "workContinuation"    # Landroidx/work/impl/WorkContinuationImpl;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "workContinuation"
        }
    .end annotation

    .line 106
    invoke-virtual {p0}, Landroidx/work/impl/WorkContinuationImpl;->getWorkManagerImpl()Landroidx/work/impl/WorkManagerImpl;

    move-result-object v0

    .line 107
    .local v0, "workManager":Landroidx/work/impl/WorkManagerImpl;
    nop

    .line 108
    invoke-virtual {v0}, Landroidx/work/impl/WorkManagerImpl;->getConfiguration()Landroidx/work/Configuration;

    move-result-object v1

    .line 109
    invoke-virtual {v0}, Landroidx/work/impl/WorkManagerImpl;->getWorkDatabase()Landroidx/work/impl/WorkDatabase;

    move-result-object v2

    .line 110
    invoke-virtual {v0}, Landroidx/work/impl/WorkManagerImpl;->getSchedulers()Ljava/util/List;

    move-result-object v3

    .line 107
    invoke-static {v1, v2, v3}, Landroidx/work/impl/Schedulers;->schedule(Landroidx/work/Configuration;Landroidx/work/impl/WorkDatabase;Ljava/util/List;)V

    .line 111
    return-void
.end method
