package com.trimline.pawdep;

import androidx.room.Database;
import androidx.room.Room;
import androidx.room.RoomDatabase;
import androidx.room.TypeConverters;
import androidx.room.migration.Migration;
import androidx.sqlite.db.SupportSQLiteDatabase;

import android.content.Context;

@Database(entities = {Member.class,
        Agent.class,
        Transaction.class,
        T_line.class,
        Group.class,
        Loan.class,
        Repayment.class,
        Advance.class,
        PW_Transactions.class,
        Group_Loan.class
        ,Non_Cash.class,
        Loan_products.class,
        Devices.class,
        Loan_Request.class,
        Loan_guarantors.class,
        Sectors.class,
        Sub_Sector.class,
        Receipts.class,
        Receipt_lines.class,
        Banks.class,
        Accounts.class,
        Allocation_header.class,
        Allocation_Line.class
       //Bank_Entries.class
},
        version = 14,
        exportSchema = false)
    @TypeConverters({Converters.class
    })
    public abstract class DB extends RoomDatabase {
    public abstract Member.dao memberDao();

    public abstract Group.dao groupDao();

    public abstract Agent.dao agentdao();

    public abstract Transaction.dao transactiondao();

    public abstract T_line.dao t_linedao();

    public abstract Loan.dao loandao();

    public abstract Loan_products.dao lpdao();

    public abstract Devices.dao ddao();

    public abstract Repayment.dao adao();

    public abstract PW_Transactions.dao ptadao();

    public abstract Group_Loan.dao gdao();

    public abstract Advance.dao advissuedao();

    public abstract Non_Cash.dao nondao();

    public abstract Loan_guarantors.dao lgdao();

    public abstract Loan_Request.dao lrdao();

    public abstract Sectors.dao sdao();

    public abstract Sub_Sector.dao sbdao();

    public abstract Receipts.dao rdao();

    public abstract Receipt_lines.dao rldao();

    public abstract Banks.dao bdao();

    public abstract Accounts.dao accdao();

    public abstract Allocation_header.dao allheaderdao();
    public abstract Allocation_Line.dao alllinedao();
   // public abstract Bank_Entries.dao bankentriesdao();

    private static DB instance;

    public static synchronized DB getInstance(Context context) {
        if (instance == null) {
            instance = Room.databaseBuilder(context.getApplicationContext(),
                    DB.class, "Pawdep")
                    //   .fallbackToDestructiveMigration()
                    .addMigrations(MIGRATION_2_3, MIGRATION_3_4, MIGRATION_4_5,
                            MIGRATION_5_6,
                            MIGRATION_6_7,
                            MIGRATION_7_8,
                            MIGRATION_8_9,
                            MIGRATION_9_10,
                            MIGRATION_10_11,
                            MIGRATION_11_12,
                            MIGRATION_12_13,
                            MIGRATION_13_14
                   )
                    .build();
        }
        return instance;
    }

    static final Migration MIGRATION_2_3 = new Migration(2, 3) {
        @Override
        public void migrate(SupportSQLiteDatabase database) {
            database.execSQL("CREATE TABLE IF NOT EXISTS `Transaction_temp` (`Id` INTEGER, `Transaction_No` TEXT NOT NULL, `Description` TEXT, `Group_Code` TEXT, `Group_Name` TEXT, `Project` TEXT, `StringDate` TEXT, `Receipt_No` TEXT, `Branch_Code` TEXT, `Branch_Name` TEXT, `Group_Officer_Code` TEXT, `Group_Officer_Name` TEXT, `Credit_Officer_Totals` REAL NOT NULL, `Hall_Paid` REAL NOT NULL, `Group_Fines` REAL NOT NULL, `Posted` INTEGER NOT NULL, `sent` INTEGER NOT NULL, PRIMARY KEY(`Transaction_No`))");

            database.execSQL("Insert into `Transaction_temp` (`Id`,`Transaction_No`,`Description`,`Group_Code`,`Group_Name`,`Project`,`StringDate`,`Receipt_No`,`Branch_Code`,`Branch_Name`,`Group_Officer_Code`,`Group_Officer_Name`,`Credit_Officer_Totals`,`Group_Fines`,`Posted`,`Hall_Paid`,`sent` ) select `Id`,`Transaction_No`,`Description`,`Group_Code`,`Group_Name`,`Project`,`StringDate`,`Receipt_No`,`Branch_Code`,`Branch_Name`,`Group_Officer_Code`,`Group_Officer_Name`,`Credit_Officer_Totals`,`Group_Fines`,`Posted` ,0,`sent`  from `Transaction`");
            database.execSQL("Drop table `Transaction`");
            database.execSQL("ALTER TABLE `Transaction_temp` RENAME TO `Transaction`");
        }
    };

    static final Migration MIGRATION_3_4 = new Migration(3, 4) {
        @Override
        public void migrate(SupportSQLiteDatabase database) {

            database.execSQL("CREATE TABLE IF NOT EXISTS `t_line_temp` (`Key` TEXT, `No` INTEGER NOT NULL, `PAWDEP_No` TEXT NOT NULL, `Transaction_No` TEXT NOT NULL, `Member_Name` TEXT, `Loan_No` TEXT, `Group_Code` TEXT, `Savings_B_F` REAL NOT NULL, `Loan_Balance_B_F` REAL NOT NULL, `Expected_Interest` REAL NOT NULL, `Total_Paid` REAL NOT NULL, `Principle_Paid` REAL NOT NULL, `Interest_Paid` REAL NOT NULL, `Monthly_Savings` REAL NOT NULL, `Savings__Shares_C_F` REAL NOT NULL, `Loan_Balance_C_F` REAL NOT NULL, `Interest_Balance_C_F` REAL NOT NULL, `Fines` REAL NOT NULL, `t_lineaction_No` TEXT, `Unpaid_Penalty` REAL NOT NULL, `Penalty_Charged` REAL NOT NULL, `Non_Cash` INTEGER NOT NULL, `Expected_Principal` REAL NOT NULL, `Member_No` TEXT, `Principle_Recovered` REAL NOT NULL, `Intrerest_Recovered` REAL NOT NULL, `Hall` REAL NOT NULL, `Branch_Code` TEXT, `sent` INTEGER NOT NULL, `saved` INTEGER, `Error` TEXT, `Total` REAL NOT NULL, `t_line_Header` TEXT, PRIMARY KEY(`PAWDEP_No`, `Transaction_No`))");

            database.execSQL("Insert into `t_line_temp` (`Key` ,`No` ,`PAWDEP_No` ,`Transaction_No` ,`Member_Name` ,`Loan_No` ,`Group_Code` ,`Savings_B_F`,`Loan_Balance_B_F`,`Expected_Interest`,`Total_Paid`,`Principle_Paid`,`Interest_Paid`,`Monthly_Savings`,`Savings__Shares_C_F`,`Loan_Balance_C_F`,`Interest_Balance_C_F`,`Fines`,`t_lineaction_No` ,`Unpaid_Penalty`,`Penalty_Charged`,`Non_Cash` ,`Expected_Principal`,`Member_No` ,`Principle_Recovered`,`Intrerest_Recovered`,`Hall`,`Branch_Code` ,`sent` ,`saved` ,`Error` ,`Total`,`t_line_Header`  ) select `Key` ,`No` ,`PAWDEP_No` ,`Transaction_No` ,`Member_Name` ,`Loan_No` ,`Group_Code` ,`Savings_B_F`,`Loan_Balance_B_F`,`Expected_Interest`,`Total_Paid`,`Principle_Paid`,`Interest_Paid`,`Monthly_Savings`,`Savings__Shares_C_F`,`Loan_Balance_C_F`,`Interest_Balance_C_F`,`Fines`,`t_lineaction_No` ,`Unpaid_Penalty`,`Penalty_Charged`,`Non_Cash` ,`Expected_Principal`,`Member_No` ,`Principle_Recovered`,`Intrerest_Recovered`,`Hall`,`Branch_Code` ,`sent` ,`saved` ,`Error` ,`Total`,`t_line_Header` from `t_line` ");
            database.execSQL("Drop table `t_line`");
            database.execSQL("ALTER TABLE `t_line_temp` RENAME TO `t_line`");
        }
    };
    static final Migration MIGRATION_4_5 = new Migration(4, 5) {
        @Override
        public void migrate(SupportSQLiteDatabase database) {

            database.execSQL("CREATE TABLE IF NOT EXISTS `Loan_Request_temp` (`Key` TEXT, `Request_No` TEXT NOT NULL, `Loan_Type` TEXT, `Outstanding_Loans` REAL NOT NULL, `Outstanding_LoansSpecified` INTEGER, `Current_Savings` REAL NOT NULL, `Current_SavingsSpecified` INTEGER, `Member_Code` TEXT NOT NULL, `Member_Name` TEXT, `ID_No` TEXT, `Loan_Product_Name` TEXT, `Date` INTEGER, `DateSpecified` INTEGER, `Contact` TEXT, `Loan_Guarantee_Fund` REAL NOT NULL, `Loan_Guarantee_FundSpecified` INTEGER, `Sent` INTEGER NOT NULL, `Amount_Applied` REAL NOT NULL, `Amount_AppliedSpecified` INTEGER, `Remarks` TEXT, `Branch_Code` TEXT, `Branch_Name` TEXT, `Group_Code` TEXT, `Group_Name` TEXT, `No_series` TEXT, `Loan_Status` INTEGER NOT NULL, `Loan_StatusSpecified` INTEGER, `Posted` INTEGER, `PostedSpecified` INTEGER, `Loan_No` TEXT, `Member_Category` INTEGER NOT NULL, `Member_CategorySpecified` INTEGER, `Credit_officer_Code` TEXT, `Credit_Officer_Name` TEXT, `Gender` INTEGER NOT NULL, `GenderSpecified` INTEGER, `Phone_No` TEXT, `Target_Category` INTEGER NOT NULL, `Target_CategorySpecified` INTEGER, `Product_Category` INTEGER NOT NULL, `Product_CategorySpecified` INTEGER, `Sector` TEXT, `Sub_Sector` TEXT, PRIMARY KEY(`Request_No`, `Member_Code`))");

            database.execSQL("Insert into `Loan_Request_temp` (`Key` , `Request_No`  , `Loan_Type` , `Outstanding_Loans`, `Outstanding_LoansSpecified` , `Current_Savings`, `Current_SavingsSpecified` , `Member_Code`  , `Member_Name` , `ID_No` , `Loan_Product_Name` , `Date` , `DateSpecified` , `Contact` , `Loan_Guarantee_Fund`, `Loan_Guarantee_FundSpecified` , `Sent`  , `Amount_Applied`, `Amount_AppliedSpecified` , `Remarks` , `Branch_Code` , `Branch_Name` , `Group_Code` , `Group_Name` , `No_series` , `Loan_Status`  , `Loan_StatusSpecified` , `Posted` , `PostedSpecified` , `Loan_No` , `Member_Category`  , `Member_CategorySpecified` , `Credit_officer_Code` , `Credit_Officer_Name` , `Gender`  , `GenderSpecified` , `Phone_No` , `Target_Category`  , `Target_CategorySpecified` , `Product_Category`  , `Product_CategorySpecified` , `Sector` , `Sub_Sector`  ) select `Key` , `Request_No`  , `Loan_Type` , `Outstanding_Loans`, `Outstanding_LoansSpecified` , `Current_Savings`, `Current_SavingsSpecified` , `Member_Code`  , `Member_Name` , `ID_No` , `Loan_Product_Name` , `Date` , `DateSpecified` , `Contact` , `Loan_Guarantee_Fund`, `Loan_Guarantee_FundSpecified` , `Sent`  , `Amount_Applied`, `Amount_AppliedSpecified` , `Remarks` , `Branch_Code` , `Branch_Name` , `Group_Code` , `Group_Name` , `No_series` , `Loan_Status`  , `Loan_StatusSpecified` , `Posted` , `PostedSpecified` , `Loan_No` , `Member_Category`  , `Member_CategorySpecified` , `Credit_officer_Code` , `Credit_Officer_Name` , `Gender`  , `GenderSpecified` , `Phone_No` , `Target_Category`  , `Target_CategorySpecified` , `Product_Category`  , `Product_CategorySpecified` , `Sector` , `Sub_Sector` from `Loan_Request`  where `Member_Code` <>''");
            database.execSQL("Drop table `Loan_Request`");
            database.execSQL("ALTER TABLE `Loan_Request_temp` RENAME TO `Loan_Request`");
        }
    };
    static final Migration MIGRATION_5_6 = new Migration(5, 6) {
        @Override
        public void migrate(SupportSQLiteDatabase database) {
            database.execSQL("ALTER TABLE `Members` ADD COLUMN `update` INTEGER DEFAULT 0 NOT NULL;");
            database.execSQL("ALTER TABLE `Members` ADD COLUMN `Gender` INTEGER DEFAULT 0 NOT NULL;");
        }
    };
    static final Migration MIGRATION_6_7 = new Migration(6, 7) {
        @Override
        public void migrate(SupportSQLiteDatabase database) {
            database.execSQL("ALTER TABLE `Loan` ADD COLUMN `Latest_Payment_Date` INTEGER;");
        }
    };
    static final Migration MIGRATION_7_8 = new Migration(7, 8) {
        @Override
        public void migrate(SupportSQLiteDatabase database) {
            database.execSQL("ALTER TABLE `Repayment` ADD COLUMN `Latest_Payment_Date` INTEGER;");
            database.execSQL("ALTER TABLE `t_line` ADD COLUMN `Latest_Payment_Date` INTEGER;");
        }
    };

    static final Migration MIGRATION_8_9 = new Migration(8, 9) {
        @Override
        public void migrate(SupportSQLiteDatabase database) {
            database.execSQL("CREATE TABLE IF NOT EXISTS `Allocation_header` (`Key` TEXT, `No` TEXT NOT NULL, `Allocation_Date` INTEGER, `Allocation_DateSpecified` INTEGER, `Pawdep_No` TEXT, `Member_Names` TEXT, `Allocated_By` TEXT, `Allocation_Description` TEXT, `StatusSpecified` INTEGER, `Document_No` TEXT, `Posted` INTEGER, `PostedSpecified` INTEGER, `No_series` TEXT, `Amount` REAL NOT NULL, `AmountSpecified` INTEGER, `Line_Amount` REAL NOT NULL, `Line_AmountSpecified` INTEGER, `Group_Code` TEXT, `Group_Name` TEXT, `Branch_Code` TEXT, `Branch_Name` TEXT, `Member_No` TEXT, `Allocation_header_No` TEXT, `Allocation_header_Description` TEXT, `ID_No` TEXT, `CategorySpecified` INTEGER, `Unidentified_Allocation_header_No` TEXT, PRIMARY KEY(`No`))");

            database.execSQL("CREATE TABLE IF NOT EXISTS `Allocation_Line` (`Key` TEXT, `No` TEXT NOT NULL, `Transaction_Type` INTEGER NOT NULL, `Transaction_TypeSpecified` INTEGER, `Receipt_Account` TEXT, `Account_Type` INTEGER, `Account_TypeSpecified` INTEGER, `Account_No` TEXT NOT NULL, `Account_Name` TEXT, `Amount` REAL NOT NULL, `AmountSpecified` INTEGER, `Description` TEXT, `Rent_Type` INTEGER, `Rent_TypeSpecified` INTEGER, `Unit_No` TEXT, `Floor_Code` TEXT, `Building_Code` TEXT, `Loan_No` TEXT NOT NULL, `Branch` TEXT, `Type` TEXT, `Interest_Amount` REAL NOT NULL, `Interest_AmountSpecified` INTEGER, `Principal_Repayment` REAL NOT NULL, `Principal_RepaymentSpecified` INTEGER, `Expected_Interest` REAL NOT NULL, `Expected_InterestSpecified` INTEGER, `LineNo` INTEGER NOT NULL, `LineNoSpecified` INTEGER, PRIMARY KEY(`No`, `Transaction_Type`, `Account_No`, `Loan_No`))");
            database.execSQL("CREATE TABLE IF NOT EXISTS `Bank_Entries` (`Key` TEXT, `TransactionId` TEXT NOT NULL, `Message_reference` TEXT, `Message_DateTime` INTEGER, `Message_DateTimeSpecified` INTEGER, `Service_Name` TEXT, `Notification_Code` TEXT, `Payment_Ref` TEXT, `AccountNumber` TEXT, `Amount` REAL NOT NULL, `AmountSpecified` INTEGER, `Transaction_Date` TEXT, `Event_Type` TEXT, `Currency` TEXT, `Exchange_Rate` TEXT, `Narration` TEXT, `Value_Date` TEXT, `Entry_Date` TEXT, `Cust_Memo_Line1` TEXT, `Cust_Memo_Line2` TEXT, `Cust_Memo_Line3` TEXT, `Reference` TEXT, `ID_No` TEXT, `Phone_No` TEXT, PRIMARY KEY(`TransactionId`))");

        }
    };
    static final Migration MIGRATION_9_10 = new Migration(9, 10) {
        @Override
        public void migrate(SupportSQLiteDatabase database) {
            database.execSQL("Drop table `Allocation_header`");
            database.execSQL("CREATE TABLE IF NOT EXISTS `Allocation_header` (`Key` TEXT, `No` TEXT NOT NULL, `Allocation_Date` INTEGER, `Allocation_DateSpecified` INTEGER, `Pawdep_No` TEXT, `Member_Names` TEXT, `Allocated_By` TEXT, `Allocation_Description` TEXT, `Status` INTEGER, `StatusSpecified` INTEGER, `Document_No` TEXT, `Posted` INTEGER, `PostedSpecified` INTEGER, `No_series` TEXT, `Amount` REAL NOT NULL, `AmountSpecified` INTEGER, `Line_Amount` REAL NOT NULL, `Line_AmountSpecified` INTEGER, `Group_Code` TEXT, `Group_Name` TEXT, `Branch_Code` TEXT, `Branch_Name` TEXT, `Member_No` TEXT, `Transaction_No` TEXT, `Transaction_Description` TEXT, `ID_No` TEXT, `Category` INTEGER, `CategorySpecified` INTEGER, `Unidentified_Transaction_No` TEXT, PRIMARY KEY(`No`))");
        }
    };
    static final Migration MIGRATION_10_11 = new Migration(10, 11) {
        @Override
        public void migrate(SupportSQLiteDatabase database) {
            database.execSQL("ALTER TABLE `Bank_Entries` ADD COLUMN `Posted` INTEGER ;");

        }
    };
    static final Migration MIGRATION_11_12 = new Migration(11, 12) {
        @Override
        public void migrate(SupportSQLiteDatabase database) {

            database.execSQL("Drop table `Bank_Entries`");
        }
    };
    static final Migration MIGRATION_12_13 = new Migration(12, 13) {
        @Override
        public void migrate(SupportSQLiteDatabase database) {

            database.execSQL("Drop table `Loan`");
            database.execSQL("CREATE TABLE IF NOT EXISTS `Loan` (`Loan_No` TEXT NOT NULL, `Member_No` TEXT, `Member_Name` TEXT, `ID_No` TEXT, `Loan_Status` INTEGER NOT NULL, `Installments` INTEGER NOT NULL, `Date_Approved` TEXT, `Disbursement_Date` TEXT, `Mode_of_Disbursement` INTEGER NOT NULL, `Repayment` REAL NOT NULL, `Outstanding_Balance` REAL NOT NULL, `Group_No` TEXT, `Loan_Type` TEXT, `PAWDEP_Schedule_Repayment` REAL, `PAWDEP_Schedule_Interest` REAL, `Interest_Paid` REAL, `Current_Repayments` REAL, `Haraka_Balance` REAL, `Group_Name` TEXT, `Posted` INTEGER, `PostedSpecified` INTEGER, `Amount_approved` REAL NOT NULL, `Amount_approvedSpecified` INTEGER, `Amount_Applied` REAL NOT NULL, `Amount_AppliedSpecified` INTEGER, `Client_Category` INTEGER NOT NULL, `ClientCategory` TEXT, `Client_CategorySpecified` INTEGER, `Sector` TEXT, `Sub_Sector` TEXT, `Repayment_Start_Date` INTEGER, `Repayment_Start_DateSpecified` INTEGER, `Loan_Request_No` TEXT, `Loan_Purpose` TEXT, `Latest_Payment_Date` INTEGER, `Sent` INTEGER, PRIMARY KEY(`Loan_No`))");
        }
    };
    static final Migration MIGRATION_13_14 = new Migration(13, 14) {
        @Override
        public void migrate(SupportSQLiteDatabase database) {

            database.execSQL("ALTER TABLE `Allocation_header` ADD COLUMN `Captured_by` TEXT ;");
        }
    };
}
