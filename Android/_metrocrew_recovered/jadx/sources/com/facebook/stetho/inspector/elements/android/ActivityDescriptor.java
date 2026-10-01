package com.facebook.stetho.inspector.elements.android;

import android.app.Activity;
import android.graphics.Rect;
import android.view.View;
import android.view.Window;
import com.facebook.stetho.common.Accumulator;
import com.facebook.stetho.common.StringUtil;
import com.facebook.stetho.common.android.FragmentActivityAccessor;
import com.facebook.stetho.common.android.FragmentCompat;
import com.facebook.stetho.common.android.FragmentManagerAccessor;
import com.facebook.stetho.inspector.elements.AbstractChainedDescriptor;
import com.facebook.stetho.inspector.elements.Descriptor;
import java.util.List;
import javax.annotation.Nullable;

/* JADX INFO: loaded from: classes.dex */
final class ActivityDescriptor extends AbstractChainedDescriptor<Activity> implements HighlightableDescriptor<Activity> {
    ActivityDescriptor() {
    }

    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    protected /* bridge */ /* synthetic */ void onGetChildren(Activity activity, Accumulator accumulator) {
        onGetChildren2(activity, (Accumulator<Object>) accumulator);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    public String onGetNodeName(Activity element) {
        String className = element.getClass().getName();
        return StringUtil.removePrefix(className, "android.app.");
    }

    /* JADX INFO: renamed from: onGetChildren, reason: avoid collision after fix types in other method */
    protected void onGetChildren2(Activity element, Accumulator<Object> children) {
        getDialogFragments(FragmentCompat.getSupportLibInstance(), element, children);
        getDialogFragments(FragmentCompat.getFrameworkInstance(), element, children);
        Window window = element.getWindow();
        if (window != null) {
            children.store(window);
        }
    }

    @Override // com.facebook.stetho.inspector.elements.android.HighlightableDescriptor
    @Nullable
    public View getViewAndBoundsForHighlighting(Activity element, Rect bounds) {
        Descriptor.Host host = getHost();
        Window window = null;
        HighlightableDescriptor descriptor = null;
        if (host instanceof AndroidDescriptorHost) {
            window = element.getWindow();
            descriptor = ((AndroidDescriptorHost) host).getHighlightableDescriptor(window);
        }
        if (descriptor == null) {
            return null;
        }
        return descriptor.getViewAndBoundsForHighlighting(window, bounds);
    }

    @Override // com.facebook.stetho.inspector.elements.android.HighlightableDescriptor
    @Nullable
    public Object getElementToHighlightAtPosition(Activity element, int x, int y, Rect bounds) {
        Descriptor.Host host = getHost();
        Window window = null;
        HighlightableDescriptor descriptor = null;
        if (host instanceof AndroidDescriptorHost) {
            window = element.getWindow();
            descriptor = ((AndroidDescriptorHost) host).getHighlightableDescriptor(window);
        }
        if (descriptor == null) {
            return null;
        }
        return descriptor.getElementToHighlightAtPosition(window, x, y, bounds);
    }

    private static void getDialogFragments(@Nullable FragmentCompat compat, Activity activity, Accumulator<Object> accumulator) {
        if (compat == null || !compat.getFragmentActivityClass().isInstance(activity)) {
            return;
        }
        FragmentActivityAccessor activityAccessor = compat.forFragmentActivity();
        Object fragmentManager = activityAccessor.getFragmentManager(activity);
        if (fragmentManager == null) {
            return;
        }
        FragmentManagerAccessor fragmentManagerAccessor = compat.forFragmentManager2();
        List<Object> addedFragments = fragmentManagerAccessor.getAddedFragments(fragmentManager);
        if (addedFragments == null) {
            return;
        }
        int N = addedFragments.size();
        for (int i = 0; i < N; i++) {
            Object fragment = addedFragments.get(i);
            if (compat.getDialogFragmentClass().isInstance(fragment)) {
                accumulator.store(fragment);
            }
        }
    }
}
