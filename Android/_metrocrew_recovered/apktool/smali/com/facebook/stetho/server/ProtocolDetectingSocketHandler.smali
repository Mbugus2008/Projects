.class public Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler;
.super Lcom/facebook/stetho/server/SecureSocketHandler;
.source "ProtocolDetectingSocketHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$HandlerInfo;,
        Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$AlwaysMatchMatcher;,
        Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$ExactMagicMatcher;,
        Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$MagicMatcher;
    }
.end annotation


# static fields
.field private static final SENSING_BUFFER_SIZE:I = 0x100


# instance fields
.field private final mHandlers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$HandlerInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 37
    invoke-direct {p0, p1}, Lcom/facebook/stetho/server/SecureSocketHandler;-><init>(Landroid/content/Context;)V

    .line 34
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler;->mHandlers:Ljava/util/ArrayList;

    .line 38
    return-void
.end method


# virtual methods
.method public addHandler(Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$MagicMatcher;Lcom/facebook/stetho/server/SocketLikeHandler;)V
    .locals 3
    .param p1, "magicMatcher"    # Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$MagicMatcher;
    .param p2, "handler"    # Lcom/facebook/stetho/server/SocketLikeHandler;

    .line 41
    iget-object v0, p0, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler;->mHandlers:Ljava/util/ArrayList;

    new-instance v1, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$HandlerInfo;

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v2}, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$HandlerInfo;-><init>(Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$MagicMatcher;Lcom/facebook/stetho/server/SocketLikeHandler;Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$1;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 42
    return-void
.end method

.method protected onSecured(Landroid/net/LocalSocket;)V
    .locals 7
    .param p1, "socket"    # Landroid/net/LocalSocket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    new-instance v0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;

    .line 47
    invoke-virtual {p1}, Landroid/net/LocalSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    const/16 v2, 0x100

    invoke-direct {v0, v1, v2}, Lcom/facebook/stetho/server/LeakyBufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 50
    .local v0, "leakyIn":Lcom/facebook/stetho/server/LeakyBufferedInputStream;
    iget-object v1, p0, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler;->mHandlers:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 54
    const/4 v1, 0x0

    .local v1, "i":I
    iget-object v3, p0, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler;->mHandlers:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    .local v3, "N":I
    :goto_0
    if-ge v1, v3, :cond_1

    .line 55
    iget-object v4, p0, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler;->mHandlers:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$HandlerInfo;

    .line 56
    .local v4, "handlerInfo":Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$HandlerInfo;
    invoke-virtual {v0, v2}, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->mark(I)V

    .line 57
    iget-object v5, v4, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$HandlerInfo;->magicMatcher:Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$MagicMatcher;

    invoke-interface {v5, v0}, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$MagicMatcher;->matches(Ljava/io/InputStream;)Z

    move-result v5

    .line 58
    .local v5, "matches":Z
    invoke-virtual {v0}, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->reset()V

    .line 59
    if-eqz v5, :cond_0

    .line 60
    new-instance v2, Lcom/facebook/stetho/server/SocketLike;

    invoke-direct {v2, p1, v0}, Lcom/facebook/stetho/server/SocketLike;-><init>(Landroid/net/LocalSocket;Lcom/facebook/stetho/server/LeakyBufferedInputStream;)V

    .line 61
    .local v2, "socketLike":Lcom/facebook/stetho/server/SocketLike;
    iget-object v6, v4, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$HandlerInfo;->handler:Lcom/facebook/stetho/server/SocketLikeHandler;

    invoke-interface {v6, v2}, Lcom/facebook/stetho/server/SocketLikeHandler;->onAccepted(Lcom/facebook/stetho/server/SocketLike;)V

    .line 62
    return-void

    .line 54
    .end local v2    # "socketLike":Lcom/facebook/stetho/server/SocketLike;
    .end local v4    # "handlerInfo":Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$HandlerInfo;
    .end local v5    # "matches":Z
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 66
    .end local v1    # "i":I
    .end local v3    # "N":I
    :cond_1
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No matching handler, firstByte="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->read()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 51
    :cond_2
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "No handlers added"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method
