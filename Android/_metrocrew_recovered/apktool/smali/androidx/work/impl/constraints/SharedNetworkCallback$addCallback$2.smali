.class final Landroidx/work/impl/constraints/SharedNetworkCallback$addCallback$2;
.super Lkotlin/jvm/internal/Lambda;
.source "WorkConstraintsTracker.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/work/impl/constraints/SharedNetworkCallback;->addCallback(Landroid/net/ConnectivityManager;Landroid/net/NetworkRequest;Lkotlin/jvm/functions/Function1;)Lkotlin/jvm/functions/Function0;
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
.field final synthetic $connManager:Landroid/net/ConnectivityManager;

.field final synthetic $onConstraintState:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Landroidx/work/impl/constraints/ConstraintsState;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Landroidx/work/impl/constraints/SharedNetworkCallback;


# direct methods
.method constructor <init>(Lkotlin/jvm/functions/Function1;Landroid/net/ConnectivityManager;Landroidx/work/impl/constraints/SharedNetworkCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/work/impl/constraints/ConstraintsState;",
            "Lkotlin/Unit;",
            ">;",
            "Landroid/net/ConnectivityManager;",
            "Landroidx/work/impl/constraints/SharedNetworkCallback;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Landroidx/work/impl/constraints/SharedNetworkCallback$addCallback$2;->$onConstraintState:Lkotlin/jvm/functions/Function1;

    iput-object p2, p0, Landroidx/work/impl/constraints/SharedNetworkCallback$addCallback$2;->$connManager:Landroid/net/ConnectivityManager;

    iput-object p3, p0, Landroidx/work/impl/constraints/SharedNetworkCallback$addCallback$2;->this$0:Landroidx/work/impl/constraints/SharedNetworkCallback;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 320
    invoke-virtual {p0}, Landroidx/work/impl/constraints/SharedNetworkCallback$addCallback$2;->invoke()V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke()V
    .locals 7

    .line 321
    invoke-static {}, Landroidx/work/impl/constraints/SharedNetworkCallback;->access$getRequestsLock$p()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Landroidx/work/impl/constraints/SharedNetworkCallback$addCallback$2;->$onConstraintState:Lkotlin/jvm/functions/Function1;

    iget-object v2, p0, Landroidx/work/impl/constraints/SharedNetworkCallback$addCallback$2;->$connManager:Landroid/net/ConnectivityManager;

    iget-object v3, p0, Landroidx/work/impl/constraints/SharedNetworkCallback$addCallback$2;->this$0:Landroidx/work/impl/constraints/SharedNetworkCallback;

    monitor-enter v0

    const/4 v4, 0x0

    .line 322
    .local v4, "$i$a$-synchronized-SharedNetworkCallback$addCallback$2$1":I
    :try_start_0
    invoke-static {}, Landroidx/work/impl/constraints/SharedNetworkCallback;->access$getRequests$p()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    invoke-static {}, Landroidx/work/impl/constraints/SharedNetworkCallback;->access$getRequests$p()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 324
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v1

    .line 325
    invoke-static {}, Landroidx/work/impl/constraints/WorkConstraintsTrackerKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v5

    const-string v6, "NetworkRequestConstraintController unregister shared callback"

    invoke-virtual {v1, v5, v6}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 326
    check-cast v3, Landroid/net/ConnectivityManager$NetworkCallback;

    invoke-virtual {v2, v3}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    .line 327
    sget-object v1, Landroidx/work/impl/constraints/SharedNetworkCallback;->INSTANCE:Landroidx/work/impl/constraints/SharedNetworkCallback;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroidx/work/impl/constraints/SharedNetworkCallback;->setCachedCapabilities(Landroid/net/NetworkCapabilities;)V

    .line 328
    sget-object v1, Landroidx/work/impl/constraints/SharedNetworkCallback;->INSTANCE:Landroidx/work/impl/constraints/SharedNetworkCallback;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroidx/work/impl/constraints/SharedNetworkCallback;->setCapabilitiesInitialized(Z)V

    .line 330
    :cond_0
    nop

    .end local v4    # "$i$a$-synchronized-SharedNetworkCallback$addCallback$2$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 321
    monitor-exit v0

    .line 331
    return-void

    .line 321
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method
