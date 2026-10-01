package com.facebook.stetho.common.android;

import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.HorizontalScrollView;
import android.widget.ScrollView;
import android.widget.Spinner;
import androidx.core.view.ViewCompat;
import androidx.core.view.accessibility.AccessibilityNodeInfoCompat;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class AccessibilityUtil {
    private AccessibilityUtil() {
    }

    public static boolean hasText(AccessibilityNodeInfoCompat node) {
        if (node == null) {
            return false;
        }
        return (TextUtils.isEmpty(node.getText()) && TextUtils.isEmpty(node.getContentDescription())) ? false : true;
    }

    public static boolean isSpeakingNode(AccessibilityNodeInfoCompat node, View view) {
        int important;
        if (node == null || view == null || !node.isVisibleToUser() || (important = ViewCompat.getImportantForAccessibility(view)) == 4 || (important == 2 && node.getChildCount() <= 0)) {
            return false;
        }
        return node.isCheckable() || hasText(node) || hasNonActionableSpeakingDescendants(node, view);
    }

    public static boolean hasNonActionableSpeakingDescendants(AccessibilityNodeInfoCompat node, View view) {
        if (node == null || view == null || !(view instanceof ViewGroup)) {
            return false;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        int count = viewGroup.getChildCount();
        for (int i = 0; i < count; i++) {
            View childView = viewGroup.getChildAt(i);
            if (childView != null) {
                AccessibilityNodeInfoCompat childNode = AccessibilityNodeInfoCompat.obtain();
                try {
                    ViewCompat.onInitializeAccessibilityNodeInfo(childView, childNode);
                    if (isAccessibilityFocusable(childNode, childView)) {
                        childNode.recycle();
                    } else {
                        if (isSpeakingNode(childNode, childView)) {
                            return true;
                        }
                        childNode.recycle();
                    }
                } finally {
                    childNode.recycle();
                }
            }
        }
        return false;
    }

    public static boolean isAccessibilityFocusable(AccessibilityNodeInfoCompat node, View view) {
        if (node == null || view == null || !node.isVisibleToUser()) {
            return false;
        }
        if (isActionableForAccessibility(node)) {
            return true;
        }
        return isTopLevelScrollItem(node, view) && isSpeakingNode(node, view);
    }

    public static boolean isTopLevelScrollItem(AccessibilityNodeInfoCompat node, View view) {
        View parent;
        if (node == null || view == null || (parent = (View) ViewCompat.getParentForAccessibility(view)) == null) {
            return false;
        }
        if (node.isScrollable()) {
            return true;
        }
        List<AccessibilityNodeInfoCompat.AccessibilityActionCompat> actionList = node.getActionList();
        if (actionList.contains(4096) || actionList.contains(8192)) {
            return true;
        }
        if (parent instanceof Spinner) {
            return false;
        }
        return (parent instanceof AdapterView) || (parent instanceof ScrollView) || (parent instanceof HorizontalScrollView);
    }

    public static boolean isActionableForAccessibility(AccessibilityNodeInfoCompat node) {
        if (node == null) {
            return false;
        }
        if (node.isClickable() || node.isLongClickable() || node.isFocusable()) {
            return true;
        }
        List<AccessibilityNodeInfoCompat.AccessibilityActionCompat> actionList = node.getActionList();
        return actionList.contains(16) || actionList.contains(32) || actionList.contains(1);
    }

    public static boolean hasFocusableAncestor(AccessibilityNodeInfoCompat node, View view) {
        if (node == null || view == null) {
            return false;
        }
        Object parentForAccessibility = ViewCompat.getParentForAccessibility(view);
        if (!(parentForAccessibility instanceof View)) {
            return false;
        }
        AccessibilityNodeInfoCompat parentNode = AccessibilityNodeInfoCompat.obtain();
        try {
            ViewCompat.onInitializeAccessibilityNodeInfo((View) parentForAccessibility, parentNode);
            if (parentNode == null) {
                parentNode.recycle();
                return false;
            }
            if (isAccessibilityFocusable(parentNode, (View) parentForAccessibility)) {
                parentNode.recycle();
                return true;
            }
            if (hasFocusableAncestor(parentNode, (View) parentForAccessibility)) {
                parentNode.recycle();
                return true;
            }
            parentNode.recycle();
            return false;
        } catch (Throwable th) {
            parentNode.recycle();
            throw th;
        }
    }
}
