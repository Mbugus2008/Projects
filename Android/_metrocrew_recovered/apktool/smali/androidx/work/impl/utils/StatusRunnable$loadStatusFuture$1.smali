.class final Landroidx/work/impl/utils/StatusRunnable$loadStatusFuture$1;
.super Lkotlin/jvm/internal/Lambda;
.source "StatusRunnable.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/work/impl/utils/StatusRunnable;->loadStatusFuture(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;Lkotlin/jvm/functions/Function1;)Lcom/google/common/util/concurrent/ListenableFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "TT;>;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0004\n\u0002\u0008\u0004\u0010\u0000\u001a\u0002H\u0001\"\u0004\u0008\u0000\u0010\u0001H\n\u00a2\u0006\u0004\u0008\u0002\u0010\u0003"
    }
    d2 = {
        "<anonymous>",
        "T",
        "invoke",
        "()Ljava/lang/Object;"
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
.field final synthetic $block:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Landroidx/work/impl/WorkDatabase;",
            "TT;>;"
        }
    .end annotation
.end field

.field final synthetic $this_loadStatusFuture:Landroidx/work/impl/WorkDatabase;


# direct methods
.method constructor <init>(Lkotlin/jvm/functions/Function1;Landroidx/work/impl/WorkDatabase;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/work/impl/WorkDatabase;",
            "+TT;>;",
            "Landroidx/work/impl/WorkDatabase;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Landroidx/work/impl/utils/StatusRunnable$loadStatusFuture$1;->$block:Lkotlin/jvm/functions/Function1;

    iput-object p2, p0, Landroidx/work/impl/utils/StatusRunnable$loadStatusFuture$1;->$this_loadStatusFuture:Landroidx/work/impl/WorkDatabase;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 74
    iget-object v0, p0, Landroidx/work/impl/utils/StatusRunnable$loadStatusFuture$1;->$block:Lkotlin/jvm/functions/Function1;

    iget-object v1, p0, Landroidx/work/impl/utils/StatusRunnable$loadStatusFuture$1;->$this_loadStatusFuture:Landroidx/work/impl/WorkDatabase;

    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
