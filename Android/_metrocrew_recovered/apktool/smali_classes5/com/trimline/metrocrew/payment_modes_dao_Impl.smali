.class public final Lcom/trimline/metrocrew/payment_modes_dao_Impl;
.super Lcom/trimline/metrocrew/payment_modes$dao;
.source "payment_modes_dao_Impl.java"


# instance fields
.field private final __db:Landroidx/room/RoomDatabase;

.field private final __deleteAdapterOfpayment_modes:Landroidx/room/EntityDeleteOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeleteOrUpdateAdapter<",
            "Lcom/trimline/metrocrew/payment_modes;",
            ">;"
        }
    .end annotation
.end field

.field private final __insertAdapterOfpayment_modes:Landroidx/room/EntityInsertAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityInsertAdapter<",
            "Lcom/trimline/metrocrew/payment_modes;",
            ">;"
        }
    .end annotation
.end field

.field private final __updateAdapterOfpayment_modes:Landroidx/room/EntityDeleteOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeleteOrUpdateAdapter<",
            "Lcom/trimline/metrocrew/payment_modes;",
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

    .line 28
    invoke-direct {p0}, Lcom/trimline/metrocrew/payment_modes$dao;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/trimline/metrocrew/payment_modes_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    .line 30
    new-instance v0, Lcom/trimline/metrocrew/payment_modes_dao_Impl$1;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/payment_modes_dao_Impl$1;-><init>(Lcom/trimline/metrocrew/payment_modes_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/payment_modes_dao_Impl;->__insertAdapterOfpayment_modes:Landroidx/room/EntityInsertAdapter;

    .line 51
    new-instance v0, Lcom/trimline/metrocrew/payment_modes_dao_Impl$2;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/payment_modes_dao_Impl$2;-><init>(Lcom/trimline/metrocrew/payment_modes_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/payment_modes_dao_Impl;->__deleteAdapterOfpayment_modes:Landroidx/room/EntityDeleteOrUpdateAdapter;

    .line 67
    new-instance v0, Lcom/trimline/metrocrew/payment_modes_dao_Impl$3;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/payment_modes_dao_Impl$3;-><init>(Lcom/trimline/metrocrew/payment_modes_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/payment_modes_dao_Impl;->__updateAdapterOfpayment_modes:Landroidx/room/EntityDeleteOrUpdateAdapter;

    .line 93
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

    .line 166
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$deleteall$4(Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 2
    .param p0, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 154
    const-string v0, "delete from payment_modes"

    invoke-interface {p0, v0}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v0

    .line 156
    .local v0, "_stmt":Landroidx/sqlite/SQLiteStatement;
    :try_start_0
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->step()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 157
    nop

    .line 159
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 157
    const/4 v1, 0x0

    return-object v1

    .line 159
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 160
    throw v1
.end method

.method static synthetic lambda$getall$3(Landroidx/sqlite/SQLiteConnection;)Ljava/util/List;
    .locals 7
    .param p0, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 123
    const-string v0, "SELECT * FROM payment_modes"

    invoke-interface {p0, v0}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v0

    .line 125
    .local v0, "_stmt":Landroidx/sqlite/SQLiteStatement;
    :try_start_0
    const-string v1, "Code"

    invoke-static {v0, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 126
    .local v1, "_columnIndexOfCode":I
    const-string v2, "Name"

    invoke-static {v0, v2}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v2

    .line 127
    .local v2, "_columnIndexOfName":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 128
    .local v3, "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/payment_modes;>;"
    :goto_0
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->step()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 130
    new-instance v4, Lcom/trimline/metrocrew/payment_modes;

    invoke-direct {v4}, Lcom/trimline/metrocrew/payment_modes;-><init>()V

    .line 131
    .local v4, "_item":Lcom/trimline/metrocrew/payment_modes;
    invoke-interface {v0, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v5

    const/4 v6, 0x0

    if-eqz v5, :cond_0

    .line 132
    iput-object v6, v4, Lcom/trimline/metrocrew/payment_modes;->Code:Ljava/lang/String;

    goto :goto_1

    .line 134
    :cond_0
    invoke-interface {v0, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/trimline/metrocrew/payment_modes;->Code:Ljava/lang/String;

    .line 136
    :goto_1
    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 137
    iput-object v6, v4, Lcom/trimline/metrocrew/payment_modes;->Name:Ljava/lang/String;

    goto :goto_2

    .line 139
    :cond_1
    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lcom/trimline/metrocrew/payment_modes;->Name:Ljava/lang/String;

    .line 141
    :goto_2
    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 142
    nop

    .end local v4    # "_item":Lcom/trimline/metrocrew/payment_modes;
    goto :goto_0

    .line 143
    :cond_2
    nop

    .line 145
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 143
    return-object v3

    .line 145
    .end local v1    # "_columnIndexOfCode":I
    .end local v2    # "_columnIndexOfName":I
    .end local v3    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/payment_modes;>;"
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 146
    throw v1
.end method


# virtual methods
.method delete(Lcom/trimline/metrocrew/payment_modes;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/payment_modes;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 105
    iget-object v0, p0, Lcom/trimline/metrocrew/payment_modes_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/payment_modes_dao_Impl$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/payment_modes_dao_Impl$$ExternalSyntheticLambda0;-><init>(Lcom/trimline/metrocrew/payment_modes_dao_Impl;Lcom/trimline/metrocrew/payment_modes;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 109
    return-void
.end method

.method deleteall()V
    .locals 5

    .line 152
    const-string v0, "delete from payment_modes"

    .line 153
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/trimline/metrocrew/payment_modes_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v2, Lcom/trimline/metrocrew/payment_modes_dao_Impl$$ExternalSyntheticLambda3;

    invoke-direct {v2}, Lcom/trimline/metrocrew/payment_modes_dao_Impl$$ExternalSyntheticLambda3;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v1, v3, v4, v2}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 162
    return-void
.end method

.method getall()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/payment_modes;",
            ">;"
        }
    .end annotation

    .line 121
    const-string v0, "SELECT * FROM payment_modes"

    .line 122
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/trimline/metrocrew/payment_modes_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v2, Lcom/trimline/metrocrew/payment_modes_dao_Impl$$ExternalSyntheticLambda4;

    invoke-direct {v2}, Lcom/trimline/metrocrew/payment_modes_dao_Impl$$ExternalSyntheticLambda4;-><init>()V

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v1, v3, v4, v2}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    return-object v1
.end method

.method insert(Lcom/trimline/metrocrew/payment_modes;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/payment_modes;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 97
    iget-object v0, p0, Lcom/trimline/metrocrew/payment_modes_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/payment_modes_dao_Impl$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/payment_modes_dao_Impl$$ExternalSyntheticLambda1;-><init>(Lcom/trimline/metrocrew/payment_modes_dao_Impl;Lcom/trimline/metrocrew/payment_modes;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 101
    return-void
.end method

.method synthetic lambda$delete$1$com-trimline-metrocrew-payment_modes_dao_Impl(Lcom/trimline/metrocrew/payment_modes;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/payment_modes;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 106
    iget-object v0, p0, Lcom/trimline/metrocrew/payment_modes_dao_Impl;->__deleteAdapterOfpayment_modes:Landroidx/room/EntityDeleteOrUpdateAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityDeleteOrUpdateAdapter;->handle(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)I

    .line 107
    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$insert$0$com-trimline-metrocrew-payment_modes_dao_Impl(Lcom/trimline/metrocrew/payment_modes;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/payment_modes;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 98
    iget-object v0, p0, Lcom/trimline/metrocrew/payment_modes_dao_Impl;->__insertAdapterOfpayment_modes:Landroidx/room/EntityInsertAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityInsertAdapter;->insert(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)V

    .line 99
    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$update$2$com-trimline-metrocrew-payment_modes_dao_Impl(Lcom/trimline/metrocrew/payment_modes;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/payment_modes;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 114
    iget-object v0, p0, Lcom/trimline/metrocrew/payment_modes_dao_Impl;->__updateAdapterOfpayment_modes:Landroidx/room/EntityDeleteOrUpdateAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityDeleteOrUpdateAdapter;->handle(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)I

    .line 115
    const/4 v0, 0x0

    return-object v0
.end method

.method update(Lcom/trimline/metrocrew/payment_modes;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/payment_modes;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 113
    iget-object v0, p0, Lcom/trimline/metrocrew/payment_modes_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/payment_modes_dao_Impl$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/payment_modes_dao_Impl$$ExternalSyntheticLambda2;-><init>(Lcom/trimline/metrocrew/payment_modes_dao_Impl;Lcom/trimline/metrocrew/payment_modes;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 117
    return-void
.end method
