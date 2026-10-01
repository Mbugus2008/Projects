package androidx.wear.ambient;

import android.app.Activity;
import android.os.Bundle;
import com.google.android.wearable.compat.WearableActivityController;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes.dex */
final class AmbientDelegate {
    private final WeakReference<Activity> mActivity;
    private final AmbientCallback mCallback;
    private WearableActivityController mWearableController;
    private final WearableControllerProvider mWearableControllerProvider;

    interface AmbientCallback {
        void onAmbientOffloadInvalidated();

        void onEnterAmbient(Bundle bundle);

        void onExitAmbient();

        void onUpdateAmbient();
    }

    AmbientDelegate(Activity activity, WearableControllerProvider wearableControllerProvider, AmbientCallback callback) {
        this.mActivity = new WeakReference<>(activity);
        this.mCallback = callback;
        this.mWearableControllerProvider = wearableControllerProvider;
    }

    void onCreate() {
        Activity activity = this.mActivity.get();
        if (activity != null) {
            this.mWearableController = this.mWearableControllerProvider.getWearableController(activity, this.mCallback);
        }
        if (this.mWearableController != null) {
            this.mWearableController.onCreate();
        }
    }

    void onResume() {
        if (this.mWearableController != null) {
            this.mWearableController.onResume();
        }
    }

    void onPause() {
        if (this.mWearableController != null) {
            this.mWearableController.onPause();
        }
    }

    void onStop() {
        if (this.mWearableController != null) {
            this.mWearableController.onStop();
        }
    }

    void onDestroy() {
        if (this.mWearableController != null) {
            this.mWearableController.onDestroy();
        }
    }

    void setAmbientEnabled() {
        if (this.mWearableController != null) {
            this.mWearableController.setAmbientEnabled();
        }
    }

    public void setAmbientOffloadEnabled(boolean enabled) {
        if (this.mWearableController != null) {
            this.mWearableController.setAmbientOffloadEnabled(enabled);
        }
    }

    public void setAutoResumeEnabled(boolean enabled) {
        if (this.mWearableController != null) {
            this.mWearableController.setAutoResumeEnabled(enabled);
        }
    }

    boolean isAmbient() {
        if (this.mWearableController != null) {
            return this.mWearableController.isAmbient();
        }
        return false;
    }

    void dump(String prefix, FileDescriptor fd, PrintWriter writer, String[] args) {
        if (this.mWearableController != null) {
            this.mWearableController.dump(prefix, fd, writer, args);
        }
    }
}
