.class public final Landroidx/work/Configuration;
.super Ljava/lang/Object;
.source "Configuration.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/work/Configuration$Builder;,
        Landroidx/work/Configuration$Companion;,
        Landroidx/work/Configuration$Provider;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000v\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u0003\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\r\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u0000 F2\u00020\u0001:\u0003EFGB\u000f\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004R\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\t\u001a\u00020\n\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u0013\u0010\r\u001a\u0004\u0018\u00010\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010R\u0011\u0010\u0011\u001a\u00020\u0012\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0014R\u0019\u0010\u0015\u001a\n\u0012\u0004\u0012\u00020\u0017\u0018\u00010\u0016\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0018\u0010\u0019R\u0011\u0010\u001a\u001a\u00020\u001b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001c\u0010\u001dR\u001c\u0010\u001e\u001a\u00020\u001f8GX\u0087\u0004\u00a2\u0006\u000e\n\u0000\u0012\u0004\u0008 \u0010!\u001a\u0004\u0008\u001e\u0010\"R\u0013\u0010#\u001a\u00020\u001f8G\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008#\u0010\"R\u0011\u0010$\u001a\u00020\n\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008%\u0010\u000cR\u0013\u0010&\u001a\u00020\n8G\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\'\u0010\u000cR\u0011\u0010(\u001a\u00020\n\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008)\u0010\u000cR\u0013\u0010*\u001a\u00020\n8G\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008+\u0010\u000cR\u0011\u0010,\u001a\u00020-\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008.\u0010/R\u0019\u00100\u001a\n\u0012\u0004\u0012\u00020\u0017\u0018\u00010\u0016\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00081\u0010\u0019R\u0011\u00102\u001a\u00020\u0012\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00083\u0010\u0014R\u0013\u00104\u001a\u0002058G\u00a2\u0006\u0008\n\u0000\u001a\u0004\u00086\u00107R\u0011\u00108\u001a\u000209\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008:\u0010;R\u0019\u0010<\u001a\n\u0012\u0004\u0012\u00020=\u0018\u00010\u0016\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008>\u0010\u0019R\u0011\u0010?\u001a\u00020@\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008A\u0010BR\u0019\u0010C\u001a\n\u0012\u0004\u0012\u00020=\u0018\u00010\u0016\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008D\u0010\u0019\u00a8\u0006H"
    }
    d2 = {
        "Landroidx/work/Configuration;",
        "",
        "builder",
        "Landroidx/work/Configuration$Builder;",
        "(Landroidx/work/Configuration$Builder;)V",
        "clock",
        "Landroidx/work/Clock;",
        "getClock",
        "()Landroidx/work/Clock;",
        "contentUriTriggerWorkersLimit",
        "",
        "getContentUriTriggerWorkersLimit",
        "()I",
        "defaultProcessName",
        "",
        "getDefaultProcessName",
        "()Ljava/lang/String;",
        "executor",
        "Ljava/util/concurrent/Executor;",
        "getExecutor",
        "()Ljava/util/concurrent/Executor;",
        "initializationExceptionHandler",
        "Landroidx/core/util/Consumer;",
        "",
        "getInitializationExceptionHandler",
        "()Landroidx/core/util/Consumer;",
        "inputMergerFactory",
        "Landroidx/work/InputMergerFactory;",
        "getInputMergerFactory",
        "()Landroidx/work/InputMergerFactory;",
        "isMarkingJobsAsImportantWhileForeground",
        "",
        "isMarkingJobsAsImportantWhileForeground$annotations",
        "()V",
        "()Z",
        "isUsingDefaultTaskExecutor",
        "maxJobSchedulerId",
        "getMaxJobSchedulerId",
        "maxSchedulerLimit",
        "getMaxSchedulerLimit",
        "minJobSchedulerId",
        "getMinJobSchedulerId",
        "minimumLoggingLevel",
        "getMinimumLoggingLevel",
        "runnableScheduler",
        "Landroidx/work/RunnableScheduler;",
        "getRunnableScheduler",
        "()Landroidx/work/RunnableScheduler;",
        "schedulingExceptionHandler",
        "getSchedulingExceptionHandler",
        "taskExecutor",
        "getTaskExecutor",
        "tracer",
        "Landroidx/work/Tracer;",
        "getTracer",
        "()Landroidx/work/Tracer;",
        "workerCoroutineContext",
        "Lkotlin/coroutines/CoroutineContext;",
        "getWorkerCoroutineContext",
        "()Lkotlin/coroutines/CoroutineContext;",
        "workerExecutionExceptionHandler",
        "Landroidx/work/WorkerExceptionInfo;",
        "getWorkerExecutionExceptionHandler",
        "workerFactory",
        "Landroidx/work/WorkerFactory;",
        "getWorkerFactory",
        "()Landroidx/work/WorkerFactory;",
        "workerInitializationExceptionHandler",
        "getWorkerInitializationExceptionHandler",
        "Builder",
        "Companion",
        "Provider",
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


# static fields
.field public static final Companion:Landroidx/work/Configuration$Companion;

.field public static final MIN_SCHEDULER_LIMIT:I = 0x14


# instance fields
.field private final clock:Landroidx/work/Clock;

.field private final contentUriTriggerWorkersLimit:I

.field private final defaultProcessName:Ljava/lang/String;

.field private final executor:Ljava/util/concurrent/Executor;

.field private final initializationExceptionHandler:Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private final inputMergerFactory:Landroidx/work/InputMergerFactory;

.field private final isMarkingJobsAsImportantWhileForeground:Z

.field private final isUsingDefaultTaskExecutor:Z

.field private final maxJobSchedulerId:I

.field private final maxSchedulerLimit:I

.field private final minJobSchedulerId:I

.field private final minimumLoggingLevel:I

.field private final runnableScheduler:Landroidx/work/RunnableScheduler;

.field private final schedulingExceptionHandler:Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private final taskExecutor:Ljava/util/concurrent/Executor;

.field private final tracer:Landroidx/work/Tracer;

.field private final workerCoroutineContext:Lkotlin/coroutines/CoroutineContext;

.field private final workerExecutionExceptionHandler:Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Consumer<",
            "Landroidx/work/WorkerExceptionInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final workerFactory:Landroidx/work/WorkerFactory;

.field private final workerInitializationExceptionHandler:Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Consumer<",
            "Landroidx/work/WorkerExceptionInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroidx/work/Configuration$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroidx/work/Configuration$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Landroidx/work/Configuration;->Companion:Landroidx/work/Configuration$Companion;

    return-void
.end method

.method public constructor <init>(Landroidx/work/Configuration$Builder;)V
    .locals 4
    .param p1, "builder"    # Landroidx/work/Configuration$Builder;

    const-string v0, "builder"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 156
    nop

    .line 157
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getWorkerContext$work_runtime_release()Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    .line 159
    .local v0, "builderWorkerDispatcher":Lkotlin/coroutines/CoroutineContext;
    nop

    .line 160
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getExecutor$work_runtime_release()Ljava/util/concurrent/Executor;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    .line 161
    if-eqz v0, :cond_0

    invoke-static {v0}, Landroidx/work/ConfigurationKt;->access$asExecutor(Lkotlin/coroutines/CoroutineContext;)Ljava/util/concurrent/Executor;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 160
    :goto_0
    if-nez v1, :cond_1

    .line 162
    invoke-static {v2}, Landroidx/work/ConfigurationKt;->access$createDefaultExecutor(Z)Ljava/util/concurrent/Executor;

    move-result-object v1

    .line 159
    :cond_1
    iput-object v1, p0, Landroidx/work/Configuration;->executor:Ljava/util/concurrent/Executor;

    .line 164
    nop

    .line 165
    nop

    .line 166
    if-nez v0, :cond_3

    .line 169
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getExecutor$work_runtime_release()Ljava/util/concurrent/Executor;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Landroidx/work/Configuration;->executor:Ljava/util/concurrent/Executor;

    invoke-static {v1}, Lkotlinx/coroutines/ExecutorsKt;->from(Ljava/util/concurrent/Executor;)Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v1

    check-cast v1, Lkotlin/coroutines/CoroutineContext;

    goto :goto_1

    .line 170
    :cond_2
    invoke-static {}, Lkotlinx/coroutines/Dispatchers;->getDefault()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v1

    check-cast v1, Lkotlin/coroutines/CoroutineContext;

    goto :goto_1

    .line 166
    :cond_3
    move-object v1, v0

    .line 164
    :goto_1
    iput-object v1, p0, Landroidx/work/Configuration;->workerCoroutineContext:Lkotlin/coroutines/CoroutineContext;

    .line 173
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getTaskExecutor$work_runtime_release()Ljava/util/concurrent/Executor;

    move-result-object v1

    const/4 v3, 0x1

    if-nez v1, :cond_4

    move v2, v3

    :cond_4
    iput-boolean v2, p0, Landroidx/work/Configuration;->isUsingDefaultTaskExecutor:Z

    .line 177
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getTaskExecutor$work_runtime_release()Ljava/util/concurrent/Executor;

    move-result-object v1

    if-nez v1, :cond_5

    invoke-static {v3}, Landroidx/work/ConfigurationKt;->access$createDefaultExecutor(Z)Ljava/util/concurrent/Executor;

    move-result-object v1

    :cond_5
    iput-object v1, p0, Landroidx/work/Configuration;->taskExecutor:Ljava/util/concurrent/Executor;

    .line 178
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getClock$work_runtime_release()Landroidx/work/Clock;

    move-result-object v1

    if-nez v1, :cond_6

    new-instance v1, Landroidx/work/SystemClock;

    invoke-direct {v1}, Landroidx/work/SystemClock;-><init>()V

    check-cast v1, Landroidx/work/Clock;

    :cond_6
    iput-object v1, p0, Landroidx/work/Configuration;->clock:Landroidx/work/Clock;

    .line 179
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getWorkerFactory$work_runtime_release()Landroidx/work/WorkerFactory;

    move-result-object v1

    if-nez v1, :cond_7

    sget-object v1, Landroidx/work/DefaultWorkerFactory;->INSTANCE:Landroidx/work/DefaultWorkerFactory;

    check-cast v1, Landroidx/work/WorkerFactory;

    :cond_7
    iput-object v1, p0, Landroidx/work/Configuration;->workerFactory:Landroidx/work/WorkerFactory;

    .line 180
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getInputMergerFactory$work_runtime_release()Landroidx/work/InputMergerFactory;

    move-result-object v1

    if-nez v1, :cond_8

    sget-object v1, Landroidx/work/NoOpInputMergerFactory;->INSTANCE:Landroidx/work/NoOpInputMergerFactory;

    check-cast v1, Landroidx/work/InputMergerFactory;

    :cond_8
    iput-object v1, p0, Landroidx/work/Configuration;->inputMergerFactory:Landroidx/work/InputMergerFactory;

    .line 181
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getRunnableScheduler$work_runtime_release()Landroidx/work/RunnableScheduler;

    move-result-object v1

    if-nez v1, :cond_9

    new-instance v1, Landroidx/work/impl/DefaultRunnableScheduler;

    invoke-direct {v1}, Landroidx/work/impl/DefaultRunnableScheduler;-><init>()V

    check-cast v1, Landroidx/work/RunnableScheduler;

    :cond_9
    iput-object v1, p0, Landroidx/work/Configuration;->runnableScheduler:Landroidx/work/RunnableScheduler;

    .line 182
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getLoggingLevel$work_runtime_release()I

    move-result v1

    iput v1, p0, Landroidx/work/Configuration;->minimumLoggingLevel:I

    .line 183
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getMinJobSchedulerId$work_runtime_release()I

    move-result v1

    iput v1, p0, Landroidx/work/Configuration;->minJobSchedulerId:I

    .line 184
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getMaxJobSchedulerId$work_runtime_release()I

    move-result v1

    iput v1, p0, Landroidx/work/Configuration;->maxJobSchedulerId:I

    .line 185
    nop

    .line 186
    nop

    .line 190
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getMaxSchedulerLimit$work_runtime_release()I

    move-result v1

    .line 185
    iput v1, p0, Landroidx/work/Configuration;->maxSchedulerLimit:I

    .line 192
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getInitializationExceptionHandler$work_runtime_release()Landroidx/core/util/Consumer;

    move-result-object v1

    iput-object v1, p0, Landroidx/work/Configuration;->initializationExceptionHandler:Landroidx/core/util/Consumer;

    .line 193
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getSchedulingExceptionHandler$work_runtime_release()Landroidx/core/util/Consumer;

    move-result-object v1

    iput-object v1, p0, Landroidx/work/Configuration;->schedulingExceptionHandler:Landroidx/core/util/Consumer;

    .line 194
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getWorkerInitializationExceptionHandler$work_runtime_release()Landroidx/core/util/Consumer;

    move-result-object v1

    iput-object v1, p0, Landroidx/work/Configuration;->workerInitializationExceptionHandler:Landroidx/core/util/Consumer;

    .line 195
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getWorkerExecutionExceptionHandler$work_runtime_release()Landroidx/core/util/Consumer;

    move-result-object v1

    iput-object v1, p0, Landroidx/work/Configuration;->workerExecutionExceptionHandler:Landroidx/core/util/Consumer;

    .line 196
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getDefaultProcessName$work_runtime_release()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroidx/work/Configuration;->defaultProcessName:Ljava/lang/String;

    .line 197
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getContentUriTriggerWorkersLimit$work_runtime_release()I

    move-result v1

    iput v1, p0, Landroidx/work/Configuration;->contentUriTriggerWorkersLimit:I

    .line 198
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getMarkJobsAsImportantWhileForeground$work_runtime_release()Z

    move-result v1

    iput-boolean v1, p0, Landroidx/work/Configuration;->isMarkingJobsAsImportantWhileForeground:Z

    .line 199
    invoke-virtual {p1}, Landroidx/work/Configuration$Builder;->getTracer$work_runtime_release()Landroidx/work/Tracer;

    move-result-object v1

    if-nez v1, :cond_a

    invoke-static {}, Landroidx/work/ConfigurationKt;->access$createDefaultTracer()Landroidx/work/Tracer;

    move-result-object v1

    :cond_a
    iput-object v1, p0, Landroidx/work/Configuration;->tracer:Landroidx/work/Tracer;

    .line 200
    .end local v0    # "builderWorkerDispatcher":Lkotlin/coroutines/CoroutineContext;
    nop

    .line 47
    return-void
.end method

.method public static synthetic isMarkingJobsAsImportantWhileForeground$annotations()V
    .locals 0

    return-void
.end method


# virtual methods
.method public final getClock()Landroidx/work/Clock;
    .locals 1

    .line 58
    iget-object v0, p0, Landroidx/work/Configuration;->clock:Landroidx/work/Clock;

    return-object v0
.end method

.method public final getContentUriTriggerWorkersLimit()I
    .locals 1

    .line 127
    iget v0, p0, Landroidx/work/Configuration;->contentUriTriggerWorkersLimit:I

    return v0
.end method

.method public final getDefaultProcessName()Ljava/lang/String;
    .locals 1

    .line 94
    iget-object v0, p0, Landroidx/work/Configuration;->defaultProcessName:Ljava/lang/String;

    return-object v0
.end method

.method public final getExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 49
    iget-object v0, p0, Landroidx/work/Configuration;->executor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public final getInitializationExceptionHandler()Landroidx/core/util/Consumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .line 73
    iget-object v0, p0, Landroidx/work/Configuration;->initializationExceptionHandler:Landroidx/core/util/Consumer;

    return-object v0
.end method

.method public final getInputMergerFactory()Landroidx/work/InputMergerFactory;
    .locals 1

    .line 64
    iget-object v0, p0, Landroidx/work/Configuration;->inputMergerFactory:Landroidx/work/InputMergerFactory;

    return-object v0
.end method

.method public final getMaxJobSchedulerId()I
    .locals 1

    .line 117
    iget v0, p0, Landroidx/work/Configuration;->maxJobSchedulerId:I

    return v0
.end method

.method public final getMaxSchedulerLimit()I
    .locals 1

    .line 135
    iget v0, p0, Landroidx/work/Configuration;->maxSchedulerLimit:I

    return v0
.end method

.method public final getMinJobSchedulerId()I
    .locals 1

    .line 107
    iget v0, p0, Landroidx/work/Configuration;->minJobSchedulerId:I

    return v0
.end method

.method public final getMinimumLoggingLevel()I
    .locals 1

    .line 97
    iget v0, p0, Landroidx/work/Configuration;->minimumLoggingLevel:I

    return v0
.end method

.method public final getRunnableScheduler()Landroidx/work/RunnableScheduler;
    .locals 1

    .line 67
    iget-object v0, p0, Landroidx/work/Configuration;->runnableScheduler:Landroidx/work/RunnableScheduler;

    return-object v0
.end method

.method public final getSchedulingExceptionHandler()Landroidx/core/util/Consumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .line 79
    iget-object v0, p0, Landroidx/work/Configuration;->schedulingExceptionHandler:Landroidx/core/util/Consumer;

    return-object v0
.end method

.method public final getTaskExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 55
    iget-object v0, p0, Landroidx/work/Configuration;->taskExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public final getTracer()Landroidx/work/Tracer;
    .locals 1

    .line 154
    iget-object v0, p0, Landroidx/work/Configuration;->tracer:Landroidx/work/Tracer;

    return-object v0
.end method

.method public final getWorkerCoroutineContext()Lkotlin/coroutines/CoroutineContext;
    .locals 1

    .line 52
    iget-object v0, p0, Landroidx/work/Configuration;->workerCoroutineContext:Lkotlin/coroutines/CoroutineContext;

    return-object v0
.end method

.method public final getWorkerExecutionExceptionHandler()Landroidx/core/util/Consumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/core/util/Consumer<",
            "Landroidx/work/WorkerExceptionInfo;",
            ">;"
        }
    .end annotation

    .line 91
    iget-object v0, p0, Landroidx/work/Configuration;->workerExecutionExceptionHandler:Landroidx/core/util/Consumer;

    return-object v0
.end method

.method public final getWorkerFactory()Landroidx/work/WorkerFactory;
    .locals 1

    .line 61
    iget-object v0, p0, Landroidx/work/Configuration;->workerFactory:Landroidx/work/WorkerFactory;

    return-object v0
.end method

.method public final getWorkerInitializationExceptionHandler()Landroidx/core/util/Consumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/core/util/Consumer<",
            "Landroidx/work/WorkerExceptionInfo;",
            ">;"
        }
    .end annotation

    .line 85
    iget-object v0, p0, Landroidx/work/Configuration;->workerInitializationExceptionHandler:Landroidx/core/util/Consumer;

    return-object v0
.end method

.method public final isMarkingJobsAsImportantWhileForeground()Z
    .locals 1

    .line 148
    iget-boolean v0, p0, Landroidx/work/Configuration;->isMarkingJobsAsImportantWhileForeground:Z

    return v0
.end method

.method public final isUsingDefaultTaskExecutor()Z
    .locals 1

    .line 138
    iget-boolean v0, p0, Landroidx/work/Configuration;->isUsingDefaultTaskExecutor:Z

    return v0
.end method
