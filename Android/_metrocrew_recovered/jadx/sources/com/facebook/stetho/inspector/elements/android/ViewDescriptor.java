package com.facebook.stetho.inspector.elements.android;

import android.graphics.Rect;
import android.view.View;
import android.view.ViewDebug;
import com.facebook.stetho.common.ExceptionUtil;
import com.facebook.stetho.common.LogUtil;
import com.facebook.stetho.common.ReflectionUtil;
import com.facebook.stetho.common.StringUtil;
import com.facebook.stetho.common.android.ResourcesUtil;
import com.facebook.stetho.inspector.elements.AbstractChainedDescriptor;
import com.facebook.stetho.inspector.elements.AttributeAccumulator;
import com.facebook.stetho.inspector.elements.ComputedStyleAccumulator;
import com.facebook.stetho.inspector.elements.StyleAccumulator;
import com.facebook.stetho.inspector.elements.StyleRuleNameAccumulator;
import com.facebook.stetho.inspector.helper.IntegerFormatter;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import javax.annotation.Nullable;

/* JADX INFO: loaded from: classes.dex */
final class ViewDescriptor extends AbstractChainedDescriptor<View> implements HighlightableDescriptor<View> {
    private static final String ACCESSIBILITY_STYLE_RULE_NAME = "Accessibility Properties";
    private static final String ID_NAME = "id";
    private static final String NONE_MAPPING = "<no mapping>";
    private static final String NONE_VALUE = "(none)";
    private static final String VIEW_STYLE_RULE_NAME = "<this_view>";
    private static final boolean sHasSupportNodeInfo;
    private final MethodInvoker mMethodInvoker;

    @Nullable
    private volatile List<ViewCSSProperty> mViewProperties;

    @Nullable
    private Pattern mWordBoundaryPattern;

    static {
        sHasSupportNodeInfo = ReflectionUtil.tryGetClassForName("androidx.core.view.accessibility.AccessibilityNodeInfoCompat") != null;
    }

    private Pattern getWordBoundaryPattern() {
        if (this.mWordBoundaryPattern == null) {
            this.mWordBoundaryPattern = Pattern.compile("(?<=\\p{Lower})(?=\\p{Upper})");
        }
        return this.mWordBoundaryPattern;
    }

    private List<ViewCSSProperty> getViewProperties() {
        if (this.mViewProperties == null) {
            synchronized (this) {
                if (this.mViewProperties == null) {
                    List<ViewCSSProperty> props = new ArrayList<>();
                    for (Method method : View.class.getDeclaredMethods()) {
                        ViewDebug.ExportedProperty annotation = (ViewDebug.ExportedProperty) method.getAnnotation(ViewDebug.ExportedProperty.class);
                        if (annotation != null) {
                            props.add(new MethodBackedCSSProperty(method, convertViewPropertyNameToCSSName(method.getName()), annotation));
                        }
                    }
                    for (Field field : View.class.getDeclaredFields()) {
                        ViewDebug.ExportedProperty annotation2 = (ViewDebug.ExportedProperty) field.getAnnotation(ViewDebug.ExportedProperty.class);
                        if (annotation2 != null) {
                            props.add(new FieldBackedCSSProperty(field, convertViewPropertyNameToCSSName(field.getName()), annotation2));
                        }
                    }
                    Collections.sort(props, new Comparator<ViewCSSProperty>() { // from class: com.facebook.stetho.inspector.elements.android.ViewDescriptor.1
                        @Override // java.util.Comparator
                        public int compare(ViewCSSProperty lhs, ViewCSSProperty rhs) {
                            return lhs.getCSSName().compareTo(rhs.getCSSName());
                        }
                    });
                    this.mViewProperties = Collections.unmodifiableList(props);
                }
            }
        }
        return this.mViewProperties;
    }

    public ViewDescriptor() {
        this(new MethodInvoker());
    }

    public ViewDescriptor(MethodInvoker methodInvoker) {
        this.mMethodInvoker = methodInvoker;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    public String onGetNodeName(View element) {
        String className = element.getClass().getName();
        return StringUtil.removePrefix(className, "android.view.", StringUtil.removePrefix(className, "android.widget."));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    public void onGetAttributes(View element, AttributeAccumulator attributes) {
        String id = getIdAttribute(element);
        if (id != null) {
            attributes.store(ID_NAME, id);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    public void onSetAttributesAsText(View element, String text) {
        Map<String, String> attributeToValueMap = parseSetAttributesAsTextArg(text);
        for (Map.Entry<String, String> entry : attributeToValueMap.entrySet()) {
            String methodName = "set" + capitalize(entry.getKey());
            String propertyValue = entry.getValue();
            this.mMethodInvoker.invoke(element, methodName, propertyValue);
        }
    }

    @Nullable
    private static String getIdAttribute(View element) {
        int id = element.getId();
        if (id == -1) {
            return null;
        }
        return ResourcesUtil.getIdStringQuietly(element, element.getResources(), id);
    }

    @Override // com.facebook.stetho.inspector.elements.android.HighlightableDescriptor
    @Nullable
    public View getViewAndBoundsForHighlighting(View element, Rect bounds) {
        return element;
    }

    @Override // com.facebook.stetho.inspector.elements.android.HighlightableDescriptor
    @Nullable
    public Object getElementToHighlightAtPosition(View element, int x, int y, Rect bounds) {
        bounds.set(0, 0, element.getWidth(), element.getHeight());
        return element;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    public void onGetStyleRuleNames(View element, StyleRuleNameAccumulator accumulator) {
        accumulator.store(VIEW_STYLE_RULE_NAME, false);
        if (sHasSupportNodeInfo) {
            accumulator.store(ACCESSIBILITY_STYLE_RULE_NAME, false);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    public void onGetStyles(View element, String ruleName, StyleAccumulator accumulator) {
        if (!VIEW_STYLE_RULE_NAME.equals(ruleName)) {
            if (ACCESSIBILITY_STYLE_RULE_NAME.equals(ruleName) && sHasSupportNodeInfo) {
                boolean ignored = AccessibilityNodeInfoWrapper.getIgnored(element);
                getStyleFromValue(element, "ignored", Boolean.valueOf(ignored), null, accumulator);
                if (ignored) {
                    getStyleFromValue(element, "ignored-reasons", AccessibilityNodeInfoWrapper.getIgnoredReasons(element), null, accumulator);
                }
                getStyleFromValue(element, "focusable", Boolean.valueOf(!ignored), null, accumulator);
                if (!ignored) {
                    getStyleFromValue(element, "focusable-reasons", AccessibilityNodeInfoWrapper.getFocusableReasons(element), null, accumulator);
                    getStyleFromValue(element, "focused", Boolean.valueOf(AccessibilityNodeInfoWrapper.getIsAccessibilityFocused(element)), null, accumulator);
                    getStyleFromValue(element, "description", AccessibilityNodeInfoWrapper.getDescription(element), null, accumulator);
                    getStyleFromValue(element, "actions", AccessibilityNodeInfoWrapper.getActions(element), null, accumulator);
                    return;
                }
                return;
            }
            return;
        }
        List<ViewCSSProperty> properties = getViewProperties();
        int size = properties.size();
        for (int i = 0; i < size; i++) {
            ViewCSSProperty property = properties.get(i);
            try {
                getStyleFromValue(element, property.getCSSName(), property.getValue(element), property.getAnnotation(), accumulator);
            } catch (Exception e) {
                if ((e instanceof IllegalAccessException) || (e instanceof InvocationTargetException)) {
                    LogUtil.e(e, "failed to get style property " + property.getCSSName() + " of element= " + element.toString());
                } else {
                    throw ExceptionUtil.propagate(e);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.stetho.inspector.elements.AbstractChainedDescriptor
    public void onGetComputedStyles(View element, ComputedStyleAccumulator styles) {
        styles.store("left", Integer.toString(element.getLeft()));
        styles.store("top", Integer.toString(element.getTop()));
        styles.store("right", Integer.toString(element.getRight()));
        styles.store("bottom", Integer.toString(element.getBottom()));
    }

    private static boolean canIntBeMappedToString(@Nullable ViewDebug.ExportedProperty annotation) {
        return (annotation == null || annotation.mapping() == null || annotation.mapping().length <= 0) ? false : true;
    }

    private static String mapIntToStringUsingAnnotation(int value, @Nullable ViewDebug.ExportedProperty annotation) {
        if (!canIntBeMappedToString(annotation)) {
            throw new IllegalStateException("Cannot map using this annotation");
        }
        for (ViewDebug.IntToString map : annotation.mapping()) {
            if (map.from() == value) {
                return map.to();
            }
        }
        return NONE_MAPPING;
    }

    private static boolean canFlagsBeMappedToString(@Nullable ViewDebug.ExportedProperty annotation) {
        return (annotation == null || annotation.flagMapping() == null || annotation.flagMapping().length <= 0) ? false : true;
    }

    private static String mapFlagsToStringUsingAnnotation(int value, @Nullable ViewDebug.ExportedProperty annotation) {
        if (!canFlagsBeMappedToString(annotation)) {
            throw new IllegalStateException("Cannot map using this annotation");
        }
        StringBuilder stringBuilder = null;
        boolean atLeastOneFlag = false;
        for (ViewDebug.FlagToString flagToString : annotation.flagMapping()) {
            if (flagToString.outputIf() == ((flagToString.mask() & value) == flagToString.equals())) {
                if (stringBuilder == null) {
                    stringBuilder = new StringBuilder();
                }
                if (atLeastOneFlag) {
                    stringBuilder.append(" | ");
                }
                stringBuilder.append(flagToString.name());
                atLeastOneFlag = true;
            }
        }
        if (atLeastOneFlag) {
            return stringBuilder.toString();
        }
        return NONE_MAPPING;
    }

    private String convertViewPropertyNameToCSSName(String getterName) {
        String[] words = getWordBoundaryPattern().split(getterName);
        StringBuilder result = new StringBuilder();
        for (int i = 0; i < words.length; i++) {
            if (!words[i].equals("get") && !words[i].equals("m")) {
                result.append(words[i].toLowerCase());
                if (i < words.length - 1) {
                    result.append('-');
                }
            }
        }
        return result.toString();
    }

    private void getStyleFromValue(View element, String name, Object value, @Nullable ViewDebug.ExportedProperty annotation, StyleAccumulator styles) {
        if (name.equals(ID_NAME)) {
            getIdStyle(element, styles);
            return;
        }
        if (value instanceof Integer) {
            getStyleFromInteger(name, (Integer) value, annotation, styles);
            return;
        }
        if (value instanceof Float) {
            styles.store(name, String.valueOf(value), ((Float) value).floatValue() == 0.0f);
            return;
        }
        if (value instanceof Boolean) {
            styles.store(name, String.valueOf(value), false);
            return;
        }
        if (value instanceof Short) {
            styles.store(name, String.valueOf(value), ((Short) value).shortValue() == 0);
            return;
        }
        if (value instanceof Long) {
            styles.store(name, String.valueOf(value), ((Long) value).longValue() == 0);
            return;
        }
        if (value instanceof Double) {
            styles.store(name, String.valueOf(value), ((Double) value).doubleValue() == 0.0d);
            return;
        }
        if (value instanceof Byte) {
            styles.store(name, String.valueOf(value), ((Byte) value).byteValue() == 0);
            return;
        }
        if (value instanceof Character) {
            styles.store(name, String.valueOf(value), ((Character) value).charValue() == 0);
        } else if (value instanceof CharSequence) {
            styles.store(name, String.valueOf(value), ((CharSequence) value).length() == 0);
        } else {
            getStylesFromObject(element, name, value, annotation, styles);
        }
    }

    private void getIdStyle(View element, StyleAccumulator styles) {
        String id = getIdAttribute(element);
        if (id == null) {
            styles.store(ID_NAME, NONE_VALUE, false);
        } else {
            styles.store(ID_NAME, id, false);
        }
    }

    private void getStyleFromInteger(String name, Integer value, @Nullable ViewDebug.ExportedProperty annotation, StyleAccumulator styles) {
        String intValueStr = IntegerFormatter.getInstance().format(value, annotation);
        if (canIntBeMappedToString(annotation)) {
            styles.store(name, intValueStr + " (" + mapIntToStringUsingAnnotation(value.intValue(), annotation) + ")", false);
            return;
        }
        if (canFlagsBeMappedToString(annotation)) {
            styles.store(name, intValueStr + " (" + mapFlagsToStringUsingAnnotation(value.intValue(), annotation) + ")", false);
            return;
        }
        Boolean defaultValue = true;
        if (value.intValue() != 0 || canFlagsBeMappedToString(annotation) || canIntBeMappedToString(annotation)) {
            defaultValue = false;
        }
        styles.store(name, intValueStr, defaultValue.booleanValue());
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code duplicated, block: B:30:0x0069  */
    private void getStylesFromObject(View view, String name, Object value, @Nullable ViewDebug.ExportedProperty annotation, StyleAccumulator styles) {
        String propertyName;
        if (annotation != null && annotation.deepExport()) {
            if (value == null) {
                return;
            }
            Field[] fields = value.getClass().getFields();
            for (Field field : fields) {
                int modifiers = field.getModifiers();
                if (!Modifier.isStatic(modifiers)) {
                    try {
                        field.setAccessible(true);
                        Object propertyValue = field.get(value);
                        String propertyName2 = field.getName();
                        switch (propertyName2) {
                            case "bottomMargin":
                                propertyName = "margin-bottom";
                                break;
                            case "topMargin":
                                propertyName = "margin-top";
                                break;
                            case "leftMargin":
                                propertyName = "margin-left";
                                break;
                            case "rightMargin":
                                propertyName = "margin-right";
                                break;
                            default:
                                String annotationPrefix = annotation.prefix();
                                propertyName = convertViewPropertyNameToCSSName(annotationPrefix == null ? propertyName2 : annotationPrefix + propertyName2);
                                break;
                        }
                        ViewDebug.ExportedProperty subAnnotation = (ViewDebug.ExportedProperty) field.getAnnotation(ViewDebug.ExportedProperty.class);
                        getStyleFromValue(view, propertyName, propertyValue, subAnnotation, styles);
                    } catch (IllegalAccessException e) {
                        LogUtil.e(e, "failed to get property of name: \"" + name + "\" of object: " + String.valueOf(value));
                        return;
                    }
                }
            }
        }
    }

    private static String capitalize(String str) {
        if (str == null || str.length() == 0 || Character.isTitleCase(str.charAt(0))) {
            return str;
        }
        StringBuilder buffer = new StringBuilder(str);
        buffer.setCharAt(0, Character.toTitleCase(buffer.charAt(0)));
        return buffer.toString();
    }

    private final class FieldBackedCSSProperty extends ViewCSSProperty {
        private final Field mField;

        public FieldBackedCSSProperty(Field field, @Nullable String cssName, ViewDebug.ExportedProperty annotation) {
            super(cssName, annotation);
            this.mField = field;
            this.mField.setAccessible(true);
        }

        @Override // com.facebook.stetho.inspector.elements.android.ViewDescriptor.ViewCSSProperty
        public Object getValue(View view) throws IllegalAccessException, InvocationTargetException {
            return this.mField.get(view);
        }
    }

    private final class MethodBackedCSSProperty extends ViewCSSProperty {
        private final Method mMethod;

        public MethodBackedCSSProperty(Method method, @Nullable String cssName, ViewDebug.ExportedProperty annotation) {
            super(cssName, annotation);
            this.mMethod = method;
            this.mMethod.setAccessible(true);
        }

        @Override // com.facebook.stetho.inspector.elements.android.ViewDescriptor.ViewCSSProperty
        public Object getValue(View view) throws IllegalAccessException, InvocationTargetException {
            return this.mMethod.invoke(view, new Object[0]);
        }
    }

    private abstract class ViewCSSProperty {
        private final ViewDebug.ExportedProperty mAnnotation;
        private final String mCSSName;

        public abstract Object getValue(View view) throws IllegalAccessException, InvocationTargetException;

        public ViewCSSProperty(@Nullable String cssName, ViewDebug.ExportedProperty annotation) {
            this.mCSSName = cssName;
            this.mAnnotation = annotation;
        }

        public final String getCSSName() {
            return this.mCSSName;
        }

        @Nullable
        public final ViewDebug.ExportedProperty getAnnotation() {
            return this.mAnnotation;
        }
    }
}
