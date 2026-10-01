package com.facebook.stetho.inspector.elements;

import com.facebook.stetho.common.Accumulator;
import com.facebook.stetho.common.Util;
import javax.annotation.Nullable;

/* JADX INFO: loaded from: classes.dex */
public abstract class AbstractChainedDescriptor<E> extends Descriptor<E> implements ChainedDescriptor<E> {
    private Descriptor<? super E> mSuper;

    @Override // com.facebook.stetho.inspector.elements.ChainedDescriptor
    public void setSuper(Descriptor<? super E> superDescriptor) {
        Util.throwIfNull(superDescriptor);
        if (superDescriptor != this.mSuper) {
            if (this.mSuper != null) {
                throw new IllegalStateException();
            }
            this.mSuper = superDescriptor;
        }
    }

    final Descriptor<? super E> getSuper() {
        return this.mSuper;
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final void hook(E element) {
        verifyThreadAccess();
        this.mSuper.hook(element);
        onHook(element);
    }

    protected void onHook(E element) {
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final void unhook(E element) {
        verifyThreadAccess();
        onUnhook(element);
        this.mSuper.unhook(element);
    }

    protected void onUnhook(E element) {
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final NodeType getNodeType(E element) {
        return onGetNodeType(element);
    }

    protected NodeType onGetNodeType(E element) {
        return this.mSuper.getNodeType(element);
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final String getNodeName(E element) {
        return onGetNodeName(element);
    }

    protected String onGetNodeName(E element) {
        return this.mSuper.getNodeName(element);
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final String getLocalName(E element) {
        return onGetLocalName(element);
    }

    protected String onGetLocalName(E element) {
        return this.mSuper.getLocalName(element);
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final String getNodeValue(E element) {
        return onGetNodeValue(element);
    }

    @Nullable
    public String onGetNodeValue(E element) {
        return this.mSuper.getNodeValue(element);
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final void getChildren(E element, Accumulator<Object> children) {
        this.mSuper.getChildren(element, children);
        onGetChildren(element, children);
    }

    protected void onGetChildren(E element, Accumulator<Object> children) {
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final void getAttributes(E element, AttributeAccumulator attributes) {
        this.mSuper.getAttributes(element, attributes);
        onGetAttributes(element, attributes);
    }

    protected void onGetAttributes(E element, AttributeAccumulator attributes) {
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final void setAttributesAsText(E element, String text) {
        onSetAttributesAsText(element, text);
    }

    protected void onSetAttributesAsText(E element, String text) {
        this.mSuper.setAttributesAsText(element, text);
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final void getStyleRuleNames(E element, StyleRuleNameAccumulator accumulator) {
        this.mSuper.getStyleRuleNames(element, accumulator);
        onGetStyleRuleNames(element, accumulator);
    }

    protected void onGetStyleRuleNames(E element, StyleRuleNameAccumulator accumulator) {
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final void getStyles(E element, String ruleName, StyleAccumulator accumulator) {
        this.mSuper.getStyles(element, ruleName, accumulator);
        onGetStyles(element, ruleName, accumulator);
    }

    protected void onGetStyles(E element, String ruleName, StyleAccumulator accumulator) {
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public final void setStyle(E element, String ruleName, String name, String value) {
        this.mSuper.setStyle(element, ruleName, name, value);
        onSetStyle(element, ruleName, name, value);
    }

    protected void onSetStyle(E element, String ruleName, String name, String value) {
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void getComputedStyles(E element, ComputedStyleAccumulator accumulator) {
        this.mSuper.getComputedStyles(element, accumulator);
        onGetComputedStyles(element, accumulator);
    }

    protected void onGetComputedStyles(E element, ComputedStyleAccumulator accumulator) {
    }
}
