package com.facebook.stetho.inspector.elements.android;

import android.app.Application;
import com.facebook.stetho.common.Accumulator;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.inspector.elements.AbstractChainedDescriptor;
import com.facebook.stetho.inspector.elements.NodeType;

/* JADX INFO: loaded from: classes.dex */
final class AndroidDocumentRoot extends AbstractChainedDescriptor<AndroidDocumentRoot> {
    private final Application mApplication;

    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    protected /* bridge */ /* synthetic */ void onGetChildren(AndroidDocumentRoot androidDocumentRoot, Accumulator accumulator) {
        onGetChildren2(androidDocumentRoot, (Accumulator<Object>) accumulator);
    }

    public AndroidDocumentRoot(Application application) {
        this.mApplication = (Application) Util.throwIfNull(application);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    public NodeType onGetNodeType(AndroidDocumentRoot element) {
        return NodeType.DOCUMENT_NODE;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    public String onGetNodeName(AndroidDocumentRoot element) {
        return "root";
    }

    /* JADX INFO: renamed from: onGetChildren, reason: avoid collision after fix types in other method */
    protected void onGetChildren2(AndroidDocumentRoot element, Accumulator<Object> children) {
        children.store(this.mApplication);
    }
}
