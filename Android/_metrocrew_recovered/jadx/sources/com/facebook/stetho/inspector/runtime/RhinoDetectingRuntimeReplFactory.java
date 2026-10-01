package com.facebook.stetho.inspector.runtime;

import android.content.Context;
import com.facebook.stetho.common.LogUtil;
import com.facebook.stetho.inspector.console.RuntimeRepl;
import com.facebook.stetho.inspector.console.RuntimeReplFactory;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* JADX INFO: loaded from: classes.dex */
public class RhinoDetectingRuntimeReplFactory implements RuntimeReplFactory {
    private final Context mContext;
    private RuntimeException mRhinoJsUnexpectedError;
    private RuntimeReplFactory mRhinoReplFactory;
    private boolean mSearchedForRhinoJs;

    public RhinoDetectingRuntimeReplFactory(Context context) {
        this.mContext = context;
    }

    @Override // com.facebook.stetho.inspector.console.RuntimeReplFactory
    public RuntimeRepl newInstance() {
        if (!this.mSearchedForRhinoJs) {
            this.mSearchedForRhinoJs = true;
            try {
                this.mRhinoReplFactory = findRhinoReplFactory(this.mContext);
            } catch (RuntimeException e) {
                this.mRhinoJsUnexpectedError = e;
            }
        }
        if (this.mRhinoReplFactory != null) {
            return this.mRhinoReplFactory.newInstance();
        }
        return new RuntimeRepl() { // from class: com.facebook.stetho.inspector.runtime.RhinoDetectingRuntimeReplFactory.1
            @Override // com.facebook.stetho.inspector.console.RuntimeRepl
            public Object evaluate(String expression) throws Exception {
                if (RhinoDetectingRuntimeReplFactory.this.mRhinoJsUnexpectedError != null) {
                    return "stetho-js-rhino threw: " + RhinoDetectingRuntimeReplFactory.this.mRhinoJsUnexpectedError.toString();
                }
                return "Not supported without stetho-js-rhino dependency";
            }
        };
    }

    private static RuntimeReplFactory findRhinoReplFactory(Context context) throws RuntimeException {
        try {
            Class<?> jsRuntimeReplFactory = Class.forName("com.facebook.stetho.rhino.JsRuntimeReplFactoryBuilder");
            Method defaultFactoryMethod = jsRuntimeReplFactory.getDeclaredMethod("defaultFactory", Context.class);
            return (RuntimeReplFactory) defaultFactoryMethod.invoke(null, context);
        } catch (ClassNotFoundException e) {
            LogUtil.i("Error finding stetho-js-rhino, cannot enable console evaluation!");
            return null;
        } catch (IllegalAccessException e2) {
            throw new RuntimeException(e2);
        } catch (NoSuchMethodException e3) {
            throw new RuntimeException(e3);
        } catch (InvocationTargetException e4) {
            throw new RuntimeException(e4);
        }
    }
}
