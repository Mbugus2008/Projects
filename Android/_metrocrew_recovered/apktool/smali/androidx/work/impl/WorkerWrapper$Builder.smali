.class public final Landroidx/work/impl/WorkerWrapper$Builder;
.super Ljava/lang/Object;
.source "WorkerWrapper.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/work/impl/WorkerWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000R\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0010\u000e\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\r\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001BE\u0008\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\u0006\u0010\u000c\u001a\u00020\r\u0012\u000c\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u00100\u000f\u00a2\u0006\u0002\u0010\u0011J\u0006\u0010-\u001a\u00020.J\u0010\u0010/\u001a\u00020\u00002\u0008\u0010\u0019\u001a\u0004\u0018\u00010\u001aJ\u0010\u00100\u001a\u00020\u00002\u0006\u0010\'\u001a\u00020(H\u0007R\u0011\u0010\u0012\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u0014R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0015\u0010\u0016R\u0011\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0017\u0010\u0018R\u001a\u0010\u0019\u001a\u00020\u001aX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001b\u0010\u001c\"\u0004\u0008\u001d\u0010\u001eR\u0017\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u00100\u000f\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001f\u0010 R\u0011\u0010\n\u001a\u00020\u000b\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008!\u0010\"R\u0011\u0010\u000c\u001a\u00020\r\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008#\u0010$R\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008%\u0010&R\u001c\u0010\'\u001a\u0004\u0018\u00010(X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008)\u0010*\"\u0004\u0008+\u0010,\u00a8\u00061"
    }
    d2 = {
        "Landroidx/work/impl/WorkerWrapper$Builder;",
        "",
        "context",
        "Landroid/content/Context;",
        "configuration",
        "Landroidx/work/Configuration;",
        "workTaskExecutor",
        "Landroidx/work/impl/utils/taskexecutor/TaskExecutor;",
        "foregroundProcessor",
        "Landroidx/work/impl/foreground/ForegroundProcessor;",
        "workDatabase",
        "Landroidx/work/impl/WorkDatabase;",
        "workSpec",
        "Landroidx/work/impl/model/WorkSpec;",
        "tags",
        "",
        "",
        "(Landroid/content/Context;Landroidx/work/Configuration;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Landroidx/work/impl/foreground/ForegroundProcessor;Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/model/WorkSpec;Ljava/util/List;)V",
        "appContext",
        "getAppContext",
        "()Landroid/content/Context;",
        "getConfiguration",
        "()Landroidx/work/Configuration;",
        "getForegroundProcessor",
        "()Landroidx/work/impl/foreground/ForegroundProcessor;",
        "runtimeExtras",
        "Landroidx/work/WorkerParameters$RuntimeExtras;",
        "getRuntimeExtras",
        "()Landroidx/work/WorkerParameters$RuntimeExtras;",
        "setRuntimeExtras",
        "(Landroidx/work/WorkerParameters$RuntimeExtras;)V",
        "getTags",
        "()Ljava/util/List;",
        "getWorkDatabase",
        "()Landroidx/work/impl/WorkDatabase;",
        "getWorkSpec",
        "()Landroidx/work/impl/model/WorkSpec;",
        "getWorkTaskExecutor",
        "()Landroidx/work/impl/utils/taskexecutor/TaskExecutor;",
        "worker",
        "Landroidx/work/ListenableWorker;",
        "getWorker",
        "()Landroidx/work/ListenableWorker;",
        "setWorker",
        "(Landroidx/work/ListenableWorker;)V",
        "build",
        "Landroidx/work/impl/WorkerWrapper;",
        "withRuntimeExtras",
        "withWorker",
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

.field private final configuration:Landroidx/work/Configuration;

.field private final foregroundProcessor:Landroidx/work/impl/foreground/ForegroundProcessor;

.field private runtimeExtras:Landroidx/work/WorkerParameters$RuntimeExtras;

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

.field private final workSpec:Landroidx/work/impl/model/WorkSpec;

.field private final workTaskExecutor:Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

.field private worker:Landroidx/work/ListenableWorker;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroidx/work/Configuration;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Landroidx/work/impl/foreground/ForegroundProcessor;Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/model/WorkSpec;Ljava/util/List;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "configuration"    # Landroidx/work/Configuration;
    .param p3, "workTaskExecutor"    # Landroidx/work/impl/utils/taskexecutor/TaskExecutor;
    .param p4, "foregroundProcessor"    # Landroidx/work/impl/foreground/ForegroundProcessor;
    .param p5, "workDatabase"    # Landroidx/work/impl/WorkDatabase;
    .param p6, "workSpec"    # Landroidx/work/impl/model/WorkSpec;
    .param p7, "tags"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroidx/work/Configuration;",
            "Landroidx/work/impl/utils/taskexecutor/TaskExecutor;",
            "Landroidx/work/impl/foreground/ForegroundProcessor;",
            "Landroidx/work/impl/WorkDatabase;",
            "Landroidx/work/impl/model/WorkSpec;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const-string v0, "context"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "configuration"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "workTaskExecutor"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "foregroundProcessor"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "workDatabase"

    invoke-static {p5, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "workSpec"

    invoke-static {p6, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "tags"

    invoke-static {p7, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 489
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 494
    iput-object p2, p0, Landroidx/work/impl/WorkerWrapper$Builder;->configuration:Landroidx/work/Configuration;

    .line 495
    iput-object p3, p0, Landroidx/work/impl/WorkerWrapper$Builder;->workTaskExecutor:Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    .line 496
    iput-object p4, p0, Landroidx/work/impl/WorkerWrapper$Builder;->foregroundProcessor:Landroidx/work/impl/foreground/ForegroundProcessor;

    .line 497
    iput-object p5, p0, Landroidx/work/impl/WorkerWrapper$Builder;->workDatabase:Landroidx/work/impl/WorkDatabase;

    .line 498
    iput-object p6, p0, Landroidx/work/impl/WorkerWrapper$Builder;->workSpec:Landroidx/work/impl/model/WorkSpec;

    .line 499
    iput-object p7, p0, Landroidx/work/impl/WorkerWrapper$Builder;->tags:Ljava/util/List;

    .line 501
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "context.applicationContext"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    iput-object v0, p0, Landroidx/work/impl/WorkerWrapper$Builder;->appContext:Landroid/content/Context;

    .line 503
    new-instance v0, Landroidx/work/WorkerParameters$RuntimeExtras;

    invoke-direct {v0}, Landroidx/work/WorkerParameters$RuntimeExtras;-><init>()V

    iput-object v0, p0, Landroidx/work/impl/WorkerWrapper$Builder;->runtimeExtras:Landroidx/work/WorkerParameters$RuntimeExtras;

    .line 492
    return-void
.end method


# virtual methods
.method public final build()Landroidx/work/impl/WorkerWrapper;
    .locals 1

    .line 530
    new-instance v0, Landroidx/work/impl/WorkerWrapper;

    invoke-direct {v0, p0}, Landroidx/work/impl/WorkerWrapper;-><init>(Landroidx/work/impl/WorkerWrapper$Builder;)V

    return-object v0
.end method

.method public final getAppContext()Landroid/content/Context;
    .locals 1

    .line 501
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper$Builder;->appContext:Landroid/content/Context;

    return-object v0
.end method

.method public final getConfiguration()Landroidx/work/Configuration;
    .locals 1

    .line 494
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper$Builder;->configuration:Landroidx/work/Configuration;

    return-object v0
.end method

.method public final getForegroundProcessor()Landroidx/work/impl/foreground/ForegroundProcessor;
    .locals 1

    .line 496
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper$Builder;->foregroundProcessor:Landroidx/work/impl/foreground/ForegroundProcessor;

    return-object v0
.end method

.method public final getRuntimeExtras()Landroidx/work/WorkerParameters$RuntimeExtras;
    .locals 1

    .line 503
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper$Builder;->runtimeExtras:Landroidx/work/WorkerParameters$RuntimeExtras;

    return-object v0
.end method

.method public final getTags()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 499
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper$Builder;->tags:Ljava/util/List;

    return-object v0
.end method

.method public final getWorkDatabase()Landroidx/work/impl/WorkDatabase;
    .locals 1

    .line 497
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper$Builder;->workDatabase:Landroidx/work/impl/WorkDatabase;

    return-object v0
.end method

.method public final getWorkSpec()Landroidx/work/impl/model/WorkSpec;
    .locals 1

    .line 498
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper$Builder;->workSpec:Landroidx/work/impl/model/WorkSpec;

    return-object v0
.end method

.method public final getWorkTaskExecutor()Landroidx/work/impl/utils/taskexecutor/TaskExecutor;
    .locals 1

    .line 495
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper$Builder;->workTaskExecutor:Landroidx/work/impl/utils/taskexecutor/TaskExecutor;

    return-object v0
.end method

.method public final getWorker()Landroidx/work/ListenableWorker;
    .locals 1

    .line 502
    iget-object v0, p0, Landroidx/work/impl/WorkerWrapper$Builder;->worker:Landroidx/work/ListenableWorker;

    return-object v0
.end method

.method public final setRuntimeExtras(Landroidx/work/WorkerParameters$RuntimeExtras;)V
    .locals 1
    .param p1, "<set-?>"    # Landroidx/work/WorkerParameters$RuntimeExtras;

    const-string v0, "<set-?>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 503
    iput-object p1, p0, Landroidx/work/impl/WorkerWrapper$Builder;->runtimeExtras:Landroidx/work/WorkerParameters$RuntimeExtras;

    return-void
.end method

.method public final setWorker(Landroidx/work/ListenableWorker;)V
    .locals 0
    .param p1, "<set-?>"    # Landroidx/work/ListenableWorker;

    .line 502
    iput-object p1, p0, Landroidx/work/impl/WorkerWrapper$Builder;->worker:Landroidx/work/ListenableWorker;

    return-void
.end method

.method public final withRuntimeExtras(Landroidx/work/WorkerParameters$RuntimeExtras;)Landroidx/work/impl/WorkerWrapper$Builder;
    .locals 0
    .param p1, "runtimeExtras"    # Landroidx/work/WorkerParameters$RuntimeExtras;

    .line 511
    if-eqz p1, :cond_0

    .line 512
    iput-object p1, p0, Landroidx/work/impl/WorkerWrapper$Builder;->runtimeExtras:Landroidx/work/WorkerParameters$RuntimeExtras;

    .line 514
    :cond_0
    return-object p0
.end method

.method public final withWorker(Landroidx/work/ListenableWorker;)Landroidx/work/impl/WorkerWrapper$Builder;
    .locals 1
    .param p1, "worker"    # Landroidx/work/ListenableWorker;

    const-string/jumbo v0, "worker"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 524
    iput-object p1, p0, Landroidx/work/impl/WorkerWrapper$Builder;->worker:Landroidx/work/ListenableWorker;

    .line 525
    return-object p0
.end method
