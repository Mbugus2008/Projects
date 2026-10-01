.class public final Landroidx/work/impl/WorkerWrapper;
.super Ljava/lang/Object;
.source "WorkerWrapper.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/work/impl/WorkerWrapper$Builder;,
        Landroidx/work/impl/WorkerWrapper$Resolution;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nWorkerWrapper.kt\nKotlin\n*S Kotlin\n*F\n+ 1 WorkerWrapper.kt\nandroidx/work/impl/WorkerWrapper\n+ 2 LoggerExt.kt\nandroidx/work/LoggerExtKt\n*L\n1#1,607:1\n29#2:608\n29#2:609\n27#2:610\n32#2:611\n19#2:612\n19#2:613\n24#2:614\n24#2:615\n24#2:616\n24#2:617\n19#2:618\n*S KotlinDebug\n*F\n+ 1 WorkerWrapper.kt\nandroidx/work/impl/WorkerWrapper\n*L\n206#1:608\n240#1:609\n315#1:610\n318#1:611\n354#1:612\n367#1:613\n374#1:614\n381#1:615\n384#1:616\n477#1:617\n151#1:618\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u009e\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0007\u0008\u0007\u0018\u00002\u00020\u0001:\u0002>?B\u000f\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004J\u0016\u0010(\u001a\u00020\u00152\u000c\u0010\u0013\u001a\u0008\u0012\u0004\u0012\u00020\u00150\u0014H\u0002J\u0012\u0010)\u001a\u00020*2\u0008\u0010+\u001a\u0004\u0018\u00010,H\u0002J\u0010\u0010-\u001a\u00020.2\u0006\u0010/\u001a\u000200H\u0007J\u0010\u00101\u001a\u00020.2\u0006\u0010#\u001a\u00020\u0015H\u0002J\u000c\u00102\u001a\u0008\u0012\u0004\u0012\u00020*03J\u0010\u00104\u001a\u00020*2\u0006\u0010+\u001a\u00020,H\u0002J\u0010\u00105\u001a\u00020*2\u0006\u0010/\u001a\u000200H\u0002J\u0008\u00106\u001a\u00020*H\u0002J\u0010\u00107\u001a\u00020*2\u0006\u0010/\u001a\u000200H\u0002J\u000e\u00108\u001a\u000209H\u0082@\u00a2\u0006\u0002\u0010:J\u0010\u0010;\u001a\u00020*2\u0006\u0010+\u001a\u00020,H\u0007J\u0010\u0010<\u001a\u00020*2\u0006\u0010+\u001a\u00020,H\u0002J\u0008\u0010=\u001a\u00020*H\u0002R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0007\u001a\u0004\u0018\u00010\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0013\u001a\u0008\u0012\u0004\u0012\u00020\u00150\u0014X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0017X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0015X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u0019\u001a\u00020\u001a8F\u00a2\u0006\u0006\u001a\u0004\u0008\u001b\u0010\u001cR\u0011\u0010\u001d\u001a\u00020\u001e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001f\u0010 R\u000e\u0010!\u001a\u00020\"X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010#\u001a\u00020\u0015X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010$\u001a\u00020%X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010&\u001a\u00020\'X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006@"
    }
    d2 = {
        "Landroidx/work/impl/WorkerWrapper;",
        "",
        "builder",
        "Landroidx/work/impl/WorkerWrapper$Builder;",
        "(Landroidx/work/impl/WorkerWrapper$Builder;)V",
        "appContext",
        "Landroid/content/Context;",
        "builderWorker",
        "Landroidx/work/ListenableWorker;",
        "clock",
        "Landroidx/work/Clock;",
        "configuration",
        "Landroidx/work/Configuration;",
        "dependencyDao",
        "Landroidx/work/impl/model/DependencyDao;",
        "foregroundProcessor",
        "Landroidx/work/impl/foreground/ForegroundProcessor;",
        "runtimeExtras",
        "Landroidx/work/WorkerParameters$RuntimeExtras;",
        "tags",
        "",
        "",
        "workDatabase",
        "Landroidx/work/impl/WorkDatabase;",
        "workDescription",
        "workGenerationalId",
        "Landroidx/work/impl/model/WorkGenerationalId;",
        "getWorkGenerationalId",
        "()Landroidx/work/impl/model/WorkGenerationalId;",
        "workSpec",
        "Landroidx/work/impl/model/WorkSpec;",
        "getWorkSpec",
        "()Landroidx/work/impl/model/WorkSpec;",
        "workSpecDao",
        "Landroidx/work/impl/model/WorkSpecDao;",
        "workSpecId",
        "workTaskExecutor",
        "Landroidx/work/impl/utils/taskexecutor/TaskExecutor;",
        "workerJob",
        "Lkotlinx/coroutines/CompletableJob;",
        "createWorkDescription",
        "handleResult",
        "",
        "result",
        "Landroidx/work/ListenableWorker$Result;",
        "interrupt",
        "",
        "stopReason",
        "",
        "iterativelyFailWorkAndDependents",
        "launch",
        "Lcom/google/common/util/concurrent/ListenableFuture;",
        "onWorkFinished",
        "reschedule",
        "resetPeriodic",
        "resetWorkerStatus",
        "runWorker",
        "Landroidx/work/impl/WorkerWrapper$Resolution;",
        "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "setFailed",
        "setSucceeded",
        "trySetRunning",
        "Builder",
        "Resolution",
        "work-runtime_release"
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
.field private final appContext:Landroid/content/Context;

.field private final builderWorker:Landroidx/work/ListenableWorker;

.field private final clock:Landroidx/work/Clock;

.field private final configuration:Landroidx/work/Configuration;

.field private final dependencyDao:Landroidx/work/impl/model/DependencyDao;

.field private final foregroundProcessor:Landroidx/work/impl/foreground/ForegroundProcessor;

.field private final runtimeExtras:Landroidx/work/WorkerParameters$RuntimeExtras;

.field private final tags:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final workDatabase:Landroidx/work/impl/WorkDatabase;

.field private final workDescription:Ljava/lang/String;

.field private final workSpec:Landroidx/work/impl/model/WorkSpec;

.field private final workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

.field private final workSpecId:Ljava/lang/String;

.field private final workTaskExecutor:Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

.field private final workerJob:Lkotlinx/coroutines/CompletableJob;


# direct methods
.method public static synthetic $r8$lambda$O0DrdUDQSEqVo7n3_JmOuQMb-xQ(Landroidx/work/impl/WorkerWrapper;)Ljava/lang/Boolean;
    .locals 0

    invoke-static {p0}, Landroidx/work/impl/WorkerWrapper;->trySetRunning$lambda$11(Landroidx/work/impl/WorkerWrapper;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic $r8$lambda$pgTj0TbLDPXkl5H_yrOVgH1dL-U(Landroidx/work/impl/WorkerWrapper;)Ljava/lang/Boolean;
    .locals 0

    invoke-static {p0}, Landroidx/work/impl/WorkerWrapper;->runWorker$lambda$1(Landroidx/work/impl/WorkerWrapper;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Landroidx/work/impl/WorkerWrapper$Builder;)V
    .locals 2
    .param p1, "builder"    # Landroidx/work/impl/WorkerWrapper$Builder;

    const-string v0, "builder"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 67
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    invoke-virtual {p1}, Landroidx/work/impl/WorkerWrapper$Builder;->getWorkSpec()Landroidx/work/impl/model/WorkSpec;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    .line 70
    invoke-virtual {p1}, Landroidx/work/impl/WorkerWrapper$Builder;->getAppContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/impl/WorkerWrapper;->appContext:Landroid/content/Context;

    .line 71
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    iget-object v0, v0, Landroidx/work/impl/model/WorkSpec;->id:Ljava/lang/String;

    iput-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    .line 72
    invoke-virtual {p1}, Landroidx/work/impl/WorkerWrapper$Builder;->getRuntimeExtras()Landroidx/work/WorkerParameters$RuntimeExtras;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/impl/WorkerWrapper;->runtimeExtras:Landroidx/work/WorkerParameters$RuntimeExtras;

    .line 74
    invoke-virtual {p1}, Landroidx/work/impl/WorkerWrapper$Builder;->getWorker()Landroidx/work/ListenableWorker;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/impl/WorkerWrapper;->builderWorker:Landroidx/work/ListenableWorker;

    .line 75
    invoke-virtual {p1}, Landroidx/work/impl/WorkerWrapper$Builder;->getWorkTaskExecutor()Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workTaskExecutor:Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    .line 77
    invoke-virtual {p1}, Landroidx/work/impl/WorkerWrapper$Builder;->getConfiguration()Landroidx/work/Configuration;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/impl/WorkerWrapper;->configuration:Landroidx/work/Configuration;

    .line 78
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->configuration:Landroidx/work/Configuration;

    invoke-virtual {v0}, Landroidx/work/Configuration;->getClock()Landroidx/work/Clock;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/impl/WorkerWrapper;->clock:Landroidx/work/Clock;

    .line 79
    invoke-virtual {p1}, Landroidx/work/impl/WorkerWrapper$Builder;->getForegroundProcessor()Landroidx/work/impl/foreground/ForegroundProcessor;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/impl/WorkerWrapper;->foregroundProcessor:Landroidx/work/impl/foreground/ForegroundProcessor;

    .line 80
    invoke-virtual {p1}, Landroidx/work/impl/WorkerWrapper$Builder;->getWorkDatabase()Landroidx/work/impl/WorkDatabase;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workDatabase:Landroidx/work/impl/WorkDatabase;

    .line 81
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workDatabase:Landroidx/work/impl/WorkDatabase;

    invoke-virtual {v0}, Landroidx/work/impl/WorkDatabase;->workSpecDao()Landroidx/work/impl/model/WorkSpecDao;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    .line 82
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workDatabase:Landroidx/work/impl/WorkDatabase;

    invoke-virtual {v0}, Landroidx/work/impl/WorkDatabase;->dependencyDao()Landroidx/work/impl/model/DependencyDao;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/impl/WorkerWrapper;->dependencyDao:Landroidx/work/impl/model/DependencyDao;

    .line 83
    invoke-virtual {p1}, Landroidx/work/impl/WorkerWrapper$Builder;->getTags()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/impl/WorkerWrapper;->tags:Ljava/util/List;

    .line 84
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->tags:Ljava/util/List;

    invoke-direct {p0, v0}, Landroidx/work/impl/WorkerWrapper;->createWorkDescription(Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workDescription:Ljava/lang/String;

    .line 86
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {v0, v1, v0}, Lkotlinx/coroutines/JobKt;->Job$default(Lkotlinx/coroutines/Job;ILjava/lang/Object;)Lkotlinx/coroutines/CompletableJob;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workerJob:Lkotlinx/coroutines/CompletableJob;

    .line 68
    return-void
.end method

.method public static final synthetic access$getAppContext$p(Landroidx/work/impl/WorkerWrapper;)Landroid/content/Context;
    .locals 1
    .param p0, "$this"    # Landroidx/work/impl/WorkerWrapper;

    .line 67
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->appContext:Landroid/content/Context;

    return-object v0
.end method

.method public static final synthetic access$getConfiguration$p(Landroidx/work/impl/WorkerWrapper;)Landroidx/work/Configuration;
    .locals 1
    .param p0, "$this"    # Landroidx/work/impl/WorkerWrapper;

    .line 67
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->configuration:Landroidx/work/Configuration;

    return-object v0
.end method

.method public static final synthetic access$getWorkDatabase$p(Landroidx/work/impl/WorkerWrapper;)Landroidx/work/impl/WorkDatabase;
    .locals 1
    .param p0, "$this"    # Landroidx/work/impl/WorkerWrapper;

    .line 67
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workDatabase:Landroidx/work/impl/WorkDatabase;

    return-object v0
.end method

.method public static final synthetic access$getWorkTaskExecutor$p(Landroidx/work/impl/WorkerWrapper;)Landroidx/work/impl/utils/taskexecutor/TaskExecutor;
    .locals 1
    .param p0, "$this"    # Landroidx/work/impl/WorkerWrapper;

    .line 67
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workTaskExecutor:Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    return-object v0
.end method

.method public static final synthetic access$getWorkerJob$p(Landroidx/work/impl/WorkerWrapper;)Lkotlinx/coroutines/CompletableJob;
    .locals 1
    .param p0, "$this"    # Landroidx/work/impl/WorkerWrapper;

    .line 67
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workerJob:Lkotlinx/coroutines/CompletableJob;

    return-object v0
.end method

.method public static final synthetic access$onWorkFinished(Landroidx/work/impl/WorkerWrapper;Landroidx/work/ListenableWorker$Result;)Z
    .locals 1
    .param p0, "$this"    # Landroidx/work/impl/WorkerWrapper;
    .param p1, "result"    # Landroidx/work/ListenableWorker$Result;

    .line 67
    invoke-direct {p0, p1}, Landroidx/work/impl/WorkerWrapper;->onWorkFinished(Landroidx/work/ListenableWorker$Result;)Z

    move-result v0

    return v0
.end method

.method public static final synthetic access$resetWorkerStatus(Landroidx/work/impl/WorkerWrapper;I)Z
    .locals 1
    .param p0, "$this"    # Landroidx/work/impl/WorkerWrapper;
    .param p1, "stopReason"    # I

    .line 67
    invoke-direct {p0, p1}, Landroidx/work/impl/WorkerWrapper;->resetWorkerStatus(I)Z

    move-result v0

    return v0
.end method

.method public static final synthetic access$runWorker(Landroidx/work/impl/WorkerWrapper;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 1
    .param p0, "$this"    # Landroidx/work/impl/WorkerWrapper;
    .param p1, "$completion"    # Lkotlin/coroutines/Continuation;

    .line 67
    invoke-direct {p0, p1}, Landroidx/work/impl/WorkerWrapper;->runWorker(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private final createWorkDescription(Ljava/util/List;)Ljava/lang/String;
    .locals 10
    .param p1, "tags"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 486
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Work [ id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", tags={ "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    move-object v1, p1

    check-cast v1, Ljava/lang/Iterable;

    const-string v2, ","

    check-cast v2, Ljava/lang/CharSequence;

    const/16 v8, 0x3e

    const/4 v9, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-static/range {v1 .. v9}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " } ]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private final handleResult(Landroidx/work/ListenableWorker$Result;)Z
    .locals 6
    .param p1, "result"    # Landroidx/work/ListenableWorker$Result;

    .line 373
    instance-of v0, p1, Landroidx/work/ListenableWorker$Result$Success;

    if-eqz v0, :cond_1

    .line 374
    invoke-static {}, Landroidx/work/impl/WorkerWrapperKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v0

    .local v0, "tag$iv":Ljava/lang/String;
    const/4 v1, 0x0

    .line 614
    .local v1, "$i$f$logi":I
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v2

    const/4 v3, 0x0

    .line 374
    .local v3, "$i$a$-logi-WorkerWrapper$handleResult$1":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Worker result SUCCESS for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroidx/work/impl/WorkerWrapper;->workDescription:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 614
    .end local v3    # "$i$a$-logi-WorkerWrapper$handleResult$1":I
    invoke-virtual {v2, v0, v3}, Landroidx/work/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 375
    .end local v0    # "tag$iv":Ljava/lang/String;
    .end local v1    # "$i$f$logi":I
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    invoke-virtual {v0}, Landroidx/work/impl/model/WorkSpec;->isPeriodic()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 376
    invoke-direct {p0}, Landroidx/work/impl/WorkerWrapper;->resetPeriodic()Z

    move-result v0

    goto/16 :goto_1

    .line 378
    :cond_0
    invoke-direct {p0, p1}, Landroidx/work/impl/WorkerWrapper;->setSucceeded(Landroidx/work/ListenableWorker$Result;)Z

    move-result v0

    goto :goto_1

    .line 380
    :cond_1
    instance-of v0, p1, Landroidx/work/ListenableWorker$Result$Retry;

    if-eqz v0, :cond_2

    .line 381
    invoke-static {}, Landroidx/work/impl/WorkerWrapperKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "tag$iv":Ljava/lang/String;
    const/4 v1, 0x0

    .line 615
    .restart local v1    # "$i$f$logi":I
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v2

    const/4 v3, 0x0

    .line 381
    .local v3, "$i$a$-logi-WorkerWrapper$handleResult$2":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Worker result RETRY for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroidx/work/impl/WorkerWrapper;->workDescription:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 615
    .end local v3    # "$i$a$-logi-WorkerWrapper$handleResult$2":I
    invoke-virtual {v2, v0, v3}, Landroidx/work/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 382
    .end local v0    # "tag$iv":Ljava/lang/String;
    .end local v1    # "$i$f$logi":I
    const/16 v0, -0x100

    invoke-direct {p0, v0}, Landroidx/work/impl/WorkerWrapper;->reschedule(I)Z

    move-result v0

    goto :goto_1

    .line 384
    :cond_2
    invoke-static {}, Landroidx/work/impl/WorkerWrapperKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "tag$iv":Ljava/lang/String;
    const/4 v1, 0x0

    .line 616
    .restart local v1    # "$i$f$logi":I
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v2

    const/4 v3, 0x0

    .line 384
    .local v3, "$i$a$-logi-WorkerWrapper$handleResult$3":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Worker result FAILURE for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Landroidx/work/impl/WorkerWrapper;->workDescription:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 616
    .end local v3    # "$i$a$-logi-WorkerWrapper$handleResult$3":I
    invoke-virtual {v2, v0, v3}, Landroidx/work/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 385
    .end local v0    # "tag$iv":Ljava/lang/String;
    .end local v1    # "$i$f$logi":I
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    invoke-virtual {v0}, Landroidx/work/impl/model/WorkSpec;->isPeriodic()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 386
    invoke-direct {p0}, Landroidx/work/impl/WorkerWrapper;->resetPeriodic()Z

    move-result v0

    goto :goto_1

    .line 389
    :cond_3
    if-nez p1, :cond_4

    new-instance v0, Landroidx/work/ListenableWorker$Result$Failure;

    invoke-direct {v0}, Landroidx/work/ListenableWorker$Result$Failure;-><init>()V

    check-cast v0, Landroidx/work/ListenableWorker$Result;

    goto :goto_0

    :cond_4
    move-object v0, p1

    :goto_0
    invoke-virtual {p0, v0}, Landroidx/work/impl/WorkerWrapper;->setFailed(Landroidx/work/ListenableWorker$Result;)Z

    move-result v0

    .line 373
    :goto_1
    return v0
.end method

.method private final iterativelyFailWorkAndDependents(Ljava/lang/String;)V
    .locals 4
    .param p1, "workSpecId"    # Ljava/lang/String;

    .line 422
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->mutableListOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 423
    .local v0, "idsToProcess":Ljava/util/List;
    :goto_0
    move-object v1, v0

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 424
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->removeLast(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 426
    .local v1, "id":Ljava/lang/String;
    iget-object v2, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    invoke-interface {v2, v1}, Landroidx/work/impl/model/WorkSpecDao;->getState(Ljava/lang/String;)Landroidx/work/WorkInfo$State;

    move-result-object v2

    sget-object v3, Landroidx/work/WorkInfo$State;->CANCELLED:Landroidx/work/WorkInfo$State;

    if-eq v2, v3, :cond_0

    .line 427
    iget-object v2, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    sget-object v3, Landroidx/work/WorkInfo$State;->FAILED:Landroidx/work/WorkInfo$State;

    invoke-interface {v2, v3, v1}, Landroidx/work/impl/model/WorkSpecDao;->setState(Landroidx/work/WorkInfo$State;Ljava/lang/String;)I

    .line 429
    :cond_0
    iget-object v2, p0, Landroidx/work/impl/WorkerWrapper;->dependencyDao:Landroidx/work/impl/model/DependencyDao;

    invoke-interface {v2, v1}, Landroidx/work/impl/model/DependencyDao;->getDependentWorkIds(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/util/Collection;

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    .line 431
    .end local v1    # "id":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method private final onWorkFinished(Landroidx/work/ListenableWorker$Result;)Z
    .locals 3
    .param p1, "result"    # Landroidx/work/ListenableWorker$Result;

    .line 328
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    iget-object v1, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-interface {v0, v1}, Landroidx/work/impl/model/WorkSpecDao;->getState(Ljava/lang/String;)Landroidx/work/WorkInfo$State;

    move-result-object v0

    .line 329
    .local v0, "state":Landroidx/work/WorkInfo$State;
    iget-object v1, p0, Landroidx/work/impl/WorkerWrapper;->workDatabase:Landroidx/work/impl/WorkDatabase;

    invoke-virtual {v1}, Landroidx/work/impl/WorkDatabase;->workProgressDao()Landroidx/work/impl/model/WorkProgressDao;

    move-result-object v1

    iget-object v2, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-interface {v1, v2}, Landroidx/work/impl/model/WorkProgressDao;->delete(Ljava/lang/String;)V

    .line 330
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 335
    goto :goto_0

    .line 336
    :cond_0
    sget-object v2, Landroidx/work/WorkInfo$State;->RUNNING:Landroidx/work/WorkInfo$State;

    if-ne v0, v2, :cond_1

    .line 337
    invoke-direct {p0, p1}, Landroidx/work/impl/WorkerWrapper;->handleResult(Landroidx/work/ListenableWorker$Result;)Z

    move-result v1

    goto :goto_0

    .line 338
    :cond_1
    invoke-virtual {v0}, Landroidx/work/WorkInfo$State;->isFinished()Z

    move-result v2

    if-nez v2, :cond_2

    .line 340
    const/16 v1, -0x200

    invoke-direct {p0, v1}, Landroidx/work/impl/WorkerWrapper;->reschedule(I)Z

    move-result v1

    goto :goto_0

    .line 342
    :cond_2
    nop

    .line 330
    :goto_0
    return v1
.end method

.method private final reschedule(I)Z
    .locals 4
    .param p1, "stopReason"    # I

    .line 434
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    sget-object v1, Landroidx/work/WorkInfo$State;->ENQUEUED:Landroidx/work/WorkInfo$State;

    iget-object v2, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroidx/work/impl/model/WorkSpecDao;->setState(Landroidx/work/WorkInfo$State;Ljava/lang/String;)I

    .line 435
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    iget-object v1, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    iget-object v2, p0, Landroidx/work/impl/WorkerWrapper;->clock:Landroidx/work/Clock;

    invoke-interface {v2}, Landroidx/work/Clock;->currentTimeMillis()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Landroidx/work/impl/model/WorkSpecDao;->setLastEnqueueTime(Ljava/lang/String;J)V

    .line 436
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    .line 437
    iget-object v1, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    .line 438
    iget-object v2, p0, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    invoke-virtual {v2}, Landroidx/work/impl/model/WorkSpec;->getNextScheduleTimeOverrideGeneration()I

    move-result v2

    .line 436
    invoke-interface {v0, v1, v2}, Landroidx/work/impl/model/WorkSpecDao;->resetWorkSpecNextScheduleTimeOverride(Ljava/lang/String;I)V

    .line 440
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    iget-object v1, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    const-wide/16 v2, -0x1

    invoke-interface {v0, v1, v2, v3}, Landroidx/work/impl/model/WorkSpecDao;->markWorkSpecScheduled(Ljava/lang/String;J)I

    .line 441
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    iget-object v1, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Landroidx/work/impl/model/WorkSpecDao;->setStopReason(Ljava/lang/String;I)V

    .line 442
    const/4 v0, 0x1

    return v0
.end method

.method private final resetPeriodic()Z
    .locals 4

    .line 450
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    iget-object v1, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    iget-object v2, p0, Landroidx/work/impl/WorkerWrapper;->clock:Landroidx/work/Clock;

    invoke-interface {v2}, Landroidx/work/Clock;->currentTimeMillis()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Landroidx/work/impl/model/WorkSpecDao;->setLastEnqueueTime(Ljava/lang/String;J)V

    .line 451
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    sget-object v1, Landroidx/work/WorkInfo$State;->ENQUEUED:Landroidx/work/WorkInfo$State;

    iget-object v2, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroidx/work/impl/model/WorkSpecDao;->setState(Landroidx/work/WorkInfo$State;Ljava/lang/String;)I

    .line 452
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    iget-object v1, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-interface {v0, v1}, Landroidx/work/impl/model/WorkSpecDao;->resetWorkSpecRunAttemptCount(Ljava/lang/String;)I

    .line 453
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    .line 454
    iget-object v1, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    .line 455
    iget-object v2, p0, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    invoke-virtual {v2}, Landroidx/work/impl/model/WorkSpec;->getNextScheduleTimeOverrideGeneration()I

    move-result v2

    .line 453
    invoke-interface {v0, v1, v2}, Landroidx/work/impl/model/WorkSpecDao;->resetWorkSpecNextScheduleTimeOverride(Ljava/lang/String;I)V

    .line 457
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    iget-object v1, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-interface {v0, v1}, Landroidx/work/impl/model/WorkSpecDao;->incrementPeriodCount(Ljava/lang/String;)V

    .line 458
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    iget-object v1, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    const-wide/16 v2, -0x1

    invoke-interface {v0, v1, v2, v3}, Landroidx/work/impl/model/WorkSpecDao;->markWorkSpecScheduled(Ljava/lang/String;J)I

    .line 459
    const/4 v0, 0x0

    return v0
.end method

.method private final resetWorkerStatus(I)Z
    .locals 8
    .param p1, "stopReason"    # I

    .line 352
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    iget-object v1, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-interface {v0, v1}, Landroidx/work/impl/model/WorkSpecDao;->getState(Ljava/lang/String;)Landroidx/work/WorkInfo$State;

    move-result-object v0

    .line 353
    .local v0, "state":Landroidx/work/WorkInfo$State;
    const-string v1, " is "

    const-string v2, "Status for "

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroidx/work/WorkInfo$State;->isFinished()Z

    move-result v3

    if-nez v3, :cond_0

    .line 354
    invoke-static {}, Landroidx/work/impl/WorkerWrapperKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v3

    .local v3, "tag$iv":Ljava/lang/String;
    const/4 v4, 0x0

    .line 612
    .local v4, "$i$f$logd":I
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v5

    const/4 v6, 0x0

    .line 355
    .local v6, "$i$a$-logd-WorkerWrapper$resetWorkerStatus$1":I
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v7, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; not doing any work and rescheduling for later execution"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 356
    nop

    .line 612
    .end local v6    # "$i$a$-logd-WorkerWrapper$resetWorkerStatus$1":I
    invoke-virtual {v5, v3, v1}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 362
    .end local v3    # "tag$iv":Ljava/lang/String;
    .end local v4    # "$i$f$logd":I
    iget-object v1, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    sget-object v2, Landroidx/work/WorkInfo$State;->ENQUEUED:Landroidx/work/WorkInfo$State;

    iget-object v3, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Landroidx/work/impl/model/WorkSpecDao;->setState(Landroidx/work/WorkInfo$State;Ljava/lang/String;)I

    .line 363
    iget-object v1, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    iget-object v2, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-interface {v1, v2, p1}, Landroidx/work/impl/model/WorkSpecDao;->setStopReason(Ljava/lang/String;I)V

    .line 364
    iget-object v1, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    iget-object v2, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    const-wide/16 v3, -0x1

    invoke-interface {v1, v2, v3, v4}, Landroidx/work/impl/model/WorkSpecDao;->markWorkSpecScheduled(Ljava/lang/String;J)I

    .line 365
    const/4 v1, 0x1

    goto :goto_0

    .line 367
    :cond_0
    invoke-static {}, Landroidx/work/impl/WorkerWrapperKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "tag$iv":Ljava/lang/String;
    const/4 v4, 0x0

    .line 613
    .restart local v4    # "$i$f$logd":I
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v5

    const/4 v6, 0x0

    .line 367
    .local v6, "$i$a$-logd-WorkerWrapper$resetWorkerStatus$2":I
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v7, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ; not doing any work"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 613
    .end local v6    # "$i$a$-logd-WorkerWrapper$resetWorkerStatus$2":I
    invoke-virtual {v5, v3, v1}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 368
    .end local v3    # "tag$iv":Ljava/lang/String;
    .end local v4    # "$i$f$logd":I
    const/4 v1, 0x0

    .line 353
    :goto_0
    return v1
.end method

.method private final runWorker(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 29
    .param p1, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Landroidx/work/impl/WorkerWrapper$Resolution;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    move-object/from16 v1, p1

    instance-of v0, v1, Landroidx/work/impl/WorkerWrapper$runWorker$1;

    if-eqz v0, :cond_0

    move-object v0, v1

    check-cast v0, Landroidx/work/impl/WorkerWrapper$runWorker$1;

    iget v2, v0, Landroidx/work/impl/WorkerWrapper$runWorker$1;->label:I

    const/high16 v3, -0x80000000

    and-int/2addr v2, v3

    if-eqz v2, :cond_0

    iget v2, v0, Landroidx/work/impl/WorkerWrapper$runWorker$1;->label:I

    sub-int/2addr v2, v3

    iput v2, v0, Landroidx/work/impl/WorkerWrapper$runWorker$1;->label:I

    move-object/from16 v2, p0

    goto :goto_0

    :cond_0
    new-instance v0, Landroidx/work/impl/WorkerWrapper$runWorker$1;

    move-object/from16 v2, p0

    invoke-direct {v0, v2, v1}, Landroidx/work/impl/WorkerWrapper$runWorker$1;-><init>(Landroidx/work/impl/WorkerWrapper;Lkotlin/coroutines/Continuation;)V

    :goto_0
    move-object v3, v0

    .local v3, "$continuation":Lkotlin/coroutines/Continuation;
    iget-object v4, v3, Landroidx/work/impl/WorkerWrapper$runWorker$1;->result:Ljava/lang/Object;

    .local v4, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 130
    iget v5, v3, Landroidx/work/impl/WorkerWrapper$runWorker$1;->label:I

    const/4 v6, 0x1

    const/4 v7, 0x0

    packed-switch v5, :pswitch_data_0

    .end local v3    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local v4    # "$result":Ljava/lang/Object;
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v3, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .restart local v3    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local v4    # "$result":Ljava/lang/Object;
    :pswitch_0
    iget-object v0, v3, Landroidx/work/impl/WorkerWrapper$runWorker$1;->L$1:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Landroidx/work/WorkerParameters;

    .local v5, "params":Landroidx/work/WorkerParameters;
    iget-object v0, v3, Landroidx/work/impl/WorkerWrapper$runWorker$1;->L$0:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Landroidx/work/impl/WorkerWrapper;

    .local v8, "this":Landroidx/work/impl/WorkerWrapper;
    :try_start_0
    invoke-static {v4}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v11, v4

    goto/16 :goto_4

    .line 317
    :catchall_0
    move-exception v0

    goto/16 :goto_5

    .line 314
    .end local v5    # "params":Landroidx/work/WorkerParameters;
    :catch_0
    move-exception v0

    goto/16 :goto_6

    .line 130
    .end local v8    # "this":Landroidx/work/impl/WorkerWrapper;
    :pswitch_1
    invoke-static {v4}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object/from16 v8, p0

    .line 131
    .restart local v8    # "this":Landroidx/work/impl/WorkerWrapper;
    iget-object v5, v8, Landroidx/work/impl/WorkerWrapper;->configuration:Landroidx/work/Configuration;

    invoke-virtual {v5}, Landroidx/work/Configuration;->getTracer()Landroidx/work/Tracer;

    move-result-object v5

    invoke-interface {v5}, Landroidx/work/Tracer;->isEnabled()Z

    move-result v5

    .line 132
    .local v5, "isTracingEnabled":Z
    iget-object v9, v8, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    invoke-virtual {v9}, Landroidx/work/impl/model/WorkSpec;->getTraceTag()Ljava/lang/String;

    move-result-object v9

    .line 133
    .local v9, "traceTag":Ljava/lang/String;
    if-eqz v5, :cond_1

    if-eqz v9, :cond_1

    .line 134
    iget-object v10, v8, Landroidx/work/impl/WorkerWrapper;->configuration:Landroidx/work/Configuration;

    invoke-virtual {v10}, Landroidx/work/Configuration;->getTracer()Landroidx/work/Tracer;

    move-result-object v10

    .line 135
    nop

    .line 139
    iget-object v11, v8, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    invoke-virtual {v11}, Landroidx/work/impl/model/WorkSpec;->hashCode()I

    move-result v11

    .line 134
    invoke-interface {v10, v9, v11}, Landroidx/work/Tracer;->beginAsyncSection(Ljava/lang/String;I)V

    .line 145
    :cond_1
    iget-object v10, v8, Landroidx/work/impl/WorkerWrapper;->workDatabase:Landroidx/work/impl/WorkDatabase;

    .line 146
    nop

    .line 145
    new-instance v11, Landroidx/work/impl/WorkerWrapper$$ExternalSyntheticLambda0;

    invoke-direct {v11, v8}, Landroidx/work/impl/WorkerWrapper$$ExternalSyntheticLambda0;-><init>(Landroidx/work/impl/WorkerWrapper;)V

    invoke-virtual {v10, v11}, Landroidx/work/impl/WorkDatabase;->runInTransaction(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Boolean;

    .line 144
    nop

    .line 193
    .local v10, "shouldExit":Ljava/lang/Boolean;
    const-string/jumbo v11, "shouldExit"

    invoke-static {v10, v11}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v11

    const/4 v12, 0x0

    if-eqz v11, :cond_2

    new-instance v0, Landroidx/work/impl/WorkerWrapper$Resolution$ResetWorkerStatus;

    invoke-direct {v0, v12, v6, v7}, Landroidx/work/impl/WorkerWrapper$Resolution$ResetWorkerStatus;-><init>(IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0

    .line 198
    .end local v10    # "shouldExit":Ljava/lang/Boolean;
    :cond_2
    iget-object v10, v8, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    invoke-virtual {v10}, Landroidx/work/impl/model/WorkSpec;->isPeriodic()Z

    move-result v10

    if-eqz v10, :cond_3

    .line 199
    iget-object v10, v8, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    iget-object v10, v10, Landroidx/work/impl/model/WorkSpec;->input:Landroidx/work/Data;

    goto :goto_1

    .line 201
    :cond_3
    iget-object v10, v8, Landroidx/work/impl/WorkerWrapper;->configuration:Landroidx/work/Configuration;

    invoke-virtual {v10}, Landroidx/work/Configuration;->getInputMergerFactory()Landroidx/work/InputMergerFactory;

    move-result-object v10

    .line 202
    .local v10, "inputMergerFactory":Landroidx/work/InputMergerFactory;
    iget-object v11, v8, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    iget-object v11, v11, Landroidx/work/impl/model/WorkSpec;->inputMergerClassName:Ljava/lang/String;

    .line 204
    .local v11, "inputMergerClassName":Ljava/lang/String;
    invoke-virtual {v10, v11}, Landroidx/work/InputMergerFactory;->createInputMergerWithDefaultFallback(Ljava/lang/String;)Landroidx/work/InputMerger;

    move-result-object v13

    .line 203
    nop

    .line 205
    .local v13, "inputMerger":Landroidx/work/InputMerger;
    if-nez v13, :cond_4

    .line 206
    .end local v5    # "isTracingEnabled":Z
    .end local v9    # "traceTag":Ljava/lang/String;
    invoke-static {}, Landroidx/work/impl/WorkerWrapperKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v0

    .local v0, "tag$iv":Ljava/lang/String;
    const/4 v5, 0x0

    .line 608
    .local v5, "$i$f$loge":I
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v9

    const/4 v12, 0x0

    .line 206
    .local v12, "$i$a$-loge-WorkerWrapper$runWorker$input$1":I
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Could not create Input Merger "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    iget-object v15, v8, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    iget-object v15, v15, Landroidx/work/impl/model/WorkSpec;->inputMergerClassName:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 608
    .end local v8    # "this":Landroidx/work/impl/WorkerWrapper;
    .end local v12    # "$i$a$-loge-WorkerWrapper$runWorker$input$1":I
    invoke-virtual {v9, v0, v8}, Landroidx/work/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    .end local v0    # "tag$iv":Ljava/lang/String;
    .end local v5    # "$i$f$loge":I
    new-instance v0, Landroidx/work/impl/WorkerWrapper$Resolution$Failed;

    invoke-direct {v0, v7, v6, v7}, Landroidx/work/impl/WorkerWrapper$Resolution$Failed;-><init>(Landroidx/work/ListenableWorker$Result;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0

    .line 210
    .local v5, "isTracingEnabled":Z
    .restart local v8    # "this":Landroidx/work/impl/WorkerWrapper;
    .restart local v9    # "traceTag":Ljava/lang/String;
    :cond_4
    iget-object v14, v8, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    iget-object v14, v14, Landroidx/work/impl/model/WorkSpec;->input:Landroidx/work/Data;

    invoke-static {v14}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v14

    check-cast v14, Ljava/util/Collection;

    iget-object v15, v8, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    iget-object v12, v8, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-interface {v15, v12}, Landroidx/work/impl/model/WorkSpecDao;->getInputsFromPrerequisites(Ljava/lang/String;)Ljava/util/List;

    move-result-object v12

    check-cast v12, Ljava/lang/Iterable;

    invoke-static {v14, v12}, Lkotlin/collections/CollectionsKt;->plus(Ljava/util/Collection;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v12

    .line 209
    nop

    .line 211
    .local v12, "inputs":Ljava/util/List;
    invoke-virtual {v13, v12}, Landroidx/work/InputMerger;->merge(Ljava/util/List;)Landroidx/work/Data;

    move-result-object v14

    move-object v10, v14

    .line 198
    .end local v10    # "inputMergerFactory":Landroidx/work/InputMergerFactory;
    .end local v11    # "inputMergerClassName":Ljava/lang/String;
    .end local v12    # "inputs":Ljava/util/List;
    .end local v13    # "inputMerger":Landroidx/work/InputMerger;
    :goto_1
    nop

    .line 197
    move-object/from16 v18, v10

    .line 214
    .local v18, "input":Landroidx/work/Data;
    new-instance v16, Landroidx/work/WorkerParameters;

    .line 215
    iget-object v10, v8, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-static {v10}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v17

    .line 216
    nop

    .line 217
    .end local v18    # "input":Landroidx/work/Data;
    iget-object v10, v8, Landroidx/work/impl/WorkerWrapper;->tags:Ljava/util/List;

    move-object/from16 v19, v10

    check-cast v19, Ljava/util/Collection;

    .line 218
    iget-object v10, v8, Landroidx/work/impl/WorkerWrapper;->runtimeExtras:Landroidx/work/WorkerParameters$RuntimeExtras;

    .line 219
    iget-object v11, v8, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    iget v11, v11, Landroidx/work/impl/model/WorkSpec;->runAttemptCount:I

    .line 220
    iget-object v12, v8, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    invoke-virtual {v12}, Landroidx/work/impl/model/WorkSpec;->getGeneration()I

    move-result v22

    .line 221
    iget-object v12, v8, Landroidx/work/impl/WorkerWrapper;->configuration:Landroidx/work/Configuration;

    invoke-virtual {v12}, Landroidx/work/Configuration;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v23

    .line 222
    iget-object v12, v8, Landroidx/work/impl/WorkerWrapper;->configuration:Landroidx/work/Configuration;

    invoke-virtual {v12}, Landroidx/work/Configuration;->getWorkerCoroutineContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v24

    .line 223
    iget-object v12, v8, Landroidx/work/impl/WorkerWrapper;->workTaskExecutor:Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    .line 224
    iget-object v13, v8, Landroidx/work/impl/WorkerWrapper;->configuration:Landroidx/work/Configuration;

    invoke-virtual {v13}, Landroidx/work/Configuration;->getWorkerFactory()Landroidx/work/WorkerFactory;

    move-result-object v26

    .line 225
    new-instance v13, Landroidx/work/impl/utils/WorkProgressUpdater;

    iget-object v14, v8, Landroidx/work/impl/WorkerWrapper;->workDatabase:Landroidx/work/impl/WorkDatabase;

    iget-object v15, v8, Landroidx/work/impl/WorkerWrapper;->workTaskExecutor:Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    invoke-direct {v13, v14, v15}, Landroidx/work/impl/utils/WorkProgressUpdater;-><init>(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;)V

    move-object/from16 v27, v13

    check-cast v27, Landroidx/work/ProgressUpdater;

    .line 226
    new-instance v13, Landroidx/work/impl/utils/WorkForegroundUpdater;

    iget-object v14, v8, Landroidx/work/impl/WorkerWrapper;->workDatabase:Landroidx/work/impl/WorkDatabase;

    iget-object v15, v8, Landroidx/work/impl/WorkerWrapper;->foregroundProcessor:Landroidx/work/impl/foreground/ForegroundProcessor;

    iget-object v6, v8, Landroidx/work/impl/WorkerWrapper;->workTaskExecutor:Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    invoke-direct {v13, v14, v15, v6}, Landroidx/work/impl/utils/WorkForegroundUpdater;-><init>(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/foreground/ForegroundProcessor;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;)V

    move-object/from16 v28, v13

    check-cast v28, Landroidx/work/ForegroundUpdater;

    .line 214
    move-object/from16 v20, v10

    move/from16 v21, v11

    move-object/from16 v25, v12

    .restart local v18    # "input":Landroidx/work/Data;
    invoke-direct/range {v16 .. v28}, Landroidx/work/WorkerParameters;-><init>(Ljava/util/UUID;Landroidx/work/Data;Ljava/util/Collection;Landroidx/work/WorkerParameters$RuntimeExtras;IILjava/util/concurrent/Executor;Lkotlin/coroutines/CoroutineContext;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Landroidx/work/WorkerFactory;Landroidx/work/ProgressUpdater;Landroidx/work/ForegroundUpdater;)V

    .line 213
    .end local v18    # "input":Landroidx/work/Data;
    move-object/from16 v6, v16

    .line 232
    .local v6, "params":Landroidx/work/WorkerParameters;
    iget-object v10, v8, Landroidx/work/impl/WorkerWrapper;->builderWorker:Landroidx/work/ListenableWorker;

    if-nez v10, :cond_6

    .line 233
    nop

    .line 234
    :try_start_1
    iget-object v10, v8, Landroidx/work/impl/WorkerWrapper;->configuration:Landroidx/work/Configuration;

    invoke-virtual {v10}, Landroidx/work/Configuration;->getWorkerFactory()Landroidx/work/WorkerFactory;

    move-result-object v10

    .line 235
    iget-object v11, v8, Landroidx/work/impl/WorkerWrapper;->appContext:Landroid/content/Context;

    .line 236
    iget-object v12, v8, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    iget-object v12, v12, Landroidx/work/impl/model/WorkSpec;->workerClassName:Ljava/lang/String;

    .line 237
    nop

    .line 234
    invoke-virtual {v10, v11, v12, v6}, Landroidx/work/WorkerFactory;->createWorkerWithDefaultFallback(Landroid/content/Context;Ljava/lang/String;Landroidx/work/WorkerParameters;)Landroidx/work/ListenableWorker;

    move-result-object v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 246
    goto :goto_2

    .line 239
    .end local v5    # "isTracingEnabled":Z
    .end local v9    # "traceTag":Ljava/lang/String;
    :catchall_1
    move-exception v0

    .line 240
    .local v0, "e":Ljava/lang/Throwable;
    invoke-static {}, Landroidx/work/impl/WorkerWrapperKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v5

    .local v5, "tag$iv":Ljava/lang/String;
    const/4 v9, 0x0

    .line 609
    .local v9, "$i$f$loge":I
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v10

    const/4 v11, 0x0

    .line 240
    .local v11, "$i$a$-loge-WorkerWrapper$runWorker$worker$1":I
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Could not create Worker "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, v8, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    iget-object v13, v13, Landroidx/work/impl/model/WorkSpec;->workerClassName:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 609
    .end local v11    # "$i$a$-loge-WorkerWrapper$runWorker$worker$1":I
    invoke-virtual {v10, v5, v11}, Landroidx/work/Logger;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    .end local v5    # "tag$iv":Ljava/lang/String;
    .end local v9    # "$i$f$loge":I
    iget-object v5, v8, Landroidx/work/impl/WorkerWrapper;->configuration:Landroidx/work/Configuration;

    invoke-virtual {v5}, Landroidx/work/Configuration;->getWorkerInitializationExceptionHandler()Landroidx/core/util/Consumer;

    move-result-object v5

    if-eqz v5, :cond_5

    .line 243
    new-instance v9, Landroidx/work/WorkerExceptionInfo;

    iget-object v10, v8, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    iget-object v10, v10, Landroidx/work/impl/model/WorkSpec;->workerClassName:Ljava/lang/String;

    invoke-direct {v9, v10, v6, v0}, Landroidx/work/WorkerExceptionInfo;-><init>(Ljava/lang/String;Landroidx/work/WorkerParameters;Ljava/lang/Throwable;)V

    .line 244
    .end local v0    # "e":Ljava/lang/Throwable;
    .end local v6    # "params":Landroidx/work/WorkerParameters;
    .end local v8    # "this":Landroidx/work/impl/WorkerWrapper;
    invoke-static {}, Landroidx/work/impl/WorkerWrapperKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v0

    .line 242
    invoke-static {v5, v9, v0}, Landroidx/work/impl/utils/WorkerExceptionUtilsKt;->safeAccept(Landroidx/core/util/Consumer;Landroidx/work/WorkerExceptionInfo;Ljava/lang/String;)V

    nop

    .line 246
    :cond_5
    new-instance v0, Landroidx/work/impl/WorkerWrapper$Resolution$Failed;

    const/4 v5, 0x1

    invoke-direct {v0, v7, v5, v7}, Landroidx/work/impl/WorkerWrapper$Resolution$Failed;-><init>(Landroidx/work/ListenableWorker$Result;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0

    .line 232
    .local v5, "isTracingEnabled":Z
    .restart local v6    # "params":Landroidx/work/WorkerParameters;
    .restart local v8    # "this":Landroidx/work/impl/WorkerWrapper;
    .local v9, "traceTag":Ljava/lang/String;
    :cond_6
    :goto_2
    nop

    .line 231
    nop

    .line 248
    .local v10, "worker":Landroidx/work/ListenableWorker;
    invoke-virtual {v10}, Landroidx/work/ListenableWorker;->setUsed()V

    .line 254
    invoke-interface {v3}, Lkotlin/coroutines/Continuation;->getContext()Lkotlin/coroutines/CoroutineContext;

    move-result-object v11

    sget-object v12, Lkotlinx/coroutines/Job;->Key:Lkotlinx/coroutines/Job$Key;

    check-cast v12, Lkotlin/coroutines/CoroutineContext$Key;

    invoke-interface {v11, v12}, Lkotlin/coroutines/CoroutineContext;->get(Lkotlin/coroutines/CoroutineContext$Key;)Lkotlin/coroutines/CoroutineContext$Element;

    move-result-object v11

    invoke-static {v11}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    check-cast v11, Lkotlinx/coroutines/Job;

    .line 275
    .local v11, "job":Lkotlinx/coroutines/Job;
    new-instance v12, Landroidx/work/impl/WorkerWrapper$runWorker$2;

    if-eqz v5, :cond_7

    const/4 v5, 0x1

    goto :goto_3

    :cond_7
    const/4 v5, 0x0

    .end local v5    # "isTracingEnabled":Z
    :goto_3
    invoke-direct {v12, v10, v5, v9, v8}, Landroidx/work/impl/WorkerWrapper$runWorker$2;-><init>(Landroidx/work/ListenableWorker;ZLjava/lang/String;Landroidx/work/impl/WorkerWrapper;)V

    check-cast v12, Lkotlin/jvm/functions/Function1;

    invoke-interface {v11, v12}, Lkotlinx/coroutines/Job;->invokeOnCompletion(Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/DisposableHandle;

    .line 286
    .end local v9    # "traceTag":Ljava/lang/String;
    invoke-direct {v8}, Landroidx/work/impl/WorkerWrapper;->trySetRunning()Z

    move-result v5

    if-nez v5, :cond_8

    .line 287
    .end local v10    # "worker":Landroidx/work/ListenableWorker;
    .end local v11    # "job":Lkotlinx/coroutines/Job;
    new-instance v0, Landroidx/work/impl/WorkerWrapper$Resolution$ResetWorkerStatus;

    const/4 v5, 0x0

    const/4 v9, 0x1

    invoke-direct {v0, v5, v9, v7}, Landroidx/work/impl/WorkerWrapper$Resolution$ResetWorkerStatus;-><init>(IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0

    .line 290
    .restart local v10    # "worker":Landroidx/work/ListenableWorker;
    .restart local v11    # "job":Lkotlinx/coroutines/Job;
    :cond_8
    const/4 v5, 0x0

    const/4 v9, 0x1

    invoke-interface {v11}, Lkotlinx/coroutines/Job;->isCancelled()Z

    move-result v12

    if-eqz v12, :cond_9

    .line 292
    .end local v10    # "worker":Landroidx/work/ListenableWorker;
    .end local v11    # "job":Lkotlinx/coroutines/Job;
    new-instance v0, Landroidx/work/impl/WorkerWrapper$Resolution$ResetWorkerStatus;

    invoke-direct {v0, v5, v9, v7}, Landroidx/work/impl/WorkerWrapper$Resolution$ResetWorkerStatus;-><init>(IILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0

    .line 295
    .restart local v10    # "worker":Landroidx/work/ListenableWorker;
    :cond_9
    invoke-virtual {v6}, Landroidx/work/WorkerParameters;->getForegroundUpdater()Landroidx/work/ForegroundUpdater;

    move-result-object v5

    const-string v9, "params.foregroundUpdater"

    invoke-static {v5, v9}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 296
    .local v5, "foregroundUpdater":Landroidx/work/ForegroundUpdater;
    iget-object v9, v8, Landroidx/work/impl/WorkerWrapper;->workTaskExecutor:Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    invoke-interface {v9}, Landroidx/work/impl/utils/taskexecutor/TaskExecutor;->getMainThreadExecutor()Ljava/util/concurrent/Executor;

    move-result-object v9

    const-string/jumbo v11, "workTaskExecutor.getMainThreadExecutor()"

    invoke-static {v9, v11}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v9}, Lkotlinx/coroutines/ExecutorsKt;->from(Ljava/util/concurrent/Executor;)Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v9

    .line 297
    .local v9, "mainDispatcher":Lkotlinx/coroutines/CoroutineDispatcher;
    nop

    .line 299
    :try_start_2
    move-object v11, v9

    check-cast v11, Lkotlin/coroutines/CoroutineContext;

    new-instance v12, Landroidx/work/impl/WorkerWrapper$runWorker$result$1;

    invoke-direct {v12, v8, v10, v5, v7}, Landroidx/work/impl/WorkerWrapper$runWorker$result$1;-><init>(Landroidx/work/impl/WorkerWrapper;Landroidx/work/ListenableWorker;Landroidx/work/ForegroundUpdater;Lkotlin/coroutines/Continuation;)V

    check-cast v12, Lkotlin/jvm/functions/Function2;

    iput-object v8, v3, Landroidx/work/impl/WorkerWrapper$runWorker$1;->L$0:Ljava/lang/Object;

    iput-object v6, v3, Landroidx/work/impl/WorkerWrapper$runWorker$1;->L$1:Ljava/lang/Object;

    const/4 v13, 0x1

    iput v13, v3, Landroidx/work/impl/WorkerWrapper$runWorker$1;->label:I

    invoke-static {v11, v12, v3}, Lkotlinx/coroutines/BuildersKt;->withContext(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v11
    :try_end_2
    .catch Ljava/util/concurrent/CancellationException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .end local v5    # "foregroundUpdater":Landroidx/work/ForegroundUpdater;
    .end local v9    # "mainDispatcher":Lkotlinx/coroutines/CoroutineDispatcher;
    .end local v10    # "worker":Landroidx/work/ListenableWorker;
    if-ne v11, v0, :cond_a

    .line 130
    return-object v0

    .line 299
    :cond_a
    move-object v5, v6

    .line 130
    .end local v6    # "params":Landroidx/work/WorkerParameters;
    .local v5, "params":Landroidx/work/WorkerParameters;
    :goto_4
    :try_start_3
    check-cast v11, Landroidx/work/ListenableWorker$Result;

    .line 298
    nop

    .line 313
    .local v11, "result":Landroidx/work/ListenableWorker$Result;
    new-instance v0, Landroidx/work/impl/WorkerWrapper$Resolution$Finished;

    const-string v6, "result"

    invoke-static {v11, v6}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v0, v11}, Landroidx/work/impl/WorkerWrapper$Resolution$Finished;-><init>(Landroidx/work/ListenableWorker$Result;)V
    :try_end_3
    .catch Ljava/util/concurrent/CancellationException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    return-object v0

    .line 317
    .end local v5    # "params":Landroidx/work/WorkerParameters;
    .end local v11    # "result":Landroidx/work/ListenableWorker$Result;
    .restart local v6    # "params":Landroidx/work/WorkerParameters;
    :catchall_2
    move-exception v0

    move-object v5, v6

    .line 318
    .end local v6    # "params":Landroidx/work/WorkerParameters;
    .local v0, "throwable":Ljava/lang/Throwable;
    .restart local v5    # "params":Landroidx/work/WorkerParameters;
    :goto_5
    invoke-static {}, Landroidx/work/impl/WorkerWrapperKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v6

    .local v6, "tag$iv":Ljava/lang/String;
    const/4 v9, 0x0

    .line 611
    .local v9, "$i$f$loge":I
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v10

    const/4 v11, 0x0

    .line 318
    .local v11, "$i$a$-loge-WorkerWrapper$runWorker$4":I
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v13, v8, Landroidx/work/impl/WorkerWrapper;->workDescription:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " failed because it threw an exception/error"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 611
    .end local v11    # "$i$a$-loge-WorkerWrapper$runWorker$4":I
    invoke-virtual {v10, v6, v11, v0}, Landroidx/work/Logger;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 319
    .end local v6    # "tag$iv":Ljava/lang/String;
    .end local v9    # "$i$f$loge":I
    iget-object v6, v8, Landroidx/work/impl/WorkerWrapper;->configuration:Landroidx/work/Configuration;

    invoke-virtual {v6}, Landroidx/work/Configuration;->getWorkerExecutionExceptionHandler()Landroidx/core/util/Consumer;

    move-result-object v6

    if-eqz v6, :cond_b

    .line 320
    new-instance v9, Landroidx/work/WorkerExceptionInfo;

    iget-object v10, v8, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    iget-object v10, v10, Landroidx/work/impl/model/WorkSpec;->workerClassName:Ljava/lang/String;

    invoke-direct {v9, v10, v5, v0}, Landroidx/work/WorkerExceptionInfo;-><init>(Ljava/lang/String;Landroidx/work/WorkerParameters;Ljava/lang/Throwable;)V

    .line 321
    .end local v0    # "throwable":Ljava/lang/Throwable;
    .end local v5    # "params":Landroidx/work/WorkerParameters;
    .end local v8    # "this":Landroidx/work/impl/WorkerWrapper;
    invoke-static {}, Landroidx/work/impl/WorkerWrapperKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v0

    .line 319
    invoke-static {v6, v9, v0}, Landroidx/work/impl/utils/WorkerExceptionUtilsKt;->safeAccept(Landroidx/core/util/Consumer;Landroidx/work/WorkerExceptionInfo;Ljava/lang/String;)V

    nop

    .line 323
    :cond_b
    new-instance v0, Landroidx/work/impl/WorkerWrapper$Resolution$Failed;

    const/4 v5, 0x1

    invoke-direct {v0, v7, v5, v7}, Landroidx/work/impl/WorkerWrapper$Resolution$Failed;-><init>(Landroidx/work/ListenableWorker$Result;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0

    .line 315
    .local v0, "cancellation":Ljava/util/concurrent/CancellationException;
    .restart local v8    # "this":Landroidx/work/impl/WorkerWrapper;
    :goto_6
    invoke-static {}, Landroidx/work/impl/WorkerWrapperKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v5

    .local v5, "tag$iv":Ljava/lang/String;
    const/4 v6, 0x0

    .line 610
    .local v6, "$i$f$logi":I
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v7

    const/4 v9, 0x0

    .line 315
    .local v9, "$i$a$-logi-WorkerWrapper$runWorker$3":I
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, v8, Landroidx/work/impl/WorkerWrapper;->workDescription:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " was cancelled"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 610
    .end local v8    # "this":Landroidx/work/impl/WorkerWrapper;
    .end local v9    # "$i$a$-logi-WorkerWrapper$runWorker$3":I
    move-object v9, v0

    check-cast v9, Ljava/lang/Throwable;

    invoke-virtual {v7, v5, v8, v9}, Landroidx/work/Logger;->info(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 316
    .end local v5    # "tag$iv":Ljava/lang/String;
    .end local v6    # "$i$f$logi":I
    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static final runWorker$lambda$1(Landroidx/work/impl/WorkerWrapper;)Ljava/lang/Boolean;
    .locals 7
    .param p0, "this$0"    # Landroidx/work/impl/WorkerWrapper;

    .line 150
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    iget-object v0, v0, Landroidx/work/impl/model/WorkSpec;->state:Landroidx/work/WorkInfo$State;

    sget-object v1, Landroidx/work/WorkInfo$State;->ENQUEUED:Landroidx/work/WorkInfo$State;

    const/4 v2, 0x1

    .line 154
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .line 150
    if-eq v0, v1, :cond_0

    .line 151
    invoke-static {}, Landroidx/work/impl/WorkerWrapperKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v0

    .local v0, "tag$iv":Ljava/lang/String;
    const/4 v1, 0x0

    .line 618
    .local v1, "$i$f$logd":I
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v3

    const/4 v4, 0x0

    .line 152
    .local v4, "$i$a$-logd-WorkerWrapper$runWorker$shouldExit$1$1":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    iget-object v6, v6, Landroidx/work/impl/model/WorkSpec;->workerClassName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " is not in ENQUEUED state. Nothing more to do"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 618
    .end local v4    # "$i$a$-logd-WorkerWrapper$runWorker$shouldExit$1$1":I
    invoke-virtual {v3, v0, v4}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    .end local v0    # "tag$iv":Ljava/lang/String;
    .end local v1    # "$i$f$logd":I
    return-object v2

    .line 171
    :cond_0
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    invoke-virtual {v0}, Landroidx/work/impl/model/WorkSpec;->isPeriodic()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    invoke-virtual {v0}, Landroidx/work/impl/model/WorkSpec;->isBackedOff()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 172
    :cond_1
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->clock:Landroidx/work/Clock;

    invoke-interface {v0}, Landroidx/work/Clock;->currentTimeMillis()J

    move-result-wide v0

    .line 173
    .local v0, "now":J
    iget-object v3, p0, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    invoke-virtual {v3}, Landroidx/work/impl/model/WorkSpec;->calculateNextRunTime()J

    move-result-wide v3

    cmp-long v3, v0, v3

    if-gez v3, :cond_2

    .line 174
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v3

    .line 176
    invoke-static {}, Landroidx/work/impl/WorkerWrapperKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v4

    .line 177
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Delaying execution for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    iget-object v6, v6, Landroidx/work/impl/model/WorkSpec;->workerClassName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " because it is being executed before schedule."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 175
    invoke-virtual {v3, v4, v5}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    return-object v2

    .line 189
    .end local v0    # "now":J
    :cond_2
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method private final setSucceeded(Landroidx/work/ListenableWorker$Result;)Z
    .locals 13
    .param p1, "result"    # Landroidx/work/ListenableWorker$Result;

    .line 463
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    sget-object v1, Landroidx/work/WorkInfo$State;->SUCCEEDED:Landroidx/work/WorkInfo$State;

    iget-object v2, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Landroidx/work/impl/model/WorkSpecDao;->setState(Landroidx/work/WorkInfo$State;Ljava/lang/String;)I

    .line 464
    const-string v0, "null cannot be cast to non-null type androidx.work.ListenableWorker.Result.Success"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;Ljava/lang/String;)V

    move-object v0, p1

    check-cast v0, Landroidx/work/ListenableWorker$Result$Success;

    .line 466
    .local v0, "success":Landroidx/work/ListenableWorker$Result$Success;
    invoke-virtual {v0}, Landroidx/work/ListenableWorker$Result$Success;->getOutputData()Landroidx/work/Data;

    move-result-object v1

    const-string/jumbo v2, "success.outputData"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 467
    .local v1, "output":Landroidx/work/Data;
    iget-object v2, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    iget-object v3, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-interface {v2, v3, v1}, Landroidx/work/impl/model/WorkSpecDao;->setOutput(Ljava/lang/String;Landroidx/work/Data;)V

    .line 470
    iget-object v2, p0, Landroidx/work/impl/WorkerWrapper;->clock:Landroidx/work/Clock;

    invoke-interface {v2}, Landroidx/work/Clock;->currentTimeMillis()J

    move-result-wide v2

    .line 471
    .local v2, "currentTimeMillis":J
    iget-object v4, p0, Landroidx/work/impl/WorkerWrapper;->dependencyDao:Landroidx/work/impl/model/DependencyDao;

    iget-object v5, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-interface {v4, v5}, Landroidx/work/impl/model/DependencyDao;->getDependentWorkIds(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    .line 472
    .local v4, "dependentWorkIds":Ljava/util/List;
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 473
    .local v6, "dependentWorkId":Ljava/lang/String;
    nop

    .line 474
    iget-object v7, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    invoke-interface {v7, v6}, Landroidx/work/impl/model/WorkSpecDao;->getState(Ljava/lang/String;)Landroidx/work/WorkInfo$State;

    move-result-object v7

    sget-object v8, Landroidx/work/WorkInfo$State;->BLOCKED:Landroidx/work/WorkInfo$State;

    if-ne v7, v8, :cond_0

    .line 475
    iget-object v7, p0, Landroidx/work/impl/WorkerWrapper;->dependencyDao:Landroidx/work/impl/model/DependencyDao;

    invoke-interface {v7, v6}, Landroidx/work/impl/model/DependencyDao;->hasCompletedAllPrerequisites(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 477
    invoke-static {}, Landroidx/work/impl/WorkerWrapperKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v7

    .local v7, "tag$iv":Ljava/lang/String;
    const/4 v8, 0x0

    .line 617
    .local v8, "$i$f$logi":I
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v9

    const/4 v10, 0x0

    .line 477
    .local v10, "$i$a$-logi-WorkerWrapper$setSucceeded$1":I
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Setting status to enqueued for "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 617
    .end local v10    # "$i$a$-logi-WorkerWrapper$setSucceeded$1":I
    invoke-virtual {v9, v7, v10}, Landroidx/work/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 478
    .end local v7    # "tag$iv":Ljava/lang/String;
    .end local v8    # "$i$f$logi":I
    iget-object v7, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    sget-object v8, Landroidx/work/WorkInfo$State;->ENQUEUED:Landroidx/work/WorkInfo$State;

    invoke-interface {v7, v8, v6}, Landroidx/work/impl/model/WorkSpecDao;->setState(Landroidx/work/WorkInfo$State;Ljava/lang/String;)I

    .line 479
    iget-object v7, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    invoke-interface {v7, v6, v2, v3}, Landroidx/work/impl/model/WorkSpecDao;->setLastEnqueueTime(Ljava/lang/String;J)V

    .end local v6    # "dependentWorkId":Ljava/lang/String;
    goto :goto_0

    .line 482
    :cond_1
    const/4 v5, 0x0

    return v5
.end method

.method private final trySetRunning()Z
    .locals 2

    .line 395
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workDatabase:Landroidx/work/impl/WorkDatabase;

    .line 396
    nop

    .line 395
    new-instance v1, Landroidx/work/impl/WorkerWrapper$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Landroidx/work/impl/WorkerWrapper$$ExternalSyntheticLambda1;-><init>(Landroidx/work/impl/WorkerWrapper;)V

    invoke-virtual {v0, v1}, Landroidx/work/impl/WorkDatabase;->runInTransaction(Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    move-result-object v0

    const-string/jumbo v1, "workDatabase.runInTransa\u2026e\n            }\n        )"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    .line 405
    return v0
.end method

.method private static final trySetRunning$lambda$11(Landroidx/work/impl/WorkerWrapper;)Ljava/lang/Boolean;
    .locals 4
    .param p0, "this$0"    # Landroidx/work/impl/WorkerWrapper;

    .line 397
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    iget-object v1, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-interface {v0, v1}, Landroidx/work/impl/model/WorkSpecDao;->getState(Ljava/lang/String;)Landroidx/work/WorkInfo$State;

    move-result-object v0

    .line 398
    .local v0, "currentState":Landroidx/work/WorkInfo$State;
    sget-object v1, Landroidx/work/WorkInfo$State;->ENQUEUED:Landroidx/work/WorkInfo$State;

    if-ne v0, v1, :cond_0

    .line 399
    iget-object v1, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    sget-object v2, Landroidx/work/WorkInfo$State;->RUNNING:Landroidx/work/WorkInfo$State;

    iget-object v3, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-interface {v1, v2, v3}, Landroidx/work/impl/model/WorkSpecDao;->setState(Landroidx/work/WorkInfo$State;Ljava/lang/String;)I

    .line 400
    iget-object v1, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    iget-object v2, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-interface {v1, v2}, Landroidx/work/impl/model/WorkSpecDao;->incrementWorkSpecRunAttemptCount(Ljava/lang/String;)I

    .line 401
    iget-object v1, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    iget-object v2, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    const/16 v3, -0x100

    invoke-interface {v1, v2, v3}, Landroidx/work/impl/model/WorkSpecDao;->setStopReason(Ljava/lang/String;I)V

    .line 402
    const/4 v1, 0x1

    goto :goto_0

    .line 403
    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public final getWorkGenerationalId()Landroidx/work/impl/model/WorkGenerationalId;
    .locals 1

    .line 89
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    invoke-static {v0}, Landroidx/work/impl/model/WorkSpecKt;->generationalId(Landroidx/work/impl/model/WorkSpec;)Landroidx/work/impl/model/WorkGenerationalId;

    move-result-object v0

    return-object v0
.end method

.method public final getWorkSpec()Landroidx/work/impl/model/WorkSpec;
    .locals 1

    .line 69
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    return-object v0
.end method

.method public final interrupt(I)V
    .locals 2
    .param p1, "stopReason"    # I

    .line 348
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workerJob:Lkotlinx/coroutines/CompletableJob;

    new-instance v1, Landroidx/work/impl/WorkerStoppedException;

    invoke-direct {v1, p1}, Landroidx/work/impl/WorkerStoppedException;-><init>(I)V

    check-cast v1, Ljava/util/concurrent/CancellationException;

    invoke-interface {v0, v1}, Lkotlinx/coroutines/CompletableJob;->cancel(Ljava/util/concurrent/CancellationException;)V

    .line 349
    return-void
.end method

.method public final launch()Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 92
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workTaskExecutor:Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    invoke-interface {v0}, Landroidx/work/impl/utils/taskexecutor/TaskExecutor;->getTaskCoroutineDispatcher()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v2, v1, v2}, Lkotlinx/coroutines/JobKt;->Job$default(Lkotlinx/coroutines/Job;ILjava/lang/Object;)Lkotlinx/coroutines/CompletableJob;

    move-result-object v1

    check-cast v1, Lkotlin/coroutines/CoroutineContext;

    invoke-virtual {v0, v1}, Lkotlinx/coroutines/CoroutineDispatcher;->plus(Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    new-instance v1, Landroidx/work/impl/WorkerWrapper$launch$1;

    invoke-direct {v1, p0, v2}, Landroidx/work/impl/WorkerWrapper$launch$1;-><init>(Landroidx/work/impl/WorkerWrapper;Lkotlin/coroutines/Continuation;)V

    check-cast v1, Lkotlin/jvm/functions/Function2;

    const/4 v3, 0x2

    invoke-static {v0, v2, v1, v3, v2}, Landroidx/work/ListenableFutureKt;->launchFuture$default(Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    .line 120
    return-object v0
.end method

.method public final setFailed(Landroidx/work/ListenableWorker$Result;)Z
    .locals 5
    .param p1, "result"    # Landroidx/work/ListenableWorker$Result;

    const-string v0, "result"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 409
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-direct {p0, v0}, Landroidx/work/impl/WorkerWrapper;->iterativelyFailWorkAndDependents(Ljava/lang/String;)V

    .line 410
    move-object v0, p1

    check-cast v0, Landroidx/work/ListenableWorker$Result$Failure;

    .line 412
    .local v0, "failure":Landroidx/work/ListenableWorker$Result$Failure;
    invoke-virtual {v0}, Landroidx/work/ListenableWorker$Result$Failure;->getOutputData()Landroidx/work/Data;

    move-result-object v1

    const-string v2, "failure.outputData"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 413
    .local v1, "output":Landroidx/work/Data;
    iget-object v2, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    .line 414
    iget-object v3, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    .line 415
    iget-object v4, p0, Landroidx/work/impl/WorkerWrapper;->workSpec:Landroidx/work/impl/model/WorkSpec;

    invoke-virtual {v4}, Landroidx/work/impl/model/WorkSpec;->getNextScheduleTimeOverrideGeneration()I

    move-result v4

    .line 413
    invoke-interface {v2, v3, v4}, Landroidx/work/impl/model/WorkSpecDao;->resetWorkSpecNextScheduleTimeOverride(Ljava/lang/String;I)V

    .line 417
    iget-object v2, p0, Landroidx/work/impl/WorkerWrapper;->workSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    iget-object v3, p0, Landroidx/work/impl/WorkerWrapper;->workSpecId:Ljava/lang/String;

    invoke-interface {v2, v3, v1}, Landroidx/work/impl/model/WorkSpecDao;->setOutput(Ljava/lang/String;Landroidx/work/Data;)V

    .line 418
    const/4 v2, 0x0

    return v2
.end method
