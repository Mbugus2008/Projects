.class Lcom/trimline/metrocrew/DB$1;
.super Landroidx/room/migration/Migration;
.source "DB.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/DB;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>(II)V
    .locals 0
    .param p1, "startVersion"    # I
    .param p2, "endVersion"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "startVersion",
            "endVersion"
        }
    .end annotation

    .line 48
    invoke-direct {p0, p1, p2}, Landroidx/room/migration/Migration;-><init>(II)V

    return-void
.end method


# virtual methods
.method public migrate(Landroidx/sqlite/db/SupportSQLiteDatabase;)V
    .locals 1
    .param p1, "database"    # Landroidx/sqlite/db/SupportSQLiteDatabase;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "database"
        }
    .end annotation

    .line 51
    const-string v0, "Delete from Member"

    invoke-interface {p1, v0}, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 52
    const-string v0, "CREATE TABLE IF NOT EXISTS `Vehicles` (`Vehicle_Number` TEXT NOT NULL, `vehicle_type` INTEGER NOT NULL, `Daily_Contribution` REAL, `Start_Date` TEXT, `Code` TEXT, `Id_Number` TEXT, `Arrears` REAL NOT NULL, `Penalty` REAL NOT NULL, `Fleet_No` TEXT, PRIMARY KEY(`Vehicle_Number`))"

    invoke-interface {p1, v0}, Landroidx/sqlite/db/SupportSQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 53
    return-void
.end method
