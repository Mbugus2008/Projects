package com.facebook.stetho.inspector.elements;

import com.facebook.stetho.common.Accumulator;

/* JADX INFO: loaded from: classes.dex */
public final class ObjectDescriptor extends Descriptor<Object> {
    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void hook(Object element) {
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void unhook(Object element) {
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public NodeType getNodeType(Object element) {
        return NodeType.ELEMENT_NODE;
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public String getNodeName(Object element) {
        return element.getClass().getName();
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public String getLocalName(Object element) {
        return getNodeName(element);
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public String getNodeValue(Object element) {
        return null;
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void getChildren(Object element, Accumulator<Object> children) {
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void getAttributes(Object element, AttributeAccumulator attributes) {
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void setAttributesAsText(Object element, String text) {
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void getStyleRuleNames(Object element, StyleRuleNameAccumulator accumulator) {
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void getStyles(Object element, String ruleName, StyleAccumulator accumulator) {
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void setStyle(Object element, String ruleName, String name, String value) {
    }

    @Override // com.facebook.stetho.inspector.elements.NodeDescriptor
    public void getComputedStyles(Object element, ComputedStyleAccumulator accumulator) {
    }
}
