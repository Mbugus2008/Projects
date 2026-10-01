package com.facebook.stetho.inspector.elements.android.window;

import android.content.Context;
import android.view.View;
import com.facebook.stetho.common.Util;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public abstract class WindowRootViewCompat {
    private static WindowRootViewCompat sInstance;

    public abstract List<View> getRootViews();

    public static WindowRootViewCompat get(Context context) {
        if (sInstance != null) {
            return sInstance;
        }
        Util.throwIfNull(context);
        sInstance = new WindowRootViewCompactV19Impl();
        return sInstance;
    }
}
