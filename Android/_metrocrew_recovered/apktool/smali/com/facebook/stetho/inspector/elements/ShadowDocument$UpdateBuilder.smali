.class public final Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;
.super Ljava/lang/Object;
.source "ShadowDocument.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/elements/ShadowDocument;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "UpdateBuilder"
.end annotation


# instance fields
.field private mCachedNotNewChildrenSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

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

.field private final mRootElementChanges:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;


# direct methods
.method public constructor <init>(Lcom/facebook/stetho/inspector/elements/ShadowDocument;)V
    .locals 1
    .param p1, "this$0"    # Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    .line 54
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mElementToInfoChangesMap:Ljava/util/Map;

    .line 97
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mRootElementChanges:Ljava/util/HashSet;

    return-void
.end method

.method private acquireNotNewChildrenHashSet()Ljava/util/HashSet;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashSet<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 244
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mCachedNotNewChildrenSet:Ljava/util/HashSet;

    .line 245
    .local v0, "notNewChildrenHashSet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Object;>;"
    if-nez v0, :cond_0

    .line 246
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    move-object v0, v1

    .line 248
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mCachedNotNewChildrenSet:Ljava/util/HashSet;

    .line 249
    return-object v0
.end method

.method private releaseNotNewChildrenHashSet(Ljava/util/HashSet;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 253
    .local p1, "notNewChildrenHashSet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Object;>;"
    invoke-virtual {p1}, Ljava/util/HashSet;->clear()V

    .line 254
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mCachedNotNewChildrenSet:Ljava/util/HashSet;

    if-nez v0, :cond_0

    .line 255
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mCachedNotNewChildrenSet:Ljava/util/HashSet;

    .line 257
    :cond_0
    return-void
.end method

.method private setElementParent(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 5
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "parentElement"    # Ljava/lang/Object;

    .line 197
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mElementToInfoChangesMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 198
    .local v0, "changesElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-ne p2, v1, :cond_0

    .line 200
    return-void

    .line 203
    :cond_0
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-static {v1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->access$000(Lcom/facebook/stetho/inspector/elements/ShadowDocument;)Ljava/util/IdentityHashMap;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 204
    .local v1, "oldElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    if-nez v0, :cond_1

    if-eqz v1, :cond_1

    iget-object v2, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-ne p2, v2, :cond_1

    .line 207
    return-void

    .line 210
    :cond_1
    if-eqz v0, :cond_3

    if-eqz v1, :cond_3

    iget-object v2, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-ne p2, v2, :cond_3

    iget-object v2, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    iget-object v3, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    .line 213
    invoke-static {v2, v3}, Lcom/facebook/stetho/common/ListUtil;->identityEquals(Ljava/util/List;Ljava/util/List;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 214
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mElementToInfoChangesMap:Ljava/util/Map;

    invoke-interface {v2, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    if-nez p2, :cond_2

    .line 217
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mRootElementChanges:Ljava/util/HashSet;

    invoke-virtual {v2, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 220
    :cond_2
    return-void

    .line 223
    :cond_3
    if-eqz v0, :cond_4

    iget-object v2, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    goto :goto_0

    :cond_4
    if-eqz v1, :cond_5

    iget-object v2, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    goto :goto_0

    .line 227
    :cond_5
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    :goto_0
    nop

    .line 229
    .local v2, "children":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    new-instance v3, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    invoke-direct {v3, p1, p2, v2}, Lcom/facebook/stetho/inspector/elements/ElementInfo;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/List;)V

    .line 230
    .local v3, "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mElementToInfoChangesMap:Ljava/util/Map;

    invoke-interface {v4, p1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 232
    if-nez p2, :cond_6

    .line 233
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mRootElementChanges:Ljava/util/HashSet;

    invoke-virtual {v4, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 235
    :cond_6
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mRootElementChanges:Ljava/util/HashSet;

    invoke-virtual {v4, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 237
    :goto_1
    return-void
.end method


# virtual methods
.method public build()Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;
    .locals 4

    .line 240
    new-instance v0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;

    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mElementToInfoChangesMap:Ljava/util/Map;

    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mRootElementChanges:Ljava/util/HashSet;

    invoke-direct {v0, v1, v2, v3}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;-><init>(Lcom/facebook/stetho/inspector/elements/ShadowDocument;Ljava/util/Map;Ljava/util/Set;)V

    return-object v0
.end method

.method public setElementChildren(Ljava/lang/Object;Ljava/util/List;)V
    .locals 10
    .param p1, "element"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 106
    .local p2, "children":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mElementToInfoChangesMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 107
    .local v0, "changesElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    .line 108
    invoke-static {p2, v1}, Lcom/facebook/stetho/common/ListUtil;->identityEquals(Ljava/util/List;Ljava/util/List;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 109
    return-void

    .line 112
    :cond_0
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-static {v1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->access$000(Lcom/facebook/stetho/inspector/elements/ShadowDocument;)Ljava/util/IdentityHashMap;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 113
    .local v1, "oldElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    if-nez v0, :cond_1

    if-eqz v1, :cond_1

    iget-object v2, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    .line 115
    invoke-static {p2, v2}, Lcom/facebook/stetho/common/ListUtil;->identityEquals(Ljava/util/List;Ljava/util/List;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 116
    return-void

    .line 120
    :cond_1
    const/4 v2, 0x0

    if-eqz v0, :cond_2

    if-eqz v1, :cond_2

    iget-object v3, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    iget-object v4, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-ne v3, v4, :cond_2

    iget-object v3, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    .line 123
    invoke-static {p2, v3}, Lcom/facebook/stetho/common/ListUtil;->identityEquals(Ljava/util/List;Ljava/util/List;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 127
    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-static {v3}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->access$000(Lcom/facebook/stetho/inspector/elements/ShadowDocument;)Ljava/util/IdentityHashMap;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 128
    .local v3, "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mElementToInfoChangesMap:Ljava/util/Map;

    invoke-interface {v4, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 130
    .end local v3    # "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    :cond_2
    if-eqz v0, :cond_3

    iget-object v3, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    goto :goto_0

    :cond_3
    if-eqz v1, :cond_4

    iget-object v3, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    goto :goto_0

    :cond_4
    move-object v3, v2

    .line 136
    .local v3, "parentElement":Ljava/lang/Object;
    :goto_0
    new-instance v4, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    invoke-direct {v4, p1, v3, p2}, Lcom/facebook/stetho/inspector/elements/ElementInfo;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/List;)V

    .line 138
    .local v4, "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    iget-object v5, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mElementToInfoChangesMap:Ljava/util/Map;

    invoke-interface {v5, p1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v3, v4

    .line 154
    .end local v4    # "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    .local v3, "newElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    :goto_1
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->acquireNotNewChildrenHashSet()Ljava/util/HashSet;

    move-result-object v4

    .line 156
    .local v4, "notNewChildrenSet":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/Object;>;"
    if-eqz v1, :cond_5

    iget-object v5, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    iget-object v6, v3, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    if-eq v5, v6, :cond_5

    .line 158
    const/4 v5, 0x0

    .local v5, "i":I
    iget-object v6, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    .local v6, "N":I
    :goto_2
    if-ge v5, v6, :cond_5

    .line 159
    iget-object v7, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    .line 160
    .local v7, "childElement":Ljava/lang/Object;
    invoke-virtual {v4, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 158
    .end local v7    # "childElement":Ljava/lang/Object;
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 164
    .end local v5    # "i":I
    .end local v6    # "N":I
    :cond_5
    if-eqz v0, :cond_6

    iget-object v5, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    iget-object v6, v3, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    if-eq v5, v6, :cond_6

    .line 166
    const/4 v5, 0x0

    .restart local v5    # "i":I
    iget-object v6, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    .restart local v6    # "N":I
    :goto_3
    if-ge v5, v6, :cond_6

    .line 167
    iget-object v7, v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    .line 168
    .restart local v7    # "childElement":Ljava/lang/Object;
    invoke-virtual {v4, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 166
    .end local v7    # "childElement":Ljava/lang/Object;
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 172
    .end local v5    # "i":I
    .end local v6    # "N":I
    :cond_6
    const/4 v5, 0x0

    .restart local v5    # "i":I
    iget-object v6, v3, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v6

    .restart local v6    # "N":I
    :goto_4
    if-ge v5, v6, :cond_7

    .line 173
    iget-object v7, v3, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    invoke-interface {v7, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    .line 174
    .restart local v7    # "childElement":Ljava/lang/Object;
    invoke-direct {p0, v7, p1}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->setElementParent(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 175
    invoke-virtual {v4, v7}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 172
    .end local v7    # "childElement":Ljava/lang/Object;
    add-int/lit8 v5, v5, 0x1

    goto :goto_4

    .line 178
    .end local v5    # "i":I
    .end local v6    # "N":I
    :cond_7
    invoke-virtual {v4}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_5
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_a

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .line 179
    .local v6, "childElement":Ljava/lang/Object;
    iget-object v7, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->mElementToInfoChangesMap:Ljava/util/Map;

    invoke-interface {v7, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 180
    .local v7, "childChangesElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    if-eqz v7, :cond_8

    iget-object v8, v7, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-eq v8, p1, :cond_8

    .line 183
    goto :goto_5

    .line 186
    :cond_8
    iget-object v8, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->this$0:Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    invoke-static {v8}, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->access$000(Lcom/facebook/stetho/inspector/elements/ShadowDocument;)Ljava/util/IdentityHashMap;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 187
    .local v8, "oldChangesElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    if-eqz v8, :cond_9

    iget-object v9, v8, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-ne v9, p1, :cond_9

    .line 189
    invoke-direct {p0, v6, v2}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->setElementParent(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 191
    .end local v6    # "childElement":Ljava/lang/Object;
    .end local v7    # "childChangesElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    .end local v8    # "oldChangesElementInfo":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    :cond_9
    goto :goto_5

    .line 193
    :cond_a
    invoke-direct {p0, v4}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;->releaseNotNewChildrenHashSet(Ljava/util/HashSet;)V

    .line 194
    return-void
.end method
