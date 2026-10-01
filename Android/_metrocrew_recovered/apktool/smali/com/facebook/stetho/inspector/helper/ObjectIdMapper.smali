.class public Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;
.super Ljava/lang/Object;
.source "ObjectIdMapper.java"


# instance fields
.field private mIdToObjectMap:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private mNextId:I

.field private final mObjectToIdMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected final mSync:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mSync:Ljava/lang/Object;

    .line 21
    const/4 v0, 0x1

    iput v0, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mNextId:I

    .line 24
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mObjectToIdMap:Ljava/util/Map;

    .line 27
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mIdToObjectMap:Landroid/util/SparseArray;

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 5

    .line 32
    iget-object v0, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mSync:Ljava/lang/Object;

    monitor-enter v0

    .line 33
    :try_start_0
    iget-object v1, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mIdToObjectMap:Landroid/util/SparseArray;

    .line 34
    .local v1, "idToObjectMap":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/Object;>;"
    iget-object v2, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mObjectToIdMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 35
    new-instance v2, Landroid/util/SparseArray;

    invoke-direct {v2}, Landroid/util/SparseArray;-><init>()V

    iput-object v2, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mIdToObjectMap:Landroid/util/SparseArray;

    .line 36
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    move-result v0

    .line 39
    .local v0, "size":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_0

    .line 40
    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v3

    .line 41
    .local v3, "id":I
    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    .line 42
    .local v4, "object":Ljava/lang/Object;
    invoke-virtual {p0, v4, v3}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->onUnmapped(Ljava/lang/Object;I)V

    .line 39
    .end local v3    # "id":I
    .end local v4    # "object":Ljava/lang/Object;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 44
    .end local v2    # "i":I
    :cond_0
    return-void

    .line 36
    .end local v0    # "size":I
    .end local v1    # "idToObjectMap":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/Object;>;"
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public containsId(I)Z
    .locals 2
    .param p1, "id"    # I

    .line 47
    iget-object v0, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mSync:Ljava/lang/Object;

    monitor-enter v0

    .line 48
    :try_start_0
    iget-object v1, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mIdToObjectMap:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0

    return v1

    .line 49
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public containsObject(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "object"    # Ljava/lang/Object;

    .line 53
    iget-object v0, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mSync:Ljava/lang/Object;

    monitor-enter v0

    .line 54
    :try_start_0
    iget-object v1, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mObjectToIdMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    monitor-exit v0

    return v1

    .line 55
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getIdForObject(Ljava/lang/Object;)Ljava/lang/Integer;
    .locals 2
    .param p1, "object"    # Ljava/lang/Object;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 67
    iget-object v0, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mSync:Ljava/lang/Object;

    monitor-enter v0

    .line 68
    :try_start_0
    iget-object v1, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mObjectToIdMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    monitor-exit v0

    return-object v1

    .line 69
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getObjectForId(I)Ljava/lang/Object;
    .locals 2
    .param p1, "id"    # I
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 60
    iget-object v0, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mSync:Ljava/lang/Object;

    monitor-enter v0

    .line 61
    :try_start_0
    iget-object v1, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mIdToObjectMap:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    monitor-exit v0

    return-object v1

    .line 62
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method protected onMapped(Ljava/lang/Object;I)V
    .locals 0
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "id"    # I

    .line 132
    return-void
.end method

.method protected onUnmapped(Ljava/lang/Object;I)V
    .locals 0
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "id"    # I

    .line 135
    return-void
.end method

.method public putObject(Ljava/lang/Object;)I
    .locals 4
    .param p1, "object"    # Ljava/lang/Object;

    .line 75
    iget-object v0, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mSync:Ljava/lang/Object;

    monitor-enter v0

    .line 76
    :try_start_0
    iget-object v1, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mObjectToIdMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 77
    .local v1, "id":Ljava/lang/Integer;
    if-eqz v1, :cond_0

    .line 78
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    monitor-exit v0

    return v2

    .line 81
    :cond_0
    iget v2, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mNextId:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mNextId:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 82
    .end local v1    # "id":Ljava/lang/Integer;
    .local v2, "id":Ljava/lang/Integer;
    iget-object v1, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mObjectToIdMap:Ljava/util/Map;

    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    iget-object v1, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mIdToObjectMap:Landroid/util/SparseArray;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v1, v3, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 84
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->onMapped(Ljava/lang/Object;I)V

    .line 87
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0

    .line 84
    .end local v2    # "id":Ljava/lang/Integer;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public removeObject(Ljava/lang/Object;)Ljava/lang/Integer;
    .locals 4
    .param p1, "object"    # Ljava/lang/Object;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 112
    iget-object v0, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mSync:Ljava/lang/Object;

    monitor-enter v0

    .line 113
    :try_start_0
    iget-object v1, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mObjectToIdMap:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 114
    .local v1, "id":Ljava/lang/Integer;
    if-nez v1, :cond_0

    .line 115
    monitor-exit v0

    const/4 v0, 0x0

    return-object v0

    .line 118
    :cond_0
    iget-object v2, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mIdToObjectMap:Landroid/util/SparseArray;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/util/SparseArray;->remove(I)V

    .line 119
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->onUnmapped(Ljava/lang/Object;I)V

    .line 122
    return-object v1

    .line 119
    .end local v1    # "id":Ljava/lang/Integer;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public removeObjectById(I)Ljava/lang/Object;
    .locals 3
    .param p1, "id"    # I
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 94
    iget-object v0, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mSync:Ljava/lang/Object;

    monitor-enter v0

    .line 95
    :try_start_0
    iget-object v1, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mIdToObjectMap:Landroid/util/SparseArray;

    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    .line 96
    .local v1, "object":Ljava/lang/Object;
    if-nez v1, :cond_0

    .line 97
    monitor-exit v0

    const/4 v0, 0x0

    return-object v0

    .line 100
    :cond_0
    iget-object v2, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mIdToObjectMap:Landroid/util/SparseArray;

    invoke-virtual {v2, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 101
    iget-object v2, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mObjectToIdMap:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    invoke-virtual {p0, v1, p1}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->onUnmapped(Ljava/lang/Object;I)V

    .line 105
    return-object v1

    .line 102
    .end local v1    # "object":Ljava/lang/Object;
    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public size()I
    .locals 2

    .line 126
    iget-object v0, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mSync:Ljava/lang/Object;

    monitor-enter v0

    .line 127
    :try_start_0
    iget-object v1, p0, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;->mObjectToIdMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    monitor-exit v0

    return v1

    .line 128
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
