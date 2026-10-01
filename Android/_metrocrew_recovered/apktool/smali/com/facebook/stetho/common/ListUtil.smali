.class public final Lcom/facebook/stetho/common/ListUtil;
.super Ljava/lang/Object;
.source "ListUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/common/ListUtil$FiveItemImmutableList;,
        Lcom/facebook/stetho/common/ListUtil$FourItemImmutableList;,
        Lcom/facebook/stetho/common/ListUtil$ThreeItemImmutableList;,
        Lcom/facebook/stetho/common/ListUtil$TwoItemImmutableList;,
        Lcom/facebook/stetho/common/ListUtil$OneItemImmutableList;,
        Lcom/facebook/stetho/common/ListUtil$ImmutableArrayList;,
        Lcom/facebook/stetho/common/ListUtil$ImmutableList;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    return-void
.end method

.method public static copyToImmutableList(Ljava/util/List;)Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 42
    .local p0, "list":Ljava/util/List;, "Ljava/util/List<TT;>;"
    instance-of v0, p0, Lcom/facebook/stetho/common/ListUtil$ImmutableList;

    if-eqz v0, :cond_0

    .line 43
    return-object p0

    .line 45
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    .line 46
    .local v0, "size":I
    const/4 v1, 0x3

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    packed-switch v0, :pswitch_data_0

    .line 61
    invoke-interface {p0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object v1

    .line 62
    .local v1, "array":[Ljava/lang/Object;
    new-instance v2, Lcom/facebook/stetho/common/ListUtil$ImmutableArrayList;

    invoke-direct {v2, v1}, Lcom/facebook/stetho/common/ListUtil$ImmutableArrayList;-><init>([Ljava/lang/Object;)V

    return-object v2

    .line 58
    .end local v1    # "array":[Ljava/lang/Object;
    :pswitch_0
    new-instance v5, Lcom/facebook/stetho/common/ListUtil$FiveItemImmutableList;

    .line 59
    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    const/4 v1, 0x4

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    invoke-direct/range {v5 .. v10}, Lcom/facebook/stetho/common/ListUtil$FiveItemImmutableList;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 58
    return-object v5

    .line 56
    :pswitch_1
    new-instance v5, Lcom/facebook/stetho/common/ListUtil$FourItemImmutableList;

    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v5, v4, v3, v2, v1}, Lcom/facebook/stetho/common/ListUtil$FourItemImmutableList;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v5

    .line 54
    :pswitch_2
    new-instance v1, Lcom/facebook/stetho/common/ListUtil$ThreeItemImmutableList;

    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v1, v4, v3, v2}, Lcom/facebook/stetho/common/ListUtil$ThreeItemImmutableList;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1

    .line 52
    :pswitch_3
    new-instance v1, Lcom/facebook/stetho/common/ListUtil$TwoItemImmutableList;

    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/facebook/stetho/common/ListUtil$TwoItemImmutableList;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1

    .line 50
    :pswitch_4
    new-instance v1, Lcom/facebook/stetho/common/ListUtil$OneItemImmutableList;

    invoke-interface {p0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/facebook/stetho/common/ListUtil$OneItemImmutableList;-><init>(Ljava/lang/Object;)V

    return-object v1

    .line 48
    :pswitch_5
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v1

    return-object v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static identityEquals(Ljava/util/List;Ljava/util/List;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List<",
            "+TT;>;",
            "Ljava/util/List<",
            "+TT;>;)Z"
        }
    .end annotation

    .line 23
    .local p0, "list1":Ljava/util/List;, "Ljava/util/List<+TT;>;"
    .local p1, "list2":Ljava/util/List;, "Ljava/util/List<+TT;>;"
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 24
    return v0

    .line 26
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    .line 27
    .local v1, "size":I
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x0

    if-eq v1, v2, :cond_1

    .line 28
    return v3

    .line 30
    :cond_1
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v1, :cond_3

    .line 31
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    if-eq v4, v5, :cond_2

    .line 32
    return v3

    .line 30
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 35
    .end local v2    # "i":I
    :cond_3
    return v0
.end method

.method public static newImmutableList(Ljava/lang/Object;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 67
    .local p0, "item":Ljava/lang/Object;, "TT;"
    new-instance v0, Lcom/facebook/stetho/common/ListUtil$OneItemImmutableList;

    invoke-direct {v0, p0}, Lcom/facebook/stetho/common/ListUtil$OneItemImmutableList;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method public static newImmutableList(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;TT;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 71
    .local p0, "itemOne":Ljava/lang/Object;, "TT;"
    .local p1, "itemTwo":Ljava/lang/Object;, "TT;"
    new-instance v0, Lcom/facebook/stetho/common/ListUtil$TwoItemImmutableList;

    invoke-direct {v0, p0, p1}, Lcom/facebook/stetho/common/ListUtil$TwoItemImmutableList;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method
