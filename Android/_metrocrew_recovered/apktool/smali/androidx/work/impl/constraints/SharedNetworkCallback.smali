.class final Landroidx/work/impl/constraints/SharedNetworkCallback;
.super Landroid/net/ConnectivityManager$NetworkCallback;
.source "WorkConstraintsTracker.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nWorkConstraintsTracker.kt\nKotlin\n*S Kotlin\n*F\n+ 1 WorkConstraintsTracker.kt\nandroidx/work/impl/constraints/SharedNetworkCallback\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,344:1\n1855#2,2:345\n1855#2,2:347\n*S KotlinDebug\n*F\n+ 1 WorkConstraintsTracker.kt\nandroidx/work/impl/constraints/SharedNetworkCallback\n*L\n275#1:345,2\n291#1:347,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000R\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u00c3\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J4\u0010\u0018\u001a\u0008\u0012\u0004\u0012\u00020\u00130\u00192\u0006\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\u001c\u001a\u00020\u00152\u0016\u0010\u001d\u001a\u0012\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u00130\u0011j\u0002`\u0014J\u0018\u0010\u001e\u001a\u00020\u00132\u0006\u0010\u001f\u001a\u00020 2\u0006\u0010!\u001a\u00020\u0004H\u0016J\u0010\u0010\"\u001a\u00020\u00132\u0006\u0010\u001f\u001a\u00020 H\u0016J\u000c\u0010#\u001a\u0004\u0018\u00010\u0004*\u00020\u001bR \u0010\u0003\u001a\u0004\u0018\u00010\u00048\u0006@\u0006X\u0087\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0005\u0010\u0006\"\u0004\u0008\u0007\u0010\u0008R\u001e\u0010\t\u001a\u00020\n8\u0006@\u0006X\u0087\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000b\u0010\u000c\"\u0004\u0008\r\u0010\u000eR,\u0010\u000f\u001a\u001e\u0012\u0014\u0012\u0012\u0012\u0004\u0012\u00020\u0012\u0012\u0004\u0012\u00020\u00130\u0011j\u0002`\u0014\u0012\u0004\u0012\u00020\u00150\u00108\u0002X\u0083\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0017X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006$"
    }
    d2 = {
        "Landroidx/work/impl/constraints/SharedNetworkCallback;",
        "Landroid/net/ConnectivityManager$NetworkCallback;",
        "()V",
        "cachedCapabilities",
        "Landroid/net/NetworkCapabilities;",
        "getCachedCapabilities",
        "()Landroid/net/NetworkCapabilities;",
        "setCachedCapabilities",
        "(Landroid/net/NetworkCapabilities;)V",
        "capabilitiesInitialized",
        "",
        "getCapabilitiesInitialized",
        "()Z",
        "setCapabilitiesInitialized",
        "(Z)V",
        "requests",
        "",
        "Lkotlin/Function1;",
        "Landroidx/work/impl/constraints/ConstraintsState;",
        "",
        "Landroidx/work/impl/constraints/OnConstraintState;",
        "Landroid/net/NetworkRequest;",
        "requestsLock",
        "",
        "addCallback",
        "Lkotlin/Function0;",
        "connManager",
        "Landroid/net/ConnectivityManager;",
        "networkRequest",
        "onConstraintState",
        "onCapabilitiesChanged",
        "network",
        "Landroid/net/Network;",
        "networkCapabilities",
        "onLost",
        "getCurrentNetworkCapabilities",
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
.field public static final INSTANCE:Landroidx/work/impl/constraints/SharedNetworkCallback;

.field private static cachedCapabilities:Landroid/net/NetworkCapabilities;

.field private static capabilitiesInitialized:Z

.field private static final requests:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lkotlin/jvm/functions/Function1<",
            "Landroidx/work/impl/constraints/ConstraintsState;",
            "Lkotlin/Unit;",
            ">;",
            "Landroid/net/NetworkRequest;",
            ">;"
        }
    .end annotation
.end field

.field private static final requestsLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroidx/work/impl/constraints/SharedNetworkCallback;

    invoke-direct {v0}, Landroidx/work/impl/constraints/SharedNetworkCallback;-><init>()V

    sput-object v0, Landroidx/work/impl/constraints/SharedNetworkCallback;->INSTANCE:Landroidx/work/impl/constraints/SharedNetworkCallback;

    .line 265
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroidx/work/impl/constraints/SharedNetworkCallback;->requestsLock:Ljava/lang/Object;

    .line 267
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    check-cast v0, Ljava/util/Map;

    sput-object v0, Landroidx/work/impl/constraints/SharedNetworkCallback;->requests:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 263
    invoke-direct {p0}, Landroid/net/ConnectivityManager$NetworkCallback;-><init>()V

    .line 262
    return-void
.end method

.method public static final synthetic access$getRequests$p()Ljava/util/Map;
    .locals 1

    .line 262
    sget-object v0, Landroidx/work/impl/constraints/SharedNetworkCallback;->requests:Ljava/util/Map;

    return-object v0
.end method

.method public static final synthetic access$getRequestsLock$p()Ljava/lang/Object;
    .locals 1

    .line 262
    sget-object v0, Landroidx/work/impl/constraints/SharedNetworkCallback;->requestsLock:Ljava/lang/Object;

    return-object v0
.end method


# virtual methods
.method public final addCallback(Landroid/net/ConnectivityManager;Landroid/net/NetworkRequest;Lkotlin/jvm/functions/Function1;)Lkotlin/jvm/functions/Function0;
    .locals 6
    .param p1, "connManager"    # Landroid/net/ConnectivityManager;
    .param p2, "networkRequest"    # Landroid/net/NetworkRequest;
    .param p3, "onConstraintState"    # Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/ConnectivityManager;",
            "Landroid/net/NetworkRequest;",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/work/impl/constraints/ConstraintsState;",
            "Lkotlin/Unit;",
            ">;)",
            "Lkotlin/jvm/functions/Function0<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    const-string v0, "connManager"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "networkRequest"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "onConstraintState"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 300
    sget-object v0, Landroidx/work/impl/constraints/SharedNetworkCallback;->requestsLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    .line 301
    .local v1, "$i$a$-synchronized-SharedNetworkCallback$addCallback$1":I
    :try_start_0
    sget-object v2, Landroidx/work/impl/constraints/SharedNetworkCallback;->requests:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    .line 302
    .local v2, "registerCallback":Z
    sget-object v3, Landroidx/work/impl/constraints/SharedNetworkCallback;->requests:Ljava/util/Map;

    invoke-interface {v3, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    if-eqz v2, :cond_0

    .line 304
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v3

    .line 305
    invoke-static {}, Landroidx/work/impl/constraints/WorkConstraintsTrackerKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v4

    const-string v5, "NetworkRequestConstraintController register shared callback"

    invoke-virtual {v3, v4, v5}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 306
    move-object v3, p0

    check-cast v3, Landroid/net/ConnectivityManager$NetworkCallback;

    invoke-virtual {p1, v3}, Landroid/net/ConnectivityManager;->registerDefaultNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    .line 310
    :cond_0
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v3

    invoke-static {}, Landroidx/work/impl/constraints/WorkConstraintsTrackerKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v4

    const-string v5, "NetworkRequestConstraintController send initial capabilities"

    invoke-virtual {v3, v4, v5}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 311
    sget-object v3, Landroidx/work/impl/constraints/SharedNetworkCallback;->INSTANCE:Landroidx/work/impl/constraints/SharedNetworkCallback;

    invoke-virtual {v3, p1}, Landroidx/work/impl/constraints/SharedNetworkCallback;->getCurrentNetworkCapabilities(Landroid/net/ConnectivityManager;)Landroid/net/NetworkCapabilities;

    move-result-object v3

    .line 312
    .local v3, "currentCapabilities":Landroid/net/NetworkCapabilities;
    nop

    .line 313
    invoke-virtual {p2, v3}, Landroid/net/NetworkRequest;->canBeSatisfiedBy(Landroid/net/NetworkCapabilities;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 314
    sget-object v4, Landroidx/work/impl/constraints/ConstraintsState$ConstraintsMet;->INSTANCE:Landroidx/work/impl/constraints/ConstraintsState$ConstraintsMet;

    check-cast v4, Landroidx/work/impl/constraints/ConstraintsState;

    goto :goto_0

    .line 316
    :cond_1
    new-instance v4, Landroidx/work/impl/constraints/ConstraintsState$ConstraintsNotMet;

    const/4 v5, 0x7

    invoke-direct {v4, v5}, Landroidx/work/impl/constraints/ConstraintsState$ConstraintsNotMet;-><init>(I)V

    check-cast v4, Landroidx/work/impl/constraints/ConstraintsState;

    .line 312
    :goto_0
    invoke-interface {p3, v4}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    nop

    .end local v1    # "$i$a$-synchronized-SharedNetworkCallback$addCallback$1":I
    .end local v2    # "registerCallback":Z
    .end local v3    # "currentCapabilities":Landroid/net/NetworkCapabilities;
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 300
    monitor-exit v0

    .line 320
    new-instance v0, Landroidx/work/impl/constraints/SharedNetworkCallback$addCallback$2;

    invoke-direct {v0, p3, p1, p0}, Landroidx/work/impl/constraints/SharedNetworkCallback$addCallback$2;-><init>(Lkotlin/jvm/functions/Function1;Landroid/net/ConnectivityManager;Landroidx/work/impl/constraints/SharedNetworkCallback;)V

    check-cast v0, Lkotlin/jvm/functions/Function0;

    return-object v0

    .line 300
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public final getCachedCapabilities()Landroid/net/NetworkCapabilities;
    .locals 1

    .line 268
    sget-object v0, Landroidx/work/impl/constraints/SharedNetworkCallback;->cachedCapabilities:Landroid/net/NetworkCapabilities;

    return-object v0
.end method

.method public final getCapabilitiesInitialized()Z
    .locals 1

    .line 269
    sget-boolean v0, Landroidx/work/impl/constraints/SharedNetworkCallback;->capabilitiesInitialized:Z

    return v0
.end method

.method public final getCurrentNetworkCapabilities(Landroid/net/ConnectivityManager;)Landroid/net/NetworkCapabilities;
    .locals 1
    .param p1, "$this$getCurrentNetworkCapabilities"    # Landroid/net/ConnectivityManager;

    const-string v0, "<this>"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 336
    sget-boolean v0, Landroidx/work/impl/constraints/SharedNetworkCallback;->capabilitiesInitialized:Z

    if-eqz v0, :cond_0

    .line 337
    sget-object v0, Landroidx/work/impl/constraints/SharedNetworkCallback;->cachedCapabilities:Landroid/net/NetworkCapabilities;

    return-object v0

    .line 339
    :cond_0
    invoke-virtual {p1}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v0

    sput-object v0, Landroidx/work/impl/constraints/SharedNetworkCallback;->cachedCapabilities:Landroid/net/NetworkCapabilities;

    .line 340
    const/4 v0, 0x1

    sput-boolean v0, Landroidx/work/impl/constraints/SharedNetworkCallback;->capabilitiesInitialized:Z

    .line 341
    sget-object v0, Landroidx/work/impl/constraints/SharedNetworkCallback;->cachedCapabilities:Landroid/net/NetworkCapabilities;

    return-object v0
.end method

.method public onCapabilitiesChanged(Landroid/net/Network;Landroid/net/NetworkCapabilities;)V
    .locals 11
    .param p1, "network"    # Landroid/net/Network;
    .param p2, "networkCapabilities"    # Landroid/net/NetworkCapabilities;

    const-string v0, "network"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "networkCapabilities"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 272
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v0

    invoke-static {}, Landroidx/work/impl/constraints/WorkConstraintsTrackerKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v1

    const-string v2, "NetworkRequestConstraintController onCapabilitiesChanged callback"

    invoke-virtual {v0, v1, v2}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 273
    sget-object v0, Landroidx/work/impl/constraints/SharedNetworkCallback;->requestsLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    .line 274
    .local v1, "$i$a$-synchronized-SharedNetworkCallback$onCapabilitiesChanged$1":I
    :try_start_0
    sput-object p2, Landroidx/work/impl/constraints/SharedNetworkCallback;->cachedCapabilities:Landroid/net/NetworkCapabilities;

    .line 275
    sget-object v2, Landroidx/work/impl/constraints/SharedNetworkCallback;->requests:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    .local v2, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v3, 0x0

    .line 345
    .local v3, "$i$f$forEach":I
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .local v5, "element$iv":Ljava/lang/Object;
    move-object v6, v5

    check-cast v6, Ljava/util/Map$Entry;

    const/4 v7, 0x0

    .line 275
    .local v7, "$i$a$-forEach-SharedNetworkCallback$onCapabilitiesChanged$1$1":I
    invoke-interface {v6}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lkotlin/jvm/functions/Function1;

    .local v8, "onConstraintState":Lkotlin/jvm/functions/Function1;
    invoke-interface {v6}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/net/NetworkRequest;

    .line 276
    .local v6, "request":Landroid/net/NetworkRequest;
    nop

    .line 277
    invoke-virtual {v6, p2}, Landroid/net/NetworkRequest;->canBeSatisfiedBy(Landroid/net/NetworkCapabilities;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 278
    sget-object v9, Landroidx/work/impl/constraints/ConstraintsState$ConstraintsMet;->INSTANCE:Landroidx/work/impl/constraints/ConstraintsState$ConstraintsMet;

    check-cast v9, Landroidx/work/impl/constraints/ConstraintsState;

    goto :goto_1

    .line 280
    :cond_0
    new-instance v9, Landroidx/work/impl/constraints/ConstraintsState$ConstraintsNotMet;

    const/4 v10, 0x7

    invoke-direct {v9, v10}, Landroidx/work/impl/constraints/ConstraintsState$ConstraintsNotMet;-><init>(I)V

    check-cast v9, Landroidx/work/impl/constraints/ConstraintsState;

    .line 276
    :goto_1
    invoke-interface {v8, v9}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    nop

    .line 345
    .end local v6    # "request":Landroid/net/NetworkRequest;
    .end local v7    # "$i$a$-forEach-SharedNetworkCallback$onCapabilitiesChanged$1$1":I
    .end local v8    # "onConstraintState":Lkotlin/jvm/functions/Function1;
    nop

    .end local v5    # "element$iv":Ljava/lang/Object;
    goto :goto_0

    .line 346
    :cond_1
    nop

    .line 284
    .end local v2    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v3    # "$i$f$forEach":I
    nop

    .end local v1    # "$i$a$-synchronized-SharedNetworkCallback$onCapabilitiesChanged$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 273
    monitor-exit v0

    .line 285
    return-void

    .line 273
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public onLost(Landroid/net/Network;)V
    .locals 10
    .param p1, "network"    # Landroid/net/Network;

    const-string v0, "network"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 288
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v0

    invoke-static {}, Landroidx/work/impl/constraints/WorkConstraintsTrackerKt;->access$getTAG$p()Ljava/lang/String;

    move-result-object v1

    const-string v2, "NetworkRequestConstraintController onLost callback"

    invoke-virtual {v0, v1, v2}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 289
    sget-object v0, Landroidx/work/impl/constraints/SharedNetworkCallback;->requestsLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    .line 290
    .local v1, "$i$a$-synchronized-SharedNetworkCallback$onLost$1":I
    const/4 v2, 0x0

    :try_start_0
    sput-object v2, Landroidx/work/impl/constraints/SharedNetworkCallback;->cachedCapabilities:Landroid/net/NetworkCapabilities;

    .line 291
    sget-object v2, Landroidx/work/impl/constraints/SharedNetworkCallback;->requests:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    .local v2, "$this$forEach$iv":Ljava/lang/Iterable;
    const/4 v3, 0x0

    .line 347
    .local v3, "$i$f$forEach":I
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .local v5, "element$iv":Ljava/lang/Object;
    move-object v6, v5

    check-cast v6, Lkotlin/jvm/functions/Function1;

    .local v6, "it":Lkotlin/jvm/functions/Function1;
    const/4 v7, 0x0

    .line 291
    .local v7, "$i$a$-forEach-SharedNetworkCallback$onLost$1$1":I
    new-instance v8, Landroidx/work/impl/constraints/ConstraintsState$ConstraintsNotMet;

    const/4 v9, 0x7

    invoke-direct {v8, v9}, Landroidx/work/impl/constraints/ConstraintsState$ConstraintsNotMet;-><init>(I)V

    invoke-interface {v6, v8}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    nop

    .end local v5    # "element$iv":Ljava/lang/Object;
    .end local v6    # "it":Lkotlin/jvm/functions/Function1;
    .end local v7    # "$i$a$-forEach-SharedNetworkCallback$onLost$1$1":I
    goto :goto_0

    .line 348
    :cond_0
    nop

    .line 292
    .end local v2    # "$this$forEach$iv":Ljava/lang/Iterable;
    .end local v3    # "$i$f$forEach":I
    nop

    .end local v1    # "$i$a$-synchronized-SharedNetworkCallback$onLost$1":I
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 289
    monitor-exit v0

    .line 293
    return-void

    .line 289
    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public final setCachedCapabilities(Landroid/net/NetworkCapabilities;)V
    .locals 0
    .param p1, "<set-?>"    # Landroid/net/NetworkCapabilities;

    .line 268
    sput-object p1, Landroidx/work/impl/constraints/SharedNetworkCallback;->cachedCapabilities:Landroid/net/NetworkCapabilities;

    return-void
.end method

.method public final setCapabilitiesInitialized(Z)V
    .locals 0
    .param p1, "<set-?>"    # Z

    .line 269
    sput-boolean p1, Landroidx/work/impl/constraints/SharedNetworkCallback;->capabilitiesInitialized:Z

    return-void
.end method
