.class final Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "InvalidationTracker.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/room/TriggerBasedInvalidationTracker;->syncTriggers$room_runtime(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Landroidx/room/Transactor;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nInvalidationTracker.kt\nKotlin\n*S Kotlin\n*F\n+ 1 InvalidationTracker.kt\nandroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1\n+ 2 InvalidationTracker.kt\nandroidx/room/ObservedTableStates\n+ 3 ReentrantLock.kt\nandroidx/room/concurrent/ReentrantLockKt\n*L\n1#1,622:1\n516#2:623\n517#2,3:627\n521#2,18:631\n28#3,3:624\n32#3:630\n*S KotlinDebug\n*F\n+ 1 InvalidationTracker.kt\nandroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1\n*L\n312#1:623\n312#1:627,3\n312#1:631,18\n312#1:624,3\n312#1:630\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\n"
    }
    d2 = {
        "<anonymous>",
        "",
        "connection",
        "Landroidx/room/Transactor;"
    }
    k = 0x3
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "androidx.room.TriggerBasedInvalidationTracker$syncTriggers$2$1"
    f = "InvalidationTracker.kt"
    i = {
        0x0,
        0x1
    }
    l = {
        0x132,
        0x139
    }
    m = "invokeSuspend"
    n = {
        "connection",
        "$this$withLock$iv$iv"
    }
    s = {
        "L$0",
        "L$0"
    }
.end annotation


# instance fields
.field synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Landroidx/room/TriggerBasedInvalidationTracker;


# direct methods
.method constructor <init>(Landroidx/room/TriggerBasedInvalidationTracker;Lkotlin/coroutines/Continuation;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/room/TriggerBasedInvalidationTracker;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;->this$0:Landroidx/room/TriggerBasedInvalidationTracker;

    const/4 v0, 0x2

    invoke-direct {p0, v0, p2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance v0, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;

    iget-object v1, p0, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;->this$0:Landroidx/room/TriggerBasedInvalidationTracker;

    invoke-direct {v0, v1, p2}, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;-><init>(Landroidx/room/TriggerBasedInvalidationTracker;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public final invoke(Landroidx/room/Transactor;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/room/Transactor;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object v0

    check-cast v0, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;

    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {v0, v1}, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    check-cast p1, Landroidx/room/Transactor;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;->invoke(Landroidx/room/Transactor;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 22

    move-object/from16 v1, p0

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    .line 305
    iget v2, v1, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;->label:I

    const/4 v3, 0x1

    packed-switch v2, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {v0, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    move-object/from16 v2, p1

    .local v2, "$result":Ljava/lang/Object;
    const/4 v3, 0x0

    .local v3, "$i$f$onSync$room_runtime":I
    const/4 v0, 0x0

    .local v0, "$i$a$-withLock-ObservedTableStates$onSync$1$iv":I
    const/4 v4, 0x0

    .local v4, "$i$f$withLock":I
    const/4 v5, 0x0

    .local v5, "$i$a$-onSync$room_runtime-TriggerBasedInvalidationTracker$syncTriggers$2$1$1":I
    iget-object v6, v1, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;->L$0:Ljava/lang/Object;

    check-cast v6, Ljava/util/concurrent/locks/ReentrantLock;

    .local v6, "$this$withLock$iv$iv":Ljava/util/concurrent/locks/ReentrantLock;
    :try_start_0
    invoke-static {v2}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto/16 :goto_5

    .line 630
    .end local v0    # "$i$a$-withLock-ObservedTableStates$onSync$1$iv":I
    .end local v5    # "$i$a$-onSync$room_runtime-TriggerBasedInvalidationTracker$syncTriggers$2$1$1":I
    :catchall_0
    move-exception v0

    goto/16 :goto_8

    .line 305
    .end local v2    # "$result":Ljava/lang/Object;
    .end local v3    # "$i$f$onSync$room_runtime":I
    .end local v4    # "$i$f$withLock":I
    .end local v6    # "$this$withLock$iv$iv":Ljava/util/concurrent/locks/ReentrantLock;
    :pswitch_1
    move-object/from16 v2, p1

    .restart local v2    # "$result":Ljava/lang/Object;
    iget-object v4, v1, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;->L$0:Ljava/lang/Object;

    check-cast v4, Landroidx/room/Transactor;

    .local v4, "connection":Landroidx/room/Transactor;
    invoke-static {v2}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object v5, v4

    move-object v4, v2

    goto :goto_0

    .end local v2    # "$result":Ljava/lang/Object;
    .end local v4    # "connection":Landroidx/room/Transactor;
    :pswitch_2
    invoke-static/range {p1 .. p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object/from16 v2, p1

    .restart local v2    # "$result":Ljava/lang/Object;
    iget-object v4, v1, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;->L$0:Ljava/lang/Object;

    check-cast v4, Landroidx/room/Transactor;

    .line 306
    .restart local v4    # "connection":Landroidx/room/Transactor;
    move-object v5, v1

    check-cast v5, Lkotlin/coroutines/Continuation;

    iput-object v4, v1, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;->L$0:Ljava/lang/Object;

    iput v3, v1, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;->label:I

    invoke-interface {v4, v5}, Landroidx/room/Transactor;->inTransaction(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v5

    if-ne v5, v0, :cond_0

    .line 305
    return-object v0

    .line 306
    :cond_0
    move-object/from16 v21, v4

    move-object v4, v2

    move-object v2, v5

    move-object/from16 v5, v21

    .end local v2    # "$result":Ljava/lang/Object;
    .local v4, "$result":Ljava/lang/Object;
    .local v5, "connection":Landroidx/room/Transactor;
    :goto_0
    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 310
    .end local v5    # "connection":Landroidx/room/Transactor;
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    .line 312
    .restart local v5    # "connection":Landroidx/room/Transactor;
    :cond_1
    iget-object v2, v1, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;->this$0:Landroidx/room/TriggerBasedInvalidationTracker;

    invoke-static {v2}, Landroidx/room/TriggerBasedInvalidationTracker;->access$getObservedTableStates$p(Landroidx/room/TriggerBasedInvalidationTracker;)Landroidx/room/ObservedTableStates;

    move-result-object v2

    .local v2, "this_$iv":Landroidx/room/ObservedTableStates;
    iget-object v6, v1, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;->this$0:Landroidx/room/TriggerBasedInvalidationTracker;

    const/4 v7, 0x0

    .line 623
    .local v7, "$i$f$onSync$room_runtime":I
    invoke-static {v2}, Landroidx/room/ObservedTableStates;->access$getLock$p(Landroidx/room/ObservedTableStates;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v8

    const/4 v9, 0x0

    .line 624
    .local v9, "$i$f$withLock":I
    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 625
    nop

    .line 626
    const/4 v10, 0x0

    .line 627
    .local v10, "$i$a$-withLock-ObservedTableStates$onSync$1$iv":I
    :try_start_1
    invoke-static {v2}, Landroidx/room/ObservedTableStates;->access$getNeedsSync$p(Landroidx/room/ObservedTableStates;)Z

    move-result v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    if-nez v11, :cond_2

    .line 629
    .end local v2    # "this_$iv":Landroidx/room/ObservedTableStates;
    .end local v5    # "connection":Landroidx/room/Transactor;
    .end local v9    # "$i$f$withLock":I
    .end local v10    # "$i$a$-withLock-ObservedTableStates$onSync$1$iv":I
    nop

    .line 630
    invoke-virtual {v8}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto/16 :goto_7

    .line 631
    .restart local v2    # "this_$iv":Landroidx/room/ObservedTableStates;
    .restart local v5    # "connection":Landroidx/room/Transactor;
    .local v8, "$this$withLock$iv$iv":Ljava/util/concurrent/locks/ReentrantLock;
    .restart local v9    # "$i$f$withLock":I
    .restart local v10    # "$i$a$-withLock-ObservedTableStates$onSync$1$iv":I
    :cond_2
    const/4 v11, 0x0

    :try_start_2
    invoke-static {v2, v11}, Landroidx/room/ObservedTableStates;->access$setNeedsSync$p(Landroidx/room/ObservedTableStates;Z)V

    .line 632
    const/4 v12, 0x0

    .line 634
    .local v12, "addOrRemove$iv":Z
    invoke-static {v2}, Landroidx/room/ObservedTableStates;->access$getTableObserversCount$p(Landroidx/room/ObservedTableStates;)[J

    move-result-object v13

    array-length v13, v13

    new-array v14, v13, [Landroidx/room/ObservedTableStates$ObserveOp;

    move v15, v11

    :goto_1
    if-ge v15, v13, :cond_7

    .line 635
    invoke-static {v2}, Landroidx/room/ObservedTableStates;->access$getTableObserversCount$p(Landroidx/room/ObservedTableStates;)[J

    move-result-object v16

    aget-wide v17, v16, v15

    const-wide/16 v19, 0x0

    cmp-long v16, v17, v19

    if-lez v16, :cond_3

    move/from16 v16, v3

    goto :goto_2

    :cond_3
    move/from16 v16, v11

    :goto_2
    move/from16 p1, v16

    .line 636
    .local p1, "newState$iv":Z
    invoke-static {v2}, Landroidx/room/ObservedTableStates;->access$getTableObservedState$p(Landroidx/room/ObservedTableStates;)[Z

    move-result-object v16

    aget-boolean v3, v16, v15

    move/from16 v11, p1

    .end local p1    # "newState$iv":Z
    .local v11, "newState$iv":Z
    if-eq v11, v3, :cond_6

    .line 637
    .end local v12    # "addOrRemove$iv":Z
    const/4 v3, 0x1

    .line 638
    .local v3, "addOrRemove$iv":Z
    invoke-static {v2}, Landroidx/room/ObservedTableStates;->access$getTableObservedState$p(Landroidx/room/ObservedTableStates;)[Z

    move-result-object v12

    if-eqz v11, :cond_4

    const/16 v18, 0x1

    goto :goto_3

    :cond_4
    const/16 v18, 0x0

    :goto_3
    aput-boolean v18, v12, v15

    .line 639
    if-eqz v11, :cond_5

    sget-object v12, Landroidx/room/ObservedTableStates$ObserveOp;->ADD:Landroidx/room/ObservedTableStates$ObserveOp;

    goto :goto_4

    .end local v11    # "newState$iv":Z
    :cond_5
    sget-object v12, Landroidx/room/ObservedTableStates$ObserveOp;->REMOVE:Landroidx/room/ObservedTableStates$ObserveOp;

    goto :goto_4

    .line 641
    .end local v3    # "addOrRemove$iv":Z
    .restart local v12    # "addOrRemove$iv":Z
    :cond_6
    sget-object v3, Landroidx/room/ObservedTableStates$ObserveOp;->NO_OP:Landroidx/room/ObservedTableStates$ObserveOp;

    move/from16 v21, v12

    move-object v12, v3

    move/from16 v3, v21

    .end local v12    # "addOrRemove$iv":Z
    .restart local v3    # "addOrRemove$iv":Z
    :goto_4
    aput-object v12, v14, v15

    .line 634
    add-int/lit8 v15, v15, 0x1

    move v12, v3

    const/4 v3, 0x1

    const/4 v11, 0x0

    goto :goto_1

    .line 633
    .end local v2    # "this_$iv":Landroidx/room/ObservedTableStates;
    .end local v3    # "addOrRemove$iv":Z
    .restart local v12    # "addOrRemove$iv":Z
    :cond_7
    nop

    .line 644
    .local v14, "ops$iv":[Landroidx/room/ObservedTableStates$ObserveOp;
    if-eqz v12, :cond_9

    .line 645
    .end local v12    # "addOrRemove$iv":Z
    nop

    .local v14, "tablesToSync":[Landroidx/room/ObservedTableStates$ObserveOp;
    const/4 v2, 0x0

    .line 313
    .local v2, "$i$a$-onSync$room_runtime-TriggerBasedInvalidationTracker$syncTriggers$2$1$1":I
    sget-object v3, Landroidx/room/Transactor$SQLiteTransactionType;->IMMEDIATE:Landroidx/room/Transactor$SQLiteTransactionType;

    new-instance v11, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1$1$1;

    const/4 v12, 0x0

    invoke-direct {v11, v14, v6, v5, v12}, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1$1$1;-><init>([Landroidx/room/ObservedTableStates$ObserveOp;Landroidx/room/TriggerBasedInvalidationTracker;Landroidx/room/Transactor;Lkotlin/coroutines/Continuation;)V

    check-cast v11, Lkotlin/jvm/functions/Function2;

    iput-object v8, v1, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;->L$0:Ljava/lang/Object;

    const/4 v6, 0x2

    iput v6, v1, Landroidx/room/TriggerBasedInvalidationTracker$syncTriggers$2$1;->label:I

    invoke-interface {v5, v3, v11, v1}, Landroidx/room/Transactor;->withTransaction(Landroidx/room/Transactor$SQLiteTransactionType;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .end local v5    # "connection":Landroidx/room/Transactor;
    .end local v14    # "tablesToSync":[Landroidx/room/ObservedTableStates$ObserveOp;
    if-ne v3, v0, :cond_8

    .line 305
    return-object v0

    .line 313
    :cond_8
    move v5, v2

    move-object v2, v4

    move v3, v7

    move-object v6, v8

    move v4, v9

    move v0, v10

    .line 322
    .end local v7    # "$i$f$onSync$room_runtime":I
    .end local v8    # "$this$withLock$iv$iv":Ljava/util/concurrent/locks/ReentrantLock;
    .end local v9    # "$i$f$withLock":I
    .end local v10    # "$i$a$-withLock-ObservedTableStates$onSync$1$iv":I
    .restart local v0    # "$i$a$-withLock-ObservedTableStates$onSync$1$iv":I
    .local v2, "$result":Ljava/lang/Object;
    .local v3, "$i$f$onSync$room_runtime":I
    .local v4, "$i$f$withLock":I
    .local v5, "$i$a$-onSync$room_runtime-TriggerBasedInvalidationTracker$syncTriggers$2$1$1":I
    .restart local v6    # "$this$withLock$iv$iv":Ljava/util/concurrent/locks/ReentrantLock;
    :goto_5
    move v10, v0

    goto :goto_6

    .line 644
    .end local v0    # "$i$a$-withLock-ObservedTableStates$onSync$1$iv":I
    .end local v2    # "$result":Ljava/lang/Object;
    .end local v3    # "$i$f$onSync$room_runtime":I
    .end local v6    # "$this$withLock$iv$iv":Ljava/util/concurrent/locks/ReentrantLock;
    .local v4, "$result":Ljava/lang/Object;
    .local v5, "connection":Landroidx/room/Transactor;
    .restart local v7    # "$i$f$onSync$room_runtime":I
    .restart local v8    # "$this$withLock$iv$iv":Ljava/util/concurrent/locks/ReentrantLock;
    .restart local v9    # "$i$f$withLock":I
    .restart local v10    # "$i$a$-withLock-ObservedTableStates$onSync$1$iv":I
    .restart local v12    # "addOrRemove$iv":Z
    .local v14, "ops$iv":[Landroidx/room/ObservedTableStates$ObserveOp;
    :cond_9
    move-object v2, v4

    move v3, v7

    move-object v6, v8

    move v4, v9

    .line 645
    .end local v5    # "connection":Landroidx/room/Transactor;
    .end local v7    # "$i$f$onSync$room_runtime":I
    .end local v8    # "$this$withLock$iv$iv":Ljava/util/concurrent/locks/ReentrantLock;
    .end local v9    # "$i$f$withLock":I
    .end local v12    # "addOrRemove$iv":Z
    .end local v14    # "ops$iv":[Landroidx/room/ObservedTableStates$ObserveOp;
    .restart local v2    # "$result":Ljava/lang/Object;
    .restart local v3    # "$i$f$onSync$room_runtime":I
    .local v4, "$i$f$withLock":I
    .restart local v6    # "$this$withLock$iv$iv":Ljava/util/concurrent/locks/ReentrantLock;
    :goto_6
    nop

    .line 647
    nop

    .end local v10    # "$i$a$-withLock-ObservedTableStates$onSync$1$iv":I
    :try_start_3
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 626
    nop

    .line 630
    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 626
    .end local v6    # "$this$withLock$iv$iv":Ljava/util/concurrent/locks/ReentrantLock;
    nop

    .line 648
    .end local v4    # "$i$f$withLock":I
    move-object v4, v2

    .line 323
    .end local v2    # "$result":Ljava/lang/Object;
    .end local v3    # "$i$f$onSync$room_runtime":I
    .local v4, "$result":Ljava/lang/Object;
    :goto_7
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0

    .line 630
    .restart local v7    # "$i$f$onSync$room_runtime":I
    .restart local v8    # "$this$withLock$iv$iv":Ljava/util/concurrent/locks/ReentrantLock;
    .restart local v9    # "$i$f$withLock":I
    :catchall_1
    move-exception v0

    move-object v2, v4

    move v3, v7

    move-object v6, v8

    move v4, v9

    goto :goto_8

    .end local v8    # "$this$withLock$iv$iv":Ljava/util/concurrent/locks/ReentrantLock;
    :catchall_2
    move-exception v0

    move-object v6, v8

    move-object v2, v4

    move v3, v7

    move v4, v9

    .end local v7    # "$i$f$onSync$room_runtime":I
    .end local v9    # "$i$f$withLock":I
    .restart local v2    # "$result":Ljava/lang/Object;
    .restart local v3    # "$i$f$onSync$room_runtime":I
    .local v4, "$i$f$withLock":I
    .restart local v6    # "$this$withLock$iv$iv":Ljava/util/concurrent/locks/ReentrantLock;
    :goto_8
    invoke-virtual {v6}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
