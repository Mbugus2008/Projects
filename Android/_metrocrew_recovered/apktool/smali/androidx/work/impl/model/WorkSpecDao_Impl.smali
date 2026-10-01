.class public final Landroidx/work/impl/model/WorkSpecDao_Impl;
.super Ljava/lang/Object;
.source "WorkSpecDao_Impl.java"

# interfaces
.implements Landroidx/work/impl/model/WorkSpecDao;


# instance fields
.field private final __db:Landroidx/room/RoomDatabase;

.field private final __insertionAdapterOfWorkSpec:Landroidx/room/EntityInsertionAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityInsertionAdapter<",
            "Landroidx/work/impl/model/WorkSpec;",
            ">;"
        }
    .end annotation
.end field

.field private final __preparedStmtOfDelete:Landroidx/room/SharedSQLiteStatement;

.field private final __preparedStmtOfIncrementGeneration:Landroidx/room/SharedSQLiteStatement;

.field private final __preparedStmtOfIncrementPeriodCount:Landroidx/room/SharedSQLiteStatement;

.field private final __preparedStmtOfIncrementWorkSpecRunAttemptCount:Landroidx/room/SharedSQLiteStatement;

.field private final __preparedStmtOfMarkWorkSpecScheduled:Landroidx/room/SharedSQLiteStatement;

.field private final __preparedStmtOfPruneFinishedWorkWithZeroDependentsIgnoringKeepForAtLeast:Landroidx/room/SharedSQLiteStatement;

.field private final __preparedStmtOfResetScheduledState:Landroidx/room/SharedSQLiteStatement;

.field private final __preparedStmtOfResetWorkSpecNextScheduleTimeOverride:Landroidx/room/SharedSQLiteStatement;

.field private final __preparedStmtOfResetWorkSpecRunAttemptCount:Landroidx/room/SharedSQLiteStatement;

.field private final __preparedStmtOfSetCancelledState:Landroidx/room/SharedSQLiteStatement;

.field private final __preparedStmtOfSetLastEnqueueTime:Landroidx/room/SharedSQLiteStatement;

.field private final __preparedStmtOfSetNextScheduleTimeOverride:Landroidx/room/SharedSQLiteStatement;

.field private final __preparedStmtOfSetOutput:Landroidx/room/SharedSQLiteStatement;

.field private final __preparedStmtOfSetState:Landroidx/room/SharedSQLiteStatement;

.field private final __preparedStmtOfSetStopReason:Landroidx/room/SharedSQLiteStatement;

.field private final __updateAdapterOfWorkSpec:Landroidx/room/EntityDeletionOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeletionOrUpdateAdapter<",
            "Landroidx/work/impl/model/WorkSpec;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/room/RoomDatabase;)V
    .locals 1
    .param p1, "__db"    # Landroidx/room/RoomDatabase;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "__db"
        }
    .end annotation

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput-object p1, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    .line 85
    new-instance v0, Landroidx/work/impl/model/WorkSpecDao_Impl$1;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl$1;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__insertionAdapterOfWorkSpec:Landroidx/room/EntityInsertionAdapter;

    .line 147
    new-instance v0, Landroidx/work/impl/model/WorkSpecDao_Impl$2;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl$2;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__updateAdapterOfWorkSpec:Landroidx/room/EntityDeletionOrUpdateAdapter;

    .line 210
    new-instance v0, Landroidx/work/impl/model/WorkSpecDao_Impl$3;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl$3;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfDelete:Landroidx/room/SharedSQLiteStatement;

    .line 218
    new-instance v0, Landroidx/work/impl/model/WorkSpecDao_Impl$4;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl$4;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetState:Landroidx/room/SharedSQLiteStatement;

    .line 226
    new-instance v0, Landroidx/work/impl/model/WorkSpecDao_Impl$5;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl$5;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetCancelledState:Landroidx/room/SharedSQLiteStatement;

    .line 234
    new-instance v0, Landroidx/work/impl/model/WorkSpecDao_Impl$6;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl$6;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfIncrementPeriodCount:Landroidx/room/SharedSQLiteStatement;

    .line 242
    new-instance v0, Landroidx/work/impl/model/WorkSpecDao_Impl$7;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl$7;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetOutput:Landroidx/room/SharedSQLiteStatement;

    .line 250
    new-instance v0, Landroidx/work/impl/model/WorkSpecDao_Impl$8;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl$8;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetLastEnqueueTime:Landroidx/room/SharedSQLiteStatement;

    .line 258
    new-instance v0, Landroidx/work/impl/model/WorkSpecDao_Impl$9;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl$9;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfIncrementWorkSpecRunAttemptCount:Landroidx/room/SharedSQLiteStatement;

    .line 266
    new-instance v0, Landroidx/work/impl/model/WorkSpecDao_Impl$10;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl$10;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfResetWorkSpecRunAttemptCount:Landroidx/room/SharedSQLiteStatement;

    .line 274
    new-instance v0, Landroidx/work/impl/model/WorkSpecDao_Impl$11;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl$11;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetNextScheduleTimeOverride:Landroidx/room/SharedSQLiteStatement;

    .line 282
    new-instance v0, Landroidx/work/impl/model/WorkSpecDao_Impl$12;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl$12;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfResetWorkSpecNextScheduleTimeOverride:Landroidx/room/SharedSQLiteStatement;

    .line 290
    new-instance v0, Landroidx/work/impl/model/WorkSpecDao_Impl$13;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl$13;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfMarkWorkSpecScheduled:Landroidx/room/SharedSQLiteStatement;

    .line 298
    new-instance v0, Landroidx/work/impl/model/WorkSpecDao_Impl$14;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl$14;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfResetScheduledState:Landroidx/room/SharedSQLiteStatement;

    .line 306
    new-instance v0, Landroidx/work/impl/model/WorkSpecDao_Impl$15;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl$15;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfPruneFinishedWorkWithZeroDependentsIgnoringKeepForAtLeast:Landroidx/room/SharedSQLiteStatement;

    .line 314
    new-instance v0, Landroidx/work/impl/model/WorkSpecDao_Impl$16;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl$16;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfIncrementGeneration:Landroidx/room/SharedSQLiteStatement;

    .line 322
    new-instance v0, Landroidx/work/impl/model/WorkSpecDao_Impl$17;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl$17;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetStopReason:Landroidx/room/SharedSQLiteStatement;

    .line 330
    return-void
.end method

.method private __fetchRelationshipWorkProgressAsandroidxWorkData(Ljava/util/HashMap;)V
    .locals 14
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "_map"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Landroidx/work/Data;",
            ">;>;)V"
        }
    .end annotation

    .line 3581
    .local p1, "_map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 3582
    .local v0, "__mapKeySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3583
    return-void

    .line 3585
    :cond_0
    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    move-result v1

    const/16 v2, 0x3e7

    if-le v1, v2, :cond_1

    .line 3586
    new-instance v1, Landroidx/work/impl/model/WorkSpecDao_Impl$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Landroidx/work/impl/model/WorkSpecDao_Impl$$ExternalSyntheticLambda1;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;)V

    const/4 v2, 0x1

    invoke-static {p1, v2, v1}, Landroidx/room/util/RelationUtil;->recursiveFetchHashMap(Ljava/util/HashMap;ZLkotlin/jvm/functions/Function1;)V

    .line 3590
    return-void

    .line 3592
    :cond_1
    invoke-static {}, Landroidx/room/util/StringUtil;->newStringBuilder()Ljava/lang/StringBuilder;

    move-result-object v1

    .line 3593
    .local v1, "_stringBuilder":Ljava/lang/StringBuilder;
    const-string v2, "SELECT `progress`,`work_spec_id` FROM `WorkProgress` WHERE `work_spec_id` IN ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3594
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v2

    .line 3595
    .local v2, "_inputSize":I
    invoke-static {v1, v2}, Landroidx/room/util/StringUtil;->appendPlaceholders(Ljava/lang/StringBuilder;I)V

    .line 3596
    const-string v3, ")"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3597
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 3598
    .local v3, "_sql":Ljava/lang/String;
    add-int/lit8 v4, v2, 0x0

    .line 3599
    .local v4, "_argCount":I
    invoke-static {v3, v4}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v5

    .line 3600
    .local v5, "_stmt":Landroidx/room/RoomSQLiteQuery;
    const/4 v6, 0x1

    .line 3601
    .local v6, "_argIndex":I
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 3602
    .local v8, "_item":Ljava/lang/String;
    invoke-virtual {v5, v6, v8}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 3603
    nop

    .end local v8    # "_item":Ljava/lang/String;
    add-int/lit8 v6, v6, 0x1

    .line 3604
    goto :goto_0

    .line 3605
    :cond_2
    iget-object v7, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v7, v5, v9, v8}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v7

    .line 3607
    .local v7, "_cursor":Landroid/database/Cursor;
    :try_start_0
    const-string/jumbo v8, "work_spec_id"

    invoke-static {v7, v8}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3608
    .local v8, "_itemKeyIndex":I
    const/4 v10, -0x1

    if-ne v8, v10, :cond_3

    .line 3624
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 3609
    return-void

    .line 3611
    :cond_3
    :goto_1
    :try_start_1
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v10

    if-eqz v10, :cond_5

    .line 3613
    invoke-interface {v7, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 3614
    .local v10, "_tmpKey":Ljava/lang/String;
    invoke-virtual {p1, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/ArrayList;

    .line 3615
    .local v11, "_tmpRelation":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/work/Data;>;"
    if-eqz v11, :cond_4

    .line 3618
    invoke-interface {v7, v9}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v12

    .line 3619
    .local v12, "_tmp":[B
    invoke-static {v12}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v13

    .line 3620
    .local v13, "_item_1":Landroidx/work/Data;
    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 3622
    .end local v10    # "_tmpKey":Ljava/lang/String;
    .end local v11    # "_tmpRelation":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/work/Data;>;"
    .end local v12    # "_tmp":[B
    .end local v13    # "_item_1":Landroidx/work/Data;
    :cond_4
    goto :goto_1

    .line 3624
    .end local v8    # "_itemKeyIndex":I
    :cond_5
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 3625
    nop

    .line 3626
    return-void

    .line 3624
    :catchall_0
    move-exception v8

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 3625
    throw v8
.end method

.method private __fetchRelationshipWorkTagAsjavaLangString(Ljava/util/HashMap;)V
    .locals 13
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "_map"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .line 3534
    .local p1, "_map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 3535
    .local v0, "__mapKeySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3536
    return-void

    .line 3538
    :cond_0
    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    move-result v1

    const/16 v2, 0x3e7

    if-le v1, v2, :cond_1

    .line 3539
    new-instance v1, Landroidx/work/impl/model/WorkSpecDao_Impl$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Landroidx/work/impl/model/WorkSpecDao_Impl$$ExternalSyntheticLambda0;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;)V

    const/4 v2, 0x1

    invoke-static {p1, v2, v1}, Landroidx/room/util/RelationUtil;->recursiveFetchHashMap(Ljava/util/HashMap;ZLkotlin/jvm/functions/Function1;)V

    .line 3543
    return-void

    .line 3545
    :cond_1
    invoke-static {}, Landroidx/room/util/StringUtil;->newStringBuilder()Ljava/lang/StringBuilder;

    move-result-object v1

    .line 3546
    .local v1, "_stringBuilder":Ljava/lang/StringBuilder;
    const-string v2, "SELECT `tag`,`work_spec_id` FROM `WorkTag` WHERE `work_spec_id` IN ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3547
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v2

    .line 3548
    .local v2, "_inputSize":I
    invoke-static {v1, v2}, Landroidx/room/util/StringUtil;->appendPlaceholders(Ljava/lang/StringBuilder;I)V

    .line 3549
    const-string v3, ")"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3550
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 3551
    .local v3, "_sql":Ljava/lang/String;
    add-int/lit8 v4, v2, 0x0

    .line 3552
    .local v4, "_argCount":I
    invoke-static {v3, v4}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v5

    .line 3553
    .local v5, "_stmt":Landroidx/room/RoomSQLiteQuery;
    const/4 v6, 0x1

    .line 3554
    .local v6, "_argIndex":I
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 3555
    .local v8, "_item":Ljava/lang/String;
    invoke-virtual {v5, v6, v8}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 3556
    nop

    .end local v8    # "_item":Ljava/lang/String;
    add-int/lit8 v6, v6, 0x1

    .line 3557
    goto :goto_0

    .line 3558
    :cond_2
    iget-object v7, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v7, v5, v9, v8}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v7

    .line 3560
    .local v7, "_cursor":Landroid/database/Cursor;
    :try_start_0
    const-string/jumbo v8, "work_spec_id"

    invoke-static {v7, v8}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3561
    .local v8, "_itemKeyIndex":I
    const/4 v10, -0x1

    if-ne v8, v10, :cond_3

    .line 3575
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 3562
    return-void

    .line 3564
    :cond_3
    :goto_1
    :try_start_1
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v10

    if-eqz v10, :cond_5

    .line 3566
    invoke-interface {v7, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 3567
    .local v10, "_tmpKey":Ljava/lang/String;
    invoke-virtual {p1, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/ArrayList;

    .line 3568
    .local v11, "_tmpRelation":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v11, :cond_4

    .line 3570
    invoke-interface {v7, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 3571
    .local v12, "_item_1":Ljava/lang/String;
    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 3573
    .end local v10    # "_tmpKey":Ljava/lang/String;
    .end local v11    # "_tmpRelation":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v12    # "_item_1":Ljava/lang/String;
    :cond_4
    goto :goto_1

    .line 3575
    .end local v8    # "_itemKeyIndex":I
    :cond_5
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 3576
    nop

    .line 3577
    return-void

    .line 3575
    :catchall_0
    move-exception v8

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 3576
    throw v8
.end method

.method static synthetic access$000(Landroidx/work/impl/model/WorkSpecDao_Impl;)Landroidx/room/RoomDatabase;
    .locals 1
    .param p0, "x0"    # Landroidx/work/impl/model/WorkSpecDao_Impl;

    .line 46
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    return-object v0
.end method

.method static synthetic access$100(Landroidx/work/impl/model/WorkSpecDao_Impl;Ljava/util/HashMap;)V
    .locals 0
    .param p0, "x0"    # Landroidx/work/impl/model/WorkSpecDao_Impl;
    .param p1, "x1"    # Ljava/util/HashMap;

    .line 46
    invoke-direct {p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl;->__fetchRelationshipWorkTagAsjavaLangString(Ljava/util/HashMap;)V

    return-void
.end method

.method static synthetic access$200(Landroidx/work/impl/model/WorkSpecDao_Impl;Ljava/util/HashMap;)V
    .locals 0
    .param p0, "x0"    # Landroidx/work/impl/model/WorkSpecDao_Impl;
    .param p1, "x1"    # Ljava/util/HashMap;

    .line 46
    invoke-direct {p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl;->__fetchRelationshipWorkProgressAsandroidxWorkData(Ljava/util/HashMap;)V

    return-void
.end method

.method public static getRequiredConverters()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation

    .line 3529
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public countNonFinishedContentUriTriggerWorkers()I
    .locals 5

    .line 3509
    const-string v0, "Select COUNT(*) FROM workspec WHERE LENGTH(content_uri_triggers)<>0 AND state NOT IN (2, 3, 5)"

    .line 3510
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "Select COUNT(*) FROM workspec WHERE LENGTH(content_uri_triggers)<>0 AND state NOT IN (2, 3, 5)"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 3511
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 3512
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v4, 0x0

    invoke-static {v3, v1, v2, v4}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v3

    .line 3515
    .local v3, "_cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 3516
    invoke-interface {v3, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .local v2, "_result":I
    goto :goto_0

    .line 3518
    .end local v2    # "_result":I
    :cond_0
    const/4 v2, 0x0

    .line 3520
    .restart local v2    # "_result":I
    :goto_0
    nop

    .line 3522
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 3523
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 3520
    return v2

    .line 3522
    .end local v2    # "_result":I
    :catchall_0
    move-exception v2

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 3523
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 3524
    throw v2
.end method

.method public delete(Ljava/lang/String;)V
    .locals 4
    .param p1, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "id"
        }
    .end annotation

    .line 358
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 359
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfDelete:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->acquire()Landroidx/sqlite/db/SupportSQLiteStatement;

    move-result-object v0

    .line 360
    .local v0, "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    const/4 v1, 0x1

    .line 361
    .local v1, "_argIndex":I
    invoke-interface {v0, v1, p1}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 363
    :try_start_0
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 365
    :try_start_1
    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I

    .line 366
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 368
    :try_start_2
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 369
    nop

    .line 371
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfDelete:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v2, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 372
    nop

    .line 373
    return-void

    .line 368
    :catchall_0
    move-exception v2

    :try_start_3
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 369
    nop

    .end local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .end local v1    # "_argIndex":I
    .end local p1    # "id":Ljava/lang/String;
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 371
    .restart local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .restart local v1    # "_argIndex":I
    .restart local p1    # "id":Ljava/lang/String;
    :catchall_1
    move-exception v2

    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfDelete:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v3, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 372
    throw v2
.end method

.method public getAllEligibleWorkSpecsForScheduling(I)Ljava/util/List;
    .locals 95
    .param p1, "maxLimit"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "maxLimit"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec;",
            ">;"
        }
    .end annotation

    .line 2913
    move-object/from16 v1, p0

    const-string v2, "SELECT * FROM workspec WHERE state=0 ORDER BY last_enqueue_time LIMIT ?"

    .line 2914
    .local v2, "_sql":Ljava/lang/String;
    const-string v0, "SELECT * FROM workspec WHERE state=0 ORDER BY last_enqueue_time LIMIT ?"

    const/4 v3, 0x1

    invoke-static {v0, v3}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v4

    .line 2915
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v5, 0x1

    .line 2916
    .local v5, "_argIndex":I
    move/from16 v6, p1

    int-to-long v7, v6

    invoke-virtual {v4, v5, v7, v8}, Landroidx/room/RoomSQLiteQuery;->bindLong(IJ)V

    .line 2917
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 2918
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static {v0, v4, v8, v7}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v7

    .line 2920
    .local v7, "_cursor":Landroid/database/Cursor;
    :try_start_0
    const-string v0, "id"

    invoke-static {v7, v0}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    .line 2921
    .local v0, "_cursorIndexOfId":I
    const-string/jumbo v9, "state"

    invoke-static {v7, v9}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v9

    .line 2922
    .local v9, "_cursorIndexOfState":I
    const-string/jumbo v10, "worker_class_name"

    invoke-static {v7, v10}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v10

    .line 2923
    .local v10, "_cursorIndexOfWorkerClassName":I
    const-string v11, "input_merger_class_name"

    invoke-static {v7, v11}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v11

    .line 2924
    .local v11, "_cursorIndexOfInputMergerClassName":I
    const-string v12, "input"

    invoke-static {v7, v12}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v12

    .line 2925
    .local v12, "_cursorIndexOfInput":I
    const-string v13, "output"

    invoke-static {v7, v13}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v13

    .line 2926
    .local v13, "_cursorIndexOfOutput":I
    const-string v14, "initial_delay"

    invoke-static {v7, v14}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v14

    .line 2927
    .local v14, "_cursorIndexOfInitialDelay":I
    const-string v15, "interval_duration"

    invoke-static {v7, v15}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v15

    .line 2928
    .local v15, "_cursorIndexOfIntervalDuration":I
    const-string v3, "flex_duration"

    invoke-static {v7, v3}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v3

    .line 2929
    .local v3, "_cursorIndexOfFlexDuration":I
    const-string v8, "run_attempt_count"

    invoke-static {v7, v8}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v8

    .line 2930
    .local v8, "_cursorIndexOfRunAttemptCount":I
    const-string v1, "backoff_policy"

    invoke-static {v7, v1}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 2931
    .local v1, "_cursorIndexOfBackoffPolicy":I
    move-object/from16 v16, v2

    .end local v2    # "_sql":Ljava/lang/String;
    .local v16, "_sql":Ljava/lang/String;
    :try_start_1
    const-string v2, "backoff_delay_duration"

    invoke-static {v7, v2}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 2932
    .local v2, "_cursorIndexOfBackoffDelayDuration":I
    move-object/from16 v17, v4

    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .local v17, "_statement":Landroidx/room/RoomSQLiteQuery;
    :try_start_2
    const-string v4, "last_enqueue_time"

    invoke-static {v7, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 2933
    .local v4, "_cursorIndexOfLastEnqueueTime":I
    move/from16 v18, v5

    .end local v5    # "_argIndex":I
    .local v18, "_argIndex":I
    :try_start_3
    const-string v5, "minimum_retention_duration"

    invoke-static {v7, v5}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v5

    .line 2934
    .local v5, "_cursorIndexOfMinimumRetentionDuration":I
    const-string/jumbo v6, "schedule_requested_at"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2935
    .local v6, "_cursorIndexOfScheduleRequestedAt":I
    move/from16 v19, v6

    .end local v6    # "_cursorIndexOfScheduleRequestedAt":I
    .local v19, "_cursorIndexOfScheduleRequestedAt":I
    const-string v6, "run_in_foreground"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2936
    .local v6, "_cursorIndexOfExpedited":I
    move/from16 v20, v6

    .end local v6    # "_cursorIndexOfExpedited":I
    .local v20, "_cursorIndexOfExpedited":I
    const-string v6, "out_of_quota_policy"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2937
    .local v6, "_cursorIndexOfOutOfQuotaPolicy":I
    move/from16 v21, v6

    .end local v6    # "_cursorIndexOfOutOfQuotaPolicy":I
    .local v21, "_cursorIndexOfOutOfQuotaPolicy":I
    const-string v6, "period_count"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2938
    .local v6, "_cursorIndexOfPeriodCount":I
    move/from16 v22, v6

    .end local v6    # "_cursorIndexOfPeriodCount":I
    .local v22, "_cursorIndexOfPeriodCount":I
    const-string v6, "generation"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2939
    .local v6, "_cursorIndexOfGeneration":I
    move/from16 v23, v6

    .end local v6    # "_cursorIndexOfGeneration":I
    .local v23, "_cursorIndexOfGeneration":I
    const-string v6, "next_schedule_time_override"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2940
    .local v6, "_cursorIndexOfNextScheduleTimeOverride":I
    move/from16 v24, v6

    .end local v6    # "_cursorIndexOfNextScheduleTimeOverride":I
    .local v24, "_cursorIndexOfNextScheduleTimeOverride":I
    const-string v6, "next_schedule_time_override_generation"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2941
    .local v6, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    move/from16 v25, v6

    .end local v6    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .local v25, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    const-string/jumbo v6, "stop_reason"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2942
    .local v6, "_cursorIndexOfStopReason":I
    move/from16 v26, v6

    .end local v6    # "_cursorIndexOfStopReason":I
    .local v26, "_cursorIndexOfStopReason":I
    const-string/jumbo v6, "trace_tag"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2943
    .local v6, "_cursorIndexOfTraceTag":I
    move/from16 v27, v6

    .end local v6    # "_cursorIndexOfTraceTag":I
    .local v27, "_cursorIndexOfTraceTag":I
    const-string v6, "required_network_type"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2944
    .local v6, "_cursorIndexOfRequiredNetworkType":I
    move/from16 v28, v6

    .end local v6    # "_cursorIndexOfRequiredNetworkType":I
    .local v28, "_cursorIndexOfRequiredNetworkType":I
    const-string v6, "required_network_request"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2945
    .local v6, "_cursorIndexOfRequiredNetworkRequestCompat":I
    move/from16 v29, v6

    .end local v6    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v29, "_cursorIndexOfRequiredNetworkRequestCompat":I
    const-string v6, "requires_charging"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2946
    .local v6, "_cursorIndexOfRequiresCharging":I
    move/from16 v30, v6

    .end local v6    # "_cursorIndexOfRequiresCharging":I
    .local v30, "_cursorIndexOfRequiresCharging":I
    const-string v6, "requires_device_idle"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2947
    .local v6, "_cursorIndexOfRequiresDeviceIdle":I
    move/from16 v31, v6

    .end local v6    # "_cursorIndexOfRequiresDeviceIdle":I
    .local v31, "_cursorIndexOfRequiresDeviceIdle":I
    const-string v6, "requires_battery_not_low"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2948
    .local v6, "_cursorIndexOfRequiresBatteryNotLow":I
    move/from16 v32, v6

    .end local v6    # "_cursorIndexOfRequiresBatteryNotLow":I
    .local v32, "_cursorIndexOfRequiresBatteryNotLow":I
    const-string v6, "requires_storage_not_low"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2949
    .local v6, "_cursorIndexOfRequiresStorageNotLow":I
    move/from16 v33, v6

    .end local v6    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v33, "_cursorIndexOfRequiresStorageNotLow":I
    const-string/jumbo v6, "trigger_content_update_delay"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2950
    .local v6, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    move/from16 v34, v6

    .end local v6    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v34, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    const-string/jumbo v6, "trigger_max_content_delay"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2951
    .local v6, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    move/from16 v35, v6

    .end local v6    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .local v35, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    const-string v6, "content_uri_triggers"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2952
    .local v6, "_cursorIndexOfContentUriTriggers":I
    move/from16 v36, v6

    .end local v6    # "_cursorIndexOfContentUriTriggers":I
    .local v36, "_cursorIndexOfContentUriTriggers":I
    new-instance v6, Ljava/util/ArrayList;

    move/from16 v37, v5

    .end local v5    # "_cursorIndexOfMinimumRetentionDuration":I
    .local v37, "_cursorIndexOfMinimumRetentionDuration":I
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v5

    invoke-direct {v6, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 2953
    .local v6, "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec;>;"
    :goto_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 2956
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v39, v5

    .line 2959
    .local v39, "_tmpId":Ljava/lang/String;
    invoke-interface {v7, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 2960
    .local v5, "_tmp":I
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v5}, Landroidx/work/impl/model/WorkTypeConverters;->intToState(I)Landroidx/work/WorkInfo$State;

    move-result-object v40

    .line 2962
    .local v40, "_tmpState":Landroidx/work/WorkInfo$State;
    invoke-interface {v7, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v41

    .line 2964
    .local v41, "_tmpWorkerClassName":Ljava/lang/String;
    invoke-interface {v7, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v42

    .line 2967
    .local v42, "_tmpInputMergerClassName":Ljava/lang/String;
    invoke-interface {v7, v12}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v38

    move-object/from16 v71, v38

    .line 2968
    .local v71, "_tmp_1":[B
    invoke-static/range {v71 .. v71}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v43

    .line 2971
    .local v43, "_tmpInput":Landroidx/work/Data;
    invoke-interface {v7, v13}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v38

    move-object/from16 v72, v38

    .line 2972
    .local v72, "_tmp_2":[B
    invoke-static/range {v72 .. v72}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v44

    .line 2974
    .local v44, "_tmpOutput":Landroidx/work/Data;
    invoke-interface {v7, v14}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v45

    .line 2976
    .local v45, "_tmpInitialDelay":J
    invoke-interface {v7, v15}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v47

    .line 2978
    .local v47, "_tmpIntervalDuration":J
    invoke-interface {v7, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v49

    .line 2980
    .local v49, "_tmpFlexDuration":J
    invoke-interface {v7, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v52

    .line 2983
    .local v52, "_tmpRunAttemptCount":I
    invoke-interface {v7, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v38

    move/from16 v73, v38

    .line 2984
    .local v73, "_tmp_3":I
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v73 .. v73}, Landroidx/work/impl/model/WorkTypeConverters;->intToBackoffPolicy(I)Landroidx/work/BackoffPolicy;

    move-result-object v53

    .line 2986
    .local v53, "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    invoke-interface {v7, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v54

    .line 2988
    .local v54, "_tmpBackoffDelayDuration":J
    invoke-interface {v7, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v56

    .line 2990
    .local v56, "_tmpLastEnqueueTime":J
    move/from16 v74, v0

    move/from16 v0, v37

    .end local v37    # "_cursorIndexOfMinimumRetentionDuration":I
    .local v0, "_cursorIndexOfMinimumRetentionDuration":I
    .local v74, "_cursorIndexOfId":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v58

    .line 2992
    .local v58, "_tmpMinimumRetentionDuration":J
    move/from16 v37, v0

    move/from16 v0, v19

    .end local v19    # "_cursorIndexOfScheduleRequestedAt":I
    .local v0, "_cursorIndexOfScheduleRequestedAt":I
    .restart local v37    # "_cursorIndexOfMinimumRetentionDuration":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v60

    .line 2995
    .local v60, "_tmpScheduleRequestedAt":J
    move/from16 v19, v0

    move/from16 v0, v20

    .end local v20    # "_cursorIndexOfExpedited":I
    .local v0, "_cursorIndexOfExpedited":I
    .restart local v19    # "_cursorIndexOfScheduleRequestedAt":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v20

    .line 2996
    .local v20, "_tmp_4":I
    if-eqz v20, :cond_0

    const/16 v62, 0x1

    goto :goto_1

    :cond_0
    const/16 v62, 0x0

    .line 2999
    .local v62, "_tmpExpedited":Z
    :goto_1
    move/from16 v75, v0

    move/from16 v0, v21

    .end local v21    # "_cursorIndexOfOutOfQuotaPolicy":I
    .local v0, "_cursorIndexOfOutOfQuotaPolicy":I
    .local v75, "_cursorIndexOfExpedited":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v21

    .line 3000
    .local v21, "_tmp_5":I
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v21 .. v21}, Landroidx/work/impl/model/WorkTypeConverters;->intToOutOfQuotaPolicy(I)Landroidx/work/OutOfQuotaPolicy;

    move-result-object v63

    .line 3002
    .local v63, "_tmpOutOfQuotaPolicy":Landroidx/work/OutOfQuotaPolicy;
    move/from16 v76, v0

    move/from16 v0, v22

    .end local v22    # "_cursorIndexOfPeriodCount":I
    .local v0, "_cursorIndexOfPeriodCount":I
    .local v76, "_cursorIndexOfOutOfQuotaPolicy":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v64

    .line 3004
    .local v64, "_tmpPeriodCount":I
    move/from16 v22, v0

    move/from16 v0, v23

    .end local v23    # "_cursorIndexOfGeneration":I
    .local v0, "_cursorIndexOfGeneration":I
    .restart local v22    # "_cursorIndexOfPeriodCount":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v65

    .line 3006
    .local v65, "_tmpGeneration":I
    move/from16 v23, v0

    move/from16 v0, v24

    .end local v24    # "_cursorIndexOfNextScheduleTimeOverride":I
    .local v0, "_cursorIndexOfNextScheduleTimeOverride":I
    .restart local v23    # "_cursorIndexOfGeneration":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v66

    .line 3008
    .local v66, "_tmpNextScheduleTimeOverride":J
    move/from16 v24, v0

    move/from16 v0, v25

    .end local v25    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .local v0, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .restart local v24    # "_cursorIndexOfNextScheduleTimeOverride":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v68

    .line 3010
    .local v68, "_tmpNextScheduleTimeOverrideGeneration":I
    move/from16 v25, v0

    move/from16 v0, v26

    .end local v26    # "_cursorIndexOfStopReason":I
    .local v0, "_cursorIndexOfStopReason":I
    .restart local v25    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v69

    .line 3012
    .local v69, "_tmpStopReason":I
    move/from16 v26, v0

    move/from16 v0, v27

    .end local v27    # "_cursorIndexOfTraceTag":I
    .local v0, "_cursorIndexOfTraceTag":I
    .restart local v26    # "_cursorIndexOfStopReason":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v27

    if-eqz v27, :cond_1

    .line 3013
    const/16 v27, 0x0

    move-object/from16 v70, v27

    .local v27, "_tmpTraceTag":Ljava/lang/String;
    goto :goto_2

    .line 3015
    .end local v27    # "_tmpTraceTag":Ljava/lang/String;
    :cond_1
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v27

    move-object/from16 v70, v27

    .line 3020
    .local v70, "_tmpTraceTag":Ljava/lang/String;
    :goto_2
    move/from16 v27, v0

    move/from16 v0, v28

    .end local v28    # "_cursorIndexOfRequiredNetworkType":I
    .local v0, "_cursorIndexOfRequiredNetworkType":I
    .local v27, "_cursorIndexOfTraceTag":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v28

    .line 3021
    .local v28, "_tmp_6":I
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v28 .. v28}, Landroidx/work/impl/model/WorkTypeConverters;->intToNetworkType(I)Landroidx/work/NetworkType;

    move-result-object v38

    move-object/from16 v79, v38

    .line 3024
    .local v79, "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    move/from16 v89, v0

    move/from16 v0, v29

    .end local v29    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v0, "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v89, "_cursorIndexOfRequiredNetworkType":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v29

    .line 3025
    .local v29, "_tmp_7":[B
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v29 .. v29}, Landroidx/work/impl/model/WorkTypeConverters;->toNetworkRequest$work_runtime_release([B)Landroidx/work/impl/utils/NetworkRequestCompat;

    move-result-object v78

    .line 3028
    .local v78, "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    move/from16 v90, v0

    move/from16 v0, v30

    .end local v30    # "_cursorIndexOfRequiresCharging":I
    .local v0, "_cursorIndexOfRequiresCharging":I
    .local v90, "_cursorIndexOfRequiredNetworkRequestCompat":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v30

    .line 3029
    .local v30, "_tmp_8":I
    if-eqz v30, :cond_2

    const/16 v80, 0x1

    goto :goto_3

    :cond_2
    const/16 v80, 0x0

    .line 3032
    .local v80, "_tmpRequiresCharging":Z
    :goto_3
    move/from16 v91, v0

    move/from16 v0, v31

    .end local v31    # "_cursorIndexOfRequiresDeviceIdle":I
    .local v0, "_cursorIndexOfRequiresDeviceIdle":I
    .local v91, "_cursorIndexOfRequiresCharging":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v31

    .line 3033
    .local v31, "_tmp_9":I
    if-eqz v31, :cond_3

    const/16 v81, 0x1

    goto :goto_4

    :cond_3
    const/16 v81, 0x0

    .line 3036
    .local v81, "_tmpRequiresDeviceIdle":Z
    :goto_4
    move/from16 v92, v0

    move/from16 v0, v32

    .end local v32    # "_cursorIndexOfRequiresBatteryNotLow":I
    .local v0, "_cursorIndexOfRequiresBatteryNotLow":I
    .local v92, "_cursorIndexOfRequiresDeviceIdle":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v32

    .line 3037
    .local v32, "_tmp_10":I
    if-eqz v32, :cond_4

    const/16 v82, 0x1

    goto :goto_5

    :cond_4
    const/16 v82, 0x0

    .line 3040
    .local v82, "_tmpRequiresBatteryNotLow":Z
    :goto_5
    move/from16 v93, v0

    move/from16 v0, v33

    .end local v33    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v0, "_cursorIndexOfRequiresStorageNotLow":I
    .local v93, "_cursorIndexOfRequiresBatteryNotLow":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v33

    .line 3041
    .local v33, "_tmp_11":I
    if-eqz v33, :cond_5

    const/16 v83, 0x1

    goto :goto_6

    :cond_5
    const/16 v83, 0x0

    .line 3043
    .local v83, "_tmpRequiresStorageNotLow":Z
    :goto_6
    move/from16 v94, v0

    move/from16 v0, v34

    .end local v34    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v0, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v94, "_cursorIndexOfRequiresStorageNotLow":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v84

    .line 3045
    .local v84, "_tmpContentTriggerUpdateDelayMillis":J
    move/from16 v34, v0

    move/from16 v0, v35

    .end local v35    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .local v0, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .restart local v34    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v86

    .line 3048
    .local v86, "_tmpContentTriggerMaxDelayMillis":J
    move/from16 v35, v0

    move/from16 v0, v36

    .end local v36    # "_cursorIndexOfContentUriTriggers":I
    .local v0, "_cursorIndexOfContentUriTriggers":I
    .restart local v35    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v36

    .line 3049
    .local v36, "_tmp_12":[B
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v36 .. v36}, Landroidx/work/impl/model/WorkTypeConverters;->byteArrayToSetOfTriggers([B)Ljava/util/Set;

    move-result-object v88

    .line 3050
    .local v88, "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    new-instance v77, Landroidx/work/Constraints;

    invoke-direct/range {v77 .. v88}, Landroidx/work/Constraints;-><init>(Landroidx/work/impl/utils/NetworkRequestCompat;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    move-object/from16 v51, v77

    .line 3051
    .local v51, "_tmpConstraints":Landroidx/work/Constraints;
    new-instance v38, Landroidx/work/impl/model/WorkSpec;

    invoke-direct/range {v38 .. v70}, Landroidx/work/impl/model/WorkSpec;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Ljava/lang/String;Ljava/lang/String;Landroidx/work/Data;Landroidx/work/Data;JJJLandroidx/work/Constraints;ILandroidx/work/BackoffPolicy;JJJJZLandroidx/work/OutOfQuotaPolicy;IIJIILjava/lang/String;)V

    move-object/from16 v77, v38

    .line 3052
    .local v77, "_item":Landroidx/work/impl/model/WorkSpec;
    move/from16 v38, v0

    move-object/from16 v0, v77

    .end local v77    # "_item":Landroidx/work/impl/model/WorkSpec;
    .local v0, "_item":Landroidx/work/impl/model/WorkSpec;
    .local v38, "_cursorIndexOfContentUriTriggers":I
    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 3053
    move/from16 v36, v38

    move/from16 v0, v74

    move/from16 v20, v75

    move/from16 v21, v76

    move/from16 v28, v89

    move/from16 v29, v90

    move/from16 v30, v91

    move/from16 v31, v92

    move/from16 v32, v93

    move/from16 v33, v94

    .end local v0    # "_item":Landroidx/work/impl/model/WorkSpec;
    .end local v5    # "_tmp":I
    .end local v20    # "_tmp_4":I
    .end local v21    # "_tmp_5":I
    .end local v28    # "_tmp_6":I
    .end local v29    # "_tmp_7":[B
    .end local v30    # "_tmp_8":I
    .end local v31    # "_tmp_9":I
    .end local v32    # "_tmp_10":I
    .end local v33    # "_tmp_11":I
    .end local v36    # "_tmp_12":[B
    .end local v39    # "_tmpId":Ljava/lang/String;
    .end local v40    # "_tmpState":Landroidx/work/WorkInfo$State;
    .end local v41    # "_tmpWorkerClassName":Ljava/lang/String;
    .end local v42    # "_tmpInputMergerClassName":Ljava/lang/String;
    .end local v43    # "_tmpInput":Landroidx/work/Data;
    .end local v44    # "_tmpOutput":Landroidx/work/Data;
    .end local v45    # "_tmpInitialDelay":J
    .end local v47    # "_tmpIntervalDuration":J
    .end local v49    # "_tmpFlexDuration":J
    .end local v51    # "_tmpConstraints":Landroidx/work/Constraints;
    .end local v52    # "_tmpRunAttemptCount":I
    .end local v53    # "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    .end local v54    # "_tmpBackoffDelayDuration":J
    .end local v56    # "_tmpLastEnqueueTime":J
    .end local v58    # "_tmpMinimumRetentionDuration":J
    .end local v60    # "_tmpScheduleRequestedAt":J
    .end local v62    # "_tmpExpedited":Z
    .end local v63    # "_tmpOutOfQuotaPolicy":Landroidx/work/OutOfQuotaPolicy;
    .end local v64    # "_tmpPeriodCount":I
    .end local v65    # "_tmpGeneration":I
    .end local v66    # "_tmpNextScheduleTimeOverride":J
    .end local v68    # "_tmpNextScheduleTimeOverrideGeneration":I
    .end local v69    # "_tmpStopReason":I
    .end local v70    # "_tmpTraceTag":Ljava/lang/String;
    .end local v71    # "_tmp_1":[B
    .end local v72    # "_tmp_2":[B
    .end local v73    # "_tmp_3":I
    .end local v78    # "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    .end local v79    # "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    .end local v80    # "_tmpRequiresCharging":Z
    .end local v81    # "_tmpRequiresDeviceIdle":Z
    .end local v82    # "_tmpRequiresBatteryNotLow":Z
    .end local v83    # "_tmpRequiresStorageNotLow":Z
    .end local v84    # "_tmpContentTriggerUpdateDelayMillis":J
    .end local v86    # "_tmpContentTriggerMaxDelayMillis":J
    .end local v88    # "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    goto/16 :goto_0

    .line 3054
    .end local v38    # "_cursorIndexOfContentUriTriggers":I
    .end local v74    # "_cursorIndexOfId":I
    .end local v75    # "_cursorIndexOfExpedited":I
    .end local v76    # "_cursorIndexOfOutOfQuotaPolicy":I
    .end local v89    # "_cursorIndexOfRequiredNetworkType":I
    .end local v90    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v91    # "_cursorIndexOfRequiresCharging":I
    .end local v92    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v93    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v94    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v0, "_cursorIndexOfId":I
    .local v20, "_cursorIndexOfExpedited":I
    .local v21, "_cursorIndexOfOutOfQuotaPolicy":I
    .local v28, "_cursorIndexOfRequiredNetworkType":I
    .local v29, "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v30, "_cursorIndexOfRequiresCharging":I
    .local v31, "_cursorIndexOfRequiresDeviceIdle":I
    .local v32, "_cursorIndexOfRequiresBatteryNotLow":I
    .local v33, "_cursorIndexOfRequiresStorageNotLow":I
    .local v36, "_cursorIndexOfContentUriTriggers":I
    :cond_6
    nop

    .line 3056
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 3057
    invoke-virtual/range {v17 .. v17}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 3054
    return-object v6

    .line 3056
    .end local v0    # "_cursorIndexOfId":I
    .end local v1    # "_cursorIndexOfBackoffPolicy":I
    .end local v2    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v3    # "_cursorIndexOfFlexDuration":I
    .end local v4    # "_cursorIndexOfLastEnqueueTime":I
    .end local v6    # "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec;>;"
    .end local v8    # "_cursorIndexOfRunAttemptCount":I
    .end local v9    # "_cursorIndexOfState":I
    .end local v10    # "_cursorIndexOfWorkerClassName":I
    .end local v11    # "_cursorIndexOfInputMergerClassName":I
    .end local v12    # "_cursorIndexOfInput":I
    .end local v13    # "_cursorIndexOfOutput":I
    .end local v14    # "_cursorIndexOfInitialDelay":I
    .end local v15    # "_cursorIndexOfIntervalDuration":I
    .end local v19    # "_cursorIndexOfScheduleRequestedAt":I
    .end local v20    # "_cursorIndexOfExpedited":I
    .end local v21    # "_cursorIndexOfOutOfQuotaPolicy":I
    .end local v22    # "_cursorIndexOfPeriodCount":I
    .end local v23    # "_cursorIndexOfGeneration":I
    .end local v24    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v25    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .end local v26    # "_cursorIndexOfStopReason":I
    .end local v27    # "_cursorIndexOfTraceTag":I
    .end local v28    # "_cursorIndexOfRequiredNetworkType":I
    .end local v29    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v30    # "_cursorIndexOfRequiresCharging":I
    .end local v31    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v32    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v33    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v34    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v35    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v36    # "_cursorIndexOfContentUriTriggers":I
    .end local v37    # "_cursorIndexOfMinimumRetentionDuration":I
    :catchall_0
    move-exception v0

    goto :goto_7

    .end local v18    # "_argIndex":I
    .local v5, "_argIndex":I
    :catchall_1
    move-exception v0

    move/from16 v18, v5

    .end local v5    # "_argIndex":I
    .restart local v18    # "_argIndex":I
    goto :goto_7

    .end local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v18    # "_argIndex":I
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v5    # "_argIndex":I
    :catchall_2
    move-exception v0

    move-object/from16 v17, v4

    move/from16 v18, v5

    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v5    # "_argIndex":I
    .restart local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v18    # "_argIndex":I
    goto :goto_7

    .end local v16    # "_sql":Ljava/lang/String;
    .end local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v18    # "_argIndex":I
    .local v2, "_sql":Ljava/lang/String;
    .restart local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v5    # "_argIndex":I
    :catchall_3
    move-exception v0

    move-object/from16 v16, v2

    move-object/from16 v17, v4

    move/from16 v18, v5

    .end local v2    # "_sql":Ljava/lang/String;
    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v5    # "_argIndex":I
    .restart local v16    # "_sql":Ljava/lang/String;
    .restart local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v18    # "_argIndex":I
    :goto_7
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 3057
    invoke-virtual/range {v17 .. v17}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 3058
    throw v0
.end method

.method public getAllUnfinishedWork()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 2529
    const-string v0, "SELECT id FROM workspec WHERE state NOT IN (2, 3, 5)"

    .line 2530
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "SELECT id FROM workspec WHERE state NOT IN (2, 3, 5)"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 2531
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 2532
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v4, 0x0

    invoke-static {v3, v1, v2, v4}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v3

    .line 2534
    .local v3, "_cursor":Landroid/database/Cursor;
    :try_start_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 2535
    .local v4, "_result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 2537
    invoke-interface {v3, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 2538
    .local v5, "_item":Ljava/lang/String;
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2539
    nop

    .end local v5    # "_item":Ljava/lang/String;
    goto :goto_0

    .line 2540
    :cond_0
    nop

    .line 2542
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 2543
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 2540
    return-object v4

    .line 2542
    .end local v4    # "_result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v2

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 2543
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 2544
    throw v2
.end method

.method public getAllWorkSpecIds()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 842
    const-string v0, "SELECT id FROM workspec"

    .line 843
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "SELECT id FROM workspec"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 844
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 845
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v4, 0x0

    invoke-static {v3, v1, v2, v4}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v3

    .line 847
    .local v3, "_cursor":Landroid/database/Cursor;
    :try_start_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 848
    .local v4, "_result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 850
    invoke-interface {v3, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 851
    .local v5, "_item":Ljava/lang/String;
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 852
    nop

    .end local v5    # "_item":Ljava/lang/String;
    goto :goto_0

    .line 853
    :cond_0
    nop

    .line 855
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 856
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 853
    return-object v4

    .line 855
    .end local v4    # "_result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v2

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 856
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 857
    throw v2
.end method

.method public getAllWorkSpecIdsLiveData()Landroidx/lifecycle/LiveData;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 862
    const-string v0, "SELECT id FROM workspec"

    .line 863
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "SELECT id FROM workspec"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 864
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->getInvalidationTracker()Landroidx/room/InvalidationTracker;

    move-result-object v3

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/String;

    const-string/jumbo v6, "workspec"

    aput-object v6, v5, v2

    new-instance v2, Landroidx/work/impl/model/WorkSpecDao_Impl$18;

    invoke-direct {v2, p0, v1}, Landroidx/work/impl/model/WorkSpecDao_Impl$18;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomSQLiteQuery;)V

    invoke-virtual {v3, v5, v4, v2}, Landroidx/room/InvalidationTracker;->createLiveData([Ljava/lang/String;ZLjava/util/concurrent/Callable;)Landroidx/lifecycle/LiveData;

    move-result-object v2

    return-object v2
.end method

.method public getEligibleWorkForScheduling(I)Ljava/util/List;
    .locals 95
    .param p1, "schedulerLimit"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "schedulerLimit"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec;",
            ">;"
        }
    .end annotation

    .line 2615
    move-object/from16 v1, p0

    const-string v2, "SELECT * FROM workspec WHERE state=0 AND schedule_requested_at=-1 ORDER BY last_enqueue_time LIMIT (SELECT MAX(?-COUNT(*), 0) FROM workspec WHERE schedule_requested_at<>-1 AND LENGTH(content_uri_triggers)=0 AND state NOT IN (2, 3, 5))"

    .line 2616
    .local v2, "_sql":Ljava/lang/String;
    const-string v0, "SELECT * FROM workspec WHERE state=0 AND schedule_requested_at=-1 ORDER BY last_enqueue_time LIMIT (SELECT MAX(?-COUNT(*), 0) FROM workspec WHERE schedule_requested_at<>-1 AND LENGTH(content_uri_triggers)=0 AND state NOT IN (2, 3, 5))"

    const/4 v3, 0x1

    invoke-static {v0, v3}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v4

    .line 2617
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v5, 0x1

    .line 2618
    .local v5, "_argIndex":I
    move/from16 v6, p1

    int-to-long v7, v6

    invoke-virtual {v4, v5, v7, v8}, Landroidx/room/RoomSQLiteQuery;->bindLong(IJ)V

    .line 2619
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 2620
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static {v0, v4, v8, v7}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v7

    .line 2622
    .local v7, "_cursor":Landroid/database/Cursor;
    :try_start_0
    const-string v0, "id"

    invoke-static {v7, v0}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    .line 2623
    .local v0, "_cursorIndexOfId":I
    const-string/jumbo v9, "state"

    invoke-static {v7, v9}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v9

    .line 2624
    .local v9, "_cursorIndexOfState":I
    const-string/jumbo v10, "worker_class_name"

    invoke-static {v7, v10}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v10

    .line 2625
    .local v10, "_cursorIndexOfWorkerClassName":I
    const-string v11, "input_merger_class_name"

    invoke-static {v7, v11}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v11

    .line 2626
    .local v11, "_cursorIndexOfInputMergerClassName":I
    const-string v12, "input"

    invoke-static {v7, v12}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v12

    .line 2627
    .local v12, "_cursorIndexOfInput":I
    const-string v13, "output"

    invoke-static {v7, v13}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v13

    .line 2628
    .local v13, "_cursorIndexOfOutput":I
    const-string v14, "initial_delay"

    invoke-static {v7, v14}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v14

    .line 2629
    .local v14, "_cursorIndexOfInitialDelay":I
    const-string v15, "interval_duration"

    invoke-static {v7, v15}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v15

    .line 2630
    .local v15, "_cursorIndexOfIntervalDuration":I
    const-string v3, "flex_duration"

    invoke-static {v7, v3}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v3

    .line 2631
    .local v3, "_cursorIndexOfFlexDuration":I
    const-string v8, "run_attempt_count"

    invoke-static {v7, v8}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v8

    .line 2632
    .local v8, "_cursorIndexOfRunAttemptCount":I
    const-string v1, "backoff_policy"

    invoke-static {v7, v1}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 2633
    .local v1, "_cursorIndexOfBackoffPolicy":I
    move-object/from16 v16, v2

    .end local v2    # "_sql":Ljava/lang/String;
    .local v16, "_sql":Ljava/lang/String;
    :try_start_1
    const-string v2, "backoff_delay_duration"

    invoke-static {v7, v2}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 2634
    .local v2, "_cursorIndexOfBackoffDelayDuration":I
    move-object/from16 v17, v4

    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .local v17, "_statement":Landroidx/room/RoomSQLiteQuery;
    :try_start_2
    const-string v4, "last_enqueue_time"

    invoke-static {v7, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 2635
    .local v4, "_cursorIndexOfLastEnqueueTime":I
    move/from16 v18, v5

    .end local v5    # "_argIndex":I
    .local v18, "_argIndex":I
    :try_start_3
    const-string v5, "minimum_retention_duration"

    invoke-static {v7, v5}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v5

    .line 2636
    .local v5, "_cursorIndexOfMinimumRetentionDuration":I
    const-string/jumbo v6, "schedule_requested_at"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2637
    .local v6, "_cursorIndexOfScheduleRequestedAt":I
    move/from16 v19, v6

    .end local v6    # "_cursorIndexOfScheduleRequestedAt":I
    .local v19, "_cursorIndexOfScheduleRequestedAt":I
    const-string v6, "run_in_foreground"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2638
    .local v6, "_cursorIndexOfExpedited":I
    move/from16 v20, v6

    .end local v6    # "_cursorIndexOfExpedited":I
    .local v20, "_cursorIndexOfExpedited":I
    const-string v6, "out_of_quota_policy"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2639
    .local v6, "_cursorIndexOfOutOfQuotaPolicy":I
    move/from16 v21, v6

    .end local v6    # "_cursorIndexOfOutOfQuotaPolicy":I
    .local v21, "_cursorIndexOfOutOfQuotaPolicy":I
    const-string v6, "period_count"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2640
    .local v6, "_cursorIndexOfPeriodCount":I
    move/from16 v22, v6

    .end local v6    # "_cursorIndexOfPeriodCount":I
    .local v22, "_cursorIndexOfPeriodCount":I
    const-string v6, "generation"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2641
    .local v6, "_cursorIndexOfGeneration":I
    move/from16 v23, v6

    .end local v6    # "_cursorIndexOfGeneration":I
    .local v23, "_cursorIndexOfGeneration":I
    const-string v6, "next_schedule_time_override"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2642
    .local v6, "_cursorIndexOfNextScheduleTimeOverride":I
    move/from16 v24, v6

    .end local v6    # "_cursorIndexOfNextScheduleTimeOverride":I
    .local v24, "_cursorIndexOfNextScheduleTimeOverride":I
    const-string v6, "next_schedule_time_override_generation"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2643
    .local v6, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    move/from16 v25, v6

    .end local v6    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .local v25, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    const-string/jumbo v6, "stop_reason"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2644
    .local v6, "_cursorIndexOfStopReason":I
    move/from16 v26, v6

    .end local v6    # "_cursorIndexOfStopReason":I
    .local v26, "_cursorIndexOfStopReason":I
    const-string/jumbo v6, "trace_tag"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2645
    .local v6, "_cursorIndexOfTraceTag":I
    move/from16 v27, v6

    .end local v6    # "_cursorIndexOfTraceTag":I
    .local v27, "_cursorIndexOfTraceTag":I
    const-string v6, "required_network_type"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2646
    .local v6, "_cursorIndexOfRequiredNetworkType":I
    move/from16 v28, v6

    .end local v6    # "_cursorIndexOfRequiredNetworkType":I
    .local v28, "_cursorIndexOfRequiredNetworkType":I
    const-string v6, "required_network_request"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2647
    .local v6, "_cursorIndexOfRequiredNetworkRequestCompat":I
    move/from16 v29, v6

    .end local v6    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v29, "_cursorIndexOfRequiredNetworkRequestCompat":I
    const-string v6, "requires_charging"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2648
    .local v6, "_cursorIndexOfRequiresCharging":I
    move/from16 v30, v6

    .end local v6    # "_cursorIndexOfRequiresCharging":I
    .local v30, "_cursorIndexOfRequiresCharging":I
    const-string v6, "requires_device_idle"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2649
    .local v6, "_cursorIndexOfRequiresDeviceIdle":I
    move/from16 v31, v6

    .end local v6    # "_cursorIndexOfRequiresDeviceIdle":I
    .local v31, "_cursorIndexOfRequiresDeviceIdle":I
    const-string v6, "requires_battery_not_low"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2650
    .local v6, "_cursorIndexOfRequiresBatteryNotLow":I
    move/from16 v32, v6

    .end local v6    # "_cursorIndexOfRequiresBatteryNotLow":I
    .local v32, "_cursorIndexOfRequiresBatteryNotLow":I
    const-string v6, "requires_storage_not_low"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2651
    .local v6, "_cursorIndexOfRequiresStorageNotLow":I
    move/from16 v33, v6

    .end local v6    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v33, "_cursorIndexOfRequiresStorageNotLow":I
    const-string/jumbo v6, "trigger_content_update_delay"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2652
    .local v6, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    move/from16 v34, v6

    .end local v6    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v34, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    const-string/jumbo v6, "trigger_max_content_delay"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2653
    .local v6, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    move/from16 v35, v6

    .end local v6    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .local v35, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    const-string v6, "content_uri_triggers"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2654
    .local v6, "_cursorIndexOfContentUriTriggers":I
    move/from16 v36, v6

    .end local v6    # "_cursorIndexOfContentUriTriggers":I
    .local v36, "_cursorIndexOfContentUriTriggers":I
    new-instance v6, Ljava/util/ArrayList;

    move/from16 v37, v5

    .end local v5    # "_cursorIndexOfMinimumRetentionDuration":I
    .local v37, "_cursorIndexOfMinimumRetentionDuration":I
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v5

    invoke-direct {v6, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 2655
    .local v6, "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec;>;"
    :goto_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-eqz v5, :cond_6

    .line 2658
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v39, v5

    .line 2661
    .local v39, "_tmpId":Ljava/lang/String;
    invoke-interface {v7, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 2662
    .local v5, "_tmp":I
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v5}, Landroidx/work/impl/model/WorkTypeConverters;->intToState(I)Landroidx/work/WorkInfo$State;

    move-result-object v40

    .line 2664
    .local v40, "_tmpState":Landroidx/work/WorkInfo$State;
    invoke-interface {v7, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v41

    .line 2666
    .local v41, "_tmpWorkerClassName":Ljava/lang/String;
    invoke-interface {v7, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v42

    .line 2669
    .local v42, "_tmpInputMergerClassName":Ljava/lang/String;
    invoke-interface {v7, v12}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v38

    move-object/from16 v71, v38

    .line 2670
    .local v71, "_tmp_1":[B
    invoke-static/range {v71 .. v71}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v43

    .line 2673
    .local v43, "_tmpInput":Landroidx/work/Data;
    invoke-interface {v7, v13}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v38

    move-object/from16 v72, v38

    .line 2674
    .local v72, "_tmp_2":[B
    invoke-static/range {v72 .. v72}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v44

    .line 2676
    .local v44, "_tmpOutput":Landroidx/work/Data;
    invoke-interface {v7, v14}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v45

    .line 2678
    .local v45, "_tmpInitialDelay":J
    invoke-interface {v7, v15}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v47

    .line 2680
    .local v47, "_tmpIntervalDuration":J
    invoke-interface {v7, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v49

    .line 2682
    .local v49, "_tmpFlexDuration":J
    invoke-interface {v7, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v52

    .line 2685
    .local v52, "_tmpRunAttemptCount":I
    invoke-interface {v7, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v38

    move/from16 v73, v38

    .line 2686
    .local v73, "_tmp_3":I
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v73 .. v73}, Landroidx/work/impl/model/WorkTypeConverters;->intToBackoffPolicy(I)Landroidx/work/BackoffPolicy;

    move-result-object v53

    .line 2688
    .local v53, "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    invoke-interface {v7, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v54

    .line 2690
    .local v54, "_tmpBackoffDelayDuration":J
    invoke-interface {v7, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v56

    .line 2692
    .local v56, "_tmpLastEnqueueTime":J
    move/from16 v74, v0

    move/from16 v0, v37

    .end local v37    # "_cursorIndexOfMinimumRetentionDuration":I
    .local v0, "_cursorIndexOfMinimumRetentionDuration":I
    .local v74, "_cursorIndexOfId":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v58

    .line 2694
    .local v58, "_tmpMinimumRetentionDuration":J
    move/from16 v37, v0

    move/from16 v0, v19

    .end local v19    # "_cursorIndexOfScheduleRequestedAt":I
    .local v0, "_cursorIndexOfScheduleRequestedAt":I
    .restart local v37    # "_cursorIndexOfMinimumRetentionDuration":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v60

    .line 2697
    .local v60, "_tmpScheduleRequestedAt":J
    move/from16 v19, v0

    move/from16 v0, v20

    .end local v20    # "_cursorIndexOfExpedited":I
    .local v0, "_cursorIndexOfExpedited":I
    .restart local v19    # "_cursorIndexOfScheduleRequestedAt":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v20

    .line 2698
    .local v20, "_tmp_4":I
    if-eqz v20, :cond_0

    const/16 v62, 0x1

    goto :goto_1

    :cond_0
    const/16 v62, 0x0

    .line 2701
    .local v62, "_tmpExpedited":Z
    :goto_1
    move/from16 v75, v0

    move/from16 v0, v21

    .end local v21    # "_cursorIndexOfOutOfQuotaPolicy":I
    .local v0, "_cursorIndexOfOutOfQuotaPolicy":I
    .local v75, "_cursorIndexOfExpedited":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v21

    .line 2702
    .local v21, "_tmp_5":I
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v21 .. v21}, Landroidx/work/impl/model/WorkTypeConverters;->intToOutOfQuotaPolicy(I)Landroidx/work/OutOfQuotaPolicy;

    move-result-object v63

    .line 2704
    .local v63, "_tmpOutOfQuotaPolicy":Landroidx/work/OutOfQuotaPolicy;
    move/from16 v76, v0

    move/from16 v0, v22

    .end local v22    # "_cursorIndexOfPeriodCount":I
    .local v0, "_cursorIndexOfPeriodCount":I
    .local v76, "_cursorIndexOfOutOfQuotaPolicy":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v64

    .line 2706
    .local v64, "_tmpPeriodCount":I
    move/from16 v22, v0

    move/from16 v0, v23

    .end local v23    # "_cursorIndexOfGeneration":I
    .local v0, "_cursorIndexOfGeneration":I
    .restart local v22    # "_cursorIndexOfPeriodCount":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v65

    .line 2708
    .local v65, "_tmpGeneration":I
    move/from16 v23, v0

    move/from16 v0, v24

    .end local v24    # "_cursorIndexOfNextScheduleTimeOverride":I
    .local v0, "_cursorIndexOfNextScheduleTimeOverride":I
    .restart local v23    # "_cursorIndexOfGeneration":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v66

    .line 2710
    .local v66, "_tmpNextScheduleTimeOverride":J
    move/from16 v24, v0

    move/from16 v0, v25

    .end local v25    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .local v0, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .restart local v24    # "_cursorIndexOfNextScheduleTimeOverride":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v68

    .line 2712
    .local v68, "_tmpNextScheduleTimeOverrideGeneration":I
    move/from16 v25, v0

    move/from16 v0, v26

    .end local v26    # "_cursorIndexOfStopReason":I
    .local v0, "_cursorIndexOfStopReason":I
    .restart local v25    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v69

    .line 2714
    .local v69, "_tmpStopReason":I
    move/from16 v26, v0

    move/from16 v0, v27

    .end local v27    # "_cursorIndexOfTraceTag":I
    .local v0, "_cursorIndexOfTraceTag":I
    .restart local v26    # "_cursorIndexOfStopReason":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v27

    if-eqz v27, :cond_1

    .line 2715
    const/16 v27, 0x0

    move-object/from16 v70, v27

    .local v27, "_tmpTraceTag":Ljava/lang/String;
    goto :goto_2

    .line 2717
    .end local v27    # "_tmpTraceTag":Ljava/lang/String;
    :cond_1
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v27

    move-object/from16 v70, v27

    .line 2722
    .local v70, "_tmpTraceTag":Ljava/lang/String;
    :goto_2
    move/from16 v27, v0

    move/from16 v0, v28

    .end local v28    # "_cursorIndexOfRequiredNetworkType":I
    .local v0, "_cursorIndexOfRequiredNetworkType":I
    .local v27, "_cursorIndexOfTraceTag":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v28

    .line 2723
    .local v28, "_tmp_6":I
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v28 .. v28}, Landroidx/work/impl/model/WorkTypeConverters;->intToNetworkType(I)Landroidx/work/NetworkType;

    move-result-object v38

    move-object/from16 v79, v38

    .line 2726
    .local v79, "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    move/from16 v89, v0

    move/from16 v0, v29

    .end local v29    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v0, "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v89, "_cursorIndexOfRequiredNetworkType":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v29

    .line 2727
    .local v29, "_tmp_7":[B
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v29 .. v29}, Landroidx/work/impl/model/WorkTypeConverters;->toNetworkRequest$work_runtime_release([B)Landroidx/work/impl/utils/NetworkRequestCompat;

    move-result-object v78

    .line 2730
    .local v78, "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    move/from16 v90, v0

    move/from16 v0, v30

    .end local v30    # "_cursorIndexOfRequiresCharging":I
    .local v0, "_cursorIndexOfRequiresCharging":I
    .local v90, "_cursorIndexOfRequiredNetworkRequestCompat":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v30

    .line 2731
    .local v30, "_tmp_8":I
    if-eqz v30, :cond_2

    const/16 v80, 0x1

    goto :goto_3

    :cond_2
    const/16 v80, 0x0

    .line 2734
    .local v80, "_tmpRequiresCharging":Z
    :goto_3
    move/from16 v91, v0

    move/from16 v0, v31

    .end local v31    # "_cursorIndexOfRequiresDeviceIdle":I
    .local v0, "_cursorIndexOfRequiresDeviceIdle":I
    .local v91, "_cursorIndexOfRequiresCharging":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v31

    .line 2735
    .local v31, "_tmp_9":I
    if-eqz v31, :cond_3

    const/16 v81, 0x1

    goto :goto_4

    :cond_3
    const/16 v81, 0x0

    .line 2738
    .local v81, "_tmpRequiresDeviceIdle":Z
    :goto_4
    move/from16 v92, v0

    move/from16 v0, v32

    .end local v32    # "_cursorIndexOfRequiresBatteryNotLow":I
    .local v0, "_cursorIndexOfRequiresBatteryNotLow":I
    .local v92, "_cursorIndexOfRequiresDeviceIdle":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v32

    .line 2739
    .local v32, "_tmp_10":I
    if-eqz v32, :cond_4

    const/16 v82, 0x1

    goto :goto_5

    :cond_4
    const/16 v82, 0x0

    .line 2742
    .local v82, "_tmpRequiresBatteryNotLow":Z
    :goto_5
    move/from16 v93, v0

    move/from16 v0, v33

    .end local v33    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v0, "_cursorIndexOfRequiresStorageNotLow":I
    .local v93, "_cursorIndexOfRequiresBatteryNotLow":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v33

    .line 2743
    .local v33, "_tmp_11":I
    if-eqz v33, :cond_5

    const/16 v83, 0x1

    goto :goto_6

    :cond_5
    const/16 v83, 0x0

    .line 2745
    .local v83, "_tmpRequiresStorageNotLow":Z
    :goto_6
    move/from16 v94, v0

    move/from16 v0, v34

    .end local v34    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v0, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v94, "_cursorIndexOfRequiresStorageNotLow":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v84

    .line 2747
    .local v84, "_tmpContentTriggerUpdateDelayMillis":J
    move/from16 v34, v0

    move/from16 v0, v35

    .end local v35    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .local v0, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .restart local v34    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v86

    .line 2750
    .local v86, "_tmpContentTriggerMaxDelayMillis":J
    move/from16 v35, v0

    move/from16 v0, v36

    .end local v36    # "_cursorIndexOfContentUriTriggers":I
    .local v0, "_cursorIndexOfContentUriTriggers":I
    .restart local v35    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v36

    .line 2751
    .local v36, "_tmp_12":[B
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v36 .. v36}, Landroidx/work/impl/model/WorkTypeConverters;->byteArrayToSetOfTriggers([B)Ljava/util/Set;

    move-result-object v88

    .line 2752
    .local v88, "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    new-instance v77, Landroidx/work/Constraints;

    invoke-direct/range {v77 .. v88}, Landroidx/work/Constraints;-><init>(Landroidx/work/impl/utils/NetworkRequestCompat;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    move-object/from16 v51, v77

    .line 2753
    .local v51, "_tmpConstraints":Landroidx/work/Constraints;
    new-instance v38, Landroidx/work/impl/model/WorkSpec;

    invoke-direct/range {v38 .. v70}, Landroidx/work/impl/model/WorkSpec;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Ljava/lang/String;Ljava/lang/String;Landroidx/work/Data;Landroidx/work/Data;JJJLandroidx/work/Constraints;ILandroidx/work/BackoffPolicy;JJJJZLandroidx/work/OutOfQuotaPolicy;IIJIILjava/lang/String;)V

    move-object/from16 v77, v38

    .line 2754
    .local v77, "_item":Landroidx/work/impl/model/WorkSpec;
    move/from16 v38, v0

    move-object/from16 v0, v77

    .end local v77    # "_item":Landroidx/work/impl/model/WorkSpec;
    .local v0, "_item":Landroidx/work/impl/model/WorkSpec;
    .local v38, "_cursorIndexOfContentUriTriggers":I
    invoke-interface {v6, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 2755
    move/from16 v36, v38

    move/from16 v0, v74

    move/from16 v20, v75

    move/from16 v21, v76

    move/from16 v28, v89

    move/from16 v29, v90

    move/from16 v30, v91

    move/from16 v31, v92

    move/from16 v32, v93

    move/from16 v33, v94

    .end local v0    # "_item":Landroidx/work/impl/model/WorkSpec;
    .end local v5    # "_tmp":I
    .end local v20    # "_tmp_4":I
    .end local v21    # "_tmp_5":I
    .end local v28    # "_tmp_6":I
    .end local v29    # "_tmp_7":[B
    .end local v30    # "_tmp_8":I
    .end local v31    # "_tmp_9":I
    .end local v32    # "_tmp_10":I
    .end local v33    # "_tmp_11":I
    .end local v36    # "_tmp_12":[B
    .end local v39    # "_tmpId":Ljava/lang/String;
    .end local v40    # "_tmpState":Landroidx/work/WorkInfo$State;
    .end local v41    # "_tmpWorkerClassName":Ljava/lang/String;
    .end local v42    # "_tmpInputMergerClassName":Ljava/lang/String;
    .end local v43    # "_tmpInput":Landroidx/work/Data;
    .end local v44    # "_tmpOutput":Landroidx/work/Data;
    .end local v45    # "_tmpInitialDelay":J
    .end local v47    # "_tmpIntervalDuration":J
    .end local v49    # "_tmpFlexDuration":J
    .end local v51    # "_tmpConstraints":Landroidx/work/Constraints;
    .end local v52    # "_tmpRunAttemptCount":I
    .end local v53    # "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    .end local v54    # "_tmpBackoffDelayDuration":J
    .end local v56    # "_tmpLastEnqueueTime":J
    .end local v58    # "_tmpMinimumRetentionDuration":J
    .end local v60    # "_tmpScheduleRequestedAt":J
    .end local v62    # "_tmpExpedited":Z
    .end local v63    # "_tmpOutOfQuotaPolicy":Landroidx/work/OutOfQuotaPolicy;
    .end local v64    # "_tmpPeriodCount":I
    .end local v65    # "_tmpGeneration":I
    .end local v66    # "_tmpNextScheduleTimeOverride":J
    .end local v68    # "_tmpNextScheduleTimeOverrideGeneration":I
    .end local v69    # "_tmpStopReason":I
    .end local v70    # "_tmpTraceTag":Ljava/lang/String;
    .end local v71    # "_tmp_1":[B
    .end local v72    # "_tmp_2":[B
    .end local v73    # "_tmp_3":I
    .end local v78    # "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    .end local v79    # "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    .end local v80    # "_tmpRequiresCharging":Z
    .end local v81    # "_tmpRequiresDeviceIdle":Z
    .end local v82    # "_tmpRequiresBatteryNotLow":Z
    .end local v83    # "_tmpRequiresStorageNotLow":Z
    .end local v84    # "_tmpContentTriggerUpdateDelayMillis":J
    .end local v86    # "_tmpContentTriggerMaxDelayMillis":J
    .end local v88    # "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    goto/16 :goto_0

    .line 2756
    .end local v38    # "_cursorIndexOfContentUriTriggers":I
    .end local v74    # "_cursorIndexOfId":I
    .end local v75    # "_cursorIndexOfExpedited":I
    .end local v76    # "_cursorIndexOfOutOfQuotaPolicy":I
    .end local v89    # "_cursorIndexOfRequiredNetworkType":I
    .end local v90    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v91    # "_cursorIndexOfRequiresCharging":I
    .end local v92    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v93    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v94    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v0, "_cursorIndexOfId":I
    .local v20, "_cursorIndexOfExpedited":I
    .local v21, "_cursorIndexOfOutOfQuotaPolicy":I
    .local v28, "_cursorIndexOfRequiredNetworkType":I
    .local v29, "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v30, "_cursorIndexOfRequiresCharging":I
    .local v31, "_cursorIndexOfRequiresDeviceIdle":I
    .local v32, "_cursorIndexOfRequiresBatteryNotLow":I
    .local v33, "_cursorIndexOfRequiresStorageNotLow":I
    .local v36, "_cursorIndexOfContentUriTriggers":I
    :cond_6
    nop

    .line 2758
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 2759
    invoke-virtual/range {v17 .. v17}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 2756
    return-object v6

    .line 2758
    .end local v0    # "_cursorIndexOfId":I
    .end local v1    # "_cursorIndexOfBackoffPolicy":I
    .end local v2    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v3    # "_cursorIndexOfFlexDuration":I
    .end local v4    # "_cursorIndexOfLastEnqueueTime":I
    .end local v6    # "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec;>;"
    .end local v8    # "_cursorIndexOfRunAttemptCount":I
    .end local v9    # "_cursorIndexOfState":I
    .end local v10    # "_cursorIndexOfWorkerClassName":I
    .end local v11    # "_cursorIndexOfInputMergerClassName":I
    .end local v12    # "_cursorIndexOfInput":I
    .end local v13    # "_cursorIndexOfOutput":I
    .end local v14    # "_cursorIndexOfInitialDelay":I
    .end local v15    # "_cursorIndexOfIntervalDuration":I
    .end local v19    # "_cursorIndexOfScheduleRequestedAt":I
    .end local v20    # "_cursorIndexOfExpedited":I
    .end local v21    # "_cursorIndexOfOutOfQuotaPolicy":I
    .end local v22    # "_cursorIndexOfPeriodCount":I
    .end local v23    # "_cursorIndexOfGeneration":I
    .end local v24    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v25    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .end local v26    # "_cursorIndexOfStopReason":I
    .end local v27    # "_cursorIndexOfTraceTag":I
    .end local v28    # "_cursorIndexOfRequiredNetworkType":I
    .end local v29    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v30    # "_cursorIndexOfRequiresCharging":I
    .end local v31    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v32    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v33    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v34    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v35    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v36    # "_cursorIndexOfContentUriTriggers":I
    .end local v37    # "_cursorIndexOfMinimumRetentionDuration":I
    :catchall_0
    move-exception v0

    goto :goto_7

    .end local v18    # "_argIndex":I
    .local v5, "_argIndex":I
    :catchall_1
    move-exception v0

    move/from16 v18, v5

    .end local v5    # "_argIndex":I
    .restart local v18    # "_argIndex":I
    goto :goto_7

    .end local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v18    # "_argIndex":I
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v5    # "_argIndex":I
    :catchall_2
    move-exception v0

    move-object/from16 v17, v4

    move/from16 v18, v5

    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v5    # "_argIndex":I
    .restart local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v18    # "_argIndex":I
    goto :goto_7

    .end local v16    # "_sql":Ljava/lang/String;
    .end local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v18    # "_argIndex":I
    .local v2, "_sql":Ljava/lang/String;
    .restart local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v5    # "_argIndex":I
    :catchall_3
    move-exception v0

    move-object/from16 v16, v2

    move-object/from16 v17, v4

    move/from16 v18, v5

    .end local v2    # "_sql":Ljava/lang/String;
    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v5    # "_argIndex":I
    .restart local v16    # "_sql":Ljava/lang/String;
    .restart local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v18    # "_argIndex":I
    :goto_7
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 2759
    invoke-virtual/range {v17 .. v17}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 2760
    throw v0
.end method

.method public getEligibleWorkForSchedulingWithContentUris()Ljava/util/List;
    .locals 94
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec;",
            ">;"
        }
    .end annotation

    .line 2765
    move-object/from16 v1, p0

    const-string v2, "SELECT * FROM workspec WHERE state=0 AND schedule_requested_at=-1 AND LENGTH(content_uri_triggers)<>0 ORDER BY last_enqueue_time"

    .line 2766
    .local v2, "_sql":Ljava/lang/String;
    const-string v0, "SELECT * FROM workspec WHERE state=0 AND schedule_requested_at=-1 AND LENGTH(content_uri_triggers)<>0 ORDER BY last_enqueue_time"

    const/4 v3, 0x0

    invoke-static {v0, v3}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v4

    .line 2767
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 2768
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v5, 0x0

    invoke-static {v0, v4, v3, v5}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v5

    .line 2770
    .local v5, "_cursor":Landroid/database/Cursor;
    :try_start_0
    const-string v0, "id"

    invoke-static {v5, v0}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    .line 2771
    .local v0, "_cursorIndexOfId":I
    const-string/jumbo v6, "state"

    invoke-static {v5, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 2772
    .local v6, "_cursorIndexOfState":I
    const-string/jumbo v7, "worker_class_name"

    invoke-static {v5, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 2773
    .local v7, "_cursorIndexOfWorkerClassName":I
    const-string v8, "input_merger_class_name"

    invoke-static {v5, v8}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v8

    .line 2774
    .local v8, "_cursorIndexOfInputMergerClassName":I
    const-string v9, "input"

    invoke-static {v5, v9}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v9

    .line 2775
    .local v9, "_cursorIndexOfInput":I
    const-string v10, "output"

    invoke-static {v5, v10}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v10

    .line 2776
    .local v10, "_cursorIndexOfOutput":I
    const-string v11, "initial_delay"

    invoke-static {v5, v11}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v11

    .line 2777
    .local v11, "_cursorIndexOfInitialDelay":I
    const-string v12, "interval_duration"

    invoke-static {v5, v12}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v12

    .line 2778
    .local v12, "_cursorIndexOfIntervalDuration":I
    const-string v13, "flex_duration"

    invoke-static {v5, v13}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v13

    .line 2779
    .local v13, "_cursorIndexOfFlexDuration":I
    const-string v14, "run_attempt_count"

    invoke-static {v5, v14}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v14

    .line 2780
    .local v14, "_cursorIndexOfRunAttemptCount":I
    const-string v15, "backoff_policy"

    invoke-static {v5, v15}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v15

    .line 2781
    .local v15, "_cursorIndexOfBackoffPolicy":I
    const-string v3, "backoff_delay_duration"

    invoke-static {v5, v3}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v3

    .line 2782
    .local v3, "_cursorIndexOfBackoffDelayDuration":I
    const-string v1, "last_enqueue_time"

    invoke-static {v5, v1}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 2783
    .local v1, "_cursorIndexOfLastEnqueueTime":I
    move-object/from16 v16, v2

    .end local v2    # "_sql":Ljava/lang/String;
    .local v16, "_sql":Ljava/lang/String;
    :try_start_1
    const-string v2, "minimum_retention_duration"

    invoke-static {v5, v2}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 2784
    .local v2, "_cursorIndexOfMinimumRetentionDuration":I
    move-object/from16 v17, v4

    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .local v17, "_statement":Landroidx/room/RoomSQLiteQuery;
    :try_start_2
    const-string/jumbo v4, "schedule_requested_at"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 2785
    .local v4, "_cursorIndexOfScheduleRequestedAt":I
    move/from16 v18, v4

    .end local v4    # "_cursorIndexOfScheduleRequestedAt":I
    .local v18, "_cursorIndexOfScheduleRequestedAt":I
    const-string v4, "run_in_foreground"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 2786
    .local v4, "_cursorIndexOfExpedited":I
    move/from16 v19, v4

    .end local v4    # "_cursorIndexOfExpedited":I
    .local v19, "_cursorIndexOfExpedited":I
    const-string v4, "out_of_quota_policy"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 2787
    .local v4, "_cursorIndexOfOutOfQuotaPolicy":I
    move/from16 v20, v4

    .end local v4    # "_cursorIndexOfOutOfQuotaPolicy":I
    .local v20, "_cursorIndexOfOutOfQuotaPolicy":I
    const-string v4, "period_count"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 2788
    .local v4, "_cursorIndexOfPeriodCount":I
    move/from16 v21, v4

    .end local v4    # "_cursorIndexOfPeriodCount":I
    .local v21, "_cursorIndexOfPeriodCount":I
    const-string v4, "generation"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 2789
    .local v4, "_cursorIndexOfGeneration":I
    move/from16 v22, v4

    .end local v4    # "_cursorIndexOfGeneration":I
    .local v22, "_cursorIndexOfGeneration":I
    const-string v4, "next_schedule_time_override"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 2790
    .local v4, "_cursorIndexOfNextScheduleTimeOverride":I
    move/from16 v23, v4

    .end local v4    # "_cursorIndexOfNextScheduleTimeOverride":I
    .local v23, "_cursorIndexOfNextScheduleTimeOverride":I
    const-string v4, "next_schedule_time_override_generation"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 2791
    .local v4, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    move/from16 v24, v4

    .end local v4    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .local v24, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    const-string/jumbo v4, "stop_reason"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 2792
    .local v4, "_cursorIndexOfStopReason":I
    move/from16 v25, v4

    .end local v4    # "_cursorIndexOfStopReason":I
    .local v25, "_cursorIndexOfStopReason":I
    const-string/jumbo v4, "trace_tag"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 2793
    .local v4, "_cursorIndexOfTraceTag":I
    move/from16 v26, v4

    .end local v4    # "_cursorIndexOfTraceTag":I
    .local v26, "_cursorIndexOfTraceTag":I
    const-string v4, "required_network_type"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 2794
    .local v4, "_cursorIndexOfRequiredNetworkType":I
    move/from16 v27, v4

    .end local v4    # "_cursorIndexOfRequiredNetworkType":I
    .local v27, "_cursorIndexOfRequiredNetworkType":I
    const-string v4, "required_network_request"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 2795
    .local v4, "_cursorIndexOfRequiredNetworkRequestCompat":I
    move/from16 v28, v4

    .end local v4    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v28, "_cursorIndexOfRequiredNetworkRequestCompat":I
    const-string v4, "requires_charging"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 2796
    .local v4, "_cursorIndexOfRequiresCharging":I
    move/from16 v29, v4

    .end local v4    # "_cursorIndexOfRequiresCharging":I
    .local v29, "_cursorIndexOfRequiresCharging":I
    const-string v4, "requires_device_idle"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 2797
    .local v4, "_cursorIndexOfRequiresDeviceIdle":I
    move/from16 v30, v4

    .end local v4    # "_cursorIndexOfRequiresDeviceIdle":I
    .local v30, "_cursorIndexOfRequiresDeviceIdle":I
    const-string v4, "requires_battery_not_low"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 2798
    .local v4, "_cursorIndexOfRequiresBatteryNotLow":I
    move/from16 v31, v4

    .end local v4    # "_cursorIndexOfRequiresBatteryNotLow":I
    .local v31, "_cursorIndexOfRequiresBatteryNotLow":I
    const-string v4, "requires_storage_not_low"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 2799
    .local v4, "_cursorIndexOfRequiresStorageNotLow":I
    move/from16 v32, v4

    .end local v4    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v32, "_cursorIndexOfRequiresStorageNotLow":I
    const-string/jumbo v4, "trigger_content_update_delay"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 2800
    .local v4, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    move/from16 v33, v4

    .end local v4    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v33, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    const-string/jumbo v4, "trigger_max_content_delay"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 2801
    .local v4, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    move/from16 v34, v4

    .end local v4    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .local v34, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    const-string v4, "content_uri_triggers"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 2802
    .local v4, "_cursorIndexOfContentUriTriggers":I
    move/from16 v35, v4

    .end local v4    # "_cursorIndexOfContentUriTriggers":I
    .local v35, "_cursorIndexOfContentUriTriggers":I
    new-instance v4, Ljava/util/ArrayList;

    move/from16 v36, v2

    .end local v2    # "_cursorIndexOfMinimumRetentionDuration":I
    .local v36, "_cursorIndexOfMinimumRetentionDuration":I
    invoke-interface {v5}, Landroid/database/Cursor;->getCount()I

    move-result v2

    invoke-direct {v4, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 2803
    .local v4, "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec;>;"
    :goto_0
    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 2806
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v38, v2

    .line 2809
    .local v38, "_tmpId":Ljava/lang/String;
    invoke-interface {v5, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 2810
    .local v2, "_tmp":I
    sget-object v37, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v2}, Landroidx/work/impl/model/WorkTypeConverters;->intToState(I)Landroidx/work/WorkInfo$State;

    move-result-object v39

    .line 2812
    .local v39, "_tmpState":Landroidx/work/WorkInfo$State;
    invoke-interface {v5, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v40

    .line 2814
    .local v40, "_tmpWorkerClassName":Ljava/lang/String;
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v41

    .line 2817
    .local v41, "_tmpInputMergerClassName":Ljava/lang/String;
    invoke-interface {v5, v9}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v37

    move-object/from16 v70, v37

    .line 2818
    .local v70, "_tmp_1":[B
    invoke-static/range {v70 .. v70}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v42

    .line 2821
    .local v42, "_tmpInput":Landroidx/work/Data;
    invoke-interface {v5, v10}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v37

    move-object/from16 v71, v37

    .line 2822
    .local v71, "_tmp_2":[B
    invoke-static/range {v71 .. v71}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v43

    .line 2824
    .local v43, "_tmpOutput":Landroidx/work/Data;
    invoke-interface {v5, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v44

    .line 2826
    .local v44, "_tmpInitialDelay":J
    invoke-interface {v5, v12}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v46

    .line 2828
    .local v46, "_tmpIntervalDuration":J
    invoke-interface {v5, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v48

    .line 2830
    .local v48, "_tmpFlexDuration":J
    invoke-interface {v5, v14}, Landroid/database/Cursor;->getInt(I)I

    move-result v51

    .line 2833
    .local v51, "_tmpRunAttemptCount":I
    invoke-interface {v5, v15}, Landroid/database/Cursor;->getInt(I)I

    move-result v37

    move/from16 v72, v37

    .line 2834
    .local v72, "_tmp_3":I
    sget-object v37, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v72 .. v72}, Landroidx/work/impl/model/WorkTypeConverters;->intToBackoffPolicy(I)Landroidx/work/BackoffPolicy;

    move-result-object v52

    .line 2836
    .local v52, "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v53

    .line 2838
    .local v53, "_tmpBackoffDelayDuration":J
    invoke-interface {v5, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v55

    .line 2840
    .local v55, "_tmpLastEnqueueTime":J
    move/from16 v73, v0

    move/from16 v0, v36

    .end local v36    # "_cursorIndexOfMinimumRetentionDuration":I
    .local v0, "_cursorIndexOfMinimumRetentionDuration":I
    .local v73, "_cursorIndexOfId":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v57

    .line 2842
    .local v57, "_tmpMinimumRetentionDuration":J
    move/from16 v36, v0

    move/from16 v0, v18

    .end local v18    # "_cursorIndexOfScheduleRequestedAt":I
    .local v0, "_cursorIndexOfScheduleRequestedAt":I
    .restart local v36    # "_cursorIndexOfMinimumRetentionDuration":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v59

    .line 2845
    .local v59, "_tmpScheduleRequestedAt":J
    move/from16 v18, v0

    move/from16 v0, v19

    .end local v19    # "_cursorIndexOfExpedited":I
    .local v0, "_cursorIndexOfExpedited":I
    .restart local v18    # "_cursorIndexOfScheduleRequestedAt":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v19

    .line 2846
    .local v19, "_tmp_4":I
    const/16 v37, 0x1

    if-eqz v19, :cond_0

    move/from16 v61, v37

    goto :goto_1

    :cond_0
    const/16 v61, 0x0

    .line 2849
    .local v61, "_tmpExpedited":Z
    :goto_1
    move/from16 v74, v0

    move/from16 v0, v20

    .end local v20    # "_cursorIndexOfOutOfQuotaPolicy":I
    .local v0, "_cursorIndexOfOutOfQuotaPolicy":I
    .local v74, "_cursorIndexOfExpedited":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v20

    .line 2850
    .local v20, "_tmp_5":I
    sget-object v50, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v20 .. v20}, Landroidx/work/impl/model/WorkTypeConverters;->intToOutOfQuotaPolicy(I)Landroidx/work/OutOfQuotaPolicy;

    move-result-object v62

    .line 2852
    .local v62, "_tmpOutOfQuotaPolicy":Landroidx/work/OutOfQuotaPolicy;
    move/from16 v75, v0

    move/from16 v0, v21

    .end local v21    # "_cursorIndexOfPeriodCount":I
    .local v0, "_cursorIndexOfPeriodCount":I
    .local v75, "_cursorIndexOfOutOfQuotaPolicy":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v63

    .line 2854
    .local v63, "_tmpPeriodCount":I
    move/from16 v21, v0

    move/from16 v0, v22

    .end local v22    # "_cursorIndexOfGeneration":I
    .local v0, "_cursorIndexOfGeneration":I
    .restart local v21    # "_cursorIndexOfPeriodCount":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v64

    .line 2856
    .local v64, "_tmpGeneration":I
    move/from16 v22, v0

    move/from16 v0, v23

    .end local v23    # "_cursorIndexOfNextScheduleTimeOverride":I
    .local v0, "_cursorIndexOfNextScheduleTimeOverride":I
    .restart local v22    # "_cursorIndexOfGeneration":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v65

    .line 2858
    .local v65, "_tmpNextScheduleTimeOverride":J
    move/from16 v23, v0

    move/from16 v0, v24

    .end local v24    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .local v0, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .restart local v23    # "_cursorIndexOfNextScheduleTimeOverride":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v67

    .line 2860
    .local v67, "_tmpNextScheduleTimeOverrideGeneration":I
    move/from16 v24, v0

    move/from16 v0, v25

    .end local v25    # "_cursorIndexOfStopReason":I
    .local v0, "_cursorIndexOfStopReason":I
    .restart local v24    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v68

    .line 2862
    .local v68, "_tmpStopReason":I
    move/from16 v25, v0

    move/from16 v0, v26

    .end local v26    # "_cursorIndexOfTraceTag":I
    .local v0, "_cursorIndexOfTraceTag":I
    .restart local v25    # "_cursorIndexOfStopReason":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v26

    if-eqz v26, :cond_1

    .line 2863
    const/16 v26, 0x0

    move-object/from16 v69, v26

    .local v26, "_tmpTraceTag":Ljava/lang/String;
    goto :goto_2

    .line 2865
    .end local v26    # "_tmpTraceTag":Ljava/lang/String;
    :cond_1
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v69, v26

    .line 2870
    .local v69, "_tmpTraceTag":Ljava/lang/String;
    :goto_2
    move/from16 v26, v0

    move/from16 v0, v27

    .end local v27    # "_cursorIndexOfRequiredNetworkType":I
    .local v0, "_cursorIndexOfRequiredNetworkType":I
    .local v26, "_cursorIndexOfTraceTag":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v27

    .line 2871
    .local v27, "_tmp_6":I
    sget-object v50, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v27 .. v27}, Landroidx/work/impl/model/WorkTypeConverters;->intToNetworkType(I)Landroidx/work/NetworkType;

    move-result-object v50

    move-object/from16 v78, v50

    .line 2874
    .local v78, "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    move/from16 v88, v0

    move/from16 v0, v28

    .end local v28    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v0, "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v88, "_cursorIndexOfRequiredNetworkType":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v28

    .line 2875
    .local v28, "_tmp_7":[B
    sget-object v50, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v28 .. v28}, Landroidx/work/impl/model/WorkTypeConverters;->toNetworkRequest$work_runtime_release([B)Landroidx/work/impl/utils/NetworkRequestCompat;

    move-result-object v77

    .line 2878
    .local v77, "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    move/from16 v89, v0

    move/from16 v0, v29

    .end local v29    # "_cursorIndexOfRequiresCharging":I
    .local v0, "_cursorIndexOfRequiresCharging":I
    .local v89, "_cursorIndexOfRequiredNetworkRequestCompat":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v29

    .line 2879
    .local v29, "_tmp_8":I
    if-eqz v29, :cond_2

    move/from16 v79, v37

    goto :goto_3

    :cond_2
    const/16 v79, 0x0

    .line 2882
    .local v79, "_tmpRequiresCharging":Z
    :goto_3
    move/from16 v90, v0

    move/from16 v0, v30

    .end local v30    # "_cursorIndexOfRequiresDeviceIdle":I
    .local v0, "_cursorIndexOfRequiresDeviceIdle":I
    .local v90, "_cursorIndexOfRequiresCharging":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v30

    .line 2883
    .local v30, "_tmp_9":I
    if-eqz v30, :cond_3

    move/from16 v80, v37

    goto :goto_4

    :cond_3
    const/16 v80, 0x0

    .line 2886
    .local v80, "_tmpRequiresDeviceIdle":Z
    :goto_4
    move/from16 v91, v0

    move/from16 v0, v31

    .end local v31    # "_cursorIndexOfRequiresBatteryNotLow":I
    .local v0, "_cursorIndexOfRequiresBatteryNotLow":I
    .local v91, "_cursorIndexOfRequiresDeviceIdle":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v31

    .line 2887
    .local v31, "_tmp_10":I
    if-eqz v31, :cond_4

    move/from16 v81, v37

    goto :goto_5

    :cond_4
    const/16 v81, 0x0

    .line 2890
    .local v81, "_tmpRequiresBatteryNotLow":Z
    :goto_5
    move/from16 v92, v0

    move/from16 v0, v32

    .end local v32    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v0, "_cursorIndexOfRequiresStorageNotLow":I
    .local v92, "_cursorIndexOfRequiresBatteryNotLow":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v32

    .line 2891
    .local v32, "_tmp_11":I
    if-eqz v32, :cond_5

    move/from16 v82, v37

    goto :goto_6

    :cond_5
    const/16 v82, 0x0

    .line 2893
    .local v82, "_tmpRequiresStorageNotLow":Z
    :goto_6
    move/from16 v93, v0

    move/from16 v0, v33

    .end local v33    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v0, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v93, "_cursorIndexOfRequiresStorageNotLow":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v83

    .line 2895
    .local v83, "_tmpContentTriggerUpdateDelayMillis":J
    move/from16 v33, v0

    move/from16 v0, v34

    .end local v34    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .local v0, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .restart local v33    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v85

    .line 2898
    .local v85, "_tmpContentTriggerMaxDelayMillis":J
    move/from16 v34, v0

    move/from16 v0, v35

    .end local v35    # "_cursorIndexOfContentUriTriggers":I
    .local v0, "_cursorIndexOfContentUriTriggers":I
    .restart local v34    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v35

    .line 2899
    .local v35, "_tmp_12":[B
    sget-object v37, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v35 .. v35}, Landroidx/work/impl/model/WorkTypeConverters;->byteArrayToSetOfTriggers([B)Ljava/util/Set;

    move-result-object v87

    .line 2900
    .local v87, "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    new-instance v50, Landroidx/work/Constraints;

    move-object/from16 v76, v50

    invoke-direct/range {v76 .. v87}, Landroidx/work/Constraints;-><init>(Landroidx/work/impl/utils/NetworkRequestCompat;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    .line 2901
    .local v50, "_tmpConstraints":Landroidx/work/Constraints;
    new-instance v37, Landroidx/work/impl/model/WorkSpec;

    invoke-direct/range {v37 .. v69}, Landroidx/work/impl/model/WorkSpec;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Ljava/lang/String;Ljava/lang/String;Landroidx/work/Data;Landroidx/work/Data;JJJLandroidx/work/Constraints;ILandroidx/work/BackoffPolicy;JJJJZLandroidx/work/OutOfQuotaPolicy;IIJIILjava/lang/String;)V

    move-object/from16 v76, v37

    .line 2902
    .local v76, "_item":Landroidx/work/impl/model/WorkSpec;
    move/from16 v37, v0

    move-object/from16 v0, v76

    .end local v76    # "_item":Landroidx/work/impl/model/WorkSpec;
    .local v0, "_item":Landroidx/work/impl/model/WorkSpec;
    .local v37, "_cursorIndexOfContentUriTriggers":I
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 2903
    move/from16 v35, v37

    move/from16 v0, v73

    move/from16 v19, v74

    move/from16 v20, v75

    move/from16 v27, v88

    move/from16 v28, v89

    move/from16 v29, v90

    move/from16 v30, v91

    move/from16 v31, v92

    move/from16 v32, v93

    .end local v0    # "_item":Landroidx/work/impl/model/WorkSpec;
    .end local v2    # "_tmp":I
    .end local v19    # "_tmp_4":I
    .end local v20    # "_tmp_5":I
    .end local v27    # "_tmp_6":I
    .end local v28    # "_tmp_7":[B
    .end local v29    # "_tmp_8":I
    .end local v30    # "_tmp_9":I
    .end local v31    # "_tmp_10":I
    .end local v32    # "_tmp_11":I
    .end local v35    # "_tmp_12":[B
    .end local v38    # "_tmpId":Ljava/lang/String;
    .end local v39    # "_tmpState":Landroidx/work/WorkInfo$State;
    .end local v40    # "_tmpWorkerClassName":Ljava/lang/String;
    .end local v41    # "_tmpInputMergerClassName":Ljava/lang/String;
    .end local v42    # "_tmpInput":Landroidx/work/Data;
    .end local v43    # "_tmpOutput":Landroidx/work/Data;
    .end local v44    # "_tmpInitialDelay":J
    .end local v46    # "_tmpIntervalDuration":J
    .end local v48    # "_tmpFlexDuration":J
    .end local v50    # "_tmpConstraints":Landroidx/work/Constraints;
    .end local v51    # "_tmpRunAttemptCount":I
    .end local v52    # "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    .end local v53    # "_tmpBackoffDelayDuration":J
    .end local v55    # "_tmpLastEnqueueTime":J
    .end local v57    # "_tmpMinimumRetentionDuration":J
    .end local v59    # "_tmpScheduleRequestedAt":J
    .end local v61    # "_tmpExpedited":Z
    .end local v62    # "_tmpOutOfQuotaPolicy":Landroidx/work/OutOfQuotaPolicy;
    .end local v63    # "_tmpPeriodCount":I
    .end local v64    # "_tmpGeneration":I
    .end local v65    # "_tmpNextScheduleTimeOverride":J
    .end local v67    # "_tmpNextScheduleTimeOverrideGeneration":I
    .end local v68    # "_tmpStopReason":I
    .end local v69    # "_tmpTraceTag":Ljava/lang/String;
    .end local v70    # "_tmp_1":[B
    .end local v71    # "_tmp_2":[B
    .end local v72    # "_tmp_3":I
    .end local v77    # "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    .end local v78    # "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    .end local v79    # "_tmpRequiresCharging":Z
    .end local v80    # "_tmpRequiresDeviceIdle":Z
    .end local v81    # "_tmpRequiresBatteryNotLow":Z
    .end local v82    # "_tmpRequiresStorageNotLow":Z
    .end local v83    # "_tmpContentTriggerUpdateDelayMillis":J
    .end local v85    # "_tmpContentTriggerMaxDelayMillis":J
    .end local v87    # "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    goto/16 :goto_0

    .line 2904
    .end local v37    # "_cursorIndexOfContentUriTriggers":I
    .end local v73    # "_cursorIndexOfId":I
    .end local v74    # "_cursorIndexOfExpedited":I
    .end local v75    # "_cursorIndexOfOutOfQuotaPolicy":I
    .end local v88    # "_cursorIndexOfRequiredNetworkType":I
    .end local v89    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v90    # "_cursorIndexOfRequiresCharging":I
    .end local v91    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v92    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v93    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v0, "_cursorIndexOfId":I
    .local v19, "_cursorIndexOfExpedited":I
    .local v20, "_cursorIndexOfOutOfQuotaPolicy":I
    .local v27, "_cursorIndexOfRequiredNetworkType":I
    .local v28, "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v29, "_cursorIndexOfRequiresCharging":I
    .local v30, "_cursorIndexOfRequiresDeviceIdle":I
    .local v31, "_cursorIndexOfRequiresBatteryNotLow":I
    .local v32, "_cursorIndexOfRequiresStorageNotLow":I
    .local v35, "_cursorIndexOfContentUriTriggers":I
    :cond_6
    nop

    .line 2906
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 2907
    invoke-virtual/range {v17 .. v17}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 2904
    return-object v4

    .line 2906
    .end local v0    # "_cursorIndexOfId":I
    .end local v1    # "_cursorIndexOfLastEnqueueTime":I
    .end local v3    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v4    # "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec;>;"
    .end local v6    # "_cursorIndexOfState":I
    .end local v7    # "_cursorIndexOfWorkerClassName":I
    .end local v8    # "_cursorIndexOfInputMergerClassName":I
    .end local v9    # "_cursorIndexOfInput":I
    .end local v10    # "_cursorIndexOfOutput":I
    .end local v11    # "_cursorIndexOfInitialDelay":I
    .end local v12    # "_cursorIndexOfIntervalDuration":I
    .end local v13    # "_cursorIndexOfFlexDuration":I
    .end local v14    # "_cursorIndexOfRunAttemptCount":I
    .end local v15    # "_cursorIndexOfBackoffPolicy":I
    .end local v18    # "_cursorIndexOfScheduleRequestedAt":I
    .end local v19    # "_cursorIndexOfExpedited":I
    .end local v20    # "_cursorIndexOfOutOfQuotaPolicy":I
    .end local v21    # "_cursorIndexOfPeriodCount":I
    .end local v22    # "_cursorIndexOfGeneration":I
    .end local v23    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v24    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .end local v25    # "_cursorIndexOfStopReason":I
    .end local v26    # "_cursorIndexOfTraceTag":I
    .end local v27    # "_cursorIndexOfRequiredNetworkType":I
    .end local v28    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v29    # "_cursorIndexOfRequiresCharging":I
    .end local v30    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v31    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v32    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v33    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v34    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v35    # "_cursorIndexOfContentUriTriggers":I
    .end local v36    # "_cursorIndexOfMinimumRetentionDuration":I
    :catchall_0
    move-exception v0

    goto :goto_7

    .end local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    :catchall_1
    move-exception v0

    move-object/from16 v17, v4

    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    goto :goto_7

    .end local v16    # "_sql":Ljava/lang/String;
    .end local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .local v2, "_sql":Ljava/lang/String;
    .restart local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    :catchall_2
    move-exception v0

    move-object/from16 v16, v2

    move-object/from16 v17, v4

    .end local v2    # "_sql":Ljava/lang/String;
    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v16    # "_sql":Ljava/lang/String;
    .restart local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    :goto_7
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 2907
    invoke-virtual/range {v17 .. v17}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 2908
    throw v0
.end method

.method public getInputsFromPrerequisites(Ljava/lang/String;)Ljava/util/List;
    .locals 8
    .param p1, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "id"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Landroidx/work/Data;",
            ">;"
        }
    .end annotation

    .line 2460
    const-string v0, "SELECT output FROM workspec WHERE id IN\n             (SELECT prerequisite_id FROM dependency WHERE work_spec_id=?)"

    .line 2462
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "SELECT output FROM workspec WHERE id IN\n             (SELECT prerequisite_id FROM dependency WHERE work_spec_id=?)"

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 2463
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v2, 0x1

    .line 2464
    .local v2, "_argIndex":I
    invoke-virtual {v1, v2, p1}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 2465
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 2466
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v3, v1, v5, v4}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v3

    .line 2468
    .local v3, "_cursor":Landroid/database/Cursor;
    :try_start_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v6

    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 2469
    .local v4, "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/Data;>;"
    :goto_0
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 2472
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v6

    .line 2473
    .local v6, "_tmp":[B
    invoke-static {v6}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v7

    .line 2474
    .local v7, "_item":Landroidx/work/Data;
    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2475
    nop

    .end local v6    # "_tmp":[B
    .end local v7    # "_item":Landroidx/work/Data;
    goto :goto_0

    .line 2476
    :cond_0
    nop

    .line 2478
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 2479
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 2476
    return-object v4

    .line 2478
    .end local v4    # "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/Data;>;"
    :catchall_0
    move-exception v4

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 2479
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 2480
    throw v4
.end method

.method public getRecentlyCompletedWork(J)Ljava/util/List;
    .locals 95
    .param p1, "startingAt"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "startingAt"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec;",
            ">;"
        }
    .end annotation

    .line 3359
    move-object/from16 v1, p0

    const-string v2, "SELECT * FROM workspec WHERE last_enqueue_time >= ? AND state IN (2, 3, 5) ORDER BY last_enqueue_time DESC"

    .line 3360
    .local v2, "_sql":Ljava/lang/String;
    const-string v0, "SELECT * FROM workspec WHERE last_enqueue_time >= ? AND state IN (2, 3, 5) ORDER BY last_enqueue_time DESC"

    const/4 v3, 0x1

    invoke-static {v0, v3}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v4

    .line 3361
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v5, 0x1

    .line 3362
    .local v5, "_argIndex":I
    move-wide/from16 v6, p1

    invoke-virtual {v4, v5, v6, v7}, Landroidx/room/RoomSQLiteQuery;->bindLong(IJ)V

    .line 3363
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 3364
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v0, v4, v9, v8}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v8

    .line 3366
    .local v8, "_cursor":Landroid/database/Cursor;
    :try_start_0
    const-string v0, "id"

    invoke-static {v8, v0}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    .line 3367
    .local v0, "_cursorIndexOfId":I
    const-string/jumbo v10, "state"

    invoke-static {v8, v10}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v10

    .line 3368
    .local v10, "_cursorIndexOfState":I
    const-string/jumbo v11, "worker_class_name"

    invoke-static {v8, v11}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v11

    .line 3369
    .local v11, "_cursorIndexOfWorkerClassName":I
    const-string v12, "input_merger_class_name"

    invoke-static {v8, v12}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v12

    .line 3370
    .local v12, "_cursorIndexOfInputMergerClassName":I
    const-string v13, "input"

    invoke-static {v8, v13}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v13

    .line 3371
    .local v13, "_cursorIndexOfInput":I
    const-string v14, "output"

    invoke-static {v8, v14}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v14

    .line 3372
    .local v14, "_cursorIndexOfOutput":I
    const-string v15, "initial_delay"

    invoke-static {v8, v15}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v15

    .line 3373
    .local v15, "_cursorIndexOfInitialDelay":I
    const-string v3, "interval_duration"

    invoke-static {v8, v3}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v3

    .line 3374
    .local v3, "_cursorIndexOfIntervalDuration":I
    const-string v9, "flex_duration"

    invoke-static {v8, v9}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v9

    .line 3375
    .local v9, "_cursorIndexOfFlexDuration":I
    const-string v1, "run_attempt_count"

    invoke-static {v8, v1}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 3376
    .local v1, "_cursorIndexOfRunAttemptCount":I
    move-object/from16 v16, v2

    .end local v2    # "_sql":Ljava/lang/String;
    .local v16, "_sql":Ljava/lang/String;
    :try_start_1
    const-string v2, "backoff_policy"

    invoke-static {v8, v2}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 3377
    .local v2, "_cursorIndexOfBackoffPolicy":I
    move-object/from16 v17, v4

    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .local v17, "_statement":Landroidx/room/RoomSQLiteQuery;
    :try_start_2
    const-string v4, "backoff_delay_duration"

    invoke-static {v8, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 3378
    .local v4, "_cursorIndexOfBackoffDelayDuration":I
    move/from16 v18, v5

    .end local v5    # "_argIndex":I
    .local v18, "_argIndex":I
    :try_start_3
    const-string v5, "last_enqueue_time"

    invoke-static {v8, v5}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v5

    .line 3379
    .local v5, "_cursorIndexOfLastEnqueueTime":I
    const-string v6, "minimum_retention_duration"

    invoke-static {v8, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 3380
    .local v6, "_cursorIndexOfMinimumRetentionDuration":I
    const-string/jumbo v7, "schedule_requested_at"

    invoke-static {v8, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 3381
    .local v7, "_cursorIndexOfScheduleRequestedAt":I
    move/from16 v19, v7

    .end local v7    # "_cursorIndexOfScheduleRequestedAt":I
    .local v19, "_cursorIndexOfScheduleRequestedAt":I
    const-string v7, "run_in_foreground"

    invoke-static {v8, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 3382
    .local v7, "_cursorIndexOfExpedited":I
    move/from16 v20, v7

    .end local v7    # "_cursorIndexOfExpedited":I
    .local v20, "_cursorIndexOfExpedited":I
    const-string v7, "out_of_quota_policy"

    invoke-static {v8, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 3383
    .local v7, "_cursorIndexOfOutOfQuotaPolicy":I
    move/from16 v21, v7

    .end local v7    # "_cursorIndexOfOutOfQuotaPolicy":I
    .local v21, "_cursorIndexOfOutOfQuotaPolicy":I
    const-string v7, "period_count"

    invoke-static {v8, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 3384
    .local v7, "_cursorIndexOfPeriodCount":I
    move/from16 v22, v7

    .end local v7    # "_cursorIndexOfPeriodCount":I
    .local v22, "_cursorIndexOfPeriodCount":I
    const-string v7, "generation"

    invoke-static {v8, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 3385
    .local v7, "_cursorIndexOfGeneration":I
    move/from16 v23, v7

    .end local v7    # "_cursorIndexOfGeneration":I
    .local v23, "_cursorIndexOfGeneration":I
    const-string v7, "next_schedule_time_override"

    invoke-static {v8, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 3386
    .local v7, "_cursorIndexOfNextScheduleTimeOverride":I
    move/from16 v24, v7

    .end local v7    # "_cursorIndexOfNextScheduleTimeOverride":I
    .local v24, "_cursorIndexOfNextScheduleTimeOverride":I
    const-string v7, "next_schedule_time_override_generation"

    invoke-static {v8, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 3387
    .local v7, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    move/from16 v25, v7

    .end local v7    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .local v25, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    const-string/jumbo v7, "stop_reason"

    invoke-static {v8, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 3388
    .local v7, "_cursorIndexOfStopReason":I
    move/from16 v26, v7

    .end local v7    # "_cursorIndexOfStopReason":I
    .local v26, "_cursorIndexOfStopReason":I
    const-string/jumbo v7, "trace_tag"

    invoke-static {v8, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 3389
    .local v7, "_cursorIndexOfTraceTag":I
    move/from16 v27, v7

    .end local v7    # "_cursorIndexOfTraceTag":I
    .local v27, "_cursorIndexOfTraceTag":I
    const-string v7, "required_network_type"

    invoke-static {v8, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 3390
    .local v7, "_cursorIndexOfRequiredNetworkType":I
    move/from16 v28, v7

    .end local v7    # "_cursorIndexOfRequiredNetworkType":I
    .local v28, "_cursorIndexOfRequiredNetworkType":I
    const-string v7, "required_network_request"

    invoke-static {v8, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 3391
    .local v7, "_cursorIndexOfRequiredNetworkRequestCompat":I
    move/from16 v29, v7

    .end local v7    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v29, "_cursorIndexOfRequiredNetworkRequestCompat":I
    const-string v7, "requires_charging"

    invoke-static {v8, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 3392
    .local v7, "_cursorIndexOfRequiresCharging":I
    move/from16 v30, v7

    .end local v7    # "_cursorIndexOfRequiresCharging":I
    .local v30, "_cursorIndexOfRequiresCharging":I
    const-string v7, "requires_device_idle"

    invoke-static {v8, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 3393
    .local v7, "_cursorIndexOfRequiresDeviceIdle":I
    move/from16 v31, v7

    .end local v7    # "_cursorIndexOfRequiresDeviceIdle":I
    .local v31, "_cursorIndexOfRequiresDeviceIdle":I
    const-string v7, "requires_battery_not_low"

    invoke-static {v8, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 3394
    .local v7, "_cursorIndexOfRequiresBatteryNotLow":I
    move/from16 v32, v7

    .end local v7    # "_cursorIndexOfRequiresBatteryNotLow":I
    .local v32, "_cursorIndexOfRequiresBatteryNotLow":I
    const-string v7, "requires_storage_not_low"

    invoke-static {v8, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 3395
    .local v7, "_cursorIndexOfRequiresStorageNotLow":I
    move/from16 v33, v7

    .end local v7    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v33, "_cursorIndexOfRequiresStorageNotLow":I
    const-string/jumbo v7, "trigger_content_update_delay"

    invoke-static {v8, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 3396
    .local v7, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    move/from16 v34, v7

    .end local v7    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v34, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    const-string/jumbo v7, "trigger_max_content_delay"

    invoke-static {v8, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 3397
    .local v7, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    move/from16 v35, v7

    .end local v7    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .local v35, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    const-string v7, "content_uri_triggers"

    invoke-static {v8, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 3398
    .local v7, "_cursorIndexOfContentUriTriggers":I
    move/from16 v36, v7

    .end local v7    # "_cursorIndexOfContentUriTriggers":I
    .local v36, "_cursorIndexOfContentUriTriggers":I
    new-instance v7, Ljava/util/ArrayList;

    move/from16 v37, v6

    .end local v6    # "_cursorIndexOfMinimumRetentionDuration":I
    .local v37, "_cursorIndexOfMinimumRetentionDuration":I
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v6

    invoke-direct {v7, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 3399
    .local v7, "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec;>;"
    :goto_0
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-eqz v6, :cond_6

    .line 3402
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v39, v6

    .line 3405
    .local v39, "_tmpId":Ljava/lang/String;
    invoke-interface {v8, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    .line 3406
    .local v6, "_tmp":I
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v6}, Landroidx/work/impl/model/WorkTypeConverters;->intToState(I)Landroidx/work/WorkInfo$State;

    move-result-object v40

    .line 3408
    .local v40, "_tmpState":Landroidx/work/WorkInfo$State;
    invoke-interface {v8, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v41

    .line 3410
    .local v41, "_tmpWorkerClassName":Ljava/lang/String;
    invoke-interface {v8, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v42

    .line 3413
    .local v42, "_tmpInputMergerClassName":Ljava/lang/String;
    invoke-interface {v8, v13}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v38

    move-object/from16 v71, v38

    .line 3414
    .local v71, "_tmp_1":[B
    invoke-static/range {v71 .. v71}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v43

    .line 3417
    .local v43, "_tmpInput":Landroidx/work/Data;
    invoke-interface {v8, v14}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v38

    move-object/from16 v72, v38

    .line 3418
    .local v72, "_tmp_2":[B
    invoke-static/range {v72 .. v72}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v44

    .line 3420
    .local v44, "_tmpOutput":Landroidx/work/Data;
    invoke-interface {v8, v15}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v45

    .line 3422
    .local v45, "_tmpInitialDelay":J
    invoke-interface {v8, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v47

    .line 3424
    .local v47, "_tmpIntervalDuration":J
    invoke-interface {v8, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v49

    .line 3426
    .local v49, "_tmpFlexDuration":J
    invoke-interface {v8, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v52

    .line 3429
    .local v52, "_tmpRunAttemptCount":I
    invoke-interface {v8, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v38

    move/from16 v73, v38

    .line 3430
    .local v73, "_tmp_3":I
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v73 .. v73}, Landroidx/work/impl/model/WorkTypeConverters;->intToBackoffPolicy(I)Landroidx/work/BackoffPolicy;

    move-result-object v53

    .line 3432
    .local v53, "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    invoke-interface {v8, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v54

    .line 3434
    .local v54, "_tmpBackoffDelayDuration":J
    invoke-interface {v8, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v56

    .line 3436
    .local v56, "_tmpLastEnqueueTime":J
    move/from16 v74, v0

    move/from16 v0, v37

    .end local v37    # "_cursorIndexOfMinimumRetentionDuration":I
    .local v0, "_cursorIndexOfMinimumRetentionDuration":I
    .local v74, "_cursorIndexOfId":I
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v58

    .line 3438
    .local v58, "_tmpMinimumRetentionDuration":J
    move/from16 v37, v0

    move/from16 v0, v19

    .end local v19    # "_cursorIndexOfScheduleRequestedAt":I
    .local v0, "_cursorIndexOfScheduleRequestedAt":I
    .restart local v37    # "_cursorIndexOfMinimumRetentionDuration":I
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v60

    .line 3441
    .local v60, "_tmpScheduleRequestedAt":J
    move/from16 v19, v0

    move/from16 v0, v20

    .end local v20    # "_cursorIndexOfExpedited":I
    .local v0, "_cursorIndexOfExpedited":I
    .restart local v19    # "_cursorIndexOfScheduleRequestedAt":I
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v20

    .line 3442
    .local v20, "_tmp_4":I
    if-eqz v20, :cond_0

    const/16 v62, 0x1

    goto :goto_1

    :cond_0
    const/16 v62, 0x0

    .line 3445
    .local v62, "_tmpExpedited":Z
    :goto_1
    move/from16 v75, v0

    move/from16 v0, v21

    .end local v21    # "_cursorIndexOfOutOfQuotaPolicy":I
    .local v0, "_cursorIndexOfOutOfQuotaPolicy":I
    .local v75, "_cursorIndexOfExpedited":I
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v21

    .line 3446
    .local v21, "_tmp_5":I
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v21 .. v21}, Landroidx/work/impl/model/WorkTypeConverters;->intToOutOfQuotaPolicy(I)Landroidx/work/OutOfQuotaPolicy;

    move-result-object v63

    .line 3448
    .local v63, "_tmpOutOfQuotaPolicy":Landroidx/work/OutOfQuotaPolicy;
    move/from16 v76, v0

    move/from16 v0, v22

    .end local v22    # "_cursorIndexOfPeriodCount":I
    .local v0, "_cursorIndexOfPeriodCount":I
    .local v76, "_cursorIndexOfOutOfQuotaPolicy":I
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v64

    .line 3450
    .local v64, "_tmpPeriodCount":I
    move/from16 v22, v0

    move/from16 v0, v23

    .end local v23    # "_cursorIndexOfGeneration":I
    .local v0, "_cursorIndexOfGeneration":I
    .restart local v22    # "_cursorIndexOfPeriodCount":I
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v65

    .line 3452
    .local v65, "_tmpGeneration":I
    move/from16 v23, v0

    move/from16 v0, v24

    .end local v24    # "_cursorIndexOfNextScheduleTimeOverride":I
    .local v0, "_cursorIndexOfNextScheduleTimeOverride":I
    .restart local v23    # "_cursorIndexOfGeneration":I
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v66

    .line 3454
    .local v66, "_tmpNextScheduleTimeOverride":J
    move/from16 v24, v0

    move/from16 v0, v25

    .end local v25    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .local v0, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .restart local v24    # "_cursorIndexOfNextScheduleTimeOverride":I
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v68

    .line 3456
    .local v68, "_tmpNextScheduleTimeOverrideGeneration":I
    move/from16 v25, v0

    move/from16 v0, v26

    .end local v26    # "_cursorIndexOfStopReason":I
    .local v0, "_cursorIndexOfStopReason":I
    .restart local v25    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v69

    .line 3458
    .local v69, "_tmpStopReason":I
    move/from16 v26, v0

    move/from16 v0, v27

    .end local v27    # "_cursorIndexOfTraceTag":I
    .local v0, "_cursorIndexOfTraceTag":I
    .restart local v26    # "_cursorIndexOfStopReason":I
    invoke-interface {v8, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v27

    if-eqz v27, :cond_1

    .line 3459
    const/16 v27, 0x0

    move-object/from16 v70, v27

    .local v27, "_tmpTraceTag":Ljava/lang/String;
    goto :goto_2

    .line 3461
    .end local v27    # "_tmpTraceTag":Ljava/lang/String;
    :cond_1
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v27

    move-object/from16 v70, v27

    .line 3466
    .local v70, "_tmpTraceTag":Ljava/lang/String;
    :goto_2
    move/from16 v27, v0

    move/from16 v0, v28

    .end local v28    # "_cursorIndexOfRequiredNetworkType":I
    .local v0, "_cursorIndexOfRequiredNetworkType":I
    .local v27, "_cursorIndexOfTraceTag":I
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v28

    .line 3467
    .local v28, "_tmp_6":I
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v28 .. v28}, Landroidx/work/impl/model/WorkTypeConverters;->intToNetworkType(I)Landroidx/work/NetworkType;

    move-result-object v38

    move-object/from16 v79, v38

    .line 3470
    .local v79, "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    move/from16 v89, v0

    move/from16 v0, v29

    .end local v29    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v0, "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v89, "_cursorIndexOfRequiredNetworkType":I
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v29

    .line 3471
    .local v29, "_tmp_7":[B
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v29 .. v29}, Landroidx/work/impl/model/WorkTypeConverters;->toNetworkRequest$work_runtime_release([B)Landroidx/work/impl/utils/NetworkRequestCompat;

    move-result-object v78

    .line 3474
    .local v78, "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    move/from16 v90, v0

    move/from16 v0, v30

    .end local v30    # "_cursorIndexOfRequiresCharging":I
    .local v0, "_cursorIndexOfRequiresCharging":I
    .local v90, "_cursorIndexOfRequiredNetworkRequestCompat":I
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v30

    .line 3475
    .local v30, "_tmp_8":I
    if-eqz v30, :cond_2

    const/16 v80, 0x1

    goto :goto_3

    :cond_2
    const/16 v80, 0x0

    .line 3478
    .local v80, "_tmpRequiresCharging":Z
    :goto_3
    move/from16 v91, v0

    move/from16 v0, v31

    .end local v31    # "_cursorIndexOfRequiresDeviceIdle":I
    .local v0, "_cursorIndexOfRequiresDeviceIdle":I
    .local v91, "_cursorIndexOfRequiresCharging":I
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v31

    .line 3479
    .local v31, "_tmp_9":I
    if-eqz v31, :cond_3

    const/16 v81, 0x1

    goto :goto_4

    :cond_3
    const/16 v81, 0x0

    .line 3482
    .local v81, "_tmpRequiresDeviceIdle":Z
    :goto_4
    move/from16 v92, v0

    move/from16 v0, v32

    .end local v32    # "_cursorIndexOfRequiresBatteryNotLow":I
    .local v0, "_cursorIndexOfRequiresBatteryNotLow":I
    .local v92, "_cursorIndexOfRequiresDeviceIdle":I
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v32

    .line 3483
    .local v32, "_tmp_10":I
    if-eqz v32, :cond_4

    const/16 v82, 0x1

    goto :goto_5

    :cond_4
    const/16 v82, 0x0

    .line 3486
    .local v82, "_tmpRequiresBatteryNotLow":Z
    :goto_5
    move/from16 v93, v0

    move/from16 v0, v33

    .end local v33    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v0, "_cursorIndexOfRequiresStorageNotLow":I
    .local v93, "_cursorIndexOfRequiresBatteryNotLow":I
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v33

    .line 3487
    .local v33, "_tmp_11":I
    if-eqz v33, :cond_5

    const/16 v83, 0x1

    goto :goto_6

    :cond_5
    const/16 v83, 0x0

    .line 3489
    .local v83, "_tmpRequiresStorageNotLow":Z
    :goto_6
    move/from16 v94, v0

    move/from16 v0, v34

    .end local v34    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v0, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v94, "_cursorIndexOfRequiresStorageNotLow":I
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v84

    .line 3491
    .local v84, "_tmpContentTriggerUpdateDelayMillis":J
    move/from16 v34, v0

    move/from16 v0, v35

    .end local v35    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .local v0, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .restart local v34    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v86

    .line 3494
    .local v86, "_tmpContentTriggerMaxDelayMillis":J
    move/from16 v35, v0

    move/from16 v0, v36

    .end local v36    # "_cursorIndexOfContentUriTriggers":I
    .local v0, "_cursorIndexOfContentUriTriggers":I
    .restart local v35    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    invoke-interface {v8, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v36

    .line 3495
    .local v36, "_tmp_12":[B
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v36 .. v36}, Landroidx/work/impl/model/WorkTypeConverters;->byteArrayToSetOfTriggers([B)Ljava/util/Set;

    move-result-object v88

    .line 3496
    .local v88, "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    new-instance v77, Landroidx/work/Constraints;

    invoke-direct/range {v77 .. v88}, Landroidx/work/Constraints;-><init>(Landroidx/work/impl/utils/NetworkRequestCompat;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    move-object/from16 v51, v77

    .line 3497
    .local v51, "_tmpConstraints":Landroidx/work/Constraints;
    new-instance v38, Landroidx/work/impl/model/WorkSpec;

    invoke-direct/range {v38 .. v70}, Landroidx/work/impl/model/WorkSpec;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Ljava/lang/String;Ljava/lang/String;Landroidx/work/Data;Landroidx/work/Data;JJJLandroidx/work/Constraints;ILandroidx/work/BackoffPolicy;JJJJZLandroidx/work/OutOfQuotaPolicy;IIJIILjava/lang/String;)V

    move-object/from16 v77, v38

    .line 3498
    .local v77, "_item":Landroidx/work/impl/model/WorkSpec;
    move/from16 v38, v0

    move-object/from16 v0, v77

    .end local v77    # "_item":Landroidx/work/impl/model/WorkSpec;
    .local v0, "_item":Landroidx/work/impl/model/WorkSpec;
    .local v38, "_cursorIndexOfContentUriTriggers":I
    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 3499
    move/from16 v36, v38

    move/from16 v0, v74

    move/from16 v20, v75

    move/from16 v21, v76

    move/from16 v28, v89

    move/from16 v29, v90

    move/from16 v30, v91

    move/from16 v31, v92

    move/from16 v32, v93

    move/from16 v33, v94

    .end local v0    # "_item":Landroidx/work/impl/model/WorkSpec;
    .end local v6    # "_tmp":I
    .end local v20    # "_tmp_4":I
    .end local v21    # "_tmp_5":I
    .end local v28    # "_tmp_6":I
    .end local v29    # "_tmp_7":[B
    .end local v30    # "_tmp_8":I
    .end local v31    # "_tmp_9":I
    .end local v32    # "_tmp_10":I
    .end local v33    # "_tmp_11":I
    .end local v36    # "_tmp_12":[B
    .end local v39    # "_tmpId":Ljava/lang/String;
    .end local v40    # "_tmpState":Landroidx/work/WorkInfo$State;
    .end local v41    # "_tmpWorkerClassName":Ljava/lang/String;
    .end local v42    # "_tmpInputMergerClassName":Ljava/lang/String;
    .end local v43    # "_tmpInput":Landroidx/work/Data;
    .end local v44    # "_tmpOutput":Landroidx/work/Data;
    .end local v45    # "_tmpInitialDelay":J
    .end local v47    # "_tmpIntervalDuration":J
    .end local v49    # "_tmpFlexDuration":J
    .end local v51    # "_tmpConstraints":Landroidx/work/Constraints;
    .end local v52    # "_tmpRunAttemptCount":I
    .end local v53    # "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    .end local v54    # "_tmpBackoffDelayDuration":J
    .end local v56    # "_tmpLastEnqueueTime":J
    .end local v58    # "_tmpMinimumRetentionDuration":J
    .end local v60    # "_tmpScheduleRequestedAt":J
    .end local v62    # "_tmpExpedited":Z
    .end local v63    # "_tmpOutOfQuotaPolicy":Landroidx/work/OutOfQuotaPolicy;
    .end local v64    # "_tmpPeriodCount":I
    .end local v65    # "_tmpGeneration":I
    .end local v66    # "_tmpNextScheduleTimeOverride":J
    .end local v68    # "_tmpNextScheduleTimeOverrideGeneration":I
    .end local v69    # "_tmpStopReason":I
    .end local v70    # "_tmpTraceTag":Ljava/lang/String;
    .end local v71    # "_tmp_1":[B
    .end local v72    # "_tmp_2":[B
    .end local v73    # "_tmp_3":I
    .end local v78    # "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    .end local v79    # "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    .end local v80    # "_tmpRequiresCharging":Z
    .end local v81    # "_tmpRequiresDeviceIdle":Z
    .end local v82    # "_tmpRequiresBatteryNotLow":Z
    .end local v83    # "_tmpRequiresStorageNotLow":Z
    .end local v84    # "_tmpContentTriggerUpdateDelayMillis":J
    .end local v86    # "_tmpContentTriggerMaxDelayMillis":J
    .end local v88    # "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    goto/16 :goto_0

    .line 3500
    .end local v38    # "_cursorIndexOfContentUriTriggers":I
    .end local v74    # "_cursorIndexOfId":I
    .end local v75    # "_cursorIndexOfExpedited":I
    .end local v76    # "_cursorIndexOfOutOfQuotaPolicy":I
    .end local v89    # "_cursorIndexOfRequiredNetworkType":I
    .end local v90    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v91    # "_cursorIndexOfRequiresCharging":I
    .end local v92    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v93    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v94    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v0, "_cursorIndexOfId":I
    .local v20, "_cursorIndexOfExpedited":I
    .local v21, "_cursorIndexOfOutOfQuotaPolicy":I
    .local v28, "_cursorIndexOfRequiredNetworkType":I
    .local v29, "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v30, "_cursorIndexOfRequiresCharging":I
    .local v31, "_cursorIndexOfRequiresDeviceIdle":I
    .local v32, "_cursorIndexOfRequiresBatteryNotLow":I
    .local v33, "_cursorIndexOfRequiresStorageNotLow":I
    .local v36, "_cursorIndexOfContentUriTriggers":I
    :cond_6
    nop

    .line 3502
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 3503
    invoke-virtual/range {v17 .. v17}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 3500
    return-object v7

    .line 3502
    .end local v0    # "_cursorIndexOfId":I
    .end local v1    # "_cursorIndexOfRunAttemptCount":I
    .end local v2    # "_cursorIndexOfBackoffPolicy":I
    .end local v3    # "_cursorIndexOfIntervalDuration":I
    .end local v4    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v5    # "_cursorIndexOfLastEnqueueTime":I
    .end local v7    # "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec;>;"
    .end local v9    # "_cursorIndexOfFlexDuration":I
    .end local v10    # "_cursorIndexOfState":I
    .end local v11    # "_cursorIndexOfWorkerClassName":I
    .end local v12    # "_cursorIndexOfInputMergerClassName":I
    .end local v13    # "_cursorIndexOfInput":I
    .end local v14    # "_cursorIndexOfOutput":I
    .end local v15    # "_cursorIndexOfInitialDelay":I
    .end local v19    # "_cursorIndexOfScheduleRequestedAt":I
    .end local v20    # "_cursorIndexOfExpedited":I
    .end local v21    # "_cursorIndexOfOutOfQuotaPolicy":I
    .end local v22    # "_cursorIndexOfPeriodCount":I
    .end local v23    # "_cursorIndexOfGeneration":I
    .end local v24    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v25    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .end local v26    # "_cursorIndexOfStopReason":I
    .end local v27    # "_cursorIndexOfTraceTag":I
    .end local v28    # "_cursorIndexOfRequiredNetworkType":I
    .end local v29    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v30    # "_cursorIndexOfRequiresCharging":I
    .end local v31    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v32    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v33    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v34    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v35    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v36    # "_cursorIndexOfContentUriTriggers":I
    .end local v37    # "_cursorIndexOfMinimumRetentionDuration":I
    :catchall_0
    move-exception v0

    goto :goto_7

    .end local v18    # "_argIndex":I
    .local v5, "_argIndex":I
    :catchall_1
    move-exception v0

    move/from16 v18, v5

    .end local v5    # "_argIndex":I
    .restart local v18    # "_argIndex":I
    goto :goto_7

    .end local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v18    # "_argIndex":I
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v5    # "_argIndex":I
    :catchall_2
    move-exception v0

    move-object/from16 v17, v4

    move/from16 v18, v5

    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v5    # "_argIndex":I
    .restart local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v18    # "_argIndex":I
    goto :goto_7

    .end local v16    # "_sql":Ljava/lang/String;
    .end local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v18    # "_argIndex":I
    .local v2, "_sql":Ljava/lang/String;
    .restart local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v5    # "_argIndex":I
    :catchall_3
    move-exception v0

    move-object/from16 v16, v2

    move-object/from16 v17, v4

    move/from16 v18, v5

    .end local v2    # "_sql":Ljava/lang/String;
    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v5    # "_argIndex":I
    .restart local v16    # "_sql":Ljava/lang/String;
    .restart local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v18    # "_argIndex":I
    :goto_7
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 3503
    invoke-virtual/range {v17 .. v17}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 3504
    throw v0
.end method

.method public getRunningWork()Ljava/util/List;
    .locals 94
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec;",
            ">;"
        }
    .end annotation

    .line 3211
    move-object/from16 v1, p0

    const-string v2, "SELECT * FROM workspec WHERE state=1"

    .line 3212
    .local v2, "_sql":Ljava/lang/String;
    const-string v0, "SELECT * FROM workspec WHERE state=1"

    const/4 v3, 0x0

    invoke-static {v0, v3}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v4

    .line 3213
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 3214
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v5, 0x0

    invoke-static {v0, v4, v3, v5}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v5

    .line 3216
    .local v5, "_cursor":Landroid/database/Cursor;
    :try_start_0
    const-string v0, "id"

    invoke-static {v5, v0}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    .line 3217
    .local v0, "_cursorIndexOfId":I
    const-string/jumbo v6, "state"

    invoke-static {v5, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 3218
    .local v6, "_cursorIndexOfState":I
    const-string/jumbo v7, "worker_class_name"

    invoke-static {v5, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 3219
    .local v7, "_cursorIndexOfWorkerClassName":I
    const-string v8, "input_merger_class_name"

    invoke-static {v5, v8}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v8

    .line 3220
    .local v8, "_cursorIndexOfInputMergerClassName":I
    const-string v9, "input"

    invoke-static {v5, v9}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v9

    .line 3221
    .local v9, "_cursorIndexOfInput":I
    const-string v10, "output"

    invoke-static {v5, v10}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v10

    .line 3222
    .local v10, "_cursorIndexOfOutput":I
    const-string v11, "initial_delay"

    invoke-static {v5, v11}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v11

    .line 3223
    .local v11, "_cursorIndexOfInitialDelay":I
    const-string v12, "interval_duration"

    invoke-static {v5, v12}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v12

    .line 3224
    .local v12, "_cursorIndexOfIntervalDuration":I
    const-string v13, "flex_duration"

    invoke-static {v5, v13}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v13

    .line 3225
    .local v13, "_cursorIndexOfFlexDuration":I
    const-string v14, "run_attempt_count"

    invoke-static {v5, v14}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v14

    .line 3226
    .local v14, "_cursorIndexOfRunAttemptCount":I
    const-string v15, "backoff_policy"

    invoke-static {v5, v15}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v15

    .line 3227
    .local v15, "_cursorIndexOfBackoffPolicy":I
    const-string v3, "backoff_delay_duration"

    invoke-static {v5, v3}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v3

    .line 3228
    .local v3, "_cursorIndexOfBackoffDelayDuration":I
    const-string v1, "last_enqueue_time"

    invoke-static {v5, v1}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 3229
    .local v1, "_cursorIndexOfLastEnqueueTime":I
    move-object/from16 v16, v2

    .end local v2    # "_sql":Ljava/lang/String;
    .local v16, "_sql":Ljava/lang/String;
    :try_start_1
    const-string v2, "minimum_retention_duration"

    invoke-static {v5, v2}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 3230
    .local v2, "_cursorIndexOfMinimumRetentionDuration":I
    move-object/from16 v17, v4

    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .local v17, "_statement":Landroidx/room/RoomSQLiteQuery;
    :try_start_2
    const-string/jumbo v4, "schedule_requested_at"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3231
    .local v4, "_cursorIndexOfScheduleRequestedAt":I
    move/from16 v18, v4

    .end local v4    # "_cursorIndexOfScheduleRequestedAt":I
    .local v18, "_cursorIndexOfScheduleRequestedAt":I
    const-string v4, "run_in_foreground"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3232
    .local v4, "_cursorIndexOfExpedited":I
    move/from16 v19, v4

    .end local v4    # "_cursorIndexOfExpedited":I
    .local v19, "_cursorIndexOfExpedited":I
    const-string v4, "out_of_quota_policy"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3233
    .local v4, "_cursorIndexOfOutOfQuotaPolicy":I
    move/from16 v20, v4

    .end local v4    # "_cursorIndexOfOutOfQuotaPolicy":I
    .local v20, "_cursorIndexOfOutOfQuotaPolicy":I
    const-string v4, "period_count"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3234
    .local v4, "_cursorIndexOfPeriodCount":I
    move/from16 v21, v4

    .end local v4    # "_cursorIndexOfPeriodCount":I
    .local v21, "_cursorIndexOfPeriodCount":I
    const-string v4, "generation"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3235
    .local v4, "_cursorIndexOfGeneration":I
    move/from16 v22, v4

    .end local v4    # "_cursorIndexOfGeneration":I
    .local v22, "_cursorIndexOfGeneration":I
    const-string v4, "next_schedule_time_override"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3236
    .local v4, "_cursorIndexOfNextScheduleTimeOverride":I
    move/from16 v23, v4

    .end local v4    # "_cursorIndexOfNextScheduleTimeOverride":I
    .local v23, "_cursorIndexOfNextScheduleTimeOverride":I
    const-string v4, "next_schedule_time_override_generation"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3237
    .local v4, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    move/from16 v24, v4

    .end local v4    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .local v24, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    const-string/jumbo v4, "stop_reason"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3238
    .local v4, "_cursorIndexOfStopReason":I
    move/from16 v25, v4

    .end local v4    # "_cursorIndexOfStopReason":I
    .local v25, "_cursorIndexOfStopReason":I
    const-string/jumbo v4, "trace_tag"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3239
    .local v4, "_cursorIndexOfTraceTag":I
    move/from16 v26, v4

    .end local v4    # "_cursorIndexOfTraceTag":I
    .local v26, "_cursorIndexOfTraceTag":I
    const-string v4, "required_network_type"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3240
    .local v4, "_cursorIndexOfRequiredNetworkType":I
    move/from16 v27, v4

    .end local v4    # "_cursorIndexOfRequiredNetworkType":I
    .local v27, "_cursorIndexOfRequiredNetworkType":I
    const-string v4, "required_network_request"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3241
    .local v4, "_cursorIndexOfRequiredNetworkRequestCompat":I
    move/from16 v28, v4

    .end local v4    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v28, "_cursorIndexOfRequiredNetworkRequestCompat":I
    const-string v4, "requires_charging"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3242
    .local v4, "_cursorIndexOfRequiresCharging":I
    move/from16 v29, v4

    .end local v4    # "_cursorIndexOfRequiresCharging":I
    .local v29, "_cursorIndexOfRequiresCharging":I
    const-string v4, "requires_device_idle"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3243
    .local v4, "_cursorIndexOfRequiresDeviceIdle":I
    move/from16 v30, v4

    .end local v4    # "_cursorIndexOfRequiresDeviceIdle":I
    .local v30, "_cursorIndexOfRequiresDeviceIdle":I
    const-string v4, "requires_battery_not_low"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3244
    .local v4, "_cursorIndexOfRequiresBatteryNotLow":I
    move/from16 v31, v4

    .end local v4    # "_cursorIndexOfRequiresBatteryNotLow":I
    .local v31, "_cursorIndexOfRequiresBatteryNotLow":I
    const-string v4, "requires_storage_not_low"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3245
    .local v4, "_cursorIndexOfRequiresStorageNotLow":I
    move/from16 v32, v4

    .end local v4    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v32, "_cursorIndexOfRequiresStorageNotLow":I
    const-string/jumbo v4, "trigger_content_update_delay"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3246
    .local v4, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    move/from16 v33, v4

    .end local v4    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v33, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    const-string/jumbo v4, "trigger_max_content_delay"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3247
    .local v4, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    move/from16 v34, v4

    .end local v4    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .local v34, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    const-string v4, "content_uri_triggers"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3248
    .local v4, "_cursorIndexOfContentUriTriggers":I
    move/from16 v35, v4

    .end local v4    # "_cursorIndexOfContentUriTriggers":I
    .local v35, "_cursorIndexOfContentUriTriggers":I
    new-instance v4, Ljava/util/ArrayList;

    move/from16 v36, v2

    .end local v2    # "_cursorIndexOfMinimumRetentionDuration":I
    .local v36, "_cursorIndexOfMinimumRetentionDuration":I
    invoke-interface {v5}, Landroid/database/Cursor;->getCount()I

    move-result v2

    invoke-direct {v4, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 3249
    .local v4, "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec;>;"
    :goto_0
    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 3252
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v38, v2

    .line 3255
    .local v38, "_tmpId":Ljava/lang/String;
    invoke-interface {v5, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 3256
    .local v2, "_tmp":I
    sget-object v37, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v2}, Landroidx/work/impl/model/WorkTypeConverters;->intToState(I)Landroidx/work/WorkInfo$State;

    move-result-object v39

    .line 3258
    .local v39, "_tmpState":Landroidx/work/WorkInfo$State;
    invoke-interface {v5, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v40

    .line 3260
    .local v40, "_tmpWorkerClassName":Ljava/lang/String;
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v41

    .line 3263
    .local v41, "_tmpInputMergerClassName":Ljava/lang/String;
    invoke-interface {v5, v9}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v37

    move-object/from16 v70, v37

    .line 3264
    .local v70, "_tmp_1":[B
    invoke-static/range {v70 .. v70}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v42

    .line 3267
    .local v42, "_tmpInput":Landroidx/work/Data;
    invoke-interface {v5, v10}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v37

    move-object/from16 v71, v37

    .line 3268
    .local v71, "_tmp_2":[B
    invoke-static/range {v71 .. v71}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v43

    .line 3270
    .local v43, "_tmpOutput":Landroidx/work/Data;
    invoke-interface {v5, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v44

    .line 3272
    .local v44, "_tmpInitialDelay":J
    invoke-interface {v5, v12}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v46

    .line 3274
    .local v46, "_tmpIntervalDuration":J
    invoke-interface {v5, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v48

    .line 3276
    .local v48, "_tmpFlexDuration":J
    invoke-interface {v5, v14}, Landroid/database/Cursor;->getInt(I)I

    move-result v51

    .line 3279
    .local v51, "_tmpRunAttemptCount":I
    invoke-interface {v5, v15}, Landroid/database/Cursor;->getInt(I)I

    move-result v37

    move/from16 v72, v37

    .line 3280
    .local v72, "_tmp_3":I
    sget-object v37, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v72 .. v72}, Landroidx/work/impl/model/WorkTypeConverters;->intToBackoffPolicy(I)Landroidx/work/BackoffPolicy;

    move-result-object v52

    .line 3282
    .local v52, "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v53

    .line 3284
    .local v53, "_tmpBackoffDelayDuration":J
    invoke-interface {v5, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v55

    .line 3286
    .local v55, "_tmpLastEnqueueTime":J
    move/from16 v73, v0

    move/from16 v0, v36

    .end local v36    # "_cursorIndexOfMinimumRetentionDuration":I
    .local v0, "_cursorIndexOfMinimumRetentionDuration":I
    .local v73, "_cursorIndexOfId":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v57

    .line 3288
    .local v57, "_tmpMinimumRetentionDuration":J
    move/from16 v36, v0

    move/from16 v0, v18

    .end local v18    # "_cursorIndexOfScheduleRequestedAt":I
    .local v0, "_cursorIndexOfScheduleRequestedAt":I
    .restart local v36    # "_cursorIndexOfMinimumRetentionDuration":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v59

    .line 3291
    .local v59, "_tmpScheduleRequestedAt":J
    move/from16 v18, v0

    move/from16 v0, v19

    .end local v19    # "_cursorIndexOfExpedited":I
    .local v0, "_cursorIndexOfExpedited":I
    .restart local v18    # "_cursorIndexOfScheduleRequestedAt":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v19

    .line 3292
    .local v19, "_tmp_4":I
    const/16 v37, 0x1

    if-eqz v19, :cond_0

    move/from16 v61, v37

    goto :goto_1

    :cond_0
    const/16 v61, 0x0

    .line 3295
    .local v61, "_tmpExpedited":Z
    :goto_1
    move/from16 v74, v0

    move/from16 v0, v20

    .end local v20    # "_cursorIndexOfOutOfQuotaPolicy":I
    .local v0, "_cursorIndexOfOutOfQuotaPolicy":I
    .local v74, "_cursorIndexOfExpedited":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v20

    .line 3296
    .local v20, "_tmp_5":I
    sget-object v50, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v20 .. v20}, Landroidx/work/impl/model/WorkTypeConverters;->intToOutOfQuotaPolicy(I)Landroidx/work/OutOfQuotaPolicy;

    move-result-object v62

    .line 3298
    .local v62, "_tmpOutOfQuotaPolicy":Landroidx/work/OutOfQuotaPolicy;
    move/from16 v75, v0

    move/from16 v0, v21

    .end local v21    # "_cursorIndexOfPeriodCount":I
    .local v0, "_cursorIndexOfPeriodCount":I
    .local v75, "_cursorIndexOfOutOfQuotaPolicy":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v63

    .line 3300
    .local v63, "_tmpPeriodCount":I
    move/from16 v21, v0

    move/from16 v0, v22

    .end local v22    # "_cursorIndexOfGeneration":I
    .local v0, "_cursorIndexOfGeneration":I
    .restart local v21    # "_cursorIndexOfPeriodCount":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v64

    .line 3302
    .local v64, "_tmpGeneration":I
    move/from16 v22, v0

    move/from16 v0, v23

    .end local v23    # "_cursorIndexOfNextScheduleTimeOverride":I
    .local v0, "_cursorIndexOfNextScheduleTimeOverride":I
    .restart local v22    # "_cursorIndexOfGeneration":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v65

    .line 3304
    .local v65, "_tmpNextScheduleTimeOverride":J
    move/from16 v23, v0

    move/from16 v0, v24

    .end local v24    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .local v0, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .restart local v23    # "_cursorIndexOfNextScheduleTimeOverride":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v67

    .line 3306
    .local v67, "_tmpNextScheduleTimeOverrideGeneration":I
    move/from16 v24, v0

    move/from16 v0, v25

    .end local v25    # "_cursorIndexOfStopReason":I
    .local v0, "_cursorIndexOfStopReason":I
    .restart local v24    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v68

    .line 3308
    .local v68, "_tmpStopReason":I
    move/from16 v25, v0

    move/from16 v0, v26

    .end local v26    # "_cursorIndexOfTraceTag":I
    .local v0, "_cursorIndexOfTraceTag":I
    .restart local v25    # "_cursorIndexOfStopReason":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v26

    if-eqz v26, :cond_1

    .line 3309
    const/16 v26, 0x0

    move-object/from16 v69, v26

    .local v26, "_tmpTraceTag":Ljava/lang/String;
    goto :goto_2

    .line 3311
    .end local v26    # "_tmpTraceTag":Ljava/lang/String;
    :cond_1
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v69, v26

    .line 3316
    .local v69, "_tmpTraceTag":Ljava/lang/String;
    :goto_2
    move/from16 v26, v0

    move/from16 v0, v27

    .end local v27    # "_cursorIndexOfRequiredNetworkType":I
    .local v0, "_cursorIndexOfRequiredNetworkType":I
    .local v26, "_cursorIndexOfTraceTag":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v27

    .line 3317
    .local v27, "_tmp_6":I
    sget-object v50, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v27 .. v27}, Landroidx/work/impl/model/WorkTypeConverters;->intToNetworkType(I)Landroidx/work/NetworkType;

    move-result-object v50

    move-object/from16 v78, v50

    .line 3320
    .local v78, "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    move/from16 v88, v0

    move/from16 v0, v28

    .end local v28    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v0, "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v88, "_cursorIndexOfRequiredNetworkType":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v28

    .line 3321
    .local v28, "_tmp_7":[B
    sget-object v50, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v28 .. v28}, Landroidx/work/impl/model/WorkTypeConverters;->toNetworkRequest$work_runtime_release([B)Landroidx/work/impl/utils/NetworkRequestCompat;

    move-result-object v77

    .line 3324
    .local v77, "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    move/from16 v89, v0

    move/from16 v0, v29

    .end local v29    # "_cursorIndexOfRequiresCharging":I
    .local v0, "_cursorIndexOfRequiresCharging":I
    .local v89, "_cursorIndexOfRequiredNetworkRequestCompat":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v29

    .line 3325
    .local v29, "_tmp_8":I
    if-eqz v29, :cond_2

    move/from16 v79, v37

    goto :goto_3

    :cond_2
    const/16 v79, 0x0

    .line 3328
    .local v79, "_tmpRequiresCharging":Z
    :goto_3
    move/from16 v90, v0

    move/from16 v0, v30

    .end local v30    # "_cursorIndexOfRequiresDeviceIdle":I
    .local v0, "_cursorIndexOfRequiresDeviceIdle":I
    .local v90, "_cursorIndexOfRequiresCharging":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v30

    .line 3329
    .local v30, "_tmp_9":I
    if-eqz v30, :cond_3

    move/from16 v80, v37

    goto :goto_4

    :cond_3
    const/16 v80, 0x0

    .line 3332
    .local v80, "_tmpRequiresDeviceIdle":Z
    :goto_4
    move/from16 v91, v0

    move/from16 v0, v31

    .end local v31    # "_cursorIndexOfRequiresBatteryNotLow":I
    .local v0, "_cursorIndexOfRequiresBatteryNotLow":I
    .local v91, "_cursorIndexOfRequiresDeviceIdle":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v31

    .line 3333
    .local v31, "_tmp_10":I
    if-eqz v31, :cond_4

    move/from16 v81, v37

    goto :goto_5

    :cond_4
    const/16 v81, 0x0

    .line 3336
    .local v81, "_tmpRequiresBatteryNotLow":Z
    :goto_5
    move/from16 v92, v0

    move/from16 v0, v32

    .end local v32    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v0, "_cursorIndexOfRequiresStorageNotLow":I
    .local v92, "_cursorIndexOfRequiresBatteryNotLow":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v32

    .line 3337
    .local v32, "_tmp_11":I
    if-eqz v32, :cond_5

    move/from16 v82, v37

    goto :goto_6

    :cond_5
    const/16 v82, 0x0

    .line 3339
    .local v82, "_tmpRequiresStorageNotLow":Z
    :goto_6
    move/from16 v93, v0

    move/from16 v0, v33

    .end local v33    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v0, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v93, "_cursorIndexOfRequiresStorageNotLow":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v83

    .line 3341
    .local v83, "_tmpContentTriggerUpdateDelayMillis":J
    move/from16 v33, v0

    move/from16 v0, v34

    .end local v34    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .local v0, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .restart local v33    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v85

    .line 3344
    .local v85, "_tmpContentTriggerMaxDelayMillis":J
    move/from16 v34, v0

    move/from16 v0, v35

    .end local v35    # "_cursorIndexOfContentUriTriggers":I
    .local v0, "_cursorIndexOfContentUriTriggers":I
    .restart local v34    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v35

    .line 3345
    .local v35, "_tmp_12":[B
    sget-object v37, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v35 .. v35}, Landroidx/work/impl/model/WorkTypeConverters;->byteArrayToSetOfTriggers([B)Ljava/util/Set;

    move-result-object v87

    .line 3346
    .local v87, "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    new-instance v50, Landroidx/work/Constraints;

    move-object/from16 v76, v50

    invoke-direct/range {v76 .. v87}, Landroidx/work/Constraints;-><init>(Landroidx/work/impl/utils/NetworkRequestCompat;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    .line 3347
    .local v50, "_tmpConstraints":Landroidx/work/Constraints;
    new-instance v37, Landroidx/work/impl/model/WorkSpec;

    invoke-direct/range {v37 .. v69}, Landroidx/work/impl/model/WorkSpec;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Ljava/lang/String;Ljava/lang/String;Landroidx/work/Data;Landroidx/work/Data;JJJLandroidx/work/Constraints;ILandroidx/work/BackoffPolicy;JJJJZLandroidx/work/OutOfQuotaPolicy;IIJIILjava/lang/String;)V

    move-object/from16 v76, v37

    .line 3348
    .local v76, "_item":Landroidx/work/impl/model/WorkSpec;
    move/from16 v37, v0

    move-object/from16 v0, v76

    .end local v76    # "_item":Landroidx/work/impl/model/WorkSpec;
    .local v0, "_item":Landroidx/work/impl/model/WorkSpec;
    .local v37, "_cursorIndexOfContentUriTriggers":I
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 3349
    move/from16 v35, v37

    move/from16 v0, v73

    move/from16 v19, v74

    move/from16 v20, v75

    move/from16 v27, v88

    move/from16 v28, v89

    move/from16 v29, v90

    move/from16 v30, v91

    move/from16 v31, v92

    move/from16 v32, v93

    .end local v0    # "_item":Landroidx/work/impl/model/WorkSpec;
    .end local v2    # "_tmp":I
    .end local v19    # "_tmp_4":I
    .end local v20    # "_tmp_5":I
    .end local v27    # "_tmp_6":I
    .end local v28    # "_tmp_7":[B
    .end local v29    # "_tmp_8":I
    .end local v30    # "_tmp_9":I
    .end local v31    # "_tmp_10":I
    .end local v32    # "_tmp_11":I
    .end local v35    # "_tmp_12":[B
    .end local v38    # "_tmpId":Ljava/lang/String;
    .end local v39    # "_tmpState":Landroidx/work/WorkInfo$State;
    .end local v40    # "_tmpWorkerClassName":Ljava/lang/String;
    .end local v41    # "_tmpInputMergerClassName":Ljava/lang/String;
    .end local v42    # "_tmpInput":Landroidx/work/Data;
    .end local v43    # "_tmpOutput":Landroidx/work/Data;
    .end local v44    # "_tmpInitialDelay":J
    .end local v46    # "_tmpIntervalDuration":J
    .end local v48    # "_tmpFlexDuration":J
    .end local v50    # "_tmpConstraints":Landroidx/work/Constraints;
    .end local v51    # "_tmpRunAttemptCount":I
    .end local v52    # "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    .end local v53    # "_tmpBackoffDelayDuration":J
    .end local v55    # "_tmpLastEnqueueTime":J
    .end local v57    # "_tmpMinimumRetentionDuration":J
    .end local v59    # "_tmpScheduleRequestedAt":J
    .end local v61    # "_tmpExpedited":Z
    .end local v62    # "_tmpOutOfQuotaPolicy":Landroidx/work/OutOfQuotaPolicy;
    .end local v63    # "_tmpPeriodCount":I
    .end local v64    # "_tmpGeneration":I
    .end local v65    # "_tmpNextScheduleTimeOverride":J
    .end local v67    # "_tmpNextScheduleTimeOverrideGeneration":I
    .end local v68    # "_tmpStopReason":I
    .end local v69    # "_tmpTraceTag":Ljava/lang/String;
    .end local v70    # "_tmp_1":[B
    .end local v71    # "_tmp_2":[B
    .end local v72    # "_tmp_3":I
    .end local v77    # "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    .end local v78    # "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    .end local v79    # "_tmpRequiresCharging":Z
    .end local v80    # "_tmpRequiresDeviceIdle":Z
    .end local v81    # "_tmpRequiresBatteryNotLow":Z
    .end local v82    # "_tmpRequiresStorageNotLow":Z
    .end local v83    # "_tmpContentTriggerUpdateDelayMillis":J
    .end local v85    # "_tmpContentTriggerMaxDelayMillis":J
    .end local v87    # "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    goto/16 :goto_0

    .line 3350
    .end local v37    # "_cursorIndexOfContentUriTriggers":I
    .end local v73    # "_cursorIndexOfId":I
    .end local v74    # "_cursorIndexOfExpedited":I
    .end local v75    # "_cursorIndexOfOutOfQuotaPolicy":I
    .end local v88    # "_cursorIndexOfRequiredNetworkType":I
    .end local v89    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v90    # "_cursorIndexOfRequiresCharging":I
    .end local v91    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v92    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v93    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v0, "_cursorIndexOfId":I
    .local v19, "_cursorIndexOfExpedited":I
    .local v20, "_cursorIndexOfOutOfQuotaPolicy":I
    .local v27, "_cursorIndexOfRequiredNetworkType":I
    .local v28, "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v29, "_cursorIndexOfRequiresCharging":I
    .local v30, "_cursorIndexOfRequiresDeviceIdle":I
    .local v31, "_cursorIndexOfRequiresBatteryNotLow":I
    .local v32, "_cursorIndexOfRequiresStorageNotLow":I
    .local v35, "_cursorIndexOfContentUriTriggers":I
    :cond_6
    nop

    .line 3352
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 3353
    invoke-virtual/range {v17 .. v17}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 3350
    return-object v4

    .line 3352
    .end local v0    # "_cursorIndexOfId":I
    .end local v1    # "_cursorIndexOfLastEnqueueTime":I
    .end local v3    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v4    # "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec;>;"
    .end local v6    # "_cursorIndexOfState":I
    .end local v7    # "_cursorIndexOfWorkerClassName":I
    .end local v8    # "_cursorIndexOfInputMergerClassName":I
    .end local v9    # "_cursorIndexOfInput":I
    .end local v10    # "_cursorIndexOfOutput":I
    .end local v11    # "_cursorIndexOfInitialDelay":I
    .end local v12    # "_cursorIndexOfIntervalDuration":I
    .end local v13    # "_cursorIndexOfFlexDuration":I
    .end local v14    # "_cursorIndexOfRunAttemptCount":I
    .end local v15    # "_cursorIndexOfBackoffPolicy":I
    .end local v18    # "_cursorIndexOfScheduleRequestedAt":I
    .end local v19    # "_cursorIndexOfExpedited":I
    .end local v20    # "_cursorIndexOfOutOfQuotaPolicy":I
    .end local v21    # "_cursorIndexOfPeriodCount":I
    .end local v22    # "_cursorIndexOfGeneration":I
    .end local v23    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v24    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .end local v25    # "_cursorIndexOfStopReason":I
    .end local v26    # "_cursorIndexOfTraceTag":I
    .end local v27    # "_cursorIndexOfRequiredNetworkType":I
    .end local v28    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v29    # "_cursorIndexOfRequiresCharging":I
    .end local v30    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v31    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v32    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v33    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v34    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v35    # "_cursorIndexOfContentUriTriggers":I
    .end local v36    # "_cursorIndexOfMinimumRetentionDuration":I
    :catchall_0
    move-exception v0

    goto :goto_7

    .end local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    :catchall_1
    move-exception v0

    move-object/from16 v17, v4

    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    goto :goto_7

    .end local v16    # "_sql":Ljava/lang/String;
    .end local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .local v2, "_sql":Ljava/lang/String;
    .restart local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    :catchall_2
    move-exception v0

    move-object/from16 v16, v2

    move-object/from16 v17, v4

    .end local v2    # "_sql":Ljava/lang/String;
    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v16    # "_sql":Ljava/lang/String;
    .restart local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    :goto_7
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 3353
    invoke-virtual/range {v17 .. v17}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 3354
    throw v0
.end method

.method public getScheduleRequestedAtLiveData(Ljava/lang/String;)Landroidx/lifecycle/LiveData;
    .locals 7
    .param p1, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "id"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .line 2580
    const-string v0, "SELECT schedule_requested_at FROM workspec WHERE id=?"

    .line 2581
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "SELECT schedule_requested_at FROM workspec WHERE id=?"

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 2582
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v3, 0x1

    .line 2583
    .local v3, "_argIndex":I
    invoke-virtual {v1, v3, p1}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 2584
    iget-object v4, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v4}, Landroidx/room/RoomDatabase;->getInvalidationTracker()Landroidx/room/InvalidationTracker;

    move-result-object v4

    new-array v2, v2, [Ljava/lang/String;

    const-string/jumbo v5, "workspec"

    const/4 v6, 0x0

    aput-object v5, v2, v6

    new-instance v5, Landroidx/work/impl/model/WorkSpecDao_Impl$26;

    invoke-direct {v5, p0, v1}, Landroidx/work/impl/model/WorkSpecDao_Impl$26;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomSQLiteQuery;)V

    invoke-virtual {v4, v2, v6, v5}, Landroidx/room/InvalidationTracker;->createLiveData([Ljava/lang/String;ZLjava/util/concurrent/Callable;)Landroidx/lifecycle/LiveData;

    move-result-object v2

    return-object v2
.end method

.method public getScheduledWork()Ljava/util/List;
    .locals 94
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec;",
            ">;"
        }
    .end annotation

    .line 3063
    move-object/from16 v1, p0

    const-string v2, "SELECT * FROM workspec WHERE state=0 AND schedule_requested_at<>-1"

    .line 3064
    .local v2, "_sql":Ljava/lang/String;
    const-string v0, "SELECT * FROM workspec WHERE state=0 AND schedule_requested_at<>-1"

    const/4 v3, 0x0

    invoke-static {v0, v3}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v4

    .line 3065
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 3066
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v5, 0x0

    invoke-static {v0, v4, v3, v5}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v5

    .line 3068
    .local v5, "_cursor":Landroid/database/Cursor;
    :try_start_0
    const-string v0, "id"

    invoke-static {v5, v0}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    .line 3069
    .local v0, "_cursorIndexOfId":I
    const-string/jumbo v6, "state"

    invoke-static {v5, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 3070
    .local v6, "_cursorIndexOfState":I
    const-string/jumbo v7, "worker_class_name"

    invoke-static {v5, v7}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 3071
    .local v7, "_cursorIndexOfWorkerClassName":I
    const-string v8, "input_merger_class_name"

    invoke-static {v5, v8}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v8

    .line 3072
    .local v8, "_cursorIndexOfInputMergerClassName":I
    const-string v9, "input"

    invoke-static {v5, v9}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v9

    .line 3073
    .local v9, "_cursorIndexOfInput":I
    const-string v10, "output"

    invoke-static {v5, v10}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v10

    .line 3074
    .local v10, "_cursorIndexOfOutput":I
    const-string v11, "initial_delay"

    invoke-static {v5, v11}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v11

    .line 3075
    .local v11, "_cursorIndexOfInitialDelay":I
    const-string v12, "interval_duration"

    invoke-static {v5, v12}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v12

    .line 3076
    .local v12, "_cursorIndexOfIntervalDuration":I
    const-string v13, "flex_duration"

    invoke-static {v5, v13}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v13

    .line 3077
    .local v13, "_cursorIndexOfFlexDuration":I
    const-string v14, "run_attempt_count"

    invoke-static {v5, v14}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v14

    .line 3078
    .local v14, "_cursorIndexOfRunAttemptCount":I
    const-string v15, "backoff_policy"

    invoke-static {v5, v15}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v15

    .line 3079
    .local v15, "_cursorIndexOfBackoffPolicy":I
    const-string v3, "backoff_delay_duration"

    invoke-static {v5, v3}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v3

    .line 3080
    .local v3, "_cursorIndexOfBackoffDelayDuration":I
    const-string v1, "last_enqueue_time"

    invoke-static {v5, v1}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 3081
    .local v1, "_cursorIndexOfLastEnqueueTime":I
    move-object/from16 v16, v2

    .end local v2    # "_sql":Ljava/lang/String;
    .local v16, "_sql":Ljava/lang/String;
    :try_start_1
    const-string v2, "minimum_retention_duration"

    invoke-static {v5, v2}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 3082
    .local v2, "_cursorIndexOfMinimumRetentionDuration":I
    move-object/from16 v17, v4

    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .local v17, "_statement":Landroidx/room/RoomSQLiteQuery;
    :try_start_2
    const-string/jumbo v4, "schedule_requested_at"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3083
    .local v4, "_cursorIndexOfScheduleRequestedAt":I
    move/from16 v18, v4

    .end local v4    # "_cursorIndexOfScheduleRequestedAt":I
    .local v18, "_cursorIndexOfScheduleRequestedAt":I
    const-string v4, "run_in_foreground"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3084
    .local v4, "_cursorIndexOfExpedited":I
    move/from16 v19, v4

    .end local v4    # "_cursorIndexOfExpedited":I
    .local v19, "_cursorIndexOfExpedited":I
    const-string v4, "out_of_quota_policy"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3085
    .local v4, "_cursorIndexOfOutOfQuotaPolicy":I
    move/from16 v20, v4

    .end local v4    # "_cursorIndexOfOutOfQuotaPolicy":I
    .local v20, "_cursorIndexOfOutOfQuotaPolicy":I
    const-string v4, "period_count"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3086
    .local v4, "_cursorIndexOfPeriodCount":I
    move/from16 v21, v4

    .end local v4    # "_cursorIndexOfPeriodCount":I
    .local v21, "_cursorIndexOfPeriodCount":I
    const-string v4, "generation"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3087
    .local v4, "_cursorIndexOfGeneration":I
    move/from16 v22, v4

    .end local v4    # "_cursorIndexOfGeneration":I
    .local v22, "_cursorIndexOfGeneration":I
    const-string v4, "next_schedule_time_override"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3088
    .local v4, "_cursorIndexOfNextScheduleTimeOverride":I
    move/from16 v23, v4

    .end local v4    # "_cursorIndexOfNextScheduleTimeOverride":I
    .local v23, "_cursorIndexOfNextScheduleTimeOverride":I
    const-string v4, "next_schedule_time_override_generation"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3089
    .local v4, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    move/from16 v24, v4

    .end local v4    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .local v24, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    const-string/jumbo v4, "stop_reason"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3090
    .local v4, "_cursorIndexOfStopReason":I
    move/from16 v25, v4

    .end local v4    # "_cursorIndexOfStopReason":I
    .local v25, "_cursorIndexOfStopReason":I
    const-string/jumbo v4, "trace_tag"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3091
    .local v4, "_cursorIndexOfTraceTag":I
    move/from16 v26, v4

    .end local v4    # "_cursorIndexOfTraceTag":I
    .local v26, "_cursorIndexOfTraceTag":I
    const-string v4, "required_network_type"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3092
    .local v4, "_cursorIndexOfRequiredNetworkType":I
    move/from16 v27, v4

    .end local v4    # "_cursorIndexOfRequiredNetworkType":I
    .local v27, "_cursorIndexOfRequiredNetworkType":I
    const-string v4, "required_network_request"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3093
    .local v4, "_cursorIndexOfRequiredNetworkRequestCompat":I
    move/from16 v28, v4

    .end local v4    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v28, "_cursorIndexOfRequiredNetworkRequestCompat":I
    const-string v4, "requires_charging"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3094
    .local v4, "_cursorIndexOfRequiresCharging":I
    move/from16 v29, v4

    .end local v4    # "_cursorIndexOfRequiresCharging":I
    .local v29, "_cursorIndexOfRequiresCharging":I
    const-string v4, "requires_device_idle"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3095
    .local v4, "_cursorIndexOfRequiresDeviceIdle":I
    move/from16 v30, v4

    .end local v4    # "_cursorIndexOfRequiresDeviceIdle":I
    .local v30, "_cursorIndexOfRequiresDeviceIdle":I
    const-string v4, "requires_battery_not_low"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3096
    .local v4, "_cursorIndexOfRequiresBatteryNotLow":I
    move/from16 v31, v4

    .end local v4    # "_cursorIndexOfRequiresBatteryNotLow":I
    .local v31, "_cursorIndexOfRequiresBatteryNotLow":I
    const-string v4, "requires_storage_not_low"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3097
    .local v4, "_cursorIndexOfRequiresStorageNotLow":I
    move/from16 v32, v4

    .end local v4    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v32, "_cursorIndexOfRequiresStorageNotLow":I
    const-string/jumbo v4, "trigger_content_update_delay"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3098
    .local v4, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    move/from16 v33, v4

    .end local v4    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v33, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    const-string/jumbo v4, "trigger_max_content_delay"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3099
    .local v4, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    move/from16 v34, v4

    .end local v4    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .local v34, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    const-string v4, "content_uri_triggers"

    invoke-static {v5, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 3100
    .local v4, "_cursorIndexOfContentUriTriggers":I
    move/from16 v35, v4

    .end local v4    # "_cursorIndexOfContentUriTriggers":I
    .local v35, "_cursorIndexOfContentUriTriggers":I
    new-instance v4, Ljava/util/ArrayList;

    move/from16 v36, v2

    .end local v2    # "_cursorIndexOfMinimumRetentionDuration":I
    .local v36, "_cursorIndexOfMinimumRetentionDuration":I
    invoke-interface {v5}, Landroid/database/Cursor;->getCount()I

    move-result v2

    invoke-direct {v4, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 3101
    .local v4, "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec;>;"
    :goto_0
    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 3104
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v38, v2

    .line 3107
    .local v38, "_tmpId":Ljava/lang/String;
    invoke-interface {v5, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 3108
    .local v2, "_tmp":I
    sget-object v37, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v2}, Landroidx/work/impl/model/WorkTypeConverters;->intToState(I)Landroidx/work/WorkInfo$State;

    move-result-object v39

    .line 3110
    .local v39, "_tmpState":Landroidx/work/WorkInfo$State;
    invoke-interface {v5, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v40

    .line 3112
    .local v40, "_tmpWorkerClassName":Ljava/lang/String;
    invoke-interface {v5, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v41

    .line 3115
    .local v41, "_tmpInputMergerClassName":Ljava/lang/String;
    invoke-interface {v5, v9}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v37

    move-object/from16 v70, v37

    .line 3116
    .local v70, "_tmp_1":[B
    invoke-static/range {v70 .. v70}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v42

    .line 3119
    .local v42, "_tmpInput":Landroidx/work/Data;
    invoke-interface {v5, v10}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v37

    move-object/from16 v71, v37

    .line 3120
    .local v71, "_tmp_2":[B
    invoke-static/range {v71 .. v71}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v43

    .line 3122
    .local v43, "_tmpOutput":Landroidx/work/Data;
    invoke-interface {v5, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v44

    .line 3124
    .local v44, "_tmpInitialDelay":J
    invoke-interface {v5, v12}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v46

    .line 3126
    .local v46, "_tmpIntervalDuration":J
    invoke-interface {v5, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v48

    .line 3128
    .local v48, "_tmpFlexDuration":J
    invoke-interface {v5, v14}, Landroid/database/Cursor;->getInt(I)I

    move-result v51

    .line 3131
    .local v51, "_tmpRunAttemptCount":I
    invoke-interface {v5, v15}, Landroid/database/Cursor;->getInt(I)I

    move-result v37

    move/from16 v72, v37

    .line 3132
    .local v72, "_tmp_3":I
    sget-object v37, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v72 .. v72}, Landroidx/work/impl/model/WorkTypeConverters;->intToBackoffPolicy(I)Landroidx/work/BackoffPolicy;

    move-result-object v52

    .line 3134
    .local v52, "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    invoke-interface {v5, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v53

    .line 3136
    .local v53, "_tmpBackoffDelayDuration":J
    invoke-interface {v5, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v55

    .line 3138
    .local v55, "_tmpLastEnqueueTime":J
    move/from16 v73, v0

    move/from16 v0, v36

    .end local v36    # "_cursorIndexOfMinimumRetentionDuration":I
    .local v0, "_cursorIndexOfMinimumRetentionDuration":I
    .local v73, "_cursorIndexOfId":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v57

    .line 3140
    .local v57, "_tmpMinimumRetentionDuration":J
    move/from16 v36, v0

    move/from16 v0, v18

    .end local v18    # "_cursorIndexOfScheduleRequestedAt":I
    .local v0, "_cursorIndexOfScheduleRequestedAt":I
    .restart local v36    # "_cursorIndexOfMinimumRetentionDuration":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v59

    .line 3143
    .local v59, "_tmpScheduleRequestedAt":J
    move/from16 v18, v0

    move/from16 v0, v19

    .end local v19    # "_cursorIndexOfExpedited":I
    .local v0, "_cursorIndexOfExpedited":I
    .restart local v18    # "_cursorIndexOfScheduleRequestedAt":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v19

    .line 3144
    .local v19, "_tmp_4":I
    const/16 v37, 0x1

    if-eqz v19, :cond_0

    move/from16 v61, v37

    goto :goto_1

    :cond_0
    const/16 v61, 0x0

    .line 3147
    .local v61, "_tmpExpedited":Z
    :goto_1
    move/from16 v74, v0

    move/from16 v0, v20

    .end local v20    # "_cursorIndexOfOutOfQuotaPolicy":I
    .local v0, "_cursorIndexOfOutOfQuotaPolicy":I
    .local v74, "_cursorIndexOfExpedited":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v20

    .line 3148
    .local v20, "_tmp_5":I
    sget-object v50, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v20 .. v20}, Landroidx/work/impl/model/WorkTypeConverters;->intToOutOfQuotaPolicy(I)Landroidx/work/OutOfQuotaPolicy;

    move-result-object v62

    .line 3150
    .local v62, "_tmpOutOfQuotaPolicy":Landroidx/work/OutOfQuotaPolicy;
    move/from16 v75, v0

    move/from16 v0, v21

    .end local v21    # "_cursorIndexOfPeriodCount":I
    .local v0, "_cursorIndexOfPeriodCount":I
    .local v75, "_cursorIndexOfOutOfQuotaPolicy":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v63

    .line 3152
    .local v63, "_tmpPeriodCount":I
    move/from16 v21, v0

    move/from16 v0, v22

    .end local v22    # "_cursorIndexOfGeneration":I
    .local v0, "_cursorIndexOfGeneration":I
    .restart local v21    # "_cursorIndexOfPeriodCount":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v64

    .line 3154
    .local v64, "_tmpGeneration":I
    move/from16 v22, v0

    move/from16 v0, v23

    .end local v23    # "_cursorIndexOfNextScheduleTimeOverride":I
    .local v0, "_cursorIndexOfNextScheduleTimeOverride":I
    .restart local v22    # "_cursorIndexOfGeneration":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v65

    .line 3156
    .local v65, "_tmpNextScheduleTimeOverride":J
    move/from16 v23, v0

    move/from16 v0, v24

    .end local v24    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .local v0, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .restart local v23    # "_cursorIndexOfNextScheduleTimeOverride":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v67

    .line 3158
    .local v67, "_tmpNextScheduleTimeOverrideGeneration":I
    move/from16 v24, v0

    move/from16 v0, v25

    .end local v25    # "_cursorIndexOfStopReason":I
    .local v0, "_cursorIndexOfStopReason":I
    .restart local v24    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v68

    .line 3160
    .local v68, "_tmpStopReason":I
    move/from16 v25, v0

    move/from16 v0, v26

    .end local v26    # "_cursorIndexOfTraceTag":I
    .local v0, "_cursorIndexOfTraceTag":I
    .restart local v25    # "_cursorIndexOfStopReason":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v26

    if-eqz v26, :cond_1

    .line 3161
    const/16 v26, 0x0

    move-object/from16 v69, v26

    .local v26, "_tmpTraceTag":Ljava/lang/String;
    goto :goto_2

    .line 3163
    .end local v26    # "_tmpTraceTag":Ljava/lang/String;
    :cond_1
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v69, v26

    .line 3168
    .local v69, "_tmpTraceTag":Ljava/lang/String;
    :goto_2
    move/from16 v26, v0

    move/from16 v0, v27

    .end local v27    # "_cursorIndexOfRequiredNetworkType":I
    .local v0, "_cursorIndexOfRequiredNetworkType":I
    .local v26, "_cursorIndexOfTraceTag":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v27

    .line 3169
    .local v27, "_tmp_6":I
    sget-object v50, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v27 .. v27}, Landroidx/work/impl/model/WorkTypeConverters;->intToNetworkType(I)Landroidx/work/NetworkType;

    move-result-object v50

    move-object/from16 v78, v50

    .line 3172
    .local v78, "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    move/from16 v88, v0

    move/from16 v0, v28

    .end local v28    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v0, "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v88, "_cursorIndexOfRequiredNetworkType":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v28

    .line 3173
    .local v28, "_tmp_7":[B
    sget-object v50, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v28 .. v28}, Landroidx/work/impl/model/WorkTypeConverters;->toNetworkRequest$work_runtime_release([B)Landroidx/work/impl/utils/NetworkRequestCompat;

    move-result-object v77

    .line 3176
    .local v77, "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    move/from16 v89, v0

    move/from16 v0, v29

    .end local v29    # "_cursorIndexOfRequiresCharging":I
    .local v0, "_cursorIndexOfRequiresCharging":I
    .local v89, "_cursorIndexOfRequiredNetworkRequestCompat":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v29

    .line 3177
    .local v29, "_tmp_8":I
    if-eqz v29, :cond_2

    move/from16 v79, v37

    goto :goto_3

    :cond_2
    const/16 v79, 0x0

    .line 3180
    .local v79, "_tmpRequiresCharging":Z
    :goto_3
    move/from16 v90, v0

    move/from16 v0, v30

    .end local v30    # "_cursorIndexOfRequiresDeviceIdle":I
    .local v0, "_cursorIndexOfRequiresDeviceIdle":I
    .local v90, "_cursorIndexOfRequiresCharging":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v30

    .line 3181
    .local v30, "_tmp_9":I
    if-eqz v30, :cond_3

    move/from16 v80, v37

    goto :goto_4

    :cond_3
    const/16 v80, 0x0

    .line 3184
    .local v80, "_tmpRequiresDeviceIdle":Z
    :goto_4
    move/from16 v91, v0

    move/from16 v0, v31

    .end local v31    # "_cursorIndexOfRequiresBatteryNotLow":I
    .local v0, "_cursorIndexOfRequiresBatteryNotLow":I
    .local v91, "_cursorIndexOfRequiresDeviceIdle":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v31

    .line 3185
    .local v31, "_tmp_10":I
    if-eqz v31, :cond_4

    move/from16 v81, v37

    goto :goto_5

    :cond_4
    const/16 v81, 0x0

    .line 3188
    .local v81, "_tmpRequiresBatteryNotLow":Z
    :goto_5
    move/from16 v92, v0

    move/from16 v0, v32

    .end local v32    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v0, "_cursorIndexOfRequiresStorageNotLow":I
    .local v92, "_cursorIndexOfRequiresBatteryNotLow":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v32

    .line 3189
    .local v32, "_tmp_11":I
    if-eqz v32, :cond_5

    move/from16 v82, v37

    goto :goto_6

    :cond_5
    const/16 v82, 0x0

    .line 3191
    .local v82, "_tmpRequiresStorageNotLow":Z
    :goto_6
    move/from16 v93, v0

    move/from16 v0, v33

    .end local v33    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v0, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v93, "_cursorIndexOfRequiresStorageNotLow":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v83

    .line 3193
    .local v83, "_tmpContentTriggerUpdateDelayMillis":J
    move/from16 v33, v0

    move/from16 v0, v34

    .end local v34    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .local v0, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .restart local v33    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v85

    .line 3196
    .local v85, "_tmpContentTriggerMaxDelayMillis":J
    move/from16 v34, v0

    move/from16 v0, v35

    .end local v35    # "_cursorIndexOfContentUriTriggers":I
    .local v0, "_cursorIndexOfContentUriTriggers":I
    .restart local v34    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    invoke-interface {v5, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v35

    .line 3197
    .local v35, "_tmp_12":[B
    sget-object v37, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v35 .. v35}, Landroidx/work/impl/model/WorkTypeConverters;->byteArrayToSetOfTriggers([B)Ljava/util/Set;

    move-result-object v87

    .line 3198
    .local v87, "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    new-instance v50, Landroidx/work/Constraints;

    move-object/from16 v76, v50

    invoke-direct/range {v76 .. v87}, Landroidx/work/Constraints;-><init>(Landroidx/work/impl/utils/NetworkRequestCompat;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    .line 3199
    .local v50, "_tmpConstraints":Landroidx/work/Constraints;
    new-instance v37, Landroidx/work/impl/model/WorkSpec;

    invoke-direct/range {v37 .. v69}, Landroidx/work/impl/model/WorkSpec;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Ljava/lang/String;Ljava/lang/String;Landroidx/work/Data;Landroidx/work/Data;JJJLandroidx/work/Constraints;ILandroidx/work/BackoffPolicy;JJJJZLandroidx/work/OutOfQuotaPolicy;IIJIILjava/lang/String;)V

    move-object/from16 v76, v37

    .line 3200
    .local v76, "_item":Landroidx/work/impl/model/WorkSpec;
    move/from16 v37, v0

    move-object/from16 v0, v76

    .end local v76    # "_item":Landroidx/work/impl/model/WorkSpec;
    .local v0, "_item":Landroidx/work/impl/model/WorkSpec;
    .local v37, "_cursorIndexOfContentUriTriggers":I
    invoke-interface {v4, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 3201
    move/from16 v35, v37

    move/from16 v0, v73

    move/from16 v19, v74

    move/from16 v20, v75

    move/from16 v27, v88

    move/from16 v28, v89

    move/from16 v29, v90

    move/from16 v30, v91

    move/from16 v31, v92

    move/from16 v32, v93

    .end local v0    # "_item":Landroidx/work/impl/model/WorkSpec;
    .end local v2    # "_tmp":I
    .end local v19    # "_tmp_4":I
    .end local v20    # "_tmp_5":I
    .end local v27    # "_tmp_6":I
    .end local v28    # "_tmp_7":[B
    .end local v29    # "_tmp_8":I
    .end local v30    # "_tmp_9":I
    .end local v31    # "_tmp_10":I
    .end local v32    # "_tmp_11":I
    .end local v35    # "_tmp_12":[B
    .end local v38    # "_tmpId":Ljava/lang/String;
    .end local v39    # "_tmpState":Landroidx/work/WorkInfo$State;
    .end local v40    # "_tmpWorkerClassName":Ljava/lang/String;
    .end local v41    # "_tmpInputMergerClassName":Ljava/lang/String;
    .end local v42    # "_tmpInput":Landroidx/work/Data;
    .end local v43    # "_tmpOutput":Landroidx/work/Data;
    .end local v44    # "_tmpInitialDelay":J
    .end local v46    # "_tmpIntervalDuration":J
    .end local v48    # "_tmpFlexDuration":J
    .end local v50    # "_tmpConstraints":Landroidx/work/Constraints;
    .end local v51    # "_tmpRunAttemptCount":I
    .end local v52    # "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    .end local v53    # "_tmpBackoffDelayDuration":J
    .end local v55    # "_tmpLastEnqueueTime":J
    .end local v57    # "_tmpMinimumRetentionDuration":J
    .end local v59    # "_tmpScheduleRequestedAt":J
    .end local v61    # "_tmpExpedited":Z
    .end local v62    # "_tmpOutOfQuotaPolicy":Landroidx/work/OutOfQuotaPolicy;
    .end local v63    # "_tmpPeriodCount":I
    .end local v64    # "_tmpGeneration":I
    .end local v65    # "_tmpNextScheduleTimeOverride":J
    .end local v67    # "_tmpNextScheduleTimeOverrideGeneration":I
    .end local v68    # "_tmpStopReason":I
    .end local v69    # "_tmpTraceTag":Ljava/lang/String;
    .end local v70    # "_tmp_1":[B
    .end local v71    # "_tmp_2":[B
    .end local v72    # "_tmp_3":I
    .end local v77    # "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    .end local v78    # "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    .end local v79    # "_tmpRequiresCharging":Z
    .end local v80    # "_tmpRequiresDeviceIdle":Z
    .end local v81    # "_tmpRequiresBatteryNotLow":Z
    .end local v82    # "_tmpRequiresStorageNotLow":Z
    .end local v83    # "_tmpContentTriggerUpdateDelayMillis":J
    .end local v85    # "_tmpContentTriggerMaxDelayMillis":J
    .end local v87    # "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    goto/16 :goto_0

    .line 3202
    .end local v37    # "_cursorIndexOfContentUriTriggers":I
    .end local v73    # "_cursorIndexOfId":I
    .end local v74    # "_cursorIndexOfExpedited":I
    .end local v75    # "_cursorIndexOfOutOfQuotaPolicy":I
    .end local v88    # "_cursorIndexOfRequiredNetworkType":I
    .end local v89    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v90    # "_cursorIndexOfRequiresCharging":I
    .end local v91    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v92    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v93    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v0, "_cursorIndexOfId":I
    .local v19, "_cursorIndexOfExpedited":I
    .local v20, "_cursorIndexOfOutOfQuotaPolicy":I
    .local v27, "_cursorIndexOfRequiredNetworkType":I
    .local v28, "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v29, "_cursorIndexOfRequiresCharging":I
    .local v30, "_cursorIndexOfRequiresDeviceIdle":I
    .local v31, "_cursorIndexOfRequiresBatteryNotLow":I
    .local v32, "_cursorIndexOfRequiresStorageNotLow":I
    .local v35, "_cursorIndexOfContentUriTriggers":I
    :cond_6
    nop

    .line 3204
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 3205
    invoke-virtual/range {v17 .. v17}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 3202
    return-object v4

    .line 3204
    .end local v0    # "_cursorIndexOfId":I
    .end local v1    # "_cursorIndexOfLastEnqueueTime":I
    .end local v3    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v4    # "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec;>;"
    .end local v6    # "_cursorIndexOfState":I
    .end local v7    # "_cursorIndexOfWorkerClassName":I
    .end local v8    # "_cursorIndexOfInputMergerClassName":I
    .end local v9    # "_cursorIndexOfInput":I
    .end local v10    # "_cursorIndexOfOutput":I
    .end local v11    # "_cursorIndexOfInitialDelay":I
    .end local v12    # "_cursorIndexOfIntervalDuration":I
    .end local v13    # "_cursorIndexOfFlexDuration":I
    .end local v14    # "_cursorIndexOfRunAttemptCount":I
    .end local v15    # "_cursorIndexOfBackoffPolicy":I
    .end local v18    # "_cursorIndexOfScheduleRequestedAt":I
    .end local v19    # "_cursorIndexOfExpedited":I
    .end local v20    # "_cursorIndexOfOutOfQuotaPolicy":I
    .end local v21    # "_cursorIndexOfPeriodCount":I
    .end local v22    # "_cursorIndexOfGeneration":I
    .end local v23    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v24    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .end local v25    # "_cursorIndexOfStopReason":I
    .end local v26    # "_cursorIndexOfTraceTag":I
    .end local v27    # "_cursorIndexOfRequiredNetworkType":I
    .end local v28    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v29    # "_cursorIndexOfRequiresCharging":I
    .end local v30    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v31    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v32    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v33    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v34    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v35    # "_cursorIndexOfContentUriTriggers":I
    .end local v36    # "_cursorIndexOfMinimumRetentionDuration":I
    :catchall_0
    move-exception v0

    goto :goto_7

    .end local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    :catchall_1
    move-exception v0

    move-object/from16 v17, v4

    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    goto :goto_7

    .end local v16    # "_sql":Ljava/lang/String;
    .end local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .local v2, "_sql":Ljava/lang/String;
    .restart local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    :catchall_2
    move-exception v0

    move-object/from16 v16, v2

    move-object/from16 v17, v4

    .end local v2    # "_sql":Ljava/lang/String;
    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v16    # "_sql":Ljava/lang/String;
    .restart local v17    # "_statement":Landroidx/room/RoomSQLiteQuery;
    :goto_7
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 3205
    invoke-virtual/range {v17 .. v17}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 3206
    throw v0
.end method

.method public getState(Ljava/lang/String;)Landroidx/work/WorkInfo$State;
    .locals 6
    .param p1, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "id"
        }
    .end annotation

    .line 897
    const-string v0, "SELECT state FROM workspec WHERE id=?"

    .line 898
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "SELECT state FROM workspec WHERE id=?"

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 899
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v2, 0x1

    .line 900
    .local v2, "_argIndex":I
    invoke-virtual {v1, v2, p1}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 901
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 902
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v3, v1, v5, v4}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v3

    .line 905
    .local v3, "_cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 907
    invoke-interface {v3, v5}, Landroid/database/Cursor;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 908
    const/4 v4, 0x0

    .local v4, "_tmp":Ljava/lang/Integer;
    goto :goto_0

    .line 910
    .end local v4    # "_tmp":Ljava/lang/Integer;
    :cond_0
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 912
    .restart local v4    # "_tmp":Ljava/lang/Integer;
    :goto_0
    if-nez v4, :cond_1

    .line 913
    const/4 v5, 0x0

    .local v5, "_result":Landroidx/work/WorkInfo$State;
    goto :goto_1

    .line 915
    .end local v5    # "_result":Landroidx/work/WorkInfo$State;
    :cond_1
    sget-object v5, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-static {v5}, Landroidx/work/impl/model/WorkTypeConverters;->intToState(I)Landroidx/work/WorkInfo$State;

    move-result-object v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 917
    .end local v4    # "_tmp":Ljava/lang/Integer;
    .restart local v5    # "_result":Landroidx/work/WorkInfo$State;
    :goto_1
    goto :goto_2

    .line 918
    .end local v5    # "_result":Landroidx/work/WorkInfo$State;
    :cond_2
    const/4 v5, 0x0

    .line 920
    .restart local v5    # "_result":Landroidx/work/WorkInfo$State;
    :goto_2
    nop

    .line 922
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 923
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 920
    return-object v5

    .line 922
    .end local v5    # "_result":Landroidx/work/WorkInfo$State;
    :catchall_0
    move-exception v4

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 923
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 924
    throw v4
.end method

.method public getUnfinishedWorkWithName(Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "name"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 2507
    const-string v0, "SELECT id FROM workspec WHERE state NOT IN (2, 3, 5) AND id IN (SELECT work_spec_id FROM workname WHERE name=?)"

    .line 2508
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "SELECT id FROM workspec WHERE state NOT IN (2, 3, 5) AND id IN (SELECT work_spec_id FROM workname WHERE name=?)"

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 2509
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v2, 0x1

    .line 2510
    .local v2, "_argIndex":I
    invoke-virtual {v1, v2, p1}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 2511
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 2512
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v3, v1, v5, v4}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v3

    .line 2514
    .local v3, "_cursor":Landroid/database/Cursor;
    :try_start_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v6

    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 2515
    .local v4, "_result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 2517
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 2518
    .local v6, "_item":Ljava/lang/String;
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2519
    nop

    .end local v6    # "_item":Ljava/lang/String;
    goto :goto_0

    .line 2520
    :cond_0
    nop

    .line 2522
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 2523
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 2520
    return-object v4

    .line 2522
    .end local v4    # "_result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v4

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 2523
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 2524
    throw v4
.end method

.method public getUnfinishedWorkWithTag(Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .param p1, "tag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "tag"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 2485
    const-string v0, "SELECT id FROM workspec WHERE state NOT IN (2, 3, 5) AND id IN (SELECT work_spec_id FROM worktag WHERE tag=?)"

    .line 2486
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "SELECT id FROM workspec WHERE state NOT IN (2, 3, 5) AND id IN (SELECT work_spec_id FROM worktag WHERE tag=?)"

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 2487
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v2, 0x1

    .line 2488
    .local v2, "_argIndex":I
    invoke-virtual {v1, v2, p1}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 2489
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 2490
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v3, v1, v5, v4}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v3

    .line 2492
    .local v3, "_cursor":Landroid/database/Cursor;
    :try_start_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v6

    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 2493
    .local v4, "_result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 2495
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 2496
    .local v6, "_item":Ljava/lang/String;
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2497
    nop

    .end local v6    # "_item":Ljava/lang/String;
    goto :goto_0

    .line 2498
    :cond_0
    nop

    .line 2500
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 2501
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 2498
    return-object v4

    .line 2500
    .end local v4    # "_result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v4

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 2501
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 2502
    throw v4
.end method

.method public getWorkSpec(Ljava/lang/String;)Landroidx/work/impl/model/WorkSpec;
    .locals 95
    .param p1, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "id"
        }
    .end annotation

    .line 662
    move-object/from16 v1, p0

    const-string v2, "SELECT * FROM workspec WHERE id=?"

    .line 663
    .local v2, "_sql":Ljava/lang/String;
    const-string v0, "SELECT * FROM workspec WHERE id=?"

    const/4 v3, 0x1

    invoke-static {v0, v3}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v4

    .line 664
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v5, 0x1

    .line 665
    .local v5, "_argIndex":I
    move-object/from16 v6, p1

    invoke-virtual {v4, v5, v6}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 666
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 667
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static {v0, v4, v8, v7}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v7

    .line 669
    .local v7, "_cursor":Landroid/database/Cursor;
    :try_start_0
    const-string v0, "id"

    invoke-static {v7, v0}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    .line 670
    .local v0, "_cursorIndexOfId":I
    const-string/jumbo v9, "state"

    invoke-static {v7, v9}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v9

    .line 671
    .local v9, "_cursorIndexOfState":I
    const-string/jumbo v10, "worker_class_name"

    invoke-static {v7, v10}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v10

    .line 672
    .local v10, "_cursorIndexOfWorkerClassName":I
    const-string v11, "input_merger_class_name"

    invoke-static {v7, v11}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v11

    .line 673
    .local v11, "_cursorIndexOfInputMergerClassName":I
    const-string v12, "input"

    invoke-static {v7, v12}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v12

    .line 674
    .local v12, "_cursorIndexOfInput":I
    const-string v13, "output"

    invoke-static {v7, v13}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v13

    .line 675
    .local v13, "_cursorIndexOfOutput":I
    const-string v14, "initial_delay"

    invoke-static {v7, v14}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v14

    .line 676
    .local v14, "_cursorIndexOfInitialDelay":I
    const-string v15, "interval_duration"

    invoke-static {v7, v15}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v15

    .line 677
    .local v15, "_cursorIndexOfIntervalDuration":I
    const-string v3, "flex_duration"

    invoke-static {v7, v3}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v3

    .line 678
    .local v3, "_cursorIndexOfFlexDuration":I
    const-string v8, "run_attempt_count"

    invoke-static {v7, v8}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v8

    .line 679
    .local v8, "_cursorIndexOfRunAttemptCount":I
    const-string v1, "backoff_policy"

    invoke-static {v7, v1}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 680
    .local v1, "_cursorIndexOfBackoffPolicy":I
    move-object/from16 v18, v2

    .end local v2    # "_sql":Ljava/lang/String;
    .local v18, "_sql":Ljava/lang/String;
    :try_start_1
    const-string v2, "backoff_delay_duration"

    invoke-static {v7, v2}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 681
    .local v2, "_cursorIndexOfBackoffDelayDuration":I
    move-object/from16 v19, v4

    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .local v19, "_statement":Landroidx/room/RoomSQLiteQuery;
    :try_start_2
    const-string v4, "last_enqueue_time"

    invoke-static {v7, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 682
    .local v4, "_cursorIndexOfLastEnqueueTime":I
    move/from16 v20, v5

    .end local v5    # "_argIndex":I
    .local v20, "_argIndex":I
    :try_start_3
    const-string v5, "minimum_retention_duration"

    invoke-static {v7, v5}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v5

    .line 683
    .local v5, "_cursorIndexOfMinimumRetentionDuration":I
    const-string/jumbo v6, "schedule_requested_at"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 684
    .local v6, "_cursorIndexOfScheduleRequestedAt":I
    move/from16 v21, v6

    .end local v6    # "_cursorIndexOfScheduleRequestedAt":I
    .local v21, "_cursorIndexOfScheduleRequestedAt":I
    const-string v6, "run_in_foreground"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 685
    .local v6, "_cursorIndexOfExpedited":I
    move/from16 v22, v6

    .end local v6    # "_cursorIndexOfExpedited":I
    .local v22, "_cursorIndexOfExpedited":I
    const-string v6, "out_of_quota_policy"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 686
    .local v6, "_cursorIndexOfOutOfQuotaPolicy":I
    move/from16 v23, v6

    .end local v6    # "_cursorIndexOfOutOfQuotaPolicy":I
    .local v23, "_cursorIndexOfOutOfQuotaPolicy":I
    const-string v6, "period_count"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 687
    .local v6, "_cursorIndexOfPeriodCount":I
    move/from16 v24, v6

    .end local v6    # "_cursorIndexOfPeriodCount":I
    .local v24, "_cursorIndexOfPeriodCount":I
    const-string v6, "generation"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 688
    .local v6, "_cursorIndexOfGeneration":I
    move/from16 v25, v6

    .end local v6    # "_cursorIndexOfGeneration":I
    .local v25, "_cursorIndexOfGeneration":I
    const-string v6, "next_schedule_time_override"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 689
    .local v6, "_cursorIndexOfNextScheduleTimeOverride":I
    move/from16 v26, v6

    .end local v6    # "_cursorIndexOfNextScheduleTimeOverride":I
    .local v26, "_cursorIndexOfNextScheduleTimeOverride":I
    const-string v6, "next_schedule_time_override_generation"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 690
    .local v6, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    move/from16 v27, v6

    .end local v6    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .local v27, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    const-string/jumbo v6, "stop_reason"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 691
    .local v6, "_cursorIndexOfStopReason":I
    move/from16 v28, v6

    .end local v6    # "_cursorIndexOfStopReason":I
    .local v28, "_cursorIndexOfStopReason":I
    const-string/jumbo v6, "trace_tag"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 692
    .local v6, "_cursorIndexOfTraceTag":I
    move/from16 v29, v6

    .end local v6    # "_cursorIndexOfTraceTag":I
    .local v29, "_cursorIndexOfTraceTag":I
    const-string v6, "required_network_type"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 693
    .local v6, "_cursorIndexOfRequiredNetworkType":I
    move/from16 v30, v6

    .end local v6    # "_cursorIndexOfRequiredNetworkType":I
    .local v30, "_cursorIndexOfRequiredNetworkType":I
    const-string v6, "required_network_request"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 694
    .local v6, "_cursorIndexOfRequiredNetworkRequestCompat":I
    move/from16 v31, v6

    .end local v6    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v31, "_cursorIndexOfRequiredNetworkRequestCompat":I
    const-string v6, "requires_charging"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 695
    .local v6, "_cursorIndexOfRequiresCharging":I
    move/from16 v32, v6

    .end local v6    # "_cursorIndexOfRequiresCharging":I
    .local v32, "_cursorIndexOfRequiresCharging":I
    const-string v6, "requires_device_idle"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 696
    .local v6, "_cursorIndexOfRequiresDeviceIdle":I
    move/from16 v33, v6

    .end local v6    # "_cursorIndexOfRequiresDeviceIdle":I
    .local v33, "_cursorIndexOfRequiresDeviceIdle":I
    const-string v6, "requires_battery_not_low"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 697
    .local v6, "_cursorIndexOfRequiresBatteryNotLow":I
    move/from16 v34, v6

    .end local v6    # "_cursorIndexOfRequiresBatteryNotLow":I
    .local v34, "_cursorIndexOfRequiresBatteryNotLow":I
    const-string v6, "requires_storage_not_low"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 698
    .local v6, "_cursorIndexOfRequiresStorageNotLow":I
    move/from16 v35, v6

    .end local v6    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v35, "_cursorIndexOfRequiresStorageNotLow":I
    const-string/jumbo v6, "trigger_content_update_delay"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 699
    .local v6, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    move/from16 v36, v6

    .end local v6    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v36, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    const-string/jumbo v6, "trigger_max_content_delay"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 700
    .local v6, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    move/from16 v37, v6

    .end local v6    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .local v37, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    const-string v6, "content_uri_triggers"

    invoke-static {v7, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 702
    .local v6, "_cursorIndexOfContentUriTriggers":I
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v38

    if-eqz v38, :cond_6

    .line 704
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v38

    move-object/from16 v40, v38

    .line 707
    .local v40, "_tmpId":Ljava/lang/String;
    invoke-interface {v7, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v38

    .line 708
    .local v38, "_tmp":I
    sget-object v39, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v38 .. v38}, Landroidx/work/impl/model/WorkTypeConverters;->intToState(I)Landroidx/work/WorkInfo$State;

    move-result-object v41

    .line 710
    .local v41, "_tmpState":Landroidx/work/WorkInfo$State;
    invoke-interface {v7, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v42

    .line 712
    .local v42, "_tmpWorkerClassName":Ljava/lang/String;
    invoke-interface {v7, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v43

    .line 715
    .local v43, "_tmpInputMergerClassName":Ljava/lang/String;
    invoke-interface {v7, v12}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v39

    move-object/from16 v72, v39

    .line 716
    .local v72, "_tmp_1":[B
    invoke-static/range {v72 .. v72}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v44

    .line 719
    .local v44, "_tmpInput":Landroidx/work/Data;
    invoke-interface {v7, v13}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v39

    move-object/from16 v73, v39

    .line 720
    .local v73, "_tmp_2":[B
    invoke-static/range {v73 .. v73}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v45

    .line 722
    .local v45, "_tmpOutput":Landroidx/work/Data;
    invoke-interface {v7, v14}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v46

    .line 724
    .local v46, "_tmpInitialDelay":J
    invoke-interface {v7, v15}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v48

    .line 726
    .local v48, "_tmpIntervalDuration":J
    invoke-interface {v7, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v50

    .line 728
    .local v50, "_tmpFlexDuration":J
    invoke-interface {v7, v8}, Landroid/database/Cursor;->getInt(I)I

    move-result v53

    .line 731
    .local v53, "_tmpRunAttemptCount":I
    invoke-interface {v7, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v39

    move/from16 v74, v39

    .line 732
    .local v74, "_tmp_3":I
    sget-object v39, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v74 .. v74}, Landroidx/work/impl/model/WorkTypeConverters;->intToBackoffPolicy(I)Landroidx/work/BackoffPolicy;

    move-result-object v54

    .line 734
    .local v54, "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    invoke-interface {v7, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v55

    .line 736
    .local v55, "_tmpBackoffDelayDuration":J
    invoke-interface {v7, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v57

    .line 738
    .local v57, "_tmpLastEnqueueTime":J
    invoke-interface {v7, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v59

    .line 740
    .local v59, "_tmpMinimumRetentionDuration":J
    move/from16 v75, v0

    move/from16 v0, v21

    .end local v21    # "_cursorIndexOfScheduleRequestedAt":I
    .local v0, "_cursorIndexOfScheduleRequestedAt":I
    .local v75, "_cursorIndexOfId":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v61

    .line 743
    .local v61, "_tmpScheduleRequestedAt":J
    move/from16 v21, v0

    move/from16 v0, v22

    .end local v22    # "_cursorIndexOfExpedited":I
    .local v0, "_cursorIndexOfExpedited":I
    .restart local v21    # "_cursorIndexOfScheduleRequestedAt":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v22

    .line 744
    .local v22, "_tmp_4":I
    if-eqz v22, :cond_0

    const/16 v63, 0x1

    goto :goto_0

    :cond_0
    const/16 v63, 0x0

    .line 747
    .local v63, "_tmpExpedited":Z
    :goto_0
    move/from16 v76, v0

    move/from16 v0, v23

    .end local v23    # "_cursorIndexOfOutOfQuotaPolicy":I
    .local v0, "_cursorIndexOfOutOfQuotaPolicy":I
    .local v76, "_cursorIndexOfExpedited":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v23

    .line 748
    .local v23, "_tmp_5":I
    sget-object v39, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v23 .. v23}, Landroidx/work/impl/model/WorkTypeConverters;->intToOutOfQuotaPolicy(I)Landroidx/work/OutOfQuotaPolicy;

    move-result-object v64

    .line 750
    .local v64, "_tmpOutOfQuotaPolicy":Landroidx/work/OutOfQuotaPolicy;
    move/from16 v77, v0

    move/from16 v0, v24

    .end local v24    # "_cursorIndexOfPeriodCount":I
    .local v0, "_cursorIndexOfPeriodCount":I
    .local v77, "_cursorIndexOfOutOfQuotaPolicy":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v65

    .line 752
    .local v65, "_tmpPeriodCount":I
    move/from16 v24, v0

    move/from16 v0, v25

    .end local v25    # "_cursorIndexOfGeneration":I
    .local v0, "_cursorIndexOfGeneration":I
    .restart local v24    # "_cursorIndexOfPeriodCount":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v66

    .line 754
    .local v66, "_tmpGeneration":I
    move/from16 v25, v0

    move/from16 v0, v26

    .end local v26    # "_cursorIndexOfNextScheduleTimeOverride":I
    .local v0, "_cursorIndexOfNextScheduleTimeOverride":I
    .restart local v25    # "_cursorIndexOfGeneration":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v67

    .line 756
    .local v67, "_tmpNextScheduleTimeOverride":J
    move/from16 v26, v0

    move/from16 v0, v27

    .end local v27    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .local v0, "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .restart local v26    # "_cursorIndexOfNextScheduleTimeOverride":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v69

    .line 758
    .local v69, "_tmpNextScheduleTimeOverrideGeneration":I
    move/from16 v27, v0

    move/from16 v0, v28

    .end local v28    # "_cursorIndexOfStopReason":I
    .local v0, "_cursorIndexOfStopReason":I
    .restart local v27    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v70

    .line 760
    .local v70, "_tmpStopReason":I
    move/from16 v28, v0

    move/from16 v0, v29

    .end local v29    # "_cursorIndexOfTraceTag":I
    .local v0, "_cursorIndexOfTraceTag":I
    .restart local v28    # "_cursorIndexOfStopReason":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v29

    if-eqz v29, :cond_1

    .line 761
    const/16 v29, 0x0

    move-object/from16 v71, v29

    .local v29, "_tmpTraceTag":Ljava/lang/String;
    goto :goto_1

    .line 763
    .end local v29    # "_tmpTraceTag":Ljava/lang/String;
    :cond_1
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v29

    move-object/from16 v71, v29

    .line 768
    .local v71, "_tmpTraceTag":Ljava/lang/String;
    :goto_1
    move/from16 v29, v0

    move/from16 v0, v30

    .end local v30    # "_cursorIndexOfRequiredNetworkType":I
    .local v0, "_cursorIndexOfRequiredNetworkType":I
    .local v29, "_cursorIndexOfTraceTag":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v30

    .line 769
    .local v30, "_tmp_6":I
    sget-object v39, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v30 .. v30}, Landroidx/work/impl/model/WorkTypeConverters;->intToNetworkType(I)Landroidx/work/NetworkType;

    move-result-object v39

    move-object/from16 v80, v39

    .line 772
    .local v80, "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    move/from16 v90, v0

    move/from16 v0, v31

    .end local v31    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v0, "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v90, "_cursorIndexOfRequiredNetworkType":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v31

    .line 773
    .local v31, "_tmp_7":[B
    sget-object v39, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v31 .. v31}, Landroidx/work/impl/model/WorkTypeConverters;->toNetworkRequest$work_runtime_release([B)Landroidx/work/impl/utils/NetworkRequestCompat;

    move-result-object v79

    .line 776
    .local v79, "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    move/from16 v91, v0

    move/from16 v0, v32

    .end local v32    # "_cursorIndexOfRequiresCharging":I
    .local v0, "_cursorIndexOfRequiresCharging":I
    .local v91, "_cursorIndexOfRequiredNetworkRequestCompat":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v32

    .line 777
    .local v32, "_tmp_8":I
    if-eqz v32, :cond_2

    const/16 v81, 0x1

    goto :goto_2

    :cond_2
    const/16 v81, 0x0

    .line 780
    .local v81, "_tmpRequiresCharging":Z
    :goto_2
    move/from16 v92, v0

    move/from16 v0, v33

    .end local v33    # "_cursorIndexOfRequiresDeviceIdle":I
    .local v0, "_cursorIndexOfRequiresDeviceIdle":I
    .local v92, "_cursorIndexOfRequiresCharging":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v33

    .line 781
    .local v33, "_tmp_9":I
    if-eqz v33, :cond_3

    const/16 v82, 0x1

    goto :goto_3

    :cond_3
    const/16 v82, 0x0

    .line 784
    .local v82, "_tmpRequiresDeviceIdle":Z
    :goto_3
    move/from16 v93, v0

    move/from16 v0, v34

    .end local v34    # "_cursorIndexOfRequiresBatteryNotLow":I
    .local v0, "_cursorIndexOfRequiresBatteryNotLow":I
    .local v93, "_cursorIndexOfRequiresDeviceIdle":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v34

    .line 785
    .local v34, "_tmp_10":I
    if-eqz v34, :cond_4

    const/16 v83, 0x1

    goto :goto_4

    :cond_4
    const/16 v83, 0x0

    .line 788
    .local v83, "_tmpRequiresBatteryNotLow":Z
    :goto_4
    move/from16 v94, v0

    move/from16 v0, v35

    .end local v35    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v0, "_cursorIndexOfRequiresStorageNotLow":I
    .local v94, "_cursorIndexOfRequiresBatteryNotLow":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v35

    .line 789
    .local v35, "_tmp_11":I
    if-eqz v35, :cond_5

    const/16 v84, 0x1

    goto :goto_5

    :cond_5
    const/16 v84, 0x0

    .line 791
    .local v84, "_tmpRequiresStorageNotLow":Z
    :goto_5
    move/from16 v16, v0

    move/from16 v0, v36

    .end local v36    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v0, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v16, "_cursorIndexOfRequiresStorageNotLow":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v85

    .line 793
    .local v85, "_tmpContentTriggerUpdateDelayMillis":J
    move/from16 v36, v0

    move/from16 v0, v37

    .end local v37    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .local v0, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .restart local v36    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v87

    .line 796
    .local v87, "_tmpContentTriggerMaxDelayMillis":J
    invoke-interface {v7, v6}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v17

    .line 797
    .local v17, "_tmp_12":[B
    sget-object v37, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v17 .. v17}, Landroidx/work/impl/model/WorkTypeConverters;->byteArrayToSetOfTriggers([B)Ljava/util/Set;

    move-result-object v89

    .line 798
    .local v89, "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    new-instance v78, Landroidx/work/Constraints;

    invoke-direct/range {v78 .. v89}, Landroidx/work/Constraints;-><init>(Landroidx/work/impl/utils/NetworkRequestCompat;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    move-object/from16 v52, v78

    .line 799
    .local v52, "_tmpConstraints":Landroidx/work/Constraints;
    new-instance v39, Landroidx/work/impl/model/WorkSpec;

    invoke-direct/range {v39 .. v71}, Landroidx/work/impl/model/WorkSpec;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Ljava/lang/String;Ljava/lang/String;Landroidx/work/Data;Landroidx/work/Data;JJJLandroidx/work/Constraints;ILandroidx/work/BackoffPolicy;JJJJZLandroidx/work/OutOfQuotaPolicy;IIJIILjava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 800
    .end local v17    # "_tmp_12":[B
    .end local v22    # "_tmp_4":I
    .end local v23    # "_tmp_5":I
    .end local v30    # "_tmp_6":I
    .end local v31    # "_tmp_7":[B
    .end local v32    # "_tmp_8":I
    .end local v33    # "_tmp_9":I
    .end local v34    # "_tmp_10":I
    .end local v35    # "_tmp_11":I
    .end local v38    # "_tmp":I
    .end local v40    # "_tmpId":Ljava/lang/String;
    .end local v41    # "_tmpState":Landroidx/work/WorkInfo$State;
    .end local v42    # "_tmpWorkerClassName":Ljava/lang/String;
    .end local v43    # "_tmpInputMergerClassName":Ljava/lang/String;
    .end local v44    # "_tmpInput":Landroidx/work/Data;
    .end local v45    # "_tmpOutput":Landroidx/work/Data;
    .end local v46    # "_tmpInitialDelay":J
    .end local v48    # "_tmpIntervalDuration":J
    .end local v50    # "_tmpFlexDuration":J
    .end local v52    # "_tmpConstraints":Landroidx/work/Constraints;
    .end local v53    # "_tmpRunAttemptCount":I
    .end local v54    # "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    .end local v55    # "_tmpBackoffDelayDuration":J
    .end local v57    # "_tmpLastEnqueueTime":J
    .end local v59    # "_tmpMinimumRetentionDuration":J
    .end local v61    # "_tmpScheduleRequestedAt":J
    .end local v63    # "_tmpExpedited":Z
    .end local v64    # "_tmpOutOfQuotaPolicy":Landroidx/work/OutOfQuotaPolicy;
    .end local v65    # "_tmpPeriodCount":I
    .end local v66    # "_tmpGeneration":I
    .end local v67    # "_tmpNextScheduleTimeOverride":J
    .end local v69    # "_tmpNextScheduleTimeOverrideGeneration":I
    .end local v70    # "_tmpStopReason":I
    .end local v71    # "_tmpTraceTag":Ljava/lang/String;
    .end local v72    # "_tmp_1":[B
    .end local v73    # "_tmp_2":[B
    .end local v74    # "_tmp_3":I
    .end local v79    # "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    .end local v80    # "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    .end local v81    # "_tmpRequiresCharging":Z
    .end local v82    # "_tmpRequiresDeviceIdle":Z
    .end local v83    # "_tmpRequiresBatteryNotLow":Z
    .end local v84    # "_tmpRequiresStorageNotLow":Z
    .end local v85    # "_tmpContentTriggerUpdateDelayMillis":J
    .end local v87    # "_tmpContentTriggerMaxDelayMillis":J
    .end local v89    # "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    .local v39, "_result":Landroidx/work/impl/model/WorkSpec;
    goto :goto_6

    .line 801
    .end local v16    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v39    # "_result":Landroidx/work/impl/model/WorkSpec;
    .end local v75    # "_cursorIndexOfId":I
    .end local v76    # "_cursorIndexOfExpedited":I
    .end local v77    # "_cursorIndexOfOutOfQuotaPolicy":I
    .end local v90    # "_cursorIndexOfRequiredNetworkType":I
    .end local v91    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v92    # "_cursorIndexOfRequiresCharging":I
    .end local v93    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v94    # "_cursorIndexOfRequiresBatteryNotLow":I
    .local v0, "_cursorIndexOfId":I
    .local v22, "_cursorIndexOfExpedited":I
    .local v23, "_cursorIndexOfOutOfQuotaPolicy":I
    .local v30, "_cursorIndexOfRequiredNetworkType":I
    .local v31, "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v32, "_cursorIndexOfRequiresCharging":I
    .local v33, "_cursorIndexOfRequiresDeviceIdle":I
    .local v34, "_cursorIndexOfRequiresBatteryNotLow":I
    .local v35, "_cursorIndexOfRequiresStorageNotLow":I
    .restart local v37    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    :cond_6
    move/from16 v75, v0

    move/from16 v76, v22

    move/from16 v77, v23

    move/from16 v90, v30

    move/from16 v91, v31

    move/from16 v92, v32

    move/from16 v93, v33

    move/from16 v94, v34

    move/from16 v16, v35

    move/from16 v0, v37

    .end local v22    # "_cursorIndexOfExpedited":I
    .end local v23    # "_cursorIndexOfOutOfQuotaPolicy":I
    .end local v30    # "_cursorIndexOfRequiredNetworkType":I
    .end local v31    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v32    # "_cursorIndexOfRequiresCharging":I
    .end local v33    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v34    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v35    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v37    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .local v0, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .restart local v16    # "_cursorIndexOfRequiresStorageNotLow":I
    .restart local v75    # "_cursorIndexOfId":I
    .restart local v76    # "_cursorIndexOfExpedited":I
    .restart local v77    # "_cursorIndexOfOutOfQuotaPolicy":I
    .restart local v90    # "_cursorIndexOfRequiredNetworkType":I
    .restart local v91    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .restart local v92    # "_cursorIndexOfRequiresCharging":I
    .restart local v93    # "_cursorIndexOfRequiresDeviceIdle":I
    .restart local v94    # "_cursorIndexOfRequiresBatteryNotLow":I
    const/16 v39, 0x0

    .line 803
    .restart local v39    # "_result":Landroidx/work/impl/model/WorkSpec;
    :goto_6
    nop

    .line 805
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 806
    invoke-virtual/range {v19 .. v19}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 803
    return-object v39

    .line 805
    .end local v0    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v1    # "_cursorIndexOfBackoffPolicy":I
    .end local v2    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v3    # "_cursorIndexOfFlexDuration":I
    .end local v4    # "_cursorIndexOfLastEnqueueTime":I
    .end local v5    # "_cursorIndexOfMinimumRetentionDuration":I
    .end local v6    # "_cursorIndexOfContentUriTriggers":I
    .end local v8    # "_cursorIndexOfRunAttemptCount":I
    .end local v9    # "_cursorIndexOfState":I
    .end local v10    # "_cursorIndexOfWorkerClassName":I
    .end local v11    # "_cursorIndexOfInputMergerClassName":I
    .end local v12    # "_cursorIndexOfInput":I
    .end local v13    # "_cursorIndexOfOutput":I
    .end local v14    # "_cursorIndexOfInitialDelay":I
    .end local v15    # "_cursorIndexOfIntervalDuration":I
    .end local v16    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v21    # "_cursorIndexOfScheduleRequestedAt":I
    .end local v24    # "_cursorIndexOfPeriodCount":I
    .end local v25    # "_cursorIndexOfGeneration":I
    .end local v26    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v27    # "_cursorIndexOfNextScheduleTimeOverrideGeneration":I
    .end local v28    # "_cursorIndexOfStopReason":I
    .end local v29    # "_cursorIndexOfTraceTag":I
    .end local v36    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v39    # "_result":Landroidx/work/impl/model/WorkSpec;
    .end local v75    # "_cursorIndexOfId":I
    .end local v76    # "_cursorIndexOfExpedited":I
    .end local v77    # "_cursorIndexOfOutOfQuotaPolicy":I
    .end local v90    # "_cursorIndexOfRequiredNetworkType":I
    .end local v91    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v92    # "_cursorIndexOfRequiresCharging":I
    .end local v93    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v94    # "_cursorIndexOfRequiresBatteryNotLow":I
    :catchall_0
    move-exception v0

    goto :goto_7

    .end local v20    # "_argIndex":I
    .local v5, "_argIndex":I
    :catchall_1
    move-exception v0

    move/from16 v20, v5

    .end local v5    # "_argIndex":I
    .restart local v20    # "_argIndex":I
    goto :goto_7

    .end local v19    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v20    # "_argIndex":I
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v5    # "_argIndex":I
    :catchall_2
    move-exception v0

    move-object/from16 v19, v4

    move/from16 v20, v5

    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v5    # "_argIndex":I
    .restart local v19    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v20    # "_argIndex":I
    goto :goto_7

    .end local v18    # "_sql":Ljava/lang/String;
    .end local v19    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v20    # "_argIndex":I
    .local v2, "_sql":Ljava/lang/String;
    .restart local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v5    # "_argIndex":I
    :catchall_3
    move-exception v0

    move-object/from16 v18, v2

    move-object/from16 v19, v4

    move/from16 v20, v5

    .end local v2    # "_sql":Ljava/lang/String;
    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v5    # "_argIndex":I
    .restart local v18    # "_sql":Ljava/lang/String;
    .restart local v19    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v20    # "_argIndex":I
    :goto_7
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 806
    invoke-virtual/range {v19 .. v19}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 807
    throw v0
.end method

.method public getWorkSpecIdAndStatesForName(Ljava/lang/String;)Ljava/util/List;
    .locals 13
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "name"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec$IdAndState;",
            ">;"
        }
    .end annotation

    .line 812
    const-string v0, "SELECT id, state FROM workspec WHERE id IN (SELECT work_spec_id FROM workname WHERE name=?)"

    .line 813
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "SELECT id, state FROM workspec WHERE id IN (SELECT work_spec_id FROM workname WHERE name=?)"

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 814
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v3, 0x1

    .line 815
    .local v3, "_argIndex":I
    invoke-virtual {v1, v3, p1}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 816
    iget-object v4, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v4}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 817
    iget-object v4, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v4, v1, v6, v5}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v4

    .line 819
    .local v4, "_cursor":Landroid/database/Cursor;
    const/4 v5, 0x0

    .line 820
    .local v5, "_cursorIndexOfId":I
    const/4 v7, 0x1

    .line 821
    .local v7, "_cursorIndexOfState":I
    :try_start_0
    new-instance v8, Ljava/util/ArrayList;

    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I

    move-result v9

    invoke-direct {v8, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 822
    .local v8, "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec$IdAndState;>;"
    :goto_0
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 825
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 828
    .local v9, "_tmpId":Ljava/lang/String;
    invoke-interface {v4, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v10

    .line 829
    .local v10, "_tmp":I
    sget-object v11, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v10}, Landroidx/work/impl/model/WorkTypeConverters;->intToState(I)Landroidx/work/WorkInfo$State;

    move-result-object v11

    .line 830
    .local v11, "_tmpState":Landroidx/work/WorkInfo$State;
    new-instance v12, Landroidx/work/impl/model/WorkSpec$IdAndState;

    invoke-direct {v12, v9, v11}, Landroidx/work/impl/model/WorkSpec$IdAndState;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;)V

    .line 831
    .local v12, "_item":Landroidx/work/impl/model/WorkSpec$IdAndState;
    invoke-interface {v8, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 832
    nop

    .end local v9    # "_tmpId":Ljava/lang/String;
    .end local v10    # "_tmp":I
    .end local v11    # "_tmpState":Landroidx/work/WorkInfo$State;
    .end local v12    # "_item":Landroidx/work/impl/model/WorkSpec$IdAndState;
    goto :goto_0

    .line 833
    :cond_0
    nop

    .line 835
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 836
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 833
    return-object v8

    .line 835
    .end local v5    # "_cursorIndexOfId":I
    .end local v7    # "_cursorIndexOfState":I
    .end local v8    # "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec$IdAndState;>;"
    :catchall_0
    move-exception v2

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 836
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 837
    throw v2
.end method

.method public getWorkStatusPojoFlowDataForIds(Ljava/util/List;)Lkotlinx/coroutines/flow/Flow;
    .locals 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "ids"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lkotlinx/coroutines/flow/Flow<",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;",
            ">;>;"
        }
    .end annotation

    .line 1390
    .local p1, "ids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {}, Landroidx/room/util/StringUtil;->newStringBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1391
    .local v0, "_stringBuilder":Ljava/lang/StringBuilder;
    const-string v1, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id IN ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1392
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    .line 1393
    .local v1, "_inputSize":I
    invoke-static {v0, v1}, Landroidx/room/util/StringUtil;->appendPlaceholders(Ljava/lang/StringBuilder;I)V

    .line 1394
    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1395
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1396
    .local v2, "_sql":Ljava/lang/String;
    add-int/lit8 v3, v1, 0x0

    .line 1397
    .local v3, "_argCount":I
    invoke-static {v2, v3}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v4

    .line 1398
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v5, 0x1

    .line 1399
    .local v5, "_argIndex":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 1400
    .local v7, "_item":Ljava/lang/String;
    invoke-virtual {v4, v5, v7}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 1401
    nop

    .end local v7    # "_item":Ljava/lang/String;
    add-int/lit8 v5, v5, 0x1

    .line 1402
    goto :goto_0

    .line 1403
    :cond_0
    iget-object v6, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/String;

    const-string v8, "WorkTag"

    const/4 v9, 0x0

    aput-object v8, v7, v9

    const-string v8, "WorkProgress"

    const/4 v9, 0x1

    aput-object v8, v7, v9

    const/4 v8, 0x2

    const-string/jumbo v10, "workspec"

    aput-object v10, v7, v8

    new-instance v8, Landroidx/work/impl/model/WorkSpecDao_Impl$20;

    invoke-direct {v8, p0, v4}, Landroidx/work/impl/model/WorkSpecDao_Impl$20;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomSQLiteQuery;)V

    invoke-static {v6, v9, v7, v8}, Landroidx/room/CoroutinesRoom;->createFlow(Landroidx/room/RoomDatabase;Z[Ljava/lang/String;Ljava/util/concurrent/Callable;)Lkotlinx/coroutines/flow/Flow;

    move-result-object v6

    return-object v6
.end method

.method public getWorkStatusPojoFlowForName(Ljava/lang/String;)Lkotlinx/coroutines/flow/Flow;
    .locals 8
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "name"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lkotlinx/coroutines/flow/Flow<",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;",
            ">;>;"
        }
    .end annotation

    .line 2306
    const-string v0, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id IN (SELECT work_spec_id FROM workname WHERE name=?)"

    .line 2307
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id IN (SELECT work_spec_id FROM workname WHERE name=?)"

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 2308
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v3, 0x1

    .line 2309
    .local v3, "_argIndex":I
    invoke-virtual {v1, v3, p1}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 2310
    iget-object v4, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "WorkTag"

    aput-object v7, v5, v6

    const-string v6, "WorkProgress"

    aput-object v6, v5, v2

    const/4 v6, 0x2

    const-string/jumbo v7, "workspec"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string/jumbo v7, "workname"

    aput-object v7, v5, v6

    new-instance v6, Landroidx/work/impl/model/WorkSpecDao_Impl$24;

    invoke-direct {v6, p0, v1}, Landroidx/work/impl/model/WorkSpecDao_Impl$24;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomSQLiteQuery;)V

    invoke-static {v4, v2, v5, v6}, Landroidx/room/CoroutinesRoom;->createFlow(Landroidx/room/RoomDatabase;Z[Ljava/lang/String;Ljava/util/concurrent/Callable;)Lkotlinx/coroutines/flow/Flow;

    move-result-object v2

    return-object v2
.end method

.method public getWorkStatusPojoFlowForTag(Ljava/lang/String;)Lkotlinx/coroutines/flow/Flow;
    .locals 8
    .param p1, "tag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "tag"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lkotlinx/coroutines/flow/Flow<",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;",
            ">;>;"
        }
    .end annotation

    .line 1698
    const-string v0, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id IN\n            (SELECT work_spec_id FROM worktag WHERE tag=?)"

    .line 1700
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id IN\n            (SELECT work_spec_id FROM worktag WHERE tag=?)"

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 1701
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v3, 0x1

    .line 1702
    .local v3, "_argIndex":I
    invoke-virtual {v1, v3, p1}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 1703
    iget-object v4, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "WorkTag"

    aput-object v7, v5, v6

    const-string v6, "WorkProgress"

    aput-object v6, v5, v2

    const/4 v6, 0x2

    const-string/jumbo v7, "workspec"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string/jumbo v7, "worktag"

    aput-object v7, v5, v6

    new-instance v6, Landroidx/work/impl/model/WorkSpecDao_Impl$21;

    invoke-direct {v6, p0, v1}, Landroidx/work/impl/model/WorkSpecDao_Impl$21;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomSQLiteQuery;)V

    invoke-static {v4, v2, v5, v6}, Landroidx/room/CoroutinesRoom;->createFlow(Landroidx/room/RoomDatabase;Z[Ljava/lang/String;Ljava/util/concurrent/Callable;)Lkotlinx/coroutines/flow/Flow;

    move-result-object v2

    return-object v2
.end method

.method public getWorkStatusPojoForId(Ljava/lang/String;)Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    .locals 79
    .param p1, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "id"
        }
    .end annotation

    .line 929
    move-object/from16 v1, p0

    const-string v2, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id=?"

    .line 930
    .local v2, "_sql":Ljava/lang/String;
    const-string v0, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id=?"

    const/4 v3, 0x1

    invoke-static {v0, v3}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v4

    .line 931
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v5, 0x1

    .line 932
    .local v5, "_argIndex":I
    move-object/from16 v6, p1

    invoke-virtual {v4, v5, v6}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 933
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 934
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 936
    :try_start_0
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v7, 0x0

    invoke-static {v0, v4, v3, v7}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    move-object v7, v0

    .line 938
    .local v7, "_cursor":Landroid/database/Cursor;
    const/4 v0, 0x0

    .line 939
    .local v0, "_cursorIndexOfId":I
    const/4 v8, 0x1

    .line 940
    .local v8, "_cursorIndexOfState":I
    const/4 v9, 0x2

    .line 941
    .local v9, "_cursorIndexOfOutput":I
    const/4 v10, 0x3

    .line 942
    .local v10, "_cursorIndexOfRunAttemptCount":I
    const/4 v11, 0x4

    .line 943
    .local v11, "_cursorIndexOfGeneration":I
    const/4 v12, 0x5

    .line 944
    .local v12, "_cursorIndexOfRequiredNetworkType":I
    const/4 v13, 0x6

    .line 945
    .local v13, "_cursorIndexOfRequiredNetworkRequestCompat":I
    const/4 v14, 0x7

    .line 946
    .local v14, "_cursorIndexOfRequiresCharging":I
    const/16 v15, 0x8

    .line 947
    .local v15, "_cursorIndexOfRequiresDeviceIdle":I
    const/16 v16, 0x9

    .line 948
    .local v16, "_cursorIndexOfRequiresBatteryNotLow":I
    const/16 v17, 0xa

    .line 949
    .local v17, "_cursorIndexOfRequiresStorageNotLow":I
    const/16 v18, 0xb

    .line 950
    .local v18, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    const/16 v19, 0xc

    .line 951
    .local v19, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    const/16 v20, 0xd

    .line 952
    .local v20, "_cursorIndexOfContentUriTriggers":I
    const/16 v21, 0xe

    .line 953
    .local v21, "_cursorIndexOfInitialDelay":I
    const/16 v22, 0xf

    .line 954
    .local v22, "_cursorIndexOfIntervalDuration":I
    const/16 v23, 0x10

    .line 955
    .local v23, "_cursorIndexOfFlexDuration":I
    const/16 v24, 0x11

    .line 956
    .local v24, "_cursorIndexOfBackoffPolicy":I
    const/16 v25, 0x12

    .line 957
    .local v25, "_cursorIndexOfBackoffDelayDuration":I
    const/16 v26, 0x13

    .line 958
    .local v26, "_cursorIndexOfLastEnqueueTime":I
    const/16 v27, 0x14

    .line 959
    .local v27, "_cursorIndexOfPeriodCount":I
    const/16 v28, 0x15

    .line 960
    .local v28, "_cursorIndexOfNextScheduleTimeOverride":I
    const/16 v29, 0x16

    .line 961
    .local v29, "_cursorIndexOfStopReason":I
    :try_start_1
    new-instance v30, Ljava/util/HashMap;

    invoke-direct/range {v30 .. v30}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v31, v30

    .line 962
    .local v31, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    new-instance v30, Ljava/util/HashMap;

    invoke-direct/range {v30 .. v30}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v32, v30

    .line 963
    .local v32, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :goto_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v30

    const/4 v3, 0x0

    if-eqz v30, :cond_2

    .line 965
    invoke-interface {v7, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v30

    move-object/from16 v34, v30

    .line 966
    .local v34, "_tmpKey":Ljava/lang/String;
    move-object/from16 v3, v31

    move/from16 v31, v0

    move-object/from16 v0, v34

    .end local v34    # "_tmpKey":Ljava/lang/String;
    .local v0, "_tmpKey":Ljava/lang/String;
    .local v3, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v31, "_cursorIndexOfId":I
    invoke-virtual {v3, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v34
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    if-nez v34, :cond_0

    .line 967
    move-object/from16 v34, v2

    .end local v2    # "_sql":Ljava/lang/String;
    .local v34, "_sql":Ljava/lang/String;
    :try_start_2
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 1063
    .end local v0    # "_tmpKey":Ljava/lang/String;
    .end local v3    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .end local v8    # "_cursorIndexOfState":I
    .end local v9    # "_cursorIndexOfOutput":I
    .end local v10    # "_cursorIndexOfRunAttemptCount":I
    .end local v11    # "_cursorIndexOfGeneration":I
    .end local v12    # "_cursorIndexOfRequiredNetworkType":I
    .end local v13    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v14    # "_cursorIndexOfRequiresCharging":I
    .end local v15    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v16    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v17    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v18    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v19    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v20    # "_cursorIndexOfContentUriTriggers":I
    .end local v21    # "_cursorIndexOfInitialDelay":I
    .end local v22    # "_cursorIndexOfIntervalDuration":I
    .end local v23    # "_cursorIndexOfFlexDuration":I
    .end local v24    # "_cursorIndexOfBackoffPolicy":I
    .end local v25    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v26    # "_cursorIndexOfLastEnqueueTime":I
    .end local v27    # "_cursorIndexOfPeriodCount":I
    .end local v28    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v29    # "_cursorIndexOfStopReason":I
    .end local v31    # "_cursorIndexOfId":I
    .end local v32    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :catchall_0
    move-exception v0

    move-object/from16 v32, v4

    goto/16 :goto_8

    .line 966
    .end local v34    # "_sql":Ljava/lang/String;
    .restart local v0    # "_tmpKey":Ljava/lang/String;
    .restart local v2    # "_sql":Ljava/lang/String;
    .restart local v3    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .restart local v8    # "_cursorIndexOfState":I
    .restart local v9    # "_cursorIndexOfOutput":I
    .restart local v10    # "_cursorIndexOfRunAttemptCount":I
    .restart local v11    # "_cursorIndexOfGeneration":I
    .restart local v12    # "_cursorIndexOfRequiredNetworkType":I
    .restart local v13    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .restart local v14    # "_cursorIndexOfRequiresCharging":I
    .restart local v15    # "_cursorIndexOfRequiresDeviceIdle":I
    .restart local v16    # "_cursorIndexOfRequiresBatteryNotLow":I
    .restart local v17    # "_cursorIndexOfRequiresStorageNotLow":I
    .restart local v18    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .restart local v19    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .restart local v20    # "_cursorIndexOfContentUriTriggers":I
    .restart local v21    # "_cursorIndexOfInitialDelay":I
    .restart local v22    # "_cursorIndexOfIntervalDuration":I
    .restart local v23    # "_cursorIndexOfFlexDuration":I
    .restart local v24    # "_cursorIndexOfBackoffPolicy":I
    .restart local v25    # "_cursorIndexOfBackoffDelayDuration":I
    .restart local v26    # "_cursorIndexOfLastEnqueueTime":I
    .restart local v27    # "_cursorIndexOfPeriodCount":I
    .restart local v28    # "_cursorIndexOfNextScheduleTimeOverride":I
    .restart local v29    # "_cursorIndexOfStopReason":I
    .restart local v31    # "_cursorIndexOfId":I
    .restart local v32    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :cond_0
    move-object/from16 v34, v2

    .line 970
    .end local v2    # "_sql":Ljava/lang/String;
    .restart local v34    # "_sql":Ljava/lang/String;
    :goto_1
    const/4 v2, 0x0

    :try_start_3
    invoke-interface {v7, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 971
    .local v2, "_tmpKey_1":Ljava/lang/String;
    move-object/from16 v30, v0

    move-object/from16 v0, v32

    .end local v32    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .local v0, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .local v30, "_tmpKey":Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v32
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-nez v32, :cond_1

    .line 972
    move-object/from16 v32, v4

    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .local v32, "_statement":Landroidx/room/RoomSQLiteQuery;
    :try_start_4
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 971
    .end local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    :cond_1
    move-object/from16 v32, v4

    .line 974
    .end local v2    # "_tmpKey_1":Ljava/lang/String;
    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v30    # "_tmpKey":Ljava/lang/String;
    .restart local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    :goto_2
    move-object/from16 v4, v32

    move-object/from16 v2, v34

    move-object/from16 v32, v0

    move/from16 v0, v31

    move-object/from16 v31, v3

    const/4 v3, 0x1

    goto :goto_0

    .line 1063
    .end local v0    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .end local v3    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .end local v8    # "_cursorIndexOfState":I
    .end local v9    # "_cursorIndexOfOutput":I
    .end local v10    # "_cursorIndexOfRunAttemptCount":I
    .end local v11    # "_cursorIndexOfGeneration":I
    .end local v12    # "_cursorIndexOfRequiredNetworkType":I
    .end local v13    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v14    # "_cursorIndexOfRequiresCharging":I
    .end local v15    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v16    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v17    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v18    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v19    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v20    # "_cursorIndexOfContentUriTriggers":I
    .end local v21    # "_cursorIndexOfInitialDelay":I
    .end local v22    # "_cursorIndexOfIntervalDuration":I
    .end local v23    # "_cursorIndexOfFlexDuration":I
    .end local v24    # "_cursorIndexOfBackoffPolicy":I
    .end local v25    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v26    # "_cursorIndexOfLastEnqueueTime":I
    .end local v27    # "_cursorIndexOfPeriodCount":I
    .end local v28    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v29    # "_cursorIndexOfStopReason":I
    .end local v31    # "_cursorIndexOfId":I
    .end local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    :catchall_1
    move-exception v0

    move-object/from16 v32, v4

    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    goto/16 :goto_8

    .line 975
    .end local v34    # "_sql":Ljava/lang/String;
    .local v0, "_cursorIndexOfId":I
    .local v2, "_sql":Ljava/lang/String;
    .restart local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v8    # "_cursorIndexOfState":I
    .restart local v9    # "_cursorIndexOfOutput":I
    .restart local v10    # "_cursorIndexOfRunAttemptCount":I
    .restart local v11    # "_cursorIndexOfGeneration":I
    .restart local v12    # "_cursorIndexOfRequiredNetworkType":I
    .restart local v13    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .restart local v14    # "_cursorIndexOfRequiresCharging":I
    .restart local v15    # "_cursorIndexOfRequiresDeviceIdle":I
    .restart local v16    # "_cursorIndexOfRequiresBatteryNotLow":I
    .restart local v17    # "_cursorIndexOfRequiresStorageNotLow":I
    .restart local v18    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .restart local v19    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .restart local v20    # "_cursorIndexOfContentUriTriggers":I
    .restart local v21    # "_cursorIndexOfInitialDelay":I
    .restart local v22    # "_cursorIndexOfIntervalDuration":I
    .restart local v23    # "_cursorIndexOfFlexDuration":I
    .restart local v24    # "_cursorIndexOfBackoffPolicy":I
    .restart local v25    # "_cursorIndexOfBackoffDelayDuration":I
    .restart local v26    # "_cursorIndexOfLastEnqueueTime":I
    .restart local v27    # "_cursorIndexOfPeriodCount":I
    .restart local v28    # "_cursorIndexOfNextScheduleTimeOverride":I
    .restart local v29    # "_cursorIndexOfStopReason":I
    .local v31, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v32, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :cond_2
    move-object/from16 v34, v2

    move-object/from16 v3, v31

    move/from16 v31, v0

    move-object/from16 v0, v32

    move-object/from16 v32, v4

    .end local v2    # "_sql":Ljava/lang/String;
    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .local v0, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .restart local v3    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v31, "_cursorIndexOfId":I
    .local v32, "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v34    # "_sql":Ljava/lang/String;
    const/4 v2, -0x1

    invoke-interface {v7, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 976
    invoke-direct {v1, v3}, Landroidx/work/impl/model/WorkSpecDao_Impl;->__fetchRelationshipWorkTagAsjavaLangString(Ljava/util/HashMap;)V

    .line 977
    invoke-direct {v1, v0}, Landroidx/work/impl/model/WorkSpecDao_Impl;->__fetchRelationshipWorkProgressAsandroidxWorkData(Ljava/util/HashMap;)V

    .line 979
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 981
    const/4 v2, 0x0

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v36, v4

    .line 984
    .local v36, "_tmpId":Ljava/lang/String;
    const/4 v2, 0x1

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    .line 985
    .local v4, "_tmp":I
    sget-object v33, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v4}, Landroidx/work/impl/model/WorkTypeConverters;->intToState(I)Landroidx/work/WorkInfo$State;

    move-result-object v37

    .line 988
    .local v37, "_tmpState":Landroidx/work/WorkInfo$State;
    const/4 v2, 0x2

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v2

    .line 989
    .local v2, "_tmp_1":[B
    invoke-static {v2}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v38

    .line 991
    .local v38, "_tmpOutput":Landroidx/work/Data;
    move-object/from16 v59, v2

    .end local v2    # "_tmp_1":[B
    .local v59, "_tmp_1":[B
    const/4 v2, 0x3

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v46

    .line 993
    .local v46, "_tmpRunAttemptCount":I
    const/4 v2, 0x4

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v53

    .line 995
    .local v53, "_tmpGeneration":I
    const/16 v2, 0xe

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v39

    .line 997
    .local v39, "_tmpInitialDelay":J
    const/16 v2, 0xf

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v41

    .line 999
    .local v41, "_tmpIntervalDuration":J
    const/16 v2, 0x10

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v43

    .line 1002
    .local v43, "_tmpFlexDuration":J
    const/16 v2, 0x11

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 1003
    .local v2, "_tmp_2":I
    sget-object v35, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v2}, Landroidx/work/impl/model/WorkTypeConverters;->intToBackoffPolicy(I)Landroidx/work/BackoffPolicy;

    move-result-object v47

    .line 1005
    .local v47, "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    move/from16 v60, v2

    .end local v2    # "_tmp_2":I
    .local v60, "_tmp_2":I
    const/16 v2, 0x12

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v48

    .line 1007
    .local v48, "_tmpBackoffDelayDuration":J
    const/16 v2, 0x13

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v50

    .line 1009
    .local v50, "_tmpLastEnqueueTime":J
    const/16 v2, 0x14

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v52

    .line 1011
    .local v52, "_tmpPeriodCount":I
    const/16 v2, 0x15

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v54

    .line 1013
    .local v54, "_tmpNextScheduleTimeOverride":J
    const/16 v2, 0x16

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v56

    .line 1017
    .local v56, "_tmpStopReason":I
    const/4 v2, 0x5

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 1018
    .local v2, "_tmp_3":I
    sget-object v35, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v2}, Landroidx/work/impl/model/WorkTypeConverters;->intToNetworkType(I)Landroidx/work/NetworkType;

    move-result-object v35

    move-object/from16 v63, v35

    .line 1021
    .local v63, "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    move/from16 v73, v2

    .end local v2    # "_tmp_3":I
    .local v73, "_tmp_3":I
    const/4 v2, 0x6

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v2

    .line 1022
    .local v2, "_tmp_4":[B
    sget-object v35, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v2}, Landroidx/work/impl/model/WorkTypeConverters;->toNetworkRequest$work_runtime_release([B)Landroidx/work/impl/utils/NetworkRequestCompat;

    move-result-object v62

    .line 1025
    .local v62, "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    move-object/from16 v74, v2

    .end local v2    # "_tmp_4":[B
    .local v74, "_tmp_4":[B
    const/4 v2, 0x7

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 1026
    .local v2, "_tmp_5":I
    if-eqz v2, :cond_3

    const/16 v64, 0x1

    goto :goto_3

    :cond_3
    const/16 v64, 0x0

    .line 1029
    .local v64, "_tmpRequiresCharging":Z
    :goto_3
    move/from16 v75, v2

    .end local v2    # "_tmp_5":I
    .local v75, "_tmp_5":I
    const/16 v2, 0x8

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 1030
    .local v2, "_tmp_6":I
    if-eqz v2, :cond_4

    const/16 v65, 0x1

    goto :goto_4

    :cond_4
    const/16 v65, 0x0

    .line 1033
    .local v65, "_tmpRequiresDeviceIdle":Z
    :goto_4
    move/from16 v76, v2

    .end local v2    # "_tmp_6":I
    .local v76, "_tmp_6":I
    const/16 v2, 0x9

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 1034
    .local v2, "_tmp_7":I
    if-eqz v2, :cond_5

    const/16 v66, 0x1

    goto :goto_5

    :cond_5
    const/16 v66, 0x0

    .line 1037
    .local v66, "_tmpRequiresBatteryNotLow":Z
    :goto_5
    move/from16 v77, v2

    .end local v2    # "_tmp_7":I
    .local v77, "_tmp_7":I
    const/16 v2, 0xa

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 1038
    .local v2, "_tmp_8":I
    if-eqz v2, :cond_6

    const/16 v67, 0x1

    goto :goto_6

    :cond_6
    const/16 v67, 0x0

    .line 1040
    .local v67, "_tmpRequiresStorageNotLow":Z
    :goto_6
    move/from16 v33, v2

    .end local v2    # "_tmp_8":I
    .local v33, "_tmp_8":I
    const/16 v2, 0xb

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v68

    .line 1042
    .local v68, "_tmpContentTriggerUpdateDelayMillis":J
    const/16 v2, 0xc

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v70

    .line 1045
    .local v70, "_tmpContentTriggerMaxDelayMillis":J
    const/16 v2, 0xd

    invoke-interface {v7, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v2

    .line 1046
    .local v2, "_tmp_9":[B
    sget-object v35, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v2}, Landroidx/work/impl/model/WorkTypeConverters;->byteArrayToSetOfTriggers([B)Ljava/util/Set;

    move-result-object v72

    .line 1047
    .local v72, "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    new-instance v61, Landroidx/work/Constraints;

    invoke-direct/range {v61 .. v72}, Landroidx/work/Constraints;-><init>(Landroidx/work/impl/utils/NetworkRequestCompat;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    move-object/from16 v45, v61

    .line 1050
    .local v45, "_tmpConstraints":Landroidx/work/Constraints;
    move-object/from16 v61, v2

    const/4 v2, 0x0

    .end local v2    # "_tmp_9":[B
    .local v61, "_tmp_9":[B
    invoke-interface {v7, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v35

    move-object/from16 v2, v35

    .line 1051
    .local v2, "_tmpKey_2":Ljava/lang/String;
    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v35

    move-object/from16 v57, v35

    check-cast v57, Ljava/util/ArrayList;

    .line 1054
    .local v57, "_tmpTagsCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v78, v2

    const/4 v2, 0x0

    .end local v2    # "_tmpKey_2":Ljava/lang/String;
    .local v78, "_tmpKey_2":Ljava/lang/String;
    invoke-interface {v7, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1055
    .local v2, "_tmpKey_3":Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v30

    move-object/from16 v58, v30

    check-cast v58, Ljava/util/ArrayList;

    .line 1056
    .local v58, "_tmpProgressCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/work/Data;>;"
    new-instance v35, Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;

    invoke-direct/range {v35 .. v58}, Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Landroidx/work/Data;JJJLandroidx/work/Constraints;ILandroidx/work/BackoffPolicy;JJIIJILjava/util/List;Ljava/util/List;)V

    .line 1057
    .end local v2    # "_tmpKey_3":Ljava/lang/String;
    .end local v4    # "_tmp":I
    .end local v33    # "_tmp_8":I
    .end local v36    # "_tmpId":Ljava/lang/String;
    .end local v37    # "_tmpState":Landroidx/work/WorkInfo$State;
    .end local v38    # "_tmpOutput":Landroidx/work/Data;
    .end local v39    # "_tmpInitialDelay":J
    .end local v41    # "_tmpIntervalDuration":J
    .end local v43    # "_tmpFlexDuration":J
    .end local v45    # "_tmpConstraints":Landroidx/work/Constraints;
    .end local v46    # "_tmpRunAttemptCount":I
    .end local v47    # "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    .end local v48    # "_tmpBackoffDelayDuration":J
    .end local v50    # "_tmpLastEnqueueTime":J
    .end local v52    # "_tmpPeriodCount":I
    .end local v53    # "_tmpGeneration":I
    .end local v54    # "_tmpNextScheduleTimeOverride":J
    .end local v56    # "_tmpStopReason":I
    .end local v57    # "_tmpTagsCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v58    # "_tmpProgressCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/work/Data;>;"
    .end local v59    # "_tmp_1":[B
    .end local v60    # "_tmp_2":I
    .end local v61    # "_tmp_9":[B
    .end local v62    # "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    .end local v63    # "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    .end local v64    # "_tmpRequiresCharging":Z
    .end local v65    # "_tmpRequiresDeviceIdle":Z
    .end local v66    # "_tmpRequiresBatteryNotLow":Z
    .end local v67    # "_tmpRequiresStorageNotLow":Z
    .end local v68    # "_tmpContentTriggerUpdateDelayMillis":J
    .end local v70    # "_tmpContentTriggerMaxDelayMillis":J
    .end local v72    # "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    .end local v73    # "_tmp_3":I
    .end local v74    # "_tmp_4":[B
    .end local v75    # "_tmp_5":I
    .end local v76    # "_tmp_6":I
    .end local v77    # "_tmp_7":I
    .end local v78    # "_tmpKey_2":Ljava/lang/String;
    .local v35, "_result":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    goto :goto_7

    .line 1058
    .end local v35    # "_result":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    :cond_7
    const/4 v2, 0x0

    move-object/from16 v35, v2

    .line 1060
    .restart local v35    # "_result":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    :goto_7
    iget-object v2, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 1061
    nop

    .line 1063
    :try_start_5
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1064
    invoke-virtual/range {v32 .. v32}, Landroidx/room/RoomSQLiteQuery;->release()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 1067
    iget-object v2, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 1061
    return-object v35

    .line 1063
    .end local v0    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .end local v3    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .end local v8    # "_cursorIndexOfState":I
    .end local v9    # "_cursorIndexOfOutput":I
    .end local v10    # "_cursorIndexOfRunAttemptCount":I
    .end local v11    # "_cursorIndexOfGeneration":I
    .end local v12    # "_cursorIndexOfRequiredNetworkType":I
    .end local v13    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v14    # "_cursorIndexOfRequiresCharging":I
    .end local v15    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v16    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v17    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v18    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v19    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v20    # "_cursorIndexOfContentUriTriggers":I
    .end local v21    # "_cursorIndexOfInitialDelay":I
    .end local v22    # "_cursorIndexOfIntervalDuration":I
    .end local v23    # "_cursorIndexOfFlexDuration":I
    .end local v24    # "_cursorIndexOfBackoffPolicy":I
    .end local v25    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v26    # "_cursorIndexOfLastEnqueueTime":I
    .end local v27    # "_cursorIndexOfPeriodCount":I
    .end local v28    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v29    # "_cursorIndexOfStopReason":I
    .end local v31    # "_cursorIndexOfId":I
    .end local v35    # "_result":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    :catchall_2
    move-exception v0

    goto :goto_8

    .end local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v34    # "_sql":Ljava/lang/String;
    .local v2, "_sql":Ljava/lang/String;
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    :catchall_3
    move-exception v0

    move-object/from16 v34, v2

    move-object/from16 v32, v4

    .end local v2    # "_sql":Ljava/lang/String;
    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v34    # "_sql":Ljava/lang/String;
    :goto_8
    :try_start_6
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1064
    invoke-virtual/range {v32 .. v32}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 1065
    nop

    .end local v5    # "_argIndex":I
    .end local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v34    # "_sql":Ljava/lang/String;
    .end local p1    # "id":Ljava/lang/String;
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 1067
    .end local v7    # "_cursor":Landroid/database/Cursor;
    .restart local v5    # "_argIndex":I
    .restart local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v34    # "_sql":Ljava/lang/String;
    .restart local p1    # "id":Ljava/lang/String;
    :catchall_4
    move-exception v0

    goto :goto_9

    .end local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v34    # "_sql":Ljava/lang/String;
    .restart local v2    # "_sql":Ljava/lang/String;
    .restart local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    :catchall_5
    move-exception v0

    move-object/from16 v34, v2

    move-object/from16 v32, v4

    .end local v2    # "_sql":Ljava/lang/String;
    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v34    # "_sql":Ljava/lang/String;
    :goto_9
    iget-object v2, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 1068
    throw v0
.end method

.method public getWorkStatusPojoForIds(Ljava/util/List;)Ljava/util/List;
    .locals 84
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "ids"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;",
            ">;"
        }
    .end annotation

    .line 1073
    .local p1, "ids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    move-object/from16 v1, p0

    invoke-static {}, Landroidx/room/util/StringUtil;->newStringBuilder()Ljava/lang/StringBuilder;

    move-result-object v2

    .line 1074
    .local v2, "_stringBuilder":Ljava/lang/StringBuilder;
    const-string v0, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id IN ("

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1075
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v3

    .line 1076
    .local v3, "_inputSize":I
    invoke-static {v2, v3}, Landroidx/room/util/StringUtil;->appendPlaceholders(Ljava/lang/StringBuilder;I)V

    .line 1077
    const-string v0, ")"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1078
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 1079
    .local v4, "_sql":Ljava/lang/String;
    add-int/lit8 v5, v3, 0x0

    .line 1080
    .local v5, "_argCount":I
    invoke-static {v4, v5}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v6

    .line 1081
    .local v6, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v0, 0x1

    .line 1082
    .local v0, "_argIndex":I
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move v8, v0

    .end local v0    # "_argIndex":I
    .local v8, "_argIndex":I
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1083
    .local v0, "_item":Ljava/lang/String;
    invoke-virtual {v6, v8, v0}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 1084
    nop

    .end local v0    # "_item":Ljava/lang/String;
    add-int/lit8 v8, v8, 0x1

    .line 1085
    goto :goto_0

    .line 1086
    :cond_0
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 1087
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 1089
    :try_start_0
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v7, 0x0

    const/4 v9, 0x1

    invoke-static {v0, v6, v9, v7}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    move-object v7, v0

    .line 1091
    .local v7, "_cursor":Landroid/database/Cursor;
    const/4 v0, 0x0

    .line 1092
    .local v0, "_cursorIndexOfId":I
    const/4 v10, 0x1

    .line 1093
    .local v10, "_cursorIndexOfState":I
    const/4 v11, 0x2

    .line 1094
    .local v11, "_cursorIndexOfOutput":I
    const/4 v12, 0x3

    .line 1095
    .local v12, "_cursorIndexOfRunAttemptCount":I
    const/4 v13, 0x4

    .line 1096
    .local v13, "_cursorIndexOfGeneration":I
    const/4 v14, 0x5

    .line 1097
    .local v14, "_cursorIndexOfRequiredNetworkType":I
    const/4 v15, 0x6

    .line 1098
    .local v15, "_cursorIndexOfRequiredNetworkRequestCompat":I
    const/16 v16, 0x7

    .line 1099
    .local v16, "_cursorIndexOfRequiresCharging":I
    const/16 v17, 0x8

    .line 1100
    .local v17, "_cursorIndexOfRequiresDeviceIdle":I
    const/16 v18, 0x9

    .line 1101
    .local v18, "_cursorIndexOfRequiresBatteryNotLow":I
    const/16 v19, 0xa

    .line 1102
    .local v19, "_cursorIndexOfRequiresStorageNotLow":I
    const/16 v20, 0xb

    .line 1103
    .local v20, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    const/16 v21, 0xc

    .line 1104
    .local v21, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    const/16 v22, 0xd

    .line 1105
    .local v22, "_cursorIndexOfContentUriTriggers":I
    const/16 v23, 0xe

    .line 1106
    .local v23, "_cursorIndexOfInitialDelay":I
    const/16 v24, 0xf

    .line 1107
    .local v24, "_cursorIndexOfIntervalDuration":I
    const/16 v25, 0x10

    .line 1108
    .local v25, "_cursorIndexOfFlexDuration":I
    const/16 v26, 0x11

    .line 1109
    .local v26, "_cursorIndexOfBackoffPolicy":I
    const/16 v27, 0x12

    .line 1110
    .local v27, "_cursorIndexOfBackoffDelayDuration":I
    const/16 v28, 0x13

    .line 1111
    .local v28, "_cursorIndexOfLastEnqueueTime":I
    const/16 v29, 0x14

    .line 1112
    .local v29, "_cursorIndexOfPeriodCount":I
    const/16 v30, 0x15

    .line 1113
    .local v30, "_cursorIndexOfNextScheduleTimeOverride":I
    const/16 v31, 0x16

    .line 1114
    .local v31, "_cursorIndexOfStopReason":I
    :try_start_1
    new-instance v32, Ljava/util/HashMap;

    invoke-direct/range {v32 .. v32}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v33, v32

    .line 1115
    .local v33, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    new-instance v32, Ljava/util/HashMap;

    invoke-direct/range {v32 .. v32}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v34, v32

    .line 1116
    .local v34, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :goto_1
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v32

    const/4 v9, 0x0

    if-eqz v32, :cond_3

    .line 1118
    invoke-interface {v7, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v36, v32

    .line 1119
    .local v36, "_tmpKey":Ljava/lang/String;
    move-object/from16 v9, v33

    move/from16 v33, v0

    move-object/from16 v0, v36

    .end local v36    # "_tmpKey":Ljava/lang/String;
    .local v0, "_tmpKey":Ljava/lang/String;
    .local v9, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v33, "_cursorIndexOfId":I
    invoke-virtual {v9, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v36
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    if-nez v36, :cond_1

    .line 1120
    move-object/from16 v36, v2

    .end local v2    # "_stringBuilder":Ljava/lang/StringBuilder;
    .local v36, "_stringBuilder":Ljava/lang/StringBuilder;
    :try_start_2
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v9, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_2

    .line 1216
    .end local v0    # "_tmpKey":Ljava/lang/String;
    .end local v9    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .end local v10    # "_cursorIndexOfState":I
    .end local v11    # "_cursorIndexOfOutput":I
    .end local v12    # "_cursorIndexOfRunAttemptCount":I
    .end local v13    # "_cursorIndexOfGeneration":I
    .end local v14    # "_cursorIndexOfRequiredNetworkType":I
    .end local v15    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v16    # "_cursorIndexOfRequiresCharging":I
    .end local v17    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v18    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v19    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v20    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v21    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v22    # "_cursorIndexOfContentUriTriggers":I
    .end local v23    # "_cursorIndexOfInitialDelay":I
    .end local v24    # "_cursorIndexOfIntervalDuration":I
    .end local v25    # "_cursorIndexOfFlexDuration":I
    .end local v26    # "_cursorIndexOfBackoffPolicy":I
    .end local v27    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v28    # "_cursorIndexOfLastEnqueueTime":I
    .end local v29    # "_cursorIndexOfPeriodCount":I
    .end local v30    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v31    # "_cursorIndexOfStopReason":I
    .end local v33    # "_cursorIndexOfId":I
    .end local v34    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :catchall_0
    move-exception v0

    move/from16 v34, v3

    goto/16 :goto_9

    .line 1119
    .end local v36    # "_stringBuilder":Ljava/lang/StringBuilder;
    .restart local v0    # "_tmpKey":Ljava/lang/String;
    .restart local v2    # "_stringBuilder":Ljava/lang/StringBuilder;
    .restart local v9    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .restart local v10    # "_cursorIndexOfState":I
    .restart local v11    # "_cursorIndexOfOutput":I
    .restart local v12    # "_cursorIndexOfRunAttemptCount":I
    .restart local v13    # "_cursorIndexOfGeneration":I
    .restart local v14    # "_cursorIndexOfRequiredNetworkType":I
    .restart local v15    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .restart local v16    # "_cursorIndexOfRequiresCharging":I
    .restart local v17    # "_cursorIndexOfRequiresDeviceIdle":I
    .restart local v18    # "_cursorIndexOfRequiresBatteryNotLow":I
    .restart local v19    # "_cursorIndexOfRequiresStorageNotLow":I
    .restart local v20    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .restart local v21    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .restart local v22    # "_cursorIndexOfContentUriTriggers":I
    .restart local v23    # "_cursorIndexOfInitialDelay":I
    .restart local v24    # "_cursorIndexOfIntervalDuration":I
    .restart local v25    # "_cursorIndexOfFlexDuration":I
    .restart local v26    # "_cursorIndexOfBackoffPolicy":I
    .restart local v27    # "_cursorIndexOfBackoffDelayDuration":I
    .restart local v28    # "_cursorIndexOfLastEnqueueTime":I
    .restart local v29    # "_cursorIndexOfPeriodCount":I
    .restart local v30    # "_cursorIndexOfNextScheduleTimeOverride":I
    .restart local v31    # "_cursorIndexOfStopReason":I
    .restart local v33    # "_cursorIndexOfId":I
    .restart local v34    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :cond_1
    move-object/from16 v36, v2

    .line 1123
    .end local v2    # "_stringBuilder":Ljava/lang/StringBuilder;
    .restart local v36    # "_stringBuilder":Ljava/lang/StringBuilder;
    :goto_2
    const/4 v2, 0x0

    :try_start_3
    invoke-interface {v7, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1124
    .local v2, "_tmpKey_1":Ljava/lang/String;
    move-object/from16 v32, v0

    move-object/from16 v0, v34

    .end local v34    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .local v0, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .local v32, "_tmpKey":Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v34
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-nez v34, :cond_2

    .line 1125
    move/from16 v34, v3

    .end local v3    # "_inputSize":I
    .local v34, "_inputSize":I
    :try_start_4
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 1124
    .end local v34    # "_inputSize":I
    .restart local v3    # "_inputSize":I
    :cond_2
    move/from16 v34, v3

    .line 1127
    .end local v2    # "_tmpKey_1":Ljava/lang/String;
    .end local v3    # "_inputSize":I
    .end local v32    # "_tmpKey":Ljava/lang/String;
    .restart local v34    # "_inputSize":I
    :goto_3
    move/from16 v3, v34

    move-object/from16 v2, v36

    move-object/from16 v34, v0

    move/from16 v0, v33

    move-object/from16 v33, v9

    const/4 v9, 0x1

    goto :goto_1

    .line 1216
    .end local v0    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .end local v9    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .end local v10    # "_cursorIndexOfState":I
    .end local v11    # "_cursorIndexOfOutput":I
    .end local v12    # "_cursorIndexOfRunAttemptCount":I
    .end local v13    # "_cursorIndexOfGeneration":I
    .end local v14    # "_cursorIndexOfRequiredNetworkType":I
    .end local v15    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v16    # "_cursorIndexOfRequiresCharging":I
    .end local v17    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v18    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v19    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v20    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v21    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v22    # "_cursorIndexOfContentUriTriggers":I
    .end local v23    # "_cursorIndexOfInitialDelay":I
    .end local v24    # "_cursorIndexOfIntervalDuration":I
    .end local v25    # "_cursorIndexOfFlexDuration":I
    .end local v26    # "_cursorIndexOfBackoffPolicy":I
    .end local v27    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v28    # "_cursorIndexOfLastEnqueueTime":I
    .end local v29    # "_cursorIndexOfPeriodCount":I
    .end local v30    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v31    # "_cursorIndexOfStopReason":I
    .end local v33    # "_cursorIndexOfId":I
    .end local v34    # "_inputSize":I
    .restart local v3    # "_inputSize":I
    :catchall_1
    move-exception v0

    move/from16 v34, v3

    .end local v3    # "_inputSize":I
    .restart local v34    # "_inputSize":I
    goto/16 :goto_9

    .line 1128
    .end local v36    # "_stringBuilder":Ljava/lang/StringBuilder;
    .local v0, "_cursorIndexOfId":I
    .local v2, "_stringBuilder":Ljava/lang/StringBuilder;
    .restart local v3    # "_inputSize":I
    .restart local v10    # "_cursorIndexOfState":I
    .restart local v11    # "_cursorIndexOfOutput":I
    .restart local v12    # "_cursorIndexOfRunAttemptCount":I
    .restart local v13    # "_cursorIndexOfGeneration":I
    .restart local v14    # "_cursorIndexOfRequiredNetworkType":I
    .restart local v15    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .restart local v16    # "_cursorIndexOfRequiresCharging":I
    .restart local v17    # "_cursorIndexOfRequiresDeviceIdle":I
    .restart local v18    # "_cursorIndexOfRequiresBatteryNotLow":I
    .restart local v19    # "_cursorIndexOfRequiresStorageNotLow":I
    .restart local v20    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .restart local v21    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .restart local v22    # "_cursorIndexOfContentUriTriggers":I
    .restart local v23    # "_cursorIndexOfInitialDelay":I
    .restart local v24    # "_cursorIndexOfIntervalDuration":I
    .restart local v25    # "_cursorIndexOfFlexDuration":I
    .restart local v26    # "_cursorIndexOfBackoffPolicy":I
    .restart local v27    # "_cursorIndexOfBackoffDelayDuration":I
    .restart local v28    # "_cursorIndexOfLastEnqueueTime":I
    .restart local v29    # "_cursorIndexOfPeriodCount":I
    .restart local v30    # "_cursorIndexOfNextScheduleTimeOverride":I
    .restart local v31    # "_cursorIndexOfStopReason":I
    .local v33, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v34, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :cond_3
    move-object/from16 v36, v2

    move-object/from16 v9, v33

    move/from16 v33, v0

    move-object/from16 v0, v34

    move/from16 v34, v3

    .end local v2    # "_stringBuilder":Ljava/lang/StringBuilder;
    .end local v3    # "_inputSize":I
    .local v0, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .restart local v9    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v33, "_cursorIndexOfId":I
    .local v34, "_inputSize":I
    .restart local v36    # "_stringBuilder":Ljava/lang/StringBuilder;
    const/4 v2, -0x1

    invoke-interface {v7, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 1129
    invoke-direct {v1, v9}, Landroidx/work/impl/model/WorkSpecDao_Impl;->__fetchRelationshipWorkTagAsjavaLangString(Ljava/util/HashMap;)V

    .line 1130
    invoke-direct {v1, v0}, Landroidx/work/impl/model/WorkSpecDao_Impl;->__fetchRelationshipWorkProgressAsandroidxWorkData(Ljava/util/HashMap;)V

    .line 1131
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 1132
    .local v2, "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;>;"
    :goto_4
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 1135
    const/4 v3, 0x0

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v37

    move-object/from16 v39, v37

    .line 1138
    .local v39, "_tmpId":Ljava/lang/String;
    const/4 v3, 0x1

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v35

    .line 1139
    .local v35, "_tmp":I
    sget-object v37, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v35 .. v35}, Landroidx/work/impl/model/WorkTypeConverters;->intToState(I)Landroidx/work/WorkInfo$State;

    move-result-object v40

    .line 1142
    .local v40, "_tmpState":Landroidx/work/WorkInfo$State;
    const/4 v3, 0x2

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    .line 1143
    .local v3, "_tmp_1":[B
    invoke-static {v3}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v41

    .line 1145
    .local v41, "_tmpOutput":Landroidx/work/Data;
    move-object/from16 v62, v3

    .end local v3    # "_tmp_1":[B
    .local v62, "_tmp_1":[B
    const/4 v3, 0x3

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v49

    .line 1147
    .local v49, "_tmpRunAttemptCount":I
    const/4 v3, 0x4

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v56

    .line 1149
    .local v56, "_tmpGeneration":I
    const/16 v3, 0xe

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v42

    .line 1151
    .local v42, "_tmpInitialDelay":J
    const/16 v3, 0xf

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v44

    .line 1153
    .local v44, "_tmpIntervalDuration":J
    const/16 v3, 0x10

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v46

    .line 1156
    .local v46, "_tmpFlexDuration":J
    const/16 v3, 0x11

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    .line 1157
    .local v3, "_tmp_2":I
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v3}, Landroidx/work/impl/model/WorkTypeConverters;->intToBackoffPolicy(I)Landroidx/work/BackoffPolicy;

    move-result-object v50

    .line 1159
    .local v50, "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    move/from16 v63, v3

    .end local v3    # "_tmp_2":I
    .local v63, "_tmp_2":I
    const/16 v3, 0x12

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v51

    .line 1161
    .local v51, "_tmpBackoffDelayDuration":J
    const/16 v3, 0x13

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v53

    .line 1163
    .local v53, "_tmpLastEnqueueTime":J
    const/16 v3, 0x14

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v55

    .line 1165
    .local v55, "_tmpPeriodCount":I
    const/16 v3, 0x15

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v57

    .line 1167
    .local v57, "_tmpNextScheduleTimeOverride":J
    const/16 v3, 0x16

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v59

    .line 1171
    .local v59, "_tmpStopReason":I
    const/4 v3, 0x5

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    .line 1172
    .local v3, "_tmp_3":I
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v3}, Landroidx/work/impl/model/WorkTypeConverters;->intToNetworkType(I)Landroidx/work/NetworkType;

    move-result-object v38

    move-object/from16 v66, v38

    .line 1175
    .local v66, "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    move/from16 v76, v3

    .end local v3    # "_tmp_3":I
    .local v76, "_tmp_3":I
    const/4 v3, 0x6

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    .line 1176
    .local v3, "_tmp_4":[B
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v3}, Landroidx/work/impl/model/WorkTypeConverters;->toNetworkRequest$work_runtime_release([B)Landroidx/work/impl/utils/NetworkRequestCompat;

    move-result-object v65

    .line 1179
    .local v65, "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    move-object/from16 v77, v3

    .end local v3    # "_tmp_4":[B
    .local v77, "_tmp_4":[B
    const/4 v3, 0x7

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    .line 1180
    .local v3, "_tmp_5":I
    if-eqz v3, :cond_4

    const/16 v67, 0x1

    goto :goto_5

    :cond_4
    const/16 v67, 0x0

    .line 1183
    .local v67, "_tmpRequiresCharging":Z
    :goto_5
    move/from16 v78, v3

    .end local v3    # "_tmp_5":I
    .local v78, "_tmp_5":I
    const/16 v3, 0x8

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    .line 1184
    .local v3, "_tmp_6":I
    if-eqz v3, :cond_5

    const/16 v68, 0x1

    goto :goto_6

    :cond_5
    const/16 v68, 0x0

    .line 1187
    .local v68, "_tmpRequiresDeviceIdle":Z
    :goto_6
    move/from16 v79, v3

    .end local v3    # "_tmp_6":I
    .local v79, "_tmp_6":I
    const/16 v3, 0x9

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    .line 1188
    .local v3, "_tmp_7":I
    if-eqz v3, :cond_6

    const/16 v69, 0x1

    goto :goto_7

    :cond_6
    const/16 v69, 0x0

    .line 1191
    .local v69, "_tmpRequiresBatteryNotLow":Z
    :goto_7
    move/from16 v80, v3

    .end local v3    # "_tmp_7":I
    .local v80, "_tmp_7":I
    const/16 v3, 0xa

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    .line 1192
    .local v3, "_tmp_8":I
    if-eqz v3, :cond_7

    const/16 v70, 0x1

    goto :goto_8

    :cond_7
    const/16 v70, 0x0

    .line 1194
    .local v70, "_tmpRequiresStorageNotLow":Z
    :goto_8
    move/from16 v81, v3

    .end local v3    # "_tmp_8":I
    .local v81, "_tmp_8":I
    const/16 v3, 0xb

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v71

    .line 1196
    .local v71, "_tmpContentTriggerUpdateDelayMillis":J
    const/16 v3, 0xc

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v73

    .line 1199
    .local v73, "_tmpContentTriggerMaxDelayMillis":J
    const/16 v3, 0xd

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    .line 1200
    .local v3, "_tmp_9":[B
    sget-object v38, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v3}, Landroidx/work/impl/model/WorkTypeConverters;->byteArrayToSetOfTriggers([B)Ljava/util/Set;

    move-result-object v75

    .line 1201
    .local v75, "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    new-instance v64, Landroidx/work/Constraints;

    invoke-direct/range {v64 .. v75}, Landroidx/work/Constraints;-><init>(Landroidx/work/impl/utils/NetworkRequestCompat;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    move-object/from16 v48, v64

    .line 1204
    .local v48, "_tmpConstraints":Landroidx/work/Constraints;
    move-object/from16 v64, v3

    const/4 v3, 0x0

    .end local v3    # "_tmp_9":[B
    .local v64, "_tmp_9":[B
    invoke-interface {v7, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v38

    move-object/from16 v3, v38

    .line 1205
    .local v3, "_tmpKey_2":Ljava/lang/String;
    invoke-virtual {v9, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v38

    move-object/from16 v60, v38

    check-cast v60, Ljava/util/ArrayList;

    .line 1208
    .local v60, "_tmpTagsCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v82, v3

    const/4 v3, 0x0

    .end local v3    # "_tmpKey_2":Ljava/lang/String;
    .local v82, "_tmpKey_2":Ljava/lang/String;
    invoke-interface {v7, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v83, v32

    .line 1209
    .local v83, "_tmpKey_3":Ljava/lang/String;
    move-object/from16 v3, v83

    .end local v83    # "_tmpKey_3":Ljava/lang/String;
    .local v3, "_tmpKey_3":Ljava/lang/String;
    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v38

    move-object/from16 v61, v38

    check-cast v61, Ljava/util/ArrayList;

    .line 1210
    .local v61, "_tmpProgressCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/work/Data;>;"
    new-instance v38, Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;

    invoke-direct/range {v38 .. v61}, Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Landroidx/work/Data;JJJLandroidx/work/Constraints;ILandroidx/work/BackoffPolicy;JJIIJILjava/util/List;Ljava/util/List;)V

    move-object/from16 v83, v38

    .line 1211
    .local v83, "_item_1":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    move-object/from16 v38, v0

    move-object/from16 v0, v83

    .end local v83    # "_item_1":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    .local v0, "_item_1":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    .local v38, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1212
    move-object/from16 v0, v38

    .end local v0    # "_item_1":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    .end local v3    # "_tmpKey_3":Ljava/lang/String;
    .end local v35    # "_tmp":I
    .end local v39    # "_tmpId":Ljava/lang/String;
    .end local v40    # "_tmpState":Landroidx/work/WorkInfo$State;
    .end local v41    # "_tmpOutput":Landroidx/work/Data;
    .end local v42    # "_tmpInitialDelay":J
    .end local v44    # "_tmpIntervalDuration":J
    .end local v46    # "_tmpFlexDuration":J
    .end local v48    # "_tmpConstraints":Landroidx/work/Constraints;
    .end local v49    # "_tmpRunAttemptCount":I
    .end local v50    # "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    .end local v51    # "_tmpBackoffDelayDuration":J
    .end local v53    # "_tmpLastEnqueueTime":J
    .end local v55    # "_tmpPeriodCount":I
    .end local v56    # "_tmpGeneration":I
    .end local v57    # "_tmpNextScheduleTimeOverride":J
    .end local v59    # "_tmpStopReason":I
    .end local v60    # "_tmpTagsCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v61    # "_tmpProgressCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/work/Data;>;"
    .end local v62    # "_tmp_1":[B
    .end local v63    # "_tmp_2":I
    .end local v64    # "_tmp_9":[B
    .end local v65    # "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    .end local v66    # "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    .end local v67    # "_tmpRequiresCharging":Z
    .end local v68    # "_tmpRequiresDeviceIdle":Z
    .end local v69    # "_tmpRequiresBatteryNotLow":Z
    .end local v70    # "_tmpRequiresStorageNotLow":Z
    .end local v71    # "_tmpContentTriggerUpdateDelayMillis":J
    .end local v73    # "_tmpContentTriggerMaxDelayMillis":J
    .end local v75    # "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    .end local v76    # "_tmp_3":I
    .end local v77    # "_tmp_4":[B
    .end local v78    # "_tmp_5":I
    .end local v79    # "_tmp_6":I
    .end local v80    # "_tmp_7":I
    .end local v81    # "_tmp_8":I
    .end local v82    # "_tmpKey_2":Ljava/lang/String;
    goto/16 :goto_4

    .line 1213
    .end local v38    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .local v0, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :cond_8
    move-object/from16 v38, v0

    .end local v0    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .restart local v38    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 1214
    nop

    .line 1216
    :try_start_5
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1217
    invoke-virtual {v6}, Landroidx/room/RoomSQLiteQuery;->release()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 1220
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 1214
    return-object v2

    .line 1216
    .end local v2    # "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;>;"
    .end local v9    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .end local v10    # "_cursorIndexOfState":I
    .end local v11    # "_cursorIndexOfOutput":I
    .end local v12    # "_cursorIndexOfRunAttemptCount":I
    .end local v13    # "_cursorIndexOfGeneration":I
    .end local v14    # "_cursorIndexOfRequiredNetworkType":I
    .end local v15    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v16    # "_cursorIndexOfRequiresCharging":I
    .end local v17    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v18    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v19    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v20    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v21    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v22    # "_cursorIndexOfContentUriTriggers":I
    .end local v23    # "_cursorIndexOfInitialDelay":I
    .end local v24    # "_cursorIndexOfIntervalDuration":I
    .end local v25    # "_cursorIndexOfFlexDuration":I
    .end local v26    # "_cursorIndexOfBackoffPolicy":I
    .end local v27    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v28    # "_cursorIndexOfLastEnqueueTime":I
    .end local v29    # "_cursorIndexOfPeriodCount":I
    .end local v30    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v31    # "_cursorIndexOfStopReason":I
    .end local v33    # "_cursorIndexOfId":I
    .end local v38    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :catchall_2
    move-exception v0

    goto :goto_9

    .end local v34    # "_inputSize":I
    .end local v36    # "_stringBuilder":Ljava/lang/StringBuilder;
    .local v2, "_stringBuilder":Ljava/lang/StringBuilder;
    .local v3, "_inputSize":I
    :catchall_3
    move-exception v0

    move-object/from16 v36, v2

    move/from16 v34, v3

    .end local v2    # "_stringBuilder":Ljava/lang/StringBuilder;
    .end local v3    # "_inputSize":I
    .restart local v34    # "_inputSize":I
    .restart local v36    # "_stringBuilder":Ljava/lang/StringBuilder;
    :goto_9
    :try_start_6
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1217
    invoke-virtual {v6}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 1218
    nop

    .end local v4    # "_sql":Ljava/lang/String;
    .end local v5    # "_argCount":I
    .end local v6    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v8    # "_argIndex":I
    .end local v34    # "_inputSize":I
    .end local v36    # "_stringBuilder":Ljava/lang/StringBuilder;
    .end local p1    # "ids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 1220
    .end local v7    # "_cursor":Landroid/database/Cursor;
    .restart local v4    # "_sql":Ljava/lang/String;
    .restart local v5    # "_argCount":I
    .restart local v6    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v8    # "_argIndex":I
    .restart local v34    # "_inputSize":I
    .restart local v36    # "_stringBuilder":Ljava/lang/StringBuilder;
    .restart local p1    # "ids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_4
    move-exception v0

    goto :goto_a

    .end local v34    # "_inputSize":I
    .end local v36    # "_stringBuilder":Ljava/lang/StringBuilder;
    .restart local v2    # "_stringBuilder":Ljava/lang/StringBuilder;
    .restart local v3    # "_inputSize":I
    :catchall_5
    move-exception v0

    move-object/from16 v36, v2

    move/from16 v34, v3

    .end local v2    # "_stringBuilder":Ljava/lang/StringBuilder;
    .end local v3    # "_inputSize":I
    .restart local v34    # "_inputSize":I
    .restart local v36    # "_stringBuilder":Ljava/lang/StringBuilder;
    :goto_a
    iget-object v2, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 1221
    throw v0
.end method

.method public getWorkStatusPojoForName(Ljava/lang/String;)Ljava/util/List;
    .locals 82
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "name"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;",
            ">;"
        }
    .end annotation

    .line 2008
    move-object/from16 v1, p0

    const-string v2, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id IN (SELECT work_spec_id FROM workname WHERE name=?)"

    .line 2009
    .local v2, "_sql":Ljava/lang/String;
    const-string v0, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id IN (SELECT work_spec_id FROM workname WHERE name=?)"

    const/4 v3, 0x1

    invoke-static {v0, v3}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v4

    .line 2010
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v5, 0x1

    .line 2011
    .local v5, "_argIndex":I
    move-object/from16 v6, p1

    invoke-virtual {v4, v5, v6}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 2012
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 2013
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 2015
    :try_start_0
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v7, 0x0

    invoke-static {v0, v4, v3, v7}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    move-object v7, v0

    .line 2017
    .local v7, "_cursor":Landroid/database/Cursor;
    const/4 v0, 0x0

    .line 2018
    .local v0, "_cursorIndexOfId":I
    const/4 v8, 0x1

    .line 2019
    .local v8, "_cursorIndexOfState":I
    const/4 v9, 0x2

    .line 2020
    .local v9, "_cursorIndexOfOutput":I
    const/4 v10, 0x3

    .line 2021
    .local v10, "_cursorIndexOfRunAttemptCount":I
    const/4 v11, 0x4

    .line 2022
    .local v11, "_cursorIndexOfGeneration":I
    const/4 v12, 0x5

    .line 2023
    .local v12, "_cursorIndexOfRequiredNetworkType":I
    const/4 v13, 0x6

    .line 2024
    .local v13, "_cursorIndexOfRequiredNetworkRequestCompat":I
    const/4 v14, 0x7

    .line 2025
    .local v14, "_cursorIndexOfRequiresCharging":I
    const/16 v15, 0x8

    .line 2026
    .local v15, "_cursorIndexOfRequiresDeviceIdle":I
    const/16 v16, 0x9

    .line 2027
    .local v16, "_cursorIndexOfRequiresBatteryNotLow":I
    const/16 v17, 0xa

    .line 2028
    .local v17, "_cursorIndexOfRequiresStorageNotLow":I
    const/16 v18, 0xb

    .line 2029
    .local v18, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    const/16 v19, 0xc

    .line 2030
    .local v19, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    const/16 v20, 0xd

    .line 2031
    .local v20, "_cursorIndexOfContentUriTriggers":I
    const/16 v21, 0xe

    .line 2032
    .local v21, "_cursorIndexOfInitialDelay":I
    const/16 v22, 0xf

    .line 2033
    .local v22, "_cursorIndexOfIntervalDuration":I
    const/16 v23, 0x10

    .line 2034
    .local v23, "_cursorIndexOfFlexDuration":I
    const/16 v24, 0x11

    .line 2035
    .local v24, "_cursorIndexOfBackoffPolicy":I
    const/16 v25, 0x12

    .line 2036
    .local v25, "_cursorIndexOfBackoffDelayDuration":I
    const/16 v26, 0x13

    .line 2037
    .local v26, "_cursorIndexOfLastEnqueueTime":I
    const/16 v27, 0x14

    .line 2038
    .local v27, "_cursorIndexOfPeriodCount":I
    const/16 v28, 0x15

    .line 2039
    .local v28, "_cursorIndexOfNextScheduleTimeOverride":I
    const/16 v29, 0x16

    .line 2040
    .local v29, "_cursorIndexOfStopReason":I
    :try_start_1
    new-instance v30, Ljava/util/HashMap;

    invoke-direct/range {v30 .. v30}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v31, v30

    .line 2041
    .local v31, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    new-instance v30, Ljava/util/HashMap;

    invoke-direct/range {v30 .. v30}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v32, v30

    .line 2042
    .local v32, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :goto_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v30

    const/4 v3, 0x0

    if-eqz v30, :cond_2

    .line 2044
    invoke-interface {v7, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v30

    move-object/from16 v34, v30

    .line 2045
    .local v34, "_tmpKey":Ljava/lang/String;
    move-object/from16 v3, v31

    move/from16 v31, v0

    move-object/from16 v0, v34

    .end local v34    # "_tmpKey":Ljava/lang/String;
    .local v0, "_tmpKey":Ljava/lang/String;
    .local v3, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v31, "_cursorIndexOfId":I
    invoke-virtual {v3, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v34
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    if-nez v34, :cond_0

    .line 2046
    move-object/from16 v34, v2

    .end local v2    # "_sql":Ljava/lang/String;
    .local v34, "_sql":Ljava/lang/String;
    :try_start_2
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 2142
    .end local v0    # "_tmpKey":Ljava/lang/String;
    .end local v3    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .end local v8    # "_cursorIndexOfState":I
    .end local v9    # "_cursorIndexOfOutput":I
    .end local v10    # "_cursorIndexOfRunAttemptCount":I
    .end local v11    # "_cursorIndexOfGeneration":I
    .end local v12    # "_cursorIndexOfRequiredNetworkType":I
    .end local v13    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v14    # "_cursorIndexOfRequiresCharging":I
    .end local v15    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v16    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v17    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v18    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v19    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v20    # "_cursorIndexOfContentUriTriggers":I
    .end local v21    # "_cursorIndexOfInitialDelay":I
    .end local v22    # "_cursorIndexOfIntervalDuration":I
    .end local v23    # "_cursorIndexOfFlexDuration":I
    .end local v24    # "_cursorIndexOfBackoffPolicy":I
    .end local v25    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v26    # "_cursorIndexOfLastEnqueueTime":I
    .end local v27    # "_cursorIndexOfPeriodCount":I
    .end local v28    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v29    # "_cursorIndexOfStopReason":I
    .end local v31    # "_cursorIndexOfId":I
    .end local v32    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :catchall_0
    move-exception v0

    move-object/from16 v32, v4

    goto/16 :goto_8

    .line 2045
    .end local v34    # "_sql":Ljava/lang/String;
    .restart local v0    # "_tmpKey":Ljava/lang/String;
    .restart local v2    # "_sql":Ljava/lang/String;
    .restart local v3    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .restart local v8    # "_cursorIndexOfState":I
    .restart local v9    # "_cursorIndexOfOutput":I
    .restart local v10    # "_cursorIndexOfRunAttemptCount":I
    .restart local v11    # "_cursorIndexOfGeneration":I
    .restart local v12    # "_cursorIndexOfRequiredNetworkType":I
    .restart local v13    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .restart local v14    # "_cursorIndexOfRequiresCharging":I
    .restart local v15    # "_cursorIndexOfRequiresDeviceIdle":I
    .restart local v16    # "_cursorIndexOfRequiresBatteryNotLow":I
    .restart local v17    # "_cursorIndexOfRequiresStorageNotLow":I
    .restart local v18    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .restart local v19    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .restart local v20    # "_cursorIndexOfContentUriTriggers":I
    .restart local v21    # "_cursorIndexOfInitialDelay":I
    .restart local v22    # "_cursorIndexOfIntervalDuration":I
    .restart local v23    # "_cursorIndexOfFlexDuration":I
    .restart local v24    # "_cursorIndexOfBackoffPolicy":I
    .restart local v25    # "_cursorIndexOfBackoffDelayDuration":I
    .restart local v26    # "_cursorIndexOfLastEnqueueTime":I
    .restart local v27    # "_cursorIndexOfPeriodCount":I
    .restart local v28    # "_cursorIndexOfNextScheduleTimeOverride":I
    .restart local v29    # "_cursorIndexOfStopReason":I
    .restart local v31    # "_cursorIndexOfId":I
    .restart local v32    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :cond_0
    move-object/from16 v34, v2

    .line 2049
    .end local v2    # "_sql":Ljava/lang/String;
    .restart local v34    # "_sql":Ljava/lang/String;
    :goto_1
    const/4 v2, 0x0

    :try_start_3
    invoke-interface {v7, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 2050
    .local v2, "_tmpKey_1":Ljava/lang/String;
    move-object/from16 v30, v0

    move-object/from16 v0, v32

    .end local v32    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .local v0, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .local v30, "_tmpKey":Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v32
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-nez v32, :cond_1

    .line 2051
    move-object/from16 v32, v4

    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .local v32, "_statement":Landroidx/room/RoomSQLiteQuery;
    :try_start_4
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 2050
    .end local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    :cond_1
    move-object/from16 v32, v4

    .line 2053
    .end local v2    # "_tmpKey_1":Ljava/lang/String;
    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v30    # "_tmpKey":Ljava/lang/String;
    .restart local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    :goto_2
    move-object/from16 v4, v32

    move-object/from16 v2, v34

    move-object/from16 v32, v0

    move/from16 v0, v31

    move-object/from16 v31, v3

    const/4 v3, 0x1

    goto :goto_0

    .line 2142
    .end local v0    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .end local v3    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .end local v8    # "_cursorIndexOfState":I
    .end local v9    # "_cursorIndexOfOutput":I
    .end local v10    # "_cursorIndexOfRunAttemptCount":I
    .end local v11    # "_cursorIndexOfGeneration":I
    .end local v12    # "_cursorIndexOfRequiredNetworkType":I
    .end local v13    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v14    # "_cursorIndexOfRequiresCharging":I
    .end local v15    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v16    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v17    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v18    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v19    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v20    # "_cursorIndexOfContentUriTriggers":I
    .end local v21    # "_cursorIndexOfInitialDelay":I
    .end local v22    # "_cursorIndexOfIntervalDuration":I
    .end local v23    # "_cursorIndexOfFlexDuration":I
    .end local v24    # "_cursorIndexOfBackoffPolicy":I
    .end local v25    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v26    # "_cursorIndexOfLastEnqueueTime":I
    .end local v27    # "_cursorIndexOfPeriodCount":I
    .end local v28    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v29    # "_cursorIndexOfStopReason":I
    .end local v31    # "_cursorIndexOfId":I
    .end local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    :catchall_1
    move-exception v0

    move-object/from16 v32, v4

    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    goto/16 :goto_8

    .line 2054
    .end local v34    # "_sql":Ljava/lang/String;
    .local v0, "_cursorIndexOfId":I
    .local v2, "_sql":Ljava/lang/String;
    .restart local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v8    # "_cursorIndexOfState":I
    .restart local v9    # "_cursorIndexOfOutput":I
    .restart local v10    # "_cursorIndexOfRunAttemptCount":I
    .restart local v11    # "_cursorIndexOfGeneration":I
    .restart local v12    # "_cursorIndexOfRequiredNetworkType":I
    .restart local v13    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .restart local v14    # "_cursorIndexOfRequiresCharging":I
    .restart local v15    # "_cursorIndexOfRequiresDeviceIdle":I
    .restart local v16    # "_cursorIndexOfRequiresBatteryNotLow":I
    .restart local v17    # "_cursorIndexOfRequiresStorageNotLow":I
    .restart local v18    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .restart local v19    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .restart local v20    # "_cursorIndexOfContentUriTriggers":I
    .restart local v21    # "_cursorIndexOfInitialDelay":I
    .restart local v22    # "_cursorIndexOfIntervalDuration":I
    .restart local v23    # "_cursorIndexOfFlexDuration":I
    .restart local v24    # "_cursorIndexOfBackoffPolicy":I
    .restart local v25    # "_cursorIndexOfBackoffDelayDuration":I
    .restart local v26    # "_cursorIndexOfLastEnqueueTime":I
    .restart local v27    # "_cursorIndexOfPeriodCount":I
    .restart local v28    # "_cursorIndexOfNextScheduleTimeOverride":I
    .restart local v29    # "_cursorIndexOfStopReason":I
    .local v31, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v32, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :cond_2
    move-object/from16 v34, v2

    move-object/from16 v3, v31

    move/from16 v31, v0

    move-object/from16 v0, v32

    move-object/from16 v32, v4

    .end local v2    # "_sql":Ljava/lang/String;
    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .local v0, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .restart local v3    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v31, "_cursorIndexOfId":I
    .local v32, "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v34    # "_sql":Ljava/lang/String;
    const/4 v2, -0x1

    invoke-interface {v7, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 2055
    invoke-direct {v1, v3}, Landroidx/work/impl/model/WorkSpecDao_Impl;->__fetchRelationshipWorkTagAsjavaLangString(Ljava/util/HashMap;)V

    .line 2056
    invoke-direct {v1, v0}, Landroidx/work/impl/model/WorkSpecDao_Impl;->__fetchRelationshipWorkProgressAsandroidxWorkData(Ljava/util/HashMap;)V

    .line 2057
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 2058
    .local v2, "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;>;"
    :goto_3
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 2061
    const/4 v4, 0x0

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v35

    move-object/from16 v37, v35

    .line 2064
    .local v37, "_tmpId":Ljava/lang/String;
    const/4 v4, 0x1

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v33

    .line 2065
    .local v33, "_tmp":I
    sget-object v35, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v33 .. v33}, Landroidx/work/impl/model/WorkTypeConverters;->intToState(I)Landroidx/work/WorkInfo$State;

    move-result-object v38

    .line 2068
    .local v38, "_tmpState":Landroidx/work/WorkInfo$State;
    const/4 v4, 0x2

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v4

    .line 2069
    .local v4, "_tmp_1":[B
    invoke-static {v4}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v39

    .line 2071
    .local v39, "_tmpOutput":Landroidx/work/Data;
    move-object/from16 v60, v4

    .end local v4    # "_tmp_1":[B
    .local v60, "_tmp_1":[B
    const/4 v4, 0x3

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v47

    .line 2073
    .local v47, "_tmpRunAttemptCount":I
    const/4 v4, 0x4

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v54

    .line 2075
    .local v54, "_tmpGeneration":I
    const/16 v4, 0xe

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v40

    .line 2077
    .local v40, "_tmpInitialDelay":J
    const/16 v4, 0xf

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v42

    .line 2079
    .local v42, "_tmpIntervalDuration":J
    const/16 v4, 0x10

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v44

    .line 2082
    .local v44, "_tmpFlexDuration":J
    const/16 v4, 0x11

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    .line 2083
    .local v4, "_tmp_2":I
    sget-object v36, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v4}, Landroidx/work/impl/model/WorkTypeConverters;->intToBackoffPolicy(I)Landroidx/work/BackoffPolicy;

    move-result-object v48

    .line 2085
    .local v48, "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    move/from16 v61, v4

    .end local v4    # "_tmp_2":I
    .local v61, "_tmp_2":I
    const/16 v4, 0x12

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v49

    .line 2087
    .local v49, "_tmpBackoffDelayDuration":J
    const/16 v4, 0x13

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v51

    .line 2089
    .local v51, "_tmpLastEnqueueTime":J
    const/16 v4, 0x14

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v53

    .line 2091
    .local v53, "_tmpPeriodCount":I
    const/16 v4, 0x15

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v55

    .line 2093
    .local v55, "_tmpNextScheduleTimeOverride":J
    const/16 v4, 0x16

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v57

    .line 2097
    .local v57, "_tmpStopReason":I
    const/4 v4, 0x5

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    .line 2098
    .local v4, "_tmp_3":I
    sget-object v36, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v4}, Landroidx/work/impl/model/WorkTypeConverters;->intToNetworkType(I)Landroidx/work/NetworkType;

    move-result-object v36

    move-object/from16 v64, v36

    .line 2101
    .local v64, "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    move/from16 v74, v4

    .end local v4    # "_tmp_3":I
    .local v74, "_tmp_3":I
    const/4 v4, 0x6

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v4

    .line 2102
    .local v4, "_tmp_4":[B
    sget-object v36, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v4}, Landroidx/work/impl/model/WorkTypeConverters;->toNetworkRequest$work_runtime_release([B)Landroidx/work/impl/utils/NetworkRequestCompat;

    move-result-object v63

    .line 2105
    .local v63, "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    move-object/from16 v75, v4

    .end local v4    # "_tmp_4":[B
    .local v75, "_tmp_4":[B
    const/4 v4, 0x7

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    .line 2106
    .local v4, "_tmp_5":I
    if-eqz v4, :cond_3

    const/16 v65, 0x1

    goto :goto_4

    :cond_3
    const/16 v65, 0x0

    .line 2109
    .local v65, "_tmpRequiresCharging":Z
    :goto_4
    move/from16 v76, v4

    .end local v4    # "_tmp_5":I
    .local v76, "_tmp_5":I
    const/16 v4, 0x8

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    .line 2110
    .local v4, "_tmp_6":I
    if-eqz v4, :cond_4

    const/16 v66, 0x1

    goto :goto_5

    :cond_4
    const/16 v66, 0x0

    .line 2113
    .local v66, "_tmpRequiresDeviceIdle":Z
    :goto_5
    move/from16 v77, v4

    .end local v4    # "_tmp_6":I
    .local v77, "_tmp_6":I
    const/16 v4, 0x9

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    .line 2114
    .local v4, "_tmp_7":I
    if-eqz v4, :cond_5

    const/16 v67, 0x1

    goto :goto_6

    :cond_5
    const/16 v67, 0x0

    .line 2117
    .local v67, "_tmpRequiresBatteryNotLow":Z
    :goto_6
    move/from16 v78, v4

    .end local v4    # "_tmp_7":I
    .local v78, "_tmp_7":I
    const/16 v4, 0xa

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    .line 2118
    .local v4, "_tmp_8":I
    if-eqz v4, :cond_6

    const/16 v68, 0x1

    goto :goto_7

    :cond_6
    const/16 v68, 0x0

    .line 2120
    .local v68, "_tmpRequiresStorageNotLow":Z
    :goto_7
    move/from16 v79, v4

    .end local v4    # "_tmp_8":I
    .local v79, "_tmp_8":I
    const/16 v4, 0xb

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v69

    .line 2122
    .local v69, "_tmpContentTriggerUpdateDelayMillis":J
    const/16 v4, 0xc

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v71

    .line 2125
    .local v71, "_tmpContentTriggerMaxDelayMillis":J
    const/16 v4, 0xd

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v4

    .line 2126
    .local v4, "_tmp_9":[B
    sget-object v36, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v4}, Landroidx/work/impl/model/WorkTypeConverters;->byteArrayToSetOfTriggers([B)Ljava/util/Set;

    move-result-object v73

    .line 2127
    .local v73, "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    new-instance v62, Landroidx/work/Constraints;

    invoke-direct/range {v62 .. v73}, Landroidx/work/Constraints;-><init>(Landroidx/work/impl/utils/NetworkRequestCompat;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    move-object/from16 v46, v62

    .line 2130
    .local v46, "_tmpConstraints":Landroidx/work/Constraints;
    move-object/from16 v62, v4

    const/4 v4, 0x0

    .end local v4    # "_tmp_9":[B
    .local v62, "_tmp_9":[B
    invoke-interface {v7, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v36

    move-object/from16 v4, v36

    .line 2131
    .local v4, "_tmpKey_2":Ljava/lang/String;
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v36

    move-object/from16 v58, v36

    check-cast v58, Ljava/util/ArrayList;

    .line 2134
    .local v58, "_tmpTagsCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v80, v3

    const/4 v3, 0x0

    .end local v3    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v80, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    invoke-interface {v7, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v30

    move-object/from16 v81, v30

    .line 2135
    .local v81, "_tmpKey_3":Ljava/lang/String;
    move-object/from16 v3, v81

    .end local v81    # "_tmpKey_3":Ljava/lang/String;
    .local v3, "_tmpKey_3":Ljava/lang/String;
    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v36

    move-object/from16 v59, v36

    check-cast v59, Ljava/util/ArrayList;

    .line 2136
    .local v59, "_tmpProgressCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/work/Data;>;"
    new-instance v36, Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;

    invoke-direct/range {v36 .. v59}, Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Landroidx/work/Data;JJJLandroidx/work/Constraints;ILandroidx/work/BackoffPolicy;JJIIJILjava/util/List;Ljava/util/List;)V

    move-object/from16 v81, v36

    .line 2137
    .local v81, "_item":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    move-object/from16 v36, v0

    move-object/from16 v0, v81

    .end local v81    # "_item":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    .local v0, "_item":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    .local v36, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2138
    move-object/from16 v0, v36

    move-object/from16 v3, v80

    .end local v0    # "_item":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    .end local v3    # "_tmpKey_3":Ljava/lang/String;
    .end local v4    # "_tmpKey_2":Ljava/lang/String;
    .end local v33    # "_tmp":I
    .end local v37    # "_tmpId":Ljava/lang/String;
    .end local v38    # "_tmpState":Landroidx/work/WorkInfo$State;
    .end local v39    # "_tmpOutput":Landroidx/work/Data;
    .end local v40    # "_tmpInitialDelay":J
    .end local v42    # "_tmpIntervalDuration":J
    .end local v44    # "_tmpFlexDuration":J
    .end local v46    # "_tmpConstraints":Landroidx/work/Constraints;
    .end local v47    # "_tmpRunAttemptCount":I
    .end local v48    # "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    .end local v49    # "_tmpBackoffDelayDuration":J
    .end local v51    # "_tmpLastEnqueueTime":J
    .end local v53    # "_tmpPeriodCount":I
    .end local v54    # "_tmpGeneration":I
    .end local v55    # "_tmpNextScheduleTimeOverride":J
    .end local v57    # "_tmpStopReason":I
    .end local v58    # "_tmpTagsCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v59    # "_tmpProgressCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/work/Data;>;"
    .end local v60    # "_tmp_1":[B
    .end local v61    # "_tmp_2":I
    .end local v62    # "_tmp_9":[B
    .end local v63    # "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    .end local v64    # "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    .end local v65    # "_tmpRequiresCharging":Z
    .end local v66    # "_tmpRequiresDeviceIdle":Z
    .end local v67    # "_tmpRequiresBatteryNotLow":Z
    .end local v68    # "_tmpRequiresStorageNotLow":Z
    .end local v69    # "_tmpContentTriggerUpdateDelayMillis":J
    .end local v71    # "_tmpContentTriggerMaxDelayMillis":J
    .end local v73    # "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    .end local v74    # "_tmp_3":I
    .end local v75    # "_tmp_4":[B
    .end local v76    # "_tmp_5":I
    .end local v77    # "_tmp_6":I
    .end local v78    # "_tmp_7":I
    .end local v79    # "_tmp_8":I
    goto/16 :goto_3

    .line 2139
    .end local v36    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .end local v80    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v0, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .local v3, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    :cond_7
    move-object/from16 v36, v0

    move-object/from16 v80, v3

    .end local v0    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .end local v3    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .restart local v36    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .restart local v80    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 2140
    nop

    .line 2142
    :try_start_5
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 2143
    invoke-virtual/range {v32 .. v32}, Landroidx/room/RoomSQLiteQuery;->release()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 2146
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 2140
    return-object v2

    .line 2142
    .end local v2    # "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;>;"
    .end local v8    # "_cursorIndexOfState":I
    .end local v9    # "_cursorIndexOfOutput":I
    .end local v10    # "_cursorIndexOfRunAttemptCount":I
    .end local v11    # "_cursorIndexOfGeneration":I
    .end local v12    # "_cursorIndexOfRequiredNetworkType":I
    .end local v13    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v14    # "_cursorIndexOfRequiresCharging":I
    .end local v15    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v16    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v17    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v18    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v19    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v20    # "_cursorIndexOfContentUriTriggers":I
    .end local v21    # "_cursorIndexOfInitialDelay":I
    .end local v22    # "_cursorIndexOfIntervalDuration":I
    .end local v23    # "_cursorIndexOfFlexDuration":I
    .end local v24    # "_cursorIndexOfBackoffPolicy":I
    .end local v25    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v26    # "_cursorIndexOfLastEnqueueTime":I
    .end local v27    # "_cursorIndexOfPeriodCount":I
    .end local v28    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v29    # "_cursorIndexOfStopReason":I
    .end local v31    # "_cursorIndexOfId":I
    .end local v36    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .end local v80    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    :catchall_2
    move-exception v0

    goto :goto_8

    .end local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v34    # "_sql":Ljava/lang/String;
    .local v2, "_sql":Ljava/lang/String;
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    :catchall_3
    move-exception v0

    move-object/from16 v34, v2

    move-object/from16 v32, v4

    .end local v2    # "_sql":Ljava/lang/String;
    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v34    # "_sql":Ljava/lang/String;
    :goto_8
    :try_start_6
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 2143
    invoke-virtual/range {v32 .. v32}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 2144
    nop

    .end local v5    # "_argIndex":I
    .end local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v34    # "_sql":Ljava/lang/String;
    .end local p1    # "name":Ljava/lang/String;
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 2146
    .end local v7    # "_cursor":Landroid/database/Cursor;
    .restart local v5    # "_argIndex":I
    .restart local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v34    # "_sql":Ljava/lang/String;
    .restart local p1    # "name":Ljava/lang/String;
    :catchall_4
    move-exception v0

    goto :goto_9

    .end local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v34    # "_sql":Ljava/lang/String;
    .restart local v2    # "_sql":Ljava/lang/String;
    .restart local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    :catchall_5
    move-exception v0

    move-object/from16 v34, v2

    move-object/from16 v32, v4

    .end local v2    # "_sql":Ljava/lang/String;
    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v34    # "_sql":Ljava/lang/String;
    :goto_9
    iget-object v2, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 2147
    throw v0
.end method

.method public getWorkStatusPojoForTag(Ljava/lang/String;)Ljava/util/List;
    .locals 82
    .param p1, "tag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "tag"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;",
            ">;"
        }
    .end annotation

    .line 1553
    move-object/from16 v1, p0

    const-string v2, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id IN\n            (SELECT work_spec_id FROM worktag WHERE tag=?)"

    .line 1555
    .local v2, "_sql":Ljava/lang/String;
    const-string v0, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id IN\n            (SELECT work_spec_id FROM worktag WHERE tag=?)"

    const/4 v3, 0x1

    invoke-static {v0, v3}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v4

    .line 1556
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v5, 0x1

    .line 1557
    .local v5, "_argIndex":I
    move-object/from16 v6, p1

    invoke-virtual {v4, v5, v6}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 1558
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 1559
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 1561
    :try_start_0
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v7, 0x0

    invoke-static {v0, v4, v3, v7}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    move-object v7, v0

    .line 1563
    .local v7, "_cursor":Landroid/database/Cursor;
    const/4 v0, 0x0

    .line 1564
    .local v0, "_cursorIndexOfId":I
    const/4 v8, 0x1

    .line 1565
    .local v8, "_cursorIndexOfState":I
    const/4 v9, 0x2

    .line 1566
    .local v9, "_cursorIndexOfOutput":I
    const/4 v10, 0x3

    .line 1567
    .local v10, "_cursorIndexOfRunAttemptCount":I
    const/4 v11, 0x4

    .line 1568
    .local v11, "_cursorIndexOfGeneration":I
    const/4 v12, 0x5

    .line 1569
    .local v12, "_cursorIndexOfRequiredNetworkType":I
    const/4 v13, 0x6

    .line 1570
    .local v13, "_cursorIndexOfRequiredNetworkRequestCompat":I
    const/4 v14, 0x7

    .line 1571
    .local v14, "_cursorIndexOfRequiresCharging":I
    const/16 v15, 0x8

    .line 1572
    .local v15, "_cursorIndexOfRequiresDeviceIdle":I
    const/16 v16, 0x9

    .line 1573
    .local v16, "_cursorIndexOfRequiresBatteryNotLow":I
    const/16 v17, 0xa

    .line 1574
    .local v17, "_cursorIndexOfRequiresStorageNotLow":I
    const/16 v18, 0xb

    .line 1575
    .local v18, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    const/16 v19, 0xc

    .line 1576
    .local v19, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    const/16 v20, 0xd

    .line 1577
    .local v20, "_cursorIndexOfContentUriTriggers":I
    const/16 v21, 0xe

    .line 1578
    .local v21, "_cursorIndexOfInitialDelay":I
    const/16 v22, 0xf

    .line 1579
    .local v22, "_cursorIndexOfIntervalDuration":I
    const/16 v23, 0x10

    .line 1580
    .local v23, "_cursorIndexOfFlexDuration":I
    const/16 v24, 0x11

    .line 1581
    .local v24, "_cursorIndexOfBackoffPolicy":I
    const/16 v25, 0x12

    .line 1582
    .local v25, "_cursorIndexOfBackoffDelayDuration":I
    const/16 v26, 0x13

    .line 1583
    .local v26, "_cursorIndexOfLastEnqueueTime":I
    const/16 v27, 0x14

    .line 1584
    .local v27, "_cursorIndexOfPeriodCount":I
    const/16 v28, 0x15

    .line 1585
    .local v28, "_cursorIndexOfNextScheduleTimeOverride":I
    const/16 v29, 0x16

    .line 1586
    .local v29, "_cursorIndexOfStopReason":I
    :try_start_1
    new-instance v30, Ljava/util/HashMap;

    invoke-direct/range {v30 .. v30}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v31, v30

    .line 1587
    .local v31, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    new-instance v30, Ljava/util/HashMap;

    invoke-direct/range {v30 .. v30}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v32, v30

    .line 1588
    .local v32, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :goto_0
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v30

    const/4 v3, 0x0

    if-eqz v30, :cond_2

    .line 1590
    invoke-interface {v7, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v30

    move-object/from16 v34, v30

    .line 1591
    .local v34, "_tmpKey":Ljava/lang/String;
    move-object/from16 v3, v31

    move/from16 v31, v0

    move-object/from16 v0, v34

    .end local v34    # "_tmpKey":Ljava/lang/String;
    .local v0, "_tmpKey":Ljava/lang/String;
    .local v3, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v31, "_cursorIndexOfId":I
    invoke-virtual {v3, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v34
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    if-nez v34, :cond_0

    .line 1592
    move-object/from16 v34, v2

    .end local v2    # "_sql":Ljava/lang/String;
    .local v34, "_sql":Ljava/lang/String;
    :try_start_2
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 1688
    .end local v0    # "_tmpKey":Ljava/lang/String;
    .end local v3    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .end local v8    # "_cursorIndexOfState":I
    .end local v9    # "_cursorIndexOfOutput":I
    .end local v10    # "_cursorIndexOfRunAttemptCount":I
    .end local v11    # "_cursorIndexOfGeneration":I
    .end local v12    # "_cursorIndexOfRequiredNetworkType":I
    .end local v13    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v14    # "_cursorIndexOfRequiresCharging":I
    .end local v15    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v16    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v17    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v18    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v19    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v20    # "_cursorIndexOfContentUriTriggers":I
    .end local v21    # "_cursorIndexOfInitialDelay":I
    .end local v22    # "_cursorIndexOfIntervalDuration":I
    .end local v23    # "_cursorIndexOfFlexDuration":I
    .end local v24    # "_cursorIndexOfBackoffPolicy":I
    .end local v25    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v26    # "_cursorIndexOfLastEnqueueTime":I
    .end local v27    # "_cursorIndexOfPeriodCount":I
    .end local v28    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v29    # "_cursorIndexOfStopReason":I
    .end local v31    # "_cursorIndexOfId":I
    .end local v32    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :catchall_0
    move-exception v0

    move-object/from16 v32, v4

    goto/16 :goto_8

    .line 1591
    .end local v34    # "_sql":Ljava/lang/String;
    .restart local v0    # "_tmpKey":Ljava/lang/String;
    .restart local v2    # "_sql":Ljava/lang/String;
    .restart local v3    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .restart local v8    # "_cursorIndexOfState":I
    .restart local v9    # "_cursorIndexOfOutput":I
    .restart local v10    # "_cursorIndexOfRunAttemptCount":I
    .restart local v11    # "_cursorIndexOfGeneration":I
    .restart local v12    # "_cursorIndexOfRequiredNetworkType":I
    .restart local v13    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .restart local v14    # "_cursorIndexOfRequiresCharging":I
    .restart local v15    # "_cursorIndexOfRequiresDeviceIdle":I
    .restart local v16    # "_cursorIndexOfRequiresBatteryNotLow":I
    .restart local v17    # "_cursorIndexOfRequiresStorageNotLow":I
    .restart local v18    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .restart local v19    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .restart local v20    # "_cursorIndexOfContentUriTriggers":I
    .restart local v21    # "_cursorIndexOfInitialDelay":I
    .restart local v22    # "_cursorIndexOfIntervalDuration":I
    .restart local v23    # "_cursorIndexOfFlexDuration":I
    .restart local v24    # "_cursorIndexOfBackoffPolicy":I
    .restart local v25    # "_cursorIndexOfBackoffDelayDuration":I
    .restart local v26    # "_cursorIndexOfLastEnqueueTime":I
    .restart local v27    # "_cursorIndexOfPeriodCount":I
    .restart local v28    # "_cursorIndexOfNextScheduleTimeOverride":I
    .restart local v29    # "_cursorIndexOfStopReason":I
    .restart local v31    # "_cursorIndexOfId":I
    .restart local v32    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :cond_0
    move-object/from16 v34, v2

    .line 1595
    .end local v2    # "_sql":Ljava/lang/String;
    .restart local v34    # "_sql":Ljava/lang/String;
    :goto_1
    const/4 v2, 0x0

    :try_start_3
    invoke-interface {v7, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 1596
    .local v2, "_tmpKey_1":Ljava/lang/String;
    move-object/from16 v30, v0

    move-object/from16 v0, v32

    .end local v32    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .local v0, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .local v30, "_tmpKey":Ljava/lang/String;
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v32
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-nez v32, :cond_1

    .line 1597
    move-object/from16 v32, v4

    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .local v32, "_statement":Landroidx/room/RoomSQLiteQuery;
    :try_start_4
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 1596
    .end local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    :cond_1
    move-object/from16 v32, v4

    .line 1599
    .end local v2    # "_tmpKey_1":Ljava/lang/String;
    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v30    # "_tmpKey":Ljava/lang/String;
    .restart local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    :goto_2
    move-object/from16 v4, v32

    move-object/from16 v2, v34

    move-object/from16 v32, v0

    move/from16 v0, v31

    move-object/from16 v31, v3

    const/4 v3, 0x1

    goto :goto_0

    .line 1688
    .end local v0    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .end local v3    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .end local v8    # "_cursorIndexOfState":I
    .end local v9    # "_cursorIndexOfOutput":I
    .end local v10    # "_cursorIndexOfRunAttemptCount":I
    .end local v11    # "_cursorIndexOfGeneration":I
    .end local v12    # "_cursorIndexOfRequiredNetworkType":I
    .end local v13    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v14    # "_cursorIndexOfRequiresCharging":I
    .end local v15    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v16    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v17    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v18    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v19    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v20    # "_cursorIndexOfContentUriTriggers":I
    .end local v21    # "_cursorIndexOfInitialDelay":I
    .end local v22    # "_cursorIndexOfIntervalDuration":I
    .end local v23    # "_cursorIndexOfFlexDuration":I
    .end local v24    # "_cursorIndexOfBackoffPolicy":I
    .end local v25    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v26    # "_cursorIndexOfLastEnqueueTime":I
    .end local v27    # "_cursorIndexOfPeriodCount":I
    .end local v28    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v29    # "_cursorIndexOfStopReason":I
    .end local v31    # "_cursorIndexOfId":I
    .end local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    :catchall_1
    move-exception v0

    move-object/from16 v32, v4

    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    goto/16 :goto_8

    .line 1600
    .end local v34    # "_sql":Ljava/lang/String;
    .local v0, "_cursorIndexOfId":I
    .local v2, "_sql":Ljava/lang/String;
    .restart local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v8    # "_cursorIndexOfState":I
    .restart local v9    # "_cursorIndexOfOutput":I
    .restart local v10    # "_cursorIndexOfRunAttemptCount":I
    .restart local v11    # "_cursorIndexOfGeneration":I
    .restart local v12    # "_cursorIndexOfRequiredNetworkType":I
    .restart local v13    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .restart local v14    # "_cursorIndexOfRequiresCharging":I
    .restart local v15    # "_cursorIndexOfRequiresDeviceIdle":I
    .restart local v16    # "_cursorIndexOfRequiresBatteryNotLow":I
    .restart local v17    # "_cursorIndexOfRequiresStorageNotLow":I
    .restart local v18    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .restart local v19    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .restart local v20    # "_cursorIndexOfContentUriTriggers":I
    .restart local v21    # "_cursorIndexOfInitialDelay":I
    .restart local v22    # "_cursorIndexOfIntervalDuration":I
    .restart local v23    # "_cursorIndexOfFlexDuration":I
    .restart local v24    # "_cursorIndexOfBackoffPolicy":I
    .restart local v25    # "_cursorIndexOfBackoffDelayDuration":I
    .restart local v26    # "_cursorIndexOfLastEnqueueTime":I
    .restart local v27    # "_cursorIndexOfPeriodCount":I
    .restart local v28    # "_cursorIndexOfNextScheduleTimeOverride":I
    .restart local v29    # "_cursorIndexOfStopReason":I
    .local v31, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v32, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :cond_2
    move-object/from16 v34, v2

    move-object/from16 v3, v31

    move/from16 v31, v0

    move-object/from16 v0, v32

    move-object/from16 v32, v4

    .end local v2    # "_sql":Ljava/lang/String;
    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .local v0, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .restart local v3    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v31, "_cursorIndexOfId":I
    .local v32, "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v34    # "_sql":Ljava/lang/String;
    const/4 v2, -0x1

    invoke-interface {v7, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 1601
    invoke-direct {v1, v3}, Landroidx/work/impl/model/WorkSpecDao_Impl;->__fetchRelationshipWorkTagAsjavaLangString(Ljava/util/HashMap;)V

    .line 1602
    invoke-direct {v1, v0}, Landroidx/work/impl/model/WorkSpecDao_Impl;->__fetchRelationshipWorkProgressAsandroidxWorkData(Ljava/util/HashMap;)V

    .line 1603
    new-instance v2, Ljava/util/ArrayList;

    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 1604
    .local v2, "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;>;"
    :goto_3
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 1607
    const/4 v4, 0x0

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v35

    move-object/from16 v37, v35

    .line 1610
    .local v37, "_tmpId":Ljava/lang/String;
    const/4 v4, 0x1

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v33

    .line 1611
    .local v33, "_tmp":I
    sget-object v35, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v33 .. v33}, Landroidx/work/impl/model/WorkTypeConverters;->intToState(I)Landroidx/work/WorkInfo$State;

    move-result-object v38

    .line 1614
    .local v38, "_tmpState":Landroidx/work/WorkInfo$State;
    const/4 v4, 0x2

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v4

    .line 1615
    .local v4, "_tmp_1":[B
    invoke-static {v4}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v39

    .line 1617
    .local v39, "_tmpOutput":Landroidx/work/Data;
    move-object/from16 v60, v4

    .end local v4    # "_tmp_1":[B
    .local v60, "_tmp_1":[B
    const/4 v4, 0x3

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v47

    .line 1619
    .local v47, "_tmpRunAttemptCount":I
    const/4 v4, 0x4

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v54

    .line 1621
    .local v54, "_tmpGeneration":I
    const/16 v4, 0xe

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v40

    .line 1623
    .local v40, "_tmpInitialDelay":J
    const/16 v4, 0xf

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v42

    .line 1625
    .local v42, "_tmpIntervalDuration":J
    const/16 v4, 0x10

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v44

    .line 1628
    .local v44, "_tmpFlexDuration":J
    const/16 v4, 0x11

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    .line 1629
    .local v4, "_tmp_2":I
    sget-object v36, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v4}, Landroidx/work/impl/model/WorkTypeConverters;->intToBackoffPolicy(I)Landroidx/work/BackoffPolicy;

    move-result-object v48

    .line 1631
    .local v48, "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    move/from16 v61, v4

    .end local v4    # "_tmp_2":I
    .local v61, "_tmp_2":I
    const/16 v4, 0x12

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v49

    .line 1633
    .local v49, "_tmpBackoffDelayDuration":J
    const/16 v4, 0x13

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v51

    .line 1635
    .local v51, "_tmpLastEnqueueTime":J
    const/16 v4, 0x14

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v53

    .line 1637
    .local v53, "_tmpPeriodCount":I
    const/16 v4, 0x15

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v55

    .line 1639
    .local v55, "_tmpNextScheduleTimeOverride":J
    const/16 v4, 0x16

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v57

    .line 1643
    .local v57, "_tmpStopReason":I
    const/4 v4, 0x5

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    .line 1644
    .local v4, "_tmp_3":I
    sget-object v36, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v4}, Landroidx/work/impl/model/WorkTypeConverters;->intToNetworkType(I)Landroidx/work/NetworkType;

    move-result-object v36

    move-object/from16 v64, v36

    .line 1647
    .local v64, "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    move/from16 v74, v4

    .end local v4    # "_tmp_3":I
    .local v74, "_tmp_3":I
    const/4 v4, 0x6

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v4

    .line 1648
    .local v4, "_tmp_4":[B
    sget-object v36, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v4}, Landroidx/work/impl/model/WorkTypeConverters;->toNetworkRequest$work_runtime_release([B)Landroidx/work/impl/utils/NetworkRequestCompat;

    move-result-object v63

    .line 1651
    .local v63, "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    move-object/from16 v75, v4

    .end local v4    # "_tmp_4":[B
    .local v75, "_tmp_4":[B
    const/4 v4, 0x7

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    .line 1652
    .local v4, "_tmp_5":I
    if-eqz v4, :cond_3

    const/16 v65, 0x1

    goto :goto_4

    :cond_3
    const/16 v65, 0x0

    .line 1655
    .local v65, "_tmpRequiresCharging":Z
    :goto_4
    move/from16 v76, v4

    .end local v4    # "_tmp_5":I
    .local v76, "_tmp_5":I
    const/16 v4, 0x8

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    .line 1656
    .local v4, "_tmp_6":I
    if-eqz v4, :cond_4

    const/16 v66, 0x1

    goto :goto_5

    :cond_4
    const/16 v66, 0x0

    .line 1659
    .local v66, "_tmpRequiresDeviceIdle":Z
    :goto_5
    move/from16 v77, v4

    .end local v4    # "_tmp_6":I
    .local v77, "_tmp_6":I
    const/16 v4, 0x9

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    .line 1660
    .local v4, "_tmp_7":I
    if-eqz v4, :cond_5

    const/16 v67, 0x1

    goto :goto_6

    :cond_5
    const/16 v67, 0x0

    .line 1663
    .local v67, "_tmpRequiresBatteryNotLow":Z
    :goto_6
    move/from16 v78, v4

    .end local v4    # "_tmp_7":I
    .local v78, "_tmp_7":I
    const/16 v4, 0xa

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    .line 1664
    .local v4, "_tmp_8":I
    if-eqz v4, :cond_6

    const/16 v68, 0x1

    goto :goto_7

    :cond_6
    const/16 v68, 0x0

    .line 1666
    .local v68, "_tmpRequiresStorageNotLow":Z
    :goto_7
    move/from16 v79, v4

    .end local v4    # "_tmp_8":I
    .local v79, "_tmp_8":I
    const/16 v4, 0xb

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v69

    .line 1668
    .local v69, "_tmpContentTriggerUpdateDelayMillis":J
    const/16 v4, 0xc

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v71

    .line 1671
    .local v71, "_tmpContentTriggerMaxDelayMillis":J
    const/16 v4, 0xd

    invoke-interface {v7, v4}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v4

    .line 1672
    .local v4, "_tmp_9":[B
    sget-object v36, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v4}, Landroidx/work/impl/model/WorkTypeConverters;->byteArrayToSetOfTriggers([B)Ljava/util/Set;

    move-result-object v73

    .line 1673
    .local v73, "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    new-instance v62, Landroidx/work/Constraints;

    invoke-direct/range {v62 .. v73}, Landroidx/work/Constraints;-><init>(Landroidx/work/impl/utils/NetworkRequestCompat;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    move-object/from16 v46, v62

    .line 1676
    .local v46, "_tmpConstraints":Landroidx/work/Constraints;
    move-object/from16 v62, v4

    const/4 v4, 0x0

    .end local v4    # "_tmp_9":[B
    .local v62, "_tmp_9":[B
    invoke-interface {v7, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v36

    move-object/from16 v4, v36

    .line 1677
    .local v4, "_tmpKey_2":Ljava/lang/String;
    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v36

    move-object/from16 v58, v36

    check-cast v58, Ljava/util/ArrayList;

    .line 1680
    .local v58, "_tmpTagsCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v80, v3

    const/4 v3, 0x0

    .end local v3    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v80, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    invoke-interface {v7, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v30

    move-object/from16 v81, v30

    .line 1681
    .local v81, "_tmpKey_3":Ljava/lang/String;
    move-object/from16 v3, v81

    .end local v81    # "_tmpKey_3":Ljava/lang/String;
    .local v3, "_tmpKey_3":Ljava/lang/String;
    invoke-virtual {v0, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v36

    move-object/from16 v59, v36

    check-cast v59, Ljava/util/ArrayList;

    .line 1682
    .local v59, "_tmpProgressCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/work/Data;>;"
    new-instance v36, Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;

    invoke-direct/range {v36 .. v59}, Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Landroidx/work/Data;JJJLandroidx/work/Constraints;ILandroidx/work/BackoffPolicy;JJIIJILjava/util/List;Ljava/util/List;)V

    move-object/from16 v81, v36

    .line 1683
    .local v81, "_item":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    move-object/from16 v36, v0

    move-object/from16 v0, v81

    .end local v81    # "_item":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    .local v0, "_item":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    .local v36, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1684
    move-object/from16 v0, v36

    move-object/from16 v3, v80

    .end local v0    # "_item":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    .end local v3    # "_tmpKey_3":Ljava/lang/String;
    .end local v4    # "_tmpKey_2":Ljava/lang/String;
    .end local v33    # "_tmp":I
    .end local v37    # "_tmpId":Ljava/lang/String;
    .end local v38    # "_tmpState":Landroidx/work/WorkInfo$State;
    .end local v39    # "_tmpOutput":Landroidx/work/Data;
    .end local v40    # "_tmpInitialDelay":J
    .end local v42    # "_tmpIntervalDuration":J
    .end local v44    # "_tmpFlexDuration":J
    .end local v46    # "_tmpConstraints":Landroidx/work/Constraints;
    .end local v47    # "_tmpRunAttemptCount":I
    .end local v48    # "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    .end local v49    # "_tmpBackoffDelayDuration":J
    .end local v51    # "_tmpLastEnqueueTime":J
    .end local v53    # "_tmpPeriodCount":I
    .end local v54    # "_tmpGeneration":I
    .end local v55    # "_tmpNextScheduleTimeOverride":J
    .end local v57    # "_tmpStopReason":I
    .end local v58    # "_tmpTagsCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v59    # "_tmpProgressCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/work/Data;>;"
    .end local v60    # "_tmp_1":[B
    .end local v61    # "_tmp_2":I
    .end local v62    # "_tmp_9":[B
    .end local v63    # "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    .end local v64    # "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    .end local v65    # "_tmpRequiresCharging":Z
    .end local v66    # "_tmpRequiresDeviceIdle":Z
    .end local v67    # "_tmpRequiresBatteryNotLow":Z
    .end local v68    # "_tmpRequiresStorageNotLow":Z
    .end local v69    # "_tmpContentTriggerUpdateDelayMillis":J
    .end local v71    # "_tmpContentTriggerMaxDelayMillis":J
    .end local v73    # "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    .end local v74    # "_tmp_3":I
    .end local v75    # "_tmp_4":[B
    .end local v76    # "_tmp_5":I
    .end local v77    # "_tmp_6":I
    .end local v78    # "_tmp_7":I
    .end local v79    # "_tmp_8":I
    goto/16 :goto_3

    .line 1685
    .end local v36    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .end local v80    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v0, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .local v3, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    :cond_7
    move-object/from16 v36, v0

    move-object/from16 v80, v3

    .end local v0    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .end local v3    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .restart local v36    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .restart local v80    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 1686
    nop

    .line 1688
    :try_start_5
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1689
    invoke-virtual/range {v32 .. v32}, Landroidx/room/RoomSQLiteQuery;->release()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 1692
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 1686
    return-object v2

    .line 1688
    .end local v2    # "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;>;"
    .end local v8    # "_cursorIndexOfState":I
    .end local v9    # "_cursorIndexOfOutput":I
    .end local v10    # "_cursorIndexOfRunAttemptCount":I
    .end local v11    # "_cursorIndexOfGeneration":I
    .end local v12    # "_cursorIndexOfRequiredNetworkType":I
    .end local v13    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v14    # "_cursorIndexOfRequiresCharging":I
    .end local v15    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v16    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v17    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v18    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v19    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v20    # "_cursorIndexOfContentUriTriggers":I
    .end local v21    # "_cursorIndexOfInitialDelay":I
    .end local v22    # "_cursorIndexOfIntervalDuration":I
    .end local v23    # "_cursorIndexOfFlexDuration":I
    .end local v24    # "_cursorIndexOfBackoffPolicy":I
    .end local v25    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v26    # "_cursorIndexOfLastEnqueueTime":I
    .end local v27    # "_cursorIndexOfPeriodCount":I
    .end local v28    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v29    # "_cursorIndexOfStopReason":I
    .end local v31    # "_cursorIndexOfId":I
    .end local v36    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .end local v80    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    :catchall_2
    move-exception v0

    goto :goto_8

    .end local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v34    # "_sql":Ljava/lang/String;
    .local v2, "_sql":Ljava/lang/String;
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    :catchall_3
    move-exception v0

    move-object/from16 v34, v2

    move-object/from16 v32, v4

    .end local v2    # "_sql":Ljava/lang/String;
    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v34    # "_sql":Ljava/lang/String;
    :goto_8
    :try_start_6
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 1689
    invoke-virtual/range {v32 .. v32}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 1690
    nop

    .end local v5    # "_argIndex":I
    .end local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v34    # "_sql":Ljava/lang/String;
    .end local p1    # "tag":Ljava/lang/String;
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 1692
    .end local v7    # "_cursor":Landroid/database/Cursor;
    .restart local v5    # "_argIndex":I
    .restart local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v34    # "_sql":Ljava/lang/String;
    .restart local p1    # "tag":Ljava/lang/String;
    :catchall_4
    move-exception v0

    goto :goto_9

    .end local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .end local v34    # "_sql":Ljava/lang/String;
    .restart local v2    # "_sql":Ljava/lang/String;
    .restart local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    :catchall_5
    move-exception v0

    move-object/from16 v34, v2

    move-object/from16 v32, v4

    .end local v2    # "_sql":Ljava/lang/String;
    .end local v4    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v32    # "_statement":Landroidx/room/RoomSQLiteQuery;
    .restart local v34    # "_sql":Ljava/lang/String;
    :goto_9
    iget-object v2, v1, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 1693
    throw v0
.end method

.method public getWorkStatusPojoLiveDataForIds(Ljava/util/List;)Landroidx/lifecycle/LiveData;
    .locals 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "ids"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;",
            ">;>;"
        }
    .end annotation

    .line 1227
    .local p1, "ids":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {}, Landroidx/room/util/StringUtil;->newStringBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 1228
    .local v0, "_stringBuilder":Ljava/lang/StringBuilder;
    const-string v1, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id IN ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1229
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    .line 1230
    .local v1, "_inputSize":I
    invoke-static {v0, v1}, Landroidx/room/util/StringUtil;->appendPlaceholders(Ljava/lang/StringBuilder;I)V

    .line 1231
    const-string v2, ")"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1232
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1233
    .local v2, "_sql":Ljava/lang/String;
    add-int/lit8 v3, v1, 0x0

    .line 1234
    .local v3, "_argCount":I
    invoke-static {v2, v3}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v4

    .line 1235
    .local v4, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v5, 0x1

    .line 1236
    .local v5, "_argIndex":I
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 1237
    .local v7, "_item":Ljava/lang/String;
    invoke-virtual {v4, v5, v7}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 1238
    nop

    .end local v7    # "_item":Ljava/lang/String;
    add-int/lit8 v5, v5, 0x1

    .line 1239
    goto :goto_0

    .line 1240
    :cond_0
    iget-object v6, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v6}, Landroidx/room/RoomDatabase;->getInvalidationTracker()Landroidx/room/InvalidationTracker;

    move-result-object v6

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/String;

    const-string v8, "WorkTag"

    const/4 v9, 0x0

    aput-object v8, v7, v9

    const-string v8, "WorkProgress"

    const/4 v9, 0x1

    aput-object v8, v7, v9

    const/4 v8, 0x2

    const-string/jumbo v10, "workspec"

    aput-object v10, v7, v8

    new-instance v8, Landroidx/work/impl/model/WorkSpecDao_Impl$19;

    invoke-direct {v8, p0, v4}, Landroidx/work/impl/model/WorkSpecDao_Impl$19;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomSQLiteQuery;)V

    invoke-virtual {v6, v7, v9, v8}, Landroidx/room/InvalidationTracker;->createLiveData([Ljava/lang/String;ZLjava/util/concurrent/Callable;)Landroidx/lifecycle/LiveData;

    move-result-object v6

    return-object v6
.end method

.method public getWorkStatusPojoLiveDataForName(Ljava/lang/String;)Landroidx/lifecycle/LiveData;
    .locals 8
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "name"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;",
            ">;>;"
        }
    .end annotation

    .line 2152
    const-string v0, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id IN (SELECT work_spec_id FROM workname WHERE name=?)"

    .line 2153
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id IN (SELECT work_spec_id FROM workname WHERE name=?)"

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 2154
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v3, 0x1

    .line 2155
    .local v3, "_argIndex":I
    invoke-virtual {v1, v3, p1}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 2156
    iget-object v4, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v4}, Landroidx/room/RoomDatabase;->getInvalidationTracker()Landroidx/room/InvalidationTracker;

    move-result-object v4

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "WorkTag"

    aput-object v7, v5, v6

    const-string v6, "WorkProgress"

    aput-object v6, v5, v2

    const/4 v6, 0x2

    const-string/jumbo v7, "workspec"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string/jumbo v7, "workname"

    aput-object v7, v5, v6

    new-instance v6, Landroidx/work/impl/model/WorkSpecDao_Impl$23;

    invoke-direct {v6, p0, v1}, Landroidx/work/impl/model/WorkSpecDao_Impl$23;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomSQLiteQuery;)V

    invoke-virtual {v4, v5, v2, v6}, Landroidx/room/InvalidationTracker;->createLiveData([Ljava/lang/String;ZLjava/util/concurrent/Callable;)Landroidx/lifecycle/LiveData;

    move-result-object v2

    return-object v2
.end method

.method public getWorkStatusPojoLiveDataForTag(Ljava/lang/String;)Landroidx/lifecycle/LiveData;
    .locals 8
    .param p1, "tag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "tag"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;",
            ">;>;"
        }
    .end annotation

    .line 1853
    const-string v0, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id IN\n            (SELECT work_spec_id FROM worktag WHERE tag=?)"

    .line 1855
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "SELECT id, state, output, run_attempt_count, generation, required_network_type, required_network_request, requires_charging, requires_device_idle, requires_battery_not_low, requires_storage_not_low, trigger_content_update_delay, trigger_max_content_delay, content_uri_triggers, initial_delay, interval_duration, flex_duration, backoff_policy, backoff_delay_duration, last_enqueue_time, period_count, next_schedule_time_override, stop_reason FROM workspec WHERE id IN\n            (SELECT work_spec_id FROM worktag WHERE tag=?)"

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 1856
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v3, 0x1

    .line 1857
    .local v3, "_argIndex":I
    invoke-virtual {v1, v3, p1}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 1858
    iget-object v4, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v4}, Landroidx/room/RoomDatabase;->getInvalidationTracker()Landroidx/room/InvalidationTracker;

    move-result-object v4

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "WorkTag"

    aput-object v7, v5, v6

    const-string v6, "WorkProgress"

    aput-object v6, v5, v2

    const/4 v6, 0x2

    const-string/jumbo v7, "workspec"

    aput-object v7, v5, v6

    const/4 v6, 0x3

    const-string/jumbo v7, "worktag"

    aput-object v7, v5, v6

    new-instance v6, Landroidx/work/impl/model/WorkSpecDao_Impl$22;

    invoke-direct {v6, p0, v1}, Landroidx/work/impl/model/WorkSpecDao_Impl$22;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomSQLiteQuery;)V

    invoke-virtual {v4, v5, v2, v6}, Landroidx/room/InvalidationTracker;->createLiveData([Ljava/lang/String;ZLjava/util/concurrent/Callable;)Landroidx/lifecycle/LiveData;

    move-result-object v2

    return-object v2
.end method

.method public hasUnfinishedWorkFlow()Lkotlinx/coroutines/flow/Flow;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlinx/coroutines/flow/Flow<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 2549
    const-string v0, "SELECT COUNT(*) > 0 FROM workspec WHERE state NOT IN (2, 3, 5) LIMIT 1"

    .line 2550
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "SELECT COUNT(*) > 0 FROM workspec WHERE state NOT IN (2, 3, 5) LIMIT 1"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 2551
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const-string/jumbo v5, "workspec"

    aput-object v5, v4, v2

    new-instance v5, Landroidx/work/impl/model/WorkSpecDao_Impl$25;

    invoke-direct {v5, p0, v1}, Landroidx/work/impl/model/WorkSpecDao_Impl$25;-><init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomSQLiteQuery;)V

    invoke-static {v3, v2, v4, v5}, Landroidx/room/CoroutinesRoom;->createFlow(Landroidx/room/RoomDatabase;Z[Ljava/lang/String;Ljava/util/concurrent/Callable;)Lkotlinx/coroutines/flow/Flow;

    move-result-object v2

    return-object v2
.end method

.method public incrementGeneration(Ljava/lang/String;)V
    .locals 4
    .param p1, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "id"
        }
    .end annotation

    .line 622
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 623
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfIncrementGeneration:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->acquire()Landroidx/sqlite/db/SupportSQLiteStatement;

    move-result-object v0

    .line 624
    .local v0, "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    const/4 v1, 0x1

    .line 625
    .local v1, "_argIndex":I
    invoke-interface {v0, v1, p1}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 627
    :try_start_0
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 629
    :try_start_1
    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I

    .line 630
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 632
    :try_start_2
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 633
    nop

    .line 635
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfIncrementGeneration:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v2, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 636
    nop

    .line 637
    return-void

    .line 632
    :catchall_0
    move-exception v2

    :try_start_3
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 633
    nop

    .end local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .end local v1    # "_argIndex":I
    .end local p1    # "id":Ljava/lang/String;
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 635
    .restart local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .restart local v1    # "_argIndex":I
    .restart local p1    # "id":Ljava/lang/String;
    :catchall_1
    move-exception v2

    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfIncrementGeneration:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v3, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 636
    throw v2
.end method

.method public incrementPeriodCount(Ljava/lang/String;)V
    .locals 4
    .param p1, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "id"
        }
    .end annotation

    .line 420
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 421
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfIncrementPeriodCount:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->acquire()Landroidx/sqlite/db/SupportSQLiteStatement;

    move-result-object v0

    .line 422
    .local v0, "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    const/4 v1, 0x1

    .line 423
    .local v1, "_argIndex":I
    invoke-interface {v0, v1, p1}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 425
    :try_start_0
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 427
    :try_start_1
    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I

    .line 428
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 430
    :try_start_2
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 431
    nop

    .line 433
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfIncrementPeriodCount:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v2, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 434
    nop

    .line 435
    return-void

    .line 430
    :catchall_0
    move-exception v2

    :try_start_3
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 431
    nop

    .end local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .end local v1    # "_argIndex":I
    .end local p1    # "id":Ljava/lang/String;
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 433
    .restart local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .restart local v1    # "_argIndex":I
    .restart local p1    # "id":Ljava/lang/String;
    :catchall_1
    move-exception v2

    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfIncrementPeriodCount:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v3, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 434
    throw v2
.end method

.method public incrementWorkSpecRunAttemptCount(Ljava/lang/String;)I
    .locals 4
    .param p1, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "id"
        }
    .end annotation

    .line 482
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 483
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfIncrementWorkSpecRunAttemptCount:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->acquire()Landroidx/sqlite/db/SupportSQLiteStatement;

    move-result-object v0

    .line 484
    .local v0, "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    const/4 v1, 0x1

    .line 485
    .local v1, "_argIndex":I
    invoke-interface {v0, v1, p1}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 487
    :try_start_0
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 489
    :try_start_1
    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I

    move-result v2

    .line 490
    .local v2, "_result":I
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 491
    nop

    .line 493
    :try_start_2
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 496
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfIncrementWorkSpecRunAttemptCount:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v3, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 491
    return v2

    .line 493
    .end local v2    # "_result":I
    :catchall_0
    move-exception v2

    :try_start_3
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 494
    nop

    .end local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .end local v1    # "_argIndex":I
    .end local p1    # "id":Ljava/lang/String;
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 496
    .restart local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .restart local v1    # "_argIndex":I
    .restart local p1    # "id":Ljava/lang/String;
    :catchall_1
    move-exception v2

    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfIncrementWorkSpecRunAttemptCount:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v3, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 497
    throw v2
.end method

.method public insertWorkSpec(Landroidx/work/impl/model/WorkSpec;)V
    .locals 2
    .param p1, "workSpec"    # Landroidx/work/impl/model/WorkSpec;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "workSpec"
        }
    .end annotation

    .line 334
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 335
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 337
    :try_start_0
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__insertionAdapterOfWorkSpec:Landroidx/room/EntityInsertionAdapter;

    invoke-virtual {v0, p1}, Landroidx/room/EntityInsertionAdapter;->insert(Ljava/lang/Object;)V

    .line 338
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 340
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 341
    nop

    .line 342
    return-void

    .line 340
    :catchall_0
    move-exception v0

    iget-object v1, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 341
    throw v0
.end method

.method synthetic lambda$__fetchRelationshipWorkProgressAsandroidxWorkData$1$androidx-work-impl-model-WorkSpecDao_Impl(Ljava/util/HashMap;)Lkotlin/Unit;
    .locals 1
    .param p1, "map"    # Ljava/util/HashMap;

    .line 3587
    invoke-direct {p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl;->__fetchRelationshipWorkProgressAsandroidxWorkData(Ljava/util/HashMap;)V

    .line 3588
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method synthetic lambda$__fetchRelationshipWorkTagAsjavaLangString$0$androidx-work-impl-model-WorkSpecDao_Impl(Ljava/util/HashMap;)Lkotlin/Unit;
    .locals 1
    .param p1, "map"    # Ljava/util/HashMap;

    .line 3540
    invoke-direct {p0, p1}, Landroidx/work/impl/model/WorkSpecDao_Impl;->__fetchRelationshipWorkTagAsjavaLangString(Ljava/util/HashMap;)V

    .line 3541
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public markWorkSpecScheduled(Ljava/lang/String;J)I
    .locals 4
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "startTime"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "id",
            "startTime"
        }
    .end annotation

    .line 565
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 566
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfMarkWorkSpecScheduled:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->acquire()Landroidx/sqlite/db/SupportSQLiteStatement;

    move-result-object v0

    .line 567
    .local v0, "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    const/4 v1, 0x1

    .line 568
    .local v1, "_argIndex":I
    invoke-interface {v0, v1, p2, p3}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 569
    const/4 v1, 0x2

    .line 570
    invoke-interface {v0, v1, p1}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 572
    :try_start_0
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 574
    :try_start_1
    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I

    move-result v2

    .line 575
    .local v2, "_result":I
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 576
    nop

    .line 578
    :try_start_2
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 581
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfMarkWorkSpecScheduled:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v3, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 576
    return v2

    .line 578
    .end local v2    # "_result":I
    :catchall_0
    move-exception v2

    :try_start_3
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 579
    nop

    .end local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .end local v1    # "_argIndex":I
    .end local p1    # "id":Ljava/lang/String;
    .end local p2    # "startTime":J
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 581
    .restart local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .restart local v1    # "_argIndex":I
    .restart local p1    # "id":Ljava/lang/String;
    .restart local p2    # "startTime":J
    :catchall_1
    move-exception v2

    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfMarkWorkSpecScheduled:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v3, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 582
    throw v2
.end method

.method public pruneFinishedWorkWithZeroDependentsIgnoringKeepForAtLeast()V
    .locals 3

    .line 605
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 606
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfPruneFinishedWorkWithZeroDependentsIgnoringKeepForAtLeast:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->acquire()Landroidx/sqlite/db/SupportSQLiteStatement;

    move-result-object v0

    .line 608
    .local v0, "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    :try_start_0
    iget-object v1, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 610
    :try_start_1
    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I

    .line 611
    iget-object v1, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 613
    :try_start_2
    iget-object v1, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 614
    nop

    .line 616
    iget-object v1, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfPruneFinishedWorkWithZeroDependentsIgnoringKeepForAtLeast:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v1, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 617
    nop

    .line 618
    return-void

    .line 613
    :catchall_0
    move-exception v1

    :try_start_3
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 614
    nop

    .end local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 616
    .restart local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    :catchall_1
    move-exception v1

    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfPruneFinishedWorkWithZeroDependentsIgnoringKeepForAtLeast:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v2, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 617
    throw v1
.end method

.method public resetScheduledState()I
    .locals 3

    .line 587
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 588
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfResetScheduledState:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->acquire()Landroidx/sqlite/db/SupportSQLiteStatement;

    move-result-object v0

    .line 590
    .local v0, "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    :try_start_0
    iget-object v1, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 592
    :try_start_1
    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I

    move-result v1

    .line 593
    .local v1, "_result":I
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 594
    nop

    .line 596
    :try_start_2
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 599
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfResetScheduledState:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v2, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 594
    return v1

    .line 596
    .end local v1    # "_result":I
    :catchall_0
    move-exception v1

    :try_start_3
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 597
    nop

    .end local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 599
    .restart local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    :catchall_1
    move-exception v1

    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfResetScheduledState:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v2, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 600
    throw v1
.end method

.method public resetWorkSpecNextScheduleTimeOverride(Ljava/lang/String;I)V
    .locals 4
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "overrideGeneration"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "id",
            "overrideGeneration"
        }
    .end annotation

    .line 544
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 545
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfResetWorkSpecNextScheduleTimeOverride:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->acquire()Landroidx/sqlite/db/SupportSQLiteStatement;

    move-result-object v0

    .line 546
    .local v0, "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    const/4 v1, 0x1

    .line 547
    .local v1, "_argIndex":I
    invoke-interface {v0, v1, p1}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 548
    const/4 v1, 0x2

    .line 549
    int-to-long v2, p2

    invoke-interface {v0, v1, v2, v3}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 551
    :try_start_0
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 553
    :try_start_1
    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I

    .line 554
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 556
    :try_start_2
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 557
    nop

    .line 559
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfResetWorkSpecNextScheduleTimeOverride:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v2, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 560
    nop

    .line 561
    return-void

    .line 556
    :catchall_0
    move-exception v2

    :try_start_3
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 557
    nop

    .end local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .end local v1    # "_argIndex":I
    .end local p1    # "id":Ljava/lang/String;
    .end local p2    # "overrideGeneration":I
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 559
    .restart local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .restart local v1    # "_argIndex":I
    .restart local p1    # "id":Ljava/lang/String;
    .restart local p2    # "overrideGeneration":I
    :catchall_1
    move-exception v2

    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfResetWorkSpecNextScheduleTimeOverride:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v3, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 560
    throw v2
.end method

.method public resetWorkSpecRunAttemptCount(Ljava/lang/String;)I
    .locals 4
    .param p1, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "id"
        }
    .end annotation

    .line 502
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 503
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfResetWorkSpecRunAttemptCount:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->acquire()Landroidx/sqlite/db/SupportSQLiteStatement;

    move-result-object v0

    .line 504
    .local v0, "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    const/4 v1, 0x1

    .line 505
    .local v1, "_argIndex":I
    invoke-interface {v0, v1, p1}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 507
    :try_start_0
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 509
    :try_start_1
    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I

    move-result v2

    .line 510
    .local v2, "_result":I
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 511
    nop

    .line 513
    :try_start_2
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 516
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfResetWorkSpecRunAttemptCount:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v3, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 511
    return v2

    .line 513
    .end local v2    # "_result":I
    :catchall_0
    move-exception v2

    :try_start_3
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 514
    nop

    .end local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .end local v1    # "_argIndex":I
    .end local p1    # "id":Ljava/lang/String;
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 516
    .restart local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .restart local v1    # "_argIndex":I
    .restart local p1    # "id":Ljava/lang/String;
    :catchall_1
    move-exception v2

    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfResetWorkSpecRunAttemptCount:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v3, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 517
    throw v2
.end method

.method public setCancelledState(Ljava/lang/String;)I
    .locals 4
    .param p1, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "id"
        }
    .end annotation

    .line 400
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 401
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetCancelledState:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->acquire()Landroidx/sqlite/db/SupportSQLiteStatement;

    move-result-object v0

    .line 402
    .local v0, "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    const/4 v1, 0x1

    .line 403
    .local v1, "_argIndex":I
    invoke-interface {v0, v1, p1}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 405
    :try_start_0
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 407
    :try_start_1
    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I

    move-result v2

    .line 408
    .local v2, "_result":I
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 409
    nop

    .line 411
    :try_start_2
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 414
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetCancelledState:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v3, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 409
    return v2

    .line 411
    .end local v2    # "_result":I
    :catchall_0
    move-exception v2

    :try_start_3
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 412
    nop

    .end local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .end local v1    # "_argIndex":I
    .end local p1    # "id":Ljava/lang/String;
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 414
    .restart local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .restart local v1    # "_argIndex":I
    .restart local p1    # "id":Ljava/lang/String;
    :catchall_1
    move-exception v2

    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetCancelledState:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v3, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 415
    throw v2
.end method

.method public setLastEnqueueTime(Ljava/lang/String;J)V
    .locals 4
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "enqueueTime"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "id",
            "enqueueTime"
        }
    .end annotation

    .line 461
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 462
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetLastEnqueueTime:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->acquire()Landroidx/sqlite/db/SupportSQLiteStatement;

    move-result-object v0

    .line 463
    .local v0, "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    const/4 v1, 0x1

    .line 464
    .local v1, "_argIndex":I
    invoke-interface {v0, v1, p2, p3}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 465
    const/4 v1, 0x2

    .line 466
    invoke-interface {v0, v1, p1}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 468
    :try_start_0
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 470
    :try_start_1
    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I

    .line 471
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 473
    :try_start_2
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 474
    nop

    .line 476
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetLastEnqueueTime:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v2, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 477
    nop

    .line 478
    return-void

    .line 473
    :catchall_0
    move-exception v2

    :try_start_3
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 474
    nop

    .end local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .end local v1    # "_argIndex":I
    .end local p1    # "id":Ljava/lang/String;
    .end local p2    # "enqueueTime":J
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 476
    .restart local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .restart local v1    # "_argIndex":I
    .restart local p1    # "id":Ljava/lang/String;
    .restart local p2    # "enqueueTime":J
    :catchall_1
    move-exception v2

    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetLastEnqueueTime:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v3, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 477
    throw v2
.end method

.method public setNextScheduleTimeOverride(Ljava/lang/String;J)V
    .locals 4
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "nextScheduleTimeOverrideMillis"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "id",
            "nextScheduleTimeOverrideMillis"
        }
    .end annotation

    .line 523
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 524
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetNextScheduleTimeOverride:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->acquire()Landroidx/sqlite/db/SupportSQLiteStatement;

    move-result-object v0

    .line 525
    .local v0, "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    const/4 v1, 0x1

    .line 526
    .local v1, "_argIndex":I
    invoke-interface {v0, v1, p2, p3}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 527
    const/4 v1, 0x2

    .line 528
    invoke-interface {v0, v1, p1}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 530
    :try_start_0
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 532
    :try_start_1
    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I

    .line 533
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 535
    :try_start_2
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 536
    nop

    .line 538
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetNextScheduleTimeOverride:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v2, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 539
    nop

    .line 540
    return-void

    .line 535
    :catchall_0
    move-exception v2

    :try_start_3
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 536
    nop

    .end local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .end local v1    # "_argIndex":I
    .end local p1    # "id":Ljava/lang/String;
    .end local p2    # "nextScheduleTimeOverrideMillis":J
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 538
    .restart local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .restart local v1    # "_argIndex":I
    .restart local p1    # "id":Ljava/lang/String;
    .restart local p2    # "nextScheduleTimeOverrideMillis":J
    :catchall_1
    move-exception v2

    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetNextScheduleTimeOverride:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v3, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 539
    throw v2
.end method

.method public setOutput(Ljava/lang/String;Landroidx/work/Data;)V
    .locals 5
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "output"    # Landroidx/work/Data;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "id",
            "output"
        }
    .end annotation

    .line 439
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 440
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetOutput:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->acquire()Landroidx/sqlite/db/SupportSQLiteStatement;

    move-result-object v0

    .line 441
    .local v0, "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    const/4 v1, 0x1

    .line 442
    .local v1, "_argIndex":I
    invoke-static {p2}, Landroidx/work/Data;->toByteArrayInternalV1(Landroidx/work/Data;)[B

    move-result-object v2

    .line 443
    .local v2, "_tmp":[B
    invoke-interface {v0, v1, v2}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindBlob(I[B)V

    .line 444
    const/4 v1, 0x2

    .line 445
    invoke-interface {v0, v1, p1}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 447
    :try_start_0
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 449
    :try_start_1
    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I

    .line 450
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 452
    :try_start_2
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 453
    nop

    .line 455
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetOutput:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v3, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 456
    nop

    .line 457
    return-void

    .line 452
    :catchall_0
    move-exception v3

    :try_start_3
    iget-object v4, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v4}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 453
    nop

    .end local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .end local v1    # "_argIndex":I
    .end local v2    # "_tmp":[B
    .end local p1    # "id":Ljava/lang/String;
    .end local p2    # "output":Landroidx/work/Data;
    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 455
    .restart local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .restart local v1    # "_argIndex":I
    .restart local v2    # "_tmp":[B
    .restart local p1    # "id":Ljava/lang/String;
    .restart local p2    # "output":Landroidx/work/Data;
    :catchall_1
    move-exception v3

    iget-object v4, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetOutput:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v4, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 456
    throw v3
.end method

.method public setState(Landroidx/work/WorkInfo$State;Ljava/lang/String;)I
    .locals 5
    .param p1, "state"    # Landroidx/work/WorkInfo$State;
    .param p2, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "state",
            "id"
        }
    .end annotation

    .line 377
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 378
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetState:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->acquire()Landroidx/sqlite/db/SupportSQLiteStatement;

    move-result-object v0

    .line 379
    .local v0, "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    const/4 v1, 0x1

    .line 380
    .local v1, "_argIndex":I
    sget-object v2, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {p1}, Landroidx/work/impl/model/WorkTypeConverters;->stateToInt(Landroidx/work/WorkInfo$State;)I

    move-result v2

    .line 381
    .local v2, "_tmp":I
    int-to-long v3, v2

    invoke-interface {v0, v1, v3, v4}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 382
    const/4 v1, 0x2

    .line 383
    invoke-interface {v0, v1, p2}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 385
    :try_start_0
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 387
    :try_start_1
    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I

    move-result v3

    .line 388
    .local v3, "_result":I
    iget-object v4, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v4}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 389
    nop

    .line 391
    :try_start_2
    iget-object v4, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v4}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 394
    iget-object v4, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetState:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v4, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 389
    return v3

    .line 391
    .end local v3    # "_result":I
    :catchall_0
    move-exception v3

    :try_start_3
    iget-object v4, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v4}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 392
    nop

    .end local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .end local v1    # "_argIndex":I
    .end local v2    # "_tmp":I
    .end local p1    # "state":Landroidx/work/WorkInfo$State;
    .end local p2    # "id":Ljava/lang/String;
    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 394
    .restart local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .restart local v1    # "_argIndex":I
    .restart local v2    # "_tmp":I
    .restart local p1    # "state":Landroidx/work/WorkInfo$State;
    .restart local p2    # "id":Ljava/lang/String;
    :catchall_1
    move-exception v3

    iget-object v4, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetState:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v4, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 395
    throw v3
.end method

.method public setStopReason(Ljava/lang/String;I)V
    .locals 4
    .param p1, "id"    # Ljava/lang/String;
    .param p2, "stopReason"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "id",
            "stopReason"
        }
    .end annotation

    .line 641
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 642
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetStopReason:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->acquire()Landroidx/sqlite/db/SupportSQLiteStatement;

    move-result-object v0

    .line 643
    .local v0, "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    const/4 v1, 0x1

    .line 644
    .local v1, "_argIndex":I
    int-to-long v2, p2

    invoke-interface {v0, v1, v2, v3}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 645
    const/4 v1, 0x2

    .line 646
    invoke-interface {v0, v1, p1}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 648
    :try_start_0
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 650
    :try_start_1
    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I

    .line 651
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 653
    :try_start_2
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 654
    nop

    .line 656
    iget-object v2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetStopReason:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v2, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 657
    nop

    .line 658
    return-void

    .line 653
    :catchall_0
    move-exception v2

    :try_start_3
    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 654
    nop

    .end local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .end local v1    # "_argIndex":I
    .end local p1    # "id":Ljava/lang/String;
    .end local p2    # "stopReason":I
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 656
    .restart local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .restart local v1    # "_argIndex":I
    .restart local p1    # "id":Ljava/lang/String;
    .restart local p2    # "stopReason":I
    :catchall_1
    move-exception v2

    iget-object v3, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__preparedStmtOfSetStopReason:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v3, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 657
    throw v2
.end method

.method public updateWorkSpec(Landroidx/work/impl/model/WorkSpec;)V
    .locals 2
    .param p1, "workSpec"    # Landroidx/work/impl/model/WorkSpec;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "workSpec"
        }
    .end annotation

    .line 346
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 347
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 349
    :try_start_0
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__updateAdapterOfWorkSpec:Landroidx/room/EntityDeletionOrUpdateAdapter;

    invoke-virtual {v0, p1}, Landroidx/room/EntityDeletionOrUpdateAdapter;->handle(Ljava/lang/Object;)I

    .line 350
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 352
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 353
    nop

    .line 354
    return-void

    .line 352
    :catchall_0
    move-exception v0

    iget-object v1, p0, Landroidx/work/impl/model/WorkSpecDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 353
    throw v0
.end method
