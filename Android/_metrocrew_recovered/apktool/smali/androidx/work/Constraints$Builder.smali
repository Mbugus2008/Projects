.class public final Landroidx/work/Constraints$Builder;
.super Ljava/lang/Object;
.source "Constraints.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/work/Constraints;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000X\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010#\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u0007\u0008\u0016\u00a2\u0006\u0002\u0010\u0002B\u000f\u0008\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0002\u0010\u0005J\u0018\u0010\u0015\u001a\u00020\u00002\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u000eH\u0007J\u0006\u0010\u0019\u001a\u00020\u0004J\u0018\u0010\u001a\u001a\u00020\u00002\u0006\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u000cH\u0007J\u000e\u0010\u001e\u001a\u00020\u00002\u0006\u0010\u001d\u001a\u00020\u000cJ\u000e\u0010\u001f\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u000eJ\u000e\u0010 \u001a\u00020\u00002\u0006\u0010\u000f\u001a\u00020\u000eJ\u0010\u0010!\u001a\u00020\u00002\u0006\u0010\u0010\u001a\u00020\u000eH\u0007J\u000e\u0010\"\u001a\u00020\u00002\u0006\u0010\u0011\u001a\u00020\u000eJ\u0010\u0010#\u001a\u00020\u00002\u0006\u0010$\u001a\u00020%H\u0007J\u0018\u0010#\u001a\u00020\u00002\u0006\u0010$\u001a\u00020\u00132\u0006\u0010&\u001a\u00020\'H\u0007J\u0010\u0010(\u001a\u00020\u00002\u0006\u0010$\u001a\u00020%H\u0007J\u0018\u0010(\u001a\u00020\u00002\u0006\u0010$\u001a\u00020\u00132\u0006\u0010&\u001a\u00020\'H\u0007R\u0014\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0013X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006)"
    }
    d2 = {
        "Landroidx/work/Constraints$Builder;",
        "",
        "()V",
        "constraints",
        "Landroidx/work/Constraints;",
        "(Landroidx/work/Constraints;)V",
        "contentUriTriggers",
        "",
        "Landroidx/work/Constraints$ContentUriTrigger;",
        "requiredNetworkRequest",
        "Landroidx/work/impl/utils/NetworkRequestCompat;",
        "requiredNetworkType",
        "Landroidx/work/NetworkType;",
        "requiresBatteryNotLow",
        "",
        "requiresCharging",
        "requiresDeviceIdle",
        "requiresStorageNotLow",
        "triggerContentMaxDelay",
        "",
        "triggerContentUpdateDelay",
        "addContentUriTrigger",
        "uri",
        "Landroid/net/Uri;",
        "triggerForDescendants",
        "build",
        "setRequiredNetworkRequest",
        "networkRequest",
        "Landroid/net/NetworkRequest;",
        "networkType",
        "setRequiredNetworkType",
        "setRequiresBatteryNotLow",
        "setRequiresCharging",
        "setRequiresDeviceIdle",
        "setRequiresStorageNotLow",
        "setTriggerContentMaxDelay",
        "duration",
        "Ljava/time/Duration;",
        "timeUnit",
        "Ljava/util/concurrent/TimeUnit;",
        "setTriggerContentUpdateDelay",
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


# instance fields
.field private contentUriTriggers:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Landroidx/work/Constraints$ContentUriTrigger;",
            ">;"
        }
    .end annotation
.end field

.field private requiredNetworkRequest:Landroidx/work/impl/utils/NetworkRequestCompat;

.field private requiredNetworkType:Landroidx/work/NetworkType;

.field private requiresBatteryNotLow:Z

.field private requiresCharging:Z

.field private requiresDeviceIdle:Z

.field private requiresStorageNotLow:Z

.field private triggerContentMaxDelay:J

.field private triggerContentUpdateDelay:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 335
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 325
    new-instance v0, Landroidx/work/impl/utils/NetworkRequestCompat;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v1}, Landroidx/work/impl/utils/NetworkRequestCompat;-><init>(Ljava/lang/Object;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    iput-object v0, p0, Landroidx/work/Constraints$Builder;->requiredNetworkRequest:Landroidx/work/impl/utils/NetworkRequestCompat;

    .line 326
    sget-object v0, Landroidx/work/NetworkType;->NOT_REQUIRED:Landroidx/work/NetworkType;

    iput-object v0, p0, Landroidx/work/Constraints$Builder;->requiredNetworkType:Landroidx/work/NetworkType;

    .line 331
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Landroidx/work/Constraints$Builder;->triggerContentUpdateDelay:J

    .line 332
    iput-wide v0, p0, Landroidx/work/Constraints$Builder;->triggerContentMaxDelay:J

    .line 333
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v0, Ljava/util/Set;

    iput-object v0, p0, Landroidx/work/Constraints$Builder;->contentUriTriggers:Ljava/util/Set;

    .line 337
    return-void
.end method

.method public constructor <init>(Landroidx/work/Constraints;)V
    .locals 3
    .param p1, "constraints"    # Landroidx/work/Constraints;

    const-string v0, "constraints"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 341
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 325
    new-instance v0, Landroidx/work/impl/utils/NetworkRequestCompat;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v1}, Landroidx/work/impl/utils/NetworkRequestCompat;-><init>(Ljava/lang/Object;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    iput-object v0, p0, Landroidx/work/Constraints$Builder;->requiredNetworkRequest:Landroidx/work/impl/utils/NetworkRequestCompat;

    .line 326
    sget-object v0, Landroidx/work/NetworkType;->NOT_REQUIRED:Landroidx/work/NetworkType;

    iput-object v0, p0, Landroidx/work/Constraints$Builder;->requiredNetworkType:Landroidx/work/NetworkType;

    .line 331
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Landroidx/work/Constraints$Builder;->triggerContentUpdateDelay:J

    .line 332
    iput-wide v0, p0, Landroidx/work/Constraints$Builder;->triggerContentMaxDelay:J

    .line 333
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v0, Ljava/util/Set;

    iput-object v0, p0, Landroidx/work/Constraints$Builder;->contentUriTriggers:Ljava/util/Set;

    .line 342
    invoke-virtual {p1}, Landroidx/work/Constraints;->requiresCharging()Z

    move-result v0

    iput-boolean v0, p0, Landroidx/work/Constraints$Builder;->requiresCharging:Z

    .line 343
    invoke-virtual {p1}, Landroidx/work/Constraints;->requiresDeviceIdle()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    iput-boolean v2, p0, Landroidx/work/Constraints$Builder;->requiresDeviceIdle:Z

    .line 344
    invoke-virtual {p1}, Landroidx/work/Constraints;->getRequiredNetworkType()Landroidx/work/NetworkType;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/Constraints$Builder;->requiredNetworkType:Landroidx/work/NetworkType;

    .line 345
    invoke-virtual {p1}, Landroidx/work/Constraints;->requiresBatteryNotLow()Z

    move-result v0

    iput-boolean v0, p0, Landroidx/work/Constraints$Builder;->requiresBatteryNotLow:Z

    .line 346
    invoke-virtual {p1}, Landroidx/work/Constraints;->requiresStorageNotLow()Z

    move-result v0

    iput-boolean v0, p0, Landroidx/work/Constraints$Builder;->requiresStorageNotLow:Z

    .line 347
    nop

    .line 348
    invoke-virtual {p1}, Landroidx/work/Constraints;->getContentTriggerUpdateDelayMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/work/Constraints$Builder;->triggerContentUpdateDelay:J

    .line 349
    invoke-virtual {p1}, Landroidx/work/Constraints;->getContentTriggerMaxDelayMillis()J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/work/Constraints$Builder;->triggerContentMaxDelay:J

    .line 350
    invoke-virtual {p1}, Landroidx/work/Constraints;->getContentUriTriggers()Ljava/util/Set;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->toMutableSet(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Landroidx/work/Constraints$Builder;->contentUriTriggers:Ljava/util/Set;

    .line 352
    return-void
.end method


# virtual methods
.method public final addContentUriTrigger(Landroid/net/Uri;Z)Landroidx/work/Constraints$Builder;
    .locals 2
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "triggerForDescendants"    # Z

    const-string/jumbo v0, "uri"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 465
    iget-object v0, p0, Landroidx/work/Constraints$Builder;->contentUriTriggers:Ljava/util/Set;

    new-instance v1, Landroidx/work/Constraints$ContentUriTrigger;

    invoke-direct {v1, p1, p2}, Landroidx/work/Constraints$ContentUriTrigger;-><init>(Landroid/net/Uri;Z)V

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 466
    return-object p0
.end method

.method public final build()Landroidx/work/Constraints;
    .locals 19

    .line 539
    move-object/from16 v0, p0

    const/4 v1, 0x0

    .line 540
    .local v1, "contentUriTriggers":Ljava/util/Set;
    const-wide/16 v2, 0x0

    .line 541
    .local v2, "triggerContentUpdateDelay":J
    const-wide/16 v4, 0x0

    .line 542
    .local v4, "triggerMaxContentDelay":J
    nop

    .line 543
    iget-object v6, v0, Landroidx/work/Constraints$Builder;->contentUriTriggers:Ljava/util/Set;

    check-cast v6, Ljava/lang/Iterable;

    invoke-static {v6}, Lkotlin/collections/CollectionsKt;->toSet(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object v18

    .line 544
    .end local v1    # "contentUriTriggers":Ljava/util/Set;
    .local v18, "contentUriTriggers":Ljava/util/Set;
    iget-wide v14, v0, Landroidx/work/Constraints$Builder;->triggerContentUpdateDelay:J

    .line 545
    .end local v2    # "triggerContentUpdateDelay":J
    .local v14, "triggerContentUpdateDelay":J
    iget-wide v1, v0, Landroidx/work/Constraints$Builder;->triggerContentMaxDelay:J

    .line 554
    .end local v4    # "triggerMaxContentDelay":J
    .local v1, "triggerMaxContentDelay":J
    iget-object v8, v0, Landroidx/work/Constraints$Builder;->requiredNetworkRequest:Landroidx/work/impl/utils/NetworkRequestCompat;

    .line 555
    iget-object v9, v0, Landroidx/work/Constraints$Builder;->requiredNetworkType:Landroidx/work/NetworkType;

    .line 556
    iget-boolean v10, v0, Landroidx/work/Constraints$Builder;->requiresCharging:Z

    .line 557
    iget-boolean v3, v0, Landroidx/work/Constraints$Builder;->requiresDeviceIdle:Z

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    move v11, v3

    .line 558
    iget-boolean v12, v0, Landroidx/work/Constraints$Builder;->requiresBatteryNotLow:Z

    .line 559
    iget-boolean v13, v0, Landroidx/work/Constraints$Builder;->requiresStorageNotLow:Z

    .line 553
    new-instance v7, Landroidx/work/Constraints;

    .line 554
    nop

    .line 555
    nop

    .line 556
    nop

    .line 557
    nop

    .line 558
    nop

    .line 559
    nop

    .line 561
    nop

    .line 560
    nop

    .line 562
    nop

    .line 553
    move-wide/from16 v16, v1

    .end local v1    # "triggerMaxContentDelay":J
    .local v16, "triggerMaxContentDelay":J
    invoke-direct/range {v7 .. v18}, Landroidx/work/Constraints;-><init>(Landroidx/work/impl/utils/NetworkRequestCompat;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    return-object v7
.end method

.method public final setRequiredNetworkRequest(Landroid/net/NetworkRequest;Landroidx/work/NetworkType;)Landroidx/work/Constraints$Builder;
    .locals 2
    .param p1, "networkRequest"    # Landroid/net/NetworkRequest;
    .param p2, "networkType"    # Landroidx/work/NetworkType;

    const-string v0, "networkRequest"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "networkType"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 410
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_2

    .line 411
    nop

    .line 412
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    if-lt v0, v1, :cond_1

    .line 413
    sget-object v0, Landroidx/work/impl/utils/NetworkRequest30;->INSTANCE:Landroidx/work/impl/utils/NetworkRequest30;

    invoke-virtual {v0, p1}, Landroidx/work/impl/utils/NetworkRequest30;->getNetworkSpecifier(Landroid/net/NetworkRequest;)Landroid/net/NetworkSpecifier;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 415
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 416
    nop

    .line 415
    const-string v1, "NetworkRequests with NetworkSpecifiers set aren\'t supported."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 419
    :cond_1
    :goto_0
    new-instance v0, Landroidx/work/impl/utils/NetworkRequestCompat;

    invoke-direct {v0, p1}, Landroidx/work/impl/utils/NetworkRequestCompat;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/work/Constraints$Builder;->requiredNetworkRequest:Landroidx/work/impl/utils/NetworkRequestCompat;

    .line 420
    sget-object v0, Landroidx/work/NetworkType;->NOT_REQUIRED:Landroidx/work/NetworkType;

    iput-object v0, p0, Landroidx/work/Constraints$Builder;->requiredNetworkType:Landroidx/work/NetworkType;

    goto :goto_1

    .line 422
    :cond_2
    iput-object p2, p0, Landroidx/work/Constraints$Builder;->requiredNetworkType:Landroidx/work/NetworkType;

    .line 424
    :goto_1
    return-object p0
.end method

.method public final setRequiredNetworkType(Landroidx/work/NetworkType;)Landroidx/work/Constraints$Builder;
    .locals 3
    .param p1, "networkType"    # Landroidx/work/NetworkType;

    const-string v0, "networkType"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 387
    iput-object p1, p0, Landroidx/work/Constraints$Builder;->requiredNetworkType:Landroidx/work/NetworkType;

    .line 388
    new-instance v0, Landroidx/work/impl/utils/NetworkRequestCompat;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, v1}, Landroidx/work/impl/utils/NetworkRequestCompat;-><init>(Ljava/lang/Object;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    iput-object v0, p0, Landroidx/work/Constraints$Builder;->requiredNetworkRequest:Landroidx/work/impl/utils/NetworkRequestCompat;

    .line 389
    return-object p0
.end method

.method public final setRequiresBatteryNotLow(Z)Landroidx/work/Constraints$Builder;
    .locals 0
    .param p1, "requiresBatteryNotLow"    # Z

    .line 436
    iput-boolean p1, p0, Landroidx/work/Constraints$Builder;->requiresBatteryNotLow:Z

    .line 437
    return-object p0
.end method

.method public final setRequiresCharging(Z)Landroidx/work/Constraints$Builder;
    .locals 0
    .param p1, "requiresCharging"    # Z

    .line 362
    iput-boolean p1, p0, Landroidx/work/Constraints$Builder;->requiresCharging:Z

    .line 363
    return-object p0
.end method

.method public final setRequiresDeviceIdle(Z)Landroidx/work/Constraints$Builder;
    .locals 0
    .param p1, "requiresDeviceIdle"    # Z

    .line 375
    iput-boolean p1, p0, Landroidx/work/Constraints$Builder;->requiresDeviceIdle:Z

    .line 376
    return-object p0
.end method

.method public final setRequiresStorageNotLow(Z)Landroidx/work/Constraints$Builder;
    .locals 0
    .param p1, "requiresStorageNotLow"    # Z

    .line 449
    iput-boolean p1, p0, Landroidx/work/Constraints$Builder;->requiresStorageNotLow:Z

    .line 450
    return-object p0
.end method

.method public final setTriggerContentMaxDelay(JLjava/util/concurrent/TimeUnit;)Landroidx/work/Constraints$Builder;
    .locals 2
    .param p1, "duration"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    const-string/jumbo v0, "timeUnit"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 514
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/work/Constraints$Builder;->triggerContentMaxDelay:J

    .line 515
    return-object p0
.end method

.method public final setTriggerContentMaxDelay(Ljava/time/Duration;)Landroidx/work/Constraints$Builder;
    .locals 2
    .param p1, "duration"    # Ljava/time/Duration;

    const-string v0, "duration"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 529
    invoke-static {p1}, Landroidx/work/impl/utils/DurationApi26Impl;->toMillisCompat(Ljava/time/Duration;)J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/work/Constraints$Builder;->triggerContentMaxDelay:J

    .line 530
    return-object p0
.end method

.method public final setTriggerContentUpdateDelay(JLjava/util/concurrent/TimeUnit;)Landroidx/work/Constraints$Builder;
    .locals 2
    .param p1, "duration"    # J
    .param p3, "timeUnit"    # Ljava/util/concurrent/TimeUnit;

    const-string/jumbo v0, "timeUnit"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 482
    invoke-virtual {p3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/work/Constraints$Builder;->triggerContentUpdateDelay:J

    .line 483
    return-object p0
.end method

.method public final setTriggerContentUpdateDelay(Ljava/time/Duration;)Landroidx/work/Constraints$Builder;
    .locals 2
    .param p1, "duration"    # Ljava/time/Duration;

    const-string v0, "duration"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 498
    invoke-static {p1}, Landroidx/work/impl/utils/DurationApi26Impl;->toMillisCompat(Ljava/time/Duration;)J

    move-result-wide v0

    iput-wide v0, p0, Landroidx/work/Constraints$Builder;->triggerContentUpdateDelay:J

    .line 499
    return-object p0
.end method
