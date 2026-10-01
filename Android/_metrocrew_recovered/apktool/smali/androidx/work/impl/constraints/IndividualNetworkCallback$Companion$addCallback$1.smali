.class final Landroidx/work/impl/constraints/IndividualNetworkCallback$Companion$addCallback$1;
.super Lkotlin/jvm/internal/Lambda;
.source "WorkConstraintsTracker.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/work/impl/constraints/IndividualNetworkCallback$Companion;->addCallback(Landroid/net/ConnectivityManager;Landroid/net/NetworkRequest;Lkotlin/jvm/functions/Function1;)Lkotlin/jvm/functions/Function0;
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
.field final synthetic $callbackRegistered:Lkotlin/jvm/internal/Ref$BooleanRef;

.field final synthetic $connManager:Landroid/net/ConnectivityManager;

.field final synthetic $networkCallback:Landroidx/work/impl/constraints/IndividualNetworkCallback;


# direct methods
.method constructor <init>(Lkotlin/jvm/internal/Ref$BooleanRef;Landroid/net/ConnectivityManager;Landroidx/work/impl/constraints/IndividualNetworkCallback;)V
    .locals 1

    iput-object p1, p0, Landroidx/work/impl/constraints/IndividualNetworkCallback$Companion$addCallback$1;->$callbackRegistered:Lkotlin/jvm/internal/Ref$BooleanRef;

    iput-object p2, p0, Landroidx/work/impl/constraints/IndividualNetworkCallback$Companion$addCallback$1;->$connManager:Landroid/net/ConnectivityManager;

    iput-object p3, p0, Landroidx/work/impl/constraints/IndividualNetworkCallback$Companion$addCallback$1;->$networkCallback:Landroidx/work/impl/constraints/IndividualNetworkCallback;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 246
    invoke-virtual {p0}, Landroidx/work/impl/constraints/IndividualNetworkCallback$Companion$addCallback$1;->invoke()V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke()V
    .locals 3

    .line 247
    iget-object v0, p0, Landroidx/work/impl/constraints/IndividualNetworkCallback$Companion$addCallback$1;->$callbackRegistered:Lkotlin/jvm/internal/Ref$BooleanRef;

    iget-boolean v0, v0, Lkotlin/jvm/internal/Ref$BooleanRef;->element:Z

    if-eqz v0, :cond_0

    .line 248
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v0

    .line 249
    invoke-static {}, Landroidx/work/impl/constraints/WorkConstraintsTrackerKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v1

    const-string v2, "NetworkRequestConstraintController unregister callback"

    invoke-virtual {v0, v1, v2}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    iget-object v0, p0, Landroidx/work/impl/constraints/IndividualNetworkCallback$Companion$addCallback$1;->$connManager:Landroid/net/ConnectivityManager;

    iget-object v1, p0, Landroidx/work/impl/constraints/IndividualNetworkCallback$Companion$addCallback$1;->$networkCallback:Landroidx/work/impl/constraints/IndividualNetworkCallback;

    check-cast v1, Landroid/net/ConnectivityManager$NetworkCallback;

    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    .line 252
    :cond_0
    return-void
.end method
