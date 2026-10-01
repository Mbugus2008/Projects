package androidx.constraintlayout.core.state;

import androidx.constraintlayout.core.motion.utils.TypedBundle;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.constraintlayout.core.parser.CLArray;
import androidx.constraintlayout.core.parser.CLElement;
import androidx.constraintlayout.core.parser.CLKey;
import androidx.constraintlayout.core.parser.CLNumber;
import androidx.constraintlayout.core.parser.CLObject;
import androidx.constraintlayout.core.parser.CLParser;
import androidx.constraintlayout.core.parser.CLParsingException;
import androidx.constraintlayout.core.parser.CLString;
import androidx.constraintlayout.core.state.helpers.BarrierReference;
import androidx.constraintlayout.core.state.helpers.ChainReference;
import androidx.constraintlayout.core.state.helpers.FlowReference;
import androidx.constraintlayout.core.state.helpers.GridReference;
import androidx.constraintlayout.core.state.helpers.GuidelineReference;
import androidx.savedstate.serialization.ClassDiscriminatorModeKt;
import java.util.ArrayList;
import java.util.HashMap;

/* JADX INFO: loaded from: classes.dex */
public class ConstraintSetParser {
    private static final boolean PARSER_DEBUG = false;

    interface GeneratedValue {
        float value();
    }

    public enum MotionLayoutDebugFlags {
        NONE,
        SHOW_ALL,
        UNKNOWN
    }

    public static class DesignElement {
        String mId;
        HashMap<String, String> mParams;
        String mType;

        public String getId() {
            return this.mId;
        }

        public String getType() {
            return this.mType;
        }

        public HashMap<String, String> getParams() {
            return this.mParams;
        }

        DesignElement(String id, String type, HashMap<String, String> params) {
            this.mId = id;
            this.mType = type;
            this.mParams = params;
        }
    }

    public static class LayoutVariables {
        HashMap<String, Integer> mMargins = new HashMap<>();
        HashMap<String, GeneratedValue> mGenerators = new HashMap<>();
        HashMap<String, ArrayList<String>> mArrayIds = new HashMap<>();

        void put(String elementName, int element) {
            this.mMargins.put(elementName, Integer.valueOf(element));
        }

        void put(String elementName, float start, float incrementBy) {
            if (this.mGenerators.containsKey(elementName) && (this.mGenerators.get(elementName) instanceof OverrideValue)) {
                return;
            }
            this.mGenerators.put(elementName, new Generator(start, incrementBy));
        }

        void put(String elementName, float from, float to, float step, String prefix, String postfix) {
            if (this.mGenerators.containsKey(elementName) && (this.mGenerators.get(elementName) instanceof OverrideValue)) {
                return;
            }
            FiniteGenerator generator = new FiniteGenerator(from, to, step, prefix, postfix);
            this.mGenerators.put(elementName, generator);
            this.mArrayIds.put(elementName, generator.array());
        }

        public void putOverride(String elementName, float value) {
            GeneratedValue generator = new OverrideValue(value);
            this.mGenerators.put(elementName, generator);
        }

        float get(Object elementName) {
            if (elementName instanceof CLString) {
                String stringValue = ((CLString) elementName).content();
                if (this.mGenerators.containsKey(stringValue)) {
                    return this.mGenerators.get(stringValue).value();
                }
                if (this.mMargins.containsKey(stringValue)) {
                    return this.mMargins.get(stringValue).floatValue();
                }
                return 0.0f;
            }
            if (elementName instanceof CLNumber) {
                return ((CLNumber) elementName).getFloat();
            }
            return 0.0f;
        }

        ArrayList<String> getList(String elementName) {
            if (this.mArrayIds.containsKey(elementName)) {
                return this.mArrayIds.get(elementName);
            }
            return null;
        }

        void put(String elementName, ArrayList<String> elements) {
            this.mArrayIds.put(elementName, elements);
        }
    }

    static class Generator implements GeneratedValue {
        float mCurrent;
        float mIncrementBy;
        float mStart;
        boolean mStop = false;

        Generator(float start, float incrementBy) {
            this.mStart = 0.0f;
            this.mIncrementBy = 0.0f;
            this.mCurrent = 0.0f;
            this.mStart = start;
            this.mIncrementBy = incrementBy;
            this.mCurrent = start;
        }

        @Override // androidx.constraintlayout.core.state.ConstraintSetParser.GeneratedValue
        public float value() {
            if (!this.mStop) {
                this.mCurrent += this.mIncrementBy;
            }
            return this.mCurrent;
        }
    }

    static class FiniteGenerator implements GeneratedValue {
        float mFrom;
        float mInitial;
        float mMax;
        String mPostfix;
        String mPrefix;
        float mStep;
        float mTo;
        boolean mStop = false;
        float mCurrent = 0.0f;

        FiniteGenerator(float from, float to, float step, String prefix, String postfix) {
            this.mFrom = 0.0f;
            this.mTo = 0.0f;
            this.mStep = 0.0f;
            this.mFrom = from;
            this.mTo = to;
            this.mStep = step;
            this.mPrefix = prefix == null ? "" : prefix;
            this.mPostfix = postfix != null ? postfix : "";
            this.mMax = to;
            this.mInitial = from;
        }

        @Override // androidx.constraintlayout.core.state.ConstraintSetParser.GeneratedValue
        public float value() {
            if (this.mCurrent >= this.mMax) {
                this.mStop = true;
            }
            if (!this.mStop) {
                this.mCurrent += this.mStep;
            }
            return this.mCurrent;
        }

        public ArrayList<String> array() {
            ArrayList<String> array = new ArrayList<>();
            int value = (int) this.mInitial;
            int maxInt = (int) this.mMax;
            for (int i = value; i <= maxInt; i++) {
                array.add(this.mPrefix + value + this.mPostfix);
                value += (int) this.mStep;
            }
            return array;
        }
    }

    static class OverrideValue implements GeneratedValue {
        float mValue;

        OverrideValue(float value) {
            this.mValue = value;
        }

        @Override // androidx.constraintlayout.core.state.ConstraintSetParser.GeneratedValue
        public float value() {
            return this.mValue;
        }
    }

    public static void parseJSON(String content, Transition transition, int state) {
        try {
            CLObject json = CLParser.parse(content);
            ArrayList<String> elements = json.names();
            if (elements == null) {
                return;
            }
            for (String elementName : elements) {
                CLElement base_element = json.get(elementName);
                if (base_element instanceof CLObject) {
                    CLObject element = (CLObject) base_element;
                    CLObject customProperties = element.getObjectOrNull("custom");
                    if (customProperties != null) {
                        ArrayList<String> properties = customProperties.names();
                        for (String property : properties) {
                            CLElement value = customProperties.get(property);
                            if (value instanceof CLNumber) {
                                transition.addCustomFloat(state, elementName, property, value.getFloat());
                            } else if (value instanceof CLString) {
                                long color = parseColorString(value.content());
                                if (color != -1) {
                                    transition.addCustomColor(state, elementName, property, (int) color);
                                }
                            }
                        }
                    }
                }
            }
        } catch (CLParsingException e) {
            System.err.println("Error parsing JSON " + e);
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code duplicated, block: B:12:0x002d  */
    public static void parseMotionSceneJSON(CoreMotionScene scene, String content) {
        try {
            CLObject json = CLParser.parse(content);
            ArrayList<String> elements = json.names();
            if (elements == null) {
                return;
            }
            for (String elementName : elements) {
                CLElement element = json.get(elementName);
                if (element instanceof CLObject) {
                    CLObject clObject = (CLObject) element;
                    switch (elementName) {
                        case "ConstraintSets":
                            parseConstraintSets(scene, clObject);
                            break;
                        case "Transitions":
                            parseTransitions(scene, clObject);
                            break;
                        case "Header":
                            parseHeader(scene, clObject);
                            break;
                    }
                }
            }
        } catch (CLParsingException e) {
            System.err.println("Error parsing JSON " + e);
        }
    }

    static void parseConstraintSets(CoreMotionScene scene, CLObject json) throws CLParsingException {
        ArrayList<String> constraintSetNames = json.names();
        if (constraintSetNames == null) {
            return;
        }
        for (String csName : constraintSetNames) {
            CLObject constraintSet = json.getObject(csName);
            boolean added = false;
            String ext = constraintSet.getStringOrNull("Extends");
            if (ext != null && !ext.isEmpty()) {
                String base = scene.getConstraintSet(ext);
                if (base != null) {
                    CLObject baseJson = CLParser.parse(base);
                    ArrayList<String> widgetsOverride = constraintSet.names();
                    if (widgetsOverride != null) {
                        for (String widgetOverrideName : widgetsOverride) {
                            CLElement value = constraintSet.get(widgetOverrideName);
                            if (value instanceof CLObject) {
                                override(baseJson, widgetOverrideName, (CLObject) value);
                            }
                        }
                        scene.setConstraintSetContent(csName, baseJson.toJSON());
                        added = true;
                    }
                }
            }
            if (!added) {
                scene.setConstraintSetContent(csName, constraintSet.toJSON());
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code duplicated, block: B:29:0x006d  */
    static void override(CLObject baseJson, String name, CLObject overrideValue) throws CLParsingException {
        if (!baseJson.has(name)) {
            baseJson.put(name, overrideValue);
            return;
        }
        CLObject base = baseJson.getObject(name);
        ArrayList<String> keys = overrideValue.names();
        for (String key : keys) {
            if (!key.equals("clear")) {
                base.put(key, overrideValue.get(key));
            } else {
                CLArray toClear = overrideValue.getArray("clear");
                for (int i = 0; i < toClear.size(); i++) {
                    String clearedKey = toClear.getStringOrNull(i);
                    if (clearedKey != null) {
                        switch (clearedKey) {
                            case "dimensions":
                                base.remove("width");
                                base.remove("height");
                                break;
                            case "constraints":
                                base.remove("start");
                                base.remove("end");
                                base.remove("top");
                                base.remove("bottom");
                                base.remove("baseline");
                                base.remove("center");
                                base.remove("centerHorizontally");
                                base.remove("centerVertically");
                                break;
                            case "transforms":
                                base.remove("visibility");
                                base.remove("alpha");
                                base.remove("pivotX");
                                base.remove("pivotY");
                                base.remove("rotationX");
                                base.remove("rotationY");
                                base.remove("rotationZ");
                                base.remove("scaleX");
                                base.remove("scaleY");
                                base.remove("translationX");
                                base.remove("translationY");
                                break;
                            default:
                                base.remove(clearedKey);
                                break;
                        }
                    }
                }
            }
        }
    }

    static void parseTransitions(CoreMotionScene scene, CLObject json) throws CLParsingException {
        ArrayList<String> elements = json.names();
        if (elements == null) {
            return;
        }
        for (String elementName : elements) {
            scene.setTransitionContent(elementName, json.getObject(elementName).toJSON());
        }
    }

    static void parseHeader(CoreMotionScene scene, CLObject json) {
        String name = json.getStringOrNull("export");
        if (name != null) {
            scene.setDebugName(name);
        }
    }

    public static void parseJSON(String content, State state, LayoutVariables layoutVariables) throws CLParsingException {
        try {
            CLObject json = CLParser.parse(content);
            populateState(json, state, layoutVariables);
        } catch (CLParsingException e) {
            System.err.println("Error parsing JSON " + e);
        }
    }

    public static void populateState(CLObject parsedJson, State state, LayoutVariables layoutVariables) throws CLParsingException {
        ArrayList<String> elements = parsedJson.names();
        if (elements == null) {
            return;
        }
        for (String elementName : elements) {
            CLElement element = parsedJson.get(elementName);
            switch (elementName) {
                case "Variables":
                    if (!(element instanceof CLObject)) {
                        break;
                    } else {
                        parseVariables(state, layoutVariables, (CLObject) element);
                        break;
                    }
                    break;
                case "Helpers":
                    if (!(element instanceof CLArray)) {
                        break;
                    } else {
                        parseHelpers(state, layoutVariables, (CLArray) element);
                        break;
                    }
                    break;
                case "Generate":
                    if (!(element instanceof CLObject)) {
                        break;
                    } else {
                        parseGenerate(state, layoutVariables, (CLObject) element);
                        break;
                    }
                    break;
                default:
                    if (element instanceof CLObject) {
                        String type = lookForType((CLObject) element);
                        if (type != null) {
                            switch (type) {
                                case "hGuideline":
                                    parseGuidelineParams(0, state, elementName, (CLObject) element);
                                    break;
                                case "vGuideline":
                                    parseGuidelineParams(1, state, elementName, (CLObject) element);
                                    break;
                                case "barrier":
                                    parseBarrier(state, elementName, (CLObject) element);
                                    break;
                                case "vChain":
                                case "hChain":
                                    parseChainType(type, state, elementName, layoutVariables, (CLObject) element);
                                    break;
                                case "vFlow":
                                case "hFlow":
                                    parseFlowType(type, state, elementName, layoutVariables, (CLObject) element);
                                    break;
                                case "grid":
                                case "row":
                                case "column":
                                    parseGridType(type, state, elementName, layoutVariables, (CLObject) element);
                                    break;
                            }
                        } else {
                            parseWidget(state, layoutVariables, elementName, (CLObject) element);
                            break;
                        }
                    } else {
                        if (element instanceof CLNumber) {
                            layoutVariables.put(elementName, element.getInt());
                        }
                        break;
                    }
                    break;
            }
        }
    }

    private static void parseVariables(State state, LayoutVariables layoutVariables, CLObject json) throws CLParsingException {
        ArrayList<String> elements = json.names();
        if (elements == null) {
            return;
        }
        for (String elementName : elements) {
            CLElement element = json.get(elementName);
            if (element instanceof CLNumber) {
                layoutVariables.put(elementName, element.getInt());
            } else if (element instanceof CLObject) {
                CLObject obj = (CLObject) element;
                if (!obj.has(TypedValues.TransitionType.S_FROM) || !obj.has(TypedValues.TransitionType.S_TO)) {
                    if (obj.has(TypedValues.TransitionType.S_FROM) && obj.has("step")) {
                        float start = layoutVariables.get(obj.get(TypedValues.TransitionType.S_FROM));
                        float increment = layoutVariables.get(obj.get("step"));
                        layoutVariables.put(elementName, start, increment);
                    } else if (obj.has("ids")) {
                        CLArray ids = obj.getArray("ids");
                        ArrayList<String> arrayIds = new ArrayList<>();
                        for (int i = 0; i < ids.size(); i++) {
                            arrayIds.add(ids.getString(i));
                        }
                        layoutVariables.put(elementName, arrayIds);
                    } else if (obj.has("tag")) {
                        layoutVariables.put(elementName, state.getIdsForTag(obj.getString("tag")));
                    }
                } else {
                    float from = layoutVariables.get(obj.get(TypedValues.TransitionType.S_FROM));
                    float to = layoutVariables.get(obj.get(TypedValues.TransitionType.S_TO));
                    String prefix = obj.getStringOrNull("prefix");
                    String postfix = obj.getStringOrNull("postfix");
                    layoutVariables.put(elementName, from, to, 1.0f, prefix, postfix);
                }
            }
        }
    }

    public static void parseDesignElementsJSON(String content, ArrayList<DesignElement> list) throws CLParsingException {
        CLObject json = CLParser.parse(content);
        ArrayList<String> elements = json.names();
        if (elements != null && 0 < elements.size()) {
            String elementName = elements.get(0);
            CLElement element = json.get(elementName);
            int i = 0;
            switch (elementName) {
                case "Design":
                    if (element instanceof CLObject) {
                        CLObject obj = (CLObject) element;
                        ArrayList<String> elements2 = obj.names();
                        int j = 0;
                        while (j < elements2.size()) {
                            String designElementName = elements2.get(j);
                            CLObject designElement = (CLObject) ((CLObject) element).get(designElementName);
                            System.out.printf("element found " + designElementName + "", new Object[i]);
                            String type = designElement.getStringOrNull(ClassDiscriminatorModeKt.CLASS_DISCRIMINATOR_KEY);
                            if (type != null) {
                                HashMap<String, String> parameters = new HashMap<>();
                                int size = designElement.size();
                                for (int k = 0; k < size; k++) {
                                    CLKey key = (CLKey) designElement.get(j);
                                    String paramName = key.content();
                                    String paramValue = key.getValue().content();
                                    if (paramValue != null) {
                                        parameters.put(paramName, paramValue);
                                    }
                                }
                                list.add(new DesignElement(elementName, type, parameters));
                            }
                            j++;
                            i = 0;
                        }
                        break;
                    }
                    break;
                default:
                    break;
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code duplicated, block: B:24:0x0050  */
    static void parseHelpers(State state, LayoutVariables layoutVariables, CLArray element) throws CLParsingException {
        for (int i = 0; i < element.size(); i++) {
            CLElement helper = element.get(i);
            if (helper instanceof CLArray) {
                CLArray array = (CLArray) helper;
                if (array.size() > 1) {
                    switch (array.getString(0)) {
                        case "hChain":
                            parseChain(0, state, layoutVariables, array);
                            break;
                        case "vChain":
                            parseChain(1, state, layoutVariables, array);
                            break;
                        case "hGuideline":
                            parseGuideline(0, state, array);
                            break;
                        case "vGuideline":
                            parseGuideline(1, state, array);
                            break;
                    }
                }
            }
        }
    }

    static void parseGenerate(State state, LayoutVariables layoutVariables, CLObject json) throws CLParsingException {
        ArrayList<String> elements = json.names();
        if (elements == null) {
            return;
        }
        for (String elementName : elements) {
            CLElement element = json.get(elementName);
            ArrayList<String> arrayIds = layoutVariables.getList(elementName);
            if (arrayIds != null && (element instanceof CLObject)) {
                for (String id : arrayIds) {
                    parseWidget(state, layoutVariables, id, (CLObject) element);
                }
            }
        }
    }

    static void parseChain(int orientation, State state, LayoutVariables margins, CLArray helper) throws CLParsingException {
        String styleValue;
        ChainReference chain = orientation == 0 ? state.horizontalChain() : state.verticalChain();
        CLElement refs = helper.get(1);
        if ((refs instanceof CLArray) && ((CLArray) refs).size() >= 1) {
            for (int i = 0; i < ((CLArray) refs).size(); i++) {
                chain.add(((CLArray) refs).getString(i));
            }
            int i2 = helper.size();
            if (i2 > 2) {
                CLElement params = helper.get(2);
                if (!(params instanceof CLObject)) {
                    return;
                }
                CLObject obj = (CLObject) params;
                ArrayList<String> constraints = obj.names();
                for (String constraintName : constraints) {
                    switch (constraintName) {
                        case "style":
                            CLElement styleObject = ((CLObject) params).get(constraintName);
                            if ((styleObject instanceof CLArray) && ((CLArray) styleObject).size() > 1) {
                                styleValue = ((CLArray) styleObject).getString(0);
                                float biasValue = ((CLArray) styleObject).getFloat(1);
                                chain.bias(biasValue);
                            } else {
                                styleValue = styleObject.content();
                            }
                            switch (styleValue) {
                                case "packed":
                                    chain.style(State.Chain.PACKED);
                                    break;
                                case "spread_inside":
                                    chain.style(State.Chain.SPREAD_INSIDE);
                                    break;
                                default:
                                    chain.style(State.Chain.SPREAD);
                                    break;
                            }
                            break;
                        default:
                            parseConstraint(state, margins, (CLObject) params, chain, constraintName);
                            break;
                    }
                }
            }
        }
    }

    private static float toPix(State state, float dp) {
        return state.getDpToPixel().toPixels(dp);
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    private static void parseChainType(String orientation, State state, String chainName, LayoutVariables margins, CLObject object) throws CLParsingException {
        ChainReference chainReferenceVerticalChain;
        int i;
        int i2;
        int i3;
        float preMargin;
        String styleValue;
        int i4 = 0;
        if (orientation.charAt(0) != 'h') {
            chainReferenceVerticalChain = state.verticalChain();
        } else {
            chainReferenceVerticalChain = state.horizontalChain();
        }
        ChainReference chain = chainReferenceVerticalChain;
        chain.setKey(chainName);
        for (String params : object.names()) {
            int i5 = -1;
            int i6 = 3;
            int i7 = 2;
            int i8 = 1;
            switch (params.hashCode()) {
                case -1383228885:
                    i = params.equals("bottom") ? 4 : -1;
                    break;
                case -567445985:
                    i = params.equals("contains") ? i4 : -1;
                    break;
                case 100571:
                    i = params.equals("end") ? 2 : -1;
                    break;
                case 115029:
                    i = params.equals("top") ? 3 : -1;
                    break;
                case 3317767:
                    i = params.equals("left") ? 5 : -1;
                    break;
                case 108511772:
                    i = params.equals("right") ? 6 : -1;
                    break;
                case 109757538:
                    i = params.equals("start") ? 1 : -1;
                    break;
                case 109780401:
                    i = params.equals("style") ? 7 : -1;
                    break;
                default:
                    i = -1;
                    break;
            }
            switch (i) {
                case 0:
                    CLElement refs = object.get(params);
                    if ((refs instanceof CLArray) && ((CLArray) refs).size() >= 1) {
                        int i9 = 0;
                        while (i9 < ((CLArray) refs).size()) {
                            CLElement chainElement = ((CLArray) refs).get(i9);
                            if (chainElement instanceof CLArray) {
                                CLArray array = (CLArray) chainElement;
                                if (array.size() > 0) {
                                    String id = array.get(i4).content();
                                    float weight = Float.NaN;
                                    float postMargin = Float.NaN;
                                    float preGoneMargin = Float.NaN;
                                    float postGoneMargin = Float.NaN;
                                    switch (array.size()) {
                                        case 2:
                                            i3 = i6;
                                            weight = array.getFloat(i8);
                                            preMargin = Float.NaN;
                                            break;
                                        case 3:
                                            i3 = i6;
                                            weight = array.getFloat(i8);
                                            preMargin = toPix(state, array.getFloat(i7));
                                            postMargin = preMargin;
                                            break;
                                        case 4:
                                            weight = array.getFloat(i8);
                                            float preMargin2 = toPix(state, array.getFloat(i7));
                                            i3 = 3;
                                            postMargin = toPix(state, array.getFloat(3));
                                            preMargin = preMargin2;
                                            break;
                                        case 5:
                                        default:
                                            i3 = i6;
                                            preMargin = Float.NaN;
                                            break;
                                        case 6:
                                            weight = array.getFloat(i8);
                                            float preMargin3 = toPix(state, array.getFloat(i7));
                                            postMargin = toPix(state, array.getFloat(i6));
                                            preGoneMargin = toPix(state, array.getFloat(4));
                                            postGoneMargin = toPix(state, array.getFloat(5));
                                            preMargin = preMargin3;
                                            i3 = 3;
                                            break;
                                    }
                                    float weight2 = weight;
                                    i2 = i3;
                                    chain.addChainElement(id, weight2, preMargin, postMargin, preGoneMargin, postGoneMargin);
                                } else {
                                    i2 = i6;
                                }
                            } else {
                                i2 = i6;
                                chain.add(chainElement.content());
                            }
                            i9++;
                            refs = refs;
                            i6 = i2;
                            i7 = i7;
                            i8 = i8;
                            i4 = 0;
                        }
                        break;
                    }
                    System.err.println(chainName + " contains should be an array \"" + refs.content() + "\"");
                    return;
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                    parseConstraint(state, margins, object, chain, params);
                    break;
                case 7:
                    CLElement styleObject = object.get(params);
                    if ((styleObject instanceof CLArray) && ((CLArray) styleObject).size() > 1) {
                        styleValue = ((CLArray) styleObject).getString(i4);
                        float biasValue = ((CLArray) styleObject).getFloat(1);
                        chain.bias(biasValue);
                    } else {
                        styleValue = styleObject.content();
                    }
                    switch (styleValue.hashCode()) {
                        case -995865480:
                            if (styleValue.equals("packed")) {
                                i5 = i4;
                            }
                            break;
                        case 1311368264:
                            if (styleValue.equals("spread_inside")) {
                                i5 = 1;
                            }
                            break;
                    }
                    switch (i5) {
                        case 0:
                            chain.style(State.Chain.PACKED);
                            break;
                        case 1:
                            chain.style(State.Chain.SPREAD_INSIDE);
                            break;
                        default:
                            chain.style(State.Chain.SPREAD);
                            break;
                    }
                    break;
            }
            i4 = 0;
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code duplicated, block: B:44:0x00af  */
    private static void parseGridType(String gridType, State state, String name, LayoutVariables layoutVariables, CLObject element) throws CLParsingException {
        float paddingStart;
        float paddingTop;
        float paddingStart2;
        float paddingBottom;
        GridReference grid = state.getGrid(name, gridType);
        for (String param : element.names()) {
            switch (param) {
                case "contains":
                    CLArray list = element.getArrayOrNull(param);
                    if (list != null) {
                        for (int j = 0; j < list.size(); j++) {
                            String elementNameReference = list.get(j).content();
                            ConstraintReference elementReference = state.constraints(elementNameReference);
                            grid.add(elementReference);
                        }
                        break;
                    } else {
                        break;
                    }
                    break;
                case "orientation":
                    int orientation = element.get(param).getInt();
                    grid.setOrientation(orientation);
                    break;
                case "rows":
                    int rows = element.get(param).getInt();
                    if (rows > 0) {
                        grid.setRowsSet(rows);
                        break;
                    } else {
                        break;
                    }
                    break;
                case "columns":
                    int columns = element.get(param).getInt();
                    if (columns > 0) {
                        grid.setColumnsSet(columns);
                        break;
                    } else {
                        break;
                    }
                    break;
                case "hGap":
                    float hGap = element.get(param).getFloat();
                    grid.setHorizontalGaps(toPix(state, hGap));
                    break;
                case "vGap":
                    float vGap = element.get(param).getFloat();
                    grid.setVerticalGaps(toPix(state, vGap));
                    break;
                case "spans":
                    String spans = element.get(param).content();
                    if (spans == null || !spans.contains(":")) {
                        break;
                    } else {
                        grid.setSpans(spans);
                        break;
                    }
                    break;
                case "skips":
                    String skips = element.get(param).content();
                    if (skips == null || !skips.contains(":")) {
                        break;
                    } else {
                        grid.setSkips(skips);
                        break;
                    }
                    break;
                case "rowWeights":
                    String rowWeights = element.get(param).content();
                    if (rowWeights == null || !rowWeights.contains(",")) {
                        break;
                    } else {
                        grid.setRowWeights(rowWeights);
                        break;
                    }
                    break;
                case "columnWeights":
                    String columnWeights = element.get(param).content();
                    if (columnWeights == null || !columnWeights.contains(",")) {
                        break;
                    } else {
                        grid.setColumnWeights(columnWeights);
                        break;
                    }
                    break;
                case "padding":
                    CLElement paddingObject = element.get(param);
                    if ((paddingObject instanceof CLArray) && ((CLArray) paddingObject).size() > 1) {
                        paddingStart = ((CLArray) paddingObject).getInt(0);
                        paddingStart2 = paddingStart;
                        paddingTop = ((CLArray) paddingObject).getInt(1);
                        paddingBottom = paddingTop;
                        if (((CLArray) paddingObject).size() > 2) {
                            float paddingEnd = ((CLArray) paddingObject).getInt(2);
                            try {
                                paddingBottom = ((CLArray) paddingObject).getInt(3);
                            } catch (ArrayIndexOutOfBoundsException e) {
                                paddingBottom = 0.0f;
                            }
                            paddingStart2 = paddingEnd;
                        }
                    } else {
                        paddingStart = paddingObject.getInt();
                        paddingTop = paddingStart;
                        paddingStart2 = paddingStart;
                        paddingBottom = paddingStart;
                    }
                    grid.setPaddingStart(Math.round(toPix(state, paddingStart)));
                    grid.setPaddingTop(Math.round(toPix(state, paddingTop)));
                    grid.setPaddingEnd(Math.round(toPix(state, paddingStart2)));
                    grid.setPaddingBottom(Math.round(toPix(state, paddingBottom)));
                    break;
                case "flags":
                    int flagValue = 0;
                    String flags = "";
                    try {
                        CLElement obj = element.get(param);
                        if (obj instanceof CLNumber) {
                            flagValue = obj.getInt();
                        } else {
                            flags = obj.content();
                        }
                    } catch (Exception ex) {
                        System.err.println("Error parsing grid flags " + ex);
                    }
                    if (flags != null && !flags.isEmpty()) {
                        grid.setFlags(flags);
                        break;
                    } else {
                        grid.setFlags(flagValue);
                        break;
                    }
                    break;
                default:
                    ConstraintReference reference = state.constraints(name);
                    applyAttribute(state, layoutVariables, reference, element, param);
                    break;
            }
        }
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    private static void parseFlowType(String flowType, State state, String flowName, LayoutVariables layoutVariables, CLObject element) throws CLParsingException {
        int i;
        float preMargin;
        float postMargin;
        float paddingLeft;
        float paddingTop;
        float paddingLeft2;
        float paddingBottom;
        Float vLastBiasValue;
        Float vLastBiasValue2;
        Float vFirstBiasValue;
        Float hLastBiasValue;
        Float hLastBiasValue2;
        Float hFirstBiasValue;
        String vStyleValueStr;
        String hStyleValueStr;
        int i2 = 0;
        int i3 = 1;
        boolean isVertical = flowType.charAt(0) == 'v';
        FlowReference flow = state.getFlow(flowName, isVertical);
        for (String param : element.names()) {
            int i4 = -1;
            switch (param.hashCode()) {
                case -1254185091:
                    i = param.equals("hAlign") ? 8 : -1;
                    break;
                case -1237307863:
                    i = param.equals("hStyle") ? 12 : -1;
                    break;
                case -1198076529:
                    i = param.equals("hFlowBias") ? 10 : -1;
                    break;
                case -853376977:
                    i = param.equals("vAlign") ? 7 : -1;
                    break;
                case -836499749:
                    i = param.equals("vStyle") ? 11 : -1;
                    break;
                case -806339567:
                    i = param.equals("padding") ? 6 : -1;
                    break;
                case -732635235:
                    i = param.equals("vFlowBias") ? 9 : -1;
                    break;
                case -567445985:
                    i = param.equals("contains") ? i2 : -1;
                    break;
                case -488900360:
                    i = param.equals("maxElement") ? 5 : -1;
                    break;
                case 3169614:
                    i = param.equals("hGap") ? 4 : -1;
                    break;
                case 3575610:
                    i = param.equals(ClassDiscriminatorModeKt.CLASS_DISCRIMINATOR_KEY) ? i3 : -1;
                    break;
                case 3586688:
                    i = param.equals("vGap") ? 3 : -1;
                    break;
                case 3657802:
                    i = param.equals("wrap") ? 2 : -1;
                    break;
                default:
                    i = -1;
                    break;
            }
            switch (i) {
                case 0:
                    CLElement refs = element.get(param);
                    if (!(refs instanceof CLArray) || ((CLArray) refs).size() < i3) {
                        System.err.println(flowName + " contains should be an array \"" + refs.content() + "\"");
                        return;
                    }
                    int i5 = 0;
                    while (i5 < ((CLArray) refs).size()) {
                        CLElement chainElement = ((CLArray) refs).get(i5);
                        if (chainElement instanceof CLArray) {
                            CLArray array = (CLArray) chainElement;
                            if (array.size() > 0) {
                                String id = array.get(0).content();
                                float weight = Float.NaN;
                                switch (array.size()) {
                                    case 2:
                                        weight = array.getFloat(1);
                                        preMargin = Float.NaN;
                                        postMargin = Float.NaN;
                                        break;
                                    case 3:
                                        weight = array.getFloat(1);
                                        postMargin = toPix(state, array.getFloat(2));
                                        preMargin = postMargin;
                                        break;
                                    case 4:
                                        weight = array.getFloat(i3);
                                        float preMargin2 = toPix(state, array.getFloat(2));
                                        float postMargin2 = toPix(state, array.getFloat(3));
                                        preMargin = preMargin2;
                                        postMargin = postMargin2;
                                        break;
                                    default:
                                        preMargin = Float.NaN;
                                        postMargin = Float.NaN;
                                        break;
                                }
                                flow.addFlowElement(id, weight, preMargin, postMargin);
                            }
                        } else {
                            flow.add(chainElement.content());
                        }
                        i5++;
                        i3 = 1;
                    }
                    break;
                    break;
                case 1:
                    if (element.get(param).content().equals("hFlow")) {
                        flow.setOrientation(0);
                    } else {
                        flow.setOrientation(i3);
                    }
                    break;
                case 2:
                    String wrapValue = element.get(param).content();
                    flow.setWrapMode(State.Wrap.getValueByString(wrapValue));
                    break;
                case 3:
                    int vGapValue = element.get(param).getInt();
                    flow.setVerticalGap(vGapValue);
                    break;
                case 4:
                    int hGapValue = element.get(param).getInt();
                    flow.setHorizontalGap(hGapValue);
                    break;
                case 5:
                    int maxElementValue = element.get(param).getInt();
                    flow.setMaxElementsWrap(maxElementValue);
                    break;
                case 6:
                    CLElement paddingObject = element.get(param);
                    if ((paddingObject instanceof CLArray) && ((CLArray) paddingObject).size() > i3) {
                        paddingLeft = ((CLArray) paddingObject).getInt(0);
                        paddingLeft2 = paddingLeft;
                        paddingTop = ((CLArray) paddingObject).getInt(i3);
                        paddingBottom = paddingTop;
                        if (((CLArray) paddingObject).size() > 2) {
                            float paddingRight = ((CLArray) paddingObject).getInt(2);
                            try {
                                paddingBottom = ((CLArray) paddingObject).getInt(3);
                            } catch (ArrayIndexOutOfBoundsException e) {
                                paddingBottom = 0.0f;
                            }
                            paddingLeft2 = paddingRight;
                        }
                    } else {
                        paddingLeft = paddingObject.getInt();
                        paddingTop = paddingLeft;
                        paddingLeft2 = paddingLeft;
                        paddingBottom = paddingLeft;
                    }
                    float paddingBottom2 = toPix(state, paddingLeft);
                    flow.setPaddingLeft(Math.round(paddingBottom2));
                    flow.setPaddingTop(Math.round(toPix(state, paddingTop)));
                    flow.setPaddingRight(Math.round(toPix(state, paddingLeft2)));
                    flow.setPaddingBottom(Math.round(toPix(state, paddingBottom)));
                    break;
                case 7:
                    String vAlignValue = element.get(param).content();
                    switch (vAlignValue.hashCode()) {
                        case -1720785339:
                            if (vAlignValue.equals("baseline")) {
                                i4 = 2;
                            }
                            break;
                        case -1383228885:
                            if (vAlignValue.equals("bottom")) {
                                i4 = i3;
                            }
                            break;
                        case 115029:
                            if (vAlignValue.equals("top")) {
                                i4 = 0;
                            }
                            break;
                    }
                    switch (i4) {
                        case 0:
                            flow.setVerticalAlign(0);
                            break;
                        case 1:
                            flow.setVerticalAlign(i3);
                            break;
                        case 2:
                            flow.setVerticalAlign(3);
                            break;
                        default:
                            flow.setVerticalAlign(2);
                            break;
                    }
                    break;
                case 8:
                    String hAlignValue = element.get(param).content();
                    switch (hAlignValue.hashCode()) {
                        case 100571:
                            if (hAlignValue.equals("end")) {
                                i4 = i3;
                            }
                            break;
                        case 109757538:
                            if (hAlignValue.equals("start")) {
                                i4 = 0;
                            }
                            break;
                    }
                    switch (i4) {
                        case 0:
                            flow.setHorizontalAlign(0);
                            break;
                        case 1:
                            flow.setHorizontalAlign(i3);
                            break;
                        default:
                            flow.setHorizontalAlign(2);
                            break;
                    }
                    break;
                case 9:
                    CLElement vBiasObject = element.get(param);
                    Float.valueOf(0.5f);
                    Float vFirstBiasValue2 = Float.valueOf(0.5f);
                    Float vLastBiasValue3 = Float.valueOf(0.5f);
                    if ((vBiasObject instanceof CLArray) && ((CLArray) vBiasObject).size() > i3) {
                        Float vFirstBiasValue3 = Float.valueOf(((CLArray) vBiasObject).getFloat(0));
                        Float vBiasValue = Float.valueOf(((CLArray) vBiasObject).getFloat(i3));
                        if (((CLArray) vBiasObject).size() <= 2) {
                            vLastBiasValue = vLastBiasValue3;
                            vLastBiasValue2 = vFirstBiasValue3;
                            vFirstBiasValue = vBiasValue;
                        } else {
                            vLastBiasValue = Float.valueOf(((CLArray) vBiasObject).getFloat(2));
                            vLastBiasValue2 = vFirstBiasValue3;
                            vFirstBiasValue = vBiasValue;
                        }
                    } else {
                        vLastBiasValue = vLastBiasValue3;
                        vLastBiasValue2 = vFirstBiasValue2;
                        vFirstBiasValue = Float.valueOf(vBiasObject.getFloat());
                    }
                    try {
                        flow.verticalBias(vFirstBiasValue.floatValue());
                        if (vLastBiasValue2.floatValue() != 0.5f) {
                            flow.setFirstVerticalBias(vLastBiasValue2.floatValue());
                        }
                        if (vLastBiasValue.floatValue() != 0.5f) {
                            flow.setLastVerticalBias(vLastBiasValue.floatValue());
                        }
                    } catch (NumberFormatException e2) {
                    }
                    break;
                case 10:
                    CLElement hBiasObject = element.get(param);
                    Float.valueOf(0.5f);
                    Float hFirstBiasValue2 = Float.valueOf(0.5f);
                    Float hLastBiasValue3 = Float.valueOf(0.5f);
                    if ((hBiasObject instanceof CLArray) && ((CLArray) hBiasObject).size() > i3) {
                        Float hFirstBiasValue3 = Float.valueOf(((CLArray) hBiasObject).getFloat(0));
                        Float hBiasValue = Float.valueOf(((CLArray) hBiasObject).getFloat(i3));
                        if (((CLArray) hBiasObject).size() <= 2) {
                            hLastBiasValue = hLastBiasValue3;
                            hLastBiasValue2 = hFirstBiasValue3;
                            hFirstBiasValue = hBiasValue;
                        } else {
                            hLastBiasValue = Float.valueOf(((CLArray) hBiasObject).getFloat(2));
                            hLastBiasValue2 = hFirstBiasValue3;
                            hFirstBiasValue = hBiasValue;
                        }
                    } else {
                        hLastBiasValue = hLastBiasValue3;
                        hLastBiasValue2 = hFirstBiasValue2;
                        hFirstBiasValue = Float.valueOf(hBiasObject.getFloat());
                    }
                    try {
                        flow.horizontalBias(hFirstBiasValue.floatValue());
                        if (hLastBiasValue2.floatValue() != 0.5f) {
                            flow.setFirstHorizontalBias(hLastBiasValue2.floatValue());
                        }
                        if (hLastBiasValue.floatValue() != 0.5f) {
                            flow.setLastHorizontalBias(hLastBiasValue.floatValue());
                        }
                    } catch (NumberFormatException e3) {
                    }
                    break;
                case 11:
                    CLElement vStyleObject = element.get(param);
                    String vFirstStyleValueStr = "";
                    String vLastStyleValueStr = "";
                    if ((vStyleObject instanceof CLArray) && ((CLArray) vStyleObject).size() > i3) {
                        vFirstStyleValueStr = ((CLArray) vStyleObject).getString(0);
                        vStyleValueStr = ((CLArray) vStyleObject).getString(i3);
                        if (((CLArray) vStyleObject).size() > 2) {
                            vLastStyleValueStr = ((CLArray) vStyleObject).getString(2);
                        }
                    } else {
                        vStyleValueStr = vStyleObject.content();
                    }
                    if (!vStyleValueStr.equals("")) {
                        flow.setVerticalStyle(State.Chain.getValueByString(vStyleValueStr));
                    }
                    if (!vFirstStyleValueStr.equals("")) {
                        flow.setFirstVerticalStyle(State.Chain.getValueByString(vFirstStyleValueStr));
                    }
                    if (!vLastStyleValueStr.equals("")) {
                        flow.setLastVerticalStyle(State.Chain.getValueByString(vLastStyleValueStr));
                    }
                    break;
                case 12:
                    CLElement hStyleObject = element.get(param);
                    String hFirstStyleValueStr = "";
                    String hLastStyleValueStr = "";
                    if ((hStyleObject instanceof CLArray) && ((CLArray) hStyleObject).size() > i3) {
                        hFirstStyleValueStr = ((CLArray) hStyleObject).getString(i2);
                        hStyleValueStr = ((CLArray) hStyleObject).getString(i3);
                        if (((CLArray) hStyleObject).size() > 2) {
                            hLastStyleValueStr = ((CLArray) hStyleObject).getString(2);
                        }
                    } else {
                        hStyleValueStr = hStyleObject.content();
                    }
                    if (!hStyleValueStr.equals("")) {
                        flow.setHorizontalStyle(State.Chain.getValueByString(hStyleValueStr));
                    }
                    if (!hFirstStyleValueStr.equals("")) {
                        flow.setFirstHorizontalStyle(State.Chain.getValueByString(hFirstStyleValueStr));
                    }
                    if (!hLastStyleValueStr.equals("")) {
                        flow.setLastHorizontalStyle(State.Chain.getValueByString(hLastStyleValueStr));
                    }
                    break;
                default:
                    ConstraintReference reference = state.constraints(flowName);
                    applyAttribute(state, layoutVariables, reference, element, param);
                    break;
            }
            i2 = 0;
            i3 = 1;
        }
    }

    static void parseGuideline(int orientation, State state, CLArray helper) throws CLParsingException {
        String guidelineId;
        CLElement params = helper.get(1);
        if ((params instanceof CLObject) && (guidelineId = ((CLObject) params).getStringOrNull("id")) != null) {
            parseGuidelineParams(orientation, state, guidelineId, (CLObject) params);
        }
    }

    static void parseGuidelineParams(int orientation, State state, String guidelineId, CLObject params) throws CLParsingException {
        ArrayList<String> constraints;
        ConstraintReference reference;
        boolean isLtr;
        ArrayList<String> constraints2 = params.names();
        if (constraints2 == null) {
            return;
        }
        ConstraintReference reference2 = state.constraints(guidelineId);
        if (orientation == 0) {
            state.horizontalGuideline(guidelineId);
        } else {
            state.verticalGuideline(guidelineId);
        }
        boolean isLtr2 = !state.isRtl() || orientation == 0;
        GuidelineReference guidelineReference = (GuidelineReference) reference2.getFacade();
        boolean isPercent = false;
        float value = 0.0f;
        boolean fromStart = true;
        for (String constraintName : constraints2) {
            switch (constraintName) {
                case "left":
                    constraints = constraints2;
                    reference = reference2;
                    isLtr = isLtr2;
                    float value2 = toPix(state, params.getFloat(constraintName));
                    value = value2;
                    fromStart = true;
                    break;
                case "right":
                    constraints = constraints2;
                    reference = reference2;
                    isLtr = isLtr2;
                    float value3 = toPix(state, params.getFloat(constraintName));
                    value = value3;
                    fromStart = false;
                    break;
                case "start":
                    constraints = constraints2;
                    reference = reference2;
                    isLtr = isLtr2;
                    float value4 = toPix(state, params.getFloat(constraintName));
                    value = value4;
                    fromStart = isLtr;
                    break;
                case "end":
                    constraints = constraints2;
                    reference = reference2;
                    isLtr = isLtr2;
                    float value5 = toPix(state, params.getFloat(constraintName));
                    boolean fromStart2 = !isLtr;
                    value = value5;
                    fromStart = fromStart2;
                    break;
                case "percent":
                    isPercent = true;
                    CLArray percentParams = params.getArrayOrNull(constraintName);
                    if (percentParams == null) {
                        constraints = constraints2;
                        reference = reference2;
                        isLtr = isLtr2;
                        fromStart = true;
                        value = params.getFloat(constraintName);
                        break;
                    } else {
                        constraints = constraints2;
                        reference = reference2;
                        if (percentParams.size() <= 1) {
                            isLtr = isLtr2;
                            break;
                        } else {
                            isLtr = isLtr2;
                            String origin = percentParams.getString(0);
                            value = percentParams.getFloat(1);
                            switch (origin) {
                                case "left":
                                    fromStart = true;
                                    break;
                                case "right":
                                    fromStart = false;
                                    break;
                                case "start":
                                    fromStart = isLtr;
                                    break;
                                case "end":
                                    fromStart = !isLtr;
                                    break;
                            }
                        }
                    }
                    break;
                default:
                    constraints = constraints2;
                    reference = reference2;
                    isLtr = isLtr2;
                    break;
            }
            isLtr2 = isLtr;
            constraints2 = constraints;
            reference2 = reference;
        }
        if (isPercent) {
            if (fromStart) {
                guidelineReference.percent(value);
                return;
            } else {
                guidelineReference.percent(1.0f - value);
                return;
            }
        }
        if (fromStart) {
            guidelineReference.start(Float.valueOf(value));
        } else {
            guidelineReference.end(Float.valueOf(value));
        }
    }

    static void parseBarrier(State state, String elementName, CLObject element) throws CLParsingException {
        boolean isLtr = !state.isRtl();
        BarrierReference reference = state.barrier(elementName, State.Direction.END);
        ArrayList<String> constraints = element.names();
        if (constraints == null) {
            return;
        }
        for (String constraintName : constraints) {
            switch (constraintName) {
                case "direction":
                    switch (element.getString(constraintName)) {
                        case "start":
                            if (isLtr) {
                                reference.setBarrierDirection(State.Direction.LEFT);
                                break;
                            } else {
                                reference.setBarrierDirection(State.Direction.RIGHT);
                                break;
                            }
                            break;
                        case "end":
                            if (isLtr) {
                                reference.setBarrierDirection(State.Direction.RIGHT);
                                break;
                            } else {
                                reference.setBarrierDirection(State.Direction.LEFT);
                                break;
                            }
                            break;
                        case "left":
                            reference.setBarrierDirection(State.Direction.LEFT);
                            break;
                        case "right":
                            reference.setBarrierDirection(State.Direction.RIGHT);
                            break;
                        case "top":
                            reference.setBarrierDirection(State.Direction.TOP);
                            break;
                        case "bottom":
                            reference.setBarrierDirection(State.Direction.BOTTOM);
                            break;
                    }
                    break;
                case "margin":
                    float margin = element.getFloatOrNaN(constraintName);
                    if (Float.isNaN(margin)) {
                        break;
                    } else {
                        reference.margin(Float.valueOf(toPix(state, margin)));
                        break;
                    }
                    break;
                case "contains":
                    CLArray list = element.getArrayOrNull(constraintName);
                    if (list != null) {
                        for (int j = 0; j < list.size(); j++) {
                            String elementNameReference = list.get(j).content();
                            ConstraintReference elementReference = state.constraints(elementNameReference);
                            reference.add(elementReference);
                        }
                        break;
                    } else {
                        break;
                    }
                    break;
            }
        }
    }

    static void parseWidget(State state, LayoutVariables layoutVariables, String elementName, CLObject element) throws CLParsingException {
        ConstraintReference reference = state.constraints(elementName);
        parseWidget(state, layoutVariables, reference, element);
    }

    static void applyAttribute(State state, LayoutVariables layoutVariables, ConstraintReference reference, CLObject element, String attributeName) throws CLParsingException {
        ConstraintReference targetReference;
        switch (attributeName) {
            case "width":
                reference.setWidth(parseDimension(element, attributeName, state, state.getDpToPixel()));
                break;
            case "height":
                reference.setHeight(parseDimension(element, attributeName, state, state.getDpToPixel()));
                break;
            case "center":
                String target = element.getString(attributeName);
                if (target.equals("parent")) {
                    targetReference = state.constraints(State.PARENT);
                } else {
                    targetReference = state.constraints(target);
                }
                reference.startToStart(targetReference);
                reference.endToEnd(targetReference);
                reference.topToTop(targetReference);
                reference.bottomToBottom(targetReference);
                break;
            case "centerHorizontally":
                String target2 = element.getString(attributeName);
                ConstraintReference targetReference2 = target2.equals("parent") ? state.constraints(State.PARENT) : state.constraints(target2);
                reference.startToStart(targetReference2);
                reference.endToEnd(targetReference2);
                break;
            case "centerVertically":
                String target3 = element.getString(attributeName);
                ConstraintReference targetReference3 = target3.equals("parent") ? state.constraints(State.PARENT) : state.constraints(target3);
                reference.topToTop(targetReference3);
                reference.bottomToBottom(targetReference3);
                break;
            case "alpha":
                float value = layoutVariables.get(element.get(attributeName));
                reference.alpha(value);
                break;
            case "scaleX":
                float value2 = layoutVariables.get(element.get(attributeName));
                reference.scaleX(value2);
                break;
            case "scaleY":
                float value3 = layoutVariables.get(element.get(attributeName));
                reference.scaleY(value3);
                break;
            case "translationX":
                float value4 = layoutVariables.get(element.get(attributeName));
                reference.translationX(toPix(state, value4));
                break;
            case "translationY":
                float value5 = layoutVariables.get(element.get(attributeName));
                reference.translationY(toPix(state, value5));
                break;
            case "translationZ":
                float value6 = layoutVariables.get(element.get(attributeName));
                reference.translationZ(toPix(state, value6));
                break;
            case "pivotX":
                float value7 = layoutVariables.get(element.get(attributeName));
                reference.pivotX(value7);
                break;
            case "pivotY":
                float value8 = layoutVariables.get(element.get(attributeName));
                reference.pivotY(value8);
                break;
            case "rotationX":
                float value9 = layoutVariables.get(element.get(attributeName));
                reference.rotationX(value9);
                break;
            case "rotationY":
                float value10 = layoutVariables.get(element.get(attributeName));
                reference.rotationY(value10);
                break;
            case "rotationZ":
                float value11 = layoutVariables.get(element.get(attributeName));
                reference.rotationZ(value11);
                break;
            case "visibility":
                switch (element.getString(attributeName)) {
                    case "visible":
                        reference.visibility(0);
                        break;
                    case "invisible":
                        reference.visibility(4);
                        reference.alpha(0.0f);
                        break;
                    case "gone":
                        reference.visibility(8);
                        break;
                }
                break;
            case "vBias":
                float value12 = layoutVariables.get(element.get(attributeName));
                reference.verticalBias(value12);
                break;
            case "hRtlBias":
                float value13 = layoutVariables.get(element.get(attributeName));
                if (state.isRtl()) {
                    value13 = 1.0f - value13;
                }
                reference.horizontalBias(value13);
                break;
            case "hBias":
                float value14 = layoutVariables.get(element.get(attributeName));
                reference.horizontalBias(value14);
                break;
            case "vWeight":
                float value15 = layoutVariables.get(element.get(attributeName));
                reference.setVerticalChainWeight(value15);
                break;
            case "hWeight":
                float value16 = layoutVariables.get(element.get(attributeName));
                reference.setHorizontalChainWeight(value16);
                break;
            case "custom":
                parseCustomProperties(element, reference, attributeName);
                break;
            case "motion":
                parseMotionProperties(element.get(attributeName), reference);
                break;
            default:
                parseConstraint(state, layoutVariables, element, reference, attributeName);
                break;
        }
    }

    static void parseWidget(State state, LayoutVariables layoutVariables, ConstraintReference reference, CLObject element) throws CLParsingException {
        if (reference.getWidth() == null) {
            reference.setWidth(Dimension.createWrap());
        }
        if (reference.getHeight() == null) {
            reference.setHeight(Dimension.createWrap());
        }
        ArrayList<String> constraints = element.names();
        if (constraints == null) {
            return;
        }
        for (String constraintName : constraints) {
            applyAttribute(state, layoutVariables, reference, element, constraintName);
        }
    }

    static void parseCustomProperties(CLObject element, ConstraintReference reference, String constraintName) throws CLParsingException {
        ArrayList<String> properties;
        CLObject json = element.getObjectOrNull(constraintName);
        if (json == null || (properties = json.names()) == null) {
            return;
        }
        for (String property : properties) {
            CLElement value = json.get(property);
            if (value instanceof CLNumber) {
                reference.addCustomFloat(property, value.getFloat());
            } else if (value instanceof CLString) {
                long it = parseColorString(value.content());
                if (it != -1) {
                    reference.addCustomColor(property, (int) it);
                }
            }
        }
    }

    private static int indexOf(String val, String... types) {
        for (int i = 0; i < types.length; i++) {
            if (types[i].equals(val)) {
                return i;
            }
        }
        return -1;
    }

    private static void parseMotionProperties(CLElement element, ConstraintReference reference) throws CLParsingException {
        if (!(element instanceof CLObject)) {
            return;
        }
        CLObject obj = (CLObject) element;
        TypedBundle bundle = new TypedBundle();
        ArrayList<String> constraints = obj.names();
        if (constraints == null) {
            return;
        }
        for (String constraintName : constraints) {
            switch (constraintName) {
                case "pathArc":
                    String val = obj.getString(constraintName);
                    int ord = indexOf(val, "none", "startVertical", "startHorizontal", "flip", "below", "above");
                    if (ord == -1) {
                        System.err.println(obj.getLine() + " pathArc = '" + val + "'");
                        break;
                    } else {
                        bundle.add(TypedValues.MotionType.TYPE_PATHMOTION_ARC, ord);
                        break;
                    }
                    break;
                case "relativeTo":
                    bundle.add(TypedValues.MotionType.TYPE_ANIMATE_RELATIVE_TO, obj.getString(constraintName));
                    break;
                case "easing":
                    bundle.add(TypedValues.MotionType.TYPE_EASING, obj.getString(constraintName));
                    break;
                case "stagger":
                    bundle.add(600, obj.getFloat(constraintName));
                    break;
                case "quantize":
                    CLElement quant = obj.get(constraintName);
                    if (quant instanceof CLArray) {
                        CLArray array = (CLArray) quant;
                        int len = array.size();
                        if (len > 0) {
                            bundle.add(TypedValues.MotionType.TYPE_QUANTIZE_MOTIONSTEPS, array.getInt(0));
                            if (len > 1) {
                                bundle.add(TypedValues.MotionType.TYPE_QUANTIZE_INTERPOLATOR_TYPE, array.getString(1));
                                if (len > 2) {
                                    bundle.add(TypedValues.MotionType.TYPE_QUANTIZE_MOTION_PHASE, array.getFloat(2));
                                }
                            }
                        }
                        break;
                    } else {
                        bundle.add(TypedValues.MotionType.TYPE_QUANTIZE_MOTIONSTEPS, obj.getInt(constraintName));
                        break;
                    }
                    break;
            }
        }
        reference.mMotionProperties = bundle;
    }

    /* JADX WARN: Code duplicated, block: B:38:0x00c7  */
    /* JADX WARN: Code duplicated, block: B:45:0x00e2  */
    static void parseConstraint(State state, LayoutVariables layoutVariables, CLObject element, ConstraintReference reference, String constraintName) throws CLParsingException {
        ConstraintReference targetReference;
        ConstraintReference targetReference2;
        byte b;
        boolean isHorizontalConstraint;
        boolean isHorOriginLeft;
        boolean isLtr = !state.isRtl();
        CLArray constraint = element.getArrayOrNull(constraintName);
        if (constraint != null && constraint.size() > 1) {
            String target = constraint.getString(0);
            String anchor = constraint.getStringOrNull(1);
            float margin = 0.0f;
            float marginGone = 0.0f;
            if (constraint.size() > 2) {
                CLElement arg2 = constraint.getOrNull(2);
                float margin2 = layoutVariables.get(arg2);
                margin = toPix(state, margin2);
            }
            if (constraint.size() > 3) {
                CLElement arg3 = constraint.getOrNull(3);
                float marginGone2 = layoutVariables.get(arg3);
                marginGone = toPix(state, marginGone2);
            }
            if (target.equals("parent")) {
                targetReference2 = state.constraints(State.PARENT);
            } else {
                targetReference2 = state.constraints(target);
            }
            boolean isHorTargetLeft = true;
            switch (constraintName) {
                case "circular":
                    float angle = layoutVariables.get(constraint.get(1));
                    float distance = 0.0f;
                    b = 2;
                    if (constraint.size() > 2) {
                        CLElement distanceArg = constraint.getOrNull(2);
                        float distance2 = layoutVariables.get(distanceArg);
                        distance = toPix(state, distance2);
                    }
                    reference.circularConstraint(targetReference2, angle, distance);
                    isHorizontalConstraint = false;
                    isHorOriginLeft = true;
                    break;
                case "top":
                    switch (anchor) {
                        case "top":
                            reference.topToTop(targetReference2);
                            break;
                        case "bottom":
                            reference.topToBottom(targetReference2);
                            break;
                        case "baseline":
                            state.baselineNeededFor(targetReference2.getKey());
                            reference.topToBaseline(targetReference2);
                            break;
                    }
                    b = 2;
                    isHorizontalConstraint = false;
                    isHorOriginLeft = true;
                    break;
                case "bottom":
                    switch (anchor) {
                        case "top":
                            reference.bottomToTop(targetReference2);
                            break;
                        case "bottom":
                            reference.bottomToBottom(targetReference2);
                            break;
                        case "baseline":
                            state.baselineNeededFor(targetReference2.getKey());
                            reference.bottomToBaseline(targetReference2);
                            break;
                    }
                    b = 2;
                    isHorizontalConstraint = false;
                    isHorOriginLeft = true;
                    break;
                case "baseline":
                    switch (anchor) {
                        case "baseline":
                            state.baselineNeededFor(reference.getKey());
                            state.baselineNeededFor(targetReference2.getKey());
                            reference.baselineToBaseline(targetReference2);
                            break;
                        case "top":
                            state.baselineNeededFor(reference.getKey());
                            reference.baselineToTop(targetReference2);
                            break;
                        case "bottom":
                            state.baselineNeededFor(reference.getKey());
                            reference.baselineToBottom(targetReference2);
                            break;
                    }
                    b = 2;
                    isHorizontalConstraint = false;
                    isHorOriginLeft = true;
                    break;
                case "left":
                    isHorizontalConstraint = true;
                    isHorOriginLeft = true;
                    b = 2;
                    break;
                case "right":
                    isHorizontalConstraint = true;
                    isHorOriginLeft = false;
                    b = 2;
                    break;
                case "start":
                    isHorizontalConstraint = true;
                    isHorOriginLeft = isLtr;
                    b = 2;
                    break;
                case "end":
                    isHorizontalConstraint = true;
                    isHorOriginLeft = !isLtr;
                    b = 2;
                    break;
                default:
                    b = 2;
                    isHorizontalConstraint = false;
                    isHorOriginLeft = true;
                    break;
            }
            if (isHorizontalConstraint) {
                switch (anchor.hashCode()) {
                    case 100571:
                        b = !anchor.equals("end") ? (byte) -1 : (byte) 3;
                        break;
                    case 3317767:
                        b = !anchor.equals("left") ? (byte) -1 : (byte) 0;
                        break;
                    case 108511772:
                        b = !anchor.equals("right") ? (byte) -1 : (byte) 1;
                        break;
                    case 109757538:
                        if (!anchor.equals("start")) {
                            b = -1;
                        }
                        break;
                    default:
                        b = -1;
                        break;
                }
                switch (b) {
                    case 0:
                        isHorTargetLeft = true;
                        break;
                    case 1:
                        isHorTargetLeft = false;
                        break;
                    case 2:
                        isHorTargetLeft = isLtr;
                        break;
                    case 3:
                        isHorTargetLeft = !isLtr;
                        break;
                }
                if (isHorOriginLeft) {
                    if (isHorTargetLeft) {
                        reference.leftToLeft(targetReference2);
                    } else {
                        reference.leftToRight(targetReference2);
                    }
                } else if (isHorTargetLeft) {
                    reference.rightToLeft(targetReference2);
                } else {
                    reference.rightToRight(targetReference2);
                }
            }
            reference.margin(Float.valueOf(margin)).marginGone(Float.valueOf(marginGone));
            return;
        }
        byte b2 = 2;
        String target2 = element.getStringOrNull(constraintName);
        if (target2 != null) {
            if (target2.equals("parent")) {
                targetReference = state.constraints(State.PARENT);
            } else {
                targetReference = state.constraints(target2);
            }
            switch (constraintName.hashCode()) {
                case -1720785339:
                    b2 = !constraintName.equals("baseline") ? (byte) -1 : (byte) 4;
                    break;
                case -1383228885:
                    b2 = !constraintName.equals("bottom") ? (byte) -1 : (byte) 3;
                    break;
                case 100571:
                    b2 = !constraintName.equals("end") ? (byte) -1 : (byte) 1;
                    break;
                case 115029:
                    if (!constraintName.equals("top")) {
                        b2 = -1;
                    }
                    break;
                case 109757538:
                    b2 = !constraintName.equals("start") ? (byte) -1 : (byte) 0;
                    break;
                default:
                    b2 = -1;
                    break;
            }
            switch (b2) {
                case 0:
                    if (isLtr) {
                        reference.leftToLeft(targetReference);
                    } else {
                        reference.rightToRight(targetReference);
                    }
                    break;
                case 1:
                    if (isLtr) {
                        reference.rightToRight(targetReference);
                    } else {
                        reference.leftToLeft(targetReference);
                    }
                    break;
                case 2:
                    reference.topToTop(targetReference);
                    break;
                case 3:
                    reference.bottomToBottom(targetReference);
                    break;
                case 4:
                    state.baselineNeededFor(reference.getKey());
                    state.baselineNeededFor(targetReference.getKey());
                    reference.baselineToBaseline(targetReference);
                    break;
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code duplicated, block: B:17:0x0037  */
    static Dimension parseDimensionMode(String dimensionString) {
        Dimension dimension = Dimension.createFixed(0);
        switch (dimensionString) {
            case "wrap":
                Dimension dimension2 = Dimension.createWrap();
                return dimension2;
            case "preferWrap":
                Dimension dimension3 = Dimension.createSuggested(Dimension.WRAP_DIMENSION);
                return dimension3;
            case "spread":
                Dimension dimension4 = Dimension.createSuggested(Dimension.SPREAD_DIMENSION);
                return dimension4;
            case "parent":
                Dimension dimension5 = Dimension.createParent();
                return dimension5;
            default:
                if (dimensionString.endsWith("%")) {
                    String percentString = dimensionString.substring(0, dimensionString.indexOf(37));
                    float percentValue = Float.parseFloat(percentString) / 100.0f;
                    Dimension dimension6 = Dimension.createPercent(0, percentValue).suggested(0);
                    return dimension6;
                }
                if (dimensionString.contains(":")) {
                    Dimension dimension7 = Dimension.createRatio(dimensionString).suggested(Dimension.SPREAD_DIMENSION);
                    return dimension7;
                }
                return dimension;
        }
    }

    static Dimension parseDimension(CLObject element, String constraintName, State state, CorePixelDp dpToPixels) throws CLParsingException {
        CLElement dimensionElement = element.get(constraintName);
        Dimension dimension = Dimension.createFixed(0);
        if (dimensionElement instanceof CLString) {
            return parseDimensionMode(dimensionElement.content());
        }
        if (dimensionElement instanceof CLNumber) {
            return Dimension.createFixed(state.convertDimension(Float.valueOf(dpToPixels.toPixels(element.getFloat(constraintName)))));
        }
        if (dimensionElement instanceof CLObject) {
            CLObject obj = (CLObject) dimensionElement;
            String mode = obj.getStringOrNull("value");
            if (mode != null) {
                dimension = parseDimensionMode(mode);
            }
            CLElement minEl = obj.getOrNull("min");
            if (minEl != null) {
                if (minEl instanceof CLNumber) {
                    float min = ((CLNumber) minEl).getFloat();
                    dimension.min(state.convertDimension(Float.valueOf(dpToPixels.toPixels(min))));
                } else if (minEl instanceof CLString) {
                    dimension.min(Dimension.WRAP_DIMENSION);
                }
            }
            CLElement maxEl = obj.getOrNull("max");
            if (maxEl != null) {
                if (maxEl instanceof CLNumber) {
                    float max = ((CLNumber) maxEl).getFloat();
                    dimension.max(state.convertDimension(Float.valueOf(dpToPixels.toPixels(max))));
                    return dimension;
                }
                if (maxEl instanceof CLString) {
                    dimension.max(Dimension.WRAP_DIMENSION);
                    return dimension;
                }
                return dimension;
            }
            return dimension;
        }
        return dimension;
    }

    static long parseColorString(String value) {
        if (value.startsWith("#")) {
            String str = value.substring(1);
            if (str.length() == 6) {
                str = "FF" + str;
            }
            return Long.parseLong(str, 16);
        }
        return -1L;
    }

    static String lookForType(CLObject element) throws CLParsingException {
        ArrayList<String> constraints = element.names();
        for (String constraintName : constraints) {
            if (constraintName.equals(ClassDiscriminatorModeKt.CLASS_DISCRIMINATOR_KEY)) {
                return element.getString(ClassDiscriminatorModeKt.CLASS_DISCRIMINATOR_KEY);
            }
        }
        return null;
    }
}
