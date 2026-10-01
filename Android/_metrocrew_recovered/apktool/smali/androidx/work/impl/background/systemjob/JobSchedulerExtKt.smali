.class public final Landroidx/work/impl/background/systemjob/JobSchedulerExtKt;
.super Ljava/lang/Object;
.source "JobSchedulerExt.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nJobSchedulerExt.kt\nKotlin\n*S Kotlin\n*F\n+ 1 JobSchedulerExt.kt\nandroidx/work/impl/background/systemjob/JobSchedulerExtKt\n+ 2 LoggerExt.kt\nandroidx/work/LoggerExtKt\n*L\n1#1,127:1\n32#2:128\n*S KotlinDebug\n*F\n+ 1 JobSchedulerExt.kt\nandroidx/work/impl/background/systemjob/JobSchedulerExtKt\n*L\n70#1:128\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a \u0010\r\u001a\u00020\u00012\u0006\u0010\u000e\u001a\u00020\n2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0012H\u0001\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0002\u001a\u00020\u0001X\u0080T\u00a2\u0006\u0002\n\u0000\"\u001d\u0010\u0003\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u0004*\u00020\u00068G\u00a2\u0006\u0006\u001a\u0004\u0008\u0007\u0010\u0008\"\u0018\u0010\t\u001a\u00020\u0006*\u00020\n8AX\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\u0013"
    }
    d2 = {
        "TAG",
        "",
        "WORKMANAGER_NAMESPACE",
        "safePendingJobs",
        "",
        "Landroid/app/job/JobInfo;",
        "Landroid/app/job/JobScheduler;",
        "getSafePendingJobs",
        "(Landroid/app/job/JobScheduler;)Ljava/util/List;",
        "wmJobScheduler",
        "Landroid/content/Context;",
        "getWmJobScheduler",
        "(Landroid/content/Context;)Landroid/app/job/JobScheduler;",
        "createErrorMessage",
        "context",
        "workDatabase",
        "Landroidx/work/impl/WorkDatabase;",
        "configuration",
        "Landroidx/work/Configuration;",
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

.field public static final WORKMANAGER_NAMESPACE:Ljava/lang/String; = "androidx.work.systemjobscheduler"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 34
    const-string v0, "SystemJobScheduler"

    invoke-static {v0}, Landroidx/work/Logger;->tagWithPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "tagWithPrefix(\"SystemJobScheduler\")"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    sput-object v0, Landroidx/work/impl/background/systemjob/JobSchedulerExtKt;->TAG:Ljava/lang/String;

    return-void
.end method

.method public static final createErrorMessage(Landroid/content/Context;Landroidx/work/impl/WorkDatabase;Landroidx/work/Configuration;)Ljava/lang/String;
    .locals 23
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "workDatabase"    # Landroidx/work/impl/WorkDatabase;
    .param p2, "configuration"    # Landroidx/work/Configuration;

    move-object/from16 v0, p0

    const-string v1, "context"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v1, "workDatabase"

    move-object/from16 v2, p1

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v1, "configuration"

    move-object/from16 v3, p2

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 81
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1f

    if-lt v1, v4, :cond_0

    const/16 v1, 0x96

    goto :goto_0

    :cond_0
    const/16 v1, 0x64

    .line 82
    .local v1, "totalLimit":I
    :goto_0
    invoke-virtual {v2}, Landroidx/work/impl/WorkDatabase;->workSpecDao()Landroidx/work/impl/model/WorkSpecDao;

    move-result-object v4

    invoke-interface {v4}, Landroidx/work/impl/model/WorkSpecDao;->getScheduledWork()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    .line 84
    .local v4, "dbScheduledCount":I
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x22

    const-string v7, "<faulty JobScheduler failed to getPendingJobs>"

    if-lt v5, v6, :cond_6

    .line 85
    invoke-static {v0}, Landroidx/work/impl/background/systemjob/JobSchedulerExtKt;->getWmJobScheduler(Landroid/content/Context;)Landroid/app/job/JobScheduler;

    move-result-object v5

    .line 86
    .local v5, "namespacedScheduler":Landroid/app/job/JobScheduler;
    invoke-static {v5}, Landroidx/work/impl/background/systemjob/JobSchedulerExtKt;->getSafePendingJobs(Landroid/app/job/JobScheduler;)Ljava/util/List;

    move-result-object v6

    .line 87
    .local v6, "allJobsInNamespace":Ljava/util/List;
    if-eqz v6, :cond_5

    .line 88
    invoke-static {v0, v5}, Landroidx/work/impl/background/systemjob/SystemJobScheduler;->getPendingJobs(Landroid/content/Context;Landroid/app/job/JobScheduler;)Ljava/util/List;

    move-result-object v7

    .line 90
    .local v7, "pendingJobs":Ljava/util/List;
    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v9

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v10

    sub-int/2addr v9, v10

    goto :goto_1

    :cond_1
    const/4 v9, 0x0

    .line 89
    :goto_1
    nop

    .line 93
    .local v9, "diff":I
    nop

    .line 94
    const/4 v10, 0x0

    if-nez v9, :cond_2

    move-object v11, v10

    goto :goto_2

    .line 95
    :cond_2
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " of which are not owned by WorkManager"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 93
    :goto_2
    nop

    .line 92
    nop

    .line 99
    .local v11, "nonWmJobsMessage":Ljava/lang/String;
    const-string v12, "jobscheduler"

    invoke-virtual {v0, v12}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    const-string v13, "null cannot be cast to non-null type android.app.job.JobScheduler"

    invoke-static {v12, v13}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v12, Landroid/app/job/JobScheduler;

    .line 98
    nop

    .line 100
    .local v12, "defaultJobScheduler":Landroid/app/job/JobScheduler;
    invoke-static {v0, v12}, Landroidx/work/impl/background/systemjob/SystemJobScheduler;->getPendingJobs(Landroid/content/Context;Landroid/app/job/JobScheduler;)Ljava/util/List;

    move-result-object v13

    if-eqz v13, :cond_3

    invoke-interface {v13}, Ljava/util/List;->size()I

    move-result v13

    goto :goto_3

    :cond_3
    const/4 v13, 0x0

    .line 103
    .local v13, "wmJobsInDefault":I
    :goto_3
    nop

    .line 104
    if-nez v13, :cond_4

    goto :goto_4

    .line 105
    :cond_4
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v14, " from WorkManager in the default namespace"

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 103
    :goto_4
    nop

    .line 102
    nop

    .line 109
    .local v10, "defaultNamespaceMessage":Ljava/lang/String;
    const/4 v14, 0x3

    new-array v14, v14, [Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v16, 0x0

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v8

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v15, " jobs in \"androidx.work.systemjobscheduler\" namespace"

    invoke-virtual {v8, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v14, v16

    .line 110
    const/4 v8, 0x1

    aput-object v11, v14, v8

    .line 109
    nop

    .line 111
    const/4 v8, 0x2

    aput-object v10, v14, v8

    .line 109
    nop

    .line 108
    invoke-static {v14}, Lkotlin/collections/CollectionsKt;->listOfNotNull([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v8

    move-object v14, v8

    check-cast v14, Ljava/lang/Iterable;

    .line 113
    const-string v8, ",\n"

    move-object v15, v8

    check-cast v15, Ljava/lang/CharSequence;

    const/16 v21, 0x3e

    const/16 v22, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    invoke-static/range {v14 .. v22}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .end local v7    # "pendingJobs":Ljava/util/List;
    .end local v9    # "diff":I
    .end local v10    # "defaultNamespaceMessage":Ljava/lang/String;
    .end local v11    # "nonWmJobsMessage":Ljava/lang/String;
    .end local v12    # "defaultJobScheduler":Landroid/app/job/JobScheduler;
    .end local v13    # "wmJobsInDefault":I
    goto :goto_5

    .line 114
    :cond_5
    nop

    .end local v5    # "namespacedScheduler":Landroid/app/job/JobScheduler;
    .end local v6    # "allJobsInNamespace":Ljava/util/List;
    goto :goto_5

    .line 116
    :cond_6
    invoke-static {v0}, Landroidx/work/impl/background/systemjob/JobSchedulerExtKt;->getWmJobScheduler(Landroid/content/Context;)Landroid/app/job/JobScheduler;

    move-result-object v5

    invoke-static {v0, v5}, Landroidx/work/impl/background/systemjob/SystemJobScheduler;->getPendingJobs(Landroid/content/Context;Landroid/app/job/JobScheduler;)Ljava/util/List;

    move-result-object v5

    .line 117
    .local v5, "pendingJobs":Ljava/util/List;
    if-nez v5, :cond_7

    goto :goto_5

    .line 118
    :cond_7
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " jobs from WorkManager"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 84
    .end local v5    # "pendingJobs":Ljava/util/List;
    :goto_5
    nop

    .line 83
    nop

    .line 122
    .local v7, "jobSchedulerStats":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "JobScheduler "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " job limit exceeded.\nIn JobScheduler there are "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 123
    nop

    .line 122
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 123
    nop

    .line 122
    const-string v6, ".\nThere are "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 124
    nop

    .line 122
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 124
    nop

    .line 122
    const-string v6, " jobs tracked by WorkManager\'s database;\nthe Configuration limit is "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 125
    invoke-virtual {v3}, Landroidx/work/Configuration;->getMaxSchedulerLimit()I

    move-result v6

    .line 122
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const/16 v6, 0x2e

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public static final getSafePendingJobs(Landroid/app/job/JobScheduler;)Ljava/util/List;
    .locals 5
    .param p0, "$this$safePendingJobs"    # Landroid/app/job/JobScheduler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/job/JobScheduler;",
            ")",
            "Ljava/util/List<",
            "Landroid/app/job/JobInfo;",
            ">;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 62
    nop

    .line 66
    :try_start_0
    sget-object v0, Landroidx/work/impl/background/systemjob/JobScheduler21;->INSTANCE:Landroidx/work/impl/background/systemjob/JobScheduler21;

    invoke-virtual {v0, p0}, Landroidx/work/impl/background/systemjob/JobScheduler21;->getAllPendingJobs(Landroid/app/job/JobScheduler;)Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 67
    :catchall_0
    move-exception v0

    .line 70
    .local v0, "exception":Ljava/lang/Throwable;
    sget-object v1, Landroidx/work/impl/background/systemjob/JobSchedulerExtKt;->TAG:Ljava/lang/String;

    .local v1, "tag$iv":Ljava/lang/String;
    const/4 v2, 0x0

    .line 128
    .local v2, "$i$f$loge":I
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v3

    const/4 v4, 0x0

    .line 70
    .local v4, "$i$a$-loge-JobSchedulerExtKt$safePendingJobs$1":I
    nop

    .line 128
    .end local v4    # "$i$a$-loge-JobSchedulerExtKt$safePendingJobs$1":I
    const-string v4, "getAllPendingJobs() is not reliable on this device."

    invoke-virtual {v3, v1, v4, v0}, Landroidx/work/Logger;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 71
    .end local v1    # "tag$iv":Ljava/lang/String;
    .end local v2    # "$i$f$loge":I
    const/4 v1, 0x0

    move-object v0, v1

    .line 62
    .end local v0    # "exception":Ljava/lang/Throwable;
    :goto_0
    return-object v0
.end method

.method public static final getWmJobScheduler(Landroid/content/Context;)Landroid/app/job/JobScheduler;
    .locals 3
    .param p0, "$this$wmJobScheduler"    # Landroid/content/Context;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    const-string v0, "jobscheduler"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "null cannot be cast to non-null type android.app.job.JobScheduler"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Landroid/app/job/JobScheduler;

    .line 40
    .local v0, "defaultJobScheduler":Landroid/app/job/JobScheduler;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x22

    if-lt v1, v2, :cond_0

    .line 41
    sget-object v1, Landroidx/work/impl/background/systemjob/JobScheduler34;->INSTANCE:Landroidx/work/impl/background/systemjob/JobScheduler34;

    invoke-virtual {v1, v0}, Landroidx/work/impl/background/systemjob/JobScheduler34;->forNamespace(Landroid/app/job/JobScheduler;)Landroid/app/job/JobScheduler;

    move-result-object v1

    goto :goto_0

    .line 42
    :cond_0
    move-object v1, v0

    .line 40
    :goto_0
    return-object v1
.end method
