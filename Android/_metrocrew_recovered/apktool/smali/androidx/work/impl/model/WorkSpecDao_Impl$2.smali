.class Landroidx/work/impl/model/WorkSpecDao_Impl$2;
.super Landroidx/room/EntityDeletionOrUpdateAdapter;
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
        "Landroidx/room/EntityDeletionOrUpdateAdapter<",
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

    .line 147
    iput-object p1, p0, Landroidx/work/impl/model/WorkSpecDao_Impl$2;->this$0:Landroidx/work/impl/model/WorkSpecDao_Impl;

    invoke-direct {p0, p2}, Landroidx/room/EntityDeletionOrUpdateAdapter;-><init>(Landroidx/room/RoomDatabase;)V

    return-void
.end method


# virtual methods
.method protected bind(Landroidx/sqlite/db/SupportSQLiteStatement;Landroidx/work/impl/model/WorkSpec;)V
    .locals 18
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

    .line 157
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    const/4 v2, 0x1

    iget-object v3, v1, Landroidx/work/impl/model/WorkSpec;->id:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 158
    sget-object v2, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    iget-object v2, v1, Landroidx/work/impl/model/WorkSpec;->state:Landroidx/work/WorkInfo$State;

    invoke-static {v2}, Landroidx/work/impl/model/WorkTypeConverters;->stateToInt(Landroidx/work/WorkInfo$State;)I

    move-result v2

    .line 159
    .local v2, "_tmp":I
    const/4 v3, 0x2

    int-to-long v4, v2

    invoke-interface {v0, v3, v4, v5}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 160
    const/4 v3, 0x3

    iget-object v4, v1, Landroidx/work/impl/model/WorkSpec;->workerClassName:Ljava/lang/String;

    invoke-interface {v0, v3, v4}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 161
    const/4 v3, 0x4

    iget-object v4, v1, Landroidx/work/impl/model/WorkSpec;->inputMergerClassName:Ljava/lang/String;

    invoke-interface {v0, v3, v4}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 162
    iget-object v3, v1, Landroidx/work/impl/model/WorkSpec;->input:Landroidx/work/Data;

    invoke-static {v3}, Landroidx/work/Data;->toByteArrayInternalV1(Landroidx/work/Data;)[B

    move-result-object v3

    .line 163
    .local v3, "_tmp_1":[B
    const/4 v4, 0x5

    invoke-interface {v0, v4, v3}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindBlob(I[B)V

    .line 164
    iget-object v4, v1, Landroidx/work/impl/model/WorkSpec;->output:Landroidx/work/Data;

    invoke-static {v4}, Landroidx/work/Data;->toByteArrayInternalV1(Landroidx/work/Data;)[B

    move-result-object v4

    .line 165
    .local v4, "_tmp_2":[B
    const/4 v5, 0x6

    invoke-interface {v0, v5, v4}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindBlob(I[B)V

    .line 166
    const/4 v5, 0x7

    iget-wide v6, v1, Landroidx/work/impl/model/WorkSpec;->initialDelay:J

    invoke-interface {v0, v5, v6, v7}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 167
    const/16 v5, 0x8

    iget-wide v6, v1, Landroidx/work/impl/model/WorkSpec;->intervalDuration:J

    invoke-interface {v0, v5, v6, v7}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 168
    const/16 v5, 0x9

    iget-wide v6, v1, Landroidx/work/impl/model/WorkSpec;->flexDuration:J

    invoke-interface {v0, v5, v6, v7}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 169
    iget v5, v1, Landroidx/work/impl/model/WorkSpec;->runAttemptCount:I

    int-to-long v5, v5

    const/16 v7, 0xa

    invoke-interface {v0, v7, v5, v6}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 170
    sget-object v5, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    iget-object v5, v1, Landroidx/work/impl/model/WorkSpec;->backoffPolicy:Landroidx/work/BackoffPolicy;

    invoke-static {v5}, Landroidx/work/impl/model/WorkTypeConverters;->backoffPolicyToInt(Landroidx/work/BackoffPolicy;)I

    move-result v5

    .line 171
    .local v5, "_tmp_3":I
    const/16 v6, 0xb

    int-to-long v7, v5

    invoke-interface {v0, v6, v7, v8}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 172
    const/16 v6, 0xc

    iget-wide v7, v1, Landroidx/work/impl/model/WorkSpec;->backoffDelayDuration:J

    invoke-interface {v0, v6, v7, v8}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 173
    const/16 v6, 0xd

    iget-wide v7, v1, Landroidx/work/impl/model/WorkSpec;->lastEnqueueTime:J

    invoke-interface {v0, v6, v7, v8}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 174
    const/16 v6, 0xe

    iget-wide v7, v1, Landroidx/work/impl/model/WorkSpec;->minimumRetentionDuration:J

    invoke-interface {v0, v6, v7, v8}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 175
    const/16 v6, 0xf

    iget-wide v7, v1, Landroidx/work/impl/model/WorkSpec;->scheduleRequestedAt:J

    invoke-interface {v0, v6, v7, v8}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 176
    iget-boolean v6, v1, Landroidx/work/impl/model/WorkSpec;->expedited:Z

    .line 177
    .local v6, "_tmp_4":I
    const/16 v7, 0x10

    int-to-long v8, v6

    invoke-interface {v0, v7, v8, v9}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 178
    sget-object v7, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    iget-object v7, v1, Landroidx/work/impl/model/WorkSpec;->outOfQuotaPolicy:Landroidx/work/OutOfQuotaPolicy;

    invoke-static {v7}, Landroidx/work/impl/model/WorkTypeConverters;->outOfQuotaPolicyToInt(Landroidx/work/OutOfQuotaPolicy;)I

    move-result v7

    .line 179
    .local v7, "_tmp_5":I
    const/16 v8, 0x11

    int-to-long v9, v7

    invoke-interface {v0, v8, v9, v10}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 180
    invoke-virtual {v1}, Landroidx/work/impl/model/WorkSpec;->getPeriodCount()I

    move-result v8

    int-to-long v8, v8

    const/16 v10, 0x12

    invoke-interface {v0, v10, v8, v9}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 181
    invoke-virtual {v1}, Landroidx/work/impl/model/WorkSpec;->getGeneration()I

    move-result v8

    int-to-long v8, v8

    const/16 v10, 0x13

    invoke-interface {v0, v10, v8, v9}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 182
    const/16 v8, 0x14

    invoke-virtual {v1}, Landroidx/work/impl/model/WorkSpec;->getNextScheduleTimeOverride()J

    move-result-wide v9

    invoke-interface {v0, v8, v9, v10}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 183
    invoke-virtual {v1}, Landroidx/work/impl/model/WorkSpec;->getNextScheduleTimeOverrideGeneration()I

    move-result v8

    int-to-long v8, v8

    const/16 v10, 0x15

    invoke-interface {v0, v10, v8, v9}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 184
    invoke-virtual {v1}, Landroidx/work/impl/model/WorkSpec;->getStopReason()I

    move-result v8

    int-to-long v8, v8

    const/16 v10, 0x16

    invoke-interface {v0, v10, v8, v9}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 185
    invoke-virtual {v1}, Landroidx/work/impl/model/WorkSpec;->getTraceTag()Ljava/lang/String;

    move-result-object v8

    const/16 v9, 0x17

    if-nez v8, :cond_0

    .line 186
    invoke-interface {v0, v9}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 188
    :cond_0
    invoke-virtual {v1}, Landroidx/work/impl/model/WorkSpec;->getTraceTag()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v0, v9, v8}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 190
    :goto_0
    iget-object v8, v1, Landroidx/work/impl/model/WorkSpec;->constraints:Landroidx/work/Constraints;

    .line 191
    .local v8, "_tmpConstraints":Landroidx/work/Constraints;
    sget-object v9, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-virtual {v8}, Landroidx/work/Constraints;->getRequiredNetworkType()Landroidx/work/NetworkType;

    move-result-object v9

    invoke-static {v9}, Landroidx/work/impl/model/WorkTypeConverters;->networkTypeToInt(Landroidx/work/NetworkType;)I

    move-result v9

    .line 192
    .local v9, "_tmp_6":I
    const/16 v10, 0x18

    int-to-long v11, v9

    invoke-interface {v0, v10, v11, v12}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 193
    sget-object v10, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-virtual {v8}, Landroidx/work/Constraints;->getRequiredNetworkRequestCompat$work_runtime_release()Landroidx/work/impl/utils/NetworkRequestCompat;

    move-result-object v10

    invoke-static {v10}, Landroidx/work/impl/model/WorkTypeConverters;->fromNetworkRequest$work_runtime_release(Landroidx/work/impl/utils/NetworkRequestCompat;)[B

    move-result-object v10

    .line 194
    .local v10, "_tmp_7":[B
    const/16 v11, 0x19

    invoke-interface {v0, v11, v10}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindBlob(I[B)V

    .line 195
    invoke-virtual {v8}, Landroidx/work/Constraints;->requiresCharging()Z

    move-result v11

    .line 196
    .local v11, "_tmp_8":I
    const/16 v12, 0x1a

    int-to-long v13, v11

    invoke-interface {v0, v12, v13, v14}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 197
    invoke-virtual {v8}, Landroidx/work/Constraints;->requiresDeviceIdle()Z

    move-result v12

    .line 198
    .local v12, "_tmp_9":I
    const/16 v13, 0x1b

    int-to-long v14, v12

    invoke-interface {v0, v13, v14, v15}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 199
    invoke-virtual {v8}, Landroidx/work/Constraints;->requiresBatteryNotLow()Z

    move-result v13

    .line 200
    .local v13, "_tmp_10":I
    const/16 v14, 0x1c

    move v15, v2

    move-object/from16 v16, v3

    .end local v2    # "_tmp":I
    .end local v3    # "_tmp_1":[B
    .local v15, "_tmp":I
    .local v16, "_tmp_1":[B
    int-to-long v2, v13

    invoke-interface {v0, v14, v2, v3}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 201
    invoke-virtual {v8}, Landroidx/work/Constraints;->requiresStorageNotLow()Z

    move-result v2

    .line 202
    .local v2, "_tmp_11":I
    const/16 v3, 0x1d

    move-object v14, v4

    move/from16 v17, v5

    .end local v4    # "_tmp_2":[B
    .end local v5    # "_tmp_3":I
    .local v14, "_tmp_2":[B
    .local v17, "_tmp_3":I
    int-to-long v4, v2

    invoke-interface {v0, v3, v4, v5}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 203
    const/16 v3, 0x1e

    invoke-virtual {v8}, Landroidx/work/Constraints;->getContentTriggerUpdateDelayMillis()J

    move-result-wide v4

    invoke-interface {v0, v3, v4, v5}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 204
    const/16 v3, 0x1f

    invoke-virtual {v8}, Landroidx/work/Constraints;->getContentTriggerMaxDelayMillis()J

    move-result-wide v4

    invoke-interface {v0, v3, v4, v5}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 205
    sget-object v3, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-virtual {v8}, Landroidx/work/Constraints;->getContentUriTriggers()Ljava/util/Set;

    move-result-object v3

    invoke-static {v3}, Landroidx/work/impl/model/WorkTypeConverters;->setOfTriggersToByteArray(Ljava/util/Set;)[B

    move-result-object v3

    .line 206
    .local v3, "_tmp_12":[B
    const/16 v4, 0x20

    invoke-interface {v0, v4, v3}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindBlob(I[B)V

    .line 207
    const/16 v4, 0x21

    iget-object v5, v1, Landroidx/work/impl/model/WorkSpec;->id:Ljava/lang/String;

    invoke-interface {v0, v4, v5}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 208
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

    .line 147
    check-cast p2, Landroidx/work/impl/model/WorkSpec;

    invoke-virtual {p0, p1, p2}, Landroidx/work/impl/model/WorkSpecDao_Impl$2;->bind(Landroidx/sqlite/db/SupportSQLiteStatement;Landroidx/work/impl/model/WorkSpec;)V

    return-void
.end method

.method protected createQuery()Ljava/lang/String;
    .locals 1

    .line 151
    const-string v0, "UPDATE OR ABORT `WorkSpec` SET `id` = ?,`state` = ?,`worker_class_name` = ?,`input_merger_class_name` = ?,`input` = ?,`output` = ?,`initial_delay` = ?,`interval_duration` = ?,`flex_duration` = ?,`run_attempt_count` = ?,`backoff_policy` = ?,`backoff_delay_duration` = ?,`last_enqueue_time` = ?,`minimum_retention_duration` = ?,`schedule_requested_at` = ?,`run_in_foreground` = ?,`out_of_quota_policy` = ?,`period_count` = ?,`generation` = ?,`next_schedule_time_override` = ?,`next_schedule_time_override_generation` = ?,`stop_reason` = ?,`trace_tag` = ?,`required_network_type` = ?,`required_network_request` = ?,`requires_charging` = ?,`requires_device_idle` = ?,`requires_battery_not_low` = ?,`requires_storage_not_low` = ?,`trigger_content_update_delay` = ?,`trigger_max_content_delay` = ?,`content_uri_triggers` = ? WHERE `id` = ?"

    return-object v0
.end method
