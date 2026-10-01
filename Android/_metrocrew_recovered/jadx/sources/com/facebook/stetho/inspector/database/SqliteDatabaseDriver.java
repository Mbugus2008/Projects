package com.facebook.stetho.inspector.database;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteStatement;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.inspector.protocol.module.BaseDatabaseDriver;
import com.facebook.stetho.inspector.protocol.module.Database;
import com.facebook.stetho.inspector.protocol.module.DatabaseDescriptor;
import com.facebook.stetho.inspector.protocol.module.DatabaseDriver2;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public class SqliteDatabaseDriver extends DatabaseDriver2<SqliteDatabaseDescriptor> {
    private static final String[] UNINTERESTING_FILENAME_SUFFIXES = {"-journal", "-shm", "-uid", "-wal"};
    private final DatabaseConnectionProvider mDatabaseConnectionProvider;
    private final DatabaseFilesProvider mDatabaseFilesProvider;

    @Override // com.facebook.stetho.inspector.protocol.module.BaseDatabaseDriver
    public /* bridge */ /* synthetic */ Database.ExecuteSQLResponse executeSQL(Object obj, String str, BaseDatabaseDriver.ExecuteResultHandler executeResultHandler) throws SQLiteException {
        return executeSQL((SqliteDatabaseDescriptor) obj, str, (BaseDatabaseDriver.ExecuteResultHandler<Database.ExecuteSQLResponse>) executeResultHandler);
    }

    @Deprecated
    public SqliteDatabaseDriver(Context context) {
        this(context, new DefaultDatabaseFilesProvider(context), new DefaultDatabaseConnectionProvider());
    }

    @Deprecated
    public SqliteDatabaseDriver(Context context, DatabaseFilesProvider databaseFilesProvider) {
        this(context, databaseFilesProvider, new DefaultDatabaseConnectionProvider());
    }

    public SqliteDatabaseDriver(Context context, DatabaseFilesProvider databaseFilesProvider, DatabaseConnectionProvider databaseConnectionProvider) {
        super(context);
        this.mDatabaseFilesProvider = databaseFilesProvider;
        this.mDatabaseConnectionProvider = databaseConnectionProvider;
    }

    @Override // com.facebook.stetho.inspector.protocol.module.BaseDatabaseDriver
    public List<SqliteDatabaseDescriptor> getDatabaseNames() {
        ArrayList<SqliteDatabaseDescriptor> databases = new ArrayList<>();
        List<File> potentialDatabaseFiles = this.mDatabaseFilesProvider.getDatabaseFiles();
        Collections.sort(potentialDatabaseFiles);
        Iterable<File> tidiedList = tidyDatabaseList(potentialDatabaseFiles);
        for (File database : tidiedList) {
            databases.add(new SqliteDatabaseDescriptor(database));
        }
        return databases;
    }

    static List<File> tidyDatabaseList(List<File> databaseFiles) {
        Set<File> originalAsSet = new HashSet<>(databaseFiles);
        List<File> tidiedList = new ArrayList<>();
        for (File databaseFile : databaseFiles) {
            String databaseFilename = databaseFile.getPath();
            String sansSuffix = removeSuffix(databaseFilename, UNINTERESTING_FILENAME_SUFFIXES);
            if (sansSuffix.equals(databaseFilename) || !originalAsSet.contains(new File(sansSuffix))) {
                tidiedList.add(databaseFile);
            }
        }
        return tidiedList;
    }

    private static String removeSuffix(String str, String[] suffixesToRemove) {
        for (String suffix : suffixesToRemove) {
            if (str.endsWith(suffix)) {
                return str.substring(0, str.length() - suffix.length());
            }
        }
        return str;
    }

    @Override // com.facebook.stetho.inspector.protocol.module.BaseDatabaseDriver
    public List<String> getTableNames(SqliteDatabaseDescriptor databaseDesc) throws SQLiteException {
        SQLiteDatabase database = openDatabase(databaseDesc);
        try {
            Cursor cursor = database.rawQuery("SELECT name FROM sqlite_master WHERE type IN (?, ?)", new String[]{"table", "view"});
            try {
                List<String> tableNames = new ArrayList<>();
                while (cursor.moveToNext()) {
                    tableNames.add(cursor.getString(0));
                }
                cursor.close();
                database.close();
                return tableNames;
            } catch (Throwable th) {
                cursor.close();
                throw th;
            }
        } catch (Throwable th2) {
            database.close();
            throw th2;
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code duplicated, block: B:5:0x0019  */
    public Database.ExecuteSQLResponse executeSQL(SqliteDatabaseDescriptor databaseDesc, String query, BaseDatabaseDriver.ExecuteResultHandler<Database.ExecuteSQLResponse> handler) throws SQLiteException {
        Util.throwIfNull(query);
        Util.throwIfNull(handler);
        SQLiteDatabase database = openDatabase(databaseDesc);
        try {
            String firstWordUpperCase = getFirstWord(query).toUpperCase();
            switch (firstWordUpperCase) {
                case "UPDATE":
                case "DELETE":
                    return (Database.ExecuteSQLResponse) executeUpdateDelete(database, query, handler);
                case "INSERT":
                    return (Database.ExecuteSQLResponse) executeInsert(database, query, handler);
                case "SELECT":
                case "PRAGMA":
                case "EXPLAIN":
                    return (Database.ExecuteSQLResponse) executeSelect(database, query, handler);
                default:
                    return (Database.ExecuteSQLResponse) executeRawQuery(database, query, handler);
            }
        } finally {
            database.close();
        }
    }

    private static String getFirstWord(String s) {
        String s2 = s.trim();
        int firstSpace = s2.indexOf(32);
        return firstSpace >= 0 ? s2.substring(0, firstSpace) : s2;
    }

    private <T> T executeUpdateDelete(SQLiteDatabase database, String query, BaseDatabaseDriver.ExecuteResultHandler<T> handler) {
        SQLiteStatement statement = database.compileStatement(query);
        int count = statement.executeUpdateDelete();
        return handler.handleUpdateDelete(count);
    }

    private <T> T executeInsert(SQLiteDatabase database, String query, BaseDatabaseDriver.ExecuteResultHandler<T> handler) {
        SQLiteStatement statement = database.compileStatement(query);
        long count = statement.executeInsert();
        return handler.handleInsert(count);
    }

    private <T> T executeSelect(SQLiteDatabase database, String query, BaseDatabaseDriver.ExecuteResultHandler<T> handler) {
        Cursor cursor = database.rawQuery(query, null);
        try {
            return handler.handleSelect(cursor);
        } finally {
            cursor.close();
        }
    }

    private <T> T executeRawQuery(SQLiteDatabase database, String query, BaseDatabaseDriver.ExecuteResultHandler<T> handler) {
        database.execSQL(query);
        return handler.handleRawQuery();
    }

    private SQLiteDatabase openDatabase(SqliteDatabaseDescriptor databaseDesc) throws SQLiteException {
        Util.throwIfNull(databaseDesc);
        return this.mDatabaseConnectionProvider.openDatabase(databaseDesc.file);
    }

    static class SqliteDatabaseDescriptor implements DatabaseDescriptor {
        public final File file;

        public SqliteDatabaseDescriptor(File file) {
            this.file = file;
        }

        @Override // com.facebook.stetho.inspector.protocol.module.DatabaseDescriptor
        public String name() {
            return this.file.getName();
        }
    }
}
