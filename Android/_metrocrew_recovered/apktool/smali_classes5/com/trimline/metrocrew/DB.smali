.class public abstract Lcom/trimline/metrocrew/DB;
.super Landroidx/room/RoomDatabase;
.source "DB.java"


# static fields
.field static final MIGRATION_1_2:Landroidx/room/migration/Migration;

.field static final MIGRATION_2_3:Landroidx/room/migration/Migration;

.field private static instance:Lcom/trimline/metrocrew/DB;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 48
    new-instance v0, Lcom/trimline/metrocrew/DB$1;

    const/4 v1, 0x1

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/trimline/metrocrew/DB$1;-><init>(II)V

    sput-object v0, Lcom/trimline/metrocrew/DB;->MIGRATION_1_2:Landroidx/room/migration/Migration;

    .line 55
    new-instance v0, Lcom/trimline/metrocrew/DB$2;

    const/4 v1, 0x3

    invoke-direct {v0, v2, v1}, Lcom/trimline/metrocrew/DB$2;-><init>(II)V

    sput-object v0, Lcom/trimline/metrocrew/DB;->MIGRATION_2_3:Landroidx/room/migration/Migration;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Landroidx/room/RoomDatabase;-><init>()V

    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/trimline/metrocrew/DB;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    const-class v0, Lcom/trimline/metrocrew/DB;

    monitor-enter v0

    .line 37
    :try_start_0
    sget-object v1, Lcom/trimline/metrocrew/DB;->instance:Lcom/trimline/metrocrew/DB;

    if-nez v1, :cond_0

    .line 38
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/trimline/metrocrew/DB;

    const-string v3, "MetroCrew"

    invoke-static {v1, v2, v3}, Landroidx/room/Room;->databaseBuilder(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;)Landroidx/room/RoomDatabase$Builder;

    move-result-object v1

    .line 40
    invoke-virtual {v1}, Landroidx/room/RoomDatabase$Builder;->fallbackToDestructiveMigration()Landroidx/room/RoomDatabase$Builder;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Landroidx/room/migration/Migration;

    sget-object v3, Lcom/trimline/metrocrew/DB;->MIGRATION_1_2:Landroidx/room/migration/Migration;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    .line 41
    invoke-virtual {v1, v2}, Landroidx/room/RoomDatabase$Builder;->addMigrations([Landroidx/room/migration/Migration;)Landroidx/room/RoomDatabase$Builder;

    move-result-object v1

    .line 42
    invoke-virtual {v1}, Landroidx/room/RoomDatabase$Builder;->build()Landroidx/room/RoomDatabase;

    move-result-object v1

    check-cast v1, Lcom/trimline/metrocrew/DB;

    sput-object v1, Lcom/trimline/metrocrew/DB;->instance:Lcom/trimline/metrocrew/DB;

    .line 44
    :cond_0
    sget-object v1, Lcom/trimline/metrocrew/DB;->instance:Lcom/trimline/metrocrew/DB;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    .line 36
    .end local p0    # "context":Landroid/content/Context;
    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method


# virtual methods
.method public abstract aDao()Lcom/trimline/metrocrew/agent$dao;
.end method

.method public abstract ldao()Lcom/trimline/metrocrew/loan$dao;
.end method

.method public abstract memberDao()Lcom/trimline/metrocrew/Member$dao;
.end method

.method public abstract pdao()Lcom/trimline/metrocrew/payment_modes$dao;
.end method

.method public abstract tdao()Lcom/trimline/metrocrew/transaction$dao;
.end method

.method public abstract thDao()Lcom/trimline/metrocrew/theader$dao;
.end method

.method public abstract trandao()Lcom/trimline/metrocrew/types$dao;
.end method

.method public abstract vDao()Lcom/trimline/metrocrew/Vehicles$dao;
.end method
