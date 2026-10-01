package com.facebook.stetho.common.android;

import android.content.res.Resources;
import com.facebook.stetho.common.LogUtil;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import kotlinx.coroutines.scheduling.WorkQueueKt;

/* JADX INFO: loaded from: classes.dex */
public class ResourcesUtil {
    private ResourcesUtil() {
    }

    @Nonnull
    public static String getIdStringQuietly(Object idContext, @Nullable Resources r, int resourceId) {
        try {
            return getIdString(r, resourceId);
        } catch (Resources.NotFoundException e) {
            String idString = getFallbackIdString(resourceId);
            LogUtil.w("Unknown identifier encountered on " + idContext + ": " + idString);
            return idString;
        }
    }

    public static String getIdString(@Nullable Resources r, int resourceId) throws Resources.NotFoundException {
        String prefix;
        String prefixSeparator;
        if (r == null) {
            return getFallbackIdString(resourceId);
        }
        switch (getResourcePackageId(resourceId)) {
            case WorkQueueKt.MASK /* 127 */:
                prefix = "";
                prefixSeparator = "";
                break;
            default:
                prefix = r.getResourcePackageName(resourceId);
                prefixSeparator = ":";
                break;
        }
        String typeName = r.getResourceTypeName(resourceId);
        String entryName = r.getResourceEntryName(resourceId);
        StringBuilder sb = new StringBuilder(prefix.length() + 1 + prefixSeparator.length() + typeName.length() + 1 + entryName.length());
        sb.append("@");
        sb.append(prefix);
        sb.append(prefixSeparator);
        sb.append(typeName);
        sb.append("/");
        sb.append(entryName);
        return sb.toString();
    }

    private static String getFallbackIdString(int resourceId) {
        return "#" + Integer.toHexString(resourceId);
    }

    private static int getResourcePackageId(int id) {
        return (id >>> 24) & 255;
    }
}
