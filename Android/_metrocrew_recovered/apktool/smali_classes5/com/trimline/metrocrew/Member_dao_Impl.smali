.class public final Lcom/trimline/metrocrew/Member_dao_Impl;
.super Lcom/trimline/metrocrew/Member$dao;
.source "Member_dao_Impl.java"


# instance fields
.field private final __db:Landroidx/room/RoomDatabase;

.field private final __deleteAdapterOfMember:Landroidx/room/EntityDeleteOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeleteOrUpdateAdapter<",
            "Lcom/trimline/metrocrew/Member;",
            ">;"
        }
    .end annotation
.end field

.field private final __insertAdapterOfMember:Landroidx/room/EntityInsertAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityInsertAdapter<",
            "Lcom/trimline/metrocrew/Member;",
            ">;"
        }
    .end annotation
.end field

.field private final __updateAdapterOfMember:Landroidx/room/EntityDeleteOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeleteOrUpdateAdapter<",
            "Lcom/trimline/metrocrew/Member;",
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
    invoke-direct {p0}, Lcom/trimline/metrocrew/Member$dao;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/trimline/metrocrew/Member_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    .line 30
    new-instance v0, Lcom/trimline/metrocrew/Member_dao_Impl$1;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/Member_dao_Impl$1;-><init>(Lcom/trimline/metrocrew/Member_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/Member_dao_Impl;->__insertAdapterOfMember:Landroidx/room/EntityInsertAdapter;

    .line 66
    new-instance v0, Lcom/trimline/metrocrew/Member_dao_Impl$2;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/Member_dao_Impl$2;-><init>(Lcom/trimline/metrocrew/Member_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/Member_dao_Impl;->__deleteAdapterOfMember:Landroidx/room/EntityDeleteOrUpdateAdapter;

    .line 82
    new-instance v0, Lcom/trimline/metrocrew/Member_dao_Impl$3;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/Member_dao_Impl$3;-><init>(Lcom/trimline/metrocrew/Member_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/Member_dao_Impl;->__updateAdapterOfMember:Landroidx/room/EntityDeleteOrUpdateAdapter;

    .line 123
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

    .line 204
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$getmembers$3(Landroidx/sqlite/SQLiteConnection;)Ljava/util/List;
    .locals 14
    .param p0, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 153
    const-string v0, "SELECT * FROM Member"

    invoke-interface {p0, v0}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v0

    .line 155
    .local v0, "_stmt":Landroidx/sqlite/SQLiteStatement;
    :try_start_0
    const-string v1, "No"

    invoke-static {v0, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 156
    .local v1, "_columnIndexOfNo":I
    const-string v2, "Name"

    invoke-static {v0, v2}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v2

    .line 157
    .local v2, "_columnIndexOfName":I
    const-string v3, "ID_No"

    invoke-static {v0, v3}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v3

    .line 158
    .local v3, "_columnIndexOfIDNo":I
    const-string v4, "Phone_No"

    invoke-static {v0, v4}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v4

    .line 159
    .local v4, "_columnIndexOfPhoneNo":I
    const-string v5, "Outstanding_Balance"

    invoke-static {v0, v5}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v5

    .line 160
    .local v5, "_columnIndexOfOutstandingBalance":I
    const-string v6, "Shares_Retained"

    invoke-static {v0, v6}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v6

    .line 161
    .local v6, "_columnIndexOfSharesRetained":I
    const-string v7, "Current_Shares"

    invoke-static {v0, v7}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v7

    .line 162
    .local v7, "_columnIndexOfCurrentShares":I
    const-string v8, "Current_Savings"

    invoke-static {v0, v8}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v8

    .line 163
    .local v8, "_columnIndexOfCurrentSavings":I
    const-string v9, "Registration_Fee_Paid"

    invoke-static {v0, v9}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v9

    .line 164
    .local v9, "_columnIndexOfRegistrationFeePaid":I
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 165
    .local v10, "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/Member;>;"
    :goto_0
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->step()Z

    move-result v11

    if-eqz v11, :cond_4

    .line 167
    new-instance v11, Lcom/trimline/metrocrew/Member;

    invoke-direct {v11}, Lcom/trimline/metrocrew/Member;-><init>()V

    .line 168
    .local v11, "_item":Lcom/trimline/metrocrew/Member;
    invoke-interface {v0, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v12

    const/4 v13, 0x0

    if-eqz v12, :cond_0

    .line 169
    iput-object v13, v11, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    goto :goto_1

    .line 171
    :cond_0
    invoke-interface {v0, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v11, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    .line 173
    :goto_1
    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 174
    iput-object v13, v11, Lcom/trimline/metrocrew/Member;->Name:Ljava/lang/String;

    goto :goto_2

    .line 176
    :cond_1
    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v11, Lcom/trimline/metrocrew/Member;->Name:Ljava/lang/String;

    .line 178
    :goto_2
    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 179
    iput-object v13, v11, Lcom/trimline/metrocrew/Member;->ID_No:Ljava/lang/String;

    goto :goto_3

    .line 181
    :cond_2
    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v11, Lcom/trimline/metrocrew/Member;->ID_No:Ljava/lang/String;

    .line 183
    :goto_3
    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 184
    iput-object v13, v11, Lcom/trimline/metrocrew/Member;->Phone_No:Ljava/lang/String;

    goto :goto_4

    .line 186
    :cond_3
    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v12

    iput-object v12, v11, Lcom/trimline/metrocrew/Member;->Phone_No:Ljava/lang/String;

    .line 188
    :goto_4
    invoke-interface {v0, v5}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v12

    iput-wide v12, v11, Lcom/trimline/metrocrew/Member;->Outstanding_Balance:D

    .line 189
    invoke-interface {v0, v6}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v12

    iput-wide v12, v11, Lcom/trimline/metrocrew/Member;->Shares_Retained:D

    .line 190
    invoke-interface {v0, v7}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v12

    iput-wide v12, v11, Lcom/trimline/metrocrew/Member;->Current_Shares:D

    .line 191
    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v12

    iput-wide v12, v11, Lcom/trimline/metrocrew/Member;->Current_Savings:D

    .line 192
    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v12

    iput-wide v12, v11, Lcom/trimline/metrocrew/Member;->Registration_Fee_Paid:D

    .line 193
    invoke-interface {v10, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 194
    nop

    .end local v11    # "_item":Lcom/trimline/metrocrew/Member;
    goto :goto_0

    .line 195
    :cond_4
    nop

    .line 197
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 195
    return-object v10

    .line 197
    .end local v1    # "_columnIndexOfNo":I
    .end local v2    # "_columnIndexOfName":I
    .end local v3    # "_columnIndexOfIDNo":I
    .end local v4    # "_columnIndexOfPhoneNo":I
    .end local v5    # "_columnIndexOfOutstandingBalance":I
    .end local v6    # "_columnIndexOfSharesRetained":I
    .end local v7    # "_columnIndexOfCurrentShares":I
    .end local v8    # "_columnIndexOfCurrentSavings":I
    .end local v9    # "_columnIndexOfRegistrationFeePaid":I
    .end local v10    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/Member;>;"
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 198
    throw v1
.end method


# virtual methods
.method delete(Lcom/trimline/metrocrew/Member;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/Member;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 135
    iget-object v0, p0, Lcom/trimline/metrocrew/Member_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/Member_dao_Impl$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/Member_dao_Impl$$ExternalSyntheticLambda2;-><init>(Lcom/trimline/metrocrew/Member_dao_Impl;Lcom/trimline/metrocrew/Member;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 139
    return-void
.end method

.method getmembers()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/Member;",
            ">;"
        }
    .end annotation

    .line 151
    const-string v0, "SELECT * FROM Member"

    .line 152
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/trimline/metrocrew/Member_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v2, Lcom/trimline/metrocrew/Member_dao_Impl$$ExternalSyntheticLambda1;

    invoke-direct {v2}, Lcom/trimline/metrocrew/Member_dao_Impl$$ExternalSyntheticLambda1;-><init>()V

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v1, v3, v4, v2}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    return-object v1
.end method

.method insert(Lcom/trimline/metrocrew/Member;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/Member;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 127
    iget-object v0, p0, Lcom/trimline/metrocrew/Member_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/Member_dao_Impl$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/Member_dao_Impl$$ExternalSyntheticLambda0;-><init>(Lcom/trimline/metrocrew/Member_dao_Impl;Lcom/trimline/metrocrew/Member;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 131
    return-void
.end method

.method synthetic lambda$delete$1$com-trimline-metrocrew-Member_dao_Impl(Lcom/trimline/metrocrew/Member;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/Member;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 136
    iget-object v0, p0, Lcom/trimline/metrocrew/Member_dao_Impl;->__deleteAdapterOfMember:Landroidx/room/EntityDeleteOrUpdateAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityDeleteOrUpdateAdapter;->handle(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)I

    .line 137
    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$insert$0$com-trimline-metrocrew-Member_dao_Impl(Lcom/trimline/metrocrew/Member;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/Member;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 128
    iget-object v0, p0, Lcom/trimline/metrocrew/Member_dao_Impl;->__insertAdapterOfMember:Landroidx/room/EntityInsertAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityInsertAdapter;->insert(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)V

    .line 129
    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$update$2$com-trimline-metrocrew-Member_dao_Impl(Lcom/trimline/metrocrew/Member;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/Member;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 144
    iget-object v0, p0, Lcom/trimline/metrocrew/Member_dao_Impl;->__updateAdapterOfMember:Landroidx/room/EntityDeleteOrUpdateAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityDeleteOrUpdateAdapter;->handle(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)I

    .line 145
    const/4 v0, 0x0

    return-object v0
.end method

.method update(Lcom/trimline/metrocrew/Member;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/Member;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 143
    iget-object v0, p0, Lcom/trimline/metrocrew/Member_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/Member_dao_Impl$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/Member_dao_Impl$$ExternalSyntheticLambda3;-><init>(Lcom/trimline/metrocrew/Member_dao_Impl;Lcom/trimline/metrocrew/Member;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 147
    return-void
.end method
