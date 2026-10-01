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
public final class payment_modes_dao_Impl extends payment_modes.dao {
    private final RoomDatabase __db;
    private final EntityInsertAdapter<payment_modes> __insertAdapterOfpayment_modes = new EntityInsertAdapter<payment_modes>() { // from class: com.trimline.metrocrew.payment_modes_dao_Impl.1
        @Override // androidx.room.EntityInsertAdapter
        protected String createQuery() {
            return "INSERT OR REPLACE INTO `payment_modes` (`Code`,`Name`) VALUES (?,?)";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityInsertAdapter
        public void bind(final SQLiteStatement statement, final payment_modes entity) {
            if (entity.Code == null) {
                statement.mo153bindNull(1);
            } else {
                statement.mo154bindText(1, entity.Code);
            }
            if (entity.Name == null) {
                statement.mo153bindNull(2);
            } else {
                statement.mo154bindText(2, entity.Name);
            }
        }
    };
    private final EntityDeleteOrUpdateAdapter<payment_modes> __deleteAdapterOfpayment_modes = new EntityDeleteOrUpdateAdapter<payment_modes>() { // from class: com.trimline.metrocrew.payment_modes_dao_Impl.2
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        protected String createQuery() {
            return "DELETE FROM `payment_modes` WHERE `Code` = ?";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        public void bind(final SQLiteStatement statement, final payment_modes entity) {
            if (entity.Code == null) {
                statement.mo153bindNull(1);
            } else {
                statement.mo154bindText(1, entity.Code);
            }
        }
    };
    private final EntityDeleteOrUpdateAdapter<payment_modes> __updateAdapterOfpayment_modes = new EntityDeleteOrUpdateAdapter<payment_modes>() { // from class: com.trimline.metrocrew.payment_modes_dao_Impl.3
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        protected String createQuery() {
            return "UPDATE OR ABORT `payment_modes` SET `Code` = ?,`Name` = ? WHERE `Code` = ?";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        public void bind(final SQLiteStatement statement, final payment_modes entity) {
            if (entity.Code == null) {
                statement.mo153bindNull(1);
            } else {
                statement.mo154bindText(1, entity.Code);
            }
            if (entity.Name == null) {
                statement.mo153bindNull(2);
            } else {
                statement.mo154bindText(2, entity.Name);
            }
            if (entity.Code == null) {
                statement.mo153bindNull(3);
            } else {
                statement.mo154bindText(3, entity.Code);
            }
        }
    };

    public payment_modes_dao_Impl(final RoomDatabase __db) {
        this.__db = __db;
    }

    @Override // com.trimline.metrocrew.payment_modes.dao
    void insert(final payment_modes entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.payment_modes_dao_Impl$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m450lambda$insert$0$comtrimlinemetrocrewpayment_modes_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$insert$0$com-trimline-metrocrew-payment_modes_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m450lambda$insert$0$comtrimlinemetrocrewpayment_modes_dao_Impl(payment_modes entity, SQLiteConnection _connection) throws Exception {
        this.__insertAdapterOfpayment_modes.insert(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.payment_modes.dao
    void delete(final payment_modes entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.payment_modes_dao_Impl$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m449lambda$delete$1$comtrimlinemetrocrewpayment_modes_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$delete$1$com-trimline-metrocrew-payment_modes_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m449lambda$delete$1$comtrimlinemetrocrewpayment_modes_dao_Impl(payment_modes entity, SQLiteConnection _connection) throws Exception {
        this.__deleteAdapterOfpayment_modes.handle(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.payment_modes.dao
    void update(final payment_modes entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.payment_modes_dao_Impl$$ExternalSyntheticLambda2
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m451lambda$update$2$comtrimlinemetrocrewpayment_modes_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$update$2$com-trimline-metrocrew-payment_modes_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m451lambda$update$2$comtrimlinemetrocrewpayment_modes_dao_Impl(payment_modes entity, SQLiteConnection _connection) throws Exception {
        this.__updateAdapterOfpayment_modes.handle(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.payment_modes.dao
    List<payment_modes> getall() {
        return (List) DBUtil.performBlocking(this.__db, true, false, new Function1() { // from class: com.trimline.metrocrew.payment_modes_dao_Impl$$ExternalSyntheticLambda4
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return payment_modes_dao_Impl.lambda$getall$3((SQLiteConnection) obj);
            }
        });
    }

    static /* synthetic */ List lambda$getall$3(SQLiteConnection _connection) {
        SQLiteStatement _stmt = _connection.prepare("SELECT * FROM payment_modes");
        try {
            int _columnIndexOfCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Code");
            int _columnIndexOfName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Name");
            List<payment_modes> _result = new ArrayList<>();
            while (_stmt.step()) {
                payment_modes _item = new payment_modes();
                if (_stmt.isNull(_columnIndexOfCode)) {
                    _item.Code = null;
                } else {
                    _item.Code = _stmt.getText(_columnIndexOfCode);
                }
                if (_stmt.isNull(_columnIndexOfName)) {
                    _item.Name = null;
                } else {
                    _item.Name = _stmt.getText(_columnIndexOfName);
                }
                _result.add(_item);
            }
            return _result;
        } finally {
            _stmt.close();
        }
    }

    @Override // com.trimline.metrocrew.payment_modes.dao
    void deleteall() {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.payment_modes_dao_Impl$$ExternalSyntheticLambda3
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return payment_modes_dao_Impl.lambda$deleteall$4((SQLiteConnection) obj);
            }
        });
    }

    static /* synthetic */ Object lambda$deleteall$4(SQLiteConnection _connection) {
        SQLiteStatement _stmt = _connection.prepare("delete from payment_modes");
        try {
            _stmt.step();
            return null;
        } finally {
            _stmt.close();
        }
    }

    public static List<Class<?>> getRequiredConverters() {
        return Collections.emptyList();
    }
}
