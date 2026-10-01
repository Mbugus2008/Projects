.class Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;
.super Ljava/lang/Object;
.source "Document.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/elements/Document;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UpdateListenerCollection"
.end annotation


# instance fields
.field private final mListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mListenersSnapshot:[Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;

.field final synthetic this$0:Lcom/facebook/stetho/inspector/elements/Document;


# direct methods
.method public constructor <init>(Lcom/facebook/stetho/inspector/elements/Document;)V
    .locals 0

    .line 603
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 604
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->mListeners:Ljava/util/List;

    .line 605
    return-void
.end method

.method private getListenersSnapshot()[Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;
    .locals 3

    .line 624
    nop

    :goto_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->mListenersSnapshot:[Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;

    .line 625
    .local v0, "listenersSnapshot":[Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;
    if-eqz v0, :cond_0

    .line 626
    return-object v0

    .line 628
    :cond_0
    monitor-enter p0

    .line 629
    :try_start_0
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->mListenersSnapshot:[Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;

    if-nez v1, :cond_1

    .line 630
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->mListeners:Ljava/util/List;

    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->mListeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    new-array v2, v2, [Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;

    iput-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->mListenersSnapshot:[Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;

    .line 631
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->mListenersSnapshot:[Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;

    monitor-exit p0

    return-object v1

    .line 633
    :cond_1
    monitor-exit p0

    .line 634
    .end local v0    # "listenersSnapshot":[Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;
    goto :goto_0

    .line 633
    .restart local v0    # "listenersSnapshot":[Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public declared-synchronized add(Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;

    monitor-enter p0

    .line 608
    :try_start_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->mListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 609
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->mListenersSnapshot:[Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 610
    monitor-exit p0

    return-void

    .line 607
    .end local p0    # "this":Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;
    .end local p1    # "listener":Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public declared-synchronized clear()V
    .locals 1

    monitor-enter p0

    .line 618
    :try_start_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->mListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 619
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->mListenersSnapshot:[Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 620
    monitor-exit p0

    return-void

    .line 617
    .end local p0    # "this":Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public onAttributeModified(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .line 639
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->getListenersSnapshot()[Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 640
    .local v3, "listener":Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;
    invoke-interface {v3, p1, p2, p3}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;->onAttributeModified(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    .line 639
    .end local v3    # "listener":Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 642
    :cond_0
    return-void
.end method

.method public onAttributeRemoved(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 4
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;

    .line 646
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->getListenersSnapshot()[Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 647
    .local v3, "listener":Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;
    invoke-interface {v3, p1, p2}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;->onAttributeRemoved(Ljava/lang/Object;Ljava/lang/String;)V

    .line 646
    .end local v3    # "listener":Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 649
    :cond_0
    return-void
.end method

.method public onChildNodeInserted(Lcom/facebook/stetho/inspector/elements/DocumentView;Ljava/lang/Object;IILcom/facebook/stetho/common/Accumulator;)V
    .locals 9
    .param p1, "view"    # Lcom/facebook/stetho/inspector/elements/DocumentView;
    .param p2, "element"    # Ljava/lang/Object;
    .param p3, "parentNodeId"    # I
    .param p4, "previousNodeId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/stetho/inspector/elements/DocumentView;",
            "Ljava/lang/Object;",
            "II",
            "Lcom/facebook/stetho/common/Accumulator<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 672
    .local p5, "insertedItems":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->getListenersSnapshot()[Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 673
    .local v3, "listener":Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;
    move-object v4, p1

    move-object v5, p2

    move v6, p3

    move v7, p4

    move-object v8, p5

    .end local p1    # "view":Lcom/facebook/stetho/inspector/elements/DocumentView;
    .end local p2    # "element":Ljava/lang/Object;
    .end local p3    # "parentNodeId":I
    .end local p4    # "previousNodeId":I
    .end local p5    # "insertedItems":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    .local v4, "view":Lcom/facebook/stetho/inspector/elements/DocumentView;
    .local v5, "element":Ljava/lang/Object;
    .local v6, "parentNodeId":I
    .local v7, "previousNodeId":I
    .local v8, "insertedItems":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    invoke-interface/range {v3 .. v8}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;->onChildNodeInserted(Lcom/facebook/stetho/inspector/elements/DocumentView;Ljava/lang/Object;IILcom/facebook/stetho/common/Accumulator;)V

    .line 672
    .end local v3    # "listener":Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 675
    .end local v4    # "view":Lcom/facebook/stetho/inspector/elements/DocumentView;
    .end local v5    # "element":Ljava/lang/Object;
    .end local v6    # "parentNodeId":I
    .end local v7    # "previousNodeId":I
    .end local v8    # "insertedItems":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    .restart local p1    # "view":Lcom/facebook/stetho/inspector/elements/DocumentView;
    .restart local p2    # "element":Ljava/lang/Object;
    .restart local p3    # "parentNodeId":I
    .restart local p4    # "previousNodeId":I
    .restart local p5    # "insertedItems":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    :cond_0
    return-void
.end method

.method public onChildNodeRemoved(II)V
    .locals 4
    .param p1, "parentNodeId"    # I
    .param p2, "nodeId"    # I

    .line 660
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->getListenersSnapshot()[Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 661
    .local v3, "listener":Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;
    invoke-interface {v3, p1, p2}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;->onChildNodeRemoved(II)V

    .line 660
    .end local v3    # "listener":Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 663
    :cond_0
    return-void
.end method

.method public onInspectRequested(Ljava/lang/Object;)V
    .locals 4
    .param p1, "element"    # Ljava/lang/Object;

    .line 653
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->getListenersSnapshot()[Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 654
    .local v3, "listener":Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;
    invoke-interface {v3, p1}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;->onInspectRequested(Ljava/lang/Object;)V

    .line 653
    .end local v3    # "listener":Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 656
    :cond_0
    return-void
.end method

.method public declared-synchronized remove(Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;

    monitor-enter p0

    .line 613
    :try_start_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->mListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 614
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->mListenersSnapshot:[Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 615
    monitor-exit p0

    return-void

    .line 612
    .end local p0    # "this":Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;
    .end local p1    # "listener":Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
