package com.facebook.stetho.inspector.elements.android;

import android.app.Activity;
import android.app.Application;
import android.view.View;
import com.facebook.stetho.common.Accumulator;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.inspector.elements.AbstractChainedDescriptor;
import com.facebook.stetho.inspector.elements.NodeType;
import com.facebook.stetho.inspector.elements.android.window.WindowRootViewCompat;
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
final class ApplicationDescriptor extends AbstractChainedDescriptor<Application> {
    private final Map<Application, ElementContext> mElementToContextMap = Collections.synchronizedMap(new IdentityHashMap());
    private final ActivityTracker mActivityTracker = ActivityTracker.get();

    ApplicationDescriptor() {
    }

    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    protected /* bridge */ /* synthetic */ void onGetChildren(Application application, Accumulator accumulator) {
        onGetChildren2(application, (Accumulator<Object>) accumulator);
    }

    private ElementContext getContext(Application element) {
        return this.mElementToContextMap.get(element);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    public void onHook(Application element) {
        ElementContext context = new ElementContext();
        context.hook(element);
        this.mElementToContextMap.put(element, context);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    public void onUnhook(Application element) {
        ElementContext context = this.mElementToContextMap.remove(element);
        context.unhook();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    public NodeType onGetNodeType(Application element) {
        return NodeType.ELEMENT_NODE;
    }

    /* JADX INFO: renamed from: onGetChildren, reason: avoid collision after fix types in other method */
    protected void onGetChildren2(Application element, Accumulator<Object> children) {
        ElementContext context = getContext(element);
        List<WeakReference<Activity>> activities = context.getActivitiesList();
        for (int i = activities.size() - 1; i >= 0; i--) {
            Activity activity = activities.get(i).get();
            if (activity != null) {
                children.store(activity);
            }
        }
        storeWindowIfNeeded(element, children, activities);
    }

    private void storeWindowIfNeeded(Application application, Accumulator<Object> children, List<WeakReference<Activity>> activities) {
        List<View> rootViews = WindowRootViewCompat.get(application).getRootViews();
        for (View view : rootViews) {
            if (!isDecorViewOfActivity(view, activities)) {
                children.store(view);
            }
        }
    }

    private static boolean isDecorViewOfActivity(View view, List<WeakReference<Activity>> references) {
        Util.throwIfNull(references);
        for (WeakReference<Activity> reference : references) {
            Activity activity = reference.get();
            if (activity != null && activity.getWindow().getDecorView() == view) {
                return true;
            }
        }
        return false;
    }

    private class ElementContext {
        private Application mElement;
        private final ActivityTracker.Listener mListener = new ActivityTracker.Listener() { // from class: com.facebook.stetho.inspector.elements.android.ApplicationDescriptor.ElementContext.1
            @Override // com.facebook.stetho.inspector.elements.android.ActivityTracker.Listener
            public void onActivityAdded(Activity activity) {
            }

            @Override // com.facebook.stetho.inspector.elements.android.ActivityTracker.Listener
            public void onActivityRemoved(Activity activity) {
            }
        };

        public ElementContext() {
        }

        public void hook(Application element) {
            this.mElement = element;
            ApplicationDescriptor.this.mActivityTracker.registerListener(this.mListener);
        }

        public void unhook() {
            ApplicationDescriptor.this.mActivityTracker.unregisterListener(this.mListener);
            this.mElement = null;
        }

        public List<WeakReference<Activity>> getActivitiesList() {
            return ApplicationDescriptor.this.mActivityTracker.getActivitiesView();
        }
    }
}
