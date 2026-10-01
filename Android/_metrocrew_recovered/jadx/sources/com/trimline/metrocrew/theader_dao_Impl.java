package com.trimline.metrocrew;

import androidx.collection.ArrayMap;
import androidx.lifecycle.LiveData;
import androidx.room.EntityDeleteOrUpdateAdapter;
import androidx.room.EntityInsertAdapter;
import androidx.room.RoomDatabase;
import androidx.room.util.DBUtil;
import androidx.room.util.RelationUtil;
import androidx.room.util.SQLiteStatementUtil;
import androidx.room.util.StringUtil;
import androidx.sqlite.SQLiteConnection;
import androidx.sqlite.SQLiteStatement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;

/* JADX INFO: loaded from: classes5.dex */
public final class theader_dao_Impl extends theader.dao {
    private final RoomDatabase __db;
    private final EntityInsertAdapter<theader> __insertAdapterOftheader = new EntityInsertAdapter<theader>() { // from class: com.trimline.metrocrew.theader_dao_Impl.1
        @Override // androidx.room.EntityInsertAdapter
        protected String createQuery() {
            return "INSERT OR REPLACE INTO `theader` (`Key`,`No`,`Date`,`DateSpecified`,`Cashier`,`Date_Posted`,`Date_PostedSpecified`,`Time_Posted`,`Time_PostedSpecified`,`Posted`,`PostedSpecified`,`No_Series`,`Bank_Code`,`Received_From`,`On_Behalf_Of`,`Amount_Recieved`,`Amount_RecievedSpecified`,`Global_Dimension_1_Code`,`Shortcut_Dimension_2_Code`,`Currency_Code`,`Currency_Factor`,`Currency_FactorSpecified`,`Total_Amount`,`Total_AmountSpecified`,`Posted_By`,`Print_No`,`Print_NoSpecified`,`StatusSpecified`,`Cheque_No`,`No_Printed`,`No_PrintedSpecified`,`Created_By`,`Created_Date_Time`,`Created_Date_TimeSpecified`,`Register_No`,`Register_NoSpecified`,`From_Entry_No`,`From_Entry_NoSpecified`,`To_Entry_No`,`To_Entry_NoSpecified`,`Document_Date`,`Document_DateSpecified`,`Responsibility_Center`,`Shortcut_Dimension_3_Code`,`Shortcut_Dimension_4_Code`,`Dim3`,`Dim4`,`Bank_Name`,`Receipt_TypeSpecified`,`Dimension_Set_ID`,`Dimension_Set_IDSpecified`,`Dim1`,`Dim2`,`Account_No`,`Name`,`PayMode`,`Pay_ModeSpecified`,`Cheque_Deposit_Slip_No`,`Cheque_Deposit_Slip_Date`,`Cheque_Deposit_Slip_DateSpecified`,`Total_Amount_Guaranteed`,`Total_Amount_GuaranteedSpecified`,`DFLT`,`DFLTSpecified`,`Group_Name`,`Reference_No`,`Bank_Ref_No`,`sent`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityInsertAdapter
        public void bind(SQLiteStatement sQLiteStatement, theader theaderVar) {
            if (theaderVar.Key != null) {
                sQLiteStatement.mo154bindText(1, theaderVar.Key);
            } else {
                sQLiteStatement.mo153bindNull(1);
            }
            if (theaderVar.No != null) {
                sQLiteStatement.mo154bindText(2, theaderVar.No);
            } else {
                sQLiteStatement.mo153bindNull(2);
            }
            Long lFromDate = Converters.DateConverter.fromDate(theaderVar.Date);
            if (lFromDate != null) {
                sQLiteStatement.mo152bindLong(3, lFromDate.longValue());
            } else {
                sQLiteStatement.mo153bindNull(3);
            }
            Integer numValueOf = theaderVar.DateSpecified == null ? null : Integer.valueOf(theaderVar.DateSpecified.booleanValue() ? 1 : 0);
            if (numValueOf != null) {
                sQLiteStatement.mo152bindLong(4, numValueOf.intValue());
            } else {
                sQLiteStatement.mo153bindNull(4);
            }
            if (theaderVar.Cashier != null) {
                sQLiteStatement.mo154bindText(5, theaderVar.Cashier);
            } else {
                sQLiteStatement.mo153bindNull(5);
            }
            Long lFromDate2 = Converters.DateConverter.fromDate(theaderVar.Date_Posted);
            if (lFromDate2 != null) {
                sQLiteStatement.mo152bindLong(6, lFromDate2.longValue());
            } else {
                sQLiteStatement.mo153bindNull(6);
            }
            Integer numValueOf2 = theaderVar.Date_PostedSpecified == null ? null : Integer.valueOf(theaderVar.Date_PostedSpecified.booleanValue() ? 1 : 0);
            if (numValueOf2 != null) {
                sQLiteStatement.mo152bindLong(7, numValueOf2.intValue());
            } else {
                sQLiteStatement.mo153bindNull(7);
            }
            Long lFromDate3 = Converters.DateConverter.fromDate(theaderVar.Time_Posted);
            if (lFromDate3 != null) {
                sQLiteStatement.mo152bindLong(8, lFromDate3.longValue());
            } else {
                sQLiteStatement.mo153bindNull(8);
            }
            Integer numValueOf3 = theaderVar.Time_PostedSpecified == null ? null : Integer.valueOf(theaderVar.Time_PostedSpecified.booleanValue() ? 1 : 0);
            if (numValueOf3 != null) {
                sQLiteStatement.mo152bindLong(9, numValueOf3.intValue());
            } else {
                sQLiteStatement.mo153bindNull(9);
            }
            Integer numValueOf4 = theaderVar.Posted == null ? null : Integer.valueOf(theaderVar.Posted.booleanValue() ? 1 : 0);
            if (numValueOf4 != null) {
                sQLiteStatement.mo152bindLong(10, numValueOf4.intValue());
            } else {
                sQLiteStatement.mo153bindNull(10);
            }
            Integer numValueOf5 = theaderVar.PostedSpecified == null ? null : Integer.valueOf(theaderVar.PostedSpecified.booleanValue() ? 1 : 0);
            if (numValueOf5 != null) {
                sQLiteStatement.mo152bindLong(11, numValueOf5.intValue());
            } else {
                sQLiteStatement.mo153bindNull(11);
            }
            if (theaderVar.No_Series != null) {
                sQLiteStatement.mo154bindText(12, theaderVar.No_Series);
            } else {
                sQLiteStatement.mo153bindNull(12);
            }
            if (theaderVar.Bank_Code != null) {
                sQLiteStatement.mo154bindText(13, theaderVar.Bank_Code);
            } else {
                sQLiteStatement.mo153bindNull(13);
            }
            if (theaderVar.Received_From != null) {
                sQLiteStatement.mo154bindText(14, theaderVar.Received_From);
            } else {
                sQLiteStatement.mo153bindNull(14);
            }
            if (theaderVar.On_Behalf_Of != null) {
                sQLiteStatement.mo154bindText(15, theaderVar.On_Behalf_Of);
            } else {
                sQLiteStatement.mo153bindNull(15);
            }
            sQLiteStatement.mo151bindDouble(16, theaderVar.Amount_Recieved);
            Integer numValueOf6 = theaderVar.Amount_RecievedSpecified == null ? null : Integer.valueOf(theaderVar.Amount_RecievedSpecified.booleanValue() ? 1 : 0);
            if (numValueOf6 != null) {
                sQLiteStatement.mo152bindLong(17, numValueOf6.intValue());
            } else {
                sQLiteStatement.mo153bindNull(17);
            }
            if (theaderVar.Global_Dimension_1_Code != null) {
                sQLiteStatement.mo154bindText(18, theaderVar.Global_Dimension_1_Code);
            } else {
                sQLiteStatement.mo153bindNull(18);
            }
            if (theaderVar.Shortcut_Dimension_2_Code != null) {
                sQLiteStatement.mo154bindText(19, theaderVar.Shortcut_Dimension_2_Code);
            } else {
                sQLiteStatement.mo153bindNull(19);
            }
            if (theaderVar.Currency_Code != null) {
                sQLiteStatement.mo154bindText(20, theaderVar.Currency_Code);
            } else {
                sQLiteStatement.mo153bindNull(20);
            }
            sQLiteStatement.mo151bindDouble(21, theaderVar.Currency_Factor);
            Integer numValueOf7 = theaderVar.Currency_FactorSpecified == null ? null : Integer.valueOf(theaderVar.Currency_FactorSpecified.booleanValue() ? 1 : 0);
            if (numValueOf7 != null) {
                sQLiteStatement.mo152bindLong(22, numValueOf7.intValue());
            } else {
                sQLiteStatement.mo153bindNull(22);
            }
            sQLiteStatement.mo151bindDouble(23, theaderVar.Total_Amount);
            Integer numValueOf8 = theaderVar.Total_AmountSpecified == null ? null : Integer.valueOf(theaderVar.Total_AmountSpecified.booleanValue() ? 1 : 0);
            if (numValueOf8 != null) {
                sQLiteStatement.mo152bindLong(24, numValueOf8.intValue());
            } else {
                sQLiteStatement.mo153bindNull(24);
            }
            if (theaderVar.Posted_By == null) {
                sQLiteStatement.mo153bindNull(25);
            } else {
                sQLiteStatement.mo154bindText(25, theaderVar.Posted_By);
            }
            sQLiteStatement.mo152bindLong(26, theaderVar.Print_No);
            Integer numValueOf9 = theaderVar.Print_NoSpecified == null ? null : Integer.valueOf(theaderVar.Print_NoSpecified.booleanValue() ? 1 : 0);
            if (numValueOf9 == null) {
                sQLiteStatement.mo153bindNull(27);
            } else {
                sQLiteStatement.mo152bindLong(27, numValueOf9.intValue());
            }
            Integer numValueOf10 = theaderVar.StatusSpecified == null ? null : Integer.valueOf(theaderVar.StatusSpecified.booleanValue() ? 1 : 0);
            if (numValueOf10 == null) {
                sQLiteStatement.mo153bindNull(28);
            } else {
                sQLiteStatement.mo152bindLong(28, numValueOf10.intValue());
            }
            if (theaderVar.Cheque_No == null) {
                sQLiteStatement.mo153bindNull(29);
            } else {
                sQLiteStatement.mo154bindText(29, theaderVar.Cheque_No);
            }
            sQLiteStatement.mo152bindLong(30, theaderVar.No_Printed);
            Integer numValueOf11 = theaderVar.No_PrintedSpecified == null ? null : Integer.valueOf(theaderVar.No_PrintedSpecified.booleanValue() ? 1 : 0);
            if (numValueOf11 == null) {
                sQLiteStatement.mo153bindNull(31);
            } else {
                sQLiteStatement.mo152bindLong(31, numValueOf11.intValue());
            }
            if (theaderVar.Created_By == null) {
                sQLiteStatement.mo153bindNull(32);
            } else {
                sQLiteStatement.mo154bindText(32, theaderVar.Created_By);
            }
            Long lFromDate4 = Converters.DateConverter.fromDate(theaderVar.Created_Date_Time);
            if (lFromDate4 == null) {
                sQLiteStatement.mo153bindNull(33);
            } else {
                sQLiteStatement.mo152bindLong(33, lFromDate4.longValue());
            }
            Integer numValueOf12 = theaderVar.Created_Date_TimeSpecified == null ? null : Integer.valueOf(theaderVar.Created_Date_TimeSpecified.booleanValue() ? 1 : 0);
            if (numValueOf12 == null) {
                sQLiteStatement.mo153bindNull(34);
            } else {
                sQLiteStatement.mo152bindLong(34, numValueOf12.intValue());
            }
            sQLiteStatement.mo152bindLong(35, theaderVar.Register_No);
            Integer numValueOf13 = theaderVar.Register_NoSpecified == null ? null : Integer.valueOf(theaderVar.Register_NoSpecified.booleanValue() ? 1 : 0);
            if (numValueOf13 == null) {
                sQLiteStatement.mo153bindNull(36);
            } else {
                sQLiteStatement.mo152bindLong(36, numValueOf13.intValue());
            }
            sQLiteStatement.mo152bindLong(37, theaderVar.From_Entry_No);
            Integer numValueOf14 = theaderVar.From_Entry_NoSpecified == null ? null : Integer.valueOf(theaderVar.From_Entry_NoSpecified.booleanValue() ? 1 : 0);
            if (numValueOf14 == null) {
                sQLiteStatement.mo153bindNull(38);
            } else {
                sQLiteStatement.mo152bindLong(38, numValueOf14.intValue());
            }
            sQLiteStatement.mo152bindLong(39, theaderVar.To_Entry_No);
            Integer numValueOf15 = theaderVar.To_Entry_NoSpecified == null ? null : Integer.valueOf(theaderVar.To_Entry_NoSpecified.booleanValue() ? 1 : 0);
            if (numValueOf15 == null) {
                sQLiteStatement.mo153bindNull(40);
            } else {
                sQLiteStatement.mo152bindLong(40, numValueOf15.intValue());
            }
            Long lFromDate5 = Converters.DateConverter.fromDate(theaderVar.Document_Date);
            if (lFromDate5 == null) {
                sQLiteStatement.mo153bindNull(41);
            } else {
                sQLiteStatement.mo152bindLong(41, lFromDate5.longValue());
            }
            Integer numValueOf16 = theaderVar.Document_DateSpecified == null ? null : Integer.valueOf(theaderVar.Document_DateSpecified.booleanValue() ? 1 : 0);
            if (numValueOf16 == null) {
                sQLiteStatement.mo153bindNull(42);
            } else {
                sQLiteStatement.mo152bindLong(42, numValueOf16.intValue());
            }
            if (theaderVar.Responsibility_Center == null) {
                sQLiteStatement.mo153bindNull(43);
            } else {
                sQLiteStatement.mo154bindText(43, theaderVar.Responsibility_Center);
            }
            if (theaderVar.Shortcut_Dimension_3_Code == null) {
                sQLiteStatement.mo153bindNull(44);
            } else {
                sQLiteStatement.mo154bindText(44, theaderVar.Shortcut_Dimension_3_Code);
            }
            if (theaderVar.Shortcut_Dimension_4_Code == null) {
                sQLiteStatement.mo153bindNull(45);
            } else {
                sQLiteStatement.mo154bindText(45, theaderVar.Shortcut_Dimension_4_Code);
            }
            if (theaderVar.Dim3 == null) {
                sQLiteStatement.mo153bindNull(46);
            } else {
                sQLiteStatement.mo154bindText(46, theaderVar.Dim3);
            }
            if (theaderVar.Dim4 == null) {
                sQLiteStatement.mo153bindNull(47);
            } else {
                sQLiteStatement.mo154bindText(47, theaderVar.Dim4);
            }
            if (theaderVar.Bank_Name == null) {
                sQLiteStatement.mo153bindNull(48);
            } else {
                sQLiteStatement.mo154bindText(48, theaderVar.Bank_Name);
            }
            Integer numValueOf17 = theaderVar.Receipt_TypeSpecified == null ? null : Integer.valueOf(theaderVar.Receipt_TypeSpecified.booleanValue() ? 1 : 0);
            if (numValueOf17 == null) {
                sQLiteStatement.mo153bindNull(49);
            } else {
                sQLiteStatement.mo152bindLong(49, numValueOf17.intValue());
            }
            sQLiteStatement.mo152bindLong(50, theaderVar.Dimension_Set_ID);
            Integer numValueOf18 = theaderVar.Dimension_Set_IDSpecified == null ? null : Integer.valueOf(theaderVar.Dimension_Set_IDSpecified.booleanValue() ? 1 : 0);
            if (numValueOf18 == null) {
                sQLiteStatement.mo153bindNull(51);
            } else {
                sQLiteStatement.mo152bindLong(51, numValueOf18.intValue());
            }
            if (theaderVar.Dim1 == null) {
                sQLiteStatement.mo153bindNull(52);
            } else {
                sQLiteStatement.mo154bindText(52, theaderVar.Dim1);
            }
            if (theaderVar.Dim2 == null) {
                sQLiteStatement.mo153bindNull(53);
            } else {
                sQLiteStatement.mo154bindText(53, theaderVar.Dim2);
            }
            if (theaderVar.Account_No == null) {
                sQLiteStatement.mo153bindNull(54);
            } else {
                sQLiteStatement.mo154bindText(54, theaderVar.Account_No);
            }
            if (theaderVar.Name == null) {
                sQLiteStatement.mo153bindNull(55);
            } else {
                sQLiteStatement.mo154bindText(55, theaderVar.Name);
            }
            if (theaderVar.PayMode == null) {
                sQLiteStatement.mo153bindNull(56);
            } else {
                sQLiteStatement.mo154bindText(56, theaderVar.PayMode);
            }
            Integer numValueOf19 = theaderVar.Pay_ModeSpecified == null ? null : Integer.valueOf(theaderVar.Pay_ModeSpecified.booleanValue() ? 1 : 0);
            if (numValueOf19 == null) {
                sQLiteStatement.mo153bindNull(57);
            } else {
                sQLiteStatement.mo152bindLong(57, numValueOf19.intValue());
            }
            if (theaderVar.Cheque_Deposit_Slip_No == null) {
                sQLiteStatement.mo153bindNull(58);
            } else {
                sQLiteStatement.mo154bindText(58, theaderVar.Cheque_Deposit_Slip_No);
            }
            Long lFromDate6 = Converters.DateConverter.fromDate(theaderVar.Cheque_Deposit_Slip_Date);
            if (lFromDate6 == null) {
                sQLiteStatement.mo153bindNull(59);
            } else {
                sQLiteStatement.mo152bindLong(59, lFromDate6.longValue());
            }
            Integer numValueOf20 = theaderVar.Cheque_Deposit_Slip_DateSpecified == null ? null : Integer.valueOf(theaderVar.Cheque_Deposit_Slip_DateSpecified.booleanValue() ? 1 : 0);
            if (numValueOf20 == null) {
                sQLiteStatement.mo153bindNull(60);
            } else {
                sQLiteStatement.mo152bindLong(60, numValueOf20.intValue());
            }
            sQLiteStatement.mo151bindDouble(61, theaderVar.Total_Amount_Guaranteed);
            Integer numValueOf21 = theaderVar.Total_Amount_GuaranteedSpecified == null ? null : Integer.valueOf(theaderVar.Total_Amount_GuaranteedSpecified.booleanValue() ? 1 : 0);
            if (numValueOf21 == null) {
                sQLiteStatement.mo153bindNull(62);
            } else {
                sQLiteStatement.mo152bindLong(62, numValueOf21.intValue());
            }
            sQLiteStatement.mo151bindDouble(63, theaderVar.DFLT);
            Integer numValueOf22 = theaderVar.DFLTSpecified == null ? null : Integer.valueOf(theaderVar.DFLTSpecified.booleanValue() ? 1 : 0);
            if (numValueOf22 == null) {
                sQLiteStatement.mo153bindNull(64);
            } else {
                sQLiteStatement.mo152bindLong(64, numValueOf22.intValue());
            }
            if (theaderVar.Group_Name == null) {
                sQLiteStatement.mo153bindNull(65);
            } else {
                sQLiteStatement.mo154bindText(65, theaderVar.Group_Name);
            }
            if (theaderVar.Reference_No == null) {
                sQLiteStatement.mo153bindNull(66);
            } else {
                sQLiteStatement.mo154bindText(66, theaderVar.Reference_No);
            }
            if (theaderVar.Bank_Ref_No == null) {
                sQLiteStatement.mo153bindNull(67);
            } else {
                sQLiteStatement.mo154bindText(67, theaderVar.Bank_Ref_No);
            }
            sQLiteStatement.mo152bindLong(68, theaderVar.sent ? 1L : 0L);
        }
    };
    private final EntityDeleteOrUpdateAdapter<theader> __deleteAdapterOftheader = new EntityDeleteOrUpdateAdapter<theader>() { // from class: com.trimline.metrocrew.theader_dao_Impl.2
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        protected String createQuery() {
            return "DELETE FROM `theader` WHERE `No` = ?";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        public void bind(final SQLiteStatement statement, final theader entity) {
            if (entity.No == null) {
                statement.mo153bindNull(1);
            } else {
                statement.mo154bindText(1, entity.No);
            }
        }
    };
    private final EntityDeleteOrUpdateAdapter<theader> __updateAdapterOftheader = new EntityDeleteOrUpdateAdapter<theader>() { // from class: com.trimline.metrocrew.theader_dao_Impl.3
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        protected String createQuery() {
            return "UPDATE OR ABORT `theader` SET `Key` = ?,`No` = ?,`Date` = ?,`DateSpecified` = ?,`Cashier` = ?,`Date_Posted` = ?,`Date_PostedSpecified` = ?,`Time_Posted` = ?,`Time_PostedSpecified` = ?,`Posted` = ?,`PostedSpecified` = ?,`No_Series` = ?,`Bank_Code` = ?,`Received_From` = ?,`On_Behalf_Of` = ?,`Amount_Recieved` = ?,`Amount_RecievedSpecified` = ?,`Global_Dimension_1_Code` = ?,`Shortcut_Dimension_2_Code` = ?,`Currency_Code` = ?,`Currency_Factor` = ?,`Currency_FactorSpecified` = ?,`Total_Amount` = ?,`Total_AmountSpecified` = ?,`Posted_By` = ?,`Print_No` = ?,`Print_NoSpecified` = ?,`StatusSpecified` = ?,`Cheque_No` = ?,`No_Printed` = ?,`No_PrintedSpecified` = ?,`Created_By` = ?,`Created_Date_Time` = ?,`Created_Date_TimeSpecified` = ?,`Register_No` = ?,`Register_NoSpecified` = ?,`From_Entry_No` = ?,`From_Entry_NoSpecified` = ?,`To_Entry_No` = ?,`To_Entry_NoSpecified` = ?,`Document_Date` = ?,`Document_DateSpecified` = ?,`Responsibility_Center` = ?,`Shortcut_Dimension_3_Code` = ?,`Shortcut_Dimension_4_Code` = ?,`Dim3` = ?,`Dim4` = ?,`Bank_Name` = ?,`Receipt_TypeSpecified` = ?,`Dimension_Set_ID` = ?,`Dimension_Set_IDSpecified` = ?,`Dim1` = ?,`Dim2` = ?,`Account_No` = ?,`Name` = ?,`PayMode` = ?,`Pay_ModeSpecified` = ?,`Cheque_Deposit_Slip_No` = ?,`Cheque_Deposit_Slip_Date` = ?,`Cheque_Deposit_Slip_DateSpecified` = ?,`Total_Amount_Guaranteed` = ?,`Total_Amount_GuaranteedSpecified` = ?,`DFLT` = ?,`DFLTSpecified` = ?,`Group_Name` = ?,`Reference_No` = ?,`Bank_Ref_No` = ?,`sent` = ? WHERE `No` = ?";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        public void bind(SQLiteStatement sQLiteStatement, theader theaderVar) {
            if (theaderVar.Key != null) {
                sQLiteStatement.mo154bindText(1, theaderVar.Key);
            } else {
                sQLiteStatement.mo153bindNull(1);
            }
            if (theaderVar.No != null) {
                sQLiteStatement.mo154bindText(2, theaderVar.No);
            } else {
                sQLiteStatement.mo153bindNull(2);
            }
            Long lFromDate = Converters.DateConverter.fromDate(theaderVar.Date);
            if (lFromDate != null) {
                sQLiteStatement.mo152bindLong(3, lFromDate.longValue());
            } else {
                sQLiteStatement.mo153bindNull(3);
            }
            Integer numValueOf = theaderVar.DateSpecified == null ? null : Integer.valueOf(theaderVar.DateSpecified.booleanValue() ? 1 : 0);
            if (numValueOf != null) {
                sQLiteStatement.mo152bindLong(4, numValueOf.intValue());
            } else {
                sQLiteStatement.mo153bindNull(4);
            }
            if (theaderVar.Cashier != null) {
                sQLiteStatement.mo154bindText(5, theaderVar.Cashier);
            } else {
                sQLiteStatement.mo153bindNull(5);
            }
            Long lFromDate2 = Converters.DateConverter.fromDate(theaderVar.Date_Posted);
            if (lFromDate2 != null) {
                sQLiteStatement.mo152bindLong(6, lFromDate2.longValue());
            } else {
                sQLiteStatement.mo153bindNull(6);
            }
            Integer numValueOf2 = theaderVar.Date_PostedSpecified == null ? null : Integer.valueOf(theaderVar.Date_PostedSpecified.booleanValue() ? 1 : 0);
            if (numValueOf2 != null) {
                sQLiteStatement.mo152bindLong(7, numValueOf2.intValue());
            } else {
                sQLiteStatement.mo153bindNull(7);
            }
            Long lFromDate3 = Converters.DateConverter.fromDate(theaderVar.Time_Posted);
            if (lFromDate3 != null) {
                sQLiteStatement.mo152bindLong(8, lFromDate3.longValue());
            } else {
                sQLiteStatement.mo153bindNull(8);
            }
            Integer numValueOf3 = theaderVar.Time_PostedSpecified == null ? null : Integer.valueOf(theaderVar.Time_PostedSpecified.booleanValue() ? 1 : 0);
            if (numValueOf3 != null) {
                sQLiteStatement.mo152bindLong(9, numValueOf3.intValue());
            } else {
                sQLiteStatement.mo153bindNull(9);
            }
            Integer numValueOf4 = theaderVar.Posted == null ? null : Integer.valueOf(theaderVar.Posted.booleanValue() ? 1 : 0);
            if (numValueOf4 != null) {
                sQLiteStatement.mo152bindLong(10, numValueOf4.intValue());
            } else {
                sQLiteStatement.mo153bindNull(10);
            }
            Integer numValueOf5 = theaderVar.PostedSpecified == null ? null : Integer.valueOf(theaderVar.PostedSpecified.booleanValue() ? 1 : 0);
            if (numValueOf5 != null) {
                sQLiteStatement.mo152bindLong(11, numValueOf5.intValue());
            } else {
                sQLiteStatement.mo153bindNull(11);
            }
            if (theaderVar.No_Series != null) {
                sQLiteStatement.mo154bindText(12, theaderVar.No_Series);
            } else {
                sQLiteStatement.mo153bindNull(12);
            }
            if (theaderVar.Bank_Code != null) {
                sQLiteStatement.mo154bindText(13, theaderVar.Bank_Code);
            } else {
                sQLiteStatement.mo153bindNull(13);
            }
            if (theaderVar.Received_From != null) {
                sQLiteStatement.mo154bindText(14, theaderVar.Received_From);
            } else {
                sQLiteStatement.mo153bindNull(14);
            }
            if (theaderVar.On_Behalf_Of != null) {
                sQLiteStatement.mo154bindText(15, theaderVar.On_Behalf_Of);
            } else {
                sQLiteStatement.mo153bindNull(15);
            }
            sQLiteStatement.mo151bindDouble(16, theaderVar.Amount_Recieved);
            Integer numValueOf6 = theaderVar.Amount_RecievedSpecified == null ? null : Integer.valueOf(theaderVar.Amount_RecievedSpecified.booleanValue() ? 1 : 0);
            if (numValueOf6 != null) {
                sQLiteStatement.mo152bindLong(17, numValueOf6.intValue());
            } else {
                sQLiteStatement.mo153bindNull(17);
            }
            if (theaderVar.Global_Dimension_1_Code != null) {
                sQLiteStatement.mo154bindText(18, theaderVar.Global_Dimension_1_Code);
            } else {
                sQLiteStatement.mo153bindNull(18);
            }
            if (theaderVar.Shortcut_Dimension_2_Code != null) {
                sQLiteStatement.mo154bindText(19, theaderVar.Shortcut_Dimension_2_Code);
            } else {
                sQLiteStatement.mo153bindNull(19);
            }
            if (theaderVar.Currency_Code != null) {
                sQLiteStatement.mo154bindText(20, theaderVar.Currency_Code);
            } else {
                sQLiteStatement.mo153bindNull(20);
            }
            sQLiteStatement.mo151bindDouble(21, theaderVar.Currency_Factor);
            Integer numValueOf7 = theaderVar.Currency_FactorSpecified == null ? null : Integer.valueOf(theaderVar.Currency_FactorSpecified.booleanValue() ? 1 : 0);
            if (numValueOf7 != null) {
                sQLiteStatement.mo152bindLong(22, numValueOf7.intValue());
            } else {
                sQLiteStatement.mo153bindNull(22);
            }
            sQLiteStatement.mo151bindDouble(23, theaderVar.Total_Amount);
            Integer numValueOf8 = theaderVar.Total_AmountSpecified == null ? null : Integer.valueOf(theaderVar.Total_AmountSpecified.booleanValue() ? 1 : 0);
            if (numValueOf8 != null) {
                sQLiteStatement.mo152bindLong(24, numValueOf8.intValue());
            } else {
                sQLiteStatement.mo153bindNull(24);
            }
            if (theaderVar.Posted_By == null) {
                sQLiteStatement.mo153bindNull(25);
            } else {
                sQLiteStatement.mo154bindText(25, theaderVar.Posted_By);
            }
            sQLiteStatement.mo152bindLong(26, theaderVar.Print_No);
            Integer numValueOf9 = theaderVar.Print_NoSpecified == null ? null : Integer.valueOf(theaderVar.Print_NoSpecified.booleanValue() ? 1 : 0);
            if (numValueOf9 == null) {
                sQLiteStatement.mo153bindNull(27);
            } else {
                sQLiteStatement.mo152bindLong(27, numValueOf9.intValue());
            }
            Integer numValueOf10 = theaderVar.StatusSpecified == null ? null : Integer.valueOf(theaderVar.StatusSpecified.booleanValue() ? 1 : 0);
            if (numValueOf10 == null) {
                sQLiteStatement.mo153bindNull(28);
            } else {
                sQLiteStatement.mo152bindLong(28, numValueOf10.intValue());
            }
            if (theaderVar.Cheque_No == null) {
                sQLiteStatement.mo153bindNull(29);
            } else {
                sQLiteStatement.mo154bindText(29, theaderVar.Cheque_No);
            }
            sQLiteStatement.mo152bindLong(30, theaderVar.No_Printed);
            Integer numValueOf11 = theaderVar.No_PrintedSpecified == null ? null : Integer.valueOf(theaderVar.No_PrintedSpecified.booleanValue() ? 1 : 0);
            if (numValueOf11 == null) {
                sQLiteStatement.mo153bindNull(31);
            } else {
                sQLiteStatement.mo152bindLong(31, numValueOf11.intValue());
            }
            if (theaderVar.Created_By == null) {
                sQLiteStatement.mo153bindNull(32);
            } else {
                sQLiteStatement.mo154bindText(32, theaderVar.Created_By);
            }
            Long lFromDate4 = Converters.DateConverter.fromDate(theaderVar.Created_Date_Time);
            if (lFromDate4 == null) {
                sQLiteStatement.mo153bindNull(33);
            } else {
                sQLiteStatement.mo152bindLong(33, lFromDate4.longValue());
            }
            Integer numValueOf12 = theaderVar.Created_Date_TimeSpecified == null ? null : Integer.valueOf(theaderVar.Created_Date_TimeSpecified.booleanValue() ? 1 : 0);
            if (numValueOf12 == null) {
                sQLiteStatement.mo153bindNull(34);
            } else {
                sQLiteStatement.mo152bindLong(34, numValueOf12.intValue());
            }
            sQLiteStatement.mo152bindLong(35, theaderVar.Register_No);
            Integer numValueOf13 = theaderVar.Register_NoSpecified == null ? null : Integer.valueOf(theaderVar.Register_NoSpecified.booleanValue() ? 1 : 0);
            if (numValueOf13 == null) {
                sQLiteStatement.mo153bindNull(36);
            } else {
                sQLiteStatement.mo152bindLong(36, numValueOf13.intValue());
            }
            sQLiteStatement.mo152bindLong(37, theaderVar.From_Entry_No);
            Integer numValueOf14 = theaderVar.From_Entry_NoSpecified == null ? null : Integer.valueOf(theaderVar.From_Entry_NoSpecified.booleanValue() ? 1 : 0);
            if (numValueOf14 == null) {
                sQLiteStatement.mo153bindNull(38);
            } else {
                sQLiteStatement.mo152bindLong(38, numValueOf14.intValue());
            }
            sQLiteStatement.mo152bindLong(39, theaderVar.To_Entry_No);
            Integer numValueOf15 = theaderVar.To_Entry_NoSpecified == null ? null : Integer.valueOf(theaderVar.To_Entry_NoSpecified.booleanValue() ? 1 : 0);
            if (numValueOf15 == null) {
                sQLiteStatement.mo153bindNull(40);
            } else {
                sQLiteStatement.mo152bindLong(40, numValueOf15.intValue());
            }
            Long lFromDate5 = Converters.DateConverter.fromDate(theaderVar.Document_Date);
            if (lFromDate5 == null) {
                sQLiteStatement.mo153bindNull(41);
            } else {
                sQLiteStatement.mo152bindLong(41, lFromDate5.longValue());
            }
            Integer numValueOf16 = theaderVar.Document_DateSpecified == null ? null : Integer.valueOf(theaderVar.Document_DateSpecified.booleanValue() ? 1 : 0);
            if (numValueOf16 == null) {
                sQLiteStatement.mo153bindNull(42);
            } else {
                sQLiteStatement.mo152bindLong(42, numValueOf16.intValue());
            }
            if (theaderVar.Responsibility_Center == null) {
                sQLiteStatement.mo153bindNull(43);
            } else {
                sQLiteStatement.mo154bindText(43, theaderVar.Responsibility_Center);
            }
            if (theaderVar.Shortcut_Dimension_3_Code == null) {
                sQLiteStatement.mo153bindNull(44);
            } else {
                sQLiteStatement.mo154bindText(44, theaderVar.Shortcut_Dimension_3_Code);
            }
            if (theaderVar.Shortcut_Dimension_4_Code == null) {
                sQLiteStatement.mo153bindNull(45);
            } else {
                sQLiteStatement.mo154bindText(45, theaderVar.Shortcut_Dimension_4_Code);
            }
            if (theaderVar.Dim3 == null) {
                sQLiteStatement.mo153bindNull(46);
            } else {
                sQLiteStatement.mo154bindText(46, theaderVar.Dim3);
            }
            if (theaderVar.Dim4 == null) {
                sQLiteStatement.mo153bindNull(47);
            } else {
                sQLiteStatement.mo154bindText(47, theaderVar.Dim4);
            }
            if (theaderVar.Bank_Name == null) {
                sQLiteStatement.mo153bindNull(48);
            } else {
                sQLiteStatement.mo154bindText(48, theaderVar.Bank_Name);
            }
            Integer numValueOf17 = theaderVar.Receipt_TypeSpecified == null ? null : Integer.valueOf(theaderVar.Receipt_TypeSpecified.booleanValue() ? 1 : 0);
            if (numValueOf17 == null) {
                sQLiteStatement.mo153bindNull(49);
            } else {
                sQLiteStatement.mo152bindLong(49, numValueOf17.intValue());
            }
            sQLiteStatement.mo152bindLong(50, theaderVar.Dimension_Set_ID);
            Integer numValueOf18 = theaderVar.Dimension_Set_IDSpecified == null ? null : Integer.valueOf(theaderVar.Dimension_Set_IDSpecified.booleanValue() ? 1 : 0);
            if (numValueOf18 == null) {
                sQLiteStatement.mo153bindNull(51);
            } else {
                sQLiteStatement.mo152bindLong(51, numValueOf18.intValue());
            }
            if (theaderVar.Dim1 == null) {
                sQLiteStatement.mo153bindNull(52);
            } else {
                sQLiteStatement.mo154bindText(52, theaderVar.Dim1);
            }
            if (theaderVar.Dim2 == null) {
                sQLiteStatement.mo153bindNull(53);
            } else {
                sQLiteStatement.mo154bindText(53, theaderVar.Dim2);
            }
            if (theaderVar.Account_No == null) {
                sQLiteStatement.mo153bindNull(54);
            } else {
                sQLiteStatement.mo154bindText(54, theaderVar.Account_No);
            }
            if (theaderVar.Name == null) {
                sQLiteStatement.mo153bindNull(55);
            } else {
                sQLiteStatement.mo154bindText(55, theaderVar.Name);
            }
            if (theaderVar.PayMode == null) {
                sQLiteStatement.mo153bindNull(56);
            } else {
                sQLiteStatement.mo154bindText(56, theaderVar.PayMode);
            }
            Integer numValueOf19 = theaderVar.Pay_ModeSpecified == null ? null : Integer.valueOf(theaderVar.Pay_ModeSpecified.booleanValue() ? 1 : 0);
            if (numValueOf19 == null) {
                sQLiteStatement.mo153bindNull(57);
            } else {
                sQLiteStatement.mo152bindLong(57, numValueOf19.intValue());
            }
            if (theaderVar.Cheque_Deposit_Slip_No == null) {
                sQLiteStatement.mo153bindNull(58);
            } else {
                sQLiteStatement.mo154bindText(58, theaderVar.Cheque_Deposit_Slip_No);
            }
            Long lFromDate6 = Converters.DateConverter.fromDate(theaderVar.Cheque_Deposit_Slip_Date);
            if (lFromDate6 == null) {
                sQLiteStatement.mo153bindNull(59);
            } else {
                sQLiteStatement.mo152bindLong(59, lFromDate6.longValue());
            }
            Integer numValueOf20 = theaderVar.Cheque_Deposit_Slip_DateSpecified == null ? null : Integer.valueOf(theaderVar.Cheque_Deposit_Slip_DateSpecified.booleanValue() ? 1 : 0);
            if (numValueOf20 == null) {
                sQLiteStatement.mo153bindNull(60);
            } else {
                sQLiteStatement.mo152bindLong(60, numValueOf20.intValue());
            }
            sQLiteStatement.mo151bindDouble(61, theaderVar.Total_Amount_Guaranteed);
            Integer numValueOf21 = theaderVar.Total_Amount_GuaranteedSpecified == null ? null : Integer.valueOf(theaderVar.Total_Amount_GuaranteedSpecified.booleanValue() ? 1 : 0);
            if (numValueOf21 == null) {
                sQLiteStatement.mo153bindNull(62);
            } else {
                sQLiteStatement.mo152bindLong(62, numValueOf21.intValue());
            }
            sQLiteStatement.mo151bindDouble(63, theaderVar.DFLT);
            Integer numValueOf22 = theaderVar.DFLTSpecified == null ? null : Integer.valueOf(theaderVar.DFLTSpecified.booleanValue() ? 1 : 0);
            if (numValueOf22 == null) {
                sQLiteStatement.mo153bindNull(64);
            } else {
                sQLiteStatement.mo152bindLong(64, numValueOf22.intValue());
            }
            if (theaderVar.Group_Name == null) {
                sQLiteStatement.mo153bindNull(65);
            } else {
                sQLiteStatement.mo154bindText(65, theaderVar.Group_Name);
            }
            if (theaderVar.Reference_No == null) {
                sQLiteStatement.mo153bindNull(66);
            } else {
                sQLiteStatement.mo154bindText(66, theaderVar.Reference_No);
            }
            if (theaderVar.Bank_Ref_No == null) {
                sQLiteStatement.mo153bindNull(67);
            } else {
                sQLiteStatement.mo154bindText(67, theaderVar.Bank_Ref_No);
            }
            sQLiteStatement.mo152bindLong(68, theaderVar.sent ? 1L : 0L);
            if (theaderVar.No == null) {
                sQLiteStatement.mo153bindNull(69);
            } else {
                sQLiteStatement.mo154bindText(69, theaderVar.No);
            }
        }
    };

    public theader_dao_Impl(final RoomDatabase __db) {
        this.__db = __db;
    }

    @Override // com.trimline.metrocrew.theader.dao
    long insert(final theader entity) {
        return ((Long) DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.theader_dao_Impl$$ExternalSyntheticLambda2
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m454lambda$insert$0$comtrimlinemetrocrewtheader_dao_Impl(entity, (SQLiteConnection) obj);
            }
        })).longValue();
    }

    /* JADX INFO: renamed from: lambda$insert$0$com-trimline-metrocrew-theader_dao_Impl, reason: not valid java name */
    /* synthetic */ Long m454lambda$insert$0$comtrimlinemetrocrewtheader_dao_Impl(theader entity, SQLiteConnection _connection) {
        return Long.valueOf(this.__insertAdapterOftheader.insertAndReturnId(_connection, entity));
    }

    @Override // com.trimline.metrocrew.theader.dao
    void delete(final theader entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.theader_dao_Impl$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m453lambda$delete$1$comtrimlinemetrocrewtheader_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$delete$1$com-trimline-metrocrew-theader_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m453lambda$delete$1$comtrimlinemetrocrewtheader_dao_Impl(theader entity, SQLiteConnection _connection) throws Exception {
        this.__deleteAdapterOftheader.handle(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.theader.dao
    void update(final theader entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.theader_dao_Impl$$ExternalSyntheticLambda7
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m457lambda$update$2$comtrimlinemetrocrewtheader_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$update$2$com-trimline-metrocrew-theader_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m457lambda$update$2$comtrimlinemetrocrewtheader_dao_Impl(theader entity, SQLiteConnection _connection) throws Exception {
        this.__updateAdapterOftheader.handle(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.theader.dao
    List<theader> loadAll(final boolean sent) {
        return (List) DBUtil.performBlocking(this.__db, true, false, new Function1() { // from class: com.trimline.metrocrew.theader_dao_Impl$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return theader_dao_Impl.lambda$loadAll$3(sent, (SQLiteConnection) obj);
            }
        });
    }

    static /* synthetic */ List lambda$loadAll$3(boolean sent, SQLiteConnection _connection) {
        theader _item;
        Long _tmp_1;
        Boolean boolValueOf;
        Long _tmp_3;
        Boolean boolValueOf2;
        Long _tmp_5;
        Boolean boolValueOf3;
        Boolean boolValueOf4;
        Boolean boolValueOf5;
        Boolean boolValueOf6;
        Boolean boolValueOf7;
        Boolean boolValueOf8;
        Boolean boolValueOf9;
        Boolean boolValueOf10;
        Boolean boolValueOf11;
        Long _tmp_15;
        Boolean boolValueOf12;
        Boolean boolValueOf13;
        Boolean boolValueOf14;
        Boolean boolValueOf15;
        Long _tmp_20;
        Boolean boolValueOf16;
        Boolean boolValueOf17;
        Boolean boolValueOf18;
        Boolean boolValueOf19;
        Long _tmp_25;
        Boolean boolValueOf20;
        Boolean boolValueOf21;
        Boolean boolValueOf22;
        SQLiteStatement _stmt = _connection.prepare("SELECT * FROM `theader` where sent = ? ");
        int _tmp = sent ? 1 : 0;
        try {
            _stmt.mo152bindLong(1, _tmp);
            int _columnIndexOfKey = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Key");
            int _columnIndexOfNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "No");
            int _columnIndexOfDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Date");
            int _columnIndexOfDateSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "DateSpecified");
            int _columnIndexOfCashier = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cashier");
            int _columnIndexOfDatePosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Date_Posted");
            int _columnIndexOfDatePostedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Date_PostedSpecified");
            int _columnIndexOfTimePosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Time_Posted");
            int _columnIndexOfTimePostedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Time_PostedSpecified");
            int _columnIndexOfPosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Posted");
            int _tmp_29 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "PostedSpecified");
            int _columnIndexOfNoSeries = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "No_Series");
            int _columnIndexOfSent = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Bank_Code");
            int _columnIndexOfReceivedFrom = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Received_From");
            int _columnIndexOfOnBehalfOf = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "On_Behalf_Of");
            int _columnIndexOfPostedSpecified = _columnIndexOfOnBehalfOf;
            int _columnIndexOfAmountRecieved = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Amount_Recieved");
            int _columnIndexOfNoSeries2 = _columnIndexOfAmountRecieved;
            int _columnIndexOfAmountRecievedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Amount_RecievedSpecified");
            int _columnIndexOfAmountRecieved2 = _columnIndexOfAmountRecievedSpecified;
            int _columnIndexOfGlobalDimension1Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Global_Dimension_1_Code");
            int _columnIndexOfOnBehalfOf2 = _columnIndexOfGlobalDimension1Code;
            int _columnIndexOfShortcutDimension2Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Shortcut_Dimension_2_Code");
            int _columnIndexOfGlobalDimension1Code2 = _columnIndexOfShortcutDimension2Code;
            int _columnIndexOfShortcutDimension2Code2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Currency_Code");
            int _columnIndexOfCurrencyFactor = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Currency_Factor");
            int _columnIndexOfCurrencyFactor2 = _columnIndexOfCurrencyFactor;
            int _columnIndexOfCurrencyFactorSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Currency_FactorSpecified");
            int _columnIndexOfAmountRecievedSpecified2 = _columnIndexOfCurrencyFactorSpecified;
            int _columnIndexOfTotalAmount = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Total_Amount");
            int _columnIndexOfCurrencyFactorSpecified2 = _columnIndexOfTotalAmount;
            int _columnIndexOfTotalAmountSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Total_AmountSpecified");
            int _columnIndexOfTotalAmount2 = _columnIndexOfTotalAmountSpecified;
            int _columnIndexOfPostedBy = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Posted_By");
            int _columnIndexOfCurrencyFactor3 = _columnIndexOfPostedBy;
            int _columnIndexOfPrintNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Print_No");
            int _columnIndexOfTotalAmountSpecified2 = _columnIndexOfPrintNo;
            int _columnIndexOfPrintNoSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Print_NoSpecified");
            int _columnIndexOfPostedBy2 = _columnIndexOfPrintNoSpecified;
            int _columnIndexOfStatusSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "StatusSpecified");
            int _columnIndexOfPrintNoSpecified2 = _columnIndexOfStatusSpecified;
            int _columnIndexOfPrintNo2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_No");
            int _columnIndexOfNoPrinted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "No_Printed");
            int _columnIndexOfNoPrinted2 = _columnIndexOfNoPrinted;
            int _columnIndexOfNoPrintedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "No_PrintedSpecified");
            int _columnIndexOfStatusSpecified2 = _columnIndexOfNoPrintedSpecified;
            int _columnIndexOfNoPrinted3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Created_By");
            int _columnIndexOfCreatedDateTime = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Created_Date_Time");
            int _columnIndexOfCreatedDateTime2 = _columnIndexOfCreatedDateTime;
            int _columnIndexOfNoPrintedSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Created_Date_TimeSpecified");
            int _columnIndexOfRegisterNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Register_No");
            int _columnIndexOfReceivedFrom2 = _columnIndexOfRegisterNo;
            int _columnIndexOfRegisterNoSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Register_NoSpecified");
            int _columnIndexOfRegisterNo2 = _columnIndexOfRegisterNoSpecified;
            int _columnIndexOfFromEntryNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "From_Entry_No");
            int _columnIndexOfRegisterNoSpecified2 = _columnIndexOfFromEntryNo;
            int _columnIndexOfFromEntryNoSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "From_Entry_NoSpecified");
            int _columnIndexOfFromEntryNo2 = _columnIndexOfFromEntryNoSpecified;
            int _columnIndexOfToEntryNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "To_Entry_No");
            int _columnIndexOfFromEntryNoSpecified2 = _columnIndexOfToEntryNo;
            int _columnIndexOfToEntryNoSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "To_Entry_NoSpecified");
            int _columnIndexOfToEntryNo2 = _columnIndexOfToEntryNoSpecified;
            int _columnIndexOfDocumentDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Document_Date");
            int _columnIndexOfDocumentDate2 = _columnIndexOfDocumentDate;
            int _columnIndexOfDocumentDateSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Document_DateSpecified");
            int _columnIndexOfDocumentDateSpecified2 = _columnIndexOfDocumentDateSpecified;
            int _columnIndexOfDocumentDateSpecified3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Responsibility_Center");
            int _columnIndexOfShortcutDimension3Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Shortcut_Dimension_3_Code");
            int _columnIndexOfShortcutDimension3Code2 = _columnIndexOfShortcutDimension3Code;
            int _columnIndexOfShortcutDimension4Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Shortcut_Dimension_4_Code");
            int _columnIndexOfShortcutDimension3Code3 = _columnIndexOfShortcutDimension4Code;
            int _columnIndexOfDim3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dim3");
            int _columnIndexOfShortcutDimension4Code2 = _columnIndexOfDim3;
            int _columnIndexOfDim4 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dim4");
            int _columnIndexOfDim5 = _columnIndexOfDim4;
            int _columnIndexOfBankName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Bank_Name");
            int _columnIndexOfDim6 = _columnIndexOfBankName;
            int _columnIndexOfReceiptTypeSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Receipt_TypeSpecified");
            int _columnIndexOfToEntryNoSpecified2 = _columnIndexOfReceiptTypeSpecified;
            int _columnIndexOfDimensionSetID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dimension_Set_ID");
            int _columnIndexOfReceiptTypeSpecified2 = _columnIndexOfDimensionSetID;
            int _columnIndexOfDimensionSetIDSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dimension_Set_IDSpecified");
            int _columnIndexOfDimensionSetID2 = _columnIndexOfDimensionSetIDSpecified;
            int _columnIndexOfBankName2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dim1");
            int _columnIndexOfDim2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dim2");
            int _columnIndexOfDimensionSetIDSpecified2 = _columnIndexOfDim2;
            int _columnIndexOfAccountNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Account_No");
            int _columnIndexOfDim7 = _columnIndexOfAccountNo;
            int _columnIndexOfName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Name");
            int _columnIndexOfAccountNo2 = _columnIndexOfName;
            int _columnIndexOfName2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "PayMode");
            int _columnIndexOfPayModeSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Pay_ModeSpecified");
            int _columnIndexOfPayModeSpecified2 = _columnIndexOfPayModeSpecified;
            int _columnIndexOfPayModeSpecified3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Deposit_Slip_No");
            int _columnIndexOfChequeDepositSlipDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Deposit_Slip_Date");
            int _columnIndexOfChequeDepositSlipDate2 = _columnIndexOfChequeDepositSlipDate;
            int _columnIndexOfChequeDepositSlipDateSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Deposit_Slip_DateSpecified");
            int _columnIndexOfChequeDepositSlipDateSpecified2 = _columnIndexOfChequeDepositSlipDateSpecified;
            int _columnIndexOfTotalAmountGuaranteed = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Total_Amount_Guaranteed");
            int _columnIndexOfTotalAmountGuaranteed2 = _columnIndexOfTotalAmountGuaranteed;
            int _columnIndexOfTotalAmountGuaranteedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Total_Amount_GuaranteedSpecified");
            int _columnIndexOfTotalAmountGuaranteed3 = _columnIndexOfTotalAmountGuaranteedSpecified;
            int _columnIndexOfDFLT = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "DFLT");
            int _columnIndexOfTotalAmountGuaranteedSpecified2 = _columnIndexOfDFLT;
            int _columnIndexOfDFLTSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "DFLTSpecified");
            int _columnIndexOfDFLT2 = _columnIndexOfDFLTSpecified;
            int _columnIndexOfChequeDepositSlipDateSpecified3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Group_Name");
            int _columnIndexOfReferenceNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reference_No");
            int _columnIndexOfReferenceNo2 = _columnIndexOfReferenceNo;
            int _columnIndexOfReferenceNo3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Bank_Ref_No");
            int _columnIndexOfDFLTSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "sent");
            List<theader> _result = new ArrayList<>();
            while (_stmt.step()) {
                theader _item2 = new theader();
                int _columnIndexOfSent2 = _columnIndexOfDFLTSpecified2;
                if (_stmt.isNull(_columnIndexOfKey)) {
                    _item = _item2;
                    _item.Key = null;
                } else {
                    _item = _item2;
                    _item.Key = _stmt.getText(_columnIndexOfKey);
                }
                if (_stmt.isNull(_columnIndexOfNo)) {
                    _item.No = null;
                } else {
                    _item.No = _stmt.getText(_columnIndexOfNo);
                }
                if (_stmt.isNull(_columnIndexOfDate)) {
                    _tmp_1 = null;
                } else {
                    _tmp_1 = Long.valueOf(_stmt.getLong(_columnIndexOfDate));
                }
                _item.Date = Converters.DateConverter.toDate(_tmp_1);
                Integer _tmp_2 = _stmt.isNull(_columnIndexOfDateSpecified) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfDateSpecified));
                if (_tmp_2 == null) {
                    boolValueOf = null;
                } else {
                    boolValueOf = Boolean.valueOf(_tmp_2.intValue() != 0);
                }
                _item.DateSpecified = boolValueOf;
                if (_stmt.isNull(_columnIndexOfCashier)) {
                    _item.Cashier = null;
                } else {
                    _item.Cashier = _stmt.getText(_columnIndexOfCashier);
                }
                if (_stmt.isNull(_columnIndexOfDatePosted)) {
                    _tmp_3 = null;
                } else {
                    _tmp_3 = Long.valueOf(_stmt.getLong(_columnIndexOfDatePosted));
                }
                _item.Date_Posted = Converters.DateConverter.toDate(_tmp_3);
                Integer _tmp_4 = _stmt.isNull(_columnIndexOfDatePostedSpecified) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfDatePostedSpecified));
                if (_tmp_4 == null) {
                    boolValueOf2 = null;
                } else {
                    boolValueOf2 = Boolean.valueOf(_tmp_4.intValue() != 0);
                }
                _item.Date_PostedSpecified = boolValueOf2;
                if (_stmt.isNull(_columnIndexOfTimePosted)) {
                    _tmp_5 = null;
                } else {
                    _tmp_5 = Long.valueOf(_stmt.getLong(_columnIndexOfTimePosted));
                }
                _item.Time_Posted = Converters.DateConverter.toDate(_tmp_5);
                Integer _tmp_6 = _stmt.isNull(_columnIndexOfTimePostedSpecified) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfTimePostedSpecified));
                if (_tmp_6 == null) {
                    boolValueOf3 = null;
                } else {
                    boolValueOf3 = Boolean.valueOf(_tmp_6.intValue() != 0);
                }
                _item.Time_PostedSpecified = boolValueOf3;
                Integer _tmp_7 = _stmt.isNull(_columnIndexOfPosted) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfPosted));
                if (_tmp_7 == null) {
                    boolValueOf4 = null;
                } else {
                    boolValueOf4 = Boolean.valueOf(_tmp_7.intValue() != 0);
                }
                _item.Posted = boolValueOf4;
                Integer _tmp_8 = _stmt.isNull(_tmp_29) ? null : Integer.valueOf((int) _stmt.getLong(_tmp_29));
                if (_tmp_8 == null) {
                    boolValueOf5 = null;
                } else {
                    boolValueOf5 = Boolean.valueOf(_tmp_8.intValue() != 0);
                }
                _item.PostedSpecified = boolValueOf5;
                if (_stmt.isNull(_columnIndexOfNoSeries)) {
                    _item.No_Series = null;
                } else {
                    _item.No_Series = _stmt.getText(_columnIndexOfNoSeries);
                }
                if (_stmt.isNull(_columnIndexOfSent)) {
                    _item.Bank_Code = null;
                } else {
                    _item.Bank_Code = _stmt.getText(_columnIndexOfSent);
                }
                int _columnIndexOfReceivedFrom3 = _columnIndexOfReceivedFrom;
                if (_stmt.isNull(_columnIndexOfReceivedFrom3)) {
                    _item.Received_From = null;
                } else {
                    _item.Received_From = _stmt.getText(_columnIndexOfReceivedFrom3);
                }
                int _columnIndexOfOnBehalfOf3 = _columnIndexOfPostedSpecified;
                if (_stmt.isNull(_columnIndexOfOnBehalfOf3)) {
                    _item.On_Behalf_Of = null;
                } else {
                    _item.On_Behalf_Of = _stmt.getText(_columnIndexOfOnBehalfOf3);
                }
                int _columnIndexOfAmountRecieved3 = _columnIndexOfNoSeries2;
                int _columnIndexOfAmountRecieved4 = _columnIndexOfNoSeries;
                _item.Amount_Recieved = (float) _stmt.getDouble(_columnIndexOfAmountRecieved3);
                int _columnIndexOfAmountRecievedSpecified3 = _columnIndexOfAmountRecieved2;
                Integer _tmp_9 = _stmt.isNull(_columnIndexOfAmountRecievedSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfAmountRecievedSpecified3));
                if (_tmp_9 == null) {
                    boolValueOf6 = null;
                } else {
                    boolValueOf6 = Boolean.valueOf(_tmp_9.intValue() != 0);
                }
                _item.Amount_RecievedSpecified = boolValueOf6;
                int _columnIndexOfGlobalDimension1Code3 = _columnIndexOfOnBehalfOf2;
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
                int _columnIndexOfCurrencyCode = _columnIndexOfShortcutDimension2Code2;
                if (_stmt.isNull(_columnIndexOfCurrencyCode)) {
                    _item.Currency_Code = null;
                } else {
                    _item.Currency_Code = _stmt.getText(_columnIndexOfCurrencyCode);
                }
                int _columnIndexOfCurrencyFactor4 = _columnIndexOfCurrencyFactor2;
                _item.Currency_Factor = (float) _stmt.getDouble(_columnIndexOfCurrencyFactor4);
                int _columnIndexOfCurrencyFactorSpecified3 = _columnIndexOfAmountRecievedSpecified2;
                Integer _tmp_10 = _stmt.isNull(_columnIndexOfCurrencyFactorSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfCurrencyFactorSpecified3));
                if (_tmp_10 == null) {
                    boolValueOf7 = null;
                } else {
                    boolValueOf7 = Boolean.valueOf(_tmp_10.intValue() != 0);
                }
                _item.Currency_FactorSpecified = boolValueOf7;
                int _columnIndexOfTotalAmount3 = _columnIndexOfCurrencyFactorSpecified2;
                _item.Total_Amount = (float) _stmt.getDouble(_columnIndexOfTotalAmount3);
                int _columnIndexOfTotalAmountSpecified3 = _columnIndexOfTotalAmount2;
                Integer _tmp_11 = _stmt.isNull(_columnIndexOfTotalAmountSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfTotalAmountSpecified3));
                if (_tmp_11 == null) {
                    boolValueOf8 = null;
                } else {
                    boolValueOf8 = Boolean.valueOf(_tmp_11.intValue() != 0);
                }
                _item.Total_AmountSpecified = boolValueOf8;
                int _columnIndexOfPostedBy3 = _columnIndexOfCurrencyFactor3;
                if (_stmt.isNull(_columnIndexOfPostedBy3)) {
                    _item.Posted_By = null;
                } else {
                    _item.Posted_By = _stmt.getText(_columnIndexOfPostedBy3);
                }
                int _columnIndexOfPrintNo3 = _columnIndexOfTotalAmountSpecified2;
                _item.Print_No = (int) _stmt.getLong(_columnIndexOfPrintNo3);
                int _columnIndexOfPrintNoSpecified3 = _columnIndexOfPostedBy2;
                Integer _tmp_12 = _stmt.isNull(_columnIndexOfPrintNoSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfPrintNoSpecified3));
                if (_tmp_12 == null) {
                    boolValueOf9 = null;
                } else {
                    boolValueOf9 = Boolean.valueOf(_tmp_12.intValue() != 0);
                }
                _item.Print_NoSpecified = boolValueOf9;
                int _columnIndexOfStatusSpecified3 = _columnIndexOfPrintNoSpecified2;
                Integer _tmp_13 = _stmt.isNull(_columnIndexOfStatusSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfStatusSpecified3));
                if (_tmp_13 == null) {
                    boolValueOf10 = null;
                } else {
                    boolValueOf10 = Boolean.valueOf(_tmp_13.intValue() != 0);
                }
                _item.StatusSpecified = boolValueOf10;
                int _columnIndexOfChequeNo = _columnIndexOfPrintNo2;
                if (_stmt.isNull(_columnIndexOfChequeNo)) {
                    _item.Cheque_No = null;
                } else {
                    _item.Cheque_No = _stmt.getText(_columnIndexOfChequeNo);
                }
                int _columnIndexOfNoPrinted4 = _columnIndexOfNoPrinted2;
                _item.No_Printed = (int) _stmt.getLong(_columnIndexOfNoPrinted4);
                int _columnIndexOfNoPrintedSpecified3 = _columnIndexOfStatusSpecified2;
                Integer _tmp_14 = _stmt.isNull(_columnIndexOfNoPrintedSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfNoPrintedSpecified3));
                if (_tmp_14 == null) {
                    boolValueOf11 = null;
                } else {
                    boolValueOf11 = Boolean.valueOf(_tmp_14.intValue() != 0);
                }
                _item.No_PrintedSpecified = boolValueOf11;
                int _columnIndexOfCreatedBy = _columnIndexOfNoPrinted3;
                if (_stmt.isNull(_columnIndexOfCreatedBy)) {
                    _item.Created_By = null;
                } else {
                    _item.Created_By = _stmt.getText(_columnIndexOfCreatedBy);
                }
                int _columnIndexOfCreatedDateTime3 = _columnIndexOfCreatedDateTime2;
                if (_stmt.isNull(_columnIndexOfCreatedDateTime3)) {
                    _tmp_15 = null;
                } else {
                    _tmp_15 = Long.valueOf(_stmt.getLong(_columnIndexOfCreatedDateTime3));
                }
                _item.Created_Date_Time = Converters.DateConverter.toDate(_tmp_15);
                int _columnIndexOfCreatedDateTimeSpecified = _columnIndexOfNoPrintedSpecified2;
                Integer _tmp_16 = _stmt.isNull(_columnIndexOfCreatedDateTimeSpecified) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfCreatedDateTimeSpecified));
                if (_tmp_16 == null) {
                    boolValueOf12 = null;
                } else {
                    boolValueOf12 = Boolean.valueOf(_tmp_16.intValue() != 0);
                }
                _item.Created_Date_TimeSpecified = boolValueOf12;
                int _columnIndexOfRegisterNo3 = _columnIndexOfReceivedFrom2;
                _item.Register_No = (int) _stmt.getLong(_columnIndexOfRegisterNo3);
                int _columnIndexOfRegisterNoSpecified3 = _columnIndexOfRegisterNo2;
                Integer _tmp_17 = _stmt.isNull(_columnIndexOfRegisterNoSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfRegisterNoSpecified3));
                if (_tmp_17 == null) {
                    boolValueOf13 = null;
                } else {
                    boolValueOf13 = Boolean.valueOf(_tmp_17.intValue() != 0);
                }
                _item.Register_NoSpecified = boolValueOf13;
                int _columnIndexOfFromEntryNo3 = _columnIndexOfRegisterNoSpecified2;
                _item.From_Entry_No = (int) _stmt.getLong(_columnIndexOfFromEntryNo3);
                int _columnIndexOfFromEntryNoSpecified3 = _columnIndexOfFromEntryNo2;
                Integer _tmp_18 = _stmt.isNull(_columnIndexOfFromEntryNoSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfFromEntryNoSpecified3));
                if (_tmp_18 == null) {
                    boolValueOf14 = null;
                } else {
                    boolValueOf14 = Boolean.valueOf(_tmp_18.intValue() != 0);
                }
                _item.From_Entry_NoSpecified = boolValueOf14;
                int _columnIndexOfToEntryNo3 = _columnIndexOfFromEntryNoSpecified2;
                _item.To_Entry_No = (int) _stmt.getLong(_columnIndexOfToEntryNo3);
                int _columnIndexOfToEntryNoSpecified3 = _columnIndexOfToEntryNo2;
                Integer _tmp_19 = _stmt.isNull(_columnIndexOfToEntryNoSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfToEntryNoSpecified3));
                if (_tmp_19 == null) {
                    boolValueOf15 = null;
                } else {
                    boolValueOf15 = Boolean.valueOf(_tmp_19.intValue() != 0);
                }
                _item.To_Entry_NoSpecified = boolValueOf15;
                int _columnIndexOfDocumentDate3 = _columnIndexOfDocumentDate2;
                if (_stmt.isNull(_columnIndexOfDocumentDate3)) {
                    _tmp_20 = null;
                } else {
                    _tmp_20 = Long.valueOf(_stmt.getLong(_columnIndexOfDocumentDate3));
                }
                _item.Document_Date = Converters.DateConverter.toDate(_tmp_20);
                int _columnIndexOfDocumentDateSpecified4 = _columnIndexOfDocumentDateSpecified2;
                Integer _tmp_110 = _stmt.isNull(_columnIndexOfDocumentDateSpecified4) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfDocumentDateSpecified4));
                if (_tmp_110 == null) {
                    boolValueOf16 = null;
                } else {
                    boolValueOf16 = Boolean.valueOf(_tmp_110.intValue() != 0);
                }
                _item.Document_DateSpecified = boolValueOf16;
                int _columnIndexOfResponsibilityCenter = _columnIndexOfDocumentDateSpecified3;
                if (_stmt.isNull(_columnIndexOfResponsibilityCenter)) {
                    _item.Responsibility_Center = null;
                } else {
                    _item.Responsibility_Center = _stmt.getText(_columnIndexOfResponsibilityCenter);
                }
                int _columnIndexOfShortcutDimension3Code4 = _columnIndexOfShortcutDimension3Code2;
                if (_stmt.isNull(_columnIndexOfShortcutDimension3Code4)) {
                    _item.Shortcut_Dimension_3_Code = null;
                } else {
                    _item.Shortcut_Dimension_3_Code = _stmt.getText(_columnIndexOfShortcutDimension3Code4);
                }
                int _columnIndexOfShortcutDimension4Code3 = _columnIndexOfShortcutDimension3Code3;
                if (_stmt.isNull(_columnIndexOfShortcutDimension4Code3)) {
                    _item.Shortcut_Dimension_4_Code = null;
                } else {
                    _item.Shortcut_Dimension_4_Code = _stmt.getText(_columnIndexOfShortcutDimension4Code3);
                }
                int _columnIndexOfDim8 = _columnIndexOfShortcutDimension4Code2;
                if (_stmt.isNull(_columnIndexOfDim8)) {
                    _item.Dim3 = null;
                } else {
                    _item.Dim3 = _stmt.getText(_columnIndexOfDim8);
                }
                int _columnIndexOfDim9 = _columnIndexOfDim5;
                if (_stmt.isNull(_columnIndexOfDim9)) {
                    _item.Dim4 = null;
                } else {
                    _item.Dim4 = _stmt.getText(_columnIndexOfDim9);
                }
                int _columnIndexOfBankName3 = _columnIndexOfDim6;
                if (_stmt.isNull(_columnIndexOfBankName3)) {
                    _item.Bank_Name = null;
                } else {
                    _item.Bank_Name = _stmt.getText(_columnIndexOfBankName3);
                }
                int _columnIndexOfReceiptTypeSpecified3 = _columnIndexOfToEntryNoSpecified2;
                Integer _tmp_22 = _stmt.isNull(_columnIndexOfReceiptTypeSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfReceiptTypeSpecified3));
                if (_tmp_22 == null) {
                    boolValueOf17 = null;
                } else {
                    boolValueOf17 = Boolean.valueOf(_tmp_22.intValue() != 0);
                }
                _item.Receipt_TypeSpecified = boolValueOf17;
                int _columnIndexOfDimensionSetID3 = _columnIndexOfReceiptTypeSpecified2;
                _item.Dimension_Set_ID = (int) _stmt.getLong(_columnIndexOfDimensionSetID3);
                int _columnIndexOfDimensionSetIDSpecified3 = _columnIndexOfDimensionSetID2;
                Integer _tmp_23 = _stmt.isNull(_columnIndexOfDimensionSetIDSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfDimensionSetIDSpecified3));
                if (_tmp_23 == null) {
                    boolValueOf18 = null;
                } else {
                    boolValueOf18 = Boolean.valueOf(_tmp_23.intValue() != 0);
                }
                _item.Dimension_Set_IDSpecified = boolValueOf18;
                int _columnIndexOfDim1 = _columnIndexOfBankName2;
                if (_stmt.isNull(_columnIndexOfDim1)) {
                    _item.Dim1 = null;
                } else {
                    _item.Dim1 = _stmt.getText(_columnIndexOfDim1);
                }
                int _columnIndexOfDim10 = _columnIndexOfDimensionSetIDSpecified2;
                if (_stmt.isNull(_columnIndexOfDim10)) {
                    _item.Dim2 = null;
                } else {
                    _item.Dim2 = _stmt.getText(_columnIndexOfDim10);
                }
                int _columnIndexOfAccountNo3 = _columnIndexOfDim7;
                if (_stmt.isNull(_columnIndexOfAccountNo3)) {
                    _item.Account_No = null;
                } else {
                    _item.Account_No = _stmt.getText(_columnIndexOfAccountNo3);
                }
                int _columnIndexOfName3 = _columnIndexOfAccountNo2;
                if (_stmt.isNull(_columnIndexOfName3)) {
                    _item.Name = null;
                } else {
                    _item.Name = _stmt.getText(_columnIndexOfName3);
                }
                int _columnIndexOfPayMode = _columnIndexOfName2;
                if (_stmt.isNull(_columnIndexOfPayMode)) {
                    _item.PayMode = null;
                } else {
                    _item.PayMode = _stmt.getText(_columnIndexOfPayMode);
                }
                int _columnIndexOfPayModeSpecified4 = _columnIndexOfPayModeSpecified2;
                Integer _tmp_24 = _stmt.isNull(_columnIndexOfPayModeSpecified4) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfPayModeSpecified4));
                if (_tmp_24 == null) {
                    boolValueOf19 = null;
                } else {
                    boolValueOf19 = Boolean.valueOf(_tmp_24.intValue() != 0);
                }
                _item.Pay_ModeSpecified = boolValueOf19;
                int _columnIndexOfChequeDepositSlipNo = _columnIndexOfPayModeSpecified3;
                if (_stmt.isNull(_columnIndexOfChequeDepositSlipNo)) {
                    _item.Cheque_Deposit_Slip_No = null;
                } else {
                    _item.Cheque_Deposit_Slip_No = _stmt.getText(_columnIndexOfChequeDepositSlipNo);
                }
                int _columnIndexOfChequeDepositSlipDate3 = _columnIndexOfChequeDepositSlipDate2;
                if (_stmt.isNull(_columnIndexOfChequeDepositSlipDate3)) {
                    _tmp_25 = null;
                } else {
                    _tmp_25 = Long.valueOf(_stmt.getLong(_columnIndexOfChequeDepositSlipDate3));
                }
                _item.Cheque_Deposit_Slip_Date = Converters.DateConverter.toDate(_tmp_25);
                int _columnIndexOfChequeDepositSlipDateSpecified4 = _columnIndexOfChequeDepositSlipDateSpecified2;
                Integer _tmp_26 = _stmt.isNull(_columnIndexOfChequeDepositSlipDateSpecified4) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfChequeDepositSlipDateSpecified4));
                if (_tmp_26 == null) {
                    boolValueOf20 = null;
                } else {
                    boolValueOf20 = Boolean.valueOf(_tmp_26.intValue() != 0);
                }
                _item.Cheque_Deposit_Slip_DateSpecified = boolValueOf20;
                int _columnIndexOfTotalAmountGuaranteed4 = _columnIndexOfTotalAmountGuaranteed2;
                _item.Total_Amount_Guaranteed = (float) _stmt.getDouble(_columnIndexOfTotalAmountGuaranteed4);
                int _columnIndexOfTotalAmountGuaranteedSpecified3 = _columnIndexOfTotalAmountGuaranteed3;
                Integer _tmp_27 = _stmt.isNull(_columnIndexOfTotalAmountGuaranteedSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfTotalAmountGuaranteedSpecified3));
                if (_tmp_27 == null) {
                    boolValueOf21 = null;
                } else {
                    boolValueOf21 = Boolean.valueOf(_tmp_27.intValue() != 0);
                }
                _item.Total_Amount_GuaranteedSpecified = boolValueOf21;
                int _columnIndexOfDFLT3 = _columnIndexOfTotalAmountGuaranteedSpecified2;
                _item.DFLT = (float) _stmt.getDouble(_columnIndexOfDFLT3);
                int _columnIndexOfDFLTSpecified3 = _columnIndexOfDFLT2;
                Integer _tmp_28 = _stmt.isNull(_columnIndexOfDFLTSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfDFLTSpecified3));
                if (_tmp_28 == null) {
                    boolValueOf22 = null;
                } else {
                    boolValueOf22 = Boolean.valueOf(_tmp_28.intValue() != 0);
                }
                _item.DFLTSpecified = boolValueOf22;
                int _columnIndexOfGroupName = _columnIndexOfChequeDepositSlipDateSpecified3;
                if (_stmt.isNull(_columnIndexOfGroupName)) {
                    _item.Group_Name = null;
                } else {
                    _item.Group_Name = _stmt.getText(_columnIndexOfGroupName);
                }
                int _columnIndexOfReferenceNo4 = _columnIndexOfReferenceNo2;
                if (_stmt.isNull(_columnIndexOfReferenceNo4)) {
                    _item.Reference_No = null;
                } else {
                    _item.Reference_No = _stmt.getText(_columnIndexOfReferenceNo4);
                }
                int _columnIndexOfBankRefNo = _columnIndexOfReferenceNo3;
                if (_stmt.isNull(_columnIndexOfBankRefNo)) {
                    _item.Bank_Ref_No = null;
                } else {
                    _item.Bank_Ref_No = _stmt.getText(_columnIndexOfBankRefNo);
                }
                int _tmp_210 = (int) _stmt.getLong(_columnIndexOfSent2);
                _item.sent = _tmp_210 != 0;
                List<theader> _result2 = _result;
                _result2.add(_item);
                _result = _result2;
                _tmp_29 = _tmp_29;
                _columnIndexOfNoSeries = _columnIndexOfAmountRecieved4;
                _columnIndexOfNoSeries2 = _columnIndexOfAmountRecieved3;
                _columnIndexOfPostedSpecified = _columnIndexOfOnBehalfOf3;
                _columnIndexOfOnBehalfOf2 = _columnIndexOfGlobalDimension1Code3;
                _columnIndexOfGlobalDimension1Code2 = _columnIndexOfShortcutDimension2Code3;
                _columnIndexOfAmountRecieved2 = _columnIndexOfAmountRecievedSpecified3;
                _columnIndexOfAmountRecievedSpecified2 = _columnIndexOfCurrencyFactorSpecified3;
                _columnIndexOfCurrencyFactorSpecified2 = _columnIndexOfTotalAmount3;
                _columnIndexOfCurrencyFactor2 = _columnIndexOfCurrencyFactor4;
                _columnIndexOfTotalAmount2 = _columnIndexOfTotalAmountSpecified3;
                _columnIndexOfCurrencyFactor3 = _columnIndexOfPostedBy3;
                _columnIndexOfPostedBy2 = _columnIndexOfPrintNoSpecified3;
                _columnIndexOfTotalAmountSpecified2 = _columnIndexOfPrintNo3;
                _columnIndexOfPrintNoSpecified2 = _columnIndexOfStatusSpecified3;
                _columnIndexOfNoPrinted2 = _columnIndexOfNoPrinted4;
                _columnIndexOfStatusSpecified2 = _columnIndexOfNoPrintedSpecified3;
                _columnIndexOfReceivedFrom = _columnIndexOfReceivedFrom3;
                _columnIndexOfReceivedFrom2 = _columnIndexOfRegisterNo3;
                _columnIndexOfRegisterNo2 = _columnIndexOfRegisterNoSpecified3;
                _columnIndexOfRegisterNoSpecified2 = _columnIndexOfFromEntryNo3;
                _columnIndexOfFromEntryNo2 = _columnIndexOfFromEntryNoSpecified3;
                _columnIndexOfFromEntryNoSpecified2 = _columnIndexOfToEntryNo3;
                _columnIndexOfDocumentDateSpecified2 = _columnIndexOfDocumentDateSpecified4;
                _columnIndexOfShortcutDimension3Code2 = _columnIndexOfShortcutDimension3Code4;
                _columnIndexOfShortcutDimension3Code3 = _columnIndexOfShortcutDimension4Code3;
                _columnIndexOfShortcutDimension4Code2 = _columnIndexOfDim8;
                _columnIndexOfDim5 = _columnIndexOfDim9;
                _columnIndexOfToEntryNo2 = _columnIndexOfToEntryNoSpecified3;
                _columnIndexOfToEntryNoSpecified2 = _columnIndexOfReceiptTypeSpecified3;
                _columnIndexOfReceiptTypeSpecified2 = _columnIndexOfDimensionSetID3;
                _columnIndexOfDim6 = _columnIndexOfBankName3;
                _columnIndexOfDimensionSetID2 = _columnIndexOfDimensionSetIDSpecified3;
                _columnIndexOfDimensionSetIDSpecified2 = _columnIndexOfDim10;
                _columnIndexOfDim7 = _columnIndexOfAccountNo3;
                _columnIndexOfAccountNo2 = _columnIndexOfName3;
                _columnIndexOfPayModeSpecified2 = _columnIndexOfPayModeSpecified4;
                _columnIndexOfTotalAmountGuaranteed2 = _columnIndexOfTotalAmountGuaranteed4;
                _columnIndexOfTotalAmountGuaranteed3 = _columnIndexOfTotalAmountGuaranteedSpecified3;
                _columnIndexOfTotalAmountGuaranteedSpecified2 = _columnIndexOfDFLT3;
                _columnIndexOfChequeDepositSlipDateSpecified2 = _columnIndexOfChequeDepositSlipDateSpecified4;
                _columnIndexOfReferenceNo2 = _columnIndexOfReferenceNo4;
                _columnIndexOfChequeDepositSlipDateSpecified3 = _columnIndexOfGroupName;
                _columnIndexOfReferenceNo3 = _columnIndexOfBankRefNo;
                _columnIndexOfKey = _columnIndexOfKey;
                _columnIndexOfShortcutDimension2Code2 = _columnIndexOfCurrencyCode;
                _columnIndexOfPrintNo2 = _columnIndexOfChequeNo;
                _columnIndexOfCreatedDateTime2 = _columnIndexOfCreatedDateTime3;
                _columnIndexOfNoPrinted3 = _columnIndexOfCreatedBy;
                _columnIndexOfNoPrintedSpecified2 = _columnIndexOfCreatedDateTimeSpecified;
                _columnIndexOfDocumentDate2 = _columnIndexOfDocumentDate3;
                _columnIndexOfDocumentDateSpecified3 = _columnIndexOfResponsibilityCenter;
                _columnIndexOfName2 = _columnIndexOfPayMode;
                _columnIndexOfChequeDepositSlipDate2 = _columnIndexOfChequeDepositSlipDate3;
                _columnIndexOfPayModeSpecified3 = _columnIndexOfChequeDepositSlipNo;
                _columnIndexOfBankName2 = _columnIndexOfDim1;
                _columnIndexOfDFLT2 = _columnIndexOfDFLTSpecified3;
                _columnIndexOfDFLTSpecified2 = _columnIndexOfSent2;
                _columnIndexOfSent = _columnIndexOfSent;
            }
            return _result;
        } finally {
            _stmt.close();
        }
    }

    @Override // com.trimline.metrocrew.theader.dao
    LiveData<List<theader>> loadAll() {
        return this.__db.getInvalidationTracker().createLiveData(new String[]{"theader"}, false, new Function1() { // from class: com.trimline.metrocrew.theader_dao_Impl$$ExternalSyntheticLambda6
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return theader_dao_Impl.lambda$loadAll$4((SQLiteConnection) obj);
            }
        });
    }

    static /* synthetic */ List lambda$loadAll$4(SQLiteConnection _connection) {
        theader _item;
        Long _tmp;
        Boolean boolValueOf;
        Long _tmp_2;
        Boolean boolValueOf2;
        Long _tmp_4;
        Boolean boolValueOf3;
        Boolean boolValueOf4;
        Boolean boolValueOf5;
        Boolean boolValueOf6;
        Boolean boolValueOf7;
        Boolean boolValueOf8;
        Boolean boolValueOf9;
        Boolean boolValueOf10;
        Boolean boolValueOf11;
        Long _tmp_14;
        Boolean boolValueOf12;
        Integer _tmp_15;
        Integer _tmp_16;
        Boolean boolValueOf13;
        Integer _tmp_17;
        Integer _tmp_18;
        Boolean boolValueOf14;
        Integer _tmp_19;
        Integer _tmp_110;
        Boolean boolValueOf15;
        Long _tmp_111;
        Boolean boolValueOf16;
        Boolean boolValueOf17;
        Integer _tmp_21;
        Integer _tmp_22;
        Boolean boolValueOf18;
        Boolean boolValueOf19;
        Long _tmp_24;
        Boolean boolValueOf20;
        Integer _tmp_25;
        Integer _tmp_26;
        Boolean boolValueOf21;
        Integer _tmp_27;
        Integer _tmp_28;
        Boolean boolValueOf22;
        SQLiteStatement _stmt = _connection.prepare("SELECT * FROM `theader` order by `No` desc ");
        try {
            int _columnIndexOfSent = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Key");
            int _tmp_29 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "No");
            int _columnIndexOfDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Date");
            int _columnIndexOfDateSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "DateSpecified");
            int _columnIndexOfCashier = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cashier");
            int _columnIndexOfDatePosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Date_Posted");
            int _columnIndexOfDatePostedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Date_PostedSpecified");
            int _columnIndexOfTimePosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Time_Posted");
            int _columnIndexOfTimePostedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Time_PostedSpecified");
            int _columnIndexOfPosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Posted");
            int _columnIndexOfPostedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "PostedSpecified");
            int _columnIndexOfNoSeries = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "No_Series");
            int _columnIndexOfBankCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Bank_Code");
            int _columnIndexOfReceivedFrom = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Received_From");
            int _columnIndexOfReceivedFrom2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "On_Behalf_Of");
            int _columnIndexOfAmountRecieved = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Amount_Recieved");
            int _columnIndexOfNo = _columnIndexOfAmountRecieved;
            int _columnIndexOfAmountRecievedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Amount_RecievedSpecified");
            int _columnIndexOfAmountRecieved2 = _columnIndexOfAmountRecievedSpecified;
            int _columnIndexOfGlobalDimension1Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Global_Dimension_1_Code");
            int _columnIndexOfGlobalDimension1Code2 = _columnIndexOfGlobalDimension1Code;
            int _columnIndexOfShortcutDimension2Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Shortcut_Dimension_2_Code");
            int _columnIndexOfGlobalDimension1Code3 = _columnIndexOfShortcutDimension2Code;
            int _columnIndexOfShortcutDimension2Code2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Currency_Code");
            int _columnIndexOfCurrencyFactor = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Currency_Factor");
            int _columnIndexOfAmountRecievedSpecified2 = _columnIndexOfCurrencyFactor;
            int _columnIndexOfCurrencyFactorSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Currency_FactorSpecified");
            int _columnIndexOfCurrencyFactor2 = _columnIndexOfCurrencyFactorSpecified;
            int _columnIndexOfTotalAmount = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Total_Amount");
            int _columnIndexOfCurrencyFactorSpecified2 = _columnIndexOfTotalAmount;
            int _columnIndexOfTotalAmountSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Total_AmountSpecified");
            int _columnIndexOfTotalAmount2 = _columnIndexOfTotalAmountSpecified;
            int _columnIndexOfPostedBy = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Posted_By");
            int _columnIndexOfPostedBy2 = _columnIndexOfPostedBy;
            int _columnIndexOfPrintNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Print_No");
            int _columnIndexOfTotalAmountSpecified2 = _columnIndexOfPrintNo;
            int _columnIndexOfPrintNoSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Print_NoSpecified");
            int _columnIndexOfPrintNo2 = _columnIndexOfPrintNoSpecified;
            int _columnIndexOfPrintNoSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "StatusSpecified");
            int _columnIndexOfChequeNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_No");
            int _columnIndexOfChequeNo2 = _columnIndexOfChequeNo;
            int _columnIndexOfNoPrinted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "No_Printed");
            int _columnIndexOfNoPrinted2 = _columnIndexOfNoPrinted;
            int _columnIndexOfNoPrintedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "No_PrintedSpecified");
            int _columnIndexOfNoPrinted3 = _columnIndexOfNoPrintedSpecified;
            int _columnIndexOfCreatedBy = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Created_By");
            int _columnIndexOfCreatedBy2 = _columnIndexOfCreatedBy;
            int _columnIndexOfCreatedDateTime = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Created_Date_Time");
            int _columnIndexOfCreatedDateTime2 = _columnIndexOfCreatedDateTime;
            int _columnIndexOfNoPrintedSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Created_Date_TimeSpecified");
            int _columnIndexOfRegisterNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Register_No");
            int _columnIndexOfCreatedBy3 = _columnIndexOfRegisterNo;
            int _columnIndexOfRegisterNoSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Register_NoSpecified");
            int _columnIndexOfRegisterNo2 = _columnIndexOfRegisterNoSpecified;
            int _columnIndexOfFromEntryNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "From_Entry_No");
            int _columnIndexOfRegisterNoSpecified2 = _columnIndexOfFromEntryNo;
            int _columnIndexOfFromEntryNoSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "From_Entry_NoSpecified");
            int _columnIndexOfFromEntryNo2 = _columnIndexOfFromEntryNoSpecified;
            int _columnIndexOfToEntryNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "To_Entry_No");
            int _columnIndexOfFromEntryNoSpecified2 = _columnIndexOfToEntryNo;
            int _columnIndexOfToEntryNoSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "To_Entry_NoSpecified");
            int _columnIndexOfToEntryNo2 = _columnIndexOfToEntryNoSpecified;
            int _columnIndexOfDocumentDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Document_Date");
            int _columnIndexOfDocumentDate2 = _columnIndexOfDocumentDate;
            int _columnIndexOfDocumentDateSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Document_DateSpecified");
            int _columnIndexOfDocumentDateSpecified2 = _columnIndexOfDocumentDateSpecified;
            int _columnIndexOfDocumentDateSpecified3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Responsibility_Center");
            int _columnIndexOfShortcutDimension3Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Shortcut_Dimension_3_Code");
            int _columnIndexOfToEntryNoSpecified2 = _columnIndexOfShortcutDimension3Code;
            int _columnIndexOfShortcutDimension4Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Shortcut_Dimension_4_Code");
            int _columnIndexOfShortcutDimension3Code2 = _columnIndexOfShortcutDimension4Code;
            int _columnIndexOfDim3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dim3");
            int _columnIndexOfShortcutDimension4Code2 = _columnIndexOfDim3;
            int _columnIndexOfDim4 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dim4");
            int _columnIndexOfDim5 = _columnIndexOfDim4;
            int _columnIndexOfBankName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Bank_Name");
            int _columnIndexOfDim6 = _columnIndexOfBankName;
            int _columnIndexOfReceiptTypeSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Receipt_TypeSpecified");
            int _columnIndexOfReceiptTypeSpecified2 = _columnIndexOfReceiptTypeSpecified;
            int _columnIndexOfDimensionSetID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dimension_Set_ID");
            int _columnIndexOfBankName2 = _columnIndexOfDimensionSetID;
            int _columnIndexOfDimensionSetIDSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dimension_Set_IDSpecified");
            int _columnIndexOfDimensionSetID2 = _columnIndexOfDimensionSetIDSpecified;
            int _columnIndexOfDim1 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dim1");
            int _columnIndexOfDim2 = _columnIndexOfDim1;
            int _columnIndexOfDim7 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dim2");
            int _columnIndexOfDimensionSetIDSpecified2 = _columnIndexOfDim7;
            int _columnIndexOfAccountNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Account_No");
            int _columnIndexOfDim8 = _columnIndexOfAccountNo;
            int _columnIndexOfName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Name");
            int _columnIndexOfAccountNo2 = _columnIndexOfName;
            int _columnIndexOfPayMode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "PayMode");
            int _columnIndexOfName2 = _columnIndexOfPayMode;
            int _columnIndexOfPayModeSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Pay_ModeSpecified");
            int _columnIndexOfPayModeSpecified2 = _columnIndexOfPayModeSpecified;
            int _columnIndexOfPayModeSpecified3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Deposit_Slip_No");
            int _columnIndexOfChequeDepositSlipDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Deposit_Slip_Date");
            int _columnIndexOfChequeDepositSlipDate2 = _columnIndexOfChequeDepositSlipDate;
            int _columnIndexOfChequeDepositSlipDateSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Deposit_Slip_DateSpecified");
            int _columnIndexOfChequeDepositSlipDateSpecified2 = _columnIndexOfChequeDepositSlipDateSpecified;
            int _columnIndexOfTotalAmountGuaranteed = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Total_Amount_Guaranteed");
            int _columnIndexOfPayMode2 = _columnIndexOfTotalAmountGuaranteed;
            int _columnIndexOfTotalAmountGuaranteedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Total_Amount_GuaranteedSpecified");
            int _columnIndexOfTotalAmountGuaranteed2 = _columnIndexOfTotalAmountGuaranteedSpecified;
            int _columnIndexOfDFLT = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "DFLT");
            int _columnIndexOfTotalAmountGuaranteedSpecified2 = _columnIndexOfDFLT;
            int _columnIndexOfDFLTSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "DFLTSpecified");
            int _columnIndexOfDFLT2 = _columnIndexOfDFLTSpecified;
            int _columnIndexOfGroupName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Group_Name");
            int _columnIndexOfGroupName2 = _columnIndexOfGroupName;
            int _columnIndexOfReferenceNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reference_No");
            int _columnIndexOfDFLTSpecified2 = _columnIndexOfReferenceNo;
            int _columnIndexOfBankRefNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Bank_Ref_No");
            int _columnIndexOfReferenceNo2 = _columnIndexOfBankRefNo;
            int _columnIndexOfBankRefNo2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "sent");
            List<theader> _result = new ArrayList<>();
            while (_stmt.step()) {
                theader _item2 = new theader();
                int _columnIndexOfSent2 = _columnIndexOfBankRefNo2;
                if (_stmt.isNull(_columnIndexOfSent)) {
                    _item = _item2;
                    _item.Key = null;
                } else {
                    _item = _item2;
                    _item.Key = _stmt.getText(_columnIndexOfSent);
                }
                if (_stmt.isNull(_tmp_29)) {
                    _item.No = null;
                } else {
                    _item.No = _stmt.getText(_tmp_29);
                }
                if (_stmt.isNull(_columnIndexOfDate)) {
                    _tmp = null;
                } else {
                    _tmp = Long.valueOf(_stmt.getLong(_columnIndexOfDate));
                }
                int _columnIndexOfKey = _columnIndexOfSent;
                _item.Date = Converters.DateConverter.toDate(_tmp);
                Integer _tmp_1 = _stmt.isNull(_columnIndexOfDateSpecified) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfDateSpecified));
                if (_tmp_1 == null) {
                    boolValueOf = null;
                } else {
                    boolValueOf = Boolean.valueOf(_tmp_1.intValue() != 0);
                }
                _item.DateSpecified = boolValueOf;
                if (_stmt.isNull(_columnIndexOfCashier)) {
                    _item.Cashier = null;
                } else {
                    _item.Cashier = _stmt.getText(_columnIndexOfCashier);
                }
                if (_stmt.isNull(_columnIndexOfDatePosted)) {
                    _tmp_2 = null;
                } else {
                    _tmp_2 = Long.valueOf(_stmt.getLong(_columnIndexOfDatePosted));
                }
                _item.Date_Posted = Converters.DateConverter.toDate(_tmp_2);
                Integer _tmp_3 = _stmt.isNull(_columnIndexOfDatePostedSpecified) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfDatePostedSpecified));
                if (_tmp_3 == null) {
                    boolValueOf2 = null;
                } else {
                    boolValueOf2 = Boolean.valueOf(_tmp_3.intValue() != 0);
                }
                _item.Date_PostedSpecified = boolValueOf2;
                if (_stmt.isNull(_columnIndexOfTimePosted)) {
                    _tmp_4 = null;
                } else {
                    _tmp_4 = Long.valueOf(_stmt.getLong(_columnIndexOfTimePosted));
                }
                _item.Time_Posted = Converters.DateConverter.toDate(_tmp_4);
                Integer _tmp_5 = _stmt.isNull(_columnIndexOfTimePostedSpecified) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfTimePostedSpecified));
                if (_tmp_5 == null) {
                    boolValueOf3 = null;
                } else {
                    boolValueOf3 = Boolean.valueOf(_tmp_5.intValue() != 0);
                }
                _item.Time_PostedSpecified = boolValueOf3;
                Integer _tmp_6 = _stmt.isNull(_columnIndexOfPosted) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfPosted));
                if (_tmp_6 == null) {
                    boolValueOf4 = null;
                } else {
                    boolValueOf4 = Boolean.valueOf(_tmp_6.intValue() != 0);
                }
                _item.Posted = boolValueOf4;
                Integer _tmp_7 = _stmt.isNull(_columnIndexOfPostedSpecified) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfPostedSpecified));
                if (_tmp_7 == null) {
                    boolValueOf5 = null;
                } else {
                    boolValueOf5 = Boolean.valueOf(_tmp_7.intValue() != 0);
                }
                _item.PostedSpecified = boolValueOf5;
                if (_stmt.isNull(_columnIndexOfNoSeries)) {
                    _item.No_Series = null;
                } else {
                    _item.No_Series = _stmt.getText(_columnIndexOfNoSeries);
                }
                if (_stmt.isNull(_columnIndexOfBankCode)) {
                    _item.Bank_Code = null;
                } else {
                    _item.Bank_Code = _stmt.getText(_columnIndexOfBankCode);
                }
                int _columnIndexOfReceivedFrom3 = _columnIndexOfReceivedFrom;
                if (_stmt.isNull(_columnIndexOfReceivedFrom3)) {
                    _item.Received_From = null;
                } else {
                    _item.Received_From = _stmt.getText(_columnIndexOfReceivedFrom3);
                }
                int _columnIndexOfOnBehalfOf = _columnIndexOfReceivedFrom2;
                if (_stmt.isNull(_columnIndexOfOnBehalfOf)) {
                    _item.On_Behalf_Of = null;
                } else {
                    _item.On_Behalf_Of = _stmt.getText(_columnIndexOfOnBehalfOf);
                }
                int _columnIndexOfDate2 = _columnIndexOfDate;
                int _columnIndexOfAmountRecieved3 = _columnIndexOfNo;
                int _columnIndexOfAmountRecieved4 = _tmp_29;
                _item.Amount_Recieved = (float) _stmt.getDouble(_columnIndexOfAmountRecieved3);
                int _columnIndexOfAmountRecievedSpecified3 = _columnIndexOfAmountRecieved2;
                Integer _tmp_8 = _stmt.isNull(_columnIndexOfAmountRecievedSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfAmountRecievedSpecified3));
                if (_tmp_8 == null) {
                    boolValueOf6 = null;
                } else {
                    boolValueOf6 = Boolean.valueOf(_tmp_8.intValue() != 0);
                }
                _item.Amount_RecievedSpecified = boolValueOf6;
                int _columnIndexOfGlobalDimension1Code4 = _columnIndexOfGlobalDimension1Code2;
                if (_stmt.isNull(_columnIndexOfGlobalDimension1Code4)) {
                    _item.Global_Dimension_1_Code = null;
                } else {
                    _item.Global_Dimension_1_Code = _stmt.getText(_columnIndexOfGlobalDimension1Code4);
                }
                int _columnIndexOfShortcutDimension2Code3 = _columnIndexOfGlobalDimension1Code3;
                if (_stmt.isNull(_columnIndexOfShortcutDimension2Code3)) {
                    _item.Shortcut_Dimension_2_Code = null;
                } else {
                    _item.Shortcut_Dimension_2_Code = _stmt.getText(_columnIndexOfShortcutDimension2Code3);
                }
                int _columnIndexOfCurrencyCode = _columnIndexOfShortcutDimension2Code2;
                if (_stmt.isNull(_columnIndexOfCurrencyCode)) {
                    _item.Currency_Code = null;
                } else {
                    _item.Currency_Code = _stmt.getText(_columnIndexOfCurrencyCode);
                }
                int _columnIndexOfCurrencyFactor3 = _columnIndexOfAmountRecievedSpecified2;
                _item.Currency_Factor = (float) _stmt.getDouble(_columnIndexOfCurrencyFactor3);
                int _columnIndexOfCurrencyFactorSpecified3 = _columnIndexOfCurrencyFactor2;
                Integer _tmp_9 = _stmt.isNull(_columnIndexOfCurrencyFactorSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfCurrencyFactorSpecified3));
                if (_tmp_9 == null) {
                    boolValueOf7 = null;
                } else {
                    boolValueOf7 = Boolean.valueOf(_tmp_9.intValue() != 0);
                }
                _item.Currency_FactorSpecified = boolValueOf7;
                int _columnIndexOfTotalAmount3 = _columnIndexOfCurrencyFactorSpecified2;
                _item.Total_Amount = (float) _stmt.getDouble(_columnIndexOfTotalAmount3);
                int _columnIndexOfTotalAmountSpecified3 = _columnIndexOfTotalAmount2;
                Integer _tmp_10 = _stmt.isNull(_columnIndexOfTotalAmountSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfTotalAmountSpecified3));
                if (_tmp_10 == null) {
                    boolValueOf8 = null;
                } else {
                    boolValueOf8 = Boolean.valueOf(_tmp_10.intValue() != 0);
                }
                _item.Total_AmountSpecified = boolValueOf8;
                int _columnIndexOfPostedBy3 = _columnIndexOfPostedBy2;
                if (_stmt.isNull(_columnIndexOfPostedBy3)) {
                    _item.Posted_By = null;
                } else {
                    _item.Posted_By = _stmt.getText(_columnIndexOfPostedBy3);
                }
                int _columnIndexOfPrintNo3 = _columnIndexOfTotalAmountSpecified2;
                _item.Print_No = (int) _stmt.getLong(_columnIndexOfPrintNo3);
                int _columnIndexOfPrintNoSpecified3 = _columnIndexOfPrintNo2;
                Integer _tmp_11 = _stmt.isNull(_columnIndexOfPrintNoSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfPrintNoSpecified3));
                if (_tmp_11 == null) {
                    boolValueOf9 = null;
                } else {
                    boolValueOf9 = Boolean.valueOf(_tmp_11.intValue() != 0);
                }
                _item.Print_NoSpecified = boolValueOf9;
                int _columnIndexOfStatusSpecified = _columnIndexOfPrintNoSpecified2;
                Integer _tmp_12 = _stmt.isNull(_columnIndexOfStatusSpecified) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfStatusSpecified));
                if (_tmp_12 == null) {
                    boolValueOf10 = null;
                } else {
                    boolValueOf10 = Boolean.valueOf(_tmp_12.intValue() != 0);
                }
                _item.StatusSpecified = boolValueOf10;
                int _columnIndexOfChequeNo3 = _columnIndexOfChequeNo2;
                if (_stmt.isNull(_columnIndexOfChequeNo3)) {
                    _item.Cheque_No = null;
                } else {
                    _item.Cheque_No = _stmt.getText(_columnIndexOfChequeNo3);
                }
                int _columnIndexOfNoPrinted4 = _columnIndexOfNoPrinted2;
                _item.No_Printed = (int) _stmt.getLong(_columnIndexOfNoPrinted4);
                int _columnIndexOfNoPrintedSpecified3 = _columnIndexOfNoPrinted3;
                Integer _tmp_13 = _stmt.isNull(_columnIndexOfNoPrintedSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfNoPrintedSpecified3));
                if (_tmp_13 == null) {
                    boolValueOf11 = null;
                } else {
                    boolValueOf11 = Boolean.valueOf(_tmp_13.intValue() != 0);
                }
                _item.No_PrintedSpecified = boolValueOf11;
                int _columnIndexOfCreatedBy4 = _columnIndexOfCreatedBy2;
                if (_stmt.isNull(_columnIndexOfCreatedBy4)) {
                    _item.Created_By = null;
                } else {
                    _item.Created_By = _stmt.getText(_columnIndexOfCreatedBy4);
                }
                int _columnIndexOfCreatedDateTime3 = _columnIndexOfCreatedDateTime2;
                if (_stmt.isNull(_columnIndexOfCreatedDateTime3)) {
                    _tmp_14 = null;
                } else {
                    _tmp_14 = Long.valueOf(_stmt.getLong(_columnIndexOfCreatedDateTime3));
                }
                _item.Created_Date_Time = Converters.DateConverter.toDate(_tmp_14);
                int _columnIndexOfCreatedDateTimeSpecified = _columnIndexOfNoPrintedSpecified2;
                Integer _tmp_112 = _stmt.isNull(_columnIndexOfCreatedDateTimeSpecified) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfCreatedDateTimeSpecified));
                if (_tmp_112 == null) {
                    boolValueOf12 = null;
                } else {
                    boolValueOf12 = Boolean.valueOf(_tmp_112.intValue() != 0);
                }
                _item.Created_Date_TimeSpecified = boolValueOf12;
                int _columnIndexOfRegisterNo3 = _columnIndexOfCreatedBy3;
                _item.Register_No = (int) _stmt.getLong(_columnIndexOfRegisterNo3);
                int _columnIndexOfRegisterNoSpecified3 = _columnIndexOfRegisterNo2;
                if (_stmt.isNull(_columnIndexOfRegisterNoSpecified3)) {
                    Integer num = _tmp_112;
                    _tmp_16 = null;
                    _tmp_15 = num;
                } else {
                    _tmp_15 = _tmp_112;
                    _tmp_16 = Integer.valueOf((int) _stmt.getLong(_columnIndexOfRegisterNoSpecified3));
                }
                if (_tmp_16 == null) {
                    boolValueOf13 = null;
                } else {
                    boolValueOf13 = Boolean.valueOf(_tmp_16.intValue() != 0);
                }
                _item.Register_NoSpecified = boolValueOf13;
                int _columnIndexOfFromEntryNo3 = _columnIndexOfRegisterNoSpecified2;
                _item.From_Entry_No = (int) _stmt.getLong(_columnIndexOfFromEntryNo3);
                int _columnIndexOfFromEntryNoSpecified3 = _columnIndexOfFromEntryNo2;
                if (_stmt.isNull(_columnIndexOfFromEntryNoSpecified3)) {
                    Integer num2 = _tmp_16;
                    _tmp_18 = null;
                    _tmp_17 = num2;
                } else {
                    _tmp_17 = _tmp_16;
                    _tmp_18 = Integer.valueOf((int) _stmt.getLong(_columnIndexOfFromEntryNoSpecified3));
                }
                if (_tmp_18 == null) {
                    boolValueOf14 = null;
                } else {
                    boolValueOf14 = Boolean.valueOf(_tmp_18.intValue() != 0);
                }
                _item.From_Entry_NoSpecified = boolValueOf14;
                int _columnIndexOfToEntryNo3 = _columnIndexOfFromEntryNoSpecified2;
                _item.To_Entry_No = (int) _stmt.getLong(_columnIndexOfToEntryNo3);
                int _columnIndexOfToEntryNoSpecified3 = _columnIndexOfToEntryNo2;
                if (_stmt.isNull(_columnIndexOfToEntryNoSpecified3)) {
                    Integer num3 = _tmp_18;
                    _tmp_110 = null;
                    _tmp_19 = num3;
                } else {
                    _tmp_19 = _tmp_18;
                    _tmp_110 = Integer.valueOf((int) _stmt.getLong(_columnIndexOfToEntryNoSpecified3));
                }
                if (_tmp_110 == null) {
                    boolValueOf15 = null;
                } else {
                    boolValueOf15 = Boolean.valueOf(_tmp_110.intValue() != 0);
                }
                _item.To_Entry_NoSpecified = boolValueOf15;
                int _columnIndexOfDocumentDate3 = _columnIndexOfDocumentDate2;
                if (_stmt.isNull(_columnIndexOfDocumentDate3)) {
                    _tmp_111 = null;
                } else {
                    _tmp_111 = Long.valueOf(_stmt.getLong(_columnIndexOfDocumentDate3));
                }
                _item.Document_Date = Converters.DateConverter.toDate(_tmp_111);
                int _columnIndexOfDocumentDateSpecified4 = _columnIndexOfDocumentDateSpecified2;
                Integer _tmp_113 = _stmt.isNull(_columnIndexOfDocumentDateSpecified4) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfDocumentDateSpecified4));
                if (_tmp_113 == null) {
                    boolValueOf16 = null;
                } else {
                    boolValueOf16 = Boolean.valueOf(_tmp_113.intValue() != 0);
                }
                _item.Document_DateSpecified = boolValueOf16;
                int _columnIndexOfResponsibilityCenter = _columnIndexOfDocumentDateSpecified3;
                if (_stmt.isNull(_columnIndexOfResponsibilityCenter)) {
                    _item.Responsibility_Center = null;
                } else {
                    _item.Responsibility_Center = _stmt.getText(_columnIndexOfResponsibilityCenter);
                }
                int _columnIndexOfShortcutDimension3Code3 = _columnIndexOfToEntryNoSpecified2;
                if (_stmt.isNull(_columnIndexOfShortcutDimension3Code3)) {
                    _item.Shortcut_Dimension_3_Code = null;
                } else {
                    _item.Shortcut_Dimension_3_Code = _stmt.getText(_columnIndexOfShortcutDimension3Code3);
                }
                int _columnIndexOfShortcutDimension4Code3 = _columnIndexOfShortcutDimension3Code2;
                if (_stmt.isNull(_columnIndexOfShortcutDimension4Code3)) {
                    _item.Shortcut_Dimension_4_Code = null;
                } else {
                    _item.Shortcut_Dimension_4_Code = _stmt.getText(_columnIndexOfShortcutDimension4Code3);
                }
                int _columnIndexOfDim9 = _columnIndexOfShortcutDimension4Code2;
                if (_stmt.isNull(_columnIndexOfDim9)) {
                    _item.Dim3 = null;
                } else {
                    _item.Dim3 = _stmt.getText(_columnIndexOfDim9);
                }
                int _columnIndexOfDim10 = _columnIndexOfDim5;
                if (_stmt.isNull(_columnIndexOfDim10)) {
                    _item.Dim4 = null;
                } else {
                    _item.Dim4 = _stmt.getText(_columnIndexOfDim10);
                }
                int _columnIndexOfBankName3 = _columnIndexOfDim6;
                if (_stmt.isNull(_columnIndexOfBankName3)) {
                    _item.Bank_Name = null;
                } else {
                    _item.Bank_Name = _stmt.getText(_columnIndexOfBankName3);
                }
                int _columnIndexOfReceiptTypeSpecified3 = _columnIndexOfReceiptTypeSpecified2;
                Integer _tmp_20 = _stmt.isNull(_columnIndexOfReceiptTypeSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfReceiptTypeSpecified3));
                if (_tmp_20 == null) {
                    boolValueOf17 = null;
                } else {
                    boolValueOf17 = Boolean.valueOf(_tmp_20.intValue() != 0);
                }
                _item.Receipt_TypeSpecified = boolValueOf17;
                int _columnIndexOfDimensionSetID3 = _columnIndexOfBankName2;
                _item.Dimension_Set_ID = (int) _stmt.getLong(_columnIndexOfDimensionSetID3);
                int _columnIndexOfDimensionSetIDSpecified3 = _columnIndexOfDimensionSetID2;
                if (_stmt.isNull(_columnIndexOfDimensionSetIDSpecified3)) {
                    Integer num4 = _tmp_20;
                    _tmp_22 = null;
                    _tmp_21 = num4;
                } else {
                    _tmp_21 = _tmp_20;
                    _tmp_22 = Integer.valueOf((int) _stmt.getLong(_columnIndexOfDimensionSetIDSpecified3));
                }
                if (_tmp_22 == null) {
                    boolValueOf18 = null;
                } else {
                    boolValueOf18 = Boolean.valueOf(_tmp_22.intValue() != 0);
                }
                _item.Dimension_Set_IDSpecified = boolValueOf18;
                int _columnIndexOfDim11 = _columnIndexOfDim2;
                if (_stmt.isNull(_columnIndexOfDim11)) {
                    _item.Dim1 = null;
                } else {
                    _item.Dim1 = _stmt.getText(_columnIndexOfDim11);
                }
                int _columnIndexOfDim12 = _columnIndexOfDimensionSetIDSpecified2;
                if (_stmt.isNull(_columnIndexOfDim12)) {
                    _item.Dim2 = null;
                } else {
                    _item.Dim2 = _stmt.getText(_columnIndexOfDim12);
                }
                int _columnIndexOfAccountNo3 = _columnIndexOfDim8;
                if (_stmt.isNull(_columnIndexOfAccountNo3)) {
                    _item.Account_No = null;
                } else {
                    _item.Account_No = _stmt.getText(_columnIndexOfAccountNo3);
                }
                int _columnIndexOfName3 = _columnIndexOfAccountNo2;
                if (_stmt.isNull(_columnIndexOfName3)) {
                    _item.Name = null;
                } else {
                    _item.Name = _stmt.getText(_columnIndexOfName3);
                }
                int _columnIndexOfPayMode3 = _columnIndexOfName2;
                if (_stmt.isNull(_columnIndexOfPayMode3)) {
                    _item.PayMode = null;
                } else {
                    _item.PayMode = _stmt.getText(_columnIndexOfPayMode3);
                }
                int _columnIndexOfPayModeSpecified4 = _columnIndexOfPayModeSpecified2;
                Integer _tmp_23 = _stmt.isNull(_columnIndexOfPayModeSpecified4) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfPayModeSpecified4));
                if (_tmp_23 == null) {
                    boolValueOf19 = null;
                } else {
                    boolValueOf19 = Boolean.valueOf(_tmp_23.intValue() != 0);
                }
                _item.Pay_ModeSpecified = boolValueOf19;
                int _columnIndexOfChequeDepositSlipNo = _columnIndexOfPayModeSpecified3;
                if (_stmt.isNull(_columnIndexOfChequeDepositSlipNo)) {
                    _item.Cheque_Deposit_Slip_No = null;
                } else {
                    _item.Cheque_Deposit_Slip_No = _stmt.getText(_columnIndexOfChequeDepositSlipNo);
                }
                int _columnIndexOfChequeDepositSlipDate3 = _columnIndexOfChequeDepositSlipDate2;
                if (_stmt.isNull(_columnIndexOfChequeDepositSlipDate3)) {
                    _tmp_24 = null;
                } else {
                    _tmp_24 = Long.valueOf(_stmt.getLong(_columnIndexOfChequeDepositSlipDate3));
                }
                _item.Cheque_Deposit_Slip_Date = Converters.DateConverter.toDate(_tmp_24);
                int _columnIndexOfChequeDepositSlipDateSpecified3 = _columnIndexOfChequeDepositSlipDateSpecified2;
                Integer _tmp_210 = _stmt.isNull(_columnIndexOfChequeDepositSlipDateSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfChequeDepositSlipDateSpecified3));
                if (_tmp_210 == null) {
                    boolValueOf20 = null;
                } else {
                    boolValueOf20 = Boolean.valueOf(_tmp_210.intValue() != 0);
                }
                _item.Cheque_Deposit_Slip_DateSpecified = boolValueOf20;
                int _columnIndexOfTotalAmountGuaranteed3 = _columnIndexOfPayMode2;
                _item.Total_Amount_Guaranteed = (float) _stmt.getDouble(_columnIndexOfTotalAmountGuaranteed3);
                int _columnIndexOfTotalAmountGuaranteedSpecified3 = _columnIndexOfTotalAmountGuaranteed2;
                if (_stmt.isNull(_columnIndexOfTotalAmountGuaranteedSpecified3)) {
                    Integer num5 = _tmp_210;
                    _tmp_26 = null;
                    _tmp_25 = num5;
                } else {
                    _tmp_25 = _tmp_210;
                    _tmp_26 = Integer.valueOf((int) _stmt.getLong(_columnIndexOfTotalAmountGuaranteedSpecified3));
                }
                if (_tmp_26 == null) {
                    boolValueOf21 = null;
                } else {
                    boolValueOf21 = Boolean.valueOf(_tmp_26.intValue() != 0);
                }
                _item.Total_Amount_GuaranteedSpecified = boolValueOf21;
                int _columnIndexOfDFLT3 = _columnIndexOfTotalAmountGuaranteedSpecified2;
                _item.DFLT = (float) _stmt.getDouble(_columnIndexOfDFLT3);
                int _columnIndexOfDFLTSpecified3 = _columnIndexOfDFLT2;
                if (_stmt.isNull(_columnIndexOfDFLTSpecified3)) {
                    Integer num6 = _tmp_26;
                    _tmp_28 = null;
                    _tmp_27 = num6;
                } else {
                    _tmp_27 = _tmp_26;
                    _tmp_28 = Integer.valueOf((int) _stmt.getLong(_columnIndexOfDFLTSpecified3));
                }
                if (_tmp_28 == null) {
                    boolValueOf22 = null;
                } else {
                    boolValueOf22 = Boolean.valueOf(_tmp_28.intValue() != 0);
                }
                _item.DFLTSpecified = boolValueOf22;
                int _columnIndexOfGroupName3 = _columnIndexOfGroupName2;
                if (_stmt.isNull(_columnIndexOfGroupName3)) {
                    _item.Group_Name = null;
                } else {
                    _item.Group_Name = _stmt.getText(_columnIndexOfGroupName3);
                }
                int _columnIndexOfReferenceNo3 = _columnIndexOfDFLTSpecified2;
                if (_stmt.isNull(_columnIndexOfReferenceNo3)) {
                    _item.Reference_No = null;
                } else {
                    _item.Reference_No = _stmt.getText(_columnIndexOfReferenceNo3);
                }
                int _columnIndexOfBankRefNo3 = _columnIndexOfReferenceNo2;
                if (_stmt.isNull(_columnIndexOfBankRefNo3)) {
                    _item.Bank_Ref_No = null;
                } else {
                    _item.Bank_Ref_No = _stmt.getText(_columnIndexOfBankRefNo3);
                }
                int _tmp_211 = (int) _stmt.getLong(_columnIndexOfSent2);
                _item.sent = _tmp_211 != 0;
                List<theader> _result2 = _result;
                _result2.add(_item);
                _result = _result2;
                _columnIndexOfReceivedFrom = _columnIndexOfReceivedFrom3;
                _tmp_29 = _columnIndexOfAmountRecieved4;
                _columnIndexOfNo = _columnIndexOfAmountRecieved3;
                _columnIndexOfGlobalDimension1Code2 = _columnIndexOfGlobalDimension1Code4;
                _columnIndexOfGlobalDimension1Code3 = _columnIndexOfShortcutDimension2Code3;
                _columnIndexOfAmountRecieved2 = _columnIndexOfAmountRecievedSpecified3;
                _columnIndexOfAmountRecievedSpecified2 = _columnIndexOfCurrencyFactor3;
                _columnIndexOfCurrencyFactor2 = _columnIndexOfCurrencyFactorSpecified3;
                _columnIndexOfCurrencyFactorSpecified2 = _columnIndexOfTotalAmount3;
                _columnIndexOfTotalAmount2 = _columnIndexOfTotalAmountSpecified3;
                _columnIndexOfTotalAmountSpecified2 = _columnIndexOfPrintNo3;
                _columnIndexOfPrintNo2 = _columnIndexOfPrintNoSpecified3;
                _columnIndexOfNoPrinted2 = _columnIndexOfNoPrinted4;
                _columnIndexOfNoPrinted3 = _columnIndexOfNoPrintedSpecified3;
                _columnIndexOfCreatedBy2 = _columnIndexOfCreatedBy4;
                _columnIndexOfCreatedBy3 = _columnIndexOfRegisterNo3;
                _columnIndexOfRegisterNo2 = _columnIndexOfRegisterNoSpecified3;
                _columnIndexOfRegisterNoSpecified2 = _columnIndexOfFromEntryNo3;
                _columnIndexOfFromEntryNo2 = _columnIndexOfFromEntryNoSpecified3;
                _columnIndexOfFromEntryNoSpecified2 = _columnIndexOfToEntryNo3;
                _columnIndexOfDocumentDateSpecified2 = _columnIndexOfDocumentDateSpecified4;
                _columnIndexOfToEntryNo2 = _columnIndexOfToEntryNoSpecified3;
                _columnIndexOfToEntryNoSpecified2 = _columnIndexOfShortcutDimension3Code3;
                _columnIndexOfShortcutDimension3Code2 = _columnIndexOfShortcutDimension4Code3;
                _columnIndexOfShortcutDimension4Code2 = _columnIndexOfDim9;
                _columnIndexOfDim5 = _columnIndexOfDim10;
                _columnIndexOfDim6 = _columnIndexOfBankName3;
                _columnIndexOfBankName2 = _columnIndexOfDimensionSetID3;
                _columnIndexOfDimensionSetID2 = _columnIndexOfDimensionSetIDSpecified3;
                _columnIndexOfDimensionSetIDSpecified2 = _columnIndexOfDim12;
                _columnIndexOfDim8 = _columnIndexOfAccountNo3;
                _columnIndexOfAccountNo2 = _columnIndexOfName3;
                _columnIndexOfPayModeSpecified2 = _columnIndexOfPayModeSpecified4;
                _columnIndexOfName2 = _columnIndexOfPayMode3;
                _columnIndexOfPayMode2 = _columnIndexOfTotalAmountGuaranteed3;
                _columnIndexOfTotalAmountGuaranteed2 = _columnIndexOfTotalAmountGuaranteedSpecified3;
                _columnIndexOfTotalAmountGuaranteedSpecified2 = _columnIndexOfDFLT3;
                _columnIndexOfDFLT2 = _columnIndexOfDFLTSpecified3;
                _columnIndexOfDFLTSpecified2 = _columnIndexOfReferenceNo3;
                _columnIndexOfGroupName2 = _columnIndexOfGroupName3;
                _columnIndexOfDate = _columnIndexOfDate2;
                _columnIndexOfReceivedFrom2 = _columnIndexOfOnBehalfOf;
                _columnIndexOfShortcutDimension2Code2 = _columnIndexOfCurrencyCode;
                _columnIndexOfPostedBy2 = _columnIndexOfPostedBy3;
                _columnIndexOfChequeNo2 = _columnIndexOfChequeNo3;
                _columnIndexOfCreatedDateTime2 = _columnIndexOfCreatedDateTime3;
                _columnIndexOfPrintNoSpecified2 = _columnIndexOfStatusSpecified;
                _columnIndexOfNoPrintedSpecified2 = _columnIndexOfCreatedDateTimeSpecified;
                _columnIndexOfDocumentDate2 = _columnIndexOfDocumentDate3;
                _columnIndexOfDocumentDateSpecified3 = _columnIndexOfResponsibilityCenter;
                _columnIndexOfReceiptTypeSpecified2 = _columnIndexOfReceiptTypeSpecified3;
                _columnIndexOfDim2 = _columnIndexOfDim11;
                _columnIndexOfChequeDepositSlipDate2 = _columnIndexOfChequeDepositSlipDate3;
                _columnIndexOfPayModeSpecified3 = _columnIndexOfChequeDepositSlipNo;
                _columnIndexOfChequeDepositSlipDateSpecified2 = _columnIndexOfChequeDepositSlipDateSpecified3;
                _columnIndexOfReferenceNo2 = _columnIndexOfBankRefNo3;
                _columnIndexOfBankRefNo2 = _columnIndexOfSent2;
                _columnIndexOfSent = _columnIndexOfKey;
            }
            return _result;
        } finally {
            _stmt.close();
        }
    }

    @Override // com.trimline.metrocrew.theader.dao
    LiveData<List<theader>> loadtodays() {
        return this.__db.getInvalidationTracker().createLiveData(new String[]{"theader"}, false, new Function1() { // from class: com.trimline.metrocrew.theader_dao_Impl$$ExternalSyntheticLambda4
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return theader_dao_Impl.lambda$loadtodays$5((SQLiteConnection) obj);
            }
        });
    }

    static /* synthetic */ List lambda$loadtodays$5(SQLiteConnection _connection) {
        theader _item;
        Long _tmp;
        Boolean boolValueOf;
        Long _tmp_2;
        Boolean boolValueOf2;
        Long _tmp_4;
        Boolean boolValueOf3;
        Boolean boolValueOf4;
        Boolean boolValueOf5;
        Boolean boolValueOf6;
        Boolean boolValueOf7;
        Boolean boolValueOf8;
        Boolean boolValueOf9;
        Boolean boolValueOf10;
        Boolean boolValueOf11;
        Long _tmp_14;
        Boolean boolValueOf12;
        Integer _tmp_15;
        Integer _tmp_16;
        Boolean boolValueOf13;
        Integer _tmp_17;
        Integer _tmp_18;
        Boolean boolValueOf14;
        Integer _tmp_19;
        Integer _tmp_110;
        Boolean boolValueOf15;
        Long _tmp_111;
        Boolean boolValueOf16;
        Boolean boolValueOf17;
        Integer _tmp_21;
        Integer _tmp_22;
        Boolean boolValueOf18;
        Boolean boolValueOf19;
        Long _tmp_24;
        Boolean boolValueOf20;
        Integer _tmp_25;
        Integer _tmp_26;
        Boolean boolValueOf21;
        Integer _tmp_27;
        Integer _tmp_28;
        Boolean boolValueOf22;
        SQLiteStatement _stmt = _connection.prepare("SELECT * FROM `theader` where strftime('%Y-%m-%d', Created_Date_Time / 1000, 'unixepoch') = strftime('%Y-%m-%d', datetime('now')) ");
        try {
            int _columnIndexOfSent = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Key");
            int _tmp_29 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "No");
            int _columnIndexOfDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Date");
            int _columnIndexOfDateSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "DateSpecified");
            int _columnIndexOfCashier = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cashier");
            int _columnIndexOfDatePosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Date_Posted");
            int _columnIndexOfDatePostedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Date_PostedSpecified");
            int _columnIndexOfTimePosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Time_Posted");
            int _columnIndexOfTimePostedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Time_PostedSpecified");
            int _columnIndexOfPosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Posted");
            int _columnIndexOfPostedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "PostedSpecified");
            int _columnIndexOfNoSeries = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "No_Series");
            int _columnIndexOfBankCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Bank_Code");
            int _columnIndexOfReceivedFrom = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Received_From");
            int _columnIndexOfReceivedFrom2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "On_Behalf_Of");
            int _columnIndexOfAmountRecieved = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Amount_Recieved");
            int _columnIndexOfNo = _columnIndexOfAmountRecieved;
            int _columnIndexOfAmountRecievedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Amount_RecievedSpecified");
            int _columnIndexOfAmountRecieved2 = _columnIndexOfAmountRecievedSpecified;
            int _columnIndexOfGlobalDimension1Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Global_Dimension_1_Code");
            int _columnIndexOfGlobalDimension1Code2 = _columnIndexOfGlobalDimension1Code;
            int _columnIndexOfShortcutDimension2Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Shortcut_Dimension_2_Code");
            int _columnIndexOfGlobalDimension1Code3 = _columnIndexOfShortcutDimension2Code;
            int _columnIndexOfShortcutDimension2Code2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Currency_Code");
            int _columnIndexOfCurrencyFactor = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Currency_Factor");
            int _columnIndexOfAmountRecievedSpecified2 = _columnIndexOfCurrencyFactor;
            int _columnIndexOfCurrencyFactorSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Currency_FactorSpecified");
            int _columnIndexOfCurrencyFactor2 = _columnIndexOfCurrencyFactorSpecified;
            int _columnIndexOfTotalAmount = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Total_Amount");
            int _columnIndexOfCurrencyFactorSpecified2 = _columnIndexOfTotalAmount;
            int _columnIndexOfTotalAmountSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Total_AmountSpecified");
            int _columnIndexOfTotalAmount2 = _columnIndexOfTotalAmountSpecified;
            int _columnIndexOfPostedBy = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Posted_By");
            int _columnIndexOfPostedBy2 = _columnIndexOfPostedBy;
            int _columnIndexOfPrintNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Print_No");
            int _columnIndexOfTotalAmountSpecified2 = _columnIndexOfPrintNo;
            int _columnIndexOfPrintNoSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Print_NoSpecified");
            int _columnIndexOfPrintNo2 = _columnIndexOfPrintNoSpecified;
            int _columnIndexOfPrintNoSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "StatusSpecified");
            int _columnIndexOfChequeNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_No");
            int _columnIndexOfChequeNo2 = _columnIndexOfChequeNo;
            int _columnIndexOfNoPrinted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "No_Printed");
            int _columnIndexOfNoPrinted2 = _columnIndexOfNoPrinted;
            int _columnIndexOfNoPrintedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "No_PrintedSpecified");
            int _columnIndexOfNoPrinted3 = _columnIndexOfNoPrintedSpecified;
            int _columnIndexOfCreatedBy = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Created_By");
            int _columnIndexOfCreatedBy2 = _columnIndexOfCreatedBy;
            int _columnIndexOfCreatedDateTime = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Created_Date_Time");
            int _columnIndexOfCreatedDateTime2 = _columnIndexOfCreatedDateTime;
            int _columnIndexOfNoPrintedSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Created_Date_TimeSpecified");
            int _columnIndexOfRegisterNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Register_No");
            int _columnIndexOfCreatedBy3 = _columnIndexOfRegisterNo;
            int _columnIndexOfRegisterNoSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Register_NoSpecified");
            int _columnIndexOfRegisterNo2 = _columnIndexOfRegisterNoSpecified;
            int _columnIndexOfFromEntryNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "From_Entry_No");
            int _columnIndexOfRegisterNoSpecified2 = _columnIndexOfFromEntryNo;
            int _columnIndexOfFromEntryNoSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "From_Entry_NoSpecified");
            int _columnIndexOfFromEntryNo2 = _columnIndexOfFromEntryNoSpecified;
            int _columnIndexOfToEntryNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "To_Entry_No");
            int _columnIndexOfFromEntryNoSpecified2 = _columnIndexOfToEntryNo;
            int _columnIndexOfToEntryNoSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "To_Entry_NoSpecified");
            int _columnIndexOfToEntryNo2 = _columnIndexOfToEntryNoSpecified;
            int _columnIndexOfDocumentDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Document_Date");
            int _columnIndexOfDocumentDate2 = _columnIndexOfDocumentDate;
            int _columnIndexOfDocumentDateSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Document_DateSpecified");
            int _columnIndexOfDocumentDateSpecified2 = _columnIndexOfDocumentDateSpecified;
            int _columnIndexOfDocumentDateSpecified3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Responsibility_Center");
            int _columnIndexOfShortcutDimension3Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Shortcut_Dimension_3_Code");
            int _columnIndexOfToEntryNoSpecified2 = _columnIndexOfShortcutDimension3Code;
            int _columnIndexOfShortcutDimension4Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Shortcut_Dimension_4_Code");
            int _columnIndexOfShortcutDimension3Code2 = _columnIndexOfShortcutDimension4Code;
            int _columnIndexOfDim3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dim3");
            int _columnIndexOfShortcutDimension4Code2 = _columnIndexOfDim3;
            int _columnIndexOfDim4 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dim4");
            int _columnIndexOfDim5 = _columnIndexOfDim4;
            int _columnIndexOfBankName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Bank_Name");
            int _columnIndexOfDim6 = _columnIndexOfBankName;
            int _columnIndexOfReceiptTypeSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Receipt_TypeSpecified");
            int _columnIndexOfReceiptTypeSpecified2 = _columnIndexOfReceiptTypeSpecified;
            int _columnIndexOfDimensionSetID = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dimension_Set_ID");
            int _columnIndexOfBankName2 = _columnIndexOfDimensionSetID;
            int _columnIndexOfDimensionSetIDSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dimension_Set_IDSpecified");
            int _columnIndexOfDimensionSetID2 = _columnIndexOfDimensionSetIDSpecified;
            int _columnIndexOfDim1 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dim1");
            int _columnIndexOfDim2 = _columnIndexOfDim1;
            int _columnIndexOfDim7 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Dim2");
            int _columnIndexOfDimensionSetIDSpecified2 = _columnIndexOfDim7;
            int _columnIndexOfAccountNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Account_No");
            int _columnIndexOfDim8 = _columnIndexOfAccountNo;
            int _columnIndexOfName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Name");
            int _columnIndexOfAccountNo2 = _columnIndexOfName;
            int _columnIndexOfPayMode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "PayMode");
            int _columnIndexOfName2 = _columnIndexOfPayMode;
            int _columnIndexOfPayModeSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Pay_ModeSpecified");
            int _columnIndexOfPayModeSpecified2 = _columnIndexOfPayModeSpecified;
            int _columnIndexOfPayModeSpecified3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Deposit_Slip_No");
            int _columnIndexOfChequeDepositSlipDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Deposit_Slip_Date");
            int _columnIndexOfChequeDepositSlipDate2 = _columnIndexOfChequeDepositSlipDate;
            int _columnIndexOfChequeDepositSlipDateSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Cheque_Deposit_Slip_DateSpecified");
            int _columnIndexOfChequeDepositSlipDateSpecified2 = _columnIndexOfChequeDepositSlipDateSpecified;
            int _columnIndexOfTotalAmountGuaranteed = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Total_Amount_Guaranteed");
            int _columnIndexOfPayMode2 = _columnIndexOfTotalAmountGuaranteed;
            int _columnIndexOfTotalAmountGuaranteedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Total_Amount_GuaranteedSpecified");
            int _columnIndexOfTotalAmountGuaranteed2 = _columnIndexOfTotalAmountGuaranteedSpecified;
            int _columnIndexOfDFLT = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "DFLT");
            int _columnIndexOfTotalAmountGuaranteedSpecified2 = _columnIndexOfDFLT;
            int _columnIndexOfDFLTSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "DFLTSpecified");
            int _columnIndexOfDFLT2 = _columnIndexOfDFLTSpecified;
            int _columnIndexOfGroupName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Group_Name");
            int _columnIndexOfGroupName2 = _columnIndexOfGroupName;
            int _columnIndexOfReferenceNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Reference_No");
            int _columnIndexOfDFLTSpecified2 = _columnIndexOfReferenceNo;
            int _columnIndexOfBankRefNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Bank_Ref_No");
            int _columnIndexOfReferenceNo2 = _columnIndexOfBankRefNo;
            int _columnIndexOfBankRefNo2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "sent");
            List<theader> _result = new ArrayList<>();
            while (_stmt.step()) {
                theader _item2 = new theader();
                int _columnIndexOfSent2 = _columnIndexOfBankRefNo2;
                if (_stmt.isNull(_columnIndexOfSent)) {
                    _item = _item2;
                    _item.Key = null;
                } else {
                    _item = _item2;
                    _item.Key = _stmt.getText(_columnIndexOfSent);
                }
                if (_stmt.isNull(_tmp_29)) {
                    _item.No = null;
                } else {
                    _item.No = _stmt.getText(_tmp_29);
                }
                if (_stmt.isNull(_columnIndexOfDate)) {
                    _tmp = null;
                } else {
                    _tmp = Long.valueOf(_stmt.getLong(_columnIndexOfDate));
                }
                int _columnIndexOfKey = _columnIndexOfSent;
                _item.Date = Converters.DateConverter.toDate(_tmp);
                Integer _tmp_1 = _stmt.isNull(_columnIndexOfDateSpecified) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfDateSpecified));
                if (_tmp_1 == null) {
                    boolValueOf = null;
                } else {
                    boolValueOf = Boolean.valueOf(_tmp_1.intValue() != 0);
                }
                _item.DateSpecified = boolValueOf;
                if (_stmt.isNull(_columnIndexOfCashier)) {
                    _item.Cashier = null;
                } else {
                    _item.Cashier = _stmt.getText(_columnIndexOfCashier);
                }
                if (_stmt.isNull(_columnIndexOfDatePosted)) {
                    _tmp_2 = null;
                } else {
                    _tmp_2 = Long.valueOf(_stmt.getLong(_columnIndexOfDatePosted));
                }
                _item.Date_Posted = Converters.DateConverter.toDate(_tmp_2);
                Integer _tmp_3 = _stmt.isNull(_columnIndexOfDatePostedSpecified) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfDatePostedSpecified));
                if (_tmp_3 == null) {
                    boolValueOf2 = null;
                } else {
                    boolValueOf2 = Boolean.valueOf(_tmp_3.intValue() != 0);
                }
                _item.Date_PostedSpecified = boolValueOf2;
                if (_stmt.isNull(_columnIndexOfTimePosted)) {
                    _tmp_4 = null;
                } else {
                    _tmp_4 = Long.valueOf(_stmt.getLong(_columnIndexOfTimePosted));
                }
                _item.Time_Posted = Converters.DateConverter.toDate(_tmp_4);
                Integer _tmp_5 = _stmt.isNull(_columnIndexOfTimePostedSpecified) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfTimePostedSpecified));
                if (_tmp_5 == null) {
                    boolValueOf3 = null;
                } else {
                    boolValueOf3 = Boolean.valueOf(_tmp_5.intValue() != 0);
                }
                _item.Time_PostedSpecified = boolValueOf3;
                Integer _tmp_6 = _stmt.isNull(_columnIndexOfPosted) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfPosted));
                if (_tmp_6 == null) {
                    boolValueOf4 = null;
                } else {
                    boolValueOf4 = Boolean.valueOf(_tmp_6.intValue() != 0);
                }
                _item.Posted = boolValueOf4;
                Integer _tmp_7 = _stmt.isNull(_columnIndexOfPostedSpecified) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfPostedSpecified));
                if (_tmp_7 == null) {
                    boolValueOf5 = null;
                } else {
                    boolValueOf5 = Boolean.valueOf(_tmp_7.intValue() != 0);
                }
                _item.PostedSpecified = boolValueOf5;
                if (_stmt.isNull(_columnIndexOfNoSeries)) {
                    _item.No_Series = null;
                } else {
                    _item.No_Series = _stmt.getText(_columnIndexOfNoSeries);
                }
                if (_stmt.isNull(_columnIndexOfBankCode)) {
                    _item.Bank_Code = null;
                } else {
                    _item.Bank_Code = _stmt.getText(_columnIndexOfBankCode);
                }
                int _columnIndexOfReceivedFrom3 = _columnIndexOfReceivedFrom;
                if (_stmt.isNull(_columnIndexOfReceivedFrom3)) {
                    _item.Received_From = null;
                } else {
                    _item.Received_From = _stmt.getText(_columnIndexOfReceivedFrom3);
                }
                int _columnIndexOfOnBehalfOf = _columnIndexOfReceivedFrom2;
                if (_stmt.isNull(_columnIndexOfOnBehalfOf)) {
                    _item.On_Behalf_Of = null;
                } else {
                    _item.On_Behalf_Of = _stmt.getText(_columnIndexOfOnBehalfOf);
                }
                int _columnIndexOfDate2 = _columnIndexOfDate;
                int _columnIndexOfAmountRecieved3 = _columnIndexOfNo;
                int _columnIndexOfAmountRecieved4 = _tmp_29;
                _item.Amount_Recieved = (float) _stmt.getDouble(_columnIndexOfAmountRecieved3);
                int _columnIndexOfAmountRecievedSpecified3 = _columnIndexOfAmountRecieved2;
                Integer _tmp_8 = _stmt.isNull(_columnIndexOfAmountRecievedSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfAmountRecievedSpecified3));
                if (_tmp_8 == null) {
                    boolValueOf6 = null;
                } else {
                    boolValueOf6 = Boolean.valueOf(_tmp_8.intValue() != 0);
                }
                _item.Amount_RecievedSpecified = boolValueOf6;
                int _columnIndexOfGlobalDimension1Code4 = _columnIndexOfGlobalDimension1Code2;
                if (_stmt.isNull(_columnIndexOfGlobalDimension1Code4)) {
                    _item.Global_Dimension_1_Code = null;
                } else {
                    _item.Global_Dimension_1_Code = _stmt.getText(_columnIndexOfGlobalDimension1Code4);
                }
                int _columnIndexOfShortcutDimension2Code3 = _columnIndexOfGlobalDimension1Code3;
                if (_stmt.isNull(_columnIndexOfShortcutDimension2Code3)) {
                    _item.Shortcut_Dimension_2_Code = null;
                } else {
                    _item.Shortcut_Dimension_2_Code = _stmt.getText(_columnIndexOfShortcutDimension2Code3);
                }
                int _columnIndexOfCurrencyCode = _columnIndexOfShortcutDimension2Code2;
                if (_stmt.isNull(_columnIndexOfCurrencyCode)) {
                    _item.Currency_Code = null;
                } else {
                    _item.Currency_Code = _stmt.getText(_columnIndexOfCurrencyCode);
                }
                int _columnIndexOfCurrencyFactor3 = _columnIndexOfAmountRecievedSpecified2;
                _item.Currency_Factor = (float) _stmt.getDouble(_columnIndexOfCurrencyFactor3);
                int _columnIndexOfCurrencyFactorSpecified3 = _columnIndexOfCurrencyFactor2;
                Integer _tmp_9 = _stmt.isNull(_columnIndexOfCurrencyFactorSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfCurrencyFactorSpecified3));
                if (_tmp_9 == null) {
                    boolValueOf7 = null;
                } else {
                    boolValueOf7 = Boolean.valueOf(_tmp_9.intValue() != 0);
                }
                _item.Currency_FactorSpecified = boolValueOf7;
                int _columnIndexOfTotalAmount3 = _columnIndexOfCurrencyFactorSpecified2;
                _item.Total_Amount = (float) _stmt.getDouble(_columnIndexOfTotalAmount3);
                int _columnIndexOfTotalAmountSpecified3 = _columnIndexOfTotalAmount2;
                Integer _tmp_10 = _stmt.isNull(_columnIndexOfTotalAmountSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfTotalAmountSpecified3));
                if (_tmp_10 == null) {
                    boolValueOf8 = null;
                } else {
                    boolValueOf8 = Boolean.valueOf(_tmp_10.intValue() != 0);
                }
                _item.Total_AmountSpecified = boolValueOf8;
                int _columnIndexOfPostedBy3 = _columnIndexOfPostedBy2;
                if (_stmt.isNull(_columnIndexOfPostedBy3)) {
                    _item.Posted_By = null;
                } else {
                    _item.Posted_By = _stmt.getText(_columnIndexOfPostedBy3);
                }
                int _columnIndexOfPrintNo3 = _columnIndexOfTotalAmountSpecified2;
                _item.Print_No = (int) _stmt.getLong(_columnIndexOfPrintNo3);
                int _columnIndexOfPrintNoSpecified3 = _columnIndexOfPrintNo2;
                Integer _tmp_11 = _stmt.isNull(_columnIndexOfPrintNoSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfPrintNoSpecified3));
                if (_tmp_11 == null) {
                    boolValueOf9 = null;
                } else {
                    boolValueOf9 = Boolean.valueOf(_tmp_11.intValue() != 0);
                }
                _item.Print_NoSpecified = boolValueOf9;
                int _columnIndexOfStatusSpecified = _columnIndexOfPrintNoSpecified2;
                Integer _tmp_12 = _stmt.isNull(_columnIndexOfStatusSpecified) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfStatusSpecified));
                if (_tmp_12 == null) {
                    boolValueOf10 = null;
                } else {
                    boolValueOf10 = Boolean.valueOf(_tmp_12.intValue() != 0);
                }
                _item.StatusSpecified = boolValueOf10;
                int _columnIndexOfChequeNo3 = _columnIndexOfChequeNo2;
                if (_stmt.isNull(_columnIndexOfChequeNo3)) {
                    _item.Cheque_No = null;
                } else {
                    _item.Cheque_No = _stmt.getText(_columnIndexOfChequeNo3);
                }
                int _columnIndexOfNoPrinted4 = _columnIndexOfNoPrinted2;
                _item.No_Printed = (int) _stmt.getLong(_columnIndexOfNoPrinted4);
                int _columnIndexOfNoPrintedSpecified3 = _columnIndexOfNoPrinted3;
                Integer _tmp_13 = _stmt.isNull(_columnIndexOfNoPrintedSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfNoPrintedSpecified3));
                if (_tmp_13 == null) {
                    boolValueOf11 = null;
                } else {
                    boolValueOf11 = Boolean.valueOf(_tmp_13.intValue() != 0);
                }
                _item.No_PrintedSpecified = boolValueOf11;
                int _columnIndexOfCreatedBy4 = _columnIndexOfCreatedBy2;
                if (_stmt.isNull(_columnIndexOfCreatedBy4)) {
                    _item.Created_By = null;
                } else {
                    _item.Created_By = _stmt.getText(_columnIndexOfCreatedBy4);
                }
                int _columnIndexOfCreatedDateTime3 = _columnIndexOfCreatedDateTime2;
                if (_stmt.isNull(_columnIndexOfCreatedDateTime3)) {
                    _tmp_14 = null;
                } else {
                    _tmp_14 = Long.valueOf(_stmt.getLong(_columnIndexOfCreatedDateTime3));
                }
                _item.Created_Date_Time = Converters.DateConverter.toDate(_tmp_14);
                int _columnIndexOfCreatedDateTimeSpecified = _columnIndexOfNoPrintedSpecified2;
                Integer _tmp_112 = _stmt.isNull(_columnIndexOfCreatedDateTimeSpecified) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfCreatedDateTimeSpecified));
                if (_tmp_112 == null) {
                    boolValueOf12 = null;
                } else {
                    boolValueOf12 = Boolean.valueOf(_tmp_112.intValue() != 0);
                }
                _item.Created_Date_TimeSpecified = boolValueOf12;
                int _columnIndexOfRegisterNo3 = _columnIndexOfCreatedBy3;
                _item.Register_No = (int) _stmt.getLong(_columnIndexOfRegisterNo3);
                int _columnIndexOfRegisterNoSpecified3 = _columnIndexOfRegisterNo2;
                if (_stmt.isNull(_columnIndexOfRegisterNoSpecified3)) {
                    Integer num = _tmp_112;
                    _tmp_16 = null;
                    _tmp_15 = num;
                } else {
                    _tmp_15 = _tmp_112;
                    _tmp_16 = Integer.valueOf((int) _stmt.getLong(_columnIndexOfRegisterNoSpecified3));
                }
                if (_tmp_16 == null) {
                    boolValueOf13 = null;
                } else {
                    boolValueOf13 = Boolean.valueOf(_tmp_16.intValue() != 0);
                }
                _item.Register_NoSpecified = boolValueOf13;
                int _columnIndexOfFromEntryNo3 = _columnIndexOfRegisterNoSpecified2;
                _item.From_Entry_No = (int) _stmt.getLong(_columnIndexOfFromEntryNo3);
                int _columnIndexOfFromEntryNoSpecified3 = _columnIndexOfFromEntryNo2;
                if (_stmt.isNull(_columnIndexOfFromEntryNoSpecified3)) {
                    Integer num2 = _tmp_16;
                    _tmp_18 = null;
                    _tmp_17 = num2;
                } else {
                    _tmp_17 = _tmp_16;
                    _tmp_18 = Integer.valueOf((int) _stmt.getLong(_columnIndexOfFromEntryNoSpecified3));
                }
                if (_tmp_18 == null) {
                    boolValueOf14 = null;
                } else {
                    boolValueOf14 = Boolean.valueOf(_tmp_18.intValue() != 0);
                }
                _item.From_Entry_NoSpecified = boolValueOf14;
                int _columnIndexOfToEntryNo3 = _columnIndexOfFromEntryNoSpecified2;
                _item.To_Entry_No = (int) _stmt.getLong(_columnIndexOfToEntryNo3);
                int _columnIndexOfToEntryNoSpecified3 = _columnIndexOfToEntryNo2;
                if (_stmt.isNull(_columnIndexOfToEntryNoSpecified3)) {
                    Integer num3 = _tmp_18;
                    _tmp_110 = null;
                    _tmp_19 = num3;
                } else {
                    _tmp_19 = _tmp_18;
                    _tmp_110 = Integer.valueOf((int) _stmt.getLong(_columnIndexOfToEntryNoSpecified3));
                }
                if (_tmp_110 == null) {
                    boolValueOf15 = null;
                } else {
                    boolValueOf15 = Boolean.valueOf(_tmp_110.intValue() != 0);
                }
                _item.To_Entry_NoSpecified = boolValueOf15;
                int _columnIndexOfDocumentDate3 = _columnIndexOfDocumentDate2;
                if (_stmt.isNull(_columnIndexOfDocumentDate3)) {
                    _tmp_111 = null;
                } else {
                    _tmp_111 = Long.valueOf(_stmt.getLong(_columnIndexOfDocumentDate3));
                }
                _item.Document_Date = Converters.DateConverter.toDate(_tmp_111);
                int _columnIndexOfDocumentDateSpecified4 = _columnIndexOfDocumentDateSpecified2;
                Integer _tmp_113 = _stmt.isNull(_columnIndexOfDocumentDateSpecified4) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfDocumentDateSpecified4));
                if (_tmp_113 == null) {
                    boolValueOf16 = null;
                } else {
                    boolValueOf16 = Boolean.valueOf(_tmp_113.intValue() != 0);
                }
                _item.Document_DateSpecified = boolValueOf16;
                int _columnIndexOfResponsibilityCenter = _columnIndexOfDocumentDateSpecified3;
                if (_stmt.isNull(_columnIndexOfResponsibilityCenter)) {
                    _item.Responsibility_Center = null;
                } else {
                    _item.Responsibility_Center = _stmt.getText(_columnIndexOfResponsibilityCenter);
                }
                int _columnIndexOfShortcutDimension3Code3 = _columnIndexOfToEntryNoSpecified2;
                if (_stmt.isNull(_columnIndexOfShortcutDimension3Code3)) {
                    _item.Shortcut_Dimension_3_Code = null;
                } else {
                    _item.Shortcut_Dimension_3_Code = _stmt.getText(_columnIndexOfShortcutDimension3Code3);
                }
                int _columnIndexOfShortcutDimension4Code3 = _columnIndexOfShortcutDimension3Code2;
                if (_stmt.isNull(_columnIndexOfShortcutDimension4Code3)) {
                    _item.Shortcut_Dimension_4_Code = null;
                } else {
                    _item.Shortcut_Dimension_4_Code = _stmt.getText(_columnIndexOfShortcutDimension4Code3);
                }
                int _columnIndexOfDim9 = _columnIndexOfShortcutDimension4Code2;
                if (_stmt.isNull(_columnIndexOfDim9)) {
                    _item.Dim3 = null;
                } else {
                    _item.Dim3 = _stmt.getText(_columnIndexOfDim9);
                }
                int _columnIndexOfDim10 = _columnIndexOfDim5;
                if (_stmt.isNull(_columnIndexOfDim10)) {
                    _item.Dim4 = null;
                } else {
                    _item.Dim4 = _stmt.getText(_columnIndexOfDim10);
                }
                int _columnIndexOfBankName3 = _columnIndexOfDim6;
                if (_stmt.isNull(_columnIndexOfBankName3)) {
                    _item.Bank_Name = null;
                } else {
                    _item.Bank_Name = _stmt.getText(_columnIndexOfBankName3);
                }
                int _columnIndexOfReceiptTypeSpecified3 = _columnIndexOfReceiptTypeSpecified2;
                Integer _tmp_20 = _stmt.isNull(_columnIndexOfReceiptTypeSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfReceiptTypeSpecified3));
                if (_tmp_20 == null) {
                    boolValueOf17 = null;
                } else {
                    boolValueOf17 = Boolean.valueOf(_tmp_20.intValue() != 0);
                }
                _item.Receipt_TypeSpecified = boolValueOf17;
                int _columnIndexOfDimensionSetID3 = _columnIndexOfBankName2;
                _item.Dimension_Set_ID = (int) _stmt.getLong(_columnIndexOfDimensionSetID3);
                int _columnIndexOfDimensionSetIDSpecified3 = _columnIndexOfDimensionSetID2;
                if (_stmt.isNull(_columnIndexOfDimensionSetIDSpecified3)) {
                    Integer num4 = _tmp_20;
                    _tmp_22 = null;
                    _tmp_21 = num4;
                } else {
                    _tmp_21 = _tmp_20;
                    _tmp_22 = Integer.valueOf((int) _stmt.getLong(_columnIndexOfDimensionSetIDSpecified3));
                }
                if (_tmp_22 == null) {
                    boolValueOf18 = null;
                } else {
                    boolValueOf18 = Boolean.valueOf(_tmp_22.intValue() != 0);
                }
                _item.Dimension_Set_IDSpecified = boolValueOf18;
                int _columnIndexOfDim11 = _columnIndexOfDim2;
                if (_stmt.isNull(_columnIndexOfDim11)) {
                    _item.Dim1 = null;
                } else {
                    _item.Dim1 = _stmt.getText(_columnIndexOfDim11);
                }
                int _columnIndexOfDim12 = _columnIndexOfDimensionSetIDSpecified2;
                if (_stmt.isNull(_columnIndexOfDim12)) {
                    _item.Dim2 = null;
                } else {
                    _item.Dim2 = _stmt.getText(_columnIndexOfDim12);
                }
                int _columnIndexOfAccountNo3 = _columnIndexOfDim8;
                if (_stmt.isNull(_columnIndexOfAccountNo3)) {
                    _item.Account_No = null;
                } else {
                    _item.Account_No = _stmt.getText(_columnIndexOfAccountNo3);
                }
                int _columnIndexOfName3 = _columnIndexOfAccountNo2;
                if (_stmt.isNull(_columnIndexOfName3)) {
                    _item.Name = null;
                } else {
                    _item.Name = _stmt.getText(_columnIndexOfName3);
                }
                int _columnIndexOfPayMode3 = _columnIndexOfName2;
                if (_stmt.isNull(_columnIndexOfPayMode3)) {
                    _item.PayMode = null;
                } else {
                    _item.PayMode = _stmt.getText(_columnIndexOfPayMode3);
                }
                int _columnIndexOfPayModeSpecified4 = _columnIndexOfPayModeSpecified2;
                Integer _tmp_23 = _stmt.isNull(_columnIndexOfPayModeSpecified4) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfPayModeSpecified4));
                if (_tmp_23 == null) {
                    boolValueOf19 = null;
                } else {
                    boolValueOf19 = Boolean.valueOf(_tmp_23.intValue() != 0);
                }
                _item.Pay_ModeSpecified = boolValueOf19;
                int _columnIndexOfChequeDepositSlipNo = _columnIndexOfPayModeSpecified3;
                if (_stmt.isNull(_columnIndexOfChequeDepositSlipNo)) {
                    _item.Cheque_Deposit_Slip_No = null;
                } else {
                    _item.Cheque_Deposit_Slip_No = _stmt.getText(_columnIndexOfChequeDepositSlipNo);
                }
                int _columnIndexOfChequeDepositSlipDate3 = _columnIndexOfChequeDepositSlipDate2;
                if (_stmt.isNull(_columnIndexOfChequeDepositSlipDate3)) {
                    _tmp_24 = null;
                } else {
                    _tmp_24 = Long.valueOf(_stmt.getLong(_columnIndexOfChequeDepositSlipDate3));
                }
                _item.Cheque_Deposit_Slip_Date = Converters.DateConverter.toDate(_tmp_24);
                int _columnIndexOfChequeDepositSlipDateSpecified3 = _columnIndexOfChequeDepositSlipDateSpecified2;
                Integer _tmp_210 = _stmt.isNull(_columnIndexOfChequeDepositSlipDateSpecified3) ? null : Integer.valueOf((int) _stmt.getLong(_columnIndexOfChequeDepositSlipDateSpecified3));
                if (_tmp_210 == null) {
                    boolValueOf20 = null;
                } else {
                    boolValueOf20 = Boolean.valueOf(_tmp_210.intValue() != 0);
                }
                _item.Cheque_Deposit_Slip_DateSpecified = boolValueOf20;
                int _columnIndexOfTotalAmountGuaranteed3 = _columnIndexOfPayMode2;
                _item.Total_Amount_Guaranteed = (float) _stmt.getDouble(_columnIndexOfTotalAmountGuaranteed3);
                int _columnIndexOfTotalAmountGuaranteedSpecified3 = _columnIndexOfTotalAmountGuaranteed2;
                if (_stmt.isNull(_columnIndexOfTotalAmountGuaranteedSpecified3)) {
                    Integer num5 = _tmp_210;
                    _tmp_26 = null;
                    _tmp_25 = num5;
                } else {
                    _tmp_25 = _tmp_210;
                    _tmp_26 = Integer.valueOf((int) _stmt.getLong(_columnIndexOfTotalAmountGuaranteedSpecified3));
                }
                if (_tmp_26 == null) {
                    boolValueOf21 = null;
                } else {
                    boolValueOf21 = Boolean.valueOf(_tmp_26.intValue() != 0);
                }
                _item.Total_Amount_GuaranteedSpecified = boolValueOf21;
                int _columnIndexOfDFLT3 = _columnIndexOfTotalAmountGuaranteedSpecified2;
                _item.DFLT = (float) _stmt.getDouble(_columnIndexOfDFLT3);
                int _columnIndexOfDFLTSpecified3 = _columnIndexOfDFLT2;
                if (_stmt.isNull(_columnIndexOfDFLTSpecified3)) {
                    Integer num6 = _tmp_26;
                    _tmp_28 = null;
                    _tmp_27 = num6;
                } else {
                    _tmp_27 = _tmp_26;
                    _tmp_28 = Integer.valueOf((int) _stmt.getLong(_columnIndexOfDFLTSpecified3));
                }
                if (_tmp_28 == null) {
                    boolValueOf22 = null;
                } else {
                    boolValueOf22 = Boolean.valueOf(_tmp_28.intValue() != 0);
                }
                _item.DFLTSpecified = boolValueOf22;
                int _columnIndexOfGroupName3 = _columnIndexOfGroupName2;
                if (_stmt.isNull(_columnIndexOfGroupName3)) {
                    _item.Group_Name = null;
                } else {
                    _item.Group_Name = _stmt.getText(_columnIndexOfGroupName3);
                }
                int _columnIndexOfReferenceNo3 = _columnIndexOfDFLTSpecified2;
                if (_stmt.isNull(_columnIndexOfReferenceNo3)) {
                    _item.Reference_No = null;
                } else {
                    _item.Reference_No = _stmt.getText(_columnIndexOfReferenceNo3);
                }
                int _columnIndexOfBankRefNo3 = _columnIndexOfReferenceNo2;
                if (_stmt.isNull(_columnIndexOfBankRefNo3)) {
                    _item.Bank_Ref_No = null;
                } else {
                    _item.Bank_Ref_No = _stmt.getText(_columnIndexOfBankRefNo3);
                }
                int _tmp_211 = (int) _stmt.getLong(_columnIndexOfSent2);
                _item.sent = _tmp_211 != 0;
                List<theader> _result2 = _result;
                _result2.add(_item);
                _result = _result2;
                _columnIndexOfReceivedFrom = _columnIndexOfReceivedFrom3;
                _tmp_29 = _columnIndexOfAmountRecieved4;
                _columnIndexOfNo = _columnIndexOfAmountRecieved3;
                _columnIndexOfGlobalDimension1Code2 = _columnIndexOfGlobalDimension1Code4;
                _columnIndexOfGlobalDimension1Code3 = _columnIndexOfShortcutDimension2Code3;
                _columnIndexOfAmountRecieved2 = _columnIndexOfAmountRecievedSpecified3;
                _columnIndexOfAmountRecievedSpecified2 = _columnIndexOfCurrencyFactor3;
                _columnIndexOfCurrencyFactor2 = _columnIndexOfCurrencyFactorSpecified3;
                _columnIndexOfCurrencyFactorSpecified2 = _columnIndexOfTotalAmount3;
                _columnIndexOfTotalAmount2 = _columnIndexOfTotalAmountSpecified3;
                _columnIndexOfTotalAmountSpecified2 = _columnIndexOfPrintNo3;
                _columnIndexOfPrintNo2 = _columnIndexOfPrintNoSpecified3;
                _columnIndexOfNoPrinted2 = _columnIndexOfNoPrinted4;
                _columnIndexOfNoPrinted3 = _columnIndexOfNoPrintedSpecified3;
                _columnIndexOfCreatedBy2 = _columnIndexOfCreatedBy4;
                _columnIndexOfCreatedBy3 = _columnIndexOfRegisterNo3;
                _columnIndexOfRegisterNo2 = _columnIndexOfRegisterNoSpecified3;
                _columnIndexOfRegisterNoSpecified2 = _columnIndexOfFromEntryNo3;
                _columnIndexOfFromEntryNo2 = _columnIndexOfFromEntryNoSpecified3;
                _columnIndexOfFromEntryNoSpecified2 = _columnIndexOfToEntryNo3;
                _columnIndexOfDocumentDateSpecified2 = _columnIndexOfDocumentDateSpecified4;
                _columnIndexOfToEntryNo2 = _columnIndexOfToEntryNoSpecified3;
                _columnIndexOfToEntryNoSpecified2 = _columnIndexOfShortcutDimension3Code3;
                _columnIndexOfShortcutDimension3Code2 = _columnIndexOfShortcutDimension4Code3;
                _columnIndexOfShortcutDimension4Code2 = _columnIndexOfDim9;
                _columnIndexOfDim5 = _columnIndexOfDim10;
                _columnIndexOfDim6 = _columnIndexOfBankName3;
                _columnIndexOfBankName2 = _columnIndexOfDimensionSetID3;
                _columnIndexOfDimensionSetID2 = _columnIndexOfDimensionSetIDSpecified3;
                _columnIndexOfDimensionSetIDSpecified2 = _columnIndexOfDim12;
                _columnIndexOfDim8 = _columnIndexOfAccountNo3;
                _columnIndexOfAccountNo2 = _columnIndexOfName3;
                _columnIndexOfPayModeSpecified2 = _columnIndexOfPayModeSpecified4;
                _columnIndexOfName2 = _columnIndexOfPayMode3;
                _columnIndexOfPayMode2 = _columnIndexOfTotalAmountGuaranteed3;
                _columnIndexOfTotalAmountGuaranteed2 = _columnIndexOfTotalAmountGuaranteedSpecified3;
                _columnIndexOfTotalAmountGuaranteedSpecified2 = _columnIndexOfDFLT3;
                _columnIndexOfDFLT2 = _columnIndexOfDFLTSpecified3;
                _columnIndexOfDFLTSpecified2 = _columnIndexOfReferenceNo3;
                _columnIndexOfGroupName2 = _columnIndexOfGroupName3;
                _columnIndexOfDate = _columnIndexOfDate2;
                _columnIndexOfReceivedFrom2 = _columnIndexOfOnBehalfOf;
                _columnIndexOfShortcutDimension2Code2 = _columnIndexOfCurrencyCode;
                _columnIndexOfPostedBy2 = _columnIndexOfPostedBy3;
                _columnIndexOfChequeNo2 = _columnIndexOfChequeNo3;
                _columnIndexOfCreatedDateTime2 = _columnIndexOfCreatedDateTime3;
                _columnIndexOfPrintNoSpecified2 = _columnIndexOfStatusSpecified;
                _columnIndexOfNoPrintedSpecified2 = _columnIndexOfCreatedDateTimeSpecified;
                _columnIndexOfDocumentDate2 = _columnIndexOfDocumentDate3;
                _columnIndexOfDocumentDateSpecified3 = _columnIndexOfResponsibilityCenter;
                _columnIndexOfReceiptTypeSpecified2 = _columnIndexOfReceiptTypeSpecified3;
                _columnIndexOfDim2 = _columnIndexOfDim11;
                _columnIndexOfChequeDepositSlipDate2 = _columnIndexOfChequeDepositSlipDate3;
                _columnIndexOfPayModeSpecified3 = _columnIndexOfChequeDepositSlipNo;
                _columnIndexOfChequeDepositSlipDateSpecified2 = _columnIndexOfChequeDepositSlipDateSpecified3;
                _columnIndexOfReferenceNo2 = _columnIndexOfBankRefNo3;
                _columnIndexOfBankRefNo2 = _columnIndexOfSent2;
                _columnIndexOfSent = _columnIndexOfKey;
            }
            return _result;
        } finally {
            _stmt.close();
        }
    }

    @Override // com.trimline.metrocrew.theader.dao
    List<tlines> transaction_n_lines() {
        return (List) DBUtil.performBlocking(this.__db, true, true, new Function1() { // from class: com.trimline.metrocrew.theader_dao_Impl$$ExternalSyntheticLambda8
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m455xd92b4a7((SQLiteConnection) obj);
            }
        });
    }

    /* JADX WARN: Code duplicated, block: B:686:0x0e67  */
    /* JADX WARN: Code duplicated, block: B:687:0x0e69 A[Catch: all -> 0x0f3b, TRY_LEAVE, TryCatch #2 {all -> 0x0f3b, blocks: (B:3:0x0008, B:4:0x0213, B:21:0x0264, B:22:0x0271, B:24:0x0277, B:684:0x0e5f, B:694:0x0e7f, B:693:0x0e7a, B:687:0x0e69, B:219:0x06c9, B:227:0x06ea, B:233:0x06fa, B:237:0x070a, B:249:0x073f, B:255:0x0751, B:259:0x0761, B:270:0x0790, B:274:0x07a2, B:285:0x07d1, B:296:0x07fb, B:307:0x0824, B:313:0x0836, B:319:0x0846, B:326:0x085c, B:333:0x0872, B:344:0x08a8, B:351:0x08c0, B:358:0x08d6, B:365:0x08ec, B:376:0x0922, B:387:0x095a, B:394:0x0972, B:405:0x09a8, B:416:0x09dc, B:423:0x09f4, B:434:0x0a2a, B:441:0x0a42, B:445:0x0a55, B:456:0x0a8f, B:467:0x0acd, B:478:0x0b0b, B:489:0x0b49, B:493:0x0b5e, B:504:0x0b98, B:511:0x0bb0, B:518:0x0bc6, B:525:0x0bdc, B:532:0x0bf2, B:539:0x0c08, B:546:0x0c1e, B:557:0x0c4e, B:568:0x0c86, B:575:0x0c9e, B:582:0x0cb4, B:589:0x0cca, B:596:0x0ce0, B:603:0x0cf6, B:614:0x0d26, B:621:0x0d3e, B:625:0x0d51, B:636:0x0d8b, B:647:0x0dc9, B:658:0x0e07, B:665:0x0e1f, B:672:0x0e35, B:679:0x0e4b, B:683:0x0e5c, B:678:0x0e45, B:671:0x0e2f, B:664:0x0e19, B:653:0x0df9, B:657:0x0e03, B:650:0x0de9, B:642:0x0dbb, B:646:0x0dc5, B:639:0x0dab, B:631:0x0d7d, B:635:0x0d87, B:628:0x0d6c, B:624:0x0d49, B:620:0x0d38, B:609:0x0d18, B:613:0x0d22, B:606:0x0d07, B:602:0x0cf0, B:595:0x0cda, B:588:0x0cc4, B:581:0x0cae, B:574:0x0c98, B:563:0x0c78, B:567:0x0c82, B:560:0x0c69, B:552:0x0c40, B:556:0x0c4a, B:549:0x0c2f, B:545:0x0c18, B:538:0x0c02, B:531:0x0bec, B:524:0x0bd6, B:517:0x0bc0, B:510:0x0baa, B:499:0x0b8a, B:503:0x0b94, B:496:0x0b79, B:492:0x0b56, B:484:0x0b3b, B:488:0x0b45, B:481:0x0b2b, B:473:0x0afd, B:477:0x0b07, B:470:0x0aed, B:462:0x0abf, B:466:0x0ac9, B:459:0x0aaf, B:451:0x0a81, B:455:0x0a8b, B:448:0x0a70, B:444:0x0a4d, B:440:0x0a3c, B:429:0x0a1c, B:433:0x0a26, B:426:0x0a0d, B:422:0x09ee, B:411:0x09ce, B:415:0x09d8, B:408:0x09bd, B:400:0x099a, B:404:0x09a4, B:397:0x098b, B:393:0x096c, B:382:0x094c, B:386:0x0956, B:379:0x093d, B:371:0x0914, B:375:0x091e, B:368:0x0905, B:364:0x08e6, B:357:0x08d0, B:350:0x08ba, B:339:0x089a, B:343:0x08a4, B:336:0x088b, B:332:0x086c, B:325:0x0856, B:318:0x0840, B:312:0x0830, B:302:0x0816, B:306:0x0820, B:299:0x0807, B:291:0x07ed, B:295:0x07f7, B:288:0x07dd, B:280:0x07c3, B:284:0x07cd, B:277:0x07b4, B:273:0x079a, B:265:0x0782, B:269:0x078c, B:262:0x0773, B:258:0x0759, B:254:0x074b, B:244:0x072e, B:248:0x0739, B:240:0x071c, B:236:0x0702, B:232:0x06f4, B:226:0x06e4), top: B:710:0x0008 }] */
    /* JADX WARN: Code duplicated, block: B:689:0x0e6f  */
    /* JADX WARN: Code duplicated, block: B:692:0x0e78  */
    /* JADX INFO: renamed from: lambda$transaction_n_lines$6$com-trimline-metrocrew-theader_dao_Impl, reason: not valid java name */
    /* synthetic */ List m455xd92b4a7(SQLiteConnection _connection) throws Throwable {
        SQLiteStatement _stmt;
        int _columnIndexOfBankCode;
        List<tlines> _result;
        int _columnIndexOfReceivedFrom;
        ArrayMap<String, ArrayList<transaction>> _collectionTransactionList;
        int _columnIndexOfBankRefNo;
        theader _tmpTheader;
        Boolean boolValueOf;
        Boolean boolValueOf2;
        Boolean boolValueOf3;
        Boolean boolValueOf4;
        Boolean boolValueOf5;
        int _columnIndexOfGlobalDimension1Code;
        int _columnIndexOfReceivedFrom2;
        int _columnIndexOfShortcutDimension2Code;
        Boolean boolValueOf6;
        int _columnIndexOfCurrencyCode;
        int _columnIndexOfCurrencyCode2;
        int _columnIndexOfPostedBy;
        int _columnIndexOfCurrencyFactor;
        Boolean boolValueOf7;
        int _columnIndexOfTotalAmountSpecified;
        int _columnIndexOfTotalAmount;
        Boolean boolValueOf8;
        int _columnIndexOfPrintNoSpecified;
        int _columnIndexOfChequeNo;
        int _columnIndexOfPrintNo;
        int _columnIndexOfStatusSpecified;
        Boolean boolValueOf9;
        int _columnIndexOfNoPrintedSpecified;
        Boolean boolValueOf10;
        int _columnIndexOfChequeNo2;
        int _columnIndexOfCreatedBy;
        int _columnIndexOfCreatedDateTimeSpecified;
        Boolean boolValueOf11;
        int _columnIndexOfCreatedDateTime;
        Boolean boolValueOf12;
        int _columnIndexOfCreatedBy2;
        int _columnIndexOfRegisterNoSpecified;
        int _columnIndexOfRegisterNo;
        Boolean boolValueOf13;
        int _columnIndexOfFromEntryNoSpecified;
        int _columnIndexOfFromEntryNo;
        Boolean boolValueOf14;
        int _columnIndexOfToEntryNoSpecified;
        int _columnIndexOfToEntryNo;
        int _columnIndexOfReceiptTypeSpecified;
        Boolean boolValueOf15;
        int _columnIndexOfDocumentDate;
        int _columnIndexOfCreatedDateTimeSpecified2;
        int _columnIndexOfResponsibilityCenter;
        Boolean boolValueOf16;
        int _columnIndexOfResponsibilityCenter2;
        int _columnIndexOfShortcutDimension4Code;
        int _columnIndexOfDim3;
        int _columnIndexOfDim4;
        int _columnIndexOfBankName;
        int _columnIndexOfDim1;
        Boolean boolValueOf17;
        int _columnIndexOfDimensionSetIDSpecified;
        int _columnIndexOfDimensionSetID;
        int _columnIndexOfDim2;
        Boolean boolValueOf18;
        int _columnIndexOfAccountNo;
        int _columnIndexOfName;
        int _columnIndexOfPayMode;
        int _columnIndexOfPayMode2;
        int _columnIndexOfChequeDepositSlipNo;
        Boolean boolValueOf19;
        int _columnIndexOfChequeDepositSlipNo2;
        int _columnIndexOfChequeDepositSlipDate;
        int _columnIndexOfGroupName;
        Boolean boolValueOf20;
        int _columnIndexOfDim5;
        int _columnIndexOfTotalAmountGuaranteedSpecified;
        Boolean boolValueOf21;
        int _columnIndexOfDFLTSpecified;
        int _columnIndexOfDFLT;
        int _columnIndexOfDateSpecified;
        Boolean boolValueOf22;
        int _columnIndexOfBankRefNo2;
        int _columnIndexOfGroupName2;
        int _columnIndexOfNoSeries;
        int _columnIndexOfBankRefNo3;
        String _tmpKey_1;
        ArrayList<transaction> _tmpTransactionListCollection;
        String _tmpKey;
        int _columnIndexOfBankCode2;
        ArrayMap<String, ArrayList<transaction>> _collectionTransactionList2;
        SQLiteStatement _stmt2 = _connection.prepare("SELECT * FROM theader order by Created_Date_Time desc");
        try {
            int _columnIndexOfKey = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Key");
            int _columnIndexOfNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "No");
            int _columnIndexOfDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Date");
            int _columnIndexOfDFLTSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "DateSpecified");
            int _columnIndexOfAmountRecievedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Cashier");
            int _columnIndexOfDatePosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Date_Posted");
            int _columnIndexOfDatePostedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Date_PostedSpecified");
            int _columnIndexOfTimePosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Time_Posted");
            int _columnIndexOfTimePostedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Time_PostedSpecified");
            int _columnIndexOfPosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Posted");
            int _columnIndexOfPostedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "PostedSpecified");
            int _columnIndexOfNoSeries2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "No_Series");
            int _columnIndexOfBankCode3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Bank_Code");
            int _columnIndexOfReceivedFrom3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Received_From");
            int _columnIndexOfSent = _columnIndexOfReceivedFrom3;
            int _columnIndexOfOnBehalfOf = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "On_Behalf_Of");
            int _columnIndexOfOnBehalfOf2 = _columnIndexOfOnBehalfOf;
            int _columnIndexOfAmountRecieved = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Amount_Recieved");
            int _columnIndexOfAmountRecieved2 = _columnIndexOfAmountRecieved;
            int _columnIndexOfAmountRecievedSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Amount_RecievedSpecified");
            int _columnIndexOfAmountRecievedSpecified3 = _columnIndexOfAmountRecievedSpecified2;
            int _columnIndexOfGlobalDimension1Code2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Global_Dimension_1_Code");
            int _columnIndexOfGlobalDimension1Code3 = _columnIndexOfGlobalDimension1Code2;
            int _columnIndexOfShortcutDimension2Code2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Shortcut_Dimension_2_Code");
            int _columnIndexOfShortcutDimension2Code3 = _columnIndexOfShortcutDimension2Code2;
            int _columnIndexOfCurrencyCode3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Currency_Code");
            int _columnIndexOfCurrencyCode4 = _columnIndexOfCurrencyCode3;
            int _columnIndexOfCurrencyFactor2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Currency_Factor");
            int _columnIndexOfCurrencyFactor3 = _columnIndexOfCurrencyFactor2;
            int _columnIndexOfCurrencyFactorSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Currency_FactorSpecified");
            int _columnIndexOfCurrencyFactorSpecified2 = _columnIndexOfCurrencyFactorSpecified;
            int _columnIndexOfTotalAmount2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Total_Amount");
            int _columnIndexOfTotalAmount3 = _columnIndexOfTotalAmount2;
            int _columnIndexOfTotalAmountSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Total_AmountSpecified");
            int _columnIndexOfTotalAmountSpecified3 = _columnIndexOfTotalAmountSpecified2;
            int _columnIndexOfPostedBy2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Posted_By");
            int _columnIndexOfPostedBy3 = _columnIndexOfPostedBy2;
            int _columnIndexOfPrintNo2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Print_No");
            int _columnIndexOfPrintNo3 = _columnIndexOfPrintNo2;
            int _columnIndexOfPrintNoSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Print_NoSpecified");
            int _columnIndexOfPrintNoSpecified3 = _columnIndexOfPrintNoSpecified2;
            int _columnIndexOfStatusSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "StatusSpecified");
            int _columnIndexOfStatusSpecified3 = _columnIndexOfStatusSpecified2;
            int _columnIndexOfChequeNo3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Cheque_No");
            int _columnIndexOfChequeNo4 = _columnIndexOfChequeNo3;
            int _columnIndexOfNoPrinted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "No_Printed");
            int _columnIndexOfNoPrinted2 = _columnIndexOfNoPrinted;
            int _columnIndexOfNoPrintedSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "No_PrintedSpecified");
            int _columnIndexOfNoPrintedSpecified3 = _columnIndexOfNoPrintedSpecified2;
            int _columnIndexOfCreatedBy3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Created_By");
            int _columnIndexOfCreatedBy4 = _columnIndexOfCreatedBy3;
            int _columnIndexOfCreatedDateTime2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Created_Date_Time");
            int _columnIndexOfCreatedDateTime3 = _columnIndexOfCreatedDateTime2;
            int _columnIndexOfCreatedDateTimeSpecified3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Created_Date_TimeSpecified");
            int _columnIndexOfCreatedDateTimeSpecified4 = _columnIndexOfCreatedDateTimeSpecified3;
            int _columnIndexOfRegisterNo2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Register_No");
            int _columnIndexOfRegisterNo3 = _columnIndexOfRegisterNo2;
            int _columnIndexOfRegisterNoSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Register_NoSpecified");
            int _columnIndexOfRegisterNoSpecified3 = _columnIndexOfRegisterNoSpecified2;
            int _columnIndexOfFromEntryNo2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "From_Entry_No");
            int _columnIndexOfFromEntryNo3 = _columnIndexOfFromEntryNo2;
            int _columnIndexOfFromEntryNoSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "From_Entry_NoSpecified");
            int _columnIndexOfFromEntryNoSpecified3 = _columnIndexOfFromEntryNoSpecified2;
            int _columnIndexOfToEntryNo2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "To_Entry_No");
            int _columnIndexOfToEntryNo3 = _columnIndexOfToEntryNo2;
            int _columnIndexOfToEntryNoSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "To_Entry_NoSpecified");
            int _columnIndexOfToEntryNoSpecified3 = _columnIndexOfToEntryNoSpecified2;
            int _columnIndexOfDocumentDate2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Document_Date");
            int _columnIndexOfDocumentDate3 = _columnIndexOfDocumentDate2;
            int _columnIndexOfDocumentDateSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Document_DateSpecified");
            int _columnIndexOfDocumentDateSpecified2 = _columnIndexOfDocumentDateSpecified;
            int _columnIndexOfResponsibilityCenter3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Responsibility_Center");
            int _columnIndexOfResponsibilityCenter4 = _columnIndexOfResponsibilityCenter3;
            int _columnIndexOfShortcutDimension3Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Shortcut_Dimension_3_Code");
            int _columnIndexOfShortcutDimension3Code2 = _columnIndexOfShortcutDimension3Code;
            int _columnIndexOfShortcutDimension4Code2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Shortcut_Dimension_4_Code");
            int _columnIndexOfShortcutDimension4Code3 = _columnIndexOfShortcutDimension4Code2;
            int _columnIndexOfDim6 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Dim3");
            int _columnIndexOfDim7 = _columnIndexOfDim6;
            int _columnIndexOfDim8 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Dim4");
            int _columnIndexOfDim9 = _columnIndexOfDim8;
            int _columnIndexOfBankName2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Bank_Name");
            int _columnIndexOfBankName3 = _columnIndexOfBankName2;
            int _columnIndexOfReceiptTypeSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Receipt_TypeSpecified");
            int _columnIndexOfReceiptTypeSpecified3 = _columnIndexOfReceiptTypeSpecified2;
            int _columnIndexOfDimensionSetID2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Dimension_Set_ID");
            int _columnIndexOfDimensionSetID3 = _columnIndexOfDimensionSetID2;
            int _columnIndexOfDimensionSetIDSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Dimension_Set_IDSpecified");
            int _columnIndexOfDimensionSetIDSpecified3 = _columnIndexOfDimensionSetIDSpecified2;
            int _columnIndexOfDim10 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Dim1");
            int _columnIndexOfDim11 = _columnIndexOfDim10;
            int _columnIndexOfDim12 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Dim2");
            int _columnIndexOfDim13 = _columnIndexOfDim12;
            int _columnIndexOfAccountNo2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Account_No");
            int _columnIndexOfAccountNo3 = _columnIndexOfAccountNo2;
            int _columnIndexOfName2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Name");
            int _columnIndexOfName3 = _columnIndexOfName2;
            int _columnIndexOfPayMode3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "PayMode");
            int _columnIndexOfPayMode4 = _columnIndexOfPayMode3;
            int _columnIndexOfPayModeSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Pay_ModeSpecified");
            int _columnIndexOfPayModeSpecified2 = _columnIndexOfPayModeSpecified;
            int _columnIndexOfChequeDepositSlipNo3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Cheque_Deposit_Slip_No");
            int _columnIndexOfChequeDepositSlipNo4 = _columnIndexOfChequeDepositSlipNo3;
            int _columnIndexOfChequeDepositSlipDate2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Cheque_Deposit_Slip_Date");
            int _columnIndexOfChequeDepositSlipDate3 = _columnIndexOfChequeDepositSlipDate2;
            int _columnIndexOfChequeDepositSlipDateSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Cheque_Deposit_Slip_DateSpecified");
            int _columnIndexOfChequeDepositSlipDateSpecified2 = _columnIndexOfChequeDepositSlipDateSpecified;
            int _columnIndexOfTotalAmountGuaranteed = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Total_Amount_Guaranteed");
            int _columnIndexOfTotalAmountGuaranteed2 = _columnIndexOfTotalAmountGuaranteed;
            int _columnIndexOfTotalAmountGuaranteedSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Total_Amount_GuaranteedSpecified");
            int _columnIndexOfTotalAmountGuaranteedSpecified3 = _columnIndexOfTotalAmountGuaranteedSpecified2;
            int _columnIndexOfDFLT2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "DFLT");
            int _columnIndexOfDFLT3 = _columnIndexOfDFLT2;
            int _columnIndexOfDFLTSpecified3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "DFLTSpecified");
            int _columnIndexOfDFLTSpecified4 = _columnIndexOfDFLTSpecified3;
            int _columnIndexOfGroupName3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Group_Name");
            int _columnIndexOfGroupName4 = _columnIndexOfGroupName3;
            int _columnIndexOfReferenceNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Reference_No");
            int _columnIndexOfReferenceNo2 = _columnIndexOfReferenceNo;
            int _columnIndexOfBankRefNo4 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Bank_Ref_No");
            int _columnIndexOfBankRefNo5 = _columnIndexOfBankRefNo4;
            int _columnIndexOfSent2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "sent");
            ArrayMap<String, ArrayList<transaction>> _collectionTransactionList3 = new ArrayMap<>();
            while (_stmt2.step()) {
                try {
                    if (_stmt2.isNull(_columnIndexOfNo)) {
                        _tmpKey = null;
                    } else {
                        String _tmpKey2 = _stmt2.getText(_columnIndexOfNo);
                        _tmpKey = _tmpKey2;
                    }
                    if (_tmpKey != null) {
                        _columnIndexOfBankCode2 = _columnIndexOfBankCode3;
                        _collectionTransactionList2 = _collectionTransactionList3;
                        if (!_collectionTransactionList2.containsKey(_tmpKey)) {
                            _collectionTransactionList2.put(_tmpKey, new ArrayList<>());
                        }
                    } else {
                        _columnIndexOfBankCode2 = _columnIndexOfBankCode3;
                        _collectionTransactionList2 = _collectionTransactionList3;
                    }
                    _columnIndexOfNoSeries2 = _columnIndexOfNoSeries2;
                    _columnIndexOfSent2 = _columnIndexOfSent2;
                    _collectionTransactionList3 = _collectionTransactionList2;
                    _columnIndexOfBankCode3 = _columnIndexOfBankCode2;
                } catch (Throwable th) {
                    th = th;
                    _stmt = _stmt2;
                    _stmt.close();
                    throw th;
                }
            }
            int _columnIndexOfBankCode4 = _columnIndexOfBankCode3;
            int _columnIndexOfGroupName5 = _columnIndexOfSent2;
            ArrayMap<String, ArrayList<transaction>> _collectionTransactionList4 = _collectionTransactionList3;
            int _columnIndexOfNoSeries3 = _columnIndexOfNoSeries2;
            _stmt2.reset();
            __fetchRelationshiptransactionAscomTrimlineMetrocrewTransaction(_connection, _collectionTransactionList4);
            List<tlines> _result2 = new ArrayList<>();
            while (_stmt2.step()) {
                try {
                    if (_stmt2.isNull(_columnIndexOfKey) && _stmt2.isNull(_columnIndexOfNo) && _stmt2.isNull(_columnIndexOfDate) && _stmt2.isNull(_columnIndexOfDFLTSpecified2) && _stmt2.isNull(_columnIndexOfAmountRecievedSpecified) && _stmt2.isNull(_columnIndexOfDatePosted) && _stmt2.isNull(_columnIndexOfDatePostedSpecified) && _stmt2.isNull(_columnIndexOfTimePosted) && _stmt2.isNull(_columnIndexOfTimePostedSpecified) && _stmt2.isNull(_columnIndexOfPosted) && _stmt2.isNull(_columnIndexOfPostedSpecified)) {
                        _columnIndexOfNoSeries3 = _columnIndexOfNoSeries3;
                        if (_stmt2.isNull(_columnIndexOfNoSeries3)) {
                            _columnIndexOfBankCode = _columnIndexOfBankCode4;
                            if (_stmt2.isNull(_columnIndexOfBankCode)) {
                                _result = _result2;
                                _columnIndexOfReceivedFrom = _columnIndexOfSent;
                                if (_stmt2.isNull(_columnIndexOfReceivedFrom)) {
                                    _collectionTransactionList = _collectionTransactionList4;
                                    int _columnIndexOfOnBehalfOf3 = _columnIndexOfOnBehalfOf2;
                                    if (_stmt2.isNull(_columnIndexOfOnBehalfOf3)) {
                                        _columnIndexOfOnBehalfOf2 = _columnIndexOfOnBehalfOf3;
                                        int _columnIndexOfOnBehalfOf4 = _columnIndexOfAmountRecieved2;
                                        if (_stmt2.isNull(_columnIndexOfOnBehalfOf4)) {
                                            _columnIndexOfAmountRecieved2 = _columnIndexOfOnBehalfOf4;
                                            int _columnIndexOfAmountRecieved3 = _columnIndexOfAmountRecievedSpecified3;
                                            if (_stmt2.isNull(_columnIndexOfAmountRecieved3)) {
                                                _columnIndexOfAmountRecievedSpecified3 = _columnIndexOfAmountRecieved3;
                                                int _columnIndexOfAmountRecievedSpecified4 = _columnIndexOfGlobalDimension1Code3;
                                                if (_stmt2.isNull(_columnIndexOfAmountRecievedSpecified4)) {
                                                    _columnIndexOfGlobalDimension1Code3 = _columnIndexOfAmountRecievedSpecified4;
                                                    int _columnIndexOfGlobalDimension1Code4 = _columnIndexOfShortcutDimension2Code3;
                                                    if (_stmt2.isNull(_columnIndexOfGlobalDimension1Code4)) {
                                                        _columnIndexOfShortcutDimension2Code3 = _columnIndexOfGlobalDimension1Code4;
                                                        int _columnIndexOfShortcutDimension2Code4 = _columnIndexOfCurrencyCode4;
                                                        if (_stmt2.isNull(_columnIndexOfShortcutDimension2Code4)) {
                                                            _columnIndexOfCurrencyCode4 = _columnIndexOfShortcutDimension2Code4;
                                                            int _columnIndexOfCurrencyCode5 = _columnIndexOfCurrencyFactor3;
                                                            if (_stmt2.isNull(_columnIndexOfCurrencyCode5)) {
                                                                _columnIndexOfCurrencyFactor3 = _columnIndexOfCurrencyCode5;
                                                                int _columnIndexOfCurrencyFactor4 = _columnIndexOfCurrencyFactorSpecified2;
                                                                if (_stmt2.isNull(_columnIndexOfCurrencyFactor4)) {
                                                                    _columnIndexOfCurrencyFactorSpecified2 = _columnIndexOfCurrencyFactor4;
                                                                    int _columnIndexOfCurrencyFactorSpecified3 = _columnIndexOfTotalAmount3;
                                                                    if (_stmt2.isNull(_columnIndexOfCurrencyFactorSpecified3)) {
                                                                        _columnIndexOfTotalAmount3 = _columnIndexOfCurrencyFactorSpecified3;
                                                                        int _columnIndexOfTotalAmount4 = _columnIndexOfTotalAmountSpecified3;
                                                                        if (_stmt2.isNull(_columnIndexOfTotalAmount4)) {
                                                                            _columnIndexOfTotalAmountSpecified3 = _columnIndexOfTotalAmount4;
                                                                            int _columnIndexOfTotalAmountSpecified4 = _columnIndexOfPostedBy3;
                                                                            if (_stmt2.isNull(_columnIndexOfTotalAmountSpecified4)) {
                                                                                _columnIndexOfPostedBy3 = _columnIndexOfTotalAmountSpecified4;
                                                                                int _columnIndexOfPostedBy4 = _columnIndexOfPrintNo3;
                                                                                if (_stmt2.isNull(_columnIndexOfPostedBy4)) {
                                                                                    _columnIndexOfPrintNo3 = _columnIndexOfPostedBy4;
                                                                                    int _columnIndexOfPrintNo4 = _columnIndexOfPrintNoSpecified3;
                                                                                    if (_stmt2.isNull(_columnIndexOfPrintNo4)) {
                                                                                        _columnIndexOfPrintNoSpecified3 = _columnIndexOfPrintNo4;
                                                                                        int _columnIndexOfPrintNoSpecified4 = _columnIndexOfStatusSpecified3;
                                                                                        if (_stmt2.isNull(_columnIndexOfPrintNoSpecified4)) {
                                                                                            _columnIndexOfStatusSpecified3 = _columnIndexOfPrintNoSpecified4;
                                                                                            int _columnIndexOfStatusSpecified4 = _columnIndexOfChequeNo4;
                                                                                            if (_stmt2.isNull(_columnIndexOfStatusSpecified4)) {
                                                                                                _columnIndexOfChequeNo4 = _columnIndexOfStatusSpecified4;
                                                                                                int _columnIndexOfChequeNo5 = _columnIndexOfNoPrinted2;
                                                                                                if (_stmt2.isNull(_columnIndexOfChequeNo5)) {
                                                                                                    _columnIndexOfNoPrinted2 = _columnIndexOfChequeNo5;
                                                                                                    int _columnIndexOfNoPrinted3 = _columnIndexOfNoPrintedSpecified3;
                                                                                                    if (_stmt2.isNull(_columnIndexOfNoPrinted3)) {
                                                                                                        _columnIndexOfNoPrintedSpecified3 = _columnIndexOfNoPrinted3;
                                                                                                        int _columnIndexOfNoPrintedSpecified4 = _columnIndexOfCreatedBy4;
                                                                                                        if (_stmt2.isNull(_columnIndexOfNoPrintedSpecified4)) {
                                                                                                            _columnIndexOfCreatedBy4 = _columnIndexOfNoPrintedSpecified4;
                                                                                                            int _columnIndexOfCreatedBy5 = _columnIndexOfCreatedDateTime3;
                                                                                                            if (_stmt2.isNull(_columnIndexOfCreatedBy5)) {
                                                                                                                _columnIndexOfCreatedDateTime3 = _columnIndexOfCreatedBy5;
                                                                                                                int _columnIndexOfCreatedDateTime4 = _columnIndexOfCreatedDateTimeSpecified4;
                                                                                                                if (_stmt2.isNull(_columnIndexOfCreatedDateTime4)) {
                                                                                                                    _columnIndexOfCreatedDateTimeSpecified4 = _columnIndexOfCreatedDateTime4;
                                                                                                                    int _columnIndexOfCreatedDateTimeSpecified5 = _columnIndexOfRegisterNo3;
                                                                                                                    if (_stmt2.isNull(_columnIndexOfCreatedDateTimeSpecified5)) {
                                                                                                                        _columnIndexOfRegisterNo3 = _columnIndexOfCreatedDateTimeSpecified5;
                                                                                                                        int _columnIndexOfRegisterNo4 = _columnIndexOfRegisterNoSpecified3;
                                                                                                                        if (_stmt2.isNull(_columnIndexOfRegisterNo4)) {
                                                                                                                            _columnIndexOfRegisterNoSpecified3 = _columnIndexOfRegisterNo4;
                                                                                                                            int _columnIndexOfRegisterNoSpecified4 = _columnIndexOfFromEntryNo3;
                                                                                                                            if (_stmt2.isNull(_columnIndexOfRegisterNoSpecified4)) {
                                                                                                                                _columnIndexOfFromEntryNo3 = _columnIndexOfRegisterNoSpecified4;
                                                                                                                                int _columnIndexOfFromEntryNo4 = _columnIndexOfFromEntryNoSpecified3;
                                                                                                                                if (_stmt2.isNull(_columnIndexOfFromEntryNo4)) {
                                                                                                                                    _columnIndexOfFromEntryNoSpecified3 = _columnIndexOfFromEntryNo4;
                                                                                                                                    int _columnIndexOfFromEntryNoSpecified4 = _columnIndexOfToEntryNo3;
                                                                                                                                    if (_stmt2.isNull(_columnIndexOfFromEntryNoSpecified4)) {
                                                                                                                                        _columnIndexOfToEntryNo3 = _columnIndexOfFromEntryNoSpecified4;
                                                                                                                                        int _columnIndexOfToEntryNo4 = _columnIndexOfToEntryNoSpecified3;
                                                                                                                                        if (_stmt2.isNull(_columnIndexOfToEntryNo4)) {
                                                                                                                                            _columnIndexOfToEntryNoSpecified3 = _columnIndexOfToEntryNo4;
                                                                                                                                            int _columnIndexOfToEntryNoSpecified4 = _columnIndexOfDocumentDate3;
                                                                                                                                            if (_stmt2.isNull(_columnIndexOfToEntryNoSpecified4)) {
                                                                                                                                                _columnIndexOfDocumentDate3 = _columnIndexOfToEntryNoSpecified4;
                                                                                                                                                int _columnIndexOfDocumentDate4 = _columnIndexOfDocumentDateSpecified2;
                                                                                                                                                if (_stmt2.isNull(_columnIndexOfDocumentDate4)) {
                                                                                                                                                    _columnIndexOfDocumentDateSpecified2 = _columnIndexOfDocumentDate4;
                                                                                                                                                    int _columnIndexOfDocumentDateSpecified3 = _columnIndexOfResponsibilityCenter4;
                                                                                                                                                    if (_stmt2.isNull(_columnIndexOfDocumentDateSpecified3)) {
                                                                                                                                                        _columnIndexOfResponsibilityCenter4 = _columnIndexOfDocumentDateSpecified3;
                                                                                                                                                        int _columnIndexOfResponsibilityCenter5 = _columnIndexOfShortcutDimension3Code2;
                                                                                                                                                        if (_stmt2.isNull(_columnIndexOfResponsibilityCenter5)) {
                                                                                                                                                            _columnIndexOfShortcutDimension3Code2 = _columnIndexOfResponsibilityCenter5;
                                                                                                                                                            int _columnIndexOfShortcutDimension3Code3 = _columnIndexOfShortcutDimension4Code3;
                                                                                                                                                            if (_stmt2.isNull(_columnIndexOfShortcutDimension3Code3)) {
                                                                                                                                                                _columnIndexOfShortcutDimension4Code3 = _columnIndexOfShortcutDimension3Code3;
                                                                                                                                                                int _columnIndexOfShortcutDimension4Code4 = _columnIndexOfDim7;
                                                                                                                                                                if (_stmt2.isNull(_columnIndexOfShortcutDimension4Code4)) {
                                                                                                                                                                    _columnIndexOfDim7 = _columnIndexOfShortcutDimension4Code4;
                                                                                                                                                                    int _columnIndexOfDim14 = _columnIndexOfDim9;
                                                                                                                                                                    if (_stmt2.isNull(_columnIndexOfDim14)) {
                                                                                                                                                                        _columnIndexOfDim9 = _columnIndexOfDim14;
                                                                                                                                                                        int _columnIndexOfDim15 = _columnIndexOfBankName3;
                                                                                                                                                                        if (_stmt2.isNull(_columnIndexOfDim15)) {
                                                                                                                                                                            _columnIndexOfBankName3 = _columnIndexOfDim15;
                                                                                                                                                                            int _columnIndexOfBankName4 = _columnIndexOfReceiptTypeSpecified3;
                                                                                                                                                                            if (_stmt2.isNull(_columnIndexOfBankName4)) {
                                                                                                                                                                                _columnIndexOfReceiptTypeSpecified3 = _columnIndexOfBankName4;
                                                                                                                                                                                int _columnIndexOfReceiptTypeSpecified4 = _columnIndexOfDimensionSetID3;
                                                                                                                                                                                if (_stmt2.isNull(_columnIndexOfReceiptTypeSpecified4)) {
                                                                                                                                                                                    _columnIndexOfDimensionSetID3 = _columnIndexOfReceiptTypeSpecified4;
                                                                                                                                                                                    int _columnIndexOfDimensionSetID4 = _columnIndexOfDimensionSetIDSpecified3;
                                                                                                                                                                                    if (_stmt2.isNull(_columnIndexOfDimensionSetID4)) {
                                                                                                                                                                                        _columnIndexOfDimensionSetIDSpecified3 = _columnIndexOfDimensionSetID4;
                                                                                                                                                                                        int _columnIndexOfDimensionSetIDSpecified4 = _columnIndexOfDim11;
                                                                                                                                                                                        if (_stmt2.isNull(_columnIndexOfDimensionSetIDSpecified4)) {
                                                                                                                                                                                            _columnIndexOfDim11 = _columnIndexOfDimensionSetIDSpecified4;
                                                                                                                                                                                            int _columnIndexOfDim16 = _columnIndexOfDim13;
                                                                                                                                                                                            if (_stmt2.isNull(_columnIndexOfDim16)) {
                                                                                                                                                                                                _columnIndexOfDim13 = _columnIndexOfDim16;
                                                                                                                                                                                                int _columnIndexOfDim17 = _columnIndexOfAccountNo3;
                                                                                                                                                                                                if (_stmt2.isNull(_columnIndexOfDim17)) {
                                                                                                                                                                                                    _columnIndexOfAccountNo3 = _columnIndexOfDim17;
                                                                                                                                                                                                    int _columnIndexOfAccountNo4 = _columnIndexOfName3;
                                                                                                                                                                                                    if (_stmt2.isNull(_columnIndexOfAccountNo4)) {
                                                                                                                                                                                                        _columnIndexOfName3 = _columnIndexOfAccountNo4;
                                                                                                                                                                                                        int _columnIndexOfName4 = _columnIndexOfPayMode4;
                                                                                                                                                                                                        if (_stmt2.isNull(_columnIndexOfName4)) {
                                                                                                                                                                                                            _columnIndexOfPayMode4 = _columnIndexOfName4;
                                                                                                                                                                                                            int _columnIndexOfPayMode5 = _columnIndexOfPayModeSpecified2;
                                                                                                                                                                                                            if (_stmt2.isNull(_columnIndexOfPayMode5)) {
                                                                                                                                                                                                                _columnIndexOfPayModeSpecified2 = _columnIndexOfPayMode5;
                                                                                                                                                                                                                int _columnIndexOfPayModeSpecified3 = _columnIndexOfChequeDepositSlipNo4;
                                                                                                                                                                                                                if (_stmt2.isNull(_columnIndexOfPayModeSpecified3)) {
                                                                                                                                                                                                                    _columnIndexOfChequeDepositSlipNo4 = _columnIndexOfPayModeSpecified3;
                                                                                                                                                                                                                    int _columnIndexOfChequeDepositSlipNo5 = _columnIndexOfChequeDepositSlipDate3;
                                                                                                                                                                                                                    if (_stmt2.isNull(_columnIndexOfChequeDepositSlipNo5)) {
                                                                                                                                                                                                                        _columnIndexOfChequeDepositSlipDate3 = _columnIndexOfChequeDepositSlipNo5;
                                                                                                                                                                                                                        int _columnIndexOfChequeDepositSlipDate4 = _columnIndexOfChequeDepositSlipDateSpecified2;
                                                                                                                                                                                                                        if (_stmt2.isNull(_columnIndexOfChequeDepositSlipDate4)) {
                                                                                                                                                                                                                            _columnIndexOfChequeDepositSlipDateSpecified2 = _columnIndexOfChequeDepositSlipDate4;
                                                                                                                                                                                                                            int _columnIndexOfChequeDepositSlipDateSpecified3 = _columnIndexOfTotalAmountGuaranteed2;
                                                                                                                                                                                                                            if (_stmt2.isNull(_columnIndexOfChequeDepositSlipDateSpecified3)) {
                                                                                                                                                                                                                                _columnIndexOfTotalAmountGuaranteed2 = _columnIndexOfChequeDepositSlipDateSpecified3;
                                                                                                                                                                                                                                int _columnIndexOfTotalAmountGuaranteed3 = _columnIndexOfTotalAmountGuaranteedSpecified3;
                                                                                                                                                                                                                                if (_stmt2.isNull(_columnIndexOfTotalAmountGuaranteed3)) {
                                                                                                                                                                                                                                    _columnIndexOfTotalAmountGuaranteedSpecified3 = _columnIndexOfTotalAmountGuaranteed3;
                                                                                                                                                                                                                                    int _columnIndexOfTotalAmountGuaranteedSpecified4 = _columnIndexOfDFLT3;
                                                                                                                                                                                                                                    if (_stmt2.isNull(_columnIndexOfTotalAmountGuaranteedSpecified4)) {
                                                                                                                                                                                                                                        _columnIndexOfDFLT3 = _columnIndexOfTotalAmountGuaranteedSpecified4;
                                                                                                                                                                                                                                        int _columnIndexOfDFLT4 = _columnIndexOfDFLTSpecified4;
                                                                                                                                                                                                                                        if (_stmt2.isNull(_columnIndexOfDFLT4)) {
                                                                                                                                                                                                                                            _columnIndexOfDFLTSpecified4 = _columnIndexOfDFLT4;
                                                                                                                                                                                                                                            int _columnIndexOfDFLTSpecified5 = _columnIndexOfGroupName4;
                                                                                                                                                                                                                                            if (_stmt2.isNull(_columnIndexOfDFLTSpecified5)) {
                                                                                                                                                                                                                                                _columnIndexOfGroupName4 = _columnIndexOfDFLTSpecified5;
                                                                                                                                                                                                                                                int _columnIndexOfGroupName6 = _columnIndexOfReferenceNo2;
                                                                                                                                                                                                                                                if (_stmt2.isNull(_columnIndexOfGroupName6)) {
                                                                                                                                                                                                                                                    _columnIndexOfReferenceNo2 = _columnIndexOfGroupName6;
                                                                                                                                                                                                                                                    int _columnIndexOfReferenceNo3 = _columnIndexOfBankRefNo5;
                                                                                                                                                                                                                                                    if (_stmt2.isNull(_columnIndexOfReferenceNo3)) {
                                                                                                                                                                                                                                                        _columnIndexOfBankRefNo5 = _columnIndexOfReferenceNo3;
                                                                                                                                                                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                                                        if (_stmt2.isNull(_columnIndexOfBankRefNo)) {
                                                                                                                                                                                                                                                            _columnIndexOfNo = _columnIndexOfNo;
                                                                                                                                                                                                                                                            _columnIndexOfReceivedFrom2 = _columnIndexOfReceivedFrom;
                                                                                                                                                                                                                                                            _columnIndexOfCurrencyCode2 = _columnIndexOfCurrencyCode4;
                                                                                                                                                                                                                                                            _columnIndexOfChequeNo2 = _columnIndexOfChequeNo4;
                                                                                                                                                                                                                                                            _columnIndexOfCreatedBy2 = _columnIndexOfCreatedBy4;
                                                                                                                                                                                                                                                            _columnIndexOfCreatedDateTime = _columnIndexOfCreatedDateTime3;
                                                                                                                                                                                                                                                            _columnIndexOfCreatedDateTimeSpecified2 = _columnIndexOfCreatedDateTimeSpecified4;
                                                                                                                                                                                                                                                            _columnIndexOfDocumentDate = _columnIndexOfDocumentDate3;
                                                                                                                                                                                                                                                            _columnIndexOfResponsibilityCenter2 = _columnIndexOfResponsibilityCenter4;
                                                                                                                                                                                                                                                            _columnIndexOfDim5 = _columnIndexOfDim11;
                                                                                                                                                                                                                                                            _columnIndexOfPayMode2 = _columnIndexOfPayMode4;
                                                                                                                                                                                                                                                            _columnIndexOfChequeDepositSlipNo2 = _columnIndexOfChequeDepositSlipNo4;
                                                                                                                                                                                                                                                            _columnIndexOfChequeDepositSlipDate = _columnIndexOfChequeDepositSlipDate3;
                                                                                                                                                                                                                                                            _columnIndexOfGroupName2 = _columnIndexOfGroupName4;
                                                                                                                                                                                                                                                            _columnIndexOfBankRefNo3 = _columnIndexOfBankRefNo5;
                                                                                                                                                                                                                                                            _tmpTheader = null;
                                                                                                                                                                                                                                                            _columnIndexOfNoSeries3 = _columnIndexOfNoSeries3;
                                                                                                                                                                                                                                                            _columnIndexOfNoSeries = _columnIndexOfBankRefNo;
                                                                                                                                                                                                                                                            _columnIndexOfCurrencyCode = _columnIndexOfShortcutDimension2Code3;
                                                                                                                                                                                                                                                            _columnIndexOfChequeNo = _columnIndexOfPrintNo3;
                                                                                                                                                                                                                                                            _columnIndexOfCreatedBy = _columnIndexOfNoPrinted2;
                                                                                                                                                                                                                                                            _columnIndexOfCreatedDateTimeSpecified = _columnIndexOfNoPrintedSpecified3;
                                                                                                                                                                                                                                                            _columnIndexOfResponsibilityCenter = _columnIndexOfDocumentDateSpecified2;
                                                                                                                                                                                                                                                            _columnIndexOfDim1 = _columnIndexOfBankName3;
                                                                                                                                                                                                                                                            _columnIndexOfPayMode = _columnIndexOfName3;
                                                                                                                                                                                                                                                            _columnIndexOfChequeDepositSlipNo = _columnIndexOfPayModeSpecified2;
                                                                                                                                                                                                                                                            _columnIndexOfGroupName = _columnIndexOfChequeDepositSlipDateSpecified2;
                                                                                                                                                                                                                                                            _columnIndexOfBankRefNo2 = _columnIndexOfReferenceNo2;
                                                                                                                                                                                                                                                            _columnIndexOfShortcutDimension2Code = _columnIndexOfAmountRecieved2;
                                                                                                                                                                                                                                                            _columnIndexOfPrintNo = _columnIndexOfTotalAmountSpecified3;
                                                                                                                                                                                                                                                            _columnIndexOfNoPrintedSpecified = _columnIndexOfStatusSpecified3;
                                                                                                                                                                                                                                                            _columnIndexOfBankName = _columnIndexOfDim9;
                                                                                                                                                                                                                                                            _columnIndexOfName = _columnIndexOfAccountNo3;
                                                                                                                                                                                                                                                            _columnIndexOfTotalAmountSpecified = _columnIndexOfTotalAmount3;
                                                                                                                                                                                                                                                            _columnIndexOfStatusSpecified = _columnIndexOfPrintNoSpecified3;
                                                                                                                                                                                                                                                            _columnIndexOfDim4 = _columnIndexOfDim7;
                                                                                                                                                                                                                                                            _columnIndexOfAccountNo = _columnIndexOfDim13;
                                                                                                                                                                                                                                                            _columnIndexOfDateSpecified = _columnIndexOfDFLTSpecified4;
                                                                                                                                                                                                                                                            _columnIndexOfTotalAmount = _columnIndexOfCurrencyFactorSpecified2;
                                                                                                                                                                                                                                                            _columnIndexOfPrintNoSpecified = _columnIndexOfPostedBy3;
                                                                                                                                                                                                                                                            _columnIndexOfDim3 = _columnIndexOfShortcutDimension4Code3;
                                                                                                                                                                                                                                                            _columnIndexOfDim2 = _columnIndexOfDimensionSetIDSpecified3;
                                                                                                                                                                                                                                                            _columnIndexOfDFLTSpecified = _columnIndexOfDFLT3;
                                                                                                                                                                                                                                                            _columnIndexOfPostedBy = _columnIndexOfCurrencyFactor3;
                                                                                                                                                                                                                                                            _columnIndexOfShortcutDimension4Code = _columnIndexOfShortcutDimension3Code2;
                                                                                                                                                                                                                                                            _columnIndexOfDimensionSetIDSpecified = _columnIndexOfDimensionSetID3;
                                                                                                                                                                                                                                                            _columnIndexOfDFLT = _columnIndexOfTotalAmountGuaranteedSpecified3;
                                                                                                                                                                                                                                                            _columnIndexOfCurrencyFactor = _columnIndexOfAmountRecievedSpecified3;
                                                                                                                                                                                                                                                            _columnIndexOfDimensionSetID = _columnIndexOfReceiptTypeSpecified3;
                                                                                                                                                                                                                                                            _columnIndexOfTotalAmountGuaranteedSpecified = _columnIndexOfTotalAmountGuaranteed2;
                                                                                                                                                                                                                                                            _columnIndexOfAmountRecievedSpecified = _columnIndexOfAmountRecievedSpecified;
                                                                                                                                                                                                                                                            _columnIndexOfReceiptTypeSpecified = _columnIndexOfToEntryNoSpecified3;
                                                                                                                                                                                                                                                            _columnIndexOfToEntryNoSpecified = _columnIndexOfToEntryNo3;
                                                                                                                                                                                                                                                            _columnIndexOfToEntryNo = _columnIndexOfFromEntryNoSpecified3;
                                                                                                                                                                                                                                                            _columnIndexOfFromEntryNoSpecified = _columnIndexOfFromEntryNo3;
                                                                                                                                                                                                                                                            _columnIndexOfFromEntryNo = _columnIndexOfRegisterNoSpecified3;
                                                                                                                                                                                                                                                            _columnIndexOfRegisterNoSpecified = _columnIndexOfRegisterNo3;
                                                                                                                                                                                                                                                            _columnIndexOfRegisterNo = _columnIndexOfGlobalDimension1Code3;
                                                                                                                                                                                                                                                            _columnIndexOfGlobalDimension1Code = _columnIndexOfOnBehalfOf2;
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                        _columnIndexOfNo = _columnIndexOfNo;
                                                                                                                                                                                                                                                        if (_stmt2.isNull(_columnIndexOfNo)) {
                                                                                                                                                                                                                                                            _tmpKey_1 = null;
                                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                                            _tmpKey_1 = _stmt2.getText(_columnIndexOfNo);
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                        if (_tmpKey_1 != null) {
                                                                                                                                                                                                                                                            _collectionTransactionList4 = _collectionTransactionList;
                                                                                                                                                                                                                                                            _tmpTransactionListCollection = _collectionTransactionList4.get(_tmpKey_1);
                                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                                            _collectionTransactionList4 = _collectionTransactionList;
                                                                                                                                                                                                                                                            _tmpTransactionListCollection = new ArrayList<>();
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                        tlines _item = new tlines();
                                                                                                                                                                                                                                                        int _columnIndexOfSent3 = _columnIndexOfNoSeries;
                                                                                                                                                                                                                                                        _item.theader = _tmpTheader;
                                                                                                                                                                                                                                                        _item.transactionList = _tmpTransactionListCollection;
                                                                                                                                                                                                                                                        _stmt = _stmt2;
                                                                                                                                                                                                                                                        List<tlines> _result3 = _result;
                                                                                                                                                                                                                                                        _result3.add(_item);
                                                                                                                                                                                                                                                        _result2 = _result3;
                                                                                                                                                                                                                                                        _columnIndexOfBankCode4 = _columnIndexOfBankCode;
                                                                                                                                                                                                                                                        _stmt2 = _stmt;
                                                                                                                                                                                                                                                        _columnIndexOfAmountRecievedSpecified = _columnIndexOfAmountRecievedSpecified;
                                                                                                                                                                                                                                                        _columnIndexOfOnBehalfOf2 = _columnIndexOfGlobalDimension1Code;
                                                                                                                                                                                                                                                        _columnIndexOfAmountRecievedSpecified3 = _columnIndexOfCurrencyFactor;
                                                                                                                                                                                                                                                        _columnIndexOfCurrencyFactorSpecified2 = _columnIndexOfTotalAmount;
                                                                                                                                                                                                                                                        _columnIndexOfTotalAmount3 = _columnIndexOfTotalAmountSpecified;
                                                                                                                                                                                                                                                        _columnIndexOfCurrencyFactor3 = _columnIndexOfPostedBy;
                                                                                                                                                                                                                                                        _columnIndexOfTotalAmountSpecified3 = _columnIndexOfPrintNo;
                                                                                                                                                                                                                                                        _columnIndexOfPostedBy3 = _columnIndexOfPrintNoSpecified;
                                                                                                                                                                                                                                                        _columnIndexOfPrintNoSpecified3 = _columnIndexOfStatusSpecified;
                                                                                                                                                                                                                                                        _columnIndexOfPrintNo3 = _columnIndexOfChequeNo;
                                                                                                                                                                                                                                                        _columnIndexOfStatusSpecified3 = _columnIndexOfNoPrintedSpecified;
                                                                                                                                                                                                                                                        _columnIndexOfNoPrinted2 = _columnIndexOfCreatedBy;
                                                                                                                                                                                                                                                        _columnIndexOfNoPrintedSpecified3 = _columnIndexOfCreatedDateTimeSpecified;
                                                                                                                                                                                                                                                        _columnIndexOfGlobalDimension1Code3 = _columnIndexOfRegisterNo;
                                                                                                                                                                                                                                                        _columnIndexOfRegisterNo3 = _columnIndexOfRegisterNoSpecified;
                                                                                                                                                                                                                                                        _columnIndexOfRegisterNoSpecified3 = _columnIndexOfFromEntryNo;
                                                                                                                                                                                                                                                        _columnIndexOfFromEntryNo3 = _columnIndexOfFromEntryNoSpecified;
                                                                                                                                                                                                                                                        _columnIndexOfFromEntryNoSpecified3 = _columnIndexOfToEntryNo;
                                                                                                                                                                                                                                                        _columnIndexOfToEntryNo3 = _columnIndexOfToEntryNoSpecified;
                                                                                                                                                                                                                                                        _columnIndexOfDocumentDateSpecified2 = _columnIndexOfResponsibilityCenter;
                                                                                                                                                                                                                                                        _columnIndexOfShortcutDimension3Code2 = _columnIndexOfShortcutDimension4Code;
                                                                                                                                                                                                                                                        _columnIndexOfShortcutDimension4Code3 = _columnIndexOfDim3;
                                                                                                                                                                                                                                                        _columnIndexOfDim7 = _columnIndexOfDim4;
                                                                                                                                                                                                                                                        _columnIndexOfDim9 = _columnIndexOfBankName;
                                                                                                                                                                                                                                                        _columnIndexOfToEntryNoSpecified3 = _columnIndexOfReceiptTypeSpecified;
                                                                                                                                                                                                                                                        _columnIndexOfReceiptTypeSpecified3 = _columnIndexOfDimensionSetID;
                                                                                                                                                                                                                                                        _columnIndexOfDimensionSetID3 = _columnIndexOfDimensionSetIDSpecified;
                                                                                                                                                                                                                                                        _columnIndexOfBankName3 = _columnIndexOfDim1;
                                                                                                                                                                                                                                                        _columnIndexOfDimensionSetIDSpecified3 = _columnIndexOfDim2;
                                                                                                                                                                                                                                                        _columnIndexOfDim13 = _columnIndexOfAccountNo;
                                                                                                                                                                                                                                                        _columnIndexOfAccountNo3 = _columnIndexOfName;
                                                                                                                                                                                                                                                        _columnIndexOfName3 = _columnIndexOfPayMode;
                                                                                                                                                                                                                                                        _columnIndexOfPayModeSpecified2 = _columnIndexOfChequeDepositSlipNo;
                                                                                                                                                                                                                                                        _columnIndexOfTotalAmountGuaranteed2 = _columnIndexOfTotalAmountGuaranteedSpecified;
                                                                                                                                                                                                                                                        _columnIndexOfTotalAmountGuaranteedSpecified3 = _columnIndexOfDFLT;
                                                                                                                                                                                                                                                        _columnIndexOfDFLT3 = _columnIndexOfDFLTSpecified;
                                                                                                                                                                                                                                                        _columnIndexOfChequeDepositSlipDateSpecified2 = _columnIndexOfGroupName;
                                                                                                                                                                                                                                                        _columnIndexOfReferenceNo2 = _columnIndexOfBankRefNo2;
                                                                                                                                                                                                                                                        _columnIndexOfGroupName4 = _columnIndexOfGroupName2;
                                                                                                                                                                                                                                                        _columnIndexOfBankRefNo5 = _columnIndexOfBankRefNo3;
                                                                                                                                                                                                                                                        _columnIndexOfDate = _columnIndexOfDate;
                                                                                                                                                                                                                                                        _columnIndexOfChequeNo4 = _columnIndexOfChequeNo2;
                                                                                                                                                                                                                                                        _columnIndexOfCreatedDateTime3 = _columnIndexOfCreatedDateTime;
                                                                                                                                                                                                                                                        _columnIndexOfCreatedBy4 = _columnIndexOfCreatedBy2;
                                                                                                                                                                                                                                                        _columnIndexOfCreatedDateTimeSpecified4 = _columnIndexOfCreatedDateTimeSpecified2;
                                                                                                                                                                                                                                                        _columnIndexOfDocumentDate3 = _columnIndexOfDocumentDate;
                                                                                                                                                                                                                                                        _columnIndexOfResponsibilityCenter4 = _columnIndexOfResponsibilityCenter2;
                                                                                                                                                                                                                                                        _columnIndexOfPayMode4 = _columnIndexOfPayMode2;
                                                                                                                                                                                                                                                        _columnIndexOfChequeDepositSlipDate3 = _columnIndexOfChequeDepositSlipDate;
                                                                                                                                                                                                                                                        _columnIndexOfChequeDepositSlipNo4 = _columnIndexOfChequeDepositSlipNo2;
                                                                                                                                                                                                                                                        _columnIndexOfDim11 = _columnIndexOfDim5;
                                                                                                                                                                                                                                                        _columnIndexOfDFLTSpecified4 = _columnIndexOfDateSpecified;
                                                                                                                                                                                                                                                        _columnIndexOfGroupName5 = _columnIndexOfSent3;
                                                                                                                                                                                                                                                        _columnIndexOfDFLTSpecified2 = _columnIndexOfDFLTSpecified2;
                                                                                                                                                                                                                                                        _columnIndexOfAmountRecieved2 = _columnIndexOfShortcutDimension2Code;
                                                                                                                                                                                                                                                        _columnIndexOfShortcutDimension2Code3 = _columnIndexOfCurrencyCode;
                                                                                                                                                                                                                                                        _columnIndexOfSent = _columnIndexOfReceivedFrom2;
                                                                                                                                                                                                                                                        _columnIndexOfCurrencyCode4 = _columnIndexOfCurrencyCode2;
                                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                                        _columnIndexOfBankRefNo5 = _columnIndexOfReferenceNo3;
                                                                                                                                                                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                                    _columnIndexOfReferenceNo2 = _columnIndexOfGroupName6;
                                                                                                                                                                                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                                _columnIndexOfGroupName4 = _columnIndexOfDFLTSpecified5;
                                                                                                                                                                                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                            _columnIndexOfDFLTSpecified4 = _columnIndexOfDFLT4;
                                                                                                                                                                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                        _columnIndexOfDFLT3 = _columnIndexOfTotalAmountGuaranteedSpecified4;
                                                                                                                                                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                    _columnIndexOfTotalAmountGuaranteedSpecified3 = _columnIndexOfTotalAmountGuaranteed3;
                                                                                                                                                                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                _columnIndexOfTotalAmountGuaranteed2 = _columnIndexOfChequeDepositSlipDateSpecified3;
                                                                                                                                                                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                            _columnIndexOfChequeDepositSlipDateSpecified2 = _columnIndexOfChequeDepositSlipDate4;
                                                                                                                                                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                        _columnIndexOfChequeDepositSlipDate3 = _columnIndexOfChequeDepositSlipNo5;
                                                                                                                                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                    _columnIndexOfChequeDepositSlipNo4 = _columnIndexOfPayModeSpecified3;
                                                                                                                                                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                }
                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                _columnIndexOfPayModeSpecified2 = _columnIndexOfPayMode5;
                                                                                                                                                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                            }
                                                                                                                                                                                                        } else {
                                                                                                                                                                                                            _columnIndexOfPayMode4 = _columnIndexOfName4;
                                                                                                                                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                        }
                                                                                                                                                                                                    } else {
                                                                                                                                                                                                        _columnIndexOfName3 = _columnIndexOfAccountNo4;
                                                                                                                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                    }
                                                                                                                                                                                                } else {
                                                                                                                                                                                                    _columnIndexOfAccountNo3 = _columnIndexOfDim17;
                                                                                                                                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                }
                                                                                                                                                                                            } else {
                                                                                                                                                                                                _columnIndexOfDim13 = _columnIndexOfDim16;
                                                                                                                                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                            }
                                                                                                                                                                                        } else {
                                                                                                                                                                                            _columnIndexOfDim11 = _columnIndexOfDimensionSetIDSpecified4;
                                                                                                                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                        }
                                                                                                                                                                                    } else {
                                                                                                                                                                                        _columnIndexOfDimensionSetIDSpecified3 = _columnIndexOfDimensionSetID4;
                                                                                                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                    }
                                                                                                                                                                                } else {
                                                                                                                                                                                    _columnIndexOfDimensionSetID3 = _columnIndexOfReceiptTypeSpecified4;
                                                                                                                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                }
                                                                                                                                                                            } else {
                                                                                                                                                                                _columnIndexOfReceiptTypeSpecified3 = _columnIndexOfBankName4;
                                                                                                                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                            }
                                                                                                                                                                        } else {
                                                                                                                                                                            _columnIndexOfBankName3 = _columnIndexOfDim15;
                                                                                                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                        }
                                                                                                                                                                    } else {
                                                                                                                                                                        _columnIndexOfDim9 = _columnIndexOfDim14;
                                                                                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                    }
                                                                                                                                                                } else {
                                                                                                                                                                    _columnIndexOfDim7 = _columnIndexOfShortcutDimension4Code4;
                                                                                                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                }
                                                                                                                                                            } else {
                                                                                                                                                                _columnIndexOfShortcutDimension4Code3 = _columnIndexOfShortcutDimension3Code3;
                                                                                                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                            }
                                                                                                                                                        } else {
                                                                                                                                                            _columnIndexOfShortcutDimension3Code2 = _columnIndexOfResponsibilityCenter5;
                                                                                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                        }
                                                                                                                                                    } else {
                                                                                                                                                        _columnIndexOfResponsibilityCenter4 = _columnIndexOfDocumentDateSpecified3;
                                                                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                    }
                                                                                                                                                } else {
                                                                                                                                                    _columnIndexOfDocumentDateSpecified2 = _columnIndexOfDocumentDate4;
                                                                                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                }
                                                                                                                                            } else {
                                                                                                                                                _columnIndexOfDocumentDate3 = _columnIndexOfToEntryNoSpecified4;
                                                                                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                            }
                                                                                                                                        } else {
                                                                                                                                            _columnIndexOfToEntryNoSpecified3 = _columnIndexOfToEntryNo4;
                                                                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                        }
                                                                                                                                    } else {
                                                                                                                                        _columnIndexOfToEntryNo3 = _columnIndexOfFromEntryNoSpecified4;
                                                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                    }
                                                                                                                                } else {
                                                                                                                                    _columnIndexOfFromEntryNoSpecified3 = _columnIndexOfFromEntryNo4;
                                                                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                }
                                                                                                                            } else {
                                                                                                                                _columnIndexOfFromEntryNo3 = _columnIndexOfRegisterNoSpecified4;
                                                                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                            }
                                                                                                                        } else {
                                                                                                                            _columnIndexOfRegisterNoSpecified3 = _columnIndexOfRegisterNo4;
                                                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                        }
                                                                                                                    } else {
                                                                                                                        _columnIndexOfRegisterNo3 = _columnIndexOfCreatedDateTimeSpecified5;
                                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                    }
                                                                                                                } else {
                                                                                                                    _columnIndexOfCreatedDateTimeSpecified4 = _columnIndexOfCreatedDateTime4;
                                                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                }
                                                                                                            } else {
                                                                                                                _columnIndexOfCreatedDateTime3 = _columnIndexOfCreatedBy5;
                                                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                            }
                                                                                                        } else {
                                                                                                            _columnIndexOfCreatedBy4 = _columnIndexOfNoPrintedSpecified4;
                                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                        }
                                                                                                    } else {
                                                                                                        _columnIndexOfNoPrintedSpecified3 = _columnIndexOfNoPrinted3;
                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                    }
                                                                                                } else {
                                                                                                    _columnIndexOfNoPrinted2 = _columnIndexOfChequeNo5;
                                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                }
                                                                                            } else {
                                                                                                _columnIndexOfChequeNo4 = _columnIndexOfStatusSpecified4;
                                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                            }
                                                                                        } else {
                                                                                            _columnIndexOfStatusSpecified3 = _columnIndexOfPrintNoSpecified4;
                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                        }
                                                                                    } else {
                                                                                        _columnIndexOfPrintNoSpecified3 = _columnIndexOfPrintNo4;
                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                    }
                                                                                } else {
                                                                                    _columnIndexOfPrintNo3 = _columnIndexOfPostedBy4;
                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                }
                                                                            } else {
                                                                                _columnIndexOfPostedBy3 = _columnIndexOfTotalAmountSpecified4;
                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                            }
                                                                        } else {
                                                                            _columnIndexOfTotalAmountSpecified3 = _columnIndexOfTotalAmount4;
                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                        }
                                                                    } else {
                                                                        _columnIndexOfTotalAmount3 = _columnIndexOfCurrencyFactorSpecified3;
                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                    }
                                                                } else {
                                                                    _columnIndexOfCurrencyFactorSpecified2 = _columnIndexOfCurrencyFactor4;
                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                }
                                                            } else {
                                                                _columnIndexOfCurrencyFactor3 = _columnIndexOfCurrencyCode5;
                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                            }
                                                        } else {
                                                            _columnIndexOfCurrencyCode4 = _columnIndexOfShortcutDimension2Code4;
                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                        }
                                                    } else {
                                                        _columnIndexOfShortcutDimension2Code3 = _columnIndexOfGlobalDimension1Code4;
                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                    }
                                                } else {
                                                    _columnIndexOfGlobalDimension1Code3 = _columnIndexOfAmountRecievedSpecified4;
                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                }
                                            } else {
                                                _columnIndexOfAmountRecievedSpecified3 = _columnIndexOfAmountRecieved3;
                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                            }
                                        } else {
                                            _columnIndexOfAmountRecieved2 = _columnIndexOfOnBehalfOf4;
                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                        }
                                    } else {
                                        _columnIndexOfOnBehalfOf2 = _columnIndexOfOnBehalfOf3;
                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                    }
                                } else {
                                    _collectionTransactionList = _collectionTransactionList4;
                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                }
                            } else {
                                _result = _result2;
                                _columnIndexOfReceivedFrom = _columnIndexOfSent;
                                _collectionTransactionList = _collectionTransactionList4;
                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                            }
                        } else {
                            _columnIndexOfBankCode = _columnIndexOfBankCode4;
                            _result = _result2;
                            _columnIndexOfReceivedFrom = _columnIndexOfSent;
                            _collectionTransactionList = _collectionTransactionList4;
                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                        }
                    } else {
                        _columnIndexOfBankCode = _columnIndexOfBankCode4;
                        _columnIndexOfNoSeries3 = _columnIndexOfNoSeries3;
                        _result = _result2;
                        _columnIndexOfReceivedFrom = _columnIndexOfSent;
                        _collectionTransactionList = _collectionTransactionList4;
                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                    }
                    _result3.add(_item);
                    _result2 = _result3;
                    _columnIndexOfBankCode4 = _columnIndexOfBankCode;
                    _stmt2 = _stmt;
                    _columnIndexOfAmountRecievedSpecified = _columnIndexOfAmountRecievedSpecified;
                    _columnIndexOfOnBehalfOf2 = _columnIndexOfGlobalDimension1Code;
                    _columnIndexOfAmountRecievedSpecified3 = _columnIndexOfCurrencyFactor;
                    _columnIndexOfCurrencyFactorSpecified2 = _columnIndexOfTotalAmount;
                    _columnIndexOfTotalAmount3 = _columnIndexOfTotalAmountSpecified;
                    _columnIndexOfCurrencyFactor3 = _columnIndexOfPostedBy;
                    _columnIndexOfTotalAmountSpecified3 = _columnIndexOfPrintNo;
                    _columnIndexOfPostedBy3 = _columnIndexOfPrintNoSpecified;
                    _columnIndexOfPrintNoSpecified3 = _columnIndexOfStatusSpecified;
                    _columnIndexOfPrintNo3 = _columnIndexOfChequeNo;
                    _columnIndexOfStatusSpecified3 = _columnIndexOfNoPrintedSpecified;
                    _columnIndexOfNoPrinted2 = _columnIndexOfCreatedBy;
                    _columnIndexOfNoPrintedSpecified3 = _columnIndexOfCreatedDateTimeSpecified;
                    _columnIndexOfGlobalDimension1Code3 = _columnIndexOfRegisterNo;
                    _columnIndexOfRegisterNo3 = _columnIndexOfRegisterNoSpecified;
                    _columnIndexOfRegisterNoSpecified3 = _columnIndexOfFromEntryNo;
                    _columnIndexOfFromEntryNo3 = _columnIndexOfFromEntryNoSpecified;
                    _columnIndexOfFromEntryNoSpecified3 = _columnIndexOfToEntryNo;
                    _columnIndexOfToEntryNo3 = _columnIndexOfToEntryNoSpecified;
                    _columnIndexOfDocumentDateSpecified2 = _columnIndexOfResponsibilityCenter;
                    _columnIndexOfShortcutDimension3Code2 = _columnIndexOfShortcutDimension4Code;
                    _columnIndexOfShortcutDimension4Code3 = _columnIndexOfDim3;
                    _columnIndexOfDim7 = _columnIndexOfDim4;
                    _columnIndexOfDim9 = _columnIndexOfBankName;
                    _columnIndexOfToEntryNoSpecified3 = _columnIndexOfReceiptTypeSpecified;
                    _columnIndexOfReceiptTypeSpecified3 = _columnIndexOfDimensionSetID;
                    _columnIndexOfDimensionSetID3 = _columnIndexOfDimensionSetIDSpecified;
                    _columnIndexOfBankName3 = _columnIndexOfDim1;
                    _columnIndexOfDimensionSetIDSpecified3 = _columnIndexOfDim2;
                    _columnIndexOfDim13 = _columnIndexOfAccountNo;
                    _columnIndexOfAccountNo3 = _columnIndexOfName;
                    _columnIndexOfName3 = _columnIndexOfPayMode;
                    _columnIndexOfPayModeSpecified2 = _columnIndexOfChequeDepositSlipNo;
                    _columnIndexOfTotalAmountGuaranteed2 = _columnIndexOfTotalAmountGuaranteedSpecified;
                    _columnIndexOfTotalAmountGuaranteedSpecified3 = _columnIndexOfDFLT;
                    _columnIndexOfDFLT3 = _columnIndexOfDFLTSpecified;
                    _columnIndexOfChequeDepositSlipDateSpecified2 = _columnIndexOfGroupName;
                    _columnIndexOfReferenceNo2 = _columnIndexOfBankRefNo2;
                    _columnIndexOfGroupName4 = _columnIndexOfGroupName2;
                    _columnIndexOfBankRefNo5 = _columnIndexOfBankRefNo3;
                    _columnIndexOfDate = _columnIndexOfDate;
                    _columnIndexOfChequeNo4 = _columnIndexOfChequeNo2;
                    _columnIndexOfCreatedDateTime3 = _columnIndexOfCreatedDateTime;
                    _columnIndexOfCreatedBy4 = _columnIndexOfCreatedBy2;
                    _columnIndexOfCreatedDateTimeSpecified4 = _columnIndexOfCreatedDateTimeSpecified2;
                    _columnIndexOfDocumentDate3 = _columnIndexOfDocumentDate;
                    _columnIndexOfResponsibilityCenter4 = _columnIndexOfResponsibilityCenter2;
                    _columnIndexOfPayMode4 = _columnIndexOfPayMode2;
                    _columnIndexOfChequeDepositSlipDate3 = _columnIndexOfChequeDepositSlipDate;
                    _columnIndexOfChequeDepositSlipNo4 = _columnIndexOfChequeDepositSlipNo2;
                    _columnIndexOfDim11 = _columnIndexOfDim5;
                    _columnIndexOfDFLTSpecified4 = _columnIndexOfDateSpecified;
                    _columnIndexOfGroupName5 = _columnIndexOfSent3;
                    _columnIndexOfDFLTSpecified2 = _columnIndexOfDFLTSpecified2;
                    _columnIndexOfAmountRecieved2 = _columnIndexOfShortcutDimension2Code;
                    _columnIndexOfShortcutDimension2Code3 = _columnIndexOfCurrencyCode;
                    _columnIndexOfSent = _columnIndexOfReceivedFrom2;
                    _columnIndexOfCurrencyCode4 = _columnIndexOfCurrencyCode2;
                } catch (Throwable th2) {
                    th = th2;
                    _stmt.close();
                    throw th;
                }
                theader _tmpTheader2 = new theader();
                int _columnIndexOfSent4 = _columnIndexOfBankRefNo;
                if (_stmt2.isNull(_columnIndexOfKey)) {
                    _tmpTheader = _tmpTheader2;
                    _tmpTheader.Key = null;
                } else {
                    _tmpTheader = _tmpTheader2;
                    _tmpTheader.Key = _stmt2.getText(_columnIndexOfKey);
                }
                if (_stmt2.isNull(_columnIndexOfNo)) {
                    _tmpTheader.No = null;
                } else {
                    _tmpTheader.No = _stmt2.getText(_columnIndexOfNo);
                }
                Long _tmp = _stmt2.isNull(_columnIndexOfDate) ? null : Long.valueOf(_stmt2.getLong(_columnIndexOfDate));
                _tmpTheader.Date = Converters.DateConverter.toDate(_tmp);
                Integer _tmp_1 = _stmt2.isNull(_columnIndexOfDFLTSpecified2) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfDFLTSpecified2));
                if (_tmp_1 == null) {
                    boolValueOf = null;
                } else {
                    boolValueOf = Boolean.valueOf(_tmp_1.intValue() != 0);
                }
                _tmpTheader.DateSpecified = boolValueOf;
                if (_stmt2.isNull(_columnIndexOfAmountRecievedSpecified)) {
                    _tmpTheader.Cashier = null;
                } else {
                    _tmpTheader.Cashier = _stmt2.getText(_columnIndexOfAmountRecievedSpecified);
                }
                Long _tmp_2 = _stmt2.isNull(_columnIndexOfDatePosted) ? null : Long.valueOf(_stmt2.getLong(_columnIndexOfDatePosted));
                _tmpTheader.Date_Posted = Converters.DateConverter.toDate(_tmp_2);
                Integer _tmp_3 = _stmt2.isNull(_columnIndexOfDatePostedSpecified) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfDatePostedSpecified));
                if (_tmp_3 == null) {
                    boolValueOf2 = null;
                } else {
                    boolValueOf2 = Boolean.valueOf(_tmp_3.intValue() != 0);
                }
                _tmpTheader.Date_PostedSpecified = boolValueOf2;
                Long _tmp_4 = _stmt2.isNull(_columnIndexOfTimePosted) ? null : Long.valueOf(_stmt2.getLong(_columnIndexOfTimePosted));
                _tmpTheader.Time_Posted = Converters.DateConverter.toDate(_tmp_4);
                Integer _tmp_5 = _stmt2.isNull(_columnIndexOfTimePostedSpecified) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfTimePostedSpecified));
                if (_tmp_5 == null) {
                    boolValueOf3 = null;
                } else {
                    boolValueOf3 = Boolean.valueOf(_tmp_5.intValue() != 0);
                }
                _tmpTheader.Time_PostedSpecified = boolValueOf3;
                Integer _tmp_6 = _stmt2.isNull(_columnIndexOfPosted) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfPosted));
                if (_tmp_6 == null) {
                    boolValueOf4 = null;
                } else {
                    boolValueOf4 = Boolean.valueOf(_tmp_6.intValue() != 0);
                }
                _tmpTheader.Posted = boolValueOf4;
                Integer _tmp_7 = _stmt2.isNull(_columnIndexOfPostedSpecified) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfPostedSpecified));
                if (_tmp_7 == null) {
                    boolValueOf5 = null;
                } else {
                    boolValueOf5 = Boolean.valueOf(_tmp_7.intValue() != 0);
                }
                _tmpTheader.PostedSpecified = boolValueOf5;
                if (_stmt2.isNull(_columnIndexOfNoSeries3)) {
                    _tmpTheader.No_Series = null;
                } else {
                    _tmpTheader.No_Series = _stmt2.getText(_columnIndexOfNoSeries3);
                }
                if (_stmt2.isNull(_columnIndexOfBankCode)) {
                    _tmpTheader.Bank_Code = null;
                } else {
                    _tmpTheader.Bank_Code = _stmt2.getText(_columnIndexOfBankCode);
                }
                int _columnIndexOfReceivedFrom4 = _columnIndexOfReceivedFrom;
                if (_stmt2.isNull(_columnIndexOfReceivedFrom4)) {
                    _tmpTheader.Received_From = null;
                } else {
                    _tmpTheader.Received_From = _stmt2.getText(_columnIndexOfReceivedFrom4);
                }
                _columnIndexOfGlobalDimension1Code = _columnIndexOfOnBehalfOf2;
                if (_stmt2.isNull(_columnIndexOfGlobalDimension1Code)) {
                    _tmpTheader.On_Behalf_Of = null;
                } else {
                    _tmpTheader.On_Behalf_Of = _stmt2.getText(_columnIndexOfGlobalDimension1Code);
                }
                _columnIndexOfReceivedFrom2 = _columnIndexOfReceivedFrom4;
                _columnIndexOfShortcutDimension2Code = _columnIndexOfAmountRecieved2;
                _tmpTheader.Amount_Recieved = (float) _stmt2.getDouble(_columnIndexOfShortcutDimension2Code);
                int _columnIndexOfAmountRecievedSpecified5 = _columnIndexOfAmountRecievedSpecified3;
                Integer _tmp_8 = _stmt2.isNull(_columnIndexOfAmountRecievedSpecified5) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfAmountRecievedSpecified5));
                if (_tmp_8 == null) {
                    boolValueOf6 = null;
                } else {
                    boolValueOf6 = Boolean.valueOf(_tmp_8.intValue() != 0);
                }
                _tmpTheader.Amount_RecievedSpecified = boolValueOf6;
                int _columnIndexOfGlobalDimension1Code5 = _columnIndexOfGlobalDimension1Code3;
                if (_stmt2.isNull(_columnIndexOfGlobalDimension1Code5)) {
                    _tmpTheader.Global_Dimension_1_Code = null;
                } else {
                    _tmpTheader.Global_Dimension_1_Code = _stmt2.getText(_columnIndexOfGlobalDimension1Code5);
                }
                _columnIndexOfCurrencyCode = _columnIndexOfShortcutDimension2Code3;
                if (_stmt2.isNull(_columnIndexOfCurrencyCode)) {
                    _tmpTheader.Shortcut_Dimension_2_Code = null;
                } else {
                    _tmpTheader.Shortcut_Dimension_2_Code = _stmt2.getText(_columnIndexOfCurrencyCode);
                }
                int _columnIndexOfCurrencyCode6 = _columnIndexOfCurrencyCode4;
                if (_stmt2.isNull(_columnIndexOfCurrencyCode6)) {
                    _tmpTheader.Currency_Code = null;
                } else {
                    _tmpTheader.Currency_Code = _stmt2.getText(_columnIndexOfCurrencyCode6);
                }
                _columnIndexOfCurrencyCode2 = _columnIndexOfCurrencyCode6;
                _columnIndexOfPostedBy = _columnIndexOfCurrencyFactor3;
                _columnIndexOfCurrencyFactor = _columnIndexOfAmountRecievedSpecified5;
                _tmpTheader.Currency_Factor = (float) _stmt2.getDouble(_columnIndexOfPostedBy);
                int _columnIndexOfCurrencyFactorSpecified4 = _columnIndexOfCurrencyFactorSpecified2;
                Integer _tmp_9 = _stmt2.isNull(_columnIndexOfCurrencyFactorSpecified4) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfCurrencyFactorSpecified4));
                if (_tmp_9 == null) {
                    boolValueOf7 = null;
                } else {
                    boolValueOf7 = Boolean.valueOf(_tmp_9.intValue() != 0);
                }
                _tmpTheader.Currency_FactorSpecified = boolValueOf7;
                _columnIndexOfTotalAmountSpecified = _columnIndexOfTotalAmount3;
                _columnIndexOfTotalAmount = _columnIndexOfCurrencyFactorSpecified4;
                _tmpTheader.Total_Amount = (float) _stmt2.getDouble(_columnIndexOfTotalAmountSpecified);
                int _columnIndexOfTotalAmountSpecified5 = _columnIndexOfTotalAmountSpecified3;
                Integer _tmp_10 = _stmt2.isNull(_columnIndexOfTotalAmountSpecified5) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfTotalAmountSpecified5));
                if (_tmp_10 == null) {
                    boolValueOf8 = null;
                } else {
                    boolValueOf8 = Boolean.valueOf(_tmp_10.intValue() != 0);
                }
                _tmpTheader.Total_AmountSpecified = boolValueOf8;
                _columnIndexOfPrintNoSpecified = _columnIndexOfPostedBy3;
                if (_stmt2.isNull(_columnIndexOfPrintNoSpecified)) {
                    _tmpTheader.Posted_By = null;
                } else {
                    _tmpTheader.Posted_By = _stmt2.getText(_columnIndexOfPrintNoSpecified);
                }
                _columnIndexOfChequeNo = _columnIndexOfPrintNo3;
                _columnIndexOfPrintNo = _columnIndexOfTotalAmountSpecified5;
                _tmpTheader.Print_No = (int) _stmt2.getLong(_columnIndexOfChequeNo);
                _columnIndexOfStatusSpecified = _columnIndexOfPrintNoSpecified3;
                Integer _tmp_11 = _stmt2.isNull(_columnIndexOfStatusSpecified) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfStatusSpecified));
                if (_tmp_11 == null) {
                    boolValueOf9 = null;
                } else {
                    boolValueOf9 = Boolean.valueOf(_tmp_11.intValue() != 0);
                }
                _tmpTheader.Print_NoSpecified = boolValueOf9;
                _columnIndexOfNoPrintedSpecified = _columnIndexOfStatusSpecified3;
                Integer _tmp_12 = _stmt2.isNull(_columnIndexOfNoPrintedSpecified) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfNoPrintedSpecified));
                if (_tmp_12 == null) {
                    boolValueOf10 = null;
                } else {
                    boolValueOf10 = Boolean.valueOf(_tmp_12.intValue() != 0);
                }
                _tmpTheader.StatusSpecified = boolValueOf10;
                int _columnIndexOfChequeNo6 = _columnIndexOfChequeNo4;
                if (_stmt2.isNull(_columnIndexOfChequeNo6)) {
                    _tmpTheader.Cheque_No = null;
                } else {
                    _tmpTheader.Cheque_No = _stmt2.getText(_columnIndexOfChequeNo6);
                }
                _columnIndexOfChequeNo2 = _columnIndexOfChequeNo6;
                _columnIndexOfCreatedBy = _columnIndexOfNoPrinted2;
                _tmpTheader.No_Printed = (int) _stmt2.getLong(_columnIndexOfCreatedBy);
                _columnIndexOfCreatedDateTimeSpecified = _columnIndexOfNoPrintedSpecified3;
                Integer _tmp_13 = _stmt2.isNull(_columnIndexOfCreatedDateTimeSpecified) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfCreatedDateTimeSpecified));
                if (_tmp_13 == null) {
                    boolValueOf11 = null;
                } else {
                    boolValueOf11 = Boolean.valueOf(_tmp_13.intValue() != 0);
                }
                _tmpTheader.No_PrintedSpecified = boolValueOf11;
                int _columnIndexOfCreatedBy6 = _columnIndexOfCreatedBy4;
                if (_stmt2.isNull(_columnIndexOfCreatedBy6)) {
                    _tmpTheader.Created_By = null;
                } else {
                    _tmpTheader.Created_By = _stmt2.getText(_columnIndexOfCreatedBy6);
                }
                int _columnIndexOfCreatedDateTime5 = _columnIndexOfCreatedDateTime3;
                Long _tmp_14 = _stmt2.isNull(_columnIndexOfCreatedDateTime5) ? null : Long.valueOf(_stmt2.getLong(_columnIndexOfCreatedDateTime5));
                _columnIndexOfCreatedDateTime = _columnIndexOfCreatedDateTime5;
                _tmpTheader.Created_Date_Time = Converters.DateConverter.toDate(_tmp_14);
                int _columnIndexOfCreatedDateTimeSpecified6 = _columnIndexOfCreatedDateTimeSpecified4;
                Integer _tmp_15 = _stmt2.isNull(_columnIndexOfCreatedDateTimeSpecified6) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfCreatedDateTimeSpecified6));
                if (_tmp_15 == null) {
                    boolValueOf12 = null;
                } else {
                    boolValueOf12 = Boolean.valueOf(_tmp_15.intValue() != 0);
                }
                _tmpTheader.Created_Date_TimeSpecified = boolValueOf12;
                _columnIndexOfCreatedBy2 = _columnIndexOfCreatedBy6;
                _columnIndexOfRegisterNoSpecified = _columnIndexOfRegisterNo3;
                _columnIndexOfRegisterNo = _columnIndexOfGlobalDimension1Code5;
                _tmpTheader.Register_No = (int) _stmt2.getLong(_columnIndexOfRegisterNoSpecified);
                int _columnIndexOfRegisterNoSpecified5 = _columnIndexOfRegisterNoSpecified3;
                Integer _tmp_16 = _stmt2.isNull(_columnIndexOfRegisterNoSpecified5) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfRegisterNoSpecified5));
                if (_tmp_16 == null) {
                    boolValueOf13 = null;
                } else {
                    boolValueOf13 = Boolean.valueOf(_tmp_16.intValue() != 0);
                }
                _tmpTheader.Register_NoSpecified = boolValueOf13;
                _columnIndexOfFromEntryNoSpecified = _columnIndexOfFromEntryNo3;
                _columnIndexOfFromEntryNo = _columnIndexOfRegisterNoSpecified5;
                _tmpTheader.From_Entry_No = (int) _stmt2.getLong(_columnIndexOfFromEntryNoSpecified);
                int _columnIndexOfFromEntryNoSpecified5 = _columnIndexOfFromEntryNoSpecified3;
                Integer _tmp_17 = _stmt2.isNull(_columnIndexOfFromEntryNoSpecified5) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfFromEntryNoSpecified5));
                if (_tmp_17 == null) {
                    boolValueOf14 = null;
                } else {
                    boolValueOf14 = Boolean.valueOf(_tmp_17.intValue() != 0);
                }
                _tmpTheader.From_Entry_NoSpecified = boolValueOf14;
                _columnIndexOfToEntryNoSpecified = _columnIndexOfToEntryNo3;
                _columnIndexOfToEntryNo = _columnIndexOfFromEntryNoSpecified5;
                _tmpTheader.To_Entry_No = (int) _stmt2.getLong(_columnIndexOfToEntryNoSpecified);
                _columnIndexOfReceiptTypeSpecified = _columnIndexOfToEntryNoSpecified3;
                Integer _tmp_18 = _stmt2.isNull(_columnIndexOfReceiptTypeSpecified) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfReceiptTypeSpecified));
                if (_tmp_18 == null) {
                    boolValueOf15 = null;
                } else {
                    boolValueOf15 = Boolean.valueOf(_tmp_18.intValue() != 0);
                }
                _tmpTheader.To_Entry_NoSpecified = boolValueOf15;
                _columnIndexOfDocumentDate = _columnIndexOfDocumentDate3;
                Long _tmp_19 = _stmt2.isNull(_columnIndexOfDocumentDate) ? null : Long.valueOf(_stmt2.getLong(_columnIndexOfDocumentDate));
                _columnIndexOfCreatedDateTimeSpecified2 = _columnIndexOfCreatedDateTimeSpecified6;
                _tmpTheader.Document_Date = Converters.DateConverter.toDate(_tmp_19);
                _columnIndexOfResponsibilityCenter = _columnIndexOfDocumentDateSpecified2;
                Integer _tmp_110 = _stmt2.isNull(_columnIndexOfResponsibilityCenter) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfResponsibilityCenter));
                if (_tmp_110 == null) {
                    boolValueOf16 = null;
                } else {
                    boolValueOf16 = Boolean.valueOf(_tmp_110.intValue() != 0);
                }
                _tmpTheader.Document_DateSpecified = boolValueOf16;
                _columnIndexOfResponsibilityCenter2 = _columnIndexOfResponsibilityCenter4;
                if (_stmt2.isNull(_columnIndexOfResponsibilityCenter2)) {
                    _tmpTheader.Responsibility_Center = null;
                } else {
                    _tmpTheader.Responsibility_Center = _stmt2.getText(_columnIndexOfResponsibilityCenter2);
                }
                _columnIndexOfShortcutDimension4Code = _columnIndexOfShortcutDimension3Code2;
                if (_stmt2.isNull(_columnIndexOfShortcutDimension4Code)) {
                    _tmpTheader.Shortcut_Dimension_3_Code = null;
                } else {
                    _tmpTheader.Shortcut_Dimension_3_Code = _stmt2.getText(_columnIndexOfShortcutDimension4Code);
                }
                _columnIndexOfDim3 = _columnIndexOfShortcutDimension4Code3;
                if (_stmt2.isNull(_columnIndexOfDim3)) {
                    _tmpTheader.Shortcut_Dimension_4_Code = null;
                } else {
                    _tmpTheader.Shortcut_Dimension_4_Code = _stmt2.getText(_columnIndexOfDim3);
                }
                _columnIndexOfDim4 = _columnIndexOfDim7;
                if (_stmt2.isNull(_columnIndexOfDim4)) {
                    _tmpTheader.Dim3 = null;
                } else {
                    _tmpTheader.Dim3 = _stmt2.getText(_columnIndexOfDim4);
                }
                _columnIndexOfBankName = _columnIndexOfDim9;
                if (_stmt2.isNull(_columnIndexOfBankName)) {
                    _tmpTheader.Dim4 = null;
                } else {
                    _tmpTheader.Dim4 = _stmt2.getText(_columnIndexOfBankName);
                }
                _columnIndexOfDim1 = _columnIndexOfBankName3;
                if (_stmt2.isNull(_columnIndexOfDim1)) {
                    _tmpTheader.Bank_Name = null;
                } else {
                    _tmpTheader.Bank_Name = _stmt2.getText(_columnIndexOfDim1);
                }
                int _columnIndexOfReceiptTypeSpecified5 = _columnIndexOfReceiptTypeSpecified3;
                Integer _tmp_21 = _stmt2.isNull(_columnIndexOfReceiptTypeSpecified5) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfReceiptTypeSpecified5));
                if (_tmp_21 == null) {
                    boolValueOf17 = null;
                } else {
                    boolValueOf17 = Boolean.valueOf(_tmp_21.intValue() != 0);
                }
                _tmpTheader.Receipt_TypeSpecified = boolValueOf17;
                _columnIndexOfDimensionSetIDSpecified = _columnIndexOfDimensionSetID3;
                _columnIndexOfDimensionSetID = _columnIndexOfReceiptTypeSpecified5;
                _tmpTheader.Dimension_Set_ID = (int) _stmt2.getLong(_columnIndexOfDimensionSetIDSpecified);
                _columnIndexOfDim2 = _columnIndexOfDimensionSetIDSpecified3;
                Integer _tmp_22 = _stmt2.isNull(_columnIndexOfDim2) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfDim2));
                if (_tmp_22 == null) {
                    boolValueOf18 = null;
                } else {
                    boolValueOf18 = Boolean.valueOf(_tmp_22.intValue() != 0);
                }
                _tmpTheader.Dimension_Set_IDSpecified = boolValueOf18;
                int _columnIndexOfDim18 = _columnIndexOfDim11;
                if (_stmt2.isNull(_columnIndexOfDim18)) {
                    _tmpTheader.Dim1 = null;
                } else {
                    _tmpTheader.Dim1 = _stmt2.getText(_columnIndexOfDim18);
                }
                _columnIndexOfAccountNo = _columnIndexOfDim13;
                if (_stmt2.isNull(_columnIndexOfAccountNo)) {
                    _tmpTheader.Dim2 = null;
                } else {
                    _tmpTheader.Dim2 = _stmt2.getText(_columnIndexOfAccountNo);
                }
                _columnIndexOfName = _columnIndexOfAccountNo3;
                if (_stmt2.isNull(_columnIndexOfName)) {
                    _tmpTheader.Account_No = null;
                } else {
                    _tmpTheader.Account_No = _stmt2.getText(_columnIndexOfName);
                }
                _columnIndexOfPayMode = _columnIndexOfName3;
                if (_stmt2.isNull(_columnIndexOfPayMode)) {
                    _tmpTheader.Name = null;
                } else {
                    _tmpTheader.Name = _stmt2.getText(_columnIndexOfPayMode);
                }
                _columnIndexOfPayMode2 = _columnIndexOfPayMode4;
                if (_stmt2.isNull(_columnIndexOfPayMode2)) {
                    _tmpTheader.PayMode = null;
                } else {
                    _tmpTheader.PayMode = _stmt2.getText(_columnIndexOfPayMode2);
                }
                _columnIndexOfChequeDepositSlipNo = _columnIndexOfPayModeSpecified2;
                Integer _tmp_23 = _stmt2.isNull(_columnIndexOfChequeDepositSlipNo) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfChequeDepositSlipNo));
                if (_tmp_23 == null) {
                    boolValueOf19 = null;
                } else {
                    boolValueOf19 = Boolean.valueOf(_tmp_23.intValue() != 0);
                }
                _tmpTheader.Pay_ModeSpecified = boolValueOf19;
                _columnIndexOfChequeDepositSlipNo2 = _columnIndexOfChequeDepositSlipNo4;
                if (_stmt2.isNull(_columnIndexOfChequeDepositSlipNo2)) {
                    _tmpTheader.Cheque_Deposit_Slip_No = null;
                } else {
                    _tmpTheader.Cheque_Deposit_Slip_No = _stmt2.getText(_columnIndexOfChequeDepositSlipNo2);
                }
                int _columnIndexOfChequeDepositSlipDate5 = _columnIndexOfChequeDepositSlipDate3;
                Long _tmp_24 = _stmt2.isNull(_columnIndexOfChequeDepositSlipDate5) ? null : Long.valueOf(_stmt2.getLong(_columnIndexOfChequeDepositSlipDate5));
                _columnIndexOfChequeDepositSlipDate = _columnIndexOfChequeDepositSlipDate5;
                _tmpTheader.Cheque_Deposit_Slip_Date = Converters.DateConverter.toDate(_tmp_24);
                _columnIndexOfGroupName = _columnIndexOfChequeDepositSlipDateSpecified2;
                Integer _tmp_25 = _stmt2.isNull(_columnIndexOfGroupName) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfGroupName));
                if (_tmp_25 == null) {
                    boolValueOf20 = null;
                } else {
                    boolValueOf20 = Boolean.valueOf(_tmp_25.intValue() != 0);
                }
                _tmpTheader.Cheque_Deposit_Slip_DateSpecified = boolValueOf20;
                _columnIndexOfDim5 = _columnIndexOfDim18;
                _columnIndexOfTotalAmountGuaranteedSpecified = _columnIndexOfTotalAmountGuaranteed2;
                _tmpTheader.Total_Amount_Guaranteed = (float) _stmt2.getDouble(_columnIndexOfTotalAmountGuaranteedSpecified);
                int _columnIndexOfTotalAmountGuaranteedSpecified5 = _columnIndexOfTotalAmountGuaranteedSpecified3;
                Integer _tmp_26 = _stmt2.isNull(_columnIndexOfTotalAmountGuaranteedSpecified5) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfTotalAmountGuaranteedSpecified5));
                if (_tmp_26 == null) {
                    boolValueOf21 = null;
                } else {
                    boolValueOf21 = Boolean.valueOf(_tmp_26.intValue() != 0);
                }
                _tmpTheader.Total_Amount_GuaranteedSpecified = boolValueOf21;
                _columnIndexOfDFLTSpecified = _columnIndexOfDFLT3;
                _columnIndexOfDFLT = _columnIndexOfTotalAmountGuaranteedSpecified5;
                _tmpTheader.DFLT = (float) _stmt2.getDouble(_columnIndexOfDFLTSpecified);
                _columnIndexOfDateSpecified = _columnIndexOfDFLTSpecified4;
                Integer _tmp_27 = _stmt2.isNull(_columnIndexOfDateSpecified) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfDateSpecified));
                if (_tmp_27 == null) {
                    boolValueOf22 = null;
                } else {
                    boolValueOf22 = Boolean.valueOf(_tmp_27.intValue() != 0);
                }
                _tmpTheader.DFLTSpecified = boolValueOf22;
                int _columnIndexOfGroupName7 = _columnIndexOfGroupName4;
                if (_stmt2.isNull(_columnIndexOfGroupName7)) {
                    _tmpTheader.Group_Name = null;
                } else {
                    _tmpTheader.Group_Name = _stmt2.getText(_columnIndexOfGroupName7);
                }
                _columnIndexOfBankRefNo2 = _columnIndexOfReferenceNo2;
                if (_stmt2.isNull(_columnIndexOfBankRefNo2)) {
                    _tmpTheader.Reference_No = null;
                } else {
                    _tmpTheader.Reference_No = _stmt2.getText(_columnIndexOfBankRefNo2);
                }
                int _columnIndexOfBankRefNo6 = _columnIndexOfBankRefNo5;
                if (_stmt2.isNull(_columnIndexOfBankRefNo6)) {
                    _tmpTheader.Bank_Ref_No = null;
                } else {
                    _tmpTheader.Bank_Ref_No = _stmt2.getText(_columnIndexOfBankRefNo6);
                }
                _columnIndexOfGroupName2 = _columnIndexOfGroupName7;
                _columnIndexOfNoSeries = _columnIndexOfSent4;
                _columnIndexOfBankRefNo3 = _columnIndexOfBankRefNo6;
                int _tmp_28 = (int) _stmt2.getLong(_columnIndexOfNoSeries);
                _tmpTheader.sent = _tmp_28 != 0;
                _columnIndexOfNo = _columnIndexOfNo;
                if (_stmt2.isNull(_columnIndexOfNo)) {
                    _tmpKey_1 = null;
                } else {
                    _tmpKey_1 = _stmt2.getText(_columnIndexOfNo);
                }
                if (_tmpKey_1 != null) {
                    _collectionTransactionList4 = _collectionTransactionList;
                    _tmpTransactionListCollection = _collectionTransactionList4.get(_tmpKey_1);
                } else {
                    _collectionTransactionList4 = _collectionTransactionList;
                    _tmpTransactionListCollection = new ArrayList<>();
                }
                tlines _item2 = new tlines();
                int _columnIndexOfSent5 = _columnIndexOfNoSeries;
                _item2.theader = _tmpTheader;
                _item2.transactionList = _tmpTransactionListCollection;
                _stmt = _stmt2;
                List<tlines> _result4 = _result;
            }
            SQLiteStatement _stmt3 = _stmt2;
            List<tlines> _result5 = _result2;
            _stmt3.close();
            return _result5;
        } catch (Throwable th3) {
            th = th3;
            _stmt = _stmt2;
        }
    }

    @Override // com.trimline.metrocrew.theader.dao
    List<tlines> transaction_n_linesdaily(final long startOfDay, final long endOfDay) {
        return (List) DBUtil.performBlocking(this.__db, true, true, new Function1() { // from class: com.trimline.metrocrew.theader_dao_Impl$$ExternalSyntheticLambda5
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m456x10d39e21(startOfDay, endOfDay, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX WARN: Code duplicated, block: B:688:0x0e98  */
    /* JADX WARN: Code duplicated, block: B:689:0x0e9a A[Catch: all -> 0x0f59, TRY_LEAVE, TryCatch #1 {all -> 0x0f59, blocks: (B:3:0x000b, B:4:0x0221, B:21:0x0272, B:22:0x027f, B:24:0x0285, B:686:0x0e90, B:696:0x0eb8, B:695:0x0eaf, B:689:0x0e9a, B:220:0x06e3, B:228:0x0704, B:234:0x0714, B:238:0x0724, B:250:0x075e, B:256:0x0770, B:260:0x0780, B:271:0x07b5, B:275:0x07c7, B:286:0x07fc, B:297:0x0826, B:308:0x084f, B:314:0x0861, B:321:0x0877, B:328:0x088d, B:335:0x08a3, B:346:0x08d9, B:353:0x08f1, B:360:0x0907, B:367:0x091d, B:378:0x0953, B:389:0x098b, B:396:0x09a3, B:407:0x09d9, B:418:0x0a0d, B:425:0x0a25, B:436:0x0a5b, B:443:0x0a73, B:447:0x0a86, B:458:0x0ac0, B:469:0x0afe, B:480:0x0b3c, B:491:0x0b7a, B:495:0x0b8f, B:506:0x0bc9, B:513:0x0be1, B:520:0x0bf7, B:527:0x0c0d, B:534:0x0c23, B:541:0x0c39, B:548:0x0c4f, B:559:0x0c7f, B:570:0x0cb7, B:577:0x0ccf, B:584:0x0ce5, B:591:0x0cfb, B:598:0x0d11, B:605:0x0d27, B:616:0x0d57, B:623:0x0d6f, B:627:0x0d82, B:638:0x0dbc, B:649:0x0dfa, B:660:0x0e38, B:667:0x0e50, B:674:0x0e66, B:681:0x0e7c, B:685:0x0e8d, B:680:0x0e76, B:673:0x0e60, B:666:0x0e4a, B:655:0x0e2a, B:659:0x0e34, B:652:0x0e1a, B:644:0x0dec, B:648:0x0df6, B:641:0x0ddc, B:633:0x0dae, B:637:0x0db8, B:630:0x0d9d, B:626:0x0d7a, B:622:0x0d69, B:611:0x0d49, B:615:0x0d53, B:608:0x0d38, B:604:0x0d21, B:597:0x0d0b, B:590:0x0cf5, B:583:0x0cdf, B:576:0x0cc9, B:565:0x0ca9, B:569:0x0cb3, B:562:0x0c9a, B:554:0x0c71, B:558:0x0c7b, B:551:0x0c60, B:547:0x0c49, B:540:0x0c33, B:533:0x0c1d, B:526:0x0c07, B:519:0x0bf1, B:512:0x0bdb, B:501:0x0bbb, B:505:0x0bc5, B:498:0x0baa, B:494:0x0b87, B:486:0x0b6c, B:490:0x0b76, B:483:0x0b5c, B:475:0x0b2e, B:479:0x0b38, B:472:0x0b1e, B:464:0x0af0, B:468:0x0afa, B:461:0x0ae0, B:453:0x0ab2, B:457:0x0abc, B:450:0x0aa1, B:446:0x0a7e, B:442:0x0a6d, B:431:0x0a4d, B:435:0x0a57, B:428:0x0a3e, B:424:0x0a1f, B:413:0x09ff, B:417:0x0a09, B:410:0x09ee, B:402:0x09cb, B:406:0x09d5, B:399:0x09bc, B:395:0x099d, B:384:0x097d, B:388:0x0987, B:381:0x096e, B:373:0x0945, B:377:0x094f, B:370:0x0936, B:366:0x0917, B:359:0x0901, B:352:0x08eb, B:341:0x08cb, B:345:0x08d5, B:338:0x08bc, B:334:0x089d, B:327:0x0887, B:320:0x0871, B:313:0x085b, B:303:0x0841, B:307:0x084b, B:300:0x0832, B:292:0x0818, B:296:0x0822, B:289:0x0808, B:281:0x07ee, B:285:0x07f8, B:278:0x07de, B:274:0x07bf, B:266:0x07a7, B:270:0x07b1, B:263:0x0797, B:259:0x0778, B:255:0x076a, B:245:0x074d, B:249:0x0758, B:241:0x073b, B:237:0x071c, B:233:0x070e, B:227:0x06fe), top: B:710:0x000b }] */
    /* JADX WARN: Code duplicated, block: B:691:0x0ea0  */
    /* JADX WARN: Code duplicated, block: B:694:0x0ead  */
    /* JADX INFO: renamed from: lambda$transaction_n_linesdaily$7$com-trimline-metrocrew-theader_dao_Impl, reason: not valid java name */
    /* synthetic */ List m456x10d39e21(long startOfDay, long endOfDay, SQLiteConnection _connection) throws Throwable {
        SQLiteStatement _stmt;
        int _columnIndexOfNoSeries;
        List<tlines> _result;
        int _columnIndexOfBankCode;
        ArrayMap<String, ArrayList<transaction>> _collectionTransactionList;
        int _columnIndexOfBankRefNo;
        theader _tmpTheader;
        int _columnIndexOfKey;
        Integer _tmp_1;
        Boolean boolValueOf;
        int _columnIndexOfKey2;
        Integer _tmp_2;
        Integer _tmp_3;
        Boolean boolValueOf2;
        Integer _tmp_4;
        Integer _tmp_5;
        Boolean boolValueOf3;
        Boolean boolValueOf4;
        Boolean boolValueOf5;
        int _columnIndexOfOnBehalfOf;
        int _columnIndexOfOnBehalfOf2;
        int _columnIndexOfGlobalDimension1Code;
        int _columnIndexOfAmountRecieved;
        int _columnIndexOfShortcutDimension2Code;
        Boolean boolValueOf6;
        int _columnIndexOfCurrencyFactorSpecified;
        int _columnIndexOfCurrencyCode;
        int _columnIndexOfCurrencyCode2;
        int _columnIndexOfPostedBy;
        Boolean boolValueOf7;
        int _columnIndexOfTotalAmountSpecified;
        int _columnIndexOfTotalAmount;
        Boolean boolValueOf8;
        int _columnIndexOfPrintNoSpecified;
        int _columnIndexOfChequeNo;
        int _columnIndexOfPrintNo;
        int _columnIndexOfStatusSpecified;
        Boolean boolValueOf9;
        int _columnIndexOfNoPrintedSpecified;
        Boolean boolValueOf10;
        int _columnIndexOfChequeNo2;
        int _columnIndexOfCreatedBy;
        int _columnIndexOfCreatedDateTimeSpecified;
        Boolean boolValueOf11;
        int _columnIndexOfReceiptTypeSpecified;
        int _columnIndexOfCreatedDateTime;
        Boolean boolValueOf12;
        int _columnIndexOfBankCode2;
        int _columnIndexOfRegisterNoSpecified;
        Boolean boolValueOf13;
        int _columnIndexOfFromEntryNoSpecified;
        int _columnIndexOfFromEntryNo;
        Boolean boolValueOf14;
        int _columnIndexOfToEntryNoSpecified;
        int _columnIndexOfToEntryNo;
        Boolean boolValueOf15;
        int _columnIndexOfDocumentDate;
        int _columnIndexOfCreatedDateTimeSpecified2;
        int _columnIndexOfResponsibilityCenter;
        Boolean boolValueOf16;
        int _columnIndexOfResponsibilityCenter2;
        int _columnIndexOfShortcutDimension4Code;
        int _columnIndexOfDim3;
        int _columnIndexOfDim4;
        int _columnIndexOfBankName;
        int _columnIndexOfDim1;
        Boolean boolValueOf17;
        int _columnIndexOfDimensionSetIDSpecified;
        int _columnIndexOfDimensionSetID;
        int _columnIndexOfDim2;
        Boolean boolValueOf18;
        int _columnIndexOfSent;
        int _columnIndexOfAccountNo;
        int _columnIndexOfName;
        int _columnIndexOfPayMode;
        int _columnIndexOfPayMode2;
        int _columnIndexOfChequeDepositSlipNo;
        Boolean boolValueOf19;
        int _columnIndexOfChequeDepositSlipNo2;
        int _columnIndexOfChequeDepositSlipDate;
        int _columnIndexOfGroupName;
        Boolean boolValueOf20;
        int _columnIndexOfTotalAmountGuaranteedSpecified;
        int _columnIndexOfTotalAmountGuaranteed;
        Boolean boolValueOf21;
        int _columnIndexOfDFLTSpecified;
        int _columnIndexOfDFLT;
        int _columnIndexOfKey3;
        Boolean boolValueOf22;
        int _columnIndexOfBankRefNo2;
        int _columnIndexOfGroupName2;
        int _columnIndexOfPostedSpecified;
        int _columnIndexOfBankRefNo3;
        String _tmpKey_1;
        ArrayMap<String, ArrayList<transaction>> _collectionTransactionList2;
        ArrayList<transaction> _tmpTransactionListCollection;
        String _tmpKey;
        int _columnIndexOfNoSeries2;
        ArrayMap<String, ArrayList<transaction>> _collectionTransactionList3;
        SQLiteStatement _stmt2 = _connection.prepare("SELECT * FROM theader WHERE Date BETWEEN ? AND ? ORDER BY Created_Date_Time DESC");
        try {
            _stmt2.mo152bindLong(1, startOfDay);
            _stmt2.mo152bindLong(2, endOfDay);
            int _columnIndexOfDFLTSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Key");
            int _columnIndexOfNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "No");
            int _columnIndexOfDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Date");
            int _columnIndexOfDateSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "DateSpecified");
            int _columnIndexOfCashier = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Cashier");
            int _columnIndexOfDatePosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Date_Posted");
            int _columnIndexOfDatePostedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Date_PostedSpecified");
            int _columnIndexOfTimePosted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Time_Posted");
            int _columnIndexOfTimePostedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Time_PostedSpecified");
            int _columnIndexOfReceivedFrom = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Posted");
            int _columnIndexOfPostedSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "PostedSpecified");
            int _columnIndexOfNoSeries3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "No_Series");
            int _columnIndexOfBankCode3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Bank_Code");
            int _columnIndexOfBankCode4 = _columnIndexOfBankCode3;
            int _columnIndexOfReceivedFrom2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Received_From");
            int _columnIndexOfReceivedFrom3 = _columnIndexOfReceivedFrom2;
            int _columnIndexOfOnBehalfOf3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "On_Behalf_Of");
            int _columnIndexOfOnBehalfOf4 = _columnIndexOfOnBehalfOf3;
            int _columnIndexOfAmountRecieved2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Amount_Recieved");
            int _columnIndexOfAmountRecieved3 = _columnIndexOfAmountRecieved2;
            int _columnIndexOfAmountRecievedSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Amount_RecievedSpecified");
            int _columnIndexOfAmountRecievedSpecified2 = _columnIndexOfAmountRecievedSpecified;
            int _columnIndexOfGlobalDimension1Code2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Global_Dimension_1_Code");
            int _columnIndexOfGlobalDimension1Code3 = _columnIndexOfGlobalDimension1Code2;
            int _columnIndexOfShortcutDimension2Code2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Shortcut_Dimension_2_Code");
            int _columnIndexOfShortcutDimension2Code3 = _columnIndexOfShortcutDimension2Code2;
            int _columnIndexOfCurrencyCode3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Currency_Code");
            int _columnIndexOfCurrencyCode4 = _columnIndexOfCurrencyCode3;
            int _columnIndexOfCurrencyFactor = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Currency_Factor");
            int _columnIndexOfCurrencyFactor2 = _columnIndexOfCurrencyFactor;
            int _columnIndexOfCurrencyFactorSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Currency_FactorSpecified");
            int _columnIndexOfCurrencyFactorSpecified3 = _columnIndexOfCurrencyFactorSpecified2;
            int _columnIndexOfTotalAmount2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Total_Amount");
            int _columnIndexOfTotalAmount3 = _columnIndexOfTotalAmount2;
            int _columnIndexOfTotalAmountSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Total_AmountSpecified");
            int _columnIndexOfTotalAmountSpecified3 = _columnIndexOfTotalAmountSpecified2;
            int _columnIndexOfPostedBy2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Posted_By");
            int _columnIndexOfPostedBy3 = _columnIndexOfPostedBy2;
            int _columnIndexOfPrintNo2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Print_No");
            int _columnIndexOfPrintNo3 = _columnIndexOfPrintNo2;
            int _columnIndexOfPrintNoSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Print_NoSpecified");
            int _columnIndexOfPrintNoSpecified3 = _columnIndexOfPrintNoSpecified2;
            int _columnIndexOfStatusSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "StatusSpecified");
            int _columnIndexOfStatusSpecified3 = _columnIndexOfStatusSpecified2;
            int _columnIndexOfChequeNo3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Cheque_No");
            int _columnIndexOfChequeNo4 = _columnIndexOfChequeNo3;
            int _columnIndexOfNoPrinted = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "No_Printed");
            int _columnIndexOfNoPrinted2 = _columnIndexOfNoPrinted;
            int _columnIndexOfNoPrintedSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "No_PrintedSpecified");
            int _columnIndexOfNoPrintedSpecified3 = _columnIndexOfNoPrintedSpecified2;
            int _columnIndexOfCreatedBy2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Created_By");
            int _columnIndexOfCreatedBy3 = _columnIndexOfCreatedBy2;
            int _columnIndexOfCreatedDateTime2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Created_Date_Time");
            int _columnIndexOfCreatedDateTime3 = _columnIndexOfCreatedDateTime2;
            int _columnIndexOfCreatedDateTimeSpecified3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Created_Date_TimeSpecified");
            int _columnIndexOfCreatedDateTimeSpecified4 = _columnIndexOfCreatedDateTimeSpecified3;
            int _columnIndexOfRegisterNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Register_No");
            int _columnIndexOfRegisterNo2 = _columnIndexOfRegisterNo;
            int _columnIndexOfRegisterNoSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Register_NoSpecified");
            int _columnIndexOfRegisterNoSpecified3 = _columnIndexOfRegisterNoSpecified2;
            int _columnIndexOfFromEntryNo2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "From_Entry_No");
            int _columnIndexOfFromEntryNo3 = _columnIndexOfFromEntryNo2;
            int _columnIndexOfFromEntryNoSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "From_Entry_NoSpecified");
            int _columnIndexOfFromEntryNoSpecified3 = _columnIndexOfFromEntryNoSpecified2;
            int _columnIndexOfToEntryNo2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "To_Entry_No");
            int _columnIndexOfToEntryNo3 = _columnIndexOfToEntryNo2;
            int _columnIndexOfToEntryNoSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "To_Entry_NoSpecified");
            int _columnIndexOfToEntryNoSpecified3 = _columnIndexOfToEntryNoSpecified2;
            int _columnIndexOfDocumentDate2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Document_Date");
            int _columnIndexOfDocumentDate3 = _columnIndexOfDocumentDate2;
            int _columnIndexOfDocumentDateSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Document_DateSpecified");
            int _columnIndexOfDocumentDateSpecified2 = _columnIndexOfDocumentDateSpecified;
            int _columnIndexOfResponsibilityCenter3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Responsibility_Center");
            int _columnIndexOfResponsibilityCenter4 = _columnIndexOfResponsibilityCenter3;
            int _columnIndexOfShortcutDimension3Code = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Shortcut_Dimension_3_Code");
            int _columnIndexOfShortcutDimension3Code2 = _columnIndexOfShortcutDimension3Code;
            int _columnIndexOfShortcutDimension4Code2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Shortcut_Dimension_4_Code");
            int _columnIndexOfShortcutDimension4Code3 = _columnIndexOfShortcutDimension4Code2;
            int _columnIndexOfDim5 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Dim3");
            int _columnIndexOfDim6 = _columnIndexOfDim5;
            int _columnIndexOfDim7 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Dim4");
            int _columnIndexOfDim8 = _columnIndexOfDim7;
            int _columnIndexOfBankName2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Bank_Name");
            int _columnIndexOfBankName3 = _columnIndexOfBankName2;
            int _columnIndexOfReceiptTypeSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Receipt_TypeSpecified");
            int _columnIndexOfReceiptTypeSpecified3 = _columnIndexOfReceiptTypeSpecified2;
            int _columnIndexOfDimensionSetID2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Dimension_Set_ID");
            int _columnIndexOfDimensionSetID3 = _columnIndexOfDimensionSetID2;
            int _columnIndexOfDimensionSetIDSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Dimension_Set_IDSpecified");
            int _columnIndexOfDimensionSetIDSpecified3 = _columnIndexOfDimensionSetIDSpecified2;
            int _columnIndexOfDim9 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Dim1");
            int _columnIndexOfDim10 = _columnIndexOfDim9;
            int _columnIndexOfDim11 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Dim2");
            int _columnIndexOfDim12 = _columnIndexOfDim11;
            int _columnIndexOfAccountNo2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Account_No");
            int _columnIndexOfAccountNo3 = _columnIndexOfAccountNo2;
            int _columnIndexOfName2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Name");
            int _columnIndexOfName3 = _columnIndexOfName2;
            int _columnIndexOfPayMode3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "PayMode");
            int _columnIndexOfPayMode4 = _columnIndexOfPayMode3;
            int _columnIndexOfPayModeSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Pay_ModeSpecified");
            int _columnIndexOfPayModeSpecified2 = _columnIndexOfPayModeSpecified;
            int _columnIndexOfChequeDepositSlipNo3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Cheque_Deposit_Slip_No");
            int _columnIndexOfChequeDepositSlipNo4 = _columnIndexOfChequeDepositSlipNo3;
            int _columnIndexOfChequeDepositSlipDate2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Cheque_Deposit_Slip_Date");
            int _columnIndexOfChequeDepositSlipDate3 = _columnIndexOfChequeDepositSlipDate2;
            int _columnIndexOfChequeDepositSlipDateSpecified = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Cheque_Deposit_Slip_DateSpecified");
            int _columnIndexOfChequeDepositSlipDateSpecified2 = _columnIndexOfChequeDepositSlipDateSpecified;
            int _columnIndexOfTotalAmountGuaranteed2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Total_Amount_Guaranteed");
            int _columnIndexOfTotalAmountGuaranteed3 = _columnIndexOfTotalAmountGuaranteed2;
            int _columnIndexOfTotalAmountGuaranteedSpecified2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Total_Amount_GuaranteedSpecified");
            int _columnIndexOfTotalAmountGuaranteedSpecified3 = _columnIndexOfTotalAmountGuaranteedSpecified2;
            int _columnIndexOfDFLT2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "DFLT");
            int _columnIndexOfDFLT3 = _columnIndexOfDFLT2;
            int _columnIndexOfDFLTSpecified3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "DFLTSpecified");
            int _columnIndexOfDFLTSpecified4 = _columnIndexOfDFLTSpecified3;
            int _columnIndexOfGroupName3 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Group_Name");
            int _columnIndexOfGroupName4 = _columnIndexOfGroupName3;
            int _columnIndexOfReferenceNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Reference_No");
            int _columnIndexOfReferenceNo2 = _columnIndexOfReferenceNo;
            int _columnIndexOfBankRefNo4 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "Bank_Ref_No");
            int _columnIndexOfBankRefNo5 = _columnIndexOfBankRefNo4;
            int _columnIndexOfSent2 = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt2, "sent");
            ArrayMap<String, ArrayList<transaction>> _collectionTransactionList4 = new ArrayMap<>();
            while (_stmt2.step()) {
                try {
                    if (_stmt2.isNull(_columnIndexOfNo)) {
                        _tmpKey = null;
                    } else {
                        String _tmpKey2 = _stmt2.getText(_columnIndexOfNo);
                        _tmpKey = _tmpKey2;
                    }
                    if (_tmpKey != null) {
                        _columnIndexOfNoSeries2 = _columnIndexOfNoSeries3;
                        _collectionTransactionList3 = _collectionTransactionList4;
                        if (!_collectionTransactionList3.containsKey(_tmpKey)) {
                            _collectionTransactionList3.put(_tmpKey, new ArrayList<>());
                        }
                    } else {
                        _columnIndexOfNoSeries2 = _columnIndexOfNoSeries3;
                        _collectionTransactionList3 = _collectionTransactionList4;
                    }
                    _columnIndexOfPostedSpecified2 = _columnIndexOfPostedSpecified2;
                    _columnIndexOfSent2 = _columnIndexOfSent2;
                    _collectionTransactionList4 = _collectionTransactionList3;
                    _columnIndexOfNoSeries3 = _columnIndexOfNoSeries2;
                } catch (Throwable th) {
                    th = th;
                    _stmt = _stmt2;
                    _stmt.close();
                    throw th;
                }
            }
            int _columnIndexOfNoSeries4 = _columnIndexOfNoSeries3;
            int _columnIndexOfGroupName5 = _columnIndexOfSent2;
            ArrayMap<String, ArrayList<transaction>> _collectionTransactionList5 = _collectionTransactionList4;
            int _columnIndexOfPostedSpecified3 = _columnIndexOfPostedSpecified2;
            _stmt2.reset();
            __fetchRelationshiptransactionAscomTrimlineMetrocrewTransaction(_connection, _collectionTransactionList5);
            List<tlines> _result2 = new ArrayList<>();
            while (_stmt2.step()) {
                try {
                    if (_stmt2.isNull(_columnIndexOfDFLTSpecified2) && _stmt2.isNull(_columnIndexOfNo) && _stmt2.isNull(_columnIndexOfDate) && _stmt2.isNull(_columnIndexOfDateSpecified) && _stmt2.isNull(_columnIndexOfCashier) && _stmt2.isNull(_columnIndexOfDatePosted) && _stmt2.isNull(_columnIndexOfDatePostedSpecified) && _stmt2.isNull(_columnIndexOfTimePosted) && _stmt2.isNull(_columnIndexOfTimePostedSpecified) && _stmt2.isNull(_columnIndexOfReceivedFrom)) {
                        _columnIndexOfPostedSpecified3 = _columnIndexOfPostedSpecified3;
                        if (_stmt2.isNull(_columnIndexOfPostedSpecified3)) {
                            _columnIndexOfNoSeries = _columnIndexOfNoSeries4;
                            if (_stmt2.isNull(_columnIndexOfNoSeries)) {
                                _result = _result2;
                                _columnIndexOfBankCode = _columnIndexOfBankCode4;
                                if (_stmt2.isNull(_columnIndexOfBankCode)) {
                                    _collectionTransactionList = _collectionTransactionList5;
                                    int _columnIndexOfReceivedFrom4 = _columnIndexOfReceivedFrom3;
                                    if (_stmt2.isNull(_columnIndexOfReceivedFrom4)) {
                                        _columnIndexOfReceivedFrom3 = _columnIndexOfReceivedFrom4;
                                        int _columnIndexOfReceivedFrom5 = _columnIndexOfOnBehalfOf4;
                                        if (_stmt2.isNull(_columnIndexOfReceivedFrom5)) {
                                            _columnIndexOfOnBehalfOf4 = _columnIndexOfReceivedFrom5;
                                            int _columnIndexOfOnBehalfOf5 = _columnIndexOfAmountRecieved3;
                                            if (_stmt2.isNull(_columnIndexOfOnBehalfOf5)) {
                                                _columnIndexOfAmountRecieved3 = _columnIndexOfOnBehalfOf5;
                                                int _columnIndexOfAmountRecieved4 = _columnIndexOfAmountRecievedSpecified2;
                                                if (_stmt2.isNull(_columnIndexOfAmountRecieved4)) {
                                                    _columnIndexOfAmountRecievedSpecified2 = _columnIndexOfAmountRecieved4;
                                                    int _columnIndexOfAmountRecievedSpecified3 = _columnIndexOfGlobalDimension1Code3;
                                                    if (_stmt2.isNull(_columnIndexOfAmountRecievedSpecified3)) {
                                                        _columnIndexOfGlobalDimension1Code3 = _columnIndexOfAmountRecievedSpecified3;
                                                        int _columnIndexOfGlobalDimension1Code4 = _columnIndexOfShortcutDimension2Code3;
                                                        if (_stmt2.isNull(_columnIndexOfGlobalDimension1Code4)) {
                                                            _columnIndexOfShortcutDimension2Code3 = _columnIndexOfGlobalDimension1Code4;
                                                            int _columnIndexOfShortcutDimension2Code4 = _columnIndexOfCurrencyCode4;
                                                            if (_stmt2.isNull(_columnIndexOfShortcutDimension2Code4)) {
                                                                _columnIndexOfCurrencyCode4 = _columnIndexOfShortcutDimension2Code4;
                                                                int _columnIndexOfCurrencyCode5 = _columnIndexOfCurrencyFactor2;
                                                                if (_stmt2.isNull(_columnIndexOfCurrencyCode5)) {
                                                                    _columnIndexOfCurrencyFactor2 = _columnIndexOfCurrencyCode5;
                                                                    int _columnIndexOfCurrencyFactor3 = _columnIndexOfCurrencyFactorSpecified3;
                                                                    if (_stmt2.isNull(_columnIndexOfCurrencyFactor3)) {
                                                                        _columnIndexOfCurrencyFactorSpecified3 = _columnIndexOfCurrencyFactor3;
                                                                        int _columnIndexOfCurrencyFactorSpecified4 = _columnIndexOfTotalAmount3;
                                                                        if (_stmt2.isNull(_columnIndexOfCurrencyFactorSpecified4)) {
                                                                            _columnIndexOfTotalAmount3 = _columnIndexOfCurrencyFactorSpecified4;
                                                                            int _columnIndexOfTotalAmount4 = _columnIndexOfTotalAmountSpecified3;
                                                                            if (_stmt2.isNull(_columnIndexOfTotalAmount4)) {
                                                                                _columnIndexOfTotalAmountSpecified3 = _columnIndexOfTotalAmount4;
                                                                                int _columnIndexOfTotalAmountSpecified4 = _columnIndexOfPostedBy3;
                                                                                if (_stmt2.isNull(_columnIndexOfTotalAmountSpecified4)) {
                                                                                    _columnIndexOfPostedBy3 = _columnIndexOfTotalAmountSpecified4;
                                                                                    int _columnIndexOfPostedBy4 = _columnIndexOfPrintNo3;
                                                                                    if (_stmt2.isNull(_columnIndexOfPostedBy4)) {
                                                                                        _columnIndexOfPrintNo3 = _columnIndexOfPostedBy4;
                                                                                        int _columnIndexOfPrintNo4 = _columnIndexOfPrintNoSpecified3;
                                                                                        if (_stmt2.isNull(_columnIndexOfPrintNo4)) {
                                                                                            _columnIndexOfPrintNoSpecified3 = _columnIndexOfPrintNo4;
                                                                                            int _columnIndexOfPrintNoSpecified4 = _columnIndexOfStatusSpecified3;
                                                                                            if (_stmt2.isNull(_columnIndexOfPrintNoSpecified4)) {
                                                                                                _columnIndexOfStatusSpecified3 = _columnIndexOfPrintNoSpecified4;
                                                                                                int _columnIndexOfStatusSpecified4 = _columnIndexOfChequeNo4;
                                                                                                if (_stmt2.isNull(_columnIndexOfStatusSpecified4)) {
                                                                                                    _columnIndexOfChequeNo4 = _columnIndexOfStatusSpecified4;
                                                                                                    int _columnIndexOfChequeNo5 = _columnIndexOfNoPrinted2;
                                                                                                    if (_stmt2.isNull(_columnIndexOfChequeNo5)) {
                                                                                                        _columnIndexOfNoPrinted2 = _columnIndexOfChequeNo5;
                                                                                                        int _columnIndexOfNoPrinted3 = _columnIndexOfNoPrintedSpecified3;
                                                                                                        if (_stmt2.isNull(_columnIndexOfNoPrinted3)) {
                                                                                                            _columnIndexOfNoPrintedSpecified3 = _columnIndexOfNoPrinted3;
                                                                                                            int _columnIndexOfNoPrintedSpecified4 = _columnIndexOfCreatedBy3;
                                                                                                            if (_stmt2.isNull(_columnIndexOfNoPrintedSpecified4)) {
                                                                                                                _columnIndexOfCreatedBy3 = _columnIndexOfNoPrintedSpecified4;
                                                                                                                int _columnIndexOfCreatedBy4 = _columnIndexOfCreatedDateTime3;
                                                                                                                if (_stmt2.isNull(_columnIndexOfCreatedBy4)) {
                                                                                                                    _columnIndexOfCreatedDateTime3 = _columnIndexOfCreatedBy4;
                                                                                                                    int _columnIndexOfCreatedDateTime4 = _columnIndexOfCreatedDateTimeSpecified4;
                                                                                                                    if (_stmt2.isNull(_columnIndexOfCreatedDateTime4)) {
                                                                                                                        _columnIndexOfCreatedDateTimeSpecified4 = _columnIndexOfCreatedDateTime4;
                                                                                                                        int _columnIndexOfCreatedDateTimeSpecified5 = _columnIndexOfRegisterNo2;
                                                                                                                        if (_stmt2.isNull(_columnIndexOfCreatedDateTimeSpecified5)) {
                                                                                                                            _columnIndexOfRegisterNo2 = _columnIndexOfCreatedDateTimeSpecified5;
                                                                                                                            int _columnIndexOfRegisterNo3 = _columnIndexOfRegisterNoSpecified3;
                                                                                                                            if (_stmt2.isNull(_columnIndexOfRegisterNo3)) {
                                                                                                                                _columnIndexOfRegisterNoSpecified3 = _columnIndexOfRegisterNo3;
                                                                                                                                int _columnIndexOfRegisterNoSpecified4 = _columnIndexOfFromEntryNo3;
                                                                                                                                if (_stmt2.isNull(_columnIndexOfRegisterNoSpecified4)) {
                                                                                                                                    _columnIndexOfFromEntryNo3 = _columnIndexOfRegisterNoSpecified4;
                                                                                                                                    int _columnIndexOfFromEntryNo4 = _columnIndexOfFromEntryNoSpecified3;
                                                                                                                                    if (_stmt2.isNull(_columnIndexOfFromEntryNo4)) {
                                                                                                                                        _columnIndexOfFromEntryNoSpecified3 = _columnIndexOfFromEntryNo4;
                                                                                                                                        int _columnIndexOfFromEntryNoSpecified4 = _columnIndexOfToEntryNo3;
                                                                                                                                        if (_stmt2.isNull(_columnIndexOfFromEntryNoSpecified4)) {
                                                                                                                                            _columnIndexOfToEntryNo3 = _columnIndexOfFromEntryNoSpecified4;
                                                                                                                                            int _columnIndexOfToEntryNo4 = _columnIndexOfToEntryNoSpecified3;
                                                                                                                                            if (_stmt2.isNull(_columnIndexOfToEntryNo4)) {
                                                                                                                                                _columnIndexOfToEntryNoSpecified3 = _columnIndexOfToEntryNo4;
                                                                                                                                                int _columnIndexOfToEntryNoSpecified4 = _columnIndexOfDocumentDate3;
                                                                                                                                                if (_stmt2.isNull(_columnIndexOfToEntryNoSpecified4)) {
                                                                                                                                                    _columnIndexOfDocumentDate3 = _columnIndexOfToEntryNoSpecified4;
                                                                                                                                                    int _columnIndexOfDocumentDate4 = _columnIndexOfDocumentDateSpecified2;
                                                                                                                                                    if (_stmt2.isNull(_columnIndexOfDocumentDate4)) {
                                                                                                                                                        _columnIndexOfDocumentDateSpecified2 = _columnIndexOfDocumentDate4;
                                                                                                                                                        int _columnIndexOfDocumentDateSpecified3 = _columnIndexOfResponsibilityCenter4;
                                                                                                                                                        if (_stmt2.isNull(_columnIndexOfDocumentDateSpecified3)) {
                                                                                                                                                            _columnIndexOfResponsibilityCenter4 = _columnIndexOfDocumentDateSpecified3;
                                                                                                                                                            int _columnIndexOfResponsibilityCenter5 = _columnIndexOfShortcutDimension3Code2;
                                                                                                                                                            if (_stmt2.isNull(_columnIndexOfResponsibilityCenter5)) {
                                                                                                                                                                _columnIndexOfShortcutDimension3Code2 = _columnIndexOfResponsibilityCenter5;
                                                                                                                                                                int _columnIndexOfShortcutDimension3Code3 = _columnIndexOfShortcutDimension4Code3;
                                                                                                                                                                if (_stmt2.isNull(_columnIndexOfShortcutDimension3Code3)) {
                                                                                                                                                                    _columnIndexOfShortcutDimension4Code3 = _columnIndexOfShortcutDimension3Code3;
                                                                                                                                                                    int _columnIndexOfShortcutDimension4Code4 = _columnIndexOfDim6;
                                                                                                                                                                    if (_stmt2.isNull(_columnIndexOfShortcutDimension4Code4)) {
                                                                                                                                                                        _columnIndexOfDim6 = _columnIndexOfShortcutDimension4Code4;
                                                                                                                                                                        int _columnIndexOfDim13 = _columnIndexOfDim8;
                                                                                                                                                                        if (_stmt2.isNull(_columnIndexOfDim13)) {
                                                                                                                                                                            _columnIndexOfDim8 = _columnIndexOfDim13;
                                                                                                                                                                            int _columnIndexOfDim14 = _columnIndexOfBankName3;
                                                                                                                                                                            if (_stmt2.isNull(_columnIndexOfDim14)) {
                                                                                                                                                                                _columnIndexOfBankName3 = _columnIndexOfDim14;
                                                                                                                                                                                int _columnIndexOfBankName4 = _columnIndexOfReceiptTypeSpecified3;
                                                                                                                                                                                if (_stmt2.isNull(_columnIndexOfBankName4)) {
                                                                                                                                                                                    _columnIndexOfReceiptTypeSpecified3 = _columnIndexOfBankName4;
                                                                                                                                                                                    int _columnIndexOfReceiptTypeSpecified4 = _columnIndexOfDimensionSetID3;
                                                                                                                                                                                    if (_stmt2.isNull(_columnIndexOfReceiptTypeSpecified4)) {
                                                                                                                                                                                        _columnIndexOfDimensionSetID3 = _columnIndexOfReceiptTypeSpecified4;
                                                                                                                                                                                        int _columnIndexOfDimensionSetID4 = _columnIndexOfDimensionSetIDSpecified3;
                                                                                                                                                                                        if (_stmt2.isNull(_columnIndexOfDimensionSetID4)) {
                                                                                                                                                                                            _columnIndexOfDimensionSetIDSpecified3 = _columnIndexOfDimensionSetID4;
                                                                                                                                                                                            int _columnIndexOfDimensionSetIDSpecified4 = _columnIndexOfDim10;
                                                                                                                                                                                            if (_stmt2.isNull(_columnIndexOfDimensionSetIDSpecified4)) {
                                                                                                                                                                                                _columnIndexOfDim10 = _columnIndexOfDimensionSetIDSpecified4;
                                                                                                                                                                                                int _columnIndexOfDim15 = _columnIndexOfDim12;
                                                                                                                                                                                                if (_stmt2.isNull(_columnIndexOfDim15)) {
                                                                                                                                                                                                    _columnIndexOfDim12 = _columnIndexOfDim15;
                                                                                                                                                                                                    int _columnIndexOfDim16 = _columnIndexOfAccountNo3;
                                                                                                                                                                                                    if (_stmt2.isNull(_columnIndexOfDim16)) {
                                                                                                                                                                                                        _columnIndexOfAccountNo3 = _columnIndexOfDim16;
                                                                                                                                                                                                        int _columnIndexOfAccountNo4 = _columnIndexOfName3;
                                                                                                                                                                                                        if (_stmt2.isNull(_columnIndexOfAccountNo4)) {
                                                                                                                                                                                                            _columnIndexOfName3 = _columnIndexOfAccountNo4;
                                                                                                                                                                                                            int _columnIndexOfName4 = _columnIndexOfPayMode4;
                                                                                                                                                                                                            if (_stmt2.isNull(_columnIndexOfName4)) {
                                                                                                                                                                                                                _columnIndexOfPayMode4 = _columnIndexOfName4;
                                                                                                                                                                                                                int _columnIndexOfPayMode5 = _columnIndexOfPayModeSpecified2;
                                                                                                                                                                                                                if (_stmt2.isNull(_columnIndexOfPayMode5)) {
                                                                                                                                                                                                                    _columnIndexOfPayModeSpecified2 = _columnIndexOfPayMode5;
                                                                                                                                                                                                                    int _columnIndexOfPayModeSpecified3 = _columnIndexOfChequeDepositSlipNo4;
                                                                                                                                                                                                                    if (_stmt2.isNull(_columnIndexOfPayModeSpecified3)) {
                                                                                                                                                                                                                        _columnIndexOfChequeDepositSlipNo4 = _columnIndexOfPayModeSpecified3;
                                                                                                                                                                                                                        int _columnIndexOfChequeDepositSlipNo5 = _columnIndexOfChequeDepositSlipDate3;
                                                                                                                                                                                                                        if (_stmt2.isNull(_columnIndexOfChequeDepositSlipNo5)) {
                                                                                                                                                                                                                            _columnIndexOfChequeDepositSlipDate3 = _columnIndexOfChequeDepositSlipNo5;
                                                                                                                                                                                                                            int _columnIndexOfChequeDepositSlipDate4 = _columnIndexOfChequeDepositSlipDateSpecified2;
                                                                                                                                                                                                                            if (_stmt2.isNull(_columnIndexOfChequeDepositSlipDate4)) {
                                                                                                                                                                                                                                _columnIndexOfChequeDepositSlipDateSpecified2 = _columnIndexOfChequeDepositSlipDate4;
                                                                                                                                                                                                                                int _columnIndexOfChequeDepositSlipDateSpecified3 = _columnIndexOfTotalAmountGuaranteed3;
                                                                                                                                                                                                                                if (_stmt2.isNull(_columnIndexOfChequeDepositSlipDateSpecified3)) {
                                                                                                                                                                                                                                    _columnIndexOfTotalAmountGuaranteed3 = _columnIndexOfChequeDepositSlipDateSpecified3;
                                                                                                                                                                                                                                    int _columnIndexOfTotalAmountGuaranteed4 = _columnIndexOfTotalAmountGuaranteedSpecified3;
                                                                                                                                                                                                                                    if (_stmt2.isNull(_columnIndexOfTotalAmountGuaranteed4)) {
                                                                                                                                                                                                                                        _columnIndexOfTotalAmountGuaranteedSpecified3 = _columnIndexOfTotalAmountGuaranteed4;
                                                                                                                                                                                                                                        int _columnIndexOfTotalAmountGuaranteedSpecified4 = _columnIndexOfDFLT3;
                                                                                                                                                                                                                                        if (_stmt2.isNull(_columnIndexOfTotalAmountGuaranteedSpecified4)) {
                                                                                                                                                                                                                                            _columnIndexOfDFLT3 = _columnIndexOfTotalAmountGuaranteedSpecified4;
                                                                                                                                                                                                                                            int _columnIndexOfDFLT4 = _columnIndexOfDFLTSpecified4;
                                                                                                                                                                                                                                            if (_stmt2.isNull(_columnIndexOfDFLT4)) {
                                                                                                                                                                                                                                                _columnIndexOfDFLTSpecified4 = _columnIndexOfDFLT4;
                                                                                                                                                                                                                                                int _columnIndexOfDFLTSpecified5 = _columnIndexOfGroupName4;
                                                                                                                                                                                                                                                if (_stmt2.isNull(_columnIndexOfDFLTSpecified5)) {
                                                                                                                                                                                                                                                    _columnIndexOfGroupName4 = _columnIndexOfDFLTSpecified5;
                                                                                                                                                                                                                                                    int _columnIndexOfGroupName6 = _columnIndexOfReferenceNo2;
                                                                                                                                                                                                                                                    if (_stmt2.isNull(_columnIndexOfGroupName6)) {
                                                                                                                                                                                                                                                        _columnIndexOfReferenceNo2 = _columnIndexOfGroupName6;
                                                                                                                                                                                                                                                        int _columnIndexOfReferenceNo3 = _columnIndexOfBankRefNo5;
                                                                                                                                                                                                                                                        if (_stmt2.isNull(_columnIndexOfReferenceNo3)) {
                                                                                                                                                                                                                                                            _columnIndexOfBankRefNo5 = _columnIndexOfReferenceNo3;
                                                                                                                                                                                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                                                            if (_stmt2.isNull(_columnIndexOfBankRefNo)) {
                                                                                                                                                                                                                                                                _columnIndexOfBankCode2 = _columnIndexOfBankCode;
                                                                                                                                                                                                                                                                _columnIndexOfKey2 = _columnIndexOfDFLTSpecified2;
                                                                                                                                                                                                                                                                _columnIndexOfNo = _columnIndexOfNo;
                                                                                                                                                                                                                                                                _columnIndexOfOnBehalfOf2 = _columnIndexOfOnBehalfOf4;
                                                                                                                                                                                                                                                                _columnIndexOfCurrencyCode2 = _columnIndexOfCurrencyCode4;
                                                                                                                                                                                                                                                                _columnIndexOfChequeNo2 = _columnIndexOfChequeNo4;
                                                                                                                                                                                                                                                                _columnIndexOfCreatedDateTime = _columnIndexOfCreatedDateTime3;
                                                                                                                                                                                                                                                                _columnIndexOfCreatedDateTimeSpecified2 = _columnIndexOfCreatedDateTimeSpecified4;
                                                                                                                                                                                                                                                                _columnIndexOfDocumentDate = _columnIndexOfDocumentDate3;
                                                                                                                                                                                                                                                                _columnIndexOfResponsibilityCenter2 = _columnIndexOfResponsibilityCenter4;
                                                                                                                                                                                                                                                                _columnIndexOfPayMode2 = _columnIndexOfPayMode4;
                                                                                                                                                                                                                                                                _columnIndexOfChequeDepositSlipNo2 = _columnIndexOfChequeDepositSlipNo4;
                                                                                                                                                                                                                                                                _columnIndexOfChequeDepositSlipDate = _columnIndexOfChequeDepositSlipDate3;
                                                                                                                                                                                                                                                                _columnIndexOfKey3 = _columnIndexOfDFLTSpecified4;
                                                                                                                                                                                                                                                                _columnIndexOfGroupName2 = _columnIndexOfGroupName4;
                                                                                                                                                                                                                                                                _columnIndexOfBankRefNo3 = _columnIndexOfBankRefNo5;
                                                                                                                                                                                                                                                                _tmpTheader = null;
                                                                                                                                                                                                                                                                _columnIndexOfPostedSpecified3 = _columnIndexOfPostedSpecified3;
                                                                                                                                                                                                                                                                _columnIndexOfPostedSpecified = _columnIndexOfBankRefNo;
                                                                                                                                                                                                                                                                _columnIndexOfOnBehalfOf = _columnIndexOfReceivedFrom3;
                                                                                                                                                                                                                                                                _columnIndexOfCurrencyCode = _columnIndexOfShortcutDimension2Code3;
                                                                                                                                                                                                                                                                _columnIndexOfChequeNo = _columnIndexOfPrintNo3;
                                                                                                                                                                                                                                                                _columnIndexOfCreatedDateTimeSpecified = _columnIndexOfNoPrintedSpecified3;
                                                                                                                                                                                                                                                                _columnIndexOfResponsibilityCenter = _columnIndexOfDocumentDateSpecified2;
                                                                                                                                                                                                                                                                _columnIndexOfSent = _columnIndexOfDim10;
                                                                                                                                                                                                                                                                _columnIndexOfPayMode = _columnIndexOfName3;
                                                                                                                                                                                                                                                                _columnIndexOfChequeDepositSlipNo = _columnIndexOfPayModeSpecified2;
                                                                                                                                                                                                                                                                _columnIndexOfGroupName = _columnIndexOfChequeDepositSlipDateSpecified2;
                                                                                                                                                                                                                                                                _columnIndexOfDFLTSpecified = _columnIndexOfDFLT3;
                                                                                                                                                                                                                                                                _columnIndexOfBankRefNo2 = _columnIndexOfReferenceNo2;
                                                                                                                                                                                                                                                                _columnIndexOfReceivedFrom = _columnIndexOfReceivedFrom;
                                                                                                                                                                                                                                                                _columnIndexOfShortcutDimension2Code = _columnIndexOfAmountRecievedSpecified2;
                                                                                                                                                                                                                                                                _columnIndexOfPrintNo = _columnIndexOfTotalAmountSpecified3;
                                                                                                                                                                                                                                                                _columnIndexOfNoPrintedSpecified = _columnIndexOfStatusSpecified3;
                                                                                                                                                                                                                                                                _columnIndexOfDim1 = _columnIndexOfBankName3;
                                                                                                                                                                                                                                                                _columnIndexOfName = _columnIndexOfAccountNo3;
                                                                                                                                                                                                                                                                _columnIndexOfDFLT = _columnIndexOfTotalAmountGuaranteedSpecified3;
                                                                                                                                                                                                                                                                _columnIndexOfTotalAmountSpecified = _columnIndexOfTotalAmount3;
                                                                                                                                                                                                                                                                _columnIndexOfStatusSpecified = _columnIndexOfPrintNoSpecified3;
                                                                                                                                                                                                                                                                _columnIndexOfBankName = _columnIndexOfDim8;
                                                                                                                                                                                                                                                                _columnIndexOfAccountNo = _columnIndexOfDim12;
                                                                                                                                                                                                                                                                _columnIndexOfTotalAmountGuaranteedSpecified = _columnIndexOfTotalAmountGuaranteed3;
                                                                                                                                                                                                                                                                _columnIndexOfTotalAmount = _columnIndexOfCurrencyFactorSpecified3;
                                                                                                                                                                                                                                                                _columnIndexOfPrintNoSpecified = _columnIndexOfPostedBy3;
                                                                                                                                                                                                                                                                _columnIndexOfTotalAmountGuaranteed = _columnIndexOfToEntryNoSpecified3;
                                                                                                                                                                                                                                                                _columnIndexOfDim4 = _columnIndexOfDim6;
                                                                                                                                                                                                                                                                _columnIndexOfDim2 = _columnIndexOfDimensionSetIDSpecified3;
                                                                                                                                                                                                                                                                _columnIndexOfCurrencyFactorSpecified = _columnIndexOfGlobalDimension1Code3;
                                                                                                                                                                                                                                                                _columnIndexOfPostedBy = _columnIndexOfCurrencyFactor2;
                                                                                                                                                                                                                                                                _columnIndexOfToEntryNoSpecified = _columnIndexOfToEntryNo3;
                                                                                                                                                                                                                                                                _columnIndexOfDim3 = _columnIndexOfShortcutDimension4Code3;
                                                                                                                                                                                                                                                                _columnIndexOfDimensionSetIDSpecified = _columnIndexOfDimensionSetID3;
                                                                                                                                                                                                                                                                _columnIndexOfGlobalDimension1Code = _columnIndexOfAmountRecieved3;
                                                                                                                                                                                                                                                                _columnIndexOfToEntryNo = _columnIndexOfFromEntryNoSpecified3;
                                                                                                                                                                                                                                                                _columnIndexOfShortcutDimension4Code = _columnIndexOfShortcutDimension3Code2;
                                                                                                                                                                                                                                                                _columnIndexOfDimensionSetID = _columnIndexOfReceiptTypeSpecified3;
                                                                                                                                                                                                                                                                _columnIndexOfAmountRecieved = _columnIndexOfNoSeries;
                                                                                                                                                                                                                                                                _columnIndexOfReceiptTypeSpecified = _columnIndexOfCreatedBy3;
                                                                                                                                                                                                                                                                _columnIndexOfFromEntryNoSpecified = _columnIndexOfFromEntryNo3;
                                                                                                                                                                                                                                                                _columnIndexOfCreatedBy = _columnIndexOfNoPrinted2;
                                                                                                                                                                                                                                                                _columnIndexOfFromEntryNo = _columnIndexOfRegisterNoSpecified3;
                                                                                                                                                                                                                                                                _columnIndexOfRegisterNoSpecified = _columnIndexOfRegisterNo2;
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                            _columnIndexOfNo = _columnIndexOfNo;
                                                                                                                                                                                                                                                            if (_stmt2.isNull(_columnIndexOfNo)) {
                                                                                                                                                                                                                                                                _tmpKey_1 = null;
                                                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                                                _tmpKey_1 = _stmt2.getText(_columnIndexOfNo);
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                            if (_tmpKey_1 != null) {
                                                                                                                                                                                                                                                                _collectionTransactionList2 = _collectionTransactionList;
                                                                                                                                                                                                                                                                _tmpTransactionListCollection = _collectionTransactionList2.get(_tmpKey_1);
                                                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                                                _collectionTransactionList2 = _collectionTransactionList;
                                                                                                                                                                                                                                                                _tmpTransactionListCollection = new ArrayList<>();
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                            tlines _item = new tlines();
                                                                                                                                                                                                                                                            _stmt = _stmt2;
                                                                                                                                                                                                                                                            _item.theader = _tmpTheader;
                                                                                                                                                                                                                                                            _item.transactionList = _tmpTransactionListCollection;
                                                                                                                                                                                                                                                            List<tlines> _tmpTransactionListCollection2 = _result;
                                                                                                                                                                                                                                                            _tmpTransactionListCollection2.add(_item);
                                                                                                                                                                                                                                                            _result2 = _tmpTransactionListCollection2;
                                                                                                                                                                                                                                                            _stmt2 = _stmt;
                                                                                                                                                                                                                                                            _columnIndexOfReceivedFrom = _columnIndexOfReceivedFrom;
                                                                                                                                                                                                                                                            _columnIndexOfReceivedFrom3 = _columnIndexOfOnBehalfOf;
                                                                                                                                                                                                                                                            _columnIndexOfNoSeries4 = _columnIndexOfAmountRecieved;
                                                                                                                                                                                                                                                            _columnIndexOfAmountRecieved3 = _columnIndexOfGlobalDimension1Code;
                                                                                                                                                                                                                                                            _columnIndexOfGlobalDimension1Code3 = _columnIndexOfCurrencyFactorSpecified;
                                                                                                                                                                                                                                                            _columnIndexOfCurrencyFactorSpecified3 = _columnIndexOfTotalAmount;
                                                                                                                                                                                                                                                            _columnIndexOfTotalAmount3 = _columnIndexOfTotalAmountSpecified;
                                                                                                                                                                                                                                                            _columnIndexOfCurrencyFactor2 = _columnIndexOfPostedBy;
                                                                                                                                                                                                                                                            _columnIndexOfTotalAmountSpecified3 = _columnIndexOfPrintNo;
                                                                                                                                                                                                                                                            _columnIndexOfPostedBy3 = _columnIndexOfPrintNoSpecified;
                                                                                                                                                                                                                                                            _columnIndexOfPrintNoSpecified3 = _columnIndexOfStatusSpecified;
                                                                                                                                                                                                                                                            _columnIndexOfPrintNo3 = _columnIndexOfChequeNo;
                                                                                                                                                                                                                                                            _columnIndexOfStatusSpecified3 = _columnIndexOfNoPrintedSpecified;
                                                                                                                                                                                                                                                            _columnIndexOfNoPrinted2 = _columnIndexOfCreatedBy;
                                                                                                                                                                                                                                                            _columnIndexOfNoPrintedSpecified3 = _columnIndexOfCreatedDateTimeSpecified;
                                                                                                                                                                                                                                                            _columnIndexOfRegisterNo2 = _columnIndexOfRegisterNoSpecified;
                                                                                                                                                                                                                                                            _columnIndexOfRegisterNoSpecified3 = _columnIndexOfFromEntryNo;
                                                                                                                                                                                                                                                            _columnIndexOfFromEntryNo3 = _columnIndexOfFromEntryNoSpecified;
                                                                                                                                                                                                                                                            _columnIndexOfFromEntryNoSpecified3 = _columnIndexOfToEntryNo;
                                                                                                                                                                                                                                                            _columnIndexOfToEntryNo3 = _columnIndexOfToEntryNoSpecified;
                                                                                                                                                                                                                                                            _columnIndexOfDocumentDateSpecified2 = _columnIndexOfResponsibilityCenter;
                                                                                                                                                                                                                                                            _columnIndexOfShortcutDimension3Code2 = _columnIndexOfShortcutDimension4Code;
                                                                                                                                                                                                                                                            _columnIndexOfShortcutDimension4Code3 = _columnIndexOfDim3;
                                                                                                                                                                                                                                                            _columnIndexOfDim6 = _columnIndexOfDim4;
                                                                                                                                                                                                                                                            _columnIndexOfDim8 = _columnIndexOfBankName;
                                                                                                                                                                                                                                                            _columnIndexOfCreatedBy3 = _columnIndexOfReceiptTypeSpecified;
                                                                                                                                                                                                                                                            _columnIndexOfReceiptTypeSpecified3 = _columnIndexOfDimensionSetID;
                                                                                                                                                                                                                                                            _columnIndexOfDimensionSetID3 = _columnIndexOfDimensionSetIDSpecified;
                                                                                                                                                                                                                                                            _columnIndexOfBankName3 = _columnIndexOfDim1;
                                                                                                                                                                                                                                                            _columnIndexOfDimensionSetIDSpecified3 = _columnIndexOfDim2;
                                                                                                                                                                                                                                                            _columnIndexOfDim12 = _columnIndexOfAccountNo;
                                                                                                                                                                                                                                                            _columnIndexOfAccountNo3 = _columnIndexOfName;
                                                                                                                                                                                                                                                            _columnIndexOfName3 = _columnIndexOfPayMode;
                                                                                                                                                                                                                                                            _columnIndexOfPayModeSpecified2 = _columnIndexOfChequeDepositSlipNo;
                                                                                                                                                                                                                                                            _columnIndexOfToEntryNoSpecified3 = _columnIndexOfTotalAmountGuaranteed;
                                                                                                                                                                                                                                                            _columnIndexOfTotalAmountGuaranteed3 = _columnIndexOfTotalAmountGuaranteedSpecified;
                                                                                                                                                                                                                                                            _columnIndexOfTotalAmountGuaranteedSpecified3 = _columnIndexOfDFLT;
                                                                                                                                                                                                                                                            _columnIndexOfDFLT3 = _columnIndexOfDFLTSpecified;
                                                                                                                                                                                                                                                            _columnIndexOfChequeDepositSlipDateSpecified2 = _columnIndexOfGroupName;
                                                                                                                                                                                                                                                            _columnIndexOfReferenceNo2 = _columnIndexOfBankRefNo2;
                                                                                                                                                                                                                                                            _columnIndexOfGroupName4 = _columnIndexOfGroupName2;
                                                                                                                                                                                                                                                            _columnIndexOfBankRefNo5 = _columnIndexOfBankRefNo3;
                                                                                                                                                                                                                                                            _columnIndexOfOnBehalfOf4 = _columnIndexOfOnBehalfOf2;
                                                                                                                                                                                                                                                            _columnIndexOfChequeNo4 = _columnIndexOfChequeNo2;
                                                                                                                                                                                                                                                            _columnIndexOfCreatedDateTime3 = _columnIndexOfCreatedDateTime;
                                                                                                                                                                                                                                                            _columnIndexOfBankCode4 = _columnIndexOfBankCode2;
                                                                                                                                                                                                                                                            _columnIndexOfCreatedDateTimeSpecified4 = _columnIndexOfCreatedDateTimeSpecified2;
                                                                                                                                                                                                                                                            _columnIndexOfDocumentDate3 = _columnIndexOfDocumentDate;
                                                                                                                                                                                                                                                            _columnIndexOfResponsibilityCenter4 = _columnIndexOfResponsibilityCenter2;
                                                                                                                                                                                                                                                            _columnIndexOfPayMode4 = _columnIndexOfPayMode2;
                                                                                                                                                                                                                                                            _columnIndexOfChequeDepositSlipDate3 = _columnIndexOfChequeDepositSlipDate;
                                                                                                                                                                                                                                                            _columnIndexOfChequeDepositSlipNo4 = _columnIndexOfChequeDepositSlipNo2;
                                                                                                                                                                                                                                                            _columnIndexOfDim10 = _columnIndexOfSent;
                                                                                                                                                                                                                                                            _columnIndexOfDFLTSpecified4 = _columnIndexOfKey3;
                                                                                                                                                                                                                                                            _columnIndexOfGroupName5 = _columnIndexOfPostedSpecified;
                                                                                                                                                                                                                                                            _columnIndexOfAmountRecievedSpecified2 = _columnIndexOfShortcutDimension2Code;
                                                                                                                                                                                                                                                            _columnIndexOfShortcutDimension2Code3 = _columnIndexOfCurrencyCode;
                                                                                                                                                                                                                                                            _columnIndexOfDFLTSpecified2 = _columnIndexOfKey2;
                                                                                                                                                                                                                                                            _columnIndexOfCurrencyCode4 = _columnIndexOfCurrencyCode2;
                                                                                                                                                                                                                                                            _collectionTransactionList5 = _collectionTransactionList2;
                                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                                            _columnIndexOfBankRefNo5 = _columnIndexOfReferenceNo3;
                                                                                                                                                                                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                                        _columnIndexOfReferenceNo2 = _columnIndexOfGroupName6;
                                                                                                                                                                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                                    _columnIndexOfGroupName4 = _columnIndexOfDFLTSpecified5;
                                                                                                                                                                                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                                _columnIndexOfDFLTSpecified4 = _columnIndexOfDFLT4;
                                                                                                                                                                                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                                            _columnIndexOfDFLT3 = _columnIndexOfTotalAmountGuaranteedSpecified4;
                                                                                                                                                                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                                        _columnIndexOfTotalAmountGuaranteedSpecified3 = _columnIndexOfTotalAmountGuaranteed4;
                                                                                                                                                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                                    _columnIndexOfTotalAmountGuaranteed3 = _columnIndexOfChequeDepositSlipDateSpecified3;
                                                                                                                                                                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                                _columnIndexOfChequeDepositSlipDateSpecified2 = _columnIndexOfChequeDepositSlipDate4;
                                                                                                                                                                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                        } else {
                                                                                                                                                                                                                            _columnIndexOfChequeDepositSlipDate3 = _columnIndexOfChequeDepositSlipNo5;
                                                                                                                                                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                    } else {
                                                                                                                                                                                                                        _columnIndexOfChequeDepositSlipNo4 = _columnIndexOfPayModeSpecified3;
                                                                                                                                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                } else {
                                                                                                                                                                                                                    _columnIndexOfPayModeSpecified2 = _columnIndexOfPayMode5;
                                                                                                                                                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                                }
                                                                                                                                                                                                            } else {
                                                                                                                                                                                                                _columnIndexOfPayMode4 = _columnIndexOfName4;
                                                                                                                                                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                            }
                                                                                                                                                                                                        } else {
                                                                                                                                                                                                            _columnIndexOfName3 = _columnIndexOfAccountNo4;
                                                                                                                                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                        }
                                                                                                                                                                                                    } else {
                                                                                                                                                                                                        _columnIndexOfAccountNo3 = _columnIndexOfDim16;
                                                                                                                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                    }
                                                                                                                                                                                                } else {
                                                                                                                                                                                                    _columnIndexOfDim12 = _columnIndexOfDim15;
                                                                                                                                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                                }
                                                                                                                                                                                            } else {
                                                                                                                                                                                                _columnIndexOfDim10 = _columnIndexOfDimensionSetIDSpecified4;
                                                                                                                                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                            }
                                                                                                                                                                                        } else {
                                                                                                                                                                                            _columnIndexOfDimensionSetIDSpecified3 = _columnIndexOfDimensionSetID4;
                                                                                                                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                        }
                                                                                                                                                                                    } else {
                                                                                                                                                                                        _columnIndexOfDimensionSetID3 = _columnIndexOfReceiptTypeSpecified4;
                                                                                                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                    }
                                                                                                                                                                                } else {
                                                                                                                                                                                    _columnIndexOfReceiptTypeSpecified3 = _columnIndexOfBankName4;
                                                                                                                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                                }
                                                                                                                                                                            } else {
                                                                                                                                                                                _columnIndexOfBankName3 = _columnIndexOfDim14;
                                                                                                                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                            }
                                                                                                                                                                        } else {
                                                                                                                                                                            _columnIndexOfDim8 = _columnIndexOfDim13;
                                                                                                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                        }
                                                                                                                                                                    } else {
                                                                                                                                                                        _columnIndexOfDim6 = _columnIndexOfShortcutDimension4Code4;
                                                                                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                    }
                                                                                                                                                                } else {
                                                                                                                                                                    _columnIndexOfShortcutDimension4Code3 = _columnIndexOfShortcutDimension3Code3;
                                                                                                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                                }
                                                                                                                                                            } else {
                                                                                                                                                                _columnIndexOfShortcutDimension3Code2 = _columnIndexOfResponsibilityCenter5;
                                                                                                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                            }
                                                                                                                                                        } else {
                                                                                                                                                            _columnIndexOfResponsibilityCenter4 = _columnIndexOfDocumentDateSpecified3;
                                                                                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                        }
                                                                                                                                                    } else {
                                                                                                                                                        _columnIndexOfDocumentDateSpecified2 = _columnIndexOfDocumentDate4;
                                                                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                    }
                                                                                                                                                } else {
                                                                                                                                                    _columnIndexOfDocumentDate3 = _columnIndexOfToEntryNoSpecified4;
                                                                                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                                }
                                                                                                                                            } else {
                                                                                                                                                _columnIndexOfToEntryNoSpecified3 = _columnIndexOfToEntryNo4;
                                                                                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                            }
                                                                                                                                        } else {
                                                                                                                                            _columnIndexOfToEntryNo3 = _columnIndexOfFromEntryNoSpecified4;
                                                                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                        }
                                                                                                                                    } else {
                                                                                                                                        _columnIndexOfFromEntryNoSpecified3 = _columnIndexOfFromEntryNo4;
                                                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                    }
                                                                                                                                } else {
                                                                                                                                    _columnIndexOfFromEntryNo3 = _columnIndexOfRegisterNoSpecified4;
                                                                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                                }
                                                                                                                            } else {
                                                                                                                                _columnIndexOfRegisterNoSpecified3 = _columnIndexOfRegisterNo3;
                                                                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                            }
                                                                                                                        } else {
                                                                                                                            _columnIndexOfRegisterNo2 = _columnIndexOfCreatedDateTimeSpecified5;
                                                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                        }
                                                                                                                    } else {
                                                                                                                        _columnIndexOfCreatedDateTimeSpecified4 = _columnIndexOfCreatedDateTime4;
                                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                    }
                                                                                                                } else {
                                                                                                                    _columnIndexOfCreatedDateTime3 = _columnIndexOfCreatedBy4;
                                                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                                }
                                                                                                            } else {
                                                                                                                _columnIndexOfCreatedBy3 = _columnIndexOfNoPrintedSpecified4;
                                                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                            }
                                                                                                        } else {
                                                                                                            _columnIndexOfNoPrintedSpecified3 = _columnIndexOfNoPrinted3;
                                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                        }
                                                                                                    } else {
                                                                                                        _columnIndexOfNoPrinted2 = _columnIndexOfChequeNo5;
                                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                    }
                                                                                                } else {
                                                                                                    _columnIndexOfChequeNo4 = _columnIndexOfStatusSpecified4;
                                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                                }
                                                                                            } else {
                                                                                                _columnIndexOfStatusSpecified3 = _columnIndexOfPrintNoSpecified4;
                                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                            }
                                                                                        } else {
                                                                                            _columnIndexOfPrintNoSpecified3 = _columnIndexOfPrintNo4;
                                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                        }
                                                                                    } else {
                                                                                        _columnIndexOfPrintNo3 = _columnIndexOfPostedBy4;
                                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                    }
                                                                                } else {
                                                                                    _columnIndexOfPostedBy3 = _columnIndexOfTotalAmountSpecified4;
                                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                                }
                                                                            } else {
                                                                                _columnIndexOfTotalAmountSpecified3 = _columnIndexOfTotalAmount4;
                                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                            }
                                                                        } else {
                                                                            _columnIndexOfTotalAmount3 = _columnIndexOfCurrencyFactorSpecified4;
                                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                        }
                                                                    } else {
                                                                        _columnIndexOfCurrencyFactorSpecified3 = _columnIndexOfCurrencyFactor3;
                                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                    }
                                                                } else {
                                                                    _columnIndexOfCurrencyFactor2 = _columnIndexOfCurrencyCode5;
                                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                                }
                                                            } else {
                                                                _columnIndexOfCurrencyCode4 = _columnIndexOfShortcutDimension2Code4;
                                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                            }
                                                        } else {
                                                            _columnIndexOfShortcutDimension2Code3 = _columnIndexOfGlobalDimension1Code4;
                                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                        }
                                                    } else {
                                                        _columnIndexOfGlobalDimension1Code3 = _columnIndexOfAmountRecievedSpecified3;
                                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                    }
                                                } else {
                                                    _columnIndexOfAmountRecievedSpecified2 = _columnIndexOfAmountRecieved4;
                                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                                }
                                            } else {
                                                _columnIndexOfAmountRecieved3 = _columnIndexOfOnBehalfOf5;
                                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                            }
                                        } else {
                                            _columnIndexOfOnBehalfOf4 = _columnIndexOfReceivedFrom5;
                                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                        }
                                    } else {
                                        _columnIndexOfReceivedFrom3 = _columnIndexOfReceivedFrom4;
                                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                    }
                                } else {
                                    _collectionTransactionList = _collectionTransactionList5;
                                    _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                                }
                            } else {
                                _result = _result2;
                                _columnIndexOfBankCode = _columnIndexOfBankCode4;
                                _collectionTransactionList = _collectionTransactionList5;
                                _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                            }
                        } else {
                            _columnIndexOfNoSeries = _columnIndexOfNoSeries4;
                            _result = _result2;
                            _columnIndexOfBankCode = _columnIndexOfBankCode4;
                            _collectionTransactionList = _collectionTransactionList5;
                            _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                        }
                    } else {
                        _columnIndexOfNoSeries = _columnIndexOfNoSeries4;
                        _columnIndexOfPostedSpecified3 = _columnIndexOfPostedSpecified3;
                        _result = _result2;
                        _columnIndexOfBankCode = _columnIndexOfBankCode4;
                        _collectionTransactionList = _collectionTransactionList5;
                        _columnIndexOfBankRefNo = _columnIndexOfGroupName5;
                    }
                    _item.theader = _tmpTheader;
                    _item.transactionList = _tmpTransactionListCollection;
                    List<tlines> _tmpTransactionListCollection3 = _result;
                    _tmpTransactionListCollection3.add(_item);
                    _result2 = _tmpTransactionListCollection3;
                    _stmt2 = _stmt;
                    _columnIndexOfReceivedFrom = _columnIndexOfReceivedFrom;
                    _columnIndexOfReceivedFrom3 = _columnIndexOfOnBehalfOf;
                    _columnIndexOfNoSeries4 = _columnIndexOfAmountRecieved;
                    _columnIndexOfAmountRecieved3 = _columnIndexOfGlobalDimension1Code;
                    _columnIndexOfGlobalDimension1Code3 = _columnIndexOfCurrencyFactorSpecified;
                    _columnIndexOfCurrencyFactorSpecified3 = _columnIndexOfTotalAmount;
                    _columnIndexOfTotalAmount3 = _columnIndexOfTotalAmountSpecified;
                    _columnIndexOfCurrencyFactor2 = _columnIndexOfPostedBy;
                    _columnIndexOfTotalAmountSpecified3 = _columnIndexOfPrintNo;
                    _columnIndexOfPostedBy3 = _columnIndexOfPrintNoSpecified;
                    _columnIndexOfPrintNoSpecified3 = _columnIndexOfStatusSpecified;
                    _columnIndexOfPrintNo3 = _columnIndexOfChequeNo;
                    _columnIndexOfStatusSpecified3 = _columnIndexOfNoPrintedSpecified;
                    _columnIndexOfNoPrinted2 = _columnIndexOfCreatedBy;
                    _columnIndexOfNoPrintedSpecified3 = _columnIndexOfCreatedDateTimeSpecified;
                    _columnIndexOfRegisterNo2 = _columnIndexOfRegisterNoSpecified;
                    _columnIndexOfRegisterNoSpecified3 = _columnIndexOfFromEntryNo;
                    _columnIndexOfFromEntryNo3 = _columnIndexOfFromEntryNoSpecified;
                    _columnIndexOfFromEntryNoSpecified3 = _columnIndexOfToEntryNo;
                    _columnIndexOfToEntryNo3 = _columnIndexOfToEntryNoSpecified;
                    _columnIndexOfDocumentDateSpecified2 = _columnIndexOfResponsibilityCenter;
                    _columnIndexOfShortcutDimension3Code2 = _columnIndexOfShortcutDimension4Code;
                    _columnIndexOfShortcutDimension4Code3 = _columnIndexOfDim3;
                    _columnIndexOfDim6 = _columnIndexOfDim4;
                    _columnIndexOfDim8 = _columnIndexOfBankName;
                    _columnIndexOfCreatedBy3 = _columnIndexOfReceiptTypeSpecified;
                    _columnIndexOfReceiptTypeSpecified3 = _columnIndexOfDimensionSetID;
                    _columnIndexOfDimensionSetID3 = _columnIndexOfDimensionSetIDSpecified;
                    _columnIndexOfBankName3 = _columnIndexOfDim1;
                    _columnIndexOfDimensionSetIDSpecified3 = _columnIndexOfDim2;
                    _columnIndexOfDim12 = _columnIndexOfAccountNo;
                    _columnIndexOfAccountNo3 = _columnIndexOfName;
                    _columnIndexOfName3 = _columnIndexOfPayMode;
                    _columnIndexOfPayModeSpecified2 = _columnIndexOfChequeDepositSlipNo;
                    _columnIndexOfToEntryNoSpecified3 = _columnIndexOfTotalAmountGuaranteed;
                    _columnIndexOfTotalAmountGuaranteed3 = _columnIndexOfTotalAmountGuaranteedSpecified;
                    _columnIndexOfTotalAmountGuaranteedSpecified3 = _columnIndexOfDFLT;
                    _columnIndexOfDFLT3 = _columnIndexOfDFLTSpecified;
                    _columnIndexOfChequeDepositSlipDateSpecified2 = _columnIndexOfGroupName;
                    _columnIndexOfReferenceNo2 = _columnIndexOfBankRefNo2;
                    _columnIndexOfGroupName4 = _columnIndexOfGroupName2;
                    _columnIndexOfBankRefNo5 = _columnIndexOfBankRefNo3;
                    _columnIndexOfOnBehalfOf4 = _columnIndexOfOnBehalfOf2;
                    _columnIndexOfChequeNo4 = _columnIndexOfChequeNo2;
                    _columnIndexOfCreatedDateTime3 = _columnIndexOfCreatedDateTime;
                    _columnIndexOfBankCode4 = _columnIndexOfBankCode2;
                    _columnIndexOfCreatedDateTimeSpecified4 = _columnIndexOfCreatedDateTimeSpecified2;
                    _columnIndexOfDocumentDate3 = _columnIndexOfDocumentDate;
                    _columnIndexOfResponsibilityCenter4 = _columnIndexOfResponsibilityCenter2;
                    _columnIndexOfPayMode4 = _columnIndexOfPayMode2;
                    _columnIndexOfChequeDepositSlipDate3 = _columnIndexOfChequeDepositSlipDate;
                    _columnIndexOfChequeDepositSlipNo4 = _columnIndexOfChequeDepositSlipNo2;
                    _columnIndexOfDim10 = _columnIndexOfSent;
                    _columnIndexOfDFLTSpecified4 = _columnIndexOfKey3;
                    _columnIndexOfGroupName5 = _columnIndexOfPostedSpecified;
                    _columnIndexOfAmountRecievedSpecified2 = _columnIndexOfShortcutDimension2Code;
                    _columnIndexOfShortcutDimension2Code3 = _columnIndexOfCurrencyCode;
                    _columnIndexOfDFLTSpecified2 = _columnIndexOfKey2;
                    _columnIndexOfCurrencyCode4 = _columnIndexOfCurrencyCode2;
                    _collectionTransactionList5 = _collectionTransactionList2;
                } catch (Throwable th2) {
                    th = th2;
                    _stmt.close();
                    throw th;
                }
                theader _tmpTheader2 = new theader();
                int _columnIndexOfSent3 = _columnIndexOfBankRefNo;
                if (_stmt2.isNull(_columnIndexOfDFLTSpecified2)) {
                    _tmpTheader = _tmpTheader2;
                    _tmpTheader.Key = null;
                } else {
                    _tmpTheader = _tmpTheader2;
                    _tmpTheader.Key = _stmt2.getText(_columnIndexOfDFLTSpecified2);
                }
                if (_stmt2.isNull(_columnIndexOfNo)) {
                    _tmpTheader.No = null;
                } else {
                    _tmpTheader.No = _stmt2.getText(_columnIndexOfNo);
                }
                Long _tmp = _stmt2.isNull(_columnIndexOfDate) ? null : Long.valueOf(_stmt2.getLong(_columnIndexOfDate));
                _tmpTheader.Date = Converters.DateConverter.toDate(_tmp);
                if (_stmt2.isNull(_columnIndexOfDateSpecified)) {
                    int i = _columnIndexOfDFLTSpecified2;
                    _tmp_1 = null;
                    _columnIndexOfKey = i;
                } else {
                    _columnIndexOfKey = _columnIndexOfDFLTSpecified2;
                    _tmp_1 = Integer.valueOf((int) _stmt2.getLong(_columnIndexOfDateSpecified));
                }
                if (_tmp_1 == null) {
                    boolValueOf = null;
                } else {
                    boolValueOf = Boolean.valueOf(_tmp_1.intValue() != 0);
                }
                _tmpTheader.DateSpecified = boolValueOf;
                if (_stmt2.isNull(_columnIndexOfCashier)) {
                    _tmpTheader.Cashier = null;
                } else {
                    _tmpTheader.Cashier = _stmt2.getText(_columnIndexOfCashier);
                }
                Long _tmp_6 = _stmt2.isNull(_columnIndexOfDatePosted) ? null : Long.valueOf(_stmt2.getLong(_columnIndexOfDatePosted));
                _columnIndexOfKey2 = _columnIndexOfKey;
                _tmpTheader.Date_Posted = Converters.DateConverter.toDate(_tmp_6);
                if (_stmt2.isNull(_columnIndexOfDatePostedSpecified)) {
                    Integer num = _tmp_1;
                    _tmp_3 = null;
                    _tmp_2 = num;
                } else {
                    _tmp_2 = _tmp_1;
                    _tmp_3 = Integer.valueOf((int) _stmt2.getLong(_columnIndexOfDatePostedSpecified));
                }
                if (_tmp_3 == null) {
                    boolValueOf2 = null;
                } else {
                    boolValueOf2 = Boolean.valueOf(_tmp_3.intValue() != 0);
                }
                _tmpTheader.Date_PostedSpecified = boolValueOf2;
                Long _tmp_7 = _stmt2.isNull(_columnIndexOfTimePosted) ? null : Long.valueOf(_stmt2.getLong(_columnIndexOfTimePosted));
                _tmpTheader.Time_Posted = Converters.DateConverter.toDate(_tmp_7);
                if (_stmt2.isNull(_columnIndexOfTimePostedSpecified)) {
                    Integer num2 = _tmp_3;
                    _tmp_5 = null;
                    _tmp_4 = num2;
                } else {
                    _tmp_4 = _tmp_3;
                    _tmp_5 = Integer.valueOf((int) _stmt2.getLong(_columnIndexOfTimePostedSpecified));
                }
                if (_tmp_5 == null) {
                    boolValueOf3 = null;
                } else {
                    boolValueOf3 = Boolean.valueOf(_tmp_5.intValue() != 0);
                }
                _tmpTheader.Time_PostedSpecified = boolValueOf3;
                Integer _tmp_8 = _stmt2.isNull(_columnIndexOfReceivedFrom) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfReceivedFrom));
                if (_tmp_8 == null) {
                    boolValueOf4 = null;
                } else {
                    boolValueOf4 = Boolean.valueOf(_tmp_8.intValue() != 0);
                }
                _tmpTheader.Posted = boolValueOf4;
                Integer _tmp_9 = _stmt2.isNull(_columnIndexOfPostedSpecified3) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfPostedSpecified3));
                if (_tmp_9 == null) {
                    boolValueOf5 = null;
                } else {
                    boolValueOf5 = Boolean.valueOf(_tmp_9.intValue() != 0);
                }
                _tmpTheader.PostedSpecified = boolValueOf5;
                if (_stmt2.isNull(_columnIndexOfNoSeries)) {
                    _tmpTheader.No_Series = null;
                } else {
                    _tmpTheader.No_Series = _stmt2.getText(_columnIndexOfNoSeries);
                }
                int _columnIndexOfBankCode5 = _columnIndexOfBankCode;
                if (_stmt2.isNull(_columnIndexOfBankCode5)) {
                    _tmpTheader.Bank_Code = null;
                } else {
                    _tmpTheader.Bank_Code = _stmt2.getText(_columnIndexOfBankCode5);
                }
                _columnIndexOfOnBehalfOf = _columnIndexOfReceivedFrom3;
                if (_stmt2.isNull(_columnIndexOfOnBehalfOf)) {
                    _tmpTheader.Received_From = null;
                } else {
                    _tmpTheader.Received_From = _stmt2.getText(_columnIndexOfOnBehalfOf);
                }
                int _columnIndexOfOnBehalfOf6 = _columnIndexOfOnBehalfOf4;
                if (_stmt2.isNull(_columnIndexOfOnBehalfOf6)) {
                    _tmpTheader.On_Behalf_Of = null;
                } else {
                    _tmpTheader.On_Behalf_Of = _stmt2.getText(_columnIndexOfOnBehalfOf6);
                }
                _columnIndexOfOnBehalfOf2 = _columnIndexOfOnBehalfOf6;
                _columnIndexOfGlobalDimension1Code = _columnIndexOfAmountRecieved3;
                _columnIndexOfAmountRecieved = _columnIndexOfNoSeries;
                _tmpTheader.Amount_Recieved = (float) _stmt2.getDouble(_columnIndexOfGlobalDimension1Code);
                _columnIndexOfShortcutDimension2Code = _columnIndexOfAmountRecievedSpecified2;
                Integer _tmp_10 = _stmt2.isNull(_columnIndexOfShortcutDimension2Code) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfShortcutDimension2Code));
                if (_tmp_10 == null) {
                    boolValueOf6 = null;
                } else {
                    boolValueOf6 = Boolean.valueOf(_tmp_10.intValue() != 0);
                }
                _tmpTheader.Amount_RecievedSpecified = boolValueOf6;
                _columnIndexOfCurrencyFactorSpecified = _columnIndexOfGlobalDimension1Code3;
                if (_stmt2.isNull(_columnIndexOfCurrencyFactorSpecified)) {
                    _tmpTheader.Global_Dimension_1_Code = null;
                } else {
                    _tmpTheader.Global_Dimension_1_Code = _stmt2.getText(_columnIndexOfCurrencyFactorSpecified);
                }
                _columnIndexOfCurrencyCode = _columnIndexOfShortcutDimension2Code3;
                if (_stmt2.isNull(_columnIndexOfCurrencyCode)) {
                    _tmpTheader.Shortcut_Dimension_2_Code = null;
                } else {
                    _tmpTheader.Shortcut_Dimension_2_Code = _stmt2.getText(_columnIndexOfCurrencyCode);
                }
                int _columnIndexOfCurrencyCode6 = _columnIndexOfCurrencyCode4;
                if (_stmt2.isNull(_columnIndexOfCurrencyCode6)) {
                    _tmpTheader.Currency_Code = null;
                } else {
                    _tmpTheader.Currency_Code = _stmt2.getText(_columnIndexOfCurrencyCode6);
                }
                _columnIndexOfCurrencyCode2 = _columnIndexOfCurrencyCode6;
                _columnIndexOfPostedBy = _columnIndexOfCurrencyFactor2;
                _tmpTheader.Currency_Factor = (float) _stmt2.getDouble(_columnIndexOfPostedBy);
                int _columnIndexOfCurrencyFactorSpecified5 = _columnIndexOfCurrencyFactorSpecified3;
                Integer _tmp_11 = _stmt2.isNull(_columnIndexOfCurrencyFactorSpecified5) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfCurrencyFactorSpecified5));
                if (_tmp_11 == null) {
                    boolValueOf7 = null;
                } else {
                    boolValueOf7 = Boolean.valueOf(_tmp_11.intValue() != 0);
                }
                _tmpTheader.Currency_FactorSpecified = boolValueOf7;
                _columnIndexOfTotalAmountSpecified = _columnIndexOfTotalAmount3;
                _columnIndexOfTotalAmount = _columnIndexOfCurrencyFactorSpecified5;
                _tmpTheader.Total_Amount = (float) _stmt2.getDouble(_columnIndexOfTotalAmountSpecified);
                int _columnIndexOfTotalAmountSpecified5 = _columnIndexOfTotalAmountSpecified3;
                Integer _tmp_12 = _stmt2.isNull(_columnIndexOfTotalAmountSpecified5) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfTotalAmountSpecified5));
                if (_tmp_12 == null) {
                    boolValueOf8 = null;
                } else {
                    boolValueOf8 = Boolean.valueOf(_tmp_12.intValue() != 0);
                }
                _tmpTheader.Total_AmountSpecified = boolValueOf8;
                _columnIndexOfPrintNoSpecified = _columnIndexOfPostedBy3;
                if (_stmt2.isNull(_columnIndexOfPrintNoSpecified)) {
                    _tmpTheader.Posted_By = null;
                } else {
                    _tmpTheader.Posted_By = _stmt2.getText(_columnIndexOfPrintNoSpecified);
                }
                _columnIndexOfChequeNo = _columnIndexOfPrintNo3;
                _columnIndexOfPrintNo = _columnIndexOfTotalAmountSpecified5;
                _tmpTheader.Print_No = (int) _stmt2.getLong(_columnIndexOfChequeNo);
                _columnIndexOfStatusSpecified = _columnIndexOfPrintNoSpecified3;
                Integer _tmp_13 = _stmt2.isNull(_columnIndexOfStatusSpecified) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfStatusSpecified));
                if (_tmp_13 == null) {
                    boolValueOf9 = null;
                } else {
                    boolValueOf9 = Boolean.valueOf(_tmp_13.intValue() != 0);
                }
                _tmpTheader.Print_NoSpecified = boolValueOf9;
                _columnIndexOfNoPrintedSpecified = _columnIndexOfStatusSpecified3;
                Integer _tmp_14 = _stmt2.isNull(_columnIndexOfNoPrintedSpecified) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfNoPrintedSpecified));
                if (_tmp_14 == null) {
                    boolValueOf10 = null;
                } else {
                    boolValueOf10 = Boolean.valueOf(_tmp_14.intValue() != 0);
                }
                _tmpTheader.StatusSpecified = boolValueOf10;
                int _columnIndexOfChequeNo6 = _columnIndexOfChequeNo4;
                if (_stmt2.isNull(_columnIndexOfChequeNo6)) {
                    _tmpTheader.Cheque_No = null;
                } else {
                    _tmpTheader.Cheque_No = _stmt2.getText(_columnIndexOfChequeNo6);
                }
                _columnIndexOfChequeNo2 = _columnIndexOfChequeNo6;
                _columnIndexOfCreatedBy = _columnIndexOfNoPrinted2;
                _tmpTheader.No_Printed = (int) _stmt2.getLong(_columnIndexOfCreatedBy);
                _columnIndexOfCreatedDateTimeSpecified = _columnIndexOfNoPrintedSpecified3;
                Integer _tmp_15 = _stmt2.isNull(_columnIndexOfCreatedDateTimeSpecified) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfCreatedDateTimeSpecified));
                if (_tmp_15 == null) {
                    boolValueOf11 = null;
                } else {
                    boolValueOf11 = Boolean.valueOf(_tmp_15.intValue() != 0);
                }
                _tmpTheader.No_PrintedSpecified = boolValueOf11;
                _columnIndexOfReceiptTypeSpecified = _columnIndexOfCreatedBy3;
                if (_stmt2.isNull(_columnIndexOfReceiptTypeSpecified)) {
                    _tmpTheader.Created_By = null;
                } else {
                    _tmpTheader.Created_By = _stmt2.getText(_columnIndexOfReceiptTypeSpecified);
                }
                int _columnIndexOfCreatedDateTime5 = _columnIndexOfCreatedDateTime3;
                Long _tmp_16 = _stmt2.isNull(_columnIndexOfCreatedDateTime5) ? null : Long.valueOf(_stmt2.getLong(_columnIndexOfCreatedDateTime5));
                _columnIndexOfCreatedDateTime = _columnIndexOfCreatedDateTime5;
                _tmpTheader.Created_Date_Time = Converters.DateConverter.toDate(_tmp_16);
                int _columnIndexOfCreatedDateTimeSpecified6 = _columnIndexOfCreatedDateTimeSpecified4;
                Integer _tmp_17 = _stmt2.isNull(_columnIndexOfCreatedDateTimeSpecified6) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfCreatedDateTimeSpecified6));
                if (_tmp_17 == null) {
                    boolValueOf12 = null;
                } else {
                    boolValueOf12 = Boolean.valueOf(_tmp_17.intValue() != 0);
                }
                _tmpTheader.Created_Date_TimeSpecified = boolValueOf12;
                _columnIndexOfBankCode2 = _columnIndexOfBankCode5;
                _columnIndexOfRegisterNoSpecified = _columnIndexOfRegisterNo2;
                _tmpTheader.Register_No = (int) _stmt2.getLong(_columnIndexOfRegisterNoSpecified);
                int _columnIndexOfRegisterNoSpecified5 = _columnIndexOfRegisterNoSpecified3;
                Integer _tmp_18 = _stmt2.isNull(_columnIndexOfRegisterNoSpecified5) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfRegisterNoSpecified5));
                if (_tmp_18 == null) {
                    boolValueOf13 = null;
                } else {
                    boolValueOf13 = Boolean.valueOf(_tmp_18.intValue() != 0);
                }
                _tmpTheader.Register_NoSpecified = boolValueOf13;
                _columnIndexOfFromEntryNoSpecified = _columnIndexOfFromEntryNo3;
                _columnIndexOfFromEntryNo = _columnIndexOfRegisterNoSpecified5;
                _tmpTheader.From_Entry_No = (int) _stmt2.getLong(_columnIndexOfFromEntryNoSpecified);
                int _columnIndexOfFromEntryNoSpecified5 = _columnIndexOfFromEntryNoSpecified3;
                Integer _tmp_19 = _stmt2.isNull(_columnIndexOfFromEntryNoSpecified5) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfFromEntryNoSpecified5));
                if (_tmp_19 == null) {
                    boolValueOf14 = null;
                } else {
                    boolValueOf14 = Boolean.valueOf(_tmp_19.intValue() != 0);
                }
                _tmpTheader.From_Entry_NoSpecified = boolValueOf14;
                _columnIndexOfToEntryNoSpecified = _columnIndexOfToEntryNo3;
                _columnIndexOfToEntryNo = _columnIndexOfFromEntryNoSpecified5;
                _tmpTheader.To_Entry_No = (int) _stmt2.getLong(_columnIndexOfToEntryNoSpecified);
                int _columnIndexOfToEntryNoSpecified5 = _columnIndexOfToEntryNoSpecified3;
                Integer _tmp_110 = _stmt2.isNull(_columnIndexOfToEntryNoSpecified5) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfToEntryNoSpecified5));
                if (_tmp_110 == null) {
                    boolValueOf15 = null;
                } else {
                    boolValueOf15 = Boolean.valueOf(_tmp_110.intValue() != 0);
                }
                _tmpTheader.To_Entry_NoSpecified = boolValueOf15;
                _columnIndexOfDocumentDate = _columnIndexOfDocumentDate3;
                Long _tmp_111 = _stmt2.isNull(_columnIndexOfDocumentDate) ? null : Long.valueOf(_stmt2.getLong(_columnIndexOfDocumentDate));
                _columnIndexOfCreatedDateTimeSpecified2 = _columnIndexOfCreatedDateTimeSpecified6;
                _tmpTheader.Document_Date = Converters.DateConverter.toDate(_tmp_111);
                _columnIndexOfResponsibilityCenter = _columnIndexOfDocumentDateSpecified2;
                Integer _tmp_112 = _stmt2.isNull(_columnIndexOfResponsibilityCenter) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfResponsibilityCenter));
                if (_tmp_112 == null) {
                    boolValueOf16 = null;
                } else {
                    boolValueOf16 = Boolean.valueOf(_tmp_112.intValue() != 0);
                }
                _tmpTheader.Document_DateSpecified = boolValueOf16;
                _columnIndexOfResponsibilityCenter2 = _columnIndexOfResponsibilityCenter4;
                if (_stmt2.isNull(_columnIndexOfResponsibilityCenter2)) {
                    _tmpTheader.Responsibility_Center = null;
                } else {
                    _tmpTheader.Responsibility_Center = _stmt2.getText(_columnIndexOfResponsibilityCenter2);
                }
                _columnIndexOfShortcutDimension4Code = _columnIndexOfShortcutDimension3Code2;
                if (_stmt2.isNull(_columnIndexOfShortcutDimension4Code)) {
                    _tmpTheader.Shortcut_Dimension_3_Code = null;
                } else {
                    _tmpTheader.Shortcut_Dimension_3_Code = _stmt2.getText(_columnIndexOfShortcutDimension4Code);
                }
                _columnIndexOfDim3 = _columnIndexOfShortcutDimension4Code3;
                if (_stmt2.isNull(_columnIndexOfDim3)) {
                    _tmpTheader.Shortcut_Dimension_4_Code = null;
                } else {
                    _tmpTheader.Shortcut_Dimension_4_Code = _stmt2.getText(_columnIndexOfDim3);
                }
                _columnIndexOfDim4 = _columnIndexOfDim6;
                if (_stmt2.isNull(_columnIndexOfDim4)) {
                    _tmpTheader.Dim3 = null;
                } else {
                    _tmpTheader.Dim3 = _stmt2.getText(_columnIndexOfDim4);
                }
                _columnIndexOfBankName = _columnIndexOfDim8;
                if (_stmt2.isNull(_columnIndexOfBankName)) {
                    _tmpTheader.Dim4 = null;
                } else {
                    _tmpTheader.Dim4 = _stmt2.getText(_columnIndexOfBankName);
                }
                _columnIndexOfDim1 = _columnIndexOfBankName3;
                if (_stmt2.isNull(_columnIndexOfDim1)) {
                    _tmpTheader.Bank_Name = null;
                } else {
                    _tmpTheader.Bank_Name = _stmt2.getText(_columnIndexOfDim1);
                }
                int _columnIndexOfReceiptTypeSpecified5 = _columnIndexOfReceiptTypeSpecified3;
                Integer _tmp_21 = _stmt2.isNull(_columnIndexOfReceiptTypeSpecified5) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfReceiptTypeSpecified5));
                if (_tmp_21 == null) {
                    boolValueOf17 = null;
                } else {
                    boolValueOf17 = Boolean.valueOf(_tmp_21.intValue() != 0);
                }
                _tmpTheader.Receipt_TypeSpecified = boolValueOf17;
                _columnIndexOfDimensionSetIDSpecified = _columnIndexOfDimensionSetID3;
                _columnIndexOfDimensionSetID = _columnIndexOfReceiptTypeSpecified5;
                _tmpTheader.Dimension_Set_ID = (int) _stmt2.getLong(_columnIndexOfDimensionSetIDSpecified);
                _columnIndexOfDim2 = _columnIndexOfDimensionSetIDSpecified3;
                Integer _tmp_22 = _stmt2.isNull(_columnIndexOfDim2) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfDim2));
                if (_tmp_22 == null) {
                    boolValueOf18 = null;
                } else {
                    boolValueOf18 = Boolean.valueOf(_tmp_22.intValue() != 0);
                }
                _tmpTheader.Dimension_Set_IDSpecified = boolValueOf18;
                _columnIndexOfSent = _columnIndexOfDim10;
                if (_stmt2.isNull(_columnIndexOfSent)) {
                    _tmpTheader.Dim1 = null;
                } else {
                    _tmpTheader.Dim1 = _stmt2.getText(_columnIndexOfSent);
                }
                _columnIndexOfAccountNo = _columnIndexOfDim12;
                if (_stmt2.isNull(_columnIndexOfAccountNo)) {
                    _tmpTheader.Dim2 = null;
                } else {
                    _tmpTheader.Dim2 = _stmt2.getText(_columnIndexOfAccountNo);
                }
                _columnIndexOfName = _columnIndexOfAccountNo3;
                if (_stmt2.isNull(_columnIndexOfName)) {
                    _tmpTheader.Account_No = null;
                } else {
                    _tmpTheader.Account_No = _stmt2.getText(_columnIndexOfName);
                }
                _columnIndexOfPayMode = _columnIndexOfName3;
                if (_stmt2.isNull(_columnIndexOfPayMode)) {
                    _tmpTheader.Name = null;
                } else {
                    _tmpTheader.Name = _stmt2.getText(_columnIndexOfPayMode);
                }
                _columnIndexOfPayMode2 = _columnIndexOfPayMode4;
                if (_stmt2.isNull(_columnIndexOfPayMode2)) {
                    _tmpTheader.PayMode = null;
                } else {
                    _tmpTheader.PayMode = _stmt2.getText(_columnIndexOfPayMode2);
                }
                _columnIndexOfChequeDepositSlipNo = _columnIndexOfPayModeSpecified2;
                Integer _tmp_23 = _stmt2.isNull(_columnIndexOfChequeDepositSlipNo) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfChequeDepositSlipNo));
                if (_tmp_23 == null) {
                    boolValueOf19 = null;
                } else {
                    boolValueOf19 = Boolean.valueOf(_tmp_23.intValue() != 0);
                }
                _tmpTheader.Pay_ModeSpecified = boolValueOf19;
                _columnIndexOfChequeDepositSlipNo2 = _columnIndexOfChequeDepositSlipNo4;
                if (_stmt2.isNull(_columnIndexOfChequeDepositSlipNo2)) {
                    _tmpTheader.Cheque_Deposit_Slip_No = null;
                } else {
                    _tmpTheader.Cheque_Deposit_Slip_No = _stmt2.getText(_columnIndexOfChequeDepositSlipNo2);
                }
                int _columnIndexOfChequeDepositSlipDate5 = _columnIndexOfChequeDepositSlipDate3;
                Long _tmp_24 = _stmt2.isNull(_columnIndexOfChequeDepositSlipDate5) ? null : Long.valueOf(_stmt2.getLong(_columnIndexOfChequeDepositSlipDate5));
                _columnIndexOfChequeDepositSlipDate = _columnIndexOfChequeDepositSlipDate5;
                _tmpTheader.Cheque_Deposit_Slip_Date = Converters.DateConverter.toDate(_tmp_24);
                _columnIndexOfGroupName = _columnIndexOfChequeDepositSlipDateSpecified2;
                Integer _tmp_25 = _stmt2.isNull(_columnIndexOfGroupName) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfGroupName));
                if (_tmp_25 == null) {
                    boolValueOf20 = null;
                } else {
                    boolValueOf20 = Boolean.valueOf(_tmp_25.intValue() != 0);
                }
                _tmpTheader.Cheque_Deposit_Slip_DateSpecified = boolValueOf20;
                _columnIndexOfTotalAmountGuaranteedSpecified = _columnIndexOfTotalAmountGuaranteed3;
                _columnIndexOfTotalAmountGuaranteed = _columnIndexOfToEntryNoSpecified5;
                _tmpTheader.Total_Amount_Guaranteed = (float) _stmt2.getDouble(_columnIndexOfTotalAmountGuaranteedSpecified);
                int _columnIndexOfTotalAmountGuaranteedSpecified5 = _columnIndexOfTotalAmountGuaranteedSpecified3;
                Integer _tmp_26 = _stmt2.isNull(_columnIndexOfTotalAmountGuaranteedSpecified5) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfTotalAmountGuaranteedSpecified5));
                if (_tmp_26 == null) {
                    boolValueOf21 = null;
                } else {
                    boolValueOf21 = Boolean.valueOf(_tmp_26.intValue() != 0);
                }
                _tmpTheader.Total_Amount_GuaranteedSpecified = boolValueOf21;
                _columnIndexOfDFLTSpecified = _columnIndexOfDFLT3;
                _columnIndexOfDFLT = _columnIndexOfTotalAmountGuaranteedSpecified5;
                _tmpTheader.DFLT = (float) _stmt2.getDouble(_columnIndexOfDFLTSpecified);
                _columnIndexOfKey3 = _columnIndexOfDFLTSpecified4;
                Integer _tmp_27 = _stmt2.isNull(_columnIndexOfKey3) ? null : Integer.valueOf((int) _stmt2.getLong(_columnIndexOfKey3));
                if (_tmp_27 == null) {
                    boolValueOf22 = null;
                } else {
                    boolValueOf22 = Boolean.valueOf(_tmp_27.intValue() != 0);
                }
                _tmpTheader.DFLTSpecified = boolValueOf22;
                int _columnIndexOfGroupName7 = _columnIndexOfGroupName4;
                if (_stmt2.isNull(_columnIndexOfGroupName7)) {
                    _tmpTheader.Group_Name = null;
                } else {
                    _tmpTheader.Group_Name = _stmt2.getText(_columnIndexOfGroupName7);
                }
                _columnIndexOfBankRefNo2 = _columnIndexOfReferenceNo2;
                if (_stmt2.isNull(_columnIndexOfBankRefNo2)) {
                    _tmpTheader.Reference_No = null;
                } else {
                    _tmpTheader.Reference_No = _stmt2.getText(_columnIndexOfBankRefNo2);
                }
                int _columnIndexOfBankRefNo6 = _columnIndexOfBankRefNo5;
                if (_stmt2.isNull(_columnIndexOfBankRefNo6)) {
                    _tmpTheader.Bank_Ref_No = null;
                } else {
                    _tmpTheader.Bank_Ref_No = _stmt2.getText(_columnIndexOfBankRefNo6);
                }
                _columnIndexOfGroupName2 = _columnIndexOfGroupName7;
                _columnIndexOfPostedSpecified = _columnIndexOfSent3;
                _columnIndexOfBankRefNo3 = _columnIndexOfBankRefNo6;
                int _tmp_28 = (int) _stmt2.getLong(_columnIndexOfPostedSpecified);
                _tmpTheader.sent = _tmp_28 != 0;
                _columnIndexOfNo = _columnIndexOfNo;
                if (_stmt2.isNull(_columnIndexOfNo)) {
                    _tmpKey_1 = null;
                } else {
                    _tmpKey_1 = _stmt2.getText(_columnIndexOfNo);
                }
                if (_tmpKey_1 != null) {
                    _collectionTransactionList2 = _collectionTransactionList;
                    _tmpTransactionListCollection = _collectionTransactionList2.get(_tmpKey_1);
                } else {
                    _collectionTransactionList2 = _collectionTransactionList;
                    _tmpTransactionListCollection = new ArrayList<>();
                }
                tlines _item2 = new tlines();
                _stmt = _stmt2;
            }
            List<tlines> _result3 = _result2;
            _stmt2.close();
            return _result3;
        } catch (Throwable th3) {
            th = th3;
            _stmt = _stmt2;
        }
    }

    @Override // com.trimline.metrocrew.theader.dao
    void updateHeader(final float total, final String documentNo, final String payMode, final String accountNo) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.theader_dao_Impl$$ExternalSyntheticLambda9
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return theader_dao_Impl.lambda$updateHeader$8(total, payMode, accountNo, documentNo, (SQLiteConnection) obj);
            }
        });
    }

    static /* synthetic */ Object lambda$updateHeader$8(float total, String payMode, String accountNo, String documentNo, SQLiteConnection _connection) {
        SQLiteStatement _stmt = _connection.prepare("UPDATE `theader` set Total_Amount=?, PayMode=?, Account_No=? where `No` =?");
        try {
            _stmt.mo151bindDouble(1, total);
            if (payMode == null) {
                _stmt.mo153bindNull(2);
            } else {
                _stmt.mo154bindText(2, payMode);
            }
            if (accountNo == null) {
                _stmt.mo153bindNull(3);
            } else {
                _stmt.mo154bindText(3, accountNo);
            }
            if (documentNo == null) {
                _stmt.mo153bindNull(4);
            } else {
                _stmt.mo154bindText(4, documentNo);
            }
            _stmt.step();
            return null;
        } finally {
            _stmt.close();
        }
    }

    public static List<Class<?>> getRequiredConverters() {
        return Collections.emptyList();
    }

    private void __fetchRelationshiptransactionAscomTrimlineMetrocrewTransaction(final SQLiteConnection _connection, final ArrayMap<String, ArrayList<transaction>> _map) throws Throwable {
        String _tmpKey;
        transaction _item_1;
        ArrayMap<String, ArrayList<transaction>> arrayMap = _map;
        Set<String> __mapKeySet = arrayMap.keySet();
        if (__mapKeySet.isEmpty()) {
            return;
        }
        if (arrayMap.getSize() > 999) {
            RelationUtil.recursiveFetchArrayMap(arrayMap, true, new Function1() { // from class: com.trimline.metrocrew.theader_dao_Impl$$ExternalSyntheticLambda3
                @Override // kotlin.jvm.functions.Function1
                public final Object invoke(Object obj) {
                    return this.f$0.m452x5f6d5dfa(_connection, (ArrayMap) obj);
                }
            });
            return;
        }
        StringBuilder _stringBuilder = new StringBuilder();
        _stringBuilder.append("SELECT `Key`,`Entry_No`,`No`,`Date`,`Type`,`transtype`,`PayMode`,`Pay_Mode`,`Cheque_Deposit_Slip_No`,`Cheque_Deposit_Slip_Date`,`Bank_Code`,`Received_From`,`On_Behalf_Of`,`Cashier`,`Account_No`,`Account_Name`,`Posted`,`Date_Posted`,`Time_Posted`,`Posted_By`,`Amount`,`Remarks`,`Transaction_Name`,`Branch_Code`,`Agent_Code`,`Grouping`,`Global_Dimension_1_Code`,`Shortcut_Dimension_2_Code`,`VAT_Percent`,`Currency_Code`,`Currency_Factor`,`VAT_Bus_Posting_Group`,`VAT_Prod_Posting_Group`,`Gen_Posting_TypeSpecified`,`Gen_Bus_Posting_Group`,`Gen_Prod_Posting_Group`,`VAT_Amount`,`Total_Amount`,`User_ID`,`Apply_to`,`Apply_to_ID`,`Dest_Global_Dimension_1_Code`,`Dest_Shortcut_Dimension_2_Code`,`Line_No`,`Print_No`,`Deposit_Slip_Time`,`Teller_ID`,`Customer_Payment_On_Account`,`Select`,`Batch_Posted`,`Transaction_No`,`Cheque_Deposit_Slip_Bank`,`Bank_Account`,`Confirmed`,`Reconciled`,`Orig_Cashier`,`Cancelled`,`Cancelled_By`,`Cancelled_Date`,`Cancelled_Time`,`Post_Dated`,`Cheque_Retrieved`,`Register_Number`,`From_Entry_No`,`To_Entry_No`,`Batch_Posted_UserID`,`BD_Register_Number`,`BD_From_Number`,`BD_To_Number`,`Reversal_By`,`Reversal_Date`,`Reversal_Time`,`Reversal_Register_No`,`Reversal_From_Entry_No`,`Reversal_To_Entry_No`,`Reversed`,`Applies_to_Doc_No`,`Applies_to_ID`,`Grant_No`,`Installment_Number`,`Next_Installment_Date`,`Dimension_Set_ID`,`Donor`,`Group_Code`,`Pre_ADM_Fines`,`Med_Fines`,`Loan_No`,`Penalty`,`sent` FROM `transaction` WHERE `No` IN (");
        int _inputSize = __mapKeySet == null ? 1 : __mapKeySet.size();
        StringUtil.appendPlaceholders(_stringBuilder, _inputSize);
        _stringBuilder.append(")");
        String _sql = _stringBuilder.toString();
        SQLiteStatement _stmt = _connection.prepare(_sql);
        int _argIndex = 1;
        if (__mapKeySet == null) {
            _stmt.mo153bindNull(1);
        } else {
            for (String _item : __mapKeySet) {
                if (_item == null) {
                    _stmt.mo153bindNull(_argIndex);
                } else {
                    _stmt.mo154bindText(_argIndex, _item);
                }
                _argIndex++;
            }
        }
        try {
            int _itemKeyIndex = SQLiteStatementUtil.getColumnIndex(_stmt, "No");
            if (_itemKeyIndex == -1) {
                _stmt.close();
                return;
            }
            while (_stmt.step()) {
                if (_stmt.isNull(_itemKeyIndex)) {
                    _tmpKey = null;
                } else {
                    String _tmpKey2 = _stmt.getText(_itemKeyIndex);
                    _tmpKey = _tmpKey2;
                }
                if (_tmpKey != null) {
                    ArrayList<transaction> _tmpRelation = arrayMap.get(_tmpKey);
                    if (_tmpRelation != null) {
                        transaction _item_2 = new transaction();
                        if (_stmt.isNull(0)) {
                            _item_1 = _item_2;
                            try {
                                _item_1.Key = null;
                            } catch (Throwable th) {
                                th = th;
                            }
                        } else {
                            _item_1 = _item_2;
                            _item_1.Key = _stmt.getText(0);
                        }
                        transaction _item_3 = _item_1;
                        _item_3.Entry_No = (int) _stmt.getLong(1);
                        if (_stmt.isNull(2)) {
                            _item_3.No = null;
                        } else {
                            _item_3.No = _stmt.getText(2);
                        }
                        Long _tmp = _stmt.isNull(3) ? null : Long.valueOf(_stmt.getLong(3));
                        _item_3.Date = Converters.DateConverter.toDate(_tmp);
                        if (_stmt.isNull(4)) {
                            _item_3.Type = null;
                        } else {
                            _item_3.Type = _stmt.getText(4);
                        }
                        if (_stmt.isNull(5)) {
                            _item_3.transtype = null;
                        } else {
                            _item_3.transtype = _stmt.getText(5);
                        }
                        if (_stmt.isNull(6)) {
                            _item_3.PayMode = null;
                        } else {
                            _item_3.PayMode = _stmt.getText(6);
                        }
                        if (_stmt.isNull(7)) {
                            _item_3.Pay_Mode = null;
                        } else {
                            _item_3.Pay_Mode = _stmt.getText(7);
                        }
                        if (_stmt.isNull(8)) {
                            _item_3.Cheque_Deposit_Slip_No = null;
                        } else {
                            _item_3.Cheque_Deposit_Slip_No = _stmt.getText(8);
                        }
                        Long _tmp_1 = _stmt.isNull(9) ? null : Long.valueOf(_stmt.getLong(9));
                        _item_3.Cheque_Deposit_Slip_Date = Converters.DateConverter.toDate(_tmp_1);
                        if (_stmt.isNull(10)) {
                            _item_3.Bank_Code = null;
                        } else {
                            _item_3.Bank_Code = _stmt.getText(10);
                        }
                        if (_stmt.isNull(11)) {
                            _item_3.Received_From = null;
                        } else {
                            _item_3.Received_From = _stmt.getText(11);
                        }
                        if (_stmt.isNull(12)) {
                            _item_3.On_Behalf_Of = null;
                        } else {
                            _item_3.On_Behalf_Of = _stmt.getText(12);
                        }
                        if (_stmt.isNull(13)) {
                            _item_3.Cashier = null;
                        } else {
                            _item_3.Cashier = _stmt.getText(13);
                        }
                        if (_stmt.isNull(14)) {
                            _item_3.Account_No = null;
                        } else {
                            _item_3.Account_No = _stmt.getText(14);
                        }
                        if (_stmt.isNull(15)) {
                            _item_3.Account_Name = null;
                        } else {
                            _item_3.Account_Name = _stmt.getText(15);
                        }
                        Integer _tmp_2 = _stmt.isNull(16) ? null : Integer.valueOf((int) _stmt.getLong(16));
                        try {
                            _item_3.Posted = _tmp_2 == null ? null : Boolean.valueOf(_tmp_2.intValue() != 0);
                            Long _tmp_3 = _stmt.isNull(17) ? null : Long.valueOf(_stmt.getLong(17));
                            _item_3.Date_Posted = Converters.DateConverter.toDate(_tmp_3);
                            Long _tmp_4 = _stmt.isNull(18) ? null : Long.valueOf(_stmt.getLong(18));
                            _item_3.Time_Posted = Converters.DateConverter.toDate(_tmp_4);
                            if (_stmt.isNull(19)) {
                                _item_3.Posted_By = null;
                            } else {
                                _item_3.Posted_By = _stmt.getText(19);
                            }
                            if (_stmt.isNull(20)) {
                                _item_3.Amount = null;
                            } else {
                                _item_3.Amount = Double.valueOf(_stmt.getDouble(20));
                            }
                            if (_stmt.isNull(21)) {
                                _item_3.Remarks = null;
                            } else {
                                _item_3.Remarks = _stmt.getText(21);
                            }
                            if (_stmt.isNull(22)) {
                                _item_3.Transaction_Name = null;
                            } else {
                                _item_3.Transaction_Name = _stmt.getText(22);
                            }
                            if (_stmt.isNull(23)) {
                                _item_3.Branch_Code = null;
                            } else {
                                _item_3.Branch_Code = _stmt.getText(23);
                            }
                            if (_stmt.isNull(24)) {
                                _item_3.Agent_Code = null;
                            } else {
                                _item_3.Agent_Code = _stmt.getText(24);
                            }
                            if (_stmt.isNull(25)) {
                                _item_3.Grouping = null;
                            } else {
                                _item_3.Grouping = _stmt.getText(25);
                            }
                            if (_stmt.isNull(26)) {
                                _item_3.Global_Dimension_1_Code = null;
                            } else {
                                _item_3.Global_Dimension_1_Code = _stmt.getText(26);
                            }
                            if (_stmt.isNull(27)) {
                                _item_3.Shortcut_Dimension_2_Code = null;
                            } else {
                                _item_3.Shortcut_Dimension_2_Code = _stmt.getText(27);
                            }
                            if (_stmt.isNull(28)) {
                                _item_3.VAT_Percent = null;
                            } else {
                                _item_3.VAT_Percent = Double.valueOf(_stmt.getDouble(28));
                            }
                            if (_stmt.isNull(29)) {
                                _item_3.Currency_Code = null;
                            } else {
                                _item_3.Currency_Code = _stmt.getText(29);
                            }
                            if (_stmt.isNull(30)) {
                                _item_3.Currency_Factor = null;
                            } else {
                                _item_3.Currency_Factor = Double.valueOf(_stmt.getDouble(30));
                            }
                            if (_stmt.isNull(31)) {
                                _item_3.VAT_Bus_Posting_Group = null;
                            } else {
                                _item_3.VAT_Bus_Posting_Group = _stmt.getText(31);
                            }
                            if (_stmt.isNull(32)) {
                                _item_3.VAT_Prod_Posting_Group = null;
                            } else {
                                _item_3.VAT_Prod_Posting_Group = _stmt.getText(32);
                            }
                            Integer _tmp_5 = _stmt.isNull(33) ? null : Integer.valueOf((int) _stmt.getLong(33));
                            _item_3.Gen_Posting_TypeSpecified = _tmp_5 == null ? null : Boolean.valueOf(_tmp_5.intValue() != 0);
                            if (_stmt.isNull(34)) {
                                _item_3.Gen_Bus_Posting_Group = null;
                            } else {
                                _item_3.Gen_Bus_Posting_Group = _stmt.getText(34);
                            }
                            if (_stmt.isNull(35)) {
                                _item_3.Gen_Prod_Posting_Group = null;
                            } else {
                                _item_3.Gen_Prod_Posting_Group = _stmt.getText(35);
                            }
                            if (_stmt.isNull(36)) {
                                _item_3.VAT_Amount = null;
                            } else {
                                _item_3.VAT_Amount = Double.valueOf(_stmt.getDouble(36));
                            }
                            if (_stmt.isNull(37)) {
                                _item_3.Total_Amount = null;
                            } else {
                                _item_3.Total_Amount = Double.valueOf(_stmt.getDouble(37));
                            }
                            if (_stmt.isNull(38)) {
                                _item_3.User_ID = null;
                            } else {
                                _item_3.User_ID = _stmt.getText(38);
                            }
                            if (_stmt.isNull(39)) {
                                _item_3.Apply_to = null;
                            } else {
                                _item_3.Apply_to = _stmt.getText(39);
                            }
                            if (_stmt.isNull(40)) {
                                _item_3.Apply_to_ID = null;
                            } else {
                                _item_3.Apply_to_ID = _stmt.getText(40);
                            }
                            if (_stmt.isNull(41)) {
                                _item_3.Dest_Global_Dimension_1_Code = null;
                            } else {
                                _item_3.Dest_Global_Dimension_1_Code = _stmt.getText(41);
                            }
                            if (_stmt.isNull(42)) {
                                _item_3.Dest_Shortcut_Dimension_2_Code = null;
                            } else {
                                _item_3.Dest_Shortcut_Dimension_2_Code = _stmt.getText(42);
                            }
                            _item_3.Line_No = (int) _stmt.getLong(43);
                            _item_3.Print_No = (int) _stmt.getLong(44);
                            Long _tmp_6 = _stmt.isNull(45) ? null : Long.valueOf(_stmt.getLong(45));
                            _item_3.Deposit_Slip_Time = Converters.DateConverter.toDate(_tmp_6);
                            if (_stmt.isNull(46)) {
                                _item_3.Teller_ID = null;
                            } else {
                                _item_3.Teller_ID = _stmt.getText(46);
                            }
                            Integer _tmp_7 = _stmt.isNull(47) ? null : Integer.valueOf((int) _stmt.getLong(47));
                            _item_3.Customer_Payment_On_Account = _tmp_7 == null ? null : Boolean.valueOf(_tmp_7.intValue() != 0);
                            Integer _tmp_8 = _stmt.isNull(48) ? null : Integer.valueOf((int) _stmt.getLong(48));
                            _item_3.Select = _tmp_8 == null ? null : Boolean.valueOf(_tmp_8.intValue() != 0);
                            Integer _tmp_9 = _stmt.isNull(49) ? null : Integer.valueOf((int) _stmt.getLong(49));
                            _item_3.Batch_Posted = _tmp_9 == null ? null : Boolean.valueOf(_tmp_9.intValue() != 0);
                            if (_stmt.isNull(50)) {
                                _item_3.Transaction_No = null;
                            } else {
                                _item_3.Transaction_No = _stmt.getText(50);
                            }
                            if (_stmt.isNull(51)) {
                                _item_3.Cheque_Deposit_Slip_Bank = null;
                            } else {
                                _item_3.Cheque_Deposit_Slip_Bank = _stmt.getText(51);
                            }
                            if (_stmt.isNull(52)) {
                                _item_3.Bank_Account = null;
                            } else {
                                _item_3.Bank_Account = _stmt.getText(52);
                            }
                            Integer _tmp_10 = _stmt.isNull(53) ? null : Integer.valueOf((int) _stmt.getLong(53));
                            _item_3.Confirmed = _tmp_10 == null ? null : Boolean.valueOf(_tmp_10.intValue() != 0);
                            Integer _tmp_11 = _stmt.isNull(54) ? null : Integer.valueOf((int) _stmt.getLong(54));
                            _item_3.Reconciled = _tmp_11 == null ? null : Boolean.valueOf(_tmp_11.intValue() != 0);
                            if (_stmt.isNull(55)) {
                                _item_3.Orig_Cashier = null;
                            } else {
                                _item_3.Orig_Cashier = _stmt.getText(55);
                            }
                            Integer _tmp_12 = _stmt.isNull(56) ? null : Integer.valueOf((int) _stmt.getLong(56));
                            _item_3.Cancelled = _tmp_12 == null ? null : Boolean.valueOf(_tmp_12.intValue() != 0);
                            if (_stmt.isNull(57)) {
                                _item_3.Cancelled_By = null;
                            } else {
                                _item_3.Cancelled_By = _stmt.getText(57);
                            }
                            Long _tmp_13 = _stmt.isNull(58) ? null : Long.valueOf(_stmt.getLong(58));
                            _item_3.Cancelled_Date = Converters.DateConverter.toDate(_tmp_13);
                            Long _tmp_14 = _stmt.isNull(59) ? null : Long.valueOf(_stmt.getLong(59));
                            _item_3.Cancelled_Time = Converters.DateConverter.toDate(_tmp_14);
                            Integer _tmp_15 = _stmt.isNull(60) ? null : Integer.valueOf((int) _stmt.getLong(60));
                            _item_3.Post_Dated = _tmp_15 == null ? null : Boolean.valueOf(_tmp_15.intValue() != 0);
                            Integer _tmp_16 = _stmt.isNull(61) ? null : Integer.valueOf((int) _stmt.getLong(61));
                            _item_3.Cheque_Retrieved = _tmp_16 == null ? null : Boolean.valueOf(_tmp_16.intValue() != 0);
                            _item_3.Register_Number = (int) _stmt.getLong(62);
                            _item_3.From_Entry_No = (int) _stmt.getLong(63);
                            _item_3.To_Entry_No = (int) _stmt.getLong(64);
                            if (_stmt.isNull(65)) {
                                _item_3.Batch_Posted_UserID = null;
                            } else {
                                _item_3.Batch_Posted_UserID = _stmt.getText(65);
                            }
                            _item_3.BD_Register_Number = (int) _stmt.getLong(66);
                            _item_3.BD_From_Number = (int) _stmt.getLong(67);
                            _item_3.BD_To_Number = (int) _stmt.getLong(68);
                            if (_stmt.isNull(69)) {
                                _item_3.Reversal_By = null;
                            } else {
                                _item_3.Reversal_By = _stmt.getText(69);
                            }
                            Long _tmp_17 = _stmt.isNull(70) ? null : Long.valueOf(_stmt.getLong(70));
                            _item_3.Reversal_Date = Converters.DateConverter.toDate(_tmp_17);
                            Long _tmp_18 = _stmt.isNull(71) ? null : Long.valueOf(_stmt.getLong(71));
                            _item_3.Reversal_Time = Converters.DateConverter.toDate(_tmp_18);
                            _item_3.Reversal_Register_No = (int) _stmt.getLong(72);
                            _item_3.Reversal_From_Entry_No = (int) _stmt.getLong(73);
                            _item_3.Reversal_To_Entry_No = (int) _stmt.getLong(74);
                            Integer _tmp_19 = _stmt.isNull(75) ? null : Integer.valueOf((int) _stmt.getLong(75));
                            _item_3.Reversed = _tmp_19 == null ? null : Boolean.valueOf(_tmp_19.intValue() != 0);
                            if (_stmt.isNull(76)) {
                                _item_3.Applies_to_Doc_No = null;
                            } else {
                                _item_3.Applies_to_Doc_No = _stmt.getText(76);
                            }
                            if (_stmt.isNull(77)) {
                                _item_3.Applies_to_ID = null;
                            } else {
                                _item_3.Applies_to_ID = _stmt.getText(77);
                            }
                            if (_stmt.isNull(78)) {
                                _item_3.Grant_No = null;
                            } else {
                                _item_3.Grant_No = _stmt.getText(78);
                            }
                            _item_3.Installment_Number = (int) _stmt.getLong(79);
                            Long _tmp_20 = _stmt.isNull(80) ? null : Long.valueOf(_stmt.getLong(80));
                            _item_3.Next_Installment_Date = Converters.DateConverter.toDate(_tmp_20);
                            _item_3.Dimension_Set_ID = (int) _stmt.getLong(81);
                            if (_stmt.isNull(82)) {
                                _item_3.Donor = null;
                            } else {
                                _item_3.Donor = _stmt.getText(82);
                            }
                            if (_stmt.isNull(83)) {
                                _item_3.Group_Code = null;
                            } else {
                                _item_3.Group_Code = _stmt.getText(83);
                            }
                            if (_stmt.isNull(84)) {
                                _item_3.Pre_ADM_Fines = null;
                            } else {
                                _item_3.Pre_ADM_Fines = Double.valueOf(_stmt.getDouble(84));
                            }
                            if (_stmt.isNull(85)) {
                                _item_3.Med_Fines = null;
                            } else {
                                _item_3.Med_Fines = Double.valueOf(_stmt.getDouble(85));
                            }
                            if (_stmt.isNull(86)) {
                                _item_3.Loan_No = null;
                            } else {
                                _item_3.Loan_No = _stmt.getText(86);
                            }
                            if (_stmt.isNull(87)) {
                                _item_3.Penalty = null;
                            } else {
                                _item_3.Penalty = Double.valueOf(_stmt.getDouble(87));
                            }
                            int _tmp_21 = (int) _stmt.getLong(88);
                            _item_3.sent = _tmp_21 != 0;
                            _tmpRelation.add(_item_3);
                        } catch (Throwable th2) {
                            th = th2;
                        }
                    } else {
                        __mapKeySet = __mapKeySet;
                    }
                } else {
                    __mapKeySet = __mapKeySet;
                }
                arrayMap = _map;
                _itemKeyIndex = _itemKeyIndex;
                __mapKeySet = __mapKeySet;
            }
            _stmt.close();
            return;
        } catch (Throwable th3) {
            th = th3;
        }
        _stmt.close();
        throw th;
    }

    /* JADX INFO: renamed from: lambda$__fetchRelationshiptransactionAscomTrimlineMetrocrewTransaction$9$com-trimline-metrocrew-theader_dao_Impl, reason: not valid java name */
    /* synthetic */ Unit m452x5f6d5dfa(SQLiteConnection _connection, ArrayMap _tmpMap) throws Throwable {
        __fetchRelationshiptransactionAscomTrimlineMetrocrewTransaction(_connection, _tmpMap);
        return Unit.INSTANCE;
    }
}
