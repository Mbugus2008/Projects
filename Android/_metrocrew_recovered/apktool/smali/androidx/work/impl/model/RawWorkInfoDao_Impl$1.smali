.class Landroidx/work/impl/model/RawWorkInfoDao_Impl$1;
.super Ljava/lang/Object;
.source "RawWorkInfoDao_Impl.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/work/impl/model/RawWorkInfoDao_Impl;->getWorkInfoPojosLiveData(Landroidx/sqlite/db/SupportSQLiteQuery;)Landroidx/lifecycle/LiveData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/util/List<",
        "Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/work/impl/model/RawWorkInfoDao_Impl;

.field final synthetic val$query:Landroidx/sqlite/db/SupportSQLiteQuery;


# direct methods
.method constructor <init>(Landroidx/work/impl/model/RawWorkInfoDao_Impl;Landroidx/sqlite/db/SupportSQLiteQuery;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/work/impl/model/RawWorkInfoDao_Impl;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$query"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 275
    iput-object p1, p0, Landroidx/work/impl/model/RawWorkInfoDao_Impl$1;->this$0:Landroidx/work/impl/model/RawWorkInfoDao_Impl;

    iput-object p2, p0, Landroidx/work/impl/model/RawWorkInfoDao_Impl$1;->val$query:Landroidx/sqlite/db/SupportSQLiteQuery;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 275
    invoke-virtual {p0}, Landroidx/work/impl/model/RawWorkInfoDao_Impl$1;->call()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/List;
    .locals 66
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 279
    move-object/from16 v1, p0

    iget-object v0, v1, Landroidx/work/impl/model/RawWorkInfoDao_Impl$1;->this$0:Landroidx/work/impl/model/RawWorkInfoDao_Impl;

    invoke-static {v0}, Landroidx/work/impl/model/RawWorkInfoDao_Impl;->access$000(Landroidx/work/impl/model/RawWorkInfoDao_Impl;)Landroidx/room/RoomDatabase;

    move-result-object v0

    iget-object v2, v1, Landroidx/work/impl/model/RawWorkInfoDao_Impl$1;->val$query:Landroidx/sqlite/db/SupportSQLiteQuery;

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v0, v2, v4, v3}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v2

    .line 281
    .local v2, "_cursor":Landroid/database/Cursor;
    :try_start_0
    const-string v0, "id"

    invoke-static {v2, v0}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v0

    .line 282
    .local v0, "_cursorIndexOfId":I
    const-string/jumbo v3, "state"

    invoke-static {v2, v3}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v3

    .line 283
    .local v3, "_cursorIndexOfState":I
    const-string v5, "output"

    invoke-static {v2, v5}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v5

    .line 284
    .local v5, "_cursorIndexOfOutput":I
    const-string v6, "initial_delay"

    invoke-static {v2, v6}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 285
    .local v6, "_cursorIndexOfInitialDelay":I
    const-string v7, "interval_duration"

    invoke-static {v2, v7}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v7

    .line 286
    .local v7, "_cursorIndexOfIntervalDuration":I
    const-string v8, "flex_duration"

    invoke-static {v2, v8}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v8

    .line 287
    .local v8, "_cursorIndexOfFlexDuration":I
    const-string v9, "run_attempt_count"

    invoke-static {v2, v9}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v9

    .line 288
    .local v9, "_cursorIndexOfRunAttemptCount":I
    const-string v10, "backoff_policy"

    invoke-static {v2, v10}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v10

    .line 289
    .local v10, "_cursorIndexOfBackoffPolicy":I
    const-string v11, "backoff_delay_duration"

    invoke-static {v2, v11}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v11

    .line 290
    .local v11, "_cursorIndexOfBackoffDelayDuration":I
    const-string v12, "last_enqueue_time"

    invoke-static {v2, v12}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v12

    .line 291
    .local v12, "_cursorIndexOfLastEnqueueTime":I
    const-string v13, "period_count"

    invoke-static {v2, v13}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v13

    .line 292
    .local v13, "_cursorIndexOfPeriodCount":I
    const-string v14, "generation"

    invoke-static {v2, v14}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v14

    .line 293
    .local v14, "_cursorIndexOfGeneration":I
    const-string v15, "next_schedule_time_override"

    invoke-static {v2, v15}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v15

    .line 294
    .local v15, "_cursorIndexOfNextScheduleTimeOverride":I
    const-string/jumbo v4, "stop_reason"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 295
    .local v4, "_cursorIndexOfStopReason":I
    move/from16 v16, v4

    .end local v4    # "_cursorIndexOfStopReason":I
    .local v16, "_cursorIndexOfStopReason":I
    const-string v4, "required_network_type"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 296
    .local v4, "_cursorIndexOfRequiredNetworkType":I
    move/from16 v17, v4

    .end local v4    # "_cursorIndexOfRequiredNetworkType":I
    .local v17, "_cursorIndexOfRequiredNetworkType":I
    const-string v4, "required_network_request"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 297
    .local v4, "_cursorIndexOfRequiredNetworkRequestCompat":I
    move/from16 v18, v4

    .end local v4    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v18, "_cursorIndexOfRequiredNetworkRequestCompat":I
    const-string v4, "requires_charging"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 298
    .local v4, "_cursorIndexOfRequiresCharging":I
    move/from16 v19, v4

    .end local v4    # "_cursorIndexOfRequiresCharging":I
    .local v19, "_cursorIndexOfRequiresCharging":I
    const-string v4, "requires_device_idle"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 299
    .local v4, "_cursorIndexOfRequiresDeviceIdle":I
    move/from16 v20, v4

    .end local v4    # "_cursorIndexOfRequiresDeviceIdle":I
    .local v20, "_cursorIndexOfRequiresDeviceIdle":I
    const-string v4, "requires_battery_not_low"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 300
    .local v4, "_cursorIndexOfRequiresBatteryNotLow":I
    move/from16 v21, v4

    .end local v4    # "_cursorIndexOfRequiresBatteryNotLow":I
    .local v21, "_cursorIndexOfRequiresBatteryNotLow":I
    const-string v4, "requires_storage_not_low"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 301
    .local v4, "_cursorIndexOfRequiresStorageNotLow":I
    move/from16 v22, v4

    .end local v4    # "_cursorIndexOfRequiresStorageNotLow":I
    .local v22, "_cursorIndexOfRequiresStorageNotLow":I
    const-string/jumbo v4, "trigger_content_update_delay"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 302
    .local v4, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    move/from16 v23, v4

    .end local v4    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v23, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    const-string/jumbo v4, "trigger_max_content_delay"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 303
    .local v4, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    move/from16 v24, v4

    .end local v4    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .local v24, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    const-string v4, "content_uri_triggers"

    invoke-static {v2, v4}, Landroidx/room/util/CursorUtil;->getColumnIndex(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 304
    .local v4, "_cursorIndexOfContentUriTriggers":I
    new-instance v25, Ljava/util/HashMap;

    invoke-direct/range {v25 .. v25}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v26, v25

    .line 305
    .local v26, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    new-instance v25, Ljava/util/HashMap;

    invoke-direct/range {v25 .. v25}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v27, v25

    .line 306
    .local v27, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v25

    if-eqz v25, :cond_2

    .line 308
    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v25

    move-object/from16 v28, v25

    .line 309
    .local v28, "_tmpKey":Ljava/lang/String;
    move/from16 v25, v4

    move-object/from16 v4, v26

    move/from16 v26, v15

    move-object/from16 v15, v28

    .end local v28    # "_tmpKey":Ljava/lang/String;
    .local v4, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v15, "_tmpKey":Ljava/lang/String;
    .local v25, "_cursorIndexOfContentUriTriggers":I
    .local v26, "_cursorIndexOfNextScheduleTimeOverride":I
    invoke-virtual {v4, v15}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v28

    if-nez v28, :cond_0

    .line 310
    move/from16 v28, v14

    .end local v14    # "_cursorIndexOfGeneration":I
    .local v28, "_cursorIndexOfGeneration":I
    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v4, v15, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 309
    .end local v28    # "_cursorIndexOfGeneration":I
    .restart local v14    # "_cursorIndexOfGeneration":I
    :cond_0
    move/from16 v28, v14

    .line 313
    .end local v14    # "_cursorIndexOfGeneration":I
    .restart local v28    # "_cursorIndexOfGeneration":I
    :goto_1
    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 314
    .local v14, "_tmpKey_1":Ljava/lang/String;
    move-object/from16 v29, v15

    move-object/from16 v15, v27

    .end local v27    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .local v15, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .local v29, "_tmpKey":Ljava/lang/String;
    invoke-virtual {v15, v14}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v27

    if-nez v27, :cond_1

    .line 315
    move/from16 v27, v13

    .end local v13    # "_cursorIndexOfPeriodCount":I
    .local v27, "_cursorIndexOfPeriodCount":I
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v15, v14, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 314
    .end local v27    # "_cursorIndexOfPeriodCount":I
    .restart local v13    # "_cursorIndexOfPeriodCount":I
    :cond_1
    move/from16 v27, v13

    .line 317
    .end local v13    # "_cursorIndexOfPeriodCount":I
    .end local v14    # "_tmpKey_1":Ljava/lang/String;
    .end local v29    # "_tmpKey":Ljava/lang/String;
    .restart local v27    # "_cursorIndexOfPeriodCount":I
    :goto_2
    move/from16 v13, v27

    move/from16 v14, v28

    move-object/from16 v27, v15

    move/from16 v15, v26

    move-object/from16 v26, v4

    move/from16 v4, v25

    goto :goto_0

    .line 318
    .end local v25    # "_cursorIndexOfContentUriTriggers":I
    .end local v28    # "_cursorIndexOfGeneration":I
    .local v4, "_cursorIndexOfContentUriTriggers":I
    .restart local v13    # "_cursorIndexOfPeriodCount":I
    .local v14, "_cursorIndexOfGeneration":I
    .local v15, "_cursorIndexOfNextScheduleTimeOverride":I
    .local v26, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v27, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :cond_2
    move/from16 v25, v4

    move/from16 v28, v14

    move-object/from16 v4, v26

    move/from16 v26, v15

    move-object/from16 v15, v27

    move/from16 v27, v13

    .end local v13    # "_cursorIndexOfPeriodCount":I
    .end local v14    # "_cursorIndexOfGeneration":I
    .local v4, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v15, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .restart local v25    # "_cursorIndexOfContentUriTriggers":I
    .local v26, "_cursorIndexOfNextScheduleTimeOverride":I
    .local v27, "_cursorIndexOfPeriodCount":I
    .restart local v28    # "_cursorIndexOfGeneration":I
    const/4 v13, -0x1

    invoke-interface {v2, v13}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 319
    iget-object v14, v1, Landroidx/work/impl/model/RawWorkInfoDao_Impl$1;->this$0:Landroidx/work/impl/model/RawWorkInfoDao_Impl;

    invoke-static {v14, v4}, Landroidx/work/impl/model/RawWorkInfoDao_Impl;->access$100(Landroidx/work/impl/model/RawWorkInfoDao_Impl;Ljava/util/HashMap;)V

    .line 320
    iget-object v14, v1, Landroidx/work/impl/model/RawWorkInfoDao_Impl$1;->this$0:Landroidx/work/impl/model/RawWorkInfoDao_Impl;

    invoke-static {v14, v15}, Landroidx/work/impl/model/RawWorkInfoDao_Impl;->access$200(Landroidx/work/impl/model/RawWorkInfoDao_Impl;Ljava/util/HashMap;)V

    .line 321
    new-instance v14, Ljava/util/ArrayList;

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v13

    invoke-direct {v14, v13}, Ljava/util/ArrayList;-><init>(I)V

    .line 322
    .local v14, "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;>;"
    :goto_3
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v13

    if-eqz v13, :cond_1e

    .line 325
    const/4 v13, -0x1

    if-ne v0, v13, :cond_3

    .line 326
    const/16 v29, 0x0

    move-object/from16 v31, v29

    .local v29, "_tmpId":Ljava/lang/String;
    goto :goto_4

    .line 328
    .end local v29    # "_tmpId":Ljava/lang/String;
    :cond_3
    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v29

    move-object/from16 v31, v29

    .line 331
    .local v31, "_tmpId":Ljava/lang/String;
    :goto_4
    if-ne v3, v13, :cond_4

    .line 332
    const/4 v13, 0x0

    move-object/from16 v32, v13

    .local v13, "_tmpState":Landroidx/work/WorkInfo$State;
    goto :goto_5

    .line 335
    .end local v13    # "_tmpState":Landroidx/work/WorkInfo$State;
    :cond_4
    invoke-interface {v2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v13

    .line 336
    .local v13, "_tmp":I
    sget-object v30, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v13}, Landroidx/work/impl/model/WorkTypeConverters;->intToState(I)Landroidx/work/WorkInfo$State;

    move-result-object v30

    move-object/from16 v32, v30

    .line 339
    .end local v13    # "_tmp":I
    .local v32, "_tmpState":Landroidx/work/WorkInfo$State;
    :goto_5
    const/4 v13, -0x1

    if-ne v5, v13, :cond_5

    .line 340
    const/4 v13, 0x0

    move-object/from16 v33, v13

    .local v13, "_tmpOutput":Landroidx/work/Data;
    goto :goto_6

    .line 343
    .end local v13    # "_tmpOutput":Landroidx/work/Data;
    :cond_5
    invoke-interface {v2, v5}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v13

    .line 344
    .local v13, "_tmp_1":[B
    invoke-static {v13}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v30

    move-object/from16 v33, v30

    .line 347
    .end local v13    # "_tmp_1":[B
    .local v33, "_tmpOutput":Landroidx/work/Data;
    :goto_6
    const/4 v13, -0x1

    if-ne v6, v13, :cond_6

    .line 348
    const-wide/16 v29, 0x0

    move-wide/from16 v34, v29

    .local v29, "_tmpInitialDelay":J
    goto :goto_7

    .line 350
    .end local v29    # "_tmpInitialDelay":J
    :cond_6
    invoke-interface {v2, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v29

    move-wide/from16 v34, v29

    .line 353
    .local v34, "_tmpInitialDelay":J
    :goto_7
    if-ne v7, v13, :cond_7

    .line 354
    const-wide/16 v29, 0x0

    move-wide/from16 v36, v29

    .local v29, "_tmpIntervalDuration":J
    goto :goto_8

    .line 356
    .end local v29    # "_tmpIntervalDuration":J
    :cond_7
    invoke-interface {v2, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v29

    move-wide/from16 v36, v29

    .line 359
    .local v36, "_tmpIntervalDuration":J
    :goto_8
    if-ne v8, v13, :cond_8

    .line 360
    const-wide/16 v29, 0x0

    move-wide/from16 v38, v29

    .local v29, "_tmpFlexDuration":J
    goto :goto_9

    .line 362
    .end local v29    # "_tmpFlexDuration":J
    :cond_8
    invoke-interface {v2, v8}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v29

    move-wide/from16 v38, v29

    .line 365
    .local v38, "_tmpFlexDuration":J
    :goto_9
    if-ne v9, v13, :cond_9

    .line 366
    const/16 v29, 0x0

    move/from16 v41, v29

    .local v29, "_tmpRunAttemptCount":I
    goto :goto_a

    .line 368
    .end local v29    # "_tmpRunAttemptCount":I
    :cond_9
    invoke-interface {v2, v9}, Landroid/database/Cursor;->getInt(I)I

    move-result v29

    move/from16 v41, v29

    .line 371
    .local v41, "_tmpRunAttemptCount":I
    :goto_a
    if-ne v10, v13, :cond_a

    .line 372
    const/4 v13, 0x0

    move-object/from16 v42, v13

    .local v13, "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    goto :goto_b

    .line 375
    .end local v13    # "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    :cond_a
    invoke-interface {v2, v10}, Landroid/database/Cursor;->getInt(I)I

    move-result v13

    .line 376
    .local v13, "_tmp_2":I
    sget-object v30, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v13}, Landroidx/work/impl/model/WorkTypeConverters;->intToBackoffPolicy(I)Landroidx/work/BackoffPolicy;

    move-result-object v30

    move-object/from16 v42, v30

    .line 379
    .end local v13    # "_tmp_2":I
    .local v42, "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    :goto_b
    const/4 v13, -0x1

    if-ne v11, v13, :cond_b

    .line 380
    const-wide/16 v29, 0x0

    move-wide/from16 v43, v29

    .local v29, "_tmpBackoffDelayDuration":J
    goto :goto_c

    .line 382
    .end local v29    # "_tmpBackoffDelayDuration":J
    :cond_b
    invoke-interface {v2, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v29

    move-wide/from16 v43, v29

    .line 385
    .local v43, "_tmpBackoffDelayDuration":J
    :goto_c
    if-ne v12, v13, :cond_c

    .line 386
    const-wide/16 v29, 0x0

    move-wide/from16 v45, v29

    .local v29, "_tmpLastEnqueueTime":J
    goto :goto_d

    .line 388
    .end local v29    # "_tmpLastEnqueueTime":J
    :cond_c
    invoke-interface {v2, v12}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v29

    move-wide/from16 v45, v29

    .line 391
    .local v45, "_tmpLastEnqueueTime":J
    :goto_d
    move/from16 v1, v27

    .end local v27    # "_cursorIndexOfPeriodCount":I
    .local v1, "_cursorIndexOfPeriodCount":I
    if-ne v1, v13, :cond_d

    .line 392
    const/16 v27, 0x0

    move/from16 v47, v27

    .local v27, "_tmpPeriodCount":I
    goto :goto_e

    .line 394
    .end local v27    # "_tmpPeriodCount":I
    :cond_d
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v27

    move/from16 v47, v27

    .line 397
    .local v47, "_tmpPeriodCount":I
    :goto_e
    move/from16 v27, v1

    move/from16 v1, v28

    .end local v28    # "_cursorIndexOfGeneration":I
    .local v1, "_cursorIndexOfGeneration":I
    .local v27, "_cursorIndexOfPeriodCount":I
    if-ne v1, v13, :cond_e

    .line 398
    const/16 v28, 0x0

    move/from16 v48, v28

    .local v28, "_tmpGeneration":I
    goto :goto_f

    .line 400
    .end local v28    # "_tmpGeneration":I
    :cond_e
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v28

    move/from16 v48, v28

    .line 403
    .local v48, "_tmpGeneration":I
    :goto_f
    move/from16 v28, v1

    move/from16 v1, v26

    .end local v26    # "_cursorIndexOfNextScheduleTimeOverride":I
    .local v1, "_cursorIndexOfNextScheduleTimeOverride":I
    .local v28, "_cursorIndexOfGeneration":I
    if-ne v1, v13, :cond_f

    .line 404
    const-wide/16 v29, 0x0

    move-wide/from16 v49, v29

    .local v29, "_tmpNextScheduleTimeOverride":J
    goto :goto_10

    .line 406
    .end local v29    # "_tmpNextScheduleTimeOverride":J
    :cond_f
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v29

    move-wide/from16 v49, v29

    .line 409
    .local v49, "_tmpNextScheduleTimeOverride":J
    :goto_10
    move/from16 v26, v1

    move/from16 v1, v16

    .end local v16    # "_cursorIndexOfStopReason":I
    .local v1, "_cursorIndexOfStopReason":I
    .restart local v26    # "_cursorIndexOfNextScheduleTimeOverride":I
    if-ne v1, v13, :cond_10

    .line 410
    const/16 v16, 0x0

    move/from16 v51, v16

    .local v16, "_tmpStopReason":I
    goto :goto_11

    .line 412
    .end local v16    # "_tmpStopReason":I
    :cond_10
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v16

    move/from16 v51, v16

    .line 416
    .local v51, "_tmpStopReason":I
    :goto_11
    move/from16 v16, v1

    move/from16 v1, v17

    .end local v17    # "_cursorIndexOfRequiredNetworkType":I
    .local v1, "_cursorIndexOfRequiredNetworkType":I
    .local v16, "_cursorIndexOfStopReason":I
    if-ne v1, v13, :cond_11

    .line 417
    const/4 v13, 0x0

    move-object/from16 v54, v13

    .local v13, "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    goto :goto_12

    .line 420
    .end local v13    # "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    :cond_11
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v13

    .line 421
    .local v13, "_tmp_3":I
    sget-object v17, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v13}, Landroidx/work/impl/model/WorkTypeConverters;->intToNetworkType(I)Landroidx/work/NetworkType;

    move-result-object v17

    move-object/from16 v54, v17

    .line 424
    .end local v13    # "_tmp_3":I
    .local v54, "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    :goto_12
    move/from16 v17, v1

    move/from16 v13, v18

    const/4 v1, -0x1

    .end local v1    # "_cursorIndexOfRequiredNetworkType":I
    .end local v18    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v13, "_cursorIndexOfRequiredNetworkRequestCompat":I
    .restart local v17    # "_cursorIndexOfRequiredNetworkType":I
    if-ne v13, v1, :cond_12

    .line 425
    const/4 v1, 0x0

    move-object/from16 v53, v1

    .local v1, "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    goto :goto_13

    .line 428
    .end local v1    # "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    :cond_12
    invoke-interface {v2, v13}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v1

    .line 429
    .local v1, "_tmp_4":[B
    sget-object v18, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v1}, Landroidx/work/impl/model/WorkTypeConverters;->toNetworkRequest$work_runtime_release([B)Landroidx/work/impl/utils/NetworkRequestCompat;

    move-result-object v18

    move-object/from16 v53, v18

    .line 432
    .end local v1    # "_tmp_4":[B
    .local v53, "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    :goto_13
    move/from16 v1, v19

    move/from16 v19, v3

    const/4 v3, -0x1

    .end local v3    # "_cursorIndexOfState":I
    .local v1, "_cursorIndexOfRequiresCharging":I
    .local v19, "_cursorIndexOfState":I
    if-ne v1, v3, :cond_13

    .line 433
    const/4 v3, 0x0

    move/from16 v55, v3

    .local v3, "_tmpRequiresCharging":Z
    goto :goto_15

    .line 436
    .end local v3    # "_tmpRequiresCharging":Z
    :cond_13
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    .line 437
    .local v3, "_tmp_5":I
    if-eqz v3, :cond_14

    const/16 v30, 0x1

    goto :goto_14

    :cond_14
    const/16 v30, 0x0

    :goto_14
    move/from16 v55, v30

    .line 440
    .end local v3    # "_tmp_5":I
    .local v55, "_tmpRequiresCharging":Z
    :goto_15
    move/from16 v3, v20

    move/from16 v20, v1

    const/4 v1, -0x1

    .end local v1    # "_cursorIndexOfRequiresCharging":I
    .local v3, "_cursorIndexOfRequiresDeviceIdle":I
    .local v20, "_cursorIndexOfRequiresCharging":I
    if-ne v3, v1, :cond_15

    .line 441
    const/4 v1, 0x0

    move/from16 v56, v1

    .local v1, "_tmpRequiresDeviceIdle":Z
    goto :goto_17

    .line 444
    .end local v1    # "_tmpRequiresDeviceIdle":Z
    :cond_15
    invoke-interface {v2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    .line 445
    .local v1, "_tmp_6":I
    if-eqz v1, :cond_16

    const/16 v30, 0x1

    goto :goto_16

    :cond_16
    const/16 v30, 0x0

    :goto_16
    move/from16 v56, v30

    .line 448
    .end local v1    # "_tmp_6":I
    .local v56, "_tmpRequiresDeviceIdle":Z
    :goto_17
    move/from16 v1, v21

    move/from16 v21, v3

    const/4 v3, -0x1

    .end local v3    # "_cursorIndexOfRequiresDeviceIdle":I
    .local v1, "_cursorIndexOfRequiresBatteryNotLow":I
    .local v21, "_cursorIndexOfRequiresDeviceIdle":I
    if-ne v1, v3, :cond_17

    .line 449
    const/4 v3, 0x0

    move/from16 v57, v3

    .local v3, "_tmpRequiresBatteryNotLow":Z
    goto :goto_19

    .line 452
    .end local v3    # "_tmpRequiresBatteryNotLow":Z
    :cond_17
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    .line 453
    .local v3, "_tmp_7":I
    if-eqz v3, :cond_18

    const/16 v30, 0x1

    goto :goto_18

    :cond_18
    const/16 v30, 0x0

    :goto_18
    move/from16 v57, v30

    .line 456
    .end local v3    # "_tmp_7":I
    .local v57, "_tmpRequiresBatteryNotLow":Z
    :goto_19
    move/from16 v3, v22

    move/from16 v22, v1

    const/4 v1, -0x1

    .end local v1    # "_cursorIndexOfRequiresBatteryNotLow":I
    .local v3, "_cursorIndexOfRequiresStorageNotLow":I
    .local v22, "_cursorIndexOfRequiresBatteryNotLow":I
    if-ne v3, v1, :cond_19

    .line 457
    const/4 v1, 0x0

    move/from16 v58, v1

    .local v1, "_tmpRequiresStorageNotLow":Z
    goto :goto_1b

    .line 460
    .end local v1    # "_tmpRequiresStorageNotLow":Z
    :cond_19
    invoke-interface {v2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    .line 461
    .local v1, "_tmp_8":I
    if-eqz v1, :cond_1a

    const/16 v18, 0x1

    goto :goto_1a

    :cond_1a
    const/16 v18, 0x0

    :goto_1a
    move/from16 v58, v18

    .line 464
    .end local v1    # "_tmp_8":I
    .local v58, "_tmpRequiresStorageNotLow":Z
    :goto_1b
    move/from16 v18, v3

    move/from16 v1, v23

    const/4 v3, -0x1

    .end local v3    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v23    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v1, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .local v18, "_cursorIndexOfRequiresStorageNotLow":I
    if-ne v1, v3, :cond_1b

    .line 465
    const-wide/16 v29, 0x0

    move-wide/from16 v59, v29

    .local v29, "_tmpContentTriggerUpdateDelayMillis":J
    goto :goto_1c

    .line 467
    .end local v29    # "_tmpContentTriggerUpdateDelayMillis":J
    :cond_1b
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v29

    move-wide/from16 v59, v29

    .line 470
    .local v59, "_tmpContentTriggerUpdateDelayMillis":J
    :goto_1c
    move/from16 v23, v1

    move/from16 v1, v24

    .end local v24    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .local v1, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .restart local v23    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    if-ne v1, v3, :cond_1c

    .line 471
    const-wide/16 v29, 0x0

    move-wide/from16 v61, v29

    .local v29, "_tmpContentTriggerMaxDelayMillis":J
    goto :goto_1d

    .line 473
    .end local v29    # "_tmpContentTriggerMaxDelayMillis":J
    :cond_1c
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v29

    move-wide/from16 v61, v29

    .line 476
    .local v61, "_tmpContentTriggerMaxDelayMillis":J
    :goto_1d
    move/from16 v24, v1

    move/from16 v1, v25

    .end local v25    # "_cursorIndexOfContentUriTriggers":I
    .local v1, "_cursorIndexOfContentUriTriggers":I
    .restart local v24    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    if-ne v1, v3, :cond_1d

    .line 477
    const/16 v25, 0x0

    move-object/from16 v63, v25

    .local v25, "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    goto :goto_1e

    .line 480
    .end local v25    # "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    :cond_1d
    invoke-interface {v2, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v25

    .line 481
    .local v25, "_tmp_9":[B
    sget-object v29, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v25 .. v25}, Landroidx/work/impl/model/WorkTypeConverters;->byteArrayToSetOfTriggers([B)Ljava/util/Set;

    move-result-object v29

    move-object/from16 v63, v29

    .line 483
    .end local v25    # "_tmp_9":[B
    .local v63, "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    :goto_1e
    new-instance v52, Landroidx/work/Constraints;

    invoke-direct/range {v52 .. v63}, Landroidx/work/Constraints;-><init>(Landroidx/work/impl/utils/NetworkRequestCompat;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    move-object/from16 v25, v53

    .end local v53    # "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    .local v25, "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    move-object/from16 v40, v52

    .line 486
    .local v40, "_tmpConstraints":Landroidx/work/Constraints;
    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v29

    move-object/from16 v64, v29

    .line 487
    .local v64, "_tmpKey_2":Ljava/lang/String;
    move-object/from16 v3, v64

    .end local v64    # "_tmpKey_2":Ljava/lang/String;
    .local v3, "_tmpKey_2":Ljava/lang/String;
    invoke-virtual {v4, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v30

    move-object/from16 v52, v30

    check-cast v52, Ljava/util/ArrayList;

    .line 490
    .local v52, "_tmpTagsCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v30

    move-object/from16 v64, v30

    .line 491
    .local v64, "_tmpKey_3":Ljava/lang/String;
    move/from16 v65, v0

    move-object/from16 v0, v64

    .end local v64    # "_tmpKey_3":Ljava/lang/String;
    .local v0, "_tmpKey_3":Ljava/lang/String;
    .local v65, "_cursorIndexOfId":I
    invoke-virtual {v15, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v30

    move-object/from16 v53, v30

    check-cast v53, Ljava/util/ArrayList;

    .line 492
    .local v53, "_tmpProgressCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/work/Data;>;"
    new-instance v30, Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;

    invoke-direct/range {v30 .. v53}, Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Landroidx/work/Data;JJJLandroidx/work/Constraints;ILandroidx/work/BackoffPolicy;JJIIJILjava/util/List;Ljava/util/List;)V

    move-object/from16 v64, v30

    .line 493
    .local v64, "_item":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    move-object/from16 v30, v0

    move-object/from16 v0, v64

    .end local v64    # "_item":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    .local v0, "_item":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    .local v30, "_tmpKey_3":Ljava/lang/String;
    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 494
    move/from16 v25, v1

    move/from16 v3, v19

    move/from16 v19, v20

    move/from16 v20, v21

    move/from16 v21, v22

    move/from16 v0, v65

    move-object/from16 v1, p0

    move/from16 v22, v18

    move/from16 v18, v13

    .end local v0    # "_item":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    .end local v3    # "_tmpKey_2":Ljava/lang/String;
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

    .line 495
    .end local v1    # "_cursorIndexOfContentUriTriggers":I
    .end local v13    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v65    # "_cursorIndexOfId":I
    .local v0, "_cursorIndexOfId":I
    .local v3, "_cursorIndexOfState":I
    .local v18, "_cursorIndexOfRequiredNetworkRequestCompat":I
    .local v19, "_cursorIndexOfRequiresCharging":I
    .local v20, "_cursorIndexOfRequiresDeviceIdle":I
    .local v21, "_cursorIndexOfRequiresBatteryNotLow":I
    .local v22, "_cursorIndexOfRequiresStorageNotLow":I
    .local v25, "_cursorIndexOfContentUriTriggers":I
    :cond_1e
    nop

    .line 497
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 495
    return-object v14

    .line 497
    .end local v0    # "_cursorIndexOfId":I
    .end local v3    # "_cursorIndexOfState":I
    .end local v4    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .end local v5    # "_cursorIndexOfOutput":I
    .end local v6    # "_cursorIndexOfInitialDelay":I
    .end local v7    # "_cursorIndexOfIntervalDuration":I
    .end local v8    # "_cursorIndexOfFlexDuration":I
    .end local v9    # "_cursorIndexOfRunAttemptCount":I
    .end local v10    # "_cursorIndexOfBackoffPolicy":I
    .end local v11    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v12    # "_cursorIndexOfLastEnqueueTime":I
    .end local v14    # "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;>;"
    .end local v15    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
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

    .line 498
    throw v0
.end method
