.class public final Landroidx/work/WorkerParameters;
.super Ljava/lang/Object;
.source "WorkerParameters.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/work/WorkerParameters$RuntimeExtras;
    }
.end annotation


# instance fields
.field private mBackgroundExecutor:Ljava/util/concurrent/Executor;

.field private mForegroundUpdater:Landroidx/work/ForegroundUpdater;

.field private mGeneration:I

.field private mId:Ljava/util/UUID;

.field private mInputData:Landroidx/work/Data;

.field private mProgressUpdater:Landroidx/work/ProgressUpdater;

.field private mRunAttemptCount:I

.field private mRuntimeExtras:Landroidx/work/WorkerParameters$RuntimeExtras;

.field private mTags:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mWorkTaskExecutor:Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

.field private mWorkerContext:Lkotlin/coroutines/CoroutineContext;

.field private mWorkerFactory:Landroidx/work/WorkerFactory;


# direct methods
.method public constructor <init>(Ljava/util/UUID;Landroidx/work/Data;Ljava/util/Collection;Landroidx/work/WorkerParameters$RuntimeExtras;IILjava/util/concurrent/Executor;Lkotlin/coroutines/CoroutineContext;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Landroidx/work/WorkerFactory;Landroidx/work/ProgressUpdater;Landroidx/work/ForegroundUpdater;)V
    .locals 1
    .param p1, "id"    # Ljava/util/UUID;
    .param p2, "inputData"    # Landroidx/work/Data;
    .param p4, "runtimeExtras"    # Landroidx/work/WorkerParameters$RuntimeExtras;
    .param p5, "runAttemptCount"    # I
    .param p6, "generation"    # I
    .param p7, "backgroundExecutor"    # Ljava/util/concurrent/Executor;
    .param p8, "workerContext"    # Lkotlin/coroutines/CoroutineContext;
    .param p9, "workTaskExecutor"    # Landroidx/work/impl/utils/taskexecutor/TaskExecutor;
    .param p10, "workerFactory"    # Landroidx/work/WorkerFactory;
    .param p11, "progressUpdater"    # Landroidx/work/ProgressUpdater;
    .param p12, "foregroundUpdater"    # Landroidx/work/ForegroundUpdater;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "id",
            "inputData",
            "tags",
            "runtimeExtras",
            "runAttemptCount",
            "generation",
            "backgroundExecutor",
            "workerContext",
            "workTaskExecutor",
            "workerFactory",
            "progressUpdater",
            "foregroundUpdater"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            "Landroidx/work/Data;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;",
            "Landroidx/work/WorkerParameters$RuntimeExtras;",
            "II",
            "Ljava/util/concurrent/Executor;",
            "Lkotlin/coroutines/CoroutineContext;",
            "Landroidx/work/impl/utils/taskexecutor/TaskExecutor;",
            "Landroidx/work/WorkerFactory;",
            "Landroidx/work/ProgressUpdater;",
            "Landroidx/work/ForegroundUpdater;",
            ")V"
        }
    .end annotation

    .line 73
    .local p3, "tags":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-object p1, p0, Landroidx/work/WorkerParameters;->mId:Ljava/util/UUID;

    .line 75
    iput-object p2, p0, Landroidx/work/WorkerParameters;->mInputData:Landroidx/work/Data;

    .line 76
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p3}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Landroidx/work/WorkerParameters;->mTags:Ljava/util/Set;

    .line 77
    iput-object p4, p0, Landroidx/work/WorkerParameters;->mRuntimeExtras:Landroidx/work/WorkerParameters$RuntimeExtras;

    .line 78
    iput p5, p0, Landroidx/work/WorkerParameters;->mRunAttemptCount:I

    .line 79
    iput p6, p0, Landroidx/work/WorkerParameters;->mGeneration:I

    .line 80
    iput-object p7, p0, Landroidx/work/WorkerParameters;->mBackgroundExecutor:Ljava/util/concurrent/Executor;

    .line 81
    iput-object p8, p0, Landroidx/work/WorkerParameters;->mWorkerContext:Lkotlin/coroutines/CoroutineContext;

    .line 82
    iput-object p9, p0, Landroidx/work/WorkerParameters;->mWorkTaskExecutor:Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    .line 83
    iput-object p10, p0, Landroidx/work/WorkerParameters;->mWorkerFactory:Landroidx/work/WorkerFactory;

    .line 84
    iput-object p11, p0, Landroidx/work/WorkerParameters;->mProgressUpdater:Landroidx/work/ProgressUpdater;

    .line 85
    iput-object p12, p0, Landroidx/work/WorkerParameters;->mForegroundUpdater:Landroidx/work/ForegroundUpdater;

    .line 86
    return-void
.end method


# virtual methods
.method public getBackgroundExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 186
    iget-object v0, p0, Landroidx/work/WorkerParameters;->mBackgroundExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public getForegroundUpdater()Landroidx/work/ForegroundUpdater;
    .locals 1

    .line 221
    iget-object v0, p0, Landroidx/work/WorkerParameters;->mForegroundUpdater:Landroidx/work/ForegroundUpdater;

    return-object v0
.end method

.method public getGeneration()I
    .locals 1

    .line 179
    iget v0, p0, Landroidx/work/WorkerParameters;->mGeneration:I

    return v0
.end method

.method public getId()Ljava/util/UUID;
    .locals 1

    .line 94
    iget-object v0, p0, Landroidx/work/WorkerParameters;->mId:Ljava/util/UUID;

    return-object v0
.end method

.method public getInputData()Landroidx/work/Data;
    .locals 1

    .line 105
    iget-object v0, p0, Landroidx/work/WorkerParameters;->mInputData:Landroidx/work/Data;

    return-object v0
.end method

.method public getNetwork()Landroid/net/Network;
    .locals 1

    .line 150
    iget-object v0, p0, Landroidx/work/WorkerParameters;->mRuntimeExtras:Landroidx/work/WorkerParameters$RuntimeExtras;

    iget-object v0, v0, Landroidx/work/WorkerParameters$RuntimeExtras;->network:Landroid/net/Network;

    return-object v0
.end method

.method public getProgressUpdater()Landroidx/work/ProgressUpdater;
    .locals 1

    .line 214
    iget-object v0, p0, Landroidx/work/WorkerParameters;->mProgressUpdater:Landroidx/work/ProgressUpdater;

    return-object v0
.end method

.method public getRunAttemptCount()I
    .locals 1

    .line 161
    iget v0, p0, Landroidx/work/WorkerParameters;->mRunAttemptCount:I

    return v0
.end method

.method public getRuntimeExtras()Landroidx/work/WorkerParameters$RuntimeExtras;
    .locals 1

    .line 228
    iget-object v0, p0, Landroidx/work/WorkerParameters;->mRuntimeExtras:Landroidx/work/WorkerParameters$RuntimeExtras;

    return-object v0
.end method

.method public getTags()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 115
    iget-object v0, p0, Landroidx/work/WorkerParameters;->mTags:Ljava/util/Set;

    return-object v0
.end method

.method public getTaskExecutor()Landroidx/work/impl/utils/taskexecutor/TaskExecutor;
    .locals 1

    .line 200
    iget-object v0, p0, Landroidx/work/WorkerParameters;->mWorkTaskExecutor:Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    return-object v0
.end method

.method public getTriggeredContentAuthorities()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 139
    iget-object v0, p0, Landroidx/work/WorkerParameters;->mRuntimeExtras:Landroidx/work/WorkerParameters$RuntimeExtras;

    iget-object v0, v0, Landroidx/work/WorkerParameters$RuntimeExtras;->triggeredContentAuthorities:Ljava/util/List;

    return-object v0
.end method

.method public getTriggeredContentUris()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .line 127
    iget-object v0, p0, Landroidx/work/WorkerParameters;->mRuntimeExtras:Landroidx/work/WorkerParameters$RuntimeExtras;

    iget-object v0, v0, Landroidx/work/WorkerParameters$RuntimeExtras;->triggeredContentUris:Ljava/util/List;

    return-object v0
.end method

.method public getWorkerContext()Lkotlin/coroutines/CoroutineContext;
    .locals 1

    .line 193
    iget-object v0, p0, Landroidx/work/WorkerParameters;->mWorkerContext:Lkotlin/coroutines/CoroutineContext;

    return-object v0
.end method

.method public getWorkerFactory()Landroidx/work/WorkerFactory;
    .locals 1

    .line 207
    iget-object v0, p0, Landroidx/work/WorkerParameters;->mWorkerFactory:Landroidx/work/WorkerFactory;

    return-object v0
.end method
