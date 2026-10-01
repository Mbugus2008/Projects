.class public final Landroidx/work/Configuration$Builder;
.super Ljava/lang/Object;
.source "Configuration.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/work/Configuration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000x\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0010\u0003\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u000b\n\u0002\u0008\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008 \u0018\u00002\u00020\u0001B\u0007\u0008\u0016\u00a2\u0006\u0002\u0010\u0002B\u000f\u0008\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0002\u0010\u0005J\u0006\u0010b\u001a\u00020\u0004J\u000e\u0010c\u001a\u00020\u00002\u0006\u0010\u0006\u001a\u00020\u0007J\u000e\u0010d\u001a\u00020\u00002\u0006\u0010\u000c\u001a\u00020\rJ\u000e\u0010e\u001a\u00020\u00002\u0006\u0010f\u001a\u00020\u0013J\u000e\u0010g\u001a\u00020\u00002\u0006\u0010\u0018\u001a\u00020\u0019J\u0014\u0010h\u001a\u00020\u00002\u000c\u0010i\u001a\u0008\u0012\u0004\u0012\u00020 0\u001fJ\u000e\u0010j\u001a\u00020\u00002\u0006\u0010%\u001a\u00020&J\u0016\u0010k\u001a\u00020\u00002\u0006\u0010:\u001a\u00020\r2\u0006\u00104\u001a\u00020\rJ\u0010\u0010l\u001a\u00020\u00002\u0006\u0010m\u001a\u00020/H\u0007J\u000e\u0010n\u001a\u00020\u00002\u0006\u00107\u001a\u00020\rJ\u000e\u0010o\u001a\u00020\u00002\u0006\u0010+\u001a\u00020\rJ\u000e\u0010p\u001a\u00020\u00002\u0006\u0010=\u001a\u00020>J\u0014\u0010q\u001a\u00020\u00002\u000c\u0010C\u001a\u0008\u0012\u0004\u0012\u00020 0\u001fJ\u000e\u0010r\u001a\u00020\u00002\u0006\u0010F\u001a\u00020\u0019J\u0010\u0010s\u001a\u00020\u00002\u0006\u0010I\u001a\u00020JH\u0007J\u000e\u0010t\u001a\u00020\u00002\u0006\u0010u\u001a\u00020PJ\u0014\u0010v\u001a\u00020\u00002\u000c\u0010w\u001a\u0008\u0012\u0004\u0012\u00020V0\u001fJ\u000e\u0010x\u001a\u00020\u00002\u0006\u0010Y\u001a\u00020ZJ\u0014\u0010y\u001a\u00020\u00002\u000c\u0010w\u001a\u0008\u0012\u0004\u0012\u00020V0\u001fR\u001c\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0008\u0010\t\"\u0004\u0008\n\u0010\u000bR\u001a\u0010\u000c\u001a\u00020\rX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f\"\u0004\u0008\u0010\u0010\u0011R\u001c\u0010\u0012\u001a\u0004\u0018\u00010\u0013X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015\"\u0004\u0008\u0016\u0010\u0017R\u001c\u0010\u0018\u001a\u0004\u0018\u00010\u0019X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001a\u0010\u001b\"\u0004\u0008\u001c\u0010\u001dR\"\u0010\u001e\u001a\n\u0012\u0004\u0012\u00020 \u0018\u00010\u001fX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008!\u0010\"\"\u0004\u0008#\u0010$R\u001c\u0010%\u001a\u0004\u0018\u00010&X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\'\u0010(\"\u0004\u0008)\u0010*R\u001a\u0010+\u001a\u00020\rX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008,\u0010\u000f\"\u0004\u0008-\u0010\u0011R\u001a\u0010.\u001a\u00020/X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00080\u00101\"\u0004\u00082\u00103R\u001a\u00104\u001a\u00020\rX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00085\u0010\u000f\"\u0004\u00086\u0010\u0011R\u001a\u00107\u001a\u00020\rX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u00088\u0010\u000f\"\u0004\u00089\u0010\u0011R\u001a\u0010:\u001a\u00020\rX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008;\u0010\u000f\"\u0004\u0008<\u0010\u0011R\u001c\u0010=\u001a\u0004\u0018\u00010>X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008?\u0010@\"\u0004\u0008A\u0010BR\"\u0010C\u001a\n\u0012\u0004\u0012\u00020 \u0018\u00010\u001fX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008D\u0010\"\"\u0004\u0008E\u0010$R\u001c\u0010F\u001a\u0004\u0018\u00010\u0019X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008G\u0010\u001b\"\u0004\u0008H\u0010\u001dR\u001c\u0010I\u001a\u0004\u0018\u00010JX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008K\u0010L\"\u0004\u0008M\u0010NR\u001c\u0010O\u001a\u0004\u0018\u00010PX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008Q\u0010R\"\u0004\u0008S\u0010TR\"\u0010U\u001a\n\u0012\u0004\u0012\u00020V\u0018\u00010\u001fX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008W\u0010\"\"\u0004\u0008X\u0010$R\u001c\u0010Y\u001a\u0004\u0018\u00010ZX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008[\u0010\\\"\u0004\u0008]\u0010^R\"\u0010_\u001a\n\u0012\u0004\u0012\u00020V\u0018\u00010\u001fX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008`\u0010\"\"\u0004\u0008a\u0010$\u00a8\u0006z"
    }
    d2 = {
        "Landroidx/work/Configuration$Builder;",
        "",
        "()V",
        "configuration",
        "Landroidx/work/Configuration;",
        "(Landroidx/work/Configuration;)V",
        "clock",
        "Landroidx/work/Clock;",
        "getClock$work_runtime_release",
        "()Landroidx/work/Clock;",
        "setClock$work_runtime_release",
        "(Landroidx/work/Clock;)V",
        "contentUriTriggerWorkersLimit",
        "",
        "getContentUriTriggerWorkersLimit$work_runtime_release",
        "()I",
        "setContentUriTriggerWorkersLimit$work_runtime_release",
        "(I)V",
        "defaultProcessName",
        "",
        "getDefaultProcessName$work_runtime_release",
        "()Ljava/lang/String;",
        "setDefaultProcessName$work_runtime_release",
        "(Ljava/lang/String;)V",
        "executor",
        "Ljava/util/concurrent/Executor;",
        "getExecutor$work_runtime_release",
        "()Ljava/util/concurrent/Executor;",
        "setExecutor$work_runtime_release",
        "(Ljava/util/concurrent/Executor;)V",
        "initializationExceptionHandler",
        "Landroidx/core/util/Consumer;",
        "",
        "getInitializationExceptionHandler$work_runtime_release",
        "()Landroidx/core/util/Consumer;",
        "setInitializationExceptionHandler$work_runtime_release",
        "(Landroidx/core/util/Consumer;)V",
        "inputMergerFactory",
        "Landroidx/work/InputMergerFactory;",
        "getInputMergerFactory$work_runtime_release",
        "()Landroidx/work/InputMergerFactory;",
        "setInputMergerFactory$work_runtime_release",
        "(Landroidx/work/InputMergerFactory;)V",
        "loggingLevel",
        "getLoggingLevel$work_runtime_release",
        "setLoggingLevel$work_runtime_release",
        "markJobsAsImportantWhileForeground",
        "",
        "getMarkJobsAsImportantWhileForeground$work_runtime_release",
        "()Z",
        "setMarkJobsAsImportantWhileForeground$work_runtime_release",
        "(Z)V",
        "maxJobSchedulerId",
        "getMaxJobSchedulerId$work_runtime_release",
        "setMaxJobSchedulerId$work_runtime_release",
        "maxSchedulerLimit",
        "getMaxSchedulerLimit$work_runtime_release",
        "setMaxSchedulerLimit$work_runtime_release",
        "minJobSchedulerId",
        "getMinJobSchedulerId$work_runtime_release",
        "setMinJobSchedulerId$work_runtime_release",
        "runnableScheduler",
        "Landroidx/work/RunnableScheduler;",
        "getRunnableScheduler$work_runtime_release",
        "()Landroidx/work/RunnableScheduler;",
        "setRunnableScheduler$work_runtime_release",
        "(Landroidx/work/RunnableScheduler;)V",
        "schedulingExceptionHandler",
        "getSchedulingExceptionHandler$work_runtime_release",
        "setSchedulingExceptionHandler$work_runtime_release",
        "taskExecutor",
        "getTaskExecutor$work_runtime_release",
        "setTaskExecutor$work_runtime_release",
        "tracer",
        "Landroidx/work/Tracer;",
        "getTracer$work_runtime_release",
        "()Landroidx/work/Tracer;",
        "setTracer$work_runtime_release",
        "(Landroidx/work/Tracer;)V",
        "workerContext",
        "Lkotlin/coroutines/CoroutineContext;",
        "getWorkerContext$work_runtime_release",
        "()Lkotlin/coroutines/CoroutineContext;",
        "setWorkerContext$work_runtime_release",
        "(Lkotlin/coroutines/CoroutineContext;)V",
        "workerExecutionExceptionHandler",
        "Landroidx/work/WorkerExceptionInfo;",
        "getWorkerExecutionExceptionHandler$work_runtime_release",
        "setWorkerExecutionExceptionHandler$work_runtime_release",
        "workerFactory",
        "Landroidx/work/WorkerFactory;",
        "getWorkerFactory$work_runtime_release",
        "()Landroidx/work/WorkerFactory;",
        "setWorkerFactory$work_runtime_release",
        "(Landroidx/work/WorkerFactory;)V",
        "workerInitializationExceptionHandler",
        "getWorkerInitializationExceptionHandler$work_runtime_release",
        "setWorkerInitializationExceptionHandler$work_runtime_release",
        "build",
        "setClock",
        "setContentUriTriggerWorkersLimit",
        "setDefaultProcessName",
        "processName",
        "setExecutor",
        "setInitializationExceptionHandler",
        "exceptionHandler",
        "setInputMergerFactory",
        "setJobSchedulerJobIdRange",
        "setMarkingJobsAsImportantWhileForeground",
        "markAsImportant",
        "setMaxSchedulerLimit",
        "setMinimumLoggingLevel",
        "setRunnableScheduler",
        "setSchedulingExceptionHandler",
        "setTaskExecutor",
        "setTracer",
        "setWorkerCoroutineContext",
        "context",
        "setWorkerExecutionExceptionHandler",
        "workerExceptionHandler",
        "setWorkerFactory",
        "setWorkerInitializationExceptionHandler",
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
.field private clock:Landroidx/work/Clock;

.field private contentUriTriggerWorkersLimit:I

.field private defaultProcessName:Ljava/lang/String;

.field private executor:Ljava/util/concurrent/Executor;

.field private initializationExceptionHandler:Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private inputMergerFactory:Landroidx/work/InputMergerFactory;

.field private loggingLevel:I

.field private markJobsAsImportantWhileForeground:Z

.field private maxJobSchedulerId:I

.field private maxSchedulerLimit:I

.field private minJobSchedulerId:I

.field private runnableScheduler:Landroidx/work/RunnableScheduler;

.field private schedulingExceptionHandler:Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field private taskExecutor:Ljava/util/concurrent/Executor;

.field private tracer:Landroidx/work/Tracer;

.field private workerContext:Lkotlin/coroutines/CoroutineContext;

.field private workerExecutionExceptionHandler:Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Consumer<",
            "Landroidx/work/WorkerExceptionInfo;",
            ">;"
        }
    .end annotation
.end field

.field private workerFactory:Landroidx/work/WorkerFactory;

.field private workerInitializationExceptionHandler:Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/core/util/Consumer<",
            "Landroidx/work/WorkerExceptionInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 225
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 216
    const/4 v0, 0x4

    iput v0, p0, Landroidx/work/Configuration$Builder;->loggingLevel:I

    .line 218
    const v0, 0x7fffffff

    iput v0, p0, Landroidx/work/Configuration$Builder;->maxJobSchedulerId:I

    .line 219
    const/16 v0, 0x14

    iput v0, p0, Landroidx/work/Configuration$Builder;->maxSchedulerLimit:I

    .line 220
    const/16 v0, 0x8

    iput v0, p0, Landroidx/work/Configuration$Builder;->contentUriTriggerWorkersLimit:I

    .line 221
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/work/Configuration$Builder;->markJobsAsImportantWhileForeground:Z

    .line 225
    return-void
.end method

.method public constructor <init>(Landroidx/work/Configuration;)V
    .locals 1
    .param p1, "configuration"    # Landroidx/work/Configuration;

    const-string v0, "configuration"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 233
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 216
    const/4 v0, 0x4

    iput v0, p0, Landroidx/work/Configuration$Builder;->loggingLevel:I

    .line 218
    const v0, 0x7fffffff

    iput v0, p0, Landroidx/work/Configuration$Builder;->maxJobSchedulerId:I

    .line 219
    const/16 v0, 0x14

    iput v0, p0, Landroidx/work/Configuration$Builder;->maxSchedulerLimit:I

    .line 220
    const/16 v0, 0x8

    iput v0, p0, Landroidx/work/Configuration$Builder;->contentUriTriggerWorkersLimit:I

    .line 221
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/work/Configuration$Builder;->markJobsAsImportantWhileForeground:Z

    .line 236
    invoke-virtual {p1}, Landroidx/work/Configuration;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/Configuration$Builder;->executor:Ljava/util/concurrent/Executor;

    .line 237
    invoke-virtual {p1}, Landroidx/work/Configuration;->getWorkerFactory()Landroidx/work/WorkerFactory;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/Configuration$Builder;->workerFactory:Landroidx/work/WorkerFactory;

    .line 238
    invoke-virtual {p1}, Landroidx/work/Configuration;->getInputMergerFactory()Landroidx/work/InputMergerFactory;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/Configuration$Builder;->inputMergerFactory:Landroidx/work/InputMergerFactory;

    .line 239
    invoke-virtual {p1}, Landroidx/work/Configuration;->getTaskExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/Configuration$Builder;->taskExecutor:Ljava/util/concurrent/Executor;

    .line 240
    invoke-virtual {p1}, Landroidx/work/Configuration;->getClock()Landroidx/work/Clock;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/Configuration$Builder;->clock:Landroidx/work/Clock;

    .line 241
    invoke-virtual {p1}, Landroidx/work/Configuration;->getMinimumLoggingLevel()I

    move-result v0

    iput v0, p0, Landroidx/work/Configuration$Builder;->loggingLevel:I

    .line 242
    invoke-virtual {p1}, Landroidx/work/Configuration;->getMinJobSchedulerId()I

    move-result v0

    iput v0, p0, Landroidx/work/Configuration$Builder;->minJobSchedulerId:I

    .line 243
    invoke-virtual {p1}, Landroidx/work/Configuration;->getMaxJobSchedulerId()I

    move-result v0

    iput v0, p0, Landroidx/work/Configuration$Builder;->maxJobSchedulerId:I

    .line 244
    invoke-virtual {p1}, Landroidx/work/Configuration;->getMaxSchedulerLimit()I

    move-result v0

    iput v0, p0, Landroidx/work/Configuration$Builder;->maxSchedulerLimit:I

    .line 245
    invoke-virtual {p1}, Landroidx/work/Configuration;->getRunnableScheduler()Landroidx/work/RunnableScheduler;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/Configuration$Builder;->runnableScheduler:Landroidx/work/RunnableScheduler;

    .line 246
    invoke-virtual {p1}, Landroidx/work/Configuration;->getInitializationExceptionHandler()Landroidx/core/util/Consumer;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/Configuration$Builder;->initializationExceptionHandler:Landroidx/core/util/Consumer;

    .line 247
    invoke-virtual {p1}, Landroidx/work/Configuration;->getSchedulingExceptionHandler()Landroidx/core/util/Consumer;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/Configuration$Builder;->schedulingExceptionHandler:Landroidx/core/util/Consumer;

    .line 248
    nop

    .line 249
    invoke-virtual {p1}, Landroidx/work/Configuration;->getWorkerInitializationExceptionHandler()Landroidx/core/util/Consumer;

    move-result-object v0

    .line 248
    iput-object v0, p0, Landroidx/work/Configuration$Builder;->workerInitializationExceptionHandler:Landroidx/core/util/Consumer;

    .line 250
    invoke-virtual {p1}, Landroidx/work/Configuration;->getWorkerExecutionExceptionHandler()Landroidx/core/util/Consumer;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/Configuration$Builder;->workerExecutionExceptionHandler:Landroidx/core/util/Consumer;

    .line 251
    invoke-virtual {p1}, Landroidx/work/Configuration;->getDefaultProcessName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/Configuration$Builder;->defaultProcessName:Ljava/lang/String;

    .line 252
    invoke-virtual {p1}, Landroidx/work/Configuration;->getContentUriTriggerWorkersLimit()I

    move-result v0

    iput v0, p0, Landroidx/work/Configuration$Builder;->contentUriTriggerWorkersLimit:I

    .line 253
    nop

    .line 254
    invoke-virtual {p1}, Landroidx/work/Configuration;->isMarkingJobsAsImportantWhileForeground()Z

    move-result v0

    .line 253
    iput-boolean v0, p0, Landroidx/work/Configuration$Builder;->markJobsAsImportantWhileForeground:Z

    .line 255
    invoke-virtual {p1}, Landroidx/work/Configuration;->getTracer()Landroidx/work/Tracer;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/Configuration$Builder;->tracer:Landroidx/work/Tracer;

    .line 256
    return-void
.end method


# virtual methods
.method public final build()Landroidx/work/Configuration;
    .locals 1

    .line 547
    new-instance v0, Landroidx/work/Configuration;

    invoke-direct {v0, p0}, Landroidx/work/Configuration;-><init>(Landroidx/work/Configuration$Builder;)V

    return-object v0
.end method

.method public final getClock$work_runtime_release()Landroidx/work/Clock;
    .locals 1

    .line 209
    iget-object v0, p0, Landroidx/work/Configuration$Builder;->clock:Landroidx/work/Clock;

    return-object v0
.end method

.method public final getContentUriTriggerWorkersLimit$work_runtime_release()I
    .locals 1

    .line 220
    iget v0, p0, Landroidx/work/Configuration$Builder;->contentUriTriggerWorkersLimit:I

    return v0
.end method

.method public final getDefaultProcessName$work_runtime_release()Ljava/lang/String;
    .locals 1

    .line 215
    iget-object v0, p0, Landroidx/work/Configuration$Builder;->defaultProcessName:Ljava/lang/String;

    return-object v0
.end method

.method public final getExecutor$work_runtime_release()Ljava/util/concurrent/Executor;
    .locals 1

    .line 204
    iget-object v0, p0, Landroidx/work/Configuration$Builder;->executor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public final getInitializationExceptionHandler$work_runtime_release()Landroidx/core/util/Consumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .line 211
    iget-object v0, p0, Landroidx/work/Configuration$Builder;->initializationExceptionHandler:Landroidx/core/util/Consumer;

    return-object v0
.end method

.method public final getInputMergerFactory$work_runtime_release()Landroidx/work/InputMergerFactory;
    .locals 1

    .line 207
    iget-object v0, p0, Landroidx/work/Configuration$Builder;->inputMergerFactory:Landroidx/work/InputMergerFactory;

    return-object v0
.end method

.method public final getLoggingLevel$work_runtime_release()I
    .locals 1

    .line 216
    iget v0, p0, Landroidx/work/Configuration$Builder;->loggingLevel:I

    return v0
.end method

.method public final getMarkJobsAsImportantWhileForeground$work_runtime_release()Z
    .locals 1

    .line 221
    iget-boolean v0, p0, Landroidx/work/Configuration$Builder;->markJobsAsImportantWhileForeground:Z

    return v0
.end method

.method public final getMaxJobSchedulerId$work_runtime_release()I
    .locals 1

    .line 218
    iget v0, p0, Landroidx/work/Configuration$Builder;->maxJobSchedulerId:I

    return v0
.end method

.method public final getMaxSchedulerLimit$work_runtime_release()I
    .locals 1

    .line 219
    iget v0, p0, Landroidx/work/Configuration$Builder;->maxSchedulerLimit:I

    return v0
.end method

.method public final getMinJobSchedulerId$work_runtime_release()I
    .locals 1

    .line 217
    iget v0, p0, Landroidx/work/Configuration$Builder;->minJobSchedulerId:I

    return v0
.end method

.method public final getRunnableScheduler$work_runtime_release()Landroidx/work/RunnableScheduler;
    .locals 1

    .line 210
    iget-object v0, p0, Landroidx/work/Configuration$Builder;->runnableScheduler:Landroidx/work/RunnableScheduler;

    return-object v0
.end method

.method public final getSchedulingExceptionHandler$work_runtime_release()Landroidx/core/util/Consumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .line 212
    iget-object v0, p0, Landroidx/work/Configuration$Builder;->schedulingExceptionHandler:Landroidx/core/util/Consumer;

    return-object v0
.end method

.method public final getTaskExecutor$work_runtime_release()Ljava/util/concurrent/Executor;
    .locals 1

    .line 208
    iget-object v0, p0, Landroidx/work/Configuration$Builder;->taskExecutor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public final getTracer$work_runtime_release()Landroidx/work/Tracer;
    .locals 1

    .line 222
    iget-object v0, p0, Landroidx/work/Configuration$Builder;->tracer:Landroidx/work/Tracer;

    return-object v0
.end method

.method public final getWorkerContext$work_runtime_release()Lkotlin/coroutines/CoroutineContext;
    .locals 1

    .line 205
    iget-object v0, p0, Landroidx/work/Configuration$Builder;->workerContext:Lkotlin/coroutines/CoroutineContext;

    return-object v0
.end method

.method public final getWorkerExecutionExceptionHandler$work_runtime_release()Landroidx/core/util/Consumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/core/util/Consumer<",
            "Landroidx/work/WorkerExceptionInfo;",
            ">;"
        }
    .end annotation

    .line 214
    iget-object v0, p0, Landroidx/work/Configuration$Builder;->workerExecutionExceptionHandler:Landroidx/core/util/Consumer;

    return-object v0
.end method

.method public final getWorkerFactory$work_runtime_release()Landroidx/work/WorkerFactory;
    .locals 1

    .line 206
    iget-object v0, p0, Landroidx/work/Configuration$Builder;->workerFactory:Landroidx/work/WorkerFactory;

    return-object v0
.end method

.method public final getWorkerInitializationExceptionHandler$work_runtime_release()Landroidx/core/util/Consumer;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/core/util/Consumer<",
            "Landroidx/work/WorkerExceptionInfo;",
            ">;"
        }
    .end annotation

    .line 213
    iget-object v0, p0, Landroidx/work/Configuration$Builder;->workerInitializationExceptionHandler:Landroidx/core/util/Consumer;

    return-object v0
.end method

.method public final setClock(Landroidx/work/Clock;)Landroidx/work/Configuration$Builder;
    .locals 1
    .param p1, "clock"    # Landroidx/work/Clock;

    const-string v0, "clock"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 336
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->clock:Landroidx/work/Clock;

    .line 337
    return-object p0
.end method

.method public final setClock$work_runtime_release(Landroidx/work/Clock;)V
    .locals 0
    .param p1, "<set-?>"    # Landroidx/work/Clock;

    .line 209
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->clock:Landroidx/work/Clock;

    return-void
.end method

.method public final setContentUriTriggerWorkersLimit(I)Landroidx/work/Configuration$Builder;
    .locals 1
    .param p1, "contentUriTriggerWorkersLimit"    # I

    .line 404
    const/4 v0, 0x0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Landroidx/work/Configuration$Builder;->contentUriTriggerWorkersLimit:I

    .line 405
    return-object p0
.end method

.method public final setContentUriTriggerWorkersLimit$work_runtime_release(I)V
    .locals 0
    .param p1, "<set-?>"    # I

    .line 220
    iput p1, p0, Landroidx/work/Configuration$Builder;->contentUriTriggerWorkersLimit:I

    return-void
.end method

.method public final setDefaultProcessName(Ljava/lang/String;)Landroidx/work/Configuration$Builder;
    .locals 1
    .param p1, "processName"    # Ljava/lang/String;

    const-string v0, "processName"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 509
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->defaultProcessName:Ljava/lang/String;

    .line 510
    return-object p0
.end method

.method public final setDefaultProcessName$work_runtime_release(Ljava/lang/String;)V
    .locals 0
    .param p1, "<set-?>"    # Ljava/lang/String;

    .line 215
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->defaultProcessName:Ljava/lang/String;

    return-void
.end method

.method public final setExecutor(Ljava/util/concurrent/Executor;)Landroidx/work/Configuration$Builder;
    .locals 1
    .param p1, "executor"    # Ljava/util/concurrent/Executor;

    const-string v0, "executor"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 290
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->executor:Ljava/util/concurrent/Executor;

    .line 291
    return-object p0
.end method

.method public final setExecutor$work_runtime_release(Ljava/util/concurrent/Executor;)V
    .locals 0
    .param p1, "<set-?>"    # Ljava/util/concurrent/Executor;

    .line 204
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->executor:Ljava/util/concurrent/Executor;

    return-void
.end method

.method public final setInitializationExceptionHandler(Landroidx/core/util/Consumer;)Landroidx/work/Configuration$Builder;
    .locals 1
    .param p1, "exceptionHandler"    # Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;)",
            "Landroidx/work/Configuration$Builder;"
        }
    .end annotation

    const-string v0, "exceptionHandler"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 447
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->initializationExceptionHandler:Landroidx/core/util/Consumer;

    .line 448
    return-object p0
.end method

.method public final setInitializationExceptionHandler$work_runtime_release(Landroidx/core/util/Consumer;)V
    .locals 0
    .param p1, "<set-?>"    # Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 211
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->initializationExceptionHandler:Landroidx/core/util/Consumer;

    return-void
.end method

.method public final setInputMergerFactory(Landroidx/work/InputMergerFactory;)Landroidx/work/Configuration$Builder;
    .locals 1
    .param p1, "inputMergerFactory"    # Landroidx/work/InputMergerFactory;

    const-string v0, "inputMergerFactory"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 276
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->inputMergerFactory:Landroidx/work/InputMergerFactory;

    .line 277
    return-object p0
.end method

.method public final setInputMergerFactory$work_runtime_release(Landroidx/work/InputMergerFactory;)V
    .locals 0
    .param p1, "<set-?>"    # Landroidx/work/InputMergerFactory;

    .line 207
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->inputMergerFactory:Landroidx/work/InputMergerFactory;

    return-void
.end method

.method public final setJobSchedulerJobIdRange(II)Landroidx/work/Configuration$Builder;
    .locals 2
    .param p1, "minJobSchedulerId"    # I
    .param p2, "maxJobSchedulerId"    # I

    .line 357
    sub-int v0, p2, p1

    const/16 v1, 0x3e8

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 360
    iput p1, p0, Landroidx/work/Configuration$Builder;->minJobSchedulerId:I

    .line 361
    iput p2, p0, Landroidx/work/Configuration$Builder;->maxJobSchedulerId:I

    .line 362
    return-object p0

    .line 357
    :cond_1
    const/4 v0, 0x0

    .line 358
    .local v0, "$i$a$-require-Configuration$Builder$setJobSchedulerJobIdRange$1":I
    nop

    .line 357
    .end local v0    # "$i$a$-require-Configuration$Builder$setJobSchedulerJobIdRange$1":I
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "WorkManager needs a range of at least 1000 job ids."

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final setLoggingLevel$work_runtime_release(I)V
    .locals 0
    .param p1, "<set-?>"    # I

    .line 216
    iput p1, p0, Landroidx/work/Configuration$Builder;->loggingLevel:I

    return-void
.end method

.method public final setMarkJobsAsImportantWhileForeground$work_runtime_release(Z)V
    .locals 0
    .param p1, "<set-?>"    # Z

    .line 221
    iput-boolean p1, p0, Landroidx/work/Configuration$Builder;->markJobsAsImportantWhileForeground:Z

    return-void
.end method

.method public final setMarkingJobsAsImportantWhileForeground(Z)Landroidx/work/Configuration$Builder;
    .locals 0
    .param p1, "markAsImportant"    # Z

    .line 525
    iput-boolean p1, p0, Landroidx/work/Configuration$Builder;->markJobsAsImportantWhileForeground:Z

    .line 526
    return-object p0
.end method

.method public final setMaxJobSchedulerId$work_runtime_release(I)V
    .locals 0
    .param p1, "<set-?>"    # I

    .line 218
    iput p1, p0, Landroidx/work/Configuration$Builder;->maxJobSchedulerId:I

    return-void
.end method

.method public final setMaxSchedulerLimit(I)Landroidx/work/Configuration$Builder;
    .locals 2
    .param p1, "maxSchedulerLimit"    # I

    .line 388
    const/16 v0, 0x14

    if-lt p1, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 391
    const/16 v0, 0x32

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Landroidx/work/Configuration$Builder;->maxSchedulerLimit:I

    .line 392
    return-object p0

    .line 388
    :cond_1
    const/4 v0, 0x0

    .line 389
    .local v0, "$i$a$-require-Configuration$Builder$setMaxSchedulerLimit$1":I
    nop

    .line 388
    .end local v0    # "$i$a$-require-Configuration$Builder$setMaxSchedulerLimit$1":I
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "WorkManager needs to be able to schedule at least 20 jobs in JobScheduler."

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final setMaxSchedulerLimit$work_runtime_release(I)V
    .locals 0
    .param p1, "<set-?>"    # I

    .line 219
    iput p1, p0, Landroidx/work/Configuration$Builder;->maxSchedulerLimit:I

    return-void
.end method

.method public final setMinJobSchedulerId$work_runtime_release(I)V
    .locals 0
    .param p1, "<set-?>"    # I

    .line 217
    iput p1, p0, Landroidx/work/Configuration$Builder;->minJobSchedulerId:I

    return-void
.end method

.method public final setMinimumLoggingLevel(I)Landroidx/work/Configuration$Builder;
    .locals 0
    .param p1, "loggingLevel"    # I

    .line 419
    iput p1, p0, Landroidx/work/Configuration$Builder;->loggingLevel:I

    .line 420
    return-object p0
.end method

.method public final setRunnableScheduler(Landroidx/work/RunnableScheduler;)Landroidx/work/Configuration$Builder;
    .locals 1
    .param p1, "runnableScheduler"    # Landroidx/work/RunnableScheduler;

    const-string v0, "runnableScheduler"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 432
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->runnableScheduler:Landroidx/work/RunnableScheduler;

    .line 433
    return-object p0
.end method

.method public final setRunnableScheduler$work_runtime_release(Landroidx/work/RunnableScheduler;)V
    .locals 0
    .param p1, "<set-?>"    # Landroidx/work/RunnableScheduler;

    .line 210
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->runnableScheduler:Landroidx/work/RunnableScheduler;

    return-void
.end method

.method public final setSchedulingExceptionHandler(Landroidx/core/util/Consumer;)Landroidx/work/Configuration$Builder;
    .locals 1
    .param p1, "schedulingExceptionHandler"    # Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;)",
            "Landroidx/work/Configuration$Builder;"
        }
    .end annotation

    const-string/jumbo v0, "schedulingExceptionHandler"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 466
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->schedulingExceptionHandler:Landroidx/core/util/Consumer;

    .line 467
    return-object p0
.end method

.method public final setSchedulingExceptionHandler$work_runtime_release(Landroidx/core/util/Consumer;)V
    .locals 0
    .param p1, "<set-?>"    # Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Consumer<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 212
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->schedulingExceptionHandler:Landroidx/core/util/Consumer;

    return-void
.end method

.method public final setTaskExecutor(Ljava/util/concurrent/Executor;)Landroidx/work/Configuration$Builder;
    .locals 1
    .param p1, "taskExecutor"    # Ljava/util/concurrent/Executor;

    const-string/jumbo v0, "taskExecutor"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 322
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->taskExecutor:Ljava/util/concurrent/Executor;

    .line 323
    return-object p0
.end method

.method public final setTaskExecutor$work_runtime_release(Ljava/util/concurrent/Executor;)V
    .locals 0
    .param p1, "<set-?>"    # Ljava/util/concurrent/Executor;

    .line 208
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->taskExecutor:Ljava/util/concurrent/Executor;

    return-void
.end method

.method public final setTracer(Landroidx/work/Tracer;)Landroidx/work/Configuration$Builder;
    .locals 1
    .param p1, "tracer"    # Landroidx/work/Tracer;

    const-string/jumbo v0, "tracer"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 537
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->tracer:Landroidx/work/Tracer;

    .line 538
    return-object p0
.end method

.method public final setTracer$work_runtime_release(Landroidx/work/Tracer;)V
    .locals 0
    .param p1, "<set-?>"    # Landroidx/work/Tracer;

    .line 222
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->tracer:Landroidx/work/Tracer;

    return-void
.end method

.method public final setWorkerContext$work_runtime_release(Lkotlin/coroutines/CoroutineContext;)V
    .locals 0
    .param p1, "<set-?>"    # Lkotlin/coroutines/CoroutineContext;

    .line 205
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->workerContext:Lkotlin/coroutines/CoroutineContext;

    return-void
.end method

.method public final setWorkerCoroutineContext(Lkotlin/coroutines/CoroutineContext;)Landroidx/work/Configuration$Builder;
    .locals 1
    .param p1, "context"    # Lkotlin/coroutines/CoroutineContext;

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 305
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->workerContext:Lkotlin/coroutines/CoroutineContext;

    .line 306
    return-object p0
.end method

.method public final setWorkerExecutionExceptionHandler(Landroidx/core/util/Consumer;)Landroidx/work/Configuration$Builder;
    .locals 1
    .param p1, "workerExceptionHandler"    # Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Consumer<",
            "Landroidx/work/WorkerExceptionInfo;",
            ">;)",
            "Landroidx/work/Configuration$Builder;"
        }
    .end annotation

    const-string/jumbo v0, "workerExceptionHandler"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 498
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->workerExecutionExceptionHandler:Landroidx/core/util/Consumer;

    .line 499
    return-object p0
.end method

.method public final setWorkerExecutionExceptionHandler$work_runtime_release(Landroidx/core/util/Consumer;)V
    .locals 0
    .param p1, "<set-?>"    # Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Consumer<",
            "Landroidx/work/WorkerExceptionInfo;",
            ">;)V"
        }
    .end annotation

    .line 214
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->workerExecutionExceptionHandler:Landroidx/core/util/Consumer;

    return-void
.end method

.method public final setWorkerFactory(Landroidx/work/WorkerFactory;)Landroidx/work/Configuration$Builder;
    .locals 1
    .param p1, "workerFactory"    # Landroidx/work/WorkerFactory;

    const-string/jumbo v0, "workerFactory"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 265
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->workerFactory:Landroidx/work/WorkerFactory;

    .line 266
    return-object p0
.end method

.method public final setWorkerFactory$work_runtime_release(Landroidx/work/WorkerFactory;)V
    .locals 0
    .param p1, "<set-?>"    # Landroidx/work/WorkerFactory;

    .line 206
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->workerFactory:Landroidx/work/WorkerFactory;

    return-void
.end method

.method public final setWorkerInitializationExceptionHandler(Landroidx/core/util/Consumer;)Landroidx/work/Configuration$Builder;
    .locals 1
    .param p1, "workerExceptionHandler"    # Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Consumer<",
            "Landroidx/work/WorkerExceptionInfo;",
            ">;)",
            "Landroidx/work/Configuration$Builder;"
        }
    .end annotation

    const-string/jumbo v0, "workerExceptionHandler"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 482
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->workerInitializationExceptionHandler:Landroidx/core/util/Consumer;

    .line 483
    return-object p0
.end method

.method public final setWorkerInitializationExceptionHandler$work_runtime_release(Landroidx/core/util/Consumer;)V
    .locals 0
    .param p1, "<set-?>"    # Landroidx/core/util/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Consumer<",
            "Landroidx/work/WorkerExceptionInfo;",
            ">;)V"
        }
    .end annotation

    .line 213
    iput-object p1, p0, Landroidx/work/Configuration$Builder;->workerInitializationExceptionHandler:Landroidx/core/util/Consumer;

    return-void
.end method
