package com.facebook.stetho.server.http;

/* JADX INFO: loaded from: classes.dex */
public class ExactPathMatcher implements PathMatcher {
    private final String mPath;

    public ExactPathMatcher(String path) {
        this.mPath = path;
    }

    @Override // com.facebook.stetho.server.http.PathMatcher
    public boolean match(String path) {
        return this.mPath.equals(path);
    }
}
