.class Landroidx/work/impl/background/systemalarm/Alarms;
.super Ljava/lang/Object;
.source "Alarms.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 46
    const-string v0, "Alarms"

    invoke-static {v0}, Landroidx/work/Logger;->tagWithPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Landroidx/work/impl/background/systemalarm/Alarms;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 134
    return-void
.end method

.method public static cancelAlarm(Landroid/content/Context;Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/model/WorkGenerationalId;)V
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "workDatabase"    # Landroidx/work/impl/WorkDatabase;
    .param p2, "id"    # Landroidx/work/impl/model/WorkGenerationalId;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "workDatabase",
            "id"
        }
    .end annotation

    .line 86
    invoke-virtual {p1}, Landroidx/work/impl/WorkDatabase;->systemIdInfoDao()Landroidx/work/impl/model/SystemIdInfoDao;

    move-result-object v0

    .line 87
    .local v0, "systemIdInfoDao":Landroidx/work/impl/model/SystemIdInfoDao;
    invoke-interface {v0, p2}, Landroidx/work/impl/model/SystemIdInfoDao;->getSystemIdInfo(Landroidx/work/impl/model/WorkGenerationalId;)Landroidx/work/impl/model/SystemIdInfo;

    move-result-object v1

    .line 88
    .local v1, "systemIdInfo":Landroidx/work/impl/model/SystemIdInfo;
    if-eqz v1, :cond_0

    .line 89
    iget v2, v1, Landroidx/work/impl/model/SystemIdInfo;->systemId:I

    invoke-static {p0, p2, v2}, Landroidx/work/impl/background/systemalarm/Alarms;->cancelExactAlarm(Landroid/content/Context;Landroidx/work/impl/model/WorkGenerationalId;I)V

    .line 90
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v2

    sget-object v3, Landroidx/work/impl/background/systemalarm/Alarms;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Removing SystemIdInfo for workSpecId ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    invoke-interface {v0, p2}, Landroidx/work/impl/model/SystemIdInfoDao;->removeSystemIdInfo(Landroidx/work/impl/model/WorkGenerationalId;)V

    .line 94
    :cond_0
    return-void
.end method

.method private static cancelExactAlarm(Landroid/content/Context;Landroidx/work/impl/model/WorkGenerationalId;I)V
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # Landroidx/work/impl/model/WorkGenerationalId;
    .param p2, "alarmId"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "id",
            "alarmId"
        }
    .end annotation

    .line 100
    const-string v0, "alarm"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 101
    .local v0, "alarmManager":Landroid/app/AlarmManager;
    invoke-static {p0, p1}, Landroidx/work/impl/background/systemalarm/CommandHandler;->createDelayMetIntent(Landroid/content/Context;Landroidx/work/impl/model/WorkGenerationalId;)Landroid/content/Intent;

    move-result-object v1

    .line 102
    .local v1, "delayMet":Landroid/content/Intent;
    const/high16 v2, 0x20000000

    .line 103
    .local v2, "flags":I
    nop

    .line 104
    const/high16 v3, 0x4000000

    or-int/2addr v2, v3

    .line 106
    invoke-static {p0, p2, v1, v2}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 107
    .local v3, "pendingIntent":Landroid/app/PendingIntent;
    if-eqz v3, :cond_0

    if-eqz v0, :cond_0

    .line 108
    invoke-static {}, Landroidx/work/Logger;->get()Landroidx/work/Logger;

    move-result-object v4

    sget-object v5, Landroidx/work/impl/background/systemalarm/Alarms;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Cancelling existing alarm with (workSpecId, systemId) ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroidx/work/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    invoke-virtual {v0, v3}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 113
    :cond_0
    return-void
.end method

.method public static setAlarm(Landroid/content/Context;Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/model/WorkGenerationalId;J)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "workDatabase"    # Landroidx/work/impl/WorkDatabase;
    .param p2, "id"    # Landroidx/work/impl/model/WorkGenerationalId;
    .param p3, "triggerAtMillis"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "workDatabase",
            "id",
            "triggerAtMillis"
        }
    .end annotation

    .line 61
    invoke-virtual {p1}, Landroidx/work/impl/WorkDatabase;->systemIdInfoDao()Landroidx/work/impl/model/SystemIdInfoDao;

    move-result-object v0

    .line 62
    .local v0, "systemIdInfoDao":Landroidx/work/impl/model/SystemIdInfoDao;
    invoke-interface {v0, p2}, Landroidx/work/impl/model/SystemIdInfoDao;->getSystemIdInfo(Landroidx/work/impl/model/WorkGenerationalId;)Landroidx/work/impl/model/SystemIdInfo;

    move-result-object v1

    .line 63
    .local v1, "systemIdInfo":Landroidx/work/impl/model/SystemIdInfo;
    if-eqz v1, :cond_0

    .line 64
    iget v2, v1, Landroidx/work/impl/model/SystemIdInfo;->systemId:I

    invoke-static {p0, p2, v2}, Landroidx/work/impl/background/systemalarm/Alarms;->cancelExactAlarm(Landroid/content/Context;Landroidx/work/impl/model/WorkGenerationalId;I)V

    .line 65
    iget v2, v1, Landroidx/work/impl/model/SystemIdInfo;->systemId:I

    invoke-static {p0, p2, v2, p3, p4}, Landroidx/work/impl/background/systemalarm/Alarms;->setExactAlarm(Landroid/content/Context;Landroidx/work/impl/model/WorkGenerationalId;IJ)V

    goto :goto_0

    .line 67
    :cond_0
    new-instance v2, Landroidx/work/impl/utils/IdGenerator;

    invoke-direct {v2, p1}, Landroidx/work/impl/utils/IdGenerator;-><init>(Landroidx/work/impl/WorkDatabase;)V

    .line 68
    .local v2, "idGenerator":Landroidx/work/impl/utils/IdGenerator;
    invoke-virtual {v2}, Landroidx/work/impl/utils/IdGenerator;->nextAlarmManagerId()I

    move-result v3

    .line 69
    .local v3, "alarmId":I
    invoke-static {p2, v3}, Landroidx/work/impl/model/SystemIdInfoKt;->systemIdInfo(Landroidx/work/impl/model/WorkGenerationalId;I)Landroidx/work/impl/model/SystemIdInfo;

    move-result-object v4

    .line 70
    .local v4, "newSystemIdInfo":Landroidx/work/impl/model/SystemIdInfo;
    invoke-interface {v0, v4}, Landroidx/work/impl/model/SystemIdInfoDao;->insertSystemIdInfo(Landroidx/work/impl/model/SystemIdInfo;)V

    .line 71
    invoke-static {p0, p2, v3, p3, p4}, Landroidx/work/impl/background/systemalarm/Alarms;->setExactAlarm(Landroid/content/Context;Landroidx/work/impl/model/WorkGenerationalId;IJ)V

    .line 73
    .end local v2    # "idGenerator":Landroidx/work/impl/utils/IdGenerator;
    .end local v3    # "alarmId":I
    .end local v4    # "newSystemIdInfo":Landroidx/work/impl/model/SystemIdInfo;
    :goto_0
    return-void
.end method

.method private static setExactAlarm(Landroid/content/Context;Landroidx/work/impl/model/WorkGenerationalId;IJ)V
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "id"    # Landroidx/work/impl/model/WorkGenerationalId;
    .param p2, "alarmId"    # I
    .param p3, "triggerAtMillis"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "id",
            "alarmId",
            "triggerAtMillis"
        }
    .end annotation

    .line 121
    const-string v0, "alarm"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 122
    .local v0, "alarmManager":Landroid/app/AlarmManager;
    const/high16 v1, 0x8000000

    .line 123
    .local v1, "flags":I
    nop

    .line 124
    const/high16 v2, 0x4000000

    or-int/2addr v1, v2

    .line 126
    invoke-static {p0, p1}, Landroidx/work/impl/background/systemalarm/CommandHandler;->createDelayMetIntent(Landroid/content/Context;Landroidx/work/impl/model/WorkGenerationalId;)Landroid/content/Intent;

    move-result-object v2

    .line 127
    .local v2, "delayMet":Landroid/content/Intent;
    invoke-static {p0, p2, v2, v1}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v3

    .line 128
    .local v3, "pendingIntent":Landroid/app/PendingIntent;
    if-eqz v0, :cond_0

    .line 129
    const/4 v4, 0x0

    invoke-virtual {v0, v4, p3, p4, v3}, Landroid/app/AlarmManager;->setExact(IJLandroid/app/PendingIntent;)V

    .line 131
    :cond_0
    return-void
.end method
