.class public final Landroidx/work/impl/utils/NetworkRequestCompatKt;
.super Ljava/lang/Object;
.source "NetworkRequestCompat.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nNetworkRequestCompat.kt\nKotlin\n*S Kotlin\n*F\n+ 1 NetworkRequestCompat.kt\nandroidx/work/impl/utils/NetworkRequestCompatKt\n+ 2 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n*L\n1#1,177:1\n3819#2:178\n4337#2,2:179\n3819#2:181\n4337#2,2:182\n*S KotlinDebug\n*F\n+ 1 NetworkRequestCompat.kt\nandroidx/work/impl/utils/NetworkRequestCompatKt\n*L\n54#1:178\n54#1:179,2\n96#1:181\n96#1:182,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0010\u0015\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\"\u0015\u0010\u0002\u001a\u00020\u0001*\u00020\u00038G\u00a2\u0006\u0006\u001a\u0004\u0008\u0004\u0010\u0005\"\u0015\u0010\u0006\u001a\u00020\u0001*\u00020\u00038G\u00a2\u0006\u0006\u001a\u0004\u0008\u0007\u0010\u0005\u00a8\u0006\u0008"
    }
    d2 = {
        "defaultCapabilities",
        "",
        "capabilitiesCompat",
        "Landroid/net/NetworkRequest;",
        "getCapabilitiesCompat",
        "(Landroid/net/NetworkRequest;)[I",
        "transportTypesCompat",
        "getTransportTypesCompat",
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
.field private static final defaultCapabilities:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 103
    nop

    .line 104
    nop

    .line 105
    nop

    .line 104
    nop

    .line 106
    const/16 v0, 0xe

    const/16 v1, 0xd

    const/16 v2, 0xf

    filled-new-array {v1, v2, v0}, [I

    move-result-object v0

    .line 104
    nop

    .line 103
    sput-object v0, Landroidx/work/impl/utils/NetworkRequestCompatKt;->defaultCapabilities:[I

    return-void
.end method

.method public static final synthetic access$getDefaultCapabilities$p()[I
    .locals 1

    .line 1
    sget-object v0, Landroidx/work/impl/utils/NetworkRequestCompatKt;->defaultCapabilities:[I

    return-object v0
.end method

.method public static final getCapabilitiesCompat(Landroid/net/NetworkRequest;)[I
    .locals 11
    .param p0, "$this$capabilitiesCompat"    # Landroid/net/NetworkRequest;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 61
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_0

    .line 62
    sget-object v0, Landroidx/work/impl/utils/NetworkRequest31;->INSTANCE:Landroidx/work/impl/utils/NetworkRequest31;

    invoke-virtual {v0, p0}, Landroidx/work/impl/utils/NetworkRequest31;->capabilities(Landroid/net/NetworkRequest;)[I

    move-result-object v0

    goto :goto_1

    .line 65
    :cond_0
    nop

    .line 66
    nop

    .line 65
    nop

    .line 67
    nop

    .line 65
    nop

    .line 68
    nop

    .line 65
    nop

    .line 69
    nop

    .line 65
    nop

    .line 70
    nop

    .line 65
    nop

    .line 71
    nop

    .line 65
    nop

    .line 72
    nop

    .line 65
    nop

    .line 73
    nop

    .line 65
    nop

    .line 74
    nop

    .line 65
    nop

    .line 75
    nop

    .line 65
    nop

    .line 76
    nop

    .line 65
    nop

    .line 77
    nop

    .line 65
    nop

    .line 78
    nop

    .line 65
    nop

    .line 79
    nop

    .line 65
    nop

    .line 80
    nop

    .line 65
    nop

    .line 81
    nop

    .line 65
    nop

    .line 82
    nop

    .line 65
    nop

    .line 83
    nop

    .line 65
    nop

    .line 84
    nop

    .line 65
    nop

    .line 85
    nop

    .line 65
    nop

    .line 86
    nop

    .line 65
    nop

    .line 87
    nop

    .line 65
    nop

    .line 88
    nop

    .line 65
    nop

    .line 89
    nop

    .line 65
    nop

    .line 90
    nop

    .line 65
    nop

    .line 91
    nop

    .line 65
    nop

    .line 92
    nop

    .line 65
    nop

    .line 93
    nop

    .line 65
    nop

    .line 94
    const/16 v0, 0x1e

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 65
    nop

    .line 96
    nop

    .local v0, "$this$filter$iv":[I
    const/4 v1, 0x0

    .line 181
    .local v1, "$i$f$filter":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    check-cast v2, Ljava/util/Collection;

    .local v2, "destination$iv$iv":Ljava/util/Collection;
    move-object v3, v0

    .local v3, "$this$filterTo$iv$iv":[I
    const/4 v4, 0x0

    .line 182
    .local v4, "$i$f$filterTo":I
    array-length v5, v3

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v5, :cond_2

    aget v7, v3, v6

    .local v7, "element$iv$iv":I
    move v8, v7

    .local v8, "it":I
    const/4 v9, 0x0

    .line 96
    .local v9, "$i$a$-filter-NetworkRequestCompatKt$capabilitiesCompat$1":I
    sget-object v10, Landroidx/work/impl/utils/NetworkRequest28;->INSTANCE:Landroidx/work/impl/utils/NetworkRequest28;

    invoke-virtual {v10, p0, v8}, Landroidx/work/impl/utils/NetworkRequest28;->hasCapability$work_runtime_release(Landroid/net/NetworkRequest;I)Z

    move-result v8

    .line 182
    .end local v8    # "it":I
    .end local v9    # "$i$a$-filter-NetworkRequestCompatKt$capabilitiesCompat$1":I
    if-eqz v8, :cond_1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v2, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .end local v7    # "element$iv$iv":I
    :cond_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 183
    :cond_2
    nop

    .end local v2    # "destination$iv$iv":Ljava/util/Collection;
    .end local v3    # "$this$filterTo$iv$iv":[I
    .end local v4    # "$i$f$filterTo":I
    check-cast v2, Ljava/util/List;

    .line 181
    nop

    .end local v0    # "$this$filter$iv":[I
    .end local v1    # "$i$f$filter":I
    check-cast v2, Ljava/util/Collection;

    .line 97
    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->toIntArray(Ljava/util/Collection;)[I

    move-result-object v0

    .line 98
    :goto_1
    return-object v0

    nop

    :array_0
    .array-data 4
        0x11
        0x5
        0x2
        0xa
        0x1d
        0x13
        0x3
        0x20
        0x7
        0x4
        0xc
        0x24
        0x17
        0x0
        0x21
        0x14
        0xb
        0xd
        0x12
        0x15
        0xf
        0x23
        0x22
        0x8
        0x1
        0x19
        0xe
        0x10
        0x6
        0x9
    .end array-data
.end method

.method public static final getTransportTypesCompat(Landroid/net/NetworkRequest;)[I
    .locals 11
    .param p0, "$this$transportTypesCompat"    # Landroid/net/NetworkRequest;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 39
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_0

    .line 40
    sget-object v0, Landroidx/work/impl/utils/NetworkRequest31;->INSTANCE:Landroidx/work/impl/utils/NetworkRequest31;

    invoke-virtual {v0, p0}, Landroidx/work/impl/utils/NetworkRequest31;->transportTypes(Landroid/net/NetworkRequest;)[I

    move-result-object v0

    goto :goto_1

    .line 43
    :cond_0
    nop

    .line 44
    nop

    .line 43
    nop

    .line 45
    nop

    .line 43
    nop

    .line 46
    nop

    .line 43
    nop

    .line 47
    nop

    .line 43
    nop

    .line 48
    nop

    .line 43
    nop

    .line 49
    nop

    .line 43
    nop

    .line 50
    nop

    .line 43
    nop

    .line 51
    nop

    .line 43
    nop

    .line 52
    const/16 v0, 0xa

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    .line 43
    nop

    .line 54
    nop

    .local v0, "$this$filter$iv":[I
    const/4 v1, 0x0

    .line 178
    .local v1, "$i$f$filter":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    check-cast v2, Ljava/util/Collection;

    .local v2, "destination$iv$iv":Ljava/util/Collection;
    move-object v3, v0

    .local v3, "$this$filterTo$iv$iv":[I
    const/4 v4, 0x0

    .line 179
    .local v4, "$i$f$filterTo":I
    array-length v5, v3

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v5, :cond_2

    aget v7, v3, v6

    .local v7, "element$iv$iv":I
    move v8, v7

    .local v8, "it":I
    const/4 v9, 0x0

    .line 54
    .local v9, "$i$a$-filter-NetworkRequestCompatKt$transportTypesCompat$1":I
    sget-object v10, Landroidx/work/impl/utils/NetworkRequest28;->INSTANCE:Landroidx/work/impl/utils/NetworkRequest28;

    invoke-virtual {v10, p0, v8}, Landroidx/work/impl/utils/NetworkRequest28;->hasTransport$work_runtime_release(Landroid/net/NetworkRequest;I)Z

    move-result v8

    .line 179
    .end local v8    # "it":I
    .end local v9    # "$i$a$-filter-NetworkRequestCompatKt$transportTypesCompat$1":I
    if-eqz v8, :cond_1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {v2, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .end local v7    # "element$iv$iv":I
    :cond_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 180
    :cond_2
    nop

    .end local v2    # "destination$iv$iv":Ljava/util/Collection;
    .end local v3    # "$this$filterTo$iv$iv":[I
    .end local v4    # "$i$f$filterTo":I
    check-cast v2, Ljava/util/List;

    .line 178
    nop

    .end local v0    # "$this$filter$iv":[I
    .end local v1    # "$i$f$filter":I
    check-cast v2, Ljava/util/Collection;

    .line 55
    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->toIntArray(Ljava/util/Collection;)[I

    move-result-object v0

    .line 56
    :goto_1
    return-object v0

    nop

    :array_0
    .array-data 4
        0x2
        0x0
        0x3
        0x6
        0xa
        0x9
        0x8
        0x4
        0x1
        0x5
    .end array-data
.end method
