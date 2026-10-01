package androidx.wear.utils;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
public final class WearTypeHelper {
    static final String CHINA_SYSTEM_FEATURE = "cn.google";

    public static boolean isChinaBuild(Context context) {
        return context.getPackageManager().hasSystemFeature(CHINA_SYSTEM_FEATURE);
    }

    private WearTypeHelper() {
    }
}
