.class final Landroidx/work/impl/WorkDatabase_AutoMigration_22_23_Impl;
.super Landroidx/room/migration/Migration;
.source "WorkDatabase_AutoMigration_22_23_Impl.java"


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 14
    const/16 v0, 0x16

    const/16 v1, 0x17

    invoke-direct {p0, v0, v1}, Landroidx/room/migration/Migration;-><init>(II)V

    .line 15
    return-void
.end method


# virtual methods
.method public migrate(Landroidx/sqlite/db/SupportSQLiteDatabase;)V
    .locals 1
    .param p1, "db"    # Landroidx/sqlite/db/SupportSQLiteDatabase;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "db"
        }
    .end annotation

    .line 19
    const-string v0, "ALTER TABLE `WorkSpec` ADD COLUMN `trace_tag` TEXT DEFAULT NULL"

    invoke-interface {p1, v0}, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 20
    return-void
.end method
