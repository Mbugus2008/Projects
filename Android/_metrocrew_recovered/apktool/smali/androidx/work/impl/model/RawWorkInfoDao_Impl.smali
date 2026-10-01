.class public final Landroidx/work/impl/model/RawWorkInfoDao_Impl;
.super Ljava/lang/Object;
.source "RawWorkInfoDao_Impl.java"

# interfaces
.implements Landroidx/work/impl/model/RawWorkInfoDao;


# instance fields
.field private final __db:Landroidx/room/RoomDatabase;


# direct methods
.method public constructor <init>(Landroidx/room/RoomDatabase;)V
    .locals 0
    .param p1, "__db"    # Landroidx/room/RoomDatabase;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "__db"
        }
    .end annotation

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p1, p0, Landroidx/work/impl/model/RawWorkInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    .line 44
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

    .line 788
    .local p1, "_map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 789
    .local v0, "__mapKeySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 790
    return-void

    .line 792
    :cond_0
    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    move-result v1

    const/16 v2, 0x3e7

    if-le v1, v2, :cond_1

    .line 793
    new-instance v1, Landroidx/work/impl/model/RawWorkInfoDao_Impl$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Landroidx/work/impl/model/RawWorkInfoDao_Impl$$ExternalSyntheticLambda1;-><init>(Landroidx/work/impl/model/RawWorkInfoDao_Impl;)V

    const/4 v2, 0x1

    invoke-static {p1, v2, v1}, Landroidx/room/util/RelationUtil;->recursiveFetchHashMap(Ljava/util/HashMap;ZLkotlin/jvm/functions/Function1;)V

    .line 797
    return-void

    .line 799
    :cond_1
    invoke-static {}, Landroidx/room/util/StringUtil;->newStringBuilder()Ljava/lang/StringBuilder;

    move-result-object v1

    .line 800
    .local v1, "_stringBuilder":Ljava/lang/StringBuilder;
    const-string v2, "SELECT `progress`,`work_spec_id` FROM `WorkProgress` WHERE `work_spec_id` IN ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 801
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v2

    .line 802
    .local v2, "_inputSize":I
    invoke-static {v1, v2}, Landroidx/room/util/StringUtil;->appendPlaceholders(Ljava/lang/StringBuilder;I)V

    .line 803
    const-string v3, ")"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 804
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 805
    .local v3, "_sql":Ljava/lang/String;
    add-int/lit8 v4, v2, 0x0

    .line 806
    .local v4, "_argCount":I
    invoke-static {v3, v4}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v5

    .line 807
    .local v5, "_stmt":Landroidx/room/RoomSQLiteQuery;
    const/4 v6, 0x1

    .line 808
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

    .line 809
    .local v8, "_item":Ljava/lang/String;
    invoke-virtual {v5, v6, v8}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 810
    nop

    .end local v8    # "_item":Ljava/lang/String;
    add-int/lit8 v6, v6, 0x1

    .line 811
    goto :goto_0

    .line 812
    :cond_2
    iget-object v7, p0, Landroidx/work/impl/model/RawWorkInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v7, v5, v9, v8}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v7

    .line 814
    .local v7, "_cursor":Landroid/database/Cursor;
    :try_start_0
    const-string/jumbo v8, "work_spec_id"

    invoke-static {v7, v8}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 815
    .local v8, "_itemKeyIndex":I
    const/4 v10, -0x1

    if-ne v8, v10, :cond_3

    .line 831
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 816
    return-void

    .line 818
    :cond_3
    :goto_1
    :try_start_1
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v10

    if-eqz v10, :cond_5

    .line 820
    invoke-interface {v7, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 821
    .local v10, "_tmpKey":Ljava/lang/String;
    invoke-virtual {p1, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/ArrayList;

    .line 822
    .local v11, "_tmpRelation":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/work/Data;>;"
    if-eqz v11, :cond_4

    .line 825
    invoke-interface {v7, v9}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v12

    .line 826
    .local v12, "_tmp":[B
    invoke-static {v12}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v13

    .line 827
    .local v13, "_item_1":Landroidx/work/Data;
    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 829
    .end local v10    # "_tmpKey":Ljava/lang/String;
    .end local v11    # "_tmpRelation":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/work/Data;>;"
    .end local v12    # "_tmp":[B
    .end local v13    # "_item_1":Landroidx/work/Data;
    :cond_4
    goto :goto_1

    .line 831
    .end local v8    # "_itemKeyIndex":I
    :cond_5
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 832
    nop

    .line 833
    return-void

    .line 831
    :catchall_0
    move-exception v8

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 832
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

    .line 741
    .local p1, "_map":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    invoke-virtual {p1}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 742
    .local v0, "__mapKeySet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 743
    return-void

    .line 745
    :cond_0
    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    move-result v1

    const/16 v2, 0x3e7

    if-le v1, v2, :cond_1

    .line 746
    new-instance v1, Landroidx/work/impl/model/RawWorkInfoDao_Impl$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Landroidx/work/impl/model/RawWorkInfoDao_Impl$$ExternalSyntheticLambda0;-><init>(Landroidx/work/impl/model/RawWorkInfoDao_Impl;)V

    const/4 v2, 0x1

    invoke-static {p1, v2, v1}, Landroidx/room/util/RelationUtil;->recursiveFetchHashMap(Ljava/util/HashMap;ZLkotlin/jvm/functions/Function1;)V

    .line 750
    return-void

    .line 752
    :cond_1
    invoke-static {}, Landroidx/room/util/StringUtil;->newStringBuilder()Ljava/lang/StringBuilder;

    move-result-object v1

    .line 753
    .local v1, "_stringBuilder":Ljava/lang/StringBuilder;
    const-string v2, "SELECT `tag`,`work_spec_id` FROM `WorkTag` WHERE `work_spec_id` IN ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 754
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v2

    .line 755
    .local v2, "_inputSize":I
    invoke-static {v1, v2}, Landroidx/room/util/StringUtil;->appendPlaceholders(Ljava/lang/StringBuilder;I)V

    .line 756
    const-string v3, ")"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 757
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 758
    .local v3, "_sql":Ljava/lang/String;
    add-int/lit8 v4, v2, 0x0

    .line 759
    .local v4, "_argCount":I
    invoke-static {v3, v4}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v5

    .line 760
    .local v5, "_stmt":Landroidx/room/RoomSQLiteQuery;
    const/4 v6, 0x1

    .line 761
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

    .line 762
    .local v8, "_item":Ljava/lang/String;
    invoke-virtual {v5, v6, v8}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 763
    nop

    .end local v8    # "_item":Ljava/lang/String;
    add-int/lit8 v6, v6, 0x1

    .line 764
    goto :goto_0

    .line 765
    :cond_2
    iget-object v7, p0, Landroidx/work/impl/model/RawWorkInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-static {v7, v5, v9, v8}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v7

    .line 767
    .local v7, "_cursor":Landroid/database/Cursor;
    :try_start_0
    const-string/jumbo v8, "work_spec_id"

    invoke-static {v7, v8}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 768
    .local v8, "_itemKeyIndex":I
    const/4 v10, -0x1

    if-ne v8, v10, :cond_3

    .line 782
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 769
    return-void

    .line 771
    :cond_3
    :goto_1
    :try_start_1
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v10

    if-eqz v10, :cond_5

    .line 773
    invoke-interface {v7, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 774
    .local v10, "_tmpKey":Ljava/lang/String;
    invoke-virtual {p1, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/ArrayList;

    .line 775
    .local v11, "_tmpRelation":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v11, :cond_4

    .line 777
    invoke-interface {v7, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 778
    .local v12, "_item_1":Ljava/lang/String;
    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 780
    .end local v10    # "_tmpKey":Ljava/lang/String;
    .end local v11    # "_tmpRelation":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v12    # "_item_1":Ljava/lang/String;
    :cond_4
    goto :goto_1

    .line 782
    .end local v8    # "_itemKeyIndex":I
    :cond_5
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 783
    nop

    .line 784
    return-void

    .line 782
    :catchall_0
    move-exception v8

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 783
    throw v8
.end method

.method static synthetic access$000(Landroidx/work/impl/model/RawWorkInfoDao_Impl;)Landroidx/room/RoomDatabase;
    .locals 1
    .param p0, "x0"    # Landroidx/work/impl/model/RawWorkInfoDao_Impl;

    .line 39
    iget-object v0, p0, Landroidx/work/impl/model/RawWorkInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    return-object v0
.end method

.method static synthetic access$100(Landroidx/work/impl/model/RawWorkInfoDao_Impl;Ljava/util/HashMap;)V
    .locals 0
    .param p0, "x0"    # Landroidx/work/impl/model/RawWorkInfoDao_Impl;
    .param p1, "x1"    # Ljava/util/HashMap;

    .line 39
    invoke-direct {p0, p1}, Landroidx/work/impl/model/RawWorkInfoDao_Impl;->__fetchRelationshipWorkTagAsjavaLangString(Ljava/util/HashMap;)V

    return-void
.end method

.method static synthetic access$200(Landroidx/work/impl/model/RawWorkInfoDao_Impl;Ljava/util/HashMap;)V
    .locals 0
    .param p0, "x0"    # Landroidx/work/impl/model/RawWorkInfoDao_Impl;
    .param p1, "x1"    # Ljava/util/HashMap;

    .line 39
    invoke-direct {p0, p1}, Landroidx/work/impl/model/RawWorkInfoDao_Impl;->__fetchRelationshipWorkProgressAsandroidxWorkData(Ljava/util/HashMap;)V

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

    .line 736
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getWorkInfoPojos(Landroidx/sqlite/db/SupportSQLiteQuery;)Ljava/util/List;
    .locals 66
    .param p1, "query"    # Landroidx/sqlite/db/SupportSQLiteQuery;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "query"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/sqlite/db/SupportSQLiteQuery;",
            ")",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;",
            ">;"
        }
    .end annotation

    .line 48
    move-object/from16 v1, p0

    iget-object v0, v1, Landroidx/work/impl/model/RawWorkInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 49
    iget-object v0, v1, Landroidx/work/impl/model/RawWorkInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v2, 0x0

    const/4 v3, 0x1

    move-object/from16 v4, p1

    invoke-static {v0, v4, v3, v2}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v2

    .line 51
    .local v2, "_cursor":Landroid/database/Cursor;
    :try_start_0
    const-string v0, "id"

    invoke-static {v2, v0}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    .line 52
    .local v0, "_cursorIndexOfId":I
    const-string/jumbo v5, "state"

    invoke-static {v2, v5}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v5

    .line 53
    .local v5, "_cursorIndexOfState":I
    const-string v6, "output"

    invoke-static {v2, v6}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 54
    .local v6, "_cursorIndexOfOutput":I
    const-string v7, "initial_delay"

    invoke-static {v2, v7}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 55
    .local v7, "_cursorIndexOfInitialDelay":I
    const-string v8, "interval_duration"

    invoke-static {v2, v8}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v8

    .line 56
    .local v8, "_cursorIndexOfIntervalDuration":I
    const-string v9, "flex_duration"

    invoke-static {v2, v9}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v9

    .line 57
    .local v9, "_cursorIndexOfFlexDuration":I
    const-string v10, "run_attempt_count"

    invoke-static {v2, v10}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v10

    .line 58
    .local v10, "_cursorIndexOfRunAttemptCount":I
    const-string v11, "backoff_policy"

    invoke-static {v2, v11}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v11

    .line 59
    .local v11, "_cursorIndexOfBackoffPolicy":I
    const-string v12, "backoff_delay_duration"

    invoke-static {v2, v12}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v12

    .line 60
    .local v12, "_cursorIndexOfBackoffDelayDuration":I
    const-string v13, "last_enqueue_time"

    invoke-static {v2, v13}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v13

    .line 61
    .local v13, "_cursorIndexOfLastEnqueueTime":I
    const-string v14, "period_count"

    invoke-static {v2, v14}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v14

    .line 62
    .local v14, "_cursorIndexOfPeriodCount":I
    const-string v15, "generation"

    invoke-static {v2, v15}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v15

    .line 63
    .local v15, "_cursorIndexOfGeneration":I
    const-string v3, "next_schedule_time_override"

    invoke-static {v2, v3}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v3

    .line 64
    .local v3, "_cursorIndexOfNextScheduleTimeOverride":I
    const-string/jumbo v4, "stop_reason"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 65
    .local v4, "_cursorIndexOfStopReason":I
    move/from16 v16, v4

    .end local v4    # "_cursorIndexOfStopReason":I
    .local v16, "_cursorIndexOfStopReason":I
    const-string v4, "required_network_type"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 66
    .local v4, "_cursorIndexOfRequiredNetworkType":I
    move/from16 v17, v4

    .end local v4    # "_cursorIndexOfRequiredNetworkType":I
    .local v17, "_cursorIndexOfRequiredNetworkType":I
    const-string v4, "required_network_request"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 67
    .local v4, "_cursorIndexOfRequiredNetworkRequestCompat":I
    move/from16 v18, v4

    .end local v4    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v18, "_cursorIndexOfRequiredNetworkRequestCompat":I
    const-string v4, "requires_charging"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 68
    .local v4, "_cursorIndexOfRequiresCharging":I
    move/from16 v19, v4

    .end local v4    # "_cursorIndexOfRequiresCharging":I
    .local v19, "_cursorIndexOfRequiresCharging":I
    const-string v4, "requires_device_idle"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 69
    .local v4, "_cursorIndexOfRequiresDeviceIdle":I
    move/from16 v20, v4

    .end local v4    # "_cursorIndexOfRequiresDeviceIdle":I
    .local v20, "_cursorIndexOfRequiresDeviceIdle":I
    const-string v4, "requires_battery_not_low"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 70
    .local v4, "_cursorIndexOfRequiresBatteryNotLow":I
    move/from16 v21, v4

    .end local v4    # "_cursorIndexOfRequiresBatteryNotLow":I
    .local v21, "_cursorIndexOfRequiresBatteryNotLow":I
    const-string v4, "requires_storage_not_low"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 71
    .local v4, "_cursorIndexOfRequiresStorageNotLow":I
    move/from16 v22, v4

    .end local v4    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v22, "_cursorIndexOfRequiresStorageNotLow":I
    const-string/jumbo v4, "trigger_content_update_delay"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 72
    .local v4, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    move/from16 v23, v4

    .end local v4    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v23, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    const-string/jumbo v4, "trigger_max_content_delay"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 73
    .local v4, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    move/from16 v24, v4

    .end local v4    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .local v24, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    const-string v4, "content_uri_triggers"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 74
    .local v4, "_cursorIndexOfContentUriTriggers":I
    new-instance v25, Ljava/util/HashMap;

    invoke-direct/range {v25 .. v25}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v26, v25

    .line 75
    .local v26, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    new-instance v25, Ljava/util/HashMap;

    invoke-direct/range {v25 .. v25}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v27, v25

    .line 76
    .local v27, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v25

    if-eqz v25, :cond_2

    .line 78
    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v25

    move-object/from16 v28, v25

    .line 79
    .local v28, "_tmpKey":Ljava/lang/String;
    move/from16 v25, v4

    move-object/from16 v4, v26

    move/from16 v26, v3

    move-object/from16 v3, v28

    .end local v28    # "_tmpKey":Ljava/lang/String;
    .local v3, "_tmpKey":Ljava/lang/String;
    .local v4, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v25, "_cursorIndexOfContentUriTriggers":I
    .local v26, "_cursorIndexOfNextScheduleTimeOverride":I
    invoke-virtual {v4, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v28

    if-nez v28, :cond_0

    .line 80
    move/from16 v28, v15

    .end local v15    # "_cursorIndexOfGeneration":I
    .local v28, "_cursorIndexOfGeneration":I
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v4, v3, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 79
    .end local v28    # "_cursorIndexOfGeneration":I
    .restart local v15    # "_cursorIndexOfGeneration":I
    :cond_0
    move/from16 v28, v15

    .line 83
    .end local v15    # "_cursorIndexOfGeneration":I
    .restart local v28    # "_cursorIndexOfGeneration":I
    :goto_1
    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 84
    .local v15, "_tmpKey_1":Ljava/lang/String;
    move-object/from16 v29, v3

    move-object/from16 v3, v27

    .end local v27    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .local v3, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .local v29, "_tmpKey":Ljava/lang/String;
    invoke-virtual {v3, v15}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_1

    .line 85
    move/from16 v27, v14

    .end local v14    # "_cursorIndexOfPeriodCount":I
    .local v27, "_cursorIndexOfPeriodCount":I
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v3, v15, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 84
    .end local v27    # "_cursorIndexOfPeriodCount":I
    .restart local v14    # "_cursorIndexOfPeriodCount":I
    :cond_1
    move/from16 v27, v14

    .line 87
    .end local v14    # "_cursorIndexOfPeriodCount":I
    .end local v15    # "_tmpKey_1":Ljava/lang/String;
    .end local v29    # "_tmpKey":Ljava/lang/String;
    .restart local v27    # "_cursorIndexOfPeriodCount":I
    :goto_2
    move/from16 v14, v27

    move/from16 v15, v28

    move-object/from16 v27, v3

    move/from16 v3, v26

    move-object/from16 v26, v4

    move/from16 v4, v25

    goto :goto_0

    .line 88
    .end local v25    # "_cursorIndexOfContentUriTriggers":I
    .end local v28    # "_cursorIndexOfGeneration":I
    .local v3, "_cursorIndexOfNextScheduleTimeOverride":I
    .local v4, "_cursorIndexOfContentUriTriggers":I
    .restart local v14    # "_cursorIndexOfPeriodCount":I
    .local v15, "_cursorIndexOfGeneration":I
    .local v26, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v27, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :cond_2
    move/from16 v25, v4

    move/from16 v28, v15

    move-object/from16 v4, v26

    move/from16 v26, v3

    move-object/from16 v3, v27

    move/from16 v27, v14

    .end local v14    # "_cursorIndexOfPeriodCount":I
    .end local v15    # "_cursorIndexOfGeneration":I
    .local v3, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .local v4, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .restart local v25    # "_cursorIndexOfContentUriTriggers":I
    .local v26, "_cursorIndexOfNextScheduleTimeOverride":I
    .local v27, "_cursorIndexOfPeriodCount":I
    .restart local v28    # "_cursorIndexOfGeneration":I
    const/4 v14, -0x1

    invoke-interface {v2, v14}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 89
    invoke-direct {v1, v4}, Landroidx/work/impl/model/RawWorkInfoDao_Impl;->__fetchRelationshipWorkTagAsjavaLangString(Ljava/util/HashMap;)V

    .line 90
    invoke-direct {v1, v3}, Landroidx/work/impl/model/RawWorkInfoDao_Impl;->__fetchRelationshipWorkProgressAsandroidxWorkData(Ljava/util/HashMap;)V

    .line 91
    new-instance v15, Ljava/util/ArrayList;

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v14

    invoke-direct {v15, v14}, Ljava/util/ArrayList;-><init>(I)V

    .line 92
    .local v15, "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;>;"
    :goto_3
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v14

    if-eqz v14, :cond_1e

    .line 95
    const/4 v14, -0x1

    if-ne v0, v14, :cond_3

    .line 96
    const/16 v29, 0x0

    move-object/from16 v31, v29

    .local v29, "_tmpId":Ljava/lang/String;
    goto :goto_4

    .line 98
    .end local v29    # "_tmpId":Ljava/lang/String;
    :cond_3
    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v29

    move-object/from16 v31, v29

    .line 101
    .local v31, "_tmpId":Ljava/lang/String;
    :goto_4
    if-ne v5, v14, :cond_4

    .line 102
    const/4 v14, 0x0

    move-object/from16 v32, v14

    .local v14, "_tmpState":Landroidx/work/WorkInfo$State;
    goto :goto_5

    .line 105
    .end local v14    # "_tmpState":Landroidx/work/WorkInfo$State;
    :cond_4
    invoke-interface {v2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    .line 106
    .local v14, "_tmp":I
    sget-object v30, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v14}, Landroidx/work/impl/model/WorkTypeConverters;->intToState(I)Landroidx/work/WorkInfo$State;

    move-result-object v30

    move-object/from16 v32, v30

    .line 109
    .end local v14    # "_tmp":I
    .local v32, "_tmpState":Landroidx/work/WorkInfo$State;
    :goto_5
    const/4 v14, -0x1

    if-ne v6, v14, :cond_5

    .line 110
    const/4 v14, 0x0

    move-object/from16 v33, v14

    .local v14, "_tmpOutput":Landroidx/work/Data;
    goto :goto_6

    .line 113
    .end local v14    # "_tmpOutput":Landroidx/work/Data;
    :cond_5
    invoke-interface {v2, v6}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v14

    .line 114
    .local v14, "_tmp_1":[B
    invoke-static {v14}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v30

    move-object/from16 v33, v30

    .line 117
    .end local v14    # "_tmp_1":[B
    .local v33, "_tmpOutput":Landroidx/work/Data;
    :goto_6
    const/4 v14, -0x1

    if-ne v7, v14, :cond_6

    .line 118
    const-wide/16 v29, 0x0

    move-wide/from16 v34, v29

    .local v29, "_tmpInitialDelay":J
    goto :goto_7

    .line 120
    .end local v29    # "_tmpInitialDelay":J
    :cond_6
    invoke-interface {v2, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v29

    move-wide/from16 v34, v29

    .line 123
    .local v34, "_tmpInitialDelay":J
    :goto_7
    if-ne v8, v14, :cond_7

    .line 124
    const-wide/16 v29, 0x0

    move-wide/from16 v36, v29

    .local v29, "_tmpIntervalDuration":J
    goto :goto_8

    .line 126
    .end local v29    # "_tmpIntervalDuration":J
    :cond_7
    invoke-interface {v2, v8}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v29

    move-wide/from16 v36, v29

    .line 129
    .local v36, "_tmpIntervalDuration":J
    :goto_8
    if-ne v9, v14, :cond_8

    .line 130
    const-wide/16 v29, 0x0

    move-wide/from16 v38, v29

    .local v29, "_tmpFlexDuration":J
    goto :goto_9

    .line 132
    .end local v29    # "_tmpFlexDuration":J
    :cond_8
    invoke-interface {v2, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v29

    move-wide/from16 v38, v29

    .line 135
    .local v38, "_tmpFlexDuration":J
    :goto_9
    if-ne v10, v14, :cond_9

    .line 136
    const/16 v29, 0x0

    move/from16 v41, v29

    .local v29, "_tmpRunAttemptCount":I
    goto :goto_a

    .line 138
    .end local v29    # "_tmpRunAttemptCount":I
    :cond_9
    invoke-interface {v2, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v29

    move/from16 v41, v29

    .line 141
    .local v41, "_tmpRunAttemptCount":I
    :goto_a
    if-ne v11, v14, :cond_a

    .line 142
    const/4 v14, 0x0

    move-object/from16 v42, v14

    .local v14, "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    goto :goto_b

    .line 145
    .end local v14    # "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    :cond_a
    invoke-interface {v2, v11}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    .line 146
    .local v14, "_tmp_2":I
    sget-object v30, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v14}, Landroidx/work/impl/model/WorkTypeConverters;->intToBackoffPolicy(I)Landroidx/work/BackoffPolicy;

    move-result-object v30

    move-object/from16 v42, v30

    .line 149
    .end local v14    # "_tmp_2":I
    .local v42, "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    :goto_b
    const/4 v14, -0x1

    if-ne v12, v14, :cond_b

    .line 150
    const-wide/16 v29, 0x0

    move-wide/from16 v43, v29

    .local v29, "_tmpBackoffDelayDuration":J
    goto :goto_c

    .line 152
    .end local v29    # "_tmpBackoffDelayDuration":J
    :cond_b
    invoke-interface {v2, v12}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v29

    move-wide/from16 v43, v29

    .line 155
    .local v43, "_tmpBackoffDelayDuration":J
    :goto_c
    if-ne v13, v14, :cond_c

    .line 156
    const-wide/16 v29, 0x0

    move-wide/from16 v45, v29

    .local v29, "_tmpLastEnqueueTime":J
    goto :goto_d

    .line 158
    .end local v29    # "_tmpLastEnqueueTime":J
    :cond_c
    invoke-interface {v2, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v29

    move-wide/from16 v45, v29

    .line 161
    .local v45, "_tmpLastEnqueueTime":J
    :goto_d
    move/from16 v1, v27

    .end local v27    # "_cursorIndexOfPeriodCount":I
    .local v1, "_cursorIndexOfPeriodCount":I
    if-ne v1, v14, :cond_d

    .line 162
    const/16 v27, 0x0

    move/from16 v47, v27

    .local v27, "_tmpPeriodCount":I
    goto :goto_e

    .line 164
    .end local v27    # "_tmpPeriodCount":I
    :cond_d
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v27

    move/from16 v47, v27

    .line 167
    .local v47, "_tmpPeriodCount":I
    :goto_e
    move/from16 v27, v1

    move/from16 v1, v28

    .end local v28    # "_cursorIndexOfGeneration":I
    .local v1, "_cursorIndexOfGeneration":I
    .local v27, "_cursorIndexOfPeriodCount":I
    if-ne v1, v14, :cond_e

    .line 168
    const/16 v28, 0x0

    move/from16 v48, v28

    .local v28, "_tmpGeneration":I
    goto :goto_f

    .line 170
    .end local v28    # "_tmpGeneration":I
    :cond_e
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v28

    move/from16 v48, v28

    .line 173
    .local v48, "_tmpGeneration":I
    :goto_f
    move/from16 v28, v1

    move/from16 v1, v26

    .end local v26    # "_cursorIndexOfNextScheduleTimeOverride":I
    .local v1, "_cursorIndexOfNextScheduleTimeOverride":I
    .local v28, "_cursorIndexOfGeneration":I
    if-ne v1, v14, :cond_f

    .line 174
    const-wide/16 v29, 0x0

    move-wide/from16 v49, v29

    .local v29, "_tmpNextScheduleTimeOverride":J
    goto :goto_10

    .line 176
    .end local v29    # "_tmpNextScheduleTimeOverride":J
    :cond_f
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v29

    move-wide/from16 v49, v29

    .line 179
    .local v49, "_tmpNextScheduleTimeOverride":J
    :goto_10
    move/from16 v26, v1

    move/from16 v1, v16

    .end local v16    # "_cursorIndexOfStopReason":I
    .local v1, "_cursorIndexOfStopReason":I
    .restart local v26    # "_cursorIndexOfNextScheduleTimeOverride":I
    if-ne v1, v14, :cond_10

    .line 180
    const/16 v16, 0x0

    move/from16 v51, v16

    .local v16, "_tmpStopReason":I
    goto :goto_11

    .line 182
    .end local v16    # "_tmpStopReason":I
    :cond_10
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v16

    move/from16 v51, v16

    .line 186
    .local v51, "_tmpStopReason":I
    :goto_11
    move/from16 v16, v1

    move/from16 v1, v17

    .end local v17    # "_cursorIndexOfRequiredNetworkType":I
    .local v1, "_cursorIndexOfRequiredNetworkType":I
    .local v16, "_cursorIndexOfStopReason":I
    if-ne v1, v14, :cond_11

    .line 187
    const/4 v14, 0x0

    move-object/from16 v54, v14

    .local v14, "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    goto :goto_12

    .line 190
    .end local v14    # "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    :cond_11
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    .line 191
    .local v14, "_tmp_3":I
    sget-object v17, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v14}, Landroidx/work/impl/model/WorkTypeConverters;->intToNetworkType(I)Landroidx/work/NetworkType;

    move-result-object v17

    move-object/from16 v54, v17

    .line 194
    .end local v14    # "_tmp_3":I
    .local v54, "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    :goto_12
    move/from16 v17, v1

    move/from16 v14, v18

    const/4 v1, -0x1

    .end local v1    # "_cursorIndexOfRequiredNetworkType":I
    .end local v18    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v14, "_cursorIndexOfRequiredNetworkRequestCompat":I
    .restart local v17    # "_cursorIndexOfRequiredNetworkType":I
    if-ne v14, v1, :cond_12

    .line 195
    const/4 v1, 0x0

    move-object/from16 v53, v1

    .local v1, "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    goto :goto_13

    .line 198
    .end local v1    # "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    :cond_12
    invoke-interface {v2, v14}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v1

    .line 199
    .local v1, "_tmp_4":[B
    sget-object v18, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v1}, Landroidx/work/impl/model/WorkTypeConverters;->toNetworkRequest$work_runtime_release([B)Landroidx/work/impl/utils/NetworkRequestCompat;

    move-result-object v18

    move-object/from16 v53, v18

    .line 202
    .end local v1    # "_tmp_4":[B
    .local v53, "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    :goto_13
    move/from16 v1, v19

    move/from16 v19, v5

    const/4 v5, -0x1

    .end local v5    # "_cursorIndexOfState":I
    .local v1, "_cursorIndexOfRequiresCharging":I
    .local v19, "_cursorIndexOfState":I
    if-ne v1, v5, :cond_13

    .line 203
    const/4 v5, 0x0

    move/from16 v55, v5

    .local v5, "_tmpRequiresCharging":Z
    goto :goto_15

    .line 206
    .end local v5    # "_tmpRequiresCharging":Z
    :cond_13
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 207
    .local v5, "_tmp_5":I
    if-eqz v5, :cond_14

    const/16 v30, 0x1

    goto :goto_14

    :cond_14
    const/16 v30, 0x0

    :goto_14
    move/from16 v55, v30

    .line 210
    .end local v5    # "_tmp_5":I
    .local v55, "_tmpRequiresCharging":Z
    :goto_15
    move/from16 v5, v20

    move/from16 v20, v1

    const/4 v1, -0x1

    .end local v1    # "_cursorIndexOfRequiresCharging":I
    .local v5, "_cursorIndexOfRequiresDeviceIdle":I
    .local v20, "_cursorIndexOfRequiresCharging":I
    if-ne v5, v1, :cond_15

    .line 211
    const/4 v1, 0x0

    move/from16 v56, v1

    .local v1, "_tmpRequiresDeviceIdle":Z
    goto :goto_17

    .line 214
    .end local v1    # "_tmpRequiresDeviceIdle":Z
    :cond_15
    invoke-interface {v2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    .line 215
    .local v1, "_tmp_6":I
    if-eqz v1, :cond_16

    const/16 v30, 0x1

    goto :goto_16

    :cond_16
    const/16 v30, 0x0

    :goto_16
    move/from16 v56, v30

    .line 218
    .end local v1    # "_tmp_6":I
    .local v56, "_tmpRequiresDeviceIdle":Z
    :goto_17
    move/from16 v1, v21

    move/from16 v21, v5

    const/4 v5, -0x1

    .end local v5    # "_cursorIndexOfRequiresDeviceIdle":I
    .local v1, "_cursorIndexOfRequiresBatteryNotLow":I
    .local v21, "_cursorIndexOfRequiresDeviceIdle":I
    if-ne v1, v5, :cond_17

    .line 219
    const/4 v5, 0x0

    move/from16 v57, v5

    .local v5, "_tmpRequiresBatteryNotLow":Z
    goto :goto_19

    .line 222
    .end local v5    # "_tmpRequiresBatteryNotLow":Z
    :cond_17
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 223
    .local v5, "_tmp_7":I
    if-eqz v5, :cond_18

    const/16 v30, 0x1

    goto :goto_18

    :cond_18
    const/16 v30, 0x0

    :goto_18
    move/from16 v57, v30

    .line 226
    .end local v5    # "_tmp_7":I
    .local v57, "_tmpRequiresBatteryNotLow":Z
    :goto_19
    move/from16 v5, v22

    move/from16 v22, v1

    const/4 v1, -0x1

    .end local v1    # "_cursorIndexOfRequiresBatteryNotLow":I
    .local v5, "_cursorIndexOfRequiresStorageNotLow":I
    .local v22, "_cursorIndexOfRequiresBatteryNotLow":I
    if-ne v5, v1, :cond_19

    .line 227
    const/4 v1, 0x0

    move/from16 v58, v1

    .local v1, "_tmpRequiresStorageNotLow":Z
    goto :goto_1b

    .line 230
    .end local v1    # "_tmpRequiresStorageNotLow":Z
    :cond_19
    invoke-interface {v2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    .line 231
    .local v1, "_tmp_8":I
    if-eqz v1, :cond_1a

    const/16 v18, 0x1

    goto :goto_1a

    :cond_1a
    const/16 v18, 0x0

    :goto_1a
    move/from16 v58, v18

    .line 234
    .end local v1    # "_tmp_8":I
    .local v58, "_tmpRequiresStorageNotLow":Z
    :goto_1b
    move/from16 v18, v5

    move/from16 v1, v23

    const/4 v5, -0x1

    .end local v5    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v23    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v1, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v18, "_cursorIndexOfRequiresStorageNotLow":I
    if-ne v1, v5, :cond_1b

    .line 235
    const-wide/16 v29, 0x0

    move-wide/from16 v59, v29

    .local v29, "_tmpContentTriggerUpdateDelayMillis":J
    goto :goto_1c

    .line 237
    .end local v29    # "_tmpContentTriggerUpdateDelayMillis":J
    :cond_1b
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v29

    move-wide/from16 v59, v29

    .line 240
    .local v59, "_tmpContentTriggerUpdateDelayMillis":J
    :goto_1c
    move/from16 v23, v1

    move/from16 v1, v24

    .end local v24    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .local v1, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .restart local v23    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    if-ne v1, v5, :cond_1c

    .line 241
    const-wide/16 v29, 0x0

    move-wide/from16 v61, v29

    .local v29, "_tmpContentTriggerMaxDelayMillis":J
    goto :goto_1d

    .line 243
    .end local v29    # "_tmpContentTriggerMaxDelayMillis":J
    :cond_1c
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v29

    move-wide/from16 v61, v29

    .line 246
    .local v61, "_tmpContentTriggerMaxDelayMillis":J
    :goto_1d
    move/from16 v24, v1

    move/from16 v1, v25

    .end local v25    # "_cursorIndexOfContentUriTriggers":I
    .local v1, "_cursorIndexOfContentUriTriggers":I
    .restart local v24    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    if-ne v1, v5, :cond_1d

    .line 247
    const/16 v25, 0x0

    move-object/from16 v63, v25

    .local v25, "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    goto :goto_1e

    .line 250
    .end local v25    # "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    :cond_1d
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v25

    .line 251
    .local v25, "_tmp_9":[B
    sget-object v29, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v25 .. v25}, Landroidx/work/impl/model/WorkTypeConverters;->byteArrayToSetOfTriggers([B)Ljava/util/Set;

    move-result-object v29

    move-object/from16 v63, v29

    .line 253
    .end local v25    # "_tmp_9":[B
    .local v63, "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    :goto_1e
    new-instance v52, Landroidx/work/Constraints;

    invoke-direct/range {v52 .. v63}, Landroidx/work/Constraints;-><init>(Landroidx/work/impl/utils/NetworkRequestCompat;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    move-object/from16 v25, v53

    .end local v53    # "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    .local v25, "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    move-object/from16 v40, v52

    .line 256
    .local v40, "_tmpConstraints":Landroidx/work/Constraints;
    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v29

    move-object/from16 v64, v29

    .line 257
    .local v64, "_tmpKey_2":Ljava/lang/String;
    move-object/from16 v5, v64

    .end local v64    # "_tmpKey_2":Ljava/lang/String;
    .local v5, "_tmpKey_2":Ljava/lang/String;
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v30

    move-object/from16 v52, v30

    check-cast v52, Ljava/util/ArrayList;

    .line 260
    .local v52, "_tmpTagsCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v30

    move-object/from16 v64, v30

    .line 261
    .local v64, "_tmpKey_3":Ljava/lang/String;
    move/from16 v65, v0

    move-object/from16 v0, v64

    .end local v64    # "_tmpKey_3":Ljava/lang/String;
    .local v0, "_tmpKey_3":Ljava/lang/String;
    .local v65, "_cursorIndexOfId":I
    invoke-virtual {v3, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v30

    move-object/from16 v53, v30

    check-cast v53, Ljava/util/ArrayList;

    .line 262
    .local v53, "_tmpProgressCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/work/Data;>;"
    new-instance v30, Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;

    invoke-direct/range {v30 .. v53}, Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Landroidx/work/Data;JJJLandroidx/work/Constraints;ILandroidx/work/BackoffPolicy;JJIIJILjava/util/List;Ljava/util/List;)V

    move-object/from16 v64, v30

    .line 263
    .local v64, "_item":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    move-object/from16 v30, v0

    move-object/from16 v0, v64

    .end local v64    # "_item":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    .local v0, "_item":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    .local v30, "_tmpKey_3":Ljava/lang/String;
    invoke-interface {v15, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 264
    move/from16 v25, v1

    move/from16 v5, v19

    move/from16 v19, v20

    move/from16 v20, v21

    move/from16 v21, v22

    move/from16 v0, v65

    move-object/from16 v1, p0

    move/from16 v22, v18

    move/from16 v18, v14

    .end local v0    # "_item":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    .end local v5    # "_tmpKey_2":Ljava/lang/String;
    .end local v25    # "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    .end local v30    # "_tmpKey_3":Ljava/lang/String;
    .end local v31    # "_tmpId":Ljava/lang/String;
    .end local v32    # "_tmpState":Landroidx/work/WorkInfo$State;
    .end local v33    # "_tmpOutput":Landroidx/work/Data;
    .end local v34    # "_tmpInitialDelay":J
    .end local v36    # "_tmpIntervalDuration":J
    .end local v38    # "_tmpFlexDuration":J
    .end local v40    # "_tmpConstraints":Landroidx/work/Constraints;
    .end local v41    # "_tmpRunAttemptCount":I
    .end local v42    # "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    .end local v43    # "_tmpBackoffDelayDuration":J
    .end local v45    # "_tmpLastEnqueueTime":J
    .end local v47    # "_tmpPeriodCount":I
    .end local v48    # "_tmpGeneration":I
    .end local v49    # "_tmpNextScheduleTimeOverride":J
    .end local v51    # "_tmpStopReason":I
    .end local v52    # "_tmpTagsCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v53    # "_tmpProgressCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/work/Data;>;"
    .end local v54    # "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    .end local v55    # "_tmpRequiresCharging":Z
    .end local v56    # "_tmpRequiresDeviceIdle":Z
    .end local v57    # "_tmpRequiresBatteryNotLow":Z
    .end local v58    # "_tmpRequiresStorageNotLow":Z
    .end local v59    # "_tmpContentTriggerUpdateDelayMillis":J
    .end local v61    # "_tmpContentTriggerMaxDelayMillis":J
    .end local v63    # "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    goto/16 :goto_3

    .line 265
    .end local v1    # "_cursorIndexOfContentUriTriggers":I
    .end local v14    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v65    # "_cursorIndexOfId":I
    .local v0, "_cursorIndexOfId":I
    .local v5, "_cursorIndexOfState":I
    .local v18, "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v19, "_cursorIndexOfRequiresCharging":I
    .local v20, "_cursorIndexOfRequiresDeviceIdle":I
    .local v21, "_cursorIndexOfRequiresBatteryNotLow":I
    .local v22, "_cursorIndexOfRequiresStorageNotLow":I
    .local v25, "_cursorIndexOfContentUriTriggers":I
    :cond_1e
    nop

    .line 267
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 265
    return-object v15

    .line 267
    .end local v0    # "_cursorIndexOfId":I
    .end local v3    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .end local v4    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .end local v5    # "_cursorIndexOfState":I
    .end local v6    # "_cursorIndexOfOutput":I
    .end local v7    # "_cursorIndexOfInitialDelay":I
    .end local v8    # "_cursorIndexOfIntervalDuration":I
    .end local v9    # "_cursorIndexOfFlexDuration":I
    .end local v10    # "_cursorIndexOfRunAttemptCount":I
    .end local v11    # "_cursorIndexOfBackoffPolicy":I
    .end local v12    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v13    # "_cursorIndexOfLastEnqueueTime":I
    .end local v15    # "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;>;"
    .end local v16    # "_cursorIndexOfStopReason":I
    .end local v17    # "_cursorIndexOfRequiredNetworkType":I
    .end local v18    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v19    # "_cursorIndexOfRequiresCharging":I
    .end local v20    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v21    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v22    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v23    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v24    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v25    # "_cursorIndexOfContentUriTriggers":I
    .end local v26    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v27    # "_cursorIndexOfPeriodCount":I
    .end local v28    # "_cursorIndexOfGeneration":I
    :catchall_0
    move-exception v0

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 268
    throw v0
.end method

.method public getWorkInfoPojosFlow(Landroidx/sqlite/db/SupportSQLiteQuery;)Lkotlinx/coroutines/flow/Flow;
    .locals 5
    .param p1, "query"    # Landroidx/sqlite/db/SupportSQLiteQuery;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "query"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/sqlite/db/SupportSQLiteQuery;",
            ")",
            "Lkotlinx/coroutines/flow/Flow<",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;",
            ">;>;"
        }
    .end annotation

    .line 505
    iget-object v0, p0, Landroidx/work/impl/model/RawWorkInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "WorkTag"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    const-string v4, "WorkProgress"

    aput-object v4, v1, v2

    const/4 v2, 0x2

    const-string v4, "WorkSpec"

    aput-object v4, v1, v2

    new-instance v2, Landroidx/work/impl/model/RawWorkInfoDao_Impl$2;

    invoke-direct {v2, p0, p1}, Landroidx/work/impl/model/RawWorkInfoDao_Impl$2;-><init>(Landroidx/work/impl/model/RawWorkInfoDao_Impl;Landroidx/sqlite/db/SupportSQLiteQuery;)V

    invoke-static {v0, v3, v1, v2}, Landroidx/room/CoroutinesRoom;->createFlow(Landroidx/room/RoomDatabase;Z[Ljava/lang/String;Ljava/util/concurrent/Callable;)Lkotlinx/coroutines/flow/Flow;

    move-result-object v0

    return-object v0
.end method

.method public getWorkInfoPojosLiveData(Landroidx/sqlite/db/SupportSQLiteQuery;)Landroidx/lifecycle/LiveData;
    .locals 5
    .param p1, "query"    # Landroidx/sqlite/db/SupportSQLiteQuery;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "query"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/sqlite/db/SupportSQLiteQuery;",
            ")",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;",
            ">;>;"
        }
    .end annotation

    .line 274
    iget-object v0, p0, Landroidx/work/impl/model/RawWorkInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->getInvalidationTracker()Landroidx/room/InvalidationTracker;

    move-result-object v0

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "WorkTag"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    const-string v4, "WorkProgress"

    aput-object v4, v1, v2

    const/4 v2, 0x2

    const-string v4, "WorkSpec"

    aput-object v4, v1, v2

    new-instance v2, Landroidx/work/impl/model/RawWorkInfoDao_Impl$1;

    invoke-direct {v2, p0, p1}, Landroidx/work/impl/model/RawWorkInfoDao_Impl$1;-><init>(Landroidx/work/impl/model/RawWorkInfoDao_Impl;Landroidx/sqlite/db/SupportSQLiteQuery;)V

    invoke-virtual {v0, v1, v3, v2}, Landroidx/room/InvalidationTracker;->createLiveData([Ljava/lang/String;ZLjava/util/concurrent/Callable;)Landroidx/lifecycle/LiveData;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$__fetchRelationshipWorkProgressAsandroidxWorkData$1$androidx-work-impl-model-RawWorkInfoDao_Impl(Ljava/util/HashMap;)Lkotlin/Unit;
    .locals 1
    .param p1, "map"    # Ljava/util/HashMap;

    .line 794
    invoke-direct {p0, p1}, Landroidx/work/impl/model/RawWorkInfoDao_Impl;->__fetchRelationshipWorkProgressAsandroidxWorkData(Ljava/util/HashMap;)V

    .line 795
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method synthetic lambda$__fetchRelationshipWorkTagAsjavaLangString$0$androidx-work-impl-model-RawWorkInfoDao_Impl(Ljava/util/HashMap;)Lkotlin/Unit;
    .locals 1
    .param p1, "map"    # Ljava/util/HashMap;

    .line 747
    invoke-direct {p0, p1}, Landroidx/work/impl/model/RawWorkInfoDao_Impl;->__fetchRelationshipWorkTagAsjavaLangString(Ljava/util/HashMap;)V

    .line 748
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method
