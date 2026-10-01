.class public final Lcom/trimline/metrocrew/loan_dao_Impl;
.super Lcom/trimline/metrocrew/loan$dao;
.source "loan_dao_Impl.java"


# instance fields
.field private final __db:Landroidx/room/RoomDatabase;

.field private final __deleteAdapterOfloan:Landroidx/room/EntityDeleteOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeleteOrUpdateAdapter<",
            "Lcom/trimline/metrocrew/loan;",
            ">;"
        }
    .end annotation
.end field

.field private final __insertAdapterOfloan:Landroidx/room/EntityInsertAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityInsertAdapter<",
            "Lcom/trimline/metrocrew/loan;",
            ">;"
        }
    .end annotation
.end field

.field private final __updateAdapterOfloan:Landroidx/room/EntityDeleteOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeleteOrUpdateAdapter<",
            "Lcom/trimline/metrocrew/loan;",
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
    invoke-direct {p0}, Lcom/trimline/metrocrew/loan$dao;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/trimline/metrocrew/loan_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    .line 30
    new-instance v0, Lcom/trimline/metrocrew/loan_dao_Impl$1;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/loan_dao_Impl$1;-><init>(Lcom/trimline/metrocrew/loan_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/loan_dao_Impl;->__insertAdapterOfloan:Landroidx/room/EntityInsertAdapter;

    .line 71
    new-instance v0, Lcom/trimline/metrocrew/loan_dao_Impl$2;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/loan_dao_Impl$2;-><init>(Lcom/trimline/metrocrew/loan_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/loan_dao_Impl;->__deleteAdapterOfloan:Landroidx/room/EntityDeleteOrUpdateAdapter;

    .line 87
    new-instance v0, Lcom/trimline/metrocrew/loan_dao_Impl$3;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/loan_dao_Impl$3;-><init>(Lcom/trimline/metrocrew/loan_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/loan_dao_Impl;->__updateAdapterOfloan:Landroidx/room/EntityDeleteOrUpdateAdapter;

    .line 133
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

    .line 297
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$getall$3(Landroidx/sqlite/SQLiteConnection;)Ljava/util/List;
    .locals 13
    .param p0, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 163
    const-string v0, "select * from loan"

    invoke-interface {p0, v0}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v0

    .line 165
    .local v0, "_stmt":Landroidx/sqlite/SQLiteStatement;
    :try_start_0
    const-string v1, "Loan_No"

    invoke-static {v0, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 166
    .local v1, "_columnIndexOfLoanNo":I
    const-string v2, "Application_Date"

    invoke-static {v0, v2}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v2

    .line 167
    .local v2, "_columnIndexOfApplicationDate":I
    const-string v3, "Loan_Product_Type"

    invoke-static {v0, v3}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v3

    .line 168
    .local v3, "_columnIndexOfLoanProductType":I
    const-string v4, "Client_Code"

    invoke-static {v0, v4}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v4

    .line 169
    .local v4, "_columnIndexOfClientCode":I
    const-string v5, "Balance"

    invoke-static {v0, v5}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v5

    .line 170
    .local v5, "_columnIndexOfBalance":I
    const-string v6, "Loan_Product_Type_Name"

    invoke-static {v0, v6}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v6

    .line 171
    .local v6, "_columnIndexOfLoanProductTypeName":I
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 172
    .local v7, "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/loan;>;"
    :goto_0
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->step()Z

    move-result v8

    if-eqz v8, :cond_6

    .line 174
    new-instance v8, Lcom/trimline/metrocrew/loan;

    invoke-direct {v8}, Lcom/trimline/metrocrew/loan;-><init>()V

    .line 175
    .local v8, "_item":Lcom/trimline/metrocrew/loan;
    invoke-interface {v0, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v9

    const/4 v10, 0x0

    if-eqz v9, :cond_0

    .line 176
    iput-object v10, v8, Lcom/trimline/metrocrew/loan;->Loan_No:Ljava/lang/String;

    goto :goto_1

    .line 178
    :cond_0
    invoke-interface {v0, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v9

    iput-object v9, v8, Lcom/trimline/metrocrew/loan;->Loan_No:Ljava/lang/String;

    .line 180
    :goto_1
    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 181
    iput-object v10, v8, Lcom/trimline/metrocrew/loan;->Application_Date:Ljava/lang/String;

    goto :goto_2

    .line 183
    :cond_1
    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v9

    iput-object v9, v8, Lcom/trimline/metrocrew/loan;->Application_Date:Ljava/lang/String;

    .line 185
    :goto_2
    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 186
    iput-object v10, v8, Lcom/trimline/metrocrew/loan;->Loan_Product_Type:Ljava/lang/String;

    goto :goto_3

    .line 188
    :cond_2
    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v9

    iput-object v9, v8, Lcom/trimline/metrocrew/loan;->Loan_Product_Type:Ljava/lang/String;

    .line 190
    :goto_3
    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 191
    iput-object v10, v8, Lcom/trimline/metrocrew/loan;->Client_Code:Ljava/lang/String;

    goto :goto_4

    .line 193
    :cond_3
    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v9

    iput-object v9, v8, Lcom/trimline/metrocrew/loan;->Client_Code:Ljava/lang/String;

    .line 195
    :goto_4
    invoke-interface {v0, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 196
    iput-object v10, v8, Lcom/trimline/metrocrew/loan;->Balance:Ljava/lang/Double;

    goto :goto_5

    .line 198
    :cond_4
    invoke-interface {v0, v5}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v9

    iput-object v9, v8, Lcom/trimline/metrocrew/loan;->Balance:Ljava/lang/Double;

    .line 200
    :goto_5
    invoke-interface {v0, v6}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 201
    iput-object v10, v8, Lcom/trimline/metrocrew/loan;->Loan_Product_Type_Name:Ljava/lang/String;

    goto :goto_6

    .line 203
    :cond_5
    invoke-interface {v0, v6}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v9

    iput-object v9, v8, Lcom/trimline/metrocrew/loan;->Loan_Product_Type_Name:Ljava/lang/String;

    .line 205
    :goto_6
    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 206
    nop

    .end local v8    # "_item":Lcom/trimline/metrocrew/loan;
    goto :goto_0

    .line 207
    :cond_6
    nop

    .line 209
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 207
    return-object v7

    .line 209
    .end local v1    # "_columnIndexOfLoanNo":I
    .end local v2    # "_columnIndexOfApplicationDate":I
    .end local v3    # "_columnIndexOfLoanProductType":I
    .end local v4    # "_columnIndexOfClientCode":I
    .end local v5    # "_columnIndexOfBalance":I
    .end local v6    # "_columnIndexOfLoanProductTypeName":I
    .end local v7    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/loan;>;"
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 210
    throw v1
.end method

.method static synthetic lambda$getmemberloans$4(Ljava/lang/String;Landroidx/sqlite/SQLiteConnection;)Ljava/util/List;
    .locals 14
    .param p0, "member"    # Ljava/lang/String;
    .param p1, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 218
    const-string v0, "select * from loan where Client_Code=?"

    invoke-interface {p1, v0}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v0

    .line 220
    .local v0, "_stmt":Landroidx/sqlite/SQLiteStatement;
    const/4 v1, 0x1

    .line 221
    .local v1, "_argIndex":I
    if-nez p0, :cond_0

    .line 222
    :try_start_0
    invoke-interface {v0, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 224
    :cond_0
    invoke-interface {v0, v1, p0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 226
    :goto_0
    const-string v2, "Loan_No"

    invoke-static {v0, v2}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v2

    .line 227
    .local v2, "_columnIndexOfLoanNo":I
    const-string v3, "Application_Date"

    invoke-static {v0, v3}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v3

    .line 228
    .local v3, "_columnIndexOfApplicationDate":I
    const-string v4, "Loan_Product_Type"

    invoke-static {v0, v4}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v4

    .line 229
    .local v4, "_columnIndexOfLoanProductType":I
    const-string v5, "Client_Code"

    invoke-static {v0, v5}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v5

    .line 230
    .local v5, "_columnIndexOfClientCode":I
    const-string v6, "Balance"

    invoke-static {v0, v6}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v6

    .line 231
    .local v6, "_columnIndexOfBalance":I
    const-string v7, "Loan_Product_Type_Name"

    invoke-static {v0, v7}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v7

    .line 232
    .local v7, "_columnIndexOfLoanProductTypeName":I
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 233
    .local v8, "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/loan;>;"
    :goto_1
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->step()Z

    move-result v9

    if-eqz v9, :cond_7

    .line 235
    new-instance v9, Lcom/trimline/metrocrew/loan;

    invoke-direct {v9}, Lcom/trimline/metrocrew/loan;-><init>()V

    .line 236
    .local v9, "_item":Lcom/trimline/metrocrew/loan;
    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v10

    const/4 v11, 0x0

    if-eqz v10, :cond_1

    .line 237
    iput-object v11, v9, Lcom/trimline/metrocrew/loan;->Loan_No:Ljava/lang/String;

    goto :goto_2

    .line 239
    :cond_1
    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Lcom/trimline/metrocrew/loan;->Loan_No:Ljava/lang/String;

    .line 241
    :goto_2
    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_2

    .line 242
    iput-object v11, v9, Lcom/trimline/metrocrew/loan;->Application_Date:Ljava/lang/String;

    goto :goto_3

    .line 244
    :cond_2
    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Lcom/trimline/metrocrew/loan;->Application_Date:Ljava/lang/String;

    .line 246
    :goto_3
    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_3

    .line 247
    iput-object v11, v9, Lcom/trimline/metrocrew/loan;->Loan_Product_Type:Ljava/lang/String;

    goto :goto_4

    .line 249
    :cond_3
    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Lcom/trimline/metrocrew/loan;->Loan_Product_Type:Ljava/lang/String;

    .line 251
    :goto_4
    invoke-interface {v0, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_4

    .line 252
    iput-object v11, v9, Lcom/trimline/metrocrew/loan;->Client_Code:Ljava/lang/String;

    goto :goto_5

    .line 254
    :cond_4
    invoke-interface {v0, v5}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Lcom/trimline/metrocrew/loan;->Client_Code:Ljava/lang/String;

    .line 256
    :goto_5
    invoke-interface {v0, v6}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_5

    .line 257
    iput-object v11, v9, Lcom/trimline/metrocrew/loan;->Balance:Ljava/lang/Double;

    goto :goto_6

    .line 259
    :cond_5
    invoke-interface {v0, v6}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v10

    iput-object v10, v9, Lcom/trimline/metrocrew/loan;->Balance:Ljava/lang/Double;

    .line 261
    :goto_6
    invoke-interface {v0, v7}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 262
    iput-object v11, v9, Lcom/trimline/metrocrew/loan;->Loan_Product_Type_Name:Ljava/lang/String;

    goto :goto_7

    .line 264
    :cond_6
    invoke-interface {v0, v7}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Lcom/trimline/metrocrew/loan;->Loan_Product_Type_Name:Ljava/lang/String;

    .line 266
    :goto_7
    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 267
    nop

    .end local v9    # "_item":Lcom/trimline/metrocrew/loan;
    goto :goto_1

    .line 268
    :cond_7
    nop

    .line 270
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 268
    return-object v8

    .line 270
    .end local v1    # "_argIndex":I
    .end local v2    # "_columnIndexOfLoanNo":I
    .end local v3    # "_columnIndexOfApplicationDate":I
    .end local v4    # "_columnIndexOfLoanProductType":I
    .end local v5    # "_columnIndexOfClientCode":I
    .end local v6    # "_columnIndexOfBalance":I
    .end local v7    # "_columnIndexOfLoanProductTypeName":I
    .end local v8    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/loan;>;"
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 271
    throw v1
.end method

.method static synthetic lambda$removelclientloans$5(Ljava/lang/String;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 3
    .param p0, "no"    # Ljava/lang/String;
    .param p1, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 279
    const-string v0, "delete from loan where Client_Code=?"

    invoke-interface {p1, v0}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v0

    .line 281
    .local v0, "_stmt":Landroidx/sqlite/SQLiteStatement;
    const/4 v1, 0x1

    .line 282
    .local v1, "_argIndex":I
    if-nez p0, :cond_0

    .line 283
    :try_start_0
    invoke-interface {v0, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 285
    :cond_0
    invoke-interface {v0, v1, p0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 287
    :goto_0
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->step()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 288
    nop

    .line 290
    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 288
    const/4 v2, 0x0

    return-object v2

    .line 290
    .end local v1    # "_argIndex":I
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 291
    throw v1
.end method


# virtual methods
.method delete(Lcom/trimline/metrocrew/loan;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/loan;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 145
    iget-object v0, p0, Lcom/trimline/metrocrew/loan_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/loan_dao_Impl$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/loan_dao_Impl$$ExternalSyntheticLambda2;-><init>(Lcom/trimline/metrocrew/loan_dao_Impl;Lcom/trimline/metrocrew/loan;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 149
    return-void
.end method

.method public getall()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/loan;",
            ">;"
        }
    .end annotation

    .line 161
    const-string v0, "select * from loan"

    .line 162
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/trimline/metrocrew/loan_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v2, Lcom/trimline/metrocrew/loan_dao_Impl$$ExternalSyntheticLambda5;

    invoke-direct {v2}, Lcom/trimline/metrocrew/loan_dao_Impl$$ExternalSyntheticLambda5;-><init>()V

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v1, v3, v4, v2}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    return-object v1
.end method

.method public getmemberloans(Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .param p1, "member"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "member"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/loan;",
            ">;"
        }
    .end annotation

    .line 216
    const-string v0, "select * from loan where Client_Code=?"

    .line 217
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/trimline/metrocrew/loan_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v2, Lcom/trimline/metrocrew/loan_dao_Impl$$ExternalSyntheticLambda3;

    invoke-direct {v2, p1}, Lcom/trimline/metrocrew/loan_dao_Impl$$ExternalSyntheticLambda3;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v1, v3, v4, v2}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    return-object v1
.end method

.method insert(Lcom/trimline/metrocrew/loan;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/loan;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 137
    iget-object v0, p0, Lcom/trimline/metrocrew/loan_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/loan_dao_Impl$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/loan_dao_Impl$$ExternalSyntheticLambda1;-><init>(Lcom/trimline/metrocrew/loan_dao_Impl;Lcom/trimline/metrocrew/loan;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 141
    return-void
.end method

.method synthetic lambda$delete$1$com-trimline-metrocrew-loan_dao_Impl(Lcom/trimline/metrocrew/loan;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/loan;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 146
    iget-object v0, p0, Lcom/trimline/metrocrew/loan_dao_Impl;->__deleteAdapterOfloan:Landroidx/room/EntityDeleteOrUpdateAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityDeleteOrUpdateAdapter;->handle(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)I

    .line 147
    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$insert$0$com-trimline-metrocrew-loan_dao_Impl(Lcom/trimline/metrocrew/loan;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/loan;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 138
    iget-object v0, p0, Lcom/trimline/metrocrew/loan_dao_Impl;->__insertAdapterOfloan:Landroidx/room/EntityInsertAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityInsertAdapter;->insert(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)V

    .line 139
    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$update$2$com-trimline-metrocrew-loan_dao_Impl(Lcom/trimline/metrocrew/loan;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/loan;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 154
    iget-object v0, p0, Lcom/trimline/metrocrew/loan_dao_Impl;->__updateAdapterOfloan:Landroidx/room/EntityDeleteOrUpdateAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityDeleteOrUpdateAdapter;->handle(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)I

    .line 155
    const/4 v0, 0x0

    return-object v0
.end method

.method public removelclientloans(Ljava/lang/String;)V
    .locals 5
    .param p1, "no"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "no"
        }
    .end annotation

    .line 277
    const-string v0, "delete from loan where Client_Code=?"

    .line 278
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/trimline/metrocrew/loan_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v2, Lcom/trimline/metrocrew/loan_dao_Impl$$ExternalSyntheticLambda0;

    invoke-direct {v2, p1}, Lcom/trimline/metrocrew/loan_dao_Impl$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;)V

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v1, v3, v4, v2}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 293
    return-void
.end method

.method update(Lcom/trimline/metrocrew/loan;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/loan;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 153
    iget-object v0, p0, Lcom/trimline/metrocrew/loan_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/loan_dao_Impl$$ExternalSyntheticLambda4;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/loan_dao_Impl$$ExternalSyntheticLambda4;-><init>(Lcom/trimline/metrocrew/loan_dao_Impl;Lcom/trimline/metrocrew/loan;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 157
    return-void
.end method
