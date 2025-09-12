package com.openvalley.afrecash;

import android.app.Application;
import android.content.Context;
import android.content.res.Configuration;

import com.openvalley.afrecash.utils.TypeFaceUtil;
import com.openvalley.afrecash.utils.TypefaceHelper;
import com.sylversky.fontreplacer.FontReplacer;
import com.sylversky.fontreplacer.Replacer;


/**
 * Created by Geek Nat on 5/16/2016.
 */
public class MyApplication extends Application {

    @Override
    protected void attachBaseContext(Context context) {
        super.attachBaseContext(context);
    }

    @Override
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
    }

    @Override
    public void onCreate() {
        super.onCreate();
        TypefaceHelper.initialize(this);
        TypeFaceUtil.overrideFont(getApplicationContext(), "SERIF", getString(R.string.custom_font));

        Replacer replacer = FontReplacer.Build(getApplicationContext());
        replacer.setDefaultFont(getString(R.string.custom_font));
        replacer.applyFont();
    }

    @Override
    public void onLowMemory() {
        super.onLowMemory();
    }

    @Override
    public void onTerminate() {
        super.onTerminate();
    }


}
