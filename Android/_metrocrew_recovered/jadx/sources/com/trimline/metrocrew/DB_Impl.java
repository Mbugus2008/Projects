package com.trimline.metrocrew;

import androidx.room.InvalidationTracker;
import androidx.room.RoomMasterTable;
import androidx.room.RoomOpenDelegate;
import androidx.room.migration.AutoMigrationSpec;
import androidx.room.migration.Migration;
import androidx.room.util.DBUtil;
import androidx.room.util.TableInfo;
import androidx.sqlite.SQLite;
import androidx.sqlite.SQLiteConnection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: loaded from: classes5.dex */
public final class DB_Impl extends DB {
    private volatile agent.dao _agent;
    private volatile loan.dao _loan;
    private volatile Member.dao _member;
    private volatile payment_modes.dao _paymentModes;
    private volatile theader.dao _theader;
    private volatile transaction.dao _transaction;
    private volatile types.dao _types;
    private volatile Vehicles.dao _vehicles;

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // androidx.room.RoomDatabase
    public RoomOpenDelegate createOpenDelegate() {
        RoomOpenDelegate _openDelegate = new RoomOpenDelegate(2, "b44933ff7a4b90d14e8dc7849dd3b2de", "d67e58aedadec55e35d82d0cbc653dee") { // from class: com.trimline.metrocrew.DB_Impl.1
            @Override // androidx.room.RoomOpenDelegate
            public void createAllTables(final SQLiteConnection connection) {
                SQLite.execSQL(connection, "CREATE TABLE IF NOT EXISTS `Member` (`No` TEXT NOT NULL, `Name` TEXT, `ID_No` TEXT, `Phone_No` TEXT, `Outstanding_Balance` REAL NOT NULL, `Shares_Retained` REAL NOT NULL, `Current_Shares` REAL NOT NULL, `Current_Savings` REAL NOT NULL, `Registration_Fee_Paid` REAL NOT NULL, PRIMARY KEY(`No`))");
                SQLite.execSQL(connection, "CREATE TABLE IF NOT EXISTS `agent` (`Agent_Code` TEXT NOT NULL, `Customer_ID_No` TEXT, `Mobile_No` TEXT, `Status` INTEGER NOT NULL, `Name` TEXT, `Account` TEXT, `Password` TEXT, `Constituency` TEXT, `Account_type` INTEGER NOT NULL, `Balance` REAL NOT NULL, PRIMARY KEY(`Agent_Code`))");
                SQLite.execSQL(connection, "CREATE TABLE IF NOT EXISTS `transaction` (`Key` TEXT, `Entry_No` INTEGER NOT NULL, `No` TEXT NOT NULL, `Date` INTEGER, `Type` TEXT, `transtype` TEXT NOT NULL, `PayMode` TEXT, `Pay_Mode` TEXT, `Cheque_Deposit_Slip_No` TEXT, `Cheque_Deposit_Slip_Date` INTEGER, `Bank_Code` TEXT, `Received_From` TEXT, `On_Behalf_Of` TEXT, `Cashier` TEXT, `Account_No` TEXT NOT NULL, `Account_Name` TEXT, `Posted` INTEGER, `Date_Posted` INTEGER, `Time_Posted` INTEGER, `Posted_By` TEXT, `Amount` REAL, `Remarks` TEXT, `Transaction_Name` TEXT, `Branch_Code` TEXT, `Agent_Code` TEXT, `Grouping` TEXT, `Global_Dimension_1_Code` TEXT, `Shortcut_Dimension_2_Code` TEXT, `VAT_Percent` REAL, `Currency_Code` TEXT, `Currency_Factor` REAL, `VAT_Bus_Posting_Group` TEXT, `VAT_Prod_Posting_Group` TEXT, `Gen_Posting_TypeSpecified` INTEGER, `Gen_Bus_Posting_Group` TEXT, `Gen_Prod_Posting_Group` TEXT, `VAT_Amount` REAL, `Total_Amount` REAL, `User_ID` TEXT, `Apply_to` TEXT, `Apply_to_ID` TEXT, `Dest_Global_Dimension_1_Code` TEXT, `Dest_Shortcut_Dimension_2_Code` TEXT, `Line_No` INTEGER NOT NULL, `Print_No` INTEGER NOT NULL, `Deposit_Slip_Time` INTEGER, `Teller_ID` TEXT, `Customer_Payment_On_Account` INTEGER, `Select` INTEGER, `Batch_Posted` INTEGER, `Transaction_No` TEXT, `Cheque_Deposit_Slip_Bank` TEXT, `Bank_Account` TEXT, `Confirmed` INTEGER, `Reconciled` INTEGER, `Orig_Cashier` TEXT, `Cancelled` INTEGER, `Cancelled_By` TEXT, `Cancelled_Date` INTEGER, `Cancelled_Time` INTEGER, `Post_Dated` INTEGER, `Cheque_Retrieved` INTEGER, `Register_Number` INTEGER NOT NULL, `From_Entry_No` INTEGER NOT NULL, `To_Entry_No` INTEGER NOT NULL, `Batch_Posted_UserID` TEXT, `BD_Register_Number` INTEGER NOT NULL, `BD_From_Number` INTEGER NOT NULL, `BD_To_Number` INTEGER NOT NULL, `Reversal_By` TEXT, `Reversal_Date` INTEGER, `Reversal_Time` INTEGER, `Reversal_Register_No` INTEGER NOT NULL, `Reversal_From_Entry_No` INTEGER NOT NULL, `Reversal_To_Entry_No` INTEGER NOT NULL, `Reversed` INTEGER, `Applies_to_Doc_No` TEXT, `Applies_to_ID` TEXT, `Grant_No` TEXT, `Installment_Number` INTEGER NOT NULL, `Next_Installment_Date` INTEGER, `Dimension_Set_ID` INTEGER NOT NULL, `Donor` TEXT, `Group_Code` TEXT, `Pre_ADM_Fines` REAL, `Med_Fines` REAL, `Loan_No` TEXT, `Penalty` REAL, `sent` INTEGER NOT NULL, PRIMARY KEY(`No`, `Account_No`, `transtype`))");
                SQLite.execSQL(connection, "CREATE TABLE IF NOT EXISTS `types` (`Code` TEXT NOT NULL, `Name` TEXT, `Active` INTEGER, `Account` TEXT, `Order` INTEGER NOT NULL, PRIMARY KEY(`Code`))");
                SQLite.execSQL(connection, "CREATE TABLE IF NOT EXISTS `loan` (`Loan_No` TEXT NOT NULL, `Application_Date` TEXT, `Loan_Product_Type` TEXT, `Client_Code` TEXT, `Balance` REAL, `Loan_Product_Type_Name` TEXT, PRIMARY KEY(`Loan_No`))");
                SQLite.execSQL(connection, "CREATE TABLE IF NOT EXISTS `theader` (`Key` TEXT, `No` TEXT NOT NULL, `Date` INTEGER, `DateSpecified` INTEGER, `Cashier` TEXT, `Date_Posted` INTEGER, `Date_PostedSpecified` INTEGER, `Time_Posted` INTEGER, `Time_PostedSpecified` INTEGER, `Posted` INTEGER, `PostedSpecified` INTEGER, `No_Series` TEXT, `Bank_Code` TEXT, `Received_From` TEXT, `On_Behalf_Of` TEXT, `Amount_Recieved` REAL NOT NULL, `Amount_RecievedSpecified` INTEGER, `Global_Dimension_1_Code` TEXT, `Shortcut_Dimension_2_Code` TEXT, `Currency_Code` TEXT, `Currency_Factor` REAL NOT NULL, `Currency_FactorSpecified` INTEGER, `Total_Amount` REAL NOT NULL, `Total_AmountSpecified` INTEGER, `Posted_By` TEXT, `Print_No` INTEGER NOT NULL, `Print_NoSpecified` INTEGER, `StatusSpecified` INTEGER, `Cheque_No` TEXT, `No_Printed` INTEGER NOT NULL, `No_PrintedSpecified` INTEGER, `Created_By` TEXT, `Created_Date_Time` INTEGER, `Created_Date_TimeSpecified` INTEGER, `Register_No` INTEGER NOT NULL, `Register_NoSpecified` INTEGER, `From_Entry_No` INTEGER NOT NULL, `From_Entry_NoSpecified` INTEGER, `To_Entry_No` INTEGER NOT NULL, `To_Entry_NoSpecified` INTEGER, `Document_Date` INTEGER, `Document_DateSpecified` INTEGER, `Responsibility_Center` TEXT, `Shortcut_Dimension_3_Code` TEXT, `Shortcut_Dimension_4_Code` TEXT, `Dim3` TEXT, `Dim4` TEXT, `Bank_Name` TEXT, `Receipt_TypeSpecified` INTEGER, `Dimension_Set_ID` INTEGER NOT NULL, `Dimension_Set_IDSpecified` INTEGER, `Dim1` TEXT, `Dim2` TEXT, `Account_No` TEXT, `Name` TEXT, `PayMode` TEXT, `Pay_ModeSpecified` INTEGER, `Cheque_Deposit_Slip_No` TEXT, `Cheque_Deposit_Slip_Date` INTEGER, `Cheque_Deposit_Slip_DateSpecified` INTEGER, `Total_Amount_Guaranteed` REAL NOT NULL, `Total_Amount_GuaranteedSpecified` INTEGER, `DFLT` REAL NOT NULL, `DFLTSpecified` INTEGER, `Group_Name` TEXT, `Reference_No` TEXT, `Bank_Ref_No` TEXT, `sent` INTEGER NOT NULL, PRIMARY KEY(`No`))");
                SQLite.execSQL(connection, "CREATE TABLE IF NOT EXISTS `payment_modes` (`Code` TEXT NOT NULL, `Name` TEXT, PRIMARY KEY(`Code`))");
                SQLite.execSQL(connection, "CREATE TABLE IF NOT EXISTS `Vehicles` (`Vehicle_Number` TEXT NOT NULL, `vehicle_type` INTEGER NOT NULL, `Daily_Contribution` REAL, `Start_Date` TEXT, `Code` TEXT, `Id_Number` TEXT, `Arrears` REAL NOT NULL, `Penalty` REAL NOT NULL, `Fleet_No` TEXT, PRIMARY KEY(`Vehicle_Number`))");
                SQLite.execSQL(connection, RoomMasterTable.CREATE_QUERY);
                SQLite.execSQL(connection, "INSERT OR REPLACE INTO room_master_table (id,identity_hash) VALUES(42, 'b44933ff7a4b90d14e8dc7849dd3b2de')");
            }

            @Override // androidx.room.RoomOpenDelegate
            public void dropAllTables(final SQLiteConnection connection) {
                SQLite.execSQL(connection, "DROP TABLE IF EXISTS `Member`");
                SQLite.execSQL(connection, "DROP TABLE IF EXISTS `agent`");
                SQLite.execSQL(connection, "DROP TABLE IF EXISTS `transaction`");
                SQLite.execSQL(connection, "DROP TABLE IF EXISTS `types`");
                SQLite.execSQL(connection, "DROP TABLE IF EXISTS `loan`");
                SQLite.execSQL(connection, "DROP TABLE IF EXISTS `theader`");
                SQLite.execSQL(connection, "DROP TABLE IF EXISTS `payment_modes`");
                SQLite.execSQL(connection, "DROP TABLE IF EXISTS `Vehicles`");
            }

            @Override // androidx.room.RoomOpenDelegate
            public void onCreate(final SQLiteConnection connection) {
            }

            @Override // androidx.room.RoomOpenDelegate
            public void onOpen(final SQLiteConnection connection) {
                DB_Impl.this.internalInitInvalidationTracker(connection);
            }

            @Override // androidx.room.RoomOpenDelegate
            public void onPreMigrate(final SQLiteConnection connection) {
                DBUtil.dropFtsSyncTriggers(connection);
            }

            @Override // androidx.room.RoomOpenDelegate
            public void onPostMigrate(final SQLiteConnection connection) {
            }

            @Override // androidx.room.RoomOpenDelegate
            public RoomOpenDelegate.ValidationResult onValidateSchema(final SQLiteConnection connection) {
                Map<String, TableInfo.Column> _columnsMember = new HashMap<>(9);
                _columnsMember.put("No", new TableInfo.Column("No", "TEXT", true, 1, null, 1));
                _columnsMember.put("Name", new TableInfo.Column("Name", "TEXT", false, 0, null, 1));
                _columnsMember.put("ID_No", new TableInfo.Column("ID_No", "TEXT", false, 0, null, 1));
                _columnsMember.put("Phone_No", new TableInfo.Column("Phone_No", "TEXT", false, 0, null, 1));
                _columnsMember.put("Outstanding_Balance", new TableInfo.Column("Outstanding_Balance", "REAL", true, 0, null, 1));
                _columnsMember.put("Shares_Retained", new TableInfo.Column("Shares_Retained", "REAL", true, 0, null, 1));
                _columnsMember.put("Current_Shares", new TableInfo.Column("Current_Shares", "REAL", true, 0, null, 1));
                _columnsMember.put("Current_Savings", new TableInfo.Column("Current_Savings", "REAL", true, 0, null, 1));
                _columnsMember.put("Registration_Fee_Paid", new TableInfo.Column("Registration_Fee_Paid", "REAL", true, 0, null, 1));
                Set<TableInfo.ForeignKey> _foreignKeysMember = new HashSet<>(0);
                Set<TableInfo.Index> _indicesMember = new HashSet<>(0);
                TableInfo _infoMember = new TableInfo("Member", _columnsMember, _foreignKeysMember, _indicesMember);
                TableInfo _existingMember = TableInfo.read(connection, "Member");
                if (!_infoMember.equals(_existingMember)) {
                    return new RoomOpenDelegate.ValidationResult(false, "Member(com.trimline.metrocrew.Member).\n Expected:\n" + _infoMember + "\n Found:\n" + _existingMember);
                }
                Map<String, TableInfo.Column> _columnsAgent = new HashMap<>(10);
                _columnsAgent.put("Agent_Code", new TableInfo.Column("Agent_Code", "TEXT", true, 1, null, 1));
                _columnsAgent.put("Customer_ID_No", new TableInfo.Column("Customer_ID_No", "TEXT", false, 0, null, 1));
                _columnsAgent.put("Mobile_No", new TableInfo.Column("Mobile_No", "TEXT", false, 0, null, 1));
                _columnsAgent.put("Status", new TableInfo.Column("Status", "INTEGER", true, 0, null, 1));
                _columnsAgent.put("Name", new TableInfo.Column("Name", "TEXT", false, 0, null, 1));
                _columnsAgent.put("Account", new TableInfo.Column("Account", "TEXT", false, 0, null, 1));
                _columnsAgent.put("Password", new TableInfo.Column("Password", "TEXT", false, 0, null, 1));
                _columnsAgent.put("Constituency", new TableInfo.Column("Constituency", "TEXT", false, 0, null, 1));
                _columnsAgent.put("Account_type", new TableInfo.Column("Account_type", "INTEGER", true, 0, null, 1));
                _columnsAgent.put("Balance", new TableInfo.Column("Balance", "REAL", true, 0, null, 1));
                Set<TableInfo.ForeignKey> _foreignKeysAgent = new HashSet<>(0);
                Set<TableInfo.Index> _indicesAgent = new HashSet<>(0);
                TableInfo _infoAgent = new TableInfo("agent", _columnsAgent, _foreignKeysAgent, _indicesAgent);
                TableInfo _existingAgent = TableInfo.read(connection, "agent");
                if (!_infoAgent.equals(_existingAgent)) {
                    return new RoomOpenDelegate.ValidationResult(false, "agent(com.trimline.metrocrew.agent).\n Expected:\n" + _infoAgent + "\n Found:\n" + _existingAgent);
                }
                Map<String, TableInfo.Column> _columnsTransaction = new HashMap<>(89);
                _columnsTransaction.put("Key", new TableInfo.Column("Key", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Entry_No", new TableInfo.Column("Entry_No", "INTEGER", true, 0, null, 1));
                _columnsTransaction.put("No", new TableInfo.Column("No", "TEXT", true, 1, null, 1));
                _columnsTransaction.put("Date", new TableInfo.Column("Date", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Type", new TableInfo.Column("Type", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("transtype", new TableInfo.Column("transtype", "TEXT", true, 3, null, 1));
                _columnsTransaction.put("PayMode", new TableInfo.Column("PayMode", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Pay_Mode", new TableInfo.Column("Pay_Mode", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Cheque_Deposit_Slip_No", new TableInfo.Column("Cheque_Deposit_Slip_No", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Cheque_Deposit_Slip_Date", new TableInfo.Column("Cheque_Deposit_Slip_Date", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Bank_Code", new TableInfo.Column("Bank_Code", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Received_From", new TableInfo.Column("Received_From", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("On_Behalf_Of", new TableInfo.Column("On_Behalf_Of", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Cashier", new TableInfo.Column("Cashier", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Account_No", new TableInfo.Column("Account_No", "TEXT", true, 2, null, 1));
                _columnsTransaction.put("Account_Name", new TableInfo.Column("Account_Name", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Posted", new TableInfo.Column("Posted", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Date_Posted", new TableInfo.Column("Date_Posted", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Time_Posted", new TableInfo.Column("Time_Posted", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Posted_By", new TableInfo.Column("Posted_By", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Amount", new TableInfo.Column("Amount", "REAL", false, 0, null, 1));
                _columnsTransaction.put("Remarks", new TableInfo.Column("Remarks", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Transaction_Name", new TableInfo.Column("Transaction_Name", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Branch_Code", new TableInfo.Column("Branch_Code", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Agent_Code", new TableInfo.Column("Agent_Code", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Grouping", new TableInfo.Column("Grouping", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Global_Dimension_1_Code", new TableInfo.Column("Global_Dimension_1_Code", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Shortcut_Dimension_2_Code", new TableInfo.Column("Shortcut_Dimension_2_Code", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("VAT_Percent", new TableInfo.Column("VAT_Percent", "REAL", false, 0, null, 1));
                _columnsTransaction.put("Currency_Code", new TableInfo.Column("Currency_Code", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Currency_Factor", new TableInfo.Column("Currency_Factor", "REAL", false, 0, null, 1));
                _columnsTransaction.put("VAT_Bus_Posting_Group", new TableInfo.Column("VAT_Bus_Posting_Group", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("VAT_Prod_Posting_Group", new TableInfo.Column("VAT_Prod_Posting_Group", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Gen_Posting_TypeSpecified", new TableInfo.Column("Gen_Posting_TypeSpecified", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Gen_Bus_Posting_Group", new TableInfo.Column("Gen_Bus_Posting_Group", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Gen_Prod_Posting_Group", new TableInfo.Column("Gen_Prod_Posting_Group", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("VAT_Amount", new TableInfo.Column("VAT_Amount", "REAL", false, 0, null, 1));
                _columnsTransaction.put("Total_Amount", new TableInfo.Column("Total_Amount", "REAL", false, 0, null, 1));
                _columnsTransaction.put("User_ID", new TableInfo.Column("User_ID", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Apply_to", new TableInfo.Column("Apply_to", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Apply_to_ID", new TableInfo.Column("Apply_to_ID", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Dest_Global_Dimension_1_Code", new TableInfo.Column("Dest_Global_Dimension_1_Code", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Dest_Shortcut_Dimension_2_Code", new TableInfo.Column("Dest_Shortcut_Dimension_2_Code", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Line_No", new TableInfo.Column("Line_No", "INTEGER", true, 0, null, 1));
                _columnsTransaction.put("Print_No", new TableInfo.Column("Print_No", "INTEGER", true, 0, null, 1));
                _columnsTransaction.put("Deposit_Slip_Time", new TableInfo.Column("Deposit_Slip_Time", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Teller_ID", new TableInfo.Column("Teller_ID", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Customer_Payment_On_Account", new TableInfo.Column("Customer_Payment_On_Account", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Select", new TableInfo.Column("Select", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Batch_Posted", new TableInfo.Column("Batch_Posted", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Transaction_No", new TableInfo.Column("Transaction_No", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Cheque_Deposit_Slip_Bank", new TableInfo.Column("Cheque_Deposit_Slip_Bank", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Bank_Account", new TableInfo.Column("Bank_Account", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Confirmed", new TableInfo.Column("Confirmed", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Reconciled", new TableInfo.Column("Reconciled", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Orig_Cashier", new TableInfo.Column("Orig_Cashier", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Cancelled", new TableInfo.Column("Cancelled", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Cancelled_By", new TableInfo.Column("Cancelled_By", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Cancelled_Date", new TableInfo.Column("Cancelled_Date", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Cancelled_Time", new TableInfo.Column("Cancelled_Time", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Post_Dated", new TableInfo.Column("Post_Dated", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Cheque_Retrieved", new TableInfo.Column("Cheque_Retrieved", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Register_Number", new TableInfo.Column("Register_Number", "INTEGER", true, 0, null, 1));
                _columnsTransaction.put("From_Entry_No", new TableInfo.Column("From_Entry_No", "INTEGER", true, 0, null, 1));
                _columnsTransaction.put("To_Entry_No", new TableInfo.Column("To_Entry_No", "INTEGER", true, 0, null, 1));
                _columnsTransaction.put("Batch_Posted_UserID", new TableInfo.Column("Batch_Posted_UserID", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("BD_Register_Number", new TableInfo.Column("BD_Register_Number", "INTEGER", true, 0, null, 1));
                _columnsTransaction.put("BD_From_Number", new TableInfo.Column("BD_From_Number", "INTEGER", true, 0, null, 1));
                _columnsTransaction.put("BD_To_Number", new TableInfo.Column("BD_To_Number", "INTEGER", true, 0, null, 1));
                _columnsTransaction.put("Reversal_By", new TableInfo.Column("Reversal_By", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Reversal_Date", new TableInfo.Column("Reversal_Date", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Reversal_Time", new TableInfo.Column("Reversal_Time", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Reversal_Register_No", new TableInfo.Column("Reversal_Register_No", "INTEGER", true, 0, null, 1));
                _columnsTransaction.put("Reversal_From_Entry_No", new TableInfo.Column("Reversal_From_Entry_No", "INTEGER", true, 0, null, 1));
                _columnsTransaction.put("Reversal_To_Entry_No", new TableInfo.Column("Reversal_To_Entry_No", "INTEGER", true, 0, null, 1));
                _columnsTransaction.put("Reversed", new TableInfo.Column("Reversed", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Applies_to_Doc_No", new TableInfo.Column("Applies_to_Doc_No", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Applies_to_ID", new TableInfo.Column("Applies_to_ID", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Grant_No", new TableInfo.Column("Grant_No", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Installment_Number", new TableInfo.Column("Installment_Number", "INTEGER", true, 0, null, 1));
                _columnsTransaction.put("Next_Installment_Date", new TableInfo.Column("Next_Installment_Date", "INTEGER", false, 0, null, 1));
                _columnsTransaction.put("Dimension_Set_ID", new TableInfo.Column("Dimension_Set_ID", "INTEGER", true, 0, null, 1));
                _columnsTransaction.put("Donor", new TableInfo.Column("Donor", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Group_Code", new TableInfo.Column("Group_Code", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Pre_ADM_Fines", new TableInfo.Column("Pre_ADM_Fines", "REAL", false, 0, null, 1));
                _columnsTransaction.put("Med_Fines", new TableInfo.Column("Med_Fines", "REAL", false, 0, null, 1));
                _columnsTransaction.put("Loan_No", new TableInfo.Column("Loan_No", "TEXT", false, 0, null, 1));
                _columnsTransaction.put("Penalty", new TableInfo.Column("Penalty", "REAL", false, 0, null, 1));
                _columnsTransaction.put("sent", new TableInfo.Column("sent", "INTEGER", true, 0, null, 1));
                Set<TableInfo.ForeignKey> _foreignKeysTransaction = new HashSet<>(0);
                Set<TableInfo.Index> _indicesTransaction = new HashSet<>(0);
                TableInfo _infoTransaction = new TableInfo("transaction", _columnsTransaction, _foreignKeysTransaction, _indicesTransaction);
                TableInfo _existingTransaction = TableInfo.read(connection, "transaction");
                if (!_infoTransaction.equals(_existingTransaction)) {
                    return new RoomOpenDelegate.ValidationResult(false, "transaction(com.trimline.metrocrew.transaction).\n Expected:\n" + _infoTransaction + "\n Found:\n" + _existingTransaction);
                }
                Map<String, TableInfo.Column> _columnsTypes = new HashMap<>(5);
                _columnsTypes.put("Code", new TableInfo.Column("Code", "TEXT", true, 1, null, 1));
                _columnsTypes.put("Name", new TableInfo.Column("Name", "TEXT", false, 0, null, 1));
                _columnsTypes.put("Active", new TableInfo.Column("Active", "INTEGER", false, 0, null, 1));
                _columnsTypes.put("Account", new TableInfo.Column("Account", "TEXT", false, 0, null, 1));
                _columnsTypes.put("Order", new TableInfo.Column("Order", "INTEGER", true, 0, null, 1));
                Set<TableInfo.ForeignKey> _foreignKeysTypes = new HashSet<>(0);
                Set<TableInfo.Index> _indicesTypes = new HashSet<>(0);
                TableInfo _infoTypes = new TableInfo("types", _columnsTypes, _foreignKeysTypes, _indicesTypes);
                TableInfo _existingTypes = TableInfo.read(connection, "types");
                if (!_infoTypes.equals(_existingTypes)) {
                    return new RoomOpenDelegate.ValidationResult(false, "types(com.trimline.metrocrew.types).\n Expected:\n" + _infoTypes + "\n Found:\n" + _existingTypes);
                }
                Map<String, TableInfo.Column> _columnsLoan = new HashMap<>(6);
                _columnsLoan.put("Loan_No", new TableInfo.Column("Loan_No", "TEXT", true, 1, null, 1));
                _columnsLoan.put("Application_Date", new TableInfo.Column("Application_Date", "TEXT", false, 0, null, 1));
                _columnsLoan.put("Loan_Product_Type", new TableInfo.Column("Loan_Product_Type", "TEXT", false, 0, null, 1));
                _columnsLoan.put("Client_Code", new TableInfo.Column("Client_Code", "TEXT", false, 0, null, 1));
                _columnsLoan.put("Balance", new TableInfo.Column("Balance", "REAL", false, 0, null, 1));
                _columnsLoan.put("Loan_Product_Type_Name", new TableInfo.Column("Loan_Product_Type_Name", "TEXT", false, 0, null, 1));
                Set<TableInfo.ForeignKey> _foreignKeysLoan = new HashSet<>(0);
                Set<TableInfo.Index> _indicesLoan = new HashSet<>(0);
                TableInfo _infoLoan = new TableInfo("loan", _columnsLoan, _foreignKeysLoan, _indicesLoan);
                TableInfo _existingLoan = TableInfo.read(connection, "loan");
                if (!_infoLoan.equals(_existingLoan)) {
                    return new RoomOpenDelegate.ValidationResult(false, "loan(com.trimline.metrocrew.loan).\n Expected:\n" + _infoLoan + "\n Found:\n" + _existingLoan);
                }
                Map<String, TableInfo.Column> _columnsTheader = new HashMap<>(68);
                _columnsTheader.put("Key", new TableInfo.Column("Key", "TEXT", false, 0, null, 1));
                _columnsTheader.put("No", new TableInfo.Column("No", "TEXT", true, 1, null, 1));
                _columnsTheader.put("Date", new TableInfo.Column("Date", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("DateSpecified", new TableInfo.Column("DateSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Cashier", new TableInfo.Column("Cashier", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Date_Posted", new TableInfo.Column("Date_Posted", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Date_PostedSpecified", new TableInfo.Column("Date_PostedSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Time_Posted", new TableInfo.Column("Time_Posted", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Time_PostedSpecified", new TableInfo.Column("Time_PostedSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Posted", new TableInfo.Column("Posted", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("PostedSpecified", new TableInfo.Column("PostedSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("No_Series", new TableInfo.Column("No_Series", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Bank_Code", new TableInfo.Column("Bank_Code", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Received_From", new TableInfo.Column("Received_From", "TEXT", false, 0, null, 1));
                _columnsTheader.put("On_Behalf_Of", new TableInfo.Column("On_Behalf_Of", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Amount_Recieved", new TableInfo.Column("Amount_Recieved", "REAL", true, 0, null, 1));
                _columnsTheader.put("Amount_RecievedSpecified", new TableInfo.Column("Amount_RecievedSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Global_Dimension_1_Code", new TableInfo.Column("Global_Dimension_1_Code", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Shortcut_Dimension_2_Code", new TableInfo.Column("Shortcut_Dimension_2_Code", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Currency_Code", new TableInfo.Column("Currency_Code", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Currency_Factor", new TableInfo.Column("Currency_Factor", "REAL", true, 0, null, 1));
                _columnsTheader.put("Currency_FactorSpecified", new TableInfo.Column("Currency_FactorSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Total_Amount", new TableInfo.Column("Total_Amount", "REAL", true, 0, null, 1));
                _columnsTheader.put("Total_AmountSpecified", new TableInfo.Column("Total_AmountSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Posted_By", new TableInfo.Column("Posted_By", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Print_No", new TableInfo.Column("Print_No", "INTEGER", true, 0, null, 1));
                _columnsTheader.put("Print_NoSpecified", new TableInfo.Column("Print_NoSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("StatusSpecified", new TableInfo.Column("StatusSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Cheque_No", new TableInfo.Column("Cheque_No", "TEXT", false, 0, null, 1));
                _columnsTheader.put("No_Printed", new TableInfo.Column("No_Printed", "INTEGER", true, 0, null, 1));
                _columnsTheader.put("No_PrintedSpecified", new TableInfo.Column("No_PrintedSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Created_By", new TableInfo.Column("Created_By", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Created_Date_Time", new TableInfo.Column("Created_Date_Time", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Created_Date_TimeSpecified", new TableInfo.Column("Created_Date_TimeSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Register_No", new TableInfo.Column("Register_No", "INTEGER", true, 0, null, 1));
                _columnsTheader.put("Register_NoSpecified", new TableInfo.Column("Register_NoSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("From_Entry_No", new TableInfo.Column("From_Entry_No", "INTEGER", true, 0, null, 1));
                _columnsTheader.put("From_Entry_NoSpecified", new TableInfo.Column("From_Entry_NoSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("To_Entry_No", new TableInfo.Column("To_Entry_No", "INTEGER", true, 0, null, 1));
                _columnsTheader.put("To_Entry_NoSpecified", new TableInfo.Column("To_Entry_NoSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Document_Date", new TableInfo.Column("Document_Date", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Document_DateSpecified", new TableInfo.Column("Document_DateSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Responsibility_Center", new TableInfo.Column("Responsibility_Center", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Shortcut_Dimension_3_Code", new TableInfo.Column("Shortcut_Dimension_3_Code", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Shortcut_Dimension_4_Code", new TableInfo.Column("Shortcut_Dimension_4_Code", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Dim3", new TableInfo.Column("Dim3", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Dim4", new TableInfo.Column("Dim4", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Bank_Name", new TableInfo.Column("Bank_Name", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Receipt_TypeSpecified", new TableInfo.Column("Receipt_TypeSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Dimension_Set_ID", new TableInfo.Column("Dimension_Set_ID", "INTEGER", true, 0, null, 1));
                _columnsTheader.put("Dimension_Set_IDSpecified", new TableInfo.Column("Dimension_Set_IDSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Dim1", new TableInfo.Column("Dim1", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Dim2", new TableInfo.Column("Dim2", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Account_No", new TableInfo.Column("Account_No", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Name", new TableInfo.Column("Name", "TEXT", false, 0, null, 1));
                _columnsTheader.put("PayMode", new TableInfo.Column("PayMode", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Pay_ModeSpecified", new TableInfo.Column("Pay_ModeSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Cheque_Deposit_Slip_No", new TableInfo.Column("Cheque_Deposit_Slip_No", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Cheque_Deposit_Slip_Date", new TableInfo.Column("Cheque_Deposit_Slip_Date", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Cheque_Deposit_Slip_DateSpecified", new TableInfo.Column("Cheque_Deposit_Slip_DateSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Total_Amount_Guaranteed", new TableInfo.Column("Total_Amount_Guaranteed", "REAL", true, 0, null, 1));
                _columnsTheader.put("Total_Amount_GuaranteedSpecified", new TableInfo.Column("Total_Amount_GuaranteedSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("DFLT", new TableInfo.Column("DFLT", "REAL", true, 0, null, 1));
                _columnsTheader.put("DFLTSpecified", new TableInfo.Column("DFLTSpecified", "INTEGER", false, 0, null, 1));
                _columnsTheader.put("Group_Name", new TableInfo.Column("Group_Name", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Reference_No", new TableInfo.Column("Reference_No", "TEXT", false, 0, null, 1));
                _columnsTheader.put("Bank_Ref_No", new TableInfo.Column("Bank_Ref_No", "TEXT", false, 0, null, 1));
                _columnsTheader.put("sent", new TableInfo.Column("sent", "INTEGER", true, 0, null, 1));
                Set<TableInfo.ForeignKey> _foreignKeysTheader = new HashSet<>(0);
                Set<TableInfo.Index> _indicesTheader = new HashSet<>(0);
                TableInfo _infoTheader = new TableInfo("theader", _columnsTheader, _foreignKeysTheader, _indicesTheader);
                TableInfo _existingTheader = TableInfo.read(connection, "theader");
                if (!_infoTheader.equals(_existingTheader)) {
                    return new RoomOpenDelegate.ValidationResult(false, "theader(com.trimline.metrocrew.theader).\n Expected:\n" + _infoTheader + "\n Found:\n" + _existingTheader);
                }
                Map<String, TableInfo.Column> _columnsPaymentModes = new HashMap<>(2);
                _columnsPaymentModes.put("Code", new TableInfo.Column("Code", "TEXT", true, 1, null, 1));
                _columnsPaymentModes.put("Name", new TableInfo.Column("Name", "TEXT", false, 0, null, 1));
                Set<TableInfo.ForeignKey> _foreignKeysPaymentModes = new HashSet<>(0);
                Set<TableInfo.Index> _indicesPaymentModes = new HashSet<>(0);
                TableInfo _infoPaymentModes = new TableInfo("payment_modes", _columnsPaymentModes, _foreignKeysPaymentModes, _indicesPaymentModes);
                TableInfo _existingPaymentModes = TableInfo.read(connection, "payment_modes");
                if (!_infoPaymentModes.equals(_existingPaymentModes)) {
                    return new RoomOpenDelegate.ValidationResult(false, "payment_modes(com.trimline.metrocrew.payment_modes).\n Expected:\n" + _infoPaymentModes + "\n Found:\n" + _existingPaymentModes);
                }
                Map<String, TableInfo.Column> _columnsVehicles = new HashMap<>(9);
                _columnsVehicles.put("Vehicle_Number", new TableInfo.Column("Vehicle_Number", "TEXT", true, 1, null, 1));
                _columnsVehicles.put("vehicle_type", new TableInfo.Column("vehicle_type", "INTEGER", true, 0, null, 1));
                _columnsVehicles.put("Daily_Contribution", new TableInfo.Column("Daily_Contribution", "REAL", false, 0, null, 1));
                _columnsVehicles.put("Start_Date", new TableInfo.Column("Start_Date", "TEXT", false, 0, null, 1));
                _columnsVehicles.put("Code", new TableInfo.Column("Code", "TEXT", false, 0, null, 1));
                _columnsVehicles.put("Id_Number", new TableInfo.Column("Id_Number", "TEXT", false, 0, null, 1));
                _columnsVehicles.put("Arrears", new TableInfo.Column("Arrears", "REAL", true, 0, null, 1));
                _columnsVehicles.put("Penalty", new TableInfo.Column("Penalty", "REAL", true, 0, null, 1));
                _columnsVehicles.put("Fleet_No", new TableInfo.Column("Fleet_No", "TEXT", false, 0, null, 1));
                Set<TableInfo.ForeignKey> _foreignKeysVehicles = new HashSet<>(0);
                Set<TableInfo.Index> _indicesVehicles = new HashSet<>(0);
                TableInfo _infoVehicles = new TableInfo("Vehicles", _columnsVehicles, _foreignKeysVehicles, _indicesVehicles);
                TableInfo _existingVehicles = TableInfo.read(connection, "Vehicles");
                return !_infoVehicles.equals(_existingVehicles) ? new RoomOpenDelegate.ValidationResult(false, "Vehicles(com.trimline.metrocrew.Vehicles).\n Expected:\n" + _infoVehicles + "\n Found:\n" + _existingVehicles) : new RoomOpenDelegate.ValidationResult(true, null);
            }
        };
        return _openDelegate;
    }

    @Override // androidx.room.RoomDatabase
    protected InvalidationTracker createInvalidationTracker() {
        Map<String, String> _shadowTablesMap = new HashMap<>(0);
        Map<String, Set<String>> _viewTables = new HashMap<>(0);
        return new InvalidationTracker(this, _shadowTablesMap, _viewTables, "Member", "agent", "transaction", "types", "loan", "theader", "payment_modes", "Vehicles");
    }

    @Override // androidx.room.RoomDatabase
    public void clearAllTables() {
        super.performClear(false, "Member", "agent", "transaction", "types", "loan", "theader", "payment_modes", "Vehicles");
    }

    @Override // androidx.room.RoomDatabase
    protected Map<Class<?>, List<Class<?>>> getRequiredTypeConverters() {
        Map<Class<?>, List<Class<?>>> _typeConvertersMap = new HashMap<>();
        _typeConvertersMap.put(Member.dao.class, Member_dao_Impl.getRequiredConverters());
        _typeConvertersMap.put(Vehicles.dao.class, Vehicles_dao_Impl.getRequiredConverters());
        _typeConvertersMap.put(agent.dao.class, agent_dao_Impl.getRequiredConverters());
        _typeConvertersMap.put(theader.dao.class, theader_dao_Impl.getRequiredConverters());
        _typeConvertersMap.put(transaction.dao.class, transaction_dao_Impl.getRequiredConverters());
        _typeConvertersMap.put(loan.dao.class, loan_dao_Impl.getRequiredConverters());
        _typeConvertersMap.put(types.dao.class, types_dao_Impl.getRequiredConverters());
        _typeConvertersMap.put(payment_modes.dao.class, payment_modes_dao_Impl.getRequiredConverters());
        return _typeConvertersMap;
    }

    @Override // androidx.room.RoomDatabase
    public Set<Class<? extends AutoMigrationSpec>> getRequiredAutoMigrationSpecs() {
        Set<Class<? extends AutoMigrationSpec>> _autoMigrationSpecsSet = new HashSet<>();
        return _autoMigrationSpecsSet;
    }

    @Override // androidx.room.RoomDatabase
    public List<Migration> getAutoMigrations(final Map<Class<? extends AutoMigrationSpec>, AutoMigrationSpec> autoMigrationSpecs) {
        List<Migration> _autoMigrations = new ArrayList<>();
        return _autoMigrations;
    }

    @Override // com.trimline.metrocrew.DB
    public Member.dao memberDao() {
        Member.dao daoVar;
        if (this._member != null) {
            return this._member;
        }
        synchronized (this) {
            if (this._member == null) {
                this._member = new Member_dao_Impl(this);
            }
            daoVar = this._member;
        }
        return daoVar;
    }

    @Override // com.trimline.metrocrew.DB
    public Vehicles.dao vDao() {
        Vehicles.dao daoVar;
        if (this._vehicles != null) {
            return this._vehicles;
        }
        synchronized (this) {
            if (this._vehicles == null) {
                this._vehicles = new Vehicles_dao_Impl(this);
            }
            daoVar = this._vehicles;
        }
        return daoVar;
    }

    @Override // com.trimline.metrocrew.DB
    public agent.dao aDao() {
        agent.dao daoVar;
        if (this._agent != null) {
            return this._agent;
        }
        synchronized (this) {
            if (this._agent == null) {
                this._agent = new agent_dao_Impl(this);
            }
            daoVar = this._agent;
        }
        return daoVar;
    }

    @Override // com.trimline.metrocrew.DB
    public theader.dao thDao() {
        theader.dao daoVar;
        if (this._theader != null) {
            return this._theader;
        }
        synchronized (this) {
            if (this._theader == null) {
                this._theader = new theader_dao_Impl(this);
            }
            daoVar = this._theader;
        }
        return daoVar;
    }

    @Override // com.trimline.metrocrew.DB
    public transaction.dao tdao() {
        transaction.dao daoVar;
        if (this._transaction != null) {
            return this._transaction;
        }
        synchronized (this) {
            if (this._transaction == null) {
                this._transaction = new transaction_dao_Impl(this);
            }
            daoVar = this._transaction;
        }
        return daoVar;
    }

    @Override // com.trimline.metrocrew.DB
    public loan.dao ldao() {
        loan.dao daoVar;
        if (this._loan != null) {
            return this._loan;
        }
        synchronized (this) {
            if (this._loan == null) {
                this._loan = new loan_dao_Impl(this);
            }
            daoVar = this._loan;
        }
        return daoVar;
    }

    @Override // com.trimline.metrocrew.DB
    public types.dao trandao() {
        types.dao daoVar;
        if (this._types != null) {
            return this._types;
        }
        synchronized (this) {
            if (this._types == null) {
                this._types = new types_dao_Impl(this);
            }
            daoVar = this._types;
        }
        return daoVar;
    }

    @Override // com.trimline.metrocrew.DB
    public payment_modes.dao pdao() {
        payment_modes.dao daoVar;
        if (this._paymentModes != null) {
            return this._paymentModes;
        }
        synchronized (this) {
            if (this._paymentModes == null) {
                this._paymentModes = new payment_modes_dao_Impl(this);
            }
            daoVar = this._paymentModes;
        }
        return daoVar;
    }
}
