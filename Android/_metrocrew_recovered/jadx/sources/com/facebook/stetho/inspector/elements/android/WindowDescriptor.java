package com.facebook.stetho.inspector.elements.android;

import android.graphics.Rect;
import android.view.View;
import android.view.Window;
import com.facebook.stetho.common.Accumulator;
import com.facebook.stetho.inspector.elements.AbstractChainedDescriptor;
import com.facebook.stetho.inspector.elements.Descriptor;
import javax.annotation.Nullable;

/* JADX INFO: loaded from: classes.dex */
final class WindowDescriptor extends AbstractChainedDescriptor<Window> implements HighlightableDescriptor<Window> {
    WindowDescriptor() {
    }

    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    protected /* bridge */ /* synthetic */ void onGetChildren(Window window, Accumulator accumulator) {
        onGetChildren2(window, (Accumulator<Object>) accumulator);
    }

    /* JADX INFO: renamed from: onGetChildren, reason: avoid collision after fix types in other method */
    protected void onGetChildren2(Window element, Accumulator<Object> children) {
        View decorView = element.peekDecorView();
        if (decorView != null) {
            children.store(decorView);
        }
    }

    @Override // com.facebook.stetho.inspector.elements.android.HighlightableDescriptor
    @Nullable
    public View getViewAndBoundsForHighlighting(Window element, Rect bounds) {
        return element.peekDecorView();
    }

    @Override // com.facebook.stetho.inspector.elements.android.HighlightableDescriptor
    @Nullable
    public Object getElementToHighlightAtPosition(Window element, int x, int y, Rect bounds) {
        Descriptor.Host host = getHost();
        View view = null;
        HighlightableDescriptor descriptor = null;
        if (host instanceof AndroidDescriptorHost) {
            view = element.peekDecorView();
            descriptor = ((AndroidDescriptorHost) host).getHighlightableDescriptor(view);
        }
        if (descriptor == null) {
            return null;
        }
        return descriptor.getElementToHighlightAtPosition(view, x, y, bounds);
    }
}
