package com.facebook.stetho.inspector.database;

import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import java.io.File;

/* JADX INFO: loaded from: classes.dex */
public class DefaultDatabaseConnectionProvider implements DatabaseConnectionProvider {
    @Override // com.facebook.stetho.inspector.database.DatabaseConnectionProvider
    public SQLiteDatabase openDatabase(File databaseFile) throws SQLiteException {
        return performOpen(databaseFile, determineOpenOptions(databaseFile));
    }

    protected int determineOpenOptions(File databaseFile) {
        File walFile = new File(databaseFile.getParent(), databaseFile.getName() + "-wal");
        if (!walFile.exists()) {
            return 0;
        }
        int flags = 0 | 1;
        return flags;
    }

    protected SQLiteDatabase performOpen(File databaseFile, int options) {
        SQLiteDatabaseCompat compatInstance = SQLiteDatabaseCompat.getInstance();
        int flags = 0 | compatInstance.provideOpenFlags(options);
        SQLiteDatabase db = SQLiteDatabase.openDatabase(databaseFile.getAbsolutePath(), null, flags);
        compatInstance.enableFeatures(options, db);
        return db;
    }
}
