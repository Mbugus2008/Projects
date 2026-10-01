package com.facebook.stetho.inspector.database;

import android.database.sqlite.SQLiteDatabase;

/* JADX INFO: loaded from: classes.dex */
public abstract class SQLiteDatabaseCompat {
    public static final int ENABLE_FOREIGN_KEY_CONSTRAINTS = 2;
    public static final int ENABLE_WRITE_AHEAD_LOGGING = 1;
    private static final SQLiteDatabaseCompat sInstance = new JellyBeanAndBeyondImpl();

    public @interface SQLiteOpenOptions {
    }

    public abstract void enableFeatures(int i, SQLiteDatabase sQLiteDatabase);

    public abstract int provideOpenFlags(int i);

    public static SQLiteDatabaseCompat getInstance() {
        return sInstance;
    }

    private static class JellyBeanAndBeyondImpl extends SQLiteDatabaseCompat {
        private JellyBeanAndBeyondImpl() {
        }

        @Override // com.facebook.stetho.inspector.database.SQLiteDatabaseCompat
        public int provideOpenFlags(int openOptions) {
            if ((openOptions & 1) != 0) {
                int openFlags = 0 | 536870912;
                return openFlags;
            }
            return 0;
        }

        @Override // com.facebook.stetho.inspector.database.SQLiteDatabaseCompat
        public void enableFeatures(int openOptions, SQLiteDatabase db) {
            if ((openOptions & 2) != 0) {
                db.setForeignKeyConstraintsEnabled(true);
            }
        }
    }

    private static class IceCreamSandwichImpl extends SQLiteDatabaseCompat {
        private IceCreamSandwichImpl() {
        }

        @Override // com.facebook.stetho.inspector.database.SQLiteDatabaseCompat
        public int provideOpenFlags(int openOptions) {
            return 0;
        }

        @Override // com.facebook.stetho.inspector.database.SQLiteDatabaseCompat
        public void enableFeatures(int openOptions, SQLiteDatabase db) {
            if ((openOptions & 1) != 0) {
                db.enableWriteAheadLogging();
            }
            if ((openOptions & 2) != 0) {
                db.execSQL("PRAGMA foreign_keys = ON");
            }
        }
    }
}
