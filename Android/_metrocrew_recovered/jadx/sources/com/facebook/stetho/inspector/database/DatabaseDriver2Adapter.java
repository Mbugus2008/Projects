package com.facebook.stetho.inspector.database;

import android.database.sqlite.SQLiteException;
import com.facebook.stetho.inspector.protocol.module.BaseDatabaseDriver;
import com.facebook.stetho.inspector.protocol.module.Database;
import com.facebook.stetho.inspector.protocol.module.DatabaseDescriptor;
import com.facebook.stetho.inspector.protocol.module.DatabaseDriver2;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
@Deprecated
public class DatabaseDriver2Adapter extends DatabaseDriver2<StringDatabaseDescriptor> {
    private final Database.DatabaseDriver mLegacy;

    public DatabaseDriver2Adapter(Database.DatabaseDriver legacy) {
        super(legacy.getContext());
        this.mLegacy = legacy;
    }

    @Override // com.facebook.stetho.inspector.protocol.module.BaseDatabaseDriver
    public List<StringDatabaseDescriptor> getDatabaseNames() {
        List<?> names = this.mLegacy.getDatabaseNames();
        List<StringDatabaseDescriptor> descriptors = new ArrayList<>(names.size());
        for (Object name : names) {
            descriptors.add(new StringDatabaseDescriptor(name.toString()));
        }
        return descriptors;
    }

    @Override // com.facebook.stetho.inspector.protocol.module.BaseDatabaseDriver
    public List<String> getTableNames(StringDatabaseDescriptor database) {
        return this.mLegacy.getTableNames(database.name);
    }

    @Override // com.facebook.stetho.inspector.protocol.module.BaseDatabaseDriver
    public Database.ExecuteSQLResponse executeSQL(StringDatabaseDescriptor database, String query, BaseDatabaseDriver.ExecuteResultHandler handler) throws SQLiteException {
        return this.mLegacy.executeSQL(database.name, query, handler);
    }

    static class StringDatabaseDescriptor implements DatabaseDescriptor {
        public final String name;

        public StringDatabaseDescriptor(String name) {
            this.name = name;
        }

        @Override // com.facebook.stetho.inspector.protocol.module.DatabaseDescriptor
        public String name() {
            return this.name;
        }
    }
}
