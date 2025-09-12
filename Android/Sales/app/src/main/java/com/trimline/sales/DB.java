package com.trimline.sales;

import android.content.Context;

import androidx.room.Database;
import androidx.room.Room;
import androidx.room.RoomDatabase;
import androidx.room.TypeConverters;
import androidx.room.migration.Migration;
import androidx.sqlite.db.SupportSQLiteDatabase;

@Database(entities = {item.class,
        Sales_invoice.class,
        Sales_invoice_lines.class
},
        version = 5,
        exportSchema = false)
    @TypeConverters({Converters.DateConverter.class
    })
    public abstract class DB extends RoomDatabase {
    public abstract item.dao iDao();
    public abstract Sales_invoice_lines.dao slDao();
    public abstract Sales_invoice.dao sDao();
    private static DB instance;

    public static synchronized DB getInstance(Context context) {
        if (instance == null) {
            instance = Room.databaseBuilder(context.getApplicationContext(),
                    DB.class, "Sales")
                    .fallbackToDestructiveMigration()
                    .addMigrations(MIGRATION_2_3

                    )
                    .build();
        }
        return instance;
    }

    static final Migration MIGRATION_2_3 = new Migration(2, 3) {
        @Override
        public void migrate(SupportSQLiteDatabase database) {


        }
    };

}
