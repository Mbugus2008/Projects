package com.trimline.metrocrew;

import android.util.SparseArray;
import android.util.SparseIntArray;
import android.view.View;
import androidx.databinding.DataBinderMapper;
import androidx.databinding.DataBindingComponent;
import androidx.databinding.ViewDataBinding;
import com.trimline.metrocrew.databinding.MembersImpl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public class DataBinderMapperImpl extends DataBinderMapper {
    private static final SparseIntArray INTERNAL_LAYOUT_ID_LOOKUP = new SparseIntArray(1);
    private static final int LAYOUT_ACTIVITYADDEDITMEMBER = 1;

    static {
        INTERNAL_LAYOUT_ID_LOOKUP.put(R.layout.activity_add_edit_member, 1);
    }

    @Override // androidx.databinding.DataBinderMapper
    public ViewDataBinding getDataBinder(DataBindingComponent component, View view, int layoutId) {
        int localizedLayoutId = INTERNAL_LAYOUT_ID_LOOKUP.get(layoutId);
        if (localizedLayoutId > 0) {
            Object tag = view.getTag();
            if (tag == null) {
                throw new RuntimeException("view must have a tag");
            }
            switch (localizedLayoutId) {
                case 1:
                    if ("layout/activity_add_edit_member_0".equals(tag)) {
                        return new MembersImpl(component, view);
                    }
                    throw new IllegalArgumentException("The tag for activity_add_edit_member is invalid. Received: " + tag);
                default:
                    return null;
            }
        }
        return null;
    }

    @Override // androidx.databinding.DataBinderMapper
    public ViewDataBinding getDataBinder(DataBindingComponent component, View[] views, int layoutId) {
        if (views == null || views.length == 0) {
            return null;
        }
        int localizedLayoutId = INTERNAL_LAYOUT_ID_LOOKUP.get(layoutId);
        if (localizedLayoutId > 0) {
            Object tag = views[0].getTag();
            if (tag == null) {
                throw new RuntimeException("view must have a tag");
            }
        }
        return null;
    }

    @Override // androidx.databinding.DataBinderMapper
    public int getLayoutId(String tag) {
        Integer tmpVal;
        if (tag == null || (tmpVal = InnerLayoutIdLookup.sKeys.get(tag)) == null) {
            return 0;
        }
        return tmpVal.intValue();
    }

    @Override // androidx.databinding.DataBinderMapper
    public String convertBrIdToString(int localId) {
        String tmpVal = InnerBrLookup.sKeys.get(localId);
        return tmpVal;
    }

    @Override // androidx.databinding.DataBinderMapper
    public List<DataBinderMapper> collectDependencies() {
        ArrayList<DataBinderMapper> result = new ArrayList<>(1);
        result.add(new androidx.databinding.library.baseAdapters.DataBinderMapperImpl());
        return result;
    }

    private static class InnerBrLookup {
        static final SparseArray<String> sKeys = new SparseArray<>(2);

        private InnerBrLookup() {
        }

        static {
            sKeys.put(0, "_all");
            sKeys.put(1, "d");
        }
    }

    private static class InnerLayoutIdLookup {
        static final HashMap<String, Integer> sKeys = new HashMap<>(1);

        private InnerLayoutIdLookup() {
        }

        static {
            sKeys.put("layout/activity_add_edit_member_0", Integer.valueOf(R.layout.activity_add_edit_member));
        }
    }
}
