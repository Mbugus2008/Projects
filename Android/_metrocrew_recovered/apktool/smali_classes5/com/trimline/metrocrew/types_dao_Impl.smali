.class public final Lcom/trimline/metrocrew/types_dao_Impl;
.super Lcom/trimline/metrocrew/types$dao;
.source "types_dao_Impl.java"


# instance fields
.field private final __db:Landroidx/room/RoomDatabase;

.field private final __deleteAdapterOftypes:Landroidx/room/EntityDeleteOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeleteOrUpdateAdapter<",
            "Lcom/trimline/metrocrew/types;",
            ">;"
        }
    .end annotation
.end field

.field private final __insertAdapterOftypes:Landroidx/room/EntityInsertAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityInsertAdapter<",
            "Lcom/trimline/metrocrew/types;",
            ">;"
        }
    .end annotation
.end field

.field private final __updateAdapterOftypes:Landroidx/room/EntityDeleteOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeleteOrUpdateAdapter<",
            "Lcom/trimline/metrocrew/types;",
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

    .line 29
    invoke-direct {p0}, Lcom/trimline/metrocrew/types$dao;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/trimline/metrocrew/types_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    .line 31
    new-instance v0, Lcom/trimline/metrocrew/types_dao_Impl$1;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/types_dao_Impl$1;-><init>(Lcom/trimline/metrocrew/types_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/types_dao_Impl;->__insertAdapterOftypes:Landroidx/room/EntityInsertAdapter;

    .line 64
    new-instance v0, Lcom/trimline/metrocrew/types_dao_Impl$2;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/types_dao_Impl$2;-><init>(Lcom/trimline/metrocrew/types_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/types_dao_Impl;->__deleteAdapterOftypes:Landroidx/room/EntityDeleteOrUpdateAdapter;

    .line 80
    new-instance v0, Lcom/trimline/metrocrew/types_dao_Impl$3;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/types_dao_Impl$3;-><init>(Lcom/trimline/metrocrew/types_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/types_dao_Impl;->__updateAdapterOftypes:Landroidx/room/EntityDeleteOrUpdateAdapter;

    .line 118
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

    .line 207
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$deleteall$4(Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 2
    .param p0, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 195
    const-string v0, "delete from types"

    invoke-interface {p0, v0}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v0

    .line 197
    .local v0, "_stmt":Landroidx/sqlite/SQLiteStatement;
    :try_start_0
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->step()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 198
    nop

    .line 200
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 198
    const/4 v1, 0x0

    return-object v1

    .line 200
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 201
    throw v1
.end method

.method static synthetic lambda$getypes$3(Landroidx/sqlite/SQLiteConnection;)Ljava/util/List;
    .locals 12
    .param p0, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 148
    const-string v0, "select * from types"

    invoke-interface {p0, v0}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v0

    .line 150
    .local v0, "_stmt":Landroidx/sqlite/SQLiteStatement;
    :try_start_0
    const-string v1, "Code"

    invoke-static {v0, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 151
    .local v1, "_columnIndexOfCode":I
    const-string v2, "Name"

    invoke-static {v0, v2}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v2

    .line 152
    .local v2, "_columnIndexOfName":I
    const-string v3, "Active"

    invoke-static {v0, v3}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v3

    .line 153
    .local v3, "_columnIndexOfActive":I
    const-string v4, "Account"

    invoke-static {v0, v4}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v4

    .line 154
    .local v4, "_columnIndexOfAccount":I
    const-string v5, "Order"

    invoke-static {v0, v5}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v5

    .line 155
    .local v5, "_columnIndexOfOrder":I
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 156
    .local v6, "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/types;>;"
    :goto_0
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->step()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 158
    new-instance v7, Lcom/trimline/metrocrew/types;

    invoke-direct {v7}, Lcom/trimline/metrocrew/types;-><init>()V

    .line 159
    .local v7, "_item":Lcom/trimline/metrocrew/types;
    invoke-interface {v0, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v8

    const/4 v9, 0x0

    if-eqz v8, :cond_0

    .line 160
    iput-object v9, v7, Lcom/trimline/metrocrew/types;->Code:Ljava/lang/String;

    goto :goto_1

    .line 162
    :cond_0
    invoke-interface {v0, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/trimline/metrocrew/types;->Code:Ljava/lang/String;

    .line 164
    :goto_1
    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 165
    iput-object v9, v7, Lcom/trimline/metrocrew/types;->Name:Ljava/lang/String;

    goto :goto_2

    .line 167
    :cond_1
    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v8

    iput-object v8, v7, Lcom/trimline/metrocrew/types;->Name:Ljava/lang/String;

    .line 170
    :goto_2
    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 171
    const/4 v8, 0x0

    .local v8, "_tmp":Ljava/lang/Integer;
    goto :goto_3

    .line 173
    .end local v8    # "_tmp":Ljava/lang/Integer;
    :cond_2
    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v10

    long-to-int v8, v10

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 175
    .restart local v8    # "_tmp":Ljava/lang/Integer;
    :goto_3
    if-nez v8, :cond_3

    move-object v10, v9

    goto :goto_5

    :cond_3
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v10

    if-eqz v10, :cond_4

    const/4 v10, 0x1

    goto :goto_4

    :cond_4
    const/4 v10, 0x0

    :goto_4
    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    :goto_5
    iput-object v10, v7, Lcom/trimline/metrocrew/types;->Active:Ljava/lang/Boolean;

    .line 176
    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 177
    iput-object v9, v7, Lcom/trimline/metrocrew/types;->Account:Ljava/lang/String;

    goto :goto_6

    .line 179
    :cond_5
    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v9

    iput-object v9, v7, Lcom/trimline/metrocrew/types;->Account:Ljava/lang/String;

    .line 181
    :goto_6
    invoke-interface {v0, v5}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v9

    long-to-int v9, v9

    iput v9, v7, Lcom/trimline/metrocrew/types;->Order:I

    .line 182
    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 183
    nop

    .end local v7    # "_item":Lcom/trimline/metrocrew/types;
    .end local v8    # "_tmp":Ljava/lang/Integer;
    goto :goto_0

    .line 184
    :cond_6
    nop

    .line 186
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 184
    return-object v6

    .line 186
    .end local v1    # "_columnIndexOfCode":I
    .end local v2    # "_columnIndexOfName":I
    .end local v3    # "_columnIndexOfActive":I
    .end local v4    # "_columnIndexOfAccount":I
    .end local v5    # "_columnIndexOfOrder":I
    .end local v6    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/types;>;"
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 187
    throw v1
.end method


# virtual methods
.method delete(Lcom/trimline/metrocrew/types;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/types;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 130
    iget-object v0, p0, Lcom/trimline/metrocrew/types_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/types_dao_Impl$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/types_dao_Impl$$ExternalSyntheticLambda3;-><init>(Lcom/trimline/metrocrew/types_dao_Impl;Lcom/trimline/metrocrew/types;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 134
    return-void
.end method

.method deleteall()V
    .locals 5

    .line 193
    const-string v0, "delete from types"

    .line 194
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/trimline/metrocrew/types_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v2, Lcom/trimline/metrocrew/types_dao_Impl$$ExternalSyntheticLambda2;

    invoke-direct {v2}, Lcom/trimline/metrocrew/types_dao_Impl$$ExternalSyntheticLambda2;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v1, v3, v4, v2}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 203
    return-void
.end method

.method getypes()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/types;",
            ">;"
        }
    .end annotation

    .line 146
    const-string v0, "select * from types"

    .line 147
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/trimline/metrocrew/types_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v2, Lcom/trimline/metrocrew/types_dao_Impl$$ExternalSyntheticLambda0;

    invoke-direct {v2}, Lcom/trimline/metrocrew/types_dao_Impl$$ExternalSyntheticLambda0;-><init>()V

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v1, v3, v4, v2}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    return-object v1
.end method

.method insert(Lcom/trimline/metrocrew/types;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/types;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 122
    iget-object v0, p0, Lcom/trimline/metrocrew/types_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/types_dao_Impl$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/types_dao_Impl$$ExternalSyntheticLambda1;-><init>(Lcom/trimline/metrocrew/types_dao_Impl;Lcom/trimline/metrocrew/types;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 126
    return-void
.end method

.method synthetic lambda$delete$1$com-trimline-metrocrew-types_dao_Impl(Lcom/trimline/metrocrew/types;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/types;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 131
    iget-object v0, p0, Lcom/trimline/metrocrew/types_dao_Impl;->__deleteAdapterOftypes:Landroidx/room/EntityDeleteOrUpdateAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityDeleteOrUpdateAdapter;->handle(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)I

    .line 132
    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$insert$0$com-trimline-metrocrew-types_dao_Impl(Lcom/trimline/metrocrew/types;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/types;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 123
    iget-object v0, p0, Lcom/trimline/metrocrew/types_dao_Impl;->__insertAdapterOftypes:Landroidx/room/EntityInsertAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityInsertAdapter;->insert(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)V

    .line 124
    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$update$2$com-trimline-metrocrew-types_dao_Impl(Lcom/trimline/metrocrew/types;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/types;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 139
    iget-object v0, p0, Lcom/trimline/metrocrew/types_dao_Impl;->__updateAdapterOftypes:Landroidx/room/EntityDeleteOrUpdateAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityDeleteOrUpdateAdapter;->handle(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)I

    .line 140
    const/4 v0, 0x0

    return-object v0
.end method

.method update(Lcom/trimline/metrocrew/types;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/types;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 138
    iget-object v0, p0, Lcom/trimline/metrocrew/types_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/types_dao_Impl$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/types_dao_Impl$$ExternalSyntheticLambda4;-><init>(Lcom/trimline/metrocrew/types_dao_Impl;Lcom/trimline/metrocrew/types;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 142
    return-void
.end method
