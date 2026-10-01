.class Landroidx/work/impl/background/systemjob/SystemJobInfoConverter;
.super Ljava/lang/Object;
.source "SystemJobInfoConverter.java"


# static fields
.field static final EXTRA_IS_PERIODIC:Ljava/lang/String; = "EXTRA_IS_PERIODIC"

.field static final EXTRA_WORK_SPEC_GENERATION:Ljava/lang/String; = "EXTRA_WORK_SPEC_GENERATION"

.field static final EXTRA_WORK_SPEC_ID:Ljava/lang/String; = "EXTRA_WORK_SPEC_ID"

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final mClock:Landroidx/work/Clock;

.field private final mMarkImportantWhileForeground:Z

.field private final mWorkServiceComponent:Landroid/content/ComponentName;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 49
    const-string v0, "SystemJobInfoConverter"

    invoke-static {v0}, Landroidx/work/Logger;->tagWithPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/work/impl/background/systemjob/SystemJobInfoConverter;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroidx/work/Clock;Z)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "clock"    # Landroidx/work/Clock;
    .param p3, "markImportantWhileForeground"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "clock",
            "markImportantWhileForeground"
        }
    .end annotation

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p2, p0, Landroidx/work/impl/background/systemjob/SystemJobInfoConverter;->mClock:Landroidx/work/Clock;

    .line 62
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 63
    .local v0, "appContext":Landroid/content/Context;
    new-instance v1, Landroid/content/ComponentName;

    const-class v2, Landroidx/work/impl/background/systemjob/SystemJobService;

    invoke-direct {v1, v0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v1, p0, Landroidx/work/impl/background/systemjob/SystemJobInfoConverter;->mWorkServiceComponent:Landroid/content/ComponentName;

    .line 64
    iput-boolean p3, p0, Landroidx/work/impl/background/systemjob/SystemJobInfoConverter;->mMarkImportantWhileForeground:Z

    .line 65
    return-void
.end method

.method private static convertContentUriTrigger(Landroidx/work/Constraints$ContentUriTrigger;)Landroid/app/job/JobInfo$TriggerContentUri;
    .locals 3
    .param p0, "trigger"    # Landroidx/work/Constraints$ContentUriTrigger;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "trigger"
        }
    .end annotation

    .line 155
    invoke-virtual {p0}, Landroidx/work/Constraints$ContentUriTrigger;->isTriggeredForDescendants()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 156
    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 157
    .local v0, "flag":I
    :goto_0
    new-instance v1, Landroid/app/job/JobInfo$TriggerContentUri;

    invoke-virtual {p0}, Landroidx/work/Constraints$ContentUriTrigger;->getUri()Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Landroid/app/job/JobInfo$TriggerContentUri;-><init>(Landroid/net/Uri;I)V

    return-object v1
.end method

.method static convertNetworkType(Landroidx/work/NetworkType;)I
    .locals 5
    .param p0, "networkType"    # Landroidx/work/NetworkType;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "networkType"
        }
    .end annotation

    .line 189
    sget-object v0, Landroidx/work/impl/background/systemjob/SystemJobInfoConverter$1;->$SwitchMap$androidx$work$NetworkType:[I

    invoke-virtual {p0}, Landroidx/work/NetworkType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 202
    :pswitch_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v0, v2, :cond_0

    .line 203
    const/4 v0, 0x4

    return v0

    .line 197
    :pswitch_1
    nop

    .line 198
    const/4 v0, 0x3

    return v0

    .line 195
    :pswitch_2
    const/4 v0, 0x2

    return v0

    .line 193
    :pswitch_3
    return v1

    .line 191
    :pswitch_4
    const/4 v0, 0x0

    return v0

    .line 207
    :cond_0
    :goto_0
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v0

    sget-object v2, Landroidx/work/impl/background/systemjob/SystemJobInfoConverter;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "API version too low. Cannot convert network type value "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    return v1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static setRequiredNetwork(Landroid/app/job/JobInfo$Builder;Landroidx/work/NetworkType;)V
    .locals 2
    .param p0, "builder"    # Landroid/app/job/JobInfo$Builder;
    .param p1, "networkType"    # Landroidx/work/NetworkType;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "builder",
            "networkType"
        }
    .end annotation

    .line 170
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_0

    sget-object v0, Landroidx/work/NetworkType;->TEMPORARILY_UNMETERED:Landroidx/work/NetworkType;

    if-ne p1, v0, :cond_0

    .line 171
    new-instance v0, Landroid/net/NetworkRequest$Builder;

    invoke-direct {v0}, Landroid/net/NetworkRequest$Builder;-><init>()V

    .line 172
    const/16 v1, 0x19

    invoke-virtual {v0, v1}, Landroid/net/NetworkRequest$Builder;->addCapability(I)Landroid/net/NetworkRequest$Builder;

    move-result-object v0

    .line 173
    invoke-virtual {v0}, Landroid/net/NetworkRequest$Builder;->build()Landroid/net/NetworkRequest;

    move-result-object v0

    .line 175
    .local v0, "networkRequest":Landroid/net/NetworkRequest;
    invoke-virtual {p0, v0}, Landroid/app/job/JobInfo$Builder;->setRequiredNetwork(Landroid/net/NetworkRequest;)Landroid/app/job/JobInfo$Builder;

    .line 176
    .end local v0    # "networkRequest":Landroid/net/NetworkRequest;
    goto :goto_0

    .line 177
    :cond_0
    invoke-static {p1}, Landroidx/work/impl/background/systemjob/SystemJobInfoConverter;->convertNetworkType(Landroidx/work/NetworkType;)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    .line 179
    :goto_0
    return-void
.end method


# virtual methods
.method convert(Landroidx/work/impl/model/WorkSpec;I)Landroid/app/job/JobInfo;
    .locals 19
    .param p1, "workSpec"    # Landroidx/work/impl/model/WorkSpec;
    .param p2, "jobId"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "workSpec",
            "jobId"
        }
    .end annotation

    .line 77
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v1, Landroidx/work/impl/model/WorkSpec;->constraints:Landroidx/work/Constraints;

    .line 78
    .local v2, "constraints":Landroidx/work/Constraints;
    new-instance v3, Landroid/os/PersistableBundle;

    invoke-direct {v3}, Landroid/os/PersistableBundle;-><init>()V

    .line 79
    .local v3, "extras":Landroid/os/PersistableBundle;
    const-string v4, "EXTRA_WORK_SPEC_ID"

    iget-object v5, v1, Landroidx/work/impl/model/WorkSpec;->id:Ljava/lang/String;

    invoke-virtual {v3, v4, v5}, Landroid/os/PersistableBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    const-string v4, "EXTRA_WORK_SPEC_GENERATION"

    invoke-virtual {v1}, Landroidx/work/impl/model/WorkSpec;->getGeneration()I

    move-result v5

    invoke-virtual {v3, v4, v5}, Landroid/os/PersistableBundle;->putInt(Ljava/lang/String;I)V

    .line 81
    const-string v4, "EXTRA_IS_PERIODIC"

    invoke-virtual {v1}, Landroidx/work/impl/model/WorkSpec;->isPeriodic()Z

    move-result v5

    invoke-virtual {v3, v4, v5}, Landroid/os/PersistableBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 82
    new-instance v4, Landroid/app/job/JobInfo$Builder;

    iget-object v5, v0, Landroidx/work/impl/background/systemjob/SystemJobInfoConverter;->mWorkServiceComponent:Landroid/content/ComponentName;

    move/from16 v6, p2

    invoke-direct {v4, v6, v5}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    .line 83
    invoke-virtual {v2}, Landroidx/work/Constraints;->requiresCharging()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/app/job/JobInfo$Builder;->setRequiresCharging(Z)Landroid/app/job/JobInfo$Builder;

    move-result-object v4

    .line 84
    invoke-virtual {v2}, Landroidx/work/Constraints;->requiresDeviceIdle()Z

    move-result v5

    invoke-virtual {v4, v5}, Landroid/app/job/JobInfo$Builder;->setRequiresDeviceIdle(Z)Landroid/app/job/JobInfo$Builder;

    move-result-object v4

    .line 85
    invoke-virtual {v4, v3}, Landroid/app/job/JobInfo$Builder;->setExtras(Landroid/os/PersistableBundle;)Landroid/app/job/JobInfo$Builder;

    move-result-object v4

    .line 86
    .local v4, "builder":Landroid/app/job/JobInfo$Builder;
    invoke-virtual {v2}, Landroidx/work/Constraints;->getRequiredNetworkRequest()Landroid/net/NetworkRequest;

    move-result-object v5

    .line 87
    .local v5, "networkRequest":Landroid/net/NetworkRequest;
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x1c

    if-lt v7, v8, :cond_0

    if-eqz v5, :cond_0

    .line 88
    invoke-static {v4, v5}, Landroidx/work/impl/background/systemjob/SystemJobInfoConverterExtKt;->setRequiredNetworkRequest(Landroid/app/job/JobInfo$Builder;Landroid/net/NetworkRequest;)V

    goto :goto_0

    .line 90
    :cond_0
    invoke-virtual {v2}, Landroidx/work/Constraints;->getRequiredNetworkType()Landroidx/work/NetworkType;

    move-result-object v7

    invoke-static {v4, v7}, Landroidx/work/impl/background/systemjob/SystemJobInfoConverter;->setRequiredNetwork(Landroid/app/job/JobInfo$Builder;Landroidx/work/NetworkType;)V

    .line 93
    :goto_0
    invoke-virtual {v2}, Landroidx/work/Constraints;->requiresDeviceIdle()Z

    move-result v7

    if-nez v7, :cond_2

    .line 95
    iget-object v7, v1, Landroidx/work/impl/model/WorkSpec;->backoffPolicy:Landroidx/work/BackoffPolicy;

    sget-object v11, Landroidx/work/BackoffPolicy;->LINEAR:Landroidx/work/BackoffPolicy;

    if-ne v7, v11, :cond_1

    .line 96
    const/4 v7, 0x0

    goto :goto_1

    :cond_1
    const/4 v7, 0x1

    .line 97
    .local v7, "backoffPolicy":I
    :goto_1
    iget-wide v11, v1, Landroidx/work/impl/model/WorkSpec;->backoffDelayDuration:J

    invoke-virtual {v4, v11, v12, v7}, Landroid/app/job/JobInfo$Builder;->setBackoffCriteria(JI)Landroid/app/job/JobInfo$Builder;

    .line 100
    .end local v7    # "backoffPolicy":I
    :cond_2
    invoke-virtual {v1}, Landroidx/work/impl/model/WorkSpec;->calculateNextRunTime()J

    move-result-wide v11

    .line 101
    .local v11, "nextRunTime":J
    iget-object v7, v0, Landroidx/work/impl/background/systemjob/SystemJobInfoConverter;->mClock:Landroidx/work/Clock;

    invoke-interface {v7}, Landroidx/work/Clock;->currentTimeMillis()J

    move-result-wide v13

    .line 102
    .local v13, "now":J
    sub-long v9, v11, v13

    const-wide/16 v7, 0x0

    invoke-static {v9, v10, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v9

    .line 104
    .local v9, "offset":J
    move-wide/from16 v17, v7

    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x1c

    if-gt v7, v8, :cond_3

    .line 108
    invoke-virtual {v4, v9, v10}, Landroid/app/job/JobInfo$Builder;->setMinimumLatency(J)Landroid/app/job/JobInfo$Builder;

    goto :goto_2

    .line 110
    :cond_3
    cmp-long v7, v9, v17

    if-lez v7, :cond_4

    .line 112
    invoke-virtual {v4, v9, v10}, Landroid/app/job/JobInfo$Builder;->setMinimumLatency(J)Landroid/app/job/JobInfo$Builder;

    goto :goto_2

    .line 113
    :cond_4
    iget-boolean v7, v1, Landroidx/work/impl/model/WorkSpec;->expedited:Z

    if-nez v7, :cond_5

    iget-boolean v7, v0, Landroidx/work/impl/background/systemjob/SystemJobInfoConverter;->mMarkImportantWhileForeground:Z

    if-eqz v7, :cond_5

    .line 115
    const/4 v15, 0x1

    invoke-virtual {v4, v15}, Landroid/app/job/JobInfo$Builder;->setImportantWhileForeground(Z)Landroid/app/job/JobInfo$Builder;

    .line 119
    :cond_5
    :goto_2
    invoke-virtual {v2}, Landroidx/work/Constraints;->hasContentUriTriggers()Z

    move-result v7

    if-eqz v7, :cond_7

    .line 121
    invoke-virtual {v2}, Landroidx/work/Constraints;->getContentUriTriggers()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroidx/work/Constraints$ContentUriTrigger;

    .line 122
    .local v8, "trigger":Landroidx/work/Constraints$ContentUriTrigger;
    invoke-static {v8}, Landroidx/work/impl/background/systemjob/SystemJobInfoConverter;->convertContentUriTrigger(Landroidx/work/Constraints$ContentUriTrigger;)Landroid/app/job/JobInfo$TriggerContentUri;

    move-result-object v15

    invoke-virtual {v4, v15}, Landroid/app/job/JobInfo$Builder;->addTriggerContentUri(Landroid/app/job/JobInfo$TriggerContentUri;)Landroid/app/job/JobInfo$Builder;

    .line 123
    .end local v8    # "trigger":Landroidx/work/Constraints$ContentUriTrigger;
    goto :goto_3

    .line 124
    :cond_6
    invoke-virtual {v2}, Landroidx/work/Constraints;->getContentTriggerUpdateDelayMillis()J

    move-result-wide v7

    invoke-virtual {v4, v7, v8}, Landroid/app/job/JobInfo$Builder;->setTriggerContentUpdateDelay(J)Landroid/app/job/JobInfo$Builder;

    .line 125
    invoke-virtual {v2}, Landroidx/work/Constraints;->getContentTriggerMaxDelayMillis()J

    move-result-wide v7

    invoke-virtual {v4, v7, v8}, Landroid/app/job/JobInfo$Builder;->setTriggerContentMaxDelay(J)Landroid/app/job/JobInfo$Builder;

    .line 130
    :cond_7
    const/4 v7, 0x0

    invoke-virtual {v4, v7}, Landroid/app/job/JobInfo$Builder;->setPersisted(Z)Landroid/app/job/JobInfo$Builder;

    .line 131
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v15, 0x1a

    if-lt v8, v15, :cond_8

    .line 132
    invoke-virtual {v2}, Landroidx/work/Constraints;->requiresBatteryNotLow()Z

    move-result v8

    invoke-virtual {v4, v8}, Landroid/app/job/JobInfo$Builder;->setRequiresBatteryNotLow(Z)Landroid/app/job/JobInfo$Builder;

    .line 133
    invoke-virtual {v2}, Landroidx/work/Constraints;->requiresStorageNotLow()Z

    move-result v8

    invoke-virtual {v4, v8}, Landroid/app/job/JobInfo$Builder;->setRequiresStorageNotLow(Z)Landroid/app/job/JobInfo$Builder;

    .line 136
    :cond_8
    iget v8, v1, Landroidx/work/impl/model/WorkSpec;->runAttemptCount:I

    if-lez v8, :cond_9

    const/16 v16, 0x1

    goto :goto_4

    :cond_9
    move/from16 v16, v7

    .line 137
    .local v16, "isRetry":Z
    :goto_4
    cmp-long v8, v9, v17

    if-lez v8, :cond_a

    const/4 v7, 0x1

    .line 138
    .local v7, "isDelayed":Z
    :cond_a
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v15, 0x1f

    if-lt v8, v15, :cond_b

    iget-boolean v8, v1, Landroidx/work/impl/model/WorkSpec;->expedited:Z

    if-eqz v8, :cond_b

    if-nez v16, :cond_b

    if-nez v7, :cond_b

    .line 140
    const/4 v15, 0x1

    invoke-virtual {v4, v15}, Landroid/app/job/JobInfo$Builder;->setExpedited(Z)Landroid/app/job/JobInfo$Builder;

    .line 142
    :cond_b
    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v15, 0x23

    if-lt v8, v15, :cond_c

    .line 144
    invoke-virtual {v1}, Landroidx/work/impl/model/WorkSpec;->getTraceTag()Ljava/lang/String;

    move-result-object v8

    .line 145
    .local v8, "traceTag":Ljava/lang/String;
    if-eqz v8, :cond_c

    .line 146
    invoke-virtual {v4, v8}, Landroid/app/job/JobInfo$Builder;->setTraceTag(Ljava/lang/String;)Landroid/app/job/JobInfo$Builder;

    .line 149
    .end local v8    # "traceTag":Ljava/lang/String;
    :cond_c
    invoke-virtual {v4}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object v8

    return-object v8
.end method
