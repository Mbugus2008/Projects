.class Lcom/trimline/metrocrew/Vehicles_dao_Impl$3;
.super Landroidx/room/EntityDeleteOrUpdateAdapter;
.source "Vehicles_dao_Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/Vehicles_dao_Impl;-><init>(Landroidx/room/RoomDatabase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/room/EntityDeleteOrUpdateAdapter<",
        "Lcom/trimline/metrocrew/Vehicles;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/Vehicles_dao_Impl;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/Vehicles_dao_Impl;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/Vehicles_dao_Impl;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 90
    iput-object p1, p0, Lcom/trimline/metrocrew/Vehicles_dao_Impl$3;->this$0:Lcom/trimline/metrocrew/Vehicles_dao_Impl;

    invoke-direct {p0}, Landroidx/room/EntityDeleteOrUpdateAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method protected bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/Vehicles;)V
    .locals 4
    .param p1, "statement"    # Landroidx/sqlite/SQLiteStatement;
    .param p2, "entity"    # Lcom/trimline/metrocrew/Vehicles;
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

    .line 99
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Vehicle_Number:Ljava/lang/String;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 100
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 102
    :cond_0
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Vehicle_Number:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 104
    :goto_0
    iget v0, p2, Lcom/trimline/metrocrew/Vehicles;->vehicle_type:I

    int-to-long v0, v0

    const/4 v2, 0x2

    invoke-interface {p1, v2, v0, v1}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 105
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Daily_Contribution:Ljava/lang/Double;

    const/4 v1, 0x3

    if-nez v0, :cond_1

    .line 106
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 108
    :cond_1
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Daily_Contribution:Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-interface {p1, v1, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 110
    :goto_1
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Start_Date:Ljava/lang/String;

    const/4 v1, 0x4

    if-nez v0, :cond_2

    .line 111
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2

    .line 113
    :cond_2
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Start_Date:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 115
    :goto_2
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Code:Ljava/lang/String;

    const/4 v1, 0x5

    if-nez v0, :cond_3

    .line 116
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_3

    .line 118
    :cond_3
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Code:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 120
    :goto_3
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Id_Number:Ljava/lang/String;

    const/4 v1, 0x6

    if-nez v0, :cond_4

    .line 121
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4

    .line 123
    :cond_4
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Id_Number:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 125
    :goto_4
    const/4 v0, 0x7

    iget-wide v1, p2, Lcom/trimline/metrocrew/Vehicles;->Arrears:D

    invoke-interface {p1, v0, v1, v2}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 126
    const/16 v0, 0x8

    iget-wide v1, p2, Lcom/trimline/metrocrew/Vehicles;->Penalty:D

    invoke-interface {p1, v0, v1, v2}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 127
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Fleet_No:Ljava/lang/String;

    const/16 v1, 0x9

    if-nez v0, :cond_5

    .line 128
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_5

    .line 130
    :cond_5
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Fleet_No:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 132
    :goto_5
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Vehicle_Number:Ljava/lang/String;

    const/16 v1, 0xa

    if-nez v0, :cond_6

    .line 133
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_6

    .line 135
    :cond_6
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Vehicle_Number:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 137
    :goto_6
    return-void
.end method

.method protected bridge synthetic bind(Landroidx/sqlite/SQLiteStatement;Ljava/lang/Object;)V
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

    .line 90
    check-cast p2, Lcom/trimline/metrocrew/Vehicles;

    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/Vehicles_dao_Impl$3;->bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/Vehicles;)V

    return-void
.end method

.method protected createQuery()Ljava/lang/String;
    .locals 1

    .line 94
    const-string v0, "UPDATE OR ABORT `Vehicles` SET `Vehicle_Number` = ?,`vehicle_type` = ?,`Daily_Contribution` = ?,`Start_Date` = ?,`Code` = ?,`Id_Number` = ?,`Arrears` = ?,`Penalty` = ?,`Fleet_No` = ? WHERE `Vehicle_Number` = ?"

    return-object v0
.end method
