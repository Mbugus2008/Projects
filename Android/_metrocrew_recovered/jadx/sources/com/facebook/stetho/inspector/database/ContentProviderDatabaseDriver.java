package com.facebook.stetho.inspector.database;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteException;
import com.facebook.stetho.inspector.protocol.module.BaseDatabaseDriver;
import com.facebook.stetho.inspector.protocol.module.Database;
import com.facebook.stetho.inspector.protocol.module.DatabaseDescriptor;
import com.facebook.stetho.inspector.protocol.module.DatabaseDriver2;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class ContentProviderDatabaseDriver extends DatabaseDriver2<ContentProviderDatabaseDescriptor> {
    private static final String sDatabaseName = "content-providers";
    private final ContentProviderSchema[] mContentProviderSchemas;
    private List<String> mTableNames;

    @Override // com.facebook.stetho.inspector.protocol.module.BaseDatabaseDriver
    public /* bridge */ /* synthetic */ Database.ExecuteSQLResponse executeSQL(Object obj, String str, BaseDatabaseDriver.ExecuteResultHandler executeResultHandler) throws SQLiteException {
        return executeSQL((ContentProviderDatabaseDescriptor) obj, str, (BaseDatabaseDriver.ExecuteResultHandler<Database.ExecuteSQLResponse>) executeResultHandler);
    }

    public ContentProviderDatabaseDriver(Context context, ContentProviderSchema... contentProviderSchemas) {
        super(context);
        this.mContentProviderSchemas = contentProviderSchemas;
    }

    @Override // com.facebook.stetho.inspector.protocol.module.BaseDatabaseDriver
    public List<ContentProviderDatabaseDescriptor> getDatabaseNames() {
        return Collections.singletonList(new ContentProviderDatabaseDescriptor());
    }

    @Override // com.facebook.stetho.inspector.protocol.module.BaseDatabaseDriver
    public List<String> getTableNames(ContentProviderDatabaseDescriptor databaseDesc) {
        if (this.mTableNames == null) {
            this.mTableNames = new ArrayList();
            for (ContentProviderSchema schema : this.mContentProviderSchemas) {
                this.mTableNames.add(schema.getTableName());
            }
        }
        return this.mTableNames;
    }

    public Database.ExecuteSQLResponse executeSQL(ContentProviderDatabaseDescriptor databaseDesc, String query, BaseDatabaseDriver.ExecuteResultHandler<Database.ExecuteSQLResponse> handler) throws SQLiteException {
        String tableName = fetchTableName(query);
        int index = this.mTableNames.indexOf(tableName);
        ContentProviderSchema contentProviderSchema = this.mContentProviderSchemas[index];
        ContentResolver contentResolver = this.mContext.getContentResolver();
        Cursor cursor = contentResolver.query(contentProviderSchema.getUri(), contentProviderSchema.getProjection(), null, null, null);
        try {
            return handler.handleSelect(cursor);
        } finally {
            cursor.close();
        }
    }

    private String fetchTableName(String query) {
        for (String tableName : this.mTableNames) {
            if (query.contains(tableName)) {
                return tableName;
            }
        }
        return "";
    }

    static class ContentProviderDatabaseDescriptor implements DatabaseDescriptor {
        @Override // com.facebook.stetho.inspector.protocol.module.DatabaseDescriptor
        public String name() {
            return ContentProviderDatabaseDriver.sDatabaseName;
        }
    }
}
