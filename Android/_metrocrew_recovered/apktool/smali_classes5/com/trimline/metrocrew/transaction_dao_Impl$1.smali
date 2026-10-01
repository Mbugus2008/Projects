.class Lcom/trimline/metrocrew/transaction_dao_Impl$1;
.super Landroidx/room/EntityInsertAdapter;
.source "transaction_dao_Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/transaction_dao_Impl;-><init>(Landroidx/room/RoomDatabase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/room/EntityInsertAdapter<",
        "Lcom/trimline/metrocrew/transaction;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/transaction_dao_Impl;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/transaction_dao_Impl;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/transaction_dao_Impl;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 34
    iput-object p1, p0, Lcom/trimline/metrocrew/transaction_dao_Impl$1;->this$0:Lcom/trimline/metrocrew/transaction_dao_Impl;

    invoke-direct {p0}, Landroidx/room/EntityInsertAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method protected bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/transaction;)V
    .locals 26
    .param p1, "statement"    # Landroidx/sqlite/SQLiteStatement;
    .param p2, "entity"    # Lcom/trimline/metrocrew/transaction;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "statement",
            "entity"
        }
    .end annotation

    .line 43
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Key:Ljava/lang/String;

    const/4 v3, 0x1

    if-nez v2, :cond_0

    .line 44
    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 46
    :cond_0
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Key:Ljava/lang/String;

    invoke-interface {v0, v3, v2}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 48
    :goto_0
    iget v2, v1, Lcom/trimline/metrocrew/transaction;->Entry_No:I

    int-to-long v2, v2

    const/4 v4, 0x2

    invoke-interface {v0, v4, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 49
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->No:Ljava/lang/String;

    const/4 v3, 0x3

    if-nez v2, :cond_1

    .line 50
    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 52
    :cond_1
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->No:Ljava/lang/String;

    invoke-interface {v0, v3, v2}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 54
    :goto_1
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Date:Ljava/sql/Date;

    invoke-static {v2}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v2

    .line 55
    .local v2, "_tmp":Ljava/lang/Long;
    const/4 v3, 0x4

    if-nez v2, :cond_2

    .line 56
    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2

    .line 58
    :cond_2
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-interface {v0, v3, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 60
    :goto_2
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Type:Ljava/lang/String;

    const/4 v4, 0x5

    if-nez v3, :cond_3

    .line 61
    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_3

    .line 63
    :cond_3
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Type:Ljava/lang/String;

    invoke-interface {v0, v4, v3}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 65
    :goto_3
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    const/4 v4, 0x6

    if-nez v3, :cond_4

    .line 66
    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4

    .line 68
    :cond_4
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    invoke-interface {v0, v4, v3}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 70
    :goto_4
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->PayMode:Ljava/lang/String;

    const/4 v4, 0x7

    if-nez v3, :cond_5

    .line 71
    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_5

    .line 73
    :cond_5
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->PayMode:Ljava/lang/String;

    invoke-interface {v0, v4, v3}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 75
    :goto_5
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Pay_Mode:Ljava/lang/String;

    const/16 v4, 0x8

    if-nez v3, :cond_6

    .line 76
    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_6

    .line 78
    :cond_6
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Pay_Mode:Ljava/lang/String;

    invoke-interface {v0, v4, v3}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 80
    :goto_6
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_No:Ljava/lang/String;

    const/16 v4, 0x9

    if-nez v3, :cond_7

    .line 81
    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_7

    .line 83
    :cond_7
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_No:Ljava/lang/String;

    invoke-interface {v0, v4, v3}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 85
    :goto_7
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_Date:Ljava/sql/Date;

    invoke-static {v3}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v3

    .line 86
    .local v3, "_tmp_1":Ljava/lang/Long;
    const/16 v4, 0xa

    if-nez v3, :cond_8

    .line 87
    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_8

    .line 89
    :cond_8
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-interface {v0, v4, v5, v6}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 91
    :goto_8
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Bank_Code:Ljava/lang/String;

    const/16 v5, 0xb

    if-nez v4, :cond_9

    .line 92
    invoke-interface {v0, v5}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_9

    .line 94
    :cond_9
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Bank_Code:Ljava/lang/String;

    invoke-interface {v0, v5, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 96
    :goto_9
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Received_From:Ljava/lang/String;

    const/16 v5, 0xc

    if-nez v4, :cond_a

    .line 97
    invoke-interface {v0, v5}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_a

    .line 99
    :cond_a
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Received_From:Ljava/lang/String;

    invoke-interface {v0, v5, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 101
    :goto_a
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->On_Behalf_Of:Ljava/lang/String;

    const/16 v5, 0xd

    if-nez v4, :cond_b

    .line 102
    invoke-interface {v0, v5}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_b

    .line 104
    :cond_b
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->On_Behalf_Of:Ljava/lang/String;

    invoke-interface {v0, v5, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 106
    :goto_b
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Cashier:Ljava/lang/String;

    const/16 v5, 0xe

    if-nez v4, :cond_c

    .line 107
    invoke-interface {v0, v5}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_c

    .line 109
    :cond_c
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Cashier:Ljava/lang/String;

    invoke-interface {v0, v5, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 111
    :goto_c
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Account_No:Ljava/lang/String;

    const/16 v5, 0xf

    if-nez v4, :cond_d

    .line 112
    invoke-interface {v0, v5}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_d

    .line 114
    :cond_d
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Account_No:Ljava/lang/String;

    invoke-interface {v0, v5, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 116
    :goto_d
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Account_Name:Ljava/lang/String;

    const/16 v5, 0x10

    if-nez v4, :cond_e

    .line 117
    invoke-interface {v0, v5}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_e

    .line 119
    :cond_e
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Account_Name:Ljava/lang/String;

    invoke-interface {v0, v5, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 121
    :goto_e
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Posted:Ljava/lang/Boolean;

    if-nez v4, :cond_f

    const/4 v4, 0x0

    goto :goto_f

    :cond_f
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Posted:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 122
    .local v4, "_tmp_2":Ljava/lang/Integer;
    :goto_f
    const/16 v6, 0x11

    if-nez v4, :cond_10

    .line 123
    invoke-interface {v0, v6}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_10

    .line 125
    :cond_10
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v7

    int-to-long v7, v7

    invoke-interface {v0, v6, v7, v8}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 127
    :goto_10
    iget-object v6, v1, Lcom/trimline/metrocrew/transaction;->Date_Posted:Ljava/sql/Date;

    invoke-static {v6}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v6

    .line 128
    .local v6, "_tmp_3":Ljava/lang/Long;
    const/16 v7, 0x12

    if-nez v6, :cond_11

    .line 129
    invoke-interface {v0, v7}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_11

    .line 131
    :cond_11
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    invoke-interface {v0, v7, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 133
    :goto_11
    iget-object v7, v1, Lcom/trimline/metrocrew/transaction;->Time_Posted:Ljava/sql/Date;

    invoke-static {v7}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v7

    .line 134
    .local v7, "_tmp_4":Ljava/lang/Long;
    const/16 v8, 0x13

    if-nez v7, :cond_12

    .line 135
    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_12

    .line 137
    :cond_12
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    invoke-interface {v0, v8, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 139
    :goto_12
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Posted_By:Ljava/lang/String;

    const/16 v9, 0x14

    if-nez v8, :cond_13

    .line 140
    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_13

    .line 142
    :cond_13
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Posted_By:Ljava/lang/String;

    invoke-interface {v0, v9, v8}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 144
    :goto_13
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Amount:Ljava/lang/Double;

    const/16 v9, 0x15

    if-nez v8, :cond_14

    .line 145
    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_14

    .line 147
    :cond_14
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Amount:Ljava/lang/Double;

    invoke-virtual {v8}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v10

    invoke-interface {v0, v9, v10, v11}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 149
    :goto_14
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Remarks:Ljava/lang/String;

    const/16 v9, 0x16

    if-nez v8, :cond_15

    .line 150
    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_15

    .line 152
    :cond_15
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Remarks:Ljava/lang/String;

    invoke-interface {v0, v9, v8}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 154
    :goto_15
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Transaction_Name:Ljava/lang/String;

    if-nez v8, :cond_16

    .line 155
    const/16 v8, 0x17

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_16

    .line 157
    :cond_16
    const/16 v8, 0x17

    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Transaction_Name:Ljava/lang/String;

    invoke-interface {v0, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 159
    :goto_16
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Branch_Code:Ljava/lang/String;

    if-nez v8, :cond_17

    .line 160
    const/16 v8, 0x18

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_17

    .line 162
    :cond_17
    const/16 v8, 0x18

    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Branch_Code:Ljava/lang/String;

    invoke-interface {v0, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 164
    :goto_17
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Agent_Code:Ljava/lang/String;

    if-nez v8, :cond_18

    .line 165
    const/16 v8, 0x19

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_18

    .line 167
    :cond_18
    const/16 v8, 0x19

    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Agent_Code:Ljava/lang/String;

    invoke-interface {v0, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 169
    :goto_18
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Grouping:Ljava/lang/String;

    if-nez v8, :cond_19

    .line 170
    const/16 v8, 0x1a

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_19

    .line 172
    :cond_19
    const/16 v8, 0x1a

    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Grouping:Ljava/lang/String;

    invoke-interface {v0, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 174
    :goto_19
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Global_Dimension_1_Code:Ljava/lang/String;

    if-nez v8, :cond_1a

    .line 175
    const/16 v8, 0x1b

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1a

    .line 177
    :cond_1a
    const/16 v8, 0x1b

    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Global_Dimension_1_Code:Ljava/lang/String;

    invoke-interface {v0, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 179
    :goto_1a
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Shortcut_Dimension_2_Code:Ljava/lang/String;

    if-nez v8, :cond_1b

    .line 180
    const/16 v8, 0x1c

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1b

    .line 182
    :cond_1b
    const/16 v8, 0x1c

    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Shortcut_Dimension_2_Code:Ljava/lang/String;

    invoke-interface {v0, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 184
    :goto_1b
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->VAT_Percent:Ljava/lang/Double;

    if-nez v8, :cond_1c

    .line 185
    const/16 v8, 0x1d

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1c

    .line 187
    :cond_1c
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->VAT_Percent:Ljava/lang/Double;

    invoke-virtual {v8}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    const/16 v10, 0x1d

    invoke-interface {v0, v10, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 189
    :goto_1c
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Currency_Code:Ljava/lang/String;

    if-nez v8, :cond_1d

    .line 190
    const/16 v8, 0x1e

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1d

    .line 192
    :cond_1d
    const/16 v8, 0x1e

    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Currency_Code:Ljava/lang/String;

    invoke-interface {v0, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 194
    :goto_1d
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Currency_Factor:Ljava/lang/Double;

    if-nez v8, :cond_1e

    .line 195
    const/16 v8, 0x1f

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1e

    .line 197
    :cond_1e
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Currency_Factor:Ljava/lang/Double;

    invoke-virtual {v8}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    const/16 v10, 0x1f

    invoke-interface {v0, v10, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 199
    :goto_1e
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->VAT_Bus_Posting_Group:Ljava/lang/String;

    if-nez v8, :cond_1f

    .line 200
    const/16 v8, 0x20

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1f

    .line 202
    :cond_1f
    const/16 v8, 0x20

    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->VAT_Bus_Posting_Group:Ljava/lang/String;

    invoke-interface {v0, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 204
    :goto_1f
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->VAT_Prod_Posting_Group:Ljava/lang/String;

    if-nez v8, :cond_20

    .line 205
    const/16 v8, 0x21

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_20

    .line 207
    :cond_20
    const/16 v8, 0x21

    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->VAT_Prod_Posting_Group:Ljava/lang/String;

    invoke-interface {v0, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 209
    :goto_20
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Gen_Posting_TypeSpecified:Ljava/lang/Boolean;

    if-nez v8, :cond_21

    const/4 v8, 0x0

    goto :goto_21

    :cond_21
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Gen_Posting_TypeSpecified:Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 210
    .local v8, "_tmp_5":Ljava/lang/Integer;
    :goto_21
    if-nez v8, :cond_22

    .line 211
    const/16 v9, 0x22

    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_22

    .line 213
    :cond_22
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v9

    int-to-long v9, v9

    const/16 v11, 0x22

    invoke-interface {v0, v11, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 215
    :goto_22
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Gen_Bus_Posting_Group:Ljava/lang/String;

    if-nez v9, :cond_23

    .line 216
    const/16 v9, 0x23

    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_23

    .line 218
    :cond_23
    const/16 v9, 0x23

    iget-object v10, v1, Lcom/trimline/metrocrew/transaction;->Gen_Bus_Posting_Group:Ljava/lang/String;

    invoke-interface {v0, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 220
    :goto_23
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Gen_Prod_Posting_Group:Ljava/lang/String;

    if-nez v9, :cond_24

    .line 221
    const/16 v9, 0x24

    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_24

    .line 223
    :cond_24
    const/16 v9, 0x24

    iget-object v10, v1, Lcom/trimline/metrocrew/transaction;->Gen_Prod_Posting_Group:Ljava/lang/String;

    invoke-interface {v0, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 225
    :goto_24
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->VAT_Amount:Ljava/lang/Double;

    if-nez v9, :cond_25

    .line 226
    const/16 v9, 0x25

    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_25

    .line 228
    :cond_25
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->VAT_Amount:Ljava/lang/Double;

    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v9

    const/16 v11, 0x25

    invoke-interface {v0, v11, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 230
    :goto_25
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Total_Amount:Ljava/lang/Double;

    if-nez v9, :cond_26

    .line 231
    const/16 v9, 0x26

    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_26

    .line 233
    :cond_26
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Total_Amount:Ljava/lang/Double;

    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v9

    const/16 v11, 0x26

    invoke-interface {v0, v11, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 235
    :goto_26
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->User_ID:Ljava/lang/String;

    if-nez v9, :cond_27

    .line 236
    const/16 v9, 0x27

    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_27

    .line 238
    :cond_27
    const/16 v9, 0x27

    iget-object v10, v1, Lcom/trimline/metrocrew/transaction;->User_ID:Ljava/lang/String;

    invoke-interface {v0, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 240
    :goto_27
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Apply_to:Ljava/lang/String;

    if-nez v9, :cond_28

    .line 241
    const/16 v9, 0x28

    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_28

    .line 243
    :cond_28
    const/16 v9, 0x28

    iget-object v10, v1, Lcom/trimline/metrocrew/transaction;->Apply_to:Ljava/lang/String;

    invoke-interface {v0, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 245
    :goto_28
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Apply_to_ID:Ljava/lang/String;

    if-nez v9, :cond_29

    .line 246
    const/16 v9, 0x29

    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_29

    .line 248
    :cond_29
    const/16 v9, 0x29

    iget-object v10, v1, Lcom/trimline/metrocrew/transaction;->Apply_to_ID:Ljava/lang/String;

    invoke-interface {v0, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 250
    :goto_29
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Dest_Global_Dimension_1_Code:Ljava/lang/String;

    if-nez v9, :cond_2a

    .line 251
    const/16 v9, 0x2a

    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2a

    .line 253
    :cond_2a
    const/16 v9, 0x2a

    iget-object v10, v1, Lcom/trimline/metrocrew/transaction;->Dest_Global_Dimension_1_Code:Ljava/lang/String;

    invoke-interface {v0, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 255
    :goto_2a
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Dest_Shortcut_Dimension_2_Code:Ljava/lang/String;

    if-nez v9, :cond_2b

    .line 256
    const/16 v9, 0x2b

    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2b

    .line 258
    :cond_2b
    const/16 v9, 0x2b

    iget-object v10, v1, Lcom/trimline/metrocrew/transaction;->Dest_Shortcut_Dimension_2_Code:Ljava/lang/String;

    invoke-interface {v0, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 260
    :goto_2b
    iget v9, v1, Lcom/trimline/metrocrew/transaction;->Line_No:I

    int-to-long v9, v9

    const/16 v11, 0x2c

    invoke-interface {v0, v11, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 261
    iget v9, v1, Lcom/trimline/metrocrew/transaction;->Print_No:I

    int-to-long v9, v9

    const/16 v11, 0x2d

    invoke-interface {v0, v11, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 262
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Deposit_Slip_Time:Ljava/sql/Date;

    invoke-static {v9}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v9

    .line 263
    .local v9, "_tmp_6":Ljava/lang/Long;
    if-nez v9, :cond_2c

    .line 264
    const/16 v10, 0x2e

    invoke-interface {v0, v10}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2c

    .line 266
    :cond_2c
    const/16 v10, 0x2e

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    invoke-interface {v0, v10, v11, v12}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 268
    :goto_2c
    iget-object v10, v1, Lcom/trimline/metrocrew/transaction;->Teller_ID:Ljava/lang/String;

    if-nez v10, :cond_2d

    .line 269
    const/16 v10, 0x2f

    invoke-interface {v0, v10}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2d

    .line 271
    :cond_2d
    const/16 v10, 0x2f

    iget-object v11, v1, Lcom/trimline/metrocrew/transaction;->Teller_ID:Ljava/lang/String;

    invoke-interface {v0, v10, v11}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 273
    :goto_2d
    iget-object v10, v1, Lcom/trimline/metrocrew/transaction;->Customer_Payment_On_Account:Ljava/lang/Boolean;

    if-nez v10, :cond_2e

    const/4 v10, 0x0

    goto :goto_2e

    :cond_2e
    iget-object v10, v1, Lcom/trimline/metrocrew/transaction;->Customer_Payment_On_Account:Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    .line 274
    .local v10, "_tmp_7":Ljava/lang/Integer;
    :goto_2e
    if-nez v10, :cond_2f

    .line 275
    const/16 v11, 0x30

    invoke-interface {v0, v11}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2f

    .line 277
    :cond_2f
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v11

    int-to-long v11, v11

    const/16 v13, 0x30

    invoke-interface {v0, v13, v11, v12}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 279
    :goto_2f
    iget-object v11, v1, Lcom/trimline/metrocrew/transaction;->Select:Ljava/lang/Boolean;

    if-nez v11, :cond_30

    const/4 v11, 0x0

    goto :goto_30

    :cond_30
    iget-object v11, v1, Lcom/trimline/metrocrew/transaction;->Select:Ljava/lang/Boolean;

    invoke-virtual {v11}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    .line 280
    .local v11, "_tmp_8":Ljava/lang/Integer;
    :goto_30
    if-nez v11, :cond_31

    .line 281
    const/16 v12, 0x31

    invoke-interface {v0, v12}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_31

    .line 283
    :cond_31
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v12

    int-to-long v12, v12

    const/16 v14, 0x31

    invoke-interface {v0, v14, v12, v13}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 285
    :goto_31
    iget-object v12, v1, Lcom/trimline/metrocrew/transaction;->Batch_Posted:Ljava/lang/Boolean;

    if-nez v12, :cond_32

    const/4 v12, 0x0

    goto :goto_32

    :cond_32
    iget-object v12, v1, Lcom/trimline/metrocrew/transaction;->Batch_Posted:Ljava/lang/Boolean;

    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    .line 286
    .local v12, "_tmp_9":Ljava/lang/Integer;
    :goto_32
    if-nez v12, :cond_33

    .line 287
    const/16 v13, 0x32

    invoke-interface {v0, v13}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_33

    .line 289
    :cond_33
    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v13

    int-to-long v13, v13

    const/16 v15, 0x32

    invoke-interface {v0, v15, v13, v14}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 291
    :goto_33
    iget-object v13, v1, Lcom/trimline/metrocrew/transaction;->Transaction_No:Ljava/lang/String;

    if-nez v13, :cond_34

    .line 292
    const/16 v13, 0x33

    invoke-interface {v0, v13}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_34

    .line 294
    :cond_34
    const/16 v13, 0x33

    iget-object v14, v1, Lcom/trimline/metrocrew/transaction;->Transaction_No:Ljava/lang/String;

    invoke-interface {v0, v13, v14}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 296
    :goto_34
    iget-object v13, v1, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_Bank:Ljava/lang/String;

    if-nez v13, :cond_35

    .line 297
    const/16 v13, 0x34

    invoke-interface {v0, v13}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_35

    .line 299
    :cond_35
    const/16 v13, 0x34

    iget-object v14, v1, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_Bank:Ljava/lang/String;

    invoke-interface {v0, v13, v14}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 301
    :goto_35
    iget-object v13, v1, Lcom/trimline/metrocrew/transaction;->Bank_Account:Ljava/lang/String;

    if-nez v13, :cond_36

    .line 302
    const/16 v13, 0x35

    invoke-interface {v0, v13}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_36

    .line 304
    :cond_36
    const/16 v13, 0x35

    iget-object v14, v1, Lcom/trimline/metrocrew/transaction;->Bank_Account:Ljava/lang/String;

    invoke-interface {v0, v13, v14}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 306
    :goto_36
    iget-object v13, v1, Lcom/trimline/metrocrew/transaction;->Confirmed:Ljava/lang/Boolean;

    if-nez v13, :cond_37

    const/4 v13, 0x0

    goto :goto_37

    :cond_37
    iget-object v13, v1, Lcom/trimline/metrocrew/transaction;->Confirmed:Ljava/lang/Boolean;

    invoke-virtual {v13}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    .line 307
    .local v13, "_tmp_10":Ljava/lang/Integer;
    :goto_37
    if-nez v13, :cond_38

    .line 308
    const/16 v14, 0x36

    invoke-interface {v0, v14}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_38

    .line 310
    :cond_38
    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v14

    int-to-long v14, v14

    const/16 v5, 0x36

    invoke-interface {v0, v5, v14, v15}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 312
    :goto_38
    iget-object v5, v1, Lcom/trimline/metrocrew/transaction;->Reconciled:Ljava/lang/Boolean;

    if-nez v5, :cond_39

    const/4 v5, 0x0

    goto :goto_39

    :cond_39
    iget-object v5, v1, Lcom/trimline/metrocrew/transaction;->Reconciled:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 313
    .local v5, "_tmp_11":Ljava/lang/Integer;
    :goto_39
    if-nez v5, :cond_3a

    .line 314
    const/16 v14, 0x37

    invoke-interface {v0, v14}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v17, v2

    goto :goto_3a

    .line 316
    :cond_3a
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v14

    int-to-long v14, v14

    move-object/from16 v17, v2

    .end local v2    # "_tmp":Ljava/lang/Long;
    .local v17, "_tmp":Ljava/lang/Long;
    const/16 v2, 0x37

    invoke-interface {v0, v2, v14, v15}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 318
    :goto_3a
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Orig_Cashier:Ljava/lang/String;

    if-nez v2, :cond_3b

    .line 319
    const/16 v2, 0x38

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_3b

    .line 321
    :cond_3b
    const/16 v2, 0x38

    iget-object v14, v1, Lcom/trimline/metrocrew/transaction;->Orig_Cashier:Ljava/lang/String;

    invoke-interface {v0, v2, v14}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 323
    :goto_3b
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Cancelled:Ljava/lang/Boolean;

    if-nez v2, :cond_3c

    const/4 v2, 0x0

    goto :goto_3c

    :cond_3c
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Cancelled:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 324
    .local v2, "_tmp_12":Ljava/lang/Integer;
    :goto_3c
    if-nez v2, :cond_3d

    .line 325
    const/16 v14, 0x39

    invoke-interface {v0, v14}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v18, v2

    goto :goto_3d

    .line 327
    :cond_3d
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v14

    int-to-long v14, v14

    move-object/from16 v18, v2

    .end local v2    # "_tmp_12":Ljava/lang/Integer;
    .local v18, "_tmp_12":Ljava/lang/Integer;
    const/16 v2, 0x39

    invoke-interface {v0, v2, v14, v15}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 329
    :goto_3d
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Cancelled_By:Ljava/lang/String;

    if-nez v2, :cond_3e

    .line 330
    const/16 v2, 0x3a

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_3e

    .line 332
    :cond_3e
    const/16 v2, 0x3a

    iget-object v14, v1, Lcom/trimline/metrocrew/transaction;->Cancelled_By:Ljava/lang/String;

    invoke-interface {v0, v2, v14}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 334
    :goto_3e
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Cancelled_Date:Ljava/sql/Date;

    invoke-static {v2}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v2

    .line 335
    .local v2, "_tmp_13":Ljava/lang/Long;
    if-nez v2, :cond_3f

    .line 336
    const/16 v14, 0x3b

    invoke-interface {v0, v14}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v19, v2

    move-object v15, v3

    goto :goto_3f

    .line 338
    :cond_3f
    const/16 v14, 0x3b

    move-object/from16 v19, v2

    move-object v15, v3

    .end local v2    # "_tmp_13":Ljava/lang/Long;
    .end local v3    # "_tmp_1":Ljava/lang/Long;
    .local v15, "_tmp_1":Ljava/lang/Long;
    .local v19, "_tmp_13":Ljava/lang/Long;
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {v0, v14, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 340
    :goto_3f
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Cancelled_Time:Ljava/sql/Date;

    invoke-static {v2}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v2

    .line 341
    .local v2, "_tmp_14":Ljava/lang/Long;
    if-nez v2, :cond_40

    .line 342
    const/16 v3, 0x3c

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object v14, v4

    move-object/from16 v20, v5

    goto :goto_40

    .line 344
    :cond_40
    const/16 v3, 0x3c

    move-object v14, v4

    move-object/from16 v20, v5

    .end local v4    # "_tmp_2":Ljava/lang/Integer;
    .end local v5    # "_tmp_11":Ljava/lang/Integer;
    .local v14, "_tmp_2":Ljava/lang/Integer;
    .local v20, "_tmp_11":Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-interface {v0, v3, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 346
    :goto_40
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Post_Dated:Ljava/lang/Boolean;

    if-nez v3, :cond_41

    const/4 v3, 0x0

    goto :goto_41

    :cond_41
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Post_Dated:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 347
    .local v3, "_tmp_15":Ljava/lang/Integer;
    :goto_41
    if-nez v3, :cond_42

    .line 348
    const/16 v4, 0x3d

    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v21, v2

    goto :goto_42

    .line 350
    :cond_42
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-long v4, v4

    move-object/from16 v21, v2

    .end local v2    # "_tmp_14":Ljava/lang/Long;
    .local v21, "_tmp_14":Ljava/lang/Long;
    const/16 v2, 0x3d

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 352
    :goto_42
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Cheque_Retrieved:Ljava/lang/Boolean;

    if-nez v2, :cond_43

    const/4 v2, 0x0

    goto :goto_43

    :cond_43
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Cheque_Retrieved:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 353
    .local v2, "_tmp_16":Ljava/lang/Integer;
    :goto_43
    if-nez v2, :cond_44

    .line 354
    const/16 v4, 0x3e

    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v22, v2

    goto :goto_44

    .line 356
    :cond_44
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-long v4, v4

    move-object/from16 v22, v2

    .end local v2    # "_tmp_16":Ljava/lang/Integer;
    .local v22, "_tmp_16":Ljava/lang/Integer;
    const/16 v2, 0x3e

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 358
    :goto_44
    iget v2, v1, Lcom/trimline/metrocrew/transaction;->Register_Number:I

    int-to-long v4, v2

    const/16 v2, 0x3f

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 359
    iget v2, v1, Lcom/trimline/metrocrew/transaction;->From_Entry_No:I

    int-to-long v4, v2

    const/16 v2, 0x40

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 360
    iget v2, v1, Lcom/trimline/metrocrew/transaction;->To_Entry_No:I

    int-to-long v4, v2

    const/16 v2, 0x41

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 361
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Batch_Posted_UserID:Ljava/lang/String;

    if-nez v2, :cond_45

    .line 362
    const/16 v2, 0x42

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_45

    .line 364
    :cond_45
    const/16 v2, 0x42

    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Batch_Posted_UserID:Ljava/lang/String;

    invoke-interface {v0, v2, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 366
    :goto_45
    iget v2, v1, Lcom/trimline/metrocrew/transaction;->BD_Register_Number:I

    int-to-long v4, v2

    const/16 v2, 0x43

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 367
    iget v2, v1, Lcom/trimline/metrocrew/transaction;->BD_From_Number:I

    int-to-long v4, v2

    const/16 v2, 0x44

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 368
    iget v2, v1, Lcom/trimline/metrocrew/transaction;->BD_To_Number:I

    int-to-long v4, v2

    const/16 v2, 0x45

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 369
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Reversal_By:Ljava/lang/String;

    if-nez v2, :cond_46

    .line 370
    const/16 v2, 0x46

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_46

    .line 372
    :cond_46
    const/16 v2, 0x46

    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Reversal_By:Ljava/lang/String;

    invoke-interface {v0, v2, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 374
    :goto_46
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Reversal_Date:Ljava/sql/Date;

    invoke-static {v2}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v2

    .line 375
    .local v2, "_tmp_17":Ljava/lang/Long;
    if-nez v2, :cond_47

    .line 376
    const/16 v4, 0x47

    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v23, v2

    move-object v5, v3

    goto :goto_47

    .line 378
    :cond_47
    const/16 v4, 0x47

    move-object/from16 v23, v2

    move-object v5, v3

    .end local v2    # "_tmp_17":Ljava/lang/Long;
    .end local v3    # "_tmp_15":Ljava/lang/Integer;
    .local v5, "_tmp_15":Ljava/lang/Integer;
    .local v23, "_tmp_17":Ljava/lang/Long;
    invoke-virtual/range {v23 .. v23}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {v0, v4, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 380
    :goto_47
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Reversal_Time:Ljava/sql/Date;

    invoke-static {v2}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v2

    .line 381
    .local v2, "_tmp_18":Ljava/lang/Long;
    if-nez v2, :cond_48

    .line 382
    const/16 v3, 0x48

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v24, v5

    goto :goto_48

    .line 384
    :cond_48
    const/16 v3, 0x48

    move-object/from16 v24, v5

    .end local v5    # "_tmp_15":Ljava/lang/Integer;
    .local v24, "_tmp_15":Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-interface {v0, v3, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 386
    :goto_48
    iget v3, v1, Lcom/trimline/metrocrew/transaction;->Reversal_Register_No:I

    int-to-long v3, v3

    const/16 v5, 0x49

    invoke-interface {v0, v5, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 387
    iget v3, v1, Lcom/trimline/metrocrew/transaction;->Reversal_From_Entry_No:I

    int-to-long v3, v3

    const/16 v5, 0x4a

    invoke-interface {v0, v5, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 388
    iget v3, v1, Lcom/trimline/metrocrew/transaction;->Reversal_To_Entry_No:I

    int-to-long v3, v3

    const/16 v5, 0x4b

    invoke-interface {v0, v5, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 389
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Reversed:Ljava/lang/Boolean;

    if-nez v3, :cond_49

    const/4 v5, 0x0

    goto :goto_49

    :cond_49
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Reversed:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 390
    .local v5, "_tmp_19":Ljava/lang/Integer;
    :goto_49
    if-nez v5, :cond_4a

    .line 391
    const/16 v3, 0x4c

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v16, v2

    goto :goto_4a

    .line 393
    :cond_4a
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-long v3, v3

    move-object/from16 v16, v2

    .end local v2    # "_tmp_18":Ljava/lang/Long;
    .local v16, "_tmp_18":Ljava/lang/Long;
    const/16 v2, 0x4c

    invoke-interface {v0, v2, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 395
    :goto_4a
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Applies_to_Doc_No:Ljava/lang/String;

    if-nez v2, :cond_4b

    .line 396
    const/16 v2, 0x4d

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4b

    .line 398
    :cond_4b
    const/16 v2, 0x4d

    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Applies_to_Doc_No:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 400
    :goto_4b
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Applies_to_ID:Ljava/lang/String;

    if-nez v2, :cond_4c

    .line 401
    const/16 v2, 0x4e

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4c

    .line 403
    :cond_4c
    const/16 v2, 0x4e

    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Applies_to_ID:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 405
    :goto_4c
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Grant_No:Ljava/lang/String;

    if-nez v2, :cond_4d

    .line 406
    const/16 v2, 0x4f

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4d

    .line 408
    :cond_4d
    const/16 v2, 0x4f

    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Grant_No:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 410
    :goto_4d
    iget v2, v1, Lcom/trimline/metrocrew/transaction;->Installment_Number:I

    int-to-long v2, v2

    const/16 v4, 0x50

    invoke-interface {v0, v4, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 411
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Next_Installment_Date:Ljava/sql/Date;

    invoke-static {v2}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v2

    .line 412
    .local v2, "_tmp_20":Ljava/lang/Long;
    if-nez v2, :cond_4e

    .line 413
    const/16 v3, 0x51

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v25, v5

    goto :goto_4e

    .line 415
    :cond_4e
    const/16 v3, 0x51

    move-object/from16 v25, v5

    .end local v5    # "_tmp_19":Ljava/lang/Integer;
    .local v25, "_tmp_19":Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-interface {v0, v3, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 417
    :goto_4e
    iget v3, v1, Lcom/trimline/metrocrew/transaction;->Dimension_Set_ID:I

    int-to-long v3, v3

    const/16 v5, 0x52

    invoke-interface {v0, v5, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 418
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Donor:Ljava/lang/String;

    if-nez v3, :cond_4f

    .line 419
    const/16 v3, 0x53

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4f

    .line 421
    :cond_4f
    const/16 v3, 0x53

    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Donor:Ljava/lang/String;

    invoke-interface {v0, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 423
    :goto_4f
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Group_Code:Ljava/lang/String;

    if-nez v3, :cond_50

    .line 424
    const/16 v3, 0x54

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_50

    .line 426
    :cond_50
    const/16 v3, 0x54

    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Group_Code:Ljava/lang/String;

    invoke-interface {v0, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 428
    :goto_50
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Pre_ADM_Fines:Ljava/lang/Double;

    if-nez v3, :cond_51

    .line 429
    const/16 v3, 0x55

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_51

    .line 431
    :cond_51
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Pre_ADM_Fines:Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    const/16 v5, 0x55

    invoke-interface {v0, v5, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 433
    :goto_51
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Med_Fines:Ljava/lang/Double;

    if-nez v3, :cond_52

    .line 434
    const/16 v3, 0x56

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_52

    .line 436
    :cond_52
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Med_Fines:Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    const/16 v5, 0x56

    invoke-interface {v0, v5, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 438
    :goto_52
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Loan_No:Ljava/lang/String;

    if-nez v3, :cond_53

    .line 439
    const/16 v3, 0x57

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_53

    .line 441
    :cond_53
    const/16 v3, 0x57

    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Loan_No:Ljava/lang/String;

    invoke-interface {v0, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 443
    :goto_53
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Penalty:Ljava/lang/Double;

    if-nez v3, :cond_54

    .line 444
    const/16 v3, 0x58

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_54

    .line 446
    :cond_54
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Penalty:Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    const/16 v5, 0x58

    invoke-interface {v0, v5, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 448
    :goto_54
    iget-boolean v3, v1, Lcom/trimline/metrocrew/transaction;->sent:Z

    .line 449
    .local v3, "_tmp_21":I
    const/16 v4, 0x59

    move-object v5, v2

    .end local v2    # "_tmp_20":Ljava/lang/Long;
    .local v5, "_tmp_20":Ljava/lang/Long;
    int-to-long v1, v3

    invoke-interface {v0, v4, v1, v2}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 450
    return-void
.end method

.method protected bridge synthetic bind(Landroidx/sqlite/SQLiteStatement;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x1010
        }
        names = {
            "statement",
            "entity"
        }
    .end annotation

    .line 34
    check-cast p2, Lcom/trimline/metrocrew/transaction;

    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/transaction_dao_Impl$1;->bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/transaction;)V

    return-void
.end method

.method protected createQuery()Ljava/lang/String;
    .locals 1

    .line 38
    const-string v0, "INSERT OR REPLACE INTO `transaction` (`Key`,`Entry_No`,`No`,`Date`,`Type`,`transtype`,`PayMode`,`Pay_Mode`,`Cheque_Deposit_Slip_No`,`Cheque_Deposit_Slip_Date`,`Bank_Code`,`Received_From`,`On_Behalf_Of`,`Cashier`,`Account_No`,`Account_Name`,`Posted`,`Date_Posted`,`Time_Posted`,`Posted_By`,`Amount`,`Remarks`,`Transaction_Name`,`Branch_Code`,`Agent_Code`,`Grouping`,`Global_Dimension_1_Code`,`Shortcut_Dimension_2_Code`,`VAT_Percent`,`Currency_Code`,`Currency_Factor`,`VAT_Bus_Posting_Group`,`VAT_Prod_Posting_Group`,`Gen_Posting_TypeSpecified`,`Gen_Bus_Posting_Group`,`Gen_Prod_Posting_Group`,`VAT_Amount`,`Total_Amount`,`User_ID`,`Apply_to`,`Apply_to_ID`,`Dest_Global_Dimension_1_Code`,`Dest_Shortcut_Dimension_2_Code`,`Line_No`,`Print_No`,`Deposit_Slip_Time`,`Teller_ID`,`Customer_Payment_On_Account`,`Select`,`Batch_Posted`,`Transaction_No`,`Cheque_Deposit_Slip_Bank`,`Bank_Account`,`Confirmed`,`Reconciled`,`Orig_Cashier`,`Cancelled`,`Cancelled_By`,`Cancelled_Date`,`Cancelled_Time`,`Post_Dated`,`Cheque_Retrieved`,`Register_Number`,`From_Entry_No`,`To_Entry_No`,`Batch_Posted_UserID`,`BD_Register_Number`,`BD_From_Number`,`BD_To_Number`,`Reversal_By`,`Reversal_Date`,`Reversal_Time`,`Reversal_Register_No`,`Reversal_From_Entry_No`,`Reversal_To_Entry_No`,`Reversed`,`Applies_to_Doc_No`,`Applies_to_ID`,`Grant_No`,`Installment_Number`,`Next_Installment_Date`,`Dimension_Set_ID`,`Donor`,`Group_Code`,`Pre_ADM_Fines`,`Med_Fines`,`Loan_No`,`Penalty`,`sent`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"

    return-object v0
.end method
