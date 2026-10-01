.class final Landroidx/work/impl/utils/StatusRunnable$forWorkQuerySpec$1;
.super Lkotlin/jvm/internal/Lambda;
.source "StatusRunnable.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/work/impl/utils/StatusRunnable;->forWorkQuerySpec(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Landroidx/work/WorkQuery;)Lcom/google/common/util/concurrent/ListenableFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function1<",
        "Landroidx/work/impl/WorkDatabase;",
        "Ljava/util/List<",
        "+",
        "Landroidx/work/WorkInfo;",
        ">;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u00012\u0006\u0010\u0003\u001a\u00020\u0004H\n\u00a2\u0006\u0002\u0008\u0005"
    }
    d2 = {
        "<anonymous>",
        "",
        "Landroidx/work/WorkInfo;",
        "db",
        "Landroidx/work/impl/WorkDatabase;",
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
.field final synthetic $querySpec:Landroidx/work/WorkQuery;


# direct methods
.method constructor <init>(Landroidx/work/WorkQuery;)V
    .locals 1

    iput-object p1, p0, Landroidx/work/impl/utils/StatusRunnable$forWorkQuerySpec$1;->$querySpec:Landroidx/work/WorkQuery;

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "p1"    # Ljava/lang/Object;

    .line 65
    move-object v0, p1

    check-cast v0, Landroidx/work/impl/WorkDatabase;

    invoke-virtual {p0, v0}, Landroidx/work/impl/utils/StatusRunnable$forWorkQuerySpec$1;->invoke(Landroidx/work/impl/WorkDatabase;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public final invoke(Landroidx/work/impl/WorkDatabase;)Ljava/util/List;
    .locals 3
    .param p1, "db"    # Landroidx/work/impl/WorkDatabase;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/work/impl/WorkDatabase;",
            ")",
            "Ljava/util/List<",
            "Landroidx/work/WorkInfo;",
            ">;"
        }
    .end annotation

    const-string v0, "db"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 66
    sget-object v0, Landroidx/work/impl/model/WorkSpec;->WORK_INFO_MAPPER:Landroidx/arch/core/util/Function;

    invoke-virtual {p1}, Landroidx/work/impl/WorkDatabase;->rawWorkInfoDao()Landroidx/work/impl/model/RawWorkInfoDao;

    move-result-object v1

    iget-object v2, p0, Landroidx/work/impl/utils/StatusRunnable$forWorkQuerySpec$1;->$querySpec:Landroidx/work/WorkQuery;

    invoke-static {v2}, Landroidx/work/impl/utils/RawQueries;->toRawQuery(Landroidx/work/WorkQuery;)Landroidx/sqlite/db/SupportSQLiteQuery;

    move-result-object v2

    invoke-interface {v1, v2}, Landroidx/work/impl/model/RawWorkInfoDao;->getWorkInfoPojos(Landroidx/sqlite/db/SupportSQLiteQuery;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Landroidx/arch/core/util/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "WORK_INFO_MAPPER.apply(d\u2026(querySpec.toRawQuery()))"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast v0, Ljava/util/List;

    return-object v0
.end method
