.class public abstract Landroidx/work/WorkManager;
.super Ljava/lang/Object;
.source "WorkManager.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/work/WorkManager$Companion;,
        Landroidx/work/WorkManager$UpdateResult;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u008a\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\'\u0018\u0000 ;2\u00020\u0001:\u0002;<B\u0007\u0008\u0000\u00a2\u0006\u0002\u0010\u0002J\u001e\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000eJ&\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u000c\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\u0010H&J\u000e\u0010\u0011\u001a\u00020\u00082\u0006\u0010\r\u001a\u00020\u000eJ\u0016\u0010\u0011\u001a\u00020\u00082\u000c\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\u0010H&J\u0008\u0010\u0012\u001a\u00020\u0013H&J\u0010\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0015\u001a\u00020\nH&J\u0010\u0010\u0016\u001a\u00020\u00132\u0006\u0010\t\u001a\u00020\nH&J\u0010\u0010\u0017\u001a\u00020\u00132\u0006\u0010\u0018\u001a\u00020\u0019H&J\u0010\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u0018\u001a\u00020\u0019H&J\u000e\u0010\u001c\u001a\u00020\u00132\u0006\u0010\r\u001a\u00020\u001dJ\u0016\u0010\u001c\u001a\u00020\u00132\u000c\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u001d0\u0010H&J \u0010\u001e\u001a\u00020\u00132\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u001f\u001a\u00020 2\u0006\u0010\r\u001a\u00020!H&J \u0010\"\u001a\u00020\u00132\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u000eH\u0016J&\u0010\"\u001a\u00020\u00132\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000c2\u000c\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\u0010H&J\u000e\u0010#\u001a\u0008\u0012\u0004\u0012\u00020%0$H&J\u000e\u0010&\u001a\u0008\u0012\u0004\u0012\u00020%0\'H&J\u0018\u0010(\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010)0$2\u0006\u0010\u0018\u001a\u00020\u0019H&J\u0018\u0010*\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010)0+2\u0006\u0010\u0018\u001a\u00020\u0019H&J\u0018\u0010,\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010)0\'2\u0006\u0010\u0018\u001a\u00020\u0019H&J\u001c\u0010-\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020)0\u00100$2\u0006\u0010.\u001a\u00020/H&J\u001c\u00100\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020)0\u00100$2\u0006\u0010\u0015\u001a\u00020\nH&J\u001c\u00101\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020)0\u00100+2\u0006\u0010\u0015\u001a\u00020\nH&J\u001c\u00102\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020)0\u00100\'2\u0006\u0010\u0015\u001a\u00020\nH&J\u001c\u00103\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020)0\u00100+2\u0006\u0010.\u001a\u00020/H&J\u001c\u00104\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020)0\u00100$2\u0006\u0010\t\u001a\u00020\nH&J\u001c\u00105\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020)0\u00100+2\u0006\u0010\t\u001a\u00020\nH&J\u001c\u00106\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020)0\u00100\'2\u0006\u0010\t\u001a\u00020\nH&J\u001c\u00107\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020)0\u00100\'2\u0006\u0010.\u001a\u00020/H&J\u0008\u00108\u001a\u00020\u0013H&J\u0016\u00109\u001a\u0008\u0012\u0004\u0012\u00020:0$2\u0006\u0010\r\u001a\u00020\u001dH&R\u0012\u0010\u0003\u001a\u00020\u0004X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0005\u0010\u0006\u00a8\u0006="
    }
    d2 = {
        "Landroidx/work/WorkManager;",
        "",
        "()V",
        "configuration",
        "Landroidx/work/Configuration;",
        "getConfiguration",
        "()Landroidx/work/Configuration;",
        "beginUniqueWork",
        "Landroidx/work/WorkContinuation;",
        "uniqueWorkName",
        "",
        "existingWorkPolicy",
        "Landroidx/work/ExistingWorkPolicy;",
        "request",
        "Landroidx/work/OneTimeWorkRequest;",
        "requests",
        "",
        "beginWith",
        "cancelAllWork",
        "Landroidx/work/Operation;",
        "cancelAllWorkByTag",
        "tag",
        "cancelUniqueWork",
        "cancelWorkById",
        "id",
        "Ljava/util/UUID;",
        "createCancelPendingIntent",
        "Landroid/app/PendingIntent;",
        "enqueue",
        "Landroidx/work/WorkRequest;",
        "enqueueUniquePeriodicWork",
        "existingPeriodicWorkPolicy",
        "Landroidx/work/ExistingPeriodicWorkPolicy;",
        "Landroidx/work/PeriodicWorkRequest;",
        "enqueueUniqueWork",
        "getLastCancelAllTimeMillis",
        "Lcom/google/common/util/concurrent/ListenableFuture;",
        "",
        "getLastCancelAllTimeMillisLiveData",
        "Landroidx/lifecycle/LiveData;",
        "getWorkInfoById",
        "Landroidx/work/WorkInfo;",
        "getWorkInfoByIdFlow",
        "Lkotlinx/coroutines/flow/Flow;",
        "getWorkInfoByIdLiveData",
        "getWorkInfos",
        "workQuery",
        "Landroidx/work/WorkQuery;",
        "getWorkInfosByTag",
        "getWorkInfosByTagFlow",
        "getWorkInfosByTagLiveData",
        "getWorkInfosFlow",
        "getWorkInfosForUniqueWork",
        "getWorkInfosForUniqueWorkFlow",
        "getWorkInfosForUniqueWorkLiveData",
        "getWorkInfosLiveData",
        "pruneWork",
        "updateWork",
        "Landroidx/work/WorkManager$UpdateResult;",
        "Companion",
        "UpdateResult",
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
.field public static final Companion:Landroidx/work/WorkManager$Companion;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroidx/work/WorkManager$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroidx/work/WorkManager$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Landroidx/work/WorkManager;->Companion:Landroidx/work/WorkManager$Companion;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    return-void
.end method

.method public static getInstance()Landroidx/work/WorkManager;
    .locals 1
    .annotation runtime Lkotlin/Deprecated;
        message = "Use the overload receiving Context"
        replaceWith = .subannotation Lkotlin/ReplaceWith;
            expression = "WorkManager.getContext(context)"
            imports = {}
        .end subannotation
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Landroidx/work/WorkManager;->Companion:Landroidx/work/WorkManager$Companion;

    invoke-virtual {v0}, Landroidx/work/WorkManager$Companion;->getInstance()Landroidx/work/WorkManager;

    move-result-object v0

    .line 157
    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;)Landroidx/work/WorkManager;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Landroidx/work/WorkManager;->Companion:Landroidx/work/WorkManager$Companion;

    invoke-virtual {v0, p0}, Landroidx/work/WorkManager$Companion;->getInstance(Landroid/content/Context;)Landroidx/work/WorkManager;

    move-result-object v0

    .line 174
    return-object v0
.end method

.method public static initialize(Landroid/content/Context;Landroidx/work/Configuration;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "configuration"    # Landroidx/work/Configuration;
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Landroidx/work/WorkManager;->Companion:Landroidx/work/WorkManager$Companion;

    invoke-virtual {v0, p0, p1}, Landroidx/work/WorkManager$Companion;->initialize(Landroid/content/Context;Landroidx/work/Configuration;)V

    .line 202
    return-void
.end method

.method public static isInitialized()Z
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Landroidx/work/WorkManager;->Companion:Landroidx/work/WorkManager$Companion;

    invoke-virtual {v0}, Landroidx/work/WorkManager$Companion;->isInitialized()Z

    move-result v0

    .line 211
    return v0
.end method


# virtual methods
.method public final beginUniqueWork(Ljava/lang/String;Landroidx/work/ExistingWorkPolicy;Landroidx/work/OneTimeWorkRequest;)Landroidx/work/WorkContinuation;
    .locals 1
    .param p1, "uniqueWorkName"    # Ljava/lang/String;
    .param p2, "existingWorkPolicy"    # Landroidx/work/ExistingWorkPolicy;
    .param p3, "request"    # Landroidx/work/OneTimeWorkRequest;

    const-string/jumbo v0, "uniqueWorkName"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "existingWorkPolicy"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "request"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 294
    invoke-static {p3}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Landroidx/work/WorkManager;->beginUniqueWork(Ljava/lang/String;Landroidx/work/ExistingWorkPolicy;Ljava/util/List;)Landroidx/work/WorkContinuation;

    move-result-object v0

    return-object v0
.end method

.method public abstract beginUniqueWork(Ljava/lang/String;Landroidx/work/ExistingWorkPolicy;Ljava/util/List;)Landroidx/work/WorkContinuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroidx/work/ExistingWorkPolicy;",
            "Ljava/util/List<",
            "Landroidx/work/OneTimeWorkRequest;",
            ">;)",
            "Landroidx/work/WorkContinuation;"
        }
    .end annotation
.end method

.method public final beginWith(Landroidx/work/OneTimeWorkRequest;)Landroidx/work/WorkContinuation;
    .locals 1
    .param p1, "request"    # Landroidx/work/OneTimeWorkRequest;

    const-string v0, "request"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 247
    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/work/WorkManager;->beginWith(Ljava/util/List;)Landroidx/work/WorkContinuation;

    move-result-object v0

    return-object v0
.end method

.method public abstract beginWith(Ljava/util/List;)Landroidx/work/WorkContinuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/work/OneTimeWorkRequest;",
            ">;)",
            "Landroidx/work/WorkContinuation;"
        }
    .end annotation
.end method

.method public abstract cancelAllWork()Landroidx/work/Operation;
.end method

.method public abstract cancelAllWorkByTag(Ljava/lang/String;)Landroidx/work/Operation;
.end method

.method public abstract cancelUniqueWork(Ljava/lang/String;)Landroidx/work/Operation;
.end method

.method public abstract cancelWorkById(Ljava/util/UUID;)Landroidx/work/Operation;
.end method

.method public abstract createCancelPendingIntent(Ljava/util/UUID;)Landroid/app/PendingIntent;
.end method

.method public final enqueue(Landroidx/work/WorkRequest;)Landroidx/work/Operation;
    .locals 1
    .param p1, "request"    # Landroidx/work/WorkRequest;

    const-string v0, "request"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 224
    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/work/WorkManager;->enqueue(Ljava/util/List;)Landroidx/work/Operation;

    move-result-object v0

    return-object v0
.end method

.method public abstract enqueue(Ljava/util/List;)Landroidx/work/Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroidx/work/WorkRequest;",
            ">;)",
            "Landroidx/work/Operation;"
        }
    .end annotation
.end method

.method public abstract enqueueUniquePeriodicWork(Ljava/lang/String;Landroidx/work/ExistingPeriodicWorkPolicy;Landroidx/work/PeriodicWorkRequest;)Landroidx/work/Operation;
.end method

.method public enqueueUniqueWork(Ljava/lang/String;Landroidx/work/ExistingWorkPolicy;Landroidx/work/OneTimeWorkRequest;)Landroidx/work/Operation;
    .locals 1
    .param p1, "uniqueWorkName"    # Ljava/lang/String;
    .param p2, "existingWorkPolicy"    # Landroidx/work/ExistingWorkPolicy;
    .param p3, "request"    # Landroidx/work/OneTimeWorkRequest;

    const-string/jumbo v0, "uniqueWorkName"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "existingWorkPolicy"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "request"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 351
    invoke-static {p3}, Lkotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Landroidx/work/WorkManager;->enqueueUniqueWork(Ljava/lang/String;Landroidx/work/ExistingWorkPolicy;Ljava/util/List;)Landroidx/work/Operation;

    move-result-object v0

    return-object v0
.end method

.method public abstract enqueueUniqueWork(Ljava/lang/String;Landroidx/work/ExistingWorkPolicy;Ljava/util/List;)Landroidx/work/Operation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroidx/work/ExistingWorkPolicy;",
            "Ljava/util/List<",
            "Landroidx/work/OneTimeWorkRequest;",
            ">;)",
            "Landroidx/work/Operation;"
        }
    .end annotation
.end method

.method public abstract getConfiguration()Landroidx/work/Configuration;
.end method

.method public abstract getLastCancelAllTimeMillis()Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getLastCancelAllTimeMillisLiveData()Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getWorkInfoById(Ljava/util/UUID;)Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/work/WorkInfo;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getWorkInfoByIdFlow(Ljava/util/UUID;)Lkotlinx/coroutines/flow/Flow;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            ")",
            "Lkotlinx/coroutines/flow/Flow<",
            "Landroidx/work/WorkInfo;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getWorkInfoByIdLiveData(Ljava/util/UUID;)Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            ")",
            "Landroidx/lifecycle/LiveData<",
            "Landroidx/work/WorkInfo;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getWorkInfos(Landroidx/work/WorkQuery;)Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/work/WorkQuery;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/util/List<",
            "Landroidx/work/WorkInfo;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract getWorkInfosByTag(Ljava/lang/String;)Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/util/List<",
            "Landroidx/work/WorkInfo;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract getWorkInfosByTagFlow(Ljava/lang/String;)Lkotlinx/coroutines/flow/Flow;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lkotlinx/coroutines/flow/Flow<",
            "Ljava/util/List<",
            "Landroidx/work/WorkInfo;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract getWorkInfosByTagLiveData(Ljava/lang/String;)Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Landroidx/work/WorkInfo;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract getWorkInfosFlow(Landroidx/work/WorkQuery;)Lkotlinx/coroutines/flow/Flow;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/work/WorkQuery;",
            ")",
            "Lkotlinx/coroutines/flow/Flow<",
            "Ljava/util/List<",
            "Landroidx/work/WorkInfo;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract getWorkInfosForUniqueWork(Ljava/lang/String;)Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Ljava/util/List<",
            "Landroidx/work/WorkInfo;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract getWorkInfosForUniqueWorkFlow(Ljava/lang/String;)Lkotlinx/coroutines/flow/Flow;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lkotlinx/coroutines/flow/Flow<",
            "Ljava/util/List<",
            "Landroidx/work/WorkInfo;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract getWorkInfosForUniqueWorkLiveData(Ljava/lang/String;)Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Landroidx/work/WorkInfo;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract getWorkInfosLiveData(Landroidx/work/WorkQuery;)Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/work/WorkQuery;",
            ")",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Landroidx/work/WorkInfo;",
            ">;>;"
        }
    .end annotation
.end method

.method public abstract pruneWork()Landroidx/work/Operation;
.end method

.method public abstract updateWork(Landroidx/work/WorkRequest;)Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/work/WorkRequest;",
            ")",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "Landroidx/work/WorkManager$UpdateResult;",
            ">;"
        }
    .end annotation
.end method
