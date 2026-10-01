package androidx.wear.widget;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
final class ResourcesUtil {
    static int getScreenWidthPx(Context context) {
        return context.getResources().getDisplayMetrics().widthPixels;
    }

    static int getScreenHeightPx(Context context) {
        return context.getResources().getDisplayMetrics().heightPixels;
    }

    static int getFractionOfScreenPx(Context context, int screenPx, int resId) {
        float marginPercent = context.getResources().getFraction(resId, 1, 1);
        return (int) (screenPx * marginPercent);
    }

    private ResourcesUtil() {
    }
}
