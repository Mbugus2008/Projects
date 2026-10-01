package com.facebook.stetho;

import com.facebook.stetho.dumpapp.DumperPlugin;

/* JADX INFO: loaded from: classes.dex */
public interface DumperPluginsProvider {
    Iterable<DumperPlugin> get();
}
