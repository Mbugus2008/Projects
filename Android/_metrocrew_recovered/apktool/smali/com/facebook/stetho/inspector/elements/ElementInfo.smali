.class public final Lcom/facebook/stetho/inspector/elements/ElementInfo;
.super Ljava/lang/Object;
.source "ElementInfo.java"


# instance fields
.field public final children:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public final element:Ljava/lang/Object;

.field public final parentElement:Ljava/lang/Object;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/List;)V
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "parentElement"    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 27
    .local p3, "children":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    invoke-static {p1}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->element:Ljava/lang/Object;

    .line 29
    iput-object p2, p0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    .line 30
    invoke-static {p3}, Lcom/facebook/stetho/common/ListUtil;->copyToImmutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    .line 31
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 35
    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    .line 36
    return v0

    .line 39
    :cond_0
    instance-of v1, p1, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    .line 40
    move-object v1, p1

    check-cast v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    .line 41
    .local v1, "other":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->element:Ljava/lang/Object;

    iget-object v4, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->element:Ljava/lang/Object;

    if-ne v3, v4, :cond_1

    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    iget-object v4, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->parentElement:Ljava/lang/Object;

    if-ne v3, v4, :cond_1

    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    iget-object v4, v1, Lcom/facebook/stetho/inspector/elements/ElementInfo;->children:Ljava/util/List;

    .line 43
    invoke-static {v3, v4}, Lcom/facebook/stetho/common/ListUtil;->identityEquals(Ljava/util/List;Ljava/util/List;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    move v0, v2

    .line 41
    :goto_0
    return v0

    .line 46
    .end local v1    # "other":Lcom/facebook/stetho/inspector/elements/ElementInfo;
    :cond_2
    return v2
.end method
