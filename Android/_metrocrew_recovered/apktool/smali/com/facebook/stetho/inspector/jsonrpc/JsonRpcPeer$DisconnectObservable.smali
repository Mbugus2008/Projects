.class Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer$DisconnectObservable;
.super Landroid/database/Observable;
.source "JsonRpcPeer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DisconnectObservable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/database/Observable<",
        "Lcom/facebook/stetho/inspector/jsonrpc/DisconnectReceiver;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 88
    invoke-direct {p0}, Landroid/database/Observable;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer$1;

    .line 88
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer$DisconnectObservable;-><init>()V

    return-void
.end method


# virtual methods
.method public onDisconnect()V
    .locals 3

    .line 90
    const/4 v0, 0x0

    .local v0, "i":I
    iget-object v1, p0, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer$DisconnectObservable;->mObservers:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    .local v1, "N":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 91
    iget-object v2, p0, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer$DisconnectObservable;->mObservers:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/stetho/inspector/jsonrpc/DisconnectReceiver;

    .line 92
    .local v2, "observer":Lcom/facebook/stetho/inspector/jsonrpc/DisconnectReceiver;
    invoke-interface {v2}, Lcom/facebook/stetho/inspector/jsonrpc/DisconnectReceiver;->onDisconnect()V

    .line 90
    .end local v2    # "observer":Lcom/facebook/stetho/inspector/jsonrpc/DisconnectReceiver;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 94
    .end local v0    # "i":I
    .end local v1    # "N":I
    :cond_0
    return-void
.end method
