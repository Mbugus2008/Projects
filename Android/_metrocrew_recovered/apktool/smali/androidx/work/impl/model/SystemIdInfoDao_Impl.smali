.class public final Landroidx/work/impl/model/SystemIdInfoDao_Impl;
.super Ljava/lang/Object;
.source "SystemIdInfoDao_Impl.java"

# interfaces
.implements Landroidx/work/impl/model/SystemIdInfoDao;


# instance fields
.field private final __db:Landroidx/room/RoomDatabase;

.field private final __insertionAdapterOfSystemIdInfo:Landroidx/room/EntityInsertionAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityInsertionAdapter<",
            "Landroidx/work/impl/model/SystemIdInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final __preparedStmtOfRemoveSystemIdInfo:Landroidx/room/SharedSQLiteStatement;

.field private final __preparedStmtOfRemoveSystemIdInfo_1:Landroidx/room/SharedSQLiteStatement;


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

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    .line 34
    new-instance v0, Landroidx/work/impl/model/SystemIdInfoDao_Impl$1;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/SystemIdInfoDao_Impl$1;-><init>(Landroidx/work/impl/model/SystemIdInfoDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__insertionAdapterOfSystemIdInfo:Landroidx/room/EntityInsertionAdapter;

    .line 49
    new-instance v0, Landroidx/work/impl/model/SystemIdInfoDao_Impl$2;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/SystemIdInfoDao_Impl$2;-><init>(Landroidx/work/impl/model/SystemIdInfoDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__preparedStmtOfRemoveSystemIdInfo:Landroidx/room/SharedSQLiteStatement;

    .line 57
    new-instance v0, Landroidx/work/impl/model/SystemIdInfoDao_Impl$3;

    invoke-direct {v0, p0, p1}, Landroidx/work/impl/model/SystemIdInfoDao_Impl$3;-><init>(Landroidx/work/impl/model/SystemIdInfoDao_Impl;Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__preparedStmtOfRemoveSystemIdInfo_1:Landroidx/room/SharedSQLiteStatement;

    .line 65
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

    .line 174
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getSystemIdInfo(Ljava/lang/String;I)Landroidx/work/impl/model/SystemIdInfo;
    .locals 11
    .param p1, "workSpecId"    # Ljava/lang/String;
    .param p2, "generation"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "workSpecId",
            "generation"
        }
    .end annotation

    .line 121
    const-string v0, "SELECT * FROM SystemIdInfo WHERE work_spec_id=? AND generation=?"

    .line 122
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "SELECT * FROM SystemIdInfo WHERE work_spec_id=? AND generation=?"

    const/4 v2, 0x2

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 123
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    const/4 v2, 0x1

    .line 124
    .local v2, "_argIndex":I
    invoke-virtual {v1, v2, p1}, Landroidx/room/RoomSQLiteQuery;->bindString(ILjava/lang/String;)V

    .line 125
    const/4 v2, 0x2

    .line 126
    int-to-long v3, p2

    invoke-virtual {v1, v2, v3, v4}, Landroidx/room/RoomSQLiteQuery;->bindLong(IJ)V

    .line 127
    iget-object v3, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 128
    iget-object v3, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v3, v1, v4, v5}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v3

    .line 130
    .local v3, "_cursor":Landroid/database/Cursor;
    :try_start_0
    const-string/jumbo v4, "work_spec_id"

    invoke-static {v3, v4}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v4

    .line 131
    .local v4, "_cursorIndexOfWorkSpecId":I
    const-string v5, "generation"

    invoke-static {v3, v5}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v5

    .line 132
    .local v5, "_cursorIndexOfGeneration":I
    const-string/jumbo v6, "system_id"

    invoke-static {v3, v6}, Landroidx/room/util/CursorUtil;->getColumnIndexOrThrow(Landroid/database/Cursor;Ljava/lang/String;)I

    move-result v6

    .line 134
    .local v6, "_cursorIndexOfSystemId":I
    invoke-interface {v3}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 136
    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 138
    .local v7, "_tmpWorkSpecId":Ljava/lang/String;
    invoke-interface {v3, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v8

    .line 140
    .local v8, "_tmpGeneration":I
    invoke-interface {v3, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    .line 141
    .local v9, "_tmpSystemId":I
    new-instance v10, Landroidx/work/impl/model/SystemIdInfo;

    invoke-direct {v10, v7, v8, v9}, Landroidx/work/impl/model/SystemIdInfo;-><init>(Ljava/lang/String;II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 142
    .end local v7    # "_tmpWorkSpecId":Ljava/lang/String;
    .end local v8    # "_tmpGeneration":I
    .end local v9    # "_tmpSystemId":I
    .local v10, "_result":Landroidx/work/impl/model/SystemIdInfo;
    goto :goto_0

    .line 143
    .end local v10    # "_result":Landroidx/work/impl/model/SystemIdInfo;
    :cond_0
    const/4 v10, 0x0

    .line 145
    .restart local v10    # "_result":Landroidx/work/impl/model/SystemIdInfo;
    :goto_0
    nop

    .line 147
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 148
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 145
    return-object v10

    .line 147
    .end local v4    # "_cursorIndexOfWorkSpecId":I
    .end local v5    # "_cursorIndexOfGeneration":I
    .end local v6    # "_cursorIndexOfSystemId":I
    .end local v10    # "_result":Landroidx/work/impl/model/SystemIdInfo;
    :catchall_0
    move-exception v4

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 148
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 149
    throw v4
.end method

.method public getWorkSpecIds()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 154
    const-string v0, "SELECT DISTINCT work_spec_id FROM SystemIdInfo"

    .line 155
    .local v0, "_sql":Ljava/lang/String;
    const-string v1, "SELECT DISTINCT work_spec_id FROM SystemIdInfo"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroidx/room/RoomSQLiteQuery;->acquire(Ljava/lang/String;I)Landroidx/room/RoomSQLiteQuery;

    move-result-object v1

    .line 156
    .local v1, "_statement":Landroidx/room/RoomSQLiteQuery;
    iget-object v3, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 157
    iget-object v3, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    const/4 v4, 0x0

    invoke-static {v3, v1, v2, v4}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v3

    .line 159
    .local v3, "_cursor":Landroid/database/Cursor;
    :try_start_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 160
    .local v4, "_result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 162
    invoke-interface {v3, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 163
    .local v5, "_item":Ljava/lang/String;
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 164
    nop

    .end local v5    # "_item":Ljava/lang/String;
    goto :goto_0

    .line 165
    :cond_0
    nop

    .line 167
    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 168
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 165
    return-object v4

    .line 167
    .end local v4    # "_result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v2

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    .line 168
    invoke-virtual {v1}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 169
    throw v2
.end method

.method public insertSystemIdInfo(Landroidx/work/impl/model/SystemIdInfo;)V
    .locals 2
    .param p1, "systemIdInfo"    # Landroidx/work/impl/model/SystemIdInfo;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "systemIdInfo"
        }
    .end annotation

    .line 69
    iget-object v0, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 70
    iget-object v0, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 72
    :try_start_0
    iget-object v0, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__insertionAdapterOfSystemIdInfo:Landroidx/room/EntityInsertionAdapter;

    invoke-virtual {v0, p1}, Landroidx/room/EntityInsertionAdapter;->insert(Ljava/lang/Object;)V

    .line 73
    iget-object v0, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    iget-object v0, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 76
    nop

    .line 77
    return-void

    .line 75
    :catchall_0
    move-exception v0

    iget-object v1, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 76
    throw v0
.end method

.method public removeSystemIdInfo(Ljava/lang/String;)V
    .locals 4
    .param p1, "workSpecId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "workSpecId"
        }
    .end annotation

    .line 102
    iget-object v0, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 103
    iget-object v0, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__preparedStmtOfRemoveSystemIdInfo_1:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->acquire()Landroidx/sqlite/db/SupportSQLiteStatement;

    move-result-object v0

    .line 104
    .local v0, "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    const/4 v1, 0x1

    .line 105
    .local v1, "_argIndex":I
    invoke-interface {v0, v1, p1}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 107
    :try_start_0
    iget-object v2, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 109
    :try_start_1
    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I

    .line 110
    iget-object v2, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 112
    :try_start_2
    iget-object v2, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 113
    nop

    .line 115
    iget-object v2, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__preparedStmtOfRemoveSystemIdInfo_1:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v2, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 116
    nop

    .line 117
    return-void

    .line 112
    :catchall_0
    move-exception v2

    :try_start_3
    iget-object v3, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 113
    nop

    .end local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .end local v1    # "_argIndex":I
    .end local p1    # "workSpecId":Ljava/lang/String;
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 115
    .restart local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .restart local v1    # "_argIndex":I
    .restart local p1    # "workSpecId":Ljava/lang/String;
    :catchall_1
    move-exception v2

    iget-object v3, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__preparedStmtOfRemoveSystemIdInfo_1:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v3, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 116
    throw v2
.end method

.method public removeSystemIdInfo(Ljava/lang/String;I)V
    .locals 4
    .param p1, "workSpecId"    # Ljava/lang/String;
    .param p2, "generation"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "workSpecId",
            "generation"
        }
    .end annotation

    .line 81
    iget-object v0, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->assertNotSuspendingTransaction()V

    .line 82
    iget-object v0, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__preparedStmtOfRemoveSystemIdInfo:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v0}, Landroidx/room/SharedSQLiteStatement;->acquire()Landroidx/sqlite/db/SupportSQLiteStatement;

    move-result-object v0

    .line 83
    .local v0, "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    const/4 v1, 0x1

    .line 84
    .local v1, "_argIndex":I
    invoke-interface {v0, v1, p1}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindString(ILjava/lang/String;)V

    .line 85
    const/4 v1, 0x2

    .line 86
    int-to-long v2, p2

    invoke-interface {v0, v1, v2, v3}, Landroidx/sqlite/db/SupportSQLiteStatement;->bindLong(IJ)V

    .line 88
    :try_start_0
    iget-object v2, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 90
    :try_start_1
    invoke-interface {v0}, Landroidx/sqlite/db/SupportSQLiteStatement;->executeUpdateDelete()I

    .line 91
    iget-object v2, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 93
    :try_start_2
    iget-object v2, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 94
    nop

    .line 96
    iget-object v2, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__preparedStmtOfRemoveSystemIdInfo:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v2, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 97
    nop

    .line 98
    return-void

    .line 93
    :catchall_0
    move-exception v2

    :try_start_3
    iget-object v3, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v3}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 94
    nop

    .end local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .end local v1    # "_argIndex":I
    .end local p1    # "workSpecId":Ljava/lang/String;
    .end local p2    # "generation":I
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 96
    .restart local v0    # "_stmt":Landroidx/sqlite/db/SupportSQLiteStatement;
    .restart local v1    # "_argIndex":I
    .restart local p1    # "workSpecId":Ljava/lang/String;
    .restart local p2    # "generation":I
    :catchall_1
    move-exception v2

    iget-object v3, p0, Landroidx/work/impl/model/SystemIdInfoDao_Impl;->__preparedStmtOfRemoveSystemIdInfo:Landroidx/room/SharedSQLiteStatement;

    invoke-virtual {v3, v0}, Landroidx/room/SharedSQLiteStatement;->release(Landroidx/sqlite/db/SupportSQLiteStatement;)V

    .line 97
    throw v2
.end method
