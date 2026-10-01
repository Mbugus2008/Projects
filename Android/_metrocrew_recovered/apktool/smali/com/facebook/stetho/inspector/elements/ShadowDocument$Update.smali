.class public final Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;
.super Ljava/lang/Object;
.source "ShadowDocument.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/elements/DocumentView;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/elements/ShadowDocument;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Update"
.end annotation


# instance fields
.field private final mElementToInfoChangesMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Lcom/facebook/stetho/inspector/elements/ElementInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mRootElementChangesSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;


# direct methods
.method public constructor <init>(Lcom/facebook/stetho/inspector/elements/ShadowDocument;Ljava/util/Map;Ljava/util/Set;)V
    .locals 0
    .param p1, "this$0"    # Lcom/facebook/stetho/inspector/elements/ShadowDocument;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Lcom/facebook/stetho/inspector/elements/ElementInfo;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 266
    .local p2, "elementToInfoChangesMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/ElementInfo;>;"
    .local p3, "rootElementChangesSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Object;>;"
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 267
    iput-object p2, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->mElementToInfoChangesMap:Ljava/util/Map;

    .line 268
    iput-object p3, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->mRootElementChangesSet:Ljava/util/Set;

    .line 269
    return-void
.end method

.method private removeGarbageSubTree(Ljava/util/Map;Ljava/lang/Object;)V
    .locals 4
    .param p2, "element"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Lcom/facebook/stetho/inspector/elements/ElementInfo;",
            ">;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .line 370
    .local p1, "elementToInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/ElementInfo;>;"
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 376
    .local v0, "elementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    iget-object v1, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-eqz v1, :cond_0

    iget-object v1, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    .line 377
    invoke-interface {p1, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 378
    return-void

    .line 381
    :cond_0
    invoke-interface {p1, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 383
    const/4 v1, 0x0

    .local v1, "i":I
    iget-object v2, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    .local v2, "N":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 384
    iget-object v3, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-direct {p0, p1, v3}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->removeGarbageSubTree(Ljava/util/Map;Ljava/lang/Object;)V

    .line 383
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 386
    .end local v1    # "i":I
    .end local v2    # "N":I
    :cond_1
    return-void
.end method

.method private validateTree(Ljava/util/Map;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Lcom/facebook/stetho/inspector/elements/ElementInfo;",
            ">;)V"
        }
    .end annotation

    .line 393
    .local p1, "elementToInfoMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/ElementInfo;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 395
    .local v0, "rootElements":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Object;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 396
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/ElementInfo;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    .line 397
    .local v3, "element":Ljava/lang/Object;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 399
    .local v4, "elementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    iget-object v5, v4, Lcom/facebook/stetho/inspector/elements/ElementInfo;->element:Ljava/lang/Object;

    if-ne v3, v5, :cond_7

    .line 405
    const/4 v5, 0x0

    .local v5, "i":I
    iget-object v6, v4, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    .local v6, "N":I
    :goto_1
    if-ge v5, v6, :cond_2

    .line 406
    iget-object v7, v4, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    .line 407
    .local v7, "childElement":Ljava/lang/Object;
    invoke-interface {p1, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 409
    .local v8, "childElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    if-eqz v8, :cond_1

    .line 415
    iget-object v9, v8, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-ne v9, v3, :cond_0

    .line 405
    .end local v7    # "childElement":Ljava/lang/Object;
    .end local v8    # "childElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 416
    .restart local v7    # "childElement":Ljava/lang/Object;
    .restart local v8    # "childElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v9, "childElementInfo.parentElement != element"

    invoke-direct {v1, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 410
    :cond_1
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 412
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    filled-new-array {v9}, [Ljava/lang/Object;

    move-result-object v9

    .line 410
    const-string v10, "elementInfo.get(elementInfo.children.get(%s)) == null"

    invoke-static {v10, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v1, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 421
    .end local v5    # "i":I
    .end local v6    # "N":I
    .end local v7    # "childElement":Ljava/lang/Object;
    .end local v8    # "childElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    :cond_2
    iget-object v5, v4, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-nez v5, :cond_3

    .line 422
    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 424
    :cond_3
    iget-object v5, v4, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    invoke-interface {p1, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 425
    .local v5, "parentElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    if-eqz v5, :cond_6

    .line 430
    iget-object v6, v4, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    iget-object v7, v5, Lcom/facebook/stetho/inspector/elements/ElementInfo;->element:Ljava/lang/Object;

    if-ne v6, v7, :cond_5

    .line 436
    iget-object v6, v5, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v6, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 441
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/ElementInfo;>;"
    .end local v3    # "element":Ljava/lang/Object;
    .end local v4    # "elementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    .end local v5    # "parentElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    :goto_2
    goto :goto_0

    .line 437
    .restart local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/ElementInfo;>;"
    .restart local v3    # "element":Ljava/lang/Object;
    .restart local v4    # "elementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    .restart local v5    # "parentElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    :cond_4
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v6, "parentElementInfo.children.contains(element) == FALSE"

    invoke-direct {v1, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 432
    :cond_5
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v6, "elementInfo.parentElementInfo != parentElementInfo.parent"

    invoke-direct {v1, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 426
    :cond_6
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v6, "elementToInfoMap.get(elementInfo.parentElementInfo) == NULL"

    invoke-direct {v1, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 401
    .end local v5    # "parentElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    :cond_7
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v5, "element != elementInfo.element"

    invoke-direct {v1, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 443
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/ElementInfo;>;"
    .end local v3    # "element":Ljava/lang/Object;
    .end local v4    # "elementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    :cond_8
    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_9

    .line 447
    return-void

    .line 444
    :cond_9
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "elementToInfoMap is a forest, not a tree. rootElements.size() != 1"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public abandon()V
    .locals 2

    .line 340
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-static {v0}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->access$200(Lcom/facebook/stetho/inspector/elements/ShadowDocument;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 344
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->access$202(Lcom/facebook/stetho/inspector/elements/ShadowDocument;Z)Z

    .line 345
    return-void

    .line 341
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public commit()V
    .locals 3

    .line 348
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-static {v0}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->access$200(Lcom/facebook/stetho/inspector/elements/ShadowDocument;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 353
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-static {v0}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->access$000(Lcom/facebook/stetho/inspector/elements/ShadowDocument;)Ljava/util/IdentityHashMap;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->mElementToInfoChangesMap:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/util/IdentityHashMap;->putAll(Ljava/util/Map;)V

    .line 357
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->mRootElementChangesSet:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 358
    .local v1, "element":Ljava/lang/Object;
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-static {v2}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->access$000(Lcom/facebook/stetho/inspector/elements/ShadowDocument;)Ljava/util/IdentityHashMap;

    move-result-object v2

    invoke-direct {p0, v2, v1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->removeGarbageSubTree(Ljava/util/Map;Ljava/lang/Object;)V

    .line 359
    .end local v1    # "element":Ljava/lang/Object;
    goto :goto_0

    .line 361
    :cond_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->access$202(Lcom/facebook/stetho/inspector/elements/ShadowDocument;Z)Z

    .line 365
    return-void

    .line 349
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public getChangedElements(Lcom/facebook/stetho/common/Accumulator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/stetho/common/Accumulator<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 294
    .local p1, "accumulator":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->mElementToInfoChangesMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .line 295
    .local v1, "element":Ljava/lang/Object;
    invoke-interface {p1, v1}, Lcom/facebook/stetho/common/Accumulator;->store(Ljava/lang/Object;)V

    .line 296
    .end local v1    # "element":Ljava/lang/Object;
    goto :goto_0

    .line 297
    :cond_0
    return-void
.end method

.method public getElementInfo(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/ElementInfo;
    .locals 2
    .param p1, "element"    # Ljava/lang/Object;

    .line 286
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->mElementToInfoChangesMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 287
    .local v0, "elementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    if-eqz v0, :cond_0

    .line 288
    return-object v0

    .line 290
    :cond_0
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-static {v1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->access$000(Lcom/facebook/stetho/inspector/elements/ShadowDocument;)Ljava/util/IdentityHashMap;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    return-object v1
.end method

.method public getGarbageElements(Lcom/facebook/stetho/common/Accumulator;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/stetho/common/Accumulator<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 304
    .local p1, "accumulator":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 308
    .local v0, "queue":Ljava/util/Queue;, "Ljava/util/Queue<Ljava/lang/Object;>;"
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->mRootElementChangesSet:Ljava/util/Set;

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 309
    .local v2, "element":Ljava/lang/Object;
    invoke-virtual {p0, v2}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->getElementInfo(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/ElementInfo;

    move-result-object v3

    .line 310
    .local v3, "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-static {v4}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->access$100(Lcom/facebook/stetho/inspector/elements/ShadowDocument;)Ljava/lang/Object;

    move-result-object v4

    if-eq v2, v4, :cond_0

    iget-object v4, v3, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-nez v4, :cond_0

    .line 311
    invoke-interface {v0, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 312
    invoke-interface {v0, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 314
    .end local v2    # "element":Ljava/lang/Object;
    .end local v3    # "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    :cond_0
    goto :goto_0

    .line 319
    :cond_1
    :goto_1
    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    .line 320
    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v1

    .line 321
    .local v1, "element":Ljava/lang/Object;
    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v2

    .line 322
    .local v2, "expectedParent0":Ljava/lang/Object;
    if-ne v1, v2, :cond_2

    const/4 v3, 0x0

    goto :goto_2

    :cond_2
    move-object v3, v2

    .line 323
    .local v3, "expectedParent":Ljava/lang/Object;
    :goto_2
    invoke-virtual {p0, v1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->getElementInfo(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/ElementInfo;

    move-result-object v4

    .line 325
    .local v4, "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    iget-object v5, v4, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-ne v5, v3, :cond_3

    .line 326
    invoke-interface {p1, v1}, Lcom/facebook/stetho/common/Accumulator;->store(Ljava/lang/Object;)V

    .line 328
    iget-object v5, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-virtual {v5, v1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->getElementInfo(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/ElementInfo;

    move-result-object v5

    .line 329
    .local v5, "oldElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    if-eqz v5, :cond_3

    .line 330
    const/4 v6, 0x0

    .local v6, "i":I
    iget-object v7, v5, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v7

    .local v7, "N":I
    :goto_3
    if-ge v6, v7, :cond_3

    .line 331
    iget-object v8, v5, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v8, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v0, v8}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 332
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 330
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 336
    .end local v1    # "element":Ljava/lang/Object;
    .end local v2    # "expectedParent0":Ljava/lang/Object;
    .end local v3    # "expectedParent":Ljava/lang/Object;
    .end local v4    # "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    .end local v5    # "oldElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    .end local v6    # "i":I
    .end local v7    # "N":I
    :cond_3
    goto :goto_1

    .line 337
    :cond_4
    return-void
.end method

.method public getRootElement()Ljava/lang/Object;
    .locals 1

    .line 280
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->getRootElement()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public isElementChanged(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;

    .line 276
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->mElementToInfoChangesMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 272
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;->mElementToInfoChangesMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method
