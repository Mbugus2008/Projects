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
public final class DependencyDao_Impl implements DependencyDao {
    private final RoomDatabase __db;
    private final EntityInsertionAdapter<Dependency> __insertionAdapterOfDependency;

    public DependencyDao_Impl(final RoomDatabase __db) {
        this.__db = __db;
        this.__insertionAdapterOfDependency = new EntityInsertionAdapter<Dependency>(__db) { // from class: androidx.work.impl.model.DependencyDao_Impl.1
            @Override // androidx.room.SharedSQLiteStatement
            protected String createQuery() {
                return "INSERT OR IGNORE INTO `Dependency` (`work_spec_id`,`prerequisite_id`) VALUES (?,?)";
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // androidx.room.EntityInsertionAdapter
            public void bind(final SupportSQLiteStatement statement, final Dependency entity) {
                statement.bindString(1, entity.getWorkSpecId());
                statement.bindString(2, entity.getPrerequisiteId());
            }
        };
    }

    @Override // androidx.work.impl.model.DependencyDao
    public void insertDependency(final Dependency dependency) {
        this.__db.assertNotSuspendingTransaction();
        this.__db.beginTransaction();
        try {
            this.__insertionAdapterOfDependency.insert(dependency);
            this.__db.setTransactionSuccessful();
        } finally {
            this.__db.endTransaction();
        }
    }

    @Override // androidx.work.impl.model.DependencyDao
    public boolean hasCompletedAllPrerequisites(final String id) {
        boolean _result = true;
        RoomSQLiteQuery _statement = RoomSQLiteQuery.acquire("SELECT COUNT(*)=0 FROM dependency WHERE work_spec_id=? AND prerequisite_id IN (SELECT id FROM workspec WHERE state!=2)", 1);
        _statement.bindString(1, id);
        this.__db.assertNotSuspendingTransaction();
        Cursor _cursor = DBUtil.query(this.__db, _statement, false, null);
        try {
            if (_cursor.moveToFirst()) {
                int _tmp = _cursor.getInt(0);
                if (_tmp == 0) {
                    _result = false;
                }
            } else {
                _result = false;
            }
            return _result;
        } finally {
            _cursor.close();
            _statement.release();
        }
    }

    @Override // androidx.work.impl.model.DependencyDao
    public List<String> getPrerequisites(final String id) {
        RoomSQLiteQuery _statement = RoomSQLiteQuery.acquire("SELECT prerequisite_id FROM dependency WHERE work_spec_id=?", 1);
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

    @Override // androidx.work.impl.model.DependencyDao
    public List<String> getDependentWorkIds(final String id) {
        RoomSQLiteQuery _statement = RoomSQLiteQuery.acquire("SELECT work_spec_id FROM dependency WHERE prerequisite_id=?", 1);
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

    @Override // androidx.work.impl.model.DependencyDao
    public boolean hasDependents(final String id) {
        boolean _result = true;
        RoomSQLiteQuery _statement = RoomSQLiteQuery.acquire("SELECT COUNT(*)>0 FROM dependency WHERE prerequisite_id=?", 1);
        _statement.bindString(1, id);
        this.__db.assertNotSuspendingTransaction();
        Cursor _cursor = DBUtil.query(this.__db, _statement, false, null);
        try {
            if (_cursor.moveToFirst()) {
                int _tmp = _cursor.getInt(0);
                if (_tmp == 0) {
                    _result = false;
                }
            } else {
                _result = false;
            }
            return _result;
        } finally {
            _cursor.close();
            _statement.release();
        }
    }

    public static List<Class<?>> getRequiredConverters() {
        return Collections.emptyList();
    }
}
