package com.facebook.stetho.inspector.elements.android;

import android.text.Editable;
import android.text.TextWatcher;
import android.widget.TextView;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.inspector.elements.AbstractChainedDescriptor;
import com.facebook.stetho.inspector.elements.AttributeAccumulator;
import java.util.Collections;
import java.util.IdentityHashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
final class TextViewDescriptor extends AbstractChainedDescriptor<TextView> {
    private static final String TEXT_ATTRIBUTE_NAME = "text";
    private final Map<TextView, ElementContext> mElementToContextMap = Collections.synchronizedMap(new IdentityHashMap());

    TextViewDescriptor() {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    public void onHook(TextView element) {
        ElementContext context = new ElementContext();
        context.hook(element);
        this.mElementToContextMap.put(element, context);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    public void onUnhook(TextView element) {
        ElementContext context = this.mElementToContextMap.remove(element);
        context.unhook();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    public void onGetAttributes(TextView element, AttributeAccumulator attributes) {
        CharSequence text = element.getText();
        if (text != null && text.length() != 0) {
            attributes.store(TEXT_ATTRIBUTE_NAME, text.toString());
        }
    }

    private final class ElementContext implements TextWatcher {
        private TextView mElement;

        private ElementContext() {
        }

        public void hook(TextView element) {
            this.mElement = (TextView) Util.throwIfNull(element);
            this.mElement.addTextChangedListener(this);
        }

        public void unhook() {
            if (this.mElement != null) {
                this.mElement.removeTextChangedListener(this);
                this.mElement = null;
            }
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence s, int start, int before, int count) {
        }

        @Override // android.text.TextWatcher
        public void afterTextChanged(Editable s) {
            if (s.length() == 0) {
                TextViewDescriptor.this.getHost().onAttributeRemoved(this.mElement, TextViewDescriptor.TEXT_ATTRIBUTE_NAME);
            } else {
                TextViewDescriptor.this.getHost().onAttributeModified(this.mElement, TextViewDescriptor.TEXT_ATTRIBUTE_NAME, s.toString());
            }
        }
    }
}
