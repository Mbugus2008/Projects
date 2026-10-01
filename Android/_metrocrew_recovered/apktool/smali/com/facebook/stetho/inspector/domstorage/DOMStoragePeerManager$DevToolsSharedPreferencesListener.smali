.class Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$DevToolsSharedPreferencesListener;
.super Ljava/lang/Object;
.source "DOMStoragePeerManager.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DevToolsSharedPreferencesListener"
.end annotation


# instance fields
.field private final mCopy:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final mPrefs:Landroid/content/SharedPreferences;

.field private final mStorageId:Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;

.field final synthetic this$0:Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;


# direct methods
.method public constructor <init>(Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 1
    .param p2, "prefs"    # Landroid/content/SharedPreferences;
    .param p3, "tag"    # Ljava/lang/String;

    .line 109
    iput-object p1, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$DevToolsSharedPreferencesListener;->this$0:Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 110
    iput-object p2, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$DevToolsSharedPreferencesListener;->mPrefs:Landroid/content/SharedPreferences;

    .line 111
    new-instance p1, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;

    invoke-direct {p1}, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;-><init>()V

    iput-object p1, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$DevToolsSharedPreferencesListener;->mStorageId:Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;

    .line 112
    iget-object p1, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$DevToolsSharedPreferencesListener;->mStorageId:Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;

    iput-object p3, p1, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;->securityOrigin:Ljava/lang/String;

    .line 113
    iget-object p1, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$DevToolsSharedPreferencesListener;->mStorageId:Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;->isLocalStorage:Z

    .line 114
    invoke-interface {p2}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object p1

    invoke-static {p1}, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;->access$100(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$DevToolsSharedPreferencesListener;->mCopy:Ljava/util/Map;

    .line 115
    return-void
.end method


# virtual methods
.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 8
    .param p1, "sharedPreferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;

    .line 123
    invoke-interface {p1}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    .line 124
    .local v0, "entries":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    iget-object v1, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$DevToolsSharedPreferencesListener;->mCopy:Ljava/util/Map;

    invoke-interface {v1, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    .line 125
    .local v1, "existedBefore":Z
    invoke-interface {v0, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    .line 126
    .local v2, "existsNow":Z
    if-eqz v2, :cond_0

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 127
    .local v3, "newValue":Ljava/lang/Object;
    :goto_0
    if-eqz v1, :cond_1

    if-eqz v2, :cond_1

    .line 128
    iget-object v4, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$DevToolsSharedPreferencesListener;->this$0:Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;

    iget-object v5, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$DevToolsSharedPreferencesListener;->mStorageId:Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;

    iget-object v6, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$DevToolsSharedPreferencesListener;->mCopy:Ljava/util/Map;

    .line 131
    invoke-interface {v6, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    invoke-static {v6}, Lcom/facebook/stetho/inspector/domstorage/SharedPreferencesHelper;->valueToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 132
    invoke-static {v3}, Lcom/facebook/stetho/inspector/domstorage/SharedPreferencesHelper;->valueToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 128
    invoke-virtual {v4, v5, p2, v6, v7}, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;->signalItemUpdated(Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    iget-object v4, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$DevToolsSharedPreferencesListener;->mCopy:Ljava/util/Map;

    invoke-interface {v4, p2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 134
    :cond_1
    if-eqz v1, :cond_2

    .line 135
    iget-object v4, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$DevToolsSharedPreferencesListener;->this$0:Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;

    iget-object v5, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$DevToolsSharedPreferencesListener;->mStorageId:Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;

    invoke-virtual {v4, v5, p2}, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;->signalItemRemoved(Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;Ljava/lang/String;)V

    .line 136
    iget-object v4, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$DevToolsSharedPreferencesListener;->mCopy:Ljava/util/Map;

    invoke-interface {v4, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 137
    :cond_2
    if-eqz v2, :cond_3

    .line 138
    iget-object v4, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$DevToolsSharedPreferencesListener;->this$0:Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;

    iget-object v5, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$DevToolsSharedPreferencesListener;->mStorageId:Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;

    .line 141
    invoke-static {v3}, Lcom/facebook/stetho/inspector/domstorage/SharedPreferencesHelper;->valueToString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 138
    invoke-virtual {v4, v5, p2, v6}, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager;->signalItemAdded(Lcom/facebook/stetho/inspector/protocol/module/DOMStorage$StorageId;Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    iget-object v4, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$DevToolsSharedPreferencesListener;->mCopy:Ljava/util/Map;

    invoke-interface {v4, p2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 146
    :cond_3
    const-string v4, "Detected rapid put/remove of %s"

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/facebook/stetho/common/LogUtil;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 148
    :goto_1
    return-void
.end method

.method public unregister()V
    .locals 1

    .line 118
    iget-object v0, p0, Lcom/facebook/stetho/inspector/domstorage/DOMStoragePeerManager$DevToolsSharedPreferencesListener;->mPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 119
    return-void
.end method
