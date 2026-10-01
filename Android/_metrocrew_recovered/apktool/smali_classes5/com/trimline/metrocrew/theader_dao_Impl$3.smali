.class Lcom/trimline/metrocrew/theader_dao_Impl$3;
.super Landroidx/room/EntityDeleteOrUpdateAdapter;
.source "theader_dao_Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/theader_dao_Impl;-><init>(Landroidx/room/RoomDatabase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/room/EntityDeleteOrUpdateAdapter<",
        "Lcom/trimline/metrocrew/theader;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/theader_dao_Impl;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/theader_dao_Impl;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/theader_dao_Impl;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 388
    iput-object p1, p0, Lcom/trimline/metrocrew/theader_dao_Impl$3;->this$0:Lcom/trimline/metrocrew/theader_dao_Impl;

    invoke-direct {p0}, Landroidx/room/EntityDeleteOrUpdateAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method protected bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/theader;)V
    .locals 34
    .param p1, "statement"    # Landroidx/sqlite/SQLiteStatement;
    .param p2, "entity"    # Lcom/trimline/metrocrew/theader;
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

    .line 397
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Key:Ljava/lang/String;

    const/4 v3, 0x1

    if-nez v2, :cond_0

    .line 398
    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 400
    :cond_0
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Key:Ljava/lang/String;

    invoke-interface {v0, v3, v2}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 402
    :goto_0
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->No:Ljava/lang/String;

    const/4 v3, 0x2

    if-nez v2, :cond_1

    .line 403
    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 405
    :cond_1
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->No:Ljava/lang/String;

    invoke-interface {v0, v3, v2}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 407
    :goto_1
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Date:Ljava/sql/Date;

    invoke-static {v2}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v2

    .line 408
    .local v2, "_tmp":Ljava/lang/Long;
    const/4 v3, 0x3

    if-nez v2, :cond_2

    .line 409
    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2

    .line 411
    :cond_2
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-interface {v0, v3, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 413
    :goto_2
    iget-object v3, v1, Lcom/trimline/metrocrew/theader;->DateSpecified:Ljava/lang/Boolean;

    if-nez v3, :cond_3

    const/4 v3, 0x0

    goto :goto_3

    :cond_3
    iget-object v3, v1, Lcom/trimline/metrocrew/theader;->DateSpecified:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 414
    .local v3, "_tmp_1":Ljava/lang/Integer;
    :goto_3
    const/4 v5, 0x4

    if-nez v3, :cond_4

    .line 415
    invoke-interface {v0, v5}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4

    .line 417
    :cond_4
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-long v6, v6

    invoke-interface {v0, v5, v6, v7}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 419
    :goto_4
    iget-object v5, v1, Lcom/trimline/metrocrew/theader;->Cashier:Ljava/lang/String;

    const/4 v6, 0x5

    if-nez v5, :cond_5

    .line 420
    invoke-interface {v0, v6}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_5

    .line 422
    :cond_5
    iget-object v5, v1, Lcom/trimline/metrocrew/theader;->Cashier:Ljava/lang/String;

    invoke-interface {v0, v6, v5}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 424
    :goto_5
    iget-object v5, v1, Lcom/trimline/metrocrew/theader;->Date_Posted:Ljava/sql/Date;

    invoke-static {v5}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v5

    .line 425
    .local v5, "_tmp_2":Ljava/lang/Long;
    const/4 v6, 0x6

    if-nez v5, :cond_6

    .line 426
    invoke-interface {v0, v6}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_6

    .line 428
    :cond_6
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v7

    invoke-interface {v0, v6, v7, v8}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 430
    :goto_6
    iget-object v6, v1, Lcom/trimline/metrocrew/theader;->Date_PostedSpecified:Ljava/lang/Boolean;

    if-nez v6, :cond_7

    const/4 v6, 0x0

    goto :goto_7

    :cond_7
    iget-object v6, v1, Lcom/trimline/metrocrew/theader;->Date_PostedSpecified:Ljava/lang/Boolean;

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    .line 431
    .local v6, "_tmp_3":Ljava/lang/Integer;
    :goto_7
    const/4 v7, 0x7

    if-nez v6, :cond_8

    .line 432
    invoke-interface {v0, v7}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_8

    .line 434
    :cond_8
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v8

    int-to-long v8, v8

    invoke-interface {v0, v7, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 436
    :goto_8
    iget-object v7, v1, Lcom/trimline/metrocrew/theader;->Time_Posted:Ljava/sql/Date;

    invoke-static {v7}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v7

    .line 437
    .local v7, "_tmp_4":Ljava/lang/Long;
    const/16 v8, 0x8

    if-nez v7, :cond_9

    .line 438
    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_9

    .line 440
    :cond_9
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    invoke-interface {v0, v8, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 442
    :goto_9
    iget-object v8, v1, Lcom/trimline/metrocrew/theader;->Time_PostedSpecified:Ljava/lang/Boolean;

    if-nez v8, :cond_a

    const/4 v8, 0x0

    goto :goto_a

    :cond_a
    iget-object v8, v1, Lcom/trimline/metrocrew/theader;->Time_PostedSpecified:Ljava/lang/Boolean;

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    .line 443
    .local v8, "_tmp_5":Ljava/lang/Integer;
    :goto_a
    const/16 v9, 0x9

    if-nez v8, :cond_b

    .line 444
    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_b

    .line 446
    :cond_b
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v10

    int-to-long v10, v10

    invoke-interface {v0, v9, v10, v11}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 448
    :goto_b
    iget-object v9, v1, Lcom/trimline/metrocrew/theader;->Posted:Ljava/lang/Boolean;

    if-nez v9, :cond_c

    const/4 v9, 0x0

    goto :goto_c

    :cond_c
    iget-object v9, v1, Lcom/trimline/metrocrew/theader;->Posted:Ljava/lang/Boolean;

    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    .line 449
    .local v9, "_tmp_6":Ljava/lang/Integer;
    :goto_c
    const/16 v10, 0xa

    if-nez v9, :cond_d

    .line 450
    invoke-interface {v0, v10}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_d

    .line 452
    :cond_d
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v11

    int-to-long v11, v11

    invoke-interface {v0, v10, v11, v12}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 454
    :goto_d
    iget-object v10, v1, Lcom/trimline/metrocrew/theader;->PostedSpecified:Ljava/lang/Boolean;

    if-nez v10, :cond_e

    const/4 v10, 0x0

    goto :goto_e

    :cond_e
    iget-object v10, v1, Lcom/trimline/metrocrew/theader;->PostedSpecified:Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    .line 455
    .local v10, "_tmp_7":Ljava/lang/Integer;
    :goto_e
    const/16 v11, 0xb

    if-nez v10, :cond_f

    .line 456
    invoke-interface {v0, v11}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_f

    .line 458
    :cond_f
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v12

    int-to-long v12, v12

    invoke-interface {v0, v11, v12, v13}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 460
    :goto_f
    iget-object v11, v1, Lcom/trimline/metrocrew/theader;->No_Series:Ljava/lang/String;

    const/16 v12, 0xc

    if-nez v11, :cond_10

    .line 461
    invoke-interface {v0, v12}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_10

    .line 463
    :cond_10
    iget-object v11, v1, Lcom/trimline/metrocrew/theader;->No_Series:Ljava/lang/String;

    invoke-interface {v0, v12, v11}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 465
    :goto_10
    iget-object v11, v1, Lcom/trimline/metrocrew/theader;->Bank_Code:Ljava/lang/String;

    const/16 v12, 0xd

    if-nez v11, :cond_11

    .line 466
    invoke-interface {v0, v12}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_11

    .line 468
    :cond_11
    iget-object v11, v1, Lcom/trimline/metrocrew/theader;->Bank_Code:Ljava/lang/String;

    invoke-interface {v0, v12, v11}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 470
    :goto_11
    iget-object v11, v1, Lcom/trimline/metrocrew/theader;->Received_From:Ljava/lang/String;

    const/16 v12, 0xe

    if-nez v11, :cond_12

    .line 471
    invoke-interface {v0, v12}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_12

    .line 473
    :cond_12
    iget-object v11, v1, Lcom/trimline/metrocrew/theader;->Received_From:Ljava/lang/String;

    invoke-interface {v0, v12, v11}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 475
    :goto_12
    iget-object v11, v1, Lcom/trimline/metrocrew/theader;->On_Behalf_Of:Ljava/lang/String;

    const/16 v12, 0xf

    if-nez v11, :cond_13

    .line 476
    invoke-interface {v0, v12}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_13

    .line 478
    :cond_13
    iget-object v11, v1, Lcom/trimline/metrocrew/theader;->On_Behalf_Of:Ljava/lang/String;

    invoke-interface {v0, v12, v11}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 480
    :goto_13
    iget v11, v1, Lcom/trimline/metrocrew/theader;->Amount_Recieved:F

    float-to-double v11, v11

    const/16 v13, 0x10

    invoke-interface {v0, v13, v11, v12}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 481
    iget-object v11, v1, Lcom/trimline/metrocrew/theader;->Amount_RecievedSpecified:Ljava/lang/Boolean;

    if-nez v11, :cond_14

    const/4 v11, 0x0

    goto :goto_14

    :cond_14
    iget-object v11, v1, Lcom/trimline/metrocrew/theader;->Amount_RecievedSpecified:Ljava/lang/Boolean;

    invoke-virtual {v11}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    .line 482
    .local v11, "_tmp_8":Ljava/lang/Integer;
    :goto_14
    const/16 v12, 0x11

    if-nez v11, :cond_15

    .line 483
    invoke-interface {v0, v12}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_15

    .line 485
    :cond_15
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v13

    int-to-long v13, v13

    invoke-interface {v0, v12, v13, v14}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 487
    :goto_15
    iget-object v12, v1, Lcom/trimline/metrocrew/theader;->Global_Dimension_1_Code:Ljava/lang/String;

    const/16 v13, 0x12

    if-nez v12, :cond_16

    .line 488
    invoke-interface {v0, v13}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_16

    .line 490
    :cond_16
    iget-object v12, v1, Lcom/trimline/metrocrew/theader;->Global_Dimension_1_Code:Ljava/lang/String;

    invoke-interface {v0, v13, v12}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 492
    :goto_16
    iget-object v12, v1, Lcom/trimline/metrocrew/theader;->Shortcut_Dimension_2_Code:Ljava/lang/String;

    const/16 v13, 0x13

    if-nez v12, :cond_17

    .line 493
    invoke-interface {v0, v13}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_17

    .line 495
    :cond_17
    iget-object v12, v1, Lcom/trimline/metrocrew/theader;->Shortcut_Dimension_2_Code:Ljava/lang/String;

    invoke-interface {v0, v13, v12}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 497
    :goto_17
    iget-object v12, v1, Lcom/trimline/metrocrew/theader;->Currency_Code:Ljava/lang/String;

    const/16 v13, 0x14

    if-nez v12, :cond_18

    .line 498
    invoke-interface {v0, v13}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_18

    .line 500
    :cond_18
    iget-object v12, v1, Lcom/trimline/metrocrew/theader;->Currency_Code:Ljava/lang/String;

    invoke-interface {v0, v13, v12}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 502
    :goto_18
    iget v12, v1, Lcom/trimline/metrocrew/theader;->Currency_Factor:F

    float-to-double v12, v12

    const/16 v14, 0x15

    invoke-interface {v0, v14, v12, v13}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 503
    iget-object v12, v1, Lcom/trimline/metrocrew/theader;->Currency_FactorSpecified:Ljava/lang/Boolean;

    if-nez v12, :cond_19

    const/4 v12, 0x0

    goto :goto_19

    :cond_19
    iget-object v12, v1, Lcom/trimline/metrocrew/theader;->Currency_FactorSpecified:Ljava/lang/Boolean;

    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v12

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    .line 504
    .local v12, "_tmp_9":Ljava/lang/Integer;
    :goto_19
    const/16 v13, 0x16

    if-nez v12, :cond_1a

    .line 505
    invoke-interface {v0, v13}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1a

    .line 507
    :cond_1a
    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v14

    int-to-long v14, v14

    invoke-interface {v0, v13, v14, v15}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 509
    :goto_1a
    iget v13, v1, Lcom/trimline/metrocrew/theader;->Total_Amount:F

    float-to-double v13, v13

    const/16 v15, 0x17

    invoke-interface {v0, v15, v13, v14}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 510
    iget-object v13, v1, Lcom/trimline/metrocrew/theader;->Total_AmountSpecified:Ljava/lang/Boolean;

    if-nez v13, :cond_1b

    const/4 v13, 0x0

    goto :goto_1b

    :cond_1b
    iget-object v13, v1, Lcom/trimline/metrocrew/theader;->Total_AmountSpecified:Ljava/lang/Boolean;

    invoke-virtual {v13}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    .line 511
    .local v13, "_tmp_10":Ljava/lang/Integer;
    :goto_1b
    const/16 v14, 0x18

    if-nez v13, :cond_1c

    .line 512
    invoke-interface {v0, v14}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v17, v5

    goto :goto_1c

    .line 514
    :cond_1c
    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v15

    move-object/from16 v17, v5

    .end local v5    # "_tmp_2":Ljava/lang/Long;
    .local v17, "_tmp_2":Ljava/lang/Long;
    int-to-long v4, v15

    invoke-interface {v0, v14, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 516
    :goto_1c
    iget-object v4, v1, Lcom/trimline/metrocrew/theader;->Posted_By:Ljava/lang/String;

    if-nez v4, :cond_1d

    .line 517
    const/16 v4, 0x19

    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1d

    .line 519
    :cond_1d
    const/16 v4, 0x19

    iget-object v5, v1, Lcom/trimline/metrocrew/theader;->Posted_By:Ljava/lang/String;

    invoke-interface {v0, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 521
    :goto_1d
    iget v4, v1, Lcom/trimline/metrocrew/theader;->Print_No:I

    int-to-long v4, v4

    const/16 v14, 0x1a

    invoke-interface {v0, v14, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 522
    iget-object v4, v1, Lcom/trimline/metrocrew/theader;->Print_NoSpecified:Ljava/lang/Boolean;

    if-nez v4, :cond_1e

    const/4 v4, 0x0

    goto :goto_1e

    :cond_1e
    iget-object v4, v1, Lcom/trimline/metrocrew/theader;->Print_NoSpecified:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 523
    .local v4, "_tmp_11":Ljava/lang/Integer;
    :goto_1e
    if-nez v4, :cond_1f

    .line 524
    const/16 v5, 0x1b

    invoke-interface {v0, v5}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1f

    .line 526
    :cond_1f
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-long v14, v5

    const/16 v5, 0x1b

    invoke-interface {v0, v5, v14, v15}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 528
    :goto_1f
    iget-object v5, v1, Lcom/trimline/metrocrew/theader;->StatusSpecified:Ljava/lang/Boolean;

    if-nez v5, :cond_20

    const/4 v5, 0x0

    goto :goto_20

    :cond_20
    iget-object v5, v1, Lcom/trimline/metrocrew/theader;->StatusSpecified:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 529
    .local v5, "_tmp_12":Ljava/lang/Integer;
    :goto_20
    if-nez v5, :cond_21

    .line 530
    const/16 v14, 0x1c

    invoke-interface {v0, v14}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v18, v2

    goto :goto_21

    .line 532
    :cond_21
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v14

    int-to-long v14, v14

    move-object/from16 v18, v2

    .end local v2    # "_tmp":Ljava/lang/Long;
    .local v18, "_tmp":Ljava/lang/Long;
    const/16 v2, 0x1c

    invoke-interface {v0, v2, v14, v15}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 534
    :goto_21
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Cheque_No:Ljava/lang/String;

    if-nez v2, :cond_22

    .line 535
    const/16 v2, 0x1d

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_22

    .line 537
    :cond_22
    const/16 v2, 0x1d

    iget-object v14, v1, Lcom/trimline/metrocrew/theader;->Cheque_No:Ljava/lang/String;

    invoke-interface {v0, v2, v14}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 539
    :goto_22
    iget v2, v1, Lcom/trimline/metrocrew/theader;->No_Printed:I

    int-to-long v14, v2

    const/16 v2, 0x1e

    invoke-interface {v0, v2, v14, v15}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 540
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->No_PrintedSpecified:Ljava/lang/Boolean;

    if-nez v2, :cond_23

    const/4 v2, 0x0

    goto :goto_23

    :cond_23
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->No_PrintedSpecified:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 541
    .local v2, "_tmp_13":Ljava/lang/Integer;
    :goto_23
    if-nez v2, :cond_24

    .line 542
    const/16 v14, 0x1f

    invoke-interface {v0, v14}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v19, v2

    goto :goto_24

    .line 544
    :cond_24
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v14

    int-to-long v14, v14

    move-object/from16 v19, v2

    .end local v2    # "_tmp_13":Ljava/lang/Integer;
    .local v19, "_tmp_13":Ljava/lang/Integer;
    const/16 v2, 0x1f

    invoke-interface {v0, v2, v14, v15}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 546
    :goto_24
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Created_By:Ljava/lang/String;

    if-nez v2, :cond_25

    .line 547
    const/16 v2, 0x20

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_25

    .line 549
    :cond_25
    const/16 v2, 0x20

    iget-object v14, v1, Lcom/trimline/metrocrew/theader;->Created_By:Ljava/lang/String;

    invoke-interface {v0, v2, v14}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 551
    :goto_25
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Created_Date_Time:Ljava/sql/Date;

    invoke-static {v2}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v2

    .line 552
    .local v2, "_tmp_14":Ljava/lang/Long;
    if-nez v2, :cond_26

    .line 553
    const/16 v14, 0x21

    invoke-interface {v0, v14}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v20, v2

    move-object v15, v3

    goto :goto_26

    .line 555
    :cond_26
    const/16 v14, 0x21

    move-object/from16 v20, v2

    move-object v15, v3

    .end local v2    # "_tmp_14":Ljava/lang/Long;
    .end local v3    # "_tmp_1":Ljava/lang/Integer;
    .local v15, "_tmp_1":Ljava/lang/Integer;
    .local v20, "_tmp_14":Ljava/lang/Long;
    invoke-virtual/range {v20 .. v20}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {v0, v14, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 557
    :goto_26
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Created_Date_TimeSpecified:Ljava/lang/Boolean;

    if-nez v2, :cond_27

    const/4 v2, 0x0

    goto :goto_27

    :cond_27
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Created_Date_TimeSpecified:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 558
    .local v2, "_tmp_15":Ljava/lang/Integer;
    :goto_27
    if-nez v2, :cond_28

    .line 559
    const/16 v3, 0x22

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object v14, v2

    move-object/from16 v21, v4

    goto :goto_28

    .line 561
    :cond_28
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    move-object v14, v2

    .end local v2    # "_tmp_15":Ljava/lang/Integer;
    .local v14, "_tmp_15":Ljava/lang/Integer;
    int-to-long v2, v3

    move-object/from16 v21, v4

    .end local v4    # "_tmp_11":Ljava/lang/Integer;
    .local v21, "_tmp_11":Ljava/lang/Integer;
    const/16 v4, 0x22

    invoke-interface {v0, v4, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 563
    :goto_28
    iget v2, v1, Lcom/trimline/metrocrew/theader;->Register_No:I

    int-to-long v2, v2

    const/16 v4, 0x23

    invoke-interface {v0, v4, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 564
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Register_NoSpecified:Ljava/lang/Boolean;

    if-nez v2, :cond_29

    const/4 v2, 0x0

    goto :goto_29

    :cond_29
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Register_NoSpecified:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 565
    .local v2, "_tmp_16":Ljava/lang/Integer;
    :goto_29
    if-nez v2, :cond_2a

    .line 566
    const/16 v3, 0x24

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v22, v2

    goto :goto_2a

    .line 568
    :cond_2a
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-long v3, v3

    move-object/from16 v22, v2

    .end local v2    # "_tmp_16":Ljava/lang/Integer;
    .local v22, "_tmp_16":Ljava/lang/Integer;
    const/16 v2, 0x24

    invoke-interface {v0, v2, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 570
    :goto_2a
    iget v2, v1, Lcom/trimline/metrocrew/theader;->From_Entry_No:I

    int-to-long v2, v2

    const/16 v4, 0x25

    invoke-interface {v0, v4, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 571
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->From_Entry_NoSpecified:Ljava/lang/Boolean;

    if-nez v2, :cond_2b

    const/4 v2, 0x0

    goto :goto_2b

    :cond_2b
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->From_Entry_NoSpecified:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 572
    .local v2, "_tmp_17":Ljava/lang/Integer;
    :goto_2b
    if-nez v2, :cond_2c

    .line 573
    const/16 v3, 0x26

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v23, v2

    goto :goto_2c

    .line 575
    :cond_2c
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-long v3, v3

    move-object/from16 v23, v2

    .end local v2    # "_tmp_17":Ljava/lang/Integer;
    .local v23, "_tmp_17":Ljava/lang/Integer;
    const/16 v2, 0x26

    invoke-interface {v0, v2, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 577
    :goto_2c
    iget v2, v1, Lcom/trimline/metrocrew/theader;->To_Entry_No:I

    int-to-long v2, v2

    const/16 v4, 0x27

    invoke-interface {v0, v4, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 578
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->To_Entry_NoSpecified:Ljava/lang/Boolean;

    if-nez v2, :cond_2d

    const/4 v2, 0x0

    goto :goto_2d

    :cond_2d
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->To_Entry_NoSpecified:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 579
    .local v2, "_tmp_18":Ljava/lang/Integer;
    :goto_2d
    if-nez v2, :cond_2e

    .line 580
    const/16 v3, 0x28

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v24, v2

    goto :goto_2e

    .line 582
    :cond_2e
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-long v3, v3

    move-object/from16 v24, v2

    .end local v2    # "_tmp_18":Ljava/lang/Integer;
    .local v24, "_tmp_18":Ljava/lang/Integer;
    const/16 v2, 0x28

    invoke-interface {v0, v2, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 584
    :goto_2e
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Document_Date:Ljava/sql/Date;

    invoke-static {v2}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v2

    .line 585
    .local v2, "_tmp_19":Ljava/lang/Long;
    if-nez v2, :cond_2f

    .line 586
    const/16 v3, 0x29

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v25, v5

    goto :goto_2f

    .line 588
    :cond_2f
    const/16 v3, 0x29

    move-object/from16 v25, v5

    .end local v5    # "_tmp_12":Ljava/lang/Integer;
    .local v25, "_tmp_12":Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-interface {v0, v3, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 590
    :goto_2f
    iget-object v3, v1, Lcom/trimline/metrocrew/theader;->Document_DateSpecified:Ljava/lang/Boolean;

    if-nez v3, :cond_30

    const/4 v3, 0x0

    goto :goto_30

    :cond_30
    iget-object v3, v1, Lcom/trimline/metrocrew/theader;->Document_DateSpecified:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 591
    .local v3, "_tmp_20":Ljava/lang/Integer;
    :goto_30
    if-nez v3, :cond_31

    .line 592
    const/16 v4, 0x2a

    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v26, v2

    goto :goto_31

    .line 594
    :cond_31
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-long v4, v4

    move-object/from16 v26, v2

    .end local v2    # "_tmp_19":Ljava/lang/Long;
    .local v26, "_tmp_19":Ljava/lang/Long;
    const/16 v2, 0x2a

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 596
    :goto_31
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Responsibility_Center:Ljava/lang/String;

    if-nez v2, :cond_32

    .line 597
    const/16 v2, 0x2b

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_32

    .line 599
    :cond_32
    const/16 v2, 0x2b

    iget-object v4, v1, Lcom/trimline/metrocrew/theader;->Responsibility_Center:Ljava/lang/String;

    invoke-interface {v0, v2, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 601
    :goto_32
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Shortcut_Dimension_3_Code:Ljava/lang/String;

    if-nez v2, :cond_33

    .line 602
    const/16 v2, 0x2c

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_33

    .line 604
    :cond_33
    const/16 v2, 0x2c

    iget-object v4, v1, Lcom/trimline/metrocrew/theader;->Shortcut_Dimension_3_Code:Ljava/lang/String;

    invoke-interface {v0, v2, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 606
    :goto_33
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Shortcut_Dimension_4_Code:Ljava/lang/String;

    if-nez v2, :cond_34

    .line 607
    const/16 v2, 0x2d

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_34

    .line 609
    :cond_34
    const/16 v2, 0x2d

    iget-object v4, v1, Lcom/trimline/metrocrew/theader;->Shortcut_Dimension_4_Code:Ljava/lang/String;

    invoke-interface {v0, v2, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 611
    :goto_34
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Dim3:Ljava/lang/String;

    if-nez v2, :cond_35

    .line 612
    const/16 v2, 0x2e

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_35

    .line 614
    :cond_35
    const/16 v2, 0x2e

    iget-object v4, v1, Lcom/trimline/metrocrew/theader;->Dim3:Ljava/lang/String;

    invoke-interface {v0, v2, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 616
    :goto_35
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Dim4:Ljava/lang/String;

    if-nez v2, :cond_36

    .line 617
    const/16 v2, 0x2f

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_36

    .line 619
    :cond_36
    const/16 v2, 0x2f

    iget-object v4, v1, Lcom/trimline/metrocrew/theader;->Dim4:Ljava/lang/String;

    invoke-interface {v0, v2, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 621
    :goto_36
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Bank_Name:Ljava/lang/String;

    if-nez v2, :cond_37

    .line 622
    const/16 v2, 0x30

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_37

    .line 624
    :cond_37
    const/16 v2, 0x30

    iget-object v4, v1, Lcom/trimline/metrocrew/theader;->Bank_Name:Ljava/lang/String;

    invoke-interface {v0, v2, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 626
    :goto_37
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Receipt_TypeSpecified:Ljava/lang/Boolean;

    if-nez v2, :cond_38

    const/4 v2, 0x0

    goto :goto_38

    :cond_38
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Receipt_TypeSpecified:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 627
    .local v2, "_tmp_21":Ljava/lang/Integer;
    :goto_38
    if-nez v2, :cond_39

    .line 628
    const/16 v4, 0x31

    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v27, v2

    goto :goto_39

    .line 630
    :cond_39
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-long v4, v4

    move-object/from16 v27, v2

    .end local v2    # "_tmp_21":Ljava/lang/Integer;
    .local v27, "_tmp_21":Ljava/lang/Integer;
    const/16 v2, 0x31

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 632
    :goto_39
    iget v2, v1, Lcom/trimline/metrocrew/theader;->Dimension_Set_ID:I

    int-to-long v4, v2

    const/16 v2, 0x32

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 633
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Dimension_Set_IDSpecified:Ljava/lang/Boolean;

    if-nez v2, :cond_3a

    const/4 v2, 0x0

    goto :goto_3a

    :cond_3a
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Dimension_Set_IDSpecified:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 634
    .local v2, "_tmp_22":Ljava/lang/Integer;
    :goto_3a
    if-nez v2, :cond_3b

    .line 635
    const/16 v4, 0x33

    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v28, v2

    goto :goto_3b

    .line 637
    :cond_3b
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-long v4, v4

    move-object/from16 v28, v2

    .end local v2    # "_tmp_22":Ljava/lang/Integer;
    .local v28, "_tmp_22":Ljava/lang/Integer;
    const/16 v2, 0x33

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 639
    :goto_3b
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Dim1:Ljava/lang/String;

    if-nez v2, :cond_3c

    .line 640
    const/16 v2, 0x34

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_3c

    .line 642
    :cond_3c
    const/16 v2, 0x34

    iget-object v4, v1, Lcom/trimline/metrocrew/theader;->Dim1:Ljava/lang/String;

    invoke-interface {v0, v2, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 644
    :goto_3c
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Dim2:Ljava/lang/String;

    if-nez v2, :cond_3d

    .line 645
    const/16 v2, 0x35

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_3d

    .line 647
    :cond_3d
    const/16 v2, 0x35

    iget-object v4, v1, Lcom/trimline/metrocrew/theader;->Dim2:Ljava/lang/String;

    invoke-interface {v0, v2, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 649
    :goto_3d
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Account_No:Ljava/lang/String;

    if-nez v2, :cond_3e

    .line 650
    const/16 v2, 0x36

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_3e

    .line 652
    :cond_3e
    const/16 v2, 0x36

    iget-object v4, v1, Lcom/trimline/metrocrew/theader;->Account_No:Ljava/lang/String;

    invoke-interface {v0, v2, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 654
    :goto_3e
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Name:Ljava/lang/String;

    if-nez v2, :cond_3f

    .line 655
    const/16 v2, 0x37

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_3f

    .line 657
    :cond_3f
    const/16 v2, 0x37

    iget-object v4, v1, Lcom/trimline/metrocrew/theader;->Name:Ljava/lang/String;

    invoke-interface {v0, v2, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 659
    :goto_3f
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->PayMode:Ljava/lang/String;

    if-nez v2, :cond_40

    .line 660
    const/16 v2, 0x38

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_40

    .line 662
    :cond_40
    const/16 v2, 0x38

    iget-object v4, v1, Lcom/trimline/metrocrew/theader;->PayMode:Ljava/lang/String;

    invoke-interface {v0, v2, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 664
    :goto_40
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Pay_ModeSpecified:Ljava/lang/Boolean;

    if-nez v2, :cond_41

    const/4 v2, 0x0

    goto :goto_41

    :cond_41
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Pay_ModeSpecified:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 665
    .local v2, "_tmp_23":Ljava/lang/Integer;
    :goto_41
    if-nez v2, :cond_42

    .line 666
    const/16 v4, 0x39

    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v29, v2

    goto :goto_42

    .line 668
    :cond_42
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-long v4, v4

    move-object/from16 v29, v2

    .end local v2    # "_tmp_23":Ljava/lang/Integer;
    .local v29, "_tmp_23":Ljava/lang/Integer;
    const/16 v2, 0x39

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 670
    :goto_42
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Cheque_Deposit_Slip_No:Ljava/lang/String;

    if-nez v2, :cond_43

    .line 671
    const/16 v2, 0x3a

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_43

    .line 673
    :cond_43
    const/16 v2, 0x3a

    iget-object v4, v1, Lcom/trimline/metrocrew/theader;->Cheque_Deposit_Slip_No:Ljava/lang/String;

    invoke-interface {v0, v2, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 675
    :goto_43
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Cheque_Deposit_Slip_Date:Ljava/sql/Date;

    invoke-static {v2}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v2

    .line 676
    .local v2, "_tmp_24":Ljava/lang/Long;
    if-nez v2, :cond_44

    .line 677
    const/16 v4, 0x3b

    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v30, v2

    move-object v5, v3

    goto :goto_44

    .line 679
    :cond_44
    const/16 v4, 0x3b

    move-object/from16 v30, v2

    move-object v5, v3

    .end local v2    # "_tmp_24":Ljava/lang/Long;
    .end local v3    # "_tmp_20":Ljava/lang/Integer;
    .local v5, "_tmp_20":Ljava/lang/Integer;
    .local v30, "_tmp_24":Ljava/lang/Long;
    invoke-virtual/range {v30 .. v30}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {v0, v4, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 681
    :goto_44
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Cheque_Deposit_Slip_DateSpecified:Ljava/lang/Boolean;

    if-nez v2, :cond_45

    const/4 v2, 0x0

    goto :goto_45

    :cond_45
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Cheque_Deposit_Slip_DateSpecified:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 682
    .local v2, "_tmp_25":Ljava/lang/Integer;
    :goto_45
    if-nez v2, :cond_46

    .line 683
    const/16 v3, 0x3c

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v31, v2

    goto :goto_46

    .line 685
    :cond_46
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-long v3, v3

    move-object/from16 v31, v2

    .end local v2    # "_tmp_25":Ljava/lang/Integer;
    .local v31, "_tmp_25":Ljava/lang/Integer;
    const/16 v2, 0x3c

    invoke-interface {v0, v2, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 687
    :goto_46
    iget v2, v1, Lcom/trimline/metrocrew/theader;->Total_Amount_Guaranteed:F

    float-to-double v2, v2

    const/16 v4, 0x3d

    invoke-interface {v0, v4, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 688
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Total_Amount_GuaranteedSpecified:Ljava/lang/Boolean;

    if-nez v2, :cond_47

    const/4 v2, 0x0

    goto :goto_47

    :cond_47
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Total_Amount_GuaranteedSpecified:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    .line 689
    .local v2, "_tmp_26":Ljava/lang/Integer;
    :goto_47
    if-nez v2, :cond_48

    .line 690
    const/16 v3, 0x3e

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v32, v2

    goto :goto_48

    .line 692
    :cond_48
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-long v3, v3

    move-object/from16 v32, v2

    .end local v2    # "_tmp_26":Ljava/lang/Integer;
    .local v32, "_tmp_26":Ljava/lang/Integer;
    const/16 v2, 0x3e

    invoke-interface {v0, v2, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 694
    :goto_48
    iget v2, v1, Lcom/trimline/metrocrew/theader;->DFLT:F

    float-to-double v2, v2

    const/16 v4, 0x3f

    invoke-interface {v0, v4, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 695
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->DFLTSpecified:Ljava/lang/Boolean;

    if-nez v2, :cond_49

    const/4 v4, 0x0

    goto :goto_49

    :cond_49
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->DFLTSpecified:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 696
    .local v4, "_tmp_27":Ljava/lang/Integer;
    :goto_49
    if-nez v4, :cond_4a

    .line 697
    const/16 v2, 0x40

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v16, v4

    goto :goto_4a

    .line 699
    :cond_4a
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-long v2, v2

    move-object/from16 v16, v4

    .end local v4    # "_tmp_27":Ljava/lang/Integer;
    .local v16, "_tmp_27":Ljava/lang/Integer;
    const/16 v4, 0x40

    invoke-interface {v0, v4, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 701
    :goto_4a
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Group_Name:Ljava/lang/String;

    if-nez v2, :cond_4b

    .line 702
    const/16 v2, 0x41

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4b

    .line 704
    :cond_4b
    const/16 v2, 0x41

    iget-object v3, v1, Lcom/trimline/metrocrew/theader;->Group_Name:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 706
    :goto_4b
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Reference_No:Ljava/lang/String;

    if-nez v2, :cond_4c

    .line 707
    const/16 v2, 0x42

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4c

    .line 709
    :cond_4c
    const/16 v2, 0x42

    iget-object v3, v1, Lcom/trimline/metrocrew/theader;->Reference_No:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 711
    :goto_4c
    iget-object v2, v1, Lcom/trimline/metrocrew/theader;->Bank_Ref_No:Ljava/lang/String;

    if-nez v2, :cond_4d

    .line 712
    const/16 v2, 0x43

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4d

    .line 714
    :cond_4d
    const/16 v2, 0x43

    iget-object v3, v1, Lcom/trimline/metrocrew/theader;->Bank_Ref_No:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 716
    :goto_4d
    iget-boolean v2, v1, Lcom/trimline/metrocrew/theader;->sent:Z

    .line 717
    .local v2, "_tmp_28":I
    const/16 v3, 0x44

    move-object/from16 v33, v5

    .end local v5    # "_tmp_20":Ljava/lang/Integer;
    .local v33, "_tmp_20":Ljava/lang/Integer;
    int-to-long v4, v2

    invoke-interface {v0, v3, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 718
    iget-object v3, v1, Lcom/trimline/metrocrew/theader;->No:Ljava/lang/String;

    if-nez v3, :cond_4e

    .line 719
    const/16 v3, 0x45

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4e

    .line 721
    :cond_4e
    const/16 v3, 0x45

    iget-object v4, v1, Lcom/trimline/metrocrew/theader;->No:Ljava/lang/String;

    invoke-interface {v0, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 723
    :goto_4e
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

    .line 388
    check-cast p2, Lcom/trimline/metrocrew/theader;

    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/theader_dao_Impl$3;->bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/theader;)V

    return-void
.end method

.method protected createQuery()Ljava/lang/String;
    .locals 1

    .line 392
    const-string v0, "UPDATE OR ABORT `theader` SET `Key` = ?,`No` = ?,`Date` = ?,`DateSpecified` = ?,`Cashier` = ?,`Date_Posted` = ?,`Date_PostedSpecified` = ?,`Time_Posted` = ?,`Time_PostedSpecified` = ?,`Posted` = ?,`PostedSpecified` = ?,`No_Series` = ?,`Bank_Code` = ?,`Received_From` = ?,`On_Behalf_Of` = ?,`Amount_Recieved` = ?,`Amount_RecievedSpecified` = ?,`Global_Dimension_1_Code` = ?,`Shortcut_Dimension_2_Code` = ?,`Currency_Code` = ?,`Currency_Factor` = ?,`Currency_FactorSpecified` = ?,`Total_Amount` = ?,`Total_AmountSpecified` = ?,`Posted_By` = ?,`Print_No` = ?,`Print_NoSpecified` = ?,`StatusSpecified` = ?,`Cheque_No` = ?,`No_Printed` = ?,`No_PrintedSpecified` = ?,`Created_By` = ?,`Created_Date_Time` = ?,`Created_Date_TimeSpecified` = ?,`Register_No` = ?,`Register_NoSpecified` = ?,`From_Entry_No` = ?,`From_Entry_NoSpecified` = ?,`To_Entry_No` = ?,`To_Entry_NoSpecified` = ?,`Document_Date` = ?,`Document_DateSpecified` = ?,`Responsibility_Center` = ?,`Shortcut_Dimension_3_Code` = ?,`Shortcut_Dimension_4_Code` = ?,`Dim3` = ?,`Dim4` = ?,`Bank_Name` = ?,`Receipt_TypeSpecified` = ?,`Dimension_Set_ID` = ?,`Dimension_Set_IDSpecified` = ?,`Dim1` = ?,`Dim2` = ?,`Account_No` = ?,`Name` = ?,`PayMode` = ?,`Pay_ModeSpecified` = ?,`Cheque_Deposit_Slip_No` = ?,`Cheque_Deposit_Slip_Date` = ?,`Cheque_Deposit_Slip_DateSpecified` = ?,`Total_Amount_Guaranteed` = ?,`Total_Amount_GuaranteedSpecified` = ?,`DFLT` = ?,`DFLTSpecified` = ?,`Group_Name` = ?,`Reference_No` = ?,`Bank_Ref_No` = ?,`sent` = ? WHERE `No` = ?"

    return-object v0
.end method
