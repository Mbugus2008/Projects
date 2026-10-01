package androidx.wear.utils;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;

/* JADX INFO: loaded from: classes.dex */
public class MetadataConstants {
    public static final String NOTIFICATION_BRIDGE_MODE_BRIDGING = "BRIDGING";
    public static final String NOTIFICATION_BRIDGE_MODE_METADATA_NAME = "com.google.android.wearable.notificationBridgeMode";
    public static final String NOTIFICATION_BRIDGE_MODE_NO_BRIDGING = "NO_BRIDGING";
    public static final String STANDALONE_METADATA_NAME = "com.google.android.wearable.standalone";
    public static final String WATCH_FACE_PREVIEW_CIRCULAR_METADATA_NAME = "com.google.android.wearable.watchface.preview_circular";
    public static final String WATCH_FACE_PREVIEW_METADATA_NAME = "com.google.android.wearable.watchface.preview";

    public static boolean isStandalone(Context context) {
        try {
            ApplicationInfo appInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(), 128);
            if (appInfo.metaData != null) {
                return appInfo.metaData.getBoolean(STANDALONE_METADATA_NAME);
            }
            return false;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }

    public static boolean isNotificationBridgingEnabled(Context context) {
        try {
            ApplicationInfo appInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(), 128);
            if (appInfo.metaData != null) {
                return NOTIFICATION_BRIDGE_MODE_BRIDGING.equals(appInfo.metaData.getString(NOTIFICATION_BRIDGE_MODE_METADATA_NAME));
            }
            return true;
        } catch (PackageManager.NameNotFoundException e) {
            return true;
        }
    }

    public static int getPreviewDrawableResourceId(Context context, boolean circular) {
        try {
            ApplicationInfo appInfo = context.getPackageManager().getApplicationInfo(context.getPackageName(), 128);
            if (appInfo.metaData != null) {
                return circular ? appInfo.metaData.getInt(WATCH_FACE_PREVIEW_CIRCULAR_METADATA_NAME, 0) : appInfo.metaData.getInt(WATCH_FACE_PREVIEW_METADATA_NAME, 0);
            }
        } catch (PackageManager.NameNotFoundException e) {
        }
        return 0;
    }

    private MetadataConstants() {
    }
}
