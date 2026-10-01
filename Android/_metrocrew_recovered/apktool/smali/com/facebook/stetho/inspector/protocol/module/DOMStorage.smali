.class public Lcom/facebook/stetho/inspector/protocol/module/DOMStorage;
.super Ljava/lang/Object;
.source "DOMStorage.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DOMStorageAssignmentException;,
        Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemUpdatedParams;,
        Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemAddedParams;,
        Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemRemovedParams;,
        Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DomStorageItemsClearedParams;,
        Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$GetDOMStorageItemsResult;,
        Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mDOMStoragePeerManager:Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;

.field private final mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Lcom/facebook/stetho/json/ObjectMapper;

    invoke-direct {v0}, Lcom/facebook/stetho/json/ObjectMapper;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    .line 39
    iput-object p1, p0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage;->mContext:Landroid/content/Context;

    .line 40
    new-instance v0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;

    invoke-direct {v0, p1}, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage;->mDOMStoragePeerManager:Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;

    .line 41
    return-void
.end method

.method private static assignByType(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 3
    .param p0, "editor"    # Landroid/content/SharedPreferences$Editor;
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 152
    instance-of v0, p2, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 153
    move-object v0, p2

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 154
    :cond_0
    instance-of v0, p2, Ljava/lang/Long;

    if-eqz v0, :cond_1

    .line 155
    move-object v0, p2

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-interface {p0, p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 156
    :cond_1
    instance-of v0, p2, Ljava/lang/Float;

    if-eqz v0, :cond_2

    .line 157
    move-object v0, p2

    check-cast v0, Ljava/lang/Float;

    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 158
    :cond_2
    instance-of v0, p2, Ljava/lang/Boolean;

    if-eqz v0, :cond_3

    .line 159
    move-object v0, p2

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 160
    :cond_3
    instance-of v0, p2, Ljava/lang/String;

    if-eqz v0, :cond_4

    .line 161
    move-object v0, p2

    check-cast v0, Ljava/lang/String;

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 162
    :cond_4
    instance-of v0, p2, Ljava/util/Set;

    if-eqz v0, :cond_5

    .line 163
    move-object v0, p2

    check-cast v0, Ljava/util/Set;

    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    .line 167
    :goto_0
    return-void

    .line 165
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported type="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public disable(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 50
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage;->mDOMStoragePeerManager:Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;->removePeer(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;)V

    .line 51
    return-void
.end method

.method public enable(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 45
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage;->mDOMStoragePeerManager:Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;->addPeer(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;)Z

    .line 46
    return-void
.end method

.method public getDOMStorageItems(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcResult;
    .locals 8
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 56
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    .line 57
    const-string/jumbo v1, "storageId"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-class v2, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;

    .line 56
    invoke-virtual {v0, v1, v2}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;

    .line 60
    .local v0, "storage":Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .local v1, "entries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/util/List<Ljava/lang/String;>;>;"
    iget-object v2, v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;->securityOrigin:Ljava/lang/String;

    .line 62
    .local v2, "prefTag":Ljava/lang/String;
    iget-boolean v3, v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;->isLocalStorage:Z

    if-eqz v3, :cond_0

    .line 63
    iget-object v3, p0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage;->mContext:Landroid/content/Context;

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 64
    .local v3, "prefs":Landroid/content/SharedPreferences;
    invoke-static {v3}, Lcom/facebook/stetho/inspector/domstorage/SharedPreferencesHelper;->getSharedPreferenceEntriesSorted(Landroid/content/SharedPreferences;)Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    .line 65
    .local v5, "prefsEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;*>;"
    new-instance v6, Ljava/util/ArrayList;

    const/4 v7, 0x2

    invoke-direct {v6, v7}, Ljava/util/ArrayList;-><init>(I)V

    .line 66
    .local v6, "entry":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 67
    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7}, Lcom/facebook/stetho/inspector/domstorage/SharedPreferencesHelper;->valueToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 68
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    .end local v5    # "prefsEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;*>;"
    .end local v6    # "entry":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    goto :goto_0

    .line 72
    .end local v3    # "prefs":Landroid/content/SharedPreferences;
    :cond_0
    new-instance v3, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$GetDOMStorageItemsResult;

    const/4 v4, 0x0

    invoke-direct {v3, v4}, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$GetDOMStorageItemsResult;-><init>(Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$1;)V

    .line 73
    .local v3, "result":Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$GetDOMStorageItemsResult;
    iput-object v1, v3, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$GetDOMStorageItemsResult;->entries:Ljava/util/List;

    .line 74
    return-object v3
.end method

.method public removeDOMStorageItem(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .locals 5
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 134
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    .line 135
    const-string/jumbo v1, "storageId"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-class v2, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;

    .line 134
    invoke-virtual {v0, v1, v2}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;

    .line 137
    .local v0, "storage":Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;
    const-string v1, "key"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 139
    .local v1, "key":Ljava/lang/String;
    iget-boolean v2, v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;->isLocalStorage:Z

    if-eqz v2, :cond_0

    .line 140
    iget-object v2, p0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage;->mContext:Landroid/content/Context;

    iget-object v3, v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;->securityOrigin:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 143
    .local v2, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 145
    .end local v2    # "prefs":Landroid/content/SharedPreferences;
    :cond_0
    return-void
.end method

.method public setDOMStorageItem(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .locals 11
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;
        }
    .end annotation

    .line 80
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    .line 81
    const-string/jumbo v1, "storageId"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-class v2, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;

    .line 80
    invoke-virtual {v0, v1, v2}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;

    .line 83
    .local v0, "storage":Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;
    const-string v1, "key"

    invoke-virtual {p2, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 84
    .local v1, "key":Ljava/lang/String;
    const-string/jumbo v2, "value"

    invoke-virtual {p2, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 86
    .local v2, "value":Ljava/lang/String;
    iget-boolean v3, v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;->isLocalStorage:Z

    if-eqz v3, :cond_2

    .line 87
    iget-object v3, p0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage;->mContext:Landroid/content/Context;

    iget-object v4, v0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;->securityOrigin:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    .line 90
    .local v3, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v3}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 92
    .local v4, "existingValue":Ljava/lang/Object;
    if-eqz v4, :cond_0

    .line 96
    :try_start_0
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5
    :try_end_0
    .catch Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DOMStorageAssignmentException; {:try_start_0 .. :try_end_0} :catch_1

    .line 98
    .local v5, "editor":Landroid/content/SharedPreferences$Editor;
    :try_start_1
    invoke-static {v2, v4}, Lcom/facebook/stetho/inspector/domstorage/SharedPreferencesHelper;->valueFromString(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v5, v1, v6}, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage;->assignByType(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;Ljava/lang/Object;)V

    .line 99
    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DOMStorageAssignmentException; {:try_start_1 .. :try_end_1} :catch_1

    .line 107
    nop

    .line 128
    .end local v5    # "editor":Landroid/content/SharedPreferences$Editor;
    goto :goto_1

    .line 100
    .restart local v5    # "editor":Landroid/content/SharedPreferences$Editor;
    :catch_0
    move-exception v6

    .line 101
    .local v6, "e":Ljava/lang/IllegalArgumentException;
    :try_start_2
    new-instance v7, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DOMStorageAssignmentException;

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "Type mismatch setting %s to %s (expected %s)"

    .line 106
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v10

    filled-new-array {v1, v2, v10}, [Ljava/lang/Object;

    move-result-object v10

    .line 102
    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DOMStorageAssignmentException;-><init>(Ljava/lang/String;)V

    .end local v0    # "storage":Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/String;
    .end local v3    # "prefs":Landroid/content/SharedPreferences;
    .end local v4    # "existingValue":Ljava/lang/Object;
    .end local p1    # "peer":Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .end local p2    # "params":Lorg/json/JSONObject;
    throw v7

    .line 109
    .end local v5    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v6    # "e":Ljava/lang/IllegalArgumentException;
    .restart local v0    # "storage":Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;
    .restart local v1    # "key":Ljava/lang/String;
    .restart local v2    # "value":Ljava/lang/String;
    .restart local v3    # "prefs":Landroid/content/SharedPreferences;
    .restart local v4    # "existingValue":Ljava/lang/Object;
    .restart local p1    # "peer":Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .restart local p2    # "params":Lorg/json/JSONObject;
    :catch_1
    move-exception v5

    goto :goto_0

    .line 93
    :cond_0
    new-instance v5, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DOMStorageAssignmentException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unsupported: cannot add new key "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " due to lack of type inference"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DOMStorageAssignmentException;-><init>(Ljava/lang/String;)V

    .end local v0    # "storage":Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;
    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/String;
    .end local v3    # "prefs":Landroid/content/SharedPreferences;
    .end local v4    # "existingValue":Ljava/lang/Object;
    .end local p1    # "peer":Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .end local p2    # "params":Lorg/json/JSONObject;
    throw v5
    :try_end_2
    .catch Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DOMStorageAssignmentException; {:try_start_2 .. :try_end_2} :catch_1

    .line 110
    .restart local v0    # "storage":Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;
    .restart local v1    # "key":Ljava/lang/String;
    .restart local v2    # "value":Ljava/lang/String;
    .restart local v3    # "prefs":Landroid/content/SharedPreferences;
    .restart local v4    # "existingValue":Ljava/lang/Object;
    .local v5, "e":Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DOMStorageAssignmentException;
    .restart local p1    # "peer":Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .restart local p2    # "params":Lorg/json/JSONObject;
    :goto_0
    iget-object v6, p0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage;->mDOMStoragePeerManager:Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;

    sget-object v7, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;->ERROR:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;

    sget-object v8, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->STORAGE:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    .line 114
    invoke-virtual {v5}, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DOMStorageAssignmentException;->getMessage()Ljava/lang/String;

    move-result-object v9

    .line 110
    invoke-static {v6, v7, v8, v9}, Lcom/facebook/stetho/inspector/console/CLog;->writeToConsole(Lcom/facebook/stetho/inspector/helper/ChromePeerManager;Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;Ljava/lang/String;)V

    .line 119
    invoke-interface {v3, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 120
    iget-object v6, p0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage;->mDOMStoragePeerManager:Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;

    .line 124
    invoke-static {v4}, Lcom/facebook/stetho/inspector/domstorage/SharedPreferencesHelper;->valueToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 120
    invoke-virtual {v6, v0, v1, v2, v7}, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;->signalItemUpdated(Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 126
    :cond_1
    iget-object v6, p0, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage;->mDOMStoragePeerManager:Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;

    invoke-virtual {v6, v0, v1}, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;->signalItemRemoved(Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;Ljava/lang/String;)V

    .line 130
    .end local v3    # "prefs":Landroid/content/SharedPreferences;
    .end local v4    # "existingValue":Ljava/lang/Object;
    .end local v5    # "e":Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$DOMStorageAssignmentException;
    :cond_2
    :goto_1
    return-void
.end method
