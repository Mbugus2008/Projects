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
public final class types_dao_Impl extends types.dao {
    private final RoomDatabase __db;
    private final EntityInsertAdapter<types> __insertAdapterOftypes = new EntityInsertAdapter<types>() { // from class: com.trimline.metrocrew.types_dao_Impl.1
        @Override // androidx.room.EntityInsertAdapter
        protected String createQuery() {
            return "INSERT OR REPLACE INTO `types` (`Code`,`Name`,`Active`,`Account`,`Order`) VALUES (?,?,?,?,?)";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityInsertAdapter
        public void bind(SQLiteStatement sQLiteStatement, types typesVar) {
            if (typesVar.Code == null) {
                sQLiteStatement.mo153bindNull(1);
            } else {
                sQLiteStatement.mo154bindText(1, typesVar.Code);
            }
            if (typesVar.Name == null) {
                sQLiteStatement.mo153bindNull(2);
            } else {
                sQLiteStatement.mo154bindText(2, typesVar.Name);
            }
            Integer numValueOf = typesVar.Active == null ? null : Integer.valueOf(typesVar.Active.booleanValue() ? 1 : 0);
            if (numValueOf != null) {
                sQLiteStatement.mo152bindLong(3, numValueOf.intValue());
            } else {
                sQLiteStatement.mo153bindNull(3);
            }
            if (typesVar.Account == null) {
                sQLiteStatement.mo153bindNull(4);
            } else {
                sQLiteStatement.mo154bindText(4, typesVar.Account);
            }
            sQLiteStatement.mo152bindLong(5, typesVar.Order);
        }
    };
    private final EntityDeleteOrUpdateAdapter<types> __deleteAdapterOftypes = new EntityDeleteOrUpdateAdapter<types>() { // from class: com.trimline.metrocrew.types_dao_Impl.2
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        protected String createQuery() {
            return "DELETE FROM `types` WHERE `Code` = ?";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        public void bind(final SQLiteStatement statement, final types entity) {
            if (entity.Code == null) {
                statement.mo153bindNull(1);
            } else {
                statement.mo154bindText(1, entity.Code);
            }
        }
    };
    private final EntityDeleteOrUpdateAdapter<types> __updateAdapterOftypes = new EntityDeleteOrUpdateAdapter<types>() { // from class: com.trimline.metrocrew.types_dao_Impl.3
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        protected String createQuery() {
            return "UPDATE OR ABORT `types` SET `Code` = ?,`Name` = ?,`Active` = ?,`Account` = ?,`Order` = ? WHERE `Code` = ?";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        public void bind(SQLiteStatement sQLiteStatement, types typesVar) {
            if (typesVar.Code == null) {
                sQLiteStatement.mo153bindNull(1);
            } else {
                sQLiteStatement.mo154bindText(1, typesVar.Code);
            }
            if (typesVar.Name == null) {
                sQLiteStatement.mo153bindNull(2);
            } else {
                sQLiteStatement.mo154bindText(2, typesVar.Name);
            }
            Integer numValueOf = typesVar.Active == null ? null : Integer.valueOf(typesVar.Active.booleanValue() ? 1 : 0);
            if (numValueOf != null) {
                sQLiteStatement.mo152bindLong(3, numValueOf.intValue());
            } else {
                sQLiteStatement.mo153bindNull(3);
            }
            if (typesVar.Account == null) {
                sQLiteStatement.mo153bindNull(4);
            } else {
                sQLiteStatement.mo154bindText(4, typesVar.Account);
            }
            sQLiteStatement.mo152bindLong(5, typesVar.Order);
            if (typesVar.Code == null) {
                sQLiteStatement.mo153bindNull(6);
            } else {
                sQLiteStatement.mo154bindText(6, typesVar.Code);
            }
        }
    };

    public types_dao_Impl(final RoomDatabase __db) {
        this.__db = __db;
    }

    @Override // com.trimline.metrocrew.types.dao
    void insert(final types entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.types_dao_Impl$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m463lambda$insert$0$comtrimlinemetrocrewtypes_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$insert$0$com-trimline-metrocrew-types_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m463lambda$insert$0$comtrimlinemetrocrewtypes_dao_Impl(types entity, SQLiteConnection _connection) throws Exception {
        this.__insertAdapterOftypes.insert(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.types.dao
    void delete(final types entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.types_dao_Impl$$ExternalSyntheticLambda3
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m462lambda$delete$1$comtrimlinemetrocrewtypes_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$delete$1$com-trimline-metrocrew-types_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m462lambda$delete$1$comtrimlinemetrocrewtypes_dao_Impl(types entity, SQLiteConnection _connection) throws Exception {
        this.__deleteAdapterOftypes.handle(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.types.dao
    void update(final types entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.types_dao_Impl$$ExternalSyntheticLambda4
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m464lambda$update$2$comtrimlinemetrocrewtypes_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$update$2$com-trimline-metrocrew-types_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m464lambda$update$2$comtrimlinemetrocrewtypes_dao_Impl(types entity, SQLiteConnection _connection) throws Exception {
        this.__updateAdapterOftypes.handle(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.types.dao
    List<types> getypes() {
        return (List) DBUtil.performBlocking(this.__db, true, false, new Function1() { // from class: com.trimline.metrocrew.types_dao_Impl$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return types_dao_Impl.lambda$getypes$3((SQLiteConnection) obj);
            }
        });
    }

    static /* synthetic */ List lambda$getypes$3(SQLiteConnection _connection) {
        Integer _tmp;
        Boolean boolValueOf;
        SQLiteStatement _stmt = _connection.prepare("select * from types");
        try {
            int _columnIndexOfCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Code");
            int _columnIndexOfName = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Name");
            int _columnIndexOfActive = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Active");
            int _columnIndexOfAccount = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Account");
            int _columnIndexOfOrder = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Order");
            List<types> _result = new ArrayList<>();
            while (_stmt.step()) {
                types _item = new types();
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
                if (_stmt.isNull(_columnIndexOfActive)) {
                    _tmp = null;
                } else {
                    _tmp = Integer.valueOf((int) _stmt.getLong(_columnIndexOfActive));
                }
                if (_tmp == null) {
                    boolValueOf = null;
                } else {
                    boolValueOf = Boolean.valueOf(_tmp.intValue() != 0);
                }
                _item.Active = boolValueOf;
                if (_stmt.isNull(_columnIndexOfAccount)) {
                    _item.Account = null;
                } else {
                    _item.Account = _stmt.getText(_columnIndexOfAccount);
                }
                _item.Order = (int) _stmt.getLong(_columnIndexOfOrder);
                _result.add(_item);
            }
            return _result;
        } finally {
            _stmt.close();
        }
    }

    @Override // com.trimline.metrocrew.types.dao
    void deleteall() {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.types_dao_Impl$$ExternalSyntheticLambda2
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return types_dao_Impl.lambda$deleteall$4((SQLiteConnection) obj);
            }
        });
    }

    static /* synthetic */ Object lambda$deleteall$4(SQLiteConnection _connection) {
        SQLiteStatement _stmt = _connection.prepare("delete from types");
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
