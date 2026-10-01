package com.facebook.stetho.inspector.elements.android;

import android.graphics.Rect;
import android.view.View;
import android.view.ViewGroup;
import com.facebook.stetho.common.Accumulator;
import com.facebook.stetho.common.android.FragmentCompatUtil;
import com.facebook.stetho.inspector.elements.AbstractChainedDescriptor;
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.Map;
import java.util.WeakHashMap;
import javax.annotation.Nullable;

/* JADX INFO: loaded from: classes.dex */
final class ViewGroupDescriptor extends AbstractChainedDescriptor<ViewGroup> implements HighlightableDescriptor<ViewGroup> {
    private final Map<View, Object> mViewToElementMap = Collections.synchronizedMap(new WeakHashMap());

    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    protected /* bridge */ /* synthetic */ void onGetChildren(ViewGroup viewGroup, Accumulator accumulator) {
        onGetChildren2(viewGroup, (Accumulator<Object>) accumulator);
    }

    /* JADX INFO: renamed from: onGetChildren, reason: avoid collision after fix types in other method */
    protected void onGetChildren2(ViewGroup element, Accumulator<Object> children) {
        int N = element.getChildCount();
        for (int i = 0; i < N; i++) {
            View childView = element.getChildAt(i);
            if (isChildVisible(childView)) {
                Object childElement = getElementForView(element, childView);
                children.store(childElement);
            }
        }
    }

    private boolean isChildVisible(View child) {
        return !(child instanceof DocumentHiddenView);
    }

    private Object getElementForView(ViewGroup parentView, View childView) {
        Object value = this.mViewToElementMap.get(childView);
        if (value != null) {
            Object element = getElement(childView, value);
            if (element != null && childView.getParent() == parentView) {
                return element;
            }
            this.mViewToElementMap.remove(childView);
        }
        Object fragment = FragmentCompatUtil.findFragmentForView(childView);
        if (fragment != null && !FragmentCompatUtil.isDialogFragment(fragment)) {
            this.mViewToElementMap.put(childView, new WeakReference(fragment));
            return fragment;
        }
        this.mViewToElementMap.put(childView, this);
        return childView;
    }

    private Object getElement(View childView, Object value) {
        if (value == this) {
            return childView;
        }
        return ((WeakReference) value).get();
    }

    @Override // com.facebook.stetho.inspector.elements.android.HighlightableDescriptor
    @Nullable
    public View getViewAndBoundsForHighlighting(ViewGroup element, Rect bounds) {
        return element;
    }

    @Override // com.facebook.stetho.inspector.elements.android.HighlightableDescriptor
    @Nullable
    public Object getElementToHighlightAtPosition(ViewGroup element, int x, int y, Rect bounds) {
        View hitChild = null;
        for (int i = element.getChildCount() - 1; i >= 0; i--) {
            View childView = element.getChildAt(i);
            if (isChildVisible(childView) && childView.getVisibility() == 0) {
                childView.getHitRect(bounds);
                if (bounds.contains(x, y)) {
                    hitChild = childView;
                    break;
                }
            }
        }
        if (hitChild != null) {
            return hitChild;
        }
        bounds.set(0, 0, element.getWidth(), element.getHeight());
        return element;
    }
}
