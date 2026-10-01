.class final Landroidx/work/impl/utils/CancelWorkRunnable$forId$1;
.super Lkotlin/jvm/internal/Lambda;
.source "CancelWorkRunnable.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/work/impl/utils/CancelWorkRunnable;->forId(Ljava/util/UUID;Landroidx/work/impl/WorkManagerImpl;)Landroidx/work/Operation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $id:Ljava/util/UUID;

.field final synthetic $workManagerImpl:Landroidx/work/impl/WorkManagerImpl;


# direct methods
.method public static synthetic $r8$lambda$c6ckNuSXH3At6SBb4mDMZynE_5I(Landroidx/work/impl/WorkManagerImpl;Ljava/util/UUID;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/work/impl/utils/CancelWorkRunnable$forId$1;->invoke$lambda$0(Landroidx/work/impl/WorkManagerImpl;Ljava/util/UUID;)V

    return-void
.end method

.method constructor <init>(Landroidx/work/impl/WorkManagerImpl;Ljava/util/UUID;)V
    .locals 1

    iput-object p1, p0, Landroidx/work/impl/utils/CancelWorkRunnable$forId$1;->$workManagerImpl:Landroidx/work/impl/WorkManagerImpl;

    iput-object p2, p0, Landroidx/work/impl/utils/CancelWorkRunnable$forId$1;->$id:Ljava/util/UUID;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method

.method private static final invoke$lambda$0(Landroidx/work/impl/WorkManagerImpl;Ljava/util/UUID;)V
    .locals 2
    .param p0, "$workManagerImpl"    # Landroidx/work/impl/WorkManagerImpl;
    .param p1, "$id"    # Ljava/util/UUID;

    .line 76
    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "id.toString()"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, v0}, Landroidx/work/impl/utils/CancelWorkRunnable;->access$cancel(Landroidx/work/impl/WorkManagerImpl;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 70
    invoke-virtual {p0}, Landroidx/work/impl/utils/CancelWorkRunnable$forId$1;->invoke()V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke()V
    .locals 4

    .line 75
    iget-object v0, p0, Landroidx/work/impl/utils/CancelWorkRunnable$forId$1;->$workManagerImpl:Landroidx/work/impl/WorkManagerImpl;

    invoke-virtual {v0}, Landroidx/work/impl/WorkManagerImpl;->getWorkDatabase()Landroidx/work/impl/WorkDatabase;

    move-result-object v0

    const-string/jumbo v1, "workManagerImpl.workDatabase"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 76
    .local v0, "workDatabase":Landroidx/work/impl/WorkDatabase;
    iget-object v1, p0, Landroidx/work/impl/utils/CancelWorkRunnable$forId$1;->$workManagerImpl:Landroidx/work/impl/WorkManagerImpl;

    iget-object v2, p0, Landroidx/work/impl/utils/CancelWorkRunnable$forId$1;->$id:Ljava/util/UUID;

    new-instance v3, Landroidx/work/impl/utils/CancelWorkRunnable$forId$1$$ExternalSyntheticLambda0;

    invoke-direct {v3, v1, v2}, Landroidx/work/impl/utils/CancelWorkRunnable$forId$1$$ExternalSyntheticLambda0;-><init>(Landroidx/work/impl/WorkManagerImpl;Ljava/util/UUID;)V

    invoke-virtual {v0, v3}, Landroidx/work/impl/WorkDatabase;->runInTransaction(Ljava/lang/Runnable;)V

    .line 77
    iget-object v1, p0, Landroidx/work/impl/utils/CancelWorkRunnable$forId$1;->$workManagerImpl:Landroidx/work/impl/WorkManagerImpl;

    invoke-static {v1}, Landroidx/work/impl/utils/CancelWorkRunnable;->access$reschedulePendingWorkers(Landroidx/work/impl/WorkManagerImpl;)V

    .line 78
    return-void
.end method
