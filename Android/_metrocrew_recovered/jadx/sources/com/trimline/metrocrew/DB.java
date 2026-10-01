package com.trimline.metrocrew;

import android.content.Context;
import androidx.room.Room;
import androidx.room.RoomDatabase;
import androidx.room.migration.Migration;
import androidx.sqlite.db.SupportSQLiteDatabase;

/* JADX INFO: loaded from: classes5.dex */
public abstract class DB extends RoomDatabase {
    static final Migration MIGRATION_1_2;
    static final Migration MIGRATION_2_3;
    private static DB instance;

    public abstract agent.dao aDao();

    public abstract loan.dao ldao();

    public abstract Member.dao memberDao();

    public abstract payment_modes.dao pdao();

    public abstract transaction.dao tdao();

    public abstract theader.dao thDao();

    public abstract types.dao trandao();

    public abstract Vehicles.dao vDao();

    public static synchronized DB getInstance(Context context) {
        if (instance == null) {
            instance = (DB) Room.databaseBuilder(context.getApplicationContext(), DB.class, "MetroCrew").fallbackToDestructiveMigration().addMigrations(MIGRATION_1_2).build();
        }
        return instance;
    }

    static {
        int i = 2;
        MIGRATION_1_2 = new Migration(1, i) { // from class: com.trimline.metrocrew.DB.1
            @Override // androidx.room.migration.Migration
            public void migrate(SupportSQLiteDatabase database) {
                database.execSQL("Delete from Member");
                database.execSQL("CREATE TABLE IF NOT EXISTS `Vehicles` (`Vehicle_Number` TEXT NOT NULL, `vehicle_type` INTEGER NOT NULL, `Daily_Contribution` REAL, `Start_Date` TEXT, `Code` TEXT, `Id_Number` TEXT, `Arrears` REAL NOT NULL, `Penalty` REAL NOT NULL, `Fleet_No` TEXT, PRIMARY KEY(`Vehicle_Number`))");
            }
        };
        MIGRATION_2_3 = new Migration(i, 3) { // from class: com.trimline.metrocrew.DB.2
            @Override // androidx.room.migration.Migration
            public void migrate(SupportSQLiteDatabase database) {
                database.execSQL("Delete from Member");
            }
        };
    }
}
