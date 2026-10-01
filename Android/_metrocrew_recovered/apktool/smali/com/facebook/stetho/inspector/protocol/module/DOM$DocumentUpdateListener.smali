.class final Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;
.super Ljava/lang/Object;
.source "DOM.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/elements/Document$UpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/protocol/module/DOM;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "DocumentUpdateListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/stetho/inspector/protocol/module/DOM;


# direct methods
.method private constructor <init>(Lcom/facebook/stetho/inspector/protocol/module/DOM;)V
    .locals 0

    .line 332
    iput-object p1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;->this$0:Lcom/facebook/stetho/inspector/protocol/module/DOM;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/stetho/inspector/protocol/module/DOM;Lcom/facebook/stetho/inspector/protocol/module/DOM$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/facebook/stetho/inspector/protocol/module/DOM;
    .param p2, "x1"    # Lcom/facebook/stetho/inspector/protocol/module/DOM$1;

    .line 332
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOM;)V

    return-void
.end method


# virtual methods
.method public onAttributeModified(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .line 334
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$AttributeModifiedEvent;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/stetho/inspector/protocol/module/DOM$AttributeModifiedEvent;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOM$1;)V

    .line 335
    .local v0, "message":Lcom/facebook/stetho/inspector/protocol/module/DOM$AttributeModifiedEvent;
    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;->this$0:Lcom/facebook/stetho/inspector/protocol/module/DOM;

    invoke-static {v1}, Lcom/facebook/stetho/inspector/protocol/module/DOM;->access$300(Lcom/facebook/stetho/inspector/protocol/module/DOM;)Lcom/facebook/stetho/inspector/elements/Document;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/facebook/stetho/inspector/elements/Document;->getNodeIdForElement(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$AttributeModifiedEvent;->nodeId:I

    .line 336
    iput-object p2, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$AttributeModifiedEvent;->name:Ljava/lang/String;

    .line 337
    iput-object p3, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$AttributeModifiedEvent;->value:Ljava/lang/String;

    .line 338
    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;->this$0:Lcom/facebook/stetho/inspector/protocol/module/DOM;

    invoke-static {v1}, Lcom/facebook/stetho/inspector/protocol/module/DOM;->access$1200(Lcom/facebook/stetho/inspector/protocol/module/DOM;)Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    move-result-object v1

    const-string v2, "DOM.attributeModified"

    invoke-virtual {v1, v2, v0}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;->sendNotificationToPeers(Ljava/lang/String;Ljava/lang/Object;)V

    .line 339
    return-void
.end method

.method public onAttributeRemoved(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 3
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "name"    # Ljava/lang/String;

    .line 342
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$AttributeRemovedEvent;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/stetho/inspector/protocol/module/DOM$AttributeRemovedEvent;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOM$1;)V

    .line 343
    .local v0, "message":Lcom/facebook/stetho/inspector/protocol/module/DOM$AttributeRemovedEvent;
    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;->this$0:Lcom/facebook/stetho/inspector/protocol/module/DOM;

    invoke-static {v1}, Lcom/facebook/stetho/inspector/protocol/module/DOM;->access$300(Lcom/facebook/stetho/inspector/protocol/module/DOM;)Lcom/facebook/stetho/inspector/elements/Document;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/facebook/stetho/inspector/elements/Document;->getNodeIdForElement(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$AttributeRemovedEvent;->nodeId:I

    .line 344
    iput-object p2, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$AttributeRemovedEvent;->name:Ljava/lang/String;

    .line 345
    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;->this$0:Lcom/facebook/stetho/inspector/protocol/module/DOM;

    invoke-static {v1}, Lcom/facebook/stetho/inspector/protocol/module/DOM;->access$1200(Lcom/facebook/stetho/inspector/protocol/module/DOM;)Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    move-result-object v1

    const-string v2, "DOM.attributeRemoved"

    invoke-virtual {v1, v2, v0}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;->sendNotificationToPeers(Ljava/lang/String;Ljava/lang/Object;)V

    .line 346
    return-void
.end method

.method public onChildNodeInserted(Lcom/facebook/stetho/inspector/elements/DocumentView;Ljava/lang/Object;IILcom/facebook/stetho/common/Accumulator;)V
    .locals 3
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

    .line 380
    .local p5, "insertedElements":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;->this$0:Lcom/facebook/stetho/inspector/protocol/module/DOM;

    invoke-static {v0}, Lcom/facebook/stetho/inspector/protocol/module/DOM;->access$1700(Lcom/facebook/stetho/inspector/protocol/module/DOM;)Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;

    move-result-object v0

    .line 382
    .local v0, "insertedEvent":Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;
    iput p3, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;->parentNodeId:I

    .line 383
    iput p4, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;->previousNodeId:I

    .line 384
    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;->this$0:Lcom/facebook/stetho/inspector/protocol/module/DOM;

    invoke-static {v1, p2, p1, p5}, Lcom/facebook/stetho/inspector/protocol/module/DOM;->access$400(Lcom/facebook/stetho/inspector/protocol/module/DOM;Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/DocumentView;Lcom/facebook/stetho/common/Accumulator;)Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;

    move-result-object v1

    iput-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;->node:Lcom/facebook/stetho/inspector/protocol/module/DOM$Node;

    .line 386
    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;->this$0:Lcom/facebook/stetho/inspector/protocol/module/DOM;

    invoke-static {v1}, Lcom/facebook/stetho/inspector/protocol/module/DOM;->access$1200(Lcom/facebook/stetho/inspector/protocol/module/DOM;)Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    move-result-object v1

    const-string v2, "DOM.childNodeInserted"

    invoke-virtual {v1, v2, v0}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;->sendNotificationToPeers(Ljava/lang/String;Ljava/lang/Object;)V

    .line 388
    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;->this$0:Lcom/facebook/stetho/inspector/protocol/module/DOM;

    invoke-static {v1, v0}, Lcom/facebook/stetho/inspector/protocol/module/DOM;->access$1800(Lcom/facebook/stetho/inspector/protocol/module/DOM;Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeInsertedEvent;)V

    .line 389
    return-void
.end method

.method public onChildNodeRemoved(II)V
    .locals 3
    .param p1, "parentNodeId"    # I
    .param p2, "nodeId"    # I

    .line 365
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;->this$0:Lcom/facebook/stetho/inspector/protocol/module/DOM;

    invoke-static {v0}, Lcom/facebook/stetho/inspector/protocol/module/DOM;->access$1500(Lcom/facebook/stetho/inspector/protocol/module/DOM;)Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;

    move-result-object v0

    .line 367
    .local v0, "removedEvent":Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;
    iput p1, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;->parentNodeId:I

    .line 368
    iput p2, v0, Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;->nodeId:I

    .line 369
    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;->this$0:Lcom/facebook/stetho/inspector/protocol/module/DOM;

    invoke-static {v1}, Lcom/facebook/stetho/inspector/protocol/module/DOM;->access$1200(Lcom/facebook/stetho/inspector/protocol/module/DOM;)Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    move-result-object v1

    const-string v2, "DOM.childNodeRemoved"

    invoke-virtual {v1, v2, v0}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;->sendNotificationToPeers(Ljava/lang/String;Ljava/lang/Object;)V

    .line 371
    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;->this$0:Lcom/facebook/stetho/inspector/protocol/module/DOM;

    invoke-static {v1, v0}, Lcom/facebook/stetho/inspector/protocol/module/DOM;->access$1600(Lcom/facebook/stetho/inspector/protocol/module/DOM;Lcom/facebook/stetho/inspector/protocol/module/DOM$ChildNodeRemovedEvent;)V

    .line 372
    return-void
.end method

.method public onInspectRequested(Ljava/lang/Object;)V
    .locals 4
    .param p1, "element"    # Ljava/lang/Object;

    .line 349
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;->this$0:Lcom/facebook/stetho/inspector/protocol/module/DOM;

    invoke-static {v0}, Lcom/facebook/stetho/inspector/protocol/module/DOM;->access$300(Lcom/facebook/stetho/inspector/protocol/module/DOM;)Lcom/facebook/stetho/inspector/elements/Document;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/Document;->getNodeIdForElement(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    .line 350
    .local v0, "nodeId":Ljava/lang/Integer;
    if-nez v0, :cond_0

    .line 351
    const-string v1, "DocumentProvider.Listener.onInspectRequested() called for a non-mapped node: element=%s"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/facebook/stetho/common/LogUtil;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_0

    .line 356
    :cond_0
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$InspectNodeRequestedEvent;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/DOM$InspectNodeRequestedEvent;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOM$1;)V

    .line 357
    .local v1, "message":Lcom/facebook/stetho/inspector/protocol/module/DOM$InspectNodeRequestedEvent;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    iput v2, v1, Lcom/facebook/stetho/inspector/protocol/module/DOM$InspectNodeRequestedEvent;->nodeId:I

    .line 358
    iget-object v2, p0, Lcom/facebook/stetho/inspector/protocol/module/DOM$DocumentUpdateListener;->this$0:Lcom/facebook/stetho/inspector/protocol/module/DOM;

    invoke-static {v2}, Lcom/facebook/stetho/inspector/protocol/module/DOM;->access$1200(Lcom/facebook/stetho/inspector/protocol/module/DOM;)Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    move-result-object v2

    const-string v3, "DOM.inspectNodeRequested"

    invoke-virtual {v2, v3, v1}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;->sendNotificationToPeers(Ljava/lang/String;Ljava/lang/Object;)V

    .line 360
    .end local v1    # "message":Lcom/facebook/stetho/inspector/protocol/module/DOM$InspectNodeRequestedEvent;
    :goto_0
    return-void
.end method
