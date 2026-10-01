.class public abstract Lcom/facebook/stetho/inspector/elements/Descriptor;
.super Ljava/lang/Object;
.source "Descriptor.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/elements/NodeDescriptor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/elements/Descriptor$Host;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/facebook/stetho/inspector/elements/NodeDescriptor<",
        "TE;>;"
    }
.end annotation


# instance fields
.field private mHost:Lcom/facebook/stetho/inspector/elements/Descriptor$Host;


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 21
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/Descriptor;, "Lcom/facebook/stetho/inspector/elements/Descriptor<TE;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    return-void
.end method

.method protected static parseSetAttributesAsTextArg(Ljava/lang/String;)Ljava/util/Map;
    .locals 10
    .param p0, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 75
    const-string v0, ""

    .line 76
    .local v0, "value":Ljava/lang/String;
    const-string v1, ""

    .line 77
    .local v1, "key":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .local v2, "buffer":Ljava/lang/StringBuilder;
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 79
    .local v3, "keyValuePairs":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 80
    .local v4, "isInsideQuotes":Z
    const/4 v5, 0x0

    .local v5, "i":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v6

    .local v6, "N":I
    :goto_0
    if-ge v5, v6, :cond_5

    .line 81
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v7

    .line 82
    .local v7, "c":C
    const/16 v8, 0x3d

    const/4 v9, 0x0

    if-ne v7, v8, :cond_0

    .line 83
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 84
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->setLength(I)V

    goto :goto_1

    .line 85
    :cond_0
    const/16 v8, 0x22

    if-ne v7, v8, :cond_3

    .line 86
    if-eqz v4, :cond_1

    .line 87
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 88
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 90
    :cond_1
    if-nez v4, :cond_2

    const/4 v9, 0x1

    :cond_2
    move v4, v9

    .end local v4    # "isInsideQuotes":Z
    .local v9, "isInsideQuotes":Z
    goto :goto_1

    .line 91
    .end local v9    # "isInsideQuotes":Z
    .restart local v4    # "isInsideQuotes":Z
    :cond_3
    const/16 v8, 0x20

    if-ne v7, v8, :cond_4

    if-nez v4, :cond_4

    .line 92
    invoke-interface {v3, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 94
    :cond_4
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 80
    .end local v7    # "c":C
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 97
    .end local v5    # "i":I
    .end local v6    # "N":I
    :cond_5
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_6

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_6

    .line 98
    invoke-interface {v3, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    :cond_6
    return-object v3
.end method


# virtual methods
.method public final checkThreadAccess()Z
    .locals 1

    .line 40
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/Descriptor;, "Lcom/facebook/stetho/inspector/elements/Descriptor<TE;>;"
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getHost()Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    move-result-object v0

    invoke-interface {v0}, Lcom/facebook/stetho/inspector/elements/Descriptor$Host;->checkThreadAccess()Z

    move-result v0

    return v0
.end method

.method protected final getHost()Lcom/facebook/stetho/inspector/elements/Descriptor$Host;
    .locals 1

    .line 35
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/Descriptor;, "Lcom/facebook/stetho/inspector/elements/Descriptor<TE;>;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Descriptor;->mHost:Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    return-object v0
.end method

.method final initialize(Lcom/facebook/stetho/inspector/elements/Descriptor$Host;)V
    .locals 1
    .param p1, "host"    # Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    .line 25
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/Descriptor;, "Lcom/facebook/stetho/inspector/elements/Descriptor<TE;>;"
    invoke-static {p1}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Descriptor;->mHost:Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    invoke-static {v0}, Lcom/facebook/stetho/common/Util;->throwIfNotNull(Ljava/lang/Object;)V

    .line 27
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Descriptor;->mHost:Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    .line 28
    return-void
.end method

.method final isInitialized()Z
    .locals 1

    .line 31
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/Descriptor;, "Lcom/facebook/stetho/inspector/elements/Descriptor<TE;>;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Descriptor;->mHost:Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final postAndWait(Lcom/facebook/stetho/common/UncheckedCallable;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/facebook/stetho/common/UncheckedCallable<",
            "TV;>;)TV;"
        }
    .end annotation

    .line 50
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/Descriptor;, "Lcom/facebook/stetho/inspector/elements/Descriptor<TE;>;"
    .local p1, "c":Lcom/facebook/stetho/common/UncheckedCallable;, "Lcom/facebook/stetho/common/UncheckedCallable<TV;>;"
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getHost()Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/facebook/stetho/inspector/elements/Descriptor$Host;->postAndWait(Lcom/facebook/stetho/common/UncheckedCallable;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final postAndWait(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;

    .line 55
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/Descriptor;, "Lcom/facebook/stetho/inspector/elements/Descriptor<TE;>;"
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getHost()Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/facebook/stetho/inspector/elements/Descriptor$Host;->postAndWait(Ljava/lang/Runnable;)V

    .line 56
    return-void
.end method

.method public final postDelayed(Ljava/lang/Runnable;J)V
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;
    .param p2, "delayMillis"    # J

    .line 60
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/Descriptor;, "Lcom/facebook/stetho/inspector/elements/Descriptor<TE;>;"
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getHost()Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3}, Lcom/facebook/stetho/inspector/elements/Descriptor$Host;->postDelayed(Ljava/lang/Runnable;J)V

    .line 61
    return-void
.end method

.method public final removeCallbacks(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "r"    # Ljava/lang/Runnable;

    .line 65
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/Descriptor;, "Lcom/facebook/stetho/inspector/elements/Descriptor<TE;>;"
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getHost()Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/facebook/stetho/inspector/elements/Descriptor$Host;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 66
    return-void
.end method

.method public final verifyThreadAccess()V
    .locals 1

    .line 45
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/Descriptor;, "Lcom/facebook/stetho/inspector/elements/Descriptor<TE;>;"
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getHost()Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    move-result-object v0

    invoke-interface {v0}, Lcom/facebook/stetho/inspector/elements/Descriptor$Host;->verifyThreadAccess()V

    .line 46
    return-void
.end method
