package com.facebook.stetho.dumpapp;

/* JADX INFO: loaded from: classes.dex */
public interface DumperPlugin {
    void dump(DumperContext dumperContext) throws DumpException;

    String getName();
}
