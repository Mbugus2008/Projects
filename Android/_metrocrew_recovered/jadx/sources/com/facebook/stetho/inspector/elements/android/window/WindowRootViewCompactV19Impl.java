package com.facebook.stetho.inspector.elements.android.window;

import android.view.View;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
class WindowRootViewCompactV19Impl extends WindowRootViewCompat {
    private List<View> mRootViews;

    WindowRootViewCompactV19Impl() {
        try {
            Class<?> cls = Class.forName("android.view.WindowManagerGlobal");
            Method getInstanceMethod = cls.getDeclaredMethod("getInstance", new Class[0]);
            Object managerGlobal = getInstanceMethod.invoke(cls, new Object[0]);
            Field mViewsField = cls.getDeclaredField("mViews");
            mViewsField.setAccessible(true);
            this.mRootViews = (List) mViewsField.get(managerGlobal);
            mViewsField.setAccessible(false);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e2) {
            throw new RuntimeException(e2);
        } catch (NoSuchFieldException e3) {
            throw new RuntimeException(e3);
        } catch (NoSuchMethodException e4) {
            throw new RuntimeException(e4);
        } catch (InvocationTargetException e5) {
            throw new RuntimeException(e5);
        }
    }

    @Override // com.facebook.stetho.inspector.elements.android.window.WindowRootViewCompat
    public List<View> getRootViews() {
        return Collections.unmodifiableList(this.mRootViews);
    }
}
