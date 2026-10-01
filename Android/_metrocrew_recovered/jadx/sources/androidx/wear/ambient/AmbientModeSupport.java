package androidx.wear.ambient;

import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;
import java.io.FileDescriptor;
import java.io.PrintWriter;

/* JADX INFO: loaded from: classes.dex */
@Deprecated
public final class AmbientModeSupport extends Fragment {
    public static final String EXTRA_BURN_IN_PROTECTION = "com.google.android.wearable.compat.extra.BURN_IN_PROTECTION";
    public static final String EXTRA_LOWBIT_AMBIENT = "com.google.android.wearable.compat.extra.LOWBIT_AMBIENT";
    public static final String FRAGMENT_TAG = "android.support.wearable.ambient.AmbientMode";
    private static final String TAG = "AmbientModeSupport";
    private final AmbientDelegate.AmbientCallback mCallback = new AmbientDelegate.AmbientCallback() { // from class: androidx.wear.ambient.AmbientModeSupport.1
        @Override // androidx.wear.ambient.AmbientDelegate.AmbientCallback
        public void onEnterAmbient(Bundle ambientDetails) {
            if (AmbientModeSupport.this.mSuppliedCallback != null) {
                AmbientModeSupport.this.mSuppliedCallback.onEnterAmbient(ambientDetails);
            }
        }

        @Override // androidx.wear.ambient.AmbientDelegate.AmbientCallback
        public void onExitAmbient() {
            if (AmbientModeSupport.this.mSuppliedCallback != null) {
                AmbientModeSupport.this.mSuppliedCallback.onExitAmbient();
            }
        }

        @Override // androidx.wear.ambient.AmbientDelegate.AmbientCallback
        public void onUpdateAmbient() {
            if (AmbientModeSupport.this.mSuppliedCallback != null) {
                AmbientModeSupport.this.mSuppliedCallback.onUpdateAmbient();
            }
        }

        @Override // androidx.wear.ambient.AmbientDelegate.AmbientCallback
        public void onAmbientOffloadInvalidated() {
            if (AmbientModeSupport.this.mSuppliedCallback != null) {
                AmbientModeSupport.this.mSuppliedCallback.onAmbientOffloadInvalidated();
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
    @Override // androidx.fragment.app.Fragment
    public void onAttach(Context context) {
        super.onAttach(context);
        this.mDelegate = new AmbientDelegate(getActivity(), new WearableControllerProvider(), this.mCallback);
        if (context instanceof AmbientCallbackProvider) {
            this.mSuppliedCallback = ((AmbientCallbackProvider) context).getAmbientCallback();
        } else {
            Log.w(TAG, "No callback provided - enabling only smart resume");
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.mDelegate.onCreate();
        if (this.mSuppliedCallback != null) {
            this.mDelegate.setAmbientEnabled();
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        this.mDelegate.onResume();
    }

    @Override // androidx.fragment.app.Fragment
    public void onPause() {
        this.mDelegate.onPause();
        super.onPause();
    }

    @Override // androidx.fragment.app.Fragment
    public void onStop() {
        this.mDelegate.onStop();
        super.onStop();
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroy() {
        this.mDelegate.onDestroy();
        super.onDestroy();
    }

    @Override // androidx.fragment.app.Fragment
    public void onDetach() {
        this.mDelegate = null;
        super.onDetach();
    }

    public static <T extends FragmentActivity> AmbientController attach(T activity) {
        FragmentManager fragmentManager = activity.getSupportFragmentManager();
        AmbientModeSupport ambientFragment = (AmbientModeSupport) fragmentManager.findFragmentByTag("android.support.wearable.ambient.AmbientMode");
        if (ambientFragment == null) {
            AmbientModeSupport fragment = new AmbientModeSupport();
            fragmentManager.beginTransaction().add(fragment, "android.support.wearable.ambient.AmbientMode").commit();
            ambientFragment = fragment;
        }
        return ambientFragment.mController;
    }

    @Override // androidx.fragment.app.Fragment
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
            if (AmbientModeSupport.this.mDelegate == null) {
                return false;
            }
            return AmbientModeSupport.this.mDelegate.isAmbient();
        }

        public void setAmbientOffloadEnabled(boolean enabled) {
            if (AmbientModeSupport.this.mDelegate != null) {
                AmbientModeSupport.this.mDelegate.setAmbientOffloadEnabled(enabled);
            }
        }

        public void setAutoResumeEnabled(boolean enabled) {
            if (AmbientModeSupport.this.mDelegate != null) {
                AmbientModeSupport.this.mDelegate.setAutoResumeEnabled(enabled);
            }
        }
    }
}
