package androidx.wear.ambient;

import android.os.Build;
import com.google.android.wearable.WearableSharedLib;

/* JADX INFO: loaded from: classes.dex */
final class SharedLibraryVersion {
    private SharedLibraryVersion() {
    }

    public static int version() {
        verifySharedLibraryPresent();
        return VersionHolder.VERSION;
    }

    public static void verifySharedLibraryPresent() {
        if (!PresenceHolder.PRESENT) {
            throw new IllegalStateException("Could not find wearable shared library classes. Please add <uses-library android:name=\"com.google.android.wearable\" android:required=\"false\" /> to the application manifest");
        }
    }

    static final class VersionHolder {
        static final int VERSION = getSharedLibVersion(Build.VERSION.SDK_INT);

        static int getSharedLibVersion(int sdkInt) {
            if (sdkInt < 25) {
                return 0;
            }
            return WearableSharedLib.version();
        }

        private VersionHolder() {
        }
    }

    static final class PresenceHolder {
        static final boolean PRESENT = isSharedLibPresent(Build.VERSION.SDK_INT);

        static boolean isSharedLibPresent(int sdkInt) {
            try {
                Class.forName("com.google.android.wearable.compat.WearableActivityController");
                return true;
            } catch (ClassNotFoundException e) {
                return false;
            }
        }

        private PresenceHolder() {
        }
    }
}
