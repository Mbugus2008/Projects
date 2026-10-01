package com.facebook.stetho.inspector.helper;

import android.util.SparseArray;
import java.util.IdentityHashMap;
import java.util.Map;
import javax.annotation.Nullable;

/* JADX INFO: loaded from: classes.dex */
public class ObjectIdMapper {
    protected final Object mSync = new Object();
    private int mNextId = 1;
    private final Map<Object, Integer> mObjectToIdMap = new IdentityHashMap();
    private SparseArray<Object> mIdToObjectMap = new SparseArray<>();

    public void clear() {
        SparseArray<Object> idToObjectMap;
        synchronized (this.mSync) {
            idToObjectMap = this.mIdToObjectMap;
            this.mObjectToIdMap.clear();
            this.mIdToObjectMap = new SparseArray<>();
        }
        int size = idToObjectMap.size();
        for (int i = 0; i < size; i++) {
            int id = idToObjectMap.keyAt(i);
            Object object = idToObjectMap.valueAt(i);
            onUnmapped(object, id);
        }
    }

    public boolean containsId(int id) {
        boolean z;
        synchronized (this.mSync) {
            z = this.mIdToObjectMap.get(id) != null;
        }
        return z;
    }

    public boolean containsObject(Object object) {
        boolean zContainsKey;
        synchronized (this.mSync) {
            zContainsKey = this.mObjectToIdMap.containsKey(object);
        }
        return zContainsKey;
    }

    @Nullable
    public Object getObjectForId(int id) {
        Object obj;
        synchronized (this.mSync) {
            obj = this.mIdToObjectMap.get(id);
        }
        return obj;
    }

    @Nullable
    public Integer getIdForObject(Object object) {
        Integer num;
        synchronized (this.mSync) {
            num = this.mObjectToIdMap.get(object);
        }
        return num;
    }

    public int putObject(Object object) {
        synchronized (this.mSync) {
            Integer id = this.mObjectToIdMap.get(object);
            if (id != null) {
                return id.intValue();
            }
            int i = this.mNextId;
            this.mNextId = i + 1;
            Integer id2 = Integer.valueOf(i);
            this.mObjectToIdMap.put(object, id2);
            this.mIdToObjectMap.put(id2.intValue(), object);
            onMapped(object, id2.intValue());
            return id2.intValue();
        }
    }

    @Nullable
    public Object removeObjectById(int id) {
        synchronized (this.mSync) {
            Object object = this.mIdToObjectMap.get(id);
            if (object == null) {
                return null;
            }
            this.mIdToObjectMap.remove(id);
            this.mObjectToIdMap.remove(object);
            onUnmapped(object, id);
            return object;
        }
    }

    @Nullable
    public Integer removeObject(Object object) {
        synchronized (this.mSync) {
            Integer id = this.mObjectToIdMap.remove(object);
            if (id == null) {
                return null;
            }
            this.mIdToObjectMap.remove(id.intValue());
            onUnmapped(object, id.intValue());
            return id;
        }
    }

    public int size() {
        int size;
        synchronized (this.mSync) {
            size = this.mObjectToIdMap.size();
        }
        return size;
    }

    protected void onMapped(Object object, int id) {
    }

    protected void onUnmapped(Object object, int id) {
    }
}
