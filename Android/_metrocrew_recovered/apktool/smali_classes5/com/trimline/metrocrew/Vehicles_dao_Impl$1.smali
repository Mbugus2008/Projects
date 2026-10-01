.class Lcom/trimline/metrocrew/Vehicles_dao_Impl$1;
.super Landroidx/room/EntityInsertAdapter;
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
        "Landroidx/room/EntityInsertAdapter<",
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

    .line 30
    iput-object p1, p0, Lcom/trimline/metrocrew/Vehicles_dao_Impl$1;->this$0:Lcom/trimline/metrocrew/Vehicles_dao_Impl;

    invoke-direct {p0}, Landroidx/room/EntityInsertAdapter;-><init>()V

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

    .line 39
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Vehicle_Number:Ljava/lang/String;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 40
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 42
    :cond_0
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Vehicle_Number:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 44
    :goto_0
    iget v0, p2, Lcom/trimline/metrocrew/Vehicles;->vehicle_type:I

    int-to-long v0, v0

    const/4 v2, 0x2

    invoke-interface {p1, v2, v0, v1}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 45
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Daily_Contribution:Ljava/lang/Double;

    const/4 v1, 0x3

    if-nez v0, :cond_1

    .line 46
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 48
    :cond_1
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Daily_Contribution:Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-interface {p1, v1, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 50
    :goto_1
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Start_Date:Ljava/lang/String;

    const/4 v1, 0x4

    if-nez v0, :cond_2

    .line 51
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2

    .line 53
    :cond_2
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Start_Date:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 55
    :goto_2
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Code:Ljava/lang/String;

    const/4 v1, 0x5

    if-nez v0, :cond_3

    .line 56
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_3

    .line 58
    :cond_3
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Code:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 60
    :goto_3
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Id_Number:Ljava/lang/String;

    const/4 v1, 0x6

    if-nez v0, :cond_4

    .line 61
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4

    .line 63
    :cond_4
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Id_Number:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 65
    :goto_4
    const/4 v0, 0x7

    iget-wide v1, p2, Lcom/trimline/metrocrew/Vehicles;->Arrears:D

    invoke-interface {p1, v0, v1, v2}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 66
    const/16 v0, 0x8

    iget-wide v1, p2, Lcom/trimline/metrocrew/Vehicles;->Penalty:D

    invoke-interface {p1, v0, v1, v2}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 67
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Fleet_No:Ljava/lang/String;

    const/16 v1, 0x9

    if-nez v0, :cond_5

    .line 68
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_5

    .line 70
    :cond_5
    iget-object v0, p2, Lcom/trimline/metrocrew/Vehicles;->Fleet_No:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 72
    :goto_5
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

    .line 30
    check-cast p2, Lcom/trimline/metrocrew/Vehicles;

    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/Vehicles_dao_Impl$1;->bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/Vehicles;)V

    return-void
.end method

.method protected createQuery()Ljava/lang/String;
    .locals 1

    .line 34
    const-string v0, "INSERT OR REPLACE INTO `Vehicles` (`Vehicle_Number`,`vehicle_type`,`Daily_Contribution`,`Start_Date`,`Code`,`Id_Number`,`Arrears`,`Penalty`,`Fleet_No`) VALUES (?,?,?,?,?,?,?,?,?)"

    return-object v0
.end method
