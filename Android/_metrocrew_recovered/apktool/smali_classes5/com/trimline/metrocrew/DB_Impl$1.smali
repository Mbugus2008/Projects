.class Lcom/trimline/metrocrew/DB_Impl$1;
.super Landroidx/room/RoomOpenDelegate;
.source "DB_Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/DB_Impl;->createOpenDelegate()Landroidx/room/RoomOpenDelegate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/DB_Impl;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/DB_Impl;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/DB_Impl;
    .param p2, "version"    # I
    .param p3, "identityHash"    # Ljava/lang/String;
    .param p4, "legacyIdentityHash"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0,
            0x0
        }
        names = {
            "this$0",
            "version",
            "identityHash",
            "legacyIdentityHash"
        }
    .end annotation

    .line 44
    iput-object p1, p0, Lcom/trimline/metrocrew/DB_Impl$1;->this$0:Lcom/trimline/metrocrew/DB_Impl;

    invoke-direct {p0, p2, p3, p4}, Landroidx/room/RoomOpenDelegate;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public createAllTables(Landroidx/sqlite/SQLiteConnection;)V
    .locals 1
    .param p1, "connection"    # Landroidx/sqlite/SQLiteConnection;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "connection"
        }
    .end annotation

    .line 47
    const-string v0, "CREATE TABLE IF NOT EXISTS `Member` (`No` TEXT NOT NULL, `Name` TEXT, `ID_No` TEXT, `Phone_No` TEXT, `Outstanding_Balance` REAL NOT NULL, `Shares_Retained` REAL NOT NULL, `Current_Shares` REAL NOT NULL, `Current_Savings` REAL NOT NULL, `Registration_Fee_Paid` REAL NOT NULL, PRIMARY KEY(`No`))"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 48
    const-string v0, "CREATE TABLE IF NOT EXISTS `agent` (`Agent_Code` TEXT NOT NULL, `Customer_ID_No` TEXT, `Mobile_No` TEXT, `Status` INTEGER NOT NULL, `Name` TEXT, `Account` TEXT, `Password` TEXT, `Constituency` TEXT, `Account_type` INTEGER NOT NULL, `Balance` REAL NOT NULL, PRIMARY KEY(`Agent_Code`))"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 49
    const-string v0, "CREATE TABLE IF NOT EXISTS `transaction` (`Key` TEXT, `Entry_No` INTEGER NOT NULL, `No` TEXT NOT NULL, `Date` INTEGER, `Type` TEXT, `transtype` TEXT NOT NULL, `PayMode` TEXT, `Pay_Mode` TEXT, `Cheque_Deposit_Slip_No` TEXT, `Cheque_Deposit_Slip_Date` INTEGER, `Bank_Code` TEXT, `Received_From` TEXT, `On_Behalf_Of` TEXT, `Cashier` TEXT, `Account_No` TEXT NOT NULL, `Account_Name` TEXT, `Posted` INTEGER, `Date_Posted` INTEGER, `Time_Posted` INTEGER, `Posted_By` TEXT, `Amount` REAL, `Remarks` TEXT, `Transaction_Name` TEXT, `Branch_Code` TEXT, `Agent_Code` TEXT, `Grouping` TEXT, `Global_Dimension_1_Code` TEXT, `Shortcut_Dimension_2_Code` TEXT, `VAT_Percent` REAL, `Currency_Code` TEXT, `Currency_Factor` REAL, `VAT_Bus_Posting_Group` TEXT, `VAT_Prod_Posting_Group` TEXT, `Gen_Posting_TypeSpecified` INTEGER, `Gen_Bus_Posting_Group` TEXT, `Gen_Prod_Posting_Group` TEXT, `VAT_Amount` REAL, `Total_Amount` REAL, `User_ID` TEXT, `Apply_to` TEXT, `Apply_to_ID` TEXT, `Dest_Global_Dimension_1_Code` TEXT, `Dest_Shortcut_Dimension_2_Code` TEXT, `Line_No` INTEGER NOT NULL, `Print_No` INTEGER NOT NULL, `Deposit_Slip_Time` INTEGER, `Teller_ID` TEXT, `Customer_Payment_On_Account` INTEGER, `Select` INTEGER, `Batch_Posted` INTEGER, `Transaction_No` TEXT, `Cheque_Deposit_Slip_Bank` TEXT, `Bank_Account` TEXT, `Confirmed` INTEGER, `Reconciled` INTEGER, `Orig_Cashier` TEXT, `Cancelled` INTEGER, `Cancelled_By` TEXT, `Cancelled_Date` INTEGER, `Cancelled_Time` INTEGER, `Post_Dated` INTEGER, `Cheque_Retrieved` INTEGER, `Register_Number` INTEGER NOT NULL, `From_Entry_No` INTEGER NOT NULL, `To_Entry_No` INTEGER NOT NULL, `Batch_Posted_UserID` TEXT, `BD_Register_Number` INTEGER NOT NULL, `BD_From_Number` INTEGER NOT NULL, `BD_To_Number` INTEGER NOT NULL, `Reversal_By` TEXT, `Reversal_Date` INTEGER, `Reversal_Time` INTEGER, `Reversal_Register_No` INTEGER NOT NULL, `Reversal_From_Entry_No` INTEGER NOT NULL, `Reversal_To_Entry_No` INTEGER NOT NULL, `Reversed` INTEGER, `Applies_to_Doc_No` TEXT, `Applies_to_ID` TEXT, `Grant_No` TEXT, `Installment_Number` INTEGER NOT NULL, `Next_Installment_Date` INTEGER, `Dimension_Set_ID` INTEGER NOT NULL, `Donor` TEXT, `Group_Code` TEXT, `Pre_ADM_Fines` REAL, `Med_Fines` REAL, `Loan_No` TEXT, `Penalty` REAL, `sent` INTEGER NOT NULL, PRIMARY KEY(`No`, `Account_No`, `transtype`))"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 50
    const-string v0, "CREATE TABLE IF NOT EXISTS `types` (`Code` TEXT NOT NULL, `Name` TEXT, `Active` INTEGER, `Account` TEXT, `Order` INTEGER NOT NULL, PRIMARY KEY(`Code`))"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 51
    const-string v0, "CREATE TABLE IF NOT EXISTS `loan` (`Loan_No` TEXT NOT NULL, `Application_Date` TEXT, `Loan_Product_Type` TEXT, `Client_Code` TEXT, `Balance` REAL, `Loan_Product_Type_Name` TEXT, PRIMARY KEY(`Loan_No`))"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 52
    const-string v0, "CREATE TABLE IF NOT EXISTS `theader` (`Key` TEXT, `No` TEXT NOT NULL, `Date` INTEGER, `DateSpecified` INTEGER, `Cashier` TEXT, `Date_Posted` INTEGER, `Date_PostedSpecified` INTEGER, `Time_Posted` INTEGER, `Time_PostedSpecified` INTEGER, `Posted` INTEGER, `PostedSpecified` INTEGER, `No_Series` TEXT, `Bank_Code` TEXT, `Received_From` TEXT, `On_Behalf_Of` TEXT, `Amount_Recieved` REAL NOT NULL, `Amount_RecievedSpecified` INTEGER, `Global_Dimension_1_Code` TEXT, `Shortcut_Dimension_2_Code` TEXT, `Currency_Code` TEXT, `Currency_Factor` REAL NOT NULL, `Currency_FactorSpecified` INTEGER, `Total_Amount` REAL NOT NULL, `Total_AmountSpecified` INTEGER, `Posted_By` TEXT, `Print_No` INTEGER NOT NULL, `Print_NoSpecified` INTEGER, `StatusSpecified` INTEGER, `Cheque_No` TEXT, `No_Printed` INTEGER NOT NULL, `No_PrintedSpecified` INTEGER, `Created_By` TEXT, `Created_Date_Time` INTEGER, `Created_Date_TimeSpecified` INTEGER, `Register_No` INTEGER NOT NULL, `Register_NoSpecified` INTEGER, `From_Entry_No` INTEGER NOT NULL, `From_Entry_NoSpecified` INTEGER, `To_Entry_No` INTEGER NOT NULL, `To_Entry_NoSpecified` INTEGER, `Document_Date` INTEGER, `Document_DateSpecified` INTEGER, `Responsibility_Center` TEXT, `Shortcut_Dimension_3_Code` TEXT, `Shortcut_Dimension_4_Code` TEXT, `Dim3` TEXT, `Dim4` TEXT, `Bank_Name` TEXT, `Receipt_TypeSpecified` INTEGER, `Dimension_Set_ID` INTEGER NOT NULL, `Dimension_Set_IDSpecified` INTEGER, `Dim1` TEXT, `Dim2` TEXT, `Account_No` TEXT, `Name` TEXT, `PayMode` TEXT, `Pay_ModeSpecified` INTEGER, `Cheque_Deposit_Slip_No` TEXT, `Cheque_Deposit_Slip_Date` INTEGER, `Cheque_Deposit_Slip_DateSpecified` INTEGER, `Total_Amount_Guaranteed` REAL NOT NULL, `Total_Amount_GuaranteedSpecified` INTEGER, `DFLT` REAL NOT NULL, `DFLTSpecified` INTEGER, `Group_Name` TEXT, `Reference_No` TEXT, `Bank_Ref_No` TEXT, `sent` INTEGER NOT NULL, PRIMARY KEY(`No`))"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 53
    const-string v0, "CREATE TABLE IF NOT EXISTS `payment_modes` (`Code` TEXT NOT NULL, `Name` TEXT, PRIMARY KEY(`Code`))"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 54
    const-string v0, "CREATE TABLE IF NOT EXISTS `Vehicles` (`Vehicle_Number` TEXT NOT NULL, `vehicle_type` INTEGER NOT NULL, `Daily_Contribution` REAL, `Start_Date` TEXT, `Code` TEXT, `Id_Number` TEXT, `Arrears` REAL NOT NULL, `Penalty` REAL NOT NULL, `Fleet_No` TEXT, PRIMARY KEY(`Vehicle_Number`))"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 55
    const-string v0, "CREATE TABLE IF NOT EXISTS room_master_table (id INTEGER PRIMARY KEY,identity_hash TEXT)"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 56
    const-string v0, "INSERT OR REPLACE INTO room_master_table (id,identity_hash) VALUES(42, \'b44933ff7a4b90d14e8dc7849dd3b2de\')"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 57
    return-void
.end method

.method public dropAllTables(Landroidx/sqlite/SQLiteConnection;)V
    .locals 1
    .param p1, "connection"    # Landroidx/sqlite/SQLiteConnection;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "connection"
        }
    .end annotation

    .line 61
    const-string v0, "DROP TABLE IF EXISTS `Member`"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 62
    const-string v0, "DROP TABLE IF EXISTS `agent`"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 63
    const-string v0, "DROP TABLE IF EXISTS `transaction`"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 64
    const-string v0, "DROP TABLE IF EXISTS `types`"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 65
    const-string v0, "DROP TABLE IF EXISTS `loan`"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 66
    const-string v0, "DROP TABLE IF EXISTS `theader`"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 67
    const-string v0, "DROP TABLE IF EXISTS `payment_modes`"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 68
    const-string v0, "DROP TABLE IF EXISTS `Vehicles`"

    invoke-static {p1, v0}, Landroidx/sqlite/SQLite;->execSQL(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)V

    .line 69
    return-void
.end method

.method public onCreate(Landroidx/sqlite/SQLiteConnection;)V
    .locals 0
    .param p1, "connection"    # Landroidx/sqlite/SQLiteConnection;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "connection"
        }
    .end annotation

    .line 73
    return-void
.end method

.method public onOpen(Landroidx/sqlite/SQLiteConnection;)V
    .locals 1
    .param p1, "connection"    # Landroidx/sqlite/SQLiteConnection;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "connection"
        }
    .end annotation

    .line 77
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl$1;->this$0:Lcom/trimline/metrocrew/DB_Impl;

    invoke-static {v0, p1}, Lcom/trimline/metrocrew/DB_Impl;->access$000(Lcom/trimline/metrocrew/DB_Impl;Landroidx/sqlite/SQLiteConnection;)V

    .line 78
    return-void
.end method

.method public onPostMigrate(Landroidx/sqlite/SQLiteConnection;)V
    .locals 0
    .param p1, "connection"    # Landroidx/sqlite/SQLiteConnection;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "connection"
        }
    .end annotation

    .line 87
    return-void
.end method

.method public onPreMigrate(Landroidx/sqlite/SQLiteConnection;)V
    .locals 0
    .param p1, "connection"    # Landroidx/sqlite/SQLiteConnection;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "connection"
        }
    .end annotation

    .line 82
    invoke-static {p1}, Landroidx/room/util/DBUtil;->dropFtsSyncTriggers(Landroidx/sqlite/SQLiteConnection;)V

    .line 83
    return-void
.end method

.method public onValidateSchema(Landroidx/sqlite/SQLiteConnection;)Landroidx/room/RoomOpenDelegate$ValidationResult;
    .locals 52
    .param p1, "connection"    # Landroidx/sqlite/SQLiteConnection;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "connection"
        }
    .end annotation

    .line 93
    move-object/from16 v0, p1

    new-instance v1, Ljava/util/HashMap;

    const/16 v2, 0x9

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 94
    .local v1, "_columnsMember":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    new-instance v3, Landroidx/room/util/TableInfo$Column;

    const/4 v8, 0x0

    const/4 v9, 0x1

    const-string v4, "No"

    const-string v5, "TEXT"

    const/4 v6, 0x1

    const/4 v7, 0x1

    invoke-direct/range {v3 .. v9}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v4, "No"

    invoke-interface {v1, v4, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    new-instance v5, Landroidx/room/util/TableInfo$Column;

    const/4 v10, 0x0

    const/4 v11, 0x1

    const-string v6, "Name"

    const-string v7, "TEXT"

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v5 .. v11}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v3, "Name"

    invoke-interface {v1, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    new-instance v6, Landroidx/room/util/TableInfo$Column;

    const/4 v11, 0x0

    const/4 v12, 0x1

    const-string v7, "ID_No"

    const-string v8, "TEXT"

    const/4 v10, 0x0

    invoke-direct/range {v6 .. v12}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v5, "ID_No"

    invoke-interface {v1, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    new-instance v7, Landroidx/room/util/TableInfo$Column;

    const/4 v12, 0x0

    const/4 v13, 0x1

    const-string v8, "Phone_No"

    const-string v9, "TEXT"

    const/4 v11, 0x0

    invoke-direct/range {v7 .. v13}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v5, "Phone_No"

    invoke-interface {v1, v5, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    new-instance v8, Landroidx/room/util/TableInfo$Column;

    const/4 v13, 0x0

    const/4 v14, 0x1

    const-string v9, "Outstanding_Balance"

    const-string v10, "REAL"

    const/4 v11, 0x1

    const/4 v12, 0x0

    invoke-direct/range {v8 .. v14}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v5, "Outstanding_Balance"

    invoke-interface {v1, v5, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    new-instance v9, Landroidx/room/util/TableInfo$Column;

    const/4 v14, 0x0

    const/4 v15, 0x1

    const-string v10, "Shares_Retained"

    const-string v11, "REAL"

    const/4 v12, 0x1

    const/4 v13, 0x0

    invoke-direct/range {v9 .. v15}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v5, "Shares_Retained"

    invoke-interface {v1, v5, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    new-instance v10, Landroidx/room/util/TableInfo$Column;

    const/4 v15, 0x0

    const/16 v16, 0x1

    const-string v11, "Current_Shares"

    const-string v12, "REAL"

    const/4 v13, 0x1

    const/4 v14, 0x0

    invoke-direct/range {v10 .. v16}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v5, "Current_Shares"

    invoke-interface {v1, v5, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    new-instance v11, Landroidx/room/util/TableInfo$Column;

    const/16 v16, 0x0

    const/16 v17, 0x1

    const-string v12, "Current_Savings"

    const-string v13, "REAL"

    const/4 v14, 0x1

    const/4 v15, 0x0

    invoke-direct/range {v11 .. v17}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v5, "Current_Savings"

    invoke-interface {v1, v5, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    new-instance v12, Landroidx/room/util/TableInfo$Column;

    const/16 v17, 0x0

    const/16 v18, 0x1

    const-string v13, "Registration_Fee_Paid"

    const-string v14, "REAL"

    const/4 v15, 0x1

    const/16 v16, 0x0

    invoke-direct/range {v12 .. v18}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v5, "Registration_Fee_Paid"

    invoke-interface {v1, v5, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 103
    new-instance v5, Ljava/util/HashSet;

    const/4 v6, 0x0

    invoke-direct {v5, v6}, Ljava/util/HashSet;-><init>(I)V

    .line 104
    .local v5, "_foreignKeysMember":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    new-instance v7, Ljava/util/HashSet;

    invoke-direct {v7, v6}, Ljava/util/HashSet;-><init>(I)V

    .line 105
    .local v7, "_indicesMember":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$Index;>;"
    new-instance v8, Landroidx/room/util/TableInfo;

    const-string v9, "Member"

    invoke-direct {v8, v9, v1, v5, v7}, Landroidx/room/util/TableInfo;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Set;Ljava/util/Set;)V

    .line 106
    .local v8, "_infoMember":Landroidx/room/util/TableInfo;
    invoke-static {v0, v9}, Landroidx/room/util/TableInfo;->read(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)Landroidx/room/util/TableInfo;

    move-result-object v9

    .line 107
    .local v9, "_existingMember":Landroidx/room/util/TableInfo;
    invoke-virtual {v8, v9}, Landroidx/room/util/TableInfo;->equals(Ljava/lang/Object;)Z

    move-result v10

    const-string v11, "\n Found:\n"

    if-nez v10, :cond_0

    .line 108
    new-instance v2, Landroidx/room/RoomOpenDelegate$ValidationResult;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Member(com.trimline.metrocrew.Member).\n Expected:\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v6, v3}, Landroidx/room/RoomOpenDelegate$ValidationResult;-><init>(ZLjava/lang/String;)V

    return-object v2

    .line 112
    :cond_0
    new-instance v10, Ljava/util/HashMap;

    const/16 v12, 0xa

    invoke-direct {v10, v12}, Ljava/util/HashMap;-><init>(I)V

    .line 113
    .local v10, "_columnsAgent":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    new-instance v12, Landroidx/room/util/TableInfo$Column;

    const/16 v17, 0x0

    const/16 v18, 0x1

    const-string v13, "Agent_Code"

    const-string v14, "TEXT"

    const/4 v15, 0x1

    const/16 v16, 0x1

    invoke-direct/range {v12 .. v18}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v13, "Agent_Code"

    invoke-interface {v10, v13, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    new-instance v14, Landroidx/room/util/TableInfo$Column;

    const/16 v19, 0x0

    const/16 v20, 0x1

    const-string v15, "Customer_ID_No"

    const-string v16, "TEXT"

    const/16 v17, 0x0

    const/16 v18, 0x0

    invoke-direct/range {v14 .. v20}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v12, "Customer_ID_No"

    invoke-interface {v10, v12, v14}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 115
    new-instance v15, Landroidx/room/util/TableInfo$Column;

    const/16 v20, 0x0

    const/16 v21, 0x1

    const-string v16, "Mobile_No"

    const-string v17, "TEXT"

    const/16 v19, 0x0

    invoke-direct/range {v15 .. v21}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v12, "Mobile_No"

    invoke-interface {v10, v12, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    new-instance v16, Landroidx/room/util/TableInfo$Column;

    const/16 v21, 0x0

    const/16 v22, 0x1

    const-string v17, "Status"

    const-string v18, "INTEGER"

    const/16 v19, 0x1

    const/16 v20, 0x0

    invoke-direct/range {v16 .. v22}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v12, v16

    const-string v14, "Status"

    invoke-interface {v10, v14, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    new-instance v15, Landroidx/room/util/TableInfo$Column;

    const/16 v20, 0x0

    const/16 v21, 0x1

    const-string v16, "Name"

    const-string v17, "TEXT"

    const/16 v18, 0x0

    const/16 v19, 0x0

    invoke-direct/range {v15 .. v21}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    invoke-interface {v10, v3, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 118
    new-instance v16, Landroidx/room/util/TableInfo$Column;

    const/16 v21, 0x0

    const-string v17, "Account"

    const-string v18, "TEXT"

    const/16 v20, 0x0

    invoke-direct/range {v16 .. v22}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v12, v16

    const-string v14, "Account"

    invoke-interface {v10, v14, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 119
    new-instance v15, Landroidx/room/util/TableInfo$Column;

    const/16 v20, 0x0

    const/16 v21, 0x1

    const-string v16, "Password"

    const-string v17, "TEXT"

    const/16 v18, 0x0

    invoke-direct/range {v15 .. v21}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    const-string v12, "Password"

    invoke-interface {v10, v12, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 120
    new-instance v16, Landroidx/room/util/TableInfo$Column;

    const/16 v21, 0x0

    const-string v17, "Constituency"

    const-string v18, "TEXT"

    const/16 v20, 0x0

    invoke-direct/range {v16 .. v22}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v12, v16

    const-string v15, "Constituency"

    invoke-interface {v10, v15, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 121
    new-instance v16, Landroidx/room/util/TableInfo$Column;

    const-string v17, "Account_type"

    const-string v18, "INTEGER"

    const/16 v19, 0x1

    invoke-direct/range {v16 .. v22}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v12, v16

    const-string v15, "Account_type"

    invoke-interface {v10, v15, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 122
    new-instance v16, Landroidx/room/util/TableInfo$Column;

    const-string v17, "Balance"

    const-string v18, "REAL"

    invoke-direct/range {v16 .. v22}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v12, v16

    const-string v15, "Balance"

    invoke-interface {v10, v15, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    new-instance v12, Ljava/util/HashSet;

    invoke-direct {v12, v6}, Ljava/util/HashSet;-><init>(I)V

    .line 124
    .local v12, "_foreignKeysAgent":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2, v6}, Ljava/util/HashSet;-><init>(I)V

    .line 125
    .local v2, "_indicesAgent":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$Index;>;"
    new-instance v6, Landroidx/room/util/TableInfo;

    move-object/from16 v18, v1

    .end local v1    # "_columnsMember":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    .local v18, "_columnsMember":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    const-string v1, "agent"

    invoke-direct {v6, v1, v10, v12, v2}, Landroidx/room/util/TableInfo;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Set;Ljava/util/Set;)V

    .line 126
    .local v6, "_infoAgent":Landroidx/room/util/TableInfo;
    invoke-static {v0, v1}, Landroidx/room/util/TableInfo;->read(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)Landroidx/room/util/TableInfo;

    move-result-object v1

    .line 127
    .local v1, "_existingAgent":Landroidx/room/util/TableInfo;
    invoke-virtual {v6, v1}, Landroidx/room/util/TableInfo;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-nez v19, :cond_1

    .line 128
    new-instance v3, Landroidx/room/RoomOpenDelegate$ValidationResult;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "agent(com.trimline.metrocrew.agent).\n Expected:\n"

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v11, 0x0

    invoke-direct {v3, v11, v4}, Landroidx/room/RoomOpenDelegate$ValidationResult;-><init>(ZLjava/lang/String;)V

    return-object v3

    .line 132
    :cond_1
    move-object/from16 v19, v1

    .end local v1    # "_existingAgent":Landroidx/room/util/TableInfo;
    .local v19, "_existingAgent":Landroidx/room/util/TableInfo;
    new-instance v1, Ljava/util/HashMap;

    move-object/from16 v20, v2

    .end local v2    # "_indicesAgent":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$Index;>;"
    .local v20, "_indicesAgent":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$Index;>;"
    const/16 v2, 0x59

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 133
    .local v1, "_columnsTransaction":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    new-instance v21, Landroidx/room/util/TableInfo$Column;

    const/16 v26, 0x0

    const/16 v27, 0x1

    const/16 v24, 0x0

    const/16 v25, 0x0

    const-string v22, "Key"

    const-string v23, "TEXT"

    invoke-direct/range {v21 .. v27}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v21

    move-object/from16 v21, v5

    .end local v5    # "_foreignKeysMember":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    .local v21, "_foreignKeysMember":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    const-string v5, "Key"

    invoke-interface {v1, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 134
    new-instance v22, Landroidx/room/util/TableInfo$Column;

    const/16 v27, 0x0

    const/16 v28, 0x1

    const/16 v25, 0x1

    const/16 v26, 0x0

    const-string v23, "Entry_No"

    const-string v24, "INTEGER"

    invoke-direct/range {v22 .. v28}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v22

    move-object/from16 v22, v6

    .end local v6    # "_infoAgent":Landroidx/room/util/TableInfo;
    .local v22, "_infoAgent":Landroidx/room/util/TableInfo;
    const-string v6, "Entry_No"

    invoke-interface {v1, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 135
    new-instance v23, Landroidx/room/util/TableInfo$Column;

    const/16 v28, 0x0

    const/16 v29, 0x1

    const/16 v26, 0x1

    const/16 v27, 0x1

    const-string v24, "No"

    const-string v25, "TEXT"

    invoke-direct/range {v23 .. v29}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v23

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    new-instance v23, Landroidx/room/util/TableInfo$Column;

    const/16 v26, 0x0

    const/16 v27, 0x0

    const-string v24, "Date"

    const-string v25, "INTEGER"

    invoke-direct/range {v23 .. v29}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v23

    const-string v6, "Date"

    invoke-interface {v1, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 137
    new-instance v23, Landroidx/room/util/TableInfo$Column;

    const-string v24, "Type"

    const-string v25, "TEXT"

    invoke-direct/range {v23 .. v29}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v23

    move-object/from16 v23, v7

    .end local v7    # "_indicesMember":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$Index;>;"
    .local v23, "_indicesMember":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$Index;>;"
    const-string v7, "Type"

    invoke-interface {v1, v7, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    new-instance v24, Landroidx/room/util/TableInfo$Column;

    const/16 v29, 0x0

    const/16 v30, 0x1

    const/16 v27, 0x1

    const/16 v28, 0x3

    const-string v25, "transtype"

    const-string v26, "TEXT"

    invoke-direct/range {v24 .. v30}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v24

    const-string v7, "transtype"

    invoke-interface {v1, v7, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    new-instance v24, Landroidx/room/util/TableInfo$Column;

    const/16 v27, 0x0

    const/16 v28, 0x0

    const-string v25, "PayMode"

    const-string v26, "TEXT"

    invoke-direct/range {v24 .. v30}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v24

    const-string v7, "PayMode"

    invoke-interface {v1, v7, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    new-instance v24, Landroidx/room/util/TableInfo$Column;

    const-string v25, "Pay_Mode"

    const-string v26, "TEXT"

    invoke-direct/range {v24 .. v30}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v24

    move-object/from16 v24, v8

    .end local v8    # "_infoMember":Landroidx/room/util/TableInfo;
    .local v24, "_infoMember":Landroidx/room/util/TableInfo;
    const-string v8, "Pay_Mode"

    invoke-interface {v1, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    new-instance v25, Landroidx/room/util/TableInfo$Column;

    const/16 v30, 0x0

    const/16 v31, 0x1

    const/16 v29, 0x0

    const-string v26, "Cheque_Deposit_Slip_No"

    const-string v27, "TEXT"

    invoke-direct/range {v25 .. v31}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v25

    const-string v8, "Cheque_Deposit_Slip_No"

    invoke-interface {v1, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 142
    new-instance v25, Landroidx/room/util/TableInfo$Column;

    const-string v26, "Cheque_Deposit_Slip_Date"

    const-string v27, "INTEGER"

    invoke-direct/range {v25 .. v31}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v25

    move-object/from16 v25, v9

    .end local v9    # "_existingMember":Landroidx/room/util/TableInfo;
    .local v25, "_existingMember":Landroidx/room/util/TableInfo;
    const-string v9, "Cheque_Deposit_Slip_Date"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    new-instance v26, Landroidx/room/util/TableInfo$Column;

    const/16 v31, 0x0

    const/16 v32, 0x1

    const/16 v30, 0x0

    const-string v27, "Bank_Code"

    const-string v28, "TEXT"

    invoke-direct/range {v26 .. v32}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v26

    move-object/from16 v26, v10

    .end local v10    # "_columnsAgent":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    .local v26, "_columnsAgent":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    const-string v10, "Bank_Code"

    invoke-interface {v1, v10, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    new-instance v27, Landroidx/room/util/TableInfo$Column;

    const/16 v32, 0x0

    const/16 v33, 0x1

    const/16 v31, 0x0

    const-string v28, "Received_From"

    const-string v29, "TEXT"

    invoke-direct/range {v27 .. v33}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v27

    move-object/from16 v27, v12

    .end local v12    # "_foreignKeysAgent":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    .local v27, "_foreignKeysAgent":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    const-string v12, "Received_From"

    invoke-interface {v1, v12, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    new-instance v28, Landroidx/room/util/TableInfo$Column;

    const/16 v33, 0x0

    const/16 v34, 0x1

    const/16 v32, 0x0

    const-string v29, "On_Behalf_Of"

    const-string v30, "TEXT"

    invoke-direct/range {v28 .. v34}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v28

    move-object/from16 v28, v9

    const-string v9, "On_Behalf_Of"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    new-instance v29, Landroidx/room/util/TableInfo$Column;

    const/16 v34, 0x0

    const/16 v35, 0x1

    const/16 v33, 0x0

    const-string v30, "Cashier"

    const-string v31, "TEXT"

    invoke-direct/range {v29 .. v35}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v29

    move-object/from16 v29, v8

    const-string v8, "Cashier"

    invoke-interface {v1, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 147
    new-instance v30, Landroidx/room/util/TableInfo$Column;

    const/16 v35, 0x0

    const/16 v36, 0x1

    const/16 v33, 0x1

    const/16 v34, 0x2

    const-string v31, "Account_No"

    const-string v32, "TEXT"

    invoke-direct/range {v30 .. v36}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v30

    move-object/from16 v30, v7

    const-string v7, "Account_No"

    invoke-interface {v1, v7, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 148
    new-instance v31, Landroidx/room/util/TableInfo$Column;

    const/16 v36, 0x0

    const/16 v37, 0x1

    const/16 v34, 0x0

    const/16 v35, 0x0

    const-string v32, "Account_Name"

    const-string v33, "TEXT"

    invoke-direct/range {v31 .. v37}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v31

    move-object/from16 v31, v7

    const-string v7, "Account_Name"

    invoke-interface {v1, v7, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    new-instance v32, Landroidx/room/util/TableInfo$Column;

    const/16 v37, 0x0

    const/16 v38, 0x1

    const/16 v36, 0x0

    const-string v33, "Posted"

    const-string v34, "INTEGER"

    invoke-direct/range {v32 .. v38}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v32

    const-string v7, "Posted"

    invoke-interface {v1, v7, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    new-instance v32, Landroidx/room/util/TableInfo$Column;

    const-string v33, "Date_Posted"

    const-string v34, "INTEGER"

    invoke-direct/range {v32 .. v38}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v32

    move-object/from16 v32, v9

    const-string v9, "Date_Posted"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 151
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const/16 v38, 0x0

    const/16 v39, 0x1

    const/16 v37, 0x0

    const-string v34, "Time_Posted"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Time_Posted"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Posted_By"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Posted_By"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Amount"

    const-string v35, "REAL"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Amount"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 154
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Remarks"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Remarks"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Transaction_Name"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Transaction_Name"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Branch_Code"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Branch_Code"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Agent_Code"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    invoke-interface {v1, v13, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Grouping"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Grouping"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Global_Dimension_1_Code"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Global_Dimension_1_Code"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Shortcut_Dimension_2_Code"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Shortcut_Dimension_2_Code"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "VAT_Percent"

    const-string v35, "REAL"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "VAT_Percent"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Currency_Code"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Currency_Code"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Currency_Factor"

    const-string v35, "REAL"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Currency_Factor"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "VAT_Bus_Posting_Group"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "VAT_Bus_Posting_Group"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "VAT_Prod_Posting_Group"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "VAT_Prod_Posting_Group"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Gen_Posting_TypeSpecified"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Gen_Posting_TypeSpecified"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Gen_Bus_Posting_Group"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Gen_Bus_Posting_Group"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Gen_Prod_Posting_Group"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Gen_Prod_Posting_Group"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 169
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "VAT_Amount"

    const-string v35, "REAL"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "VAT_Amount"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 170
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Total_Amount"

    const-string v35, "REAL"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Total_Amount"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "User_ID"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "User_ID"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Apply_to"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Apply_to"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Apply_to_ID"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Apply_to_ID"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Dest_Global_Dimension_1_Code"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Dest_Global_Dimension_1_Code"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Dest_Shortcut_Dimension_2_Code"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Dest_Shortcut_Dimension_2_Code"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const/16 v36, 0x1

    const-string v34, "Line_No"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Line_No"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Print_No"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Print_No"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 178
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const/16 v36, 0x0

    const-string v34, "Deposit_Slip_Time"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Deposit_Slip_Time"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Teller_ID"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Teller_ID"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Customer_Payment_On_Account"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Customer_Payment_On_Account"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Select"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Select"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Batch_Posted"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Batch_Posted"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Transaction_No"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Transaction_No"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Cheque_Deposit_Slip_Bank"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Cheque_Deposit_Slip_Bank"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Bank_Account"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Bank_Account"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Confirmed"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Confirmed"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Reconciled"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Reconciled"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 188
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Orig_Cashier"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Orig_Cashier"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 189
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Cancelled"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Cancelled"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Cancelled_By"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Cancelled_By"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Cancelled_Date"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Cancelled_Date"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Cancelled_Time"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Cancelled_Time"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 193
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Post_Dated"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Post_Dated"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Cheque_Retrieved"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Cheque_Retrieved"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const/16 v36, 0x1

    const-string v34, "Register_Number"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Register_Number"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 196
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "From_Entry_No"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "From_Entry_No"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "To_Entry_No"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "To_Entry_No"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 198
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const/16 v36, 0x0

    const-string v34, "Batch_Posted_UserID"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Batch_Posted_UserID"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const/16 v36, 0x1

    const-string v34, "BD_Register_Number"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "BD_Register_Number"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "BD_From_Number"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "BD_From_Number"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 201
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "BD_To_Number"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "BD_To_Number"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 202
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const/16 v36, 0x0

    const-string v34, "Reversal_By"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Reversal_By"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 203
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Reversal_Date"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Reversal_Date"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Reversal_Time"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Reversal_Time"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const/16 v36, 0x1

    const-string v34, "Reversal_Register_No"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Reversal_Register_No"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Reversal_From_Entry_No"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Reversal_From_Entry_No"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 207
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Reversal_To_Entry_No"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Reversal_To_Entry_No"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const/16 v36, 0x0

    const-string v34, "Reversed"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Reversed"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Applies_to_Doc_No"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Applies_to_Doc_No"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 210
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Applies_to_ID"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Applies_to_ID"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Grant_No"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Grant_No"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const/16 v36, 0x1

    const-string v34, "Installment_Number"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Installment_Number"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const/16 v36, 0x0

    const-string v34, "Next_Installment_Date"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Next_Installment_Date"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const/16 v36, 0x1

    const-string v34, "Dimension_Set_ID"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Dimension_Set_ID"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const/16 v36, 0x0

    const-string v34, "Donor"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Donor"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Group_Code"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Group_Code"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 217
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Pre_ADM_Fines"

    const-string v35, "REAL"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Pre_ADM_Fines"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 218
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Med_Fines"

    const-string v35, "REAL"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Med_Fines"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 219
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Loan_No"

    const-string v35, "TEXT"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Loan_No"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 220
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const-string v34, "Penalty"

    const-string v35, "REAL"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "Penalty"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    new-instance v33, Landroidx/room/util/TableInfo$Column;

    const/16 v36, 0x1

    const-string v34, "sent"

    const-string v35, "INTEGER"

    invoke-direct/range {v33 .. v39}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v33

    const-string v9, "sent"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    new-instance v2, Ljava/util/HashSet;

    const/4 v9, 0x0

    invoke-direct {v2, v9}, Ljava/util/HashSet;-><init>(I)V

    .line 223
    .local v2, "_foreignKeysTransaction":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    new-instance v13, Ljava/util/HashSet;

    invoke-direct {v13, v9}, Ljava/util/HashSet;-><init>(I)V

    .line 224
    .local v13, "_indicesTransaction":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$Index;>;"
    new-instance v9, Landroidx/room/util/TableInfo;

    move-object/from16 v33, v12

    const-string v12, "transaction"

    invoke-direct {v9, v12, v1, v2, v13}, Landroidx/room/util/TableInfo;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Set;Ljava/util/Set;)V

    .line 225
    .local v9, "_infoTransaction":Landroidx/room/util/TableInfo;
    const-string v12, "transaction"

    invoke-static {v0, v12}, Landroidx/room/util/TableInfo;->read(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)Landroidx/room/util/TableInfo;

    move-result-object v12

    .line 226
    .local v12, "_existingTransaction":Landroidx/room/util/TableInfo;
    invoke-virtual {v9, v12}, Landroidx/room/util/TableInfo;->equals(Ljava/lang/Object;)Z

    move-result v34

    if-nez v34, :cond_2

    .line 227
    new-instance v3, Landroidx/room/RoomOpenDelegate$ValidationResult;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "transaction(com.trimline.metrocrew.transaction).\n Expected:\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v11, 0x0

    invoke-direct {v3, v11, v4}, Landroidx/room/RoomOpenDelegate$ValidationResult;-><init>(ZLjava/lang/String;)V

    return-object v3

    .line 231
    :cond_2
    move-object/from16 v34, v1

    .end local v1    # "_columnsTransaction":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    .local v34, "_columnsTransaction":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    new-instance v1, Ljava/util/HashMap;

    move-object/from16 v35, v2

    .end local v2    # "_foreignKeysTransaction":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    .local v35, "_foreignKeysTransaction":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    const/4 v2, 0x5

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 232
    .local v1, "_columnsTypes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    new-instance v36, Landroidx/room/util/TableInfo$Column;

    const/16 v41, 0x0

    const/16 v42, 0x1

    const-string v37, "Code"

    const-string v38, "TEXT"

    const/16 v39, 0x1

    const/16 v40, 0x1

    invoke-direct/range {v36 .. v42}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v36

    move-object/from16 v36, v9

    .end local v9    # "_infoTransaction":Landroidx/room/util/TableInfo;
    .local v36, "_infoTransaction":Landroidx/room/util/TableInfo;
    const-string v9, "Code"

    invoke-interface {v1, v9, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 233
    new-instance v37, Landroidx/room/util/TableInfo$Column;

    const/16 v42, 0x0

    const/16 v43, 0x1

    const-string v38, "Name"

    const-string v39, "TEXT"

    const/16 v40, 0x0

    const/16 v41, 0x0

    invoke-direct/range {v37 .. v43}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v37

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    new-instance v37, Landroidx/room/util/TableInfo$Column;

    const-string v38, "Active"

    const-string v39, "INTEGER"

    invoke-direct/range {v37 .. v43}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v37

    move-object/from16 v37, v12

    .end local v12    # "_existingTransaction":Landroidx/room/util/TableInfo;
    .local v37, "_existingTransaction":Landroidx/room/util/TableInfo;
    const-string v12, "Active"

    invoke-interface {v1, v12, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    new-instance v38, Landroidx/room/util/TableInfo$Column;

    const/16 v43, 0x0

    const/16 v44, 0x1

    const-string v39, "Account"

    const-string v40, "TEXT"

    const/16 v42, 0x0

    invoke-direct/range {v38 .. v44}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v38

    invoke-interface {v1, v14, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    new-instance v38, Landroidx/room/util/TableInfo$Column;

    const-string v39, "Order"

    const-string v40, "INTEGER"

    const/16 v41, 0x1

    invoke-direct/range {v38 .. v44}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v38

    const-string v12, "Order"

    invoke-interface {v1, v12, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    new-instance v2, Ljava/util/HashSet;

    const/4 v12, 0x0

    invoke-direct {v2, v12}, Ljava/util/HashSet;-><init>(I)V

    .line 238
    .local v2, "_foreignKeysTypes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    new-instance v14, Ljava/util/HashSet;

    invoke-direct {v14, v12}, Ljava/util/HashSet;-><init>(I)V

    .line 239
    .local v14, "_indicesTypes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$Index;>;"
    new-instance v12, Landroidx/room/util/TableInfo;

    move-object/from16 v38, v13

    .end local v13    # "_indicesTransaction":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$Index;>;"
    .local v38, "_indicesTransaction":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$Index;>;"
    const-string v13, "types"

    invoke-direct {v12, v13, v1, v2, v14}, Landroidx/room/util/TableInfo;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Set;Ljava/util/Set;)V

    .line 240
    .local v12, "_infoTypes":Landroidx/room/util/TableInfo;
    const-string v13, "types"

    invoke-static {v0, v13}, Landroidx/room/util/TableInfo;->read(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)Landroidx/room/util/TableInfo;

    move-result-object v13

    .line 241
    .local v13, "_existingTypes":Landroidx/room/util/TableInfo;
    invoke-virtual {v12, v13}, Landroidx/room/util/TableInfo;->equals(Ljava/lang/Object;)Z

    move-result v39

    if-nez v39, :cond_3

    .line 242
    new-instance v3, Landroidx/room/RoomOpenDelegate$ValidationResult;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "types(com.trimline.metrocrew.types).\n Expected:\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v11, 0x0

    invoke-direct {v3, v11, v4}, Landroidx/room/RoomOpenDelegate$ValidationResult;-><init>(ZLjava/lang/String;)V

    return-object v3

    .line 246
    :cond_3
    move-object/from16 v39, v1

    .end local v1    # "_columnsTypes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    .local v39, "_columnsTypes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    new-instance v1, Ljava/util/HashMap;

    move-object/from16 v40, v2

    .end local v2    # "_foreignKeysTypes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    .local v40, "_foreignKeysTypes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    const/4 v2, 0x6

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 247
    .local v1, "_columnsLoan":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    new-instance v41, Landroidx/room/util/TableInfo$Column;

    const/16 v46, 0x0

    const/16 v47, 0x1

    const-string v42, "Loan_No"

    const-string v43, "TEXT"

    const/16 v44, 0x1

    const/16 v45, 0x1

    invoke-direct/range {v41 .. v47}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v41

    move-object/from16 v41, v12

    .end local v12    # "_infoTypes":Landroidx/room/util/TableInfo;
    .local v41, "_infoTypes":Landroidx/room/util/TableInfo;
    const-string v12, "Loan_No"

    invoke-interface {v1, v12, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 248
    new-instance v42, Landroidx/room/util/TableInfo$Column;

    const/16 v47, 0x0

    const/16 v48, 0x1

    const-string v43, "Application_Date"

    const-string v44, "TEXT"

    const/16 v45, 0x0

    const/16 v46, 0x0

    invoke-direct/range {v42 .. v48}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v42

    const-string v12, "Application_Date"

    invoke-interface {v1, v12, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    new-instance v42, Landroidx/room/util/TableInfo$Column;

    const-string v43, "Loan_Product_Type"

    const-string v44, "TEXT"

    invoke-direct/range {v42 .. v48}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v42

    const-string v12, "Loan_Product_Type"

    invoke-interface {v1, v12, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    new-instance v42, Landroidx/room/util/TableInfo$Column;

    const-string v43, "Client_Code"

    const-string v44, "TEXT"

    invoke-direct/range {v42 .. v48}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v42

    const-string v12, "Client_Code"

    invoke-interface {v1, v12, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    new-instance v42, Landroidx/room/util/TableInfo$Column;

    const-string v43, "Balance"

    const-string v44, "REAL"

    invoke-direct/range {v42 .. v48}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v42

    invoke-interface {v1, v15, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    new-instance v42, Landroidx/room/util/TableInfo$Column;

    const-string v43, "Loan_Product_Type_Name"

    const-string v44, "TEXT"

    invoke-direct/range {v42 .. v48}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v42

    const-string v12, "Loan_Product_Type_Name"

    invoke-interface {v1, v12, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    new-instance v2, Ljava/util/HashSet;

    const/4 v12, 0x0

    invoke-direct {v2, v12}, Ljava/util/HashSet;-><init>(I)V

    .line 254
    .local v2, "_foreignKeysLoan":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    new-instance v15, Ljava/util/HashSet;

    invoke-direct {v15, v12}, Ljava/util/HashSet;-><init>(I)V

    .line 255
    .local v15, "_indicesLoan":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$Index;>;"
    new-instance v12, Landroidx/room/util/TableInfo;

    move-object/from16 v42, v13

    .end local v13    # "_existingTypes":Landroidx/room/util/TableInfo;
    .local v42, "_existingTypes":Landroidx/room/util/TableInfo;
    const-string v13, "loan"

    invoke-direct {v12, v13, v1, v2, v15}, Landroidx/room/util/TableInfo;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Set;Ljava/util/Set;)V

    .line 256
    .local v12, "_infoLoan":Landroidx/room/util/TableInfo;
    const-string v13, "loan"

    invoke-static {v0, v13}, Landroidx/room/util/TableInfo;->read(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)Landroidx/room/util/TableInfo;

    move-result-object v13

    .line 257
    .local v13, "_existingLoan":Landroidx/room/util/TableInfo;
    invoke-virtual {v12, v13}, Landroidx/room/util/TableInfo;->equals(Ljava/lang/Object;)Z

    move-result v43

    if-nez v43, :cond_4

    .line 258
    new-instance v3, Landroidx/room/RoomOpenDelegate$ValidationResult;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "loan(com.trimline.metrocrew.loan).\n Expected:\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v11, 0x0

    invoke-direct {v3, v11, v4}, Landroidx/room/RoomOpenDelegate$ValidationResult;-><init>(ZLjava/lang/String;)V

    return-object v3

    .line 262
    :cond_4
    move-object/from16 v43, v1

    .end local v1    # "_columnsLoan":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    .local v43, "_columnsLoan":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    new-instance v1, Ljava/util/HashMap;

    move-object/from16 v44, v2

    .end local v2    # "_foreignKeysLoan":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    .local v44, "_foreignKeysLoan":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    const/16 v2, 0x44

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 263
    .local v1, "_columnsTheader":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v50, 0x0

    const/16 v51, 0x1

    const/16 v48, 0x0

    const/16 v49, 0x0

    const-string v46, "Key"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    invoke-interface {v1, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x1

    const/16 v49, 0x1

    const-string v46, "No"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x0

    const/16 v49, 0x0

    const-string v46, "Date"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    invoke-interface {v1, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "DateSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "DateSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 267
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Cashier"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    invoke-interface {v1, v8, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 268
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Date_Posted"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Date_Posted"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 269
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Date_PostedSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Date_PostedSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Time_Posted"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Time_Posted"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Time_PostedSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Time_PostedSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 272
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Posted"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    invoke-interface {v1, v7, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "PostedSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "PostedSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 274
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "No_Series"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "No_Series"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 275
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Bank_Code"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    invoke-interface {v1, v10, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 276
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Received_From"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v4, v33

    move-object/from16 v2, v45

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "On_Behalf_Of"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v4, v32

    move-object/from16 v2, v45

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x1

    const-string v46, "Amount_Recieved"

    const-string v47, "REAL"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Amount_Recieved"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 279
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x0

    const-string v46, "Amount_RecievedSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Amount_RecievedSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Global_Dimension_1_Code"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Global_Dimension_1_Code"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Shortcut_Dimension_2_Code"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Shortcut_Dimension_2_Code"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 282
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Currency_Code"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Currency_Code"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x1

    const-string v46, "Currency_Factor"

    const-string v47, "REAL"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Currency_Factor"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 284
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x0

    const-string v46, "Currency_FactorSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Currency_FactorSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x1

    const-string v46, "Total_Amount"

    const-string v47, "REAL"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Total_Amount"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 286
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x0

    const-string v46, "Total_AmountSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Total_AmountSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Posted_By"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Posted_By"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x1

    const-string v46, "Print_No"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Print_No"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x0

    const-string v46, "Print_NoSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Print_NoSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 290
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "StatusSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "StatusSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Cheque_No"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Cheque_No"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x1

    const-string v46, "No_Printed"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "No_Printed"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 293
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x0

    const-string v46, "No_PrintedSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "No_PrintedSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Created_By"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Created_By"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Created_Date_Time"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Created_Date_Time"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Created_Date_TimeSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Created_Date_TimeSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x1

    const-string v46, "Register_No"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Register_No"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x0

    const-string v46, "Register_NoSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Register_NoSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x1

    const-string v46, "From_Entry_No"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "From_Entry_No"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 300
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x0

    const-string v46, "From_Entry_NoSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "From_Entry_NoSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 301
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x1

    const-string v46, "To_Entry_No"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "To_Entry_No"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x0

    const-string v46, "To_Entry_NoSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "To_Entry_NoSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Document_Date"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Document_Date"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Document_DateSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Document_DateSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 305
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Responsibility_Center"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Responsibility_Center"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 306
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Shortcut_Dimension_3_Code"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Shortcut_Dimension_3_Code"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Shortcut_Dimension_4_Code"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Shortcut_Dimension_4_Code"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Dim3"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Dim3"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Dim4"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Dim4"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Bank_Name"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Bank_Name"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 311
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Receipt_TypeSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Receipt_TypeSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 312
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x1

    const-string v46, "Dimension_Set_ID"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Dimension_Set_ID"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 313
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x0

    const-string v46, "Dimension_Set_IDSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Dimension_Set_IDSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 314
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Dim1"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Dim1"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Dim2"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Dim2"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 316
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Account_No"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v4, v31

    move-object/from16 v2, v45

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 317
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Name"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "PayMode"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v4, v30

    move-object/from16 v2, v45

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 319
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Pay_ModeSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Pay_ModeSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 320
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Cheque_Deposit_Slip_No"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v4, v29

    move-object/from16 v2, v45

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 321
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Cheque_Deposit_Slip_Date"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v4, v28

    move-object/from16 v2, v45

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 322
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Cheque_Deposit_Slip_DateSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Cheque_Deposit_Slip_DateSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x1

    const-string v46, "Total_Amount_Guaranteed"

    const-string v47, "REAL"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Total_Amount_Guaranteed"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 324
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x0

    const-string v46, "Total_Amount_GuaranteedSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Total_Amount_GuaranteedSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x1

    const-string v46, "DFLT"

    const-string v47, "REAL"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "DFLT"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x0

    const-string v46, "DFLTSpecified"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "DFLTSpecified"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 327
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Group_Name"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Group_Name"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 328
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Reference_No"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Reference_No"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 329
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Bank_Ref_No"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "Bank_Ref_No"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 330
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v48, 0x1

    const-string v46, "sent"

    const-string v47, "INTEGER"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v2, v45

    const-string v4, "sent"

    invoke-interface {v1, v4, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 331
    new-instance v2, Ljava/util/HashSet;

    const/4 v4, 0x0

    invoke-direct {v2, v4}, Ljava/util/HashSet;-><init>(I)V

    .line 332
    .local v2, "_foreignKeysTheader":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5, v4}, Ljava/util/HashSet;-><init>(I)V

    .line 333
    .local v5, "_indicesTheader":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$Index;>;"
    new-instance v4, Landroidx/room/util/TableInfo;

    const-string v6, "theader"

    invoke-direct {v4, v6, v1, v2, v5}, Landroidx/room/util/TableInfo;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Set;Ljava/util/Set;)V

    .line 334
    .local v4, "_infoTheader":Landroidx/room/util/TableInfo;
    const-string v6, "theader"

    invoke-static {v0, v6}, Landroidx/room/util/TableInfo;->read(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)Landroidx/room/util/TableInfo;

    move-result-object v6

    .line 335
    .local v6, "_existingTheader":Landroidx/room/util/TableInfo;
    invoke-virtual {v4, v6}, Landroidx/room/util/TableInfo;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 336
    new-instance v3, Landroidx/room/RoomOpenDelegate$ValidationResult;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "theader(com.trimline.metrocrew.theader).\n Expected:\n"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const/4 v11, 0x0

    invoke-direct {v3, v11, v7}, Landroidx/room/RoomOpenDelegate$ValidationResult;-><init>(ZLjava/lang/String;)V

    return-object v3

    .line 340
    :cond_5
    new-instance v7, Ljava/util/HashMap;

    const/4 v8, 0x2

    invoke-direct {v7, v8}, Ljava/util/HashMap;-><init>(I)V

    .line 341
    .local v7, "_columnsPaymentModes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v50, 0x0

    const/16 v51, 0x1

    const-string v46, "Code"

    const-string v47, "TEXT"

    const/16 v48, 0x1

    const/16 v49, 0x1

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v8, v45

    invoke-interface {v7, v9, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 342
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Name"

    const-string v47, "TEXT"

    const/16 v48, 0x0

    const/16 v49, 0x0

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v8, v45

    invoke-interface {v7, v3, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 343
    new-instance v3, Ljava/util/HashSet;

    const/4 v8, 0x0

    invoke-direct {v3, v8}, Ljava/util/HashSet;-><init>(I)V

    .line 344
    .local v3, "_foreignKeysPaymentModes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    new-instance v10, Ljava/util/HashSet;

    invoke-direct {v10, v8}, Ljava/util/HashSet;-><init>(I)V

    .line 345
    .local v10, "_indicesPaymentModes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$Index;>;"
    new-instance v8, Landroidx/room/util/TableInfo;

    move-object/from16 v28, v1

    .end local v1    # "_columnsTheader":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    .local v28, "_columnsTheader":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    const-string v1, "payment_modes"

    invoke-direct {v8, v1, v7, v3, v10}, Landroidx/room/util/TableInfo;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Set;Ljava/util/Set;)V

    .line 346
    .local v8, "_infoPaymentModes":Landroidx/room/util/TableInfo;
    const-string v1, "payment_modes"

    invoke-static {v0, v1}, Landroidx/room/util/TableInfo;->read(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)Landroidx/room/util/TableInfo;

    move-result-object v1

    .line 347
    .local v1, "_existingPaymentModes":Landroidx/room/util/TableInfo;
    invoke-virtual {v8, v1}, Landroidx/room/util/TableInfo;->equals(Ljava/lang/Object;)Z

    move-result v29

    if-nez v29, :cond_6

    .line 348
    new-instance v9, Landroidx/room/RoomOpenDelegate$ValidationResult;

    move-object/from16 v29, v2

    .end local v2    # "_foreignKeysTheader":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    .local v29, "_foreignKeysTheader":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v30, v3

    .end local v3    # "_foreignKeysPaymentModes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    .local v30, "_foreignKeysPaymentModes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    const-string v3, "payment_modes(com.trimline.metrocrew.payment_modes).\n Expected:\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v11, 0x0

    invoke-direct {v9, v11, v2}, Landroidx/room/RoomOpenDelegate$ValidationResult;-><init>(ZLjava/lang/String;)V

    return-object v9

    .line 352
    .end local v29    # "_foreignKeysTheader":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    .end local v30    # "_foreignKeysPaymentModes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    .restart local v2    # "_foreignKeysTheader":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    .restart local v3    # "_foreignKeysPaymentModes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    :cond_6
    move-object/from16 v29, v2

    move-object/from16 v30, v3

    .end local v2    # "_foreignKeysTheader":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    .end local v3    # "_foreignKeysPaymentModes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    .restart local v29    # "_foreignKeysTheader":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    .restart local v30    # "_foreignKeysPaymentModes":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    new-instance v2, Ljava/util/HashMap;

    const/16 v3, 0x9

    invoke-direct {v2, v3}, Ljava/util/HashMap;-><init>(I)V

    .line 353
    .local v2, "_columnsVehicles":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const/16 v50, 0x0

    const/16 v51, 0x1

    const-string v46, "Vehicle_Number"

    const-string v47, "TEXT"

    const/16 v48, 0x1

    const/16 v49, 0x1

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v16, v1

    move-object/from16 v3, v45

    .end local v1    # "_existingPaymentModes":Landroidx/room/util/TableInfo;
    .local v16, "_existingPaymentModes":Landroidx/room/util/TableInfo;
    const-string v1, "Vehicle_Number"

    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 354
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "vehicle_type"

    const-string v47, "INTEGER"

    const/16 v49, 0x0

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v45

    const-string v3, "vehicle_type"

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 355
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Daily_Contribution"

    const-string v47, "REAL"

    const/16 v48, 0x0

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v45

    const-string v3, "Daily_Contribution"

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 356
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Start_Date"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v45

    const-string v3, "Start_Date"

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Code"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v45

    invoke-interface {v2, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 358
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Id_Number"

    const-string v47, "TEXT"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v45

    const-string v3, "Id_Number"

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 359
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Arrears"

    const-string v47, "REAL"

    const/16 v48, 0x1

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v45

    const-string v3, "Arrears"

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 360
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Penalty"

    const-string v47, "REAL"

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v45

    const-string v3, "Penalty"

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    new-instance v45, Landroidx/room/util/TableInfo$Column;

    const-string v46, "Fleet_No"

    const-string v47, "TEXT"

    const/16 v48, 0x0

    invoke-direct/range {v45 .. v51}, Landroidx/room/util/TableInfo$Column;-><init>(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/String;I)V

    move-object/from16 v1, v45

    const-string v3, "Fleet_No"

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 362
    new-instance v1, Ljava/util/HashSet;

    const/4 v9, 0x0

    invoke-direct {v1, v9}, Ljava/util/HashSet;-><init>(I)V

    .line 363
    .local v1, "_foreignKeysVehicles":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3, v9}, Ljava/util/HashSet;-><init>(I)V

    .line 364
    .local v3, "_indicesVehicles":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$Index;>;"
    new-instance v9, Landroidx/room/util/TableInfo;

    move-object/from16 v31, v4

    .end local v4    # "_infoTheader":Landroidx/room/util/TableInfo;
    .local v31, "_infoTheader":Landroidx/room/util/TableInfo;
    const-string v4, "Vehicles"

    invoke-direct {v9, v4, v2, v1, v3}, Landroidx/room/util/TableInfo;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Set;Ljava/util/Set;)V

    .line 365
    .local v9, "_infoVehicles":Landroidx/room/util/TableInfo;
    const-string v4, "Vehicles"

    invoke-static {v0, v4}, Landroidx/room/util/TableInfo;->read(Landroidx/sqlite/SQLiteConnection;Ljava/lang/String;)Landroidx/room/util/TableInfo;

    move-result-object v4

    .line 366
    .local v4, "_existingVehicles":Landroidx/room/util/TableInfo;
    invoke-virtual {v9, v4}, Landroidx/room/util/TableInfo;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-nez v32, :cond_7

    .line 367
    new-instance v0, Landroidx/room/RoomOpenDelegate$ValidationResult;

    move-object/from16 v32, v1

    .end local v1    # "_foreignKeysVehicles":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    .local v32, "_foreignKeysVehicles":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v33, v2

    .end local v2    # "_columnsVehicles":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    .local v33, "_columnsVehicles":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    const-string v2, "Vehicles(com.trimline.metrocrew.Vehicles).\n Expected:\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v11, 0x0

    invoke-direct {v0, v11, v1}, Landroidx/room/RoomOpenDelegate$ValidationResult;-><init>(ZLjava/lang/String;)V

    return-object v0

    .line 371
    .end local v32    # "_foreignKeysVehicles":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    .end local v33    # "_columnsVehicles":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    .restart local v1    # "_foreignKeysVehicles":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    .restart local v2    # "_columnsVehicles":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    :cond_7
    move-object/from16 v32, v1

    move-object/from16 v33, v2

    .end local v1    # "_foreignKeysVehicles":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    .end local v2    # "_columnsVehicles":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    .restart local v32    # "_foreignKeysVehicles":Ljava/util/Set;, "Ljava/util/Set<Landroidx/room/util/TableInfo$ForeignKey;>;"
    .restart local v33    # "_columnsVehicles":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Landroidx/room/util/TableInfo$Column;>;"
    new-instance v0, Landroidx/room/RoomOpenDelegate$ValidationResult;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroidx/room/RoomOpenDelegate$ValidationResult;-><init>(ZLjava/lang/String;)V

    return-object v0
.end method
