.class Landroidx/work/impl/model/WorkSpecDao_Impl$1;
.super Landroidx/room/EntityInsertionAdapter;
.source "WorkSpecDao_Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/work/impl/model/WorkSpecDao_Impl;-><init>(Landroidx/room/RoomDatabase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/room/EntityInsertionAdapter<",
        "Landroidx/work/impl/model/WorkSpec;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/work/impl/model/WorkSpecDao_Impl;


# direct methods
.method constructor <init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomDatabase;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/work/impl/model/WorkSpecDao_Impl;
    .param p2, "database"    # Landroidx/room/RoomDatabase;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            "this$0",
            "database"
        }
    .end annotation

    .line 85
    iput-object p1, p0, Landroidx/work/impl/model/WorkSpecDao_Impl$1;->this$0:Landroidx/work/impl/model/WorkSpecDao_Impl;

    invoke-direct {p0, p2}, Landroidx/room/EntityInsertionAdapter;-><init>(Landroidx/room/RoomDatabase;)V

    return-void
.end method


# virtual methods
.method protected bind(Landroidx/sqlite/db/SupportSQLiteStatement;Landroidx/work/impl/model/WorkSpec;)V
    .locals 17
    .param p1, "statement"    # Landroidx/sqlite/db/SupportSQLiteStatement;
    .param p2, "entity"    # Landroidx/work/impl/model/WorkSpec;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "statement",
            "entity"
        }
    .end annotation

    .line 95
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    const/4 v2, 0x1

    iget-object v3, v1, Landroidx/work/impl/model/WorkSpec;->id:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 96
    sget-object v2, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    iget-object v2, v1, Landroidx/work/impl/model/WorkSpec;->state:Landroidx/work/WorkInfo$State;

    invoke-static {v2}, Landroidx/work/impl/model/WorkTypeConverters;->stateToInt(Landroidx/work/WorkInfo$State;)I

    move-result v2

    .line 97
    .local v2, "_tmp":I
    const/4 v3, 0x2

    int-to-long v4, v2

    invoke-interface {v0, v3, v4, v5}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 98
    const/4 v3, 0x3

    iget-object v4, v1, Landroidx/work/impl/model/WorkSpec;->workerClassName:Ljava/lang/String;

    invoke-interface {v0, v3, v4}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 99
    const/4 v3, 0x4

    iget-object v4, v1, Landroidx/work/impl/model/WorkSpec;->inputMergerClassName:Ljava/lang/String;

    invoke-interface {v0, v3, v4}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 100
    iget-object v3, v1, Landroidx/work/impl/model/WorkSpec;->input:Landroidx/work/Data;

    invoke-static {v3}, Landroidx/work/Data;->toByteArrayInternalV1(Landroidx/work/Data;)[B

    move-result-object v3

    .line 101
    .local v3, "_tmp_1":[B
    const/4 v4, 0x5

    invoke-interface {v0, v4, v3}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindBlob(I[B)V

    .line 102
    iget-object v4, v1, Landroidx/work/impl/model/WorkSpec;->output:Landroidx/work/Data;

    invoke-static {v4}, Landroidx/work/Data;->toByteArrayInternalV1(Landroidx/work/Data;)[B

    move-result-object v4

    .line 103
    .local v4, "_tmp_2":[B
    const/4 v5, 0x6

    invoke-interface {v0, v5, v4}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindBlob(I[B)V

    .line 104
    const/4 v5, 0x7

    iget-wide v6, v1, Landroidx/work/impl/model/WorkSpec;->initialDelay:J

    invoke-interface {v0, v5, v6, v7}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 105
    const/16 v5, 0x8

    iget-wide v6, v1, Landroidx/work/impl/model/WorkSpec;->intervalDuration:J

    invoke-interface {v0, v5, v6, v7}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 106
    const/16 v5, 0x9

    iget-wide v6, v1, Landroidx/work/impl/model/WorkSpec;->flexDuration:J

    invoke-interface {v0, v5, v6, v7}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 107
    iget v5, v1, Landroidx/work/impl/model/WorkSpec;->runAttemptCount:I

    int-to-long v5, v5

    const/16 v7, 0xa

    invoke-interface {v0, v7, v5, v6}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 108
    sget-object v5, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    iget-object v5, v1, Landroidx/work/impl/model/WorkSpec;->backoffPolicy:Landroidx/work/BackoffPolicy;

    invoke-static {v5}, Landroidx/work/impl/model/WorkTypeConverters;->backoffPolicyToInt(Landroidx/work/BackoffPolicy;)I

    move-result v5

    .line 109
    .local v5, "_tmp_3":I
    const/16 v6, 0xb

    int-to-long v7, v5

    invoke-interface {v0, v6, v7, v8}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 110
    const/16 v6, 0xc

    iget-wide v7, v1, Landroidx/work/impl/model/WorkSpec;->backoffDelayDuration:J

    invoke-interface {v0, v6, v7, v8}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 111
    const/16 v6, 0xd

    iget-wide v7, v1, Landroidx/work/impl/model/WorkSpec;->lastEnqueueTime:J

    invoke-interface {v0, v6, v7, v8}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 112
    const/16 v6, 0xe

    iget-wide v7, v1, Landroidx/work/impl/model/WorkSpec;->minimumRetentionDuration:J

    invoke-interface {v0, v6, v7, v8}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 113
    const/16 v6, 0xf

    iget-wide v7, v1, Landroidx/work/impl/model/WorkSpec;->scheduleRequestedAt:J

    invoke-interface {v0, v6, v7, v8}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 114
    iget-boolean v6, v1, Landroidx/work/impl/model/WorkSpec;->expedited:Z

    .line 115
    .local v6, "_tmp_4":I
    const/16 v7, 0x10

    int-to-long v8, v6

    invoke-interface {v0, v7, v8, v9}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 116
    sget-object v7, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    iget-object v7, v1, Landroidx/work/impl/model/WorkSpec;->outOfQuotaPolicy:Landroidx/work/OutOfQuotaPolicy;

    invoke-static {v7}, Landroidx/work/impl/model/WorkTypeConverters;->outOfQuotaPolicyToInt(Landroidx/work/OutOfQuotaPolicy;)I

    move-result v7

    .line 117
    .local v7, "_tmp_5":I
    const/16 v8, 0x11

    int-to-long v9, v7

    invoke-interface {v0, v8, v9, v10}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 118
    invoke-virtual {v1}, Landroidx/work/impl/model/WorkSpec;->getPeriodCount()I

    move-result v8

    int-to-long v8, v8

    const/16 v10, 0x12

    invoke-interface {v0, v10, v8, v9}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 119
    invoke-virtual {v1}, Landroidx/work/impl/model/WorkSpec;->getGeneration()I

    move-result v8

    int-to-long v8, v8

    const/16 v10, 0x13

    invoke-interface {v0, v10, v8, v9}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 120
    const/16 v8, 0x14

    invoke-virtual {v1}, Landroidx/work/impl/model/WorkSpec;->getNextScheduleTimeOverride()J

    move-result-wide v9

    invoke-interface {v0, v8, v9, v10}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 121
    invoke-virtual {v1}, Landroidx/work/impl/model/WorkSpec;->getNextScheduleTimeOverrideGeneration()I

    move-result v8

    int-to-long v8, v8

    const/16 v10, 0x15

    invoke-interface {v0, v10, v8, v9}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 122
    invoke-virtual {v1}, Landroidx/work/impl/model/WorkSpec;->getStopReason()I

    move-result v8

    int-to-long v8, v8

    const/16 v10, 0x16

    invoke-interface {v0, v10, v8, v9}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 123
    invoke-virtual {v1}, Landroidx/work/impl/model/WorkSpec;->getTraceTag()Ljava/lang/String;

    move-result-object v8

    const/16 v9, 0x17

    if-nez v8, :cond_0

    .line 124
    invoke-interface {v0, v9}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 126
    :cond_0
    invoke-virtual {v1}, Landroidx/work/impl/model/WorkSpec;->getTraceTag()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v0, v9, v8}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 128
    :goto_0
    iget-object v8, v1, Landroidx/work/impl/model/WorkSpec;->constraints:Landroidx/work/Constraints;

    .line 129
    .local v8, "_tmpConstraints":Landroidx/work/Constraints;
    sget-object v9, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-virtual {v8}, Landroidx/work/Constraints;->getRequiredNetworkType()Landroidx/work/NetworkType;

    move-result-object v9

    invoke-static {v9}, Landroidx/work/impl/model/WorkTypeConverters;->networkTypeToInt(Landroidx/work/NetworkType;)I

    move-result v9

    .line 130
    .local v9, "_tmp_6":I
    const/16 v10, 0x18

    int-to-long v11, v9

    invoke-interface {v0, v10, v11, v12}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 131
    sget-object v10, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-virtual {v8}, Landroidx/work/Constraints;->getRequiredNetworkRequestCompat$work_runtime_release()Landroidx/work/impl/utils/NetworkRequestCompat;

    move-result-object v10

    invoke-static {v10}, Landroidx/work/impl/model/WorkTypeConverters;->fromNetworkRequest$work_runtime_release(Landroidx/work/impl/utils/NetworkRequestCompat;)[B

    move-result-object v10

    .line 132
    .local v10, "_tmp_7":[B
    const/16 v11, 0x19

    invoke-interface {v0, v11, v10}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindBlob(I[B)V

    .line 133
    invoke-virtual {v8}, Landroidx/work/Constraints;->requiresCharging()Z

    move-result v11

    .line 134
    .local v11, "_tmp_8":I
    const/16 v12, 0x1a

    int-to-long v13, v11

    invoke-interface {v0, v12, v13, v14}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 135
    invoke-virtual {v8}, Landroidx/work/Constraints;->requiresDeviceIdle()Z

    move-result v12

    .line 136
    .local v12, "_tmp_9":I
    const/16 v13, 0x1b

    int-to-long v14, v12

    invoke-interface {v0, v13, v14, v15}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 137
    invoke-virtual {v8}, Landroidx/work/Constraints;->requiresBatteryNotLow()Z

    move-result v13

    .line 138
    .local v13, "_tmp_10":I
    const/16 v14, 0x1c

    move v15, v2

    .end local v2    # "_tmp":I
    .local v15, "_tmp":I
    int-to-long v1, v13

    invoke-interface {v0, v14, v1, v2}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 139
    invoke-virtual {v8}, Landroidx/work/Constraints;->requiresStorageNotLow()Z

    move-result v1

    .line 140
    .local v1, "_tmp_11":I
    const/16 v2, 0x1d

    move-object v14, v3

    move-object/from16 v16, v4

    .end local v3    # "_tmp_1":[B
    .end local v4    # "_tmp_2":[B
    .local v14, "_tmp_1":[B
    .local v16, "_tmp_2":[B
    int-to-long v3, v1

    invoke-interface {v0, v2, v3, v4}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 141
    const/16 v2, 0x1e

    invoke-virtual {v8}, Landroidx/work/Constraints;->getContentTriggerUpdateDelayMillis()J

    move-result-wide v3

    invoke-interface {v0, v2, v3, v4}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 142
    const/16 v2, 0x1f

    invoke-virtual {v8}, Landroidx/work/Constraints;->getContentTriggerMaxDelayMillis()J

    move-result-wide v3

    invoke-interface {v0, v2, v3, v4}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 143
    sget-object v2, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-virtual {v8}, Landroidx/work/Constraints;->getContentUriTriggers()Ljava/util/Set;

    move-result-object v2

    invoke-static {v2}, Landroidx/work/impl/model/WorkTypeConverters;->setOfTriggersToByteArray(Ljava/util/Set;)[B

    move-result-object v2

    .line 144
    .local v2, "_tmp_12":[B
    const/16 v3, 0x20

    invoke-interface {v0, v3, v2}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindBlob(I[B)V

    .line 145
    return-void
.end method

.method protected bridge synthetic bind(Landroidx/sqlite/db/SupportSQLiteStatement;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x1010
        }
        names = {
            "statement",
            "entity"
        }
    .end annotation

    .line 85
    check-cast p2, Landroidx/work/impl/model/WorkSpec;

    invoke-virtual {p0, p1, p2}, Landroidx/work/impl/model/WorkSpecDao_Impl$1;->bind(Landroidx/sqlite/db/SupportSQLiteStatement;Landroidx/work/impl/model/WorkSpec;)V

    return-void
.end method

.method protected createQuery()Ljava/lang/String;
    .locals 1

    .line 89
    const-string v0, "INSERT OR IGNORE INTO `WorkSpec` (`id`,`state`,`worker_class_name`,`input_merger_class_name`,`input`,`output`,`initial_delay`,`interval_duration`,`flex_duration`,`run_attempt_count`,`backoff_policy`,`backoff_delay_duration`,`last_enqueue_time`,`minimum_retention_duration`,`schedule_requested_at`,`run_in_foreground`,`out_of_quota_policy`,`period_count`,`generation`,`next_schedule_time_override`,`next_schedule_time_override_generation`,`stop_reason`,`trace_tag`,`required_network_type`,`required_network_request`,`requires_charging`,`requires_device_idle`,`requires_battery_not_low`,`requires_storage_not_low`,`trigger_content_update_delay`,`trigger_max_content_delay`,`content_uri_triggers`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"

    return-object v0
.end method
