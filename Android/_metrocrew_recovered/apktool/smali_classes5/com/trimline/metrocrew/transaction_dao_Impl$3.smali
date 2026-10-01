.class Lcom/trimline/metrocrew/transaction_dao_Impl$3;
.super Landroidx/room/EntityDeleteOrUpdateAdapter;
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
        "Landroidx/room/EntityDeleteOrUpdateAdapter<",
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

    .line 478
    iput-object p1, p0, Lcom/trimline/metrocrew/transaction_dao_Impl$3;->this$0:Lcom/trimline/metrocrew/transaction_dao_Impl;

    invoke-direct {p0}, Landroidx/room/EntityDeleteOrUpdateAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method protected bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/transaction;)V
    .locals 27
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

    .line 487
    move-object/from16 v0, p1

    move-object/from16 v1, p2

    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Key:Ljava/lang/String;

    const/4 v3, 0x1

    if-nez v2, :cond_0

    .line 488
    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 490
    :cond_0
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Key:Ljava/lang/String;

    invoke-interface {v0, v3, v2}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 492
    :goto_0
    iget v2, v1, Lcom/trimline/metrocrew/transaction;->Entry_No:I

    int-to-long v2, v2

    const/4 v4, 0x2

    invoke-interface {v0, v4, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 493
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->No:Ljava/lang/String;

    const/4 v3, 0x3

    if-nez v2, :cond_1

    .line 494
    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 496
    :cond_1
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->No:Ljava/lang/String;

    invoke-interface {v0, v3, v2}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 498
    :goto_1
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Date:Ljava/sql/Date;

    invoke-static {v2}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v2

    .line 499
    .local v2, "_tmp":Ljava/lang/Long;
    const/4 v3, 0x4

    if-nez v2, :cond_2

    .line 500
    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2

    .line 502
    :cond_2
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-interface {v0, v3, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 504
    :goto_2
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Type:Ljava/lang/String;

    const/4 v4, 0x5

    if-nez v3, :cond_3

    .line 505
    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_3

    .line 507
    :cond_3
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Type:Ljava/lang/String;

    invoke-interface {v0, v4, v3}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 509
    :goto_3
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    const/4 v4, 0x6

    if-nez v3, :cond_4

    .line 510
    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4

    .line 512
    :cond_4
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    invoke-interface {v0, v4, v3}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 514
    :goto_4
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->PayMode:Ljava/lang/String;

    const/4 v4, 0x7

    if-nez v3, :cond_5

    .line 515
    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_5

    .line 517
    :cond_5
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->PayMode:Ljava/lang/String;

    invoke-interface {v0, v4, v3}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 519
    :goto_5
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Pay_Mode:Ljava/lang/String;

    const/16 v4, 0x8

    if-nez v3, :cond_6

    .line 520
    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_6

    .line 522
    :cond_6
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Pay_Mode:Ljava/lang/String;

    invoke-interface {v0, v4, v3}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 524
    :goto_6
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_No:Ljava/lang/String;

    const/16 v4, 0x9

    if-nez v3, :cond_7

    .line 525
    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_7

    .line 527
    :cond_7
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_No:Ljava/lang/String;

    invoke-interface {v0, v4, v3}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 529
    :goto_7
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_Date:Ljava/sql/Date;

    invoke-static {v3}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v3

    .line 530
    .local v3, "_tmp_1":Ljava/lang/Long;
    const/16 v4, 0xa

    if-nez v3, :cond_8

    .line 531
    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_8

    .line 533
    :cond_8
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-interface {v0, v4, v5, v6}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 535
    :goto_8
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Bank_Code:Ljava/lang/String;

    const/16 v5, 0xb

    if-nez v4, :cond_9

    .line 536
    invoke-interface {v0, v5}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_9

    .line 538
    :cond_9
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Bank_Code:Ljava/lang/String;

    invoke-interface {v0, v5, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 540
    :goto_9
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Received_From:Ljava/lang/String;

    const/16 v5, 0xc

    if-nez v4, :cond_a

    .line 541
    invoke-interface {v0, v5}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_a

    .line 543
    :cond_a
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Received_From:Ljava/lang/String;

    invoke-interface {v0, v5, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 545
    :goto_a
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->On_Behalf_Of:Ljava/lang/String;

    const/16 v5, 0xd

    if-nez v4, :cond_b

    .line 546
    invoke-interface {v0, v5}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_b

    .line 548
    :cond_b
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->On_Behalf_Of:Ljava/lang/String;

    invoke-interface {v0, v5, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 550
    :goto_b
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Cashier:Ljava/lang/String;

    const/16 v5, 0xe

    if-nez v4, :cond_c

    .line 551
    invoke-interface {v0, v5}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_c

    .line 553
    :cond_c
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Cashier:Ljava/lang/String;

    invoke-interface {v0, v5, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 555
    :goto_c
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Account_No:Ljava/lang/String;

    const/16 v5, 0xf

    if-nez v4, :cond_d

    .line 556
    invoke-interface {v0, v5}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_d

    .line 558
    :cond_d
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Account_No:Ljava/lang/String;

    invoke-interface {v0, v5, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 560
    :goto_d
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Account_Name:Ljava/lang/String;

    const/16 v5, 0x10

    if-nez v4, :cond_e

    .line 561
    invoke-interface {v0, v5}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_e

    .line 563
    :cond_e
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Account_Name:Ljava/lang/String;

    invoke-interface {v0, v5, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 565
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

    .line 566
    .local v4, "_tmp_2":Ljava/lang/Integer;
    :goto_f
    const/16 v6, 0x11

    if-nez v4, :cond_10

    .line 567
    invoke-interface {v0, v6}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_10

    .line 569
    :cond_10
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v7

    int-to-long v7, v7

    invoke-interface {v0, v6, v7, v8}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 571
    :goto_10
    iget-object v6, v1, Lcom/trimline/metrocrew/transaction;->Date_Posted:Ljava/sql/Date;

    invoke-static {v6}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v6

    .line 572
    .local v6, "_tmp_3":Ljava/lang/Long;
    const/16 v7, 0x12

    if-nez v6, :cond_11

    .line 573
    invoke-interface {v0, v7}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_11

    .line 575
    :cond_11
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    invoke-interface {v0, v7, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 577
    :goto_11
    iget-object v7, v1, Lcom/trimline/metrocrew/transaction;->Time_Posted:Ljava/sql/Date;

    invoke-static {v7}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v7

    .line 578
    .local v7, "_tmp_4":Ljava/lang/Long;
    const/16 v8, 0x13

    if-nez v7, :cond_12

    .line 579
    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_12

    .line 581
    :cond_12
    invoke-virtual {v7}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    invoke-interface {v0, v8, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 583
    :goto_12
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Posted_By:Ljava/lang/String;

    const/16 v9, 0x14

    if-nez v8, :cond_13

    .line 584
    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_13

    .line 586
    :cond_13
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Posted_By:Ljava/lang/String;

    invoke-interface {v0, v9, v8}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 588
    :goto_13
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Amount:Ljava/lang/Double;

    const/16 v9, 0x15

    if-nez v8, :cond_14

    .line 589
    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_14

    .line 591
    :cond_14
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Amount:Ljava/lang/Double;

    invoke-virtual {v8}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v10

    invoke-interface {v0, v9, v10, v11}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 593
    :goto_14
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Remarks:Ljava/lang/String;

    const/16 v9, 0x16

    if-nez v8, :cond_15

    .line 594
    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_15

    .line 596
    :cond_15
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Remarks:Ljava/lang/String;

    invoke-interface {v0, v9, v8}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 598
    :goto_15
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Transaction_Name:Ljava/lang/String;

    if-nez v8, :cond_16

    .line 599
    const/16 v8, 0x17

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_16

    .line 601
    :cond_16
    const/16 v8, 0x17

    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Transaction_Name:Ljava/lang/String;

    invoke-interface {v0, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 603
    :goto_16
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Branch_Code:Ljava/lang/String;

    if-nez v8, :cond_17

    .line 604
    const/16 v8, 0x18

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_17

    .line 606
    :cond_17
    const/16 v8, 0x18

    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Branch_Code:Ljava/lang/String;

    invoke-interface {v0, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 608
    :goto_17
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Agent_Code:Ljava/lang/String;

    if-nez v8, :cond_18

    .line 609
    const/16 v8, 0x19

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_18

    .line 611
    :cond_18
    const/16 v8, 0x19

    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Agent_Code:Ljava/lang/String;

    invoke-interface {v0, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 613
    :goto_18
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Grouping:Ljava/lang/String;

    if-nez v8, :cond_19

    .line 614
    const/16 v8, 0x1a

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_19

    .line 616
    :cond_19
    const/16 v8, 0x1a

    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Grouping:Ljava/lang/String;

    invoke-interface {v0, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 618
    :goto_19
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Global_Dimension_1_Code:Ljava/lang/String;

    if-nez v8, :cond_1a

    .line 619
    const/16 v8, 0x1b

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1a

    .line 621
    :cond_1a
    const/16 v8, 0x1b

    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Global_Dimension_1_Code:Ljava/lang/String;

    invoke-interface {v0, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 623
    :goto_1a
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Shortcut_Dimension_2_Code:Ljava/lang/String;

    if-nez v8, :cond_1b

    .line 624
    const/16 v8, 0x1c

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1b

    .line 626
    :cond_1b
    const/16 v8, 0x1c

    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Shortcut_Dimension_2_Code:Ljava/lang/String;

    invoke-interface {v0, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 628
    :goto_1b
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->VAT_Percent:Ljava/lang/Double;

    if-nez v8, :cond_1c

    .line 629
    const/16 v8, 0x1d

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1c

    .line 631
    :cond_1c
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->VAT_Percent:Ljava/lang/Double;

    invoke-virtual {v8}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    const/16 v10, 0x1d

    invoke-interface {v0, v10, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 633
    :goto_1c
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Currency_Code:Ljava/lang/String;

    if-nez v8, :cond_1d

    .line 634
    const/16 v8, 0x1e

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1d

    .line 636
    :cond_1d
    const/16 v8, 0x1e

    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Currency_Code:Ljava/lang/String;

    invoke-interface {v0, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 638
    :goto_1d
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Currency_Factor:Ljava/lang/Double;

    if-nez v8, :cond_1e

    .line 639
    const/16 v8, 0x1f

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1e

    .line 641
    :cond_1e
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->Currency_Factor:Ljava/lang/Double;

    invoke-virtual {v8}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v8

    const/16 v10, 0x1f

    invoke-interface {v0, v10, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 643
    :goto_1e
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->VAT_Bus_Posting_Group:Ljava/lang/String;

    if-nez v8, :cond_1f

    .line 644
    const/16 v8, 0x20

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1f

    .line 646
    :cond_1f
    const/16 v8, 0x20

    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->VAT_Bus_Posting_Group:Ljava/lang/String;

    invoke-interface {v0, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 648
    :goto_1f
    iget-object v8, v1, Lcom/trimline/metrocrew/transaction;->VAT_Prod_Posting_Group:Ljava/lang/String;

    if-nez v8, :cond_20

    .line 649
    const/16 v8, 0x21

    invoke-interface {v0, v8}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_20

    .line 651
    :cond_20
    const/16 v8, 0x21

    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->VAT_Prod_Posting_Group:Ljava/lang/String;

    invoke-interface {v0, v8, v9}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 653
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

    .line 654
    .local v8, "_tmp_5":Ljava/lang/Integer;
    :goto_21
    if-nez v8, :cond_22

    .line 655
    const/16 v9, 0x22

    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_22

    .line 657
    :cond_22
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v9

    int-to-long v9, v9

    const/16 v11, 0x22

    invoke-interface {v0, v11, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 659
    :goto_22
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Gen_Bus_Posting_Group:Ljava/lang/String;

    if-nez v9, :cond_23

    .line 660
    const/16 v9, 0x23

    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_23

    .line 662
    :cond_23
    const/16 v9, 0x23

    iget-object v10, v1, Lcom/trimline/metrocrew/transaction;->Gen_Bus_Posting_Group:Ljava/lang/String;

    invoke-interface {v0, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 664
    :goto_23
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Gen_Prod_Posting_Group:Ljava/lang/String;

    if-nez v9, :cond_24

    .line 665
    const/16 v9, 0x24

    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_24

    .line 667
    :cond_24
    const/16 v9, 0x24

    iget-object v10, v1, Lcom/trimline/metrocrew/transaction;->Gen_Prod_Posting_Group:Ljava/lang/String;

    invoke-interface {v0, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 669
    :goto_24
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->VAT_Amount:Ljava/lang/Double;

    if-nez v9, :cond_25

    .line 670
    const/16 v9, 0x25

    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_25

    .line 672
    :cond_25
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->VAT_Amount:Ljava/lang/Double;

    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v9

    const/16 v11, 0x25

    invoke-interface {v0, v11, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 674
    :goto_25
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Total_Amount:Ljava/lang/Double;

    if-nez v9, :cond_26

    .line 675
    const/16 v9, 0x26

    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_26

    .line 677
    :cond_26
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Total_Amount:Ljava/lang/Double;

    invoke-virtual {v9}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v9

    const/16 v11, 0x26

    invoke-interface {v0, v11, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 679
    :goto_26
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->User_ID:Ljava/lang/String;

    if-nez v9, :cond_27

    .line 680
    const/16 v9, 0x27

    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_27

    .line 682
    :cond_27
    const/16 v9, 0x27

    iget-object v10, v1, Lcom/trimline/metrocrew/transaction;->User_ID:Ljava/lang/String;

    invoke-interface {v0, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 684
    :goto_27
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Apply_to:Ljava/lang/String;

    if-nez v9, :cond_28

    .line 685
    const/16 v9, 0x28

    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_28

    .line 687
    :cond_28
    const/16 v9, 0x28

    iget-object v10, v1, Lcom/trimline/metrocrew/transaction;->Apply_to:Ljava/lang/String;

    invoke-interface {v0, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 689
    :goto_28
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Apply_to_ID:Ljava/lang/String;

    if-nez v9, :cond_29

    .line 690
    const/16 v9, 0x29

    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_29

    .line 692
    :cond_29
    const/16 v9, 0x29

    iget-object v10, v1, Lcom/trimline/metrocrew/transaction;->Apply_to_ID:Ljava/lang/String;

    invoke-interface {v0, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 694
    :goto_29
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Dest_Global_Dimension_1_Code:Ljava/lang/String;

    if-nez v9, :cond_2a

    .line 695
    const/16 v9, 0x2a

    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2a

    .line 697
    :cond_2a
    const/16 v9, 0x2a

    iget-object v10, v1, Lcom/trimline/metrocrew/transaction;->Dest_Global_Dimension_1_Code:Ljava/lang/String;

    invoke-interface {v0, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 699
    :goto_2a
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Dest_Shortcut_Dimension_2_Code:Ljava/lang/String;

    if-nez v9, :cond_2b

    .line 700
    const/16 v9, 0x2b

    invoke-interface {v0, v9}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2b

    .line 702
    :cond_2b
    const/16 v9, 0x2b

    iget-object v10, v1, Lcom/trimline/metrocrew/transaction;->Dest_Shortcut_Dimension_2_Code:Ljava/lang/String;

    invoke-interface {v0, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 704
    :goto_2b
    iget v9, v1, Lcom/trimline/metrocrew/transaction;->Line_No:I

    int-to-long v9, v9

    const/16 v11, 0x2c

    invoke-interface {v0, v11, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 705
    iget v9, v1, Lcom/trimline/metrocrew/transaction;->Print_No:I

    int-to-long v9, v9

    const/16 v11, 0x2d

    invoke-interface {v0, v11, v9, v10}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 706
    iget-object v9, v1, Lcom/trimline/metrocrew/transaction;->Deposit_Slip_Time:Ljava/sql/Date;

    invoke-static {v9}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v9

    .line 707
    .local v9, "_tmp_6":Ljava/lang/Long;
    if-nez v9, :cond_2c

    .line 708
    const/16 v10, 0x2e

    invoke-interface {v0, v10}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2c

    .line 710
    :cond_2c
    const/16 v10, 0x2e

    invoke-virtual {v9}, Ljava/lang/Long;->longValue()J

    move-result-wide v11

    invoke-interface {v0, v10, v11, v12}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 712
    :goto_2c
    iget-object v10, v1, Lcom/trimline/metrocrew/transaction;->Teller_ID:Ljava/lang/String;

    if-nez v10, :cond_2d

    .line 713
    const/16 v10, 0x2f

    invoke-interface {v0, v10}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2d

    .line 715
    :cond_2d
    const/16 v10, 0x2f

    iget-object v11, v1, Lcom/trimline/metrocrew/transaction;->Teller_ID:Ljava/lang/String;

    invoke-interface {v0, v10, v11}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 717
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

    .line 718
    .local v10, "_tmp_7":Ljava/lang/Integer;
    :goto_2e
    if-nez v10, :cond_2f

    .line 719
    const/16 v11, 0x30

    invoke-interface {v0, v11}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2f

    .line 721
    :cond_2f
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    move-result v11

    int-to-long v11, v11

    const/16 v13, 0x30

    invoke-interface {v0, v13, v11, v12}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 723
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

    .line 724
    .local v11, "_tmp_8":Ljava/lang/Integer;
    :goto_30
    if-nez v11, :cond_31

    .line 725
    const/16 v12, 0x31

    invoke-interface {v0, v12}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_31

    .line 727
    :cond_31
    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v12

    int-to-long v12, v12

    const/16 v14, 0x31

    invoke-interface {v0, v14, v12, v13}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 729
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

    .line 730
    .local v12, "_tmp_9":Ljava/lang/Integer;
    :goto_32
    if-nez v12, :cond_33

    .line 731
    const/16 v13, 0x32

    invoke-interface {v0, v13}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_33

    .line 733
    :cond_33
    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v13

    int-to-long v13, v13

    const/16 v15, 0x32

    invoke-interface {v0, v15, v13, v14}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 735
    :goto_33
    iget-object v13, v1, Lcom/trimline/metrocrew/transaction;->Transaction_No:Ljava/lang/String;

    if-nez v13, :cond_34

    .line 736
    const/16 v13, 0x33

    invoke-interface {v0, v13}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_34

    .line 738
    :cond_34
    const/16 v13, 0x33

    iget-object v14, v1, Lcom/trimline/metrocrew/transaction;->Transaction_No:Ljava/lang/String;

    invoke-interface {v0, v13, v14}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 740
    :goto_34
    iget-object v13, v1, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_Bank:Ljava/lang/String;

    if-nez v13, :cond_35

    .line 741
    const/16 v13, 0x34

    invoke-interface {v0, v13}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_35

    .line 743
    :cond_35
    const/16 v13, 0x34

    iget-object v14, v1, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_Bank:Ljava/lang/String;

    invoke-interface {v0, v13, v14}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 745
    :goto_35
    iget-object v13, v1, Lcom/trimline/metrocrew/transaction;->Bank_Account:Ljava/lang/String;

    if-nez v13, :cond_36

    .line 746
    const/16 v13, 0x35

    invoke-interface {v0, v13}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_36

    .line 748
    :cond_36
    const/16 v13, 0x35

    iget-object v14, v1, Lcom/trimline/metrocrew/transaction;->Bank_Account:Ljava/lang/String;

    invoke-interface {v0, v13, v14}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 750
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

    .line 751
    .local v13, "_tmp_10":Ljava/lang/Integer;
    :goto_37
    if-nez v13, :cond_38

    .line 752
    const/16 v14, 0x36

    invoke-interface {v0, v14}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_38

    .line 754
    :cond_38
    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v14

    int-to-long v14, v14

    const/16 v5, 0x36

    invoke-interface {v0, v5, v14, v15}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 756
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

    .line 757
    .local v5, "_tmp_11":Ljava/lang/Integer;
    :goto_39
    if-nez v5, :cond_3a

    .line 758
    const/16 v14, 0x37

    invoke-interface {v0, v14}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v17, v2

    goto :goto_3a

    .line 760
    :cond_3a
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v14

    int-to-long v14, v14

    move-object/from16 v17, v2

    .end local v2    # "_tmp":Ljava/lang/Long;
    .local v17, "_tmp":Ljava/lang/Long;
    const/16 v2, 0x37

    invoke-interface {v0, v2, v14, v15}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 762
    :goto_3a
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Orig_Cashier:Ljava/lang/String;

    if-nez v2, :cond_3b

    .line 763
    const/16 v2, 0x38

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_3b

    .line 765
    :cond_3b
    const/16 v2, 0x38

    iget-object v14, v1, Lcom/trimline/metrocrew/transaction;->Orig_Cashier:Ljava/lang/String;

    invoke-interface {v0, v2, v14}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 767
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

    .line 768
    .local v2, "_tmp_12":Ljava/lang/Integer;
    :goto_3c
    if-nez v2, :cond_3d

    .line 769
    const/16 v14, 0x39

    invoke-interface {v0, v14}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v18, v2

    goto :goto_3d

    .line 771
    :cond_3d
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v14

    int-to-long v14, v14

    move-object/from16 v18, v2

    .end local v2    # "_tmp_12":Ljava/lang/Integer;
    .local v18, "_tmp_12":Ljava/lang/Integer;
    const/16 v2, 0x39

    invoke-interface {v0, v2, v14, v15}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 773
    :goto_3d
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Cancelled_By:Ljava/lang/String;

    if-nez v2, :cond_3e

    .line 774
    const/16 v2, 0x3a

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_3e

    .line 776
    :cond_3e
    const/16 v2, 0x3a

    iget-object v14, v1, Lcom/trimline/metrocrew/transaction;->Cancelled_By:Ljava/lang/String;

    invoke-interface {v0, v2, v14}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 778
    :goto_3e
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Cancelled_Date:Ljava/sql/Date;

    invoke-static {v2}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v2

    .line 779
    .local v2, "_tmp_13":Ljava/lang/Long;
    if-nez v2, :cond_3f

    .line 780
    const/16 v14, 0x3b

    invoke-interface {v0, v14}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v19, v2

    move-object v15, v3

    goto :goto_3f

    .line 782
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

    .line 784
    :goto_3f
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Cancelled_Time:Ljava/sql/Date;

    invoke-static {v2}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v2

    .line 785
    .local v2, "_tmp_14":Ljava/lang/Long;
    if-nez v2, :cond_40

    .line 786
    const/16 v3, 0x3c

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object v14, v4

    move-object/from16 v20, v5

    goto :goto_40

    .line 788
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

    .line 790
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

    .line 791
    .local v3, "_tmp_15":Ljava/lang/Integer;
    :goto_41
    if-nez v3, :cond_42

    .line 792
    const/16 v4, 0x3d

    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v21, v2

    goto :goto_42

    .line 794
    :cond_42
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-long v4, v4

    move-object/from16 v21, v2

    .end local v2    # "_tmp_14":Ljava/lang/Long;
    .local v21, "_tmp_14":Ljava/lang/Long;
    const/16 v2, 0x3d

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 796
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

    .line 797
    .local v2, "_tmp_16":Ljava/lang/Integer;
    :goto_43
    if-nez v2, :cond_44

    .line 798
    const/16 v4, 0x3e

    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v22, v2

    goto :goto_44

    .line 800
    :cond_44
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    int-to-long v4, v4

    move-object/from16 v22, v2

    .end local v2    # "_tmp_16":Ljava/lang/Integer;
    .local v22, "_tmp_16":Ljava/lang/Integer;
    const/16 v2, 0x3e

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 802
    :goto_44
    iget v2, v1, Lcom/trimline/metrocrew/transaction;->Register_Number:I

    int-to-long v4, v2

    const/16 v2, 0x3f

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 803
    iget v2, v1, Lcom/trimline/metrocrew/transaction;->From_Entry_No:I

    int-to-long v4, v2

    const/16 v2, 0x40

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 804
    iget v2, v1, Lcom/trimline/metrocrew/transaction;->To_Entry_No:I

    int-to-long v4, v2

    const/16 v2, 0x41

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 805
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Batch_Posted_UserID:Ljava/lang/String;

    if-nez v2, :cond_45

    .line 806
    const/16 v2, 0x42

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_45

    .line 808
    :cond_45
    const/16 v2, 0x42

    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Batch_Posted_UserID:Ljava/lang/String;

    invoke-interface {v0, v2, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 810
    :goto_45
    iget v2, v1, Lcom/trimline/metrocrew/transaction;->BD_Register_Number:I

    int-to-long v4, v2

    const/16 v2, 0x43

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 811
    iget v2, v1, Lcom/trimline/metrocrew/transaction;->BD_From_Number:I

    int-to-long v4, v2

    const/16 v2, 0x44

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 812
    iget v2, v1, Lcom/trimline/metrocrew/transaction;->BD_To_Number:I

    int-to-long v4, v2

    const/16 v2, 0x45

    invoke-interface {v0, v2, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 813
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Reversal_By:Ljava/lang/String;

    if-nez v2, :cond_46

    .line 814
    const/16 v2, 0x46

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_46

    .line 816
    :cond_46
    const/16 v2, 0x46

    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Reversal_By:Ljava/lang/String;

    invoke-interface {v0, v2, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 818
    :goto_46
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Reversal_Date:Ljava/sql/Date;

    invoke-static {v2}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v2

    .line 819
    .local v2, "_tmp_17":Ljava/lang/Long;
    if-nez v2, :cond_47

    .line 820
    const/16 v4, 0x47

    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v23, v2

    move-object v5, v3

    goto :goto_47

    .line 822
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

    .line 824
    :goto_47
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Reversal_Time:Ljava/sql/Date;

    invoke-static {v2}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v2

    .line 825
    .local v2, "_tmp_18":Ljava/lang/Long;
    if-nez v2, :cond_48

    .line 826
    const/16 v3, 0x48

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v24, v5

    goto :goto_48

    .line 828
    :cond_48
    const/16 v3, 0x48

    move-object/from16 v24, v5

    .end local v5    # "_tmp_15":Ljava/lang/Integer;
    .local v24, "_tmp_15":Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-interface {v0, v3, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 830
    :goto_48
    iget v3, v1, Lcom/trimline/metrocrew/transaction;->Reversal_Register_No:I

    int-to-long v3, v3

    const/16 v5, 0x49

    invoke-interface {v0, v5, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 831
    iget v3, v1, Lcom/trimline/metrocrew/transaction;->Reversal_From_Entry_No:I

    int-to-long v3, v3

    const/16 v5, 0x4a

    invoke-interface {v0, v5, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 832
    iget v3, v1, Lcom/trimline/metrocrew/transaction;->Reversal_To_Entry_No:I

    int-to-long v3, v3

    const/16 v5, 0x4b

    invoke-interface {v0, v5, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 833
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

    .line 834
    .local v5, "_tmp_19":Ljava/lang/Integer;
    :goto_49
    if-nez v5, :cond_4a

    .line 835
    const/16 v3, 0x4c

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v16, v2

    goto :goto_4a

    .line 837
    :cond_4a
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-long v3, v3

    move-object/from16 v16, v2

    .end local v2    # "_tmp_18":Ljava/lang/Long;
    .local v16, "_tmp_18":Ljava/lang/Long;
    const/16 v2, 0x4c

    invoke-interface {v0, v2, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 839
    :goto_4a
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Applies_to_Doc_No:Ljava/lang/String;

    if-nez v2, :cond_4b

    .line 840
    const/16 v2, 0x4d

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4b

    .line 842
    :cond_4b
    const/16 v2, 0x4d

    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Applies_to_Doc_No:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 844
    :goto_4b
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Applies_to_ID:Ljava/lang/String;

    if-nez v2, :cond_4c

    .line 845
    const/16 v2, 0x4e

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4c

    .line 847
    :cond_4c
    const/16 v2, 0x4e

    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Applies_to_ID:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 849
    :goto_4c
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Grant_No:Ljava/lang/String;

    if-nez v2, :cond_4d

    .line 850
    const/16 v2, 0x4f

    invoke-interface {v0, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4d

    .line 852
    :cond_4d
    const/16 v2, 0x4f

    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Grant_No:Ljava/lang/String;

    invoke-interface {v0, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 854
    :goto_4d
    iget v2, v1, Lcom/trimline/metrocrew/transaction;->Installment_Number:I

    int-to-long v2, v2

    const/16 v4, 0x50

    invoke-interface {v0, v4, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 855
    iget-object v2, v1, Lcom/trimline/metrocrew/transaction;->Next_Installment_Date:Ljava/sql/Date;

    invoke-static {v2}, Lcom/trimline/metrocrew/Converters$DateConverter;->fromDate(Ljava/sql/Date;)Ljava/lang/Long;

    move-result-object v2

    .line 856
    .local v2, "_tmp_20":Ljava/lang/Long;
    if-nez v2, :cond_4e

    .line 857
    const/16 v3, 0x51

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    move-object/from16 v25, v5

    goto :goto_4e

    .line 859
    :cond_4e
    const/16 v3, 0x51

    move-object/from16 v25, v5

    .end local v5    # "_tmp_19":Ljava/lang/Integer;
    .local v25, "_tmp_19":Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-interface {v0, v3, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 861
    :goto_4e
    iget v3, v1, Lcom/trimline/metrocrew/transaction;->Dimension_Set_ID:I

    int-to-long v3, v3

    const/16 v5, 0x52

    invoke-interface {v0, v5, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 862
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Donor:Ljava/lang/String;

    if-nez v3, :cond_4f

    .line 863
    const/16 v3, 0x53

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4f

    .line 865
    :cond_4f
    const/16 v3, 0x53

    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Donor:Ljava/lang/String;

    invoke-interface {v0, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 867
    :goto_4f
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Group_Code:Ljava/lang/String;

    if-nez v3, :cond_50

    .line 868
    const/16 v3, 0x54

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_50

    .line 870
    :cond_50
    const/16 v3, 0x54

    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Group_Code:Ljava/lang/String;

    invoke-interface {v0, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 872
    :goto_50
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Pre_ADM_Fines:Ljava/lang/Double;

    if-nez v3, :cond_51

    .line 873
    const/16 v3, 0x55

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_51

    .line 875
    :cond_51
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Pre_ADM_Fines:Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    const/16 v5, 0x55

    invoke-interface {v0, v5, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 877
    :goto_51
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Med_Fines:Ljava/lang/Double;

    if-nez v3, :cond_52

    .line 878
    const/16 v3, 0x56

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_52

    .line 880
    :cond_52
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Med_Fines:Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    const/16 v5, 0x56

    invoke-interface {v0, v5, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 882
    :goto_52
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Loan_No:Ljava/lang/String;

    if-nez v3, :cond_53

    .line 883
    const/16 v3, 0x57

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_53

    .line 885
    :cond_53
    const/16 v3, 0x57

    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Loan_No:Ljava/lang/String;

    invoke-interface {v0, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 887
    :goto_53
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Penalty:Ljava/lang/Double;

    if-nez v3, :cond_54

    .line 888
    const/16 v3, 0x58

    invoke-interface {v0, v3}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_54

    .line 890
    :cond_54
    iget-object v3, v1, Lcom/trimline/metrocrew/transaction;->Penalty:Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v3

    const/16 v5, 0x58

    invoke-interface {v0, v5, v3, v4}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 892
    :goto_54
    iget-boolean v3, v1, Lcom/trimline/metrocrew/transaction;->sent:Z

    .line 893
    .local v3, "_tmp_21":I
    const/16 v4, 0x59

    move-object/from16 v26, v6

    .end local v6    # "_tmp_3":Ljava/lang/Long;
    .local v26, "_tmp_3":Ljava/lang/Long;
    int-to-long v5, v3

    invoke-interface {v0, v4, v5, v6}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 894
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->No:Ljava/lang/String;

    if-nez v4, :cond_55

    .line 895
    const/16 v4, 0x5a

    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_55

    .line 897
    :cond_55
    const/16 v4, 0x5a

    iget-object v5, v1, Lcom/trimline/metrocrew/transaction;->No:Ljava/lang/String;

    invoke-interface {v0, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 899
    :goto_55
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->Account_No:Ljava/lang/String;

    if-nez v4, :cond_56

    .line 900
    const/16 v4, 0x5b

    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_56

    .line 902
    :cond_56
    const/16 v4, 0x5b

    iget-object v5, v1, Lcom/trimline/metrocrew/transaction;->Account_No:Ljava/lang/String;

    invoke-interface {v0, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 904
    :goto_56
    iget-object v4, v1, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    if-nez v4, :cond_57

    .line 905
    const/16 v4, 0x5c

    invoke-interface {v0, v4}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_57

    .line 907
    :cond_57
    const/16 v4, 0x5c

    iget-object v5, v1, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    invoke-interface {v0, v4, v5}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 909
    :goto_57
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

    .line 478
    check-cast p2, Lcom/trimline/metrocrew/transaction;

    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/transaction_dao_Impl$3;->bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/transaction;)V

    return-void
.end method

.method protected createQuery()Ljava/lang/String;
    .locals 1

    .line 482
    const-string v0, "UPDATE OR ABORT `transaction` SET `Key` = ?,`Entry_No` = ?,`No` = ?,`Date` = ?,`Type` = ?,`transtype` = ?,`PayMode` = ?,`Pay_Mode` = ?,`Cheque_Deposit_Slip_No` = ?,`Cheque_Deposit_Slip_Date` = ?,`Bank_Code` = ?,`Received_From` = ?,`On_Behalf_Of` = ?,`Cashier` = ?,`Account_No` = ?,`Account_Name` = ?,`Posted` = ?,`Date_Posted` = ?,`Time_Posted` = ?,`Posted_By` = ?,`Amount` = ?,`Remarks` = ?,`Transaction_Name` = ?,`Branch_Code` = ?,`Agent_Code` = ?,`Grouping` = ?,`Global_Dimension_1_Code` = ?,`Shortcut_Dimension_2_Code` = ?,`VAT_Percent` = ?,`Currency_Code` = ?,`Currency_Factor` = ?,`VAT_Bus_Posting_Group` = ?,`VAT_Prod_Posting_Group` = ?,`Gen_Posting_TypeSpecified` = ?,`Gen_Bus_Posting_Group` = ?,`Gen_Prod_Posting_Group` = ?,`VAT_Amount` = ?,`Total_Amount` = ?,`User_ID` = ?,`Apply_to` = ?,`Apply_to_ID` = ?,`Dest_Global_Dimension_1_Code` = ?,`Dest_Shortcut_Dimension_2_Code` = ?,`Line_No` = ?,`Print_No` = ?,`Deposit_Slip_Time` = ?,`Teller_ID` = ?,`Customer_Payment_On_Account` = ?,`Select` = ?,`Batch_Posted` = ?,`Transaction_No` = ?,`Cheque_Deposit_Slip_Bank` = ?,`Bank_Account` = ?,`Confirmed` = ?,`Reconciled` = ?,`Orig_Cashier` = ?,`Cancelled` = ?,`Cancelled_By` = ?,`Cancelled_Date` = ?,`Cancelled_Time` = ?,`Post_Dated` = ?,`Cheque_Retrieved` = ?,`Register_Number` = ?,`From_Entry_No` = ?,`To_Entry_No` = ?,`Batch_Posted_UserID` = ?,`BD_Register_Number` = ?,`BD_From_Number` = ?,`BD_To_Number` = ?,`Reversal_By` = ?,`Reversal_Date` = ?,`Reversal_Time` = ?,`Reversal_Register_No` = ?,`Reversal_From_Entry_No` = ?,`Reversal_To_Entry_No` = ?,`Reversed` = ?,`Applies_to_Doc_No` = ?,`Applies_to_ID` = ?,`Grant_No` = ?,`Installment_Number` = ?,`Next_Installment_Date` = ?,`Dimension_Set_ID` = ?,`Donor` = ?,`Group_Code` = ?,`Pre_ADM_Fines` = ?,`Med_Fines` = ?,`Loan_No` = ?,`Penalty` = ?,`sent` = ? WHERE `No` = ? AND `Account_No` = ? AND `transtype` = ?"

    return-object v0
.end method
