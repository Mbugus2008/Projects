package com.facebook.stetho.inspector.protocol.module;

import com.facebook.stetho.common.ListUtil;
import com.facebook.stetho.common.LogUtil;
import com.facebook.stetho.common.StringUtil;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.inspector.elements.ComputedStyleAccumulator;
import com.facebook.stetho.inspector.elements.Document;
import com.facebook.stetho.inspector.elements.Origin;
import com.facebook.stetho.inspector.elements.StyleAccumulator;
import com.facebook.stetho.inspector.elements.StyleRuleNameAccumulator;
import com.facebook.stetho.inspector.helper.ChromePeerManager;
import com.facebook.stetho.inspector.helper.PeersRegisteredListener;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcPeer;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcResult;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsDomain;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsMethod;
import com.facebook.stetho.json.ObjectMapper;
import com.facebook.stetho.json.annotation.JsonProperty;
import com.google.android.material.ripple.RippleUtils;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class CSS implements ChromeDevtoolsDomain {
    private final Document mDocument;
    private final ObjectMapper mObjectMapper = new ObjectMapper();
    private final ChromePeerManager mPeerManager = new ChromePeerManager();

    private static class PseudoIdMatches {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public List<RuleMatch> matches = new ArrayList();

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int pseudoId;
    }

    public CSS(Document document) {
        this.mDocument = (Document) Util.throwIfNull(document);
        this.mPeerManager.setListener(new PeerManagerListener());
    }

    @ChromeDevtoolsMethod
    public void enable(JsonRpcPeer peer, JSONObject params) {
    }

    @ChromeDevtoolsMethod
    public void disable(JsonRpcPeer peer, JSONObject params) {
    }

    @ChromeDevtoolsMethod
    public JsonRpcResult getComputedStyleForNode(JsonRpcPeer peer, JSONObject params) {
        final GetComputedStyleForNodeRequest request = (GetComputedStyleForNodeRequest) this.mObjectMapper.convertValue(params, GetComputedStyleForNodeRequest.class);
        final GetComputedStyleForNodeResult result = new GetComputedStyleForNodeResult();
        result.computedStyle = new ArrayList();
        this.mDocument.postAndWait(new Runnable() { // from class: com.facebook.stetho.inspector.protocol.module.CSS.1
            @Override // java.lang.Runnable
            public void run() {
                Object element = CSS.this.mDocument.getElementForNodeId(request.nodeId);
                if (element != null) {
                    CSS.this.mDocument.getElementComputedStyles(element, new ComputedStyleAccumulator() { // from class: com.facebook.stetho.inspector.protocol.module.CSS.1.1
                        @Override // com.facebook.stetho.inspector.elements.ComputedStyleAccumulator
                        public void store(String name, String value) {
                            CSSComputedStyleProperty property = new CSSComputedStyleProperty();
                            property.name = name;
                            property.value = value;
                            result.computedStyle.add(property);
                        }
                    });
                } else {
                    LogUtil.e("Tried to get the style of an element that does not exist, using nodeid=" + request.nodeId);
                }
            }
        });
        return result;
    }

    @ChromeDevtoolsMethod
    public JsonRpcResult getMatchedStylesForNode(JsonRpcPeer peer, JSONObject params) {
        final GetMatchedStylesForNodeRequest request = (GetMatchedStylesForNodeRequest) this.mObjectMapper.convertValue(params, GetMatchedStylesForNodeRequest.class);
        final GetMatchedStylesForNodeResult result = new GetMatchedStylesForNodeResult();
        result.matchedCSSRules = new ArrayList();
        result.inherited = Collections.emptyList();
        result.pseudoElements = Collections.emptyList();
        this.mDocument.postAndWait(new Runnable() { // from class: com.facebook.stetho.inspector.protocol.module.CSS.2
            @Override // java.lang.Runnable
            public void run() {
                final Object elementForNodeId = CSS.this.mDocument.getElementForNodeId(request.nodeId);
                if (elementForNodeId != null) {
                    CSS.this.mDocument.getElementStyleRuleNames(elementForNodeId, new StyleRuleNameAccumulator() { // from class: com.facebook.stetho.inspector.protocol.module.CSS.2.1
                        @Override // com.facebook.stetho.inspector.elements.StyleRuleNameAccumulator
                        public void store(String ruleName, boolean editable) {
                            final ArrayList<CSSProperty> properties = new ArrayList<>();
                            RuleMatch match = new RuleMatch();
                            match.matchingSelectors = ListUtil.newImmutableList(0);
                            Selector selector = new Selector();
                            selector.value = ruleName;
                            CSSRule rule = new CSSRule();
                            rule.origin = Origin.REGULAR;
                            rule.selectorList = new SelectorList();
                            rule.selectorList.selectors = ListUtil.newImmutableList(selector);
                            rule.style = new CSSStyle();
                            rule.style.cssProperties = properties;
                            rule.style.shorthandEntries = Collections.emptyList();
                            if (editable) {
                                rule.style.styleSheetId = String.format("%s.%s", Integer.toString(request.nodeId), selector.value);
                            }
                            CSS.this.mDocument.getElementStyles(elementForNodeId, ruleName, new StyleAccumulator() { // from class: com.facebook.stetho.inspector.protocol.module.CSS.2.1.1
                                @Override // com.facebook.stetho.inspector.elements.StyleAccumulator
                                public void store(String name, String value, boolean isDefault) {
                                    CSSProperty property = new CSSProperty();
                                    property.name = name;
                                    property.value = value;
                                    properties.add(property);
                                }
                            });
                            match.rule = rule;
                            result.matchedCSSRules.add(match);
                        }
                    });
                } else {
                    LogUtil.w("Failed to get style of an element that does not exist, nodeid=" + request.nodeId);
                }
            }
        });
        return result;
    }

    @ChromeDevtoolsMethod
    public SetPropertyTextResult setPropertyText(JsonRpcPeer peer, JSONObject params) {
        final String key;
        final String value;
        SetPropertyTextRequest request = (SetPropertyTextRequest) this.mObjectMapper.convertValue(params, SetPropertyTextRequest.class);
        String[] parts = request.styleSheetId.split("\\.", 2);
        final int nodeId = Integer.parseInt(parts[0]);
        final String ruleName = parts[1];
        if (request.text == null || !request.text.contains(":")) {
            key = null;
            value = null;
        } else {
            String[] keyValue = request.text.split(":", 2);
            String key2 = keyValue[0].trim();
            key = key2;
            value = StringUtil.removeAll(keyValue[1], ';').trim();
        }
        final SetPropertyTextResult result = new SetPropertyTextResult();
        result.style = new CSSStyle();
        result.style.styleSheetId = request.styleSheetId;
        result.style.cssProperties = new ArrayList();
        result.style.shorthandEntries = Collections.emptyList();
        this.mDocument.postAndWait(new Runnable() { // from class: com.facebook.stetho.inspector.protocol.module.CSS.3
            @Override // java.lang.Runnable
            public void run() {
                Object elementForNodeId = CSS.this.mDocument.getElementForNodeId(nodeId);
                if (elementForNodeId == null) {
                    LogUtil.w("Failed to get style of an element that does not exist, nodeid=" + nodeId);
                    return;
                }
                if (key != null) {
                    CSS.this.mDocument.setElementStyle(elementForNodeId, ruleName, key, value);
                }
                CSS.this.mDocument.getElementStyles(elementForNodeId, ruleName, new StyleAccumulator() { // from class: com.facebook.stetho.inspector.protocol.module.CSS.3.1
                    @Override // com.facebook.stetho.inspector.elements.StyleAccumulator
                    public void store(String name, String value2, boolean isDefault) {
                        CSSProperty property = new CSSProperty();
                        property.name = name;
                        property.value = value2;
                        result.style.cssProperties.add(property);
                    }
                });
            }
        });
        return result;
    }

    private final class PeerManagerListener extends PeersRegisteredListener {
        private PeerManagerListener() {
        }

        @Override // com.facebook.stetho.inspector.helper.PeersRegisteredListener
        protected synchronized void onFirstPeerRegistered() {
            CSS.this.mDocument.addRef();
        }

        @Override // com.facebook.stetho.inspector.helper.PeersRegisteredListener
        protected synchronized void onLastPeerUnregistered() {
            CSS.this.mDocument.release();
        }
    }

    private static class CSSComputedStyleProperty {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String name;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String value;

        private CSSComputedStyleProperty() {
        }
    }

    private static class RuleMatch {

        @JsonProperty
        public List<Integer> matchingSelectors;

        @JsonProperty
        public CSSRule rule;

        private RuleMatch() {
        }
    }

    private static class SelectorList {

        @JsonProperty
        public List<Selector> selectors;

        @JsonProperty
        public String text;

        private SelectorList() {
        }
    }

    private static class SourceRange {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int endColumn;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int endLine;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int startColumn;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int startLine;

        private SourceRange() {
        }
    }

    private static class Selector {

        @JsonProperty
        public SourceRange range;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String value;

        private Selector() {
        }
    }

    private static class CSSRule {

        @JsonProperty
        public Origin origin;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public SelectorList selectorList;

        @JsonProperty
        public CSSStyle style;

        @JsonProperty
        public String styleSheetId;

        private CSSRule() {
        }
    }

    private static class CSSStyle {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public List<CSSProperty> cssProperties;

        @JsonProperty
        public String cssText;

        @JsonProperty
        public SourceRange range;

        @JsonProperty
        public List<ShorthandEntry> shorthandEntries;

        @JsonProperty
        public String styleSheetId;

        private CSSStyle() {
        }
    }

    private static class ShorthandEntry {

        @JsonProperty
        public Boolean important;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String name;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String value;

        private ShorthandEntry() {
        }
    }

    private static class CSSProperty {

        @JsonProperty
        public Boolean disabled;

        @JsonProperty
        public Boolean implicit;

        @JsonProperty
        public Boolean important;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String name;

        @JsonProperty
        public Boolean parsedOk;

        @JsonProperty
        public SourceRange range;

        @JsonProperty
        public String text;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String value;

        private CSSProperty() {
        }
    }

    private static class GetComputedStyleForNodeRequest {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int nodeId;

        private GetComputedStyleForNodeRequest() {
        }
    }

    private static class InheritedStyleEntry {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public CSSStyle inlineStyle;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public List<RuleMatch> matchedCSSRules;

        private InheritedStyleEntry() {
        }
    }

    private static class GetComputedStyleForNodeResult implements JsonRpcResult {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public List<CSSComputedStyleProperty> computedStyle;

        private GetComputedStyleForNodeResult() {
        }
    }

    private static class GetMatchedStylesForNodeRequest implements JsonRpcResult {

        @JsonProperty
        public Boolean excludeInherited;

        @JsonProperty
        public Boolean excludePseudo;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int nodeId;

        private GetMatchedStylesForNodeRequest() {
        }
    }

    private static class GetMatchedStylesForNodeResult implements JsonRpcResult {

        @JsonProperty
        public List<InheritedStyleEntry> inherited;

        @JsonProperty
        public List<RuleMatch> matchedCSSRules;

        @JsonProperty
        public List<PseudoIdMatches> pseudoElements;

        private GetMatchedStylesForNodeResult() {
        }
    }

    private static class SetPropertyTextRequest implements JsonRpcResult {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String styleSheetId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String text;

        private SetPropertyTextRequest() {
        }
    }

    private static class SetPropertyTextResult implements JsonRpcResult {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public CSSStyle style;

        private SetPropertyTextResult() {
        }
    }
}
