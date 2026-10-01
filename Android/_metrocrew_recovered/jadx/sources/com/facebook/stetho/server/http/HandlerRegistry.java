package com.facebook.stetho.server.http;

import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class HandlerRegistry {
    private final ArrayList<PathMatcher> mPathMatchers = new ArrayList<>();
    private final ArrayList<HttpHandler> mHttpHandlers = new ArrayList<>();

    public synchronized void register(PathMatcher path, HttpHandler handler) {
        this.mPathMatchers.add(path);
        this.mHttpHandlers.add(handler);
    }

    public synchronized boolean unregister(PathMatcher path, HttpHandler handler) {
        int index = this.mPathMatchers.indexOf(path);
        if (index < 0 || handler != this.mHttpHandlers.get(index)) {
            return false;
        }
        this.mPathMatchers.remove(index);
        this.mHttpHandlers.remove(index);
        return true;
    }

    public synchronized HttpHandler lookup(String path) {
        int N = this.mPathMatchers.size();
        for (int i = 0; i < N; i++) {
            if (this.mPathMatchers.get(i).match(path)) {
                return this.mHttpHandlers.get(i);
            }
        }
        return null;
    }
}
