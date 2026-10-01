package com.facebook.stetho.inspector.elements.android;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.Looper;
import com.facebook.stetho.common.Util;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import javax.annotation.Nullable;

/* JADX INFO: loaded from: classes.dex */
public final class ActivityTracker {
    private static final ActivityTracker sInstance = new ActivityTracker();

    @Nullable
    private AutomaticTracker mAutomaticTracker;
    private final ArrayList<WeakReference<Activity>> mActivities = new ArrayList<>();
    private final List<WeakReference<Activity>> mActivitiesUnmodifiable = Collections.unmodifiableList(this.mActivities);
    private final List<Listener> mListeners = new CopyOnWriteArrayList();

    public interface Listener {
        void onActivityAdded(Activity activity);

        void onActivityRemoved(Activity activity);
    }

    public static ActivityTracker get() {
        return sInstance;
    }

    public void registerListener(Listener listener) {
        this.mListeners.add(listener);
    }

    public void unregisterListener(Listener listener) {
        this.mListeners.remove(listener);
    }

    public boolean beginTrackingIfPossible(Application application) {
        if (this.mAutomaticTracker == null) {
            AutomaticTracker automaticTracker = AutomaticTracker.newInstance(application, this);
            automaticTracker.register();
            this.mAutomaticTracker = automaticTracker;
            return true;
        }
        return false;
    }

    public boolean endTracking() {
        if (this.mAutomaticTracker != null) {
            this.mAutomaticTracker.unregister();
            this.mAutomaticTracker = null;
            return true;
        }
        return false;
    }

    public void add(Activity activity) {
        Util.throwIfNull(activity);
        Util.throwIfNot(Looper.myLooper() == Looper.getMainLooper());
        this.mActivities.add(new WeakReference<>(activity));
        for (Listener listener : this.mListeners) {
            listener.onActivityAdded(activity);
        }
    }

    public void remove(Activity activity) {
        Util.throwIfNull(activity);
        Util.throwIfNot(Looper.myLooper() == Looper.getMainLooper());
        if (removeFromWeakList(this.mActivities, activity)) {
            for (Listener listener : this.mListeners) {
                listener.onActivityRemoved(activity);
            }
        }
    }

    private static <T> boolean removeFromWeakList(ArrayList<WeakReference<T>> haystack, T needle) {
        int N = haystack.size();
        for (int i = 0; i < N; i++) {
            T hay = haystack.get(i).get();
            if (hay == needle) {
                haystack.remove(i);
                return true;
            }
        }
        return false;
    }

    public List<WeakReference<Activity>> getActivitiesView() {
        return this.mActivitiesUnmodifiable;
    }

    @Nullable
    public Activity tryGetTopActivity() {
        if (this.mActivitiesUnmodifiable.isEmpty()) {
            return null;
        }
        for (int i = this.mActivitiesUnmodifiable.size() - 1; i >= 0; i--) {
            Activity activity = this.mActivitiesUnmodifiable.get(i).get();
            if (activity != null) {
                return activity;
            }
        }
        return null;
    }

    private static abstract class AutomaticTracker {
        public abstract void register();

        public abstract void unregister();

        private AutomaticTracker() {
        }

        public static AutomaticTracker newInstance(Application application, ActivityTracker tracker) {
            return new AutomaticTrackerICSAndBeyond(application, tracker);
        }

        private static class AutomaticTrackerICSAndBeyond extends AutomaticTracker {
            private final Application mApplication;
            private final Application.ActivityLifecycleCallbacks mLifecycleCallbacks;
            private final ActivityTracker mTracker;

            public AutomaticTrackerICSAndBeyond(Application application, ActivityTracker tracker) {
                super();
                this.mLifecycleCallbacks = new Application.ActivityLifecycleCallbacks() { // from class: com.facebook.stetho.inspector.elements.android.ActivityTracker.AutomaticTracker.AutomaticTrackerICSAndBeyond.1
                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
                        AutomaticTrackerICSAndBeyond.this.mTracker.add(activity);
                    }

                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public void onActivityStarted(Activity activity) {
                    }

                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public void onActivityResumed(Activity activity) {
                    }

                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public void onActivityPaused(Activity activity) {
                    }

                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public void onActivityStopped(Activity activity) {
                    }

                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
                    }

                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public void onActivityDestroyed(Activity activity) {
                        AutomaticTrackerICSAndBeyond.this.mTracker.remove(activity);
                    }
                };
                this.mApplication = application;
                this.mTracker = tracker;
            }

            @Override // com.facebook.stetho.inspector.elements.android.ActivityTracker.AutomaticTracker
            public void register() {
                this.mApplication.registerActivityLifecycleCallbacks(this.mLifecycleCallbacks);
            }

            @Override // com.facebook.stetho.inspector.elements.android.ActivityTracker.AutomaticTracker
            public void unregister() {
                this.mApplication.unregisterActivityLifecycleCallbacks(this.mLifecycleCallbacks);
            }
        }
    }
}
