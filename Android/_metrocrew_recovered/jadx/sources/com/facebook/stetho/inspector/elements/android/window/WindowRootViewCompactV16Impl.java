package com.facebook.stetho.inspector.elements.android.window;

import android.content.Context;
import android.view.View;
import android.view.WindowManager;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
class WindowRootViewCompactV16Impl extends WindowRootViewCompat {
    private Context mContext;

    WindowRootViewCompactV16Impl(Context context) {
        this.mContext = context;
    }

    @Override // com.facebook.stetho.inspector.elements.android.window.WindowRootViewCompat
    public List<View> getRootViews() {
        WindowManager windowManager = (WindowManager) this.mContext.getSystemService("window");
        Object wm = getOuter(windowManager);
        return getWindowViews(wm);
    }

    private static Object getOuter(Object innerWM) {
        try {
            Field parentField = innerWM.getClass().getDeclaredField("mWindowManager");
            parentField.setAccessible(true);
            Object outerWM = parentField.get(innerWM);
            parentField.setAccessible(false);
            return outerWM;
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (NoSuchFieldException e2) {
            throw new RuntimeException(e2);
        }
    }

    private static List<View> getWindowViews(Object windowManager) {
        try {
            Field field = windowManager.getClass().getDeclaredField("mViews");
            field.setAccessible(true);
            return Collections.unmodifiableList(Arrays.asList((View[]) field.get(windowManager)));
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (NoSuchFieldException e2) {
            throw new RuntimeException(e2);
        }
    }
}
