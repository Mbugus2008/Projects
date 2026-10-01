package androidx.wear.internal.widget;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
public final class ResourcesUtil {
    public static int getScreenWidthPx(Context context) {
        return context.getResources().getDisplayMetrics().widthPixels;
    }

    public static int getScreenHeightPx(Context context) {
        return context.getResources().getDisplayMetrics().heightPixels;
    }

    public static int getFractionOfScreenPx(Context context, int screenPx, int resId) {
        float marginPercent = context.getResources().getFraction(resId, 1, 1);
        return (int) (screenPx * marginPercent);
    }

    private ResourcesUtil() {
    }
}
