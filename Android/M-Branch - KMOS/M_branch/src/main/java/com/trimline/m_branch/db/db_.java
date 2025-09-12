package com.trimline.m_branch.db;

import android.content.Context;

import androidx.room.Database;
import androidx.room.Room;
import androidx.room.RoomDatabase;
import androidx.room.TypeConverters;

import com.trimline.m_branch.agent;
import com.trimline.m_branch.db.converters.Converters;
import com.trimline.m_branch.db.dao.d_vehicle;
import com.trimline.m_branch.db.dao.d_transaction;
import com.trimline.m_branch.db.dao.d_agent;
import com.trimline.m_branch.db.dao.d_member;
import com.trimline.m_branch.members.member;
import com.trimline.m_branch.transaction;
import com.trimline.m_branch.types;
import com.trimline.m_branch.vehicles.vehicles;

@Database(entities = {
        member.class,
        vehicles.class,
        transaction.class,
        agent.class,
        types.class
},
        version = 1,
        exportSchema = false)
@TypeConverters({Converters.DateConverter.class})
public abstract class db_  extends RoomDatabase {

    public abstract d_vehicle d_vehicle();
    public abstract d_agent  d_agent();
    public abstract d_member d_member();
    public abstract d_transaction d_transaction();
    private static db_ instance;

    public static synchronized db_ getInstance(Context context) {

        if (instance == null) {
            instance = Room.databaseBuilder(context.getApplicationContext(),
                            db_.class, "MBranch")
                    .fallbackToDestructiveMigration()
                    //.addMigrations(MIGRATION_1_2)
                    .build();
        }
        return instance;
    }

}
