.class public final Lcom/facebook/stetho/inspector/elements/Document;
.super Lcom/facebook/stetho/inspector/helper/ThreadBoundProxy;
.source "Document.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;,
        Lcom/facebook/stetho/inspector/elements/Document$ProviderListener;,
        Lcom/facebook/stetho/inspector/elements/Document$DocumentObjectIdMapper;,
        Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;,
        Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;,
        Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;
    }
.end annotation


# instance fields
.field private mCachedAttributeAccumulator:Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;

.field private mCachedChildEventingList:Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;

.field private mCachedChildrenAccumulator:Lcom/facebook/stetho/common/ArrayListAccumulator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/stetho/common/ArrayListAccumulator<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final mCachedUpdateQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

.field private final mFactory:Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;

.field private final mObjectIdMapper:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

.field private mReferenceCounter:I

.field private mShadowDocument:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

.field private mUpdateListeners:Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;


# direct methods
.method public constructor <init>(Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;)V
    .locals 2
    .param p1, "factory"    # Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;

    .line 45
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/helper/ThreadBoundProxy;-><init>(Lcom/facebook/stetho/common/ThreadBound;)V

    .line 47
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mFactory:Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;

    .line 48
    new-instance v0, Lcom/facebook/stetho/inspector/elements/Document$DocumentObjectIdMapper;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/facebook/stetho/inspector/elements/Document$DocumentObjectIdMapper;-><init>(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/Document$1;)V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mObjectIdMapper:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    .line 49
    const/4 v0, 0x0

    iput v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mReferenceCounter:I

    .line 50
    new-instance v0, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;

    invoke-direct {v0, p0}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;-><init>(Lcom/facebook/stetho/inspector/elements/Document;)V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mUpdateListeners:Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;

    .line 51
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedUpdateQueue:Ljava/util/Queue;

    .line 52
    return-void
.end method

.method static synthetic access$100(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/elements/ShadowDocument;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;

    .line 29
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mShadowDocument:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;Ljava/util/List;Lcom/facebook/stetho/common/Accumulator;)V
    .locals 0
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Lcom/facebook/stetho/common/Accumulator;

    .line 29
    invoke-static {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/Document;->updateListenerChildren(Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;Ljava/util/List;Lcom/facebook/stetho/common/Accumulator;)V

    return-void
.end method

.method static synthetic access$102(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/ShadowDocument;)Lcom/facebook/stetho/inspector/elements/ShadowDocument;
    .locals 0
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;
    .param p1, "x1"    # Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    .line 29
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mShadowDocument:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;)V
    .locals 0
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;
    .param p1, "x1"    # Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;

    .line 29
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/elements/Document;->releaseChildEventingList(Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/facebook/stetho/inspector/elements/Document;)V
    .locals 0
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;

    .line 29
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Document;->updateTree()V

    return-void
.end method

.method static synthetic access$200(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/elements/DocumentProvider;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;

    .line 29
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    return-object v0
.end method

.method static synthetic access$202(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/DocumentProvider;)Lcom/facebook/stetho/inspector/elements/DocumentProvider;
    .locals 0
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;
    .param p1, "x1"    # Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    .line 29
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    return-object p1
.end method

.method static synthetic access$300(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;

    .line 29
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Document;->createShadowDocumentUpdate()Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;

    .line 29
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mObjectIdMapper:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    return-object v0
.end method

.method static synthetic access$700(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;

    .line 29
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mUpdateListeners:Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;

    return-object v0
.end method

.method static synthetic access$900(Lcom/facebook/stetho/inspector/elements/Document;Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/DocumentView;)Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;
    .param p1, "x1"    # Ljava/lang/Object;
    .param p2, "x2"    # Lcom/facebook/stetho/inspector/elements/DocumentView;

    .line 29
    invoke-direct {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/Document;->acquireChildEventingList(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/DocumentView;)Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;

    move-result-object v0

    return-object v0
.end method

.method private acquireCachedAttributeAccumulator()Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;
    .locals 2

    .line 254
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedAttributeAccumulator:Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;

    .line 256
    .local v0, "accumulator":Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;
    if-nez v0, :cond_0

    .line 257
    new-instance v1, Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;-><init>()V

    move-object v0, v1

    .line 260
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedChildrenAccumulator:Lcom/facebook/stetho/common/ArrayListAccumulator;

    .line 262
    return-object v0
.end method

.method private acquireChildEventingList(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/DocumentView;)Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;
    .locals 3
    .param p1, "parentElement"    # Ljava/lang/Object;
    .param p2, "documentView"    # Lcom/facebook/stetho/inspector/elements/DocumentView;

    .line 234
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedChildEventingList:Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;

    .line 236
    .local v0, "childEventingList":Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;
    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 237
    new-instance v2, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;

    invoke-direct {v2, p0, v1}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;-><init>(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/Document$1;)V

    move-object v0, v2

    .line 240
    :cond_0
    iput-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedChildEventingList:Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;

    .line 242
    invoke-virtual {v0, p1, p2}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->acquire(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/DocumentView;)V

    .line 243
    return-object v0
.end method

.method private acquireChildrenAccumulator()Lcom/facebook/stetho/common/ArrayListAccumulator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/stetho/common/ArrayListAccumulator<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 274
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedChildrenAccumulator:Lcom/facebook/stetho/common/ArrayListAccumulator;

    .line 275
    .local v0, "accumulator":Lcom/facebook/stetho/common/ArrayListAccumulator;, "Lcom/facebook/stetho/common/ArrayListAccumulator<Ljava/lang/Object;>;"
    if-nez v0, :cond_0

    .line 276
    new-instance v1, Lcom/facebook/stetho/common/ArrayListAccumulator;

    invoke-direct {v1}, Lcom/facebook/stetho/common/ArrayListAccumulator;-><init>()V

    move-object v0, v1

    .line 278
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedChildrenAccumulator:Lcom/facebook/stetho/common/ArrayListAccumulator;

    .line 279
    return-object v0
.end method

.method private applyDocumentUpdate(Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;)V
    .locals 5
    .param p1, "docUpdate"    # Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;

    .line 374
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 376
    .local v0, "garbageElementIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    new-instance v1, Lcom/facebook/stetho/inspector/elements/Document$3;

    invoke-direct {v1, p0, p1, v0}, Lcom/facebook/stetho/inspector/elements/Document$3;-><init>(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;Ljava/util/ArrayList;)V

    invoke-virtual {p1, v1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->getGarbageElements(Lcom/facebook/stetho/common/Accumulator;)V

    .line 394
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 400
    new-instance v1, Lcom/facebook/stetho/inspector/elements/Document$4;

    invoke-direct {v1, p0, v0, p1}, Lcom/facebook/stetho/inspector/elements/Document$4;-><init>(Lcom/facebook/stetho/inspector/elements/Document;Ljava/util/ArrayList;Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;)V

    invoke-virtual {p1, v1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->getChangedElements(Lcom/facebook/stetho/common/Accumulator;)V

    .line 425
    const/4 v1, 0x0

    .local v1, "i":I
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    .local v2, "N":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 426
    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/Document;->mObjectIdMapper:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->removeObjectById(I)Ljava/lang/Object;

    .line 425
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 431
    .end local v1    # "i":I
    .end local v2    # "N":I
    :cond_0
    new-instance v1, Lcom/facebook/stetho/inspector/elements/Document$5;

    invoke-direct {v1, p0, p1}, Lcom/facebook/stetho/inspector/elements/Document$5;-><init>(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;)V

    invoke-virtual {p1, v1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->getChangedElements(Lcom/facebook/stetho/common/Accumulator;)V

    .line 492
    invoke-virtual {p1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->commit()V

    .line 493
    return-void
.end method

.method private cleanUp()V
    .locals 2

    .line 83
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    new-instance v1, Lcom/facebook/stetho/inspector/elements/Document$2;

    invoke-direct {v1, p0}, Lcom/facebook/stetho/inspector/elements/Document$2;-><init>(Lcom/facebook/stetho/inspector/elements/Document;)V

    invoke-interface {v0, v1}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->postAndWait(Ljava/lang/Runnable;)V

    .line 94
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mUpdateListeners:Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;

    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->clear()V

    .line 95
    return-void
.end method

.method private createShadowDocumentUpdate()Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;
    .locals 9

    .line 290
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document;->verifyThreadAccess()V

    .line 292
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v0}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->getRootElement()Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mShadowDocument:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-virtual {v1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->getRootElement()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_3

    .line 296
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Document;->acquireChildrenAccumulator()Lcom/facebook/stetho/common/ArrayListAccumulator;

    move-result-object v0

    .line 298
    .local v0, "childrenAccumulator":Lcom/facebook/stetho/common/ArrayListAccumulator;, "Lcom/facebook/stetho/common/ArrayListAccumulator<Ljava/lang/Object;>;"
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mShadowDocument:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-virtual {v1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->beginUpdate()Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;

    move-result-object v1

    .line 299
    .local v1, "updateBuilder":Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedUpdateQueue:Ljava/util/Queue;

    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v3}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->getRootElement()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 301
    :goto_0
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedUpdateQueue:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    .line 302
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedUpdateQueue:Ljava/util/Queue;

    invoke-interface {v2}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v2

    .line 303
    .local v2, "element":Ljava/lang/Object;
    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v3, v2}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->getNodeDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeDescriptor;

    move-result-object v3

    .line 304
    .local v3, "descriptor":Lcom/facebook/stetho/inspector/elements/NodeDescriptor;
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/Document;->mObjectIdMapper:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    invoke-virtual {v4, v2}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->putObject(Ljava/lang/Object;)I

    .line 305
    invoke-interface {v3, v2, v0}, Lcom/facebook/stetho/inspector/elements/NodeDescriptor;->getChildren(Ljava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V

    .line 307
    const/4 v4, 0x0

    .local v4, "i":I
    invoke-virtual {v0}, Lcom/facebook/stetho/common/ArrayListAccumulator;->size()I

    move-result v5

    .local v5, "size":I
    :goto_1
    if-ge v4, v5, :cond_1

    .line 308
    invoke-virtual {v0, v4}, Lcom/facebook/stetho/common/ArrayListAccumulator;->get(I)Ljava/lang/Object;

    move-result-object v6

    .line 309
    .local v6, "child":Ljava/lang/Object;
    if-eqz v6, :cond_0

    .line 310
    iget-object v7, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedUpdateQueue:Ljava/util/Queue;

    invoke-interface {v7, v6}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 315
    :cond_0
    nop

    .line 317
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    .line 318
    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v8

    filled-new-array {v7, v8, v2}, [Ljava/lang/Object;

    move-result-object v7

    .line 315
    const-string v8, "%s.getChildren() emitted a null child at position %s for element %s"

    invoke-static {v8, v7}, Lcom/facebook/stetho/common/LogUtil;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 321
    invoke-virtual {v0, v4}, Lcom/facebook/stetho/common/ArrayListAccumulator;->remove(I)Ljava/lang/Object;

    .line 322
    add-int/lit8 v4, v4, -0x1

    .line 323
    add-int/lit8 v5, v5, -0x1

    .line 307
    .end local v6    # "child":Ljava/lang/Object;
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 327
    .end local v4    # "i":I
    .end local v5    # "size":I
    :cond_1
    invoke-virtual {v1, v2, v0}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->setElementChildren(Ljava/lang/Object;Ljava/util/List;)V

    .line 328
    invoke-virtual {v0}, Lcom/facebook/stetho/common/ArrayListAccumulator;->clear()V

    .line 329
    .end local v2    # "element":Ljava/lang/Object;
    .end local v3    # "descriptor":Lcom/facebook/stetho/inspector/elements/NodeDescriptor;
    goto :goto_0

    .line 331
    :cond_2
    invoke-direct {p0, v0}, Lcom/facebook/stetho/inspector/elements/Document;->releaseChildrenAccumulator(Lcom/facebook/stetho/common/ArrayListAccumulator;)V

    .line 333
    invoke-virtual {v1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->build()Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;

    move-result-object v2

    return-object v2

    .line 293
    .end local v0    # "childrenAccumulator":Lcom/facebook/stetho/common/ArrayListAccumulator;, "Lcom/facebook/stetho/common/ArrayListAccumulator<Ljava/lang/Object;>;"
    .end local v1    # "updateBuilder":Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;
    :cond_3
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method private doesElementMatch(Ljava/lang/Object;Ljava/util/regex/Pattern;)Z
    .locals 5
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "queryPattern"    # Ljava/util/regex/Pattern;

    .line 215
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Document;->acquireCachedAttributeAccumulator()Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;

    move-result-object v0

    .line 216
    .local v0, "accumulator":Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v1, p1}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->getNodeDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeDescriptor;

    move-result-object v1

    .line 218
    .local v1, "descriptor":Lcom/facebook/stetho/inspector/elements/NodeDescriptor;
    invoke-interface {v1, p1, v0}, Lcom/facebook/stetho/inspector/elements/NodeDescriptor;->getAttributes(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;)V

    .line 220
    const/4 v2, 0x0

    .local v2, "i":I
    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;->size()I

    move-result v3

    .local v3, "N":I
    :goto_0
    if-ge v2, v3, :cond_1

    .line 221
    invoke-virtual {v0, v2}, Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    invoke-virtual {p2, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 222
    invoke-direct {p0, v0}, Lcom/facebook/stetho/inspector/elements/Document;->releaseCachedAttributeAccumulator(Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;)V

    .line 223
    const/4 v4, 0x1

    return v4

    .line 220
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 227
    .end local v2    # "i":I
    .end local v3    # "N":I
    :cond_1
    invoke-direct {p0, v0}, Lcom/facebook/stetho/inspector/elements/Document;->releaseCachedAttributeAccumulator(Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;)V

    .line 228
    invoke-interface {v1, p1}, Lcom/facebook/stetho/inspector/elements/NodeDescriptor;->getNodeName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    return v2
.end method

.method private findMatches(Ljava/lang/Object;Ljava/util/regex/Pattern;Lcom/facebook/stetho/common/Accumulator;)V
    .locals 5
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "queryPattern"    # Ljava/util/regex/Pattern;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/regex/Pattern;",
            "Lcom/facebook/stetho/common/Accumulator<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 201
    .local p3, "matchedIds":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Integer;>;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mShadowDocument:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->getElementInfo(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/ElementInfo;

    move-result-object v0

    .line 203
    .local v0, "info":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    const/4 v1, 0x0

    .local v1, "i":I
    iget-object v2, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    .local v2, "size":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 204
    iget-object v3, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    .line 206
    .local v3, "childElement":Ljava/lang/Object;
    invoke-direct {p0, v3, p2}, Lcom/facebook/stetho/inspector/elements/Document;->doesElementMatch(Ljava/lang/Object;Ljava/util/regex/Pattern;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 207
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/Document;->mObjectIdMapper:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    invoke-virtual {v4, v3}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->getIdForObject(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {p3, v4}, Lcom/facebook/stetho/common/Accumulator;->store(Ljava/lang/Object;)V

    .line 210
    :cond_0
    invoke-direct {p0, v3, p2, p3}, Lcom/facebook/stetho/inspector/elements/Document;->findMatches(Ljava/lang/Object;Ljava/util/regex/Pattern;Lcom/facebook/stetho/common/Accumulator;)V

    .line 203
    .end local v3    # "childElement":Ljava/lang/Object;
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 212
    .end local v1    # "i":I
    .end local v2    # "size":I
    :cond_1
    return-void
.end method

.method private init()V
    .locals 2

    .line 69
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mFactory:Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;

    invoke-interface {v0}, Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;->create()Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    .line 71
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    new-instance v1, Lcom/facebook/stetho/inspector/elements/Document$1;

    invoke-direct {v1, p0}, Lcom/facebook/stetho/inspector/elements/Document$1;-><init>(Lcom/facebook/stetho/inspector/elements/Document;)V

    invoke-interface {v0, v1}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->postAndWait(Ljava/lang/Runnable;)V

    .line 80
    return-void
.end method

.method private releaseCachedAttributeAccumulator(Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;)V
    .locals 1
    .param p1, "accumulator"    # Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;

    .line 266
    invoke-virtual {p1}, Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;->clear()V

    .line 268
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedAttributeAccumulator:Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;

    if-nez v0, :cond_0

    .line 269
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedAttributeAccumulator:Lcom/facebook/stetho/inspector/elements/Document$AttributeListAccumulator;

    .line 271
    :cond_0
    return-void
.end method

.method private releaseChildEventingList(Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;)V
    .locals 1
    .param p1, "childEventingList"    # Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;

    .line 247
    invoke-virtual {p1}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->release()V

    .line 248
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedChildEventingList:Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;

    if-nez v0, :cond_0

    .line 249
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedChildEventingList:Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;

    .line 251
    :cond_0
    return-void
.end method

.method private releaseChildrenAccumulator(Lcom/facebook/stetho/common/ArrayListAccumulator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/stetho/common/ArrayListAccumulator<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 283
    .local p1, "accumulator":Lcom/facebook/stetho/common/ArrayListAccumulator;, "Lcom/facebook/stetho/common/ArrayListAccumulator<Ljava/lang/Object;>;"
    invoke-virtual {p1}, Lcom/facebook/stetho/common/ArrayListAccumulator;->clear()V

    .line 284
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedChildrenAccumulator:Lcom/facebook/stetho/common/ArrayListAccumulator;

    if-nez v0, :cond_0

    .line 285
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mCachedChildrenAccumulator:Lcom/facebook/stetho/common/ArrayListAccumulator;

    .line 287
    :cond_0
    return-void
.end method

.method private static updateListenerChildren(Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;Ljava/util/List;Lcom/facebook/stetho/common/Accumulator;)V
    .locals 5
    .param p0, "listenerChildren"    # Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/facebook/stetho/common/Accumulator<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 499
    .local p1, "newChildren":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    .local p2, "insertedElements":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .line 500
    .local v0, "index":I
    :goto_0
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->size()I

    move-result v1

    if-gt v0, v1, :cond_5

    .line 502
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->size()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 503
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 504
    goto :goto_1

    .line 507
    :cond_0
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 508
    .local v1, "newElement":Ljava/lang/Object;
    invoke-virtual {p0, v0, v1, p2}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->addWithEvent(ILjava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V

    .line 509
    add-int/lit8 v0, v0, 0x1

    .line 510
    goto :goto_0

    .line 514
    .end local v1    # "newElement":Ljava/lang/Object;
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v0, v1, :cond_2

    .line 515
    invoke-virtual {p0, v0}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->removeWithEvent(I)V

    .line 516
    goto :goto_0

    .line 519
    :cond_2
    invoke-virtual {p0, v0}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 520
    .local v1, "listenerElement":Ljava/lang/Object;
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    .line 523
    .local v2, "newElement":Ljava/lang/Object;
    if-ne v1, v2, :cond_3

    .line 524
    add-int/lit8 v0, v0, 0x1

    .line 525
    goto :goto_0

    .line 528
    :cond_3
    invoke-virtual {p0, v2}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->indexOf(Ljava/lang/Object;)I

    move-result v3

    .line 529
    .local v3, "newElementListenerIndex":I
    const/4 v4, -0x1

    if-ne v3, v4, :cond_4

    .line 530
    invoke-virtual {p0, v0, v2, p2}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->addWithEvent(ILjava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V

    .line 531
    add-int/lit8 v0, v0, 0x1

    .line 532
    goto :goto_0

    .line 541
    :cond_4
    invoke-virtual {p0, v3}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->removeWithEvent(I)V

    .line 542
    invoke-virtual {p0, v0, v2, p2}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->addWithEvent(ILjava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V

    .line 544
    nop

    .end local v1    # "listenerElement":Ljava/lang/Object;
    .end local v2    # "newElement":Ljava/lang/Object;
    .end local v3    # "newElementListenerIndex":I
    add-int/lit8 v0, v0, 0x1

    .line 545
    goto :goto_0

    .line 546
    :cond_5
    :goto_1
    return-void
.end method

.method private updateTree()V
    .locals 8

    .line 337
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 339
    .local v0, "startTimeMs":J
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Document;->createShadowDocumentUpdate()Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;

    move-result-object v2

    .line 340
    .local v2, "docUpdate":Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;
    invoke-virtual {v2}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->isEmpty()Z

    move-result v3

    .line 341
    .local v3, "isEmpty":Z
    if-eqz v3, :cond_0

    .line 342
    invoke-virtual {v2}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->abandon()V

    goto :goto_0

    .line 344
    :cond_0
    invoke-direct {p0, v2}, Lcom/facebook/stetho/inspector/elements/Document;->applyDocumentUpdate(Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;)V

    .line 347
    :goto_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    sub-long/2addr v4, v0

    .line 348
    .local v4, "deltaMs":J
    nop

    .line 350
    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v6

    if-eqz v3, :cond_1

    const-string v7, " (no changes)"

    goto :goto_1

    :cond_1
    const-string v7, ""

    :goto_1
    filled-new-array {v6, v7}, [Ljava/lang/Object;

    move-result-object v6

    .line 348
    const-string v7, "Document.updateTree() completed in %s ms%s"

    invoke-static {v7, v6}, Lcom/facebook/stetho/common/LogUtil;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 352
    return-void
.end method


# virtual methods
.method public declared-synchronized addRef()V
    .locals 2

    monitor-enter p0

    .line 55
    :try_start_0
    iget v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mReferenceCounter:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mReferenceCounter:I

    if-nez v0, :cond_0

    .line 56
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Document;->init()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    .end local p0    # "this":Lcom/facebook/stetho/inspector/elements/Document;
    :cond_0
    monitor-exit p0

    return-void

    .line 54
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public addUpdateListener(Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;)V
    .locals 1
    .param p1, "updateListener"    # Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;

    .line 98
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mUpdateListeners:Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->add(Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;)V

    .line 99
    return-void
.end method

.method public findMatchingElements(Ljava/lang/String;Lcom/facebook/stetho/common/Accumulator;)V
    .locals 2
    .param p1, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/facebook/stetho/common/Accumulator<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 192
    .local p2, "matchedIds":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Integer;>;"
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document;->verifyThreadAccess()V

    .line 194
    invoke-static {p1}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 195
    .local v0, "queryPattern":Ljava/util/regex/Pattern;
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v1}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->getRootElement()Ljava/lang/Object;

    move-result-object v1

    .line 197
    .local v1, "rootElement":Ljava/lang/Object;
    invoke-direct {p0, v1, v0, p2}, Lcom/facebook/stetho/inspector/elements/Document;->findMatches(Ljava/lang/Object;Ljava/util/regex/Pattern;Lcom/facebook/stetho/common/Accumulator;)V

    .line 198
    return-void
.end method

.method public getDocumentView()Lcom/facebook/stetho/inspector/elements/DocumentView;
    .locals 1

    .line 167
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document;->verifyThreadAccess()V

    .line 168
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mShadowDocument:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    return-object v0
.end method

.method public getElementComputedStyles(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;)V
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "styleAccumulator"    # Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;

    .line 161
    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/Document;->getNodeDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeDescriptor;

    move-result-object v0

    .line 163
    .local v0, "nodeDescriptor":Lcom/facebook/stetho/inspector/elements/NodeDescriptor;
    invoke-interface {v0, p1, p2}, Lcom/facebook/stetho/inspector/elements/NodeDescriptor;->getComputedStyles(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;)V

    .line 164
    return-void
.end method

.method public getElementForNodeId(I)Ljava/lang/Object;
    .locals 1
    .param p1, "id"    # I
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 134
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mObjectIdMapper:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->getObjectForId(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getElementStyleRuleNames(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/StyleRuleNameAccumulator;)V
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "accumulator"    # Lcom/facebook/stetho/inspector/elements/StyleRuleNameAccumulator;

    .line 143
    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/Document;->getNodeDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeDescriptor;

    move-result-object v0

    .line 145
    .local v0, "nodeDescriptor":Lcom/facebook/stetho/inspector/elements/NodeDescriptor;
    invoke-interface {v0, p1, p2}, Lcom/facebook/stetho/inspector/elements/NodeDescriptor;->getStyleRuleNames(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/StyleRuleNameAccumulator;)V

    .line 146
    return-void
.end method

.method public getElementStyles(Ljava/lang/Object;Ljava/lang/String;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "ruleName"    # Ljava/lang/String;
    .param p3, "accumulator"    # Lcom/facebook/stetho/inspector/elements/StyleAccumulator;

    .line 149
    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/Document;->getNodeDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeDescriptor;

    move-result-object v0

    .line 151
    .local v0, "nodeDescriptor":Lcom/facebook/stetho/inspector/elements/NodeDescriptor;
    invoke-interface {v0, p1, p2, p3}, Lcom/facebook/stetho/inspector/elements/NodeDescriptor;->getStyles(Ljava/lang/Object;Ljava/lang/String;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    .line 152
    return-void
.end method

.method public getNodeDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeDescriptor;
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 106
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document;->verifyThreadAccess()V

    .line 107
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v0, p1}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->getNodeDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public getNodeIdForElement(Ljava/lang/Object;)Ljava/lang/Integer;
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 128
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mObjectIdMapper:Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->getIdForObject(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getRootElement()Ljava/lang/Object;
    .locals 2

    .line 172
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document;->verifyThreadAccess()V

    .line 174
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v0}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->getRootElement()Ljava/lang/Object;

    move-result-object v0

    .line 175
    .local v0, "rootElement":Ljava/lang/Object;
    if-eqz v0, :cond_1

    .line 181
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document;->mShadowDocument:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-virtual {v1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->getRootElement()Ljava/lang/Object;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 188
    return-object v0

    .line 185
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1

    .line 178
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V

    throw v1
.end method

.method public hideHighlight()V
    .locals 1

    .line 116
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document;->verifyThreadAccess()V

    .line 117
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v0}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->hideHighlight()V

    .line 118
    return-void
.end method

.method public highlightElement(Ljava/lang/Object;I)V
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "color"    # I

    .line 111
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document;->verifyThreadAccess()V

    .line 112
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v0, p1, p2}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->highlightElement(Ljava/lang/Object;I)V

    .line 113
    return-void
.end method

.method public declared-synchronized release()V
    .locals 1

    monitor-enter p0

    .line 61
    :try_start_0
    iget v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mReferenceCounter:I

    if-lez v0, :cond_0

    .line 62
    iget v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mReferenceCounter:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mReferenceCounter:I

    if-nez v0, :cond_0

    .line 63
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Document;->cleanUp()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    .end local p0    # "this":Lcom/facebook/stetho/inspector/elements/Document;
    :cond_0
    monitor-exit p0

    return-void

    .line 60
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public removeUpdateListener(Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;)V
    .locals 1
    .param p1, "updateListener"    # Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;

    .line 102
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mUpdateListeners:Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->remove(Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;)V

    .line 103
    return-void
.end method

.method public setAttributesAsText(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "text"    # Ljava/lang/String;

    .line 138
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document;->verifyThreadAccess()V

    .line 139
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v0, p1, p2}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->setAttributesAsText(Ljava/lang/Object;Ljava/lang/String;)V

    .line 140
    return-void
.end method

.method public setElementStyle(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "ruleName"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "value"    # Ljava/lang/String;

    .line 155
    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/Document;->getNodeDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeDescriptor;

    move-result-object v0

    .line 157
    .local v0, "nodeDescriptor":Lcom/facebook/stetho/inspector/elements/NodeDescriptor;
    invoke-interface {v0, p1, p2, p3, p4}, Lcom/facebook/stetho/inspector/elements/NodeDescriptor;->setStyle(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    return-void
.end method

.method public setInspectModeEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .line 121
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document;->verifyThreadAccess()V

    .line 122
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    invoke-interface {v0, p1}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->setInspectModeEnabled(Z)V

    .line 123
    return-void
.end method
