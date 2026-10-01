package com.facebook.stetho.inspector.database;

import android.content.Context;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class DefaultDatabaseFilesProvider implements DatabaseFilesProvider {
    private final Context mContext;

    public DefaultDatabaseFilesProvider(Context context) {
        this.mContext = context;
    }

    @Override // com.facebook.stetho.inspector.database.DatabaseFilesProvider
    public List<File> getDatabaseFiles() {
        List<File> databaseFiles = new ArrayList<>();
        for (String databaseName : this.mContext.databaseList()) {
            databaseFiles.add(this.mContext.getDatabasePath(databaseName));
        }
        return databaseFiles;
    }
}
