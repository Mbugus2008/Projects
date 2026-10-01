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
public final class Member_dao_Impl extends Member.dao {
    private final RoomDatabase __db;
    private final EntityInsertAdapter<Member> __insertAdapterOfMember = new EntityInsertAdapter<Member>() { // from class: com.trimline.metrocrew.Member_dao_Impl.1
        @Override // androidx.room.EntityInsertAdapter
        protected String createQuery() {
            return "INSERT OR REPLACE INTO `Member` (`No`,`Name`,`ID_No`,`Phone_No`,`Outstanding_Balance`,`Shares_Retained`,`Current_Shares`,`Current_Savings`,`Registration_Fee_Paid`) VALUES (?,?,?,?,?,?,?,?,?)";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityInsertAdapter
        public void bind(final SQLiteStatement statement, final Member entity) {
            if (entity.No == null) {
                statement.mo153bindNull(1);
            } else {
                statement.mo154bindText(1, entity.No);
            }
            if (entity.Name == null) {
                statement.mo153bindNull(2);
            } else {
                statement.mo154bindText(2, entity.Name);
            }
            if (entity.ID_No == null) {
                statement.mo153bindNull(3);
            } else {
                statement.mo154bindText(3, entity.ID_No);
            }
            if (entity.Phone_No == null) {
                statement.mo153bindNull(4);
            } else {
                statement.mo154bindText(4, entity.Phone_No);
            }
            statement.mo151bindDouble(5, entity.Outstanding_Balance);
            statement.mo151bindDouble(6, entity.Shares_Retained);
            statement.mo151bindDouble(7, entity.Current_Shares);
            statement.mo151bindDouble(8, entity.Current_Savings);
            statement.mo151bindDouble(9, entity.Registration_Fee_Paid);
        }
    };
    private final EntityDeleteOrUpdateAdapter<Member> __deleteAdapterOfMember = new EntityDeleteOrUpdateAdapter<Member>() { // from class: com.trimline.metrocrew.Member_dao_Impl.2
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        protected String createQuery() {
            return "DELETE FROM `Member` WHERE `No` = ?";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        public void bind(final SQLiteStatement statement, final Member entity) {
            if (entity.No == null) {
                statement.mo153bindNull(1);
            } else {
                statement.mo154bindText(1, entity.No);
            }
        }
    };
    private final EntityDeleteOrUpdateAdapter<Member> __updateAdapterOfMember = new EntityDeleteOrUpdateAdapter<Member>() { // from class: com.trimline.metrocrew.Member_dao_Impl.3
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        protected String createQuery() {
            return "UPDATE OR ABORT `Member` SET `No` = ?,`Name` = ?,`ID_No` = ?,`Phone_No` = ?,`Outstanding_Balance` = ?,`Shares_Retained` = ?,`Current_Shares` = ?,`Current_Savings` = ?,`Registration_Fee_Paid` = ? WHERE `No` = ?";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        public void bind(final SQLiteStatement statement, final Member entity) {
            if (entity.No == null) {
                statement.mo153bindNull(1);
            } else {
                statement.mo154bindText(1, entity.No);
            }
            if (entity.Name == null) {
                statement.mo153bindNull(2);
            } else {
                statement.mo154bindText(2, entity.Name);
            }
            if (entity.ID_No == null) {
                statement.mo153bindNull(3);
            } else {
                statement.mo154bindText(3, entity.ID_No);
            }
            if (entity.Phone_No == null) {
                statement.mo153bindNull(4);
            } else {
                statement.mo154bindText(4, entity.Phone_No);
            }
            statement.mo151bindDouble(5, entity.Outstanding_Balance);
            statement.mo151bindDouble(6, entity.Shares_Retained);
            statement.mo151bindDouble(7, entity.Current_Shares);
            statement.mo151bindDouble(8, entity.Current_Savings);
            statement.mo151bindDouble(9, entity.Registration_Fee_Paid);
            if (entity.No == null) {
                statement.mo153bindNull(10);
            } else {
                statement.mo154bindText(10, entity.No);
            }
        }
    };

    public Member_dao_Impl(final RoomDatabase __db) {
        this.__db = __db;
    }

    @Override // com.trimline.metrocrew.Member.dao
    void insert(final Member entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.Member_dao_Impl$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m438lambda$insert$0$comtrimlinemetrocrewMember_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$insert$0$com-trimline-metrocrew-Member_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m438lambda$insert$0$comtrimlinemetrocrewMember_dao_Impl(Member entity, SQLiteConnection _connection) throws Exception {
        this.__insertAdapterOfMember.insert(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.Member.dao
    void delete(final Member entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.Member_dao_Impl$$ExternalSyntheticLambda2
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m437lambda$delete$1$comtrimlinemetrocrewMember_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$delete$1$com-trimline-metrocrew-Member_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m437lambda$delete$1$comtrimlinemetrocrewMember_dao_Impl(Member entity, SQLiteConnection _connection) throws Exception {
        this.__deleteAdapterOfMember.handle(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.Member.dao
    void update(final Member entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.Member_dao_Impl$$ExternalSyntheticLambda3
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m439lambda$update$2$comtrimlinemetrocrewMember_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$update$2$com-trimline-metrocrew-Member_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m439lambda$update$2$comtrimlinemetrocrewMember_dao_Impl(Member entity, SQLiteConnection _connection) throws Exception {
        this.__updateAdapterOfMember.handle(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.Member.dao
    List<Member> getmembers() {
        return (List) DBUtil.performBlocking(this.__db, true, false, new Function1() { // from class: com.trimline.metrocrew.Member_dao_Impl$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return Member_dao_Impl.lambda$getmembers$3((SQLiteConnection) obj);
            }
        });
    }

    static /* synthetic */ List lambda$getmembers$3(SQLiteConnection _connection) {
        SQLiteStatement _stmt = _connection.prepare("SELECT * FROM Member");
        try {
            int _columnIndexOfNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "No");
            int _columnIndexOfName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Name");
            int _columnIndexOfIDNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "ID_No");
            int _columnIndexOfPhoneNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Phone_No");
            int _columnIndexOfOutstandingBalance = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Outstanding_Balance");
            int _columnIndexOfSharesRetained = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Shares_Retained");
            int _columnIndexOfCurrentShares = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Current_Shares");
            int _columnIndexOfCurrentSavings = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Current_Savings");
            int _columnIndexOfRegistrationFeePaid = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Registration_Fee_Paid");
            List<Member> _result = new ArrayList<>();
            while (_stmt.step()) {
                Member _item = new Member();
                if (_stmt.isNull(_columnIndexOfNo)) {
                    _item.No = null;
                } else {
                    _item.No = _stmt.getText(_columnIndexOfNo);
                }
                if (_stmt.isNull(_columnIndexOfName)) {
                    _item.Name = null;
                } else {
                    _item.Name = _stmt.getText(_columnIndexOfName);
                }
                if (_stmt.isNull(_columnIndexOfIDNo)) {
                    _item.ID_No = null;
                } else {
                    _item.ID_No = _stmt.getText(_columnIndexOfIDNo);
                }
                if (_stmt.isNull(_columnIndexOfPhoneNo)) {
                    _item.Phone_No = null;
                } else {
                    _item.Phone_No = _stmt.getText(_columnIndexOfPhoneNo);
                }
                _item.Outstanding_Balance = _stmt.getDouble(_columnIndexOfOutstandingBalance);
                _item.Shares_Retained = _stmt.getDouble(_columnIndexOfSharesRetained);
                _item.Current_Shares = _stmt.getDouble(_columnIndexOfCurrentShares);
                _item.Current_Savings = _stmt.getDouble(_columnIndexOfCurrentSavings);
                _item.Registration_Fee_Paid = _stmt.getDouble(_columnIndexOfRegistrationFeePaid);
                _result.add(_item);
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
