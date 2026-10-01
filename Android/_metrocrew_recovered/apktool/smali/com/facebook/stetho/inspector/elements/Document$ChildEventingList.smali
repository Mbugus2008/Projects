.class final Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;
.super Ljava/util/ArrayList;
.source "Document.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/elements/Document;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ChildEventingList"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field private mDocumentView:Lcom/facebook/stetho/inspector/elements/DocumentView;

.field private mParentElement:Ljava/lang/Object;

.field private mParentNodeId:I

.field final synthetic this$0:Lcom/facebook/stetho/inspector/elements/Document;


# direct methods
.method private constructor <init>(Lcom/facebook/stetho/inspector/elements/Document;)V
    .locals 0

    .line 552
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 553
    const/4 p1, 0x0

    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->mParentElement:Ljava/lang/Object;

    .line 554
    const/4 p1, -0x1

    iput p1, p0, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->mParentNodeId:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/Document$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;
    .param p2, "x1"    # Lcom/facebook/stetho/inspector/elements/Document$1;

    .line 552
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;-><init>(Lcom/facebook/stetho/inspector/elements/Document;)V

    return-void
.end method


# virtual methods
.method public acquire(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/DocumentView;)V
    .locals 2
    .param p1, "parentElement"    # Ljava/lang/Object;
    .param p2, "documentView"    # Lcom/facebook/stetho/inspector/elements/DocumentView;

    .line 558
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->mParentElement:Ljava/lang/Object;

    .line 560
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->mParentElement:Ljava/lang/Object;

    if-nez v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    .line 562
    invoke-static {v0}, Lcom/facebook/stetho/inspector/elements/Document;->access$500(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->mParentElement:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->getIdForObject(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_0
    iput v0, p0, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->mParentNodeId:I

    .line 564
    iput-object p2, p0, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->mDocumentView:Lcom/facebook/stetho/inspector/elements/DocumentView;

    .line 565
    return-void
.end method

.method public addWithEvent(ILjava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V
    .locals 8
    .param p1, "index"    # I
    .param p2, "element"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Object;",
            "Lcom/facebook/stetho/common/Accumulator<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 576
    .local p3, "insertedElements":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    if-nez p1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    add-int/lit8 v0, p1, -0x1

    invoke-virtual {p0, v0}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 578
    .local v0, "previousElement":Ljava/lang/Object;
    :goto_0
    if-nez v0, :cond_1

    const/4 v1, -0x1

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    .line 580
    invoke-static {v1}, Lcom/facebook/stetho/inspector/elements/Document;->access$500(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->getIdForObject(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    :goto_1
    move v6, v1

    .line 582
    .local v6, "previousNodeId":I
    invoke-virtual {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->add(ILjava/lang/Object;)V

    .line 584
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    invoke-static {v1}, Lcom/facebook/stetho/inspector/elements/Document;->access$700(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;

    move-result-object v2

    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->mDocumentView:Lcom/facebook/stetho/inspector/elements/DocumentView;

    iget v5, p0, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->mParentNodeId:I

    move-object v4, p2

    move-object v7, p3

    .end local p2    # "element":Ljava/lang/Object;
    .end local p3    # "insertedElements":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    .local v4, "element":Ljava/lang/Object;
    .local v7, "insertedElements":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    invoke-virtual/range {v2 .. v7}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->onChildNodeInserted(Lcom/facebook/stetho/inspector/elements/DocumentView;Ljava/lang/Object;IILcom/facebook/stetho/common/Accumulator;)V

    .line 590
    return-void
.end method

.method public release()V
    .locals 2

    .line 568
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->clear()V

    .line 570
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->mParentElement:Ljava/lang/Object;

    .line 571
    const/4 v1, -0x1

    iput v1, p0, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->mParentNodeId:I

    .line 572
    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->mDocumentView:Lcom/facebook/stetho/inspector/elements/DocumentView;

    .line 573
    return-void
.end method

.method public removeWithEvent(I)V
    .locals 4
    .param p1, "index"    # I

    .line 593
    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    .line 594
    .local v0, "element":Ljava/lang/Object;
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    invoke-static {v1}, Lcom/facebook/stetho/inspector/elements/Document;->access$500(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->getIdForObject(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 595
    .local v1, "nodeId":I
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    invoke-static {v2}, Lcom/facebook/stetho/inspector/elements/Document;->access$700(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;

    move-result-object v2

    iget v3, p0, Lcom/facebook/stetho/inspector/elements/Document$ChildEventingList;->mParentNodeId:I

    invoke-virtual {v2, v3, v1}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->onChildNodeRemoved(II)V

    .line 596
    return-void
.end method
