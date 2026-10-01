package com.trimline.metrocrew;

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
public final class loan_dao_Impl extends loan.dao {
    private final RoomDatabase __db;
    private final EntityInsertAdapter<loan> __insertAdapterOfloan = new EntityInsertAdapter<loan>() { // from class: com.trimline.metrocrew.loan_dao_Impl.1
        @Override // androidx.room.EntityInsertAdapter
        protected String createQuery() {
            return "INSERT OR REPLACE INTO `loan` (`Loan_No`,`Application_Date`,`Loan_Product_Type`,`Client_Code`,`Balance`,`Loan_Product_Type_Name`) VALUES (?,?,?,?,?,?)";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityInsertAdapter
        public void bind(final SQLiteStatement statement, final loan entity) {
            if (entity.Loan_No == null) {
                statement.mo153bindNull(1);
            } else {
                statement.mo154bindText(1, entity.Loan_No);
            }
            if (entity.Application_Date == null) {
                statement.mo153bindNull(2);
            } else {
                statement.mo154bindText(2, entity.Application_Date);
            }
            if (entity.Loan_Product_Type == null) {
                statement.mo153bindNull(3);
            } else {
                statement.mo154bindText(3, entity.Loan_Product_Type);
            }
            if (entity.Client_Code == null) {
                statement.mo153bindNull(4);
            } else {
                statement.mo154bindText(4, entity.Client_Code);
            }
            if (entity.Balance == null) {
                statement.mo153bindNull(5);
            } else {
                statement.mo151bindDouble(5, entity.Balance.doubleValue());
            }
            if (entity.Loan_Product_Type_Name == null) {
                statement.mo153bindNull(6);
            } else {
                statement.mo154bindText(6, entity.Loan_Product_Type_Name);
            }
        }
    };
    private final EntityDeleteOrUpdateAdapter<loan> __deleteAdapterOfloan = new EntityDeleteOrUpdateAdapter<loan>() { // from class: com.trimline.metrocrew.loan_dao_Impl.2
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        protected String createQuery() {
            return "DELETE FROM `loan` WHERE `Loan_No` = ?";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        public void bind(final SQLiteStatement statement, final loan entity) {
            if (entity.Loan_No == null) {
                statement.mo153bindNull(1);
            } else {
                statement.mo154bindText(1, entity.Loan_No);
            }
        }
    };
    private final EntityDeleteOrUpdateAdapter<loan> __updateAdapterOfloan = new EntityDeleteOrUpdateAdapter<loan>() { // from class: com.trimline.metrocrew.loan_dao_Impl.3
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        protected String createQuery() {
            return "UPDATE OR ABORT `loan` SET `Loan_No` = ?,`Application_Date` = ?,`Loan_Product_Type` = ?,`Client_Code` = ?,`Balance` = ?,`Loan_Product_Type_Name` = ? WHERE `Loan_No` = ?";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        public void bind(final SQLiteStatement statement, final loan entity) {
            if (entity.Loan_No == null) {
                statement.mo153bindNull(1);
            } else {
                statement.mo154bindText(1, entity.Loan_No);
            }
            if (entity.Application_Date == null) {
                statement.mo153bindNull(2);
            } else {
                statement.mo154bindText(2, entity.Application_Date);
            }
            if (entity.Loan_Product_Type == null) {
                statement.mo153bindNull(3);
            } else {
                statement.mo154bindText(3, entity.Loan_Product_Type);
            }
            if (entity.Client_Code == null) {
                statement.mo153bindNull(4);
            } else {
                statement.mo154bindText(4, entity.Client_Code);
            }
            if (entity.Balance == null) {
                statement.mo153bindNull(5);
            } else {
                statement.mo151bindDouble(5, entity.Balance.doubleValue());
            }
            if (entity.Loan_Product_Type_Name == null) {
                statement.mo153bindNull(6);
            } else {
                statement.mo154bindText(6, entity.Loan_Product_Type_Name);
            }
            if (entity.Loan_No == null) {
                statement.mo153bindNull(7);
            } else {
                statement.mo154bindText(7, entity.Loan_No);
            }
        }
    };

    public loan_dao_Impl(final RoomDatabase __db) {
        this.__db = __db;
    }

    @Override // com.trimline.metrocrew.loan.dao
    void insert(final loan entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.loan_dao_Impl$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m447lambda$insert$0$comtrimlinemetrocrewloan_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$insert$0$com-trimline-metrocrew-loan_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m447lambda$insert$0$comtrimlinemetrocrewloan_dao_Impl(loan entity, SQLiteConnection _connection) throws Exception {
        this.__insertAdapterOfloan.insert(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.loan.dao
    void delete(final loan entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.loan_dao_Impl$$ExternalSyntheticLambda2
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m446lambda$delete$1$comtrimlinemetrocrewloan_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$delete$1$com-trimline-metrocrew-loan_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m446lambda$delete$1$comtrimlinemetrocrewloan_dao_Impl(loan entity, SQLiteConnection _connection) throws Exception {
        this.__deleteAdapterOfloan.handle(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.loan.dao
    void update(final loan entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.loan_dao_Impl$$ExternalSyntheticLambda4
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m448lambda$update$2$comtrimlinemetrocrewloan_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$update$2$com-trimline-metrocrew-loan_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m448lambda$update$2$comtrimlinemetrocrewloan_dao_Impl(loan entity, SQLiteConnection _connection) throws Exception {
        this.__updateAdapterOfloan.handle(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.loan.dao
    public List<loan> getall() {
        return (List) DBUtil.performBlocking(this.__db, true, false, new Function1() { // from class: com.trimline.metrocrew.loan_dao_Impl$$ExternalSyntheticLambda5
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return loan_dao_Impl.lambda$getall$3((SQLiteConnection) obj);
            }
        });
    }

    static /* synthetic */ List lambda$getall$3(SQLiteConnection _connection) {
        SQLiteStatement _stmt = _connection.prepare("select * from loan");
        try {
            int _columnIndexOfLoanNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Loan_No");
            int _columnIndexOfApplicationDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Application_Date");
            int _columnIndexOfLoanProductType = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Loan_Product_Type");
            int _columnIndexOfClientCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Client_Code");
            int _columnIndexOfBalance = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Balance");
            int _columnIndexOfLoanProductTypeName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Loan_Product_Type_Name");
            List<loan> _result = new ArrayList<>();
            while (_stmt.step()) {
                loan _item = new loan();
                if (_stmt.isNull(_columnIndexOfLoanNo)) {
                    _item.Loan_No = null;
                } else {
                    _item.Loan_No = _stmt.getText(_columnIndexOfLoanNo);
                }
                if (_stmt.isNull(_columnIndexOfApplicationDate)) {
                    _item.Application_Date = null;
                } else {
                    _item.Application_Date = _stmt.getText(_columnIndexOfApplicationDate);
                }
                if (_stmt.isNull(_columnIndexOfLoanProductType)) {
                    _item.Loan_Product_Type = null;
                } else {
                    _item.Loan_Product_Type = _stmt.getText(_columnIndexOfLoanProductType);
                }
                if (_stmt.isNull(_columnIndexOfClientCode)) {
                    _item.Client_Code = null;
                } else {
                    _item.Client_Code = _stmt.getText(_columnIndexOfClientCode);
                }
                if (_stmt.isNull(_columnIndexOfBalance)) {
                    _item.Balance = null;
                } else {
                    _item.Balance = Double.valueOf(_stmt.getDouble(_columnIndexOfBalance));
                }
                if (_stmt.isNull(_columnIndexOfLoanProductTypeName)) {
                    _item.Loan_Product_Type_Name = null;
                } else {
                    _item.Loan_Product_Type_Name = _stmt.getText(_columnIndexOfLoanProductTypeName);
                }
                _result.add(_item);
            }
            return _result;
        } finally {
            _stmt.close();
        }
    }

    @Override // com.trimline.metrocrew.loan.dao
    public List<loan> getmemberloans(final String member) {
        return (List) DBUtil.performBlocking(this.__db, true, false, new Function1() { // from class: com.trimline.metrocrew.loan_dao_Impl$$ExternalSyntheticLambda3
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return loan_dao_Impl.lambda$getmemberloans$4(member, (SQLiteConnection) obj);
            }
        });
    }

    static /* synthetic */ List lambda$getmemberloans$4(String member, SQLiteConnection _connection) {
        SQLiteStatement _stmt = _connection.prepare("select * from loan where Client_Code=?");
        try {
            if (member == null) {
                _stmt.mo153bindNull(1);
            } else {
                _stmt.mo154bindText(1, member);
            }
            int _columnIndexOfLoanNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Loan_No");
            int _columnIndexOfApplicationDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Application_Date");
            int _columnIndexOfLoanProductType = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Loan_Product_Type");
            int _columnIndexOfClientCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Client_Code");
            int _columnIndexOfBalance = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Balance");
            int _columnIndexOfLoanProductTypeName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Loan_Product_Type_Name");
            List<loan> _result = new ArrayList<>();
            while (_stmt.step()) {
                loan _item = new loan();
                if (_stmt.isNull(_columnIndexOfLoanNo)) {
                    _item.Loan_No = null;
                } else {
                    _item.Loan_No = _stmt.getText(_columnIndexOfLoanNo);
                }
                if (_stmt.isNull(_columnIndexOfApplicationDate)) {
                    _item.Application_Date = null;
                } else {
                    _item.Application_Date = _stmt.getText(_columnIndexOfApplicationDate);
                }
                if (_stmt.isNull(_columnIndexOfLoanProductType)) {
                    _item.Loan_Product_Type = null;
                } else {
                    _item.Loan_Product_Type = _stmt.getText(_columnIndexOfLoanProductType);
                }
                if (_stmt.isNull(_columnIndexOfClientCode)) {
                    _item.Client_Code = null;
                } else {
                    _item.Client_Code = _stmt.getText(_columnIndexOfClientCode);
                }
                if (_stmt.isNull(_columnIndexOfBalance)) {
                    _item.Balance = null;
                } else {
                    _item.Balance = Double.valueOf(_stmt.getDouble(_columnIndexOfBalance));
                }
                if (_stmt.isNull(_columnIndexOfLoanProductTypeName)) {
                    _item.Loan_Product_Type_Name = null;
                } else {
                    _item.Loan_Product_Type_Name = _stmt.getText(_columnIndexOfLoanProductTypeName);
                }
                _result.add(_item);
            }
            _stmt.close();
            return _result;
        } catch (Throwable th) {
            _stmt.close();
            throw th;
        }
    }

    @Override // com.trimline.metrocrew.loan.dao
    public void removelclientloans(final String no) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.loan_dao_Impl$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return loan_dao_Impl.lambda$removelclientloans$5(no, (SQLiteConnection) obj);
            }
        });
    }

    static /* synthetic */ Object lambda$removelclientloans$5(String no, SQLiteConnection _connection) {
        SQLiteStatement _stmt = _connection.prepare("delete from loan where Client_Code=?");
        try {
            if (no == null) {
                _stmt.mo153bindNull(1);
            } else {
                _stmt.mo154bindText(1, no);
            }
            _stmt.step();
            _stmt.close();
            return null;
        } catch (Throwable th) {
            _stmt.close();
            throw th;
        }
    }

    public static List<Class<?>> getRequiredConverters() {
        return Collections.emptyList();
    }
}
