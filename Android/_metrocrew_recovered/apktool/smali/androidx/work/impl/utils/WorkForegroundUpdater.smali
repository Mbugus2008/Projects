.class public Landroidx/work/impl/utils/WorkForegroundUpdater;
.super Ljava/lang/Object;
.source "WorkForegroundUpdater.java"

# interfaces
.implements Landroidx/work/ForegroundUpdater;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field final mForegroundProcessor:Landroidx/work/impl/foreground/ForegroundProcessor;

.field private final mTaskExecutor:Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

.field final mWorkSpecDao:Landroidx/work/impl/model/WorkSpecDao;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 50
    const-string v0, "WMFgUpdater"

    invoke-static {v0}, Landroidx/work/Logger;->tagWithPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/work/impl/utils/WorkForegroundUpdater;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/foreground/ForegroundProcessor;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;)V
    .locals 1
    .param p1, "workDatabase"    # Landroidx/work/impl/WorkDatabase;
    .param p2, "foregroundProcessor"    # Landroidx/work/impl/foreground/ForegroundProcessor;
    .param p3, "taskExecutor"    # Landroidx/work/impl/utils/taskexecutor/TaskExecutor;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "workDatabase",
            "foregroundProcessor",
            "taskExecutor"
        }
    .end annotation

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p2, p0, Landroidx/work/impl/utils/WorkForegroundUpdater;->mForegroundProcessor:Landroidx/work/impl/foreground/ForegroundProcessor;

    .line 69
    iput-object p3, p0, Landroidx/work/impl/utils/WorkForegroundUpdater;->mTaskExecutor:Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    .line 70
    invoke-virtual {p1}, Landroidx/work/impl/WorkDatabase;->workSpecDao()Landroidx/work/impl/model/WorkSpecDao;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/impl/utils/WorkForegroundUpdater;->mWorkSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    .line 71
    return-void
.end method


# virtual methods
.method synthetic lambda$setForegroundAsync$0$androidx-work-impl-utils-WorkForegroundUpdater(Ljava/util/UUID;Landroidx/work/ForegroundInfo;Landroid/content/Context;)Ljava/lang/Void;
    .locals 4
    .param p1, "id"    # Ljava/util/UUID;
    .param p2, "foregroundInfo"    # Landroidx/work/ForegroundInfo;
    .param p3, "context"    # Landroid/content/Context;

    .line 81
    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    .line 82
    .local v0, "workSpecId":Ljava/lang/String;
    iget-object v1, p0, Landroidx/work/impl/utils/WorkForegroundUpdater;->mWorkSpecDao:Landroidx/work/impl/model/WorkSpecDao;

    invoke-interface {v1, v0}, Landroidx/work/impl/model/WorkSpecDao;->getWorkSpec(Ljava/lang/String;)Landroidx/work/impl/model/WorkSpec;

    move-result-object v1

    .line 83
    .local v1, "workSpec":Landroidx/work/impl/model/WorkSpec;
    if-eqz v1, :cond_0

    iget-object v2, v1, Landroidx/work/impl/model/WorkSpec;->state:Landroidx/work/WorkInfo$State;

    invoke-virtual {v2}, Landroidx/work/WorkInfo$State;->isFinished()Z

    move-result v2

    if-nez v2, :cond_0

    .line 94
    iget-object v2, p0, Landroidx/work/impl/utils/WorkForegroundUpdater;->mForegroundProcessor:Landroidx/work/impl/foreground/ForegroundProcessor;

    invoke-interface {v2, v0, p2}, Landroidx/work/impl/foreground/ForegroundProcessor;->startForeground(Ljava/lang/String;Landroidx/work/ForegroundInfo;)V

    .line 97
    invoke-static {v1}, Landroidx/work/impl/model/WorkSpecKt;->generationalId(Landroidx/work/impl/model/WorkSpec;)Landroidx/work/impl/model/WorkGenerationalId;

    move-result-object v2

    invoke-static {p3, v2, p2}, Landroidx/work/impl/foreground/SystemForegroundDispatcher;->createNotifyIntent(Landroid/content/Context;Landroidx/work/impl/model/WorkGenerationalId;Landroidx/work/ForegroundInfo;)Landroid/content/Intent;

    move-result-object v2

    .line 99
    .local v2, "intent":Landroid/content/Intent;
    invoke-virtual {p3, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 100
    const/4 v3, 0x0

    return-object v3

    .line 85
    .end local v2    # "intent":Landroid/content/Intent;
    :cond_0
    const-string v2, "Calls to setForegroundAsync() must complete before a ListenableWorker signals completion of work by returning an instance of Result."

    .line 89
    .local v2, "message":Ljava/lang/String;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public setForegroundAsync(Landroid/content/Context;Ljava/util/UUID;Landroidx/work/ForegroundInfo;)Lcom/google/common/util/concurrent/ListenableFuture;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "id"    # Ljava/util/UUID;
    .param p3, "foregroundInfo"    # Landroidx/work/ForegroundInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10,
            0x10
        }
        names = {
            "context",
            "id",
            "foregroundInfo"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/UUID;",
            "Landroidx/work/ForegroundInfo;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 79
    iget-object v0, p0, Landroidx/work/impl/utils/WorkForegroundUpdater;->mTaskExecutor:Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    invoke-interface {v0}, Landroidx/work/impl/utils/taskexecutor/TaskExecutor;->getSerialTaskExecutor()Landroidx/work/impl/utils/taskexecutor/SerialExecutor;

    move-result-object v0

    new-instance v1, Landroidx/work/impl/utils/WorkForegroundUpdater$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p2, p3, p1}, Landroidx/work/impl/utils/WorkForegroundUpdater$$ExternalSyntheticLambda0;-><init>(Landroidx/work/impl/utils/WorkForegroundUpdater;Ljava/util/UUID;Landroidx/work/ForegroundInfo;Landroid/content/Context;)V

    const-string/jumbo v2, "setForegroundAsync"

    invoke-static {v0, v2, v1}, Landroidx/work/ListenableFutureKt;->executeAsync(Ljava/util/concurrent/Executor;Ljava/lang/String;Lkotlin/jvm/functions/Function0;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    return-object v0
.end method
