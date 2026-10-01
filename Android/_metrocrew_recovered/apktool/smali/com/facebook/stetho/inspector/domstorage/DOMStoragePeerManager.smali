.class public Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;
.super Lcom/facebook/stetho/inspector/helper/ChromePeerManager;
.source "DOMStoragePeerManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$DevToolsSharedPreferencesListener;
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mPeerListener:Lcom/facebook/stetho/inspector/helper/PeerRegistrationListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 30
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;-><init>()V

    .line 66
    new-instance v0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$1;

    invoke-direct {v0, p0}, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$1;-><init>(Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;)V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;->mPeerListener:Lcom/facebook/stetho/inspector/helper/PeerRegistrationListener;

    .line 31
    iput-object p1, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;->mContext:Landroid/content/Context;

    .line 32
    iget-object v0, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;->mPeerListener:Lcom/facebook/stetho/inspector/helper/PeerRegistrationListener;

    invoke-virtual {p0, v0}, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;->setListener(Lcom/facebook/stetho/inspector/helper/PeerRegistrationListener;)V

    .line 33
    return-void
.end method

.method static synthetic access$000(Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;

    .line 27
    iget-object v0, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Ljava/util/Map;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Ljava/util/Map;

    .line 27
    invoke-static {p0}, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;->prefsCopy(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method private static prefsCopy(Ljava/util/Map;)Ljava/util/Map;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 152
    .local p0, "src":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 153
    .local v0, "dst":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 154
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;*>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 155
    .local v3, "key":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    .line 156
    .local v4, "value":Ljava/lang/Object;
    instance-of v5, v4, Ljava/util/Set;

    if-eqz v5, :cond_0

    .line 157
    move-object v5, v4

    check-cast v5, Ljava/util/Set;

    invoke-static {v5}, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;->shallowCopy(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v5

    invoke-virtual {v0, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 159
    :cond_0
    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;*>;"
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/Object;
    :goto_1
    goto :goto_0

    .line 162
    :cond_1
    return-object v0
.end method

.method private static shallowCopy(Ljava/util/Set;)Ljava/util/Set;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Set<",
            "TT;>;)",
            "Ljava/util/Set<",
            "TT;>;"
        }
    .end annotation

    .line 166
    .local p0, "src":Ljava/util/Set;, "Ljava/util/Set<TT;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 167
    .local v0, "dst":Ljava/util/HashSet;, "Ljava/util/HashSet<TT;>;"
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 168
    .local v2, "item":Ljava/lang/Object;, "TT;"
    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 169
    .end local v2    # "item":Ljava/lang/Object;, "TT;"
    goto :goto_0

    .line 170
    :cond_0
    return-object v0
.end method


# virtual methods
.method public signalItemAdded(Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "storageId"    # Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .line 44
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemAddedParams;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemAddedParams;-><init>()V

    .line 46
    .local v0, "params":Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemAddedParams;
    iput-object p1, v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemAddedParams;->storageId:Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;

    .line 47
    iput-object p2, v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemAddedParams;->key:Ljava/lang/String;

    .line 48
    iput-object p3, v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemAddedParams;->newValue:Ljava/lang/String;

    .line 49
    const-string v1, "DOMStorage.domStorageItemAdded"

    invoke-virtual {p0, v1, v0}, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;->sendNotificationToPeers(Ljava/lang/String;Ljava/lang/Object;)V

    .line 50
    return-void
.end method

.method public signalItemRemoved(Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;Ljava/lang/String;)V
    .locals 2
    .param p1, "storageId"    # Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;
    .param p2, "key"    # Ljava/lang/String;

    .line 36
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemRemovedParams;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemRemovedParams;-><init>()V

    .line 38
    .local v0, "params":Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemRemovedParams;
    iput-object p1, v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemRemovedParams;->storageId:Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;

    .line 39
    iput-object p2, v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemRemovedParams;->key:Ljava/lang/String;

    .line 40
    const-string v1, "DOMStorage.domStorageItemRemoved"

    invoke-virtual {p0, v1, v0}, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;->sendNotificationToPeers(Ljava/lang/String;Ljava/lang/Object;)V

    .line 41
    return-void
.end method

.method public signalItemUpdated(Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "storageId"    # Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "oldValue"    # Ljava/lang/String;
    .param p4, "newValue"    # Ljava/lang/String;

    .line 57
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemUpdatedParams;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemUpdatedParams;-><init>()V

    .line 59
    .local v0, "params":Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemUpdatedParams;
    iput-object p1, v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemUpdatedParams;->storageId:Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;

    .line 60
    iput-object p2, v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemUpdatedParams;->key:Ljava/lang/String;

    .line 61
    iput-object p3, v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemUpdatedParams;->oldValue:Ljava/lang/String;

    .line 62
    iput-object p4, v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemUpdatedParams;->newValue:Ljava/lang/String;

    .line 63
    const-string v1, "DOMStorage.domStorageItemUpdated"

    invoke-virtual {p0, v1, v0}, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;->sendNotificationToPeers(Ljava/lang/String;Ljava/lang/Object;)V

    .line 64
    return-void
.end method
