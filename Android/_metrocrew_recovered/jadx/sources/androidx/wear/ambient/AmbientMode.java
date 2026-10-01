package androidx.wear.ambient;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import java.io.FileDescriptor;
import java.io.PrintWriter;

/* JADX INFO: loaded from: classes.dex */
@Deprecated
public final class AmbientMode extends Fragment {
    public static final String EXTRA_BURN_IN_PROTECTION = "com.google.android.wearable.compat.extra.BURN_IN_PROTECTION";
    public static final String EXTRA_LOWBIT_AMBIENT = "com.google.android.wearable.compat.extra.LOWBIT_AMBIENT";
    public static final String FRAGMENT_TAG = "android.support.wearable.ambient.AmbientMode";
    private static final String TAG = "AmbientMode";
    private final AmbientDelegate.AmbientCallback mCallback = new AmbientDelegate.AmbientCallback() { // from class: androidx.wear.ambient.AmbientMode.1
        @Override // androidx.wear.ambient.AmbientDelegate.AmbientCallback
        public void onEnterAmbient(Bundle ambientDetails) {
            if (AmbientMode.this.mSuppliedCallback != null) {
                AmbientMode.this.mSuppliedCallback.onEnterAmbient(ambientDetails);
            }
        }

        @Override // androidx.wear.ambient.AmbientDelegate.AmbientCallback
        public void onExitAmbient() {
            if (AmbientMode.this.mSuppliedCallback != null) {
                AmbientMode.this.mSuppliedCallback.onExitAmbient();
            }
        }

        @Override // androidx.wear.ambient.AmbientDelegate.AmbientCallback
        public void onUpdateAmbient() {
            if (AmbientMode.this.mSuppliedCallback != null) {
                AmbientMode.this.mSuppliedCallback.onUpdateAmbient();
            }
        }

        @Override // androidx.wear.ambient.AmbientDelegate.AmbientCallback
        public void onAmbientOffloadInvalidated() {
            if (AmbientMode.this.mSuppliedCallback != null) {
                AmbientMode.this.mSuppliedCallback.onAmbientOffloadInvalidated();
            }
        }
    };
    private AmbientController mController = new AmbientController();
    AmbientDelegate mDelegate;
    AmbientCallback mSuppliedCallback;

    public interface AmbientCallbackProvider {
        AmbientCallback getAmbientCallback();
    }

    public static abstract class AmbientCallback {
        public void onEnterAmbient(Bundle ambientDetails) {
        }

        public void onUpdateAmbient() {
        }

        public void onExitAmbient() {
        }

        public void onAmbientOffloadInvalidated() {
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.app.Fragment
    public void onAttach(Context context) {
        super.onAttach(context);
        this.mDelegate = new AmbientDelegate(getActivity(), new WearableControllerProvider(), this.mCallback);
        if (context instanceof AmbientCallbackProvider) {
            this.mSuppliedCallback = ((AmbientCallbackProvider) context).getAmbientCallback();
        } else {
            Log.w(TAG, "No callback provided - enabling only smart resume");
        }
    }

    @Override // android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.mDelegate.onCreate();
        if (this.mSuppliedCallback != null) {
            this.mDelegate.setAmbientEnabled();
        }
    }

    @Override // android.app.Fragment
    public void onResume() {
        super.onResume();
        this.mDelegate.onResume();
    }

    @Override // android.app.Fragment
    public void onPause() {
        this.mDelegate.onPause();
        super.onPause();
    }

    @Override // android.app.Fragment
    public void onStop() {
        this.mDelegate.onStop();
        super.onStop();
    }

    @Override // android.app.Fragment
    public void onDestroy() {
        this.mDelegate.onDestroy();
        super.onDestroy();
    }

    @Override // android.app.Fragment
    public void onDetach() {
        this.mDelegate = null;
        super.onDetach();
    }

    public static <T extends Activity> AmbientController attachAmbientSupport(T activity) {
        FragmentManager fragmentManager = activity.getFragmentManager();
        AmbientMode ambientFragment = (AmbientMode) fragmentManager.findFragmentByTag("android.support.wearable.ambient.AmbientMode");
        if (ambientFragment == null) {
            AmbientMode fragment = new AmbientMode();
            fragmentManager.beginTransaction().add(fragment, "android.support.wearable.ambient.AmbientMode").commit();
            ambientFragment = fragment;
        }
        return ambientFragment.mController;
    }

    @Override // android.app.Fragment
    public void dump(String prefix, FileDescriptor fd, PrintWriter writer, String[] args) {
        if (this.mDelegate != null) {
            this.mDelegate.dump(prefix, fd, writer, args);
        }
    }

    void setAmbientDelegate(AmbientDelegate delegate) {
        this.mDelegate = delegate;
    }

    public final class AmbientController {
        private static final String TAG = "AmbientController";

        AmbientController() {
        }

        public boolean isAmbient() {
            if (AmbientMode.this.mDelegate == null) {
                return false;
            }
            return AmbientMode.this.mDelegate.isAmbient();
        }

        public void setAmbientOffloadEnabled(boolean enabled) {
            if (AmbientMode.this.mDelegate != null) {
                AmbientMode.this.mDelegate.setAmbientOffloadEnabled(enabled);
            }
        }
    }
}
