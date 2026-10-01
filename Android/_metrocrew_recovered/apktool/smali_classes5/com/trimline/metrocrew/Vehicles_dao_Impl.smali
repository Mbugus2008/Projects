.class public final Lcom/trimline/metrocrew/Vehicles_dao_Impl;
.super Lcom/trimline/metrocrew/Vehicles$dao;
.source "Vehicles_dao_Impl.java"


# instance fields
.field private final __db:Landroidx/room/RoomDatabase;

.field private final __deleteAdapterOfVehicles:Landroidx/room/EntityDeleteOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeleteOrUpdateAdapter<",
            "Lcom/trimline/metrocrew/Vehicles;",
            ">;"
        }
    .end annotation
.end field

.field private final __insertAdapterOfVehicles:Landroidx/room/EntityInsertAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityInsertAdapter<",
            "Lcom/trimline/metrocrew/Vehicles;",
            ">;"
        }
    .end annotation
.end field

.field private final __updateAdapterOfVehicles:Landroidx/room/EntityDeleteOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeleteOrUpdateAdapter<",
            "Lcom/trimline/metrocrew/Vehicles;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/room/RoomDatabase;)V
    .locals 1
    .param p1, "__db"    # Landroidx/room/RoomDatabase;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "__db"
        }
    .end annotation

    .line 28
    invoke-direct {p0}, Lcom/trimline/metrocrew/Vehicles$dao;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/trimline/metrocrew/Vehicles_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    .line 30
    new-instance v0, Lcom/trimline/metrocrew/Vehicles_dao_Impl$1;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/Vehicles_dao_Impl$1;-><init>(Lcom/trimline/metrocrew/Vehicles_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/Vehicles_dao_Impl;->__insertAdapterOfVehicles:Landroidx/room/EntityInsertAdapter;

    .line 74
    new-instance v0, Lcom/trimline/metrocrew/Vehicles_dao_Impl$2;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/Vehicles_dao_Impl$2;-><init>(Lcom/trimline/metrocrew/Vehicles_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/Vehicles_dao_Impl;->__deleteAdapterOfVehicles:Landroidx/room/EntityDeleteOrUpdateAdapter;

    .line 90
    new-instance v0, Lcom/trimline/metrocrew/Vehicles_dao_Impl$3;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/Vehicles_dao_Impl$3;-><init>(Lcom/trimline/metrocrew/Vehicles_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/Vehicles_dao_Impl;->__updateAdapterOfVehicles:Landroidx/room/EntityDeleteOrUpdateAdapter;

    .line 139
    return-void
.end method

.method public static getRequiredConverters()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation

    .line 228
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$getall$3(Landroidx/sqlite/SQLiteConnection;)Ljava/util/List;
    .locals 16
    .param p0, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 169
    const-string v0, "SELECT * FROM Vehicles"

    move-object/from16 v1, p0

    invoke-interface {v1, v0}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v2

    .line 171
    .local v2, "_stmt":Landroidx/sqlite/SQLiteStatement;
    :try_start_0
    const-string v0, "Vehicle_Number"

    invoke-static {v2, v0}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v0

    .line 172
    .local v0, "_columnIndexOfVehicleNumber":I
    const-string v3, "vehicle_type"

    invoke-static {v2, v3}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v3

    .line 173
    .local v3, "_columnIndexOfVehicleType":I
    const-string v4, "Daily_Contribution"

    invoke-static {v2, v4}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v4

    .line 174
    .local v4, "_columnIndexOfDailyContribution":I
    const-string v5, "Start_Date"

    invoke-static {v2, v5}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v5

    .line 175
    .local v5, "_columnIndexOfStartDate":I
    const-string v6, "Code"

    invoke-static {v2, v6}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v6

    .line 176
    .local v6, "_columnIndexOfCode":I
    const-string v7, "Id_Number"

    invoke-static {v2, v7}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v7

    .line 177
    .local v7, "_columnIndexOfIdNumber":I
    const-string v8, "Arrears"

    invoke-static {v2, v8}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v8

    .line 178
    .local v8, "_columnIndexOfArrears":I
    const-string v9, "Penalty"

    invoke-static {v2, v9}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v9

    .line 179
    .local v9, "_columnIndexOfPenalty":I
    const-string v10, "Fleet_No"

    invoke-static {v2, v10}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v10

    .line 180
    .local v10, "_columnIndexOfFleetNo":I
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 181
    .local v11, "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/Vehicles;>;"
    :goto_0
    invoke-interface {v2}, Landroidx/sqlite/SQLiteStatement;->step()Z

    move-result v12

    if-eqz v12, :cond_6

    .line 183
    new-instance v12, Lcom/trimline/metrocrew/Vehicles;

    invoke-direct {v12}, Lcom/trimline/metrocrew/Vehicles;-><init>()V

    .line 184
    .local v12, "_item":Lcom/trimline/metrocrew/Vehicles;
    invoke-interface {v2, v0}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v13

    const/4 v14, 0x0

    if-eqz v13, :cond_0

    .line 185
    iput-object v14, v12, Lcom/trimline/metrocrew/Vehicles;->Vehicle_Number:Ljava/lang/String;

    goto :goto_1

    .line 187
    :cond_0
    invoke-interface {v2, v0}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v13

    iput-object v13, v12, Lcom/trimline/metrocrew/Vehicles;->Vehicle_Number:Ljava/lang/String;

    .line 189
    :goto_1
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v14

    long-to-int v14, v14

    iput v14, v12, Lcom/trimline/metrocrew/Vehicles;->vehicle_type:I

    .line 190
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_1

    .line 191
    const/4 v13, 0x0

    iput-object v13, v12, Lcom/trimline/metrocrew/Vehicles;->Daily_Contribution:Ljava/lang/Double;

    goto :goto_2

    .line 193
    :cond_1
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v14

    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v14

    iput-object v14, v12, Lcom/trimline/metrocrew/Vehicles;->Daily_Contribution:Ljava/lang/Double;

    .line 195
    :goto_2
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 196
    const/4 v13, 0x0

    iput-object v13, v12, Lcom/trimline/metrocrew/Vehicles;->Start_Date:Ljava/lang/String;

    goto :goto_3

    .line 198
    :cond_2
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v12, Lcom/trimline/metrocrew/Vehicles;->Start_Date:Ljava/lang/String;

    .line 200
    :goto_3
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 201
    const/4 v13, 0x0

    iput-object v13, v12, Lcom/trimline/metrocrew/Vehicles;->Code:Ljava/lang/String;

    goto :goto_4

    .line 203
    :cond_3
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v12, Lcom/trimline/metrocrew/Vehicles;->Code:Ljava/lang/String;

    .line 205
    :goto_4
    invoke-interface {v2, v7}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 206
    const/4 v13, 0x0

    iput-object v13, v12, Lcom/trimline/metrocrew/Vehicles;->Id_Number:Ljava/lang/String;

    goto :goto_5

    .line 208
    :cond_4
    invoke-interface {v2, v7}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v12, Lcom/trimline/metrocrew/Vehicles;->Id_Number:Ljava/lang/String;

    .line 210
    :goto_5
    invoke-interface {v2, v8}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v14

    iput-wide v14, v12, Lcom/trimline/metrocrew/Vehicles;->Arrears:D

    .line 211
    invoke-interface {v2, v9}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v14

    iput-wide v14, v12, Lcom/trimline/metrocrew/Vehicles;->Penalty:D

    .line 212
    invoke-interface {v2, v10}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_5

    .line 213
    const/4 v13, 0x0

    iput-object v13, v12, Lcom/trimline/metrocrew/Vehicles;->Fleet_No:Ljava/lang/String;

    goto :goto_6

    .line 215
    :cond_5
    invoke-interface {v2, v10}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v13

    iput-object v13, v12, Lcom/trimline/metrocrew/Vehicles;->Fleet_No:Ljava/lang/String;

    .line 217
    :goto_6
    invoke-interface {v11, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 218
    nop

    .end local v12    # "_item":Lcom/trimline/metrocrew/Vehicles;
    goto/16 :goto_0

    .line 219
    :cond_6
    nop

    .line 221
    invoke-interface {v2}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 219
    return-object v11

    .line 221
    .end local v0    # "_columnIndexOfVehicleNumber":I
    .end local v3    # "_columnIndexOfVehicleType":I
    .end local v4    # "_columnIndexOfDailyContribution":I
    .end local v5    # "_columnIndexOfStartDate":I
    .end local v6    # "_columnIndexOfCode":I
    .end local v7    # "_columnIndexOfIdNumber":I
    .end local v8    # "_columnIndexOfArrears":I
    .end local v9    # "_columnIndexOfPenalty":I
    .end local v10    # "_columnIndexOfFleetNo":I
    .end local v11    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/Vehicles;>;"
    :catchall_0
    move-exception v0

    invoke-interface {v2}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 222
    throw v0
.end method


# virtual methods
.method delete(Lcom/trimline/metrocrew/Vehicles;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/Vehicles;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 151
    iget-object v0, p0, Lcom/trimline/metrocrew/Vehicles_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/Vehicles_dao_Impl$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/Vehicles_dao_Impl$$ExternalSyntheticLambda2;-><init>(Lcom/trimline/metrocrew/Vehicles_dao_Impl;Lcom/trimline/metrocrew/Vehicles;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 155
    return-void
.end method

.method getall()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/Vehicles;",
            ">;"
        }
    .end annotation

    .line 167
    const-string v0, "SELECT * FROM Vehicles"

    .line 168
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/trimline/metrocrew/Vehicles_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v2, Lcom/trimline/metrocrew/Vehicles_dao_Impl$$ExternalSyntheticLambda1;

    invoke-direct {v2}, Lcom/trimline/metrocrew/Vehicles_dao_Impl$$ExternalSyntheticLambda1;-><init>()V

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v1, v3, v4, v2}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    return-object v1
.end method

.method insert(Lcom/trimline/metrocrew/Vehicles;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/Vehicles;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 143
    iget-object v0, p0, Lcom/trimline/metrocrew/Vehicles_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/Vehicles_dao_Impl$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/Vehicles_dao_Impl$$ExternalSyntheticLambda3;-><init>(Lcom/trimline/metrocrew/Vehicles_dao_Impl;Lcom/trimline/metrocrew/Vehicles;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 147
    return-void
.end method

.method synthetic lambda$delete$1$com-trimline-metrocrew-Vehicles_dao_Impl(Lcom/trimline/metrocrew/Vehicles;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/Vehicles;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 152
    iget-object v0, p0, Lcom/trimline/metrocrew/Vehicles_dao_Impl;->__deleteAdapterOfVehicles:Landroidx/room/EntityDeleteOrUpdateAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityDeleteOrUpdateAdapter;->handle(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)I

    .line 153
    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$insert$0$com-trimline-metrocrew-Vehicles_dao_Impl(Lcom/trimline/metrocrew/Vehicles;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/Vehicles;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 144
    iget-object v0, p0, Lcom/trimline/metrocrew/Vehicles_dao_Impl;->__insertAdapterOfVehicles:Landroidx/room/EntityInsertAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityInsertAdapter;->insert(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)V

    .line 145
    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$update$2$com-trimline-metrocrew-Vehicles_dao_Impl(Lcom/trimline/metrocrew/Vehicles;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/Vehicles;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 160
    iget-object v0, p0, Lcom/trimline/metrocrew/Vehicles_dao_Impl;->__updateAdapterOfVehicles:Landroidx/room/EntityDeleteOrUpdateAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityDeleteOrUpdateAdapter;->handle(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)I

    .line 161
    const/4 v0, 0x0

    return-object v0
.end method

.method update(Lcom/trimline/metrocrew/Vehicles;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/Vehicles;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 159
    iget-object v0, p0, Lcom/trimline/metrocrew/Vehicles_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/Vehicles_dao_Impl$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/Vehicles_dao_Impl$$ExternalSyntheticLambda0;-><init>(Lcom/trimline/metrocrew/Vehicles_dao_Impl;Lcom/trimline/metrocrew/Vehicles;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 163
    return-void
.end method
