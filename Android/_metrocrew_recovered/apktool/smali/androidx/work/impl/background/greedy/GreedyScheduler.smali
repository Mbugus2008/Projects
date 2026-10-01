.class public Landroidx/work/impl/background/greedy/GreedyScheduler;
.super Ljava/lang/Object;
.source "GreedyScheduler.java"

# interfaces
.implements Landroidx/work/impl/Scheduler;
.implements Landroidx/work/impl/constraints/OnConstraintsStateChangedListener;
.implements Landroidx/work/impl/ExecutionListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/work/impl/background/greedy/GreedyScheduler$AttemptData;
    }
.end annotation


# static fields
.field private static final NON_THROTTLE_RUN_ATTEMPT_COUNT:I = 0x5

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final mConfiguration:Landroidx/work/Configuration;

.field private final mConstrainedWorkSpecs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/work/impl/model/WorkGenerationalId;",
            "Lkotlinx/coroutines/Job;",
            ">;"
        }
    .end annotation
.end field

.field private final mConstraintsTracker:Landroidx/work/impl/constraints/WorkConstraintsTracker;

.field private final mContext:Landroid/content/Context;

.field private mDelayedWorkTracker:Landroidx/work/impl/background/greedy/DelayedWorkTracker;

.field private final mFirstRunAttempts:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroidx/work/impl/model/WorkGenerationalId;",
            "Landroidx/work/impl/background/greedy/GreedyScheduler$AttemptData;",
            ">;"
        }
    .end annotation
.end field

.field mInDefaultProcess:Ljava/lang/Boolean;

.field private final mLock:Ljava/lang/Object;

.field private final mProcessor:Landroidx/work/impl/Processor;

.field private mRegisteredExecutionListener:Z

.field private final mStartStopTokens:Landroidx/work/impl/StartStopTokens;

.field private final mTaskExecutor:Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

.field private final mTimeLimiter:Landroidx/work/impl/background/greedy/TimeLimiter;

.field private final mWorkLauncher:Landroidx/work/impl/WorkLauncher;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 69
    const-string v0, "GreedyScheduler"

    invoke-static {v0}, Landroidx/work/Logger;->tagWithPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/work/impl/background/greedy/GreedyScheduler;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroidx/work/Configuration;Landroidx/work/impl/constraints/trackers/Trackers;Landroidx/work/impl/Processor;Landroidx/work/impl/WorkLauncher;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "configuration"    # Landroidx/work/Configuration;
    .param p3, "trackers"    # Landroidx/work/impl/constraints/trackers/Trackers;
    .param p4, "processor"    # Landroidx/work/impl/Processor;
    .param p5, "workLauncher"    # Landroidx/work/impl/WorkLauncher;
    .param p6, "taskExecutor"    # Landroidx/work/impl/utils/taskexecutor/TaskExecutor;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "configuration",
            "trackers",
            "processor",
            "workLauncher",
            "taskExecutor"
        }
    .end annotation

    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mConstrainedWorkSpecs:Ljava/util/Map;

    .line 81
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mLock:Ljava/lang/Object;

    .line 82
    invoke-static {}, Landroidx/work/impl/StartStopTokens;->create()Landroidx/work/impl/StartStopTokens;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mStartStopTokens:Landroidx/work/impl/StartStopTokens;

    .line 88
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mFirstRunAttempts:Ljava/util/Map;

    .line 104
    iput-object p1, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mContext:Landroid/content/Context;

    .line 105
    invoke-virtual {p2}, Landroidx/work/Configuration;->getRunnableScheduler()Landroidx/work/RunnableScheduler;

    move-result-object v0

    .line 106
    .local v0, "runnableScheduler":Landroidx/work/RunnableScheduler;
    new-instance v1, Landroidx/work/impl/background/greedy/DelayedWorkTracker;

    .line 107
    invoke-virtual {p2}, Landroidx/work/Configuration;->getClock()Landroidx/work/Clock;

    move-result-object v2

    invoke-direct {v1, p0, v0, v2}, Landroidx/work/impl/background/greedy/DelayedWorkTracker;-><init>(Landroidx/work/impl/Scheduler;Landroidx/work/RunnableScheduler;Landroidx/work/Clock;)V

    iput-object v1, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mDelayedWorkTracker:Landroidx/work/impl/background/greedy/DelayedWorkTracker;

    .line 108
    new-instance v1, Landroidx/work/impl/background/greedy/TimeLimiter;

    invoke-direct {v1, v0, p5}, Landroidx/work/impl/background/greedy/TimeLimiter;-><init>(Landroidx/work/RunnableScheduler;Landroidx/work/impl/WorkLauncher;)V

    iput-object v1, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mTimeLimiter:Landroidx/work/impl/background/greedy/TimeLimiter;

    .line 109
    iput-object p6, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mTaskExecutor:Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    .line 110
    new-instance v1, Landroidx/work/impl/constraints/WorkConstraintsTracker;

    invoke-direct {v1, p3}, Landroidx/work/impl/constraints/WorkConstraintsTracker;-><init>(Landroidx/work/impl/constraints/trackers/Trackers;)V

    iput-object v1, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mConstraintsTracker:Landroidx/work/impl/constraints/WorkConstraintsTracker;

    .line 111
    iput-object p2, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mConfiguration:Landroidx/work/Configuration;

    .line 112
    iput-object p4, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mProcessor:Landroidx/work/impl/Processor;

    .line 113
    iput-object p5, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mWorkLauncher:Landroidx/work/impl/WorkLauncher;

    .line 114
    return-void
.end method

.method private checkDefaultProcess()V
    .locals 2

    .line 206
    iget-object v0, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mContext:Landroid/content/Context;

    iget-object v1, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mConfiguration:Landroidx/work/Configuration;

    invoke-static {v0, v1}, Landroidx/work/impl/utils/ProcessUtils;->isDefaultProcess(Landroid/content/Context;Landroidx/work/Configuration;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mInDefaultProcess:Ljava/lang/Boolean;

    .line 207
    return-void
.end method

.method private registerExecutionListenerIfNeeded()V
    .locals 1

    .line 290
    iget-boolean v0, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mRegisteredExecutionListener:Z

    if-nez v0, :cond_0

    .line 291
    iget-object v0, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mProcessor:Landroidx/work/impl/Processor;

    invoke-virtual {v0, p0}, Landroidx/work/impl/Processor;->addExecutionListener(Landroidx/work/impl/ExecutionListener;)V

    .line 292
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mRegisteredExecutionListener:Z

    .line 294
    :cond_0
    return-void
.end method

.method private removeConstraintTrackingFor(Landroidx/work/impl/model/WorkGenerationalId;)V
    .locals 5
    .param p1, "id"    # Landroidx/work/impl/model/WorkGenerationalId;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "id"
        }
    .end annotation

    .line 275
    iget-object v0, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 279
    :try_start_0
    iget-object v1, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mConstrainedWorkSpecs:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lkotlinx/coroutines/Job;

    .line 280
    .local v1, "job":Lkotlinx/coroutines/Job;
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 281
    if-eqz v1, :cond_0

    .line 282
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v0

    sget-object v2, Landroidx/work/impl/background/greedy/GreedyScheduler;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Stopping tracking for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    const/4 v0, 0x0

    invoke-interface {v1, v0}, Lkotlinx/coroutines/Job;->cancel(Ljava/util/concurrent/CancellationException;)V

    .line 285
    :cond_0
    return-void

    .line 280
    .end local v1    # "job":Lkotlinx/coroutines/Job;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private throttleIfNeeded(Landroidx/work/impl/model/WorkSpec;)J
    .locals 9
    .param p1, "workSpec"    # Landroidx/work/impl/model/WorkSpec;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "workSpec"
        }
    .end annotation

    .line 297
    iget-object v0, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 298
    :try_start_0
    invoke-static {p1}, Landroidx/work/impl/model/WorkSpecKt;->generationalId(Landroidx/work/impl/model/WorkSpec;)Landroidx/work/impl/model/WorkGenerationalId;

    move-result-object v1

    .line 299
    .local v1, "id":Landroidx/work/impl/model/WorkGenerationalId;
    iget-object v2, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mFirstRunAttempts:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/work/impl/background/greedy/GreedyScheduler$AttemptData;

    .line 300
    .local v2, "firstRunAttempt":Landroidx/work/impl/background/greedy/GreedyScheduler$AttemptData;
    if-nez v2, :cond_0

    .line 301
    new-instance v3, Landroidx/work/impl/background/greedy/GreedyScheduler$AttemptData;

    iget v4, p1, Landroidx/work/impl/model/WorkSpec;->runAttemptCount:I

    iget-object v5, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mConfiguration:Landroidx/work/Configuration;

    .line 302
    invoke-virtual {v5}, Landroidx/work/Configuration;->getClock()Landroidx/work/Clock;

    move-result-object v5

    invoke-interface {v5}, Landroidx/work/Clock;->currentTimeMillis()J

    move-result-wide v5

    const/4 v7, 0x0

    invoke-direct {v3, v4, v5, v6, v7}, Landroidx/work/impl/background/greedy/GreedyScheduler$AttemptData;-><init>(IJLandroidx/work/impl/background/greedy/GreedyScheduler$1;)V

    move-object v2, v3

    .line 303
    iget-object v3, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mFirstRunAttempts:Ljava/util/Map;

    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    :cond_0
    iget-wide v3, v2, Landroidx/work/impl/background/greedy/GreedyScheduler$AttemptData;->mTimeStamp:J

    iget v5, p1, Landroidx/work/impl/model/WorkSpec;->runAttemptCount:I

    iget v6, v2, Landroidx/work/impl/background/greedy/GreedyScheduler$AttemptData;->mRunAttemptCount:I

    sub-int/2addr v5, v6

    add-int/lit8 v5, v5, -0x5

    .line 306
    const/4 v6, 0x0

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    int-to-long v5, v5

    const-wide/16 v7, 0x7530

    mul-long/2addr v5, v7

    add-long/2addr v3, v5

    monitor-exit v0

    .line 305
    return-wide v3

    .line 308
    .end local v1    # "id":Landroidx/work/impl/model/WorkGenerationalId;
    .end local v2    # "firstRunAttempt":Landroidx/work/impl/background/greedy/GreedyScheduler$AttemptData;
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public cancel(Ljava/lang/String;)V
    .locals 4
    .param p1, "workSpecId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "workSpecId"
        }
    .end annotation

    .line 211
    iget-object v0, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mInDefaultProcess:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 212
    invoke-direct {p0}, Landroidx/work/impl/background/greedy/GreedyScheduler;->checkDefaultProcess()V

    .line 215
    :cond_0
    iget-object v0, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mInDefaultProcess:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1

    .line 216
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v0

    sget-object v1, Landroidx/work/impl/background/greedy/GreedyScheduler;->TAG:Ljava/lang/String;

    const-string v2, "Ignoring schedule request in non-main process"

    invoke-virtual {v0, v1, v2}, Landroidx/work/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    return-void

    .line 220
    :cond_1
    invoke-direct {p0}, Landroidx/work/impl/background/greedy/GreedyScheduler;->registerExecutionListenerIfNeeded()V

    .line 221
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v0

    sget-object v1, Landroidx/work/impl/background/greedy/GreedyScheduler;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cancelling work ID "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    iget-object v0, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mDelayedWorkTracker:Landroidx/work/impl/background/greedy/DelayedWorkTracker;

    if-eqz v0, :cond_2

    .line 223
    iget-object v0, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mDelayedWorkTracker:Landroidx/work/impl/background/greedy/DelayedWorkTracker;

    invoke-virtual {v0, p1}, Landroidx/work/impl/background/greedy/DelayedWorkTracker;->unschedule(Ljava/lang/String;)V

    .line 226
    :cond_2
    iget-object v0, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mStartStopTokens:Landroidx/work/impl/StartStopTokens;

    invoke-interface {v0, p1}, Landroidx/work/impl/StartStopTokens;->remove(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/work/impl/StartStopToken;

    .line 227
    .local v1, "id":Landroidx/work/impl/StartStopToken;
    iget-object v2, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mTimeLimiter:Landroidx/work/impl/background/greedy/TimeLimiter;

    invoke-virtual {v2, v1}, Landroidx/work/impl/background/greedy/TimeLimiter;->cancel(Landroidx/work/impl/StartStopToken;)V

    .line 228
    iget-object v2, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mWorkLauncher:Landroidx/work/impl/WorkLauncher;

    invoke-interface {v2, v1}, Landroidx/work/impl/WorkLauncher;->stopWork(Landroidx/work/impl/StartStopToken;)V

    .line 229
    .end local v1    # "id":Landroidx/work/impl/StartStopToken;
    goto :goto_0

    .line 230
    :cond_3
    return-void
.end method

.method public hasLimitedSchedulingSlots()Z
    .locals 1

    .line 123
    const/4 v0, 0x0

    return v0
.end method

.method public onConstraintsStateChanged(Landroidx/work/impl/model/WorkSpec;Landroidx/work/impl/constraints/ConstraintsState;)V
    .locals 5
    .param p1, "workSpec"    # Landroidx/work/impl/model/WorkSpec;
    .param p2, "state"    # Landroidx/work/impl/constraints/ConstraintsState;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "workSpec",
            "state"
        }
    .end annotation

    .line 235
    invoke-static {p1}, Landroidx/work/impl/model/WorkSpecKt;->generationalId(Landroidx/work/impl/model/WorkSpec;)Landroidx/work/impl/model/WorkGenerationalId;

    move-result-object v0

    .line 236
    .local v0, "id":Landroidx/work/impl/model/WorkGenerationalId;
    instance-of v1, p2, Landroidx/work/impl/constraints/ConstraintsState$ConstraintsMet;

    if-eqz v1, :cond_0

    .line 238
    iget-object v1, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mStartStopTokens:Landroidx/work/impl/StartStopTokens;

    invoke-interface {v1, v0}, Landroidx/work/impl/StartStopTokens;->contains(Landroidx/work/impl/model/WorkGenerationalId;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 239
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v1

    sget-object v2, Landroidx/work/impl/background/greedy/GreedyScheduler;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Constraints met: Scheduling work ID "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    iget-object v1, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mStartStopTokens:Landroidx/work/impl/StartStopTokens;

    invoke-interface {v1, v0}, Landroidx/work/impl/StartStopTokens;->tokenFor(Landroidx/work/impl/model/WorkGenerationalId;)Landroidx/work/impl/StartStopToken;

    move-result-object v1

    .line 241
    .local v1, "token":Landroidx/work/impl/StartStopToken;
    iget-object v2, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mTimeLimiter:Landroidx/work/impl/background/greedy/TimeLimiter;

    invoke-virtual {v2, v1}, Landroidx/work/impl/background/greedy/TimeLimiter;->track(Landroidx/work/impl/StartStopToken;)V

    .line 242
    iget-object v2, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mWorkLauncher:Landroidx/work/impl/WorkLauncher;

    invoke-interface {v2, v1}, Landroidx/work/impl/WorkLauncher;->startWork(Landroidx/work/impl/StartStopToken;)V

    .line 243
    .end local v1    # "token":Landroidx/work/impl/StartStopToken;
    goto :goto_0

    .line 245
    :cond_0
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v1

    sget-object v2, Landroidx/work/impl/background/greedy/GreedyScheduler;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Constraints not met: Cancelling work ID "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 246
    iget-object v1, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mStartStopTokens:Landroidx/work/impl/StartStopTokens;

    invoke-interface {v1, v0}, Landroidx/work/impl/StartStopTokens;->remove(Landroidx/work/impl/model/WorkGenerationalId;)Landroidx/work/impl/StartStopToken;

    move-result-object v1

    .line 247
    .local v1, "runId":Landroidx/work/impl/StartStopToken;
    if-eqz v1, :cond_1

    .line 248
    iget-object v2, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mTimeLimiter:Landroidx/work/impl/background/greedy/TimeLimiter;

    invoke-virtual {v2, v1}, Landroidx/work/impl/background/greedy/TimeLimiter;->cancel(Landroidx/work/impl/StartStopToken;)V

    .line 249
    move-object v2, p2

    check-cast v2, Landroidx/work/impl/constraints/ConstraintsState$ConstraintsNotMet;

    invoke-virtual {v2}, Landroidx/work/impl/constraints/ConstraintsState$ConstraintsNotMet;->getReason()I

    move-result v2

    .line 250
    .local v2, "reason":I
    iget-object v3, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mWorkLauncher:Landroidx/work/impl/WorkLauncher;

    invoke-interface {v3, v1, v2}, Landroidx/work/impl/WorkLauncher;->stopWorkWithReason(Landroidx/work/impl/StartStopToken;I)V

    .line 253
    .end local v1    # "runId":Landroidx/work/impl/StartStopToken;
    .end local v2    # "reason":I
    :cond_1
    :goto_0
    return-void
.end method

.method public onExecuted(Landroidx/work/impl/model/WorkGenerationalId;Z)V
    .locals 3
    .param p1, "id"    # Landroidx/work/impl/model/WorkGenerationalId;
    .param p2, "needsReschedule"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "id",
            "needsReschedule"
        }
    .end annotation

    .line 257
    iget-object v0, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mStartStopTokens:Landroidx/work/impl/StartStopTokens;

    invoke-interface {v0, p1}, Landroidx/work/impl/StartStopTokens;->remove(Landroidx/work/impl/model/WorkGenerationalId;)Landroidx/work/impl/StartStopToken;

    move-result-object v0

    .line 258
    .local v0, "token":Landroidx/work/impl/StartStopToken;
    if-eqz v0, :cond_0

    .line 259
    iget-object v1, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mTimeLimiter:Landroidx/work/impl/background/greedy/TimeLimiter;

    invoke-virtual {v1, v0}, Landroidx/work/impl/background/greedy/TimeLimiter;->cancel(Landroidx/work/impl/StartStopToken;)V

    .line 261
    :cond_0
    invoke-direct {p0, p1}, Landroidx/work/impl/background/greedy/GreedyScheduler;->removeConstraintTrackingFor(Landroidx/work/impl/model/WorkGenerationalId;)V

    .line 263
    if-nez p2, :cond_1

    .line 265
    iget-object v1, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 266
    :try_start_0
    iget-object v2, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mFirstRunAttempts:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 271
    :cond_1
    :goto_0
    return-void
.end method

.method public varargs schedule([Landroidx/work/impl/model/WorkSpec;)V
    .locals 18
    .param p1, "workSpecs"    # [Landroidx/work/impl/model/WorkSpec;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "workSpecs"
        }
    .end annotation

    .line 128
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    iget-object v0, v1, Landroidx/work/impl/background/greedy/GreedyScheduler;->mInDefaultProcess:Ljava/lang/Boolean;

    if-nez v0, :cond_0

    .line 129
    invoke-direct {v1}, Landroidx/work/impl/background/greedy/GreedyScheduler;->checkDefaultProcess()V

    .line 132
    :cond_0
    iget-object v0, v1, Landroidx/work/impl/background/greedy/GreedyScheduler;->mInDefaultProcess:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1

    .line 133
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v0

    sget-object v3, Landroidx/work/impl/background/greedy/GreedyScheduler;->TAG:Ljava/lang/String;

    const-string v4, "Ignoring schedule request in a secondary process"

    invoke-virtual {v0, v3, v4}, Landroidx/work/Logger;->info(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    return-void

    .line 137
    :cond_1
    invoke-direct {v1}, Landroidx/work/impl/background/greedy/GreedyScheduler;->registerExecutionListenerIfNeeded()V

    .line 143
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    move-object v3, v0

    .line 144
    .local v3, "constrainedWorkSpecs":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/impl/model/WorkSpec;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    move-object v4, v0

    .line 146
    .local v4, "constrainedWorkSpecIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    array-length v0, v2

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v0, :cond_a

    aget-object v6, v2, v5

    .line 148
    .local v6, "workSpec":Landroidx/work/impl/model/WorkSpec;
    invoke-static {v6}, Landroidx/work/impl/model/WorkSpecKt;->generationalId(Landroidx/work/impl/model/WorkSpec;)Landroidx/work/impl/model/WorkGenerationalId;

    move-result-object v7

    .line 149
    .local v7, "id":Landroidx/work/impl/model/WorkGenerationalId;
    iget-object v8, v1, Landroidx/work/impl/background/greedy/GreedyScheduler;->mStartStopTokens:Landroidx/work/impl/StartStopTokens;

    invoke-interface {v8, v7}, Landroidx/work/impl/StartStopTokens;->contains(Landroidx/work/impl/model/WorkGenerationalId;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 150
    move/from16 v16, v0

    move/from16 v17, v5

    goto/16 :goto_2

    .line 152
    :cond_2
    invoke-direct {v1, v6}, Landroidx/work/impl/background/greedy/GreedyScheduler;->throttleIfNeeded(Landroidx/work/impl/model/WorkSpec;)J

    move-result-wide v8

    .line 153
    .local v8, "throttled":J
    invoke-virtual {v6}, Landroidx/work/impl/model/WorkSpec;->calculateNextRunTime()J

    move-result-wide v10

    invoke-static {v10, v11, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    .line 154
    .local v10, "nextRunTime":J
    iget-object v12, v1, Landroidx/work/impl/background/greedy/GreedyScheduler;->mConfiguration:Landroidx/work/Configuration;

    invoke-virtual {v12}, Landroidx/work/Configuration;->getClock()Landroidx/work/Clock;

    move-result-object v12

    invoke-interface {v12}, Landroidx/work/Clock;->currentTimeMillis()J

    move-result-wide v12

    .line 155
    .local v12, "now":J
    iget-object v14, v6, Landroidx/work/impl/model/WorkSpec;->state:Landroidx/work/WorkInfo$State;

    sget-object v15, Landroidx/work/WorkInfo$State;->ENQUEUED:Landroidx/work/WorkInfo$State;

    if-ne v14, v15, :cond_8

    .line 156
    cmp-long v14, v12, v10

    if-gez v14, :cond_4

    .line 158
    iget-object v14, v1, Landroidx/work/impl/background/greedy/GreedyScheduler;->mDelayedWorkTracker:Landroidx/work/impl/background/greedy/DelayedWorkTracker;

    if-eqz v14, :cond_3

    .line 159
    iget-object v14, v1, Landroidx/work/impl/background/greedy/GreedyScheduler;->mDelayedWorkTracker:Landroidx/work/impl/background/greedy/DelayedWorkTracker;

    invoke-virtual {v14, v6, v10, v11}, Landroidx/work/impl/background/greedy/DelayedWorkTracker;->schedule(Landroidx/work/impl/model/WorkSpec;J)V

    move/from16 v16, v0

    move/from16 v17, v5

    goto/16 :goto_2

    .line 158
    :cond_3
    move/from16 v16, v0

    move/from16 v17, v5

    goto/16 :goto_2

    .line 161
    :cond_4
    invoke-virtual {v6}, Landroidx/work/impl/model/WorkSpec;->hasConstraints()Z

    move-result v14

    if-eqz v14, :cond_7

    .line 162
    iget-object v14, v6, Landroidx/work/impl/model/WorkSpec;->constraints:Landroidx/work/Constraints;

    .line 163
    .local v14, "constraints":Landroidx/work/Constraints;
    invoke-virtual {v14}, Landroidx/work/Constraints;->requiresDeviceIdle()Z

    move-result v15

    if-eqz v15, :cond_5

    .line 165
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v15

    move/from16 v16, v0

    sget-object v0, Landroidx/work/impl/background/greedy/GreedyScheduler;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v17, v5

    const-string v5, "Ignoring "

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v5, ". Requires device idle."

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v15, v0, v2}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 163
    :cond_5
    move/from16 v16, v0

    move/from16 v17, v5

    .line 167
    invoke-virtual {v14}, Landroidx/work/Constraints;->hasContentUriTriggers()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 169
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v0

    sget-object v2, Landroidx/work/impl/background/greedy/GreedyScheduler;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Ignoring "

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v15, ". Requires ContentUri triggers."

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v2, v5}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 172
    :cond_6
    invoke-interface {v3, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 173
    iget-object v0, v6, Landroidx/work/impl/model/WorkSpec;->id:Ljava/lang/String;

    invoke-interface {v4, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 175
    .end local v14    # "constraints":Landroidx/work/Constraints;
    :goto_1
    goto :goto_2

    .line 177
    :cond_7
    move/from16 v16, v0

    move/from16 v17, v5

    iget-object v0, v1, Landroidx/work/impl/background/greedy/GreedyScheduler;->mStartStopTokens:Landroidx/work/impl/StartStopTokens;

    invoke-static {v6}, Landroidx/work/impl/model/WorkSpecKt;->generationalId(Landroidx/work/impl/model/WorkSpec;)Landroidx/work/impl/model/WorkGenerationalId;

    move-result-object v2

    invoke-interface {v0, v2}, Landroidx/work/impl/StartStopTokens;->contains(Landroidx/work/impl/model/WorkGenerationalId;)Z

    move-result v0

    if-nez v0, :cond_9

    .line 178
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v0

    sget-object v2, Landroidx/work/impl/background/greedy/GreedyScheduler;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Starting work for "

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v14, v6, Landroidx/work/impl/model/WorkSpec;->id:Ljava/lang/String;

    invoke-virtual {v5, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v2, v5}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    iget-object v0, v1, Landroidx/work/impl/background/greedy/GreedyScheduler;->mStartStopTokens:Landroidx/work/impl/StartStopTokens;

    invoke-interface {v0, v6}, Landroidx/work/impl/StartStopTokens;->tokenFor(Landroidx/work/impl/model/WorkSpec;)Landroidx/work/impl/StartStopToken;

    move-result-object v0

    .line 180
    .local v0, "token":Landroidx/work/impl/StartStopToken;
    iget-object v2, v1, Landroidx/work/impl/background/greedy/GreedyScheduler;->mTimeLimiter:Landroidx/work/impl/background/greedy/TimeLimiter;

    invoke-virtual {v2, v0}, Landroidx/work/impl/background/greedy/TimeLimiter;->track(Landroidx/work/impl/StartStopToken;)V

    .line 181
    iget-object v2, v1, Landroidx/work/impl/background/greedy/GreedyScheduler;->mWorkLauncher:Landroidx/work/impl/WorkLauncher;

    invoke-interface {v2, v0}, Landroidx/work/impl/WorkLauncher;->startWork(Landroidx/work/impl/StartStopToken;)V

    goto :goto_2

    .line 155
    .end local v0    # "token":Landroidx/work/impl/StartStopToken;
    :cond_8
    move/from16 v16, v0

    move/from16 v17, v5

    .line 146
    .end local v6    # "workSpec":Landroidx/work/impl/model/WorkSpec;
    .end local v7    # "id":Landroidx/work/impl/model/WorkGenerationalId;
    .end local v8    # "throttled":J
    .end local v10    # "nextRunTime":J
    .end local v12    # "now":J
    :cond_9
    :goto_2
    add-int/lit8 v5, v17, 0x1

    move-object/from16 v2, p1

    move/from16 v0, v16

    goto/16 :goto_0

    .line 189
    :cond_a
    iget-object v2, v1, Landroidx/work/impl/background/greedy/GreedyScheduler;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 190
    :try_start_0
    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_c

    .line 191
    const-string v0, ","

    invoke-static {v0, v4}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    .line 192
    .local v0, "formattedIds":Ljava/lang/String;
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v5

    sget-object v6, Landroidx/work/impl/background/greedy/GreedyScheduler;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Starting tracking for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_c

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroidx/work/impl/model/WorkSpec;

    .line 194
    .local v6, "spec":Landroidx/work/impl/model/WorkSpec;
    invoke-static {v6}, Landroidx/work/impl/model/WorkSpecKt;->generationalId(Landroidx/work/impl/model/WorkSpec;)Landroidx/work/impl/model/WorkGenerationalId;

    move-result-object v7

    .line 195
    .restart local v7    # "id":Landroidx/work/impl/model/WorkGenerationalId;
    iget-object v8, v1, Landroidx/work/impl/background/greedy/GreedyScheduler;->mConstrainedWorkSpecs:Ljava/util/Map;

    invoke-interface {v8, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_b

    .line 196
    iget-object v8, v1, Landroidx/work/impl/background/greedy/GreedyScheduler;->mConstraintsTracker:Landroidx/work/impl/constraints/WorkConstraintsTracker;

    iget-object v9, v1, Landroidx/work/impl/background/greedy/GreedyScheduler;->mTaskExecutor:Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    .line 197
    invoke-interface {v9}, Landroidx/work/impl/utils/taskexecutor/TaskExecutor;->getTaskCoroutineDispatcher()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v9

    .line 196
    invoke-static {v8, v6, v9, v1}, Landroidx/work/impl/constraints/WorkConstraintsTrackerKt;->listen(Landroidx/work/impl/constraints/WorkConstraintsTracker;Landroidx/work/impl/model/WorkSpec;Lkotlinx/coroutines/CoroutineDispatcher;Landroidx/work/impl/constraints/OnConstraintsStateChangedListener;)Lkotlinx/coroutines/Job;

    move-result-object v8

    .line 198
    .local v8, "job":Lkotlinx/coroutines/Job;
    iget-object v9, v1, Landroidx/work/impl/background/greedy/GreedyScheduler;->mConstrainedWorkSpecs:Ljava/util/Map;

    invoke-interface {v9, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    .end local v6    # "spec":Landroidx/work/impl/model/WorkSpec;
    .end local v7    # "id":Landroidx/work/impl/model/WorkGenerationalId;
    .end local v8    # "job":Lkotlinx/coroutines/Job;
    :cond_b
    goto :goto_3

    .line 202
    .end local v0    # "formattedIds":Ljava/lang/String;
    :cond_c
    monitor-exit v2

    .line 203
    return-void

    .line 202
    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setDelayedWorkTracker(Landroidx/work/impl/background/greedy/DelayedWorkTracker;)V
    .locals 0
    .param p1, "delayedWorkTracker"    # Landroidx/work/impl/background/greedy/DelayedWorkTracker;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "delayedWorkTracker"
        }
    .end annotation

    .line 118
    iput-object p1, p0, Landroidx/work/impl/background/greedy/GreedyScheduler;->mDelayedWorkTracker:Landroidx/work/impl/background/greedy/DelayedWorkTracker;

    .line 119
    return-void
.end method
