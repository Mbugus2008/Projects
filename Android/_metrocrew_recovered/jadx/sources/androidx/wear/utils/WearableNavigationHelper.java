package androidx.wear.utils;

import android.R;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;

/* JADX INFO: loaded from: classes.dex */
public final class WearableNavigationHelper {
    private static final String ITEM_NAME = "config_windowSwipeToDismiss";
    private static final String ITEM_TYPE = "bool";
    private static final String PACKAGE_NAME = "android";

    private WearableNavigationHelper() {
    }

    public static boolean isSwipeToDismissEnabled() {
        Resources res = Resources.getSystem();
        int identifier = res.getIdentifier(ITEM_NAME, ITEM_TYPE, PACKAGE_NAME);
        if (identifier != 0) {
            return res.getBoolean(identifier);
        }
        return false;
    }

    public static boolean isSwipeToDismissEnabled(Context context) {
        TypedArray windowAttr = context.obtainStyledAttributes(new int[]{R.attr.windowSwipeToDismiss});
        boolean enabled = false;
        if (windowAttr.getIndexCount() > 0) {
            enabled = windowAttr.getBoolean(0, true);
        }
        windowAttr.recycle();
        return enabled;
    }
}
