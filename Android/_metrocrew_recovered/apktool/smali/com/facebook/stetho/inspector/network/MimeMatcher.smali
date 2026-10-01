.class public Lcom/facebook/stetho/inspector/network/MimeMatcher;
.super Ljava/lang/Object;
.source "MimeMatcher.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/network/MimeMatcher$MimeMatcherRule;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final mRuleMap:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/facebook/stetho/inspector/network/MimeMatcher<",
            "TT;>.MimeMatcherRule;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 16
    .local p0, "this":Lcom/facebook/stetho/inspector/network/MimeMatcher;, "Lcom/facebook/stetho/inspector/network/MimeMatcher<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/network/MimeMatcher;->mRuleMap:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public addRule(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2
    .param p1, "ruleExpression"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    .line 27
    .local p0, "this":Lcom/facebook/stetho/inspector/network/MimeMatcher;, "Lcom/facebook/stetho/inspector/network/MimeMatcher<TT;>;"
    .local p2, "resultIfMatched":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/MimeMatcher;->mRuleMap:Ljava/util/ArrayList;

    new-instance v1, Lcom/facebook/stetho/inspector/network/MimeMatcher$MimeMatcherRule;

    invoke-direct {v1, p0, p1, p2}, Lcom/facebook/stetho/inspector/network/MimeMatcher$MimeMatcherRule;-><init>(Lcom/facebook/stetho/inspector/network/MimeMatcher;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    return-void
.end method

.method public clear()V
    .locals 1

    .line 31
    .local p0, "this":Lcom/facebook/stetho/inspector/network/MimeMatcher;, "Lcom/facebook/stetho/inspector/network/MimeMatcher<TT;>;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/MimeMatcher;->mRuleMap:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 32
    return-void
.end method

.method public match(Ljava/lang/String;)Ljava/lang/Object;
    .locals 4
    .param p1, "mimeT"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 36
    .local p0, "this":Lcom/facebook/stetho/inspector/network/MimeMatcher;, "Lcom/facebook/stetho/inspector/network/MimeMatcher<TT;>;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/MimeMatcher;->mRuleMap:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 37
    .local v0, "ruleMapN":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 38
    iget-object v2, p0, Lcom/facebook/stetho/inspector/network/MimeMatcher;->mRuleMap:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/stetho/inspector/network/MimeMatcher$MimeMatcherRule;

    .line 39
    .local v2, "rule":Lcom/facebook/stetho/inspector/network/MimeMatcher$MimeMatcherRule;, "Lcom/facebook/stetho/inspector/network/MimeMatcher<TT;>.MimeMatcherRule;"
    invoke-virtual {v2, p1}, Lcom/facebook/stetho/inspector/network/MimeMatcher$MimeMatcherRule;->match(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 40
    invoke-virtual {v2}, Lcom/facebook/stetho/inspector/network/MimeMatcher$MimeMatcherRule;->getResultIfMatched()Ljava/lang/Object;

    move-result-object v3

    return-object v3

    .line 37
    .end local v2    # "rule":Lcom/facebook/stetho/inspector/network/MimeMatcher$MimeMatcherRule;, "Lcom/facebook/stetho/inspector/network/MimeMatcher<TT;>.MimeMatcherRule;"
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 43
    .end local v1    # "i":I
    :cond_1
    const/4 v1, 0x0

    return-object v1
.end method
