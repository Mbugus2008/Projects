package androidx.work.impl.model;

import android.database.Cursor;
import androidx.room.EntityInsertionAdapter;
import androidx.room.RoomDatabase;
import androidx.room.RoomSQLiteQuery;
import androidx.room.util.DBUtil;
import androidx.sqlite.db.SupportSQLiteStatement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class WorkNameDao_Impl implements WorkNameDao {
    private final RoomDatabase __db;
    private final EntityInsertionAdapter<WorkName> __insertionAdapterOfWorkName;

    public WorkNameDao_Impl(final RoomDatabase __db) {
        this.__db = __db;
        this.__insertionAdapterOfWorkName = new EntityInsertionAdapter<WorkName>(__db) { // from class: androidx.work.impl.model.WorkNameDao_Impl.1
            @Override // androidx.room.SharedSQLiteStatement
            protected String createQuery() {
                return "INSERT OR IGNORE INTO `WorkName` (`name`,`work_spec_id`) VALUES (?,?)";
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // androidx.room.EntityInsertionAdapter
            public void bind(final SupportSQLiteStatement statement, final WorkName entity) {
                statement.bindString(1, entity.getName());
                statement.bindString(2, entity.getWorkSpecId());
            }
        };
    }

    @Override // androidx.work.impl.model.WorkNameDao
    public void insert(final WorkName workName) {
        this.__db.assertNotSuspendingTransaction();
        this.__db.beginTransaction();
        try {
            this.__insertionAdapterOfWorkName.insert(workName);
            this.__db.setTransactionSuccessful();
        } finally {
            this.__db.endTransaction();
        }
    }

    @Override // androidx.work.impl.model.WorkNameDao
    public List<String> getWorkSpecIdsWithName(final String name) {
        RoomSQLiteQuery _statement = RoomSQLiteQuery.acquire("SELECT work_spec_id FROM workname WHERE name=?", 1);
        _statement.bindString(1, name);
        this.__db.assertNotSuspendingTransaction();
        Cursor _cursor = DBUtil.query(this.__db, _statement, false, null);
        try {
            List<String> _result = new ArrayList<>(_cursor.getCount());
            while (_cursor.moveToNext()) {
                String _item = _cursor.getString(0);
                _result.add(_item);
            }
            _cursor.close();
            _statement.release();
            return _result;
        } catch (Throwable th) {
            _cursor.close();
            _statement.release();
            throw th;
        }
    }

    @Override // androidx.work.impl.model.WorkNameDao
    public List<String> getNamesForWorkSpecId(final String workSpecId) {
        RoomSQLiteQuery _statement = RoomSQLiteQuery.acquire("SELECT name FROM workname WHERE work_spec_id=?", 1);
        _statement.bindString(1, workSpecId);
        this.__db.assertNotSuspendingTransaction();
        Cursor _cursor = DBUtil.query(this.__db, _statement, false, null);
        try {
            List<String> _result = new ArrayList<>(_cursor.getCount());
            while (_cursor.moveToNext()) {
                String _item = _cursor.getString(0);
                _result.add(_item);
            }
            _cursor.close();
            _statement.release();
            return _result;
        } catch (Throwable th) {
            _cursor.close();
            _statement.release();
            throw th;
        }
    }

    public static List<Class<?>> getRequiredConverters() {
        return Collections.emptyList();
    }
}
