.class public final Landroidx/work/impl/model/DependencyDao_Impl;
.super Ljava/lang/Object;
.source "DependencyDao_Impl.java"

# interfaces
.implements Landroidx/work/impl/model/DependencyDao;


# instance fields
.field private final __db:Landroidx/room/RoomDatabase;

.field private final __insertionAdapterOfDependency:Landroidx/room/EntityInsertionAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityInsertionAdapter<",
            "Landroidx/work/impl/model/Dependency;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/room/RoomDatabase;)V
    .locals 1
    .param p1, "__db"    # Landroidx/room/RoomDatabase;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "__db"
        }
    .end annotation

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Landroidx/work/impl/model/DependencyDao_Impl;->__db:Landroidx/room/RoomDatabase;

    .line 28
    new-instance v0, Landroidx/work/impl/model/DependencyDao_Impl$1;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/DependencyDao_Impl$1;-><init>(Landroidx/work/impl/model/DependencyDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/DependencyDao_Impl;->__insertionAdapterOfDependency:Landroidx/room/EntityInsertionAdapter;

    .line 42
    return-void
.end method

.method public static getRequiredConverters()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation

    .line 150
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getDependentWorkIds(Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .param p1, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "id"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 104
    const-string v0, "SELECT work_spec_id FROM dependency WHERE prerequisite_id=?"

    .line 105
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "SELECT work_spec_id FROM dependency WHERE prerequisite_id=?"

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 106
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v2, 0x1

    .line 107
    .local v2, "_argIndex":I
    invoke-virtual {v1, v2, p1}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 108
    iget-object v3, p0, Landroidx/work/impl/model/DependencyDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 109
    iget-object v3, p0, Landroidx/work/impl/model/DependencyDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v3, v1, v5, v4}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v3

    .line 111
    .local v3, "_cursor":Landroid/database/Cursor;
    :try_start_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v6

    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 112
    .local v4, "_result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 114
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 115
    .local v6, "_item":Ljava/lang/String;
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    nop

    .end local v6    # "_item":Ljava/lang/String;
    goto :goto_0

    .line 117
    :cond_0
    nop

    .line 119
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 120
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 117
    return-object v4

    .line 119
    .end local v4    # "_result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v4

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 120
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 121
    throw v4
.end method

.method public getPrerequisites(Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .param p1, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "id"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 82
    const-string v0, "SELECT prerequisite_id FROM dependency WHERE work_spec_id=?"

    .line 83
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "SELECT prerequisite_id FROM dependency WHERE work_spec_id=?"

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 84
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v2, 0x1

    .line 85
    .local v2, "_argIndex":I
    invoke-virtual {v1, v2, p1}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 86
    iget-object v3, p0, Landroidx/work/impl/model/DependencyDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 87
    iget-object v3, p0, Landroidx/work/impl/model/DependencyDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v3, v1, v5, v4}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v3

    .line 89
    .local v3, "_cursor":Landroid/database/Cursor;
    :try_start_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v6

    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 90
    .local v4, "_result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 92
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 93
    .local v6, "_item":Ljava/lang/String;
    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 94
    nop

    .end local v6    # "_item":Ljava/lang/String;
    goto :goto_0

    .line 95
    :cond_0
    nop

    .line 97
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 98
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 95
    return-object v4

    .line 97
    .end local v4    # "_result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v4

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 98
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 99
    throw v4
.end method

.method public hasCompletedAllPrerequisites(Ljava/lang/String;)Z
    .locals 7
    .param p1, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "id"
        }
    .end annotation

    .line 58
    const-string v0, "SELECT COUNT(*)=0 FROM dependency WHERE work_spec_id=? AND prerequisite_id IN (SELECT id FROM workspec WHERE state!=2)"

    .line 59
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "SELECT COUNT(*)=0 FROM dependency WHERE work_spec_id=? AND prerequisite_id IN (SELECT id FROM workspec WHERE state!=2)"

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 60
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v3, 0x1

    .line 61
    .local v3, "_argIndex":I
    invoke-virtual {v1, v3, p1}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 62
    iget-object v4, p0, Landroidx/work/impl/model/DependencyDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v4}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 63
    iget-object v4, p0, Landroidx/work/impl/model/DependencyDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v4, v1, v6, v5}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v4

    .line 66
    .local v4, "_cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 68
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    .local v5, "_tmp":I
    if-eqz v5, :cond_0

    goto :goto_0

    :cond_0
    move v2, v6

    .line 70
    .end local v5    # "_tmp":I
    .local v2, "_result":Z
    :goto_0
    goto :goto_1

    .line 71
    .end local v2    # "_result":Z
    :cond_1
    const/4 v2, 0x0

    .line 73
    .restart local v2    # "_result":Z
    :goto_1
    nop

    .line 75
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 76
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 73
    return v2

    .line 75
    .end local v2    # "_result":Z
    :catchall_0
    move-exception v2

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 76
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 77
    throw v2
.end method

.method public hasDependents(Ljava/lang/String;)Z
    .locals 7
    .param p1, "id"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "id"
        }
    .end annotation

    .line 126
    const-string v0, "SELECT COUNT(*)>0 FROM dependency WHERE prerequisite_id=?"

    .line 127
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "SELECT COUNT(*)>0 FROM dependency WHERE prerequisite_id=?"

    const/4 v2, 0x1

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 128
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v3, 0x1

    .line 129
    .local v3, "_argIndex":I
    invoke-virtual {v1, v3, p1}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 130
    iget-object v4, p0, Landroidx/work/impl/model/DependencyDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v4}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 131
    iget-object v4, p0, Landroidx/work/impl/model/DependencyDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v4, v1, v6, v5}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v4

    .line 134
    .local v4, "_cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 136
    invoke-interface {v4, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 137
    .local v5, "_tmp":I
    if-eqz v5, :cond_0

    goto :goto_0

    :cond_0
    move v2, v6

    .line 138
    .end local v5    # "_tmp":I
    .local v2, "_result":Z
    :goto_0
    goto :goto_1

    .line 139
    .end local v2    # "_result":Z
    :cond_1
    const/4 v2, 0x0

    .line 141
    .restart local v2    # "_result":Z
    :goto_1
    nop

    .line 143
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 144
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 141
    return v2

    .line 143
    .end local v2    # "_result":Z
    :catchall_0
    move-exception v2

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    .line 144
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 145
    throw v2
.end method

.method public insertDependency(Landroidx/work/impl/model/Dependency;)V
    .locals 2
    .param p1, "dependency"    # Landroidx/work/impl/model/Dependency;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "dependency"
        }
    .end annotation

    .line 46
    iget-object v0, p0, Landroidx/work/impl/model/DependencyDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 47
    iget-object v0, p0, Landroidx/work/impl/model/DependencyDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 49
    :try_start_0
    iget-object v0, p0, Landroidx/work/impl/model/DependencyDao_Impl;->__insertionAdapterOfDependency:Landroidx/room/EntityInsertionAdapter;

    invoke-virtual {v0, p1}, Landroidx/room/EntityInsertionAdapter;->insert(Ljava/lang/Object;)V

    .line 50
    iget-object v0, p0, Landroidx/work/impl/model/DependencyDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    iget-object v0, p0, Landroidx/work/impl/model/DependencyDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 53
    nop

    .line 54
    return-void

    .line 52
    :catchall_0
    move-exception v0

    iget-object v1, p0, Landroidx/work/impl/model/DependencyDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 53
    throw v0
.end method
