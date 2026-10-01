package androidx.work.impl.model;

import android.database.Cursor;
import androidx.room.EntityInsertionAdapter;
import androidx.room.RoomDatabase;
import androidx.room.RoomSQLiteQuery;
import androidx.room.SharedSQLiteStatement;
import androidx.room.util.DBUtil;
import androidx.sqlite.db.SupportSQLiteStatement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class WorkTagDao_Impl implements WorkTagDao {
    private final RoomDatabase __db;
    private final EntityInsertionAdapter<WorkTag> __insertionAdapterOfWorkTag;
    private final SharedSQLiteStatement __preparedStmtOfDeleteByWorkSpecId;

    public WorkTagDao_Impl(final RoomDatabase __db) {
        this.__db = __db;
        this.__insertionAdapterOfWorkTag = new EntityInsertionAdapter<WorkTag>(__db) { // from class: androidx.work.impl.model.WorkTagDao_Impl.1
            @Override // androidx.room.SharedSQLiteStatement
            protected String createQuery() {
                return "INSERT OR IGNORE INTO `WorkTag` (`tag`,`work_spec_id`) VALUES (?,?)";
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // androidx.room.EntityInsertionAdapter
            public void bind(final SupportSQLiteStatement statement, final WorkTag entity) {
                statement.bindString(1, entity.getTag());
                statement.bindString(2, entity.getWorkSpecId());
            }
        };
        this.__preparedStmtOfDeleteByWorkSpecId = new SharedSQLiteStatement(__db) { // from class: androidx.work.impl.model.WorkTagDao_Impl.2
            @Override // androidx.room.SharedSQLiteStatement
            public String createQuery() {
                return "DELETE FROM worktag WHERE work_spec_id=?";
            }
        };
    }

    @Override // androidx.work.impl.model.WorkTagDao
    public void insert(final WorkTag workTag) {
        this.__db.assertNotSuspendingTransaction();
        this.__db.beginTransaction();
        try {
            this.__insertionAdapterOfWorkTag.insert(workTag);
            this.__db.setTransactionSuccessful();
        } finally {
            this.__db.endTransaction();
        }
    }

    @Override // androidx.work.impl.model.WorkTagDao
    public void deleteByWorkSpecId(final String id) {
        this.__db.assertNotSuspendingTransaction();
        SupportSQLiteStatement _stmt = this.__preparedStmtOfDeleteByWorkSpecId.acquire();
        _stmt.bindString(1, id);
        try {
            this.__db.beginTransaction();
            try {
                _stmt.executeUpdateDelete();
                this.__db.setTransactionSuccessful();
                this.__db.endTransaction();
                this.__preparedStmtOfDeleteByWorkSpecId.release(_stmt);
            } catch (Throwable th) {
                this.__db.endTransaction();
                throw th;
            }
        } catch (Throwable th2) {
            this.__preparedStmtOfDeleteByWorkSpecId.release(_stmt);
            throw th2;
        }
    }

    @Override // androidx.work.impl.model.WorkTagDao
    public List<String> getWorkSpecIdsWithTag(final String tag) {
        RoomSQLiteQuery _statement = RoomSQLiteQuery.acquire("SELECT work_spec_id FROM worktag WHERE tag=?", 1);
        _statement.bindString(1, tag);
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

    @Override // androidx.work.impl.model.WorkTagDao
    public List<String> getTagsForWorkSpecId(final String id) {
        RoomSQLiteQuery _statement = RoomSQLiteQuery.acquire("SELECT DISTINCT tag FROM worktag WHERE work_spec_id=?", 1);
        _statement.bindString(1, id);
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
