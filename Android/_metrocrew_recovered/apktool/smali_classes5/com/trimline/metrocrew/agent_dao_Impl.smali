.class public final Lcom/trimline/metrocrew/agent_dao_Impl;
.super Lcom/trimline/metrocrew/agent$dao;
.source "agent_dao_Impl.java"


# instance fields
.field private final __db:Landroidx/room/RoomDatabase;

.field private final __deleteAdapterOfagent:Landroidx/room/EntityDeleteOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeleteOrUpdateAdapter<",
            "Lcom/trimline/metrocrew/agent;",
            ">;"
        }
    .end annotation
.end field

.field private final __insertAdapterOfagent:Landroidx/room/EntityInsertAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityInsertAdapter<",
            "Lcom/trimline/metrocrew/agent;",
            ">;"
        }
    .end annotation
.end field

.field private final __updateAdapterOfagent:Landroidx/room/EntityDeleteOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeleteOrUpdateAdapter<",
            "Lcom/trimline/metrocrew/agent;",
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
    invoke-direct {p0}, Lcom/trimline/metrocrew/agent$dao;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/trimline/metrocrew/agent_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    .line 30
    new-instance v0, Lcom/trimline/metrocrew/agent_dao_Impl$1;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/agent_dao_Impl$1;-><init>(Lcom/trimline/metrocrew/agent_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/agent_dao_Impl;->__insertAdapterOfagent:Landroidx/room/EntityInsertAdapter;

    .line 79
    new-instance v0, Lcom/trimline/metrocrew/agent_dao_Impl$2;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/agent_dao_Impl$2;-><init>(Lcom/trimline/metrocrew/agent_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/agent_dao_Impl;->__deleteAdapterOfagent:Landroidx/room/EntityDeleteOrUpdateAdapter;

    .line 95
    new-instance v0, Lcom/trimline/metrocrew/agent_dao_Impl$3;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/agent_dao_Impl$3;-><init>(Lcom/trimline/metrocrew/agent_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/agent_dao_Impl;->__updateAdapterOfagent:Landroidx/room/EntityDeleteOrUpdateAdapter;

    .line 149
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

    .line 323
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$getagent$4(Ljava/lang/String;Ljava/lang/String;Landroidx/sqlite/SQLiteConnection;)Lcom/trimline/metrocrew/agent;
    .locals 18
    .param p0, "agentcode"    # Ljava/lang/String;
    .param p1, "pass"    # Ljava/lang/String;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 246
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    const-string v0, "Select * from agent where Agent_Code =? and Password=?"

    move-object/from16 v3, p2

    invoke-interface {v3, v0}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v4

    .line 248
    .local v4, "_stmt":Landroidx/sqlite/SQLiteStatement;
    const/4 v0, 0x1

    .line 249
    .local v0, "_argIndex":I
    if-nez v1, :cond_0

    .line 250
    :try_start_0
    invoke-interface {v4, v0}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 252
    :cond_0
    invoke-interface {v4, v0, v1}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 254
    :goto_0
    const/4 v0, 0x2

    .line 255
    if-nez v2, :cond_1

    .line 256
    invoke-interface {v4, v0}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 258
    :cond_1
    invoke-interface {v4, v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 260
    :goto_1
    const-string v5, "Agent_Code"

    invoke-static {v4, v5}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v5

    .line 261
    .local v5, "_columnIndexOfAgentCode":I
    const-string v6, "Customer_ID_No"

    invoke-static {v4, v6}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v6

    .line 262
    .local v6, "_columnIndexOfCustomerIDNo":I
    const-string v7, "Mobile_No"

    invoke-static {v4, v7}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v7

    .line 263
    .local v7, "_columnIndexOfMobileNo":I
    const-string v8, "Status"

    invoke-static {v4, v8}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v8

    .line 264
    .local v8, "_columnIndexOfStatus":I
    const-string v9, "Name"

    invoke-static {v4, v9}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v9

    .line 265
    .local v9, "_columnIndexOfName":I
    const-string v10, "Account"

    invoke-static {v4, v10}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v10

    .line 266
    .local v10, "_columnIndexOfAccount":I
    const-string v11, "Password"

    invoke-static {v4, v11}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v11

    .line 267
    .local v11, "_columnIndexOfPassword":I
    const-string v12, "Constituency"

    invoke-static {v4, v12}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v12

    .line 268
    .local v12, "_columnIndexOfConstituency":I
    const-string v13, "Account_type"

    invoke-static {v4, v13}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v13

    .line 269
    .local v13, "_columnIndexOfAccountType":I
    const-string v14, "Balance"

    invoke-static {v4, v14}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v14

    .line 271
    .local v14, "_columnIndexOfBalance":I
    invoke-interface {v4}, Landroidx/sqlite/SQLiteStatement;->step()Z

    move-result v15

    if-eqz v15, :cond_9

    .line 272
    new-instance v15, Lcom/trimline/metrocrew/agent;

    invoke-direct {v15}, Lcom/trimline/metrocrew/agent;-><init>()V

    .line 273
    .local v15, "_result":Lcom/trimline/metrocrew/agent;
    invoke-interface {v4, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v16

    move/from16 v17, v0

    .end local v0    # "_argIndex":I
    .local v17, "_argIndex":I
    const/4 v0, 0x0

    if-eqz v16, :cond_2

    .line 274
    iput-object v0, v15, Lcom/trimline/metrocrew/agent;->Agent_Code:Ljava/lang/String;

    goto :goto_2

    .line 276
    :cond_2
    invoke-interface {v4, v5}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v15, Lcom/trimline/metrocrew/agent;->Agent_Code:Ljava/lang/String;

    .line 278
    :goto_2
    invoke-interface {v4, v6}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 279
    const/4 v0, 0x0

    iput-object v0, v15, Lcom/trimline/metrocrew/agent;->Customer_ID_No:Ljava/lang/String;

    goto :goto_3

    .line 281
    :cond_3
    invoke-interface {v4, v6}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v15, Lcom/trimline/metrocrew/agent;->Customer_ID_No:Ljava/lang/String;

    .line 283
    :goto_3
    invoke-interface {v4, v7}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 284
    const/4 v0, 0x0

    iput-object v0, v15, Lcom/trimline/metrocrew/agent;->Mobile_No:Ljava/lang/String;

    goto :goto_4

    .line 286
    :cond_4
    invoke-interface {v4, v7}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v15, Lcom/trimline/metrocrew/agent;->Mobile_No:Ljava/lang/String;

    .line 288
    :goto_4
    invoke-interface {v4, v8}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v0

    long-to-int v0, v0

    iput v0, v15, Lcom/trimline/metrocrew/agent;->Status:I

    .line 289
    invoke-interface {v4, v9}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 290
    const/4 v0, 0x0

    iput-object v0, v15, Lcom/trimline/metrocrew/agent;->Name:Ljava/lang/String;

    goto :goto_5

    .line 292
    :cond_5
    invoke-interface {v4, v9}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v15, Lcom/trimline/metrocrew/agent;->Name:Ljava/lang/String;

    .line 294
    :goto_5
    invoke-interface {v4, v10}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 295
    const/4 v0, 0x0

    iput-object v0, v15, Lcom/trimline/metrocrew/agent;->Account:Ljava/lang/String;

    goto :goto_6

    .line 297
    :cond_6
    invoke-interface {v4, v10}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v15, Lcom/trimline/metrocrew/agent;->Account:Ljava/lang/String;

    .line 299
    :goto_6
    invoke-interface {v4, v11}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 300
    const/4 v0, 0x0

    iput-object v0, v15, Lcom/trimline/metrocrew/agent;->Password:Ljava/lang/String;

    goto :goto_7

    .line 302
    :cond_7
    invoke-interface {v4, v11}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v15, Lcom/trimline/metrocrew/agent;->Password:Ljava/lang/String;

    .line 304
    :goto_7
    invoke-interface {v4, v12}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 305
    const/4 v0, 0x0

    iput-object v0, v15, Lcom/trimline/metrocrew/agent;->Constituency:Ljava/lang/String;

    goto :goto_8

    .line 307
    :cond_8
    invoke-interface {v4, v12}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v15, Lcom/trimline/metrocrew/agent;->Constituency:Ljava/lang/String;

    .line 309
    :goto_8
    invoke-interface {v4, v13}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v0

    long-to-int v0, v0

    iput v0, v15, Lcom/trimline/metrocrew/agent;->Account_type:I

    .line 310
    invoke-interface {v4, v14}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v0

    iput-wide v0, v15, Lcom/trimline/metrocrew/agent;->Balance:D
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_9

    .line 312
    .end local v15    # "_result":Lcom/trimline/metrocrew/agent;
    .end local v17    # "_argIndex":I
    .restart local v0    # "_argIndex":I
    :cond_9
    move/from16 v17, v0

    .end local v0    # "_argIndex":I
    .restart local v17    # "_argIndex":I
    const/4 v15, 0x0

    .line 314
    .restart local v15    # "_result":Lcom/trimline/metrocrew/agent;
    :goto_9
    nop

    .line 316
    invoke-interface {v4}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 314
    return-object v15

    .line 316
    .end local v5    # "_columnIndexOfAgentCode":I
    .end local v6    # "_columnIndexOfCustomerIDNo":I
    .end local v7    # "_columnIndexOfMobileNo":I
    .end local v8    # "_columnIndexOfStatus":I
    .end local v9    # "_columnIndexOfName":I
    .end local v10    # "_columnIndexOfAccount":I
    .end local v11    # "_columnIndexOfPassword":I
    .end local v12    # "_columnIndexOfConstituency":I
    .end local v13    # "_columnIndexOfAccountType":I
    .end local v14    # "_columnIndexOfBalance":I
    .end local v15    # "_result":Lcom/trimline/metrocrew/agent;
    .end local v17    # "_argIndex":I
    :catchall_0
    move-exception v0

    invoke-interface {v4}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 317
    throw v0
.end method

.method static synthetic lambda$getagents$3(Landroidx/sqlite/SQLiteConnection;)Ljava/util/List;
    .locals 16
    .param p0, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 179
    const-string v0, "SELECT * FROM agent"

    move-object/from16 v1, p0

    invoke-interface {v1, v0}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v2

    .line 181
    .local v2, "_stmt":Landroidx/sqlite/SQLiteStatement;
    :try_start_0
    const-string v0, "Agent_Code"

    invoke-static {v2, v0}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v0

    .line 182
    .local v0, "_columnIndexOfAgentCode":I
    const-string v3, "Customer_ID_No"

    invoke-static {v2, v3}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v3

    .line 183
    .local v3, "_columnIndexOfCustomerIDNo":I
    const-string v4, "Mobile_No"

    invoke-static {v2, v4}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v4

    .line 184
    .local v4, "_columnIndexOfMobileNo":I
    const-string v5, "Status"

    invoke-static {v2, v5}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v5

    .line 185
    .local v5, "_columnIndexOfStatus":I
    const-string v6, "Name"

    invoke-static {v2, v6}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v6

    .line 186
    .local v6, "_columnIndexOfName":I
    const-string v7, "Account"

    invoke-static {v2, v7}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v7

    .line 187
    .local v7, "_columnIndexOfAccount":I
    const-string v8, "Password"

    invoke-static {v2, v8}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v8

    .line 188
    .local v8, "_columnIndexOfPassword":I
    const-string v9, "Constituency"

    invoke-static {v2, v9}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v9

    .line 189
    .local v9, "_columnIndexOfConstituency":I
    const-string v10, "Account_type"

    invoke-static {v2, v10}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v10

    .line 190
    .local v10, "_columnIndexOfAccountType":I
    const-string v11, "Balance"

    invoke-static {v2, v11}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v11

    .line 191
    .local v11, "_columnIndexOfBalance":I
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 192
    .local v12, "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/agent;>;"
    :goto_0
    invoke-interface {v2}, Landroidx/sqlite/SQLiteStatement;->step()Z

    move-result v13

    if-eqz v13, :cond_7

    .line 194
    new-instance v13, Lcom/trimline/metrocrew/agent;

    invoke-direct {v13}, Lcom/trimline/metrocrew/agent;-><init>()V

    .line 195
    .local v13, "_item":Lcom/trimline/metrocrew/agent;
    invoke-interface {v2, v0}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    const/4 v15, 0x0

    if-eqz v14, :cond_0

    .line 196
    iput-object v15, v13, Lcom/trimline/metrocrew/agent;->Agent_Code:Ljava/lang/String;

    goto :goto_1

    .line 198
    :cond_0
    invoke-interface {v2, v0}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v13, Lcom/trimline/metrocrew/agent;->Agent_Code:Ljava/lang/String;

    .line 200
    :goto_1
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_1

    .line 201
    iput-object v15, v13, Lcom/trimline/metrocrew/agent;->Customer_ID_No:Ljava/lang/String;

    goto :goto_2

    .line 203
    :cond_1
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v13, Lcom/trimline/metrocrew/agent;->Customer_ID_No:Ljava/lang/String;

    .line 205
    :goto_2
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 206
    iput-object v15, v13, Lcom/trimline/metrocrew/agent;->Mobile_No:Ljava/lang/String;

    goto :goto_3

    .line 208
    :cond_2
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v13, Lcom/trimline/metrocrew/agent;->Mobile_No:Ljava/lang/String;

    .line 210
    :goto_3
    move v14, v0

    .end local v0    # "_columnIndexOfAgentCode":I
    .local v14, "_columnIndexOfAgentCode":I
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v0

    long-to-int v0, v0

    iput v0, v13, Lcom/trimline/metrocrew/agent;->Status:I

    .line 211
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 212
    iput-object v15, v13, Lcom/trimline/metrocrew/agent;->Name:Ljava/lang/String;

    goto :goto_4

    .line 214
    :cond_3
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v13, Lcom/trimline/metrocrew/agent;->Name:Ljava/lang/String;

    .line 216
    :goto_4
    invoke-interface {v2, v7}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 217
    iput-object v15, v13, Lcom/trimline/metrocrew/agent;->Account:Ljava/lang/String;

    goto :goto_5

    .line 219
    :cond_4
    invoke-interface {v2, v7}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v13, Lcom/trimline/metrocrew/agent;->Account:Ljava/lang/String;

    .line 221
    :goto_5
    invoke-interface {v2, v8}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 222
    iput-object v15, v13, Lcom/trimline/metrocrew/agent;->Password:Ljava/lang/String;

    goto :goto_6

    .line 224
    :cond_5
    invoke-interface {v2, v8}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v13, Lcom/trimline/metrocrew/agent;->Password:Ljava/lang/String;

    .line 226
    :goto_6
    invoke-interface {v2, v9}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 227
    iput-object v15, v13, Lcom/trimline/metrocrew/agent;->Constituency:Ljava/lang/String;

    goto :goto_7

    .line 229
    :cond_6
    invoke-interface {v2, v9}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v13, Lcom/trimline/metrocrew/agent;->Constituency:Ljava/lang/String;

    .line 231
    :goto_7
    invoke-interface {v2, v10}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v0

    long-to-int v0, v0

    iput v0, v13, Lcom/trimline/metrocrew/agent;->Account_type:I

    .line 232
    invoke-interface {v2, v11}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v0

    iput-wide v0, v13, Lcom/trimline/metrocrew/agent;->Balance:D

    .line 233
    invoke-interface {v12, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 234
    move-object/from16 v1, p0

    move v0, v14

    .end local v13    # "_item":Lcom/trimline/metrocrew/agent;
    goto/16 :goto_0

    .line 235
    .end local v14    # "_columnIndexOfAgentCode":I
    .restart local v0    # "_columnIndexOfAgentCode":I
    :cond_7
    nop

    .line 237
    invoke-interface {v2}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 235
    return-object v12

    .line 237
    .end local v0    # "_columnIndexOfAgentCode":I
    .end local v3    # "_columnIndexOfCustomerIDNo":I
    .end local v4    # "_columnIndexOfMobileNo":I
    .end local v5    # "_columnIndexOfStatus":I
    .end local v6    # "_columnIndexOfName":I
    .end local v7    # "_columnIndexOfAccount":I
    .end local v8    # "_columnIndexOfPassword":I
    .end local v9    # "_columnIndexOfConstituency":I
    .end local v10    # "_columnIndexOfAccountType":I
    .end local v11    # "_columnIndexOfBalance":I
    .end local v12    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/agent;>;"
    :catchall_0
    move-exception v0

    invoke-interface {v2}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 238
    throw v0
.end method


# virtual methods
.method delete(Lcom/trimline/metrocrew/agent;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/agent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 161
    iget-object v0, p0, Lcom/trimline/metrocrew/agent_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/agent_dao_Impl$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/agent_dao_Impl$$ExternalSyntheticLambda4;-><init>(Lcom/trimline/metrocrew/agent_dao_Impl;Lcom/trimline/metrocrew/agent;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 165
    return-void
.end method

.method getagent(Ljava/lang/String;Ljava/lang/String;)Lcom/trimline/metrocrew/agent;
    .locals 5
    .param p1, "agentcode"    # Ljava/lang/String;
    .param p2, "pass"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "agentcode",
            "pass"
        }
    .end annotation

    .line 244
    const-string v0, "Select * from agent where Agent_Code =? and Password=?"

    .line 245
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/trimline/metrocrew/agent_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v2, Lcom/trimline/metrocrew/agent_dao_Impl$$ExternalSyntheticLambda2;

    invoke-direct {v2, p1, p2}, Lcom/trimline/metrocrew/agent_dao_Impl$$ExternalSyntheticLambda2;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v1, v3, v4, v2}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trimline/metrocrew/agent;

    return-object v1
.end method

.method getagents()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/agent;",
            ">;"
        }
    .end annotation

    .line 177
    const-string v0, "SELECT * FROM agent"

    .line 178
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/trimline/metrocrew/agent_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v2, Lcom/trimline/metrocrew/agent_dao_Impl$$ExternalSyntheticLambda1;

    invoke-direct {v2}, Lcom/trimline/metrocrew/agent_dao_Impl$$ExternalSyntheticLambda1;-><init>()V

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v1, v3, v4, v2}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    return-object v1
.end method

.method insert(Lcom/trimline/metrocrew/agent;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/agent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 153
    iget-object v0, p0, Lcom/trimline/metrocrew/agent_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/agent_dao_Impl$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/agent_dao_Impl$$ExternalSyntheticLambda3;-><init>(Lcom/trimline/metrocrew/agent_dao_Impl;Lcom/trimline/metrocrew/agent;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 157
    return-void
.end method

.method synthetic lambda$delete$1$com-trimline-metrocrew-agent_dao_Impl(Lcom/trimline/metrocrew/agent;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/agent;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 162
    iget-object v0, p0, Lcom/trimline/metrocrew/agent_dao_Impl;->__deleteAdapterOfagent:Landroidx/room/EntityDeleteOrUpdateAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityDeleteOrUpdateAdapter;->handle(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)I

    .line 163
    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$insert$0$com-trimline-metrocrew-agent_dao_Impl(Lcom/trimline/metrocrew/agent;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/agent;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 154
    iget-object v0, p0, Lcom/trimline/metrocrew/agent_dao_Impl;->__insertAdapterOfagent:Landroidx/room/EntityInsertAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityInsertAdapter;->insert(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)V

    .line 155
    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$update$2$com-trimline-metrocrew-agent_dao_Impl(Lcom/trimline/metrocrew/agent;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/agent;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 170
    iget-object v0, p0, Lcom/trimline/metrocrew/agent_dao_Impl;->__updateAdapterOfagent:Landroidx/room/EntityDeleteOrUpdateAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityDeleteOrUpdateAdapter;->handle(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)I

    .line 171
    const/4 v0, 0x0

    return-object v0
.end method

.method update(Lcom/trimline/metrocrew/agent;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/agent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 169
    iget-object v0, p0, Lcom/trimline/metrocrew/agent_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/agent_dao_Impl$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/agent_dao_Impl$$ExternalSyntheticLambda0;-><init>(Lcom/trimline/metrocrew/agent_dao_Impl;Lcom/trimline/metrocrew/agent;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 173
    return-void
.end method
