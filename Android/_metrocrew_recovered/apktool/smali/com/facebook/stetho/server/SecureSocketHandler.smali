.class public abstract Lcom/facebook/stetho/server/SecureSocketHandler;
.super Ljava/lang/Object;
.source "SecureSocketHandler.java"

# interfaces
.implements Lcom/facebook/stetho/server/SocketHandler;


# instance fields
.field private final mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/facebook/stetho/server/SecureSocketHandler;->mContext:Landroid/content/Context;

    .line 25
    return-void
.end method

.method private static enforcePermission(Landroid/content/Context;Landroid/net/LocalSocket;)V
    .locals 8
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "peer"    # Landroid/net/LocalSocket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/facebook/stetho/server/PeerAuthorizationException;
        }
    .end annotation

    .line 41
    invoke-virtual {p1}, Landroid/net/LocalSocket;->getPeerCredentials()Landroid/net/Credentials;

    move-result-object v0

    .line 43
    .local v0, "credentials":Landroid/net/Credentials;
    invoke-virtual {v0}, Landroid/net/Credentials;->getUid()I

    move-result v1

    .line 44
    .local v1, "uid":I
    invoke-virtual {v0}, Landroid/net/Credentials;->getPid()I

    move-result v2

    .line 46
    .local v2, "pid":I
    const/4 v3, 0x2

    invoke-static {v3}, Lcom/facebook/stetho/common/LogUtil;->isLoggable(I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 47
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v3, v4}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "Got request from uid=%d, pid=%d"

    invoke-static {v4, v3}, Lcom/facebook/stetho/common/LogUtil;->v(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 50
    :cond_0
    const-string v3, "android.permission.DUMP"

    .line 51
    .local v3, "requiredPermission":Ljava/lang/String;
    invoke-virtual {p0, v3, v2, v1}, Landroid/content/Context;->checkPermission(Ljava/lang/String;II)I

    move-result v4

    .line 52
    .local v4, "checkResult":I
    if-nez v4, :cond_1

    .line 56
    return-void

    .line 53
    :cond_1
    new-instance v5, Lcom/facebook/stetho/server/PeerAuthorizationException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Peer pid="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", uid="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " does not have "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/facebook/stetho/server/PeerAuthorizationException;-><init>(Ljava/lang/String;)V

    throw v5
.end method


# virtual methods
.method public final onAccepted(Landroid/net/LocalSocket;)V
    .locals 3
    .param p1, "socket"    # Landroid/net/LocalSocket;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 30
    :try_start_0
    iget-object v0, p0, Lcom/facebook/stetho/server/SecureSocketHandler;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/facebook/stetho/server/SecureSocketHandler;->enforcePermission(Landroid/content/Context;Landroid/net/LocalSocket;)V

    .line 31
    invoke-virtual {p0, p1}, Lcom/facebook/stetho/server/SecureSocketHandler;->onSecured(Landroid/net/LocalSocket;)V
    :try_end_0
    .catch Lcom/facebook/stetho/server/PeerAuthorizationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    goto :goto_0

    .line 32
    :catch_0
    move-exception v0

    .line 33
    .local v0, "e":Lcom/facebook/stetho/server/PeerAuthorizationException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unauthorized request: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/facebook/stetho/server/PeerAuthorizationException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/facebook/stetho/common/LogUtil;->e(Ljava/lang/String;)V

    .line 35
    .end local v0    # "e":Lcom/facebook/stetho/server/PeerAuthorizationException;
    :goto_0
    return-void
.end method

.method protected abstract onSecured(Landroid/net/LocalSocket;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
