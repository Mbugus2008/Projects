package com.trimline.metrocrew;

import androidx.lifecycle.LiveData;
import androidx.room.EntityDeleteOrUpdateAdapter;
import androidx.room.EntityInsertAdapter;
import androidx.room.RoomDatabase;
import androidx.room.util.DBUtil;
import androidx.room.util.SQLiteStatementUtil;
import androidx.sqlite.SQLiteConnection;
import androidx.sqlite.SQLiteStatement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import kotlin.jvm.functions.Function1;

/* JADX INFO: loaded from: classes5.dex */
public final class transaction_dao_Impl extends transaction.dao {
    private final RoomDatabase __db;
    private final EntityInsertAdapter<transaction> __insertAdapterOftransaction = new EntityInsertAdapter<transaction>() { // from class: com.trimline.metrocrew.transaction_dao_Impl.1
        @Override // androidx.room.EntityInsertAdapter
        protected String createQuery() {
            return "INSERT OR REPLACE INTO `transaction` (`Key`,`Entry_No`,`No`,`Date`,`Type`,`transtype`,`PayMode`,`Pay_Mode`,`Cheque_Deposit_Slip_No`,`Cheque_Deposit_Slip_Date`,`Bank_Code`,`Received_From`,`On_Behalf_Of`,`Cashier`,`Account_No`,`Account_Name`,`Posted`,`Date_Posted`,`Time_Posted`,`Posted_By`,`Amount`,`Remarks`,`Transaction_Name`,`Branch_Code`,`Agent_Code`,`Grouping`,`Global_Dimension_1_Code`,`Shortcut_Dimension_2_Code`,`VAT_Percent`,`Currency_Code`,`Currency_Factor`,`VAT_Bus_Posting_Group`,`VAT_Prod_Posting_Group`,`Gen_Posting_TypeSpecified`,`Gen_Bus_Posting_Group`,`Gen_Prod_Posting_Group`,`VAT_Amount`,`Total_Amount`,`User_ID`,`Apply_to`,`Apply_to_ID`,`Dest_Global_Dimension_1_Code`,`Dest_Shortcut_Dimension_2_Code`,`Line_No`,`Print_No`,`Deposit_Slip_Time`,`Teller_ID`,`Customer_Payment_On_Account`,`Select`,`Batch_Posted`,`Transaction_No`,`Cheque_Deposit_Slip_Bank`,`Bank_Account`,`Confirmed`,`Reconciled`,`Orig_Cashier`,`Cancelled`,`Cancelled_By`,`Cancelled_Date`,`Cancelled_Time`,`Post_Dated`,`Cheque_Retrieved`,`Register_Number`,`From_Entry_No`,`To_Entry_No`,`Batch_Posted_UserID`,`BD_Register_Number`,`BD_From_Number`,`BD_To_Number`,`Reversal_By`,`Reversal_Date`,`Reversal_Time`,`Reversal_Register_No`,`Reversal_From_Entry_No`,`Reversal_To_Entry_No`,`Reversed`,`Applies_to_Doc_No`,`Applies_to_ID`,`Grant_No`,`Installment_Number`,`Next_Installment_Date`,`Dimension_Set_ID`,`Donor`,`Group_Code`,`Pre_ADM_Fines`,`Med_Fines`,`Loan_No`,`Penalty`,`sent`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityInsertAdapter
        public void bind(SQLiteStatement sQLiteStatement, transaction transactionVar) {
            if (transactionVar.Key != null) {
                sQLiteStatement.mo154bindText(1, transactionVar.Key);
            } else {
                sQLiteStatement.mo153bindNull(1);
            }
            sQLiteStatement.mo152bindLong(2, transactionVar.Entry_No);
            if (transactionVar.No != null) {
                sQLiteStatement.mo154bindText(3, transactionVar.No);
            } else {
                sQLiteStatement.mo153bindNull(3);
            }
            Long lFromDate = Converters.DateConverter.fromDate(transactionVar.Date);
            if (lFromDate != null) {
                sQLiteStatement.mo152bindLong(4, lFromDate.longValue());
            } else {
                sQLiteStatement.mo153bindNull(4);
            }
            if (transactionVar.Type != null) {
                sQLiteStatement.mo154bindText(5, transactionVar.Type);
            } else {
                sQLiteStatement.mo153bindNull(5);
            }
            if (transactionVar.transtype != null) {
                sQLiteStatement.mo154bindText(6, transactionVar.transtype);
            } else {
                sQLiteStatement.mo153bindNull(6);
            }
            if (transactionVar.PayMode != null) {
                sQLiteStatement.mo154bindText(7, transactionVar.PayMode);
            } else {
                sQLiteStatement.mo153bindNull(7);
            }
            if (transactionVar.Pay_Mode != null) {
                sQLiteStatement.mo154bindText(8, transactionVar.Pay_Mode);
            } else {
                sQLiteStatement.mo153bindNull(8);
            }
            if (transactionVar.Cheque_Deposit_Slip_No != null) {
                sQLiteStatement.mo154bindText(9, transactionVar.Cheque_Deposit_Slip_No);
            } else {
                sQLiteStatement.mo153bindNull(9);
            }
            Long lFromDate2 = Converters.DateConverter.fromDate(transactionVar.Cheque_Deposit_Slip_Date);
            if (lFromDate2 != null) {
                sQLiteStatement.mo152bindLong(10, lFromDate2.longValue());
            } else {
                sQLiteStatement.mo153bindNull(10);
            }
            if (transactionVar.Bank_Code != null) {
                sQLiteStatement.mo154bindText(11, transactionVar.Bank_Code);
            } else {
                sQLiteStatement.mo153bindNull(11);
            }
            if (transactionVar.Received_From != null) {
                sQLiteStatement.mo154bindText(12, transactionVar.Received_From);
            } else {
                sQLiteStatement.mo153bindNull(12);
            }
            if (transactionVar.On_Behalf_Of != null) {
                sQLiteStatement.mo154bindText(13, transactionVar.On_Behalf_Of);
            } else {
                sQLiteStatement.mo153bindNull(13);
            }
            if (transactionVar.Cashier != null) {
                sQLiteStatement.mo154bindText(14, transactionVar.Cashier);
            } else {
                sQLiteStatement.mo153bindNull(14);
            }
            if (transactionVar.Account_No != null) {
                sQLiteStatement.mo154bindText(15, transactionVar.Account_No);
            } else {
                sQLiteStatement.mo153bindNull(15);
            }
            if (transactionVar.Account_Name != null) {
                sQLiteStatement.mo154bindText(16, transactionVar.Account_Name);
            } else {
                sQLiteStatement.mo153bindNull(16);
            }
            Integer numValueOf = transactionVar.Posted == null ? null : Integer.valueOf(transactionVar.Posted.booleanValue() ? 1 : 0);
            if (numValueOf != null) {
                sQLiteStatement.mo152bindLong(17, numValueOf.intValue());
            } else {
                sQLiteStatement.mo153bindNull(17);
            }
            Long lFromDate3 = Converters.DateConverter.fromDate(transactionVar.Date_Posted);
            if (lFromDate3 != null) {
                sQLiteStatement.mo152bindLong(18, lFromDate3.longValue());
            } else {
                sQLiteStatement.mo153bindNull(18);
            }
            Long lFromDate4 = Converters.DateConverter.fromDate(transactionVar.Time_Posted);
            if (lFromDate4 != null) {
                sQLiteStatement.mo152bindLong(19, lFromDate4.longValue());
            } else {
                sQLiteStatement.mo153bindNull(19);
            }
            if (transactionVar.Posted_By != null) {
                sQLiteStatement.mo154bindText(20, transactionVar.Posted_By);
            } else {
                sQLiteStatement.mo153bindNull(20);
            }
            if (transactionVar.Amount != null) {
                sQLiteStatement.mo151bindDouble(21, transactionVar.Amount.doubleValue());
            } else {
                sQLiteStatement.mo153bindNull(21);
            }
            if (transactionVar.Remarks != null) {
                sQLiteStatement.mo154bindText(22, transactionVar.Remarks);
            } else {
                sQLiteStatement.mo153bindNull(22);
            }
            if (transactionVar.Transaction_Name == null) {
                sQLiteStatement.mo153bindNull(23);
            } else {
                sQLiteStatement.mo154bindText(23, transactionVar.Transaction_Name);
            }
            if (transactionVar.Branch_Code == null) {
                sQLiteStatement.mo153bindNull(24);
            } else {
                sQLiteStatement.mo154bindText(24, transactionVar.Branch_Code);
            }
            if (transactionVar.Agent_Code == null) {
                sQLiteStatement.mo153bindNull(25);
            } else {
                sQLiteStatement.mo154bindText(25, transactionVar.Agent_Code);
            }
            if (transactionVar.Grouping == null) {
                sQLiteStatement.mo153bindNull(26);
            } else {
                sQLiteStatement.mo154bindText(26, transactionVar.Grouping);
            }
            if (transactionVar.Global_Dimension_1_Code == null) {
                sQLiteStatement.mo153bindNull(27);
            } else {
                sQLiteStatement.mo154bindText(27, transactionVar.Global_Dimension_1_Code);
            }
            if (transactionVar.Shortcut_Dimension_2_Code == null) {
                sQLiteStatement.mo153bindNull(28);
            } else {
                sQLiteStatement.mo154bindText(28, transactionVar.Shortcut_Dimension_2_Code);
            }
            if (transactionVar.VAT_Percent == null) {
                sQLiteStatement.mo153bindNull(29);
            } else {
                sQLiteStatement.mo151bindDouble(29, transactionVar.VAT_Percent.doubleValue());
            }
            if (transactionVar.Currency_Code == null) {
                sQLiteStatement.mo153bindNull(30);
            } else {
                sQLiteStatement.mo154bindText(30, transactionVar.Currency_Code);
            }
            if (transactionVar.Currency_Factor == null) {
                sQLiteStatement.mo153bindNull(31);
            } else {
                sQLiteStatement.mo151bindDouble(31, transactionVar.Currency_Factor.doubleValue());
            }
            if (transactionVar.VAT_Bus_Posting_Group == null) {
                sQLiteStatement.mo153bindNull(32);
            } else {
                sQLiteStatement.mo154bindText(32, transactionVar.VAT_Bus_Posting_Group);
            }
            if (transactionVar.VAT_Prod_Posting_Group == null) {
                sQLiteStatement.mo153bindNull(33);
            } else {
                sQLiteStatement.mo154bindText(33, transactionVar.VAT_Prod_Posting_Group);
            }
            Integer numValueOf2 = transactionVar.Gen_Posting_TypeSpecified == null ? null : Integer.valueOf(transactionVar.Gen_Posting_TypeSpecified.booleanValue() ? 1 : 0);
            if (numValueOf2 == null) {
                sQLiteStatement.mo153bindNull(34);
            } else {
                sQLiteStatement.mo152bindLong(34, numValueOf2.intValue());
            }
            if (transactionVar.Gen_Bus_Posting_Group == null) {
                sQLiteStatement.mo153bindNull(35);
            } else {
                sQLiteStatement.mo154bindText(35, transactionVar.Gen_Bus_Posting_Group);
            }
            if (transactionVar.Gen_Prod_Posting_Group == null) {
                sQLiteStatement.mo153bindNull(36);
            } else {
                sQLiteStatement.mo154bindText(36, transactionVar.Gen_Prod_Posting_Group);
            }
            if (transactionVar.VAT_Amount == null) {
                sQLiteStatement.mo153bindNull(37);
            } else {
                sQLiteStatement.mo151bindDouble(37, transactionVar.VAT_Amount.doubleValue());
            }
            if (transactionVar.Total_Amount == null) {
                sQLiteStatement.mo153bindNull(38);
            } else {
                sQLiteStatement.mo151bindDouble(38, transactionVar.Total_Amount.doubleValue());
            }
            if (transactionVar.User_ID == null) {
                sQLiteStatement.mo153bindNull(39);
            } else {
                sQLiteStatement.mo154bindText(39, transactionVar.User_ID);
            }
            if (transactionVar.Apply_to == null) {
                sQLiteStatement.mo153bindNull(40);
            } else {
                sQLiteStatement.mo154bindText(40, transactionVar.Apply_to);
            }
            if (transactionVar.Apply_to_ID == null) {
                sQLiteStatement.mo153bindNull(41);
            } else {
                sQLiteStatement.mo154bindText(41, transactionVar.Apply_to_ID);
            }
            if (transactionVar.Dest_Global_Dimension_1_Code == null) {
                sQLiteStatement.mo153bindNull(42);
            } else {
                sQLiteStatement.mo154bindText(42, transactionVar.Dest_Global_Dimension_1_Code);
            }
            if (transactionVar.Dest_Shortcut_Dimension_2_Code == null) {
                sQLiteStatement.mo153bindNull(43);
            } else {
                sQLiteStatement.mo154bindText(43, transactionVar.Dest_Shortcut_Dimension_2_Code);
            }
            sQLiteStatement.mo152bindLong(44, transactionVar.Line_No);
            sQLiteStatement.mo152bindLong(45, transactionVar.Print_No);
            Long lFromDate5 = Converters.DateConverter.fromDate(transactionVar.Deposit_Slip_Time);
            if (lFromDate5 == null) {
                sQLiteStatement.mo153bindNull(46);
            } else {
                sQLiteStatement.mo152bindLong(46, lFromDate5.longValue());
            }
            if (transactionVar.Teller_ID == null) {
                sQLiteStatement.mo153bindNull(47);
            } else {
                sQLiteStatement.mo154bindText(47, transactionVar.Teller_ID);
            }
            Integer numValueOf3 = transactionVar.Customer_Payment_On_Account == null ? null : Integer.valueOf(transactionVar.Customer_Payment_On_Account.booleanValue() ? 1 : 0);
            if (numValueOf3 == null) {
                sQLiteStatement.mo153bindNull(48);
            } else {
                sQLiteStatement.mo152bindLong(48, numValueOf3.intValue());
            }
            Integer numValueOf4 = transactionVar.Select == null ? null : Integer.valueOf(transactionVar.Select.booleanValue() ? 1 : 0);
            if (numValueOf4 == null) {
                sQLiteStatement.mo153bindNull(49);
            } else {
                sQLiteStatement.mo152bindLong(49, numValueOf4.intValue());
            }
            Integer numValueOf5 = transactionVar.Batch_Posted == null ? null : Integer.valueOf(transactionVar.Batch_Posted.booleanValue() ? 1 : 0);
            if (numValueOf5 == null) {
                sQLiteStatement.mo153bindNull(50);
            } else {
                sQLiteStatement.mo152bindLong(50, numValueOf5.intValue());
            }
            if (transactionVar.Transaction_No == null) {
                sQLiteStatement.mo153bindNull(51);
            } else {
                sQLiteStatement.mo154bindText(51, transactionVar.Transaction_No);
            }
            if (transactionVar.Cheque_Deposit_Slip_Bank == null) {
                sQLiteStatement.mo153bindNull(52);
            } else {
                sQLiteStatement.mo154bindText(52, transactionVar.Cheque_Deposit_Slip_Bank);
            }
            if (transactionVar.Bank_Account == null) {
                sQLiteStatement.mo153bindNull(53);
            } else {
                sQLiteStatement.mo154bindText(53, transactionVar.Bank_Account);
            }
            Integer numValueOf6 = transactionVar.Confirmed == null ? null : Integer.valueOf(transactionVar.Confirmed.booleanValue() ? 1 : 0);
            if (numValueOf6 == null) {
                sQLiteStatement.mo153bindNull(54);
            } else {
                sQLiteStatement.mo152bindLong(54, numValueOf6.intValue());
            }
            Integer numValueOf7 = transactionVar.Reconciled == null ? null : Integer.valueOf(transactionVar.Reconciled.booleanValue() ? 1 : 0);
            if (numValueOf7 == null) {
                sQLiteStatement.mo153bindNull(55);
            } else {
                sQLiteStatement.mo152bindLong(55, numValueOf7.intValue());
            }
            if (transactionVar.Orig_Cashier == null) {
                sQLiteStatement.mo153bindNull(56);
            } else {
                sQLiteStatement.mo154bindText(56, transactionVar.Orig_Cashier);
            }
            Integer numValueOf8 = transactionVar.Cancelled == null ? null : Integer.valueOf(transactionVar.Cancelled.booleanValue() ? 1 : 0);
            if (numValueOf8 == null) {
                sQLiteStatement.mo153bindNull(57);
            } else {
                sQLiteStatement.mo152bindLong(57, numValueOf8.intValue());
            }
            if (transactionVar.Cancelled_By == null) {
                sQLiteStatement.mo153bindNull(58);
            } else {
                sQLiteStatement.mo154bindText(58, transactionVar.Cancelled_By);
            }
            Long lFromDate6 = Converters.DateConverter.fromDate(transactionVar.Cancelled_Date);
            if (lFromDate6 == null) {
                sQLiteStatement.mo153bindNull(59);
            } else {
                sQLiteStatement.mo152bindLong(59, lFromDate6.longValue());
            }
            Long lFromDate7 = Converters.DateConverter.fromDate(transactionVar.Cancelled_Time);
            if (lFromDate7 == null) {
                sQLiteStatement.mo153bindNull(60);
            } else {
                sQLiteStatement.mo152bindLong(60, lFromDate7.longValue());
            }
            Integer numValueOf9 = transactionVar.Post_Dated == null ? null : Integer.valueOf(transactionVar.Post_Dated.booleanValue() ? 1 : 0);
            if (numValueOf9 == null) {
                sQLiteStatement.mo153bindNull(61);
            } else {
                sQLiteStatement.mo152bindLong(61, numValueOf9.intValue());
            }
            Integer numValueOf10 = transactionVar.Cheque_Retrieved == null ? null : Integer.valueOf(transactionVar.Cheque_Retrieved.booleanValue() ? 1 : 0);
            if (numValueOf10 == null) {
                sQLiteStatement.mo153bindNull(62);
            } else {
                sQLiteStatement.mo152bindLong(62, numValueOf10.intValue());
            }
            sQLiteStatement.mo152bindLong(63, transactionVar.Register_Number);
            sQLiteStatement.mo152bindLong(64, transactionVar.From_Entry_No);
            sQLiteStatement.mo152bindLong(65, transactionVar.To_Entry_No);
            if (transactionVar.Batch_Posted_UserID == null) {
                sQLiteStatement.mo153bindNull(66);
            } else {
                sQLiteStatement.mo154bindText(66, transactionVar.Batch_Posted_UserID);
            }
            sQLiteStatement.mo152bindLong(67, transactionVar.BD_Register_Number);
            sQLiteStatement.mo152bindLong(68, transactionVar.BD_From_Number);
            sQLiteStatement.mo152bindLong(69, transactionVar.BD_To_Number);
            if (transactionVar.Reversal_By == null) {
                sQLiteStatement.mo153bindNull(70);
            } else {
                sQLiteStatement.mo154bindText(70, transactionVar.Reversal_By);
            }
            Long lFromDate8 = Converters.DateConverter.fromDate(transactionVar.Reversal_Date);
            if (lFromDate8 == null) {
                sQLiteStatement.mo153bindNull(71);
            } else {
                sQLiteStatement.mo152bindLong(71, lFromDate8.longValue());
            }
            Long lFromDate9 = Converters.DateConverter.fromDate(transactionVar.Reversal_Time);
            if (lFromDate9 == null) {
                sQLiteStatement.mo153bindNull(72);
            } else {
                sQLiteStatement.mo152bindLong(72, lFromDate9.longValue());
            }
            sQLiteStatement.mo152bindLong(73, transactionVar.Reversal_Register_No);
            sQLiteStatement.mo152bindLong(74, transactionVar.Reversal_From_Entry_No);
            sQLiteStatement.mo152bindLong(75, transactionVar.Reversal_To_Entry_No);
            Integer numValueOf11 = transactionVar.Reversed == null ? null : Integer.valueOf(transactionVar.Reversed.booleanValue() ? 1 : 0);
            if (numValueOf11 == null) {
                sQLiteStatement.mo153bindNull(76);
            } else {
                sQLiteStatement.mo152bindLong(76, numValueOf11.intValue());
            }
            if (transactionVar.Applies_to_Doc_No == null) {
                sQLiteStatement.mo153bindNull(77);
            } else {
                sQLiteStatement.mo154bindText(77, transactionVar.Applies_to_Doc_No);
            }
            if (transactionVar.Applies_to_ID == null) {
                sQLiteStatement.mo153bindNull(78);
            } else {
                sQLiteStatement.mo154bindText(78, transactionVar.Applies_to_ID);
            }
            if (transactionVar.Grant_No == null) {
                sQLiteStatement.mo153bindNull(79);
            } else {
                sQLiteStatement.mo154bindText(79, transactionVar.Grant_No);
            }
            sQLiteStatement.mo152bindLong(80, transactionVar.Installment_Number);
            Long lFromDate10 = Converters.DateConverter.fromDate(transactionVar.Next_Installment_Date);
            if (lFromDate10 == null) {
                sQLiteStatement.mo153bindNull(81);
            } else {
                sQLiteStatement.mo152bindLong(81, lFromDate10.longValue());
            }
            sQLiteStatement.mo152bindLong(82, transactionVar.Dimension_Set_ID);
            if (transactionVar.Donor == null) {
                sQLiteStatement.mo153bindNull(83);
            } else {
                sQLiteStatement.mo154bindText(83, transactionVar.Donor);
            }
            if (transactionVar.Group_Code == null) {
                sQLiteStatement.mo153bindNull(84);
            } else {
                sQLiteStatement.mo154bindText(84, transactionVar.Group_Code);
            }
            if (transactionVar.Pre_ADM_Fines == null) {
                sQLiteStatement.mo153bindNull(85);
            } else {
                sQLiteStatement.mo151bindDouble(85, transactionVar.Pre_ADM_Fines.doubleValue());
            }
            if (transactionVar.Med_Fines == null) {
                sQLiteStatement.mo153bindNull(86);
            } else {
                sQLiteStatement.mo151bindDouble(86, transactionVar.Med_Fines.doubleValue());
            }
            if (transactionVar.Loan_No == null) {
                sQLiteStatement.mo153bindNull(87);
            } else {
                sQLiteStatement.mo154bindText(87, transactionVar.Loan_No);
            }
            if (transactionVar.Penalty == null) {
                sQLiteStatement.mo153bindNull(88);
            } else {
                sQLiteStatement.mo151bindDouble(88, transactionVar.Penalty.doubleValue());
            }
            sQLiteStatement.mo152bindLong(89, transactionVar.sent ? 1L : 0L);
        }
    };
    private final EntityDeleteOrUpdateAdapter<transaction> __deleteAdapterOftransaction = new EntityDeleteOrUpdateAdapter<transaction>() { // from class: com.trimline.metrocrew.transaction_dao_Impl.2
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        protected String createQuery() {
            return "DELETE FROM `transaction` WHERE `No` = ? AND `Account_No` = ? AND `transtype` = ?";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        public void bind(final SQLiteStatement statement, final transaction entity) {
            if (entity.No == null) {
                statement.mo153bindNull(1);
            } else {
                statement.mo154bindText(1, entity.No);
            }
            if (entity.Account_No == null) {
                statement.mo153bindNull(2);
            } else {
                statement.mo154bindText(2, entity.Account_No);
            }
            if (entity.transtype == null) {
                statement.mo153bindNull(3);
            } else {
                statement.mo154bindText(3, entity.transtype);
            }
        }
    };
    private final EntityDeleteOrUpdateAdapter<transaction> __updateAdapterOftransaction = new EntityDeleteOrUpdateAdapter<transaction>() { // from class: com.trimline.metrocrew.transaction_dao_Impl.3
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        protected String createQuery() {
            return "UPDATE OR ABORT `transaction` SET `Key` = ?,`Entry_No` = ?,`No` = ?,`Date` = ?,`Type` = ?,`transtype` = ?,`PayMode` = ?,`Pay_Mode` = ?,`Cheque_Deposit_Slip_No` = ?,`Cheque_Deposit_Slip_Date` = ?,`Bank_Code` = ?,`Received_From` = ?,`On_Behalf_Of` = ?,`Cashier` = ?,`Account_No` = ?,`Account_Name` = ?,`Posted` = ?,`Date_Posted` = ?,`Time_Posted` = ?,`Posted_By` = ?,`Amount` = ?,`Remarks` = ?,`Transaction_Name` = ?,`Branch_Code` = ?,`Agent_Code` = ?,`Grouping` = ?,`Global_Dimension_1_Code` = ?,`Shortcut_Dimension_2_Code` = ?,`VAT_Percent` = ?,`Currency_Code` = ?,`Currency_Factor` = ?,`VAT_Bus_Posting_Group` = ?,`VAT_Prod_Posting_Group` = ?,`Gen_Posting_TypeSpecified` = ?,`Gen_Bus_Posting_Group` = ?,`Gen_Prod_Posting_Group` = ?,`VAT_Amount` = ?,`Total_Amount` = ?,`User_ID` = ?,`Apply_to` = ?,`Apply_to_ID` = ?,`Dest_Global_Dimension_1_Code` = ?,`Dest_Shortcut_Dimension_2_Code` = ?,`Line_No` = ?,`Print_No` = ?,`Deposit_Slip_Time` = ?,`Teller_ID` = ?,`Customer_Payment_On_Account` = ?,`Select` = ?,`Batch_Posted` = ?,`Transaction_No` = ?,`Cheque_Deposit_Slip_Bank` = ?,`Bank_Account` = ?,`Confirmed` = ?,`Reconciled` = ?,`Orig_Cashier` = ?,`Cancelled` = ?,`Cancelled_By` = ?,`Cancelled_Date` = ?,`Cancelled_Time` = ?,`Post_Dated` = ?,`Cheque_Retrieved` = ?,`Register_Number` = ?,`From_Entry_No` = ?,`To_Entry_No` = ?,`Batch_Posted_UserID` = ?,`BD_Register_Number` = ?,`BD_From_Number` = ?,`BD_To_Number` = ?,`Reversal_By` = ?,`Reversal_Date` = ?,`Reversal_Time` = ?,`Reversal_Register_No` = ?,`Reversal_From_Entry_No` = ?,`Reversal_To_Entry_No` = ?,`Reversed` = ?,`Applies_to_Doc_No` = ?,`Applies_to_ID` = ?,`Grant_No` = ?,`Installment_Number` = ?,`Next_Installment_Date` = ?,`Dimension_Set_ID` = ?,`Donor` = ?,`Group_Code` = ?,`Pre_ADM_Fines` = ?,`Med_Fines` = ?,`Loan_No` = ?,`Penalty` = ?,`sent` = ? WHERE `No` = ? AND `Account_No` = ? AND `transtype` = ?";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        public void bind(SQLiteStatement sQLiteStatement, transaction transactionVar) {
            if (transactionVar.Key != null) {
                sQLiteStatement.mo154bindText(1, transactionVar.Key);
            } else {
                sQLiteStatement.mo153bindNull(1);
            }
            sQLiteStatement.mo152bindLong(2, transactionVar.Entry_No);
            if (transactionVar.No != null) {
                sQLiteStatement.mo154bindText(3, transactionVar.No);
            } else {
                sQLiteStatement.mo153bindNull(3);
            }
            Long lFromDate = Converters.DateConverter.fromDate(transactionVar.Date);
            if (lFromDate != null) {
                sQLiteStatement.mo152bindLong(4, lFromDate.longValue());
            } else {
                sQLiteStatement.mo153bindNull(4);
            }
            if (transactionVar.Type != null) {
                sQLiteStatement.mo154bindText(5, transactionVar.Type);
            } else {
                sQLiteStatement.mo153bindNull(5);
            }
            if (transactionVar.transtype != null) {
                sQLiteStatement.mo154bindText(6, transactionVar.transtype);
            } else {
                sQLiteStatement.mo153bindNull(6);
            }
            if (transactionVar.PayMode != null) {
                sQLiteStatement.mo154bindText(7, transactionVar.PayMode);
            } else {
                sQLiteStatement.mo153bindNull(7);
            }
            if (transactionVar.Pay_Mode != null) {
                sQLiteStatement.mo154bindText(8, transactionVar.Pay_Mode);
            } else {
                sQLiteStatement.mo153bindNull(8);
            }
            if (transactionVar.Cheque_Deposit_Slip_No != null) {
                sQLiteStatement.mo154bindText(9, transactionVar.Cheque_Deposit_Slip_No);
            } else {
                sQLiteStatement.mo153bindNull(9);
            }
            Long lFromDate2 = Converters.DateConverter.fromDate(transactionVar.Cheque_Deposit_Slip_Date);
            if (lFromDate2 != null) {
                sQLiteStatement.mo152bindLong(10, lFromDate2.longValue());
            } else {
                sQLiteStatement.mo153bindNull(10);
            }
            if (transactionVar.Bank_Code != null) {
                sQLiteStatement.mo154bindText(11, transactionVar.Bank_Code);
            } else {
                sQLiteStatement.mo153bindNull(11);
            }
            if (transactionVar.Received_From != null) {
                sQLiteStatement.mo154bindText(12, transactionVar.Received_From);
            } else {
                sQLiteStatement.mo153bindNull(12);
            }
            if (transactionVar.On_Behalf_Of != null) {
                sQLiteStatement.mo154bindText(13, transactionVar.On_Behalf_Of);
            } else {
                sQLiteStatement.mo153bindNull(13);
            }
            if (transactionVar.Cashier != null) {
                sQLiteStatement.mo154bindText(14, transactionVar.Cashier);
            } else {
                sQLiteStatement.mo153bindNull(14);
            }
            if (transactionVar.Account_No != null) {
                sQLiteStatement.mo154bindText(15, transactionVar.Account_No);
            } else {
                sQLiteStatement.mo153bindNull(15);
            }
            if (transactionVar.Account_Name != null) {
                sQLiteStatement.mo154bindText(16, transactionVar.Account_Name);
            } else {
                sQLiteStatement.mo153bindNull(16);
            }
            Integer numValueOf = transactionVar.Posted == null ? null : Integer.valueOf(transactionVar.Posted.booleanValue() ? 1 : 0);
            if (numValueOf != null) {
                sQLiteStatement.mo152bindLong(17, numValueOf.intValue());
            } else {
                sQLiteStatement.mo153bindNull(17);
            }
            Long lFromDate3 = Converters.DateConverter.fromDate(transactionVar.Date_Posted);
            if (lFromDate3 != null) {
                sQLiteStatement.mo152bindLong(18, lFromDate3.longValue());
            } else {
                sQLiteStatement.mo153bindNull(18);
            }
            Long lFromDate4 = Converters.DateConverter.fromDate(transactionVar.Time_Posted);
            if (lFromDate4 != null) {
                sQLiteStatement.mo152bindLong(19, lFromDate4.longValue());
            } else {
                sQLiteStatement.mo153bindNull(19);
            }
            if (transactionVar.Posted_By != null) {
                sQLiteStatement.mo154bindText(20, transactionVar.Posted_By);
            } else {
                sQLiteStatement.mo153bindNull(20);
            }
            if (transactionVar.Amount != null) {
                sQLiteStatement.mo151bindDouble(21, transactionVar.Amount.doubleValue());
            } else {
                sQLiteStatement.mo153bindNull(21);
            }
            if (transactionVar.Remarks != null) {
                sQLiteStatement.mo154bindText(22, transactionVar.Remarks);
            } else {
                sQLiteStatement.mo153bindNull(22);
            }
            if (transactionVar.Transaction_Name == null) {
                sQLiteStatement.mo153bindNull(23);
            } else {
                sQLiteStatement.mo154bindText(23, transactionVar.Transaction_Name);
            }
            if (transactionVar.Branch_Code == null) {
                sQLiteStatement.mo153bindNull(24);
            } else {
                sQLiteStatement.mo154bindText(24, transactionVar.Branch_Code);
            }
            if (transactionVar.Agent_Code == null) {
                sQLiteStatement.mo153bindNull(25);
            } else {
                sQLiteStatement.mo154bindText(25, transactionVar.Agent_Code);
            }
            if (transactionVar.Grouping == null) {
                sQLiteStatement.mo153bindNull(26);
            } else {
                sQLiteStatement.mo154bindText(26, transactionVar.Grouping);
            }
            if (transactionVar.Global_Dimension_1_Code == null) {
                sQLiteStatement.mo153bindNull(27);
            } else {
                sQLiteStatement.mo154bindText(27, transactionVar.Global_Dimension_1_Code);
            }
            if (transactionVar.Shortcut_Dimension_2_Code == null) {
                sQLiteStatement.mo153bindNull(28);
            } else {
                sQLiteStatement.mo154bindText(28, transactionVar.Shortcut_Dimension_2_Code);
            }
            if (transactionVar.VAT_Percent == null) {
                sQLiteStatement.mo153bindNull(29);
            } else {
                sQLiteStatement.mo151bindDouble(29, transactionVar.VAT_Percent.doubleValue());
            }
            if (transactionVar.Currency_Code == null) {
                sQLiteStatement.mo153bindNull(30);
            } else {
                sQLiteStatement.mo154bindText(30, transactionVar.Currency_Code);
            }
            if (transactionVar.Currency_Factor == null) {
                sQLiteStatement.mo153bindNull(31);
            } else {
                sQLiteStatement.mo151bindDouble(31, transactionVar.Currency_Factor.doubleValue());
            }
            if (transactionVar.VAT_Bus_Posting_Group == null) {
                sQLiteStatement.mo153bindNull(32);
            } else {
                sQLiteStatement.mo154bindText(32, transactionVar.VAT_Bus_Posting_Group);
            }
            if (transactionVar.VAT_Prod_Posting_Group == null) {
                sQLiteStatement.mo153bindNull(33);
            } else {
                sQLiteStatement.mo154bindText(33, transactionVar.VAT_Prod_Posting_Group);
            }
            Integer numValueOf2 = transactionVar.Gen_Posting_TypeSpecified == null ? null : Integer.valueOf(transactionVar.Gen_Posting_TypeSpecified.booleanValue() ? 1 : 0);
            if (numValueOf2 == null) {
                sQLiteStatement.mo153bindNull(34);
            } else {
                sQLiteStatement.mo152bindLong(34, numValueOf2.intValue());
            }
            if (transactionVar.Gen_Bus_Posting_Group == null) {
                sQLiteStatement.mo153bindNull(35);
            } else {
                sQLiteStatement.mo154bindText(35, transactionVar.Gen_Bus_Posting_Group);
            }
            if (transactionVar.Gen_Prod_Posting_Group == null) {
                sQLiteStatement.mo153bindNull(36);
            } else {
                sQLiteStatement.mo154bindText(36, transactionVar.Gen_Prod_Posting_Group);
            }
            if (transactionVar.VAT_Amount == null) {
                sQLiteStatement.mo153bindNull(37);
            } else {
                sQLiteStatement.mo151bindDouble(37, transactionVar.VAT_Amount.doubleValue());
            }
            if (transactionVar.Total_Amount == null) {
                sQLiteStatement.mo153bindNull(38);
            } else {
                sQLiteStatement.mo151bindDouble(38, transactionVar.Total_Amount.doubleValue());
            }
            if (transactionVar.User_ID == null) {
                sQLiteStatement.mo153bindNull(39);
            } else {
                sQLiteStatement.mo154bindText(39, transactionVar.User_ID);
            }
            if (transactionVar.Apply_to == null) {
                sQLiteStatement.mo153bindNull(40);
            } else {
                sQLiteStatement.mo154bindText(40, transactionVar.Apply_to);
            }
            if (transactionVar.Apply_to_ID == null) {
                sQLiteStatement.mo153bindNull(41);
            } else {
                sQLiteStatement.mo154bindText(41, transactionVar.Apply_to_ID);
            }
            if (transactionVar.Dest_Global_Dimension_1_Code == null) {
                sQLiteStatement.mo153bindNull(42);
            } else {
                sQLiteStatement.mo154bindText(42, transactionVar.Dest_Global_Dimension_1_Code);
            }
            if (transactionVar.Dest_Shortcut_Dimension_2_Code == null) {
                sQLiteStatement.mo153bindNull(43);
            } else {
                sQLiteStatement.mo154bindText(43, transactionVar.Dest_Shortcut_Dimension_2_Code);
            }
            sQLiteStatement.mo152bindLong(44, transactionVar.Line_No);
            sQLiteStatement.mo152bindLong(45, transactionVar.Print_No);
            Long lFromDate5 = Converters.DateConverter.fromDate(transactionVar.Deposit_Slip_Time);
            if (lFromDate5 == null) {
                sQLiteStatement.mo153bindNull(46);
            } else {
                sQLiteStatement.mo152bindLong(46, lFromDate5.longValue());
            }
            if (transactionVar.Teller_ID == null) {
                sQLiteStatement.mo153bindNull(47);
            } else {
                sQLiteStatement.mo154bindText(47, transactionVar.Teller_ID);
            }
            Integer numValueOf3 = transactionVar.Customer_Payment_On_Account == null ? null : Integer.valueOf(transactionVar.Customer_Payment_On_Account.booleanValue() ? 1 : 0);
            if (numValueOf3 == null) {
                sQLiteStatement.mo153bindNull(48);
            } else {
                sQLiteStatement.mo152bindLong(48, numValueOf3.intValue());
            }
            Integer numValueOf4 = transactionVar.Select == null ? null : Integer.valueOf(transactionVar.Select.booleanValue() ? 1 : 0);
            if (numValueOf4 == null) {
                sQLiteStatement.mo153bindNull(49);
            } else {
                sQLiteStatement.mo152bindLong(49, numValueOf4.intValue());
            }
            Integer numValueOf5 = transactionVar.Batch_Posted == null ? null : Integer.valueOf(transactionVar.Batch_Posted.booleanValue() ? 1 : 0);
            if (numValueOf5 == null) {
                sQLiteStatement.mo153bindNull(50);
            } else {
                sQLiteStatement.mo152bindLong(50, numValueOf5.intValue());
            }
            if (transactionVar.Transaction_No == null) {
                sQLiteStatement.mo153bindNull(51);
            } else {
                sQLiteStatement.mo154bindText(51, transactionVar.Transaction_No);
            }
            if (transactionVar.Cheque_Deposit_Slip_Bank == null) {
                sQLiteStatement.mo153bindNull(52);
            } else {
                sQLiteStatement.mo154bindText(52, transactionVar.Cheque_Deposit_Slip_Bank);
            }
            if (transactionVar.Bank_Account == null) {
                sQLiteStatement.mo153bindNull(53);
            } else {
                sQLiteStatement.mo154bindText(53, transactionVar.Bank_Account);
            }
            Integer numValueOf6 = transactionVar.Confirmed == null ? null : Integer.valueOf(transactionVar.Confirmed.booleanValue() ? 1 : 0);
            if (numValueOf6 == null) {
                sQLiteStatement.mo153bindNull(54);
            } else {
                sQLiteStatement.mo152bindLong(54, numValueOf6.intValue());
            }
            Integer numValueOf7 = transactionVar.Reconciled == null ? null : Integer.valueOf(transactionVar.Reconciled.booleanValue() ? 1 : 0);
            if (numValueOf7 == null) {
                sQLiteStatement.mo153bindNull(55);
            } else {
                sQLiteStatement.mo152bindLong(55, numValueOf7.intValue());
            }
            if (transactionVar.Orig_Cashier == null) {
                sQLiteStatement.mo153bindNull(56);
            } else {
                sQLiteStatement.mo154bindText(56, transactionVar.Orig_Cashier);
            }
            Integer numValueOf8 = transactionVar.Cancelled == null ? null : Integer.valueOf(transactionVar.Cancelled.booleanValue() ? 1 : 0);
            if (numValueOf8 == null) {
                sQLiteStatement.mo153bindNull(57);
            } else {
                sQLiteStatement.mo152bindLong(57, numValueOf8.intValue());
            }
            if (transactionVar.Cancelled_By == null) {
                sQLiteStatement.mo153bindNull(58);
            } else {
                sQLiteStatement.mo154bindText(58, transactionVar.Cancelled_By);
            }
            Long lFromDate6 = Converters.DateConverter.fromDate(transactionVar.Cancelled_Date);
            if (lFromDate6 == null) {
                sQLiteStatement.mo153bindNull(59);
            } else {
                sQLiteStatement.mo152bindLong(59, lFromDate6.longValue());
            }
            Long lFromDate7 = Converters.DateConverter.fromDate(transactionVar.Cancelled_Time);
            if (lFromDate7 == null) {
                sQLiteStatement.mo153bindNull(60);
            } else {
                sQLiteStatement.mo152bindLong(60, lFromDate7.longValue());
            }
            Integer numValueOf9 = transactionVar.Post_Dated == null ? null : Integer.valueOf(transactionVar.Post_Dated.booleanValue() ? 1 : 0);
            if (numValueOf9 == null) {
                sQLiteStatement.mo153bindNull(61);
            } else {
                sQLiteStatement.mo152bindLong(61, numValueOf9.intValue());
            }
            Integer numValueOf10 = transactionVar.Cheque_Retrieved == null ? null : Integer.valueOf(transactionVar.Cheque_Retrieved.booleanValue() ? 1 : 0);
            if (numValueOf10 == null) {
                sQLiteStatement.mo153bindNull(62);
            } else {
                sQLiteStatement.mo152bindLong(62, numValueOf10.intValue());
            }
            sQLiteStatement.mo152bindLong(63, transactionVar.Register_Number);
            sQLiteStatement.mo152bindLong(64, transactionVar.From_Entry_No);
            sQLiteStatement.mo152bindLong(65, transactionVar.To_Entry_No);
            if (transactionVar.Batch_Posted_UserID == null) {
                sQLiteStatement.mo153bindNull(66);
            } else {
                sQLiteStatement.mo154bindText(66, transactionVar.Batch_Posted_UserID);
            }
            sQLiteStatement.mo152bindLong(67, transactionVar.BD_Register_Number);
            sQLiteStatement.mo152bindLong(68, transactionVar.BD_From_Number);
            sQLiteStatement.mo152bindLong(69, transactionVar.BD_To_Number);
            if (transactionVar.Reversal_By == null) {
                sQLiteStatement.mo153bindNull(70);
            } else {
                sQLiteStatement.mo154bindText(70, transactionVar.Reversal_By);
            }
            Long lFromDate8 = Converters.DateConverter.fromDate(transactionVar.Reversal_Date);
            if (lFromDate8 == null) {
                sQLiteStatement.mo153bindNull(71);
            } else {
                sQLiteStatement.mo152bindLong(71, lFromDate8.longValue());
            }
            Long lFromDate9 = Converters.DateConverter.fromDate(transactionVar.Reversal_Time);
            if (lFromDate9 == null) {
                sQLiteStatement.mo153bindNull(72);
            } else {
                sQLiteStatement.mo152bindLong(72, lFromDate9.longValue());
            }
            sQLiteStatement.mo152bindLong(73, transactionVar.Reversal_Register_No);
            sQLiteStatement.mo152bindLong(74, transactionVar.Reversal_From_Entry_No);
            sQLiteStatement.mo152bindLong(75, transactionVar.Reversal_To_Entry_No);
            Integer numValueOf11 = transactionVar.Reversed == null ? null : Integer.valueOf(transactionVar.Reversed.booleanValue() ? 1 : 0);
            if (numValueOf11 == null) {
                sQLiteStatement.mo153bindNull(76);
            } else {
                sQLiteStatement.mo152bindLong(76, numValueOf11.intValue());
            }
            if (transactionVar.Applies_to_Doc_No == null) {
                sQLiteStatement.mo153bindNull(77);
            } else {
                sQLiteStatement.mo154bindText(77, transactionVar.Applies_to_Doc_No);
            }
            if (transactionVar.Applies_to_ID == null) {
                sQLiteStatement.mo153bindNull(78);
            } else {
                sQLiteStatement.mo154bindText(78, transactionVar.Applies_to_ID);
            }
            if (transactionVar.Grant_No == null) {
                sQLiteStatement.mo153bindNull(79);
            } else {
                sQLiteStatement.mo154bindText(79, transactionVar.Grant_No);
            }
            sQLiteStatement.mo152bindLong(80, transactionVar.Installment_Number);
            Long lFromDate10 = Converters.DateConverter.fromDate(transactionVar.Next_Installment_Date);
            if (lFromDate10 == null) {
                sQLiteStatement.mo153bindNull(81);
            } else {
                sQLiteStatement.mo152bindLong(81, lFromDate10.longValue());
            }
            sQLiteStatement.mo152bindLong(82, transactionVar.Dimension_Set_ID);
            if (transactionVar.Donor == null) {
                sQLiteStatement.mo153bindNull(83);
            } else {
                sQLiteStatement.mo154bindText(83, transactionVar.Donor);
            }
            if (transactionVar.Group_Code == null) {
                sQLiteStatement.mo153bindNull(84);
            } else {
                sQLiteStatement.mo154bindText(84, transactionVar.Group_Code);
            }
            if (transactionVar.Pre_ADM_Fines == null) {
                sQLiteStatement.mo153bindNull(85);
            } else {
                sQLiteStatement.mo151bindDouble(85, transactionVar.Pre_ADM_Fines.doubleValue());
            }
            if (transactionVar.Med_Fines == null) {
                sQLiteStatement.mo153bindNull(86);
            } else {
                sQLiteStatement.mo151bindDouble(86, transactionVar.Med_Fines.doubleValue());
            }
            if (transactionVar.Loan_No == null) {
                sQLiteStatement.mo153bindNull(87);
            } else {
                sQLiteStatement.mo154bindText(87, transactionVar.Loan_No);
            }
            if (transactionVar.Penalty == null) {
                sQLiteStatement.mo153bindNull(88);
            } else {
                sQLiteStatement.mo151bindDouble(88, transactionVar.Penalty.doubleValue());
            }
            sQLiteStatement.mo152bindLong(89, transactionVar.sent ? 1L : 0L);
            if (transactionVar.No == null) {
                sQLiteStatement.mo153bindNull(90);
            } else {
                sQLiteStatement.mo154bindText(90, transactionVar.No);
            }
            if (transactionVar.Account_No == null) {
                sQLiteStatement.mo153bindNull(91);
            } else {
                sQLiteStatement.mo154bindText(91, transactionVar.Account_No);
            }
            if (transactionVar.transtype == null) {
                sQLiteStatement.mo153bindNull(92);
            } else {
                sQLiteStatement.mo154bindText(92, transactionVar.transtype);
            }
        }
    };

    public transaction_dao_Impl(final RoomDatabase __db) {
        this.__db = __db;
    }

    @Override // com.trimline.metrocrew.transaction.dao
    void insert(final transaction entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.transaction_dao_Impl$$ExternalSyntheticLambda3
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m460lambda$insert$0$comtrimlinemetrocrewtransaction_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$insert$0$com-trimline-metrocrew-transaction_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m460lambda$insert$0$comtrimlinemetrocrewtransaction_dao_Impl(transaction entity, SQLiteConnection _connection) throws Exception {
        this.__insertAdapterOftransaction.insert(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.transaction.dao
    void Insertall(final Iterable<transaction> t) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.transaction_dao_Impl$$ExternalSyntheticLambda2
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m458lambda$Insertall$1$comtrimlinemetrocrewtransaction_dao_Impl(t, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$Insertall$1$com-trimline-metrocrew-transaction_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m458lambda$Insertall$1$comtrimlinemetrocrewtransaction_dao_Impl(Iterable t, SQLiteConnection _connection) throws Exception {
        this.__insertAdapterOftransaction.insert(_connection, (Iterable<? extends transaction>) t);
        return null;
    }

    @Override // com.trimline.metrocrew.transaction.dao
    void delete(final transaction entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.transaction_dao_Impl$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m459lambda$delete$2$comtrimlinemetrocrewtransaction_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$delete$2$com-trimline-metrocrew-transaction_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m459lambda$delete$2$comtrimlinemetrocrewtransaction_dao_Impl(transaction entity, SQLiteConnection _connection) throws Exception {
        this.__deleteAdapterOftransaction.handle(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.transaction.dao
    void update(final transaction entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.transaction_dao_Impl$$ExternalSyntheticLambda5
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m461lambda$update$3$comtrimlinemetrocrewtransaction_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$update$3$com-trimline-metrocrew-transaction_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m461lambda$update$3$comtrimlinemetrocrewtransaction_dao_Impl(transaction entity, SQLiteConnection _connection) throws Exception {
        this.__updateAdapterOftransaction.handle(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.transaction.dao
    List<transaction> loadAll() {
        return (List) DBUtil.performBlocking(this.__db, true, false, new Function1() { // from class: com.trimline.metrocrew.transaction_dao_Impl$$ExternalSyntheticLambda4
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return transaction_dao_Impl.lambda$loadAll$4((SQLiteConnection) obj);
            }
        });
    }

    static /* synthetic */ List lambda$loadAll$4(SQLiteConnection _connection) {
        transaction _item;
        Long _tmp;
        Long _tmp_1;
        Boolean boolValueOf;
        Long _tmp_3;
        Long _tmp_4;
        Boolean boolValueOf2;
        Long _tmp_6;
        Boolean boolValueOf3;
        Boolean boolValueOf4;
        Boolean boolValueOf5;
        Boolean boolValueOf6;
        Boolean boolValueOf7;
        Boolean boolValueOf8;
        Long _tmp_13;
        Long _tmp_14;
        Boolean boolValueOf9;
        Boolean boolValueOf10;
        Long _tmp_17;
        Long _tmp_18;
        Boolean boolValueOf11;
        Long _tmp_20;
        SQLiteStatement _stmt = _connection.prepare("SELECT * FROM `transaction`");
        try {
            int _columnIndexOfKey = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Key");
            int _tmp_21 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Entry_No");
            int _columnIndexOfNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "No");
            int _columnIndexOfReversed = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Date");
            int _columnIndexOfReversalFromEntryNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Type");
            int _columnIndexOfTranstype = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "transtype");
            int _columnIndexOfPayMode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "PayMode");
            int _columnIndexOfPayMode_1 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Pay_Mode");
            int _columnIndexOfChequeDepositSlipNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Deposit_Slip_No");
            int _columnIndexOfChequeDepositSlipDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Deposit_Slip_Date");
            int _columnIndexOfBankCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Bank_Code");
            int _columnIndexOfReceivedFrom = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Received_From");
            int _columnIndexOfOnBehalfOf = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "On_Behalf_Of");
            int _columnIndexOfCashier = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cashier");
            int _columnIndexOfAccountNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Account_No");
            int _columnIndexOfCashier2 = _columnIndexOfAccountNo;
            int _columnIndexOfAccountNo2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Account_Name");
            int _columnIndexOfPosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Posted");
            int _columnIndexOfNo2 = _columnIndexOfPosted;
            int _columnIndexOfDatePosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Date_Posted");
            int _columnIndexOfDatePosted2 = _columnIndexOfDatePosted;
            int _columnIndexOfTimePosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Time_Posted");
            int _columnIndexOfTimePosted2 = _columnIndexOfTimePosted;
            int _columnIndexOfPostedBy = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Posted_By");
            int _columnIndexOfPosted2 = _columnIndexOfPostedBy;
            int _columnIndexOfAmount = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Amount");
            int _columnIndexOfPostedBy2 = _columnIndexOfAmount;
            int _columnIndexOfRemarks = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Remarks");
            int _columnIndexOfAmount2 = _columnIndexOfRemarks;
            int _columnIndexOfTransactionName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Transaction_Name");
            int _columnIndexOfRemarks2 = _columnIndexOfTransactionName;
            int _columnIndexOfBranchCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Branch_Code");
            int _columnIndexOfTransactionName2 = _columnIndexOfBranchCode;
            int _columnIndexOfAgentCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Agent_Code");
            int _columnIndexOfBranchCode2 = _columnIndexOfAgentCode;
            int _columnIndexOfGrouping = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Grouping");
            int _columnIndexOfAgentCode2 = _columnIndexOfGrouping;
            int _columnIndexOfGlobalDimension1Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Global_Dimension_1_Code");
            int _columnIndexOfGrouping2 = _columnIndexOfGlobalDimension1Code;
            int _columnIndexOfShortcutDimension2Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Shortcut_Dimension_2_Code");
            int _columnIndexOfGlobalDimension1Code2 = _columnIndexOfShortcutDimension2Code;
            int _columnIndexOfVATPercent = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "VAT_Percent");
            int _columnIndexOfShortcutDimension2Code2 = _columnIndexOfVATPercent;
            int _columnIndexOfCurrencyCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Currency_Code");
            int _columnIndexOfVATPercent2 = _columnIndexOfCurrencyCode;
            int _columnIndexOfCurrencyFactor = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Currency_Factor");
            int _columnIndexOfCurrencyCode2 = _columnIndexOfCurrencyFactor;
            int _columnIndexOfVATBusPostingGroup = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "VAT_Bus_Posting_Group");
            int _columnIndexOfCurrencyFactor2 = _columnIndexOfVATBusPostingGroup;
            int _columnIndexOfVATBusPostingGroup2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "VAT_Prod_Posting_Group");
            int _columnIndexOfGenPostingTypeSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Gen_Posting_TypeSpecified");
            int _columnIndexOfGenPostingTypeSpecified2 = _columnIndexOfGenPostingTypeSpecified;
            int _columnIndexOfGenBusPostingGroup = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Gen_Bus_Posting_Group");
            int _columnIndexOfGenPostingTypeSpecified3 = _columnIndexOfGenBusPostingGroup;
            int _columnIndexOfGenProdPostingGroup = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Gen_Prod_Posting_Group");
            int _columnIndexOfGenProdPostingGroup2 = _columnIndexOfGenProdPostingGroup;
            int _columnIndexOfVATAmount = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "VAT_Amount");
            int _columnIndexOfGenProdPostingGroup3 = _columnIndexOfVATAmount;
            int _columnIndexOfTotalAmount = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Total_Amount");
            int _columnIndexOfVATAmount2 = _columnIndexOfTotalAmount;
            int _columnIndexOfUserID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "User_ID");
            int _columnIndexOfTotalAmount2 = _columnIndexOfUserID;
            int _columnIndexOfApplyTo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Apply_to");
            int _columnIndexOfUserID2 = _columnIndexOfApplyTo;
            int _columnIndexOfApplyToID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Apply_to_ID");
            int _columnIndexOfApplyTo2 = _columnIndexOfApplyToID;
            int _columnIndexOfDestGlobalDimension1Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dest_Global_Dimension_1_Code");
            int _columnIndexOfApplyToID2 = _columnIndexOfDestGlobalDimension1Code;
            int _columnIndexOfDestGlobalDimension1Code2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dest_Shortcut_Dimension_2_Code");
            int _columnIndexOfLineNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Line_No");
            int _columnIndexOfGenBusPostingGroup2 = _columnIndexOfLineNo;
            int _columnIndexOfPrintNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Print_No");
            int _columnIndexOfDatePosted3 = _columnIndexOfPrintNo;
            int _columnIndexOfDepositSlipTime = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Deposit_Slip_Time");
            int _columnIndexOfLineNo2 = _columnIndexOfDepositSlipTime;
            int _columnIndexOfTellerID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Teller_ID");
            int _columnIndexOfPrintNo2 = _columnIndexOfTellerID;
            int _columnIndexOfCustomerPaymentOnAccount = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Customer_Payment_On_Account");
            int _columnIndexOfDepositSlipTime2 = _columnIndexOfCustomerPaymentOnAccount;
            int _columnIndexOfCustomerPaymentOnAccount2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Select");
            int _columnIndexOfBatchPosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Batch_Posted");
            int _columnIndexOfType = _columnIndexOfBatchPosted;
            int _columnIndexOfTellerID2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Transaction_No");
            int _columnIndexOfChequeDepositSlipBank = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Deposit_Slip_Bank");
            int _columnIndexOfChequeDepositSlipBank2 = _columnIndexOfChequeDepositSlipBank;
            int _columnIndexOfChequeDepositSlipBank3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Bank_Account");
            int _columnIndexOfConfirmed = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Confirmed");
            int _columnIndexOfBatchPosted2 = _columnIndexOfConfirmed;
            int _columnIndexOfReconciled = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reconciled");
            int _columnIndexOfReconciled2 = _columnIndexOfReconciled;
            int _columnIndexOfConfirmed2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Orig_Cashier");
            int _columnIndexOfCancelled = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cancelled");
            int _columnIndexOfCancelled2 = _columnIndexOfCancelled;
            int _columnIndexOfCancelled3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cancelled_By");
            int _columnIndexOfCancelledDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cancelled_Date");
            int _columnIndexOfCancelledDate2 = _columnIndexOfCancelledDate;
            int _columnIndexOfCancelledTime = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cancelled_Time");
            int _columnIndexOfCancelledTime2 = _columnIndexOfCancelledTime;
            int _columnIndexOfPostDated = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Post_Dated");
            int _columnIndexOfPostDated2 = _columnIndexOfPostDated;
            int _columnIndexOfChequeRetrieved = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Retrieved");
            int _columnIndexOfChequeRetrieved2 = _columnIndexOfChequeRetrieved;
            int _columnIndexOfRegisterNumber = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Register_Number");
            int _columnIndexOfRegisterNumber2 = _columnIndexOfRegisterNumber;
            int _columnIndexOfFromEntryNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "From_Entry_No");
            int _columnIndexOfFromEntryNo2 = _columnIndexOfFromEntryNo;
            int _columnIndexOfToEntryNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "To_Entry_No");
            int _columnIndexOfRegisterNumber3 = _columnIndexOfToEntryNo;
            int _columnIndexOfBatchPostedUserID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Batch_Posted_UserID");
            int _columnIndexOfFromEntryNo3 = _columnIndexOfBatchPostedUserID;
            int _columnIndexOfBDRegisterNumber = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "BD_Register_Number");
            int _columnIndexOfToEntryNo2 = _columnIndexOfBDRegisterNumber;
            int _columnIndexOfBDFromNumber = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "BD_From_Number");
            int _columnIndexOfBatchPostedUserID2 = _columnIndexOfBDFromNumber;
            int _columnIndexOfBDRegisterNumber2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "BD_To_Number");
            int _columnIndexOfReversalBy = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversal_By");
            int _columnIndexOfReversalBy2 = _columnIndexOfReversalBy;
            int _columnIndexOfReversalDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversal_Date");
            int _columnIndexOfPostDated3 = _columnIndexOfReversalDate;
            int _columnIndexOfReversalTime = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversal_Time");
            int _columnIndexOfReversalTime2 = _columnIndexOfReversalTime;
            int _columnIndexOfReversalRegisterNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversal_Register_No");
            int _columnIndexOfBDFromNumber2 = _columnIndexOfReversalRegisterNo;
            int _columnIndexOfReversalFromEntryNo2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversal_From_Entry_No");
            int _columnIndexOfReversalBy3 = _columnIndexOfReversalFromEntryNo2;
            int _columnIndexOfReversalToEntryNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversal_To_Entry_No");
            int _columnIndexOfReversalDate2 = _columnIndexOfReversalToEntryNo;
            int _columnIndexOfReversed2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversed");
            int _columnIndexOfReversalToEntryNo2 = _columnIndexOfReversed2;
            int _columnIndexOfAppliesToDocNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Applies_to_Doc_No");
            int _columnIndexOfReversalRegisterNo2 = _columnIndexOfAppliesToDocNo;
            int _columnIndexOfAppliesToID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Applies_to_ID");
            int _columnIndexOfAppliesToID2 = _columnIndexOfAppliesToID;
            int _columnIndexOfAppliesToID3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Grant_No");
            int _columnIndexOfInstallmentNumber = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Installment_Number");
            int _columnIndexOfAppliesToDocNo2 = _columnIndexOfInstallmentNumber;
            int _columnIndexOfNextInstallmentDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Next_Installment_Date");
            int _columnIndexOfInstallmentNumber2 = _columnIndexOfNextInstallmentDate;
            int _columnIndexOfDimensionSetID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dimension_Set_ID");
            int _columnIndexOfNextInstallmentDate2 = _columnIndexOfDimensionSetID;
            int _columnIndexOfDonor = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Donor");
            int _columnIndexOfDimensionSetID2 = _columnIndexOfDonor;
            int _columnIndexOfGroupCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Group_Code");
            int _columnIndexOfDonor2 = _columnIndexOfGroupCode;
            int _columnIndexOfPreADMFines = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Pre_ADM_Fines");
            int _columnIndexOfPreADMFines2 = _columnIndexOfPreADMFines;
            int _columnIndexOfMedFines = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Med_Fines");
            int _columnIndexOfMedFines2 = _columnIndexOfMedFines;
            int _columnIndexOfLoanNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Loan_No");
            int _columnIndexOfLoanNo2 = _columnIndexOfLoanNo;
            int _columnIndexOfGroupCode2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Penalty");
            int _columnIndexOfSent = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "sent");
            List<transaction> _result = new ArrayList<>();
            while (_stmt.step()) {
                transaction _item2 = new transaction();
                int _columnIndexOfSent2 = _columnIndexOfSent;
                if (_stmt.isNull(_columnIndexOfKey)) {
                    _item = _item2;
                    _item.Key = null;
                } else {
                    _item = _item2;
                    _item.Key = _stmt.getText(_columnIndexOfKey);
                }
                int _columnIndexOfReceivedFrom2 = _columnIndexOfReceivedFrom;
                int _columnIndexOfOnBehalfOf2 = _columnIndexOfOnBehalfOf;
                _item.Entry_No = (int) _stmt.getLong(_tmp_21);
                if (_stmt.isNull(_columnIndexOfNo)) {
                    _item.No = null;
                } else {
                    _item.No = _stmt.getText(_columnIndexOfNo);
                }
                if (_stmt.isNull(_columnIndexOfReversed)) {
                    _tmp = null;
                } else {
                    _tmp = Long.valueOf(_stmt.getLong(_columnIndexOfReversed));
                }
                _item.Date = Converters.DateConverter.toDate(_tmp);
                if (_stmt.isNull(_columnIndexOfReversalFromEntryNo)) {
                    _item.Type = null;
                } else {
                    _item.Type = _stmt.getText(_columnIndexOfReversalFromEntryNo);
                }
                if (_stmt.isNull(_columnIndexOfTranstype)) {
                    _item.transtype = null;
                } else {
                    _item.transtype = _stmt.getText(_columnIndexOfTranstype);
                }
                if (_stmt.isNull(_columnIndexOfPayMode)) {
                    _item.PayMode = null;
                } else {
                    _item.PayMode = _stmt.getText(_columnIndexOfPayMode);
                }
                if (_stmt.isNull(_columnIndexOfPayMode_1)) {
                    _item.Pay_Mode = null;
                } else {
                    _item.Pay_Mode = _stmt.getText(_columnIndexOfPayMode_1);
                }
                if (_stmt.isNull(_columnIndexOfChequeDepositSlipNo)) {
                    _item.Cheque_Deposit_Slip_No = null;
                } else {
                    _item.Cheque_Deposit_Slip_No = _stmt.getText(_columnIndexOfChequeDepositSlipNo);
                }
                if (_stmt.isNull(_columnIndexOfChequeDepositSlipDate)) {
                    _tmp_1 = null;
                } else {
                    _tmp_1 = Long.valueOf(_stmt.getLong(_columnIndexOfChequeDepositSlipDate));
                }
                _item.Cheque_Deposit_Slip_Date = Converters.DateConverter.toDate(_tmp_1);
                if (_stmt.isNull(_columnIndexOfBankCode)) {
                    _item.Bank_Code = null;
                } else {
                    _item.Bank_Code = _stmt.getText(_columnIndexOfBankCode);
                }
                if (_stmt.isNull(_columnIndexOfReceivedFrom2)) {
                    _item.Received_From = null;
                } else {
                    _item.Received_From = _stmt.getText(_columnIndexOfReceivedFrom2);
                }
                if (_stmt.isNull(_columnIndexOfOnBehalfOf2)) {
                    _item.On_Behalf_Of = null;
                } else {
                    _item.On_Behalf_Of = _stmt.getText(_columnIndexOfOnBehalfOf2);
                }
                int _columnIndexOfCashier3 = _columnIndexOfCashier;
                if (_stmt.isNull(_columnIndexOfCashier3)) {
                    _item.Cashier = null;
                } else {
                    _item.Cashier = _stmt.getText(_columnIndexOfCashier3);
                }
                int _columnIndexOfAccountNo3 = _columnIndexOfCashier2;
                if (_stmt.isNull(_columnIndexOfAccountNo3)) {
                    _item.Account_No = null;
                } else {
                    _item.Account_No = _stmt.getText(_columnIndexOfAccountNo3);
                }
                int _columnIndexOfAccountName = _columnIndexOfAccountNo2;
                if (_stmt.isNull(_columnIndexOfAccountName)) {
                    _item.Account_Name = null;
                } else {
                    _item.Account_Name = _stmt.getText(_columnIndexOfAccountName);
                }
                int _columnIndexOfPosted3 = _columnIndexOfNo2;
                Integer _tmp_2 = _stmt.isNull(_columnIndexOfPosted3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfPosted3));
                if (_tmp_2 == null) {
                    boolValueOf = null;
                } else {
                    boolValueOf = Boolean.valueOf(_tmp_2.intValue() != 0);
                }
                _item.Posted = boolValueOf;
                int _columnIndexOfDatePosted4 = _columnIndexOfDatePosted2;
                if (_stmt.isNull(_columnIndexOfDatePosted4)) {
                    _tmp_3 = null;
                } else {
                    _tmp_3 = Long.valueOf(_stmt.getLong(_columnIndexOfDatePosted4));
                }
                _item.Date_Posted = Converters.DateConverter.toDate(_tmp_3);
                int _columnIndexOfTimePosted3 = _columnIndexOfTimePosted2;
                if (_stmt.isNull(_columnIndexOfTimePosted3)) {
                    _tmp_4 = null;
                } else {
                    _tmp_4 = Long.valueOf(_stmt.getLong(_columnIndexOfTimePosted3));
                }
                _item.Time_Posted = Converters.DateConverter.toDate(_tmp_4);
                int _columnIndexOfPostedBy3 = _columnIndexOfPosted2;
                if (_stmt.isNull(_columnIndexOfPostedBy3)) {
                    _item.Posted_By = null;
                } else {
                    _item.Posted_By = _stmt.getText(_columnIndexOfPostedBy3);
                }
                int _columnIndexOfAmount3 = _columnIndexOfPostedBy2;
                if (_stmt.isNull(_columnIndexOfAmount3)) {
                    _item.Amount = null;
                } else {
                    _item.Amount = Double.valueOf(_stmt.getDouble(_columnIndexOfAmount3));
                }
                int _columnIndexOfRemarks3 = _columnIndexOfAmount2;
                if (_stmt.isNull(_columnIndexOfRemarks3)) {
                    _item.Remarks = null;
                } else {
                    _item.Remarks = _stmt.getText(_columnIndexOfRemarks3);
                }
                int _columnIndexOfTransactionName3 = _columnIndexOfRemarks2;
                if (_stmt.isNull(_columnIndexOfTransactionName3)) {
                    _item.Transaction_Name = null;
                } else {
                    _item.Transaction_Name = _stmt.getText(_columnIndexOfTransactionName3);
                }
                int _columnIndexOfBranchCode3 = _columnIndexOfTransactionName2;
                if (_stmt.isNull(_columnIndexOfBranchCode3)) {
                    _item.Branch_Code = null;
                } else {
                    _item.Branch_Code = _stmt.getText(_columnIndexOfBranchCode3);
                }
                int _columnIndexOfAgentCode3 = _columnIndexOfBranchCode2;
                if (_stmt.isNull(_columnIndexOfAgentCode3)) {
                    _item.Agent_Code = null;
                } else {
                    _item.Agent_Code = _stmt.getText(_columnIndexOfAgentCode3);
                }
                int _columnIndexOfGrouping3 = _columnIndexOfAgentCode2;
                if (_stmt.isNull(_columnIndexOfGrouping3)) {
                    _item.Grouping = null;
                } else {
                    _item.Grouping = _stmt.getText(_columnIndexOfGrouping3);
                }
                int _columnIndexOfGlobalDimension1Code3 = _columnIndexOfGrouping2;
                if (_stmt.isNull(_columnIndexOfGlobalDimension1Code3)) {
                    _item.Global_Dimension_1_Code = null;
                } else {
                    _item.Global_Dimension_1_Code = _stmt.getText(_columnIndexOfGlobalDimension1Code3);
                }
                int _columnIndexOfShortcutDimension2Code3 = _columnIndexOfGlobalDimension1Code2;
                if (_stmt.isNull(_columnIndexOfShortcutDimension2Code3)) {
                    _item.Shortcut_Dimension_2_Code = null;
                } else {
                    _item.Shortcut_Dimension_2_Code = _stmt.getText(_columnIndexOfShortcutDimension2Code3);
                }
                int _columnIndexOfVATPercent3 = _columnIndexOfShortcutDimension2Code2;
                if (_stmt.isNull(_columnIndexOfVATPercent3)) {
                    _item.VAT_Percent = null;
                } else {
                    _item.VAT_Percent = Double.valueOf(_stmt.getDouble(_columnIndexOfVATPercent3));
                }
                int _columnIndexOfCurrencyCode3 = _columnIndexOfVATPercent2;
                if (_stmt.isNull(_columnIndexOfCurrencyCode3)) {
                    _item.Currency_Code = null;
                } else {
                    _item.Currency_Code = _stmt.getText(_columnIndexOfCurrencyCode3);
                }
                int _columnIndexOfCurrencyFactor3 = _columnIndexOfCurrencyCode2;
                if (_stmt.isNull(_columnIndexOfCurrencyFactor3)) {
                    _item.Currency_Factor = null;
                } else {
                    _item.Currency_Factor = Double.valueOf(_stmt.getDouble(_columnIndexOfCurrencyFactor3));
                }
                int _columnIndexOfVATBusPostingGroup3 = _columnIndexOfCurrencyFactor2;
                if (_stmt.isNull(_columnIndexOfVATBusPostingGroup3)) {
                    _item.VAT_Bus_Posting_Group = null;
                } else {
                    _item.VAT_Bus_Posting_Group = _stmt.getText(_columnIndexOfVATBusPostingGroup3);
                }
                int _columnIndexOfVATProdPostingGroup = _columnIndexOfVATBusPostingGroup2;
                if (_stmt.isNull(_columnIndexOfVATProdPostingGroup)) {
                    _item.VAT_Prod_Posting_Group = null;
                } else {
                    _item.VAT_Prod_Posting_Group = _stmt.getText(_columnIndexOfVATProdPostingGroup);
                }
                int _columnIndexOfGenPostingTypeSpecified4 = _columnIndexOfGenPostingTypeSpecified2;
                Integer _tmp_5 = _stmt.isNull(_columnIndexOfGenPostingTypeSpecified4) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfGenPostingTypeSpecified4));
                if (_tmp_5 == null) {
                    boolValueOf2 = null;
                } else {
                    boolValueOf2 = Boolean.valueOf(_tmp_5.intValue() != 0);
                }
                _item.Gen_Posting_TypeSpecified = boolValueOf2;
                int _columnIndexOfGenBusPostingGroup3 = _columnIndexOfGenPostingTypeSpecified3;
                if (_stmt.isNull(_columnIndexOfGenBusPostingGroup3)) {
                    _item.Gen_Bus_Posting_Group = null;
                } else {
                    _item.Gen_Bus_Posting_Group = _stmt.getText(_columnIndexOfGenBusPostingGroup3);
                }
                int _columnIndexOfGenProdPostingGroup4 = _columnIndexOfGenProdPostingGroup2;
                if (_stmt.isNull(_columnIndexOfGenProdPostingGroup4)) {
                    _item.Gen_Prod_Posting_Group = null;
                } else {
                    _item.Gen_Prod_Posting_Group = _stmt.getText(_columnIndexOfGenProdPostingGroup4);
                }
                int _columnIndexOfVATAmount3 = _columnIndexOfGenProdPostingGroup3;
                if (_stmt.isNull(_columnIndexOfVATAmount3)) {
                    _item.VAT_Amount = null;
                } else {
                    _item.VAT_Amount = Double.valueOf(_stmt.getDouble(_columnIndexOfVATAmount3));
                }
                int _columnIndexOfTotalAmount3 = _columnIndexOfVATAmount2;
                if (_stmt.isNull(_columnIndexOfTotalAmount3)) {
                    _item.Total_Amount = null;
                } else {
                    _item.Total_Amount = Double.valueOf(_stmt.getDouble(_columnIndexOfTotalAmount3));
                }
                int _columnIndexOfUserID3 = _columnIndexOfTotalAmount2;
                if (_stmt.isNull(_columnIndexOfUserID3)) {
                    _item.User_ID = null;
                } else {
                    _item.User_ID = _stmt.getText(_columnIndexOfUserID3);
                }
                int _columnIndexOfApplyTo3 = _columnIndexOfUserID2;
                if (_stmt.isNull(_columnIndexOfApplyTo3)) {
                    _item.Apply_to = null;
                } else {
                    _item.Apply_to = _stmt.getText(_columnIndexOfApplyTo3);
                }
                int _columnIndexOfApplyToID3 = _columnIndexOfApplyTo2;
                if (_stmt.isNull(_columnIndexOfApplyToID3)) {
                    _item.Apply_to_ID = null;
                } else {
                    _item.Apply_to_ID = _stmt.getText(_columnIndexOfApplyToID3);
                }
                int _columnIndexOfDestGlobalDimension1Code3 = _columnIndexOfApplyToID2;
                if (_stmt.isNull(_columnIndexOfDestGlobalDimension1Code3)) {
                    _item.Dest_Global_Dimension_1_Code = null;
                } else {
                    _item.Dest_Global_Dimension_1_Code = _stmt.getText(_columnIndexOfDestGlobalDimension1Code3);
                }
                int _columnIndexOfDestShortcutDimension2Code = _columnIndexOfDestGlobalDimension1Code2;
                if (_stmt.isNull(_columnIndexOfDestShortcutDimension2Code)) {
                    _item.Dest_Shortcut_Dimension_2_Code = null;
                } else {
                    _item.Dest_Shortcut_Dimension_2_Code = _stmt.getText(_columnIndexOfDestShortcutDimension2Code);
                }
                int _columnIndexOfLineNo3 = _columnIndexOfGenBusPostingGroup2;
                _item.Line_No = (int) _stmt.getLong(_columnIndexOfLineNo3);
                int _columnIndexOfPrintNo3 = _columnIndexOfDatePosted3;
                _item.Print_No = (int) _stmt.getLong(_columnIndexOfPrintNo3);
                int _columnIndexOfDepositSlipTime3 = _columnIndexOfLineNo2;
                if (_stmt.isNull(_columnIndexOfDepositSlipTime3)) {
                    _tmp_6 = null;
                } else {
                    _tmp_6 = Long.valueOf(_stmt.getLong(_columnIndexOfDepositSlipTime3));
                }
                _item.Deposit_Slip_Time = Converters.DateConverter.toDate(_tmp_6);
                int _columnIndexOfTellerID3 = _columnIndexOfPrintNo2;
                if (_stmt.isNull(_columnIndexOfTellerID3)) {
                    _item.Teller_ID = null;
                } else {
                    _item.Teller_ID = _stmt.getText(_columnIndexOfTellerID3);
                }
                int _columnIndexOfCustomerPaymentOnAccount3 = _columnIndexOfDepositSlipTime2;
                Integer _tmp_7 = _stmt.isNull(_columnIndexOfCustomerPaymentOnAccount3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfCustomerPaymentOnAccount3));
                if (_tmp_7 == null) {
                    boolValueOf3 = null;
                } else {
                    boolValueOf3 = Boolean.valueOf(_tmp_7.intValue() != 0);
                }
                _item.Customer_Payment_On_Account = boolValueOf3;
                int _columnIndexOfSelect = _columnIndexOfCustomerPaymentOnAccount2;
                Integer _tmp_8 = _stmt.isNull(_columnIndexOfSelect) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfSelect));
                if (_tmp_8 == null) {
                    boolValueOf4 = null;
                } else {
                    boolValueOf4 = Boolean.valueOf(_tmp_8.intValue() != 0);
                }
                _item.Select = boolValueOf4;
                int _columnIndexOfBatchPosted3 = _columnIndexOfType;
                Integer _tmp_9 = _stmt.isNull(_columnIndexOfBatchPosted3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfBatchPosted3));
                if (_tmp_9 == null) {
                    boolValueOf5 = null;
                } else {
                    boolValueOf5 = Boolean.valueOf(_tmp_9.intValue() != 0);
                }
                _item.Batch_Posted = boolValueOf5;
                int _columnIndexOfTransactionNo = _columnIndexOfTellerID2;
                if (_stmt.isNull(_columnIndexOfTransactionNo)) {
                    _item.Transaction_No = null;
                } else {
                    _item.Transaction_No = _stmt.getText(_columnIndexOfTransactionNo);
                }
                int _columnIndexOfChequeDepositSlipBank4 = _columnIndexOfChequeDepositSlipBank2;
                if (_stmt.isNull(_columnIndexOfChequeDepositSlipBank4)) {
                    _item.Cheque_Deposit_Slip_Bank = null;
                } else {
                    _item.Cheque_Deposit_Slip_Bank = _stmt.getText(_columnIndexOfChequeDepositSlipBank4);
                }
                int _columnIndexOfBankAccount = _columnIndexOfChequeDepositSlipBank3;
                if (_stmt.isNull(_columnIndexOfBankAccount)) {
                    _item.Bank_Account = null;
                } else {
                    _item.Bank_Account = _stmt.getText(_columnIndexOfBankAccount);
                }
                int _columnIndexOfConfirmed3 = _columnIndexOfBatchPosted2;
                Integer _tmp_10 = _stmt.isNull(_columnIndexOfConfirmed3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfConfirmed3));
                if (_tmp_10 == null) {
                    boolValueOf6 = null;
                } else {
                    boolValueOf6 = Boolean.valueOf(_tmp_10.intValue() != 0);
                }
                _item.Confirmed = boolValueOf6;
                int _columnIndexOfReconciled3 = _columnIndexOfReconciled2;
                Integer _tmp_11 = _stmt.isNull(_columnIndexOfReconciled3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfReconciled3));
                if (_tmp_11 == null) {
                    boolValueOf7 = null;
                } else {
                    boolValueOf7 = Boolean.valueOf(_tmp_11.intValue() != 0);
                }
                _item.Reconciled = boolValueOf7;
                int _columnIndexOfOrigCashier = _columnIndexOfConfirmed2;
                if (_stmt.isNull(_columnIndexOfOrigCashier)) {
                    _item.Orig_Cashier = null;
                } else {
                    _item.Orig_Cashier = _stmt.getText(_columnIndexOfOrigCashier);
                }
                int _columnIndexOfCancelled4 = _columnIndexOfCancelled2;
                Integer _tmp_12 = _stmt.isNull(_columnIndexOfCancelled4) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfCancelled4));
                if (_tmp_12 == null) {
                    boolValueOf8 = null;
                } else {
                    boolValueOf8 = Boolean.valueOf(_tmp_12.intValue() != 0);
                }
                _item.Cancelled = boolValueOf8;
                int _columnIndexOfCancelledBy = _columnIndexOfCancelled3;
                if (_stmt.isNull(_columnIndexOfCancelledBy)) {
                    _item.Cancelled_By = null;
                } else {
                    _item.Cancelled_By = _stmt.getText(_columnIndexOfCancelledBy);
                }
                int _columnIndexOfCancelledDate3 = _columnIndexOfCancelledDate2;
                if (_stmt.isNull(_columnIndexOfCancelledDate3)) {
                    _tmp_13 = null;
                } else {
                    _tmp_13 = Long.valueOf(_stmt.getLong(_columnIndexOfCancelledDate3));
                }
                _item.Cancelled_Date = Converters.DateConverter.toDate(_tmp_13);
                int _columnIndexOfCancelledTime3 = _columnIndexOfCancelledTime2;
                if (_stmt.isNull(_columnIndexOfCancelledTime3)) {
                    _tmp_14 = null;
                } else {
                    _tmp_14 = Long.valueOf(_stmt.getLong(_columnIndexOfCancelledTime3));
                }
                _item.Cancelled_Time = Converters.DateConverter.toDate(_tmp_14);
                int _columnIndexOfPostDated4 = _columnIndexOfPostDated2;
                Integer _tmp_15 = _stmt.isNull(_columnIndexOfPostDated4) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfPostDated4));
                if (_tmp_15 == null) {
                    boolValueOf9 = null;
                } else {
                    boolValueOf9 = Boolean.valueOf(_tmp_15.intValue() != 0);
                }
                _item.Post_Dated = boolValueOf9;
                int _columnIndexOfChequeRetrieved3 = _columnIndexOfChequeRetrieved2;
                Integer _tmp_16 = _stmt.isNull(_columnIndexOfChequeRetrieved3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfChequeRetrieved3));
                if (_tmp_16 == null) {
                    boolValueOf10 = null;
                } else {
                    boolValueOf10 = Boolean.valueOf(_tmp_16.intValue() != 0);
                }
                _item.Cheque_Retrieved = boolValueOf10;
                int _columnIndexOfRegisterNumber4 = _columnIndexOfRegisterNumber2;
                _item.Register_Number = (int) _stmt.getLong(_columnIndexOfRegisterNumber4);
                int _columnIndexOfFromEntryNo4 = _columnIndexOfFromEntryNo2;
                _item.From_Entry_No = (int) _stmt.getLong(_columnIndexOfFromEntryNo4);
                int _columnIndexOfToEntryNo3 = _columnIndexOfRegisterNumber3;
                _item.To_Entry_No = (int) _stmt.getLong(_columnIndexOfToEntryNo3);
                int _columnIndexOfBatchPostedUserID3 = _columnIndexOfFromEntryNo3;
                if (_stmt.isNull(_columnIndexOfBatchPostedUserID3)) {
                    _item.Batch_Posted_UserID = null;
                } else {
                    _item.Batch_Posted_UserID = _stmt.getText(_columnIndexOfBatchPostedUserID3);
                }
                int _columnIndexOfBDRegisterNumber3 = _columnIndexOfToEntryNo2;
                _item.BD_Register_Number = (int) _stmt.getLong(_columnIndexOfBDRegisterNumber3);
                int _columnIndexOfBDFromNumber3 = _columnIndexOfBatchPostedUserID2;
                _item.BD_From_Number = (int) _stmt.getLong(_columnIndexOfBDFromNumber3);
                int _columnIndexOfBDToNumber = _columnIndexOfBDRegisterNumber2;
                _item.BD_To_Number = (int) _stmt.getLong(_columnIndexOfBDToNumber);
                int _columnIndexOfReversalBy4 = _columnIndexOfReversalBy2;
                if (_stmt.isNull(_columnIndexOfReversalBy4)) {
                    _item.Reversal_By = null;
                } else {
                    _item.Reversal_By = _stmt.getText(_columnIndexOfReversalBy4);
                }
                int _columnIndexOfReversalDate3 = _columnIndexOfPostDated3;
                if (_stmt.isNull(_columnIndexOfReversalDate3)) {
                    _tmp_17 = null;
                } else {
                    _tmp_17 = Long.valueOf(_stmt.getLong(_columnIndexOfReversalDate3));
                }
                _item.Reversal_Date = Converters.DateConverter.toDate(_tmp_17);
                int _columnIndexOfReversalTime3 = _columnIndexOfReversalTime2;
                if (_stmt.isNull(_columnIndexOfReversalTime3)) {
                    _tmp_18 = null;
                } else {
                    _tmp_18 = Long.valueOf(_stmt.getLong(_columnIndexOfReversalTime3));
                }
                _item.Reversal_Time = Converters.DateConverter.toDate(_tmp_18);
                int _columnIndexOfReversalRegisterNo3 = _columnIndexOfBDFromNumber2;
                _item.Reversal_Register_No = (int) _stmt.getLong(_columnIndexOfReversalRegisterNo3);
                int _columnIndexOfReversalFromEntryNo3 = _columnIndexOfReversalBy3;
                _item.Reversal_From_Entry_No = (int) _stmt.getLong(_columnIndexOfReversalFromEntryNo3);
                int _columnIndexOfReversalToEntryNo3 = _columnIndexOfReversalDate2;
                _item.Reversal_To_Entry_No = (int) _stmt.getLong(_columnIndexOfReversalToEntryNo3);
                int _columnIndexOfReversed3 = _columnIndexOfReversalToEntryNo2;
                Integer _tmp_19 = _stmt.isNull(_columnIndexOfReversed3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfReversed3));
                if (_tmp_19 == null) {
                    boolValueOf11 = null;
                } else {
                    boolValueOf11 = Boolean.valueOf(_tmp_19.intValue() != 0);
                }
                _item.Reversed = boolValueOf11;
                int _columnIndexOfAppliesToDocNo3 = _columnIndexOfReversalRegisterNo2;
                if (_stmt.isNull(_columnIndexOfAppliesToDocNo3)) {
                    _item.Applies_to_Doc_No = null;
                } else {
                    _item.Applies_to_Doc_No = _stmt.getText(_columnIndexOfAppliesToDocNo3);
                }
                int _columnIndexOfAppliesToID4 = _columnIndexOfAppliesToID2;
                if (_stmt.isNull(_columnIndexOfAppliesToID4)) {
                    _item.Applies_to_ID = null;
                } else {
                    _item.Applies_to_ID = _stmt.getText(_columnIndexOfAppliesToID4);
                }
                int _columnIndexOfGrantNo = _columnIndexOfAppliesToID3;
                if (_stmt.isNull(_columnIndexOfGrantNo)) {
                    _item.Grant_No = null;
                } else {
                    _item.Grant_No = _stmt.getText(_columnIndexOfGrantNo);
                }
                int _columnIndexOfInstallmentNumber3 = _columnIndexOfAppliesToDocNo2;
                _item.Installment_Number = (int) _stmt.getLong(_columnIndexOfInstallmentNumber3);
                int _columnIndexOfNextInstallmentDate3 = _columnIndexOfInstallmentNumber2;
                if (_stmt.isNull(_columnIndexOfNextInstallmentDate3)) {
                    _tmp_20 = null;
                } else {
                    _tmp_20 = Long.valueOf(_stmt.getLong(_columnIndexOfNextInstallmentDate3));
                }
                _item.Next_Installment_Date = Converters.DateConverter.toDate(_tmp_20);
                int _columnIndexOfDimensionSetID3 = _columnIndexOfNextInstallmentDate2;
                _item.Dimension_Set_ID = (int) _stmt.getLong(_columnIndexOfDimensionSetID3);
                int _columnIndexOfDonor3 = _columnIndexOfDimensionSetID2;
                if (_stmt.isNull(_columnIndexOfDonor3)) {
                    _item.Donor = null;
                } else {
                    _item.Donor = _stmt.getText(_columnIndexOfDonor3);
                }
                int _columnIndexOfGroupCode3 = _columnIndexOfDonor2;
                if (_stmt.isNull(_columnIndexOfGroupCode3)) {
                    _item.Group_Code = null;
                } else {
                    _item.Group_Code = _stmt.getText(_columnIndexOfGroupCode3);
                }
                _columnIndexOfPreADMFines2 = _columnIndexOfPreADMFines2;
                if (_stmt.isNull(_columnIndexOfPreADMFines2)) {
                    _item.Pre_ADM_Fines = null;
                } else {
                    _item.Pre_ADM_Fines = Double.valueOf(_stmt.getDouble(_columnIndexOfPreADMFines2));
                }
                _columnIndexOfMedFines2 = _columnIndexOfMedFines2;
                if (_stmt.isNull(_columnIndexOfMedFines2)) {
                    _item.Med_Fines = null;
                } else {
                    _item.Med_Fines = Double.valueOf(_stmt.getDouble(_columnIndexOfMedFines2));
                }
                _columnIndexOfLoanNo2 = _columnIndexOfLoanNo2;
                if (_stmt.isNull(_columnIndexOfLoanNo2)) {
                    _item.Loan_No = null;
                } else {
                    _item.Loan_No = _stmt.getText(_columnIndexOfLoanNo2);
                }
                int _columnIndexOfPenalty = _columnIndexOfGroupCode2;
                if (_stmt.isNull(_columnIndexOfPenalty)) {
                    _item.Penalty = null;
                } else {
                    _item.Penalty = Double.valueOf(_stmt.getDouble(_columnIndexOfPenalty));
                }
                _columnIndexOfSent = _columnIndexOfSent2;
                int _tmp_22 = (int) _stmt.getLong(_columnIndexOfSent);
                _item.sent = _tmp_22 != 0;
                List<transaction> _result2 = _result;
                _result2.add(_item);
                _result = _result2;
                _columnIndexOfCashier = _columnIndexOfCashier3;
                _columnIndexOfCashier2 = _columnIndexOfAccountNo3;
                _columnIndexOfNo = _columnIndexOfNo;
                _columnIndexOfNo2 = _columnIndexOfPosted3;
                _columnIndexOfPosted2 = _columnIndexOfPostedBy3;
                _columnIndexOfPostedBy2 = _columnIndexOfAmount3;
                _columnIndexOfAmount2 = _columnIndexOfRemarks3;
                _columnIndexOfRemarks2 = _columnIndexOfTransactionName3;
                _columnIndexOfTransactionName2 = _columnIndexOfBranchCode3;
                _columnIndexOfBranchCode2 = _columnIndexOfAgentCode3;
                _columnIndexOfAgentCode2 = _columnIndexOfGrouping3;
                _columnIndexOfGrouping2 = _columnIndexOfGlobalDimension1Code3;
                _columnIndexOfGlobalDimension1Code2 = _columnIndexOfShortcutDimension2Code3;
                _columnIndexOfShortcutDimension2Code2 = _columnIndexOfVATPercent3;
                _columnIndexOfVATPercent2 = _columnIndexOfCurrencyCode3;
                _columnIndexOfCurrencyCode2 = _columnIndexOfCurrencyFactor3;
                _columnIndexOfCurrencyFactor2 = _columnIndexOfVATBusPostingGroup3;
                _columnIndexOfGenPostingTypeSpecified2 = _columnIndexOfGenPostingTypeSpecified4;
                _columnIndexOfGenProdPostingGroup2 = _columnIndexOfGenProdPostingGroup4;
                _columnIndexOfGenProdPostingGroup3 = _columnIndexOfVATAmount3;
                _columnIndexOfVATAmount2 = _columnIndexOfTotalAmount3;
                _columnIndexOfTotalAmount2 = _columnIndexOfUserID3;
                _columnIndexOfUserID2 = _columnIndexOfApplyTo3;
                _columnIndexOfApplyTo2 = _columnIndexOfApplyToID3;
                _columnIndexOfApplyToID2 = _columnIndexOfDestGlobalDimension1Code3;
                _columnIndexOfGenPostingTypeSpecified3 = _columnIndexOfGenBusPostingGroup3;
                _columnIndexOfDatePosted2 = _columnIndexOfDatePosted4;
                _columnIndexOfGenBusPostingGroup2 = _columnIndexOfLineNo3;
                _columnIndexOfDatePosted3 = _columnIndexOfPrintNo3;
                _columnIndexOfLineNo2 = _columnIndexOfDepositSlipTime3;
                _columnIndexOfDepositSlipTime2 = _columnIndexOfCustomerPaymentOnAccount3;
                _columnIndexOfPrintNo2 = _columnIndexOfTellerID3;
                _columnIndexOfChequeDepositSlipBank2 = _columnIndexOfChequeDepositSlipBank4;
                _columnIndexOfCancelled2 = _columnIndexOfCancelled4;
                _columnIndexOfRegisterNumber2 = _columnIndexOfRegisterNumber4;
                _columnIndexOfFromEntryNo2 = _columnIndexOfFromEntryNo4;
                _columnIndexOfRegisterNumber3 = _columnIndexOfToEntryNo3;
                _columnIndexOfFromEntryNo3 = _columnIndexOfBatchPostedUserID3;
                _columnIndexOfToEntryNo2 = _columnIndexOfBDRegisterNumber3;
                _columnIndexOfPostDated2 = _columnIndexOfPostDated4;
                _columnIndexOfBatchPostedUserID2 = _columnIndexOfBDFromNumber3;
                _columnIndexOfReversalBy2 = _columnIndexOfReversalBy4;
                _columnIndexOfPostDated3 = _columnIndexOfReversalDate3;
                _columnIndexOfReversalDate2 = _columnIndexOfReversalToEntryNo3;
                _columnIndexOfBDFromNumber2 = _columnIndexOfReversalRegisterNo3;
                _columnIndexOfAppliesToID2 = _columnIndexOfAppliesToID4;
                _columnIndexOfReversalRegisterNo2 = _columnIndexOfAppliesToDocNo3;
                _columnIndexOfAppliesToDocNo2 = _columnIndexOfInstallmentNumber3;
                _columnIndexOfInstallmentNumber2 = _columnIndexOfNextInstallmentDate3;
                _columnIndexOfNextInstallmentDate2 = _columnIndexOfDimensionSetID3;
                _columnIndexOfDimensionSetID2 = _columnIndexOfDonor3;
                _columnIndexOfDonor2 = _columnIndexOfGroupCode3;
                _columnIndexOfOnBehalfOf = _columnIndexOfOnBehalfOf2;
                _columnIndexOfGroupCode2 = _columnIndexOfPenalty;
                _columnIndexOfReceivedFrom = _columnIndexOfReceivedFrom2;
                _tmp_21 = _tmp_21;
                _columnIndexOfAccountNo2 = _columnIndexOfAccountName;
                _columnIndexOfTimePosted2 = _columnIndexOfTimePosted3;
                _columnIndexOfVATBusPostingGroup2 = _columnIndexOfVATProdPostingGroup;
                _columnIndexOfDestGlobalDimension1Code2 = _columnIndexOfDestShortcutDimension2Code;
                _columnIndexOfCustomerPaymentOnAccount2 = _columnIndexOfSelect;
                _columnIndexOfChequeDepositSlipBank3 = _columnIndexOfBankAccount;
                _columnIndexOfTellerID2 = _columnIndexOfTransactionNo;
                _columnIndexOfReconciled2 = _columnIndexOfReconciled3;
                _columnIndexOfCancelledDate2 = _columnIndexOfCancelledDate3;
                _columnIndexOfCancelledTime2 = _columnIndexOfCancelledTime3;
                _columnIndexOfCancelled3 = _columnIndexOfCancelledBy;
                _columnIndexOfChequeRetrieved2 = _columnIndexOfChequeRetrieved3;
                _columnIndexOfReversalTime2 = _columnIndexOfReversalTime3;
                _columnIndexOfBDRegisterNumber2 = _columnIndexOfBDToNumber;
                _columnIndexOfAppliesToID3 = _columnIndexOfGrantNo;
                _columnIndexOfReversalToEntryNo2 = _columnIndexOfReversed3;
                _columnIndexOfReversalBy3 = _columnIndexOfReversalFromEntryNo3;
                _columnIndexOfReversalFromEntryNo = _columnIndexOfReversalFromEntryNo;
                _columnIndexOfType = _columnIndexOfBatchPosted3;
                _columnIndexOfBatchPosted2 = _columnIndexOfConfirmed3;
                _columnIndexOfReversed = _columnIndexOfReversed;
                _columnIndexOfConfirmed2 = _columnIndexOfOrigCashier;
            }
            return _result;
        } finally {
            _stmt.close();
        }
    }

    @Override // com.trimline.metrocrew.transaction.dao
    List<transaction> loadunsent() {
        return (List) DBUtil.performBlocking(this.__db, true, false, new Function1() { // from class: com.trimline.metrocrew.transaction_dao_Impl$$ExternalSyntheticLambda6
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return transaction_dao_Impl.lambda$loadunsent$5((SQLiteConnection) obj);
            }
        });
    }

    static /* synthetic */ List lambda$loadunsent$5(SQLiteConnection _connection) {
        transaction _item;
        Long _tmp;
        Long _tmp_1;
        Boolean boolValueOf;
        Long _tmp_3;
        Long _tmp_4;
        Boolean boolValueOf2;
        Long _tmp_6;
        Boolean boolValueOf3;
        Boolean boolValueOf4;
        Boolean boolValueOf5;
        Boolean boolValueOf6;
        Boolean boolValueOf7;
        Boolean boolValueOf8;
        Long _tmp_13;
        Long _tmp_14;
        Boolean boolValueOf9;
        Boolean boolValueOf10;
        Long _tmp_17;
        Long _tmp_18;
        Boolean boolValueOf11;
        Long _tmp_20;
        SQLiteStatement _stmt = _connection.prepare("SELECT * FROM `transaction` where sent =0");
        try {
            int _columnIndexOfKey = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Key");
            int _tmp_21 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Entry_No");
            int _columnIndexOfNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "No");
            int _columnIndexOfReversed = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Date");
            int _columnIndexOfReversalFromEntryNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Type");
            int _columnIndexOfTranstype = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "transtype");
            int _columnIndexOfPayMode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "PayMode");
            int _columnIndexOfPayMode_1 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Pay_Mode");
            int _columnIndexOfChequeDepositSlipNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Deposit_Slip_No");
            int _columnIndexOfChequeDepositSlipDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Deposit_Slip_Date");
            int _columnIndexOfBankCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Bank_Code");
            int _columnIndexOfReceivedFrom = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Received_From");
            int _columnIndexOfOnBehalfOf = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "On_Behalf_Of");
            int _columnIndexOfCashier = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cashier");
            int _columnIndexOfAccountNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Account_No");
            int _columnIndexOfCashier2 = _columnIndexOfAccountNo;
            int _columnIndexOfAccountNo2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Account_Name");
            int _columnIndexOfPosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Posted");
            int _columnIndexOfNo2 = _columnIndexOfPosted;
            int _columnIndexOfDatePosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Date_Posted");
            int _columnIndexOfDatePosted2 = _columnIndexOfDatePosted;
            int _columnIndexOfTimePosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Time_Posted");
            int _columnIndexOfTimePosted2 = _columnIndexOfTimePosted;
            int _columnIndexOfPostedBy = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Posted_By");
            int _columnIndexOfPosted2 = _columnIndexOfPostedBy;
            int _columnIndexOfAmount = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Amount");
            int _columnIndexOfPostedBy2 = _columnIndexOfAmount;
            int _columnIndexOfRemarks = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Remarks");
            int _columnIndexOfAmount2 = _columnIndexOfRemarks;
            int _columnIndexOfTransactionName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Transaction_Name");
            int _columnIndexOfRemarks2 = _columnIndexOfTransactionName;
            int _columnIndexOfBranchCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Branch_Code");
            int _columnIndexOfTransactionName2 = _columnIndexOfBranchCode;
            int _columnIndexOfAgentCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Agent_Code");
            int _columnIndexOfBranchCode2 = _columnIndexOfAgentCode;
            int _columnIndexOfGrouping = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Grouping");
            int _columnIndexOfAgentCode2 = _columnIndexOfGrouping;
            int _columnIndexOfGlobalDimension1Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Global_Dimension_1_Code");
            int _columnIndexOfGrouping2 = _columnIndexOfGlobalDimension1Code;
            int _columnIndexOfShortcutDimension2Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Shortcut_Dimension_2_Code");
            int _columnIndexOfGlobalDimension1Code2 = _columnIndexOfShortcutDimension2Code;
            int _columnIndexOfVATPercent = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "VAT_Percent");
            int _columnIndexOfShortcutDimension2Code2 = _columnIndexOfVATPercent;
            int _columnIndexOfCurrencyCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Currency_Code");
            int _columnIndexOfVATPercent2 = _columnIndexOfCurrencyCode;
            int _columnIndexOfCurrencyFactor = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Currency_Factor");
            int _columnIndexOfCurrencyCode2 = _columnIndexOfCurrencyFactor;
            int _columnIndexOfVATBusPostingGroup = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "VAT_Bus_Posting_Group");
            int _columnIndexOfCurrencyFactor2 = _columnIndexOfVATBusPostingGroup;
            int _columnIndexOfVATBusPostingGroup2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "VAT_Prod_Posting_Group");
            int _columnIndexOfGenPostingTypeSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Gen_Posting_TypeSpecified");
            int _columnIndexOfGenPostingTypeSpecified2 = _columnIndexOfGenPostingTypeSpecified;
            int _columnIndexOfGenBusPostingGroup = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Gen_Bus_Posting_Group");
            int _columnIndexOfGenPostingTypeSpecified3 = _columnIndexOfGenBusPostingGroup;
            int _columnIndexOfGenProdPostingGroup = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Gen_Prod_Posting_Group");
            int _columnIndexOfGenProdPostingGroup2 = _columnIndexOfGenProdPostingGroup;
            int _columnIndexOfVATAmount = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "VAT_Amount");
            int _columnIndexOfGenProdPostingGroup3 = _columnIndexOfVATAmount;
            int _columnIndexOfTotalAmount = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Total_Amount");
            int _columnIndexOfVATAmount2 = _columnIndexOfTotalAmount;
            int _columnIndexOfUserID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "User_ID");
            int _columnIndexOfTotalAmount2 = _columnIndexOfUserID;
            int _columnIndexOfApplyTo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Apply_to");
            int _columnIndexOfUserID2 = _columnIndexOfApplyTo;
            int _columnIndexOfApplyToID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Apply_to_ID");
            int _columnIndexOfApplyTo2 = _columnIndexOfApplyToID;
            int _columnIndexOfDestGlobalDimension1Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dest_Global_Dimension_1_Code");
            int _columnIndexOfApplyToID2 = _columnIndexOfDestGlobalDimension1Code;
            int _columnIndexOfDestGlobalDimension1Code2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dest_Shortcut_Dimension_2_Code");
            int _columnIndexOfLineNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Line_No");
            int _columnIndexOfGenBusPostingGroup2 = _columnIndexOfLineNo;
            int _columnIndexOfPrintNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Print_No");
            int _columnIndexOfDatePosted3 = _columnIndexOfPrintNo;
            int _columnIndexOfDepositSlipTime = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Deposit_Slip_Time");
            int _columnIndexOfLineNo2 = _columnIndexOfDepositSlipTime;
            int _columnIndexOfTellerID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Teller_ID");
            int _columnIndexOfPrintNo2 = _columnIndexOfTellerID;
            int _columnIndexOfCustomerPaymentOnAccount = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Customer_Payment_On_Account");
            int _columnIndexOfDepositSlipTime2 = _columnIndexOfCustomerPaymentOnAccount;
            int _columnIndexOfCustomerPaymentOnAccount2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Select");
            int _columnIndexOfBatchPosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Batch_Posted");
            int _columnIndexOfType = _columnIndexOfBatchPosted;
            int _columnIndexOfTellerID2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Transaction_No");
            int _columnIndexOfChequeDepositSlipBank = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Deposit_Slip_Bank");
            int _columnIndexOfChequeDepositSlipBank2 = _columnIndexOfChequeDepositSlipBank;
            int _columnIndexOfChequeDepositSlipBank3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Bank_Account");
            int _columnIndexOfConfirmed = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Confirmed");
            int _columnIndexOfBatchPosted2 = _columnIndexOfConfirmed;
            int _columnIndexOfReconciled = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reconciled");
            int _columnIndexOfReconciled2 = _columnIndexOfReconciled;
            int _columnIndexOfConfirmed2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Orig_Cashier");
            int _columnIndexOfCancelled = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cancelled");
            int _columnIndexOfCancelled2 = _columnIndexOfCancelled;
            int _columnIndexOfCancelled3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cancelled_By");
            int _columnIndexOfCancelledDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cancelled_Date");
            int _columnIndexOfCancelledDate2 = _columnIndexOfCancelledDate;
            int _columnIndexOfCancelledTime = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cancelled_Time");
            int _columnIndexOfCancelledTime2 = _columnIndexOfCancelledTime;
            int _columnIndexOfPostDated = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Post_Dated");
            int _columnIndexOfPostDated2 = _columnIndexOfPostDated;
            int _columnIndexOfChequeRetrieved = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Retrieved");
            int _columnIndexOfChequeRetrieved2 = _columnIndexOfChequeRetrieved;
            int _columnIndexOfRegisterNumber = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Register_Number");
            int _columnIndexOfRegisterNumber2 = _columnIndexOfRegisterNumber;
            int _columnIndexOfFromEntryNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "From_Entry_No");
            int _columnIndexOfFromEntryNo2 = _columnIndexOfFromEntryNo;
            int _columnIndexOfToEntryNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "To_Entry_No");
            int _columnIndexOfRegisterNumber3 = _columnIndexOfToEntryNo;
            int _columnIndexOfBatchPostedUserID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Batch_Posted_UserID");
            int _columnIndexOfFromEntryNo3 = _columnIndexOfBatchPostedUserID;
            int _columnIndexOfBDRegisterNumber = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "BD_Register_Number");
            int _columnIndexOfToEntryNo2 = _columnIndexOfBDRegisterNumber;
            int _columnIndexOfBDFromNumber = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "BD_From_Number");
            int _columnIndexOfBatchPostedUserID2 = _columnIndexOfBDFromNumber;
            int _columnIndexOfBDRegisterNumber2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "BD_To_Number");
            int _columnIndexOfReversalBy = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversal_By");
            int _columnIndexOfReversalBy2 = _columnIndexOfReversalBy;
            int _columnIndexOfReversalDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversal_Date");
            int _columnIndexOfPostDated3 = _columnIndexOfReversalDate;
            int _columnIndexOfReversalTime = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversal_Time");
            int _columnIndexOfReversalTime2 = _columnIndexOfReversalTime;
            int _columnIndexOfReversalRegisterNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversal_Register_No");
            int _columnIndexOfBDFromNumber2 = _columnIndexOfReversalRegisterNo;
            int _columnIndexOfReversalFromEntryNo2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversal_From_Entry_No");
            int _columnIndexOfReversalBy3 = _columnIndexOfReversalFromEntryNo2;
            int _columnIndexOfReversalToEntryNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversal_To_Entry_No");
            int _columnIndexOfReversalDate2 = _columnIndexOfReversalToEntryNo;
            int _columnIndexOfReversed2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversed");
            int _columnIndexOfReversalToEntryNo2 = _columnIndexOfReversed2;
            int _columnIndexOfAppliesToDocNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Applies_to_Doc_No");
            int _columnIndexOfReversalRegisterNo2 = _columnIndexOfAppliesToDocNo;
            int _columnIndexOfAppliesToID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Applies_to_ID");
            int _columnIndexOfAppliesToID2 = _columnIndexOfAppliesToID;
            int _columnIndexOfAppliesToID3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Grant_No");
            int _columnIndexOfInstallmentNumber = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Installment_Number");
            int _columnIndexOfAppliesToDocNo2 = _columnIndexOfInstallmentNumber;
            int _columnIndexOfNextInstallmentDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Next_Installment_Date");
            int _columnIndexOfInstallmentNumber2 = _columnIndexOfNextInstallmentDate;
            int _columnIndexOfDimensionSetID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dimension_Set_ID");
            int _columnIndexOfNextInstallmentDate2 = _columnIndexOfDimensionSetID;
            int _columnIndexOfDonor = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Donor");
            int _columnIndexOfDimensionSetID2 = _columnIndexOfDonor;
            int _columnIndexOfGroupCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Group_Code");
            int _columnIndexOfDonor2 = _columnIndexOfGroupCode;
            int _columnIndexOfPreADMFines = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Pre_ADM_Fines");
            int _columnIndexOfPreADMFines2 = _columnIndexOfPreADMFines;
            int _columnIndexOfMedFines = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Med_Fines");
            int _columnIndexOfMedFines2 = _columnIndexOfMedFines;
            int _columnIndexOfLoanNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Loan_No");
            int _columnIndexOfLoanNo2 = _columnIndexOfLoanNo;
            int _columnIndexOfGroupCode2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Penalty");
            int _columnIndexOfSent = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "sent");
            List<transaction> _result = new ArrayList<>();
            while (_stmt.step()) {
                transaction _item2 = new transaction();
                int _columnIndexOfSent2 = _columnIndexOfSent;
                if (_stmt.isNull(_columnIndexOfKey)) {
                    _item = _item2;
                    _item.Key = null;
                } else {
                    _item = _item2;
                    _item.Key = _stmt.getText(_columnIndexOfKey);
                }
                int _columnIndexOfReceivedFrom2 = _columnIndexOfReceivedFrom;
                int _columnIndexOfOnBehalfOf2 = _columnIndexOfOnBehalfOf;
                _item.Entry_No = (int) _stmt.getLong(_tmp_21);
                if (_stmt.isNull(_columnIndexOfNo)) {
                    _item.No = null;
                } else {
                    _item.No = _stmt.getText(_columnIndexOfNo);
                }
                if (_stmt.isNull(_columnIndexOfReversed)) {
                    _tmp = null;
                } else {
                    _tmp = Long.valueOf(_stmt.getLong(_columnIndexOfReversed));
                }
                _item.Date = Converters.DateConverter.toDate(_tmp);
                if (_stmt.isNull(_columnIndexOfReversalFromEntryNo)) {
                    _item.Type = null;
                } else {
                    _item.Type = _stmt.getText(_columnIndexOfReversalFromEntryNo);
                }
                if (_stmt.isNull(_columnIndexOfTranstype)) {
                    _item.transtype = null;
                } else {
                    _item.transtype = _stmt.getText(_columnIndexOfTranstype);
                }
                if (_stmt.isNull(_columnIndexOfPayMode)) {
                    _item.PayMode = null;
                } else {
                    _item.PayMode = _stmt.getText(_columnIndexOfPayMode);
                }
                if (_stmt.isNull(_columnIndexOfPayMode_1)) {
                    _item.Pay_Mode = null;
                } else {
                    _item.Pay_Mode = _stmt.getText(_columnIndexOfPayMode_1);
                }
                if (_stmt.isNull(_columnIndexOfChequeDepositSlipNo)) {
                    _item.Cheque_Deposit_Slip_No = null;
                } else {
                    _item.Cheque_Deposit_Slip_No = _stmt.getText(_columnIndexOfChequeDepositSlipNo);
                }
                if (_stmt.isNull(_columnIndexOfChequeDepositSlipDate)) {
                    _tmp_1 = null;
                } else {
                    _tmp_1 = Long.valueOf(_stmt.getLong(_columnIndexOfChequeDepositSlipDate));
                }
                _item.Cheque_Deposit_Slip_Date = Converters.DateConverter.toDate(_tmp_1);
                if (_stmt.isNull(_columnIndexOfBankCode)) {
                    _item.Bank_Code = null;
                } else {
                    _item.Bank_Code = _stmt.getText(_columnIndexOfBankCode);
                }
                if (_stmt.isNull(_columnIndexOfReceivedFrom2)) {
                    _item.Received_From = null;
                } else {
                    _item.Received_From = _stmt.getText(_columnIndexOfReceivedFrom2);
                }
                if (_stmt.isNull(_columnIndexOfOnBehalfOf2)) {
                    _item.On_Behalf_Of = null;
                } else {
                    _item.On_Behalf_Of = _stmt.getText(_columnIndexOfOnBehalfOf2);
                }
                int _columnIndexOfCashier3 = _columnIndexOfCashier;
                if (_stmt.isNull(_columnIndexOfCashier3)) {
                    _item.Cashier = null;
                } else {
                    _item.Cashier = _stmt.getText(_columnIndexOfCashier3);
                }
                int _columnIndexOfAccountNo3 = _columnIndexOfCashier2;
                if (_stmt.isNull(_columnIndexOfAccountNo3)) {
                    _item.Account_No = null;
                } else {
                    _item.Account_No = _stmt.getText(_columnIndexOfAccountNo3);
                }
                int _columnIndexOfAccountName = _columnIndexOfAccountNo2;
                if (_stmt.isNull(_columnIndexOfAccountName)) {
                    _item.Account_Name = null;
                } else {
                    _item.Account_Name = _stmt.getText(_columnIndexOfAccountName);
                }
                int _columnIndexOfPosted3 = _columnIndexOfNo2;
                Integer _tmp_2 = _stmt.isNull(_columnIndexOfPosted3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfPosted3));
                if (_tmp_2 == null) {
                    boolValueOf = null;
                } else {
                    boolValueOf = Boolean.valueOf(_tmp_2.intValue() != 0);
                }
                _item.Posted = boolValueOf;
                int _columnIndexOfDatePosted4 = _columnIndexOfDatePosted2;
                if (_stmt.isNull(_columnIndexOfDatePosted4)) {
                    _tmp_3 = null;
                } else {
                    _tmp_3 = Long.valueOf(_stmt.getLong(_columnIndexOfDatePosted4));
                }
                _item.Date_Posted = Converters.DateConverter.toDate(_tmp_3);
                int _columnIndexOfTimePosted3 = _columnIndexOfTimePosted2;
                if (_stmt.isNull(_columnIndexOfTimePosted3)) {
                    _tmp_4 = null;
                } else {
                    _tmp_4 = Long.valueOf(_stmt.getLong(_columnIndexOfTimePosted3));
                }
                _item.Time_Posted = Converters.DateConverter.toDate(_tmp_4);
                int _columnIndexOfPostedBy3 = _columnIndexOfPosted2;
                if (_stmt.isNull(_columnIndexOfPostedBy3)) {
                    _item.Posted_By = null;
                } else {
                    _item.Posted_By = _stmt.getText(_columnIndexOfPostedBy3);
                }
                int _columnIndexOfAmount3 = _columnIndexOfPostedBy2;
                if (_stmt.isNull(_columnIndexOfAmount3)) {
                    _item.Amount = null;
                } else {
                    _item.Amount = Double.valueOf(_stmt.getDouble(_columnIndexOfAmount3));
                }
                int _columnIndexOfRemarks3 = _columnIndexOfAmount2;
                if (_stmt.isNull(_columnIndexOfRemarks3)) {
                    _item.Remarks = null;
                } else {
                    _item.Remarks = _stmt.getText(_columnIndexOfRemarks3);
                }
                int _columnIndexOfTransactionName3 = _columnIndexOfRemarks2;
                if (_stmt.isNull(_columnIndexOfTransactionName3)) {
                    _item.Transaction_Name = null;
                } else {
                    _item.Transaction_Name = _stmt.getText(_columnIndexOfTransactionName3);
                }
                int _columnIndexOfBranchCode3 = _columnIndexOfTransactionName2;
                if (_stmt.isNull(_columnIndexOfBranchCode3)) {
                    _item.Branch_Code = null;
                } else {
                    _item.Branch_Code = _stmt.getText(_columnIndexOfBranchCode3);
                }
                int _columnIndexOfAgentCode3 = _columnIndexOfBranchCode2;
                if (_stmt.isNull(_columnIndexOfAgentCode3)) {
                    _item.Agent_Code = null;
                } else {
                    _item.Agent_Code = _stmt.getText(_columnIndexOfAgentCode3);
                }
                int _columnIndexOfGrouping3 = _columnIndexOfAgentCode2;
                if (_stmt.isNull(_columnIndexOfGrouping3)) {
                    _item.Grouping = null;
                } else {
                    _item.Grouping = _stmt.getText(_columnIndexOfGrouping3);
                }
                int _columnIndexOfGlobalDimension1Code3 = _columnIndexOfGrouping2;
                if (_stmt.isNull(_columnIndexOfGlobalDimension1Code3)) {
                    _item.Global_Dimension_1_Code = null;
                } else {
                    _item.Global_Dimension_1_Code = _stmt.getText(_columnIndexOfGlobalDimension1Code3);
                }
                int _columnIndexOfShortcutDimension2Code3 = _columnIndexOfGlobalDimension1Code2;
                if (_stmt.isNull(_columnIndexOfShortcutDimension2Code3)) {
                    _item.Shortcut_Dimension_2_Code = null;
                } else {
                    _item.Shortcut_Dimension_2_Code = _stmt.getText(_columnIndexOfShortcutDimension2Code3);
                }
                int _columnIndexOfVATPercent3 = _columnIndexOfShortcutDimension2Code2;
                if (_stmt.isNull(_columnIndexOfVATPercent3)) {
                    _item.VAT_Percent = null;
                } else {
                    _item.VAT_Percent = Double.valueOf(_stmt.getDouble(_columnIndexOfVATPercent3));
                }
                int _columnIndexOfCurrencyCode3 = _columnIndexOfVATPercent2;
                if (_stmt.isNull(_columnIndexOfCurrencyCode3)) {
                    _item.Currency_Code = null;
                } else {
                    _item.Currency_Code = _stmt.getText(_columnIndexOfCurrencyCode3);
                }
                int _columnIndexOfCurrencyFactor3 = _columnIndexOfCurrencyCode2;
                if (_stmt.isNull(_columnIndexOfCurrencyFactor3)) {
                    _item.Currency_Factor = null;
                } else {
                    _item.Currency_Factor = Double.valueOf(_stmt.getDouble(_columnIndexOfCurrencyFactor3));
                }
                int _columnIndexOfVATBusPostingGroup3 = _columnIndexOfCurrencyFactor2;
                if (_stmt.isNull(_columnIndexOfVATBusPostingGroup3)) {
                    _item.VAT_Bus_Posting_Group = null;
                } else {
                    _item.VAT_Bus_Posting_Group = _stmt.getText(_columnIndexOfVATBusPostingGroup3);
                }
                int _columnIndexOfVATProdPostingGroup = _columnIndexOfVATBusPostingGroup2;
                if (_stmt.isNull(_columnIndexOfVATProdPostingGroup)) {
                    _item.VAT_Prod_Posting_Group = null;
                } else {
                    _item.VAT_Prod_Posting_Group = _stmt.getText(_columnIndexOfVATProdPostingGroup);
                }
                int _columnIndexOfGenPostingTypeSpecified4 = _columnIndexOfGenPostingTypeSpecified2;
                Integer _tmp_5 = _stmt.isNull(_columnIndexOfGenPostingTypeSpecified4) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfGenPostingTypeSpecified4));
                if (_tmp_5 == null) {
                    boolValueOf2 = null;
                } else {
                    boolValueOf2 = Boolean.valueOf(_tmp_5.intValue() != 0);
                }
                _item.Gen_Posting_TypeSpecified = boolValueOf2;
                int _columnIndexOfGenBusPostingGroup3 = _columnIndexOfGenPostingTypeSpecified3;
                if (_stmt.isNull(_columnIndexOfGenBusPostingGroup3)) {
                    _item.Gen_Bus_Posting_Group = null;
                } else {
                    _item.Gen_Bus_Posting_Group = _stmt.getText(_columnIndexOfGenBusPostingGroup3);
                }
                int _columnIndexOfGenProdPostingGroup4 = _columnIndexOfGenProdPostingGroup2;
                if (_stmt.isNull(_columnIndexOfGenProdPostingGroup4)) {
                    _item.Gen_Prod_Posting_Group = null;
                } else {
                    _item.Gen_Prod_Posting_Group = _stmt.getText(_columnIndexOfGenProdPostingGroup4);
                }
                int _columnIndexOfVATAmount3 = _columnIndexOfGenProdPostingGroup3;
                if (_stmt.isNull(_columnIndexOfVATAmount3)) {
                    _item.VAT_Amount = null;
                } else {
                    _item.VAT_Amount = Double.valueOf(_stmt.getDouble(_columnIndexOfVATAmount3));
                }
                int _columnIndexOfTotalAmount3 = _columnIndexOfVATAmount2;
                if (_stmt.isNull(_columnIndexOfTotalAmount3)) {
                    _item.Total_Amount = null;
                } else {
                    _item.Total_Amount = Double.valueOf(_stmt.getDouble(_columnIndexOfTotalAmount3));
                }
                int _columnIndexOfUserID3 = _columnIndexOfTotalAmount2;
                if (_stmt.isNull(_columnIndexOfUserID3)) {
                    _item.User_ID = null;
                } else {
                    _item.User_ID = _stmt.getText(_columnIndexOfUserID3);
                }
                int _columnIndexOfApplyTo3 = _columnIndexOfUserID2;
                if (_stmt.isNull(_columnIndexOfApplyTo3)) {
                    _item.Apply_to = null;
                } else {
                    _item.Apply_to = _stmt.getText(_columnIndexOfApplyTo3);
                }
                int _columnIndexOfApplyToID3 = _columnIndexOfApplyTo2;
                if (_stmt.isNull(_columnIndexOfApplyToID3)) {
                    _item.Apply_to_ID = null;
                } else {
                    _item.Apply_to_ID = _stmt.getText(_columnIndexOfApplyToID3);
                }
                int _columnIndexOfDestGlobalDimension1Code3 = _columnIndexOfApplyToID2;
                if (_stmt.isNull(_columnIndexOfDestGlobalDimension1Code3)) {
                    _item.Dest_Global_Dimension_1_Code = null;
                } else {
                    _item.Dest_Global_Dimension_1_Code = _stmt.getText(_columnIndexOfDestGlobalDimension1Code3);
                }
                int _columnIndexOfDestShortcutDimension2Code = _columnIndexOfDestGlobalDimension1Code2;
                if (_stmt.isNull(_columnIndexOfDestShortcutDimension2Code)) {
                    _item.Dest_Shortcut_Dimension_2_Code = null;
                } else {
                    _item.Dest_Shortcut_Dimension_2_Code = _stmt.getText(_columnIndexOfDestShortcutDimension2Code);
                }
                int _columnIndexOfLineNo3 = _columnIndexOfGenBusPostingGroup2;
                _item.Line_No = (int) _stmt.getLong(_columnIndexOfLineNo3);
                int _columnIndexOfPrintNo3 = _columnIndexOfDatePosted3;
                _item.Print_No = (int) _stmt.getLong(_columnIndexOfPrintNo3);
                int _columnIndexOfDepositSlipTime3 = _columnIndexOfLineNo2;
                if (_stmt.isNull(_columnIndexOfDepositSlipTime3)) {
                    _tmp_6 = null;
                } else {
                    _tmp_6 = Long.valueOf(_stmt.getLong(_columnIndexOfDepositSlipTime3));
                }
                _item.Deposit_Slip_Time = Converters.DateConverter.toDate(_tmp_6);
                int _columnIndexOfTellerID3 = _columnIndexOfPrintNo2;
                if (_stmt.isNull(_columnIndexOfTellerID3)) {
                    _item.Teller_ID = null;
                } else {
                    _item.Teller_ID = _stmt.getText(_columnIndexOfTellerID3);
                }
                int _columnIndexOfCustomerPaymentOnAccount3 = _columnIndexOfDepositSlipTime2;
                Integer _tmp_7 = _stmt.isNull(_columnIndexOfCustomerPaymentOnAccount3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfCustomerPaymentOnAccount3));
                if (_tmp_7 == null) {
                    boolValueOf3 = null;
                } else {
                    boolValueOf3 = Boolean.valueOf(_tmp_7.intValue() != 0);
                }
                _item.Customer_Payment_On_Account = boolValueOf3;
                int _columnIndexOfSelect = _columnIndexOfCustomerPaymentOnAccount2;
                Integer _tmp_8 = _stmt.isNull(_columnIndexOfSelect) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfSelect));
                if (_tmp_8 == null) {
                    boolValueOf4 = null;
                } else {
                    boolValueOf4 = Boolean.valueOf(_tmp_8.intValue() != 0);
                }
                _item.Select = boolValueOf4;
                int _columnIndexOfBatchPosted3 = _columnIndexOfType;
                Integer _tmp_9 = _stmt.isNull(_columnIndexOfBatchPosted3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfBatchPosted3));
                if (_tmp_9 == null) {
                    boolValueOf5 = null;
                } else {
                    boolValueOf5 = Boolean.valueOf(_tmp_9.intValue() != 0);
                }
                _item.Batch_Posted = boolValueOf5;
                int _columnIndexOfTransactionNo = _columnIndexOfTellerID2;
                if (_stmt.isNull(_columnIndexOfTransactionNo)) {
                    _item.Transaction_No = null;
                } else {
                    _item.Transaction_No = _stmt.getText(_columnIndexOfTransactionNo);
                }
                int _columnIndexOfChequeDepositSlipBank4 = _columnIndexOfChequeDepositSlipBank2;
                if (_stmt.isNull(_columnIndexOfChequeDepositSlipBank4)) {
                    _item.Cheque_Deposit_Slip_Bank = null;
                } else {
                    _item.Cheque_Deposit_Slip_Bank = _stmt.getText(_columnIndexOfChequeDepositSlipBank4);
                }
                int _columnIndexOfBankAccount = _columnIndexOfChequeDepositSlipBank3;
                if (_stmt.isNull(_columnIndexOfBankAccount)) {
                    _item.Bank_Account = null;
                } else {
                    _item.Bank_Account = _stmt.getText(_columnIndexOfBankAccount);
                }
                int _columnIndexOfConfirmed3 = _columnIndexOfBatchPosted2;
                Integer _tmp_10 = _stmt.isNull(_columnIndexOfConfirmed3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfConfirmed3));
                if (_tmp_10 == null) {
                    boolValueOf6 = null;
                } else {
                    boolValueOf6 = Boolean.valueOf(_tmp_10.intValue() != 0);
                }
                _item.Confirmed = boolValueOf6;
                int _columnIndexOfReconciled3 = _columnIndexOfReconciled2;
                Integer _tmp_11 = _stmt.isNull(_columnIndexOfReconciled3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfReconciled3));
                if (_tmp_11 == null) {
                    boolValueOf7 = null;
                } else {
                    boolValueOf7 = Boolean.valueOf(_tmp_11.intValue() != 0);
                }
                _item.Reconciled = boolValueOf7;
                int _columnIndexOfOrigCashier = _columnIndexOfConfirmed2;
                if (_stmt.isNull(_columnIndexOfOrigCashier)) {
                    _item.Orig_Cashier = null;
                } else {
                    _item.Orig_Cashier = _stmt.getText(_columnIndexOfOrigCashier);
                }
                int _columnIndexOfCancelled4 = _columnIndexOfCancelled2;
                Integer _tmp_12 = _stmt.isNull(_columnIndexOfCancelled4) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfCancelled4));
                if (_tmp_12 == null) {
                    boolValueOf8 = null;
                } else {
                    boolValueOf8 = Boolean.valueOf(_tmp_12.intValue() != 0);
                }
                _item.Cancelled = boolValueOf8;
                int _columnIndexOfCancelledBy = _columnIndexOfCancelled3;
                if (_stmt.isNull(_columnIndexOfCancelledBy)) {
                    _item.Cancelled_By = null;
                } else {
                    _item.Cancelled_By = _stmt.getText(_columnIndexOfCancelledBy);
                }
                int _columnIndexOfCancelledDate3 = _columnIndexOfCancelledDate2;
                if (_stmt.isNull(_columnIndexOfCancelledDate3)) {
                    _tmp_13 = null;
                } else {
                    _tmp_13 = Long.valueOf(_stmt.getLong(_columnIndexOfCancelledDate3));
                }
                _item.Cancelled_Date = Converters.DateConverter.toDate(_tmp_13);
                int _columnIndexOfCancelledTime3 = _columnIndexOfCancelledTime2;
                if (_stmt.isNull(_columnIndexOfCancelledTime3)) {
                    _tmp_14 = null;
                } else {
                    _tmp_14 = Long.valueOf(_stmt.getLong(_columnIndexOfCancelledTime3));
                }
                _item.Cancelled_Time = Converters.DateConverter.toDate(_tmp_14);
                int _columnIndexOfPostDated4 = _columnIndexOfPostDated2;
                Integer _tmp_15 = _stmt.isNull(_columnIndexOfPostDated4) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfPostDated4));
                if (_tmp_15 == null) {
                    boolValueOf9 = null;
                } else {
                    boolValueOf9 = Boolean.valueOf(_tmp_15.intValue() != 0);
                }
                _item.Post_Dated = boolValueOf9;
                int _columnIndexOfChequeRetrieved3 = _columnIndexOfChequeRetrieved2;
                Integer _tmp_16 = _stmt.isNull(_columnIndexOfChequeRetrieved3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfChequeRetrieved3));
                if (_tmp_16 == null) {
                    boolValueOf10 = null;
                } else {
                    boolValueOf10 = Boolean.valueOf(_tmp_16.intValue() != 0);
                }
                _item.Cheque_Retrieved = boolValueOf10;
                int _columnIndexOfRegisterNumber4 = _columnIndexOfRegisterNumber2;
                _item.Register_Number = (int) _stmt.getLong(_columnIndexOfRegisterNumber4);
                int _columnIndexOfFromEntryNo4 = _columnIndexOfFromEntryNo2;
                _item.From_Entry_No = (int) _stmt.getLong(_columnIndexOfFromEntryNo4);
                int _columnIndexOfToEntryNo3 = _columnIndexOfRegisterNumber3;
                _item.To_Entry_No = (int) _stmt.getLong(_columnIndexOfToEntryNo3);
                int _columnIndexOfBatchPostedUserID3 = _columnIndexOfFromEntryNo3;
                if (_stmt.isNull(_columnIndexOfBatchPostedUserID3)) {
                    _item.Batch_Posted_UserID = null;
                } else {
                    _item.Batch_Posted_UserID = _stmt.getText(_columnIndexOfBatchPostedUserID3);
                }
                int _columnIndexOfBDRegisterNumber3 = _columnIndexOfToEntryNo2;
                _item.BD_Register_Number = (int) _stmt.getLong(_columnIndexOfBDRegisterNumber3);
                int _columnIndexOfBDFromNumber3 = _columnIndexOfBatchPostedUserID2;
                _item.BD_From_Number = (int) _stmt.getLong(_columnIndexOfBDFromNumber3);
                int _columnIndexOfBDToNumber = _columnIndexOfBDRegisterNumber2;
                _item.BD_To_Number = (int) _stmt.getLong(_columnIndexOfBDToNumber);
                int _columnIndexOfReversalBy4 = _columnIndexOfReversalBy2;
                if (_stmt.isNull(_columnIndexOfReversalBy4)) {
                    _item.Reversal_By = null;
                } else {
                    _item.Reversal_By = _stmt.getText(_columnIndexOfReversalBy4);
                }
                int _columnIndexOfReversalDate3 = _columnIndexOfPostDated3;
                if (_stmt.isNull(_columnIndexOfReversalDate3)) {
                    _tmp_17 = null;
                } else {
                    _tmp_17 = Long.valueOf(_stmt.getLong(_columnIndexOfReversalDate3));
                }
                _item.Reversal_Date = Converters.DateConverter.toDate(_tmp_17);
                int _columnIndexOfReversalTime3 = _columnIndexOfReversalTime2;
                if (_stmt.isNull(_columnIndexOfReversalTime3)) {
                    _tmp_18 = null;
                } else {
                    _tmp_18 = Long.valueOf(_stmt.getLong(_columnIndexOfReversalTime3));
                }
                _item.Reversal_Time = Converters.DateConverter.toDate(_tmp_18);
                int _columnIndexOfReversalRegisterNo3 = _columnIndexOfBDFromNumber2;
                _item.Reversal_Register_No = (int) _stmt.getLong(_columnIndexOfReversalRegisterNo3);
                int _columnIndexOfReversalFromEntryNo3 = _columnIndexOfReversalBy3;
                _item.Reversal_From_Entry_No = (int) _stmt.getLong(_columnIndexOfReversalFromEntryNo3);
                int _columnIndexOfReversalToEntryNo3 = _columnIndexOfReversalDate2;
                _item.Reversal_To_Entry_No = (int) _stmt.getLong(_columnIndexOfReversalToEntryNo3);
                int _columnIndexOfReversed3 = _columnIndexOfReversalToEntryNo2;
                Integer _tmp_19 = _stmt.isNull(_columnIndexOfReversed3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfReversed3));
                if (_tmp_19 == null) {
                    boolValueOf11 = null;
                } else {
                    boolValueOf11 = Boolean.valueOf(_tmp_19.intValue() != 0);
                }
                _item.Reversed = boolValueOf11;
                int _columnIndexOfAppliesToDocNo3 = _columnIndexOfReversalRegisterNo2;
                if (_stmt.isNull(_columnIndexOfAppliesToDocNo3)) {
                    _item.Applies_to_Doc_No = null;
                } else {
                    _item.Applies_to_Doc_No = _stmt.getText(_columnIndexOfAppliesToDocNo3);
                }
                int _columnIndexOfAppliesToID4 = _columnIndexOfAppliesToID2;
                if (_stmt.isNull(_columnIndexOfAppliesToID4)) {
                    _item.Applies_to_ID = null;
                } else {
                    _item.Applies_to_ID = _stmt.getText(_columnIndexOfAppliesToID4);
                }
                int _columnIndexOfGrantNo = _columnIndexOfAppliesToID3;
                if (_stmt.isNull(_columnIndexOfGrantNo)) {
                    _item.Grant_No = null;
                } else {
                    _item.Grant_No = _stmt.getText(_columnIndexOfGrantNo);
                }
                int _columnIndexOfInstallmentNumber3 = _columnIndexOfAppliesToDocNo2;
                _item.Installment_Number = (int) _stmt.getLong(_columnIndexOfInstallmentNumber3);
                int _columnIndexOfNextInstallmentDate3 = _columnIndexOfInstallmentNumber2;
                if (_stmt.isNull(_columnIndexOfNextInstallmentDate3)) {
                    _tmp_20 = null;
                } else {
                    _tmp_20 = Long.valueOf(_stmt.getLong(_columnIndexOfNextInstallmentDate3));
                }
                _item.Next_Installment_Date = Converters.DateConverter.toDate(_tmp_20);
                int _columnIndexOfDimensionSetID3 = _columnIndexOfNextInstallmentDate2;
                _item.Dimension_Set_ID = (int) _stmt.getLong(_columnIndexOfDimensionSetID3);
                int _columnIndexOfDonor3 = _columnIndexOfDimensionSetID2;
                if (_stmt.isNull(_columnIndexOfDonor3)) {
                    _item.Donor = null;
                } else {
                    _item.Donor = _stmt.getText(_columnIndexOfDonor3);
                }
                int _columnIndexOfGroupCode3 = _columnIndexOfDonor2;
                if (_stmt.isNull(_columnIndexOfGroupCode3)) {
                    _item.Group_Code = null;
                } else {
                    _item.Group_Code = _stmt.getText(_columnIndexOfGroupCode3);
                }
                _columnIndexOfPreADMFines2 = _columnIndexOfPreADMFines2;
                if (_stmt.isNull(_columnIndexOfPreADMFines2)) {
                    _item.Pre_ADM_Fines = null;
                } else {
                    _item.Pre_ADM_Fines = Double.valueOf(_stmt.getDouble(_columnIndexOfPreADMFines2));
                }
                _columnIndexOfMedFines2 = _columnIndexOfMedFines2;
                if (_stmt.isNull(_columnIndexOfMedFines2)) {
                    _item.Med_Fines = null;
                } else {
                    _item.Med_Fines = Double.valueOf(_stmt.getDouble(_columnIndexOfMedFines2));
                }
                _columnIndexOfLoanNo2 = _columnIndexOfLoanNo2;
                if (_stmt.isNull(_columnIndexOfLoanNo2)) {
                    _item.Loan_No = null;
                } else {
                    _item.Loan_No = _stmt.getText(_columnIndexOfLoanNo2);
                }
                int _columnIndexOfPenalty = _columnIndexOfGroupCode2;
                if (_stmt.isNull(_columnIndexOfPenalty)) {
                    _item.Penalty = null;
                } else {
                    _item.Penalty = Double.valueOf(_stmt.getDouble(_columnIndexOfPenalty));
                }
                _columnIndexOfSent = _columnIndexOfSent2;
                int _tmp_22 = (int) _stmt.getLong(_columnIndexOfSent);
                _item.sent = _tmp_22 != 0;
                List<transaction> _result2 = _result;
                _result2.add(_item);
                _result = _result2;
                _columnIndexOfCashier = _columnIndexOfCashier3;
                _columnIndexOfCashier2 = _columnIndexOfAccountNo3;
                _columnIndexOfNo = _columnIndexOfNo;
                _columnIndexOfNo2 = _columnIndexOfPosted3;
                _columnIndexOfPosted2 = _columnIndexOfPostedBy3;
                _columnIndexOfPostedBy2 = _columnIndexOfAmount3;
                _columnIndexOfAmount2 = _columnIndexOfRemarks3;
                _columnIndexOfRemarks2 = _columnIndexOfTransactionName3;
                _columnIndexOfTransactionName2 = _columnIndexOfBranchCode3;
                _columnIndexOfBranchCode2 = _columnIndexOfAgentCode3;
                _columnIndexOfAgentCode2 = _columnIndexOfGrouping3;
                _columnIndexOfGrouping2 = _columnIndexOfGlobalDimension1Code3;
                _columnIndexOfGlobalDimension1Code2 = _columnIndexOfShortcutDimension2Code3;
                _columnIndexOfShortcutDimension2Code2 = _columnIndexOfVATPercent3;
                _columnIndexOfVATPercent2 = _columnIndexOfCurrencyCode3;
                _columnIndexOfCurrencyCode2 = _columnIndexOfCurrencyFactor3;
                _columnIndexOfCurrencyFactor2 = _columnIndexOfVATBusPostingGroup3;
                _columnIndexOfGenPostingTypeSpecified2 = _columnIndexOfGenPostingTypeSpecified4;
                _columnIndexOfGenProdPostingGroup2 = _columnIndexOfGenProdPostingGroup4;
                _columnIndexOfGenProdPostingGroup3 = _columnIndexOfVATAmount3;
                _columnIndexOfVATAmount2 = _columnIndexOfTotalAmount3;
                _columnIndexOfTotalAmount2 = _columnIndexOfUserID3;
                _columnIndexOfUserID2 = _columnIndexOfApplyTo3;
                _columnIndexOfApplyTo2 = _columnIndexOfApplyToID3;
                _columnIndexOfApplyToID2 = _columnIndexOfDestGlobalDimension1Code3;
                _columnIndexOfGenPostingTypeSpecified3 = _columnIndexOfGenBusPostingGroup3;
                _columnIndexOfDatePosted2 = _columnIndexOfDatePosted4;
                _columnIndexOfGenBusPostingGroup2 = _columnIndexOfLineNo3;
                _columnIndexOfDatePosted3 = _columnIndexOfPrintNo3;
                _columnIndexOfLineNo2 = _columnIndexOfDepositSlipTime3;
                _columnIndexOfDepositSlipTime2 = _columnIndexOfCustomerPaymentOnAccount3;
                _columnIndexOfPrintNo2 = _columnIndexOfTellerID3;
                _columnIndexOfChequeDepositSlipBank2 = _columnIndexOfChequeDepositSlipBank4;
                _columnIndexOfCancelled2 = _columnIndexOfCancelled4;
                _columnIndexOfRegisterNumber2 = _columnIndexOfRegisterNumber4;
                _columnIndexOfFromEntryNo2 = _columnIndexOfFromEntryNo4;
                _columnIndexOfRegisterNumber3 = _columnIndexOfToEntryNo3;
                _columnIndexOfFromEntryNo3 = _columnIndexOfBatchPostedUserID3;
                _columnIndexOfToEntryNo2 = _columnIndexOfBDRegisterNumber3;
                _columnIndexOfPostDated2 = _columnIndexOfPostDated4;
                _columnIndexOfBatchPostedUserID2 = _columnIndexOfBDFromNumber3;
                _columnIndexOfReversalBy2 = _columnIndexOfReversalBy4;
                _columnIndexOfPostDated3 = _columnIndexOfReversalDate3;
                _columnIndexOfReversalDate2 = _columnIndexOfReversalToEntryNo3;
                _columnIndexOfBDFromNumber2 = _columnIndexOfReversalRegisterNo3;
                _columnIndexOfAppliesToID2 = _columnIndexOfAppliesToID4;
                _columnIndexOfReversalRegisterNo2 = _columnIndexOfAppliesToDocNo3;
                _columnIndexOfAppliesToDocNo2 = _columnIndexOfInstallmentNumber3;
                _columnIndexOfInstallmentNumber2 = _columnIndexOfNextInstallmentDate3;
                _columnIndexOfNextInstallmentDate2 = _columnIndexOfDimensionSetID3;
                _columnIndexOfDimensionSetID2 = _columnIndexOfDonor3;
                _columnIndexOfDonor2 = _columnIndexOfGroupCode3;
                _columnIndexOfOnBehalfOf = _columnIndexOfOnBehalfOf2;
                _columnIndexOfGroupCode2 = _columnIndexOfPenalty;
                _columnIndexOfReceivedFrom = _columnIndexOfReceivedFrom2;
                _tmp_21 = _tmp_21;
                _columnIndexOfAccountNo2 = _columnIndexOfAccountName;
                _columnIndexOfTimePosted2 = _columnIndexOfTimePosted3;
                _columnIndexOfVATBusPostingGroup2 = _columnIndexOfVATProdPostingGroup;
                _columnIndexOfDestGlobalDimension1Code2 = _columnIndexOfDestShortcutDimension2Code;
                _columnIndexOfCustomerPaymentOnAccount2 = _columnIndexOfSelect;
                _columnIndexOfChequeDepositSlipBank3 = _columnIndexOfBankAccount;
                _columnIndexOfTellerID2 = _columnIndexOfTransactionNo;
                _columnIndexOfReconciled2 = _columnIndexOfReconciled3;
                _columnIndexOfCancelledDate2 = _columnIndexOfCancelledDate3;
                _columnIndexOfCancelledTime2 = _columnIndexOfCancelledTime3;
                _columnIndexOfCancelled3 = _columnIndexOfCancelledBy;
                _columnIndexOfChequeRetrieved2 = _columnIndexOfChequeRetrieved3;
                _columnIndexOfReversalTime2 = _columnIndexOfReversalTime3;
                _columnIndexOfBDRegisterNumber2 = _columnIndexOfBDToNumber;
                _columnIndexOfAppliesToID3 = _columnIndexOfGrantNo;
                _columnIndexOfReversalToEntryNo2 = _columnIndexOfReversed3;
                _columnIndexOfReversalBy3 = _columnIndexOfReversalFromEntryNo3;
                _columnIndexOfReversalFromEntryNo = _columnIndexOfReversalFromEntryNo;
                _columnIndexOfType = _columnIndexOfBatchPosted3;
                _columnIndexOfBatchPosted2 = _columnIndexOfConfirmed3;
                _columnIndexOfReversed = _columnIndexOfReversed;
                _columnIndexOfConfirmed2 = _columnIndexOfOrigCashier;
            }
            return _result;
        } finally {
            _stmt.close();
        }
    }

    @Override // com.trimline.metrocrew.transaction.dao
    LiveData<List<transaction>> load() {
        return this.__db.getInvalidationTracker().createLiveData(new String[]{"transaction"}, false, new Function1() { // from class: com.trimline.metrocrew.transaction_dao_Impl$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return transaction_dao_Impl.lambda$load$6((SQLiteConnection) obj);
            }
        });
    }

    static /* synthetic */ List lambda$load$6(SQLiteConnection _connection) {
        transaction _item;
        Long _tmp;
        Long _tmp_1;
        Boolean boolValueOf;
        Long _tmp_3;
        Long _tmp_4;
        Boolean boolValueOf2;
        Long _tmp_6;
        Boolean boolValueOf3;
        Boolean boolValueOf4;
        Boolean boolValueOf5;
        Boolean boolValueOf6;
        Boolean boolValueOf7;
        Boolean boolValueOf8;
        Long _tmp_13;
        Long _tmp_14;
        Boolean boolValueOf9;
        Boolean boolValueOf10;
        Long _tmp_17;
        Long _tmp_18;
        Boolean boolValueOf11;
        Long _tmp_20;
        SQLiteStatement _stmt = _connection.prepare("SELECT * FROM `transaction`");
        try {
            int _columnIndexOfKey = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Key");
            int _tmp_21 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Entry_No");
            int _columnIndexOfNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "No");
            int _columnIndexOfReversed = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Date");
            int _columnIndexOfReversalFromEntryNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Type");
            int _columnIndexOfTranstype = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "transtype");
            int _columnIndexOfPayMode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "PayMode");
            int _columnIndexOfPayMode_1 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Pay_Mode");
            int _columnIndexOfChequeDepositSlipNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Deposit_Slip_No");
            int _columnIndexOfChequeDepositSlipDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Deposit_Slip_Date");
            int _columnIndexOfBankCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Bank_Code");
            int _columnIndexOfReceivedFrom = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Received_From");
            int _columnIndexOfOnBehalfOf = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "On_Behalf_Of");
            int _columnIndexOfCashier = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cashier");
            int _columnIndexOfAccountNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Account_No");
            int _columnIndexOfCashier2 = _columnIndexOfAccountNo;
            int _columnIndexOfAccountNo2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Account_Name");
            int _columnIndexOfPosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Posted");
            int _columnIndexOfNo2 = _columnIndexOfPosted;
            int _columnIndexOfDatePosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Date_Posted");
            int _columnIndexOfDatePosted2 = _columnIndexOfDatePosted;
            int _columnIndexOfTimePosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Time_Posted");
            int _columnIndexOfTimePosted2 = _columnIndexOfTimePosted;
            int _columnIndexOfPostedBy = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Posted_By");
            int _columnIndexOfPosted2 = _columnIndexOfPostedBy;
            int _columnIndexOfAmount = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Amount");
            int _columnIndexOfPostedBy2 = _columnIndexOfAmount;
            int _columnIndexOfRemarks = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Remarks");
            int _columnIndexOfAmount2 = _columnIndexOfRemarks;
            int _columnIndexOfTransactionName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Transaction_Name");
            int _columnIndexOfRemarks2 = _columnIndexOfTransactionName;
            int _columnIndexOfBranchCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Branch_Code");
            int _columnIndexOfTransactionName2 = _columnIndexOfBranchCode;
            int _columnIndexOfAgentCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Agent_Code");
            int _columnIndexOfBranchCode2 = _columnIndexOfAgentCode;
            int _columnIndexOfGrouping = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Grouping");
            int _columnIndexOfAgentCode2 = _columnIndexOfGrouping;
            int _columnIndexOfGlobalDimension1Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Global_Dimension_1_Code");
            int _columnIndexOfGrouping2 = _columnIndexOfGlobalDimension1Code;
            int _columnIndexOfShortcutDimension2Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Shortcut_Dimension_2_Code");
            int _columnIndexOfGlobalDimension1Code2 = _columnIndexOfShortcutDimension2Code;
            int _columnIndexOfVATPercent = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "VAT_Percent");
            int _columnIndexOfShortcutDimension2Code2 = _columnIndexOfVATPercent;
            int _columnIndexOfCurrencyCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Currency_Code");
            int _columnIndexOfVATPercent2 = _columnIndexOfCurrencyCode;
            int _columnIndexOfCurrencyFactor = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Currency_Factor");
            int _columnIndexOfCurrencyCode2 = _columnIndexOfCurrencyFactor;
            int _columnIndexOfVATBusPostingGroup = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "VAT_Bus_Posting_Group");
            int _columnIndexOfCurrencyFactor2 = _columnIndexOfVATBusPostingGroup;
            int _columnIndexOfVATBusPostingGroup2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "VAT_Prod_Posting_Group");
            int _columnIndexOfGenPostingTypeSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Gen_Posting_TypeSpecified");
            int _columnIndexOfGenPostingTypeSpecified2 = _columnIndexOfGenPostingTypeSpecified;
            int _columnIndexOfGenBusPostingGroup = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Gen_Bus_Posting_Group");
            int _columnIndexOfGenPostingTypeSpecified3 = _columnIndexOfGenBusPostingGroup;
            int _columnIndexOfGenProdPostingGroup = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Gen_Prod_Posting_Group");
            int _columnIndexOfGenProdPostingGroup2 = _columnIndexOfGenProdPostingGroup;
            int _columnIndexOfVATAmount = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "VAT_Amount");
            int _columnIndexOfGenProdPostingGroup3 = _columnIndexOfVATAmount;
            int _columnIndexOfTotalAmount = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Total_Amount");
            int _columnIndexOfVATAmount2 = _columnIndexOfTotalAmount;
            int _columnIndexOfUserID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "User_ID");
            int _columnIndexOfTotalAmount2 = _columnIndexOfUserID;
            int _columnIndexOfApplyTo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Apply_to");
            int _columnIndexOfUserID2 = _columnIndexOfApplyTo;
            int _columnIndexOfApplyToID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Apply_to_ID");
            int _columnIndexOfApplyTo2 = _columnIndexOfApplyToID;
            int _columnIndexOfDestGlobalDimension1Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dest_Global_Dimension_1_Code");
            int _columnIndexOfApplyToID2 = _columnIndexOfDestGlobalDimension1Code;
            int _columnIndexOfDestGlobalDimension1Code2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dest_Shortcut_Dimension_2_Code");
            int _columnIndexOfLineNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Line_No");
            int _columnIndexOfGenBusPostingGroup2 = _columnIndexOfLineNo;
            int _columnIndexOfPrintNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Print_No");
            int _columnIndexOfDatePosted3 = _columnIndexOfPrintNo;
            int _columnIndexOfDepositSlipTime = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Deposit_Slip_Time");
            int _columnIndexOfLineNo2 = _columnIndexOfDepositSlipTime;
            int _columnIndexOfTellerID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Teller_ID");
            int _columnIndexOfPrintNo2 = _columnIndexOfTellerID;
            int _columnIndexOfCustomerPaymentOnAccount = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Customer_Payment_On_Account");
            int _columnIndexOfDepositSlipTime2 = _columnIndexOfCustomerPaymentOnAccount;
            int _columnIndexOfCustomerPaymentOnAccount2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Select");
            int _columnIndexOfBatchPosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Batch_Posted");
            int _columnIndexOfType = _columnIndexOfBatchPosted;
            int _columnIndexOfTellerID2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Transaction_No");
            int _columnIndexOfChequeDepositSlipBank = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Deposit_Slip_Bank");
            int _columnIndexOfChequeDepositSlipBank2 = _columnIndexOfChequeDepositSlipBank;
            int _columnIndexOfChequeDepositSlipBank3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Bank_Account");
            int _columnIndexOfConfirmed = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Confirmed");
            int _columnIndexOfBatchPosted2 = _columnIndexOfConfirmed;
            int _columnIndexOfReconciled = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reconciled");
            int _columnIndexOfReconciled2 = _columnIndexOfReconciled;
            int _columnIndexOfConfirmed2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Orig_Cashier");
            int _columnIndexOfCancelled = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cancelled");
            int _columnIndexOfCancelled2 = _columnIndexOfCancelled;
            int _columnIndexOfCancelled3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cancelled_By");
            int _columnIndexOfCancelledDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cancelled_Date");
            int _columnIndexOfCancelledDate2 = _columnIndexOfCancelledDate;
            int _columnIndexOfCancelledTime = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cancelled_Time");
            int _columnIndexOfCancelledTime2 = _columnIndexOfCancelledTime;
            int _columnIndexOfPostDated = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Post_Dated");
            int _columnIndexOfPostDated2 = _columnIndexOfPostDated;
            int _columnIndexOfChequeRetrieved = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Retrieved");
            int _columnIndexOfChequeRetrieved2 = _columnIndexOfChequeRetrieved;
            int _columnIndexOfRegisterNumber = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Register_Number");
            int _columnIndexOfRegisterNumber2 = _columnIndexOfRegisterNumber;
            int _columnIndexOfFromEntryNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "From_Entry_No");
            int _columnIndexOfFromEntryNo2 = _columnIndexOfFromEntryNo;
            int _columnIndexOfToEntryNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "To_Entry_No");
            int _columnIndexOfRegisterNumber3 = _columnIndexOfToEntryNo;
            int _columnIndexOfBatchPostedUserID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Batch_Posted_UserID");
            int _columnIndexOfFromEntryNo3 = _columnIndexOfBatchPostedUserID;
            int _columnIndexOfBDRegisterNumber = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "BD_Register_Number");
            int _columnIndexOfToEntryNo2 = _columnIndexOfBDRegisterNumber;
            int _columnIndexOfBDFromNumber = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "BD_From_Number");
            int _columnIndexOfBatchPostedUserID2 = _columnIndexOfBDFromNumber;
            int _columnIndexOfBDRegisterNumber2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "BD_To_Number");
            int _columnIndexOfReversalBy = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversal_By");
            int _columnIndexOfReversalBy2 = _columnIndexOfReversalBy;
            int _columnIndexOfReversalDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversal_Date");
            int _columnIndexOfPostDated3 = _columnIndexOfReversalDate;
            int _columnIndexOfReversalTime = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversal_Time");
            int _columnIndexOfReversalTime2 = _columnIndexOfReversalTime;
            int _columnIndexOfReversalRegisterNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversal_Register_No");
            int _columnIndexOfBDFromNumber2 = _columnIndexOfReversalRegisterNo;
            int _columnIndexOfReversalFromEntryNo2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversal_From_Entry_No");
            int _columnIndexOfReversalBy3 = _columnIndexOfReversalFromEntryNo2;
            int _columnIndexOfReversalToEntryNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversal_To_Entry_No");
            int _columnIndexOfReversalDate2 = _columnIndexOfReversalToEntryNo;
            int _columnIndexOfReversed2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reversed");
            int _columnIndexOfReversalToEntryNo2 = _columnIndexOfReversed2;
            int _columnIndexOfAppliesToDocNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Applies_to_Doc_No");
            int _columnIndexOfReversalRegisterNo2 = _columnIndexOfAppliesToDocNo;
            int _columnIndexOfAppliesToID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Applies_to_ID");
            int _columnIndexOfAppliesToID2 = _columnIndexOfAppliesToID;
            int _columnIndexOfAppliesToID3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Grant_No");
            int _columnIndexOfInstallmentNumber = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Installment_Number");
            int _columnIndexOfAppliesToDocNo2 = _columnIndexOfInstallmentNumber;
            int _columnIndexOfNextInstallmentDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Next_Installment_Date");
            int _columnIndexOfInstallmentNumber2 = _columnIndexOfNextInstallmentDate;
            int _columnIndexOfDimensionSetID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dimension_Set_ID");
            int _columnIndexOfNextInstallmentDate2 = _columnIndexOfDimensionSetID;
            int _columnIndexOfDonor = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Donor");
            int _columnIndexOfDimensionSetID2 = _columnIndexOfDonor;
            int _columnIndexOfGroupCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Group_Code");
            int _columnIndexOfDonor2 = _columnIndexOfGroupCode;
            int _columnIndexOfPreADMFines = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Pre_ADM_Fines");
            int _columnIndexOfPreADMFines2 = _columnIndexOfPreADMFines;
            int _columnIndexOfMedFines = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Med_Fines");
            int _columnIndexOfMedFines2 = _columnIndexOfMedFines;
            int _columnIndexOfLoanNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Loan_No");
            int _columnIndexOfLoanNo2 = _columnIndexOfLoanNo;
            int _columnIndexOfGroupCode2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Penalty");
            int _columnIndexOfSent = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "sent");
            List<transaction> _result = new ArrayList<>();
            while (_stmt.step()) {
                transaction _item2 = new transaction();
                int _columnIndexOfSent2 = _columnIndexOfSent;
                if (_stmt.isNull(_columnIndexOfKey)) {
                    _item = _item2;
                    _item.Key = null;
                } else {
                    _item = _item2;
                    _item.Key = _stmt.getText(_columnIndexOfKey);
                }
                int _columnIndexOfReceivedFrom2 = _columnIndexOfReceivedFrom;
                int _columnIndexOfOnBehalfOf2 = _columnIndexOfOnBehalfOf;
                _item.Entry_No = (int) _stmt.getLong(_tmp_21);
                if (_stmt.isNull(_columnIndexOfNo)) {
                    _item.No = null;
                } else {
                    _item.No = _stmt.getText(_columnIndexOfNo);
                }
                if (_stmt.isNull(_columnIndexOfReversed)) {
                    _tmp = null;
                } else {
                    _tmp = Long.valueOf(_stmt.getLong(_columnIndexOfReversed));
                }
                _item.Date = Converters.DateConverter.toDate(_tmp);
                if (_stmt.isNull(_columnIndexOfReversalFromEntryNo)) {
                    _item.Type = null;
                } else {
                    _item.Type = _stmt.getText(_columnIndexOfReversalFromEntryNo);
                }
                if (_stmt.isNull(_columnIndexOfTranstype)) {
                    _item.transtype = null;
                } else {
                    _item.transtype = _stmt.getText(_columnIndexOfTranstype);
                }
                if (_stmt.isNull(_columnIndexOfPayMode)) {
                    _item.PayMode = null;
                } else {
                    _item.PayMode = _stmt.getText(_columnIndexOfPayMode);
                }
                if (_stmt.isNull(_columnIndexOfPayMode_1)) {
                    _item.Pay_Mode = null;
                } else {
                    _item.Pay_Mode = _stmt.getText(_columnIndexOfPayMode_1);
                }
                if (_stmt.isNull(_columnIndexOfChequeDepositSlipNo)) {
                    _item.Cheque_Deposit_Slip_No = null;
                } else {
                    _item.Cheque_Deposit_Slip_No = _stmt.getText(_columnIndexOfChequeDepositSlipNo);
                }
                if (_stmt.isNull(_columnIndexOfChequeDepositSlipDate)) {
                    _tmp_1 = null;
                } else {
                    _tmp_1 = Long.valueOf(_stmt.getLong(_columnIndexOfChequeDepositSlipDate));
                }
                _item.Cheque_Deposit_Slip_Date = Converters.DateConverter.toDate(_tmp_1);
                if (_stmt.isNull(_columnIndexOfBankCode)) {
                    _item.Bank_Code = null;
                } else {
                    _item.Bank_Code = _stmt.getText(_columnIndexOfBankCode);
                }
                if (_stmt.isNull(_columnIndexOfReceivedFrom2)) {
                    _item.Received_From = null;
                } else {
                    _item.Received_From = _stmt.getText(_columnIndexOfReceivedFrom2);
                }
                if (_stmt.isNull(_columnIndexOfOnBehalfOf2)) {
                    _item.On_Behalf_Of = null;
                } else {
                    _item.On_Behalf_Of = _stmt.getText(_columnIndexOfOnBehalfOf2);
                }
                int _columnIndexOfCashier3 = _columnIndexOfCashier;
                if (_stmt.isNull(_columnIndexOfCashier3)) {
                    _item.Cashier = null;
                } else {
                    _item.Cashier = _stmt.getText(_columnIndexOfCashier3);
                }
                int _columnIndexOfAccountNo3 = _columnIndexOfCashier2;
                if (_stmt.isNull(_columnIndexOfAccountNo3)) {
                    _item.Account_No = null;
                } else {
                    _item.Account_No = _stmt.getText(_columnIndexOfAccountNo3);
                }
                int _columnIndexOfAccountName = _columnIndexOfAccountNo2;
                if (_stmt.isNull(_columnIndexOfAccountName)) {
                    _item.Account_Name = null;
                } else {
                    _item.Account_Name = _stmt.getText(_columnIndexOfAccountName);
                }
                int _columnIndexOfPosted3 = _columnIndexOfNo2;
                Integer _tmp_2 = _stmt.isNull(_columnIndexOfPosted3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfPosted3));
                if (_tmp_2 == null) {
                    boolValueOf = null;
                } else {
                    boolValueOf = Boolean.valueOf(_tmp_2.intValue() != 0);
                }
                _item.Posted = boolValueOf;
                int _columnIndexOfDatePosted4 = _columnIndexOfDatePosted2;
                if (_stmt.isNull(_columnIndexOfDatePosted4)) {
                    _tmp_3 = null;
                } else {
                    _tmp_3 = Long.valueOf(_stmt.getLong(_columnIndexOfDatePosted4));
                }
                _item.Date_Posted = Converters.DateConverter.toDate(_tmp_3);
                int _columnIndexOfTimePosted3 = _columnIndexOfTimePosted2;
                if (_stmt.isNull(_columnIndexOfTimePosted3)) {
                    _tmp_4 = null;
                } else {
                    _tmp_4 = Long.valueOf(_stmt.getLong(_columnIndexOfTimePosted3));
                }
                _item.Time_Posted = Converters.DateConverter.toDate(_tmp_4);
                int _columnIndexOfPostedBy3 = _columnIndexOfPosted2;
                if (_stmt.isNull(_columnIndexOfPostedBy3)) {
                    _item.Posted_By = null;
                } else {
                    _item.Posted_By = _stmt.getText(_columnIndexOfPostedBy3);
                }
                int _columnIndexOfAmount3 = _columnIndexOfPostedBy2;
                if (_stmt.isNull(_columnIndexOfAmount3)) {
                    _item.Amount = null;
                } else {
                    _item.Amount = Double.valueOf(_stmt.getDouble(_columnIndexOfAmount3));
                }
                int _columnIndexOfRemarks3 = _columnIndexOfAmount2;
                if (_stmt.isNull(_columnIndexOfRemarks3)) {
                    _item.Remarks = null;
                } else {
                    _item.Remarks = _stmt.getText(_columnIndexOfRemarks3);
                }
                int _columnIndexOfTransactionName3 = _columnIndexOfRemarks2;
                if (_stmt.isNull(_columnIndexOfTransactionName3)) {
                    _item.Transaction_Name = null;
                } else {
                    _item.Transaction_Name = _stmt.getText(_columnIndexOfTransactionName3);
                }
                int _columnIndexOfBranchCode3 = _columnIndexOfTransactionName2;
                if (_stmt.isNull(_columnIndexOfBranchCode3)) {
                    _item.Branch_Code = null;
                } else {
                    _item.Branch_Code = _stmt.getText(_columnIndexOfBranchCode3);
                }
                int _columnIndexOfAgentCode3 = _columnIndexOfBranchCode2;
                if (_stmt.isNull(_columnIndexOfAgentCode3)) {
                    _item.Agent_Code = null;
                } else {
                    _item.Agent_Code = _stmt.getText(_columnIndexOfAgentCode3);
                }
                int _columnIndexOfGrouping3 = _columnIndexOfAgentCode2;
                if (_stmt.isNull(_columnIndexOfGrouping3)) {
                    _item.Grouping = null;
                } else {
                    _item.Grouping = _stmt.getText(_columnIndexOfGrouping3);
                }
                int _columnIndexOfGlobalDimension1Code3 = _columnIndexOfGrouping2;
                if (_stmt.isNull(_columnIndexOfGlobalDimension1Code3)) {
                    _item.Global_Dimension_1_Code = null;
                } else {
                    _item.Global_Dimension_1_Code = _stmt.getText(_columnIndexOfGlobalDimension1Code3);
                }
                int _columnIndexOfShortcutDimension2Code3 = _columnIndexOfGlobalDimension1Code2;
                if (_stmt.isNull(_columnIndexOfShortcutDimension2Code3)) {
                    _item.Shortcut_Dimension_2_Code = null;
                } else {
                    _item.Shortcut_Dimension_2_Code = _stmt.getText(_columnIndexOfShortcutDimension2Code3);
                }
                int _columnIndexOfVATPercent3 = _columnIndexOfShortcutDimension2Code2;
                if (_stmt.isNull(_columnIndexOfVATPercent3)) {
                    _item.VAT_Percent = null;
                } else {
                    _item.VAT_Percent = Double.valueOf(_stmt.getDouble(_columnIndexOfVATPercent3));
                }
                int _columnIndexOfCurrencyCode3 = _columnIndexOfVATPercent2;
                if (_stmt.isNull(_columnIndexOfCurrencyCode3)) {
                    _item.Currency_Code = null;
                } else {
                    _item.Currency_Code = _stmt.getText(_columnIndexOfCurrencyCode3);
                }
                int _columnIndexOfCurrencyFactor3 = _columnIndexOfCurrencyCode2;
                if (_stmt.isNull(_columnIndexOfCurrencyFactor3)) {
                    _item.Currency_Factor = null;
                } else {
                    _item.Currency_Factor = Double.valueOf(_stmt.getDouble(_columnIndexOfCurrencyFactor3));
                }
                int _columnIndexOfVATBusPostingGroup3 = _columnIndexOfCurrencyFactor2;
                if (_stmt.isNull(_columnIndexOfVATBusPostingGroup3)) {
                    _item.VAT_Bus_Posting_Group = null;
                } else {
                    _item.VAT_Bus_Posting_Group = _stmt.getText(_columnIndexOfVATBusPostingGroup3);
                }
                int _columnIndexOfVATProdPostingGroup = _columnIndexOfVATBusPostingGroup2;
                if (_stmt.isNull(_columnIndexOfVATProdPostingGroup)) {
                    _item.VAT_Prod_Posting_Group = null;
                } else {
                    _item.VAT_Prod_Posting_Group = _stmt.getText(_columnIndexOfVATProdPostingGroup);
                }
                int _columnIndexOfGenPostingTypeSpecified4 = _columnIndexOfGenPostingTypeSpecified2;
                Integer _tmp_5 = _stmt.isNull(_columnIndexOfGenPostingTypeSpecified4) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfGenPostingTypeSpecified4));
                if (_tmp_5 == null) {
                    boolValueOf2 = null;
                } else {
                    boolValueOf2 = Boolean.valueOf(_tmp_5.intValue() != 0);
                }
                _item.Gen_Posting_TypeSpecified = boolValueOf2;
                int _columnIndexOfGenBusPostingGroup3 = _columnIndexOfGenPostingTypeSpecified3;
                if (_stmt.isNull(_columnIndexOfGenBusPostingGroup3)) {
                    _item.Gen_Bus_Posting_Group = null;
                } else {
                    _item.Gen_Bus_Posting_Group = _stmt.getText(_columnIndexOfGenBusPostingGroup3);
                }
                int _columnIndexOfGenProdPostingGroup4 = _columnIndexOfGenProdPostingGroup2;
                if (_stmt.isNull(_columnIndexOfGenProdPostingGroup4)) {
                    _item.Gen_Prod_Posting_Group = null;
                } else {
                    _item.Gen_Prod_Posting_Group = _stmt.getText(_columnIndexOfGenProdPostingGroup4);
                }
                int _columnIndexOfVATAmount3 = _columnIndexOfGenProdPostingGroup3;
                if (_stmt.isNull(_columnIndexOfVATAmount3)) {
                    _item.VAT_Amount = null;
                } else {
                    _item.VAT_Amount = Double.valueOf(_stmt.getDouble(_columnIndexOfVATAmount3));
                }
                int _columnIndexOfTotalAmount3 = _columnIndexOfVATAmount2;
                if (_stmt.isNull(_columnIndexOfTotalAmount3)) {
                    _item.Total_Amount = null;
                } else {
                    _item.Total_Amount = Double.valueOf(_stmt.getDouble(_columnIndexOfTotalAmount3));
                }
                int _columnIndexOfUserID3 = _columnIndexOfTotalAmount2;
                if (_stmt.isNull(_columnIndexOfUserID3)) {
                    _item.User_ID = null;
                } else {
                    _item.User_ID = _stmt.getText(_columnIndexOfUserID3);
                }
                int _columnIndexOfApplyTo3 = _columnIndexOfUserID2;
                if (_stmt.isNull(_columnIndexOfApplyTo3)) {
                    _item.Apply_to = null;
                } else {
                    _item.Apply_to = _stmt.getText(_columnIndexOfApplyTo3);
                }
                int _columnIndexOfApplyToID3 = _columnIndexOfApplyTo2;
                if (_stmt.isNull(_columnIndexOfApplyToID3)) {
                    _item.Apply_to_ID = null;
                } else {
                    _item.Apply_to_ID = _stmt.getText(_columnIndexOfApplyToID3);
                }
                int _columnIndexOfDestGlobalDimension1Code3 = _columnIndexOfApplyToID2;
                if (_stmt.isNull(_columnIndexOfDestGlobalDimension1Code3)) {
                    _item.Dest_Global_Dimension_1_Code = null;
                } else {
                    _item.Dest_Global_Dimension_1_Code = _stmt.getText(_columnIndexOfDestGlobalDimension1Code3);
                }
                int _columnIndexOfDestShortcutDimension2Code = _columnIndexOfDestGlobalDimension1Code2;
                if (_stmt.isNull(_columnIndexOfDestShortcutDimension2Code)) {
                    _item.Dest_Shortcut_Dimension_2_Code = null;
                } else {
                    _item.Dest_Shortcut_Dimension_2_Code = _stmt.getText(_columnIndexOfDestShortcutDimension2Code);
                }
                int _columnIndexOfLineNo3 = _columnIndexOfGenBusPostingGroup2;
                _item.Line_No = (int) _stmt.getLong(_columnIndexOfLineNo3);
                int _columnIndexOfPrintNo3 = _columnIndexOfDatePosted3;
                _item.Print_No = (int) _stmt.getLong(_columnIndexOfPrintNo3);
                int _columnIndexOfDepositSlipTime3 = _columnIndexOfLineNo2;
                if (_stmt.isNull(_columnIndexOfDepositSlipTime3)) {
                    _tmp_6 = null;
                } else {
                    _tmp_6 = Long.valueOf(_stmt.getLong(_columnIndexOfDepositSlipTime3));
                }
                _item.Deposit_Slip_Time = Converters.DateConverter.toDate(_tmp_6);
                int _columnIndexOfTellerID3 = _columnIndexOfPrintNo2;
                if (_stmt.isNull(_columnIndexOfTellerID3)) {
                    _item.Teller_ID = null;
                } else {
                    _item.Teller_ID = _stmt.getText(_columnIndexOfTellerID3);
                }
                int _columnIndexOfCustomerPaymentOnAccount3 = _columnIndexOfDepositSlipTime2;
                Integer _tmp_7 = _stmt.isNull(_columnIndexOfCustomerPaymentOnAccount3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfCustomerPaymentOnAccount3));
                if (_tmp_7 == null) {
                    boolValueOf3 = null;
                } else {
                    boolValueOf3 = Boolean.valueOf(_tmp_7.intValue() != 0);
                }
                _item.Customer_Payment_On_Account = boolValueOf3;
                int _columnIndexOfSelect = _columnIndexOfCustomerPaymentOnAccount2;
                Integer _tmp_8 = _stmt.isNull(_columnIndexOfSelect) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfSelect));
                if (_tmp_8 == null) {
                    boolValueOf4 = null;
                } else {
                    boolValueOf4 = Boolean.valueOf(_tmp_8.intValue() != 0);
                }
                _item.Select = boolValueOf4;
                int _columnIndexOfBatchPosted3 = _columnIndexOfType;
                Integer _tmp_9 = _stmt.isNull(_columnIndexOfBatchPosted3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfBatchPosted3));
                if (_tmp_9 == null) {
                    boolValueOf5 = null;
                } else {
                    boolValueOf5 = Boolean.valueOf(_tmp_9.intValue() != 0);
                }
                _item.Batch_Posted = boolValueOf5;
                int _columnIndexOfTransactionNo = _columnIndexOfTellerID2;
                if (_stmt.isNull(_columnIndexOfTransactionNo)) {
                    _item.Transaction_No = null;
                } else {
                    _item.Transaction_No = _stmt.getText(_columnIndexOfTransactionNo);
                }
                int _columnIndexOfChequeDepositSlipBank4 = _columnIndexOfChequeDepositSlipBank2;
                if (_stmt.isNull(_columnIndexOfChequeDepositSlipBank4)) {
                    _item.Cheque_Deposit_Slip_Bank = null;
                } else {
                    _item.Cheque_Deposit_Slip_Bank = _stmt.getText(_columnIndexOfChequeDepositSlipBank4);
                }
                int _columnIndexOfBankAccount = _columnIndexOfChequeDepositSlipBank3;
                if (_stmt.isNull(_columnIndexOfBankAccount)) {
                    _item.Bank_Account = null;
                } else {
                    _item.Bank_Account = _stmt.getText(_columnIndexOfBankAccount);
                }
                int _columnIndexOfConfirmed3 = _columnIndexOfBatchPosted2;
                Integer _tmp_10 = _stmt.isNull(_columnIndexOfConfirmed3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfConfirmed3));
                if (_tmp_10 == null) {
                    boolValueOf6 = null;
                } else {
                    boolValueOf6 = Boolean.valueOf(_tmp_10.intValue() != 0);
                }
                _item.Confirmed = boolValueOf6;
                int _columnIndexOfReconciled3 = _columnIndexOfReconciled2;
                Integer _tmp_11 = _stmt.isNull(_columnIndexOfReconciled3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfReconciled3));
                if (_tmp_11 == null) {
                    boolValueOf7 = null;
                } else {
                    boolValueOf7 = Boolean.valueOf(_tmp_11.intValue() != 0);
                }
                _item.Reconciled = boolValueOf7;
                int _columnIndexOfOrigCashier = _columnIndexOfConfirmed2;
                if (_stmt.isNull(_columnIndexOfOrigCashier)) {
                    _item.Orig_Cashier = null;
                } else {
                    _item.Orig_Cashier = _stmt.getText(_columnIndexOfOrigCashier);
                }
                int _columnIndexOfCancelled4 = _columnIndexOfCancelled2;
                Integer _tmp_12 = _stmt.isNull(_columnIndexOfCancelled4) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfCancelled4));
                if (_tmp_12 == null) {
                    boolValueOf8 = null;
                } else {
                    boolValueOf8 = Boolean.valueOf(_tmp_12.intValue() != 0);
                }
                _item.Cancelled = boolValueOf8;
                int _columnIndexOfCancelledBy = _columnIndexOfCancelled3;
                if (_stmt.isNull(_columnIndexOfCancelledBy)) {
                    _item.Cancelled_By = null;
                } else {
                    _item.Cancelled_By = _stmt.getText(_columnIndexOfCancelledBy);
                }
                int _columnIndexOfCancelledDate3 = _columnIndexOfCancelledDate2;
                if (_stmt.isNull(_columnIndexOfCancelledDate3)) {
                    _tmp_13 = null;
                } else {
                    _tmp_13 = Long.valueOf(_stmt.getLong(_columnIndexOfCancelledDate3));
                }
                _item.Cancelled_Date = Converters.DateConverter.toDate(_tmp_13);
                int _columnIndexOfCancelledTime3 = _columnIndexOfCancelledTime2;
                if (_stmt.isNull(_columnIndexOfCancelledTime3)) {
                    _tmp_14 = null;
                } else {
                    _tmp_14 = Long.valueOf(_stmt.getLong(_columnIndexOfCancelledTime3));
                }
                _item.Cancelled_Time = Converters.DateConverter.toDate(_tmp_14);
                int _columnIndexOfPostDated4 = _columnIndexOfPostDated2;
                Integer _tmp_15 = _stmt.isNull(_columnIndexOfPostDated4) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfPostDated4));
                if (_tmp_15 == null) {
                    boolValueOf9 = null;
                } else {
                    boolValueOf9 = Boolean.valueOf(_tmp_15.intValue() != 0);
                }
                _item.Post_Dated = boolValueOf9;
                int _columnIndexOfChequeRetrieved3 = _columnIndexOfChequeRetrieved2;
                Integer _tmp_16 = _stmt.isNull(_columnIndexOfChequeRetrieved3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfChequeRetrieved3));
                if (_tmp_16 == null) {
                    boolValueOf10 = null;
                } else {
                    boolValueOf10 = Boolean.valueOf(_tmp_16.intValue() != 0);
                }
                _item.Cheque_Retrieved = boolValueOf10;
                int _columnIndexOfRegisterNumber4 = _columnIndexOfRegisterNumber2;
                _item.Register_Number = (int) _stmt.getLong(_columnIndexOfRegisterNumber4);
                int _columnIndexOfFromEntryNo4 = _columnIndexOfFromEntryNo2;
                _item.From_Entry_No = (int) _stmt.getLong(_columnIndexOfFromEntryNo4);
                int _columnIndexOfToEntryNo3 = _columnIndexOfRegisterNumber3;
                _item.To_Entry_No = (int) _stmt.getLong(_columnIndexOfToEntryNo3);
                int _columnIndexOfBatchPostedUserID3 = _columnIndexOfFromEntryNo3;
                if (_stmt.isNull(_columnIndexOfBatchPostedUserID3)) {
                    _item.Batch_Posted_UserID = null;
                } else {
                    _item.Batch_Posted_UserID = _stmt.getText(_columnIndexOfBatchPostedUserID3);
                }
                int _columnIndexOfBDRegisterNumber3 = _columnIndexOfToEntryNo2;
                _item.BD_Register_Number = (int) _stmt.getLong(_columnIndexOfBDRegisterNumber3);
                int _columnIndexOfBDFromNumber3 = _columnIndexOfBatchPostedUserID2;
                _item.BD_From_Number = (int) _stmt.getLong(_columnIndexOfBDFromNumber3);
                int _columnIndexOfBDToNumber = _columnIndexOfBDRegisterNumber2;
                _item.BD_To_Number = (int) _stmt.getLong(_columnIndexOfBDToNumber);
                int _columnIndexOfReversalBy4 = _columnIndexOfReversalBy2;
                if (_stmt.isNull(_columnIndexOfReversalBy4)) {
                    _item.Reversal_By = null;
                } else {
                    _item.Reversal_By = _stmt.getText(_columnIndexOfReversalBy4);
                }
                int _columnIndexOfReversalDate3 = _columnIndexOfPostDated3;
                if (_stmt.isNull(_columnIndexOfReversalDate3)) {
                    _tmp_17 = null;
                } else {
                    _tmp_17 = Long.valueOf(_stmt.getLong(_columnIndexOfReversalDate3));
                }
                _item.Reversal_Date = Converters.DateConverter.toDate(_tmp_17);
                int _columnIndexOfReversalTime3 = _columnIndexOfReversalTime2;
                if (_stmt.isNull(_columnIndexOfReversalTime3)) {
                    _tmp_18 = null;
                } else {
                    _tmp_18 = Long.valueOf(_stmt.getLong(_columnIndexOfReversalTime3));
                }
                _item.Reversal_Time = Converters.DateConverter.toDate(_tmp_18);
                int _columnIndexOfReversalRegisterNo3 = _columnIndexOfBDFromNumber2;
                _item.Reversal_Register_No = (int) _stmt.getLong(_columnIndexOfReversalRegisterNo3);
                int _columnIndexOfReversalFromEntryNo3 = _columnIndexOfReversalBy3;
                _item.Reversal_From_Entry_No = (int) _stmt.getLong(_columnIndexOfReversalFromEntryNo3);
                int _columnIndexOfReversalToEntryNo3 = _columnIndexOfReversalDate2;
                _item.Reversal_To_Entry_No = (int) _stmt.getLong(_columnIndexOfReversalToEntryNo3);
                int _columnIndexOfReversed3 = _columnIndexOfReversalToEntryNo2;
                Integer _tmp_19 = _stmt.isNull(_columnIndexOfReversed3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfReversed3));
                if (_tmp_19 == null) {
                    boolValueOf11 = null;
                } else {
                    boolValueOf11 = Boolean.valueOf(_tmp_19.intValue() != 0);
                }
                _item.Reversed = boolValueOf11;
                int _columnIndexOfAppliesToDocNo3 = _columnIndexOfReversalRegisterNo2;
                if (_stmt.isNull(_columnIndexOfAppliesToDocNo3)) {
                    _item.Applies_to_Doc_No = null;
                } else {
                    _item.Applies_to_Doc_No = _stmt.getText(_columnIndexOfAppliesToDocNo3);
                }
                int _columnIndexOfAppliesToID4 = _columnIndexOfAppliesToID2;
                if (_stmt.isNull(_columnIndexOfAppliesToID4)) {
                    _item.Applies_to_ID = null;
                } else {
                    _item.Applies_to_ID = _stmt.getText(_columnIndexOfAppliesToID4);
                }
                int _columnIndexOfGrantNo = _columnIndexOfAppliesToID3;
                if (_stmt.isNull(_columnIndexOfGrantNo)) {
                    _item.Grant_No = null;
                } else {
                    _item.Grant_No = _stmt.getText(_columnIndexOfGrantNo);
                }
                int _columnIndexOfInstallmentNumber3 = _columnIndexOfAppliesToDocNo2;
                _item.Installment_Number = (int) _stmt.getLong(_columnIndexOfInstallmentNumber3);
                int _columnIndexOfNextInstallmentDate3 = _columnIndexOfInstallmentNumber2;
                if (_stmt.isNull(_columnIndexOfNextInstallmentDate3)) {
                    _tmp_20 = null;
                } else {
                    _tmp_20 = Long.valueOf(_stmt.getLong(_columnIndexOfNextInstallmentDate3));
                }
                _item.Next_Installment_Date = Converters.DateConverter.toDate(_tmp_20);
                int _columnIndexOfDimensionSetID3 = _columnIndexOfNextInstallmentDate2;
                _item.Dimension_Set_ID = (int) _stmt.getLong(_columnIndexOfDimensionSetID3);
                int _columnIndexOfDonor3 = _columnIndexOfDimensionSetID2;
                if (_stmt.isNull(_columnIndexOfDonor3)) {
                    _item.Donor = null;
                } else {
                    _item.Donor = _stmt.getText(_columnIndexOfDonor3);
                }
                int _columnIndexOfGroupCode3 = _columnIndexOfDonor2;
                if (_stmt.isNull(_columnIndexOfGroupCode3)) {
                    _item.Group_Code = null;
                } else {
                    _item.Group_Code = _stmt.getText(_columnIndexOfGroupCode3);
                }
                _columnIndexOfPreADMFines2 = _columnIndexOfPreADMFines2;
                if (_stmt.isNull(_columnIndexOfPreADMFines2)) {
                    _item.Pre_ADM_Fines = null;
                } else {
                    _item.Pre_ADM_Fines = Double.valueOf(_stmt.getDouble(_columnIndexOfPreADMFines2));
                }
                _columnIndexOfMedFines2 = _columnIndexOfMedFines2;
                if (_stmt.isNull(_columnIndexOfMedFines2)) {
                    _item.Med_Fines = null;
                } else {
                    _item.Med_Fines = Double.valueOf(_stmt.getDouble(_columnIndexOfMedFines2));
                }
                _columnIndexOfLoanNo2 = _columnIndexOfLoanNo2;
                if (_stmt.isNull(_columnIndexOfLoanNo2)) {
                    _item.Loan_No = null;
                } else {
                    _item.Loan_No = _stmt.getText(_columnIndexOfLoanNo2);
                }
                int _columnIndexOfPenalty = _columnIndexOfGroupCode2;
                if (_stmt.isNull(_columnIndexOfPenalty)) {
                    _item.Penalty = null;
                } else {
                    _item.Penalty = Double.valueOf(_stmt.getDouble(_columnIndexOfPenalty));
                }
                _columnIndexOfSent = _columnIndexOfSent2;
                int _tmp_22 = (int) _stmt.getLong(_columnIndexOfSent);
                _item.sent = _tmp_22 != 0;
                List<transaction> _result2 = _result;
                _result2.add(_item);
                _result = _result2;
                _columnIndexOfCashier = _columnIndexOfCashier3;
                _columnIndexOfCashier2 = _columnIndexOfAccountNo3;
                _columnIndexOfNo = _columnIndexOfNo;
                _columnIndexOfNo2 = _columnIndexOfPosted3;
                _columnIndexOfPosted2 = _columnIndexOfPostedBy3;
                _columnIndexOfPostedBy2 = _columnIndexOfAmount3;
                _columnIndexOfAmount2 = _columnIndexOfRemarks3;
                _columnIndexOfRemarks2 = _columnIndexOfTransactionName3;
                _columnIndexOfTransactionName2 = _columnIndexOfBranchCode3;
                _columnIndexOfBranchCode2 = _columnIndexOfAgentCode3;
                _columnIndexOfAgentCode2 = _columnIndexOfGrouping3;
                _columnIndexOfGrouping2 = _columnIndexOfGlobalDimension1Code3;
                _columnIndexOfGlobalDimension1Code2 = _columnIndexOfShortcutDimension2Code3;
                _columnIndexOfShortcutDimension2Code2 = _columnIndexOfVATPercent3;
                _columnIndexOfVATPercent2 = _columnIndexOfCurrencyCode3;
                _columnIndexOfCurrencyCode2 = _columnIndexOfCurrencyFactor3;
                _columnIndexOfCurrencyFactor2 = _columnIndexOfVATBusPostingGroup3;
                _columnIndexOfGenPostingTypeSpecified2 = _columnIndexOfGenPostingTypeSpecified4;
                _columnIndexOfGenProdPostingGroup2 = _columnIndexOfGenProdPostingGroup4;
                _columnIndexOfGenProdPostingGroup3 = _columnIndexOfVATAmount3;
                _columnIndexOfVATAmount2 = _columnIndexOfTotalAmount3;
                _columnIndexOfTotalAmount2 = _columnIndexOfUserID3;
                _columnIndexOfUserID2 = _columnIndexOfApplyTo3;
                _columnIndexOfApplyTo2 = _columnIndexOfApplyToID3;
                _columnIndexOfApplyToID2 = _columnIndexOfDestGlobalDimension1Code3;
                _columnIndexOfGenPostingTypeSpecified3 = _columnIndexOfGenBusPostingGroup3;
                _columnIndexOfDatePosted2 = _columnIndexOfDatePosted4;
                _columnIndexOfGenBusPostingGroup2 = _columnIndexOfLineNo3;
                _columnIndexOfDatePosted3 = _columnIndexOfPrintNo3;
                _columnIndexOfLineNo2 = _columnIndexOfDepositSlipTime3;
                _columnIndexOfDepositSlipTime2 = _columnIndexOfCustomerPaymentOnAccount3;
                _columnIndexOfPrintNo2 = _columnIndexOfTellerID3;
                _columnIndexOfChequeDepositSlipBank2 = _columnIndexOfChequeDepositSlipBank4;
                _columnIndexOfCancelled2 = _columnIndexOfCancelled4;
                _columnIndexOfRegisterNumber2 = _columnIndexOfRegisterNumber4;
                _columnIndexOfFromEntryNo2 = _columnIndexOfFromEntryNo4;
                _columnIndexOfRegisterNumber3 = _columnIndexOfToEntryNo3;
                _columnIndexOfFromEntryNo3 = _columnIndexOfBatchPostedUserID3;
                _columnIndexOfToEntryNo2 = _columnIndexOfBDRegisterNumber3;
                _columnIndexOfPostDated2 = _columnIndexOfPostDated4;
                _columnIndexOfBatchPostedUserID2 = _columnIndexOfBDFromNumber3;
                _columnIndexOfReversalBy2 = _columnIndexOfReversalBy4;
                _columnIndexOfPostDated3 = _columnIndexOfReversalDate3;
                _columnIndexOfReversalDate2 = _columnIndexOfReversalToEntryNo3;
                _columnIndexOfBDFromNumber2 = _columnIndexOfReversalRegisterNo3;
                _columnIndexOfAppliesToID2 = _columnIndexOfAppliesToID4;
                _columnIndexOfReversalRegisterNo2 = _columnIndexOfAppliesToDocNo3;
                _columnIndexOfAppliesToDocNo2 = _columnIndexOfInstallmentNumber3;
                _columnIndexOfInstallmentNumber2 = _columnIndexOfNextInstallmentDate3;
                _columnIndexOfNextInstallmentDate2 = _columnIndexOfDimensionSetID3;
                _columnIndexOfDimensionSetID2 = _columnIndexOfDonor3;
                _columnIndexOfDonor2 = _columnIndexOfGroupCode3;
                _columnIndexOfOnBehalfOf = _columnIndexOfOnBehalfOf2;
                _columnIndexOfGroupCode2 = _columnIndexOfPenalty;
                _columnIndexOfReceivedFrom = _columnIndexOfReceivedFrom2;
                _tmp_21 = _tmp_21;
                _columnIndexOfAccountNo2 = _columnIndexOfAccountName;
                _columnIndexOfTimePosted2 = _columnIndexOfTimePosted3;
                _columnIndexOfVATBusPostingGroup2 = _columnIndexOfVATProdPostingGroup;
                _columnIndexOfDestGlobalDimension1Code2 = _columnIndexOfDestShortcutDimension2Code;
                _columnIndexOfCustomerPaymentOnAccount2 = _columnIndexOfSelect;
                _columnIndexOfChequeDepositSlipBank3 = _columnIndexOfBankAccount;
                _columnIndexOfTellerID2 = _columnIndexOfTransactionNo;
                _columnIndexOfReconciled2 = _columnIndexOfReconciled3;
                _columnIndexOfCancelledDate2 = _columnIndexOfCancelledDate3;
                _columnIndexOfCancelledTime2 = _columnIndexOfCancelledTime3;
                _columnIndexOfCancelled3 = _columnIndexOfCancelledBy;
                _columnIndexOfChequeRetrieved2 = _columnIndexOfChequeRetrieved3;
                _columnIndexOfReversalTime2 = _columnIndexOfReversalTime3;
                _columnIndexOfBDRegisterNumber2 = _columnIndexOfBDToNumber;
                _columnIndexOfAppliesToID3 = _columnIndexOfGrantNo;
                _columnIndexOfReversalToEntryNo2 = _columnIndexOfReversed3;
                _columnIndexOfReversalBy3 = _columnIndexOfReversalFromEntryNo3;
                _columnIndexOfReversalFromEntryNo = _columnIndexOfReversalFromEntryNo;
                _columnIndexOfType = _columnIndexOfBatchPosted3;
                _columnIndexOfBatchPosted2 = _columnIndexOfConfirmed3;
                _columnIndexOfReversed = _columnIndexOfReversed;
                _columnIndexOfConfirmed2 = _columnIndexOfOrigCashier;
            }
            return _result;
        } finally {
            _stmt.close();
        }
    }

    public static List<Class<?>> getRequiredConverters() {
        return Collections.emptyList();
    }
}
