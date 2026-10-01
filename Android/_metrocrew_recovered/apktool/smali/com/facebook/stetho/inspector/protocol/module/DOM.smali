.class public Lcom/facebook/stetho/inspector/protocol/module/DOM;
.super Ljava/lang/Object;
.source "DOM.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/protocol/module/DOM$DiscardSearchResultsRequest;,
        Lcom/facebook/stetho/inspector/protocol/module/DOM$GetSearchResultsResponse;,
        Lcom/facebook/stetho/inspector/protocol/module/DOM$GetSearchResultsRequest;,
        Lcom/facebook/stetho/inspector/protocol/module/DOM$PerformSearchResponse;,
        Lcom/facebook/stetho/inspector/protocol/module/DOM$PerformSearchRequest;,
        Lcom/facebook/stetho/inspector/protocol/module/DOM$ResolveNodeResponse;,
        Lcom/facebook/stetho/inspector/protocol/module/DOM$SetAttributesAsTextRequest;,
        Lcom/facebook/stetho/inspector/protocol/module/DOM$ResolveNodeRequest;,
        Lcom/facebook/stetho/inspector/protocol/module/DOM$RGBAColor;,
        Lcom/facebook/stetho/inspector/protocol/module/DOM$SetInspectModeEnabledRequest;,
        Lcom/facebook/stetho/inspector/protocol/module/DOM$InspectNodeRequestedEvent;,
        Lcom/facebook/stetho/inspector/protocol/module/DOM$HighlightConfig;,
        Lcom/facebook/stetho/inspector/protocol/module/DOM$HighlightNodeRequest;,
        Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;,
        Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;,
        Lcom/facebook/stetho/inspector/protocol/module/DOM$AttributeRemovedEvent;,
        Lcom/facebook/stetho/inspector/protocol/module/DOM$AttributeModifiedEvent;,
        Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;,
        Lcom/facebook/stetho/inspector/protocol/module/DOM$GetDocumentResponse;,
        Lcom/facebook/stetho/inspector/protocol/module/DOM$PeerManagerListener;,
        Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;
    }
.end annotation


# instance fields
.field private mCachedChildNodeInsertedEvent:Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;

.field private mCachedChildNodeRemovedEvent:Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;

.field private final mDocument:Lcom/facebook/stetho/inspector/elements/Document;

.field private final mListener:Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;

.field private final mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

.field private final mPeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

.field private final mResultCounter:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final mSearchResults:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/facebook/stetho/inspector/elements/Document;)V
    .locals 3
    .param p1, "document"    # Lcom/facebook/stetho/inspector/elements/Document;

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance v0, Lcom/facebook/stetho/json/ObjectMapper;

    invoke-direct {v0}, Lcom/facebook/stetho/json/ObjectMapper;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    .line 55
    invoke-static {p1}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/elements/Document;

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mDocument:Lcom/facebook/stetho/inspector/elements/Document;

    .line 56
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mSearchResults:Ljava/util/Map;

    .line 58
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mResultCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 59
    new-instance v0, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mPeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    .line 60
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mPeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$PeerManagerListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/facebook/stetho/inspector/protocol/module/DOM$PeerManagerListener;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOM;Lcom/facebook/stetho/inspector/protocol/module/DOM$1;)V

    invoke-virtual {v0, v1}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;->setListener(Lcom/facebook/stetho/inspector/helper/PeerRegistrationListener;)V

    .line 61
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;

    invoke-direct {v0, p0, v2}, Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOM;Lcom/facebook/stetho/inspector/protocol/module/DOM$1;)V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mListener:Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;

    .line 62
    return-void
.end method

.method static synthetic access$1200(Lcom/facebook/stetho/inspector/protocol/module/DOM;)Lcom/facebook/stetho/inspector/helper/ChromePeerManager;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/protocol/module/DOM;

    .line 42
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mPeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/facebook/stetho/inspector/protocol/module/DOM;)Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/protocol/module/DOM;

    .line 42
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/protocol/module/DOM;->acquireChildNodeRemovedEvent()Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1600(Lcom/facebook/stetho/inspector/protocol/module/DOM;Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;)V
    .locals 0
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/protocol/module/DOM;
    .param p1, "x1"    # Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;

    .line 42
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/protocol/module/DOM;->releaseChildNodeRemovedEvent(Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;)V

    return-void
.end method

.method static synthetic access$1700(Lcom/facebook/stetho/inspector/protocol/module/DOM;)Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/protocol/module/DOM;

    .line 42
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/protocol/module/DOM;->acquireChildNodeInsertedEvent()Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1800(Lcom/facebook/stetho/inspector/protocol/module/DOM;Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;)V
    .locals 0
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/protocol/module/DOM;
    .param p1, "x1"    # Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;

    .line 42
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/protocol/module/DOM;->releaseChildNodeInsertedEvent(Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;)V

    return-void
.end method

.method static synthetic access$1900(Lcom/facebook/stetho/inspector/protocol/module/DOM;)Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/protocol/module/DOM;

    .line 42
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mListener:Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;

    return-object v0
.end method

.method static synthetic access$2000(Lcom/facebook/stetho/inspector/protocol/module/DOM;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/protocol/module/DOM;

    .line 42
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mSearchResults:Ljava/util/Map;

    return-object v0
.end method

.method static synthetic access$300(Lcom/facebook/stetho/inspector/protocol/module/DOM;)Lcom/facebook/stetho/inspector/elements/Document;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/protocol/module/DOM;

    .line 42
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mDocument:Lcom/facebook/stetho/inspector/elements/Document;

    return-object v0
.end method

.method static synthetic access$400(Lcom/facebook/stetho/inspector/protocol/module/DOM;Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/DocumentView;Lcom/facebook/stetho/common/Accumulator;)Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/protocol/module/DOM;
    .param p1, "x1"    # Ljava/lang/Object;
    .param p2, "x2"    # Lcom/facebook/stetho/inspector/elements/DocumentView;
    .param p3, "x3"    # Lcom/facebook/stetho/common/Accumulator;

    .line 42
    invoke-direct {p0, p1, p2, p3}, Lcom/facebook/stetho/inspector/protocol/module/DOM;->createNodeForElement(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/DocumentView;Lcom/facebook/stetho/common/Accumulator;)Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;

    move-result-object v0

    return-object v0
.end method

.method private acquireChildNodeInsertedEvent()Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;
    .locals 3

    .line 298
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mCachedChildNodeInsertedEvent:Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;

    .line 299
    .local v0, "childNodeInsertedEvent":Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 300
    new-instance v2, Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;

    invoke-direct {v2, v1}, Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOM$1;)V

    move-object v0, v2

    .line 302
    :cond_0
    iput-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mCachedChildNodeInsertedEvent:Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;

    .line 303
    return-object v0
.end method

.method private acquireChildNodeRemovedEvent()Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;
    .locals 3

    .line 316
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mCachedChildNodeRemovedEvent:Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;

    .line 317
    .local v0, "childNodeRemovedEvent":Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 318
    new-instance v2, Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;

    invoke-direct {v2, v1}, Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOM$1;)V

    move-object v0, v2

    .line 320
    :cond_0
    iput-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mCachedChildNodeRemovedEvent:Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;

    .line 321
    return-object v0
.end method

.method private createNodeForElement(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/DocumentView;Lcom/facebook/stetho/common/Accumulator;)Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;
    .locals 9
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "view"    # Lcom/facebook/stetho/inspector/elements/DocumentView;
    .param p3    # Lcom/facebook/stetho/common/Accumulator;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lcom/facebook/stetho/inspector/elements/DocumentView;",
            "Lcom/facebook/stetho/common/Accumulator<",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;"
        }
    .end annotation

    .line 260
    .local p3, "processedElements":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    if-eqz p3, :cond_0

    .line 261
    invoke-interface {p3, p1}, Lcom/facebook/stetho/common/Accumulator;->store(Ljava/lang/Object;)V

    .line 264
    :cond_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mDocument:Lcom/facebook/stetho/inspector/elements/Document;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/Document;->getNodeDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeDescriptor;

    move-result-object v0

    .line 266
    .local v0, "descriptor":Lcom/facebook/stetho/inspector/elements/NodeDescriptor;
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOM$1;)V

    .line 267
    .local v1, "node":Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;
    iget-object v2, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mDocument:Lcom/facebook/stetho/inspector/elements/Document;

    invoke-virtual {v2, p1}, Lcom/facebook/stetho/inspector/elements/Document;->getNodeIdForElement(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;->nodeId:I

    .line 268
    invoke-interface {v0, p1}, Lcom/facebook/stetho/inspector/elements/NodeDescriptor;->getNodeType(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeType;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;->nodeType:Lcom/facebook/stetho/inspector/elements/NodeType;

    .line 269
    invoke-interface {v0, p1}, Lcom/facebook/stetho/inspector/elements/NodeDescriptor;->getNodeName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;->nodeName:Ljava/lang/String;

    .line 270
    invoke-interface {v0, p1}, Lcom/facebook/stetho/inspector/elements/NodeDescriptor;->getLocalName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;->localName:Ljava/lang/String;

    .line 271
    invoke-interface {v0, p1}, Lcom/facebook/stetho/inspector/elements/NodeDescriptor;->getNodeValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;->nodeValue:Ljava/lang/String;

    .line 273
    new-instance v2, Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;

    invoke-direct {v2}, Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;-><init>()V

    .line 274
    .local v2, "accumulator":Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;
    invoke-interface {v0, p1, v2}, Lcom/facebook/stetho/inspector/elements/NodeDescriptor;->getAttributes(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;)V

    .line 277
    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;->attributes:Ljava/util/List;

    .line 280
    invoke-interface {p2, p1}, Lcom/facebook/stetho/inspector/elements/DocumentView;->getElementInfo(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/ElementInfo;

    move-result-object v3

    .line 281
    .local v3, "elementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    iget-object v4, v3, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-nez v4, :cond_1

    .line 282
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v4

    goto :goto_0

    :cond_1
    new-instance v4, Ljava/util/ArrayList;

    iget-object v5, v3, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    .line 283
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    :goto_0
    nop

    .line 285
    .local v4, "childrenNodes":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;>;"
    const/4 v5, 0x0

    .local v5, "i":I
    iget-object v6, v3, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    .local v6, "N":I
    :goto_1
    if-ge v5, v6, :cond_2

    .line 286
    iget-object v7, v3, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    .line 287
    .local v7, "childElement":Ljava/lang/Object;
    invoke-direct {p0, v7, p2, p3}, Lcom/facebook/stetho/inspector/protocol/module/DOM;->createNodeForElement(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/DocumentView;Lcom/facebook/stetho/common/Accumulator;)Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;

    move-result-object v8

    .line 288
    .local v8, "childNode":Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;
    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 285
    .end local v7    # "childElement":Ljava/lang/Object;
    .end local v8    # "childNode":Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 291
    .end local v5    # "i":I
    .end local v6    # "N":I
    :cond_2
    iput-object v4, v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;->children:Ljava/util/List;

    .line 292
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iput-object v5, v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;->childNodeCount:Ljava/lang/Integer;

    .line 294
    return-object v1
.end method

.method private releaseChildNodeInsertedEvent(Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;)V
    .locals 1
    .param p1, "childNodeInsertedEvent"    # Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;

    .line 307
    const/4 v0, -0x1

    iput v0, p1, Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;->parentNodeId:I

    .line 308
    iput v0, p1, Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;->previousNodeId:I

    .line 309
    const/4 v0, 0x0

    iput-object v0, p1, Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;->node:Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;

    .line 310
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mCachedChildNodeInsertedEvent:Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;

    if-nez v0, :cond_0

    .line 311
    iput-object p1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mCachedChildNodeInsertedEvent:Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;

    .line 313
    :cond_0
    return-void
.end method

.method private releaseChildNodeRemovedEvent(Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;)V
    .locals 1
    .param p1, "childNodeRemovedEvent"    # Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;

    .line 325
    const/4 v0, -0x1

    iput v0, p1, Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;->parentNodeId:I

    .line 326
    iput v0, p1, Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;->nodeId:I

    .line 327
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mCachedChildNodeRemovedEvent:Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;

    if-nez v0, :cond_0

    .line 328
    iput-object p1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mCachedChildNodeRemovedEvent:Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;

    .line 330
    :cond_0
    return-void
.end method


# virtual methods
.method public disable(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 71
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mPeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;->removePeer(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;)V

    .line 72
    return-void
.end method

.method public discardSearchResults(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 247
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$DiscardSearchResultsRequest;

    invoke-virtual {v0, p2, v1}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$DiscardSearchResultsRequest;

    .line 251
    .local v0, "request":Lcom/facebook/stetho/inspector/protocol/module/DOM$DiscardSearchResultsRequest;
    iget-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$DiscardSearchResultsRequest;->searchId:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 252
    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mSearchResults:Ljava/util/Map;

    iget-object v2, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$DiscardSearchResultsRequest;->searchId:Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 254
    :cond_0
    return-void
.end method

.method public enable(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 66
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mPeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;->addPeer(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;)Z

    .line 67
    return-void
.end method

.method public getDocument(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcResult;
    .locals 3
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 76
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$GetDocumentResponse;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/stetho/inspector/protocol/module/DOM$GetDocumentResponse;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOM$1;)V

    .line 78
    .local v0, "result":Lcom/facebook/stetho/inspector/protocol/module/DOM$GetDocumentResponse;
    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mDocument:Lcom/facebook/stetho/inspector/elements/Document;

    new-instance v2, Lcom/facebook/stetho/inspector/protocol/module/DOM$1;

    invoke-direct {v2, p0}, Lcom/facebook/stetho/inspector/protocol/module/DOM$1;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOM;)V

    invoke-virtual {v1, v2}, Lcom/facebook/stetho/inspector/elements/Document;->postAndWait(Lcom/facebook/stetho/common/UncheckedCallable;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$GetDocumentResponse;->root:Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;

    .line 86
    return-object v0
.end method

.method public getSearchResults(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)Lcom/facebook/stetho/inspector/protocol/module/DOM$GetSearchResultsResponse;
    .locals 5
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 221
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$GetSearchResultsRequest;

    invoke-virtual {v0, p2, v1}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$GetSearchResultsRequest;

    .line 225
    .local v0, "request":Lcom/facebook/stetho/inspector/protocol/module/DOM$GetSearchResultsRequest;
    iget-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$GetSearchResultsRequest;->searchId:Ljava/lang/String;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 226
    const-string/jumbo v1, "searchId may not be null"

    invoke-static {v1}, Lcom/facebook/stetho/common/LogUtil;->w(Ljava/lang/String;)V

    .line 227
    return-object v2

    .line 230
    :cond_0
    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mSearchResults:Ljava/util/Map;

    iget-object v3, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$GetSearchResultsRequest;->searchId:Ljava/lang/String;

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 232
    .local v1, "results":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    if-nez v1, :cond_1

    .line 233
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$GetSearchResultsRequest;->searchId:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\" is not a valid reference to a search result"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/facebook/stetho/common/LogUtil;->w(Ljava/lang/String;)V

    .line 234
    return-object v2

    .line 237
    :cond_1
    iget v3, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$GetSearchResultsRequest;->fromIndex:I

    iget v4, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$GetSearchResultsRequest;->toIndex:I

    invoke-interface {v1, v3, v4}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v3

    .line 239
    .local v3, "resultsRange":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Integer;>;"
    new-instance v4, Lcom/facebook/stetho/inspector/protocol/module/DOM$GetSearchResultsResponse;

    invoke-direct {v4, v2}, Lcom/facebook/stetho/inspector/protocol/module/DOM$GetSearchResultsResponse;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOM$1;)V

    .line 240
    .local v4, "response":Lcom/facebook/stetho/inspector/protocol/module/DOM$GetSearchResultsResponse;
    iput-object v3, v4, Lcom/facebook/stetho/inspector/protocol/module/DOM$GetSearchResultsResponse;->nodeIds:Ljava/util/List;

    .line 242
    return-object v4
.end method

.method public hideHighlight(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 117
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mDocument:Lcom/facebook/stetho/inspector/elements/Document;

    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$3;

    invoke-direct {v1, p0}, Lcom/facebook/stetho/inspector/protocol/module/DOM$3;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOM;)V

    invoke-virtual {v0, v1}, Lcom/facebook/stetho/inspector/elements/Document;->postAndWait(Ljava/lang/Runnable;)V

    .line 123
    return-void
.end method

.method public highlightNode(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .locals 4
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 91
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$HighlightNodeRequest;

    .line 92
    invoke-virtual {v0, p2, v1}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$HighlightNodeRequest;

    .line 93
    .local v0, "request":Lcom/facebook/stetho/inspector/protocol/module/DOM$HighlightNodeRequest;
    iget-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$HighlightNodeRequest;->nodeId:Ljava/lang/Integer;

    if-nez v1, :cond_0

    .line 94
    const-string v1, "DOM.highlightNode was not given a nodeId; JS objectId is not supported"

    invoke-static {v1}, Lcom/facebook/stetho/common/LogUtil;->w(Ljava/lang/String;)V

    .line 95
    return-void

    .line 98
    :cond_0
    iget-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$HighlightNodeRequest;->highlightConfig:Lcom/facebook/stetho/inspector/protocol/module/DOM$HighlightConfig;

    iget-object v1, v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$HighlightConfig;->contentColor:Lcom/facebook/stetho/inspector/protocol/module/DOM$RGBAColor;

    .line 99
    .local v1, "contentColor":Lcom/facebook/stetho/inspector/protocol/module/DOM$RGBAColor;
    if-nez v1, :cond_1

    .line 100
    const-string v2, "DOM.highlightNode was not given a color to highlight with"

    invoke-static {v2}, Lcom/facebook/stetho/common/LogUtil;->w(Ljava/lang/String;)V

    .line 101
    return-void

    .line 104
    :cond_1
    iget-object v2, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mDocument:Lcom/facebook/stetho/inspector/elements/Document;

    new-instance v3, Lcom/facebook/stetho/inspector/protocol/module/DOM$2;

    invoke-direct {v3, p0, v0, v1}, Lcom/facebook/stetho/inspector/protocol/module/DOM$2;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOM;Lcom/facebook/stetho/inspector/protocol/module/DOM$HighlightNodeRequest;Lcom/facebook/stetho/inspector/protocol/module/DOM$RGBAColor;)V

    invoke-virtual {v2, v3}, Lcom/facebook/stetho/inspector/elements/Document;->postAndWait(Ljava/lang/Runnable;)V

    .line 113
    return-void
.end method

.method public performSearch(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)Lcom/facebook/stetho/inspector/protocol/module/DOM$PerformSearchResponse;
    .locals 5
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 193
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$PerformSearchRequest;

    invoke-virtual {v0, p2, v1}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$PerformSearchRequest;

    .line 197
    .local v0, "request":Lcom/facebook/stetho/inspector/protocol/module/DOM$PerformSearchRequest;
    new-instance v1, Lcom/facebook/stetho/common/ArrayListAccumulator;

    invoke-direct {v1}, Lcom/facebook/stetho/common/ArrayListAccumulator;-><init>()V

    .line 199
    .local v1, "resultNodeIds":Lcom/facebook/stetho/common/ArrayListAccumulator;, "Lcom/facebook/stetho/common/ArrayListAccumulator<Ljava/lang/Integer;>;"
    iget-object v2, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mDocument:Lcom/facebook/stetho/inspector/elements/Document;

    new-instance v3, Lcom/facebook/stetho/inspector/protocol/module/DOM$7;

    invoke-direct {v3, p0, v0, v1}, Lcom/facebook/stetho/inspector/protocol/module/DOM$7;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOM;Lcom/facebook/stetho/inspector/protocol/module/DOM$PerformSearchRequest;Lcom/facebook/stetho/common/ArrayListAccumulator;)V

    invoke-virtual {v2, v3}, Lcom/facebook/stetho/inspector/elements/Document;->postAndWait(Ljava/lang/Runnable;)V

    .line 208
    iget-object v2, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mResultCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    .line 210
    .local v2, "searchId":Ljava/lang/String;
    iget-object v3, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mSearchResults:Ljava/util/Map;

    invoke-interface {v3, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    new-instance v3, Lcom/facebook/stetho/inspector/protocol/module/DOM$PerformSearchResponse;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lcom/facebook/stetho/inspector/protocol/module/DOM$PerformSearchResponse;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOM$1;)V

    .line 213
    .local v3, "response":Lcom/facebook/stetho/inspector/protocol/module/DOM$PerformSearchResponse;
    iput-object v2, v3, Lcom/facebook/stetho/inspector/protocol/module/DOM$PerformSearchResponse;->searchId:Ljava/lang/String;

    .line 214
    invoke-virtual {v1}, Lcom/facebook/stetho/common/ArrayListAccumulator;->size()I

    move-result v4

    iput v4, v3, Lcom/facebook/stetho/inspector/protocol/module/DOM$PerformSearchResponse;->resultCount:I

    .line 216
    return-object v3
.end method

.method public resolveNode(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)Lcom/facebook/stetho/inspector/protocol/module/DOM$ResolveNodeResponse;
    .locals 8
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;
        }
    .end annotation

    .line 128
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$ResolveNodeRequest;

    invoke-virtual {v0, p2, v1}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$ResolveNodeRequest;

    .line 130
    .local v0, "request":Lcom/facebook/stetho/inspector/protocol/module/DOM$ResolveNodeRequest;
    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mDocument:Lcom/facebook/stetho/inspector/elements/Document;

    new-instance v2, Lcom/facebook/stetho/inspector/protocol/module/DOM$4;

    invoke-direct {v2, p0, v0}, Lcom/facebook/stetho/inspector/protocol/module/DOM$4;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOM;Lcom/facebook/stetho/inspector/protocol/module/DOM$ResolveNodeRequest;)V

    invoke-virtual {v1, v2}, Lcom/facebook/stetho/inspector/elements/Document;->postAndWait(Lcom/facebook/stetho/common/UncheckedCallable;)Ljava/lang/Object;

    move-result-object v1

    .line 137
    .local v1, "element":Ljava/lang/Object;
    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 145
    invoke-static {p1, v1}, Lcom/facebook/stetho/inspector/protocol/module/Runtime;->mapObject(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Ljava/lang/Object;)I

    move-result v3

    .line 147
    .local v3, "mappedObjectId":I
    new-instance v4, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;

    invoke-direct {v4}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;-><init>()V

    .line 148
    .local v4, "remoteObject":Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;
    sget-object v5, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->OBJECT:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    iput-object v5, v4, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->type:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    .line 149
    sget-object v5, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->NODE:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    iput-object v5, v4, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->subtype:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    .line 150
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->className:Ljava/lang/String;

    .line 151
    iput-object v2, v4, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->value:Ljava/lang/Object;

    .line 152
    iput-object v2, v4, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->description:Ljava/lang/String;

    .line 153
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;->objectId:Ljava/lang/String;

    .line 154
    new-instance v5, Lcom/facebook/stetho/inspector/protocol/module/DOM$ResolveNodeResponse;

    invoke-direct {v5, v2}, Lcom/facebook/stetho/inspector/protocol/module/DOM$ResolveNodeResponse;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOM$1;)V

    .line 155
    .local v5, "response":Lcom/facebook/stetho/inspector/protocol/module/DOM$ResolveNodeResponse;
    iput-object v4, v5, Lcom/facebook/stetho/inspector/protocol/module/DOM$ResolveNodeResponse;->object:Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;

    .line 157
    return-object v5

    .line 138
    .end local v3    # "mappedObjectId":I
    .end local v4    # "remoteObject":Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;
    .end local v5    # "response":Lcom/facebook/stetho/inspector/protocol/module/DOM$ResolveNodeResponse;
    :cond_0
    new-instance v3, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;

    new-instance v4, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;

    sget-object v5, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;->INVALID_PARAMS:Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "No known nodeId="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$ResolveNodeRequest;->nodeId:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6, v2}, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;-><init>(Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;Ljava/lang/String;Lorg/json/JSONObject;)V

    invoke-direct {v3, v4}, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;-><init>(Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;)V

    throw v3
.end method

.method public setAttributesAsText(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 162
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$SetAttributesAsTextRequest;

    invoke-virtual {v0, p2, v1}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$SetAttributesAsTextRequest;

    .line 166
    .local v0, "request":Lcom/facebook/stetho/inspector/protocol/module/DOM$SetAttributesAsTextRequest;
    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mDocument:Lcom/facebook/stetho/inspector/elements/Document;

    new-instance v2, Lcom/facebook/stetho/inspector/protocol/module/DOM$5;

    invoke-direct {v2, p0, v0}, Lcom/facebook/stetho/inspector/protocol/module/DOM$5;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOM;Lcom/facebook/stetho/inspector/protocol/module/DOM$SetAttributesAsTextRequest;)V

    invoke-virtual {v1, v2}, Lcom/facebook/stetho/inspector/elements/Document;->postAndWait(Ljava/lang/Runnable;)V

    .line 175
    return-void
.end method

.method public setInspectModeEnabled(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 179
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$SetInspectModeEnabledRequest;

    invoke-virtual {v0, p2, v1}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$SetInspectModeEnabledRequest;

    .line 183
    .local v0, "request":Lcom/facebook/stetho/inspector/protocol/module/DOM$SetInspectModeEnabledRequest;
    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM;->mDocument:Lcom/facebook/stetho/inspector/elements/Document;

    new-instance v2, Lcom/facebook/stetho/inspector/protocol/module/DOM$6;

    invoke-direct {v2, p0, v0}, Lcom/facebook/stetho/inspector/protocol/module/DOM$6;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOM;Lcom/facebook/stetho/inspector/protocol/module/DOM$SetInspectModeEnabledRequest;)V

    invoke-virtual {v1, v2}, Lcom/facebook/stetho/inspector/elements/Document;->postAndWait(Ljava/lang/Runnable;)V

    .line 189
    return-void
.end method
