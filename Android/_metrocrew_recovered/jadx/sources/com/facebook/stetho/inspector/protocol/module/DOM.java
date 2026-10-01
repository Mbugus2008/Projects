package com.facebook.stetho.inspector.protocol.module;

import android.graphics.Color;
import com.facebook.stetho.common.Accumulator;
import com.facebook.stetho.common.ArrayListAccumulator;
import com.facebook.stetho.common.LogUtil;
import com.facebook.stetho.common.UncheckedCallable;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.inspector.elements.Document;
import com.facebook.stetho.inspector.elements.DocumentView;
import com.facebook.stetho.inspector.elements.ElementInfo;
import com.facebook.stetho.inspector.elements.NodeDescriptor;
import com.facebook.stetho.inspector.elements.NodeType;
import com.facebook.stetho.inspector.helper.ChromePeerManager;
import com.facebook.stetho.inspector.helper.PeersRegisteredListener;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcException;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcPeer;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcResult;
import com.facebook.stetho.inspector.jsonrpc.protocol.JsonRpcError;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsDomain;
import com.facebook.stetho.inspector.protocol.ChromeDevtoolsMethod;
import com.facebook.stetho.json.ObjectMapper;
import com.facebook.stetho.json.annotation.JsonProperty;
import com.google.android.material.ripple.RippleUtils;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import javax.annotation.Nullable;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class DOM implements ChromeDevtoolsDomain {
    private ChildNodeInsertedEvent mCachedChildNodeInsertedEvent;
    private ChildNodeRemovedEvent mCachedChildNodeRemovedEvent;
    private final Document mDocument;
    private final DocumentUpdateListener mListener;
    private final ObjectMapper mObjectMapper = new ObjectMapper();
    private final Map<String, List<Integer>> mSearchResults = Collections.synchronizedMap(new HashMap());
    private final AtomicInteger mResultCounter = new AtomicInteger(0);
    private final ChromePeerManager mPeerManager = new ChromePeerManager();

    public DOM(Document document) {
        this.mDocument = (Document) Util.throwIfNull(document);
        this.mPeerManager.setListener(new PeerManagerListener());
        this.mListener = new DocumentUpdateListener();
    }

    @ChromeDevtoolsMethod
    public void enable(JsonRpcPeer peer, JSONObject params) {
        this.mPeerManager.addPeer(peer);
    }

    @ChromeDevtoolsMethod
    public void disable(JsonRpcPeer peer, JSONObject params) {
        this.mPeerManager.removePeer(peer);
    }

    @ChromeDevtoolsMethod
    public JsonRpcResult getDocument(JsonRpcPeer peer, JSONObject params) {
        GetDocumentResponse result = new GetDocumentResponse();
        result.root = (Node) this.mDocument.postAndWait(new UncheckedCallable<Node>() { // from class: com.facebook.stetho.inspector.protocol.module.DOM.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.facebook.stetho.common.UncheckedCallable
            public Node call() {
                Object element = DOM.this.mDocument.getRootElement();
                return DOM.this.createNodeForElement(element, DOM.this.mDocument.getDocumentView(), null);
            }
        });
        return result;
    }

    @ChromeDevtoolsMethod
    public void highlightNode(JsonRpcPeer peer, JSONObject params) {
        final HighlightNodeRequest request = (HighlightNodeRequest) this.mObjectMapper.convertValue(params, HighlightNodeRequest.class);
        if (request.nodeId == null) {
            LogUtil.w("DOM.highlightNode was not given a nodeId; JS objectId is not supported");
            return;
        }
        final RGBAColor contentColor = request.highlightConfig.contentColor;
        if (contentColor == null) {
            LogUtil.w("DOM.highlightNode was not given a color to highlight with");
        } else {
            this.mDocument.postAndWait(new Runnable() { // from class: com.facebook.stetho.inspector.protocol.module.DOM.2
                @Override // java.lang.Runnable
                public void run() {
                    Object element = DOM.this.mDocument.getElementForNodeId(request.nodeId.intValue());
                    if (element != null) {
                        DOM.this.mDocument.highlightElement(element, contentColor.getColor());
                    }
                }
            });
        }
    }

    @ChromeDevtoolsMethod
    public void hideHighlight(JsonRpcPeer peer, JSONObject params) {
        this.mDocument.postAndWait(new Runnable() { // from class: com.facebook.stetho.inspector.protocol.module.DOM.3
            @Override // java.lang.Runnable
            public void run() {
                DOM.this.mDocument.hideHighlight();
            }
        });
    }

    @ChromeDevtoolsMethod
    public ResolveNodeResponse resolveNode(JsonRpcPeer peer, JSONObject params) throws JsonRpcException {
        final ResolveNodeRequest request = (ResolveNodeRequest) this.mObjectMapper.convertValue(params, ResolveNodeRequest.class);
        Object element = this.mDocument.postAndWait(new UncheckedCallable<Object>() { // from class: com.facebook.stetho.inspector.protocol.module.DOM.4
            @Override // com.facebook.stetho.common.UncheckedCallable
            public Object call() {
                return DOM.this.mDocument.getElementForNodeId(request.nodeId);
            }
        });
        if (element == null) {
            throw new JsonRpcException(new JsonRpcError(JsonRpcError.ErrorCode.INVALID_PARAMS, "No known nodeId=" + request.nodeId, null));
        }
        int mappedObjectId = Runtime.mapObject(peer, element);
        Runtime.RemoteObject remoteObject = new Runtime.RemoteObject();
        remoteObject.type = Runtime.ObjectType.OBJECT;
        remoteObject.subtype = Runtime.ObjectSubType.NODE;
        remoteObject.className = element.getClass().getName();
        remoteObject.value = null;
        remoteObject.description = null;
        remoteObject.objectId = String.valueOf(mappedObjectId);
        ResolveNodeResponse response = new ResolveNodeResponse();
        response.object = remoteObject;
        return response;
    }

    @ChromeDevtoolsMethod
    public void setAttributesAsText(JsonRpcPeer peer, JSONObject params) {
        final SetAttributesAsTextRequest request = (SetAttributesAsTextRequest) this.mObjectMapper.convertValue(params, SetAttributesAsTextRequest.class);
        this.mDocument.postAndWait(new Runnable() { // from class: com.facebook.stetho.inspector.protocol.module.DOM.5
            @Override // java.lang.Runnable
            public void run() {
                Object element = DOM.this.mDocument.getElementForNodeId(request.nodeId);
                if (element != null) {
                    DOM.this.mDocument.setAttributesAsText(element, request.text);
                }
            }
        });
    }

    @ChromeDevtoolsMethod
    public void setInspectModeEnabled(JsonRpcPeer peer, JSONObject params) {
        final SetInspectModeEnabledRequest request = (SetInspectModeEnabledRequest) this.mObjectMapper.convertValue(params, SetInspectModeEnabledRequest.class);
        this.mDocument.postAndWait(new Runnable() { // from class: com.facebook.stetho.inspector.protocol.module.DOM.6
            @Override // java.lang.Runnable
            public void run() {
                DOM.this.mDocument.setInspectModeEnabled(request.enabled);
            }
        });
    }

    @ChromeDevtoolsMethod
    public PerformSearchResponse performSearch(JsonRpcPeer peer, JSONObject params) {
        final PerformSearchRequest request = (PerformSearchRequest) this.mObjectMapper.convertValue(params, PerformSearchRequest.class);
        final ArrayListAccumulator<Integer> resultNodeIds = new ArrayListAccumulator<>();
        this.mDocument.postAndWait(new Runnable() { // from class: com.facebook.stetho.inspector.protocol.module.DOM.7
            @Override // java.lang.Runnable
            public void run() {
                DOM.this.mDocument.findMatchingElements(request.query, resultNodeIds);
            }
        });
        String searchId = String.valueOf(this.mResultCounter.getAndIncrement());
        this.mSearchResults.put(searchId, resultNodeIds);
        PerformSearchResponse response = new PerformSearchResponse();
        response.searchId = searchId;
        response.resultCount = resultNodeIds.size();
        return response;
    }

    @ChromeDevtoolsMethod
    public GetSearchResultsResponse getSearchResults(JsonRpcPeer peer, JSONObject params) {
        GetSearchResultsRequest request = (GetSearchResultsRequest) this.mObjectMapper.convertValue(params, GetSearchResultsRequest.class);
        if (request.searchId == null) {
            LogUtil.w("searchId may not be null");
            return null;
        }
        List<Integer> results = this.mSearchResults.get(request.searchId);
        if (results == null) {
            LogUtil.w("\"" + request.searchId + "\" is not a valid reference to a search result");
            return null;
        }
        List<Integer> resultsRange = results.subList(request.fromIndex, request.toIndex);
        GetSearchResultsResponse response = new GetSearchResultsResponse();
        response.nodeIds = resultsRange;
        return response;
    }

    @ChromeDevtoolsMethod
    public void discardSearchResults(JsonRpcPeer peer, JSONObject params) {
        DiscardSearchResultsRequest request = (DiscardSearchResultsRequest) this.mObjectMapper.convertValue(params, DiscardSearchResultsRequest.class);
        if (request.searchId != null) {
            this.mSearchResults.remove(request.searchId);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Node createNodeForElement(Object element, DocumentView view, @Nullable Accumulator<Object> processedElements) {
        List<Node> childrenNodes;
        if (processedElements != null) {
            processedElements.store(element);
        }
        NodeDescriptor descriptor = this.mDocument.getNodeDescriptor(element);
        Node node = new Node();
        node.nodeId = this.mDocument.getNodeIdForElement(element).intValue();
        node.nodeType = descriptor.getNodeType(element);
        node.nodeName = descriptor.getNodeName(element);
        node.localName = descriptor.getLocalName(element);
        node.nodeValue = descriptor.getNodeValue(element);
        Document.AttributeListAccumulator accumulator = new Document.AttributeListAccumulator();
        descriptor.getAttributes(element, accumulator);
        node.attributes = accumulator;
        ElementInfo elementInfo = view.getElementInfo(element);
        if (elementInfo.children.size() == 0) {
            childrenNodes = Collections.emptyList();
        } else {
            childrenNodes = new ArrayList<>(elementInfo.children.size());
        }
        int N = elementInfo.children.size();
        for (int i = 0; i < N; i++) {
            Object childElement = elementInfo.children.get(i);
            Node childNode = createNodeForElement(childElement, view, processedElements);
            childrenNodes.add(childNode);
        }
        node.children = childrenNodes;
        node.childNodeCount = Integer.valueOf(childrenNodes.size());
        return node;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ChildNodeInsertedEvent acquireChildNodeInsertedEvent() {
        ChildNodeInsertedEvent childNodeInsertedEvent = this.mCachedChildNodeInsertedEvent;
        if (childNodeInsertedEvent == null) {
            childNodeInsertedEvent = new ChildNodeInsertedEvent();
        }
        this.mCachedChildNodeInsertedEvent = null;
        return childNodeInsertedEvent;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void releaseChildNodeInsertedEvent(ChildNodeInsertedEvent childNodeInsertedEvent) {
        childNodeInsertedEvent.parentNodeId = -1;
        childNodeInsertedEvent.previousNodeId = -1;
        childNodeInsertedEvent.node = null;
        if (this.mCachedChildNodeInsertedEvent == null) {
            this.mCachedChildNodeInsertedEvent = childNodeInsertedEvent;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ChildNodeRemovedEvent acquireChildNodeRemovedEvent() {
        ChildNodeRemovedEvent childNodeRemovedEvent = this.mCachedChildNodeRemovedEvent;
        if (childNodeRemovedEvent == null) {
            childNodeRemovedEvent = new ChildNodeRemovedEvent();
        }
        this.mCachedChildNodeRemovedEvent = null;
        return childNodeRemovedEvent;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void releaseChildNodeRemovedEvent(ChildNodeRemovedEvent childNodeRemovedEvent) {
        childNodeRemovedEvent.parentNodeId = -1;
        childNodeRemovedEvent.nodeId = -1;
        if (this.mCachedChildNodeRemovedEvent == null) {
            this.mCachedChildNodeRemovedEvent = childNodeRemovedEvent;
        }
    }

    private final class DocumentUpdateListener implements Document.UpdateListener {
        private DocumentUpdateListener() {
        }

        @Override // com.facebook.stetho.inspector.elements.Document.UpdateListener
        public void onAttributeModified(Object element, String name, String value) {
            AttributeModifiedEvent message = new AttributeModifiedEvent();
            message.nodeId = DOM.this.mDocument.getNodeIdForElement(element).intValue();
            message.name = name;
            message.value = value;
            DOM.this.mPeerManager.sendNotificationToPeers("DOM.attributeModified", message);
        }

        @Override // com.facebook.stetho.inspector.elements.Document.UpdateListener
        public void onAttributeRemoved(Object element, String name) {
            AttributeRemovedEvent message = new AttributeRemovedEvent();
            message.nodeId = DOM.this.mDocument.getNodeIdForElement(element).intValue();
            message.name = name;
            DOM.this.mPeerManager.sendNotificationToPeers("DOM.attributeRemoved", message);
        }

        @Override // com.facebook.stetho.inspector.elements.Document.UpdateListener
        public void onInspectRequested(Object element) {
            Integer nodeId = DOM.this.mDocument.getNodeIdForElement(element);
            if (nodeId == null) {
                LogUtil.d("DocumentProvider.Listener.onInspectRequested() called for a non-mapped node: element=%s", element);
                return;
            }
            InspectNodeRequestedEvent message = new InspectNodeRequestedEvent();
            message.nodeId = nodeId.intValue();
            DOM.this.mPeerManager.sendNotificationToPeers("DOM.inspectNodeRequested", message);
        }

        @Override // com.facebook.stetho.inspector.elements.Document.UpdateListener
        public void onChildNodeRemoved(int parentNodeId, int nodeId) {
            ChildNodeRemovedEvent removedEvent = DOM.this.acquireChildNodeRemovedEvent();
            removedEvent.parentNodeId = parentNodeId;
            removedEvent.nodeId = nodeId;
            DOM.this.mPeerManager.sendNotificationToPeers("DOM.childNodeRemoved", removedEvent);
            DOM.this.releaseChildNodeRemovedEvent(removedEvent);
        }

        @Override // com.facebook.stetho.inspector.elements.Document.UpdateListener
        public void onChildNodeInserted(DocumentView view, Object element, int parentNodeId, int previousNodeId, Accumulator<Object> insertedElements) {
            ChildNodeInsertedEvent insertedEvent = DOM.this.acquireChildNodeInsertedEvent();
            insertedEvent.parentNodeId = parentNodeId;
            insertedEvent.previousNodeId = previousNodeId;
            insertedEvent.node = DOM.this.createNodeForElement(element, view, insertedElements);
            DOM.this.mPeerManager.sendNotificationToPeers("DOM.childNodeInserted", insertedEvent);
            DOM.this.releaseChildNodeInsertedEvent(insertedEvent);
        }
    }

    private final class PeerManagerListener extends PeersRegisteredListener {
        private PeerManagerListener() {
        }

        @Override // com.facebook.stetho.inspector.helper.PeersRegisteredListener
        protected synchronized void onFirstPeerRegistered() {
            DOM.this.mDocument.addRef();
            DOM.this.mDocument.addUpdateListener(DOM.this.mListener);
        }

        @Override // com.facebook.stetho.inspector.helper.PeersRegisteredListener
        protected synchronized void onLastPeerUnregistered() {
            DOM.this.mSearchResults.clear();
            DOM.this.mDocument.removeUpdateListener(DOM.this.mListener);
            DOM.this.mDocument.release();
        }
    }

    private static class GetDocumentResponse implements JsonRpcResult {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public Node root;

        private GetDocumentResponse() {
        }
    }

    private static class Node implements JsonRpcResult {

        @JsonProperty
        public List<String> attributes;

        @JsonProperty
        public Integer childNodeCount;

        @JsonProperty
        public List<Node> children;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String localName;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int nodeId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String nodeName;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public NodeType nodeType;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String nodeValue;

        private Node() {
        }
    }

    private static class AttributeModifiedEvent {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String name;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int nodeId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String value;

        private AttributeModifiedEvent() {
        }
    }

    private static class AttributeRemovedEvent {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String name;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int nodeId;

        private AttributeRemovedEvent() {
        }
    }

    private static class ChildNodeInsertedEvent {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public Node node;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int parentNodeId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int previousNodeId;

        private ChildNodeInsertedEvent() {
        }
    }

    private static class ChildNodeRemovedEvent {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int nodeId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int parentNodeId;

        private ChildNodeRemovedEvent() {
        }
    }

    private static class HighlightNodeRequest {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public HighlightConfig highlightConfig;

        @JsonProperty
        public Integer nodeId;

        @JsonProperty
        public String objectId;

        private HighlightNodeRequest() {
        }
    }

    private static class HighlightConfig {

        @JsonProperty
        public RGBAColor contentColor;

        private HighlightConfig() {
        }
    }

    private static class InspectNodeRequestedEvent {

        @JsonProperty
        public int nodeId;

        private InspectNodeRequestedEvent() {
        }
    }

    private static class SetInspectModeEnabledRequest {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public boolean enabled;

        @JsonProperty
        public HighlightConfig highlightConfig;

        @JsonProperty
        public Boolean inspectShadowDOM;

        private SetInspectModeEnabledRequest() {
        }
    }

    private static class RGBAColor {

        @JsonProperty
        public Double a;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int b;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int g;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int r;

        private RGBAColor() {
        }

        public int getColor() {
            byte b;
            byte alpha;
            if (this.a == null) {
                alpha = -1;
            } else {
                long aLong = Math.round(this.a.doubleValue() * 255.0d);
                if (aLong < 0) {
                    b = 0;
                } else {
                    b = aLong >= 255 ? (byte) -1 : (byte) aLong;
                }
                alpha = b;
            }
            return Color.argb((int) alpha, this.r, this.g, this.b);
        }
    }

    private static class ResolveNodeRequest {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int nodeId;

        @JsonProperty
        public String objectGroup;

        private ResolveNodeRequest() {
        }
    }

    private static class SetAttributesAsTextRequest {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int nodeId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String text;

        private SetAttributesAsTextRequest() {
        }
    }

    private static class ResolveNodeResponse implements JsonRpcResult {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public Runtime.RemoteObject object;

        private ResolveNodeResponse() {
        }
    }

    private static class PerformSearchRequest {

        @JsonProperty
        public Boolean includeUserAgentShadowDOM;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String query;

        private PerformSearchRequest() {
        }
    }

    private static class PerformSearchResponse implements JsonRpcResult {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int resultCount;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String searchId;

        private PerformSearchResponse() {
        }
    }

    private static class GetSearchResultsRequest {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int fromIndex;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String searchId;

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public int toIndex;

        private GetSearchResultsRequest() {
        }
    }

    private static class GetSearchResultsResponse implements JsonRpcResult {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public List<Integer> nodeIds;

        private GetSearchResultsResponse() {
        }
    }

    private static class DiscardSearchResultsRequest {

        @JsonProperty(required = RippleUtils.USE_FRAMEWORK_RIPPLE)
        public String searchId;

        private DiscardSearchResultsRequest() {
        }
    }
}
