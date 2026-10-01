package androidx.wear.ambient;

import android.app.Activity;
import android.os.Bundle;
import com.google.android.wearable.compat.WearableActivityController;
import java.lang.reflect.Method;

/* JADX INFO: loaded from: classes.dex */
public class WearableControllerProvider {
    private static final String TAG = "WearableControllerProvider";
    private static volatile boolean sAmbientCallbacksVerifiedPresent;

    public WearableActivityController getWearableController(Activity activity, final AmbientDelegate.AmbientCallback callback) {
        SharedLibraryVersion.verifySharedLibraryPresent();
        WearableActivityController.AmbientCallback callbackBridge = new WearableActivityController.AmbientCallback() { // from class: androidx.wear.ambient.WearableControllerProvider.1
            public void onEnterAmbient(Bundle ambientDetails) {
                callback.onEnterAmbient(ambientDetails);
            }

            public void onUpdateAmbient() {
                callback.onUpdateAmbient();
            }

            public void onExitAmbient() {
                callback.onExitAmbient();
            }

            public void onInvalidateAmbientOffload() {
                callback.onAmbientOffloadInvalidated();
            }
        };
        verifyAmbientCallbacksPresent();
        return new WearableActivityController(TAG, activity, callbackBridge);
    }

    private static void verifyAmbientCallbacksPresent() {
        if (sAmbientCallbacksVerifiedPresent) {
            return;
        }
        try {
            Method method = WearableActivityController.AmbientCallback.class.getDeclaredMethod("onEnterAmbient", Bundle.class);
            if (!".onEnterAmbient".equals("." + method.getName())) {
                throw new NoSuchMethodException();
            }
            sAmbientCallbacksVerifiedPresent = true;
        } catch (NoSuchMethodException e) {
            throw new IllegalStateException("Could not find a required method for ambient support, likely due to proguard optimization. Please add com.google.android.wearable:wearable jar to the list of library jars for your project");
        }
    }
}
