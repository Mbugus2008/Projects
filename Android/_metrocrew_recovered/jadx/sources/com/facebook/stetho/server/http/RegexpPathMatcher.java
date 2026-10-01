package com.facebook.stetho.server.http;

import java.util.regex.Pattern;

/* JADX INFO: loaded from: classes.dex */
public class RegexpPathMatcher implements PathMatcher {
    private final Pattern mPattern;

    public RegexpPathMatcher(Pattern pattern) {
        this.mPattern = pattern;
    }

    @Override // com.facebook.stetho.server.http.PathMatcher
    public boolean match(String path) {
        return this.mPattern.matcher(path).matches();
    }
}
