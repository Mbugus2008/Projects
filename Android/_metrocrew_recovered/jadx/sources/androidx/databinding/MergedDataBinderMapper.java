package androidx.databinding;

import android.util.Log;
import android.view.View;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: loaded from: classes.dex */
public class MergedDataBinderMapper extends DataBinderMapper {
    private static final String TAG = "MergedDataBinderMapper";
    private Set<Class<? extends DataBinderMapper>> mExistingMappers = new HashSet();
    private List<DataBinderMapper> mMappers = new CopyOnWriteArrayList();
    private List<String> mFeatureBindingMappers = new CopyOnWriteArrayList();

    public void addMapper(DataBinderMapper dataBinderMapper) {
        if (this.mExistingMappers.add((Class<? extends DataBinderMapper>) dataBinderMapper.getClass())) {
            this.mMappers.add(dataBinderMapper);
            Iterator<DataBinderMapper> it = dataBinderMapper.collectDependencies().iterator();
            while (it.hasNext()) {
                addMapper(it.next());
            }
        }
    }

    protected void addMapper(String featureMapper) {
        this.mFeatureBindingMappers.add(featureMapper + ".DataBinderMapperImpl");
    }

    @Override // androidx.databinding.DataBinderMapper
    public ViewDataBinding getDataBinder(DataBindingComponent bindingComponent, View view, int layoutId) {
        for (DataBinderMapper mapper : this.mMappers) {
            ViewDataBinding result = mapper.getDataBinder(bindingComponent, view, layoutId);
            if (result != null) {
                return result;
            }
        }
        if (loadFeatures()) {
            return getDataBinder(bindingComponent, view, layoutId);
        }
        return null;
    }

    @Override // androidx.databinding.DataBinderMapper
    public ViewDataBinding getDataBinder(DataBindingComponent bindingComponent, View[] view, int layoutId) {
        for (DataBinderMapper mapper : this.mMappers) {
            ViewDataBinding result = mapper.getDataBinder(bindingComponent, view, layoutId);
            if (result != null) {
                return result;
            }
        }
        if (loadFeatures()) {
            return getDataBinder(bindingComponent, view, layoutId);
        }
        return null;
    }

    @Override // androidx.databinding.DataBinderMapper
    public int getLayoutId(String tag) {
        for (DataBinderMapper mapper : this.mMappers) {
            int result = mapper.getLayoutId(tag);
            if (result != 0) {
                return result;
            }
        }
        if (loadFeatures()) {
            return getLayoutId(tag);
        }
        return 0;
    }

    @Override // androidx.databinding.DataBinderMapper
    public String convertBrIdToString(int id) {
        for (DataBinderMapper mapper : this.mMappers) {
            String result = mapper.convertBrIdToString(id);
            if (result != null) {
                return result;
            }
        }
        if (loadFeatures()) {
            return convertBrIdToString(id);
        }
        return null;
    }

    private boolean loadFeatures() {
        boolean found = false;
        for (String mapper : this.mFeatureBindingMappers) {
            try {
                Class<?> aClass = Class.forName(mapper);
                if (DataBinderMapper.class.isAssignableFrom(aClass)) {
                    addMapper((DataBinderMapper) aClass.newInstance());
                    this.mFeatureBindingMappers.remove(mapper);
                    found = true;
                }
            } catch (ClassNotFoundException e) {
            } catch (IllegalAccessException exception) {
                Log.e(TAG, "unable to add feature mapper for " + mapper, exception);
            } catch (InstantiationException exception2) {
                Log.e(TAG, "unable to add feature mapper for " + mapper, exception2);
            }
        }
        return found;
    }
}
