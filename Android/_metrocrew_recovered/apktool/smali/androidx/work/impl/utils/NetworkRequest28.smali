.class public final Landroidx/work/impl/utils/NetworkRequest28;
.super Ljava/lang/Object;
.source "NetworkRequestCompat.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nNetworkRequestCompat.kt\nKotlin\n*S Kotlin\n*F\n+ 1 NetworkRequestCompat.kt\nandroidx/work/impl/utils/NetworkRequest28\n+ 2 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n*L\n1#1,177:1\n13600#2,2:178\n13600#2,2:180\n13600#2,2:182\n*S KotlinDebug\n*F\n+ 1 NetworkRequestCompat.kt\nandroidx/work/impl/utils/NetworkRequest28\n*L\n120#1:178,2\n137#1:180,2\n154#1:182,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0015\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0005\u0008\u00c7\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0018\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0006H\u0007J\u001d\u0010\u0008\u001a\u00020\t2\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0006H\u0000\u00a2\u0006\u0002\u0008\nJ\u001d\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u00042\u0006\u0010\u000e\u001a\u00020\u000fH\u0000\u00a2\u0006\u0002\u0008\u0010J\u001d\u0010\u0011\u001a\u00020\u000c2\u0006\u0010\r\u001a\u00020\u00042\u0006\u0010\u0012\u001a\u00020\u000fH\u0000\u00a2\u0006\u0002\u0008\u0013\u00a8\u0006\u0014"
    }
    d2 = {
        "Landroidx/work/impl/utils/NetworkRequest28;",
        "",
        "()V",
        "createNetworkRequest",
        "Landroid/net/NetworkRequest;",
        "capabilities",
        "",
        "transports",
        "createNetworkRequestCompat",
        "Landroidx/work/impl/utils/NetworkRequestCompat;",
        "createNetworkRequestCompat$work_runtime_release",
        "hasCapability",
        "",
        "request",
        "capability",
        "",
        "hasCapability$work_runtime_release",
        "hasTransport",
        "transport",
        "hasTransport$work_runtime_release",
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
.field public static final INSTANCE:Landroidx/work/impl/utils/NetworkRequest28;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroidx/work/impl/utils/NetworkRequest28;

    invoke-direct {v0}, Landroidx/work/impl/utils/NetworkRequest28;-><init>()V

    sput-object v0, Landroidx/work/impl/utils/NetworkRequest28;->INSTANCE:Landroidx/work/impl/utils/NetworkRequest28;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final createNetworkRequest([I[I)Landroid/net/NetworkRequest;
    .locals 16
    .param p0, "capabilities"    # [I
    .param p1, "transports"    # [I
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    move-object/from16 v1, p0

    const-string v0, "capabilities"

    invoke-static {v1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "transports"

    move-object/from16 v2, p1

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 119
    new-instance v0, Landroid/net/NetworkRequest$Builder;

    invoke-direct {v0}, Landroid/net/NetworkRequest$Builder;-><init>()V

    move-object v3, v0

    .line 120
    .local v3, "networkRequest":Landroid/net/NetworkRequest$Builder;
    move-object/from16 v4, p0

    .local v4, "$this$forEach$iv":[I
    const/4 v5, 0x0

    .line 178
    .local v5, "$i$f$forEach":I
    array-length v6, v4

    const/4 v8, 0x0

    :goto_0
    const/16 v9, 0x27

    if-ge v8, v6, :cond_0

    aget v10, v4, v8

    .local v10, "element$iv":I
    move v11, v10

    .local v11, "it":I
    const/4 v12, 0x0

    .line 121
    .local v12, "$i$a$-forEach-NetworkRequest28$createNetworkRequest$1":I
    nop

    .line 122
    :try_start_0
    invoke-virtual {v3, v11}, Landroid/net/NetworkRequest$Builder;->addCapability(I)Landroid/net/NetworkRequest$Builder;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 123
    :catch_0
    move-exception v0

    .line 129
    .local v0, "ex":Ljava/lang/IllegalArgumentException;
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v13

    .line 130
    sget-object v14, Landroidx/work/impl/utils/NetworkRequestCompat;->Companion:Landroidx/work/impl/utils/NetworkRequestCompat$Companion;

    invoke-virtual {v14}, Landroidx/work/impl/utils/NetworkRequestCompat$Companion;->getTAG()Ljava/lang/String;

    move-result-object v14

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Ignoring adding capability \'"

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object v9, v0

    check-cast v9, Ljava/lang/Throwable;

    invoke-virtual {v13, v14, v7, v9}, Landroidx/work/Logger;->warning(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 132
    .end local v0    # "ex":Ljava/lang/IllegalArgumentException;
    :goto_1
    nop

    .line 178
    .end local v11    # "it":I
    .end local v12    # "$i$a$-forEach-NetworkRequest28$createNetworkRequest$1":I
    nop

    .end local v10    # "element$iv":I
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 179
    :cond_0
    nop

    .line 137
    .end local v4    # "$this$forEach$iv":[I
    .end local v5    # "$i$f$forEach":I
    invoke-static {}, Landroidx/work/impl/utils/NetworkRequestCompatKt;->access$getDefaultCapabilities$p()[I

    move-result-object v4

    .restart local v4    # "$this$forEach$iv":[I
    const/4 v5, 0x0

    .line 180
    .restart local v5    # "$i$f$forEach":I
    array-length v6, v4

    const/4 v7, 0x0

    :goto_2
    if-ge v7, v6, :cond_2

    aget v8, v4, v7

    .local v8, "element$iv":I
    move v10, v8

    .local v10, "it":I
    const/4 v11, 0x0

    .line 138
    .local v11, "$i$a$-forEach-NetworkRequest28$createNetworkRequest$2":I
    invoke-static {v1, v10}, Lkotlin/collections/ArraysKt;->contains([II)Z

    move-result v0

    if-nez v0, :cond_1

    .line 139
    nop

    .line 140
    :try_start_1
    invoke-virtual {v3, v10}, Landroid/net/NetworkRequest$Builder;->removeCapability(I)Landroid/net/NetworkRequest$Builder;
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_3

    .line 141
    :catch_1
    move-exception v0

    .line 144
    .restart local v0    # "ex":Ljava/lang/IllegalArgumentException;
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v12

    .line 146
    sget-object v13, Landroidx/work/impl/utils/NetworkRequestCompat;->Companion:Landroidx/work/impl/utils/NetworkRequestCompat$Companion;

    invoke-virtual {v13}, Landroidx/work/impl/utils/NetworkRequestCompat$Companion;->getTAG()Ljava/lang/String;

    move-result-object v13

    .line 147
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Ignoring removing default capability \'"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    .line 148
    move-object v15, v0

    check-cast v15, Ljava/lang/Throwable;

    .line 145
    invoke-virtual {v12, v13, v14, v15}, Landroidx/work/Logger;->warning(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 152
    .end local v0    # "ex":Ljava/lang/IllegalArgumentException;
    :cond_1
    :goto_3
    nop

    .line 180
    .end local v10    # "it":I
    .end local v11    # "$i$a$-forEach-NetworkRequest28$createNetworkRequest$2":I
    nop

    .end local v8    # "element$iv":I
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 181
    :cond_2
    nop

    .line 154
    .end local v4    # "$this$forEach$iv":[I
    .end local v5    # "$i$f$forEach":I
    move-object/from16 v0, p1

    .local v0, "$this$forEach$iv":[I
    const/4 v4, 0x0

    .line 182
    .local v4, "$i$f$forEach":I
    array-length v5, v0

    const/4 v7, 0x0

    :goto_4
    if-ge v7, v5, :cond_3

    aget v6, v0, v7

    .local v6, "element$iv":I
    move v8, v6

    .local v8, "it":I
    const/4 v9, 0x0

    .line 154
    .local v9, "$i$a$-forEach-NetworkRequest28$createNetworkRequest$3":I
    invoke-virtual {v3, v8}, Landroid/net/NetworkRequest$Builder;->addTransportType(I)Landroid/net/NetworkRequest$Builder;

    .line 182
    .end local v8    # "it":I
    .end local v9    # "$i$a$-forEach-NetworkRequest28$createNetworkRequest$3":I
    nop

    .end local v6    # "element$iv":I
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 183
    :cond_3
    nop

    .line 155
    .end local v0    # "$this$forEach$iv":[I
    .end local v4    # "$i$f$forEach":I
    invoke-virtual {v3}, Landroid/net/NetworkRequest$Builder;->build()Landroid/net/NetworkRequest;

    move-result-object v0

    const-string v4, "networkRequest.build()"

    invoke-static {v0, v4}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public final createNetworkRequestCompat$work_runtime_release([I[I)Landroidx/work/impl/utils/NetworkRequestCompat;
    .locals 2
    .param p1, "capabilities"    # [I
    .param p2, "transports"    # [I

    const-string v0, "capabilities"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string/jumbo v0, "transports"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 162
    new-instance v0, Landroidx/work/impl/utils/NetworkRequestCompat;

    invoke-static {p1, p2}, Landroidx/work/impl/utils/NetworkRequest28;->createNetworkRequest([I[I)Landroid/net/NetworkRequest;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/work/impl/utils/NetworkRequestCompat;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method public final hasCapability$work_runtime_release(Landroid/net/NetworkRequest;I)Z
    .locals 1
    .param p1, "request"    # Landroid/net/NetworkRequest;
    .param p2, "capability"    # I

    const-string v0, "request"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 112
    invoke-virtual {p1, p2}, Landroid/net/NetworkRequest;->hasCapability(I)Z

    move-result v0

    return v0
.end method

.method public final hasTransport$work_runtime_release(Landroid/net/NetworkRequest;I)Z
    .locals 1
    .param p1, "request"    # Landroid/net/NetworkRequest;
    .param p2, "transport"    # I

    const-string v0, "request"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 115
    invoke-virtual {p1, p2}, Landroid/net/NetworkRequest;->hasTransport(I)Z

    move-result v0

    return v0
.end method
