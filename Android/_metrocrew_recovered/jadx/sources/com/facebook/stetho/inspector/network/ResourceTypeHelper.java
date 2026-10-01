package com.facebook.stetho.inspector.network;

import com.facebook.stetho.inspector.protocol.module.Page;

/* JADX INFO: loaded from: classes.dex */
public class ResourceTypeHelper {
    private final MimeMatcher<Page.ResourceType> mMimeMatcher = new MimeMatcher<>();

    public ResourceTypeHelper() {
        this.mMimeMatcher.addRule("text/css", Page.ResourceType.STYLESHEET);
        this.mMimeMatcher.addRule("image/*", Page.ResourceType.IMAGE);
        this.mMimeMatcher.addRule("application/x-javascript", Page.ResourceType.SCRIPT);
        this.mMimeMatcher.addRule("text/javascript", Page.ResourceType.XHR);
        this.mMimeMatcher.addRule("application/json", Page.ResourceType.XHR);
        this.mMimeMatcher.addRule("text/*", Page.ResourceType.DOCUMENT);
        this.mMimeMatcher.addRule("*", Page.ResourceType.OTHER);
    }

    public Page.ResourceType determineResourceType(String contentType) {
        String mimeType = stripContentExtras(contentType);
        return this.mMimeMatcher.match(mimeType);
    }

    public String stripContentExtras(String contentType) {
        int index = contentType.indexOf(59);
        return index >= 0 ? contentType.substring(0, index) : contentType;
    }
}
