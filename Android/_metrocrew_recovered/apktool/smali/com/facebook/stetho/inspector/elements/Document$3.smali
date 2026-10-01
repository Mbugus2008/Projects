.class Lcom/facebook/stetho/inspector/elements/Document$3;
.super Ljava/lang/Object;
.source "Document.java"

# interfaces
.implements Lcom/facebook/stetho/common/Accumulator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/stetho/inspector/elements/Document;->applyDocumentUpdate(Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/stetho/common/Accumulator<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/stetho/inspector/elements/Document;

.field final synthetic val$docUpdate:Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;

.field final synthetic val$garbageElementIds:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;Ljava/util/ArrayList;)V
    .locals 0
    .param p1, "this$0"    # Lcom/facebook/stetho/inspector/elements/Document;

    .line 376
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document$3;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    iput-object p2, p0, Lcom/facebook/stetho/inspector/elements/Document$3;->val$docUpdate:Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;

    iput-object p3, p0, Lcom/facebook/stetho/inspector/elements/Document$3;->val$garbageElementIds:Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public store(Ljava/lang/Object;)V
    .locals 6
    .param p1, "element"    # Ljava/lang/Object;

    .line 379
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document$3;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    invoke-static {v0}, Lcom/facebook/stetho/inspector/elements/Document;->access$500(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->getIdForObject(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    .line 380
    .local v0, "nodeId":Ljava/lang/Integer;
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/Document$3;->val$docUpdate:Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;

    invoke-virtual {v1, p1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->getElementInfo(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/ElementInfo;

    move-result-object v1

    .line 384
    .local v1, "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    iget-object v2, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-nez v2, :cond_0

    .line 385
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/Document$3;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    invoke-static {v2}, Lcom/facebook/stetho/inspector/elements/Document;->access$100(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->getElementInfo(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/ElementInfo;

    move-result-object v2

    .line 386
    .local v2, "oldElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/Document$3;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    invoke-static {v3}, Lcom/facebook/stetho/inspector/elements/Document;->access$500(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;

    move-result-object v3

    iget-object v4, v2, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    invoke-virtual {v3, v4}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->getIdForObject(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 387
    .local v3, "parentNodeId":I
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/Document$3;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    invoke-static {v4}, Lcom/facebook/stetho/inspector/elements/Document;->access$700(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;

    move-result-object v4

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v4, v3, v5}, Lcom/facebook/stetho/inspector/elements/Document$UpdateListenerCollection;->onChildNodeRemoved(II)V

    .line 390
    .end local v2    # "oldElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    .end local v3    # "parentNodeId":I
    :cond_0
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/Document$3;->val$garbageElementIds:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 391
    return-void
.end method
