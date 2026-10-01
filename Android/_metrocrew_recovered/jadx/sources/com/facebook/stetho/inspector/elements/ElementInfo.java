package com.facebook.stetho.inspector.elements;

import com.facebook.stetho.common.ListUtil;
import com.facebook.stetho.common.Util;
import java.util.List;
import javax.annotation.Nullable;

/* JADX INFO: loaded from: classes.dex */
public final class ElementInfo {
    public final List<Object> children;
    public final Object element;

    @Nullable
    public final Object parentElement;

    ElementInfo(Object element, @Nullable Object parentElement, List<Object> children) {
        this.element = Util.throwIfNull(element);
        this.parentElement = parentElement;
        this.children = ListUtil.copyToImmutableList(children);
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof ElementInfo)) {
            return false;
        }
        ElementInfo other = (ElementInfo) o;
        return this.element == other.element && this.parentElement == other.parentElement && ListUtil.identityEquals(this.children, other.children);
    }
}
