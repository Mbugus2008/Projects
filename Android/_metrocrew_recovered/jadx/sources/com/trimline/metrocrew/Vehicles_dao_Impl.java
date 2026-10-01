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
public final class Vehicles_dao_Impl extends Vehicles.dao {
    private final RoomDatabase __db;
    private final EntityInsertAdapter<Vehicles> __insertAdapterOfVehicles = new EntityInsertAdapter<Vehicles>() { // from class: com.trimline.metrocrew.Vehicles_dao_Impl.1
        @Override // androidx.room.EntityInsertAdapter
        protected String createQuery() {
            return "INSERT OR REPLACE INTO `Vehicles` (`Vehicle_Number`,`vehicle_type`,`Daily_Contribution`,`Start_Date`,`Code`,`Id_Number`,`Arrears`,`Penalty`,`Fleet_No`) VALUES (?,?,?,?,?,?,?,?,?)";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityInsertAdapter
        public void bind(final SQLiteStatement statement, final Vehicles entity) {
            if (entity.Vehicle_Number == null) {
                statement.mo153bindNull(1);
            } else {
                statement.mo154bindText(1, entity.Vehicle_Number);
            }
            statement.mo152bindLong(2, entity.vehicle_type);
            if (entity.Daily_Contribution == null) {
                statement.mo153bindNull(3);
            } else {
                statement.mo151bindDouble(3, entity.Daily_Contribution.doubleValue());
            }
            if (entity.Start_Date == null) {
                statement.mo153bindNull(4);
            } else {
                statement.mo154bindText(4, entity.Start_Date);
            }
            if (entity.Code == null) {
                statement.mo153bindNull(5);
            } else {
                statement.mo154bindText(5, entity.Code);
            }
            if (entity.Id_Number == null) {
                statement.mo153bindNull(6);
            } else {
                statement.mo154bindText(6, entity.Id_Number);
            }
            statement.mo151bindDouble(7, entity.Arrears);
            statement.mo151bindDouble(8, entity.Penalty);
            if (entity.Fleet_No == null) {
                statement.mo153bindNull(9);
            } else {
                statement.mo154bindText(9, entity.Fleet_No);
            }
        }
    };
    private final EntityDeleteOrUpdateAdapter<Vehicles> __deleteAdapterOfVehicles = new EntityDeleteOrUpdateAdapter<Vehicles>() { // from class: com.trimline.metrocrew.Vehicles_dao_Impl.2
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        protected String createQuery() {
            return "DELETE FROM `Vehicles` WHERE `Vehicle_Number` = ?";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        public void bind(final SQLiteStatement statement, final Vehicles entity) {
            if (entity.Vehicle_Number == null) {
                statement.mo153bindNull(1);
            } else {
                statement.mo154bindText(1, entity.Vehicle_Number);
            }
        }
    };
    private final EntityDeleteOrUpdateAdapter<Vehicles> __updateAdapterOfVehicles = new EntityDeleteOrUpdateAdapter<Vehicles>() { // from class: com.trimline.metrocrew.Vehicles_dao_Impl.3
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        protected String createQuery() {
            return "UPDATE OR ABORT `Vehicles` SET `Vehicle_Number` = ?,`vehicle_type` = ?,`Daily_Contribution` = ?,`Start_Date` = ?,`Code` = ?,`Id_Number` = ?,`Arrears` = ?,`Penalty` = ?,`Fleet_No` = ? WHERE `Vehicle_Number` = ?";
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // androidx.room.EntityDeleteOrUpdateAdapter
        public void bind(final SQLiteStatement statement, final Vehicles entity) {
            if (entity.Vehicle_Number == null) {
                statement.mo153bindNull(1);
            } else {
                statement.mo154bindText(1, entity.Vehicle_Number);
            }
            statement.mo152bindLong(2, entity.vehicle_type);
            if (entity.Daily_Contribution == null) {
                statement.mo153bindNull(3);
            } else {
                statement.mo151bindDouble(3, entity.Daily_Contribution.doubleValue());
            }
            if (entity.Start_Date == null) {
                statement.mo153bindNull(4);
            } else {
                statement.mo154bindText(4, entity.Start_Date);
            }
            if (entity.Code == null) {
                statement.mo153bindNull(5);
            } else {
                statement.mo154bindText(5, entity.Code);
            }
            if (entity.Id_Number == null) {
                statement.mo153bindNull(6);
            } else {
                statement.mo154bindText(6, entity.Id_Number);
            }
            statement.mo151bindDouble(7, entity.Arrears);
            statement.mo151bindDouble(8, entity.Penalty);
            if (entity.Fleet_No == null) {
                statement.mo153bindNull(9);
            } else {
                statement.mo154bindText(9, entity.Fleet_No);
            }
            if (entity.Vehicle_Number == null) {
                statement.mo153bindNull(10);
            } else {
                statement.mo154bindText(10, entity.Vehicle_Number);
            }
        }
    };

    public Vehicles_dao_Impl(final RoomDatabase __db) {
        this.__db = __db;
    }

    @Override // com.trimline.metrocrew.Vehicles.dao
    void insert(final Vehicles entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.Vehicles_dao_Impl$$ExternalSyntheticLambda3
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m441lambda$insert$0$comtrimlinemetrocrewVehicles_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$insert$0$com-trimline-metrocrew-Vehicles_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m441lambda$insert$0$comtrimlinemetrocrewVehicles_dao_Impl(Vehicles entity, SQLiteConnection _connection) throws Exception {
        this.__insertAdapterOfVehicles.insert(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.Vehicles.dao
    void delete(final Vehicles entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.Vehicles_dao_Impl$$ExternalSyntheticLambda2
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m440lambda$delete$1$comtrimlinemetrocrewVehicles_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$delete$1$com-trimline-metrocrew-Vehicles_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m440lambda$delete$1$comtrimlinemetrocrewVehicles_dao_Impl(Vehicles entity, SQLiteConnection _connection) throws Exception {
        this.__deleteAdapterOfVehicles.handle(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.Vehicles.dao
    void update(final Vehicles entity) {
        DBUtil.performBlocking(this.__db, false, true, new Function1() { // from class: com.trimline.metrocrew.Vehicles_dao_Impl$$ExternalSyntheticLambda0
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return this.f$0.m442lambda$update$2$comtrimlinemetrocrewVehicles_dao_Impl(entity, (SQLiteConnection) obj);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$update$2$com-trimline-metrocrew-Vehicles_dao_Impl, reason: not valid java name */
    /* synthetic */ Object m442lambda$update$2$comtrimlinemetrocrewVehicles_dao_Impl(Vehicles entity, SQLiteConnection _connection) throws Exception {
        this.__updateAdapterOfVehicles.handle(_connection, entity);
        return null;
    }

    @Override // com.trimline.metrocrew.Vehicles.dao
    List<Vehicles> getall() {
        return (List) DBUtil.performBlocking(this.__db, true, false, new Function1() { // from class: com.trimline.metrocrew.Vehicles_dao_Impl$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function1
            public final Object invoke(Object obj) {
                return Vehicles_dao_Impl.lambda$getall$3((SQLiteConnection) obj);
            }
        });
    }

    static /* synthetic */ List lambda$getall$3(SQLiteConnection _connection) {
        SQLiteStatement _stmt = _connection.prepare("SELECT * FROM Vehicles");
        try {
            int _columnIndexOfVehicleNumber = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Vehicle_Number");
            int _columnIndexOfVehicleType = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "vehicle_type");
            int _columnIndexOfDailyContribution = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Daily_Contribution");
            int _columnIndexOfStartDate = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Start_Date");
            int _columnIndexOfCode = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Code");
            int _columnIndexOfIdNumber = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Id_Number");
            int _columnIndexOfArrears = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Arrears");
            int _columnIndexOfPenalty = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Penalty");
            int _columnIndexOfFleetNo = SQLiteStatementUtil.getColumnIndexOrThrow(_stmt, "Fleet_No");
            List<Vehicles> _result = new ArrayList<>();
            while (_stmt.step()) {
                Vehicles _item = new Vehicles();
                if (_stmt.isNull(_columnIndexOfVehicleNumber)) {
                    _item.Vehicle_Number = null;
                } else {
                    _item.Vehicle_Number = _stmt.getText(_columnIndexOfVehicleNumber);
                }
                _item.vehicle_type = (int) _stmt.getLong(_columnIndexOfVehicleType);
                if (_stmt.isNull(_columnIndexOfDailyContribution)) {
                    _item.Daily_Contribution = null;
                } else {
                    _item.Daily_Contribution = Double.valueOf(_stmt.getDouble(_columnIndexOfDailyContribution));
                }
                if (_stmt.isNull(_columnIndexOfStartDate)) {
                    _item.Start_Date = null;
                } else {
                    _item.Start_Date = _stmt.getText(_columnIndexOfStartDate);
                }
                if (_stmt.isNull(_columnIndexOfCode)) {
                    _item.Code = null;
                } else {
                    _item.Code = _stmt.getText(_columnIndexOfCode);
                }
                if (_stmt.isNull(_columnIndexOfIdNumber)) {
                    _item.Id_Number = null;
                } else {
                    _item.Id_Number = _stmt.getText(_columnIndexOfIdNumber);
                }
                _item.Arrears = _stmt.getDouble(_columnIndexOfArrears);
                _item.Penalty = _stmt.getDouble(_columnIndexOfPenalty);
                if (_stmt.isNull(_columnIndexOfFleetNo)) {
                    _item.Fleet_No = null;
                } else {
                    _item.Fleet_No = _stmt.getText(_columnIndexOfFleetNo);
                }
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
