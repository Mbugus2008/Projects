.class public final Landroidx/work/impl/constraints/trackers/NetworkStateTrackerKt;
.super Ljava/lang/Object;
.source "NetworkStateTracker.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00006\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a\u001e\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u00030\u000f2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u0013H\u0007\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\"\u001e\u0010\u0002\u001a\u00020\u0003*\u00020\u00048@X\u0080\u0004\u00a2\u0006\u000c\u0012\u0004\u0008\u0005\u0010\u0006\u001a\u0004\u0008\u0007\u0010\u0008\"\u0018\u0010\u0002\u001a\u00020\u0003*\u00020\t8AX\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0007\u0010\n\"\u0018\u0010\u000b\u001a\u00020\u000c*\u00020\u00048@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u000b\u0010\r\u00a8\u0006\u0014"
    }
    d2 = {
        "TAG",
        "",
        "activeNetworkState",
        "Landroidx/work/impl/constraints/NetworkState;",
        "Landroid/net/ConnectivityManager;",
        "getActiveNetworkState$annotations",
        "(Landroid/net/ConnectivityManager;)V",
        "getActiveNetworkState",
        "(Landroid/net/ConnectivityManager;)Landroidx/work/impl/constraints/NetworkState;",
        "Landroid/net/NetworkCapabilities;",
        "(Landroid/net/NetworkCapabilities;)Landroidx/work/impl/constraints/NetworkState;",
        "isActiveNetworkValidated",
        "",
        "(Landroid/net/ConnectivityManager;)Z",
        "NetworkStateTracker",
        "Landroidx/work/impl/constraints/trackers/ConstraintTracker;",
        "context",
        "Landroid/content/Context;",
        "taskExecutor",
        "Landroidx/work/impl/utils/taskexecutor/TaskExecutor;",
        "work-runtime_release"
    }
    k = 0x2
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 67
    const-string v0, "NetworkStateTracker"

    invoke-static {v0}, Landroidx/work/Logger;->tagWithPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "tagWithPrefix(\"NetworkStateTracker\")"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    sput-object v0, Landroidx/work/impl/constraints/trackers/NetworkStateTrackerKt;->TAG:Ljava/lang/String;

    return-void
.end method

.method public static final NetworkStateTracker(Landroid/content/Context;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;)Landroidx/work/impl/constraints/trackers/ConstraintTracker;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "taskExecutor"    # Landroidx/work/impl/utils/taskexecutor/TaskExecutor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroidx/work/impl/utils/taskexecutor/TaskExecutor;",
            ")",
            "Landroidx/work/impl/constraints/trackers/ConstraintTracker<",
            "Landroidx/work/impl/constraints/NetworkState;",
            ">;"
        }
    .end annotation

    const-string v0, "context"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "taskExecutor"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 60
    nop

    .line 61
    new-instance v0, Landroidx/work/impl/constraints/trackers/NetworkStateTracker24;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/constraints/trackers/NetworkStateTracker24;-><init>(Landroid/content/Context;Landroidx/work/impl/utils/taskexecutor/TaskExecutor;)V

    check-cast v0, Landroidx/work/impl/constraints/trackers/ConstraintTracker;

    .line 60
    return-object v0
.end method

.method public static final synthetic access$getTAG$p()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Landroidx/work/impl/constraints/trackers/NetworkStateTrackerKt;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public static final getActiveNetworkState(Landroid/net/ConnectivityManager;)Landroidx/work/impl/constraints/NetworkState;
    .locals 7
    .param p0, "$this$activeNetworkState"    # Landroid/net/ConnectivityManager;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 89
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 90
    .local v0, "info":Landroid/net/NetworkInfo;
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v3

    if-eqz v3, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    move v3, v2

    .line 91
    .local v3, "isConnected":Z
    :goto_0
    invoke-static {p0}, Landroidx/work/impl/constraints/trackers/NetworkStateTrackerKt;->isActiveNetworkValidated(Landroid/net/ConnectivityManager;)Z

    move-result v4

    .line 92
    .local v4, "isValidated":Z
    invoke-static {p0}, Landroidx/core/net/ConnectivityManagerCompat;->isActiveNetworkMetered(Landroid/net/ConnectivityManager;)Z

    move-result v5

    .line 93
    .local v5, "isMetered":Z
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/net/NetworkInfo;->isRoaming()Z

    move-result v6

    if-nez v6, :cond_1

    goto :goto_1

    :cond_1
    move v1, v2

    .line 94
    .local v1, "isNotRoaming":Z
    :goto_1
    new-instance v2, Landroidx/work/impl/constraints/NetworkState;

    invoke-direct {v2, v3, v4, v5, v1}, Landroidx/work/impl/constraints/NetworkState;-><init>(ZZZZ)V

    return-object v2
.end method

.method public static final getActiveNetworkState(Landroid/net/NetworkCapabilities;)Landroidx/work/impl/constraints/NetworkState;
    .locals 5
    .param p0, "$this$activeNetworkState"    # Landroid/net/NetworkCapabilities;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 100
    const/16 v0, 0xc

    invoke-virtual {p0, v0}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v0

    .line 101
    .local v0, "isConnected":Z
    const/16 v1, 0x10

    invoke-virtual {p0, v1}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v1

    .line 102
    .local v1, "isValidated":Z
    const/16 v2, 0xb

    invoke-virtual {p0, v2}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v2

    xor-int/lit8 v2, v2, 0x1

    .line 103
    .local v2, "isMetered":Z
    const/16 v3, 0x12

    invoke-virtual {p0, v3}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    move-result v3

    .line 104
    .local v3, "isNotRoaming":Z
    new-instance v4, Landroidx/work/impl/constraints/NetworkState;

    invoke-direct {v4, v0, v1, v2, v3}, Landroidx/work/impl/constraints/NetworkState;-><init>(ZZZZ)V

    return-object v4
.end method

.method public static synthetic getActiveNetworkState$annotations(Landroid/net/ConnectivityManager;)V
    .locals 0

    return-void
.end method

.method public static final isActiveNetworkValidated(Landroid/net/ConnectivityManager;)Z
    .locals 6
    .param p0, "$this$isActiveNetworkValidated"    # Landroid/net/ConnectivityManager;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 71
    nop

    .line 74
    nop

    .line 75
    const/4 v0, 0x0

    :try_start_0
    invoke-static {p0}, Landroidx/work/impl/utils/NetworkApi23;->getActiveNetworkCompat(Landroid/net/ConnectivityManager;)Landroid/net/Network;

    move-result-object v1

    .line 76
    .local v1, "network":Landroid/net/Network;
    invoke-static {p0, v1}, Landroidx/work/impl/utils/NetworkApi21;->getNetworkCapabilitiesCompat(Landroid/net/ConnectivityManager;Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v2

    .line 77
    .local v2, "capabilities":Landroid/net/NetworkCapabilities;
    if-eqz v2, :cond_0

    const/16 v3, 0x10

    invoke-static {v2, v3}, Landroidx/work/impl/utils/NetworkApi21;->hasCapabilityCompat(Landroid/net/NetworkCapabilities;I)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 78
    :cond_0
    nop

    .end local v1    # "network":Landroid/net/Network;
    .end local v2    # "capabilities":Landroid/net/NetworkCapabilities;
    :goto_0
    goto :goto_1

    .line 79
    :catch_0
    move-exception v1

    .line 81
    .local v1, "exception":Ljava/lang/SecurityException;
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v2

    sget-object v3, Landroidx/work/impl/constraints/trackers/NetworkStateTrackerKt;->TAG:Ljava/lang/String;

    const-string v4, "Unable to validate active network"

    move-object v5, v1

    check-cast v5, Ljava/lang/Throwable;

    invoke-virtual {v2, v3, v4, v5}, Landroidx/work/Logger;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 82
    nop

    .end local v1    # "exception":Ljava/lang/SecurityException;
    :goto_1
    nop

    .line 83
    return v0
.end method
