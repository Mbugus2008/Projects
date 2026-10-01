.class public final Landroidx/room/ObservedTableStates;
.super Ljava/lang/Object;
.source "InvalidationTracker.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/room/ObservedTableStates$ObserveOp;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nInvalidationTracker.kt\nKotlin\n*S Kotlin\n*F\n+ 1 InvalidationTracker.kt\nandroidx/room/ObservedTableStates\n+ 2 ReentrantLock.kt\nandroidx/room/concurrent/ReentrantLockKt\n+ 3 _Arrays.kt\nkotlin/collections/ArraysKt___ArraysKt\n*L\n1#1,622:1\n28#2,5:623\n28#2,3:628\n32#2:633\n28#2,3:634\n32#2:639\n28#2,5:640\n28#2,5:645\n13493#3,2:631\n13493#3,2:637\n*S KotlinDebug\n*F\n+ 1 InvalidationTracker.kt\nandroidx/room/ObservedTableStates\n*L\n516#1:623,5\n545#1:628,3\n545#1:633\n563#1:634,3\n563#1:639\n577#1:640,5\n583#1:645,5\n547#1:631,2\n565#1:637,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0016\n\u0000\n\u0002\u0010\u0018\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0015\n\u0002\u0008\t\u0008\u0000\u0018\u00002\u00020\u0001:\u0001!B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J+\u0010\u0010\u001a\u00020\u00112\u0018\u0010\u0012\u001a\u0014\u0012\n\u0012\u0008\u0012\u0004\u0012\u00020\u00150\u0014\u0012\u0004\u0012\u00020\u00110\u0013H\u0080\u0008\u00f8\u0001\u0000\u00a2\u0006\u0002\u0008\u0016J\u0015\u0010\u0017\u001a\u00020\u000f2\u0006\u0010\u0018\u001a\u00020\u0019H\u0000\u00a2\u0006\u0002\u0008\u001aJ\u0015\u0010\u001b\u001a\u00020\u000f2\u0006\u0010\u0018\u001a\u00020\u0019H\u0000\u00a2\u0006\u0002\u0008\u001cJ\r\u0010\u001d\u001a\u00020\u0011H\u0000\u00a2\u0006\u0002\u0008\u001eJ\r\u0010\u001f\u001a\u00020\u0011H\u0000\u00a2\u0006\u0002\u0008 R\u0014\u0010\u0006\u001a\u00060\u0007j\u0002`\u0008X\u0082\u0004\u00a2\u0006\u0004\n\u0002\u0010\tR\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u0082\u0002\u0007\n\u0005\u0008\u009920\u0001\u00a8\u0006\""
    }
    d2 = {
        "Landroidx/room/ObservedTableStates;",
        "",
        "size",
        "",
        "<init>",
        "(I)V",
        "lock",
        "Ljava/util/concurrent/locks/ReentrantLock;",
        "Landroidx/room/concurrent/ReentrantLock;",
        "Ljava/util/concurrent/locks/ReentrantLock;",
        "tableObserversCount",
        "",
        "tableObservedState",
        "",
        "needsSync",
        "",
        "onSync",
        "",
        "action",
        "Lkotlin/Function1;",
        "",
        "Landroidx/room/ObservedTableStates$ObserveOp;",
        "onSync$room_runtime",
        "onObserverAdded",
        "tableIds",
        "",
        "onObserverAdded$room_runtime",
        "onObserverRemoved",
        "onObserverRemoved$room_runtime",
        "resetTriggerState",
        "resetTriggerState$room_runtime",
        "forceNeedSync",
        "forceNeedSync$room_runtime",
        "ObserveOp",
        "room-runtime"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final lock:Ljava/util/concurrent/locks/ReentrantLock;

.field private volatile needsSync:Z

.field private final tableObservedState:[Z

.field private final tableObserversCount:[J


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "size"    # I

    .line 493
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 495
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Landroidx/room/ObservedTableStates;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 498
    new-array v0, p1, [J

    iput-object v0, p0, Landroidx/room/ObservedTableStates;->tableObserversCount:[J

    .line 502
    new-array v0, p1, [Z

    iput-object v0, p0, Landroidx/room/ObservedTableStates;->tableObservedState:[Z

    .line 493
    return-void
.end method

.method public static final synthetic access$getLock$p(Landroidx/room/ObservedTableStates;)Ljava/util/concurrent/locks/ReentrantLock;
    .locals 1
    .param p0, "$this"    # Landroidx/room/ObservedTableStates;

    .line 493
    iget-object v0, p0, Landroidx/room/ObservedTableStates;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    return-object v0
.end method

.method public static final synthetic access$getNeedsSync$p(Landroidx/room/ObservedTableStates;)Z
    .locals 1
    .param p0, "$this"    # Landroidx/room/ObservedTableStates;

    .line 493
    iget-boolean v0, p0, Landroidx/room/ObservedTableStates;->needsSync:Z

    return v0
.end method

.method public static final synthetic access$getTableObservedState$p(Landroidx/room/ObservedTableStates;)[Z
    .locals 1
    .param p0, "$this"    # Landroidx/room/ObservedTableStates;

    .line 493
    iget-object v0, p0, Landroidx/room/ObservedTableStates;->tableObservedState:[Z

    return-object v0
.end method

.method public static final synthetic access$getTableObserversCount$p(Landroidx/room/ObservedTableStates;)[J
    .locals 1
    .param p0, "$this"    # Landroidx/room/ObservedTableStates;

    .line 493
    iget-object v0, p0, Landroidx/room/ObservedTableStates;->tableObserversCount:[J

    return-object v0
.end method

.method public static final synthetic access$setNeedsSync$p(Landroidx/room/ObservedTableStates;Z)V
    .locals 0
    .param p0, "$this"    # Landroidx/room/ObservedTableStates;
    .param p1, "<set-?>"    # Z

    .line 493
    iput-boolean p1, p0, Landroidx/room/ObservedTableStates;->needsSync:Z

    return-void
.end method


# virtual methods
.method public final forceNeedSync$room_runtime()V
    .locals 4

    .line 583
    iget-object v0, p0, Landroidx/room/ObservedTableStates;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .local v0, "$this$withLock$iv":Ljava/util/concurrent/locks/ReentrantLock;
    const/4 v1, 0x0

    .line 645
    .local v1, "$i$f$withLock":I
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 646
    nop

    .line 647
    const/4 v2, 0x0

    .line 583
    .local v2, "$i$a$-withLock-ObservedTableStates$forceNeedSync$1":I
    const/4 v3, 0x1

    :try_start_0
    iput-boolean v3, p0, Landroidx/room/ObservedTableStates;->needsSync:Z

    .end local v2    # "$i$a$-withLock-ObservedTableStates$forceNeedSync$1":I
    sget-object v2, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 647
    nop

    .line 649
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 647
    nop

    .line 584
    .end local v0    # "$this$withLock$iv":Ljava/util/concurrent/locks/ReentrantLock;
    .end local v1    # "$i$f$withLock":I
    return-void

    .line 649
    .restart local v0    # "$this$withLock$iv":Ljava/util/concurrent/locks/ReentrantLock;
    .restart local v1    # "$i$f$withLock":I
    :catchall_0
    move-exception v2

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v2
.end method

.method public final onObserverAdded$room_runtime([I)Z
    .locals 20
    .param p1, "tableIds"    # [I

    move-object/from16 v1, p0

    const-string/jumbo v0, "tableIds"

    move-object/from16 v2, p1

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 545
    iget-object v3, v1, Landroidx/room/ObservedTableStates;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .local v3, "$this$withLock$iv":Ljava/util/concurrent/locks/ReentrantLock;
    const/4 v4, 0x0

    .line 628
    .local v4, "$i$f$withLock":I
    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 629
    nop

    .line 630
    const/4 v0, 0x0

    .line 546
    .local v0, "$i$a$-withLock-ObservedTableStates$onObserverAdded$1":I
    const/4 v5, 0x0

    .line 547
    .local v5, "shouldSync":Z
    move-object/from16 v6, p1

    .local v6, "$this$forEach$iv":[I
    const/4 v7, 0x0

    .line 631
    .local v7, "$i$f$forEach":I
    :try_start_0
    array-length v8, v6

    const/4 v9, 0x0

    move v10, v9

    :goto_0
    const/4 v11, 0x1

    if-ge v10, v8, :cond_1

    aget v12, v6, v10

    .local v12, "element$iv":I
    move v13, v12

    .local v13, "tableId":I
    const/4 v14, 0x0

    .line 548
    .local v14, "$i$a$-forEach-ObservedTableStates$onObserverAdded$1$1":I
    iget-object v15, v1, Landroidx/room/ObservedTableStates;->tableObserversCount:[J

    aget-wide v16, v15, v13

    .line 549
    .local v16, "previousCount":J
    iget-object v15, v1, Landroidx/room/ObservedTableStates;->tableObserversCount:[J

    const-wide/16 v18, 0x1

    add-long v18, v16, v18

    aput-wide v18, v15, v13

    .line 550
    const-wide/16 v18, 0x0

    cmp-long v15, v16, v18

    if-nez v15, :cond_0

    .line 551
    iput-boolean v11, v1, Landroidx/room/ObservedTableStates;->needsSync:Z

    .line 552
    const/4 v5, 0x1

    .line 554
    :cond_0
    nop

    .line 631
    .end local v13    # "tableId":I
    .end local v14    # "$i$a$-forEach-ObservedTableStates$onObserverAdded$1$1":I
    .end local v16    # "previousCount":J
    nop

    .end local v12    # "element$iv":I
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 632
    :cond_1
    nop

    .line 555
    .end local v6    # "$this$forEach$iv":[I
    .end local v7    # "$i$f$forEach":I
    if-nez v5, :cond_2

    iget-boolean v6, v1, Landroidx/room/ObservedTableStates;->needsSync:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v6, :cond_3

    :cond_2
    move v9, v11

    .line 633
    .end local v0    # "$i$a$-withLock-ObservedTableStates$onObserverAdded$1":I
    .end local v3    # "$this$withLock$iv":Ljava/util/concurrent/locks/ReentrantLock;
    .end local v4    # "$i$f$withLock":I
    .end local v5    # "shouldSync":Z
    :cond_3
    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return v9

    .restart local v3    # "$this$withLock$iv":Ljava/util/concurrent/locks/ReentrantLock;
    .restart local v4    # "$i$f$withLock":I
    :catchall_0
    move-exception v0

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method public final onObserverRemoved$room_runtime([I)Z
    .locals 22
    .param p1, "tableIds"    # [I

    move-object/from16 v1, p0

    const-string/jumbo v0, "tableIds"

    move-object/from16 v2, p1

    invoke-static {v2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 563
    iget-object v3, v1, Landroidx/room/ObservedTableStates;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .local v3, "$this$withLock$iv":Ljava/util/concurrent/locks/ReentrantLock;
    const/4 v4, 0x0

    .line 634
    .local v4, "$i$f$withLock":I
    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 635
    nop

    .line 636
    const/4 v0, 0x0

    .line 564
    .local v0, "$i$a$-withLock-ObservedTableStates$onObserverRemoved$1":I
    const/4 v5, 0x0

    .line 565
    .local v5, "shouldSync":Z
    move-object/from16 v6, p1

    .local v6, "$this$forEach$iv":[I
    const/4 v7, 0x0

    .line 637
    .local v7, "$i$f$forEach":I
    :try_start_0
    array-length v8, v6

    const/4 v9, 0x0

    move v10, v9

    :goto_0
    const/4 v11, 0x1

    if-ge v10, v8, :cond_1

    aget v12, v6, v10

    .local v12, "element$iv":I
    move v13, v12

    .local v13, "tableId":I
    const/4 v14, 0x0

    .line 566
    .local v14, "$i$a$-forEach-ObservedTableStates$onObserverRemoved$1$1":I
    iget-object v15, v1, Landroidx/room/ObservedTableStates;->tableObserversCount:[J

    aget-wide v16, v15, v13

    .line 567
    .local v16, "previousCount":J
    iget-object v15, v1, Landroidx/room/ObservedTableStates;->tableObserversCount:[J

    const-wide/16 v18, 0x1

    sub-long v20, v16, v18

    aput-wide v20, v15, v13

    .line 568
    cmp-long v15, v16, v18

    if-nez v15, :cond_0

    .line 569
    iput-boolean v11, v1, Landroidx/room/ObservedTableStates;->needsSync:Z

    .line 570
    const/4 v5, 0x1

    .line 572
    :cond_0
    nop

    .line 637
    .end local v13    # "tableId":I
    .end local v14    # "$i$a$-forEach-ObservedTableStates$onObserverRemoved$1$1":I
    .end local v16    # "previousCount":J
    nop

    .end local v12    # "element$iv":I
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 638
    :cond_1
    nop

    .line 573
    .end local v6    # "$this$forEach$iv":[I
    .end local v7    # "$i$f$forEach":I
    if-nez v5, :cond_2

    iget-boolean v6, v1, Landroidx/room/ObservedTableStates;->needsSync:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v6, :cond_3

    :cond_2
    move v9, v11

    .line 639
    .end local v0    # "$i$a$-withLock-ObservedTableStates$onObserverRemoved$1":I
    .end local v3    # "$this$withLock$iv":Ljava/util/concurrent/locks/ReentrantLock;
    .end local v4    # "$i$f$withLock":I
    .end local v5    # "shouldSync":Z
    :cond_3
    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return v9

    .restart local v3    # "$this$withLock$iv":Ljava/util/concurrent/locks/ReentrantLock;
    .restart local v4    # "$i$f$withLock":I
    :catchall_0
    move-exception v0

    invoke-virtual {v3}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method

.method public final onSync$room_runtime(Lkotlin/jvm/functions/Function1;)V
    .locals 14
    .param p1, "action"    # Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-[",
            "Landroidx/room/ObservedTableStates$ObserveOp;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    const-string v0, "action"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 516
    .local v0, "$i$f$onSync$room_runtime":I
    invoke-static {p0}, Landroidx/room/ObservedTableStates;->access$getLock$p(Landroidx/room/ObservedTableStates;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v1

    .local v1, "$this$withLock$iv":Ljava/util/concurrent/locks/ReentrantLock;
    const/4 v2, 0x0

    .line 623
    .local v2, "$i$f$withLock":I
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 624
    nop

    .line 625
    const/4 v3, 0x0

    .line 517
    .local v3, "$i$a$-withLock-ObservedTableStates$onSync$1":I
    :try_start_0
    invoke-static {p0}, Landroidx/room/ObservedTableStates;->access$getNeedsSync$p(Landroidx/room/ObservedTableStates;)Z

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v4, :cond_0

    .line 519
    nop

    .line 627
    .end local v1    # "$this$withLock$iv":Ljava/util/concurrent/locks/ReentrantLock;
    .end local v2    # "$i$f$withLock":I
    .end local v3    # "$i$a$-withLock-ObservedTableStates$onSync$1":I
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    return-void

    .line 521
    .restart local v1    # "$this$withLock$iv":Ljava/util/concurrent/locks/ReentrantLock;
    .restart local v2    # "$i$f$withLock":I
    .restart local v3    # "$i$a$-withLock-ObservedTableStates$onSync$1":I
    :cond_0
    const/4 v4, 0x0

    :try_start_1
    invoke-static {p0, v4}, Landroidx/room/ObservedTableStates;->access$setNeedsSync$p(Landroidx/room/ObservedTableStates;Z)V

    .line 522
    const/4 v5, 0x0

    .line 524
    .local v5, "addOrRemove":Z
    invoke-static {p0}, Landroidx/room/ObservedTableStates;->access$getTableObserversCount$p(Landroidx/room/ObservedTableStates;)[J

    move-result-object v6

    array-length v6, v6

    new-array v7, v6, [Landroidx/room/ObservedTableStates$ObserveOp;

    move v8, v4

    :goto_0
    if-ge v8, v6, :cond_4

    .line 525
    invoke-static {p0}, Landroidx/room/ObservedTableStates;->access$getTableObserversCount$p(Landroidx/room/ObservedTableStates;)[J

    move-result-object v9

    aget-wide v10, v9, v8

    const-wide/16 v12, 0x0

    cmp-long v9, v10, v12

    if-lez v9, :cond_1

    const/4 v9, 0x1

    goto :goto_1

    :cond_1
    move v9, v4

    .line 526
    .local v9, "newState":Z
    :goto_1
    invoke-static {p0}, Landroidx/room/ObservedTableStates;->access$getTableObservedState$p(Landroidx/room/ObservedTableStates;)[Z

    move-result-object v10

    aget-boolean v10, v10, v8

    if-eq v9, v10, :cond_3

    .line 527
    const/4 v5, 0x1

    .line 528
    invoke-static {p0}, Landroidx/room/ObservedTableStates;->access$getTableObservedState$p(Landroidx/room/ObservedTableStates;)[Z

    move-result-object v10

    aput-boolean v9, v10, v8

    .line 529
    if-eqz v9, :cond_2

    sget-object v10, Landroidx/room/ObservedTableStates$ObserveOp;->ADD:Landroidx/room/ObservedTableStates$ObserveOp;

    goto :goto_2

    :cond_2
    sget-object v10, Landroidx/room/ObservedTableStates$ObserveOp;->REMOVE:Landroidx/room/ObservedTableStates$ObserveOp;

    goto :goto_2

    .line 531
    :cond_3
    sget-object v10, Landroidx/room/ObservedTableStates$ObserveOp;->NO_OP:Landroidx/room/ObservedTableStates$ObserveOp;

    .end local v9    # "newState":Z
    :goto_2
    aput-object v10, v7, v8

    .line 524
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 523
    :cond_4
    nop

    .line 534
    .local v7, "ops":[Landroidx/room/ObservedTableStates$ObserveOp;
    if-eqz v5, :cond_5

    .line 535
    invoke-interface {p1, v7}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 537
    :cond_5
    nop

    .end local v3    # "$i$a$-withLock-ObservedTableStates$onSync$1":I
    .end local v5    # "addOrRemove":Z
    .end local v7    # "ops":[Landroidx/room/ObservedTableStates$ObserveOp;
    sget-object v3, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 625
    nop

    .line 627
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 625
    nop

    .line 538
    .end local v1    # "$this$withLock$iv":Ljava/util/concurrent/locks/ReentrantLock;
    .end local v2    # "$i$f$withLock":I
    return-void

    .line 627
    .restart local v1    # "$this$withLock$iv":Ljava/util/concurrent/locks/ReentrantLock;
    .restart local v2    # "$i$f$withLock":I
    :catchall_0
    move-exception v3

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v3
.end method

.method public final resetTriggerState$room_runtime()V
    .locals 9

    .line 577
    iget-object v1, p0, Landroidx/room/ObservedTableStates;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .local v1, "$this$withLock$iv":Ljava/util/concurrent/locks/ReentrantLock;
    const/4 v2, 0x0

    .line 640
    .local v2, "$i$f$withLock":I
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 641
    nop

    .line 642
    const/4 v0, 0x0

    .line 578
    .local v0, "$i$a$-withLock-ObservedTableStates$resetTriggerState$1":I
    :try_start_0
    iget-object v3, p0, Landroidx/room/ObservedTableStates;->tableObservedState:[Z

    const/4 v7, 0x6

    const/4 v8, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v3 .. v8}, Lkotlin/collections/ArraysKt;->fill$default([ZZIIILjava/lang/Object;)V

    .line 579
    const/4 v3, 0x1

    iput-boolean v3, p0, Landroidx/room/ObservedTableStates;->needsSync:Z

    .line 580
    nop

    .end local v0    # "$i$a$-withLock-ObservedTableStates$resetTriggerState$1":I
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 642
    nop

    .line 644
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 642
    nop

    .line 580
    .end local v1    # "$this$withLock$iv":Ljava/util/concurrent/locks/ReentrantLock;
    .end local v2    # "$i$f$withLock":I
    return-void

    .line 644
    .restart local v1    # "$this$withLock$iv":Ljava/util/concurrent/locks/ReentrantLock;
    .restart local v2    # "$i$f$withLock":I
    :catchall_0
    move-exception v0

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0
.end method
