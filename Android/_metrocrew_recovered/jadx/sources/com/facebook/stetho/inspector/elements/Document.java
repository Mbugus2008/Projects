package com.facebook.stetho.inspector.elements;

import android.os.SystemClock;
import com.facebook.stetho.common.Accumulator;
import com.facebook.stetho.common.ArrayListAccumulator;
import com.facebook.stetho.common.LogUtil;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.inspector.helper.ObjectIdMapper;
import com.facebook.stetho.inspector.helper.ThreadBoundProxy;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Queue;
import java.util.regex.Pattern;
import javax.annotation.Nullable;

/* JADX INFO: loaded from: classes.dex */
public final class Document extends ThreadBoundProxy {
    private AttributeListAccumulator mCachedAttributeAccumulator;
    private ChildEventingList mCachedChildEventingList;
    private ArrayListAccumulator<Object> mCachedChildrenAccumulator;
    private final Queue<Object> mCachedUpdateQueue;
    private DocumentProvider mDocumentProvider;
    private final DocumentProviderFactory mFactory;
    private final ObjectIdMapper mObjectIdMapper;
    private int mReferenceCounter;
    private ShadowDocument mShadowDocument;
    private UpdateListenerCollection mUpdateListeners;

    public interface UpdateListener {
        void onAttributeModified(Object obj, String str, String str2);

        void onAttributeRemoved(Object obj, String str);

        void onChildNodeInserted(DocumentView documentView, Object obj, int i, int i2, Accumulator<Object> accumulator);

        void onChildNodeRemoved(int i, int i2);

        void onInspectRequested(Object obj);
    }

    public Document(DocumentProviderFactory factory) {
        super(factory);
        this.mFactory = factory;
        this.mObjectIdMapper = new DocumentObjectIdMapper();
        this.mReferenceCounter = 0;
        this.mUpdateListeners = new UpdateListenerCollection();
        this.mCachedUpdateQueue = new ArrayDeque();
    }

    public synchronized void addRef() {
        int i = this.mReferenceCounter;
        this.mReferenceCounter = i + 1;
        if (i == 0) {
            init();
        }
    }

    public synchronized void release() {
        if (this.mReferenceCounter > 0) {
            int i = this.mReferenceCounter - 1;
            this.mReferenceCounter = i;
            if (i == 0) {
                cleanUp();
            }
        }
    }

    private void init() {
        this.mDocumentProvider = this.mFactory.create();
        this.mDocumentProvider.postAndWait(new Runnable() { // from class: com.facebook.stetho.inspector.elements.Document.1
            @Override // java.lang.Runnable
            public void run() {
                Document.this.mShadowDocument = new ShadowDocument(Document.this.mDocumentProvider.getRootElement());
                Document.this.createShadowDocumentUpdate().commit();
                Document.this.mDocumentProvider.setListener(new ProviderListener());
            }
        });
    }

    private void cleanUp() {
        this.mDocumentProvider.postAndWait(new Runnable() { // from class: com.facebook.stetho.inspector.elements.Document.2
            @Override // java.lang.Runnable
            public void run() {
                Document.this.mDocumentProvider.setListener(null);
                Document.this.mShadowDocument = null;
                Document.this.mObjectIdMapper.clear();
                Document.this.mDocumentProvider.dispose();
                Document.this.mDocumentProvider = null;
            }
        });
        this.mUpdateListeners.clear();
    }

    public void addUpdateListener(UpdateListener updateListener) {
        this.mUpdateListeners.add(updateListener);
    }

    public void removeUpdateListener(UpdateListener updateListener) {
        this.mUpdateListeners.remove(updateListener);
    }

    @Nullable
    public NodeDescriptor getNodeDescriptor(Object element) {
        verifyThreadAccess();
        return this.mDocumentProvider.getNodeDescriptor(element);
    }

    public void highlightElement(Object element, int color) {
        verifyThreadAccess();
        this.mDocumentProvider.highlightElement(element, color);
    }

    public void hideHighlight() {
        verifyThreadAccess();
        this.mDocumentProvider.hideHighlight();
    }

    public void setInspectModeEnabled(boolean enabled) {
        verifyThreadAccess();
        this.mDocumentProvider.setInspectModeEnabled(enabled);
    }

    @Nullable
    public Integer getNodeIdForElement(Object element) {
        return this.mObjectIdMapper.getIdForObject(element);
    }

    @Nullable
    public Object getElementForNodeId(int id) {
        return this.mObjectIdMapper.getObjectForId(id);
    }

    public void setAttributesAsText(Object element, String text) {
        verifyThreadAccess();
        this.mDocumentProvider.setAttributesAsText(element, text);
    }

    public void getElementStyleRuleNames(Object element, StyleRuleNameAccumulator accumulator) {
        NodeDescriptor nodeDescriptor = getNodeDescriptor(element);
        nodeDescriptor.getStyleRuleNames(element, accumulator);
    }

    public void getElementStyles(Object element, String ruleName, StyleAccumulator accumulator) {
        NodeDescriptor nodeDescriptor = getNodeDescriptor(element);
        nodeDescriptor.getStyles(element, ruleName, accumulator);
    }

    public void setElementStyle(Object element, String ruleName, String name, String value) {
        NodeDescriptor nodeDescriptor = getNodeDescriptor(element);
        nodeDescriptor.setStyle(element, ruleName, name, value);
    }

    public void getElementComputedStyles(Object element, ComputedStyleAccumulator styleAccumulator) {
        NodeDescriptor nodeDescriptor = getNodeDescriptor(element);
        nodeDescriptor.getComputedStyles(element, styleAccumulator);
    }

    public DocumentView getDocumentView() {
        verifyThreadAccess();
        return this.mShadowDocument;
    }

    public Object getRootElement() {
        verifyThreadAccess();
        Object rootElement = this.mDocumentProvider.getRootElement();
        if (rootElement == null) {
            throw new IllegalStateException();
        }
        if (rootElement != this.mShadowDocument.getRootElement()) {
            throw new IllegalStateException();
        }
        return rootElement;
    }

    public void findMatchingElements(String query, Accumulator<Integer> matchedIds) {
        verifyThreadAccess();
        Pattern queryPattern = Pattern.compile(Pattern.quote(query), 2);
        Object rootElement = this.mDocumentProvider.getRootElement();
        findMatches(rootElement, queryPattern, matchedIds);
    }

    private void findMatches(Object element, Pattern queryPattern, Accumulator<Integer> matchedIds) {
        ElementInfo info = this.mShadowDocument.getElementInfo(element);
        int size = info.children.size();
        for (int i = 0; i < size; i++) {
            Object childElement = info.children.get(i);
            if (doesElementMatch(childElement, queryPattern)) {
                matchedIds.store(this.mObjectIdMapper.getIdForObject(childElement));
            }
            findMatches(childElement, queryPattern, matchedIds);
        }
    }

    private boolean doesElementMatch(Object element, Pattern queryPattern) {
        AttributeListAccumulator accumulator = acquireCachedAttributeAccumulator();
        NodeDescriptor descriptor = this.mDocumentProvider.getNodeDescriptor(element);
        descriptor.getAttributes(element, accumulator);
        int N = accumulator.size();
        for (int i = 0; i < N; i++) {
            if (queryPattern.matcher(accumulator.get(i)).find()) {
                releaseCachedAttributeAccumulator(accumulator);
                return true;
            }
        }
        releaseCachedAttributeAccumulator(accumulator);
        return queryPattern.matcher(descriptor.getNodeName(element)).find();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ChildEventingList acquireChildEventingList(Object parentElement, DocumentView documentView) {
        ChildEventingList childEventingList = this.mCachedChildEventingList;
        if (childEventingList == null) {
            childEventingList = new ChildEventingList();
        }
        this.mCachedChildEventingList = null;
        childEventingList.acquire(parentElement, documentView);
        return childEventingList;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void releaseChildEventingList(ChildEventingList childEventingList) {
        childEventingList.release();
        if (this.mCachedChildEventingList == null) {
            this.mCachedChildEventingList = childEventingList;
        }
    }

    private AttributeListAccumulator acquireCachedAttributeAccumulator() {
        AttributeListAccumulator accumulator = this.mCachedAttributeAccumulator;
        if (accumulator == null) {
            accumulator = new AttributeListAccumulator();
        }
        this.mCachedChildrenAccumulator = null;
        return accumulator;
    }

    private void releaseCachedAttributeAccumulator(AttributeListAccumulator accumulator) {
        accumulator.clear();
        if (this.mCachedAttributeAccumulator == null) {
            this.mCachedAttributeAccumulator = accumulator;
        }
    }

    private ArrayListAccumulator<Object> acquireChildrenAccumulator() {
        ArrayListAccumulator<Object> accumulator = this.mCachedChildrenAccumulator;
        if (accumulator == null) {
            accumulator = new ArrayListAccumulator<>();
        }
        this.mCachedChildrenAccumulator = null;
        return accumulator;
    }

    private void releaseChildrenAccumulator(ArrayListAccumulator<Object> accumulator) {
        accumulator.clear();
        if (this.mCachedChildrenAccumulator == null) {
            this.mCachedChildrenAccumulator = accumulator;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public ShadowDocument.Update createShadowDocumentUpdate() {
        verifyThreadAccess();
        if (this.mDocumentProvider.getRootElement() != this.mShadowDocument.getRootElement()) {
            throw new IllegalStateException();
        }
        ArrayListAccumulator<Object> childrenAccumulator = acquireChildrenAccumulator();
        ShadowDocument.UpdateBuilder updateBuilder = this.mShadowDocument.beginUpdate();
        this.mCachedUpdateQueue.add(this.mDocumentProvider.getRootElement());
        while (!this.mCachedUpdateQueue.isEmpty()) {
            Object element = this.mCachedUpdateQueue.remove();
            NodeDescriptor descriptor = this.mDocumentProvider.getNodeDescriptor(element);
            this.mObjectIdMapper.putObject(element);
            descriptor.getChildren(element, childrenAccumulator);
            int i = 0;
            int size = childrenAccumulator.size();
            while (i < size) {
                Object child = childrenAccumulator.get(i);
                if (child != null) {
                    this.mCachedUpdateQueue.add(child);
                } else {
                    LogUtil.e("%s.getChildren() emitted a null child at position %s for element %s", descriptor.getClass().getName(), Integer.toString(i), element);
                    childrenAccumulator.remove(i);
                    i--;
                    size--;
                }
                i++;
            }
            updateBuilder.setElementChildren(element, childrenAccumulator);
            childrenAccumulator.clear();
        }
        releaseChildrenAccumulator(childrenAccumulator);
        return updateBuilder.build();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateTree() {
        long startTimeMs = SystemClock.elapsedRealtime();
        ShadowDocument.Update docUpdate = createShadowDocumentUpdate();
        boolean isEmpty = docUpdate.isEmpty();
        if (isEmpty) {
            docUpdate.abandon();
        } else {
            applyDocumentUpdate(docUpdate);
        }
        long deltaMs = SystemClock.elapsedRealtime() - startTimeMs;
        LogUtil.d("Document.updateTree() completed in %s ms%s", Long.toString(deltaMs), isEmpty ? " (no changes)" : "");
    }

    private void applyDocumentUpdate(final ShadowDocument.Update docUpdate) {
        final ArrayList<Integer> garbageElementIds = new ArrayList<>();
        docUpdate.getGarbageElements(new Accumulator<Object>() { // from class: com.facebook.stetho.inspector.elements.Document.3
            @Override // com.facebook.stetho.common.Accumulator
            public void store(Object element) {
                Integer nodeId = (Integer) Util.throwIfNull(Document.this.mObjectIdMapper.getIdForObject(element));
                ElementInfo newElementInfo = docUpdate.getElementInfo(element);
                if (newElementInfo.parentElement == null) {
                    ElementInfo oldElementInfo = Document.this.mShadowDocument.getElementInfo(element);
                    int parentNodeId = Document.this.mObjectIdMapper.getIdForObject(oldElementInfo.parentElement).intValue();
                    Document.this.mUpdateListeners.onChildNodeRemoved(parentNodeId, nodeId.intValue());
                }
                garbageElementIds.add(nodeId);
            }
        });
        Collections.sort(garbageElementIds);
        docUpdate.getChangedElements(new Accumulator<Object>() { // from class: com.facebook.stetho.inspector.elements.Document.4
            @Override // com.facebook.stetho.common.Accumulator
            public void store(Object element) {
                ElementInfo oldElementInfo;
                Integer nodeId = (Integer) Util.throwIfNull(Document.this.mObjectIdMapper.getIdForObject(element));
                if (Collections.binarySearch(garbageElementIds, nodeId) >= 0 || (oldElementInfo = Document.this.mShadowDocument.getElementInfo(element)) == null) {
                    return;
                }
                ElementInfo newElementInfo = docUpdate.getElementInfo(element);
                if (newElementInfo.parentElement != oldElementInfo.parentElement) {
                    int parentNodeId = Document.this.mObjectIdMapper.getIdForObject(oldElementInfo.parentElement).intValue();
                    Document.this.mUpdateListeners.onChildNodeRemoved(parentNodeId, nodeId.intValue());
                }
            }
        });
        int N = garbageElementIds.size();
        for (int i = 0; i < N; i++) {
            this.mObjectIdMapper.removeObjectById(garbageElementIds.get(i).intValue());
        }
        docUpdate.getChangedElements(new Accumulator<Object>() { // from class: com.facebook.stetho.inspector.elements.Document.5
            private final HashSet<Object> listenerInsertedElements = new HashSet<>();
            private Accumulator<Object> insertedElements = new Accumulator<Object>() { // from class: com.facebook.stetho.inspector.elements.Document.5.1
                @Override // com.facebook.stetho.common.Accumulator
                public void store(Object element) {
                    if (docUpdate.isElementChanged(element)) {
                        AnonymousClass5.this.listenerInsertedElements.add(element);
                    }
                }
            };

            @Override // com.facebook.stetho.common.Accumulator
            public void store(Object element) {
                ElementInfo newChildElementInfo;
                if (Document.this.mObjectIdMapper.containsObject(element) && !this.listenerInsertedElements.contains(element)) {
                    ElementInfo oldElementInfo = Document.this.mShadowDocument.getElementInfo(element);
                    ElementInfo newElementInfo = docUpdate.getElementInfo(element);
                    List<Object> oldChildren = oldElementInfo != null ? oldElementInfo.children : Collections.emptyList();
                    List<Object> newChildren = newElementInfo.children;
                    ChildEventingList listenerChildren = Document.this.acquireChildEventingList(element, docUpdate);
                    int N2 = oldChildren.size();
                    for (int i2 = 0; i2 < N2; i2++) {
                        Object childElement = oldChildren.get(i2);
                        if (Document.this.mObjectIdMapper.containsObject(childElement) && ((newChildElementInfo = docUpdate.getElementInfo(childElement)) == null || newChildElementInfo.parentElement == element)) {
                            listenerChildren.add(childElement);
                        }
                    }
                    Document.updateListenerChildren(listenerChildren, newChildren, this.insertedElements);
                    Document.this.releaseChildEventingList(listenerChildren);
                }
            }
        });
        docUpdate.commit();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void updateListenerChildren(ChildEventingList listenerChildren, List<Object> newChildren, Accumulator<Object> insertedElements) {
        int index = 0;
        while (index <= listenerChildren.size()) {
            if (index == listenerChildren.size()) {
                if (index != newChildren.size()) {
                    listenerChildren.addWithEvent(index, newChildren.get(index), insertedElements);
                    index++;
                } else {
                    return;
                }
            } else if (index == newChildren.size()) {
                listenerChildren.removeWithEvent(index);
            } else {
                Object listenerElement = listenerChildren.get(index);
                Object newElement = newChildren.get(index);
                if (listenerElement == newElement) {
                    index++;
                } else {
                    int newElementListenerIndex = listenerChildren.indexOf(newElement);
                    if (newElementListenerIndex == -1) {
                        listenerChildren.addWithEvent(index, newElement, insertedElements);
                        index++;
                    } else {
                        listenerChildren.removeWithEvent(newElementListenerIndex);
                        listenerChildren.addWithEvent(index, newElement, insertedElements);
                        index++;
                    }
                }
            }
        }
    }

    private final class ChildEventingList extends ArrayList<Object> {
        private DocumentView mDocumentView;
        private Object mParentElement;
        private int mParentNodeId;

        private ChildEventingList() {
            this.mParentElement = null;
            this.mParentNodeId = -1;
        }

        public void acquire(Object parentElement, DocumentView documentView) {
            this.mParentElement = parentElement;
            this.mParentNodeId = this.mParentElement == null ? -1 : Document.this.mObjectIdMapper.getIdForObject(this.mParentElement).intValue();
            this.mDocumentView = documentView;
        }

        public void release() {
            clear();
            this.mParentElement = null;
            this.mParentNodeId = -1;
            this.mDocumentView = null;
        }

        public void addWithEvent(int index, Object element, Accumulator<Object> insertedElements) {
            Object previousElement = index == 0 ? null : get(index - 1);
            int previousNodeId = previousElement == null ? -1 : Document.this.mObjectIdMapper.getIdForObject(previousElement).intValue();
            add(index, element);
            Document.this.mUpdateListeners.onChildNodeInserted(this.mDocumentView, element, this.mParentNodeId, previousNodeId, insertedElements);
        }

        public void removeWithEvent(int index) {
            Object element = remove(index);
            int nodeId = Document.this.mObjectIdMapper.getIdForObject(element).intValue();
            Document.this.mUpdateListeners.onChildNodeRemoved(this.mParentNodeId, nodeId);
        }
    }

    private class UpdateListenerCollection implements UpdateListener {
        private final List<UpdateListener> mListeners = new ArrayList();
        private volatile UpdateListener[] mListenersSnapshot;

        public UpdateListenerCollection() {
        }

        public synchronized void add(UpdateListener listener) {
            this.mListeners.add(listener);
            this.mListenersSnapshot = null;
        }

        public synchronized void remove(UpdateListener listener) {
            this.mListeners.remove(listener);
            this.mListenersSnapshot = null;
        }

        public synchronized void clear() {
            this.mListeners.clear();
            this.mListenersSnapshot = null;
        }

        private UpdateListener[] getListenersSnapshot() {
            while (true) {
                UpdateListener[] listenersSnapshot = this.mListenersSnapshot;
                if (listenersSnapshot != null) {
                    return listenersSnapshot;
                }
                synchronized (this) {
                    if (this.mListenersSnapshot == null) {
                        this.mListenersSnapshot = (UpdateListener[]) this.mListeners.toArray(new UpdateListener[this.mListeners.size()]);
                        return this.mListenersSnapshot;
                    }
                }
            }
        }

        @Override // com.facebook.stetho.inspector.elements.Document.UpdateListener
        public void onAttributeModified(Object element, String name, String value) {
            for (UpdateListener listener : getListenersSnapshot()) {
                listener.onAttributeModified(element, name, value);
            }
        }

        @Override // com.facebook.stetho.inspector.elements.Document.UpdateListener
        public void onAttributeRemoved(Object element, String name) {
            for (UpdateListener listener : getListenersSnapshot()) {
                listener.onAttributeRemoved(element, name);
            }
        }

        @Override // com.facebook.stetho.inspector.elements.Document.UpdateListener
        public void onInspectRequested(Object element) {
            for (UpdateListener listener : getListenersSnapshot()) {
                listener.onInspectRequested(element);
            }
        }

        @Override // com.facebook.stetho.inspector.elements.Document.UpdateListener
        public void onChildNodeRemoved(int parentNodeId, int nodeId) {
            for (UpdateListener listener : getListenersSnapshot()) {
                listener.onChildNodeRemoved(parentNodeId, nodeId);
            }
        }

        @Override // com.facebook.stetho.inspector.elements.Document.UpdateListener
        public void onChildNodeInserted(DocumentView view, Object element, int parentNodeId, int previousNodeId, Accumulator<Object> insertedItems) {
            for (UpdateListener listener : getListenersSnapshot()) {
                listener.onChildNodeInserted(view, element, parentNodeId, previousNodeId, insertedItems);
            }
        }
    }

    private final class DocumentObjectIdMapper extends ObjectIdMapper {
        private DocumentObjectIdMapper() {
        }

        @Override // com.facebook.stetho.inspector.helper.ObjectIdMapper
        protected void onMapped(Object object, int id) {
            Document.this.verifyThreadAccess();
            NodeDescriptor descriptor = Document.this.mDocumentProvider.getNodeDescriptor(object);
            descriptor.hook(object);
        }

        @Override // com.facebook.stetho.inspector.helper.ObjectIdMapper
        protected void onUnmapped(Object object, int id) {
            Document.this.verifyThreadAccess();
            NodeDescriptor descriptor = Document.this.mDocumentProvider.getNodeDescriptor(object);
            descriptor.unhook(object);
        }
    }

    private final class ProviderListener implements DocumentProviderListener {
        private ProviderListener() {
        }

        @Override // com.facebook.stetho.inspector.elements.DocumentProviderListener
        public void onPossiblyChanged() {
            Document.this.updateTree();
        }

        @Override // com.facebook.stetho.inspector.elements.DocumentProviderListener
        public void onAttributeModified(Object element, String name, String value) {
            Document.this.verifyThreadAccess();
            Document.this.mUpdateListeners.onAttributeModified(element, name, value);
        }

        @Override // com.facebook.stetho.inspector.elements.DocumentProviderListener
        public void onAttributeRemoved(Object element, String name) {
            Document.this.verifyThreadAccess();
            Document.this.mUpdateListeners.onAttributeRemoved(element, name);
        }

        @Override // com.facebook.stetho.inspector.elements.DocumentProviderListener
        public void onInspectRequested(Object element) {
            Document.this.verifyThreadAccess();
            Document.this.mUpdateListeners.onInspectRequested(element);
        }
    }

    public static final class AttributeListAccumulator extends ArrayList<String> implements AttributeAccumulator {
        @Override // com.facebook.stetho.inspector.elements.AttributeAccumulator
        public void store(String name, String value) {
            add(name);
            add(value);
        }
    }
}
