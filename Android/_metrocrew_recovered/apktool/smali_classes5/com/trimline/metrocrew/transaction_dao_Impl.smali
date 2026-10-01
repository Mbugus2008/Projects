.class public final Lcom/trimline/metrocrew/transaction_dao_Impl;
.super Lcom/trimline/metrocrew/transaction$dao;
.source "transaction_dao_Impl.java"


# instance fields
.field private final __db:Landroidx/room/RoomDatabase;

.field private final __deleteAdapterOftransaction:Landroidx/room/EntityDeleteOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeleteOrUpdateAdapter<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;"
        }
    .end annotation
.end field

.field private final __insertAdapterOftransaction:Landroidx/room/EntityInsertAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityInsertAdapter<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;"
        }
    .end annotation
.end field

.field private final __updateAdapterOftransaction:Landroidx/room/EntityDeleteOrUpdateAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/room/EntityDeleteOrUpdateAdapter<",
            "Lcom/trimline/metrocrew/transaction;",
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

    .line 32
    invoke-direct {p0}, Lcom/trimline/metrocrew/transaction$dao;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/trimline/metrocrew/transaction_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    .line 34
    new-instance v0, Lcom/trimline/metrocrew/transaction_dao_Impl$1;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/transaction_dao_Impl$1;-><init>(Lcom/trimline/metrocrew/transaction_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/transaction_dao_Impl;->__insertAdapterOftransaction:Landroidx/room/EntityInsertAdapter;

    .line 452
    new-instance v0, Lcom/trimline/metrocrew/transaction_dao_Impl$2;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/transaction_dao_Impl$2;-><init>(Lcom/trimline/metrocrew/transaction_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/transaction_dao_Impl;->__deleteAdapterOftransaction:Landroidx/room/EntityDeleteOrUpdateAdapter;

    .line 478
    new-instance v0, Lcom/trimline/metrocrew/transaction_dao_Impl$3;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/transaction_dao_Impl$3;-><init>(Lcom/trimline/metrocrew/transaction_dao_Impl;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/transaction_dao_Impl;->__updateAdapterOftransaction:Landroidx/room/EntityDeleteOrUpdateAdapter;

    .line 911
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

    .line 2558
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method static synthetic lambda$load$6(Landroidx/sqlite/SQLiteConnection;)Ljava/util/List;
    .locals 119
    .param p0, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 2023
    const-string v0, "SELECT * FROM `transaction`"

    move-object/from16 v1, p0

    invoke-interface {v1, v0}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v2

    .line 2025
    .local v2, "_stmt":Landroidx/sqlite/SQLiteStatement;
    :try_start_0
    const-string v0, "Key"

    invoke-static {v2, v0}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v0

    .line 2026
    .local v0, "_columnIndexOfKey":I
    const-string v3, "Entry_No"

    invoke-static {v2, v3}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v3

    .line 2027
    .local v3, "_columnIndexOfEntryNo":I
    const-string v4, "No"

    invoke-static {v2, v4}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v4

    .line 2028
    .local v4, "_columnIndexOfNo":I
    const-string v5, "Date"

    invoke-static {v2, v5}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v5

    .line 2029
    .local v5, "_columnIndexOfDate":I
    const-string v6, "Type"

    invoke-static {v2, v6}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v6

    .line 2030
    .local v6, "_columnIndexOfType":I
    const-string v7, "transtype"

    invoke-static {v2, v7}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v7

    .line 2031
    .local v7, "_columnIndexOfTranstype":I
    const-string v8, "PayMode"

    invoke-static {v2, v8}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v8

    .line 2032
    .local v8, "_columnIndexOfPayMode":I
    const-string v9, "Pay_Mode"

    invoke-static {v2, v9}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v9

    .line 2033
    .local v9, "_columnIndexOfPayMode_1":I
    const-string v10, "Cheque_Deposit_Slip_No"

    invoke-static {v2, v10}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v10

    .line 2034
    .local v10, "_columnIndexOfChequeDepositSlipNo":I
    const-string v11, "Cheque_Deposit_Slip_Date"

    invoke-static {v2, v11}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v11

    .line 2035
    .local v11, "_columnIndexOfChequeDepositSlipDate":I
    const-string v12, "Bank_Code"

    invoke-static {v2, v12}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v12

    .line 2036
    .local v12, "_columnIndexOfBankCode":I
    const-string v13, "Received_From"

    invoke-static {v2, v13}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v13

    .line 2037
    .local v13, "_columnIndexOfReceivedFrom":I
    const-string v14, "On_Behalf_Of"

    invoke-static {v2, v14}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v14

    .line 2038
    .local v14, "_columnIndexOfOnBehalfOf":I
    const-string v15, "Cashier"

    invoke-static {v2, v15}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v15

    .line 2039
    .local v15, "_columnIndexOfCashier":I
    const-string v1, "Account_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2040
    .local v1, "_columnIndexOfAccountNo":I
    move/from16 v16, v1

    .end local v1    # "_columnIndexOfAccountNo":I
    .local v16, "_columnIndexOfAccountNo":I
    const-string v1, "Account_Name"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2041
    .local v1, "_columnIndexOfAccountName":I
    move/from16 v17, v1

    .end local v1    # "_columnIndexOfAccountName":I
    .local v17, "_columnIndexOfAccountName":I
    const-string v1, "Posted"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2042
    .local v1, "_columnIndexOfPosted":I
    move/from16 v18, v1

    .end local v1    # "_columnIndexOfPosted":I
    .local v18, "_columnIndexOfPosted":I
    const-string v1, "Date_Posted"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2043
    .local v1, "_columnIndexOfDatePosted":I
    move/from16 v19, v1

    .end local v1    # "_columnIndexOfDatePosted":I
    .local v19, "_columnIndexOfDatePosted":I
    const-string v1, "Time_Posted"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2044
    .local v1, "_columnIndexOfTimePosted":I
    move/from16 v20, v1

    .end local v1    # "_columnIndexOfTimePosted":I
    .local v20, "_columnIndexOfTimePosted":I
    const-string v1, "Posted_By"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2045
    .local v1, "_columnIndexOfPostedBy":I
    move/from16 v21, v1

    .end local v1    # "_columnIndexOfPostedBy":I
    .local v21, "_columnIndexOfPostedBy":I
    const-string v1, "Amount"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2046
    .local v1, "_columnIndexOfAmount":I
    move/from16 v22, v1

    .end local v1    # "_columnIndexOfAmount":I
    .local v22, "_columnIndexOfAmount":I
    const-string v1, "Remarks"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2047
    .local v1, "_columnIndexOfRemarks":I
    move/from16 v23, v1

    .end local v1    # "_columnIndexOfRemarks":I
    .local v23, "_columnIndexOfRemarks":I
    const-string v1, "Transaction_Name"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2048
    .local v1, "_columnIndexOfTransactionName":I
    move/from16 v24, v1

    .end local v1    # "_columnIndexOfTransactionName":I
    .local v24, "_columnIndexOfTransactionName":I
    const-string v1, "Branch_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2049
    .local v1, "_columnIndexOfBranchCode":I
    move/from16 v25, v1

    .end local v1    # "_columnIndexOfBranchCode":I
    .local v25, "_columnIndexOfBranchCode":I
    const-string v1, "Agent_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2050
    .local v1, "_columnIndexOfAgentCode":I
    move/from16 v26, v1

    .end local v1    # "_columnIndexOfAgentCode":I
    .local v26, "_columnIndexOfAgentCode":I
    const-string v1, "Grouping"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2051
    .local v1, "_columnIndexOfGrouping":I
    move/from16 v27, v1

    .end local v1    # "_columnIndexOfGrouping":I
    .local v27, "_columnIndexOfGrouping":I
    const-string v1, "Global_Dimension_1_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2052
    .local v1, "_columnIndexOfGlobalDimension1Code":I
    move/from16 v28, v1

    .end local v1    # "_columnIndexOfGlobalDimension1Code":I
    .local v28, "_columnIndexOfGlobalDimension1Code":I
    const-string v1, "Shortcut_Dimension_2_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2053
    .local v1, "_columnIndexOfShortcutDimension2Code":I
    move/from16 v29, v1

    .end local v1    # "_columnIndexOfShortcutDimension2Code":I
    .local v29, "_columnIndexOfShortcutDimension2Code":I
    const-string v1, "VAT_Percent"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2054
    .local v1, "_columnIndexOfVATPercent":I
    move/from16 v30, v1

    .end local v1    # "_columnIndexOfVATPercent":I
    .local v30, "_columnIndexOfVATPercent":I
    const-string v1, "Currency_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2055
    .local v1, "_columnIndexOfCurrencyCode":I
    move/from16 v31, v1

    .end local v1    # "_columnIndexOfCurrencyCode":I
    .local v31, "_columnIndexOfCurrencyCode":I
    const-string v1, "Currency_Factor"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2056
    .local v1, "_columnIndexOfCurrencyFactor":I
    move/from16 v32, v1

    .end local v1    # "_columnIndexOfCurrencyFactor":I
    .local v32, "_columnIndexOfCurrencyFactor":I
    const-string v1, "VAT_Bus_Posting_Group"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2057
    .local v1, "_columnIndexOfVATBusPostingGroup":I
    move/from16 v33, v1

    .end local v1    # "_columnIndexOfVATBusPostingGroup":I
    .local v33, "_columnIndexOfVATBusPostingGroup":I
    const-string v1, "VAT_Prod_Posting_Group"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2058
    .local v1, "_columnIndexOfVATProdPostingGroup":I
    move/from16 v34, v1

    .end local v1    # "_columnIndexOfVATProdPostingGroup":I
    .local v34, "_columnIndexOfVATProdPostingGroup":I
    const-string v1, "Gen_Posting_TypeSpecified"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2059
    .local v1, "_columnIndexOfGenPostingTypeSpecified":I
    move/from16 v35, v1

    .end local v1    # "_columnIndexOfGenPostingTypeSpecified":I
    .local v35, "_columnIndexOfGenPostingTypeSpecified":I
    const-string v1, "Gen_Bus_Posting_Group"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2060
    .local v1, "_columnIndexOfGenBusPostingGroup":I
    move/from16 v36, v1

    .end local v1    # "_columnIndexOfGenBusPostingGroup":I
    .local v36, "_columnIndexOfGenBusPostingGroup":I
    const-string v1, "Gen_Prod_Posting_Group"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2061
    .local v1, "_columnIndexOfGenProdPostingGroup":I
    move/from16 v37, v1

    .end local v1    # "_columnIndexOfGenProdPostingGroup":I
    .local v37, "_columnIndexOfGenProdPostingGroup":I
    const-string v1, "VAT_Amount"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2062
    .local v1, "_columnIndexOfVATAmount":I
    move/from16 v38, v1

    .end local v1    # "_columnIndexOfVATAmount":I
    .local v38, "_columnIndexOfVATAmount":I
    const-string v1, "Total_Amount"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2063
    .local v1, "_columnIndexOfTotalAmount":I
    move/from16 v39, v1

    .end local v1    # "_columnIndexOfTotalAmount":I
    .local v39, "_columnIndexOfTotalAmount":I
    const-string v1, "User_ID"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2064
    .local v1, "_columnIndexOfUserID":I
    move/from16 v40, v1

    .end local v1    # "_columnIndexOfUserID":I
    .local v40, "_columnIndexOfUserID":I
    const-string v1, "Apply_to"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2065
    .local v1, "_columnIndexOfApplyTo":I
    move/from16 v41, v1

    .end local v1    # "_columnIndexOfApplyTo":I
    .local v41, "_columnIndexOfApplyTo":I
    const-string v1, "Apply_to_ID"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2066
    .local v1, "_columnIndexOfApplyToID":I
    move/from16 v42, v1

    .end local v1    # "_columnIndexOfApplyToID":I
    .local v42, "_columnIndexOfApplyToID":I
    const-string v1, "Dest_Global_Dimension_1_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2067
    .local v1, "_columnIndexOfDestGlobalDimension1Code":I
    move/from16 v43, v1

    .end local v1    # "_columnIndexOfDestGlobalDimension1Code":I
    .local v43, "_columnIndexOfDestGlobalDimension1Code":I
    const-string v1, "Dest_Shortcut_Dimension_2_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2068
    .local v1, "_columnIndexOfDestShortcutDimension2Code":I
    move/from16 v44, v1

    .end local v1    # "_columnIndexOfDestShortcutDimension2Code":I
    .local v44, "_columnIndexOfDestShortcutDimension2Code":I
    const-string v1, "Line_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2069
    .local v1, "_columnIndexOfLineNo":I
    move/from16 v45, v1

    .end local v1    # "_columnIndexOfLineNo":I
    .local v45, "_columnIndexOfLineNo":I
    const-string v1, "Print_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2070
    .local v1, "_columnIndexOfPrintNo":I
    move/from16 v46, v1

    .end local v1    # "_columnIndexOfPrintNo":I
    .local v46, "_columnIndexOfPrintNo":I
    const-string v1, "Deposit_Slip_Time"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2071
    .local v1, "_columnIndexOfDepositSlipTime":I
    move/from16 v47, v1

    .end local v1    # "_columnIndexOfDepositSlipTime":I
    .local v47, "_columnIndexOfDepositSlipTime":I
    const-string v1, "Teller_ID"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2072
    .local v1, "_columnIndexOfTellerID":I
    move/from16 v48, v1

    .end local v1    # "_columnIndexOfTellerID":I
    .local v48, "_columnIndexOfTellerID":I
    const-string v1, "Customer_Payment_On_Account"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2073
    .local v1, "_columnIndexOfCustomerPaymentOnAccount":I
    move/from16 v49, v1

    .end local v1    # "_columnIndexOfCustomerPaymentOnAccount":I
    .local v49, "_columnIndexOfCustomerPaymentOnAccount":I
    const-string v1, "Select"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2074
    .local v1, "_columnIndexOfSelect":I
    move/from16 v50, v1

    .end local v1    # "_columnIndexOfSelect":I
    .local v50, "_columnIndexOfSelect":I
    const-string v1, "Batch_Posted"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2075
    .local v1, "_columnIndexOfBatchPosted":I
    move/from16 v51, v1

    .end local v1    # "_columnIndexOfBatchPosted":I
    .local v51, "_columnIndexOfBatchPosted":I
    const-string v1, "Transaction_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2076
    .local v1, "_columnIndexOfTransactionNo":I
    move/from16 v52, v1

    .end local v1    # "_columnIndexOfTransactionNo":I
    .local v52, "_columnIndexOfTransactionNo":I
    const-string v1, "Cheque_Deposit_Slip_Bank"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2077
    .local v1, "_columnIndexOfChequeDepositSlipBank":I
    move/from16 v53, v1

    .end local v1    # "_columnIndexOfChequeDepositSlipBank":I
    .local v53, "_columnIndexOfChequeDepositSlipBank":I
    const-string v1, "Bank_Account"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2078
    .local v1, "_columnIndexOfBankAccount":I
    move/from16 v54, v1

    .end local v1    # "_columnIndexOfBankAccount":I
    .local v54, "_columnIndexOfBankAccount":I
    const-string v1, "Confirmed"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2079
    .local v1, "_columnIndexOfConfirmed":I
    move/from16 v55, v1

    .end local v1    # "_columnIndexOfConfirmed":I
    .local v55, "_columnIndexOfConfirmed":I
    const-string v1, "Reconciled"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2080
    .local v1, "_columnIndexOfReconciled":I
    move/from16 v56, v1

    .end local v1    # "_columnIndexOfReconciled":I
    .local v56, "_columnIndexOfReconciled":I
    const-string v1, "Orig_Cashier"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2081
    .local v1, "_columnIndexOfOrigCashier":I
    move/from16 v57, v1

    .end local v1    # "_columnIndexOfOrigCashier":I
    .local v57, "_columnIndexOfOrigCashier":I
    const-string v1, "Cancelled"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2082
    .local v1, "_columnIndexOfCancelled":I
    move/from16 v58, v1

    .end local v1    # "_columnIndexOfCancelled":I
    .local v58, "_columnIndexOfCancelled":I
    const-string v1, "Cancelled_By"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2083
    .local v1, "_columnIndexOfCancelledBy":I
    move/from16 v59, v1

    .end local v1    # "_columnIndexOfCancelledBy":I
    .local v59, "_columnIndexOfCancelledBy":I
    const-string v1, "Cancelled_Date"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2084
    .local v1, "_columnIndexOfCancelledDate":I
    move/from16 v60, v1

    .end local v1    # "_columnIndexOfCancelledDate":I
    .local v60, "_columnIndexOfCancelledDate":I
    const-string v1, "Cancelled_Time"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2085
    .local v1, "_columnIndexOfCancelledTime":I
    move/from16 v61, v1

    .end local v1    # "_columnIndexOfCancelledTime":I
    .local v61, "_columnIndexOfCancelledTime":I
    const-string v1, "Post_Dated"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2086
    .local v1, "_columnIndexOfPostDated":I
    move/from16 v62, v1

    .end local v1    # "_columnIndexOfPostDated":I
    .local v62, "_columnIndexOfPostDated":I
    const-string v1, "Cheque_Retrieved"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2087
    .local v1, "_columnIndexOfChequeRetrieved":I
    move/from16 v63, v1

    .end local v1    # "_columnIndexOfChequeRetrieved":I
    .local v63, "_columnIndexOfChequeRetrieved":I
    const-string v1, "Register_Number"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2088
    .local v1, "_columnIndexOfRegisterNumber":I
    move/from16 v64, v1

    .end local v1    # "_columnIndexOfRegisterNumber":I
    .local v64, "_columnIndexOfRegisterNumber":I
    const-string v1, "From_Entry_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2089
    .local v1, "_columnIndexOfFromEntryNo":I
    move/from16 v65, v1

    .end local v1    # "_columnIndexOfFromEntryNo":I
    .local v65, "_columnIndexOfFromEntryNo":I
    const-string v1, "To_Entry_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2090
    .local v1, "_columnIndexOfToEntryNo":I
    move/from16 v66, v1

    .end local v1    # "_columnIndexOfToEntryNo":I
    .local v66, "_columnIndexOfToEntryNo":I
    const-string v1, "Batch_Posted_UserID"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2091
    .local v1, "_columnIndexOfBatchPostedUserID":I
    move/from16 v67, v1

    .end local v1    # "_columnIndexOfBatchPostedUserID":I
    .local v67, "_columnIndexOfBatchPostedUserID":I
    const-string v1, "BD_Register_Number"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2092
    .local v1, "_columnIndexOfBDRegisterNumber":I
    move/from16 v68, v1

    .end local v1    # "_columnIndexOfBDRegisterNumber":I
    .local v68, "_columnIndexOfBDRegisterNumber":I
    const-string v1, "BD_From_Number"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2093
    .local v1, "_columnIndexOfBDFromNumber":I
    move/from16 v69, v1

    .end local v1    # "_columnIndexOfBDFromNumber":I
    .local v69, "_columnIndexOfBDFromNumber":I
    const-string v1, "BD_To_Number"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2094
    .local v1, "_columnIndexOfBDToNumber":I
    move/from16 v70, v1

    .end local v1    # "_columnIndexOfBDToNumber":I
    .local v70, "_columnIndexOfBDToNumber":I
    const-string v1, "Reversal_By"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2095
    .local v1, "_columnIndexOfReversalBy":I
    move/from16 v71, v1

    .end local v1    # "_columnIndexOfReversalBy":I
    .local v71, "_columnIndexOfReversalBy":I
    const-string v1, "Reversal_Date"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2096
    .local v1, "_columnIndexOfReversalDate":I
    move/from16 v72, v1

    .end local v1    # "_columnIndexOfReversalDate":I
    .local v72, "_columnIndexOfReversalDate":I
    const-string v1, "Reversal_Time"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2097
    .local v1, "_columnIndexOfReversalTime":I
    move/from16 v73, v1

    .end local v1    # "_columnIndexOfReversalTime":I
    .local v73, "_columnIndexOfReversalTime":I
    const-string v1, "Reversal_Register_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2098
    .local v1, "_columnIndexOfReversalRegisterNo":I
    move/from16 v74, v1

    .end local v1    # "_columnIndexOfReversalRegisterNo":I
    .local v74, "_columnIndexOfReversalRegisterNo":I
    const-string v1, "Reversal_From_Entry_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2099
    .local v1, "_columnIndexOfReversalFromEntryNo":I
    move/from16 v75, v1

    .end local v1    # "_columnIndexOfReversalFromEntryNo":I
    .local v75, "_columnIndexOfReversalFromEntryNo":I
    const-string v1, "Reversal_To_Entry_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2100
    .local v1, "_columnIndexOfReversalToEntryNo":I
    move/from16 v76, v1

    .end local v1    # "_columnIndexOfReversalToEntryNo":I
    .local v76, "_columnIndexOfReversalToEntryNo":I
    const-string v1, "Reversed"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2101
    .local v1, "_columnIndexOfReversed":I
    move/from16 v77, v1

    .end local v1    # "_columnIndexOfReversed":I
    .local v77, "_columnIndexOfReversed":I
    const-string v1, "Applies_to_Doc_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2102
    .local v1, "_columnIndexOfAppliesToDocNo":I
    move/from16 v78, v1

    .end local v1    # "_columnIndexOfAppliesToDocNo":I
    .local v78, "_columnIndexOfAppliesToDocNo":I
    const-string v1, "Applies_to_ID"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2103
    .local v1, "_columnIndexOfAppliesToID":I
    move/from16 v79, v1

    .end local v1    # "_columnIndexOfAppliesToID":I
    .local v79, "_columnIndexOfAppliesToID":I
    const-string v1, "Grant_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2104
    .local v1, "_columnIndexOfGrantNo":I
    move/from16 v80, v1

    .end local v1    # "_columnIndexOfGrantNo":I
    .local v80, "_columnIndexOfGrantNo":I
    const-string v1, "Installment_Number"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2105
    .local v1, "_columnIndexOfInstallmentNumber":I
    move/from16 v81, v1

    .end local v1    # "_columnIndexOfInstallmentNumber":I
    .local v81, "_columnIndexOfInstallmentNumber":I
    const-string v1, "Next_Installment_Date"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2106
    .local v1, "_columnIndexOfNextInstallmentDate":I
    move/from16 v82, v1

    .end local v1    # "_columnIndexOfNextInstallmentDate":I
    .local v82, "_columnIndexOfNextInstallmentDate":I
    const-string v1, "Dimension_Set_ID"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2107
    .local v1, "_columnIndexOfDimensionSetID":I
    move/from16 v83, v1

    .end local v1    # "_columnIndexOfDimensionSetID":I
    .local v83, "_columnIndexOfDimensionSetID":I
    const-string v1, "Donor"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2108
    .local v1, "_columnIndexOfDonor":I
    move/from16 v84, v1

    .end local v1    # "_columnIndexOfDonor":I
    .local v84, "_columnIndexOfDonor":I
    const-string v1, "Group_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2109
    .local v1, "_columnIndexOfGroupCode":I
    move/from16 v85, v1

    .end local v1    # "_columnIndexOfGroupCode":I
    .local v85, "_columnIndexOfGroupCode":I
    const-string v1, "Pre_ADM_Fines"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2110
    .local v1, "_columnIndexOfPreADMFines":I
    move/from16 v86, v1

    .end local v1    # "_columnIndexOfPreADMFines":I
    .local v86, "_columnIndexOfPreADMFines":I
    const-string v1, "Med_Fines"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2111
    .local v1, "_columnIndexOfMedFines":I
    move/from16 v87, v1

    .end local v1    # "_columnIndexOfMedFines":I
    .local v87, "_columnIndexOfMedFines":I
    const-string v1, "Loan_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2112
    .local v1, "_columnIndexOfLoanNo":I
    move/from16 v88, v1

    .end local v1    # "_columnIndexOfLoanNo":I
    .local v88, "_columnIndexOfLoanNo":I
    const-string v1, "Penalty"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2113
    .local v1, "_columnIndexOfPenalty":I
    move/from16 v89, v1

    .end local v1    # "_columnIndexOfPenalty":I
    .local v89, "_columnIndexOfPenalty":I
    const-string v1, "sent"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 2114
    .local v1, "_columnIndexOfSent":I
    new-instance v90, Ljava/util/ArrayList;

    invoke-direct/range {v90 .. v90}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v91, v90

    .line 2115
    .local v91, "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    :goto_0
    invoke-interface {v2}, Landroidx/sqlite/SQLiteStatement;->step()Z

    move-result v90

    if-eqz v90, :cond_61

    .line 2117
    new-instance v90, Lcom/trimline/metrocrew/transaction;

    invoke-direct/range {v90 .. v90}, Lcom/trimline/metrocrew/transaction;-><init>()V

    move-object/from16 v92, v90

    .line 2118
    .local v92, "_item":Lcom/trimline/metrocrew/transaction;
    invoke-interface {v2, v0}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v90

    move/from16 v93, v1

    .end local v1    # "_columnIndexOfSent":I
    .local v93, "_columnIndexOfSent":I
    const/4 v1, 0x0

    if-eqz v90, :cond_0

    .line 2119
    move/from16 v90, v15

    move-object/from16 v15, v92

    .end local v92    # "_item":Lcom/trimline/metrocrew/transaction;
    .local v15, "_item":Lcom/trimline/metrocrew/transaction;
    .local v90, "_columnIndexOfCashier":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Key:Ljava/lang/String;

    goto :goto_1

    .line 2121
    .end local v90    # "_columnIndexOfCashier":I
    .local v15, "_columnIndexOfCashier":I
    .restart local v92    # "_item":Lcom/trimline/metrocrew/transaction;
    :cond_0
    move/from16 v90, v15

    move-object/from16 v15, v92

    .end local v92    # "_item":Lcom/trimline/metrocrew/transaction;
    .local v15, "_item":Lcom/trimline/metrocrew/transaction;
    .restart local v90    # "_columnIndexOfCashier":I
    invoke-interface {v2, v0}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Key:Ljava/lang/String;

    .line 2123
    :goto_1
    move v1, v13

    move/from16 v94, v14

    .end local v13    # "_columnIndexOfReceivedFrom":I
    .end local v14    # "_columnIndexOfOnBehalfOf":I
    .local v1, "_columnIndexOfReceivedFrom":I
    .local v94, "_columnIndexOfOnBehalfOf":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v13

    long-to-int v13, v13

    iput v13, v15, Lcom/trimline/metrocrew/transaction;->Entry_No:I

    .line 2124
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 2125
    const/4 v13, 0x0

    iput-object v13, v15, Lcom/trimline/metrocrew/transaction;->No:Ljava/lang/String;

    goto :goto_2

    .line 2127
    :cond_1
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v13

    iput-object v13, v15, Lcom/trimline/metrocrew/transaction;->No:Ljava/lang/String;

    .line 2130
    :goto_2
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 2131
    const/4 v13, 0x0

    .local v13, "_tmp":Ljava/lang/Long;
    goto :goto_3

    .line 2133
    .end local v13    # "_tmp":Ljava/lang/Long;
    :cond_2
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    .line 2135
    .restart local v13    # "_tmp":Ljava/lang/Long;
    :goto_3
    invoke-static {v13}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v14

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Date:Ljava/sql/Date;

    .line 2136
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 2137
    const/4 v14, 0x0

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Type:Ljava/lang/String;

    goto :goto_4

    .line 2139
    :cond_3
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Type:Ljava/lang/String;

    .line 2141
    :goto_4
    invoke-interface {v2, v7}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 2142
    const/4 v14, 0x0

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    goto :goto_5

    .line 2144
    :cond_4
    invoke-interface {v2, v7}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    .line 2146
    :goto_5
    invoke-interface {v2, v8}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_5

    .line 2147
    const/4 v14, 0x0

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->PayMode:Ljava/lang/String;

    goto :goto_6

    .line 2149
    :cond_5
    invoke-interface {v2, v8}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->PayMode:Ljava/lang/String;

    .line 2151
    :goto_6
    invoke-interface {v2, v9}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_6

    .line 2152
    const/4 v14, 0x0

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Pay_Mode:Ljava/lang/String;

    goto :goto_7

    .line 2154
    :cond_6
    invoke-interface {v2, v9}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Pay_Mode:Ljava/lang/String;

    .line 2156
    :goto_7
    invoke-interface {v2, v10}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_7

    .line 2157
    const/4 v14, 0x0

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_No:Ljava/lang/String;

    goto :goto_8

    .line 2159
    :cond_7
    invoke-interface {v2, v10}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_No:Ljava/lang/String;

    .line 2162
    :goto_8
    invoke-interface {v2, v11}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_8

    .line 2163
    const/4 v14, 0x0

    .local v14, "_tmp_1":Ljava/lang/Long;
    goto :goto_9

    .line 2165
    .end local v14    # "_tmp_1":Ljava/lang/Long;
    :cond_8
    invoke-interface {v2, v11}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v95

    invoke-static/range {v95 .. v96}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    .line 2167
    .restart local v14    # "_tmp_1":Ljava/lang/Long;
    :goto_9
    move/from16 v95, v1

    .end local v1    # "_columnIndexOfReceivedFrom":I
    .local v95, "_columnIndexOfReceivedFrom":I
    invoke-static {v14}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_Date:Ljava/sql/Date;

    .line 2168
    invoke-interface {v2, v12}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 2169
    const/4 v1, 0x0

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Bank_Code:Ljava/lang/String;

    goto :goto_a

    .line 2171
    :cond_9
    invoke-interface {v2, v12}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Bank_Code:Ljava/lang/String;

    .line 2173
    :goto_a
    move/from16 v1, v95

    .end local v95    # "_columnIndexOfReceivedFrom":I
    .restart local v1    # "_columnIndexOfReceivedFrom":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v95

    if-eqz v95, :cond_a

    .line 2174
    move/from16 v95, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfEntryNo":I
    .local v95, "_columnIndexOfEntryNo":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Received_From:Ljava/lang/String;

    goto :goto_b

    .line 2176
    .end local v95    # "_columnIndexOfEntryNo":I
    .restart local v3    # "_columnIndexOfEntryNo":I
    :cond_a
    move/from16 v95, v3

    .end local v3    # "_columnIndexOfEntryNo":I
    .restart local v95    # "_columnIndexOfEntryNo":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Received_From:Ljava/lang/String;

    .line 2178
    :goto_b
    move/from16 v3, v94

    .end local v94    # "_columnIndexOfOnBehalfOf":I
    .local v3, "_columnIndexOfOnBehalfOf":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v94

    if-eqz v94, :cond_b

    .line 2179
    move/from16 v94, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfReceivedFrom":I
    .local v94, "_columnIndexOfReceivedFrom":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->On_Behalf_Of:Ljava/lang/String;

    goto :goto_c

    .line 2181
    .end local v94    # "_columnIndexOfReceivedFrom":I
    .restart local v1    # "_columnIndexOfReceivedFrom":I
    :cond_b
    move/from16 v94, v1

    .end local v1    # "_columnIndexOfReceivedFrom":I
    .restart local v94    # "_columnIndexOfReceivedFrom":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->On_Behalf_Of:Ljava/lang/String;

    .line 2183
    :goto_c
    move/from16 v1, v90

    .end local v90    # "_columnIndexOfCashier":I
    .local v1, "_columnIndexOfCashier":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v90

    if-eqz v90, :cond_c

    .line 2184
    move/from16 v90, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfOnBehalfOf":I
    .local v90, "_columnIndexOfOnBehalfOf":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Cashier:Ljava/lang/String;

    goto :goto_d

    .line 2186
    .end local v90    # "_columnIndexOfOnBehalfOf":I
    .restart local v3    # "_columnIndexOfOnBehalfOf":I
    :cond_c
    move/from16 v90, v3

    .end local v3    # "_columnIndexOfOnBehalfOf":I
    .restart local v90    # "_columnIndexOfOnBehalfOf":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Cashier:Ljava/lang/String;

    .line 2188
    :goto_d
    move/from16 v3, v16

    .end local v16    # "_columnIndexOfAccountNo":I
    .local v3, "_columnIndexOfAccountNo":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v16

    if-eqz v16, :cond_d

    .line 2189
    move/from16 v16, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfCashier":I
    .local v16, "_columnIndexOfCashier":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Account_No:Ljava/lang/String;

    goto :goto_e

    .line 2191
    .end local v16    # "_columnIndexOfCashier":I
    .restart local v1    # "_columnIndexOfCashier":I
    :cond_d
    move/from16 v16, v1

    .end local v1    # "_columnIndexOfCashier":I
    .restart local v16    # "_columnIndexOfCashier":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Account_No:Ljava/lang/String;

    .line 2193
    :goto_e
    move/from16 v1, v17

    .end local v17    # "_columnIndexOfAccountName":I
    .local v1, "_columnIndexOfAccountName":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v17

    if-eqz v17, :cond_e

    .line 2194
    move/from16 v17, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfAccountNo":I
    .local v17, "_columnIndexOfAccountNo":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Account_Name:Ljava/lang/String;

    goto :goto_f

    .line 2196
    .end local v17    # "_columnIndexOfAccountNo":I
    .restart local v3    # "_columnIndexOfAccountNo":I
    :cond_e
    move/from16 v17, v3

    .end local v3    # "_columnIndexOfAccountNo":I
    .restart local v17    # "_columnIndexOfAccountNo":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Account_Name:Ljava/lang/String;

    .line 2199
    :goto_f
    move/from16 v3, v18

    .end local v18    # "_columnIndexOfPosted":I
    .local v3, "_columnIndexOfPosted":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v18

    if-eqz v18, :cond_f

    .line 2200
    const/16 v18, 0x0

    move-object/from16 v96, v18

    move/from16 v18, v4

    move-object/from16 v4, v96

    move/from16 v96, v5

    .local v18, "_tmp_2":Ljava/lang/Integer;
    goto :goto_10

    .line 2202
    .end local v18    # "_tmp_2":Ljava/lang/Integer;
    :cond_f
    move/from16 v18, v4

    move/from16 v96, v5

    .end local v4    # "_columnIndexOfNo":I
    .end local v5    # "_columnIndexOfDate":I
    .local v18, "_columnIndexOfNo":I
    .local v96, "_columnIndexOfDate":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v4

    long-to-int v4, v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 2204
    .local v4, "_tmp_2":Ljava/lang/Integer;
    :goto_10
    const/16 v97, 0x0

    if-nez v4, :cond_10

    const/4 v5, 0x0

    goto :goto_12

    :cond_10
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v98

    if-eqz v98, :cond_11

    const/16 v98, 0x1

    goto :goto_11

    :cond_11
    move/from16 v98, v97

    :goto_11
    invoke-static/range {v98 .. v98}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v98

    move-object/from16 v5, v98

    :goto_12
    iput-object v5, v15, Lcom/trimline/metrocrew/transaction;->Posted:Ljava/lang/Boolean;

    .line 2206
    move/from16 v5, v19

    .end local v19    # "_columnIndexOfDatePosted":I
    .local v5, "_columnIndexOfDatePosted":I
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v19

    if-eqz v19, :cond_12

    .line 2207
    const/16 v19, 0x0

    .local v19, "_tmp_3":Ljava/lang/Long;
    goto :goto_13

    .line 2209
    .end local v19    # "_tmp_3":Ljava/lang/Long;
    :cond_12
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v99

    invoke-static/range {v99 .. v100}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    .line 2211
    .restart local v19    # "_tmp_3":Ljava/lang/Long;
    :goto_13
    move/from16 v98, v1

    .end local v1    # "_columnIndexOfAccountName":I
    .local v98, "_columnIndexOfAccountName":I
    invoke-static/range {v19 .. v19}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Date_Posted:Ljava/sql/Date;

    .line 2213
    move/from16 v1, v20

    .end local v20    # "_columnIndexOfTimePosted":I
    .local v1, "_columnIndexOfTimePosted":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v20

    if-eqz v20, :cond_13

    .line 2214
    const/16 v20, 0x0

    .local v20, "_tmp_4":Ljava/lang/Long;
    goto :goto_14

    .line 2216
    .end local v20    # "_tmp_4":Ljava/lang/Long;
    :cond_13
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v99

    invoke-static/range {v99 .. v100}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    .line 2218
    .restart local v20    # "_tmp_4":Ljava/lang/Long;
    :goto_14
    move/from16 v99, v1

    .end local v1    # "_columnIndexOfTimePosted":I
    .local v99, "_columnIndexOfTimePosted":I
    invoke-static/range {v20 .. v20}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Time_Posted:Ljava/sql/Date;

    .line 2219
    move/from16 v1, v21

    .end local v21    # "_columnIndexOfPostedBy":I
    .local v1, "_columnIndexOfPostedBy":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v21

    if-eqz v21, :cond_14

    .line 2220
    move/from16 v21, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfPosted":I
    .local v21, "_columnIndexOfPosted":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Posted_By:Ljava/lang/String;

    goto :goto_15

    .line 2222
    .end local v21    # "_columnIndexOfPosted":I
    .restart local v3    # "_columnIndexOfPosted":I
    :cond_14
    move/from16 v21, v3

    .end local v3    # "_columnIndexOfPosted":I
    .restart local v21    # "_columnIndexOfPosted":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Posted_By:Ljava/lang/String;

    .line 2224
    :goto_15
    move/from16 v3, v22

    .end local v22    # "_columnIndexOfAmount":I
    .local v3, "_columnIndexOfAmount":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v22

    if-eqz v22, :cond_15

    .line 2225
    move/from16 v22, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfPostedBy":I
    .local v22, "_columnIndexOfPostedBy":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Amount:Ljava/lang/Double;

    goto :goto_16

    .line 2227
    .end local v22    # "_columnIndexOfPostedBy":I
    .restart local v1    # "_columnIndexOfPostedBy":I
    :cond_15
    move/from16 v22, v1

    .end local v1    # "_columnIndexOfPostedBy":I
    .restart local v22    # "_columnIndexOfPostedBy":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v100

    invoke-static/range {v100 .. v101}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Amount:Ljava/lang/Double;

    .line 2229
    :goto_16
    move/from16 v1, v23

    .end local v23    # "_columnIndexOfRemarks":I
    .local v1, "_columnIndexOfRemarks":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v23

    if-eqz v23, :cond_16

    .line 2230
    move/from16 v23, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfAmount":I
    .local v23, "_columnIndexOfAmount":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Remarks:Ljava/lang/String;

    goto :goto_17

    .line 2232
    .end local v23    # "_columnIndexOfAmount":I
    .restart local v3    # "_columnIndexOfAmount":I
    :cond_16
    move/from16 v23, v3

    .end local v3    # "_columnIndexOfAmount":I
    .restart local v23    # "_columnIndexOfAmount":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Remarks:Ljava/lang/String;

    .line 2234
    :goto_17
    move/from16 v3, v24

    .end local v24    # "_columnIndexOfTransactionName":I
    .local v3, "_columnIndexOfTransactionName":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v24

    if-eqz v24, :cond_17

    .line 2235
    move/from16 v24, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfRemarks":I
    .local v24, "_columnIndexOfRemarks":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Transaction_Name:Ljava/lang/String;

    goto :goto_18

    .line 2237
    .end local v24    # "_columnIndexOfRemarks":I
    .restart local v1    # "_columnIndexOfRemarks":I
    :cond_17
    move/from16 v24, v1

    .end local v1    # "_columnIndexOfRemarks":I
    .restart local v24    # "_columnIndexOfRemarks":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Transaction_Name:Ljava/lang/String;

    .line 2239
    :goto_18
    move/from16 v1, v25

    .end local v25    # "_columnIndexOfBranchCode":I
    .local v1, "_columnIndexOfBranchCode":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v25

    if-eqz v25, :cond_18

    .line 2240
    move/from16 v25, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfTransactionName":I
    .local v25, "_columnIndexOfTransactionName":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Branch_Code:Ljava/lang/String;

    goto :goto_19

    .line 2242
    .end local v25    # "_columnIndexOfTransactionName":I
    .restart local v3    # "_columnIndexOfTransactionName":I
    :cond_18
    move/from16 v25, v3

    .end local v3    # "_columnIndexOfTransactionName":I
    .restart local v25    # "_columnIndexOfTransactionName":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Branch_Code:Ljava/lang/String;

    .line 2244
    :goto_19
    move/from16 v3, v26

    .end local v26    # "_columnIndexOfAgentCode":I
    .local v3, "_columnIndexOfAgentCode":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v26

    if-eqz v26, :cond_19

    .line 2245
    move/from16 v26, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfBranchCode":I
    .local v26, "_columnIndexOfBranchCode":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Agent_Code:Ljava/lang/String;

    goto :goto_1a

    .line 2247
    .end local v26    # "_columnIndexOfBranchCode":I
    .restart local v1    # "_columnIndexOfBranchCode":I
    :cond_19
    move/from16 v26, v1

    .end local v1    # "_columnIndexOfBranchCode":I
    .restart local v26    # "_columnIndexOfBranchCode":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Agent_Code:Ljava/lang/String;

    .line 2249
    :goto_1a
    move/from16 v1, v27

    .end local v27    # "_columnIndexOfGrouping":I
    .local v1, "_columnIndexOfGrouping":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v27

    if-eqz v27, :cond_1a

    .line 2250
    move/from16 v27, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfAgentCode":I
    .local v27, "_columnIndexOfAgentCode":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Grouping:Ljava/lang/String;

    goto :goto_1b

    .line 2252
    .end local v27    # "_columnIndexOfAgentCode":I
    .restart local v3    # "_columnIndexOfAgentCode":I
    :cond_1a
    move/from16 v27, v3

    .end local v3    # "_columnIndexOfAgentCode":I
    .restart local v27    # "_columnIndexOfAgentCode":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Grouping:Ljava/lang/String;

    .line 2254
    :goto_1b
    move/from16 v3, v28

    .end local v28    # "_columnIndexOfGlobalDimension1Code":I
    .local v3, "_columnIndexOfGlobalDimension1Code":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v28

    if-eqz v28, :cond_1b

    .line 2255
    move/from16 v28, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfGrouping":I
    .local v28, "_columnIndexOfGrouping":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Global_Dimension_1_Code:Ljava/lang/String;

    goto :goto_1c

    .line 2257
    .end local v28    # "_columnIndexOfGrouping":I
    .restart local v1    # "_columnIndexOfGrouping":I
    :cond_1b
    move/from16 v28, v1

    .end local v1    # "_columnIndexOfGrouping":I
    .restart local v28    # "_columnIndexOfGrouping":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Global_Dimension_1_Code:Ljava/lang/String;

    .line 2259
    :goto_1c
    move/from16 v1, v29

    .end local v29    # "_columnIndexOfShortcutDimension2Code":I
    .local v1, "_columnIndexOfShortcutDimension2Code":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v29

    if-eqz v29, :cond_1c

    .line 2260
    move/from16 v29, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfGlobalDimension1Code":I
    .local v29, "_columnIndexOfGlobalDimension1Code":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Shortcut_Dimension_2_Code:Ljava/lang/String;

    goto :goto_1d

    .line 2262
    .end local v29    # "_columnIndexOfGlobalDimension1Code":I
    .restart local v3    # "_columnIndexOfGlobalDimension1Code":I
    :cond_1c
    move/from16 v29, v3

    .end local v3    # "_columnIndexOfGlobalDimension1Code":I
    .restart local v29    # "_columnIndexOfGlobalDimension1Code":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Shortcut_Dimension_2_Code:Ljava/lang/String;

    .line 2264
    :goto_1d
    move/from16 v3, v30

    .end local v30    # "_columnIndexOfVATPercent":I
    .local v3, "_columnIndexOfVATPercent":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v30

    if-eqz v30, :cond_1d

    .line 2265
    move/from16 v30, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfShortcutDimension2Code":I
    .local v30, "_columnIndexOfShortcutDimension2Code":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->VAT_Percent:Ljava/lang/Double;

    goto :goto_1e

    .line 2267
    .end local v30    # "_columnIndexOfShortcutDimension2Code":I
    .restart local v1    # "_columnIndexOfShortcutDimension2Code":I
    :cond_1d
    move/from16 v30, v1

    .end local v1    # "_columnIndexOfShortcutDimension2Code":I
    .restart local v30    # "_columnIndexOfShortcutDimension2Code":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v100

    invoke-static/range {v100 .. v101}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->VAT_Percent:Ljava/lang/Double;

    .line 2269
    :goto_1e
    move/from16 v1, v31

    .end local v31    # "_columnIndexOfCurrencyCode":I
    .local v1, "_columnIndexOfCurrencyCode":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v31

    if-eqz v31, :cond_1e

    .line 2270
    move/from16 v31, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfVATPercent":I
    .local v31, "_columnIndexOfVATPercent":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Currency_Code:Ljava/lang/String;

    goto :goto_1f

    .line 2272
    .end local v31    # "_columnIndexOfVATPercent":I
    .restart local v3    # "_columnIndexOfVATPercent":I
    :cond_1e
    move/from16 v31, v3

    .end local v3    # "_columnIndexOfVATPercent":I
    .restart local v31    # "_columnIndexOfVATPercent":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Currency_Code:Ljava/lang/String;

    .line 2274
    :goto_1f
    move/from16 v3, v32

    .end local v32    # "_columnIndexOfCurrencyFactor":I
    .local v3, "_columnIndexOfCurrencyFactor":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v32

    if-eqz v32, :cond_1f

    .line 2275
    move/from16 v32, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfCurrencyCode":I
    .local v32, "_columnIndexOfCurrencyCode":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Currency_Factor:Ljava/lang/Double;

    goto :goto_20

    .line 2277
    .end local v32    # "_columnIndexOfCurrencyCode":I
    .restart local v1    # "_columnIndexOfCurrencyCode":I
    :cond_1f
    move/from16 v32, v1

    .end local v1    # "_columnIndexOfCurrencyCode":I
    .restart local v32    # "_columnIndexOfCurrencyCode":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v100

    invoke-static/range {v100 .. v101}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Currency_Factor:Ljava/lang/Double;

    .line 2279
    :goto_20
    move/from16 v1, v33

    .end local v33    # "_columnIndexOfVATBusPostingGroup":I
    .local v1, "_columnIndexOfVATBusPostingGroup":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v33

    if-eqz v33, :cond_20

    .line 2280
    move/from16 v33, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfCurrencyFactor":I
    .local v33, "_columnIndexOfCurrencyFactor":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->VAT_Bus_Posting_Group:Ljava/lang/String;

    goto :goto_21

    .line 2282
    .end local v33    # "_columnIndexOfCurrencyFactor":I
    .restart local v3    # "_columnIndexOfCurrencyFactor":I
    :cond_20
    move/from16 v33, v3

    .end local v3    # "_columnIndexOfCurrencyFactor":I
    .restart local v33    # "_columnIndexOfCurrencyFactor":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->VAT_Bus_Posting_Group:Ljava/lang/String;

    .line 2284
    :goto_21
    move/from16 v3, v34

    .end local v34    # "_columnIndexOfVATProdPostingGroup":I
    .local v3, "_columnIndexOfVATProdPostingGroup":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v34

    if-eqz v34, :cond_21

    .line 2285
    move/from16 v34, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfVATBusPostingGroup":I
    .local v34, "_columnIndexOfVATBusPostingGroup":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->VAT_Prod_Posting_Group:Ljava/lang/String;

    goto :goto_22

    .line 2287
    .end local v34    # "_columnIndexOfVATBusPostingGroup":I
    .restart local v1    # "_columnIndexOfVATBusPostingGroup":I
    :cond_21
    move/from16 v34, v1

    .end local v1    # "_columnIndexOfVATBusPostingGroup":I
    .restart local v34    # "_columnIndexOfVATBusPostingGroup":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->VAT_Prod_Posting_Group:Ljava/lang/String;

    .line 2290
    :goto_22
    move/from16 v1, v35

    .end local v35    # "_columnIndexOfGenPostingTypeSpecified":I
    .local v1, "_columnIndexOfGenPostingTypeSpecified":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v35

    if-eqz v35, :cond_22

    .line 2291
    const/16 v35, 0x0

    move/from16 v100, v3

    move-object/from16 v3, v35

    move-object/from16 v35, v4

    .local v35, "_tmp_5":Ljava/lang/Integer;
    goto :goto_23

    .line 2293
    .end local v35    # "_tmp_5":Ljava/lang/Integer;
    :cond_22
    move/from16 v100, v3

    move-object/from16 v35, v4

    .end local v3    # "_columnIndexOfVATProdPostingGroup":I
    .end local v4    # "_tmp_2":Ljava/lang/Integer;
    .local v35, "_tmp_2":Ljava/lang/Integer;
    .local v100, "_columnIndexOfVATProdPostingGroup":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 2295
    .local v3, "_tmp_5":Ljava/lang/Integer;
    :goto_23
    if-nez v3, :cond_23

    const/4 v4, 0x0

    goto :goto_25

    :cond_23
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_24

    const/4 v4, 0x1

    goto :goto_24

    :cond_24
    move/from16 v4, v97

    :goto_24
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    :goto_25
    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Gen_Posting_TypeSpecified:Ljava/lang/Boolean;

    .line 2296
    move/from16 v4, v36

    .end local v36    # "_columnIndexOfGenBusPostingGroup":I
    .local v4, "_columnIndexOfGenBusPostingGroup":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v36

    if-eqz v36, :cond_25

    .line 2297
    move/from16 v36, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfGenPostingTypeSpecified":I
    .local v36, "_columnIndexOfGenPostingTypeSpecified":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Gen_Bus_Posting_Group:Ljava/lang/String;

    goto :goto_26

    .line 2299
    .end local v36    # "_columnIndexOfGenPostingTypeSpecified":I
    .restart local v1    # "_columnIndexOfGenPostingTypeSpecified":I
    :cond_25
    move/from16 v36, v1

    .end local v1    # "_columnIndexOfGenPostingTypeSpecified":I
    .restart local v36    # "_columnIndexOfGenPostingTypeSpecified":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Gen_Bus_Posting_Group:Ljava/lang/String;

    .line 2301
    :goto_26
    move/from16 v1, v37

    .end local v37    # "_columnIndexOfGenProdPostingGroup":I
    .local v1, "_columnIndexOfGenProdPostingGroup":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v37

    if-eqz v37, :cond_26

    .line 2302
    move-object/from16 v37, v3

    const/4 v3, 0x0

    .end local v3    # "_tmp_5":Ljava/lang/Integer;
    .local v37, "_tmp_5":Ljava/lang/Integer;
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Gen_Prod_Posting_Group:Ljava/lang/String;

    goto :goto_27

    .line 2304
    .end local v37    # "_tmp_5":Ljava/lang/Integer;
    .restart local v3    # "_tmp_5":Ljava/lang/Integer;
    :cond_26
    move-object/from16 v37, v3

    .end local v3    # "_tmp_5":Ljava/lang/Integer;
    .restart local v37    # "_tmp_5":Ljava/lang/Integer;
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Gen_Prod_Posting_Group:Ljava/lang/String;

    .line 2306
    :goto_27
    move/from16 v3, v38

    .end local v38    # "_columnIndexOfVATAmount":I
    .local v3, "_columnIndexOfVATAmount":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v38

    if-eqz v38, :cond_27

    .line 2307
    move/from16 v38, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfGenProdPostingGroup":I
    .local v38, "_columnIndexOfGenProdPostingGroup":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->VAT_Amount:Ljava/lang/Double;

    goto :goto_28

    .line 2309
    .end local v38    # "_columnIndexOfGenProdPostingGroup":I
    .restart local v1    # "_columnIndexOfGenProdPostingGroup":I
    :cond_27
    move/from16 v38, v1

    .end local v1    # "_columnIndexOfGenProdPostingGroup":I
    .restart local v38    # "_columnIndexOfGenProdPostingGroup":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v101

    invoke-static/range {v101 .. v102}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->VAT_Amount:Ljava/lang/Double;

    .line 2311
    :goto_28
    move/from16 v1, v39

    .end local v39    # "_columnIndexOfTotalAmount":I
    .local v1, "_columnIndexOfTotalAmount":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v39

    if-eqz v39, :cond_28

    .line 2312
    move/from16 v39, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfVATAmount":I
    .local v39, "_columnIndexOfVATAmount":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Total_Amount:Ljava/lang/Double;

    goto :goto_29

    .line 2314
    .end local v39    # "_columnIndexOfVATAmount":I
    .restart local v3    # "_columnIndexOfVATAmount":I
    :cond_28
    move/from16 v39, v3

    .end local v3    # "_columnIndexOfVATAmount":I
    .restart local v39    # "_columnIndexOfVATAmount":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v101

    invoke-static/range {v101 .. v102}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Total_Amount:Ljava/lang/Double;

    .line 2316
    :goto_29
    move/from16 v3, v40

    .end local v40    # "_columnIndexOfUserID":I
    .local v3, "_columnIndexOfUserID":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v40

    if-eqz v40, :cond_29

    .line 2317
    move/from16 v40, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfTotalAmount":I
    .local v40, "_columnIndexOfTotalAmount":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->User_ID:Ljava/lang/String;

    goto :goto_2a

    .line 2319
    .end local v40    # "_columnIndexOfTotalAmount":I
    .restart local v1    # "_columnIndexOfTotalAmount":I
    :cond_29
    move/from16 v40, v1

    .end local v1    # "_columnIndexOfTotalAmount":I
    .restart local v40    # "_columnIndexOfTotalAmount":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->User_ID:Ljava/lang/String;

    .line 2321
    :goto_2a
    move/from16 v1, v41

    .end local v41    # "_columnIndexOfApplyTo":I
    .local v1, "_columnIndexOfApplyTo":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v41

    if-eqz v41, :cond_2a

    .line 2322
    move/from16 v41, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfUserID":I
    .local v41, "_columnIndexOfUserID":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Apply_to:Ljava/lang/String;

    goto :goto_2b

    .line 2324
    .end local v41    # "_columnIndexOfUserID":I
    .restart local v3    # "_columnIndexOfUserID":I
    :cond_2a
    move/from16 v41, v3

    .end local v3    # "_columnIndexOfUserID":I
    .restart local v41    # "_columnIndexOfUserID":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Apply_to:Ljava/lang/String;

    .line 2326
    :goto_2b
    move/from16 v3, v42

    .end local v42    # "_columnIndexOfApplyToID":I
    .local v3, "_columnIndexOfApplyToID":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v42

    if-eqz v42, :cond_2b

    .line 2327
    move/from16 v42, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfApplyTo":I
    .local v42, "_columnIndexOfApplyTo":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Apply_to_ID:Ljava/lang/String;

    goto :goto_2c

    .line 2329
    .end local v42    # "_columnIndexOfApplyTo":I
    .restart local v1    # "_columnIndexOfApplyTo":I
    :cond_2b
    move/from16 v42, v1

    .end local v1    # "_columnIndexOfApplyTo":I
    .restart local v42    # "_columnIndexOfApplyTo":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Apply_to_ID:Ljava/lang/String;

    .line 2331
    :goto_2c
    move/from16 v1, v43

    .end local v43    # "_columnIndexOfDestGlobalDimension1Code":I
    .local v1, "_columnIndexOfDestGlobalDimension1Code":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v43

    if-eqz v43, :cond_2c

    .line 2332
    move/from16 v43, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfApplyToID":I
    .local v43, "_columnIndexOfApplyToID":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Dest_Global_Dimension_1_Code:Ljava/lang/String;

    goto :goto_2d

    .line 2334
    .end local v43    # "_columnIndexOfApplyToID":I
    .restart local v3    # "_columnIndexOfApplyToID":I
    :cond_2c
    move/from16 v43, v3

    .end local v3    # "_columnIndexOfApplyToID":I
    .restart local v43    # "_columnIndexOfApplyToID":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Dest_Global_Dimension_1_Code:Ljava/lang/String;

    .line 2336
    :goto_2d
    move/from16 v3, v44

    .end local v44    # "_columnIndexOfDestShortcutDimension2Code":I
    .local v3, "_columnIndexOfDestShortcutDimension2Code":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v44

    if-eqz v44, :cond_2d

    .line 2337
    move/from16 v44, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfDestGlobalDimension1Code":I
    .local v44, "_columnIndexOfDestGlobalDimension1Code":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Dest_Shortcut_Dimension_2_Code:Ljava/lang/String;

    goto :goto_2e

    .line 2339
    .end local v44    # "_columnIndexOfDestGlobalDimension1Code":I
    .restart local v1    # "_columnIndexOfDestGlobalDimension1Code":I
    :cond_2d
    move/from16 v44, v1

    .end local v1    # "_columnIndexOfDestGlobalDimension1Code":I
    .restart local v44    # "_columnIndexOfDestGlobalDimension1Code":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Dest_Shortcut_Dimension_2_Code:Ljava/lang/String;

    .line 2341
    :goto_2e
    move/from16 v101, v3

    move/from16 v1, v45

    move/from16 v45, v4

    .end local v3    # "_columnIndexOfDestShortcutDimension2Code":I
    .end local v4    # "_columnIndexOfGenBusPostingGroup":I
    .local v1, "_columnIndexOfLineNo":I
    .local v45, "_columnIndexOfGenBusPostingGroup":I
    .local v101, "_columnIndexOfDestShortcutDimension2Code":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    iput v3, v15, Lcom/trimline/metrocrew/transaction;->Line_No:I

    .line 2342
    move/from16 v3, v46

    move/from16 v46, v5

    .end local v5    # "_columnIndexOfDatePosted":I
    .local v3, "_columnIndexOfPrintNo":I
    .local v46, "_columnIndexOfDatePosted":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, v15, Lcom/trimline/metrocrew/transaction;->Print_No:I

    .line 2344
    move/from16 v4, v47

    .end local v47    # "_columnIndexOfDepositSlipTime":I
    .local v4, "_columnIndexOfDepositSlipTime":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v5

    if-eqz v5, :cond_2e

    .line 2345
    const/4 v5, 0x0

    .local v5, "_tmp_6":Ljava/lang/Long;
    goto :goto_2f

    .line 2347
    .end local v5    # "_tmp_6":Ljava/lang/Long;
    :cond_2e
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v102

    invoke-static/range {v102 .. v103}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    .line 2349
    .restart local v5    # "_tmp_6":Ljava/lang/Long;
    :goto_2f
    move/from16 v47, v1

    .end local v1    # "_columnIndexOfLineNo":I
    .local v47, "_columnIndexOfLineNo":I
    invoke-static {v5}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Deposit_Slip_Time:Ljava/sql/Date;

    .line 2350
    move/from16 v1, v48

    .end local v48    # "_columnIndexOfTellerID":I
    .local v1, "_columnIndexOfTellerID":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v48

    if-eqz v48, :cond_2f

    .line 2351
    move/from16 v48, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfPrintNo":I
    .local v48, "_columnIndexOfPrintNo":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Teller_ID:Ljava/lang/String;

    goto :goto_30

    .line 2353
    .end local v48    # "_columnIndexOfPrintNo":I
    .restart local v3    # "_columnIndexOfPrintNo":I
    :cond_2f
    move/from16 v48, v3

    .end local v3    # "_columnIndexOfPrintNo":I
    .restart local v48    # "_columnIndexOfPrintNo":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Teller_ID:Ljava/lang/String;

    .line 2356
    :goto_30
    move/from16 v3, v49

    .end local v49    # "_columnIndexOfCustomerPaymentOnAccount":I
    .local v3, "_columnIndexOfCustomerPaymentOnAccount":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v49

    if-eqz v49, :cond_30

    .line 2357
    const/16 v49, 0x0

    move-object/from16 v102, v49

    move/from16 v49, v4

    move-object/from16 v4, v102

    move-object/from16 v102, v5

    .local v49, "_tmp_7":Ljava/lang/Integer;
    goto :goto_31

    .line 2359
    .end local v49    # "_tmp_7":Ljava/lang/Integer;
    :cond_30
    move/from16 v49, v4

    move-object/from16 v102, v5

    .end local v4    # "_columnIndexOfDepositSlipTime":I
    .end local v5    # "_tmp_6":Ljava/lang/Long;
    .local v49, "_columnIndexOfDepositSlipTime":I
    .local v102, "_tmp_6":Ljava/lang/Long;
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v4

    long-to-int v4, v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 2361
    .local v4, "_tmp_7":Ljava/lang/Integer;
    :goto_31
    if-nez v4, :cond_31

    const/4 v5, 0x0

    goto :goto_33

    :cond_31
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eqz v5, :cond_32

    const/4 v5, 0x1

    goto :goto_32

    :cond_32
    move/from16 v5, v97

    :goto_32
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    :goto_33
    iput-object v5, v15, Lcom/trimline/metrocrew/transaction;->Customer_Payment_On_Account:Ljava/lang/Boolean;

    .line 2363
    move/from16 v5, v50

    .end local v50    # "_columnIndexOfSelect":I
    .local v5, "_columnIndexOfSelect":I
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v50

    if-eqz v50, :cond_33

    .line 2364
    const/16 v50, 0x0

    move-object/from16 v103, v50

    move/from16 v50, v3

    move-object/from16 v3, v103

    move-object/from16 v103, v4

    .local v50, "_tmp_8":Ljava/lang/Integer;
    goto :goto_34

    .line 2366
    .end local v50    # "_tmp_8":Ljava/lang/Integer;
    :cond_33
    move/from16 v50, v3

    move-object/from16 v103, v4

    .end local v3    # "_columnIndexOfCustomerPaymentOnAccount":I
    .end local v4    # "_tmp_7":Ljava/lang/Integer;
    .local v50, "_columnIndexOfCustomerPaymentOnAccount":I
    .local v103, "_tmp_7":Ljava/lang/Integer;
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 2368
    .local v3, "_tmp_8":Ljava/lang/Integer;
    :goto_34
    if-nez v3, :cond_34

    const/4 v4, 0x0

    goto :goto_36

    :cond_34
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_35

    const/4 v4, 0x1

    goto :goto_35

    :cond_35
    move/from16 v4, v97

    :goto_35
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    :goto_36
    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Select:Ljava/lang/Boolean;

    .line 2370
    move/from16 v4, v51

    .end local v51    # "_columnIndexOfBatchPosted":I
    .local v4, "_columnIndexOfBatchPosted":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v51

    if-eqz v51, :cond_36

    .line 2371
    const/16 v51, 0x0

    move/from16 v104, v5

    move-object/from16 v5, v51

    move/from16 v51, v6

    .local v51, "_tmp_9":Ljava/lang/Integer;
    goto :goto_37

    .line 2373
    .end local v51    # "_tmp_9":Ljava/lang/Integer;
    :cond_36
    move/from16 v104, v5

    move/from16 v51, v6

    .end local v5    # "_columnIndexOfSelect":I
    .end local v6    # "_columnIndexOfType":I
    .local v51, "_columnIndexOfType":I
    .local v104, "_columnIndexOfSelect":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v5

    long-to-int v5, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 2375
    .local v5, "_tmp_9":Ljava/lang/Integer;
    :goto_37
    if-nez v5, :cond_37

    const/4 v6, 0x0

    goto :goto_39

    :cond_37
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-eqz v6, :cond_38

    const/4 v6, 0x1

    goto :goto_38

    :cond_38
    move/from16 v6, v97

    :goto_38
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :goto_39
    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Batch_Posted:Ljava/lang/Boolean;

    .line 2376
    move/from16 v6, v52

    .end local v52    # "_columnIndexOfTransactionNo":I
    .local v6, "_columnIndexOfTransactionNo":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v52

    if-eqz v52, :cond_39

    .line 2377
    move/from16 v52, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfTellerID":I
    .local v52, "_columnIndexOfTellerID":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Transaction_No:Ljava/lang/String;

    goto :goto_3a

    .line 2379
    .end local v52    # "_columnIndexOfTellerID":I
    .restart local v1    # "_columnIndexOfTellerID":I
    :cond_39
    move/from16 v52, v1

    .end local v1    # "_columnIndexOfTellerID":I
    .restart local v52    # "_columnIndexOfTellerID":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Transaction_No:Ljava/lang/String;

    .line 2381
    :goto_3a
    move/from16 v1, v53

    .end local v53    # "_columnIndexOfChequeDepositSlipBank":I
    .local v1, "_columnIndexOfChequeDepositSlipBank":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v53

    if-eqz v53, :cond_3a

    .line 2382
    move-object/from16 v53, v3

    const/4 v3, 0x0

    .end local v3    # "_tmp_8":Ljava/lang/Integer;
    .local v53, "_tmp_8":Ljava/lang/Integer;
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_Bank:Ljava/lang/String;

    goto :goto_3b

    .line 2384
    .end local v53    # "_tmp_8":Ljava/lang/Integer;
    .restart local v3    # "_tmp_8":Ljava/lang/Integer;
    :cond_3a
    move-object/from16 v53, v3

    .end local v3    # "_tmp_8":Ljava/lang/Integer;
    .restart local v53    # "_tmp_8":Ljava/lang/Integer;
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_Bank:Ljava/lang/String;

    .line 2386
    :goto_3b
    move/from16 v3, v54

    .end local v54    # "_columnIndexOfBankAccount":I
    .local v3, "_columnIndexOfBankAccount":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v54

    if-eqz v54, :cond_3b

    .line 2387
    move/from16 v54, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfChequeDepositSlipBank":I
    .local v54, "_columnIndexOfChequeDepositSlipBank":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Bank_Account:Ljava/lang/String;

    goto :goto_3c

    .line 2389
    .end local v54    # "_columnIndexOfChequeDepositSlipBank":I
    .restart local v1    # "_columnIndexOfChequeDepositSlipBank":I
    :cond_3b
    move/from16 v54, v1

    .end local v1    # "_columnIndexOfChequeDepositSlipBank":I
    .restart local v54    # "_columnIndexOfChequeDepositSlipBank":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Bank_Account:Ljava/lang/String;

    .line 2392
    :goto_3c
    move/from16 v1, v55

    .end local v55    # "_columnIndexOfConfirmed":I
    .local v1, "_columnIndexOfConfirmed":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v55

    if-eqz v55, :cond_3c

    .line 2393
    const/16 v55, 0x0

    move/from16 v105, v3

    move-object/from16 v3, v55

    move/from16 v55, v4

    .local v55, "_tmp_10":Ljava/lang/Integer;
    goto :goto_3d

    .line 2395
    .end local v55    # "_tmp_10":Ljava/lang/Integer;
    :cond_3c
    move/from16 v105, v3

    move/from16 v55, v4

    .end local v3    # "_columnIndexOfBankAccount":I
    .end local v4    # "_columnIndexOfBatchPosted":I
    .local v55, "_columnIndexOfBatchPosted":I
    .local v105, "_columnIndexOfBankAccount":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 2397
    .local v3, "_tmp_10":Ljava/lang/Integer;
    :goto_3d
    if-nez v3, :cond_3d

    const/4 v4, 0x0

    goto :goto_3f

    :cond_3d
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_3e

    const/4 v4, 0x1

    goto :goto_3e

    :cond_3e
    move/from16 v4, v97

    :goto_3e
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    :goto_3f
    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Confirmed:Ljava/lang/Boolean;

    .line 2399
    move/from16 v4, v56

    .end local v56    # "_columnIndexOfReconciled":I
    .local v4, "_columnIndexOfReconciled":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v56

    if-eqz v56, :cond_3f

    .line 2400
    const/16 v56, 0x0

    move-object/from16 v106, v56

    move-object/from16 v56, v5

    move-object/from16 v5, v106

    move/from16 v106, v6

    .local v56, "_tmp_11":Ljava/lang/Integer;
    goto :goto_40

    .line 2402
    .end local v56    # "_tmp_11":Ljava/lang/Integer;
    :cond_3f
    move-object/from16 v56, v5

    move/from16 v106, v6

    .end local v5    # "_tmp_9":Ljava/lang/Integer;
    .end local v6    # "_columnIndexOfTransactionNo":I
    .local v56, "_tmp_9":Ljava/lang/Integer;
    .local v106, "_columnIndexOfTransactionNo":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v5

    long-to-int v5, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 2404
    .local v5, "_tmp_11":Ljava/lang/Integer;
    :goto_40
    if-nez v5, :cond_40

    const/4 v6, 0x0

    goto :goto_42

    :cond_40
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-eqz v6, :cond_41

    const/4 v6, 0x1

    goto :goto_41

    :cond_41
    move/from16 v6, v97

    :goto_41
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :goto_42
    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Reconciled:Ljava/lang/Boolean;

    .line 2405
    move/from16 v6, v57

    .end local v57    # "_columnIndexOfOrigCashier":I
    .local v6, "_columnIndexOfOrigCashier":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v57

    if-eqz v57, :cond_42

    .line 2406
    move/from16 v57, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfConfirmed":I
    .local v57, "_columnIndexOfConfirmed":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Orig_Cashier:Ljava/lang/String;

    goto :goto_43

    .line 2408
    .end local v57    # "_columnIndexOfConfirmed":I
    .restart local v1    # "_columnIndexOfConfirmed":I
    :cond_42
    move/from16 v57, v1

    .end local v1    # "_columnIndexOfConfirmed":I
    .restart local v57    # "_columnIndexOfConfirmed":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Orig_Cashier:Ljava/lang/String;

    .line 2411
    :goto_43
    move/from16 v1, v58

    .end local v58    # "_columnIndexOfCancelled":I
    .local v1, "_columnIndexOfCancelled":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v58

    if-eqz v58, :cond_43

    .line 2412
    const/16 v58, 0x0

    move-object/from16 v107, v58

    move-object/from16 v58, v3

    move-object/from16 v3, v107

    move/from16 v107, v4

    .local v58, "_tmp_12":Ljava/lang/Integer;
    goto :goto_44

    .line 2414
    .end local v58    # "_tmp_12":Ljava/lang/Integer;
    :cond_43
    move-object/from16 v58, v3

    move/from16 v107, v4

    .end local v3    # "_tmp_10":Ljava/lang/Integer;
    .end local v4    # "_columnIndexOfReconciled":I
    .local v58, "_tmp_10":Ljava/lang/Integer;
    .local v107, "_columnIndexOfReconciled":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 2416
    .local v3, "_tmp_12":Ljava/lang/Integer;
    :goto_44
    if-nez v3, :cond_44

    const/4 v4, 0x0

    goto :goto_46

    :cond_44
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_45

    const/4 v4, 0x1

    goto :goto_45

    :cond_45
    move/from16 v4, v97

    :goto_45
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    :goto_46
    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Cancelled:Ljava/lang/Boolean;

    .line 2417
    move/from16 v4, v59

    .end local v59    # "_columnIndexOfCancelledBy":I
    .local v4, "_columnIndexOfCancelledBy":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v59

    if-eqz v59, :cond_46

    .line 2418
    move/from16 v59, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfCancelled":I
    .local v59, "_columnIndexOfCancelled":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Cancelled_By:Ljava/lang/String;

    goto :goto_47

    .line 2420
    .end local v59    # "_columnIndexOfCancelled":I
    .restart local v1    # "_columnIndexOfCancelled":I
    :cond_46
    move/from16 v59, v1

    .end local v1    # "_columnIndexOfCancelled":I
    .restart local v59    # "_columnIndexOfCancelled":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Cancelled_By:Ljava/lang/String;

    .line 2423
    :goto_47
    move/from16 v1, v60

    .end local v60    # "_columnIndexOfCancelledDate":I
    .local v1, "_columnIndexOfCancelledDate":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v60

    if-eqz v60, :cond_47

    .line 2424
    const/16 v60, 0x0

    .local v60, "_tmp_13":Ljava/lang/Long;
    goto :goto_48

    .line 2426
    .end local v60    # "_tmp_13":Ljava/lang/Long;
    :cond_47
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v108

    invoke-static/range {v108 .. v109}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v60

    .line 2428
    .restart local v60    # "_tmp_13":Ljava/lang/Long;
    :goto_48
    move/from16 v108, v1

    .end local v1    # "_columnIndexOfCancelledDate":I
    .local v108, "_columnIndexOfCancelledDate":I
    invoke-static/range {v60 .. v60}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Cancelled_Date:Ljava/sql/Date;

    .line 2430
    move/from16 v1, v61

    .end local v61    # "_columnIndexOfCancelledTime":I
    .local v1, "_columnIndexOfCancelledTime":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v61

    if-eqz v61, :cond_48

    .line 2431
    const/16 v61, 0x0

    .local v61, "_tmp_14":Ljava/lang/Long;
    goto :goto_49

    .line 2433
    .end local v61    # "_tmp_14":Ljava/lang/Long;
    :cond_48
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v109

    invoke-static/range {v109 .. v110}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v61

    .line 2435
    .restart local v61    # "_tmp_14":Ljava/lang/Long;
    :goto_49
    move/from16 v109, v1

    .end local v1    # "_columnIndexOfCancelledTime":I
    .local v109, "_columnIndexOfCancelledTime":I
    invoke-static/range {v61 .. v61}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Cancelled_Time:Ljava/sql/Date;

    .line 2437
    move/from16 v1, v62

    .end local v62    # "_columnIndexOfPostDated":I
    .local v1, "_columnIndexOfPostDated":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v62

    if-eqz v62, :cond_49

    .line 2438
    const/16 v62, 0x0

    move-object/from16 v110, v62

    move-object/from16 v62, v3

    move-object/from16 v3, v110

    move/from16 v110, v4

    .local v62, "_tmp_15":Ljava/lang/Integer;
    goto :goto_4a

    .line 2440
    .end local v62    # "_tmp_15":Ljava/lang/Integer;
    :cond_49
    move-object/from16 v62, v3

    move/from16 v110, v4

    .end local v3    # "_tmp_12":Ljava/lang/Integer;
    .end local v4    # "_columnIndexOfCancelledBy":I
    .local v62, "_tmp_12":Ljava/lang/Integer;
    .local v110, "_columnIndexOfCancelledBy":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 2442
    .local v3, "_tmp_15":Ljava/lang/Integer;
    :goto_4a
    if-nez v3, :cond_4a

    const/4 v4, 0x0

    goto :goto_4c

    :cond_4a
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_4b

    const/4 v4, 0x1

    goto :goto_4b

    :cond_4b
    move/from16 v4, v97

    :goto_4b
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    :goto_4c
    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Post_Dated:Ljava/lang/Boolean;

    .line 2444
    move/from16 v4, v63

    .end local v63    # "_columnIndexOfChequeRetrieved":I
    .local v4, "_columnIndexOfChequeRetrieved":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v63

    if-eqz v63, :cond_4c

    .line 2445
    const/16 v63, 0x0

    move-object/from16 v111, v63

    move-object/from16 v63, v5

    move-object/from16 v5, v111

    move/from16 v111, v6

    .local v63, "_tmp_16":Ljava/lang/Integer;
    goto :goto_4d

    .line 2447
    .end local v63    # "_tmp_16":Ljava/lang/Integer;
    :cond_4c
    move-object/from16 v63, v5

    move/from16 v111, v6

    .end local v5    # "_tmp_11":Ljava/lang/Integer;
    .end local v6    # "_columnIndexOfOrigCashier":I
    .local v63, "_tmp_11":Ljava/lang/Integer;
    .local v111, "_columnIndexOfOrigCashier":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v5

    long-to-int v5, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 2449
    .local v5, "_tmp_16":Ljava/lang/Integer;
    :goto_4d
    if-nez v5, :cond_4d

    const/4 v6, 0x0

    goto :goto_4f

    :cond_4d
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-eqz v6, :cond_4e

    const/4 v6, 0x1

    goto :goto_4e

    :cond_4e
    move/from16 v6, v97

    :goto_4e
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :goto_4f
    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Cheque_Retrieved:Ljava/lang/Boolean;

    .line 2450
    move/from16 v112, v4

    move/from16 v6, v64

    move-object/from16 v64, v3

    .end local v3    # "_tmp_15":Ljava/lang/Integer;
    .end local v4    # "_columnIndexOfChequeRetrieved":I
    .local v6, "_columnIndexOfRegisterNumber":I
    .local v64, "_tmp_15":Ljava/lang/Integer;
    .local v112, "_columnIndexOfChequeRetrieved":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    iput v3, v15, Lcom/trimline/metrocrew/transaction;->Register_Number:I

    .line 2451
    move/from16 v3, v65

    move-object/from16 v65, v5

    .end local v5    # "_tmp_16":Ljava/lang/Integer;
    .local v3, "_columnIndexOfFromEntryNo":I
    .local v65, "_tmp_16":Ljava/lang/Integer;
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, v15, Lcom/trimline/metrocrew/transaction;->From_Entry_No:I

    .line 2452
    move/from16 v4, v66

    move/from16 v66, v6

    .end local v6    # "_columnIndexOfRegisterNumber":I
    .local v4, "_columnIndexOfToEntryNo":I
    .local v66, "_columnIndexOfRegisterNumber":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v5

    long-to-int v5, v5

    iput v5, v15, Lcom/trimline/metrocrew/transaction;->To_Entry_No:I

    .line 2453
    move/from16 v5, v67

    .end local v67    # "_columnIndexOfBatchPostedUserID":I
    .local v5, "_columnIndexOfBatchPostedUserID":I
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_4f

    .line 2454
    const/4 v6, 0x0

    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Batch_Posted_UserID:Ljava/lang/String;

    goto :goto_50

    .line 2456
    :cond_4f
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Batch_Posted_UserID:Ljava/lang/String;

    .line 2458
    :goto_50
    move/from16 v67, v3

    move/from16 v6, v68

    move/from16 v68, v4

    .end local v3    # "_columnIndexOfFromEntryNo":I
    .end local v4    # "_columnIndexOfToEntryNo":I
    .local v6, "_columnIndexOfBDRegisterNumber":I
    .local v67, "_columnIndexOfFromEntryNo":I
    .local v68, "_columnIndexOfToEntryNo":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    iput v3, v15, Lcom/trimline/metrocrew/transaction;->BD_Register_Number:I

    .line 2459
    move/from16 v3, v69

    move/from16 v69, v5

    .end local v5    # "_columnIndexOfBatchPostedUserID":I
    .local v3, "_columnIndexOfBDFromNumber":I
    .local v69, "_columnIndexOfBatchPostedUserID":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, v15, Lcom/trimline/metrocrew/transaction;->BD_From_Number:I

    .line 2460
    move/from16 v4, v70

    move/from16 v70, v6

    .end local v6    # "_columnIndexOfBDRegisterNumber":I
    .local v4, "_columnIndexOfBDToNumber":I
    .local v70, "_columnIndexOfBDRegisterNumber":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v5

    long-to-int v5, v5

    iput v5, v15, Lcom/trimline/metrocrew/transaction;->BD_To_Number:I

    .line 2461
    move/from16 v5, v71

    .end local v71    # "_columnIndexOfReversalBy":I
    .local v5, "_columnIndexOfReversalBy":I
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_50

    .line 2462
    const/4 v6, 0x0

    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Reversal_By:Ljava/lang/String;

    goto :goto_51

    .line 2464
    :cond_50
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Reversal_By:Ljava/lang/String;

    .line 2467
    :goto_51
    move/from16 v6, v72

    .end local v72    # "_columnIndexOfReversalDate":I
    .local v6, "_columnIndexOfReversalDate":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v71

    if-eqz v71, :cond_51

    .line 2468
    const/16 v71, 0x0

    .local v71, "_tmp_17":Ljava/lang/Long;
    goto :goto_52

    .line 2470
    .end local v71    # "_tmp_17":Ljava/lang/Long;
    :cond_51
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v71

    invoke-static/range {v71 .. v72}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v71

    .line 2472
    .restart local v71    # "_tmp_17":Ljava/lang/Long;
    :goto_52
    move/from16 v72, v1

    .end local v1    # "_columnIndexOfPostDated":I
    .local v72, "_columnIndexOfPostDated":I
    invoke-static/range {v71 .. v71}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Reversal_Date:Ljava/sql/Date;

    .line 2474
    move/from16 v1, v73

    .end local v73    # "_columnIndexOfReversalTime":I
    .local v1, "_columnIndexOfReversalTime":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v73

    if-eqz v73, :cond_52

    .line 2475
    const/16 v73, 0x0

    .local v73, "_tmp_18":Ljava/lang/Long;
    goto :goto_53

    .line 2477
    .end local v73    # "_tmp_18":Ljava/lang/Long;
    :cond_52
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v113

    invoke-static/range {v113 .. v114}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v73

    .line 2479
    .restart local v73    # "_tmp_18":Ljava/lang/Long;
    :goto_53
    move/from16 v113, v1

    .end local v1    # "_columnIndexOfReversalTime":I
    .local v113, "_columnIndexOfReversalTime":I
    invoke-static/range {v73 .. v73}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Reversal_Time:Ljava/sql/Date;

    .line 2480
    move/from16 v114, v4

    move/from16 v1, v74

    move/from16 v74, v3

    .end local v3    # "_columnIndexOfBDFromNumber":I
    .end local v4    # "_columnIndexOfBDToNumber":I
    .local v1, "_columnIndexOfReversalRegisterNo":I
    .local v74, "_columnIndexOfBDFromNumber":I
    .local v114, "_columnIndexOfBDToNumber":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    iput v3, v15, Lcom/trimline/metrocrew/transaction;->Reversal_Register_No:I

    .line 2481
    move/from16 v3, v75

    move/from16 v75, v5

    .end local v5    # "_columnIndexOfReversalBy":I
    .local v3, "_columnIndexOfReversalFromEntryNo":I
    .local v75, "_columnIndexOfReversalBy":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, v15, Lcom/trimline/metrocrew/transaction;->Reversal_From_Entry_No:I

    .line 2482
    move/from16 v4, v76

    move/from16 v76, v6

    .end local v6    # "_columnIndexOfReversalDate":I
    .local v4, "_columnIndexOfReversalToEntryNo":I
    .local v76, "_columnIndexOfReversalDate":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v5

    long-to-int v5, v5

    iput v5, v15, Lcom/trimline/metrocrew/transaction;->Reversal_To_Entry_No:I

    .line 2484
    move/from16 v5, v77

    .end local v77    # "_columnIndexOfReversed":I
    .local v5, "_columnIndexOfReversed":I
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_53

    .line 2485
    const/4 v6, 0x0

    move-object/from16 v77, v6

    move v6, v3

    move-object/from16 v3, v77

    move/from16 v77, v4

    .local v6, "_tmp_19":Ljava/lang/Integer;
    goto :goto_54

    .line 2487
    .end local v6    # "_tmp_19":Ljava/lang/Integer;
    :cond_53
    move v6, v3

    move/from16 v77, v4

    .end local v3    # "_columnIndexOfReversalFromEntryNo":I
    .end local v4    # "_columnIndexOfReversalToEntryNo":I
    .local v6, "_columnIndexOfReversalFromEntryNo":I
    .local v77, "_columnIndexOfReversalToEntryNo":I
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 2489
    .local v3, "_tmp_19":Ljava/lang/Integer;
    :goto_54
    if-nez v3, :cond_54

    const/4 v4, 0x0

    goto :goto_56

    :cond_54
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_55

    const/4 v4, 0x1

    goto :goto_55

    :cond_55
    move/from16 v4, v97

    :goto_55
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    :goto_56
    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Reversed:Ljava/lang/Boolean;

    .line 2490
    move/from16 v4, v78

    .end local v78    # "_columnIndexOfAppliesToDocNo":I
    .local v4, "_columnIndexOfAppliesToDocNo":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v78

    if-eqz v78, :cond_56

    .line 2491
    move/from16 v78, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfReversalRegisterNo":I
    .local v78, "_columnIndexOfReversalRegisterNo":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Applies_to_Doc_No:Ljava/lang/String;

    goto :goto_57

    .line 2493
    .end local v78    # "_columnIndexOfReversalRegisterNo":I
    .restart local v1    # "_columnIndexOfReversalRegisterNo":I
    :cond_56
    move/from16 v78, v1

    .end local v1    # "_columnIndexOfReversalRegisterNo":I
    .restart local v78    # "_columnIndexOfReversalRegisterNo":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Applies_to_Doc_No:Ljava/lang/String;

    .line 2495
    :goto_57
    move/from16 v1, v79

    .end local v79    # "_columnIndexOfAppliesToID":I
    .local v1, "_columnIndexOfAppliesToID":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v79

    if-eqz v79, :cond_57

    .line 2496
    move-object/from16 v79, v3

    const/4 v3, 0x0

    .end local v3    # "_tmp_19":Ljava/lang/Integer;
    .local v79, "_tmp_19":Ljava/lang/Integer;
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Applies_to_ID:Ljava/lang/String;

    goto :goto_58

    .line 2498
    .end local v79    # "_tmp_19":Ljava/lang/Integer;
    .restart local v3    # "_tmp_19":Ljava/lang/Integer;
    :cond_57
    move-object/from16 v79, v3

    .end local v3    # "_tmp_19":Ljava/lang/Integer;
    .restart local v79    # "_tmp_19":Ljava/lang/Integer;
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Applies_to_ID:Ljava/lang/String;

    .line 2500
    :goto_58
    move/from16 v3, v80

    .end local v80    # "_columnIndexOfGrantNo":I
    .local v3, "_columnIndexOfGrantNo":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v80

    if-eqz v80, :cond_58

    .line 2501
    move/from16 v80, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfAppliesToID":I
    .local v80, "_columnIndexOfAppliesToID":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Grant_No:Ljava/lang/String;

    goto :goto_59

    .line 2503
    .end local v80    # "_columnIndexOfAppliesToID":I
    .restart local v1    # "_columnIndexOfAppliesToID":I
    :cond_58
    move/from16 v80, v1

    .end local v1    # "_columnIndexOfAppliesToID":I
    .restart local v80    # "_columnIndexOfAppliesToID":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Grant_No:Ljava/lang/String;

    .line 2505
    :goto_59
    move/from16 v115, v3

    move/from16 v1, v81

    move/from16 v81, v4

    .end local v3    # "_columnIndexOfGrantNo":I
    .end local v4    # "_columnIndexOfAppliesToDocNo":I
    .local v1, "_columnIndexOfInstallmentNumber":I
    .local v81, "_columnIndexOfAppliesToDocNo":I
    .local v115, "_columnIndexOfGrantNo":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    iput v3, v15, Lcom/trimline/metrocrew/transaction;->Installment_Number:I

    .line 2507
    move/from16 v3, v82

    .end local v82    # "_columnIndexOfNextInstallmentDate":I
    .local v3, "_columnIndexOfNextInstallmentDate":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_59

    .line 2508
    const/4 v4, 0x0

    .local v4, "_tmp_20":Ljava/lang/Long;
    goto :goto_5a

    .line 2510
    .end local v4    # "_tmp_20":Ljava/lang/Long;
    :cond_59
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v116

    invoke-static/range {v116 .. v117}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    .line 2512
    .restart local v4    # "_tmp_20":Ljava/lang/Long;
    :goto_5a
    move/from16 v82, v1

    .end local v1    # "_columnIndexOfInstallmentNumber":I
    .local v82, "_columnIndexOfInstallmentNumber":I
    invoke-static {v4}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Next_Installment_Date:Ljava/sql/Date;

    .line 2513
    move-object/from16 v116, v4

    move/from16 v1, v83

    move/from16 v83, v3

    .end local v3    # "_columnIndexOfNextInstallmentDate":I
    .end local v4    # "_tmp_20":Ljava/lang/Long;
    .local v1, "_columnIndexOfDimensionSetID":I
    .local v83, "_columnIndexOfNextInstallmentDate":I
    .local v116, "_tmp_20":Ljava/lang/Long;
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    iput v3, v15, Lcom/trimline/metrocrew/transaction;->Dimension_Set_ID:I

    .line 2514
    move/from16 v3, v84

    .end local v84    # "_columnIndexOfDonor":I
    .local v3, "_columnIndexOfDonor":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_5a

    .line 2515
    const/4 v4, 0x0

    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Donor:Ljava/lang/String;

    goto :goto_5b

    .line 2517
    :cond_5a
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Donor:Ljava/lang/String;

    .line 2519
    :goto_5b
    move/from16 v4, v85

    .end local v85    # "_columnIndexOfGroupCode":I
    .local v4, "_columnIndexOfGroupCode":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v84

    if-eqz v84, :cond_5b

    .line 2520
    move/from16 v84, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfDimensionSetID":I
    .local v84, "_columnIndexOfDimensionSetID":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Group_Code:Ljava/lang/String;

    goto :goto_5c

    .line 2522
    .end local v84    # "_columnIndexOfDimensionSetID":I
    .restart local v1    # "_columnIndexOfDimensionSetID":I
    :cond_5b
    move/from16 v84, v1

    .end local v1    # "_columnIndexOfDimensionSetID":I
    .restart local v84    # "_columnIndexOfDimensionSetID":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Group_Code:Ljava/lang/String;

    .line 2524
    :goto_5c
    move/from16 v1, v86

    .end local v86    # "_columnIndexOfPreADMFines":I
    .local v1, "_columnIndexOfPreADMFines":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v85

    if-eqz v85, :cond_5c

    .line 2525
    move/from16 v85, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfDonor":I
    .local v85, "_columnIndexOfDonor":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Pre_ADM_Fines:Ljava/lang/Double;

    goto :goto_5d

    .line 2527
    .end local v85    # "_columnIndexOfDonor":I
    .restart local v3    # "_columnIndexOfDonor":I
    :cond_5c
    move/from16 v85, v3

    .end local v3    # "_columnIndexOfDonor":I
    .restart local v85    # "_columnIndexOfDonor":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v117

    invoke-static/range {v117 .. v118}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Pre_ADM_Fines:Ljava/lang/Double;

    .line 2529
    :goto_5d
    move/from16 v3, v87

    .end local v87    # "_columnIndexOfMedFines":I
    .local v3, "_columnIndexOfMedFines":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v86

    if-eqz v86, :cond_5d

    .line 2530
    move/from16 v86, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfPreADMFines":I
    .restart local v86    # "_columnIndexOfPreADMFines":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Med_Fines:Ljava/lang/Double;

    goto :goto_5e

    .line 2532
    .end local v86    # "_columnIndexOfPreADMFines":I
    .restart local v1    # "_columnIndexOfPreADMFines":I
    :cond_5d
    move/from16 v86, v1

    .end local v1    # "_columnIndexOfPreADMFines":I
    .restart local v86    # "_columnIndexOfPreADMFines":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v117

    invoke-static/range {v117 .. v118}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Med_Fines:Ljava/lang/Double;

    .line 2534
    :goto_5e
    move/from16 v1, v88

    .end local v88    # "_columnIndexOfLoanNo":I
    .local v1, "_columnIndexOfLoanNo":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v87

    if-eqz v87, :cond_5e

    .line 2535
    move/from16 v87, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfMedFines":I
    .restart local v87    # "_columnIndexOfMedFines":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Loan_No:Ljava/lang/String;

    goto :goto_5f

    .line 2537
    .end local v87    # "_columnIndexOfMedFines":I
    .restart local v3    # "_columnIndexOfMedFines":I
    :cond_5e
    move/from16 v87, v3

    .end local v3    # "_columnIndexOfMedFines":I
    .restart local v87    # "_columnIndexOfMedFines":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Loan_No:Ljava/lang/String;

    .line 2539
    :goto_5f
    move/from16 v3, v89

    .end local v89    # "_columnIndexOfPenalty":I
    .local v3, "_columnIndexOfPenalty":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v88

    if-eqz v88, :cond_5f

    .line 2540
    move/from16 v88, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfLoanNo":I
    .restart local v88    # "_columnIndexOfLoanNo":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Penalty:Ljava/lang/Double;

    goto :goto_60

    .line 2542
    .end local v88    # "_columnIndexOfLoanNo":I
    .restart local v1    # "_columnIndexOfLoanNo":I
    :cond_5f
    move/from16 v88, v1

    .end local v1    # "_columnIndexOfLoanNo":I
    .restart local v88    # "_columnIndexOfLoanNo":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v117

    invoke-static/range {v117 .. v118}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Penalty:Ljava/lang/Double;

    .line 2545
    :goto_60
    move/from16 v92, v3

    move/from16 v89, v4

    move/from16 v1, v93

    .end local v3    # "_columnIndexOfPenalty":I
    .end local v4    # "_columnIndexOfGroupCode":I
    .end local v93    # "_columnIndexOfSent":I
    .local v1, "_columnIndexOfSent":I
    .local v89, "_columnIndexOfGroupCode":I
    .local v92, "_columnIndexOfPenalty":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    .line 2546
    .local v3, "_tmp_21":I
    if-eqz v3, :cond_60

    const/4 v4, 0x1

    goto :goto_61

    :cond_60
    move/from16 v4, v97

    :goto_61
    iput-boolean v4, v15, Lcom/trimline/metrocrew/transaction;->sent:Z

    .line 2547
    move-object/from16 v4, v91

    .end local v91    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    .local v4, "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    invoke-interface {v4, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2548
    move-object/from16 v91, v4

    move/from16 v15, v16

    move/from16 v16, v17

    move/from16 v4, v18

    move/from16 v18, v21

    move/from16 v21, v22

    move/from16 v22, v23

    move/from16 v23, v24

    move/from16 v24, v25

    move/from16 v25, v26

    move/from16 v26, v27

    move/from16 v27, v28

    move/from16 v28, v29

    move/from16 v29, v30

    move/from16 v30, v31

    move/from16 v31, v32

    move/from16 v32, v33

    move/from16 v33, v34

    move/from16 v35, v36

    move/from16 v37, v38

    move/from16 v38, v39

    move/from16 v39, v40

    move/from16 v40, v41

    move/from16 v41, v42

    move/from16 v42, v43

    move/from16 v43, v44

    move/from16 v36, v45

    move/from16 v19, v46

    move/from16 v45, v47

    move/from16 v46, v48

    move/from16 v47, v49

    move/from16 v49, v50

    move/from16 v48, v52

    move/from16 v53, v54

    move/from16 v58, v59

    move/from16 v64, v66

    move/from16 v65, v67

    move/from16 v66, v68

    move/from16 v67, v69

    move/from16 v68, v70

    move/from16 v62, v72

    move/from16 v69, v74

    move/from16 v71, v75

    move/from16 v72, v76

    move/from16 v76, v77

    move/from16 v74, v78

    move/from16 v79, v80

    move/from16 v78, v81

    move/from16 v81, v82

    move/from16 v82, v83

    move/from16 v83, v84

    move/from16 v84, v85

    move/from16 v85, v89

    move/from16 v14, v90

    move/from16 v89, v92

    move/from16 v13, v94

    move/from16 v3, v95

    move/from16 v17, v98

    move/from16 v20, v99

    move/from16 v34, v100

    move/from16 v44, v101

    move/from16 v50, v104

    move/from16 v54, v105

    move/from16 v52, v106

    move/from16 v56, v107

    move/from16 v60, v108

    move/from16 v61, v109

    move/from16 v59, v110

    move/from16 v63, v112

    move/from16 v73, v113

    move/from16 v70, v114

    move/from16 v80, v115

    move/from16 v77, v5

    move/from16 v75, v6

    move/from16 v6, v51

    move/from16 v51, v55

    move/from16 v55, v57

    move/from16 v5, v96

    move/from16 v57, v111

    .end local v3    # "_tmp_21":I
    .end local v13    # "_tmp":Ljava/lang/Long;
    .end local v14    # "_tmp_1":Ljava/lang/Long;
    .end local v15    # "_item":Lcom/trimline/metrocrew/transaction;
    .end local v19    # "_tmp_3":Ljava/lang/Long;
    .end local v20    # "_tmp_4":Ljava/lang/Long;
    .end local v35    # "_tmp_2":Ljava/lang/Integer;
    .end local v37    # "_tmp_5":Ljava/lang/Integer;
    .end local v53    # "_tmp_8":Ljava/lang/Integer;
    .end local v56    # "_tmp_9":Ljava/lang/Integer;
    .end local v58    # "_tmp_10":Ljava/lang/Integer;
    .end local v60    # "_tmp_13":Ljava/lang/Long;
    .end local v61    # "_tmp_14":Ljava/lang/Long;
    .end local v62    # "_tmp_12":Ljava/lang/Integer;
    .end local v63    # "_tmp_11":Ljava/lang/Integer;
    .end local v64    # "_tmp_15":Ljava/lang/Integer;
    .end local v65    # "_tmp_16":Ljava/lang/Integer;
    .end local v71    # "_tmp_17":Ljava/lang/Long;
    .end local v73    # "_tmp_18":Ljava/lang/Long;
    .end local v79    # "_tmp_19":Ljava/lang/Integer;
    .end local v102    # "_tmp_6":Ljava/lang/Long;
    .end local v103    # "_tmp_7":Ljava/lang/Integer;
    .end local v116    # "_tmp_20":Ljava/lang/Long;
    goto/16 :goto_0

    .line 2549
    .end local v90    # "_columnIndexOfOnBehalfOf":I
    .end local v92    # "_columnIndexOfPenalty":I
    .end local v94    # "_columnIndexOfReceivedFrom":I
    .end local v95    # "_columnIndexOfEntryNo":I
    .end local v96    # "_columnIndexOfDate":I
    .end local v98    # "_columnIndexOfAccountName":I
    .end local v99    # "_columnIndexOfTimePosted":I
    .end local v100    # "_columnIndexOfVATProdPostingGroup":I
    .end local v101    # "_columnIndexOfDestShortcutDimension2Code":I
    .end local v104    # "_columnIndexOfSelect":I
    .end local v105    # "_columnIndexOfBankAccount":I
    .end local v106    # "_columnIndexOfTransactionNo":I
    .end local v107    # "_columnIndexOfReconciled":I
    .end local v108    # "_columnIndexOfCancelledDate":I
    .end local v109    # "_columnIndexOfCancelledTime":I
    .end local v110    # "_columnIndexOfCancelledBy":I
    .end local v111    # "_columnIndexOfOrigCashier":I
    .end local v112    # "_columnIndexOfChequeRetrieved":I
    .end local v113    # "_columnIndexOfReversalTime":I
    .end local v114    # "_columnIndexOfBDToNumber":I
    .end local v115    # "_columnIndexOfGrantNo":I
    .local v3, "_columnIndexOfEntryNo":I
    .local v4, "_columnIndexOfNo":I
    .local v5, "_columnIndexOfDate":I
    .local v6, "_columnIndexOfType":I
    .local v13, "_columnIndexOfReceivedFrom":I
    .local v14, "_columnIndexOfOnBehalfOf":I
    .local v15, "_columnIndexOfCashier":I
    .local v16, "_columnIndexOfAccountNo":I
    .local v17, "_columnIndexOfAccountName":I
    .local v18, "_columnIndexOfPosted":I
    .local v19, "_columnIndexOfDatePosted":I
    .local v20, "_columnIndexOfTimePosted":I
    .local v21, "_columnIndexOfPostedBy":I
    .local v22, "_columnIndexOfAmount":I
    .local v23, "_columnIndexOfRemarks":I
    .local v24, "_columnIndexOfTransactionName":I
    .local v25, "_columnIndexOfBranchCode":I
    .local v26, "_columnIndexOfAgentCode":I
    .local v27, "_columnIndexOfGrouping":I
    .local v28, "_columnIndexOfGlobalDimension1Code":I
    .local v29, "_columnIndexOfShortcutDimension2Code":I
    .local v30, "_columnIndexOfVATPercent":I
    .local v31, "_columnIndexOfCurrencyCode":I
    .local v32, "_columnIndexOfCurrencyFactor":I
    .local v33, "_columnIndexOfVATBusPostingGroup":I
    .local v34, "_columnIndexOfVATProdPostingGroup":I
    .local v35, "_columnIndexOfGenPostingTypeSpecified":I
    .local v36, "_columnIndexOfGenBusPostingGroup":I
    .local v37, "_columnIndexOfGenProdPostingGroup":I
    .local v38, "_columnIndexOfVATAmount":I
    .local v39, "_columnIndexOfTotalAmount":I
    .local v40, "_columnIndexOfUserID":I
    .local v41, "_columnIndexOfApplyTo":I
    .local v42, "_columnIndexOfApplyToID":I
    .local v43, "_columnIndexOfDestGlobalDimension1Code":I
    .local v44, "_columnIndexOfDestShortcutDimension2Code":I
    .local v45, "_columnIndexOfLineNo":I
    .local v46, "_columnIndexOfPrintNo":I
    .local v47, "_columnIndexOfDepositSlipTime":I
    .local v48, "_columnIndexOfTellerID":I
    .local v49, "_columnIndexOfCustomerPaymentOnAccount":I
    .local v50, "_columnIndexOfSelect":I
    .local v51, "_columnIndexOfBatchPosted":I
    .local v52, "_columnIndexOfTransactionNo":I
    .local v53, "_columnIndexOfChequeDepositSlipBank":I
    .local v54, "_columnIndexOfBankAccount":I
    .local v55, "_columnIndexOfConfirmed":I
    .local v56, "_columnIndexOfReconciled":I
    .local v57, "_columnIndexOfOrigCashier":I
    .local v58, "_columnIndexOfCancelled":I
    .local v59, "_columnIndexOfCancelledBy":I
    .local v60, "_columnIndexOfCancelledDate":I
    .local v61, "_columnIndexOfCancelledTime":I
    .local v62, "_columnIndexOfPostDated":I
    .local v63, "_columnIndexOfChequeRetrieved":I
    .local v64, "_columnIndexOfRegisterNumber":I
    .local v65, "_columnIndexOfFromEntryNo":I
    .local v66, "_columnIndexOfToEntryNo":I
    .local v67, "_columnIndexOfBatchPostedUserID":I
    .local v68, "_columnIndexOfBDRegisterNumber":I
    .local v69, "_columnIndexOfBDFromNumber":I
    .local v70, "_columnIndexOfBDToNumber":I
    .local v71, "_columnIndexOfReversalBy":I
    .local v72, "_columnIndexOfReversalDate":I
    .local v73, "_columnIndexOfReversalTime":I
    .local v74, "_columnIndexOfReversalRegisterNo":I
    .local v75, "_columnIndexOfReversalFromEntryNo":I
    .local v76, "_columnIndexOfReversalToEntryNo":I
    .local v77, "_columnIndexOfReversed":I
    .local v78, "_columnIndexOfAppliesToDocNo":I
    .local v79, "_columnIndexOfAppliesToID":I
    .local v80, "_columnIndexOfGrantNo":I
    .local v81, "_columnIndexOfInstallmentNumber":I
    .local v82, "_columnIndexOfNextInstallmentDate":I
    .local v83, "_columnIndexOfDimensionSetID":I
    .local v84, "_columnIndexOfDonor":I
    .local v85, "_columnIndexOfGroupCode":I
    .local v89, "_columnIndexOfPenalty":I
    .restart local v91    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    :cond_61
    move/from16 v100, v34

    move/from16 v34, v33

    move/from16 v33, v32

    move/from16 v32, v31

    move/from16 v31, v30

    move/from16 v30, v29

    move/from16 v29, v28

    move/from16 v28, v27

    move/from16 v27, v26

    move/from16 v26, v25

    move/from16 v25, v24

    move/from16 v24, v23

    move/from16 v23, v22

    move/from16 v22, v21

    move/from16 v21, v18

    move/from16 v18, v4

    move-object/from16 v4, v91

    .line 2551
    .end local v91    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    .local v4, "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    .local v18, "_columnIndexOfNo":I
    .local v21, "_columnIndexOfPosted":I
    .local v22, "_columnIndexOfPostedBy":I
    .local v23, "_columnIndexOfAmount":I
    .local v24, "_columnIndexOfRemarks":I
    .local v25, "_columnIndexOfTransactionName":I
    .local v26, "_columnIndexOfBranchCode":I
    .local v27, "_columnIndexOfAgentCode":I
    .local v28, "_columnIndexOfGrouping":I
    .local v29, "_columnIndexOfGlobalDimension1Code":I
    .local v30, "_columnIndexOfShortcutDimension2Code":I
    .local v31, "_columnIndexOfVATPercent":I
    .local v32, "_columnIndexOfCurrencyCode":I
    .local v33, "_columnIndexOfCurrencyFactor":I
    .local v34, "_columnIndexOfVATBusPostingGroup":I
    .restart local v100    # "_columnIndexOfVATProdPostingGroup":I
    invoke-interface {v2}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 2549
    return-object v4

    .line 2551
    .end local v0    # "_columnIndexOfKey":I
    .end local v1    # "_columnIndexOfSent":I
    .end local v3    # "_columnIndexOfEntryNo":I
    .end local v4    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    .end local v5    # "_columnIndexOfDate":I
    .end local v6    # "_columnIndexOfType":I
    .end local v7    # "_columnIndexOfTranstype":I
    .end local v8    # "_columnIndexOfPayMode":I
    .end local v9    # "_columnIndexOfPayMode_1":I
    .end local v10    # "_columnIndexOfChequeDepositSlipNo":I
    .end local v11    # "_columnIndexOfChequeDepositSlipDate":I
    .end local v12    # "_columnIndexOfBankCode":I
    .end local v13    # "_columnIndexOfReceivedFrom":I
    .end local v14    # "_columnIndexOfOnBehalfOf":I
    .end local v15    # "_columnIndexOfCashier":I
    .end local v16    # "_columnIndexOfAccountNo":I
    .end local v17    # "_columnIndexOfAccountName":I
    .end local v18    # "_columnIndexOfNo":I
    .end local v19    # "_columnIndexOfDatePosted":I
    .end local v20    # "_columnIndexOfTimePosted":I
    .end local v21    # "_columnIndexOfPosted":I
    .end local v22    # "_columnIndexOfPostedBy":I
    .end local v23    # "_columnIndexOfAmount":I
    .end local v24    # "_columnIndexOfRemarks":I
    .end local v25    # "_columnIndexOfTransactionName":I
    .end local v26    # "_columnIndexOfBranchCode":I
    .end local v27    # "_columnIndexOfAgentCode":I
    .end local v28    # "_columnIndexOfGrouping":I
    .end local v29    # "_columnIndexOfGlobalDimension1Code":I
    .end local v30    # "_columnIndexOfShortcutDimension2Code":I
    .end local v31    # "_columnIndexOfVATPercent":I
    .end local v32    # "_columnIndexOfCurrencyCode":I
    .end local v33    # "_columnIndexOfCurrencyFactor":I
    .end local v34    # "_columnIndexOfVATBusPostingGroup":I
    .end local v35    # "_columnIndexOfGenPostingTypeSpecified":I
    .end local v36    # "_columnIndexOfGenBusPostingGroup":I
    .end local v37    # "_columnIndexOfGenProdPostingGroup":I
    .end local v38    # "_columnIndexOfVATAmount":I
    .end local v39    # "_columnIndexOfTotalAmount":I
    .end local v40    # "_columnIndexOfUserID":I
    .end local v41    # "_columnIndexOfApplyTo":I
    .end local v42    # "_columnIndexOfApplyToID":I
    .end local v43    # "_columnIndexOfDestGlobalDimension1Code":I
    .end local v44    # "_columnIndexOfDestShortcutDimension2Code":I
    .end local v45    # "_columnIndexOfLineNo":I
    .end local v46    # "_columnIndexOfPrintNo":I
    .end local v47    # "_columnIndexOfDepositSlipTime":I
    .end local v48    # "_columnIndexOfTellerID":I
    .end local v49    # "_columnIndexOfCustomerPaymentOnAccount":I
    .end local v50    # "_columnIndexOfSelect":I
    .end local v51    # "_columnIndexOfBatchPosted":I
    .end local v52    # "_columnIndexOfTransactionNo":I
    .end local v53    # "_columnIndexOfChequeDepositSlipBank":I
    .end local v54    # "_columnIndexOfBankAccount":I
    .end local v55    # "_columnIndexOfConfirmed":I
    .end local v56    # "_columnIndexOfReconciled":I
    .end local v57    # "_columnIndexOfOrigCashier":I
    .end local v58    # "_columnIndexOfCancelled":I
    .end local v59    # "_columnIndexOfCancelledBy":I
    .end local v60    # "_columnIndexOfCancelledDate":I
    .end local v61    # "_columnIndexOfCancelledTime":I
    .end local v62    # "_columnIndexOfPostDated":I
    .end local v63    # "_columnIndexOfChequeRetrieved":I
    .end local v64    # "_columnIndexOfRegisterNumber":I
    .end local v65    # "_columnIndexOfFromEntryNo":I
    .end local v66    # "_columnIndexOfToEntryNo":I
    .end local v67    # "_columnIndexOfBatchPostedUserID":I
    .end local v68    # "_columnIndexOfBDRegisterNumber":I
    .end local v69    # "_columnIndexOfBDFromNumber":I
    .end local v70    # "_columnIndexOfBDToNumber":I
    .end local v71    # "_columnIndexOfReversalBy":I
    .end local v72    # "_columnIndexOfReversalDate":I
    .end local v73    # "_columnIndexOfReversalTime":I
    .end local v74    # "_columnIndexOfReversalRegisterNo":I
    .end local v75    # "_columnIndexOfReversalFromEntryNo":I
    .end local v76    # "_columnIndexOfReversalToEntryNo":I
    .end local v77    # "_columnIndexOfReversed":I
    .end local v78    # "_columnIndexOfAppliesToDocNo":I
    .end local v79    # "_columnIndexOfAppliesToID":I
    .end local v80    # "_columnIndexOfGrantNo":I
    .end local v81    # "_columnIndexOfInstallmentNumber":I
    .end local v82    # "_columnIndexOfNextInstallmentDate":I
    .end local v83    # "_columnIndexOfDimensionSetID":I
    .end local v84    # "_columnIndexOfDonor":I
    .end local v85    # "_columnIndexOfGroupCode":I
    .end local v86    # "_columnIndexOfPreADMFines":I
    .end local v87    # "_columnIndexOfMedFines":I
    .end local v88    # "_columnIndexOfLoanNo":I
    .end local v89    # "_columnIndexOfPenalty":I
    .end local v100    # "_columnIndexOfVATProdPostingGroup":I
    :catchall_0
    move-exception v0

    invoke-interface {v2}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 2552
    throw v0
.end method

.method static synthetic lambda$loadAll$4(Landroidx/sqlite/SQLiteConnection;)Ljava/util/List;
    .locals 119
    .param p0, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 949
    const-string v0, "SELECT * FROM `transaction`"

    move-object/from16 v1, p0

    invoke-interface {v1, v0}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v2

    .line 951
    .local v2, "_stmt":Landroidx/sqlite/SQLiteStatement;
    :try_start_0
    const-string v0, "Key"

    invoke-static {v2, v0}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v0

    .line 952
    .local v0, "_columnIndexOfKey":I
    const-string v3, "Entry_No"

    invoke-static {v2, v3}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v3

    .line 953
    .local v3, "_columnIndexOfEntryNo":I
    const-string v4, "No"

    invoke-static {v2, v4}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v4

    .line 954
    .local v4, "_columnIndexOfNo":I
    const-string v5, "Date"

    invoke-static {v2, v5}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v5

    .line 955
    .local v5, "_columnIndexOfDate":I
    const-string v6, "Type"

    invoke-static {v2, v6}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v6

    .line 956
    .local v6, "_columnIndexOfType":I
    const-string v7, "transtype"

    invoke-static {v2, v7}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v7

    .line 957
    .local v7, "_columnIndexOfTranstype":I
    const-string v8, "PayMode"

    invoke-static {v2, v8}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v8

    .line 958
    .local v8, "_columnIndexOfPayMode":I
    const-string v9, "Pay_Mode"

    invoke-static {v2, v9}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v9

    .line 959
    .local v9, "_columnIndexOfPayMode_1":I
    const-string v10, "Cheque_Deposit_Slip_No"

    invoke-static {v2, v10}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v10

    .line 960
    .local v10, "_columnIndexOfChequeDepositSlipNo":I
    const-string v11, "Cheque_Deposit_Slip_Date"

    invoke-static {v2, v11}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v11

    .line 961
    .local v11, "_columnIndexOfChequeDepositSlipDate":I
    const-string v12, "Bank_Code"

    invoke-static {v2, v12}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v12

    .line 962
    .local v12, "_columnIndexOfBankCode":I
    const-string v13, "Received_From"

    invoke-static {v2, v13}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v13

    .line 963
    .local v13, "_columnIndexOfReceivedFrom":I
    const-string v14, "On_Behalf_Of"

    invoke-static {v2, v14}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v14

    .line 964
    .local v14, "_columnIndexOfOnBehalfOf":I
    const-string v15, "Cashier"

    invoke-static {v2, v15}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v15

    .line 965
    .local v15, "_columnIndexOfCashier":I
    const-string v1, "Account_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 966
    .local v1, "_columnIndexOfAccountNo":I
    move/from16 v16, v1

    .end local v1    # "_columnIndexOfAccountNo":I
    .local v16, "_columnIndexOfAccountNo":I
    const-string v1, "Account_Name"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 967
    .local v1, "_columnIndexOfAccountName":I
    move/from16 v17, v1

    .end local v1    # "_columnIndexOfAccountName":I
    .local v17, "_columnIndexOfAccountName":I
    const-string v1, "Posted"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 968
    .local v1, "_columnIndexOfPosted":I
    move/from16 v18, v1

    .end local v1    # "_columnIndexOfPosted":I
    .local v18, "_columnIndexOfPosted":I
    const-string v1, "Date_Posted"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 969
    .local v1, "_columnIndexOfDatePosted":I
    move/from16 v19, v1

    .end local v1    # "_columnIndexOfDatePosted":I
    .local v19, "_columnIndexOfDatePosted":I
    const-string v1, "Time_Posted"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 970
    .local v1, "_columnIndexOfTimePosted":I
    move/from16 v20, v1

    .end local v1    # "_columnIndexOfTimePosted":I
    .local v20, "_columnIndexOfTimePosted":I
    const-string v1, "Posted_By"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 971
    .local v1, "_columnIndexOfPostedBy":I
    move/from16 v21, v1

    .end local v1    # "_columnIndexOfPostedBy":I
    .local v21, "_columnIndexOfPostedBy":I
    const-string v1, "Amount"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 972
    .local v1, "_columnIndexOfAmount":I
    move/from16 v22, v1

    .end local v1    # "_columnIndexOfAmount":I
    .local v22, "_columnIndexOfAmount":I
    const-string v1, "Remarks"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 973
    .local v1, "_columnIndexOfRemarks":I
    move/from16 v23, v1

    .end local v1    # "_columnIndexOfRemarks":I
    .local v23, "_columnIndexOfRemarks":I
    const-string v1, "Transaction_Name"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 974
    .local v1, "_columnIndexOfTransactionName":I
    move/from16 v24, v1

    .end local v1    # "_columnIndexOfTransactionName":I
    .local v24, "_columnIndexOfTransactionName":I
    const-string v1, "Branch_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 975
    .local v1, "_columnIndexOfBranchCode":I
    move/from16 v25, v1

    .end local v1    # "_columnIndexOfBranchCode":I
    .local v25, "_columnIndexOfBranchCode":I
    const-string v1, "Agent_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 976
    .local v1, "_columnIndexOfAgentCode":I
    move/from16 v26, v1

    .end local v1    # "_columnIndexOfAgentCode":I
    .local v26, "_columnIndexOfAgentCode":I
    const-string v1, "Grouping"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 977
    .local v1, "_columnIndexOfGrouping":I
    move/from16 v27, v1

    .end local v1    # "_columnIndexOfGrouping":I
    .local v27, "_columnIndexOfGrouping":I
    const-string v1, "Global_Dimension_1_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 978
    .local v1, "_columnIndexOfGlobalDimension1Code":I
    move/from16 v28, v1

    .end local v1    # "_columnIndexOfGlobalDimension1Code":I
    .local v28, "_columnIndexOfGlobalDimension1Code":I
    const-string v1, "Shortcut_Dimension_2_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 979
    .local v1, "_columnIndexOfShortcutDimension2Code":I
    move/from16 v29, v1

    .end local v1    # "_columnIndexOfShortcutDimension2Code":I
    .local v29, "_columnIndexOfShortcutDimension2Code":I
    const-string v1, "VAT_Percent"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 980
    .local v1, "_columnIndexOfVATPercent":I
    move/from16 v30, v1

    .end local v1    # "_columnIndexOfVATPercent":I
    .local v30, "_columnIndexOfVATPercent":I
    const-string v1, "Currency_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 981
    .local v1, "_columnIndexOfCurrencyCode":I
    move/from16 v31, v1

    .end local v1    # "_columnIndexOfCurrencyCode":I
    .local v31, "_columnIndexOfCurrencyCode":I
    const-string v1, "Currency_Factor"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 982
    .local v1, "_columnIndexOfCurrencyFactor":I
    move/from16 v32, v1

    .end local v1    # "_columnIndexOfCurrencyFactor":I
    .local v32, "_columnIndexOfCurrencyFactor":I
    const-string v1, "VAT_Bus_Posting_Group"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 983
    .local v1, "_columnIndexOfVATBusPostingGroup":I
    move/from16 v33, v1

    .end local v1    # "_columnIndexOfVATBusPostingGroup":I
    .local v33, "_columnIndexOfVATBusPostingGroup":I
    const-string v1, "VAT_Prod_Posting_Group"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 984
    .local v1, "_columnIndexOfVATProdPostingGroup":I
    move/from16 v34, v1

    .end local v1    # "_columnIndexOfVATProdPostingGroup":I
    .local v34, "_columnIndexOfVATProdPostingGroup":I
    const-string v1, "Gen_Posting_TypeSpecified"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 985
    .local v1, "_columnIndexOfGenPostingTypeSpecified":I
    move/from16 v35, v1

    .end local v1    # "_columnIndexOfGenPostingTypeSpecified":I
    .local v35, "_columnIndexOfGenPostingTypeSpecified":I
    const-string v1, "Gen_Bus_Posting_Group"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 986
    .local v1, "_columnIndexOfGenBusPostingGroup":I
    move/from16 v36, v1

    .end local v1    # "_columnIndexOfGenBusPostingGroup":I
    .local v36, "_columnIndexOfGenBusPostingGroup":I
    const-string v1, "Gen_Prod_Posting_Group"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 987
    .local v1, "_columnIndexOfGenProdPostingGroup":I
    move/from16 v37, v1

    .end local v1    # "_columnIndexOfGenProdPostingGroup":I
    .local v37, "_columnIndexOfGenProdPostingGroup":I
    const-string v1, "VAT_Amount"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 988
    .local v1, "_columnIndexOfVATAmount":I
    move/from16 v38, v1

    .end local v1    # "_columnIndexOfVATAmount":I
    .local v38, "_columnIndexOfVATAmount":I
    const-string v1, "Total_Amount"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 989
    .local v1, "_columnIndexOfTotalAmount":I
    move/from16 v39, v1

    .end local v1    # "_columnIndexOfTotalAmount":I
    .local v39, "_columnIndexOfTotalAmount":I
    const-string v1, "User_ID"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 990
    .local v1, "_columnIndexOfUserID":I
    move/from16 v40, v1

    .end local v1    # "_columnIndexOfUserID":I
    .local v40, "_columnIndexOfUserID":I
    const-string v1, "Apply_to"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 991
    .local v1, "_columnIndexOfApplyTo":I
    move/from16 v41, v1

    .end local v1    # "_columnIndexOfApplyTo":I
    .local v41, "_columnIndexOfApplyTo":I
    const-string v1, "Apply_to_ID"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 992
    .local v1, "_columnIndexOfApplyToID":I
    move/from16 v42, v1

    .end local v1    # "_columnIndexOfApplyToID":I
    .local v42, "_columnIndexOfApplyToID":I
    const-string v1, "Dest_Global_Dimension_1_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 993
    .local v1, "_columnIndexOfDestGlobalDimension1Code":I
    move/from16 v43, v1

    .end local v1    # "_columnIndexOfDestGlobalDimension1Code":I
    .local v43, "_columnIndexOfDestGlobalDimension1Code":I
    const-string v1, "Dest_Shortcut_Dimension_2_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 994
    .local v1, "_columnIndexOfDestShortcutDimension2Code":I
    move/from16 v44, v1

    .end local v1    # "_columnIndexOfDestShortcutDimension2Code":I
    .local v44, "_columnIndexOfDestShortcutDimension2Code":I
    const-string v1, "Line_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 995
    .local v1, "_columnIndexOfLineNo":I
    move/from16 v45, v1

    .end local v1    # "_columnIndexOfLineNo":I
    .local v45, "_columnIndexOfLineNo":I
    const-string v1, "Print_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 996
    .local v1, "_columnIndexOfPrintNo":I
    move/from16 v46, v1

    .end local v1    # "_columnIndexOfPrintNo":I
    .local v46, "_columnIndexOfPrintNo":I
    const-string v1, "Deposit_Slip_Time"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 997
    .local v1, "_columnIndexOfDepositSlipTime":I
    move/from16 v47, v1

    .end local v1    # "_columnIndexOfDepositSlipTime":I
    .local v47, "_columnIndexOfDepositSlipTime":I
    const-string v1, "Teller_ID"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 998
    .local v1, "_columnIndexOfTellerID":I
    move/from16 v48, v1

    .end local v1    # "_columnIndexOfTellerID":I
    .local v48, "_columnIndexOfTellerID":I
    const-string v1, "Customer_Payment_On_Account"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 999
    .local v1, "_columnIndexOfCustomerPaymentOnAccount":I
    move/from16 v49, v1

    .end local v1    # "_columnIndexOfCustomerPaymentOnAccount":I
    .local v49, "_columnIndexOfCustomerPaymentOnAccount":I
    const-string v1, "Select"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1000
    .local v1, "_columnIndexOfSelect":I
    move/from16 v50, v1

    .end local v1    # "_columnIndexOfSelect":I
    .local v50, "_columnIndexOfSelect":I
    const-string v1, "Batch_Posted"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1001
    .local v1, "_columnIndexOfBatchPosted":I
    move/from16 v51, v1

    .end local v1    # "_columnIndexOfBatchPosted":I
    .local v51, "_columnIndexOfBatchPosted":I
    const-string v1, "Transaction_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1002
    .local v1, "_columnIndexOfTransactionNo":I
    move/from16 v52, v1

    .end local v1    # "_columnIndexOfTransactionNo":I
    .local v52, "_columnIndexOfTransactionNo":I
    const-string v1, "Cheque_Deposit_Slip_Bank"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1003
    .local v1, "_columnIndexOfChequeDepositSlipBank":I
    move/from16 v53, v1

    .end local v1    # "_columnIndexOfChequeDepositSlipBank":I
    .local v53, "_columnIndexOfChequeDepositSlipBank":I
    const-string v1, "Bank_Account"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1004
    .local v1, "_columnIndexOfBankAccount":I
    move/from16 v54, v1

    .end local v1    # "_columnIndexOfBankAccount":I
    .local v54, "_columnIndexOfBankAccount":I
    const-string v1, "Confirmed"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1005
    .local v1, "_columnIndexOfConfirmed":I
    move/from16 v55, v1

    .end local v1    # "_columnIndexOfConfirmed":I
    .local v55, "_columnIndexOfConfirmed":I
    const-string v1, "Reconciled"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1006
    .local v1, "_columnIndexOfReconciled":I
    move/from16 v56, v1

    .end local v1    # "_columnIndexOfReconciled":I
    .local v56, "_columnIndexOfReconciled":I
    const-string v1, "Orig_Cashier"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1007
    .local v1, "_columnIndexOfOrigCashier":I
    move/from16 v57, v1

    .end local v1    # "_columnIndexOfOrigCashier":I
    .local v57, "_columnIndexOfOrigCashier":I
    const-string v1, "Cancelled"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1008
    .local v1, "_columnIndexOfCancelled":I
    move/from16 v58, v1

    .end local v1    # "_columnIndexOfCancelled":I
    .local v58, "_columnIndexOfCancelled":I
    const-string v1, "Cancelled_By"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1009
    .local v1, "_columnIndexOfCancelledBy":I
    move/from16 v59, v1

    .end local v1    # "_columnIndexOfCancelledBy":I
    .local v59, "_columnIndexOfCancelledBy":I
    const-string v1, "Cancelled_Date"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1010
    .local v1, "_columnIndexOfCancelledDate":I
    move/from16 v60, v1

    .end local v1    # "_columnIndexOfCancelledDate":I
    .local v60, "_columnIndexOfCancelledDate":I
    const-string v1, "Cancelled_Time"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1011
    .local v1, "_columnIndexOfCancelledTime":I
    move/from16 v61, v1

    .end local v1    # "_columnIndexOfCancelledTime":I
    .local v61, "_columnIndexOfCancelledTime":I
    const-string v1, "Post_Dated"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1012
    .local v1, "_columnIndexOfPostDated":I
    move/from16 v62, v1

    .end local v1    # "_columnIndexOfPostDated":I
    .local v62, "_columnIndexOfPostDated":I
    const-string v1, "Cheque_Retrieved"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1013
    .local v1, "_columnIndexOfChequeRetrieved":I
    move/from16 v63, v1

    .end local v1    # "_columnIndexOfChequeRetrieved":I
    .local v63, "_columnIndexOfChequeRetrieved":I
    const-string v1, "Register_Number"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1014
    .local v1, "_columnIndexOfRegisterNumber":I
    move/from16 v64, v1

    .end local v1    # "_columnIndexOfRegisterNumber":I
    .local v64, "_columnIndexOfRegisterNumber":I
    const-string v1, "From_Entry_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1015
    .local v1, "_columnIndexOfFromEntryNo":I
    move/from16 v65, v1

    .end local v1    # "_columnIndexOfFromEntryNo":I
    .local v65, "_columnIndexOfFromEntryNo":I
    const-string v1, "To_Entry_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1016
    .local v1, "_columnIndexOfToEntryNo":I
    move/from16 v66, v1

    .end local v1    # "_columnIndexOfToEntryNo":I
    .local v66, "_columnIndexOfToEntryNo":I
    const-string v1, "Batch_Posted_UserID"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1017
    .local v1, "_columnIndexOfBatchPostedUserID":I
    move/from16 v67, v1

    .end local v1    # "_columnIndexOfBatchPostedUserID":I
    .local v67, "_columnIndexOfBatchPostedUserID":I
    const-string v1, "BD_Register_Number"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1018
    .local v1, "_columnIndexOfBDRegisterNumber":I
    move/from16 v68, v1

    .end local v1    # "_columnIndexOfBDRegisterNumber":I
    .local v68, "_columnIndexOfBDRegisterNumber":I
    const-string v1, "BD_From_Number"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1019
    .local v1, "_columnIndexOfBDFromNumber":I
    move/from16 v69, v1

    .end local v1    # "_columnIndexOfBDFromNumber":I
    .local v69, "_columnIndexOfBDFromNumber":I
    const-string v1, "BD_To_Number"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1020
    .local v1, "_columnIndexOfBDToNumber":I
    move/from16 v70, v1

    .end local v1    # "_columnIndexOfBDToNumber":I
    .local v70, "_columnIndexOfBDToNumber":I
    const-string v1, "Reversal_By"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1021
    .local v1, "_columnIndexOfReversalBy":I
    move/from16 v71, v1

    .end local v1    # "_columnIndexOfReversalBy":I
    .local v71, "_columnIndexOfReversalBy":I
    const-string v1, "Reversal_Date"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1022
    .local v1, "_columnIndexOfReversalDate":I
    move/from16 v72, v1

    .end local v1    # "_columnIndexOfReversalDate":I
    .local v72, "_columnIndexOfReversalDate":I
    const-string v1, "Reversal_Time"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1023
    .local v1, "_columnIndexOfReversalTime":I
    move/from16 v73, v1

    .end local v1    # "_columnIndexOfReversalTime":I
    .local v73, "_columnIndexOfReversalTime":I
    const-string v1, "Reversal_Register_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1024
    .local v1, "_columnIndexOfReversalRegisterNo":I
    move/from16 v74, v1

    .end local v1    # "_columnIndexOfReversalRegisterNo":I
    .local v74, "_columnIndexOfReversalRegisterNo":I
    const-string v1, "Reversal_From_Entry_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1025
    .local v1, "_columnIndexOfReversalFromEntryNo":I
    move/from16 v75, v1

    .end local v1    # "_columnIndexOfReversalFromEntryNo":I
    .local v75, "_columnIndexOfReversalFromEntryNo":I
    const-string v1, "Reversal_To_Entry_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1026
    .local v1, "_columnIndexOfReversalToEntryNo":I
    move/from16 v76, v1

    .end local v1    # "_columnIndexOfReversalToEntryNo":I
    .local v76, "_columnIndexOfReversalToEntryNo":I
    const-string v1, "Reversed"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1027
    .local v1, "_columnIndexOfReversed":I
    move/from16 v77, v1

    .end local v1    # "_columnIndexOfReversed":I
    .local v77, "_columnIndexOfReversed":I
    const-string v1, "Applies_to_Doc_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1028
    .local v1, "_columnIndexOfAppliesToDocNo":I
    move/from16 v78, v1

    .end local v1    # "_columnIndexOfAppliesToDocNo":I
    .local v78, "_columnIndexOfAppliesToDocNo":I
    const-string v1, "Applies_to_ID"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1029
    .local v1, "_columnIndexOfAppliesToID":I
    move/from16 v79, v1

    .end local v1    # "_columnIndexOfAppliesToID":I
    .local v79, "_columnIndexOfAppliesToID":I
    const-string v1, "Grant_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1030
    .local v1, "_columnIndexOfGrantNo":I
    move/from16 v80, v1

    .end local v1    # "_columnIndexOfGrantNo":I
    .local v80, "_columnIndexOfGrantNo":I
    const-string v1, "Installment_Number"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1031
    .local v1, "_columnIndexOfInstallmentNumber":I
    move/from16 v81, v1

    .end local v1    # "_columnIndexOfInstallmentNumber":I
    .local v81, "_columnIndexOfInstallmentNumber":I
    const-string v1, "Next_Installment_Date"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1032
    .local v1, "_columnIndexOfNextInstallmentDate":I
    move/from16 v82, v1

    .end local v1    # "_columnIndexOfNextInstallmentDate":I
    .local v82, "_columnIndexOfNextInstallmentDate":I
    const-string v1, "Dimension_Set_ID"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1033
    .local v1, "_columnIndexOfDimensionSetID":I
    move/from16 v83, v1

    .end local v1    # "_columnIndexOfDimensionSetID":I
    .local v83, "_columnIndexOfDimensionSetID":I
    const-string v1, "Donor"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1034
    .local v1, "_columnIndexOfDonor":I
    move/from16 v84, v1

    .end local v1    # "_columnIndexOfDonor":I
    .local v84, "_columnIndexOfDonor":I
    const-string v1, "Group_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1035
    .local v1, "_columnIndexOfGroupCode":I
    move/from16 v85, v1

    .end local v1    # "_columnIndexOfGroupCode":I
    .local v85, "_columnIndexOfGroupCode":I
    const-string v1, "Pre_ADM_Fines"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1036
    .local v1, "_columnIndexOfPreADMFines":I
    move/from16 v86, v1

    .end local v1    # "_columnIndexOfPreADMFines":I
    .local v86, "_columnIndexOfPreADMFines":I
    const-string v1, "Med_Fines"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1037
    .local v1, "_columnIndexOfMedFines":I
    move/from16 v87, v1

    .end local v1    # "_columnIndexOfMedFines":I
    .local v87, "_columnIndexOfMedFines":I
    const-string v1, "Loan_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1038
    .local v1, "_columnIndexOfLoanNo":I
    move/from16 v88, v1

    .end local v1    # "_columnIndexOfLoanNo":I
    .local v88, "_columnIndexOfLoanNo":I
    const-string v1, "Penalty"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1039
    .local v1, "_columnIndexOfPenalty":I
    move/from16 v89, v1

    .end local v1    # "_columnIndexOfPenalty":I
    .local v89, "_columnIndexOfPenalty":I
    const-string v1, "sent"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1040
    .local v1, "_columnIndexOfSent":I
    new-instance v90, Ljava/util/ArrayList;

    invoke-direct/range {v90 .. v90}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v91, v90

    .line 1041
    .local v91, "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    :goto_0
    invoke-interface {v2}, Landroidx/sqlite/SQLiteStatement;->step()Z

    move-result v90

    if-eqz v90, :cond_61

    .line 1043
    new-instance v90, Lcom/trimline/metrocrew/transaction;

    invoke-direct/range {v90 .. v90}, Lcom/trimline/metrocrew/transaction;-><init>()V

    move-object/from16 v92, v90

    .line 1044
    .local v92, "_item":Lcom/trimline/metrocrew/transaction;
    invoke-interface {v2, v0}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v90

    move/from16 v93, v1

    .end local v1    # "_columnIndexOfSent":I
    .local v93, "_columnIndexOfSent":I
    const/4 v1, 0x0

    if-eqz v90, :cond_0

    .line 1045
    move/from16 v90, v15

    move-object/from16 v15, v92

    .end local v92    # "_item":Lcom/trimline/metrocrew/transaction;
    .local v15, "_item":Lcom/trimline/metrocrew/transaction;
    .local v90, "_columnIndexOfCashier":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Key:Ljava/lang/String;

    goto :goto_1

    .line 1047
    .end local v90    # "_columnIndexOfCashier":I
    .local v15, "_columnIndexOfCashier":I
    .restart local v92    # "_item":Lcom/trimline/metrocrew/transaction;
    :cond_0
    move/from16 v90, v15

    move-object/from16 v15, v92

    .end local v92    # "_item":Lcom/trimline/metrocrew/transaction;
    .local v15, "_item":Lcom/trimline/metrocrew/transaction;
    .restart local v90    # "_columnIndexOfCashier":I
    invoke-interface {v2, v0}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Key:Ljava/lang/String;

    .line 1049
    :goto_1
    move v1, v13

    move/from16 v94, v14

    .end local v13    # "_columnIndexOfReceivedFrom":I
    .end local v14    # "_columnIndexOfOnBehalfOf":I
    .local v1, "_columnIndexOfReceivedFrom":I
    .local v94, "_columnIndexOfOnBehalfOf":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v13

    long-to-int v13, v13

    iput v13, v15, Lcom/trimline/metrocrew/transaction;->Entry_No:I

    .line 1050
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 1051
    const/4 v13, 0x0

    iput-object v13, v15, Lcom/trimline/metrocrew/transaction;->No:Ljava/lang/String;

    goto :goto_2

    .line 1053
    :cond_1
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v13

    iput-object v13, v15, Lcom/trimline/metrocrew/transaction;->No:Ljava/lang/String;

    .line 1056
    :goto_2
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 1057
    const/4 v13, 0x0

    .local v13, "_tmp":Ljava/lang/Long;
    goto :goto_3

    .line 1059
    .end local v13    # "_tmp":Ljava/lang/Long;
    :cond_2
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    .line 1061
    .restart local v13    # "_tmp":Ljava/lang/Long;
    :goto_3
    invoke-static {v13}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v14

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Date:Ljava/sql/Date;

    .line 1062
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 1063
    const/4 v14, 0x0

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Type:Ljava/lang/String;

    goto :goto_4

    .line 1065
    :cond_3
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Type:Ljava/lang/String;

    .line 1067
    :goto_4
    invoke-interface {v2, v7}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 1068
    const/4 v14, 0x0

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    goto :goto_5

    .line 1070
    :cond_4
    invoke-interface {v2, v7}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    .line 1072
    :goto_5
    invoke-interface {v2, v8}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_5

    .line 1073
    const/4 v14, 0x0

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->PayMode:Ljava/lang/String;

    goto :goto_6

    .line 1075
    :cond_5
    invoke-interface {v2, v8}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->PayMode:Ljava/lang/String;

    .line 1077
    :goto_6
    invoke-interface {v2, v9}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_6

    .line 1078
    const/4 v14, 0x0

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Pay_Mode:Ljava/lang/String;

    goto :goto_7

    .line 1080
    :cond_6
    invoke-interface {v2, v9}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Pay_Mode:Ljava/lang/String;

    .line 1082
    :goto_7
    invoke-interface {v2, v10}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_7

    .line 1083
    const/4 v14, 0x0

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_No:Ljava/lang/String;

    goto :goto_8

    .line 1085
    :cond_7
    invoke-interface {v2, v10}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_No:Ljava/lang/String;

    .line 1088
    :goto_8
    invoke-interface {v2, v11}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_8

    .line 1089
    const/4 v14, 0x0

    .local v14, "_tmp_1":Ljava/lang/Long;
    goto :goto_9

    .line 1091
    .end local v14    # "_tmp_1":Ljava/lang/Long;
    :cond_8
    invoke-interface {v2, v11}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v95

    invoke-static/range {v95 .. v96}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    .line 1093
    .restart local v14    # "_tmp_1":Ljava/lang/Long;
    :goto_9
    move/from16 v95, v1

    .end local v1    # "_columnIndexOfReceivedFrom":I
    .local v95, "_columnIndexOfReceivedFrom":I
    invoke-static {v14}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_Date:Ljava/sql/Date;

    .line 1094
    invoke-interface {v2, v12}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 1095
    const/4 v1, 0x0

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Bank_Code:Ljava/lang/String;

    goto :goto_a

    .line 1097
    :cond_9
    invoke-interface {v2, v12}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Bank_Code:Ljava/lang/String;

    .line 1099
    :goto_a
    move/from16 v1, v95

    .end local v95    # "_columnIndexOfReceivedFrom":I
    .restart local v1    # "_columnIndexOfReceivedFrom":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v95

    if-eqz v95, :cond_a

    .line 1100
    move/from16 v95, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfEntryNo":I
    .local v95, "_columnIndexOfEntryNo":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Received_From:Ljava/lang/String;

    goto :goto_b

    .line 1102
    .end local v95    # "_columnIndexOfEntryNo":I
    .restart local v3    # "_columnIndexOfEntryNo":I
    :cond_a
    move/from16 v95, v3

    .end local v3    # "_columnIndexOfEntryNo":I
    .restart local v95    # "_columnIndexOfEntryNo":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Received_From:Ljava/lang/String;

    .line 1104
    :goto_b
    move/from16 v3, v94

    .end local v94    # "_columnIndexOfOnBehalfOf":I
    .local v3, "_columnIndexOfOnBehalfOf":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v94

    if-eqz v94, :cond_b

    .line 1105
    move/from16 v94, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfReceivedFrom":I
    .local v94, "_columnIndexOfReceivedFrom":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->On_Behalf_Of:Ljava/lang/String;

    goto :goto_c

    .line 1107
    .end local v94    # "_columnIndexOfReceivedFrom":I
    .restart local v1    # "_columnIndexOfReceivedFrom":I
    :cond_b
    move/from16 v94, v1

    .end local v1    # "_columnIndexOfReceivedFrom":I
    .restart local v94    # "_columnIndexOfReceivedFrom":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->On_Behalf_Of:Ljava/lang/String;

    .line 1109
    :goto_c
    move/from16 v1, v90

    .end local v90    # "_columnIndexOfCashier":I
    .local v1, "_columnIndexOfCashier":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v90

    if-eqz v90, :cond_c

    .line 1110
    move/from16 v90, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfOnBehalfOf":I
    .local v90, "_columnIndexOfOnBehalfOf":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Cashier:Ljava/lang/String;

    goto :goto_d

    .line 1112
    .end local v90    # "_columnIndexOfOnBehalfOf":I
    .restart local v3    # "_columnIndexOfOnBehalfOf":I
    :cond_c
    move/from16 v90, v3

    .end local v3    # "_columnIndexOfOnBehalfOf":I
    .restart local v90    # "_columnIndexOfOnBehalfOf":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Cashier:Ljava/lang/String;

    .line 1114
    :goto_d
    move/from16 v3, v16

    .end local v16    # "_columnIndexOfAccountNo":I
    .local v3, "_columnIndexOfAccountNo":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v16

    if-eqz v16, :cond_d

    .line 1115
    move/from16 v16, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfCashier":I
    .local v16, "_columnIndexOfCashier":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Account_No:Ljava/lang/String;

    goto :goto_e

    .line 1117
    .end local v16    # "_columnIndexOfCashier":I
    .restart local v1    # "_columnIndexOfCashier":I
    :cond_d
    move/from16 v16, v1

    .end local v1    # "_columnIndexOfCashier":I
    .restart local v16    # "_columnIndexOfCashier":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Account_No:Ljava/lang/String;

    .line 1119
    :goto_e
    move/from16 v1, v17

    .end local v17    # "_columnIndexOfAccountName":I
    .local v1, "_columnIndexOfAccountName":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v17

    if-eqz v17, :cond_e

    .line 1120
    move/from16 v17, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfAccountNo":I
    .local v17, "_columnIndexOfAccountNo":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Account_Name:Ljava/lang/String;

    goto :goto_f

    .line 1122
    .end local v17    # "_columnIndexOfAccountNo":I
    .restart local v3    # "_columnIndexOfAccountNo":I
    :cond_e
    move/from16 v17, v3

    .end local v3    # "_columnIndexOfAccountNo":I
    .restart local v17    # "_columnIndexOfAccountNo":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Account_Name:Ljava/lang/String;

    .line 1125
    :goto_f
    move/from16 v3, v18

    .end local v18    # "_columnIndexOfPosted":I
    .local v3, "_columnIndexOfPosted":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v18

    if-eqz v18, :cond_f

    .line 1126
    const/16 v18, 0x0

    move-object/from16 v96, v18

    move/from16 v18, v4

    move-object/from16 v4, v96

    move/from16 v96, v5

    .local v18, "_tmp_2":Ljava/lang/Integer;
    goto :goto_10

    .line 1128
    .end local v18    # "_tmp_2":Ljava/lang/Integer;
    :cond_f
    move/from16 v18, v4

    move/from16 v96, v5

    .end local v4    # "_columnIndexOfNo":I
    .end local v5    # "_columnIndexOfDate":I
    .local v18, "_columnIndexOfNo":I
    .local v96, "_columnIndexOfDate":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v4

    long-to-int v4, v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 1130
    .local v4, "_tmp_2":Ljava/lang/Integer;
    :goto_10
    const/16 v97, 0x0

    if-nez v4, :cond_10

    const/4 v5, 0x0

    goto :goto_12

    :cond_10
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v98

    if-eqz v98, :cond_11

    const/16 v98, 0x1

    goto :goto_11

    :cond_11
    move/from16 v98, v97

    :goto_11
    invoke-static/range {v98 .. v98}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v98

    move-object/from16 v5, v98

    :goto_12
    iput-object v5, v15, Lcom/trimline/metrocrew/transaction;->Posted:Ljava/lang/Boolean;

    .line 1132
    move/from16 v5, v19

    .end local v19    # "_columnIndexOfDatePosted":I
    .local v5, "_columnIndexOfDatePosted":I
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v19

    if-eqz v19, :cond_12

    .line 1133
    const/16 v19, 0x0

    .local v19, "_tmp_3":Ljava/lang/Long;
    goto :goto_13

    .line 1135
    .end local v19    # "_tmp_3":Ljava/lang/Long;
    :cond_12
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v99

    invoke-static/range {v99 .. v100}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    .line 1137
    .restart local v19    # "_tmp_3":Ljava/lang/Long;
    :goto_13
    move/from16 v98, v1

    .end local v1    # "_columnIndexOfAccountName":I
    .local v98, "_columnIndexOfAccountName":I
    invoke-static/range {v19 .. v19}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Date_Posted:Ljava/sql/Date;

    .line 1139
    move/from16 v1, v20

    .end local v20    # "_columnIndexOfTimePosted":I
    .local v1, "_columnIndexOfTimePosted":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v20

    if-eqz v20, :cond_13

    .line 1140
    const/16 v20, 0x0

    .local v20, "_tmp_4":Ljava/lang/Long;
    goto :goto_14

    .line 1142
    .end local v20    # "_tmp_4":Ljava/lang/Long;
    :cond_13
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v99

    invoke-static/range {v99 .. v100}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    .line 1144
    .restart local v20    # "_tmp_4":Ljava/lang/Long;
    :goto_14
    move/from16 v99, v1

    .end local v1    # "_columnIndexOfTimePosted":I
    .local v99, "_columnIndexOfTimePosted":I
    invoke-static/range {v20 .. v20}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Time_Posted:Ljava/sql/Date;

    .line 1145
    move/from16 v1, v21

    .end local v21    # "_columnIndexOfPostedBy":I
    .local v1, "_columnIndexOfPostedBy":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v21

    if-eqz v21, :cond_14

    .line 1146
    move/from16 v21, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfPosted":I
    .local v21, "_columnIndexOfPosted":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Posted_By:Ljava/lang/String;

    goto :goto_15

    .line 1148
    .end local v21    # "_columnIndexOfPosted":I
    .restart local v3    # "_columnIndexOfPosted":I
    :cond_14
    move/from16 v21, v3

    .end local v3    # "_columnIndexOfPosted":I
    .restart local v21    # "_columnIndexOfPosted":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Posted_By:Ljava/lang/String;

    .line 1150
    :goto_15
    move/from16 v3, v22

    .end local v22    # "_columnIndexOfAmount":I
    .local v3, "_columnIndexOfAmount":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v22

    if-eqz v22, :cond_15

    .line 1151
    move/from16 v22, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfPostedBy":I
    .local v22, "_columnIndexOfPostedBy":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Amount:Ljava/lang/Double;

    goto :goto_16

    .line 1153
    .end local v22    # "_columnIndexOfPostedBy":I
    .restart local v1    # "_columnIndexOfPostedBy":I
    :cond_15
    move/from16 v22, v1

    .end local v1    # "_columnIndexOfPostedBy":I
    .restart local v22    # "_columnIndexOfPostedBy":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v100

    invoke-static/range {v100 .. v101}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Amount:Ljava/lang/Double;

    .line 1155
    :goto_16
    move/from16 v1, v23

    .end local v23    # "_columnIndexOfRemarks":I
    .local v1, "_columnIndexOfRemarks":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v23

    if-eqz v23, :cond_16

    .line 1156
    move/from16 v23, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfAmount":I
    .local v23, "_columnIndexOfAmount":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Remarks:Ljava/lang/String;

    goto :goto_17

    .line 1158
    .end local v23    # "_columnIndexOfAmount":I
    .restart local v3    # "_columnIndexOfAmount":I
    :cond_16
    move/from16 v23, v3

    .end local v3    # "_columnIndexOfAmount":I
    .restart local v23    # "_columnIndexOfAmount":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Remarks:Ljava/lang/String;

    .line 1160
    :goto_17
    move/from16 v3, v24

    .end local v24    # "_columnIndexOfTransactionName":I
    .local v3, "_columnIndexOfTransactionName":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v24

    if-eqz v24, :cond_17

    .line 1161
    move/from16 v24, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfRemarks":I
    .local v24, "_columnIndexOfRemarks":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Transaction_Name:Ljava/lang/String;

    goto :goto_18

    .line 1163
    .end local v24    # "_columnIndexOfRemarks":I
    .restart local v1    # "_columnIndexOfRemarks":I
    :cond_17
    move/from16 v24, v1

    .end local v1    # "_columnIndexOfRemarks":I
    .restart local v24    # "_columnIndexOfRemarks":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Transaction_Name:Ljava/lang/String;

    .line 1165
    :goto_18
    move/from16 v1, v25

    .end local v25    # "_columnIndexOfBranchCode":I
    .local v1, "_columnIndexOfBranchCode":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v25

    if-eqz v25, :cond_18

    .line 1166
    move/from16 v25, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfTransactionName":I
    .local v25, "_columnIndexOfTransactionName":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Branch_Code:Ljava/lang/String;

    goto :goto_19

    .line 1168
    .end local v25    # "_columnIndexOfTransactionName":I
    .restart local v3    # "_columnIndexOfTransactionName":I
    :cond_18
    move/from16 v25, v3

    .end local v3    # "_columnIndexOfTransactionName":I
    .restart local v25    # "_columnIndexOfTransactionName":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Branch_Code:Ljava/lang/String;

    .line 1170
    :goto_19
    move/from16 v3, v26

    .end local v26    # "_columnIndexOfAgentCode":I
    .local v3, "_columnIndexOfAgentCode":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v26

    if-eqz v26, :cond_19

    .line 1171
    move/from16 v26, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfBranchCode":I
    .local v26, "_columnIndexOfBranchCode":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Agent_Code:Ljava/lang/String;

    goto :goto_1a

    .line 1173
    .end local v26    # "_columnIndexOfBranchCode":I
    .restart local v1    # "_columnIndexOfBranchCode":I
    :cond_19
    move/from16 v26, v1

    .end local v1    # "_columnIndexOfBranchCode":I
    .restart local v26    # "_columnIndexOfBranchCode":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Agent_Code:Ljava/lang/String;

    .line 1175
    :goto_1a
    move/from16 v1, v27

    .end local v27    # "_columnIndexOfGrouping":I
    .local v1, "_columnIndexOfGrouping":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v27

    if-eqz v27, :cond_1a

    .line 1176
    move/from16 v27, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfAgentCode":I
    .local v27, "_columnIndexOfAgentCode":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Grouping:Ljava/lang/String;

    goto :goto_1b

    .line 1178
    .end local v27    # "_columnIndexOfAgentCode":I
    .restart local v3    # "_columnIndexOfAgentCode":I
    :cond_1a
    move/from16 v27, v3

    .end local v3    # "_columnIndexOfAgentCode":I
    .restart local v27    # "_columnIndexOfAgentCode":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Grouping:Ljava/lang/String;

    .line 1180
    :goto_1b
    move/from16 v3, v28

    .end local v28    # "_columnIndexOfGlobalDimension1Code":I
    .local v3, "_columnIndexOfGlobalDimension1Code":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v28

    if-eqz v28, :cond_1b

    .line 1181
    move/from16 v28, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfGrouping":I
    .local v28, "_columnIndexOfGrouping":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Global_Dimension_1_Code:Ljava/lang/String;

    goto :goto_1c

    .line 1183
    .end local v28    # "_columnIndexOfGrouping":I
    .restart local v1    # "_columnIndexOfGrouping":I
    :cond_1b
    move/from16 v28, v1

    .end local v1    # "_columnIndexOfGrouping":I
    .restart local v28    # "_columnIndexOfGrouping":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Global_Dimension_1_Code:Ljava/lang/String;

    .line 1185
    :goto_1c
    move/from16 v1, v29

    .end local v29    # "_columnIndexOfShortcutDimension2Code":I
    .local v1, "_columnIndexOfShortcutDimension2Code":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v29

    if-eqz v29, :cond_1c

    .line 1186
    move/from16 v29, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfGlobalDimension1Code":I
    .local v29, "_columnIndexOfGlobalDimension1Code":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Shortcut_Dimension_2_Code:Ljava/lang/String;

    goto :goto_1d

    .line 1188
    .end local v29    # "_columnIndexOfGlobalDimension1Code":I
    .restart local v3    # "_columnIndexOfGlobalDimension1Code":I
    :cond_1c
    move/from16 v29, v3

    .end local v3    # "_columnIndexOfGlobalDimension1Code":I
    .restart local v29    # "_columnIndexOfGlobalDimension1Code":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Shortcut_Dimension_2_Code:Ljava/lang/String;

    .line 1190
    :goto_1d
    move/from16 v3, v30

    .end local v30    # "_columnIndexOfVATPercent":I
    .local v3, "_columnIndexOfVATPercent":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v30

    if-eqz v30, :cond_1d

    .line 1191
    move/from16 v30, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfShortcutDimension2Code":I
    .local v30, "_columnIndexOfShortcutDimension2Code":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->VAT_Percent:Ljava/lang/Double;

    goto :goto_1e

    .line 1193
    .end local v30    # "_columnIndexOfShortcutDimension2Code":I
    .restart local v1    # "_columnIndexOfShortcutDimension2Code":I
    :cond_1d
    move/from16 v30, v1

    .end local v1    # "_columnIndexOfShortcutDimension2Code":I
    .restart local v30    # "_columnIndexOfShortcutDimension2Code":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v100

    invoke-static/range {v100 .. v101}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->VAT_Percent:Ljava/lang/Double;

    .line 1195
    :goto_1e
    move/from16 v1, v31

    .end local v31    # "_columnIndexOfCurrencyCode":I
    .local v1, "_columnIndexOfCurrencyCode":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v31

    if-eqz v31, :cond_1e

    .line 1196
    move/from16 v31, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfVATPercent":I
    .local v31, "_columnIndexOfVATPercent":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Currency_Code:Ljava/lang/String;

    goto :goto_1f

    .line 1198
    .end local v31    # "_columnIndexOfVATPercent":I
    .restart local v3    # "_columnIndexOfVATPercent":I
    :cond_1e
    move/from16 v31, v3

    .end local v3    # "_columnIndexOfVATPercent":I
    .restart local v31    # "_columnIndexOfVATPercent":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Currency_Code:Ljava/lang/String;

    .line 1200
    :goto_1f
    move/from16 v3, v32

    .end local v32    # "_columnIndexOfCurrencyFactor":I
    .local v3, "_columnIndexOfCurrencyFactor":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v32

    if-eqz v32, :cond_1f

    .line 1201
    move/from16 v32, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfCurrencyCode":I
    .local v32, "_columnIndexOfCurrencyCode":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Currency_Factor:Ljava/lang/Double;

    goto :goto_20

    .line 1203
    .end local v32    # "_columnIndexOfCurrencyCode":I
    .restart local v1    # "_columnIndexOfCurrencyCode":I
    :cond_1f
    move/from16 v32, v1

    .end local v1    # "_columnIndexOfCurrencyCode":I
    .restart local v32    # "_columnIndexOfCurrencyCode":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v100

    invoke-static/range {v100 .. v101}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Currency_Factor:Ljava/lang/Double;

    .line 1205
    :goto_20
    move/from16 v1, v33

    .end local v33    # "_columnIndexOfVATBusPostingGroup":I
    .local v1, "_columnIndexOfVATBusPostingGroup":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v33

    if-eqz v33, :cond_20

    .line 1206
    move/from16 v33, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfCurrencyFactor":I
    .local v33, "_columnIndexOfCurrencyFactor":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->VAT_Bus_Posting_Group:Ljava/lang/String;

    goto :goto_21

    .line 1208
    .end local v33    # "_columnIndexOfCurrencyFactor":I
    .restart local v3    # "_columnIndexOfCurrencyFactor":I
    :cond_20
    move/from16 v33, v3

    .end local v3    # "_columnIndexOfCurrencyFactor":I
    .restart local v33    # "_columnIndexOfCurrencyFactor":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->VAT_Bus_Posting_Group:Ljava/lang/String;

    .line 1210
    :goto_21
    move/from16 v3, v34

    .end local v34    # "_columnIndexOfVATProdPostingGroup":I
    .local v3, "_columnIndexOfVATProdPostingGroup":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v34

    if-eqz v34, :cond_21

    .line 1211
    move/from16 v34, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfVATBusPostingGroup":I
    .local v34, "_columnIndexOfVATBusPostingGroup":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->VAT_Prod_Posting_Group:Ljava/lang/String;

    goto :goto_22

    .line 1213
    .end local v34    # "_columnIndexOfVATBusPostingGroup":I
    .restart local v1    # "_columnIndexOfVATBusPostingGroup":I
    :cond_21
    move/from16 v34, v1

    .end local v1    # "_columnIndexOfVATBusPostingGroup":I
    .restart local v34    # "_columnIndexOfVATBusPostingGroup":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->VAT_Prod_Posting_Group:Ljava/lang/String;

    .line 1216
    :goto_22
    move/from16 v1, v35

    .end local v35    # "_columnIndexOfGenPostingTypeSpecified":I
    .local v1, "_columnIndexOfGenPostingTypeSpecified":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v35

    if-eqz v35, :cond_22

    .line 1217
    const/16 v35, 0x0

    move/from16 v100, v3

    move-object/from16 v3, v35

    move-object/from16 v35, v4

    .local v35, "_tmp_5":Ljava/lang/Integer;
    goto :goto_23

    .line 1219
    .end local v35    # "_tmp_5":Ljava/lang/Integer;
    :cond_22
    move/from16 v100, v3

    move-object/from16 v35, v4

    .end local v3    # "_columnIndexOfVATProdPostingGroup":I
    .end local v4    # "_tmp_2":Ljava/lang/Integer;
    .local v35, "_tmp_2":Ljava/lang/Integer;
    .local v100, "_columnIndexOfVATProdPostingGroup":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 1221
    .local v3, "_tmp_5":Ljava/lang/Integer;
    :goto_23
    if-nez v3, :cond_23

    const/4 v4, 0x0

    goto :goto_25

    :cond_23
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_24

    const/4 v4, 0x1

    goto :goto_24

    :cond_24
    move/from16 v4, v97

    :goto_24
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    :goto_25
    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Gen_Posting_TypeSpecified:Ljava/lang/Boolean;

    .line 1222
    move/from16 v4, v36

    .end local v36    # "_columnIndexOfGenBusPostingGroup":I
    .local v4, "_columnIndexOfGenBusPostingGroup":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v36

    if-eqz v36, :cond_25

    .line 1223
    move/from16 v36, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfGenPostingTypeSpecified":I
    .local v36, "_columnIndexOfGenPostingTypeSpecified":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Gen_Bus_Posting_Group:Ljava/lang/String;

    goto :goto_26

    .line 1225
    .end local v36    # "_columnIndexOfGenPostingTypeSpecified":I
    .restart local v1    # "_columnIndexOfGenPostingTypeSpecified":I
    :cond_25
    move/from16 v36, v1

    .end local v1    # "_columnIndexOfGenPostingTypeSpecified":I
    .restart local v36    # "_columnIndexOfGenPostingTypeSpecified":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Gen_Bus_Posting_Group:Ljava/lang/String;

    .line 1227
    :goto_26
    move/from16 v1, v37

    .end local v37    # "_columnIndexOfGenProdPostingGroup":I
    .local v1, "_columnIndexOfGenProdPostingGroup":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v37

    if-eqz v37, :cond_26

    .line 1228
    move-object/from16 v37, v3

    const/4 v3, 0x0

    .end local v3    # "_tmp_5":Ljava/lang/Integer;
    .local v37, "_tmp_5":Ljava/lang/Integer;
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Gen_Prod_Posting_Group:Ljava/lang/String;

    goto :goto_27

    .line 1230
    .end local v37    # "_tmp_5":Ljava/lang/Integer;
    .restart local v3    # "_tmp_5":Ljava/lang/Integer;
    :cond_26
    move-object/from16 v37, v3

    .end local v3    # "_tmp_5":Ljava/lang/Integer;
    .restart local v37    # "_tmp_5":Ljava/lang/Integer;
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Gen_Prod_Posting_Group:Ljava/lang/String;

    .line 1232
    :goto_27
    move/from16 v3, v38

    .end local v38    # "_columnIndexOfVATAmount":I
    .local v3, "_columnIndexOfVATAmount":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v38

    if-eqz v38, :cond_27

    .line 1233
    move/from16 v38, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfGenProdPostingGroup":I
    .local v38, "_columnIndexOfGenProdPostingGroup":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->VAT_Amount:Ljava/lang/Double;

    goto :goto_28

    .line 1235
    .end local v38    # "_columnIndexOfGenProdPostingGroup":I
    .restart local v1    # "_columnIndexOfGenProdPostingGroup":I
    :cond_27
    move/from16 v38, v1

    .end local v1    # "_columnIndexOfGenProdPostingGroup":I
    .restart local v38    # "_columnIndexOfGenProdPostingGroup":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v101

    invoke-static/range {v101 .. v102}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->VAT_Amount:Ljava/lang/Double;

    .line 1237
    :goto_28
    move/from16 v1, v39

    .end local v39    # "_columnIndexOfTotalAmount":I
    .local v1, "_columnIndexOfTotalAmount":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v39

    if-eqz v39, :cond_28

    .line 1238
    move/from16 v39, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfVATAmount":I
    .local v39, "_columnIndexOfVATAmount":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Total_Amount:Ljava/lang/Double;

    goto :goto_29

    .line 1240
    .end local v39    # "_columnIndexOfVATAmount":I
    .restart local v3    # "_columnIndexOfVATAmount":I
    :cond_28
    move/from16 v39, v3

    .end local v3    # "_columnIndexOfVATAmount":I
    .restart local v39    # "_columnIndexOfVATAmount":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v101

    invoke-static/range {v101 .. v102}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Total_Amount:Ljava/lang/Double;

    .line 1242
    :goto_29
    move/from16 v3, v40

    .end local v40    # "_columnIndexOfUserID":I
    .local v3, "_columnIndexOfUserID":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v40

    if-eqz v40, :cond_29

    .line 1243
    move/from16 v40, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfTotalAmount":I
    .local v40, "_columnIndexOfTotalAmount":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->User_ID:Ljava/lang/String;

    goto :goto_2a

    .line 1245
    .end local v40    # "_columnIndexOfTotalAmount":I
    .restart local v1    # "_columnIndexOfTotalAmount":I
    :cond_29
    move/from16 v40, v1

    .end local v1    # "_columnIndexOfTotalAmount":I
    .restart local v40    # "_columnIndexOfTotalAmount":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->User_ID:Ljava/lang/String;

    .line 1247
    :goto_2a
    move/from16 v1, v41

    .end local v41    # "_columnIndexOfApplyTo":I
    .local v1, "_columnIndexOfApplyTo":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v41

    if-eqz v41, :cond_2a

    .line 1248
    move/from16 v41, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfUserID":I
    .local v41, "_columnIndexOfUserID":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Apply_to:Ljava/lang/String;

    goto :goto_2b

    .line 1250
    .end local v41    # "_columnIndexOfUserID":I
    .restart local v3    # "_columnIndexOfUserID":I
    :cond_2a
    move/from16 v41, v3

    .end local v3    # "_columnIndexOfUserID":I
    .restart local v41    # "_columnIndexOfUserID":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Apply_to:Ljava/lang/String;

    .line 1252
    :goto_2b
    move/from16 v3, v42

    .end local v42    # "_columnIndexOfApplyToID":I
    .local v3, "_columnIndexOfApplyToID":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v42

    if-eqz v42, :cond_2b

    .line 1253
    move/from16 v42, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfApplyTo":I
    .local v42, "_columnIndexOfApplyTo":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Apply_to_ID:Ljava/lang/String;

    goto :goto_2c

    .line 1255
    .end local v42    # "_columnIndexOfApplyTo":I
    .restart local v1    # "_columnIndexOfApplyTo":I
    :cond_2b
    move/from16 v42, v1

    .end local v1    # "_columnIndexOfApplyTo":I
    .restart local v42    # "_columnIndexOfApplyTo":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Apply_to_ID:Ljava/lang/String;

    .line 1257
    :goto_2c
    move/from16 v1, v43

    .end local v43    # "_columnIndexOfDestGlobalDimension1Code":I
    .local v1, "_columnIndexOfDestGlobalDimension1Code":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v43

    if-eqz v43, :cond_2c

    .line 1258
    move/from16 v43, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfApplyToID":I
    .local v43, "_columnIndexOfApplyToID":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Dest_Global_Dimension_1_Code:Ljava/lang/String;

    goto :goto_2d

    .line 1260
    .end local v43    # "_columnIndexOfApplyToID":I
    .restart local v3    # "_columnIndexOfApplyToID":I
    :cond_2c
    move/from16 v43, v3

    .end local v3    # "_columnIndexOfApplyToID":I
    .restart local v43    # "_columnIndexOfApplyToID":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Dest_Global_Dimension_1_Code:Ljava/lang/String;

    .line 1262
    :goto_2d
    move/from16 v3, v44

    .end local v44    # "_columnIndexOfDestShortcutDimension2Code":I
    .local v3, "_columnIndexOfDestShortcutDimension2Code":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v44

    if-eqz v44, :cond_2d

    .line 1263
    move/from16 v44, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfDestGlobalDimension1Code":I
    .local v44, "_columnIndexOfDestGlobalDimension1Code":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Dest_Shortcut_Dimension_2_Code:Ljava/lang/String;

    goto :goto_2e

    .line 1265
    .end local v44    # "_columnIndexOfDestGlobalDimension1Code":I
    .restart local v1    # "_columnIndexOfDestGlobalDimension1Code":I
    :cond_2d
    move/from16 v44, v1

    .end local v1    # "_columnIndexOfDestGlobalDimension1Code":I
    .restart local v44    # "_columnIndexOfDestGlobalDimension1Code":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Dest_Shortcut_Dimension_2_Code:Ljava/lang/String;

    .line 1267
    :goto_2e
    move/from16 v101, v3

    move/from16 v1, v45

    move/from16 v45, v4

    .end local v3    # "_columnIndexOfDestShortcutDimension2Code":I
    .end local v4    # "_columnIndexOfGenBusPostingGroup":I
    .local v1, "_columnIndexOfLineNo":I
    .local v45, "_columnIndexOfGenBusPostingGroup":I
    .local v101, "_columnIndexOfDestShortcutDimension2Code":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    iput v3, v15, Lcom/trimline/metrocrew/transaction;->Line_No:I

    .line 1268
    move/from16 v3, v46

    move/from16 v46, v5

    .end local v5    # "_columnIndexOfDatePosted":I
    .local v3, "_columnIndexOfPrintNo":I
    .local v46, "_columnIndexOfDatePosted":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, v15, Lcom/trimline/metrocrew/transaction;->Print_No:I

    .line 1270
    move/from16 v4, v47

    .end local v47    # "_columnIndexOfDepositSlipTime":I
    .local v4, "_columnIndexOfDepositSlipTime":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v5

    if-eqz v5, :cond_2e

    .line 1271
    const/4 v5, 0x0

    .local v5, "_tmp_6":Ljava/lang/Long;
    goto :goto_2f

    .line 1273
    .end local v5    # "_tmp_6":Ljava/lang/Long;
    :cond_2e
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v102

    invoke-static/range {v102 .. v103}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    .line 1275
    .restart local v5    # "_tmp_6":Ljava/lang/Long;
    :goto_2f
    move/from16 v47, v1

    .end local v1    # "_columnIndexOfLineNo":I
    .local v47, "_columnIndexOfLineNo":I
    invoke-static {v5}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Deposit_Slip_Time:Ljava/sql/Date;

    .line 1276
    move/from16 v1, v48

    .end local v48    # "_columnIndexOfTellerID":I
    .local v1, "_columnIndexOfTellerID":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v48

    if-eqz v48, :cond_2f

    .line 1277
    move/from16 v48, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfPrintNo":I
    .local v48, "_columnIndexOfPrintNo":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Teller_ID:Ljava/lang/String;

    goto :goto_30

    .line 1279
    .end local v48    # "_columnIndexOfPrintNo":I
    .restart local v3    # "_columnIndexOfPrintNo":I
    :cond_2f
    move/from16 v48, v3

    .end local v3    # "_columnIndexOfPrintNo":I
    .restart local v48    # "_columnIndexOfPrintNo":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Teller_ID:Ljava/lang/String;

    .line 1282
    :goto_30
    move/from16 v3, v49

    .end local v49    # "_columnIndexOfCustomerPaymentOnAccount":I
    .local v3, "_columnIndexOfCustomerPaymentOnAccount":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v49

    if-eqz v49, :cond_30

    .line 1283
    const/16 v49, 0x0

    move-object/from16 v102, v49

    move/from16 v49, v4

    move-object/from16 v4, v102

    move-object/from16 v102, v5

    .local v49, "_tmp_7":Ljava/lang/Integer;
    goto :goto_31

    .line 1285
    .end local v49    # "_tmp_7":Ljava/lang/Integer;
    :cond_30
    move/from16 v49, v4

    move-object/from16 v102, v5

    .end local v4    # "_columnIndexOfDepositSlipTime":I
    .end local v5    # "_tmp_6":Ljava/lang/Long;
    .local v49, "_columnIndexOfDepositSlipTime":I
    .local v102, "_tmp_6":Ljava/lang/Long;
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v4

    long-to-int v4, v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 1287
    .local v4, "_tmp_7":Ljava/lang/Integer;
    :goto_31
    if-nez v4, :cond_31

    const/4 v5, 0x0

    goto :goto_33

    :cond_31
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eqz v5, :cond_32

    const/4 v5, 0x1

    goto :goto_32

    :cond_32
    move/from16 v5, v97

    :goto_32
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    :goto_33
    iput-object v5, v15, Lcom/trimline/metrocrew/transaction;->Customer_Payment_On_Account:Ljava/lang/Boolean;

    .line 1289
    move/from16 v5, v50

    .end local v50    # "_columnIndexOfSelect":I
    .local v5, "_columnIndexOfSelect":I
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v50

    if-eqz v50, :cond_33

    .line 1290
    const/16 v50, 0x0

    move-object/from16 v103, v50

    move/from16 v50, v3

    move-object/from16 v3, v103

    move-object/from16 v103, v4

    .local v50, "_tmp_8":Ljava/lang/Integer;
    goto :goto_34

    .line 1292
    .end local v50    # "_tmp_8":Ljava/lang/Integer;
    :cond_33
    move/from16 v50, v3

    move-object/from16 v103, v4

    .end local v3    # "_columnIndexOfCustomerPaymentOnAccount":I
    .end local v4    # "_tmp_7":Ljava/lang/Integer;
    .local v50, "_columnIndexOfCustomerPaymentOnAccount":I
    .local v103, "_tmp_7":Ljava/lang/Integer;
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 1294
    .local v3, "_tmp_8":Ljava/lang/Integer;
    :goto_34
    if-nez v3, :cond_34

    const/4 v4, 0x0

    goto :goto_36

    :cond_34
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_35

    const/4 v4, 0x1

    goto :goto_35

    :cond_35
    move/from16 v4, v97

    :goto_35
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    :goto_36
    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Select:Ljava/lang/Boolean;

    .line 1296
    move/from16 v4, v51

    .end local v51    # "_columnIndexOfBatchPosted":I
    .local v4, "_columnIndexOfBatchPosted":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v51

    if-eqz v51, :cond_36

    .line 1297
    const/16 v51, 0x0

    move/from16 v104, v5

    move-object/from16 v5, v51

    move/from16 v51, v6

    .local v51, "_tmp_9":Ljava/lang/Integer;
    goto :goto_37

    .line 1299
    .end local v51    # "_tmp_9":Ljava/lang/Integer;
    :cond_36
    move/from16 v104, v5

    move/from16 v51, v6

    .end local v5    # "_columnIndexOfSelect":I
    .end local v6    # "_columnIndexOfType":I
    .local v51, "_columnIndexOfType":I
    .local v104, "_columnIndexOfSelect":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v5

    long-to-int v5, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 1301
    .local v5, "_tmp_9":Ljava/lang/Integer;
    :goto_37
    if-nez v5, :cond_37

    const/4 v6, 0x0

    goto :goto_39

    :cond_37
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-eqz v6, :cond_38

    const/4 v6, 0x1

    goto :goto_38

    :cond_38
    move/from16 v6, v97

    :goto_38
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :goto_39
    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Batch_Posted:Ljava/lang/Boolean;

    .line 1302
    move/from16 v6, v52

    .end local v52    # "_columnIndexOfTransactionNo":I
    .local v6, "_columnIndexOfTransactionNo":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v52

    if-eqz v52, :cond_39

    .line 1303
    move/from16 v52, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfTellerID":I
    .local v52, "_columnIndexOfTellerID":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Transaction_No:Ljava/lang/String;

    goto :goto_3a

    .line 1305
    .end local v52    # "_columnIndexOfTellerID":I
    .restart local v1    # "_columnIndexOfTellerID":I
    :cond_39
    move/from16 v52, v1

    .end local v1    # "_columnIndexOfTellerID":I
    .restart local v52    # "_columnIndexOfTellerID":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Transaction_No:Ljava/lang/String;

    .line 1307
    :goto_3a
    move/from16 v1, v53

    .end local v53    # "_columnIndexOfChequeDepositSlipBank":I
    .local v1, "_columnIndexOfChequeDepositSlipBank":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v53

    if-eqz v53, :cond_3a

    .line 1308
    move-object/from16 v53, v3

    const/4 v3, 0x0

    .end local v3    # "_tmp_8":Ljava/lang/Integer;
    .local v53, "_tmp_8":Ljava/lang/Integer;
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_Bank:Ljava/lang/String;

    goto :goto_3b

    .line 1310
    .end local v53    # "_tmp_8":Ljava/lang/Integer;
    .restart local v3    # "_tmp_8":Ljava/lang/Integer;
    :cond_3a
    move-object/from16 v53, v3

    .end local v3    # "_tmp_8":Ljava/lang/Integer;
    .restart local v53    # "_tmp_8":Ljava/lang/Integer;
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_Bank:Ljava/lang/String;

    .line 1312
    :goto_3b
    move/from16 v3, v54

    .end local v54    # "_columnIndexOfBankAccount":I
    .local v3, "_columnIndexOfBankAccount":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v54

    if-eqz v54, :cond_3b

    .line 1313
    move/from16 v54, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfChequeDepositSlipBank":I
    .local v54, "_columnIndexOfChequeDepositSlipBank":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Bank_Account:Ljava/lang/String;

    goto :goto_3c

    .line 1315
    .end local v54    # "_columnIndexOfChequeDepositSlipBank":I
    .restart local v1    # "_columnIndexOfChequeDepositSlipBank":I
    :cond_3b
    move/from16 v54, v1

    .end local v1    # "_columnIndexOfChequeDepositSlipBank":I
    .restart local v54    # "_columnIndexOfChequeDepositSlipBank":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Bank_Account:Ljava/lang/String;

    .line 1318
    :goto_3c
    move/from16 v1, v55

    .end local v55    # "_columnIndexOfConfirmed":I
    .local v1, "_columnIndexOfConfirmed":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v55

    if-eqz v55, :cond_3c

    .line 1319
    const/16 v55, 0x0

    move/from16 v105, v3

    move-object/from16 v3, v55

    move/from16 v55, v4

    .local v55, "_tmp_10":Ljava/lang/Integer;
    goto :goto_3d

    .line 1321
    .end local v55    # "_tmp_10":Ljava/lang/Integer;
    :cond_3c
    move/from16 v105, v3

    move/from16 v55, v4

    .end local v3    # "_columnIndexOfBankAccount":I
    .end local v4    # "_columnIndexOfBatchPosted":I
    .local v55, "_columnIndexOfBatchPosted":I
    .local v105, "_columnIndexOfBankAccount":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 1323
    .local v3, "_tmp_10":Ljava/lang/Integer;
    :goto_3d
    if-nez v3, :cond_3d

    const/4 v4, 0x0

    goto :goto_3f

    :cond_3d
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_3e

    const/4 v4, 0x1

    goto :goto_3e

    :cond_3e
    move/from16 v4, v97

    :goto_3e
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    :goto_3f
    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Confirmed:Ljava/lang/Boolean;

    .line 1325
    move/from16 v4, v56

    .end local v56    # "_columnIndexOfReconciled":I
    .local v4, "_columnIndexOfReconciled":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v56

    if-eqz v56, :cond_3f

    .line 1326
    const/16 v56, 0x0

    move-object/from16 v106, v56

    move-object/from16 v56, v5

    move-object/from16 v5, v106

    move/from16 v106, v6

    .local v56, "_tmp_11":Ljava/lang/Integer;
    goto :goto_40

    .line 1328
    .end local v56    # "_tmp_11":Ljava/lang/Integer;
    :cond_3f
    move-object/from16 v56, v5

    move/from16 v106, v6

    .end local v5    # "_tmp_9":Ljava/lang/Integer;
    .end local v6    # "_columnIndexOfTransactionNo":I
    .local v56, "_tmp_9":Ljava/lang/Integer;
    .local v106, "_columnIndexOfTransactionNo":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v5

    long-to-int v5, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 1330
    .local v5, "_tmp_11":Ljava/lang/Integer;
    :goto_40
    if-nez v5, :cond_40

    const/4 v6, 0x0

    goto :goto_42

    :cond_40
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-eqz v6, :cond_41

    const/4 v6, 0x1

    goto :goto_41

    :cond_41
    move/from16 v6, v97

    :goto_41
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :goto_42
    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Reconciled:Ljava/lang/Boolean;

    .line 1331
    move/from16 v6, v57

    .end local v57    # "_columnIndexOfOrigCashier":I
    .local v6, "_columnIndexOfOrigCashier":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v57

    if-eqz v57, :cond_42

    .line 1332
    move/from16 v57, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfConfirmed":I
    .local v57, "_columnIndexOfConfirmed":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Orig_Cashier:Ljava/lang/String;

    goto :goto_43

    .line 1334
    .end local v57    # "_columnIndexOfConfirmed":I
    .restart local v1    # "_columnIndexOfConfirmed":I
    :cond_42
    move/from16 v57, v1

    .end local v1    # "_columnIndexOfConfirmed":I
    .restart local v57    # "_columnIndexOfConfirmed":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Orig_Cashier:Ljava/lang/String;

    .line 1337
    :goto_43
    move/from16 v1, v58

    .end local v58    # "_columnIndexOfCancelled":I
    .local v1, "_columnIndexOfCancelled":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v58

    if-eqz v58, :cond_43

    .line 1338
    const/16 v58, 0x0

    move-object/from16 v107, v58

    move-object/from16 v58, v3

    move-object/from16 v3, v107

    move/from16 v107, v4

    .local v58, "_tmp_12":Ljava/lang/Integer;
    goto :goto_44

    .line 1340
    .end local v58    # "_tmp_12":Ljava/lang/Integer;
    :cond_43
    move-object/from16 v58, v3

    move/from16 v107, v4

    .end local v3    # "_tmp_10":Ljava/lang/Integer;
    .end local v4    # "_columnIndexOfReconciled":I
    .local v58, "_tmp_10":Ljava/lang/Integer;
    .local v107, "_columnIndexOfReconciled":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 1342
    .local v3, "_tmp_12":Ljava/lang/Integer;
    :goto_44
    if-nez v3, :cond_44

    const/4 v4, 0x0

    goto :goto_46

    :cond_44
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_45

    const/4 v4, 0x1

    goto :goto_45

    :cond_45
    move/from16 v4, v97

    :goto_45
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    :goto_46
    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Cancelled:Ljava/lang/Boolean;

    .line 1343
    move/from16 v4, v59

    .end local v59    # "_columnIndexOfCancelledBy":I
    .local v4, "_columnIndexOfCancelledBy":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v59

    if-eqz v59, :cond_46

    .line 1344
    move/from16 v59, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfCancelled":I
    .local v59, "_columnIndexOfCancelled":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Cancelled_By:Ljava/lang/String;

    goto :goto_47

    .line 1346
    .end local v59    # "_columnIndexOfCancelled":I
    .restart local v1    # "_columnIndexOfCancelled":I
    :cond_46
    move/from16 v59, v1

    .end local v1    # "_columnIndexOfCancelled":I
    .restart local v59    # "_columnIndexOfCancelled":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Cancelled_By:Ljava/lang/String;

    .line 1349
    :goto_47
    move/from16 v1, v60

    .end local v60    # "_columnIndexOfCancelledDate":I
    .local v1, "_columnIndexOfCancelledDate":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v60

    if-eqz v60, :cond_47

    .line 1350
    const/16 v60, 0x0

    .local v60, "_tmp_13":Ljava/lang/Long;
    goto :goto_48

    .line 1352
    .end local v60    # "_tmp_13":Ljava/lang/Long;
    :cond_47
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v108

    invoke-static/range {v108 .. v109}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v60

    .line 1354
    .restart local v60    # "_tmp_13":Ljava/lang/Long;
    :goto_48
    move/from16 v108, v1

    .end local v1    # "_columnIndexOfCancelledDate":I
    .local v108, "_columnIndexOfCancelledDate":I
    invoke-static/range {v60 .. v60}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Cancelled_Date:Ljava/sql/Date;

    .line 1356
    move/from16 v1, v61

    .end local v61    # "_columnIndexOfCancelledTime":I
    .local v1, "_columnIndexOfCancelledTime":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v61

    if-eqz v61, :cond_48

    .line 1357
    const/16 v61, 0x0

    .local v61, "_tmp_14":Ljava/lang/Long;
    goto :goto_49

    .line 1359
    .end local v61    # "_tmp_14":Ljava/lang/Long;
    :cond_48
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v109

    invoke-static/range {v109 .. v110}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v61

    .line 1361
    .restart local v61    # "_tmp_14":Ljava/lang/Long;
    :goto_49
    move/from16 v109, v1

    .end local v1    # "_columnIndexOfCancelledTime":I
    .local v109, "_columnIndexOfCancelledTime":I
    invoke-static/range {v61 .. v61}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Cancelled_Time:Ljava/sql/Date;

    .line 1363
    move/from16 v1, v62

    .end local v62    # "_columnIndexOfPostDated":I
    .local v1, "_columnIndexOfPostDated":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v62

    if-eqz v62, :cond_49

    .line 1364
    const/16 v62, 0x0

    move-object/from16 v110, v62

    move-object/from16 v62, v3

    move-object/from16 v3, v110

    move/from16 v110, v4

    .local v62, "_tmp_15":Ljava/lang/Integer;
    goto :goto_4a

    .line 1366
    .end local v62    # "_tmp_15":Ljava/lang/Integer;
    :cond_49
    move-object/from16 v62, v3

    move/from16 v110, v4

    .end local v3    # "_tmp_12":Ljava/lang/Integer;
    .end local v4    # "_columnIndexOfCancelledBy":I
    .local v62, "_tmp_12":Ljava/lang/Integer;
    .local v110, "_columnIndexOfCancelledBy":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 1368
    .local v3, "_tmp_15":Ljava/lang/Integer;
    :goto_4a
    if-nez v3, :cond_4a

    const/4 v4, 0x0

    goto :goto_4c

    :cond_4a
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_4b

    const/4 v4, 0x1

    goto :goto_4b

    :cond_4b
    move/from16 v4, v97

    :goto_4b
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    :goto_4c
    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Post_Dated:Ljava/lang/Boolean;

    .line 1370
    move/from16 v4, v63

    .end local v63    # "_columnIndexOfChequeRetrieved":I
    .local v4, "_columnIndexOfChequeRetrieved":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v63

    if-eqz v63, :cond_4c

    .line 1371
    const/16 v63, 0x0

    move-object/from16 v111, v63

    move-object/from16 v63, v5

    move-object/from16 v5, v111

    move/from16 v111, v6

    .local v63, "_tmp_16":Ljava/lang/Integer;
    goto :goto_4d

    .line 1373
    .end local v63    # "_tmp_16":Ljava/lang/Integer;
    :cond_4c
    move-object/from16 v63, v5

    move/from16 v111, v6

    .end local v5    # "_tmp_11":Ljava/lang/Integer;
    .end local v6    # "_columnIndexOfOrigCashier":I
    .local v63, "_tmp_11":Ljava/lang/Integer;
    .local v111, "_columnIndexOfOrigCashier":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v5

    long-to-int v5, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 1375
    .local v5, "_tmp_16":Ljava/lang/Integer;
    :goto_4d
    if-nez v5, :cond_4d

    const/4 v6, 0x0

    goto :goto_4f

    :cond_4d
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-eqz v6, :cond_4e

    const/4 v6, 0x1

    goto :goto_4e

    :cond_4e
    move/from16 v6, v97

    :goto_4e
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :goto_4f
    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Cheque_Retrieved:Ljava/lang/Boolean;

    .line 1376
    move/from16 v112, v4

    move/from16 v6, v64

    move-object/from16 v64, v3

    .end local v3    # "_tmp_15":Ljava/lang/Integer;
    .end local v4    # "_columnIndexOfChequeRetrieved":I
    .local v6, "_columnIndexOfRegisterNumber":I
    .local v64, "_tmp_15":Ljava/lang/Integer;
    .local v112, "_columnIndexOfChequeRetrieved":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    iput v3, v15, Lcom/trimline/metrocrew/transaction;->Register_Number:I

    .line 1377
    move/from16 v3, v65

    move-object/from16 v65, v5

    .end local v5    # "_tmp_16":Ljava/lang/Integer;
    .local v3, "_columnIndexOfFromEntryNo":I
    .local v65, "_tmp_16":Ljava/lang/Integer;
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, v15, Lcom/trimline/metrocrew/transaction;->From_Entry_No:I

    .line 1378
    move/from16 v4, v66

    move/from16 v66, v6

    .end local v6    # "_columnIndexOfRegisterNumber":I
    .local v4, "_columnIndexOfToEntryNo":I
    .local v66, "_columnIndexOfRegisterNumber":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v5

    long-to-int v5, v5

    iput v5, v15, Lcom/trimline/metrocrew/transaction;->To_Entry_No:I

    .line 1379
    move/from16 v5, v67

    .end local v67    # "_columnIndexOfBatchPostedUserID":I
    .local v5, "_columnIndexOfBatchPostedUserID":I
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_4f

    .line 1380
    const/4 v6, 0x0

    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Batch_Posted_UserID:Ljava/lang/String;

    goto :goto_50

    .line 1382
    :cond_4f
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Batch_Posted_UserID:Ljava/lang/String;

    .line 1384
    :goto_50
    move/from16 v67, v3

    move/from16 v6, v68

    move/from16 v68, v4

    .end local v3    # "_columnIndexOfFromEntryNo":I
    .end local v4    # "_columnIndexOfToEntryNo":I
    .local v6, "_columnIndexOfBDRegisterNumber":I
    .local v67, "_columnIndexOfFromEntryNo":I
    .local v68, "_columnIndexOfToEntryNo":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    iput v3, v15, Lcom/trimline/metrocrew/transaction;->BD_Register_Number:I

    .line 1385
    move/from16 v3, v69

    move/from16 v69, v5

    .end local v5    # "_columnIndexOfBatchPostedUserID":I
    .local v3, "_columnIndexOfBDFromNumber":I
    .local v69, "_columnIndexOfBatchPostedUserID":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, v15, Lcom/trimline/metrocrew/transaction;->BD_From_Number:I

    .line 1386
    move/from16 v4, v70

    move/from16 v70, v6

    .end local v6    # "_columnIndexOfBDRegisterNumber":I
    .local v4, "_columnIndexOfBDToNumber":I
    .local v70, "_columnIndexOfBDRegisterNumber":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v5

    long-to-int v5, v5

    iput v5, v15, Lcom/trimline/metrocrew/transaction;->BD_To_Number:I

    .line 1387
    move/from16 v5, v71

    .end local v71    # "_columnIndexOfReversalBy":I
    .local v5, "_columnIndexOfReversalBy":I
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_50

    .line 1388
    const/4 v6, 0x0

    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Reversal_By:Ljava/lang/String;

    goto :goto_51

    .line 1390
    :cond_50
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Reversal_By:Ljava/lang/String;

    .line 1393
    :goto_51
    move/from16 v6, v72

    .end local v72    # "_columnIndexOfReversalDate":I
    .local v6, "_columnIndexOfReversalDate":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v71

    if-eqz v71, :cond_51

    .line 1394
    const/16 v71, 0x0

    .local v71, "_tmp_17":Ljava/lang/Long;
    goto :goto_52

    .line 1396
    .end local v71    # "_tmp_17":Ljava/lang/Long;
    :cond_51
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v71

    invoke-static/range {v71 .. v72}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v71

    .line 1398
    .restart local v71    # "_tmp_17":Ljava/lang/Long;
    :goto_52
    move/from16 v72, v1

    .end local v1    # "_columnIndexOfPostDated":I
    .local v72, "_columnIndexOfPostDated":I
    invoke-static/range {v71 .. v71}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Reversal_Date:Ljava/sql/Date;

    .line 1400
    move/from16 v1, v73

    .end local v73    # "_columnIndexOfReversalTime":I
    .local v1, "_columnIndexOfReversalTime":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v73

    if-eqz v73, :cond_52

    .line 1401
    const/16 v73, 0x0

    .local v73, "_tmp_18":Ljava/lang/Long;
    goto :goto_53

    .line 1403
    .end local v73    # "_tmp_18":Ljava/lang/Long;
    :cond_52
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v113

    invoke-static/range {v113 .. v114}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v73

    .line 1405
    .restart local v73    # "_tmp_18":Ljava/lang/Long;
    :goto_53
    move/from16 v113, v1

    .end local v1    # "_columnIndexOfReversalTime":I
    .local v113, "_columnIndexOfReversalTime":I
    invoke-static/range {v73 .. v73}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Reversal_Time:Ljava/sql/Date;

    .line 1406
    move/from16 v114, v4

    move/from16 v1, v74

    move/from16 v74, v3

    .end local v3    # "_columnIndexOfBDFromNumber":I
    .end local v4    # "_columnIndexOfBDToNumber":I
    .local v1, "_columnIndexOfReversalRegisterNo":I
    .local v74, "_columnIndexOfBDFromNumber":I
    .local v114, "_columnIndexOfBDToNumber":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    iput v3, v15, Lcom/trimline/metrocrew/transaction;->Reversal_Register_No:I

    .line 1407
    move/from16 v3, v75

    move/from16 v75, v5

    .end local v5    # "_columnIndexOfReversalBy":I
    .local v3, "_columnIndexOfReversalFromEntryNo":I
    .local v75, "_columnIndexOfReversalBy":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, v15, Lcom/trimline/metrocrew/transaction;->Reversal_From_Entry_No:I

    .line 1408
    move/from16 v4, v76

    move/from16 v76, v6

    .end local v6    # "_columnIndexOfReversalDate":I
    .local v4, "_columnIndexOfReversalToEntryNo":I
    .local v76, "_columnIndexOfReversalDate":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v5

    long-to-int v5, v5

    iput v5, v15, Lcom/trimline/metrocrew/transaction;->Reversal_To_Entry_No:I

    .line 1410
    move/from16 v5, v77

    .end local v77    # "_columnIndexOfReversed":I
    .local v5, "_columnIndexOfReversed":I
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_53

    .line 1411
    const/4 v6, 0x0

    move-object/from16 v77, v6

    move v6, v3

    move-object/from16 v3, v77

    move/from16 v77, v4

    .local v6, "_tmp_19":Ljava/lang/Integer;
    goto :goto_54

    .line 1413
    .end local v6    # "_tmp_19":Ljava/lang/Integer;
    :cond_53
    move v6, v3

    move/from16 v77, v4

    .end local v3    # "_columnIndexOfReversalFromEntryNo":I
    .end local v4    # "_columnIndexOfReversalToEntryNo":I
    .local v6, "_columnIndexOfReversalFromEntryNo":I
    .local v77, "_columnIndexOfReversalToEntryNo":I
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 1415
    .local v3, "_tmp_19":Ljava/lang/Integer;
    :goto_54
    if-nez v3, :cond_54

    const/4 v4, 0x0

    goto :goto_56

    :cond_54
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_55

    const/4 v4, 0x1

    goto :goto_55

    :cond_55
    move/from16 v4, v97

    :goto_55
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    :goto_56
    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Reversed:Ljava/lang/Boolean;

    .line 1416
    move/from16 v4, v78

    .end local v78    # "_columnIndexOfAppliesToDocNo":I
    .local v4, "_columnIndexOfAppliesToDocNo":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v78

    if-eqz v78, :cond_56

    .line 1417
    move/from16 v78, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfReversalRegisterNo":I
    .local v78, "_columnIndexOfReversalRegisterNo":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Applies_to_Doc_No:Ljava/lang/String;

    goto :goto_57

    .line 1419
    .end local v78    # "_columnIndexOfReversalRegisterNo":I
    .restart local v1    # "_columnIndexOfReversalRegisterNo":I
    :cond_56
    move/from16 v78, v1

    .end local v1    # "_columnIndexOfReversalRegisterNo":I
    .restart local v78    # "_columnIndexOfReversalRegisterNo":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Applies_to_Doc_No:Ljava/lang/String;

    .line 1421
    :goto_57
    move/from16 v1, v79

    .end local v79    # "_columnIndexOfAppliesToID":I
    .local v1, "_columnIndexOfAppliesToID":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v79

    if-eqz v79, :cond_57

    .line 1422
    move-object/from16 v79, v3

    const/4 v3, 0x0

    .end local v3    # "_tmp_19":Ljava/lang/Integer;
    .local v79, "_tmp_19":Ljava/lang/Integer;
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Applies_to_ID:Ljava/lang/String;

    goto :goto_58

    .line 1424
    .end local v79    # "_tmp_19":Ljava/lang/Integer;
    .restart local v3    # "_tmp_19":Ljava/lang/Integer;
    :cond_57
    move-object/from16 v79, v3

    .end local v3    # "_tmp_19":Ljava/lang/Integer;
    .restart local v79    # "_tmp_19":Ljava/lang/Integer;
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Applies_to_ID:Ljava/lang/String;

    .line 1426
    :goto_58
    move/from16 v3, v80

    .end local v80    # "_columnIndexOfGrantNo":I
    .local v3, "_columnIndexOfGrantNo":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v80

    if-eqz v80, :cond_58

    .line 1427
    move/from16 v80, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfAppliesToID":I
    .local v80, "_columnIndexOfAppliesToID":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Grant_No:Ljava/lang/String;

    goto :goto_59

    .line 1429
    .end local v80    # "_columnIndexOfAppliesToID":I
    .restart local v1    # "_columnIndexOfAppliesToID":I
    :cond_58
    move/from16 v80, v1

    .end local v1    # "_columnIndexOfAppliesToID":I
    .restart local v80    # "_columnIndexOfAppliesToID":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Grant_No:Ljava/lang/String;

    .line 1431
    :goto_59
    move/from16 v115, v3

    move/from16 v1, v81

    move/from16 v81, v4

    .end local v3    # "_columnIndexOfGrantNo":I
    .end local v4    # "_columnIndexOfAppliesToDocNo":I
    .local v1, "_columnIndexOfInstallmentNumber":I
    .local v81, "_columnIndexOfAppliesToDocNo":I
    .local v115, "_columnIndexOfGrantNo":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    iput v3, v15, Lcom/trimline/metrocrew/transaction;->Installment_Number:I

    .line 1433
    move/from16 v3, v82

    .end local v82    # "_columnIndexOfNextInstallmentDate":I
    .local v3, "_columnIndexOfNextInstallmentDate":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_59

    .line 1434
    const/4 v4, 0x0

    .local v4, "_tmp_20":Ljava/lang/Long;
    goto :goto_5a

    .line 1436
    .end local v4    # "_tmp_20":Ljava/lang/Long;
    :cond_59
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v116

    invoke-static/range {v116 .. v117}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    .line 1438
    .restart local v4    # "_tmp_20":Ljava/lang/Long;
    :goto_5a
    move/from16 v82, v1

    .end local v1    # "_columnIndexOfInstallmentNumber":I
    .local v82, "_columnIndexOfInstallmentNumber":I
    invoke-static {v4}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Next_Installment_Date:Ljava/sql/Date;

    .line 1439
    move-object/from16 v116, v4

    move/from16 v1, v83

    move/from16 v83, v3

    .end local v3    # "_columnIndexOfNextInstallmentDate":I
    .end local v4    # "_tmp_20":Ljava/lang/Long;
    .local v1, "_columnIndexOfDimensionSetID":I
    .local v83, "_columnIndexOfNextInstallmentDate":I
    .local v116, "_tmp_20":Ljava/lang/Long;
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    iput v3, v15, Lcom/trimline/metrocrew/transaction;->Dimension_Set_ID:I

    .line 1440
    move/from16 v3, v84

    .end local v84    # "_columnIndexOfDonor":I
    .local v3, "_columnIndexOfDonor":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_5a

    .line 1441
    const/4 v4, 0x0

    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Donor:Ljava/lang/String;

    goto :goto_5b

    .line 1443
    :cond_5a
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Donor:Ljava/lang/String;

    .line 1445
    :goto_5b
    move/from16 v4, v85

    .end local v85    # "_columnIndexOfGroupCode":I
    .local v4, "_columnIndexOfGroupCode":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v84

    if-eqz v84, :cond_5b

    .line 1446
    move/from16 v84, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfDimensionSetID":I
    .local v84, "_columnIndexOfDimensionSetID":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Group_Code:Ljava/lang/String;

    goto :goto_5c

    .line 1448
    .end local v84    # "_columnIndexOfDimensionSetID":I
    .restart local v1    # "_columnIndexOfDimensionSetID":I
    :cond_5b
    move/from16 v84, v1

    .end local v1    # "_columnIndexOfDimensionSetID":I
    .restart local v84    # "_columnIndexOfDimensionSetID":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Group_Code:Ljava/lang/String;

    .line 1450
    :goto_5c
    move/from16 v1, v86

    .end local v86    # "_columnIndexOfPreADMFines":I
    .local v1, "_columnIndexOfPreADMFines":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v85

    if-eqz v85, :cond_5c

    .line 1451
    move/from16 v85, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfDonor":I
    .local v85, "_columnIndexOfDonor":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Pre_ADM_Fines:Ljava/lang/Double;

    goto :goto_5d

    .line 1453
    .end local v85    # "_columnIndexOfDonor":I
    .restart local v3    # "_columnIndexOfDonor":I
    :cond_5c
    move/from16 v85, v3

    .end local v3    # "_columnIndexOfDonor":I
    .restart local v85    # "_columnIndexOfDonor":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v117

    invoke-static/range {v117 .. v118}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Pre_ADM_Fines:Ljava/lang/Double;

    .line 1455
    :goto_5d
    move/from16 v3, v87

    .end local v87    # "_columnIndexOfMedFines":I
    .local v3, "_columnIndexOfMedFines":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v86

    if-eqz v86, :cond_5d

    .line 1456
    move/from16 v86, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfPreADMFines":I
    .restart local v86    # "_columnIndexOfPreADMFines":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Med_Fines:Ljava/lang/Double;

    goto :goto_5e

    .line 1458
    .end local v86    # "_columnIndexOfPreADMFines":I
    .restart local v1    # "_columnIndexOfPreADMFines":I
    :cond_5d
    move/from16 v86, v1

    .end local v1    # "_columnIndexOfPreADMFines":I
    .restart local v86    # "_columnIndexOfPreADMFines":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v117

    invoke-static/range {v117 .. v118}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Med_Fines:Ljava/lang/Double;

    .line 1460
    :goto_5e
    move/from16 v1, v88

    .end local v88    # "_columnIndexOfLoanNo":I
    .local v1, "_columnIndexOfLoanNo":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v87

    if-eqz v87, :cond_5e

    .line 1461
    move/from16 v87, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfMedFines":I
    .restart local v87    # "_columnIndexOfMedFines":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Loan_No:Ljava/lang/String;

    goto :goto_5f

    .line 1463
    .end local v87    # "_columnIndexOfMedFines":I
    .restart local v3    # "_columnIndexOfMedFines":I
    :cond_5e
    move/from16 v87, v3

    .end local v3    # "_columnIndexOfMedFines":I
    .restart local v87    # "_columnIndexOfMedFines":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Loan_No:Ljava/lang/String;

    .line 1465
    :goto_5f
    move/from16 v3, v89

    .end local v89    # "_columnIndexOfPenalty":I
    .local v3, "_columnIndexOfPenalty":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v88

    if-eqz v88, :cond_5f

    .line 1466
    move/from16 v88, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfLoanNo":I
    .restart local v88    # "_columnIndexOfLoanNo":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Penalty:Ljava/lang/Double;

    goto :goto_60

    .line 1468
    .end local v88    # "_columnIndexOfLoanNo":I
    .restart local v1    # "_columnIndexOfLoanNo":I
    :cond_5f
    move/from16 v88, v1

    .end local v1    # "_columnIndexOfLoanNo":I
    .restart local v88    # "_columnIndexOfLoanNo":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v117

    invoke-static/range {v117 .. v118}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Penalty:Ljava/lang/Double;

    .line 1471
    :goto_60
    move/from16 v92, v3

    move/from16 v89, v4

    move/from16 v1, v93

    .end local v3    # "_columnIndexOfPenalty":I
    .end local v4    # "_columnIndexOfGroupCode":I
    .end local v93    # "_columnIndexOfSent":I
    .local v1, "_columnIndexOfSent":I
    .local v89, "_columnIndexOfGroupCode":I
    .local v92, "_columnIndexOfPenalty":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    .line 1472
    .local v3, "_tmp_21":I
    if-eqz v3, :cond_60

    const/4 v4, 0x1

    goto :goto_61

    :cond_60
    move/from16 v4, v97

    :goto_61
    iput-boolean v4, v15, Lcom/trimline/metrocrew/transaction;->sent:Z

    .line 1473
    move-object/from16 v4, v91

    .end local v91    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    .local v4, "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    invoke-interface {v4, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1474
    move-object/from16 v91, v4

    move/from16 v15, v16

    move/from16 v16, v17

    move/from16 v4, v18

    move/from16 v18, v21

    move/from16 v21, v22

    move/from16 v22, v23

    move/from16 v23, v24

    move/from16 v24, v25

    move/from16 v25, v26

    move/from16 v26, v27

    move/from16 v27, v28

    move/from16 v28, v29

    move/from16 v29, v30

    move/from16 v30, v31

    move/from16 v31, v32

    move/from16 v32, v33

    move/from16 v33, v34

    move/from16 v35, v36

    move/from16 v37, v38

    move/from16 v38, v39

    move/from16 v39, v40

    move/from16 v40, v41

    move/from16 v41, v42

    move/from16 v42, v43

    move/from16 v43, v44

    move/from16 v36, v45

    move/from16 v19, v46

    move/from16 v45, v47

    move/from16 v46, v48

    move/from16 v47, v49

    move/from16 v49, v50

    move/from16 v48, v52

    move/from16 v53, v54

    move/from16 v58, v59

    move/from16 v64, v66

    move/from16 v65, v67

    move/from16 v66, v68

    move/from16 v67, v69

    move/from16 v68, v70

    move/from16 v62, v72

    move/from16 v69, v74

    move/from16 v71, v75

    move/from16 v72, v76

    move/from16 v76, v77

    move/from16 v74, v78

    move/from16 v79, v80

    move/from16 v78, v81

    move/from16 v81, v82

    move/from16 v82, v83

    move/from16 v83, v84

    move/from16 v84, v85

    move/from16 v85, v89

    move/from16 v14, v90

    move/from16 v89, v92

    move/from16 v13, v94

    move/from16 v3, v95

    move/from16 v17, v98

    move/from16 v20, v99

    move/from16 v34, v100

    move/from16 v44, v101

    move/from16 v50, v104

    move/from16 v54, v105

    move/from16 v52, v106

    move/from16 v56, v107

    move/from16 v60, v108

    move/from16 v61, v109

    move/from16 v59, v110

    move/from16 v63, v112

    move/from16 v73, v113

    move/from16 v70, v114

    move/from16 v80, v115

    move/from16 v77, v5

    move/from16 v75, v6

    move/from16 v6, v51

    move/from16 v51, v55

    move/from16 v55, v57

    move/from16 v5, v96

    move/from16 v57, v111

    .end local v3    # "_tmp_21":I
    .end local v13    # "_tmp":Ljava/lang/Long;
    .end local v14    # "_tmp_1":Ljava/lang/Long;
    .end local v15    # "_item":Lcom/trimline/metrocrew/transaction;
    .end local v19    # "_tmp_3":Ljava/lang/Long;
    .end local v20    # "_tmp_4":Ljava/lang/Long;
    .end local v35    # "_tmp_2":Ljava/lang/Integer;
    .end local v37    # "_tmp_5":Ljava/lang/Integer;
    .end local v53    # "_tmp_8":Ljava/lang/Integer;
    .end local v56    # "_tmp_9":Ljava/lang/Integer;
    .end local v58    # "_tmp_10":Ljava/lang/Integer;
    .end local v60    # "_tmp_13":Ljava/lang/Long;
    .end local v61    # "_tmp_14":Ljava/lang/Long;
    .end local v62    # "_tmp_12":Ljava/lang/Integer;
    .end local v63    # "_tmp_11":Ljava/lang/Integer;
    .end local v64    # "_tmp_15":Ljava/lang/Integer;
    .end local v65    # "_tmp_16":Ljava/lang/Integer;
    .end local v71    # "_tmp_17":Ljava/lang/Long;
    .end local v73    # "_tmp_18":Ljava/lang/Long;
    .end local v79    # "_tmp_19":Ljava/lang/Integer;
    .end local v102    # "_tmp_6":Ljava/lang/Long;
    .end local v103    # "_tmp_7":Ljava/lang/Integer;
    .end local v116    # "_tmp_20":Ljava/lang/Long;
    goto/16 :goto_0

    .line 1475
    .end local v90    # "_columnIndexOfOnBehalfOf":I
    .end local v92    # "_columnIndexOfPenalty":I
    .end local v94    # "_columnIndexOfReceivedFrom":I
    .end local v95    # "_columnIndexOfEntryNo":I
    .end local v96    # "_columnIndexOfDate":I
    .end local v98    # "_columnIndexOfAccountName":I
    .end local v99    # "_columnIndexOfTimePosted":I
    .end local v100    # "_columnIndexOfVATProdPostingGroup":I
    .end local v101    # "_columnIndexOfDestShortcutDimension2Code":I
    .end local v104    # "_columnIndexOfSelect":I
    .end local v105    # "_columnIndexOfBankAccount":I
    .end local v106    # "_columnIndexOfTransactionNo":I
    .end local v107    # "_columnIndexOfReconciled":I
    .end local v108    # "_columnIndexOfCancelledDate":I
    .end local v109    # "_columnIndexOfCancelledTime":I
    .end local v110    # "_columnIndexOfCancelledBy":I
    .end local v111    # "_columnIndexOfOrigCashier":I
    .end local v112    # "_columnIndexOfChequeRetrieved":I
    .end local v113    # "_columnIndexOfReversalTime":I
    .end local v114    # "_columnIndexOfBDToNumber":I
    .end local v115    # "_columnIndexOfGrantNo":I
    .local v3, "_columnIndexOfEntryNo":I
    .local v4, "_columnIndexOfNo":I
    .local v5, "_columnIndexOfDate":I
    .local v6, "_columnIndexOfType":I
    .local v13, "_columnIndexOfReceivedFrom":I
    .local v14, "_columnIndexOfOnBehalfOf":I
    .local v15, "_columnIndexOfCashier":I
    .local v16, "_columnIndexOfAccountNo":I
    .local v17, "_columnIndexOfAccountName":I
    .local v18, "_columnIndexOfPosted":I
    .local v19, "_columnIndexOfDatePosted":I
    .local v20, "_columnIndexOfTimePosted":I
    .local v21, "_columnIndexOfPostedBy":I
    .local v22, "_columnIndexOfAmount":I
    .local v23, "_columnIndexOfRemarks":I
    .local v24, "_columnIndexOfTransactionName":I
    .local v25, "_columnIndexOfBranchCode":I
    .local v26, "_columnIndexOfAgentCode":I
    .local v27, "_columnIndexOfGrouping":I
    .local v28, "_columnIndexOfGlobalDimension1Code":I
    .local v29, "_columnIndexOfShortcutDimension2Code":I
    .local v30, "_columnIndexOfVATPercent":I
    .local v31, "_columnIndexOfCurrencyCode":I
    .local v32, "_columnIndexOfCurrencyFactor":I
    .local v33, "_columnIndexOfVATBusPostingGroup":I
    .local v34, "_columnIndexOfVATProdPostingGroup":I
    .local v35, "_columnIndexOfGenPostingTypeSpecified":I
    .local v36, "_columnIndexOfGenBusPostingGroup":I
    .local v37, "_columnIndexOfGenProdPostingGroup":I
    .local v38, "_columnIndexOfVATAmount":I
    .local v39, "_columnIndexOfTotalAmount":I
    .local v40, "_columnIndexOfUserID":I
    .local v41, "_columnIndexOfApplyTo":I
    .local v42, "_columnIndexOfApplyToID":I
    .local v43, "_columnIndexOfDestGlobalDimension1Code":I
    .local v44, "_columnIndexOfDestShortcutDimension2Code":I
    .local v45, "_columnIndexOfLineNo":I
    .local v46, "_columnIndexOfPrintNo":I
    .local v47, "_columnIndexOfDepositSlipTime":I
    .local v48, "_columnIndexOfTellerID":I
    .local v49, "_columnIndexOfCustomerPaymentOnAccount":I
    .local v50, "_columnIndexOfSelect":I
    .local v51, "_columnIndexOfBatchPosted":I
    .local v52, "_columnIndexOfTransactionNo":I
    .local v53, "_columnIndexOfChequeDepositSlipBank":I
    .local v54, "_columnIndexOfBankAccount":I
    .local v55, "_columnIndexOfConfirmed":I
    .local v56, "_columnIndexOfReconciled":I
    .local v57, "_columnIndexOfOrigCashier":I
    .local v58, "_columnIndexOfCancelled":I
    .local v59, "_columnIndexOfCancelledBy":I
    .local v60, "_columnIndexOfCancelledDate":I
    .local v61, "_columnIndexOfCancelledTime":I
    .local v62, "_columnIndexOfPostDated":I
    .local v63, "_columnIndexOfChequeRetrieved":I
    .local v64, "_columnIndexOfRegisterNumber":I
    .local v65, "_columnIndexOfFromEntryNo":I
    .local v66, "_columnIndexOfToEntryNo":I
    .local v67, "_columnIndexOfBatchPostedUserID":I
    .local v68, "_columnIndexOfBDRegisterNumber":I
    .local v69, "_columnIndexOfBDFromNumber":I
    .local v70, "_columnIndexOfBDToNumber":I
    .local v71, "_columnIndexOfReversalBy":I
    .local v72, "_columnIndexOfReversalDate":I
    .local v73, "_columnIndexOfReversalTime":I
    .local v74, "_columnIndexOfReversalRegisterNo":I
    .local v75, "_columnIndexOfReversalFromEntryNo":I
    .local v76, "_columnIndexOfReversalToEntryNo":I
    .local v77, "_columnIndexOfReversed":I
    .local v78, "_columnIndexOfAppliesToDocNo":I
    .local v79, "_columnIndexOfAppliesToID":I
    .local v80, "_columnIndexOfGrantNo":I
    .local v81, "_columnIndexOfInstallmentNumber":I
    .local v82, "_columnIndexOfNextInstallmentDate":I
    .local v83, "_columnIndexOfDimensionSetID":I
    .local v84, "_columnIndexOfDonor":I
    .local v85, "_columnIndexOfGroupCode":I
    .local v89, "_columnIndexOfPenalty":I
    .restart local v91    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    :cond_61
    move/from16 v100, v34

    move/from16 v34, v33

    move/from16 v33, v32

    move/from16 v32, v31

    move/from16 v31, v30

    move/from16 v30, v29

    move/from16 v29, v28

    move/from16 v28, v27

    move/from16 v27, v26

    move/from16 v26, v25

    move/from16 v25, v24

    move/from16 v24, v23

    move/from16 v23, v22

    move/from16 v22, v21

    move/from16 v21, v18

    move/from16 v18, v4

    move-object/from16 v4, v91

    .line 1477
    .end local v91    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    .local v4, "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    .local v18, "_columnIndexOfNo":I
    .local v21, "_columnIndexOfPosted":I
    .local v22, "_columnIndexOfPostedBy":I
    .local v23, "_columnIndexOfAmount":I
    .local v24, "_columnIndexOfRemarks":I
    .local v25, "_columnIndexOfTransactionName":I
    .local v26, "_columnIndexOfBranchCode":I
    .local v27, "_columnIndexOfAgentCode":I
    .local v28, "_columnIndexOfGrouping":I
    .local v29, "_columnIndexOfGlobalDimension1Code":I
    .local v30, "_columnIndexOfShortcutDimension2Code":I
    .local v31, "_columnIndexOfVATPercent":I
    .local v32, "_columnIndexOfCurrencyCode":I
    .local v33, "_columnIndexOfCurrencyFactor":I
    .local v34, "_columnIndexOfVATBusPostingGroup":I
    .restart local v100    # "_columnIndexOfVATProdPostingGroup":I
    invoke-interface {v2}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 1475
    return-object v4

    .line 1477
    .end local v0    # "_columnIndexOfKey":I
    .end local v1    # "_columnIndexOfSent":I
    .end local v3    # "_columnIndexOfEntryNo":I
    .end local v4    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    .end local v5    # "_columnIndexOfDate":I
    .end local v6    # "_columnIndexOfType":I
    .end local v7    # "_columnIndexOfTranstype":I
    .end local v8    # "_columnIndexOfPayMode":I
    .end local v9    # "_columnIndexOfPayMode_1":I
    .end local v10    # "_columnIndexOfChequeDepositSlipNo":I
    .end local v11    # "_columnIndexOfChequeDepositSlipDate":I
    .end local v12    # "_columnIndexOfBankCode":I
    .end local v13    # "_columnIndexOfReceivedFrom":I
    .end local v14    # "_columnIndexOfOnBehalfOf":I
    .end local v15    # "_columnIndexOfCashier":I
    .end local v16    # "_columnIndexOfAccountNo":I
    .end local v17    # "_columnIndexOfAccountName":I
    .end local v18    # "_columnIndexOfNo":I
    .end local v19    # "_columnIndexOfDatePosted":I
    .end local v20    # "_columnIndexOfTimePosted":I
    .end local v21    # "_columnIndexOfPosted":I
    .end local v22    # "_columnIndexOfPostedBy":I
    .end local v23    # "_columnIndexOfAmount":I
    .end local v24    # "_columnIndexOfRemarks":I
    .end local v25    # "_columnIndexOfTransactionName":I
    .end local v26    # "_columnIndexOfBranchCode":I
    .end local v27    # "_columnIndexOfAgentCode":I
    .end local v28    # "_columnIndexOfGrouping":I
    .end local v29    # "_columnIndexOfGlobalDimension1Code":I
    .end local v30    # "_columnIndexOfShortcutDimension2Code":I
    .end local v31    # "_columnIndexOfVATPercent":I
    .end local v32    # "_columnIndexOfCurrencyCode":I
    .end local v33    # "_columnIndexOfCurrencyFactor":I
    .end local v34    # "_columnIndexOfVATBusPostingGroup":I
    .end local v35    # "_columnIndexOfGenPostingTypeSpecified":I
    .end local v36    # "_columnIndexOfGenBusPostingGroup":I
    .end local v37    # "_columnIndexOfGenProdPostingGroup":I
    .end local v38    # "_columnIndexOfVATAmount":I
    .end local v39    # "_columnIndexOfTotalAmount":I
    .end local v40    # "_columnIndexOfUserID":I
    .end local v41    # "_columnIndexOfApplyTo":I
    .end local v42    # "_columnIndexOfApplyToID":I
    .end local v43    # "_columnIndexOfDestGlobalDimension1Code":I
    .end local v44    # "_columnIndexOfDestShortcutDimension2Code":I
    .end local v45    # "_columnIndexOfLineNo":I
    .end local v46    # "_columnIndexOfPrintNo":I
    .end local v47    # "_columnIndexOfDepositSlipTime":I
    .end local v48    # "_columnIndexOfTellerID":I
    .end local v49    # "_columnIndexOfCustomerPaymentOnAccount":I
    .end local v50    # "_columnIndexOfSelect":I
    .end local v51    # "_columnIndexOfBatchPosted":I
    .end local v52    # "_columnIndexOfTransactionNo":I
    .end local v53    # "_columnIndexOfChequeDepositSlipBank":I
    .end local v54    # "_columnIndexOfBankAccount":I
    .end local v55    # "_columnIndexOfConfirmed":I
    .end local v56    # "_columnIndexOfReconciled":I
    .end local v57    # "_columnIndexOfOrigCashier":I
    .end local v58    # "_columnIndexOfCancelled":I
    .end local v59    # "_columnIndexOfCancelledBy":I
    .end local v60    # "_columnIndexOfCancelledDate":I
    .end local v61    # "_columnIndexOfCancelledTime":I
    .end local v62    # "_columnIndexOfPostDated":I
    .end local v63    # "_columnIndexOfChequeRetrieved":I
    .end local v64    # "_columnIndexOfRegisterNumber":I
    .end local v65    # "_columnIndexOfFromEntryNo":I
    .end local v66    # "_columnIndexOfToEntryNo":I
    .end local v67    # "_columnIndexOfBatchPostedUserID":I
    .end local v68    # "_columnIndexOfBDRegisterNumber":I
    .end local v69    # "_columnIndexOfBDFromNumber":I
    .end local v70    # "_columnIndexOfBDToNumber":I
    .end local v71    # "_columnIndexOfReversalBy":I
    .end local v72    # "_columnIndexOfReversalDate":I
    .end local v73    # "_columnIndexOfReversalTime":I
    .end local v74    # "_columnIndexOfReversalRegisterNo":I
    .end local v75    # "_columnIndexOfReversalFromEntryNo":I
    .end local v76    # "_columnIndexOfReversalToEntryNo":I
    .end local v77    # "_columnIndexOfReversed":I
    .end local v78    # "_columnIndexOfAppliesToDocNo":I
    .end local v79    # "_columnIndexOfAppliesToID":I
    .end local v80    # "_columnIndexOfGrantNo":I
    .end local v81    # "_columnIndexOfInstallmentNumber":I
    .end local v82    # "_columnIndexOfNextInstallmentDate":I
    .end local v83    # "_columnIndexOfDimensionSetID":I
    .end local v84    # "_columnIndexOfDonor":I
    .end local v85    # "_columnIndexOfGroupCode":I
    .end local v86    # "_columnIndexOfPreADMFines":I
    .end local v87    # "_columnIndexOfMedFines":I
    .end local v88    # "_columnIndexOfLoanNo":I
    .end local v89    # "_columnIndexOfPenalty":I
    .end local v100    # "_columnIndexOfVATProdPostingGroup":I
    :catchall_0
    move-exception v0

    invoke-interface {v2}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 1478
    throw v0
.end method

.method static synthetic lambda$loadunsent$5(Landroidx/sqlite/SQLiteConnection;)Ljava/util/List;
    .locals 119
    .param p0, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 1486
    const-string v0, "SELECT * FROM `transaction` where sent =0"

    move-object/from16 v1, p0

    invoke-interface {v1, v0}, Landroidx/sqlite/SQLiteConnection;->prepare(Ljava/lang/String;)Landroidx/sqlite/SQLiteStatement;

    move-result-object v2

    .line 1488
    .local v2, "_stmt":Landroidx/sqlite/SQLiteStatement;
    :try_start_0
    const-string v0, "Key"

    invoke-static {v2, v0}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v0

    .line 1489
    .local v0, "_columnIndexOfKey":I
    const-string v3, "Entry_No"

    invoke-static {v2, v3}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v3

    .line 1490
    .local v3, "_columnIndexOfEntryNo":I
    const-string v4, "No"

    invoke-static {v2, v4}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v4

    .line 1491
    .local v4, "_columnIndexOfNo":I
    const-string v5, "Date"

    invoke-static {v2, v5}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v5

    .line 1492
    .local v5, "_columnIndexOfDate":I
    const-string v6, "Type"

    invoke-static {v2, v6}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v6

    .line 1493
    .local v6, "_columnIndexOfType":I
    const-string v7, "transtype"

    invoke-static {v2, v7}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v7

    .line 1494
    .local v7, "_columnIndexOfTranstype":I
    const-string v8, "PayMode"

    invoke-static {v2, v8}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v8

    .line 1495
    .local v8, "_columnIndexOfPayMode":I
    const-string v9, "Pay_Mode"

    invoke-static {v2, v9}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v9

    .line 1496
    .local v9, "_columnIndexOfPayMode_1":I
    const-string v10, "Cheque_Deposit_Slip_No"

    invoke-static {v2, v10}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v10

    .line 1497
    .local v10, "_columnIndexOfChequeDepositSlipNo":I
    const-string v11, "Cheque_Deposit_Slip_Date"

    invoke-static {v2, v11}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v11

    .line 1498
    .local v11, "_columnIndexOfChequeDepositSlipDate":I
    const-string v12, "Bank_Code"

    invoke-static {v2, v12}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v12

    .line 1499
    .local v12, "_columnIndexOfBankCode":I
    const-string v13, "Received_From"

    invoke-static {v2, v13}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v13

    .line 1500
    .local v13, "_columnIndexOfReceivedFrom":I
    const-string v14, "On_Behalf_Of"

    invoke-static {v2, v14}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v14

    .line 1501
    .local v14, "_columnIndexOfOnBehalfOf":I
    const-string v15, "Cashier"

    invoke-static {v2, v15}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v15

    .line 1502
    .local v15, "_columnIndexOfCashier":I
    const-string v1, "Account_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1503
    .local v1, "_columnIndexOfAccountNo":I
    move/from16 v16, v1

    .end local v1    # "_columnIndexOfAccountNo":I
    .local v16, "_columnIndexOfAccountNo":I
    const-string v1, "Account_Name"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1504
    .local v1, "_columnIndexOfAccountName":I
    move/from16 v17, v1

    .end local v1    # "_columnIndexOfAccountName":I
    .local v17, "_columnIndexOfAccountName":I
    const-string v1, "Posted"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1505
    .local v1, "_columnIndexOfPosted":I
    move/from16 v18, v1

    .end local v1    # "_columnIndexOfPosted":I
    .local v18, "_columnIndexOfPosted":I
    const-string v1, "Date_Posted"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1506
    .local v1, "_columnIndexOfDatePosted":I
    move/from16 v19, v1

    .end local v1    # "_columnIndexOfDatePosted":I
    .local v19, "_columnIndexOfDatePosted":I
    const-string v1, "Time_Posted"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1507
    .local v1, "_columnIndexOfTimePosted":I
    move/from16 v20, v1

    .end local v1    # "_columnIndexOfTimePosted":I
    .local v20, "_columnIndexOfTimePosted":I
    const-string v1, "Posted_By"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1508
    .local v1, "_columnIndexOfPostedBy":I
    move/from16 v21, v1

    .end local v1    # "_columnIndexOfPostedBy":I
    .local v21, "_columnIndexOfPostedBy":I
    const-string v1, "Amount"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1509
    .local v1, "_columnIndexOfAmount":I
    move/from16 v22, v1

    .end local v1    # "_columnIndexOfAmount":I
    .local v22, "_columnIndexOfAmount":I
    const-string v1, "Remarks"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1510
    .local v1, "_columnIndexOfRemarks":I
    move/from16 v23, v1

    .end local v1    # "_columnIndexOfRemarks":I
    .local v23, "_columnIndexOfRemarks":I
    const-string v1, "Transaction_Name"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1511
    .local v1, "_columnIndexOfTransactionName":I
    move/from16 v24, v1

    .end local v1    # "_columnIndexOfTransactionName":I
    .local v24, "_columnIndexOfTransactionName":I
    const-string v1, "Branch_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1512
    .local v1, "_columnIndexOfBranchCode":I
    move/from16 v25, v1

    .end local v1    # "_columnIndexOfBranchCode":I
    .local v25, "_columnIndexOfBranchCode":I
    const-string v1, "Agent_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1513
    .local v1, "_columnIndexOfAgentCode":I
    move/from16 v26, v1

    .end local v1    # "_columnIndexOfAgentCode":I
    .local v26, "_columnIndexOfAgentCode":I
    const-string v1, "Grouping"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1514
    .local v1, "_columnIndexOfGrouping":I
    move/from16 v27, v1

    .end local v1    # "_columnIndexOfGrouping":I
    .local v27, "_columnIndexOfGrouping":I
    const-string v1, "Global_Dimension_1_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1515
    .local v1, "_columnIndexOfGlobalDimension1Code":I
    move/from16 v28, v1

    .end local v1    # "_columnIndexOfGlobalDimension1Code":I
    .local v28, "_columnIndexOfGlobalDimension1Code":I
    const-string v1, "Shortcut_Dimension_2_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1516
    .local v1, "_columnIndexOfShortcutDimension2Code":I
    move/from16 v29, v1

    .end local v1    # "_columnIndexOfShortcutDimension2Code":I
    .local v29, "_columnIndexOfShortcutDimension2Code":I
    const-string v1, "VAT_Percent"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1517
    .local v1, "_columnIndexOfVATPercent":I
    move/from16 v30, v1

    .end local v1    # "_columnIndexOfVATPercent":I
    .local v30, "_columnIndexOfVATPercent":I
    const-string v1, "Currency_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1518
    .local v1, "_columnIndexOfCurrencyCode":I
    move/from16 v31, v1

    .end local v1    # "_columnIndexOfCurrencyCode":I
    .local v31, "_columnIndexOfCurrencyCode":I
    const-string v1, "Currency_Factor"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1519
    .local v1, "_columnIndexOfCurrencyFactor":I
    move/from16 v32, v1

    .end local v1    # "_columnIndexOfCurrencyFactor":I
    .local v32, "_columnIndexOfCurrencyFactor":I
    const-string v1, "VAT_Bus_Posting_Group"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1520
    .local v1, "_columnIndexOfVATBusPostingGroup":I
    move/from16 v33, v1

    .end local v1    # "_columnIndexOfVATBusPostingGroup":I
    .local v33, "_columnIndexOfVATBusPostingGroup":I
    const-string v1, "VAT_Prod_Posting_Group"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1521
    .local v1, "_columnIndexOfVATProdPostingGroup":I
    move/from16 v34, v1

    .end local v1    # "_columnIndexOfVATProdPostingGroup":I
    .local v34, "_columnIndexOfVATProdPostingGroup":I
    const-string v1, "Gen_Posting_TypeSpecified"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1522
    .local v1, "_columnIndexOfGenPostingTypeSpecified":I
    move/from16 v35, v1

    .end local v1    # "_columnIndexOfGenPostingTypeSpecified":I
    .local v35, "_columnIndexOfGenPostingTypeSpecified":I
    const-string v1, "Gen_Bus_Posting_Group"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1523
    .local v1, "_columnIndexOfGenBusPostingGroup":I
    move/from16 v36, v1

    .end local v1    # "_columnIndexOfGenBusPostingGroup":I
    .local v36, "_columnIndexOfGenBusPostingGroup":I
    const-string v1, "Gen_Prod_Posting_Group"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1524
    .local v1, "_columnIndexOfGenProdPostingGroup":I
    move/from16 v37, v1

    .end local v1    # "_columnIndexOfGenProdPostingGroup":I
    .local v37, "_columnIndexOfGenProdPostingGroup":I
    const-string v1, "VAT_Amount"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1525
    .local v1, "_columnIndexOfVATAmount":I
    move/from16 v38, v1

    .end local v1    # "_columnIndexOfVATAmount":I
    .local v38, "_columnIndexOfVATAmount":I
    const-string v1, "Total_Amount"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1526
    .local v1, "_columnIndexOfTotalAmount":I
    move/from16 v39, v1

    .end local v1    # "_columnIndexOfTotalAmount":I
    .local v39, "_columnIndexOfTotalAmount":I
    const-string v1, "User_ID"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1527
    .local v1, "_columnIndexOfUserID":I
    move/from16 v40, v1

    .end local v1    # "_columnIndexOfUserID":I
    .local v40, "_columnIndexOfUserID":I
    const-string v1, "Apply_to"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1528
    .local v1, "_columnIndexOfApplyTo":I
    move/from16 v41, v1

    .end local v1    # "_columnIndexOfApplyTo":I
    .local v41, "_columnIndexOfApplyTo":I
    const-string v1, "Apply_to_ID"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1529
    .local v1, "_columnIndexOfApplyToID":I
    move/from16 v42, v1

    .end local v1    # "_columnIndexOfApplyToID":I
    .local v42, "_columnIndexOfApplyToID":I
    const-string v1, "Dest_Global_Dimension_1_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1530
    .local v1, "_columnIndexOfDestGlobalDimension1Code":I
    move/from16 v43, v1

    .end local v1    # "_columnIndexOfDestGlobalDimension1Code":I
    .local v43, "_columnIndexOfDestGlobalDimension1Code":I
    const-string v1, "Dest_Shortcut_Dimension_2_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1531
    .local v1, "_columnIndexOfDestShortcutDimension2Code":I
    move/from16 v44, v1

    .end local v1    # "_columnIndexOfDestShortcutDimension2Code":I
    .local v44, "_columnIndexOfDestShortcutDimension2Code":I
    const-string v1, "Line_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1532
    .local v1, "_columnIndexOfLineNo":I
    move/from16 v45, v1

    .end local v1    # "_columnIndexOfLineNo":I
    .local v45, "_columnIndexOfLineNo":I
    const-string v1, "Print_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1533
    .local v1, "_columnIndexOfPrintNo":I
    move/from16 v46, v1

    .end local v1    # "_columnIndexOfPrintNo":I
    .local v46, "_columnIndexOfPrintNo":I
    const-string v1, "Deposit_Slip_Time"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1534
    .local v1, "_columnIndexOfDepositSlipTime":I
    move/from16 v47, v1

    .end local v1    # "_columnIndexOfDepositSlipTime":I
    .local v47, "_columnIndexOfDepositSlipTime":I
    const-string v1, "Teller_ID"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1535
    .local v1, "_columnIndexOfTellerID":I
    move/from16 v48, v1

    .end local v1    # "_columnIndexOfTellerID":I
    .local v48, "_columnIndexOfTellerID":I
    const-string v1, "Customer_Payment_On_Account"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1536
    .local v1, "_columnIndexOfCustomerPaymentOnAccount":I
    move/from16 v49, v1

    .end local v1    # "_columnIndexOfCustomerPaymentOnAccount":I
    .local v49, "_columnIndexOfCustomerPaymentOnAccount":I
    const-string v1, "Select"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1537
    .local v1, "_columnIndexOfSelect":I
    move/from16 v50, v1

    .end local v1    # "_columnIndexOfSelect":I
    .local v50, "_columnIndexOfSelect":I
    const-string v1, "Batch_Posted"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1538
    .local v1, "_columnIndexOfBatchPosted":I
    move/from16 v51, v1

    .end local v1    # "_columnIndexOfBatchPosted":I
    .local v51, "_columnIndexOfBatchPosted":I
    const-string v1, "Transaction_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1539
    .local v1, "_columnIndexOfTransactionNo":I
    move/from16 v52, v1

    .end local v1    # "_columnIndexOfTransactionNo":I
    .local v52, "_columnIndexOfTransactionNo":I
    const-string v1, "Cheque_Deposit_Slip_Bank"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1540
    .local v1, "_columnIndexOfChequeDepositSlipBank":I
    move/from16 v53, v1

    .end local v1    # "_columnIndexOfChequeDepositSlipBank":I
    .local v53, "_columnIndexOfChequeDepositSlipBank":I
    const-string v1, "Bank_Account"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1541
    .local v1, "_columnIndexOfBankAccount":I
    move/from16 v54, v1

    .end local v1    # "_columnIndexOfBankAccount":I
    .local v54, "_columnIndexOfBankAccount":I
    const-string v1, "Confirmed"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1542
    .local v1, "_columnIndexOfConfirmed":I
    move/from16 v55, v1

    .end local v1    # "_columnIndexOfConfirmed":I
    .local v55, "_columnIndexOfConfirmed":I
    const-string v1, "Reconciled"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1543
    .local v1, "_columnIndexOfReconciled":I
    move/from16 v56, v1

    .end local v1    # "_columnIndexOfReconciled":I
    .local v56, "_columnIndexOfReconciled":I
    const-string v1, "Orig_Cashier"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1544
    .local v1, "_columnIndexOfOrigCashier":I
    move/from16 v57, v1

    .end local v1    # "_columnIndexOfOrigCashier":I
    .local v57, "_columnIndexOfOrigCashier":I
    const-string v1, "Cancelled"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1545
    .local v1, "_columnIndexOfCancelled":I
    move/from16 v58, v1

    .end local v1    # "_columnIndexOfCancelled":I
    .local v58, "_columnIndexOfCancelled":I
    const-string v1, "Cancelled_By"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1546
    .local v1, "_columnIndexOfCancelledBy":I
    move/from16 v59, v1

    .end local v1    # "_columnIndexOfCancelledBy":I
    .local v59, "_columnIndexOfCancelledBy":I
    const-string v1, "Cancelled_Date"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1547
    .local v1, "_columnIndexOfCancelledDate":I
    move/from16 v60, v1

    .end local v1    # "_columnIndexOfCancelledDate":I
    .local v60, "_columnIndexOfCancelledDate":I
    const-string v1, "Cancelled_Time"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1548
    .local v1, "_columnIndexOfCancelledTime":I
    move/from16 v61, v1

    .end local v1    # "_columnIndexOfCancelledTime":I
    .local v61, "_columnIndexOfCancelledTime":I
    const-string v1, "Post_Dated"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1549
    .local v1, "_columnIndexOfPostDated":I
    move/from16 v62, v1

    .end local v1    # "_columnIndexOfPostDated":I
    .local v62, "_columnIndexOfPostDated":I
    const-string v1, "Cheque_Retrieved"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1550
    .local v1, "_columnIndexOfChequeRetrieved":I
    move/from16 v63, v1

    .end local v1    # "_columnIndexOfChequeRetrieved":I
    .local v63, "_columnIndexOfChequeRetrieved":I
    const-string v1, "Register_Number"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1551
    .local v1, "_columnIndexOfRegisterNumber":I
    move/from16 v64, v1

    .end local v1    # "_columnIndexOfRegisterNumber":I
    .local v64, "_columnIndexOfRegisterNumber":I
    const-string v1, "From_Entry_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1552
    .local v1, "_columnIndexOfFromEntryNo":I
    move/from16 v65, v1

    .end local v1    # "_columnIndexOfFromEntryNo":I
    .local v65, "_columnIndexOfFromEntryNo":I
    const-string v1, "To_Entry_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1553
    .local v1, "_columnIndexOfToEntryNo":I
    move/from16 v66, v1

    .end local v1    # "_columnIndexOfToEntryNo":I
    .local v66, "_columnIndexOfToEntryNo":I
    const-string v1, "Batch_Posted_UserID"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1554
    .local v1, "_columnIndexOfBatchPostedUserID":I
    move/from16 v67, v1

    .end local v1    # "_columnIndexOfBatchPostedUserID":I
    .local v67, "_columnIndexOfBatchPostedUserID":I
    const-string v1, "BD_Register_Number"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1555
    .local v1, "_columnIndexOfBDRegisterNumber":I
    move/from16 v68, v1

    .end local v1    # "_columnIndexOfBDRegisterNumber":I
    .local v68, "_columnIndexOfBDRegisterNumber":I
    const-string v1, "BD_From_Number"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1556
    .local v1, "_columnIndexOfBDFromNumber":I
    move/from16 v69, v1

    .end local v1    # "_columnIndexOfBDFromNumber":I
    .local v69, "_columnIndexOfBDFromNumber":I
    const-string v1, "BD_To_Number"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1557
    .local v1, "_columnIndexOfBDToNumber":I
    move/from16 v70, v1

    .end local v1    # "_columnIndexOfBDToNumber":I
    .local v70, "_columnIndexOfBDToNumber":I
    const-string v1, "Reversal_By"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1558
    .local v1, "_columnIndexOfReversalBy":I
    move/from16 v71, v1

    .end local v1    # "_columnIndexOfReversalBy":I
    .local v71, "_columnIndexOfReversalBy":I
    const-string v1, "Reversal_Date"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1559
    .local v1, "_columnIndexOfReversalDate":I
    move/from16 v72, v1

    .end local v1    # "_columnIndexOfReversalDate":I
    .local v72, "_columnIndexOfReversalDate":I
    const-string v1, "Reversal_Time"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1560
    .local v1, "_columnIndexOfReversalTime":I
    move/from16 v73, v1

    .end local v1    # "_columnIndexOfReversalTime":I
    .local v73, "_columnIndexOfReversalTime":I
    const-string v1, "Reversal_Register_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1561
    .local v1, "_columnIndexOfReversalRegisterNo":I
    move/from16 v74, v1

    .end local v1    # "_columnIndexOfReversalRegisterNo":I
    .local v74, "_columnIndexOfReversalRegisterNo":I
    const-string v1, "Reversal_From_Entry_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1562
    .local v1, "_columnIndexOfReversalFromEntryNo":I
    move/from16 v75, v1

    .end local v1    # "_columnIndexOfReversalFromEntryNo":I
    .local v75, "_columnIndexOfReversalFromEntryNo":I
    const-string v1, "Reversal_To_Entry_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1563
    .local v1, "_columnIndexOfReversalToEntryNo":I
    move/from16 v76, v1

    .end local v1    # "_columnIndexOfReversalToEntryNo":I
    .local v76, "_columnIndexOfReversalToEntryNo":I
    const-string v1, "Reversed"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1564
    .local v1, "_columnIndexOfReversed":I
    move/from16 v77, v1

    .end local v1    # "_columnIndexOfReversed":I
    .local v77, "_columnIndexOfReversed":I
    const-string v1, "Applies_to_Doc_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1565
    .local v1, "_columnIndexOfAppliesToDocNo":I
    move/from16 v78, v1

    .end local v1    # "_columnIndexOfAppliesToDocNo":I
    .local v78, "_columnIndexOfAppliesToDocNo":I
    const-string v1, "Applies_to_ID"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1566
    .local v1, "_columnIndexOfAppliesToID":I
    move/from16 v79, v1

    .end local v1    # "_columnIndexOfAppliesToID":I
    .local v79, "_columnIndexOfAppliesToID":I
    const-string v1, "Grant_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1567
    .local v1, "_columnIndexOfGrantNo":I
    move/from16 v80, v1

    .end local v1    # "_columnIndexOfGrantNo":I
    .local v80, "_columnIndexOfGrantNo":I
    const-string v1, "Installment_Number"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1568
    .local v1, "_columnIndexOfInstallmentNumber":I
    move/from16 v81, v1

    .end local v1    # "_columnIndexOfInstallmentNumber":I
    .local v81, "_columnIndexOfInstallmentNumber":I
    const-string v1, "Next_Installment_Date"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1569
    .local v1, "_columnIndexOfNextInstallmentDate":I
    move/from16 v82, v1

    .end local v1    # "_columnIndexOfNextInstallmentDate":I
    .local v82, "_columnIndexOfNextInstallmentDate":I
    const-string v1, "Dimension_Set_ID"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1570
    .local v1, "_columnIndexOfDimensionSetID":I
    move/from16 v83, v1

    .end local v1    # "_columnIndexOfDimensionSetID":I
    .local v83, "_columnIndexOfDimensionSetID":I
    const-string v1, "Donor"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1571
    .local v1, "_columnIndexOfDonor":I
    move/from16 v84, v1

    .end local v1    # "_columnIndexOfDonor":I
    .local v84, "_columnIndexOfDonor":I
    const-string v1, "Group_Code"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1572
    .local v1, "_columnIndexOfGroupCode":I
    move/from16 v85, v1

    .end local v1    # "_columnIndexOfGroupCode":I
    .local v85, "_columnIndexOfGroupCode":I
    const-string v1, "Pre_ADM_Fines"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1573
    .local v1, "_columnIndexOfPreADMFines":I
    move/from16 v86, v1

    .end local v1    # "_columnIndexOfPreADMFines":I
    .local v86, "_columnIndexOfPreADMFines":I
    const-string v1, "Med_Fines"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1574
    .local v1, "_columnIndexOfMedFines":I
    move/from16 v87, v1

    .end local v1    # "_columnIndexOfMedFines":I
    .local v87, "_columnIndexOfMedFines":I
    const-string v1, "Loan_No"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1575
    .local v1, "_columnIndexOfLoanNo":I
    move/from16 v88, v1

    .end local v1    # "_columnIndexOfLoanNo":I
    .local v88, "_columnIndexOfLoanNo":I
    const-string v1, "Penalty"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1576
    .local v1, "_columnIndexOfPenalty":I
    move/from16 v89, v1

    .end local v1    # "_columnIndexOfPenalty":I
    .local v89, "_columnIndexOfPenalty":I
    const-string v1, "sent"

    invoke-static {v2, v1}, Landroidx/room/util/SQLiteStatementUtil;->getColumnIndexOrThrow(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 1577
    .local v1, "_columnIndexOfSent":I
    new-instance v90, Ljava/util/ArrayList;

    invoke-direct/range {v90 .. v90}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v91, v90

    .line 1578
    .local v91, "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    :goto_0
    invoke-interface {v2}, Landroidx/sqlite/SQLiteStatement;->step()Z

    move-result v90

    if-eqz v90, :cond_61

    .line 1580
    new-instance v90, Lcom/trimline/metrocrew/transaction;

    invoke-direct/range {v90 .. v90}, Lcom/trimline/metrocrew/transaction;-><init>()V

    move-object/from16 v92, v90

    .line 1581
    .local v92, "_item":Lcom/trimline/metrocrew/transaction;
    invoke-interface {v2, v0}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v90

    move/from16 v93, v1

    .end local v1    # "_columnIndexOfSent":I
    .local v93, "_columnIndexOfSent":I
    const/4 v1, 0x0

    if-eqz v90, :cond_0

    .line 1582
    move/from16 v90, v15

    move-object/from16 v15, v92

    .end local v92    # "_item":Lcom/trimline/metrocrew/transaction;
    .local v15, "_item":Lcom/trimline/metrocrew/transaction;
    .local v90, "_columnIndexOfCashier":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Key:Ljava/lang/String;

    goto :goto_1

    .line 1584
    .end local v90    # "_columnIndexOfCashier":I
    .local v15, "_columnIndexOfCashier":I
    .restart local v92    # "_item":Lcom/trimline/metrocrew/transaction;
    :cond_0
    move/from16 v90, v15

    move-object/from16 v15, v92

    .end local v92    # "_item":Lcom/trimline/metrocrew/transaction;
    .local v15, "_item":Lcom/trimline/metrocrew/transaction;
    .restart local v90    # "_columnIndexOfCashier":I
    invoke-interface {v2, v0}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Key:Ljava/lang/String;

    .line 1586
    :goto_1
    move v1, v13

    move/from16 v94, v14

    .end local v13    # "_columnIndexOfReceivedFrom":I
    .end local v14    # "_columnIndexOfOnBehalfOf":I
    .local v1, "_columnIndexOfReceivedFrom":I
    .local v94, "_columnIndexOfOnBehalfOf":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v13

    long-to-int v13, v13

    iput v13, v15, Lcom/trimline/metrocrew/transaction;->Entry_No:I

    .line 1587
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_1

    .line 1588
    const/4 v13, 0x0

    iput-object v13, v15, Lcom/trimline/metrocrew/transaction;->No:Ljava/lang/String;

    goto :goto_2

    .line 1590
    :cond_1
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v13

    iput-object v13, v15, Lcom/trimline/metrocrew/transaction;->No:Ljava/lang/String;

    .line 1593
    :goto_2
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 1594
    const/4 v13, 0x0

    .local v13, "_tmp":Ljava/lang/Long;
    goto :goto_3

    .line 1596
    .end local v13    # "_tmp":Ljava/lang/Long;
    :cond_2
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v13

    invoke-static {v13, v14}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    .line 1598
    .restart local v13    # "_tmp":Ljava/lang/Long;
    :goto_3
    invoke-static {v13}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v14

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Date:Ljava/sql/Date;

    .line 1599
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 1600
    const/4 v14, 0x0

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Type:Ljava/lang/String;

    goto :goto_4

    .line 1602
    :cond_3
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Type:Ljava/lang/String;

    .line 1604
    :goto_4
    invoke-interface {v2, v7}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 1605
    const/4 v14, 0x0

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    goto :goto_5

    .line 1607
    :cond_4
    invoke-interface {v2, v7}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    .line 1609
    :goto_5
    invoke-interface {v2, v8}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_5

    .line 1610
    const/4 v14, 0x0

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->PayMode:Ljava/lang/String;

    goto :goto_6

    .line 1612
    :cond_5
    invoke-interface {v2, v8}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->PayMode:Ljava/lang/String;

    .line 1614
    :goto_6
    invoke-interface {v2, v9}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_6

    .line 1615
    const/4 v14, 0x0

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Pay_Mode:Ljava/lang/String;

    goto :goto_7

    .line 1617
    :cond_6
    invoke-interface {v2, v9}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Pay_Mode:Ljava/lang/String;

    .line 1619
    :goto_7
    invoke-interface {v2, v10}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_7

    .line 1620
    const/4 v14, 0x0

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_No:Ljava/lang/String;

    goto :goto_8

    .line 1622
    :cond_7
    invoke-interface {v2, v10}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v15, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_No:Ljava/lang/String;

    .line 1625
    :goto_8
    invoke-interface {v2, v11}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v14

    if-eqz v14, :cond_8

    .line 1626
    const/4 v14, 0x0

    .local v14, "_tmp_1":Ljava/lang/Long;
    goto :goto_9

    .line 1628
    .end local v14    # "_tmp_1":Ljava/lang/Long;
    :cond_8
    invoke-interface {v2, v11}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v95

    invoke-static/range {v95 .. v96}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    .line 1630
    .restart local v14    # "_tmp_1":Ljava/lang/Long;
    :goto_9
    move/from16 v95, v1

    .end local v1    # "_columnIndexOfReceivedFrom":I
    .local v95, "_columnIndexOfReceivedFrom":I
    invoke-static {v14}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_Date:Ljava/sql/Date;

    .line 1631
    invoke-interface {v2, v12}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 1632
    const/4 v1, 0x0

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Bank_Code:Ljava/lang/String;

    goto :goto_a

    .line 1634
    :cond_9
    invoke-interface {v2, v12}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Bank_Code:Ljava/lang/String;

    .line 1636
    :goto_a
    move/from16 v1, v95

    .end local v95    # "_columnIndexOfReceivedFrom":I
    .restart local v1    # "_columnIndexOfReceivedFrom":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v95

    if-eqz v95, :cond_a

    .line 1637
    move/from16 v95, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfEntryNo":I
    .local v95, "_columnIndexOfEntryNo":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Received_From:Ljava/lang/String;

    goto :goto_b

    .line 1639
    .end local v95    # "_columnIndexOfEntryNo":I
    .restart local v3    # "_columnIndexOfEntryNo":I
    :cond_a
    move/from16 v95, v3

    .end local v3    # "_columnIndexOfEntryNo":I
    .restart local v95    # "_columnIndexOfEntryNo":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Received_From:Ljava/lang/String;

    .line 1641
    :goto_b
    move/from16 v3, v94

    .end local v94    # "_columnIndexOfOnBehalfOf":I
    .local v3, "_columnIndexOfOnBehalfOf":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v94

    if-eqz v94, :cond_b

    .line 1642
    move/from16 v94, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfReceivedFrom":I
    .local v94, "_columnIndexOfReceivedFrom":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->On_Behalf_Of:Ljava/lang/String;

    goto :goto_c

    .line 1644
    .end local v94    # "_columnIndexOfReceivedFrom":I
    .restart local v1    # "_columnIndexOfReceivedFrom":I
    :cond_b
    move/from16 v94, v1

    .end local v1    # "_columnIndexOfReceivedFrom":I
    .restart local v94    # "_columnIndexOfReceivedFrom":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->On_Behalf_Of:Ljava/lang/String;

    .line 1646
    :goto_c
    move/from16 v1, v90

    .end local v90    # "_columnIndexOfCashier":I
    .local v1, "_columnIndexOfCashier":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v90

    if-eqz v90, :cond_c

    .line 1647
    move/from16 v90, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfOnBehalfOf":I
    .local v90, "_columnIndexOfOnBehalfOf":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Cashier:Ljava/lang/String;

    goto :goto_d

    .line 1649
    .end local v90    # "_columnIndexOfOnBehalfOf":I
    .restart local v3    # "_columnIndexOfOnBehalfOf":I
    :cond_c
    move/from16 v90, v3

    .end local v3    # "_columnIndexOfOnBehalfOf":I
    .restart local v90    # "_columnIndexOfOnBehalfOf":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Cashier:Ljava/lang/String;

    .line 1651
    :goto_d
    move/from16 v3, v16

    .end local v16    # "_columnIndexOfAccountNo":I
    .local v3, "_columnIndexOfAccountNo":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v16

    if-eqz v16, :cond_d

    .line 1652
    move/from16 v16, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfCashier":I
    .local v16, "_columnIndexOfCashier":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Account_No:Ljava/lang/String;

    goto :goto_e

    .line 1654
    .end local v16    # "_columnIndexOfCashier":I
    .restart local v1    # "_columnIndexOfCashier":I
    :cond_d
    move/from16 v16, v1

    .end local v1    # "_columnIndexOfCashier":I
    .restart local v16    # "_columnIndexOfCashier":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Account_No:Ljava/lang/String;

    .line 1656
    :goto_e
    move/from16 v1, v17

    .end local v17    # "_columnIndexOfAccountName":I
    .local v1, "_columnIndexOfAccountName":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v17

    if-eqz v17, :cond_e

    .line 1657
    move/from16 v17, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfAccountNo":I
    .local v17, "_columnIndexOfAccountNo":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Account_Name:Ljava/lang/String;

    goto :goto_f

    .line 1659
    .end local v17    # "_columnIndexOfAccountNo":I
    .restart local v3    # "_columnIndexOfAccountNo":I
    :cond_e
    move/from16 v17, v3

    .end local v3    # "_columnIndexOfAccountNo":I
    .restart local v17    # "_columnIndexOfAccountNo":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Account_Name:Ljava/lang/String;

    .line 1662
    :goto_f
    move/from16 v3, v18

    .end local v18    # "_columnIndexOfPosted":I
    .local v3, "_columnIndexOfPosted":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v18

    if-eqz v18, :cond_f

    .line 1663
    const/16 v18, 0x0

    move-object/from16 v96, v18

    move/from16 v18, v4

    move-object/from16 v4, v96

    move/from16 v96, v5

    .local v18, "_tmp_2":Ljava/lang/Integer;
    goto :goto_10

    .line 1665
    .end local v18    # "_tmp_2":Ljava/lang/Integer;
    :cond_f
    move/from16 v18, v4

    move/from16 v96, v5

    .end local v4    # "_columnIndexOfNo":I
    .end local v5    # "_columnIndexOfDate":I
    .local v18, "_columnIndexOfNo":I
    .local v96, "_columnIndexOfDate":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v4

    long-to-int v4, v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 1667
    .local v4, "_tmp_2":Ljava/lang/Integer;
    :goto_10
    const/16 v97, 0x0

    if-nez v4, :cond_10

    const/4 v5, 0x0

    goto :goto_12

    :cond_10
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v98

    if-eqz v98, :cond_11

    const/16 v98, 0x1

    goto :goto_11

    :cond_11
    move/from16 v98, v97

    :goto_11
    invoke-static/range {v98 .. v98}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v98

    move-object/from16 v5, v98

    :goto_12
    iput-object v5, v15, Lcom/trimline/metrocrew/transaction;->Posted:Ljava/lang/Boolean;

    .line 1669
    move/from16 v5, v19

    .end local v19    # "_columnIndexOfDatePosted":I
    .local v5, "_columnIndexOfDatePosted":I
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v19

    if-eqz v19, :cond_12

    .line 1670
    const/16 v19, 0x0

    .local v19, "_tmp_3":Ljava/lang/Long;
    goto :goto_13

    .line 1672
    .end local v19    # "_tmp_3":Ljava/lang/Long;
    :cond_12
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v99

    invoke-static/range {v99 .. v100}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    .line 1674
    .restart local v19    # "_tmp_3":Ljava/lang/Long;
    :goto_13
    move/from16 v98, v1

    .end local v1    # "_columnIndexOfAccountName":I
    .local v98, "_columnIndexOfAccountName":I
    invoke-static/range {v19 .. v19}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Date_Posted:Ljava/sql/Date;

    .line 1676
    move/from16 v1, v20

    .end local v20    # "_columnIndexOfTimePosted":I
    .local v1, "_columnIndexOfTimePosted":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v20

    if-eqz v20, :cond_13

    .line 1677
    const/16 v20, 0x0

    .local v20, "_tmp_4":Ljava/lang/Long;
    goto :goto_14

    .line 1679
    .end local v20    # "_tmp_4":Ljava/lang/Long;
    :cond_13
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v99

    invoke-static/range {v99 .. v100}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v20

    .line 1681
    .restart local v20    # "_tmp_4":Ljava/lang/Long;
    :goto_14
    move/from16 v99, v1

    .end local v1    # "_columnIndexOfTimePosted":I
    .local v99, "_columnIndexOfTimePosted":I
    invoke-static/range {v20 .. v20}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Time_Posted:Ljava/sql/Date;

    .line 1682
    move/from16 v1, v21

    .end local v21    # "_columnIndexOfPostedBy":I
    .local v1, "_columnIndexOfPostedBy":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v21

    if-eqz v21, :cond_14

    .line 1683
    move/from16 v21, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfPosted":I
    .local v21, "_columnIndexOfPosted":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Posted_By:Ljava/lang/String;

    goto :goto_15

    .line 1685
    .end local v21    # "_columnIndexOfPosted":I
    .restart local v3    # "_columnIndexOfPosted":I
    :cond_14
    move/from16 v21, v3

    .end local v3    # "_columnIndexOfPosted":I
    .restart local v21    # "_columnIndexOfPosted":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Posted_By:Ljava/lang/String;

    .line 1687
    :goto_15
    move/from16 v3, v22

    .end local v22    # "_columnIndexOfAmount":I
    .local v3, "_columnIndexOfAmount":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v22

    if-eqz v22, :cond_15

    .line 1688
    move/from16 v22, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfPostedBy":I
    .local v22, "_columnIndexOfPostedBy":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Amount:Ljava/lang/Double;

    goto :goto_16

    .line 1690
    .end local v22    # "_columnIndexOfPostedBy":I
    .restart local v1    # "_columnIndexOfPostedBy":I
    :cond_15
    move/from16 v22, v1

    .end local v1    # "_columnIndexOfPostedBy":I
    .restart local v22    # "_columnIndexOfPostedBy":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v100

    invoke-static/range {v100 .. v101}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Amount:Ljava/lang/Double;

    .line 1692
    :goto_16
    move/from16 v1, v23

    .end local v23    # "_columnIndexOfRemarks":I
    .local v1, "_columnIndexOfRemarks":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v23

    if-eqz v23, :cond_16

    .line 1693
    move/from16 v23, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfAmount":I
    .local v23, "_columnIndexOfAmount":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Remarks:Ljava/lang/String;

    goto :goto_17

    .line 1695
    .end local v23    # "_columnIndexOfAmount":I
    .restart local v3    # "_columnIndexOfAmount":I
    :cond_16
    move/from16 v23, v3

    .end local v3    # "_columnIndexOfAmount":I
    .restart local v23    # "_columnIndexOfAmount":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Remarks:Ljava/lang/String;

    .line 1697
    :goto_17
    move/from16 v3, v24

    .end local v24    # "_columnIndexOfTransactionName":I
    .local v3, "_columnIndexOfTransactionName":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v24

    if-eqz v24, :cond_17

    .line 1698
    move/from16 v24, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfRemarks":I
    .local v24, "_columnIndexOfRemarks":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Transaction_Name:Ljava/lang/String;

    goto :goto_18

    .line 1700
    .end local v24    # "_columnIndexOfRemarks":I
    .restart local v1    # "_columnIndexOfRemarks":I
    :cond_17
    move/from16 v24, v1

    .end local v1    # "_columnIndexOfRemarks":I
    .restart local v24    # "_columnIndexOfRemarks":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Transaction_Name:Ljava/lang/String;

    .line 1702
    :goto_18
    move/from16 v1, v25

    .end local v25    # "_columnIndexOfBranchCode":I
    .local v1, "_columnIndexOfBranchCode":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v25

    if-eqz v25, :cond_18

    .line 1703
    move/from16 v25, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfTransactionName":I
    .local v25, "_columnIndexOfTransactionName":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Branch_Code:Ljava/lang/String;

    goto :goto_19

    .line 1705
    .end local v25    # "_columnIndexOfTransactionName":I
    .restart local v3    # "_columnIndexOfTransactionName":I
    :cond_18
    move/from16 v25, v3

    .end local v3    # "_columnIndexOfTransactionName":I
    .restart local v25    # "_columnIndexOfTransactionName":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Branch_Code:Ljava/lang/String;

    .line 1707
    :goto_19
    move/from16 v3, v26

    .end local v26    # "_columnIndexOfAgentCode":I
    .local v3, "_columnIndexOfAgentCode":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v26

    if-eqz v26, :cond_19

    .line 1708
    move/from16 v26, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfBranchCode":I
    .local v26, "_columnIndexOfBranchCode":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Agent_Code:Ljava/lang/String;

    goto :goto_1a

    .line 1710
    .end local v26    # "_columnIndexOfBranchCode":I
    .restart local v1    # "_columnIndexOfBranchCode":I
    :cond_19
    move/from16 v26, v1

    .end local v1    # "_columnIndexOfBranchCode":I
    .restart local v26    # "_columnIndexOfBranchCode":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Agent_Code:Ljava/lang/String;

    .line 1712
    :goto_1a
    move/from16 v1, v27

    .end local v27    # "_columnIndexOfGrouping":I
    .local v1, "_columnIndexOfGrouping":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v27

    if-eqz v27, :cond_1a

    .line 1713
    move/from16 v27, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfAgentCode":I
    .local v27, "_columnIndexOfAgentCode":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Grouping:Ljava/lang/String;

    goto :goto_1b

    .line 1715
    .end local v27    # "_columnIndexOfAgentCode":I
    .restart local v3    # "_columnIndexOfAgentCode":I
    :cond_1a
    move/from16 v27, v3

    .end local v3    # "_columnIndexOfAgentCode":I
    .restart local v27    # "_columnIndexOfAgentCode":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Grouping:Ljava/lang/String;

    .line 1717
    :goto_1b
    move/from16 v3, v28

    .end local v28    # "_columnIndexOfGlobalDimension1Code":I
    .local v3, "_columnIndexOfGlobalDimension1Code":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v28

    if-eqz v28, :cond_1b

    .line 1718
    move/from16 v28, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfGrouping":I
    .local v28, "_columnIndexOfGrouping":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Global_Dimension_1_Code:Ljava/lang/String;

    goto :goto_1c

    .line 1720
    .end local v28    # "_columnIndexOfGrouping":I
    .restart local v1    # "_columnIndexOfGrouping":I
    :cond_1b
    move/from16 v28, v1

    .end local v1    # "_columnIndexOfGrouping":I
    .restart local v28    # "_columnIndexOfGrouping":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Global_Dimension_1_Code:Ljava/lang/String;

    .line 1722
    :goto_1c
    move/from16 v1, v29

    .end local v29    # "_columnIndexOfShortcutDimension2Code":I
    .local v1, "_columnIndexOfShortcutDimension2Code":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v29

    if-eqz v29, :cond_1c

    .line 1723
    move/from16 v29, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfGlobalDimension1Code":I
    .local v29, "_columnIndexOfGlobalDimension1Code":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Shortcut_Dimension_2_Code:Ljava/lang/String;

    goto :goto_1d

    .line 1725
    .end local v29    # "_columnIndexOfGlobalDimension1Code":I
    .restart local v3    # "_columnIndexOfGlobalDimension1Code":I
    :cond_1c
    move/from16 v29, v3

    .end local v3    # "_columnIndexOfGlobalDimension1Code":I
    .restart local v29    # "_columnIndexOfGlobalDimension1Code":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Shortcut_Dimension_2_Code:Ljava/lang/String;

    .line 1727
    :goto_1d
    move/from16 v3, v30

    .end local v30    # "_columnIndexOfVATPercent":I
    .local v3, "_columnIndexOfVATPercent":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v30

    if-eqz v30, :cond_1d

    .line 1728
    move/from16 v30, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfShortcutDimension2Code":I
    .local v30, "_columnIndexOfShortcutDimension2Code":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->VAT_Percent:Ljava/lang/Double;

    goto :goto_1e

    .line 1730
    .end local v30    # "_columnIndexOfShortcutDimension2Code":I
    .restart local v1    # "_columnIndexOfShortcutDimension2Code":I
    :cond_1d
    move/from16 v30, v1

    .end local v1    # "_columnIndexOfShortcutDimension2Code":I
    .restart local v30    # "_columnIndexOfShortcutDimension2Code":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v100

    invoke-static/range {v100 .. v101}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->VAT_Percent:Ljava/lang/Double;

    .line 1732
    :goto_1e
    move/from16 v1, v31

    .end local v31    # "_columnIndexOfCurrencyCode":I
    .local v1, "_columnIndexOfCurrencyCode":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v31

    if-eqz v31, :cond_1e

    .line 1733
    move/from16 v31, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfVATPercent":I
    .local v31, "_columnIndexOfVATPercent":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Currency_Code:Ljava/lang/String;

    goto :goto_1f

    .line 1735
    .end local v31    # "_columnIndexOfVATPercent":I
    .restart local v3    # "_columnIndexOfVATPercent":I
    :cond_1e
    move/from16 v31, v3

    .end local v3    # "_columnIndexOfVATPercent":I
    .restart local v31    # "_columnIndexOfVATPercent":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Currency_Code:Ljava/lang/String;

    .line 1737
    :goto_1f
    move/from16 v3, v32

    .end local v32    # "_columnIndexOfCurrencyFactor":I
    .local v3, "_columnIndexOfCurrencyFactor":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v32

    if-eqz v32, :cond_1f

    .line 1738
    move/from16 v32, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfCurrencyCode":I
    .local v32, "_columnIndexOfCurrencyCode":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Currency_Factor:Ljava/lang/Double;

    goto :goto_20

    .line 1740
    .end local v32    # "_columnIndexOfCurrencyCode":I
    .restart local v1    # "_columnIndexOfCurrencyCode":I
    :cond_1f
    move/from16 v32, v1

    .end local v1    # "_columnIndexOfCurrencyCode":I
    .restart local v32    # "_columnIndexOfCurrencyCode":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v100

    invoke-static/range {v100 .. v101}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Currency_Factor:Ljava/lang/Double;

    .line 1742
    :goto_20
    move/from16 v1, v33

    .end local v33    # "_columnIndexOfVATBusPostingGroup":I
    .local v1, "_columnIndexOfVATBusPostingGroup":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v33

    if-eqz v33, :cond_20

    .line 1743
    move/from16 v33, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfCurrencyFactor":I
    .local v33, "_columnIndexOfCurrencyFactor":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->VAT_Bus_Posting_Group:Ljava/lang/String;

    goto :goto_21

    .line 1745
    .end local v33    # "_columnIndexOfCurrencyFactor":I
    .restart local v3    # "_columnIndexOfCurrencyFactor":I
    :cond_20
    move/from16 v33, v3

    .end local v3    # "_columnIndexOfCurrencyFactor":I
    .restart local v33    # "_columnIndexOfCurrencyFactor":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->VAT_Bus_Posting_Group:Ljava/lang/String;

    .line 1747
    :goto_21
    move/from16 v3, v34

    .end local v34    # "_columnIndexOfVATProdPostingGroup":I
    .local v3, "_columnIndexOfVATProdPostingGroup":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v34

    if-eqz v34, :cond_21

    .line 1748
    move/from16 v34, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfVATBusPostingGroup":I
    .local v34, "_columnIndexOfVATBusPostingGroup":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->VAT_Prod_Posting_Group:Ljava/lang/String;

    goto :goto_22

    .line 1750
    .end local v34    # "_columnIndexOfVATBusPostingGroup":I
    .restart local v1    # "_columnIndexOfVATBusPostingGroup":I
    :cond_21
    move/from16 v34, v1

    .end local v1    # "_columnIndexOfVATBusPostingGroup":I
    .restart local v34    # "_columnIndexOfVATBusPostingGroup":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->VAT_Prod_Posting_Group:Ljava/lang/String;

    .line 1753
    :goto_22
    move/from16 v1, v35

    .end local v35    # "_columnIndexOfGenPostingTypeSpecified":I
    .local v1, "_columnIndexOfGenPostingTypeSpecified":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v35

    if-eqz v35, :cond_22

    .line 1754
    const/16 v35, 0x0

    move/from16 v100, v3

    move-object/from16 v3, v35

    move-object/from16 v35, v4

    .local v35, "_tmp_5":Ljava/lang/Integer;
    goto :goto_23

    .line 1756
    .end local v35    # "_tmp_5":Ljava/lang/Integer;
    :cond_22
    move/from16 v100, v3

    move-object/from16 v35, v4

    .end local v3    # "_columnIndexOfVATProdPostingGroup":I
    .end local v4    # "_tmp_2":Ljava/lang/Integer;
    .local v35, "_tmp_2":Ljava/lang/Integer;
    .local v100, "_columnIndexOfVATProdPostingGroup":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 1758
    .local v3, "_tmp_5":Ljava/lang/Integer;
    :goto_23
    if-nez v3, :cond_23

    const/4 v4, 0x0

    goto :goto_25

    :cond_23
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_24

    const/4 v4, 0x1

    goto :goto_24

    :cond_24
    move/from16 v4, v97

    :goto_24
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    :goto_25
    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Gen_Posting_TypeSpecified:Ljava/lang/Boolean;

    .line 1759
    move/from16 v4, v36

    .end local v36    # "_columnIndexOfGenBusPostingGroup":I
    .local v4, "_columnIndexOfGenBusPostingGroup":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v36

    if-eqz v36, :cond_25

    .line 1760
    move/from16 v36, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfGenPostingTypeSpecified":I
    .local v36, "_columnIndexOfGenPostingTypeSpecified":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Gen_Bus_Posting_Group:Ljava/lang/String;

    goto :goto_26

    .line 1762
    .end local v36    # "_columnIndexOfGenPostingTypeSpecified":I
    .restart local v1    # "_columnIndexOfGenPostingTypeSpecified":I
    :cond_25
    move/from16 v36, v1

    .end local v1    # "_columnIndexOfGenPostingTypeSpecified":I
    .restart local v36    # "_columnIndexOfGenPostingTypeSpecified":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Gen_Bus_Posting_Group:Ljava/lang/String;

    .line 1764
    :goto_26
    move/from16 v1, v37

    .end local v37    # "_columnIndexOfGenProdPostingGroup":I
    .local v1, "_columnIndexOfGenProdPostingGroup":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v37

    if-eqz v37, :cond_26

    .line 1765
    move-object/from16 v37, v3

    const/4 v3, 0x0

    .end local v3    # "_tmp_5":Ljava/lang/Integer;
    .local v37, "_tmp_5":Ljava/lang/Integer;
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Gen_Prod_Posting_Group:Ljava/lang/String;

    goto :goto_27

    .line 1767
    .end local v37    # "_tmp_5":Ljava/lang/Integer;
    .restart local v3    # "_tmp_5":Ljava/lang/Integer;
    :cond_26
    move-object/from16 v37, v3

    .end local v3    # "_tmp_5":Ljava/lang/Integer;
    .restart local v37    # "_tmp_5":Ljava/lang/Integer;
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Gen_Prod_Posting_Group:Ljava/lang/String;

    .line 1769
    :goto_27
    move/from16 v3, v38

    .end local v38    # "_columnIndexOfVATAmount":I
    .local v3, "_columnIndexOfVATAmount":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v38

    if-eqz v38, :cond_27

    .line 1770
    move/from16 v38, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfGenProdPostingGroup":I
    .local v38, "_columnIndexOfGenProdPostingGroup":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->VAT_Amount:Ljava/lang/Double;

    goto :goto_28

    .line 1772
    .end local v38    # "_columnIndexOfGenProdPostingGroup":I
    .restart local v1    # "_columnIndexOfGenProdPostingGroup":I
    :cond_27
    move/from16 v38, v1

    .end local v1    # "_columnIndexOfGenProdPostingGroup":I
    .restart local v38    # "_columnIndexOfGenProdPostingGroup":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v101

    invoke-static/range {v101 .. v102}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->VAT_Amount:Ljava/lang/Double;

    .line 1774
    :goto_28
    move/from16 v1, v39

    .end local v39    # "_columnIndexOfTotalAmount":I
    .local v1, "_columnIndexOfTotalAmount":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v39

    if-eqz v39, :cond_28

    .line 1775
    move/from16 v39, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfVATAmount":I
    .local v39, "_columnIndexOfVATAmount":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Total_Amount:Ljava/lang/Double;

    goto :goto_29

    .line 1777
    .end local v39    # "_columnIndexOfVATAmount":I
    .restart local v3    # "_columnIndexOfVATAmount":I
    :cond_28
    move/from16 v39, v3

    .end local v3    # "_columnIndexOfVATAmount":I
    .restart local v39    # "_columnIndexOfVATAmount":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v101

    invoke-static/range {v101 .. v102}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Total_Amount:Ljava/lang/Double;

    .line 1779
    :goto_29
    move/from16 v3, v40

    .end local v40    # "_columnIndexOfUserID":I
    .local v3, "_columnIndexOfUserID":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v40

    if-eqz v40, :cond_29

    .line 1780
    move/from16 v40, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfTotalAmount":I
    .local v40, "_columnIndexOfTotalAmount":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->User_ID:Ljava/lang/String;

    goto :goto_2a

    .line 1782
    .end local v40    # "_columnIndexOfTotalAmount":I
    .restart local v1    # "_columnIndexOfTotalAmount":I
    :cond_29
    move/from16 v40, v1

    .end local v1    # "_columnIndexOfTotalAmount":I
    .restart local v40    # "_columnIndexOfTotalAmount":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->User_ID:Ljava/lang/String;

    .line 1784
    :goto_2a
    move/from16 v1, v41

    .end local v41    # "_columnIndexOfApplyTo":I
    .local v1, "_columnIndexOfApplyTo":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v41

    if-eqz v41, :cond_2a

    .line 1785
    move/from16 v41, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfUserID":I
    .local v41, "_columnIndexOfUserID":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Apply_to:Ljava/lang/String;

    goto :goto_2b

    .line 1787
    .end local v41    # "_columnIndexOfUserID":I
    .restart local v3    # "_columnIndexOfUserID":I
    :cond_2a
    move/from16 v41, v3

    .end local v3    # "_columnIndexOfUserID":I
    .restart local v41    # "_columnIndexOfUserID":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Apply_to:Ljava/lang/String;

    .line 1789
    :goto_2b
    move/from16 v3, v42

    .end local v42    # "_columnIndexOfApplyToID":I
    .local v3, "_columnIndexOfApplyToID":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v42

    if-eqz v42, :cond_2b

    .line 1790
    move/from16 v42, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfApplyTo":I
    .local v42, "_columnIndexOfApplyTo":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Apply_to_ID:Ljava/lang/String;

    goto :goto_2c

    .line 1792
    .end local v42    # "_columnIndexOfApplyTo":I
    .restart local v1    # "_columnIndexOfApplyTo":I
    :cond_2b
    move/from16 v42, v1

    .end local v1    # "_columnIndexOfApplyTo":I
    .restart local v42    # "_columnIndexOfApplyTo":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Apply_to_ID:Ljava/lang/String;

    .line 1794
    :goto_2c
    move/from16 v1, v43

    .end local v43    # "_columnIndexOfDestGlobalDimension1Code":I
    .local v1, "_columnIndexOfDestGlobalDimension1Code":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v43

    if-eqz v43, :cond_2c

    .line 1795
    move/from16 v43, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfApplyToID":I
    .local v43, "_columnIndexOfApplyToID":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Dest_Global_Dimension_1_Code:Ljava/lang/String;

    goto :goto_2d

    .line 1797
    .end local v43    # "_columnIndexOfApplyToID":I
    .restart local v3    # "_columnIndexOfApplyToID":I
    :cond_2c
    move/from16 v43, v3

    .end local v3    # "_columnIndexOfApplyToID":I
    .restart local v43    # "_columnIndexOfApplyToID":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Dest_Global_Dimension_1_Code:Ljava/lang/String;

    .line 1799
    :goto_2d
    move/from16 v3, v44

    .end local v44    # "_columnIndexOfDestShortcutDimension2Code":I
    .local v3, "_columnIndexOfDestShortcutDimension2Code":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v44

    if-eqz v44, :cond_2d

    .line 1800
    move/from16 v44, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfDestGlobalDimension1Code":I
    .local v44, "_columnIndexOfDestGlobalDimension1Code":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Dest_Shortcut_Dimension_2_Code:Ljava/lang/String;

    goto :goto_2e

    .line 1802
    .end local v44    # "_columnIndexOfDestGlobalDimension1Code":I
    .restart local v1    # "_columnIndexOfDestGlobalDimension1Code":I
    :cond_2d
    move/from16 v44, v1

    .end local v1    # "_columnIndexOfDestGlobalDimension1Code":I
    .restart local v44    # "_columnIndexOfDestGlobalDimension1Code":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Dest_Shortcut_Dimension_2_Code:Ljava/lang/String;

    .line 1804
    :goto_2e
    move/from16 v101, v3

    move/from16 v1, v45

    move/from16 v45, v4

    .end local v3    # "_columnIndexOfDestShortcutDimension2Code":I
    .end local v4    # "_columnIndexOfGenBusPostingGroup":I
    .local v1, "_columnIndexOfLineNo":I
    .local v45, "_columnIndexOfGenBusPostingGroup":I
    .local v101, "_columnIndexOfDestShortcutDimension2Code":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    iput v3, v15, Lcom/trimline/metrocrew/transaction;->Line_No:I

    .line 1805
    move/from16 v3, v46

    move/from16 v46, v5

    .end local v5    # "_columnIndexOfDatePosted":I
    .local v3, "_columnIndexOfPrintNo":I
    .local v46, "_columnIndexOfDatePosted":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, v15, Lcom/trimline/metrocrew/transaction;->Print_No:I

    .line 1807
    move/from16 v4, v47

    .end local v47    # "_columnIndexOfDepositSlipTime":I
    .local v4, "_columnIndexOfDepositSlipTime":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v5

    if-eqz v5, :cond_2e

    .line 1808
    const/4 v5, 0x0

    .local v5, "_tmp_6":Ljava/lang/Long;
    goto :goto_2f

    .line 1810
    .end local v5    # "_tmp_6":Ljava/lang/Long;
    :cond_2e
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v102

    invoke-static/range {v102 .. v103}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    .line 1812
    .restart local v5    # "_tmp_6":Ljava/lang/Long;
    :goto_2f
    move/from16 v47, v1

    .end local v1    # "_columnIndexOfLineNo":I
    .local v47, "_columnIndexOfLineNo":I
    invoke-static {v5}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Deposit_Slip_Time:Ljava/sql/Date;

    .line 1813
    move/from16 v1, v48

    .end local v48    # "_columnIndexOfTellerID":I
    .local v1, "_columnIndexOfTellerID":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v48

    if-eqz v48, :cond_2f

    .line 1814
    move/from16 v48, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfPrintNo":I
    .local v48, "_columnIndexOfPrintNo":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Teller_ID:Ljava/lang/String;

    goto :goto_30

    .line 1816
    .end local v48    # "_columnIndexOfPrintNo":I
    .restart local v3    # "_columnIndexOfPrintNo":I
    :cond_2f
    move/from16 v48, v3

    .end local v3    # "_columnIndexOfPrintNo":I
    .restart local v48    # "_columnIndexOfPrintNo":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Teller_ID:Ljava/lang/String;

    .line 1819
    :goto_30
    move/from16 v3, v49

    .end local v49    # "_columnIndexOfCustomerPaymentOnAccount":I
    .local v3, "_columnIndexOfCustomerPaymentOnAccount":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v49

    if-eqz v49, :cond_30

    .line 1820
    const/16 v49, 0x0

    move-object/from16 v102, v49

    move/from16 v49, v4

    move-object/from16 v4, v102

    move-object/from16 v102, v5

    .local v49, "_tmp_7":Ljava/lang/Integer;
    goto :goto_31

    .line 1822
    .end local v49    # "_tmp_7":Ljava/lang/Integer;
    :cond_30
    move/from16 v49, v4

    move-object/from16 v102, v5

    .end local v4    # "_columnIndexOfDepositSlipTime":I
    .end local v5    # "_tmp_6":Ljava/lang/Long;
    .local v49, "_columnIndexOfDepositSlipTime":I
    .local v102, "_tmp_6":Ljava/lang/Long;
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v4

    long-to-int v4, v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 1824
    .local v4, "_tmp_7":Ljava/lang/Integer;
    :goto_31
    if-nez v4, :cond_31

    const/4 v5, 0x0

    goto :goto_33

    :cond_31
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v5

    if-eqz v5, :cond_32

    const/4 v5, 0x1

    goto :goto_32

    :cond_32
    move/from16 v5, v97

    :goto_32
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    :goto_33
    iput-object v5, v15, Lcom/trimline/metrocrew/transaction;->Customer_Payment_On_Account:Ljava/lang/Boolean;

    .line 1826
    move/from16 v5, v50

    .end local v50    # "_columnIndexOfSelect":I
    .local v5, "_columnIndexOfSelect":I
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v50

    if-eqz v50, :cond_33

    .line 1827
    const/16 v50, 0x0

    move-object/from16 v103, v50

    move/from16 v50, v3

    move-object/from16 v3, v103

    move-object/from16 v103, v4

    .local v50, "_tmp_8":Ljava/lang/Integer;
    goto :goto_34

    .line 1829
    .end local v50    # "_tmp_8":Ljava/lang/Integer;
    :cond_33
    move/from16 v50, v3

    move-object/from16 v103, v4

    .end local v3    # "_columnIndexOfCustomerPaymentOnAccount":I
    .end local v4    # "_tmp_7":Ljava/lang/Integer;
    .local v50, "_columnIndexOfCustomerPaymentOnAccount":I
    .local v103, "_tmp_7":Ljava/lang/Integer;
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 1831
    .local v3, "_tmp_8":Ljava/lang/Integer;
    :goto_34
    if-nez v3, :cond_34

    const/4 v4, 0x0

    goto :goto_36

    :cond_34
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_35

    const/4 v4, 0x1

    goto :goto_35

    :cond_35
    move/from16 v4, v97

    :goto_35
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    :goto_36
    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Select:Ljava/lang/Boolean;

    .line 1833
    move/from16 v4, v51

    .end local v51    # "_columnIndexOfBatchPosted":I
    .local v4, "_columnIndexOfBatchPosted":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v51

    if-eqz v51, :cond_36

    .line 1834
    const/16 v51, 0x0

    move/from16 v104, v5

    move-object/from16 v5, v51

    move/from16 v51, v6

    .local v51, "_tmp_9":Ljava/lang/Integer;
    goto :goto_37

    .line 1836
    .end local v51    # "_tmp_9":Ljava/lang/Integer;
    :cond_36
    move/from16 v104, v5

    move/from16 v51, v6

    .end local v5    # "_columnIndexOfSelect":I
    .end local v6    # "_columnIndexOfType":I
    .local v51, "_columnIndexOfType":I
    .local v104, "_columnIndexOfSelect":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v5

    long-to-int v5, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 1838
    .local v5, "_tmp_9":Ljava/lang/Integer;
    :goto_37
    if-nez v5, :cond_37

    const/4 v6, 0x0

    goto :goto_39

    :cond_37
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-eqz v6, :cond_38

    const/4 v6, 0x1

    goto :goto_38

    :cond_38
    move/from16 v6, v97

    :goto_38
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :goto_39
    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Batch_Posted:Ljava/lang/Boolean;

    .line 1839
    move/from16 v6, v52

    .end local v52    # "_columnIndexOfTransactionNo":I
    .local v6, "_columnIndexOfTransactionNo":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v52

    if-eqz v52, :cond_39

    .line 1840
    move/from16 v52, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfTellerID":I
    .local v52, "_columnIndexOfTellerID":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Transaction_No:Ljava/lang/String;

    goto :goto_3a

    .line 1842
    .end local v52    # "_columnIndexOfTellerID":I
    .restart local v1    # "_columnIndexOfTellerID":I
    :cond_39
    move/from16 v52, v1

    .end local v1    # "_columnIndexOfTellerID":I
    .restart local v52    # "_columnIndexOfTellerID":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Transaction_No:Ljava/lang/String;

    .line 1844
    :goto_3a
    move/from16 v1, v53

    .end local v53    # "_columnIndexOfChequeDepositSlipBank":I
    .local v1, "_columnIndexOfChequeDepositSlipBank":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v53

    if-eqz v53, :cond_3a

    .line 1845
    move-object/from16 v53, v3

    const/4 v3, 0x0

    .end local v3    # "_tmp_8":Ljava/lang/Integer;
    .local v53, "_tmp_8":Ljava/lang/Integer;
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_Bank:Ljava/lang/String;

    goto :goto_3b

    .line 1847
    .end local v53    # "_tmp_8":Ljava/lang/Integer;
    .restart local v3    # "_tmp_8":Ljava/lang/Integer;
    :cond_3a
    move-object/from16 v53, v3

    .end local v3    # "_tmp_8":Ljava/lang/Integer;
    .restart local v53    # "_tmp_8":Ljava/lang/Integer;
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Cheque_Deposit_Slip_Bank:Ljava/lang/String;

    .line 1849
    :goto_3b
    move/from16 v3, v54

    .end local v54    # "_columnIndexOfBankAccount":I
    .local v3, "_columnIndexOfBankAccount":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v54

    if-eqz v54, :cond_3b

    .line 1850
    move/from16 v54, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfChequeDepositSlipBank":I
    .local v54, "_columnIndexOfChequeDepositSlipBank":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Bank_Account:Ljava/lang/String;

    goto :goto_3c

    .line 1852
    .end local v54    # "_columnIndexOfChequeDepositSlipBank":I
    .restart local v1    # "_columnIndexOfChequeDepositSlipBank":I
    :cond_3b
    move/from16 v54, v1

    .end local v1    # "_columnIndexOfChequeDepositSlipBank":I
    .restart local v54    # "_columnIndexOfChequeDepositSlipBank":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Bank_Account:Ljava/lang/String;

    .line 1855
    :goto_3c
    move/from16 v1, v55

    .end local v55    # "_columnIndexOfConfirmed":I
    .local v1, "_columnIndexOfConfirmed":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v55

    if-eqz v55, :cond_3c

    .line 1856
    const/16 v55, 0x0

    move/from16 v105, v3

    move-object/from16 v3, v55

    move/from16 v55, v4

    .local v55, "_tmp_10":Ljava/lang/Integer;
    goto :goto_3d

    .line 1858
    .end local v55    # "_tmp_10":Ljava/lang/Integer;
    :cond_3c
    move/from16 v105, v3

    move/from16 v55, v4

    .end local v3    # "_columnIndexOfBankAccount":I
    .end local v4    # "_columnIndexOfBatchPosted":I
    .local v55, "_columnIndexOfBatchPosted":I
    .local v105, "_columnIndexOfBankAccount":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 1860
    .local v3, "_tmp_10":Ljava/lang/Integer;
    :goto_3d
    if-nez v3, :cond_3d

    const/4 v4, 0x0

    goto :goto_3f

    :cond_3d
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_3e

    const/4 v4, 0x1

    goto :goto_3e

    :cond_3e
    move/from16 v4, v97

    :goto_3e
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    :goto_3f
    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Confirmed:Ljava/lang/Boolean;

    .line 1862
    move/from16 v4, v56

    .end local v56    # "_columnIndexOfReconciled":I
    .local v4, "_columnIndexOfReconciled":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v56

    if-eqz v56, :cond_3f

    .line 1863
    const/16 v56, 0x0

    move-object/from16 v106, v56

    move-object/from16 v56, v5

    move-object/from16 v5, v106

    move/from16 v106, v6

    .local v56, "_tmp_11":Ljava/lang/Integer;
    goto :goto_40

    .line 1865
    .end local v56    # "_tmp_11":Ljava/lang/Integer;
    :cond_3f
    move-object/from16 v56, v5

    move/from16 v106, v6

    .end local v5    # "_tmp_9":Ljava/lang/Integer;
    .end local v6    # "_columnIndexOfTransactionNo":I
    .local v56, "_tmp_9":Ljava/lang/Integer;
    .local v106, "_columnIndexOfTransactionNo":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v5

    long-to-int v5, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 1867
    .local v5, "_tmp_11":Ljava/lang/Integer;
    :goto_40
    if-nez v5, :cond_40

    const/4 v6, 0x0

    goto :goto_42

    :cond_40
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-eqz v6, :cond_41

    const/4 v6, 0x1

    goto :goto_41

    :cond_41
    move/from16 v6, v97

    :goto_41
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :goto_42
    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Reconciled:Ljava/lang/Boolean;

    .line 1868
    move/from16 v6, v57

    .end local v57    # "_columnIndexOfOrigCashier":I
    .local v6, "_columnIndexOfOrigCashier":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v57

    if-eqz v57, :cond_42

    .line 1869
    move/from16 v57, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfConfirmed":I
    .local v57, "_columnIndexOfConfirmed":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Orig_Cashier:Ljava/lang/String;

    goto :goto_43

    .line 1871
    .end local v57    # "_columnIndexOfConfirmed":I
    .restart local v1    # "_columnIndexOfConfirmed":I
    :cond_42
    move/from16 v57, v1

    .end local v1    # "_columnIndexOfConfirmed":I
    .restart local v57    # "_columnIndexOfConfirmed":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Orig_Cashier:Ljava/lang/String;

    .line 1874
    :goto_43
    move/from16 v1, v58

    .end local v58    # "_columnIndexOfCancelled":I
    .local v1, "_columnIndexOfCancelled":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v58

    if-eqz v58, :cond_43

    .line 1875
    const/16 v58, 0x0

    move-object/from16 v107, v58

    move-object/from16 v58, v3

    move-object/from16 v3, v107

    move/from16 v107, v4

    .local v58, "_tmp_12":Ljava/lang/Integer;
    goto :goto_44

    .line 1877
    .end local v58    # "_tmp_12":Ljava/lang/Integer;
    :cond_43
    move-object/from16 v58, v3

    move/from16 v107, v4

    .end local v3    # "_tmp_10":Ljava/lang/Integer;
    .end local v4    # "_columnIndexOfReconciled":I
    .local v58, "_tmp_10":Ljava/lang/Integer;
    .local v107, "_columnIndexOfReconciled":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 1879
    .local v3, "_tmp_12":Ljava/lang/Integer;
    :goto_44
    if-nez v3, :cond_44

    const/4 v4, 0x0

    goto :goto_46

    :cond_44
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_45

    const/4 v4, 0x1

    goto :goto_45

    :cond_45
    move/from16 v4, v97

    :goto_45
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    :goto_46
    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Cancelled:Ljava/lang/Boolean;

    .line 1880
    move/from16 v4, v59

    .end local v59    # "_columnIndexOfCancelledBy":I
    .local v4, "_columnIndexOfCancelledBy":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v59

    if-eqz v59, :cond_46

    .line 1881
    move/from16 v59, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfCancelled":I
    .local v59, "_columnIndexOfCancelled":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Cancelled_By:Ljava/lang/String;

    goto :goto_47

    .line 1883
    .end local v59    # "_columnIndexOfCancelled":I
    .restart local v1    # "_columnIndexOfCancelled":I
    :cond_46
    move/from16 v59, v1

    .end local v1    # "_columnIndexOfCancelled":I
    .restart local v59    # "_columnIndexOfCancelled":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Cancelled_By:Ljava/lang/String;

    .line 1886
    :goto_47
    move/from16 v1, v60

    .end local v60    # "_columnIndexOfCancelledDate":I
    .local v1, "_columnIndexOfCancelledDate":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v60

    if-eqz v60, :cond_47

    .line 1887
    const/16 v60, 0x0

    .local v60, "_tmp_13":Ljava/lang/Long;
    goto :goto_48

    .line 1889
    .end local v60    # "_tmp_13":Ljava/lang/Long;
    :cond_47
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v108

    invoke-static/range {v108 .. v109}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v60

    .line 1891
    .restart local v60    # "_tmp_13":Ljava/lang/Long;
    :goto_48
    move/from16 v108, v1

    .end local v1    # "_columnIndexOfCancelledDate":I
    .local v108, "_columnIndexOfCancelledDate":I
    invoke-static/range {v60 .. v60}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Cancelled_Date:Ljava/sql/Date;

    .line 1893
    move/from16 v1, v61

    .end local v61    # "_columnIndexOfCancelledTime":I
    .local v1, "_columnIndexOfCancelledTime":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v61

    if-eqz v61, :cond_48

    .line 1894
    const/16 v61, 0x0

    .local v61, "_tmp_14":Ljava/lang/Long;
    goto :goto_49

    .line 1896
    .end local v61    # "_tmp_14":Ljava/lang/Long;
    :cond_48
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v109

    invoke-static/range {v109 .. v110}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v61

    .line 1898
    .restart local v61    # "_tmp_14":Ljava/lang/Long;
    :goto_49
    move/from16 v109, v1

    .end local v1    # "_columnIndexOfCancelledTime":I
    .local v109, "_columnIndexOfCancelledTime":I
    invoke-static/range {v61 .. v61}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Cancelled_Time:Ljava/sql/Date;

    .line 1900
    move/from16 v1, v62

    .end local v62    # "_columnIndexOfPostDated":I
    .local v1, "_columnIndexOfPostDated":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v62

    if-eqz v62, :cond_49

    .line 1901
    const/16 v62, 0x0

    move-object/from16 v110, v62

    move-object/from16 v62, v3

    move-object/from16 v3, v110

    move/from16 v110, v4

    .local v62, "_tmp_15":Ljava/lang/Integer;
    goto :goto_4a

    .line 1903
    .end local v62    # "_tmp_15":Ljava/lang/Integer;
    :cond_49
    move-object/from16 v62, v3

    move/from16 v110, v4

    .end local v3    # "_tmp_12":Ljava/lang/Integer;
    .end local v4    # "_columnIndexOfCancelledBy":I
    .local v62, "_tmp_12":Ljava/lang/Integer;
    .local v110, "_columnIndexOfCancelledBy":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 1905
    .local v3, "_tmp_15":Ljava/lang/Integer;
    :goto_4a
    if-nez v3, :cond_4a

    const/4 v4, 0x0

    goto :goto_4c

    :cond_4a
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_4b

    const/4 v4, 0x1

    goto :goto_4b

    :cond_4b
    move/from16 v4, v97

    :goto_4b
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    :goto_4c
    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Post_Dated:Ljava/lang/Boolean;

    .line 1907
    move/from16 v4, v63

    .end local v63    # "_columnIndexOfChequeRetrieved":I
    .local v4, "_columnIndexOfChequeRetrieved":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v63

    if-eqz v63, :cond_4c

    .line 1908
    const/16 v63, 0x0

    move-object/from16 v111, v63

    move-object/from16 v63, v5

    move-object/from16 v5, v111

    move/from16 v111, v6

    .local v63, "_tmp_16":Ljava/lang/Integer;
    goto :goto_4d

    .line 1910
    .end local v63    # "_tmp_16":Ljava/lang/Integer;
    :cond_4c
    move-object/from16 v63, v5

    move/from16 v111, v6

    .end local v5    # "_tmp_11":Ljava/lang/Integer;
    .end local v6    # "_columnIndexOfOrigCashier":I
    .local v63, "_tmp_11":Ljava/lang/Integer;
    .local v111, "_columnIndexOfOrigCashier":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v5

    long-to-int v5, v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 1912
    .local v5, "_tmp_16":Ljava/lang/Integer;
    :goto_4d
    if-nez v5, :cond_4d

    const/4 v6, 0x0

    goto :goto_4f

    :cond_4d
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v6

    if-eqz v6, :cond_4e

    const/4 v6, 0x1

    goto :goto_4e

    :cond_4e
    move/from16 v6, v97

    :goto_4e
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    :goto_4f
    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Cheque_Retrieved:Ljava/lang/Boolean;

    .line 1913
    move/from16 v112, v4

    move/from16 v6, v64

    move-object/from16 v64, v3

    .end local v3    # "_tmp_15":Ljava/lang/Integer;
    .end local v4    # "_columnIndexOfChequeRetrieved":I
    .local v6, "_columnIndexOfRegisterNumber":I
    .local v64, "_tmp_15":Ljava/lang/Integer;
    .local v112, "_columnIndexOfChequeRetrieved":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    iput v3, v15, Lcom/trimline/metrocrew/transaction;->Register_Number:I

    .line 1914
    move/from16 v3, v65

    move-object/from16 v65, v5

    .end local v5    # "_tmp_16":Ljava/lang/Integer;
    .local v3, "_columnIndexOfFromEntryNo":I
    .local v65, "_tmp_16":Ljava/lang/Integer;
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, v15, Lcom/trimline/metrocrew/transaction;->From_Entry_No:I

    .line 1915
    move/from16 v4, v66

    move/from16 v66, v6

    .end local v6    # "_columnIndexOfRegisterNumber":I
    .local v4, "_columnIndexOfToEntryNo":I
    .local v66, "_columnIndexOfRegisterNumber":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v5

    long-to-int v5, v5

    iput v5, v15, Lcom/trimline/metrocrew/transaction;->To_Entry_No:I

    .line 1916
    move/from16 v5, v67

    .end local v67    # "_columnIndexOfBatchPostedUserID":I
    .local v5, "_columnIndexOfBatchPostedUserID":I
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_4f

    .line 1917
    const/4 v6, 0x0

    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Batch_Posted_UserID:Ljava/lang/String;

    goto :goto_50

    .line 1919
    :cond_4f
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Batch_Posted_UserID:Ljava/lang/String;

    .line 1921
    :goto_50
    move/from16 v67, v3

    move/from16 v6, v68

    move/from16 v68, v4

    .end local v3    # "_columnIndexOfFromEntryNo":I
    .end local v4    # "_columnIndexOfToEntryNo":I
    .local v6, "_columnIndexOfBDRegisterNumber":I
    .local v67, "_columnIndexOfFromEntryNo":I
    .local v68, "_columnIndexOfToEntryNo":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    iput v3, v15, Lcom/trimline/metrocrew/transaction;->BD_Register_Number:I

    .line 1922
    move/from16 v3, v69

    move/from16 v69, v5

    .end local v5    # "_columnIndexOfBatchPostedUserID":I
    .local v3, "_columnIndexOfBDFromNumber":I
    .local v69, "_columnIndexOfBatchPostedUserID":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, v15, Lcom/trimline/metrocrew/transaction;->BD_From_Number:I

    .line 1923
    move/from16 v4, v70

    move/from16 v70, v6

    .end local v6    # "_columnIndexOfBDRegisterNumber":I
    .local v4, "_columnIndexOfBDToNumber":I
    .local v70, "_columnIndexOfBDRegisterNumber":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v5

    long-to-int v5, v5

    iput v5, v15, Lcom/trimline/metrocrew/transaction;->BD_To_Number:I

    .line 1924
    move/from16 v5, v71

    .end local v71    # "_columnIndexOfReversalBy":I
    .local v5, "_columnIndexOfReversalBy":I
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_50

    .line 1925
    const/4 v6, 0x0

    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Reversal_By:Ljava/lang/String;

    goto :goto_51

    .line 1927
    :cond_50
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v15, Lcom/trimline/metrocrew/transaction;->Reversal_By:Ljava/lang/String;

    .line 1930
    :goto_51
    move/from16 v6, v72

    .end local v72    # "_columnIndexOfReversalDate":I
    .local v6, "_columnIndexOfReversalDate":I
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v71

    if-eqz v71, :cond_51

    .line 1931
    const/16 v71, 0x0

    .local v71, "_tmp_17":Ljava/lang/Long;
    goto :goto_52

    .line 1933
    .end local v71    # "_tmp_17":Ljava/lang/Long;
    :cond_51
    invoke-interface {v2, v6}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v71

    invoke-static/range {v71 .. v72}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v71

    .line 1935
    .restart local v71    # "_tmp_17":Ljava/lang/Long;
    :goto_52
    move/from16 v72, v1

    .end local v1    # "_columnIndexOfPostDated":I
    .local v72, "_columnIndexOfPostDated":I
    invoke-static/range {v71 .. v71}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Reversal_Date:Ljava/sql/Date;

    .line 1937
    move/from16 v1, v73

    .end local v73    # "_columnIndexOfReversalTime":I
    .local v1, "_columnIndexOfReversalTime":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v73

    if-eqz v73, :cond_52

    .line 1938
    const/16 v73, 0x0

    .local v73, "_tmp_18":Ljava/lang/Long;
    goto :goto_53

    .line 1940
    .end local v73    # "_tmp_18":Ljava/lang/Long;
    :cond_52
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v113

    invoke-static/range {v113 .. v114}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v73

    .line 1942
    .restart local v73    # "_tmp_18":Ljava/lang/Long;
    :goto_53
    move/from16 v113, v1

    .end local v1    # "_columnIndexOfReversalTime":I
    .local v113, "_columnIndexOfReversalTime":I
    invoke-static/range {v73 .. v73}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Reversal_Time:Ljava/sql/Date;

    .line 1943
    move/from16 v114, v4

    move/from16 v1, v74

    move/from16 v74, v3

    .end local v3    # "_columnIndexOfBDFromNumber":I
    .end local v4    # "_columnIndexOfBDToNumber":I
    .local v1, "_columnIndexOfReversalRegisterNo":I
    .local v74, "_columnIndexOfBDFromNumber":I
    .local v114, "_columnIndexOfBDToNumber":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    iput v3, v15, Lcom/trimline/metrocrew/transaction;->Reversal_Register_No:I

    .line 1944
    move/from16 v3, v75

    move/from16 v75, v5

    .end local v5    # "_columnIndexOfReversalBy":I
    .local v3, "_columnIndexOfReversalFromEntryNo":I
    .local v75, "_columnIndexOfReversalBy":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v4

    long-to-int v4, v4

    iput v4, v15, Lcom/trimline/metrocrew/transaction;->Reversal_From_Entry_No:I

    .line 1945
    move/from16 v4, v76

    move/from16 v76, v6

    .end local v6    # "_columnIndexOfReversalDate":I
    .local v4, "_columnIndexOfReversalToEntryNo":I
    .local v76, "_columnIndexOfReversalDate":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v5

    long-to-int v5, v5

    iput v5, v15, Lcom/trimline/metrocrew/transaction;->Reversal_To_Entry_No:I

    .line 1947
    move/from16 v5, v77

    .end local v77    # "_columnIndexOfReversed":I
    .local v5, "_columnIndexOfReversed":I
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_53

    .line 1948
    const/4 v6, 0x0

    move-object/from16 v77, v6

    move v6, v3

    move-object/from16 v3, v77

    move/from16 v77, v4

    .local v6, "_tmp_19":Ljava/lang/Integer;
    goto :goto_54

    .line 1950
    .end local v6    # "_tmp_19":Ljava/lang/Integer;
    :cond_53
    move v6, v3

    move/from16 v77, v4

    .end local v3    # "_columnIndexOfReversalFromEntryNo":I
    .end local v4    # "_columnIndexOfReversalToEntryNo":I
    .local v6, "_columnIndexOfReversalFromEntryNo":I
    .local v77, "_columnIndexOfReversalToEntryNo":I
    invoke-interface {v2, v5}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    .line 1952
    .local v3, "_tmp_19":Ljava/lang/Integer;
    :goto_54
    if-nez v3, :cond_54

    const/4 v4, 0x0

    goto :goto_56

    :cond_54
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eqz v4, :cond_55

    const/4 v4, 0x1

    goto :goto_55

    :cond_55
    move/from16 v4, v97

    :goto_55
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    :goto_56
    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Reversed:Ljava/lang/Boolean;

    .line 1953
    move/from16 v4, v78

    .end local v78    # "_columnIndexOfAppliesToDocNo":I
    .local v4, "_columnIndexOfAppliesToDocNo":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v78

    if-eqz v78, :cond_56

    .line 1954
    move/from16 v78, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfReversalRegisterNo":I
    .local v78, "_columnIndexOfReversalRegisterNo":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Applies_to_Doc_No:Ljava/lang/String;

    goto :goto_57

    .line 1956
    .end local v78    # "_columnIndexOfReversalRegisterNo":I
    .restart local v1    # "_columnIndexOfReversalRegisterNo":I
    :cond_56
    move/from16 v78, v1

    .end local v1    # "_columnIndexOfReversalRegisterNo":I
    .restart local v78    # "_columnIndexOfReversalRegisterNo":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Applies_to_Doc_No:Ljava/lang/String;

    .line 1958
    :goto_57
    move/from16 v1, v79

    .end local v79    # "_columnIndexOfAppliesToID":I
    .local v1, "_columnIndexOfAppliesToID":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v79

    if-eqz v79, :cond_57

    .line 1959
    move-object/from16 v79, v3

    const/4 v3, 0x0

    .end local v3    # "_tmp_19":Ljava/lang/Integer;
    .local v79, "_tmp_19":Ljava/lang/Integer;
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Applies_to_ID:Ljava/lang/String;

    goto :goto_58

    .line 1961
    .end local v79    # "_tmp_19":Ljava/lang/Integer;
    .restart local v3    # "_tmp_19":Ljava/lang/Integer;
    :cond_57
    move-object/from16 v79, v3

    .end local v3    # "_tmp_19":Ljava/lang/Integer;
    .restart local v79    # "_tmp_19":Ljava/lang/Integer;
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Applies_to_ID:Ljava/lang/String;

    .line 1963
    :goto_58
    move/from16 v3, v80

    .end local v80    # "_columnIndexOfGrantNo":I
    .local v3, "_columnIndexOfGrantNo":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v80

    if-eqz v80, :cond_58

    .line 1964
    move/from16 v80, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfAppliesToID":I
    .local v80, "_columnIndexOfAppliesToID":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Grant_No:Ljava/lang/String;

    goto :goto_59

    .line 1966
    .end local v80    # "_columnIndexOfAppliesToID":I
    .restart local v1    # "_columnIndexOfAppliesToID":I
    :cond_58
    move/from16 v80, v1

    .end local v1    # "_columnIndexOfAppliesToID":I
    .restart local v80    # "_columnIndexOfAppliesToID":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Grant_No:Ljava/lang/String;

    .line 1968
    :goto_59
    move/from16 v115, v3

    move/from16 v1, v81

    move/from16 v81, v4

    .end local v3    # "_columnIndexOfGrantNo":I
    .end local v4    # "_columnIndexOfAppliesToDocNo":I
    .local v1, "_columnIndexOfInstallmentNumber":I
    .local v81, "_columnIndexOfAppliesToDocNo":I
    .local v115, "_columnIndexOfGrantNo":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    iput v3, v15, Lcom/trimline/metrocrew/transaction;->Installment_Number:I

    .line 1970
    move/from16 v3, v82

    .end local v82    # "_columnIndexOfNextInstallmentDate":I
    .local v3, "_columnIndexOfNextInstallmentDate":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_59

    .line 1971
    const/4 v4, 0x0

    .local v4, "_tmp_20":Ljava/lang/Long;
    goto :goto_5a

    .line 1973
    .end local v4    # "_tmp_20":Ljava/lang/Long;
    :cond_59
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v116

    invoke-static/range {v116 .. v117}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    .line 1975
    .restart local v4    # "_tmp_20":Ljava/lang/Long;
    :goto_5a
    move/from16 v82, v1

    .end local v1    # "_columnIndexOfInstallmentNumber":I
    .local v82, "_columnIndexOfInstallmentNumber":I
    invoke-static {v4}, Lcom/trimline/metrocrew/Converters$DateConverter;->toDate(Ljava/lang/Long;)Ljava/sql/Date;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Next_Installment_Date:Ljava/sql/Date;

    .line 1976
    move-object/from16 v116, v4

    move/from16 v1, v83

    move/from16 v83, v3

    .end local v3    # "_columnIndexOfNextInstallmentDate":I
    .end local v4    # "_tmp_20":Ljava/lang/Long;
    .local v1, "_columnIndexOfDimensionSetID":I
    .local v83, "_columnIndexOfNextInstallmentDate":I
    .local v116, "_tmp_20":Ljava/lang/Long;
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    iput v3, v15, Lcom/trimline/metrocrew/transaction;->Dimension_Set_ID:I

    .line 1977
    move/from16 v3, v84

    .end local v84    # "_columnIndexOfDonor":I
    .local v3, "_columnIndexOfDonor":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v4

    if-eqz v4, :cond_5a

    .line 1978
    const/4 v4, 0x0

    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Donor:Ljava/lang/String;

    goto :goto_5b

    .line 1980
    :cond_5a
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v15, Lcom/trimline/metrocrew/transaction;->Donor:Ljava/lang/String;

    .line 1982
    :goto_5b
    move/from16 v4, v85

    .end local v85    # "_columnIndexOfGroupCode":I
    .local v4, "_columnIndexOfGroupCode":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v84

    if-eqz v84, :cond_5b

    .line 1983
    move/from16 v84, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfDimensionSetID":I
    .local v84, "_columnIndexOfDimensionSetID":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Group_Code:Ljava/lang/String;

    goto :goto_5c

    .line 1985
    .end local v84    # "_columnIndexOfDimensionSetID":I
    .restart local v1    # "_columnIndexOfDimensionSetID":I
    :cond_5b
    move/from16 v84, v1

    .end local v1    # "_columnIndexOfDimensionSetID":I
    .restart local v84    # "_columnIndexOfDimensionSetID":I
    invoke-interface {v2, v4}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Group_Code:Ljava/lang/String;

    .line 1987
    :goto_5c
    move/from16 v1, v86

    .end local v86    # "_columnIndexOfPreADMFines":I
    .local v1, "_columnIndexOfPreADMFines":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v85

    if-eqz v85, :cond_5c

    .line 1988
    move/from16 v85, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfDonor":I
    .local v85, "_columnIndexOfDonor":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Pre_ADM_Fines:Ljava/lang/Double;

    goto :goto_5d

    .line 1990
    .end local v85    # "_columnIndexOfDonor":I
    .restart local v3    # "_columnIndexOfDonor":I
    :cond_5c
    move/from16 v85, v3

    .end local v3    # "_columnIndexOfDonor":I
    .restart local v85    # "_columnIndexOfDonor":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v117

    invoke-static/range {v117 .. v118}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Pre_ADM_Fines:Ljava/lang/Double;

    .line 1992
    :goto_5d
    move/from16 v3, v87

    .end local v87    # "_columnIndexOfMedFines":I
    .local v3, "_columnIndexOfMedFines":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v86

    if-eqz v86, :cond_5d

    .line 1993
    move/from16 v86, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfPreADMFines":I
    .restart local v86    # "_columnIndexOfPreADMFines":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Med_Fines:Ljava/lang/Double;

    goto :goto_5e

    .line 1995
    .end local v86    # "_columnIndexOfPreADMFines":I
    .restart local v1    # "_columnIndexOfPreADMFines":I
    :cond_5d
    move/from16 v86, v1

    .end local v1    # "_columnIndexOfPreADMFines":I
    .restart local v86    # "_columnIndexOfPreADMFines":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v117

    invoke-static/range {v117 .. v118}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Med_Fines:Ljava/lang/Double;

    .line 1997
    :goto_5e
    move/from16 v1, v88

    .end local v88    # "_columnIndexOfLoanNo":I
    .local v1, "_columnIndexOfLoanNo":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v87

    if-eqz v87, :cond_5e

    .line 1998
    move/from16 v87, v3

    const/4 v3, 0x0

    .end local v3    # "_columnIndexOfMedFines":I
    .restart local v87    # "_columnIndexOfMedFines":I
    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Loan_No:Ljava/lang/String;

    goto :goto_5f

    .line 2000
    .end local v87    # "_columnIndexOfMedFines":I
    .restart local v3    # "_columnIndexOfMedFines":I
    :cond_5e
    move/from16 v87, v3

    .end local v3    # "_columnIndexOfMedFines":I
    .restart local v87    # "_columnIndexOfMedFines":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getText(I)Ljava/lang/String;

    move-result-object v3

    iput-object v3, v15, Lcom/trimline/metrocrew/transaction;->Loan_No:Ljava/lang/String;

    .line 2002
    :goto_5f
    move/from16 v3, v89

    .end local v89    # "_columnIndexOfPenalty":I
    .local v3, "_columnIndexOfPenalty":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->isNull(I)Z

    move-result v88

    if-eqz v88, :cond_5f

    .line 2003
    move/from16 v88, v1

    const/4 v1, 0x0

    .end local v1    # "_columnIndexOfLoanNo":I
    .restart local v88    # "_columnIndexOfLoanNo":I
    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Penalty:Ljava/lang/Double;

    goto :goto_60

    .line 2005
    .end local v88    # "_columnIndexOfLoanNo":I
    .restart local v1    # "_columnIndexOfLoanNo":I
    :cond_5f
    move/from16 v88, v1

    .end local v1    # "_columnIndexOfLoanNo":I
    .restart local v88    # "_columnIndexOfLoanNo":I
    invoke-interface {v2, v3}, Landroidx/sqlite/SQLiteStatement;->getDouble(I)D

    move-result-wide v117

    invoke-static/range {v117 .. v118}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, v15, Lcom/trimline/metrocrew/transaction;->Penalty:Ljava/lang/Double;

    .line 2008
    :goto_60
    move/from16 v92, v3

    move/from16 v89, v4

    move/from16 v1, v93

    .end local v3    # "_columnIndexOfPenalty":I
    .end local v4    # "_columnIndexOfGroupCode":I
    .end local v93    # "_columnIndexOfSent":I
    .local v1, "_columnIndexOfSent":I
    .local v89, "_columnIndexOfGroupCode":I
    .local v92, "_columnIndexOfPenalty":I
    invoke-interface {v2, v1}, Landroidx/sqlite/SQLiteStatement;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    .line 2009
    .local v3, "_tmp_21":I
    if-eqz v3, :cond_60

    const/4 v4, 0x1

    goto :goto_61

    :cond_60
    move/from16 v4, v97

    :goto_61
    iput-boolean v4, v15, Lcom/trimline/metrocrew/transaction;->sent:Z

    .line 2010
    move-object/from16 v4, v91

    .end local v91    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    .local v4, "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    invoke-interface {v4, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2011
    move-object/from16 v91, v4

    move/from16 v15, v16

    move/from16 v16, v17

    move/from16 v4, v18

    move/from16 v18, v21

    move/from16 v21, v22

    move/from16 v22, v23

    move/from16 v23, v24

    move/from16 v24, v25

    move/from16 v25, v26

    move/from16 v26, v27

    move/from16 v27, v28

    move/from16 v28, v29

    move/from16 v29, v30

    move/from16 v30, v31

    move/from16 v31, v32

    move/from16 v32, v33

    move/from16 v33, v34

    move/from16 v35, v36

    move/from16 v37, v38

    move/from16 v38, v39

    move/from16 v39, v40

    move/from16 v40, v41

    move/from16 v41, v42

    move/from16 v42, v43

    move/from16 v43, v44

    move/from16 v36, v45

    move/from16 v19, v46

    move/from16 v45, v47

    move/from16 v46, v48

    move/from16 v47, v49

    move/from16 v49, v50

    move/from16 v48, v52

    move/from16 v53, v54

    move/from16 v58, v59

    move/from16 v64, v66

    move/from16 v65, v67

    move/from16 v66, v68

    move/from16 v67, v69

    move/from16 v68, v70

    move/from16 v62, v72

    move/from16 v69, v74

    move/from16 v71, v75

    move/from16 v72, v76

    move/from16 v76, v77

    move/from16 v74, v78

    move/from16 v79, v80

    move/from16 v78, v81

    move/from16 v81, v82

    move/from16 v82, v83

    move/from16 v83, v84

    move/from16 v84, v85

    move/from16 v85, v89

    move/from16 v14, v90

    move/from16 v89, v92

    move/from16 v13, v94

    move/from16 v3, v95

    move/from16 v17, v98

    move/from16 v20, v99

    move/from16 v34, v100

    move/from16 v44, v101

    move/from16 v50, v104

    move/from16 v54, v105

    move/from16 v52, v106

    move/from16 v56, v107

    move/from16 v60, v108

    move/from16 v61, v109

    move/from16 v59, v110

    move/from16 v63, v112

    move/from16 v73, v113

    move/from16 v70, v114

    move/from16 v80, v115

    move/from16 v77, v5

    move/from16 v75, v6

    move/from16 v6, v51

    move/from16 v51, v55

    move/from16 v55, v57

    move/from16 v5, v96

    move/from16 v57, v111

    .end local v3    # "_tmp_21":I
    .end local v13    # "_tmp":Ljava/lang/Long;
    .end local v14    # "_tmp_1":Ljava/lang/Long;
    .end local v15    # "_item":Lcom/trimline/metrocrew/transaction;
    .end local v19    # "_tmp_3":Ljava/lang/Long;
    .end local v20    # "_tmp_4":Ljava/lang/Long;
    .end local v35    # "_tmp_2":Ljava/lang/Integer;
    .end local v37    # "_tmp_5":Ljava/lang/Integer;
    .end local v53    # "_tmp_8":Ljava/lang/Integer;
    .end local v56    # "_tmp_9":Ljava/lang/Integer;
    .end local v58    # "_tmp_10":Ljava/lang/Integer;
    .end local v60    # "_tmp_13":Ljava/lang/Long;
    .end local v61    # "_tmp_14":Ljava/lang/Long;
    .end local v62    # "_tmp_12":Ljava/lang/Integer;
    .end local v63    # "_tmp_11":Ljava/lang/Integer;
    .end local v64    # "_tmp_15":Ljava/lang/Integer;
    .end local v65    # "_tmp_16":Ljava/lang/Integer;
    .end local v71    # "_tmp_17":Ljava/lang/Long;
    .end local v73    # "_tmp_18":Ljava/lang/Long;
    .end local v79    # "_tmp_19":Ljava/lang/Integer;
    .end local v102    # "_tmp_6":Ljava/lang/Long;
    .end local v103    # "_tmp_7":Ljava/lang/Integer;
    .end local v116    # "_tmp_20":Ljava/lang/Long;
    goto/16 :goto_0

    .line 2012
    .end local v90    # "_columnIndexOfOnBehalfOf":I
    .end local v92    # "_columnIndexOfPenalty":I
    .end local v94    # "_columnIndexOfReceivedFrom":I
    .end local v95    # "_columnIndexOfEntryNo":I
    .end local v96    # "_columnIndexOfDate":I
    .end local v98    # "_columnIndexOfAccountName":I
    .end local v99    # "_columnIndexOfTimePosted":I
    .end local v100    # "_columnIndexOfVATProdPostingGroup":I
    .end local v101    # "_columnIndexOfDestShortcutDimension2Code":I
    .end local v104    # "_columnIndexOfSelect":I
    .end local v105    # "_columnIndexOfBankAccount":I
    .end local v106    # "_columnIndexOfTransactionNo":I
    .end local v107    # "_columnIndexOfReconciled":I
    .end local v108    # "_columnIndexOfCancelledDate":I
    .end local v109    # "_columnIndexOfCancelledTime":I
    .end local v110    # "_columnIndexOfCancelledBy":I
    .end local v111    # "_columnIndexOfOrigCashier":I
    .end local v112    # "_columnIndexOfChequeRetrieved":I
    .end local v113    # "_columnIndexOfReversalTime":I
    .end local v114    # "_columnIndexOfBDToNumber":I
    .end local v115    # "_columnIndexOfGrantNo":I
    .local v3, "_columnIndexOfEntryNo":I
    .local v4, "_columnIndexOfNo":I
    .local v5, "_columnIndexOfDate":I
    .local v6, "_columnIndexOfType":I
    .local v13, "_columnIndexOfReceivedFrom":I
    .local v14, "_columnIndexOfOnBehalfOf":I
    .local v15, "_columnIndexOfCashier":I
    .local v16, "_columnIndexOfAccountNo":I
    .local v17, "_columnIndexOfAccountName":I
    .local v18, "_columnIndexOfPosted":I
    .local v19, "_columnIndexOfDatePosted":I
    .local v20, "_columnIndexOfTimePosted":I
    .local v21, "_columnIndexOfPostedBy":I
    .local v22, "_columnIndexOfAmount":I
    .local v23, "_columnIndexOfRemarks":I
    .local v24, "_columnIndexOfTransactionName":I
    .local v25, "_columnIndexOfBranchCode":I
    .local v26, "_columnIndexOfAgentCode":I
    .local v27, "_columnIndexOfGrouping":I
    .local v28, "_columnIndexOfGlobalDimension1Code":I
    .local v29, "_columnIndexOfShortcutDimension2Code":I
    .local v30, "_columnIndexOfVATPercent":I
    .local v31, "_columnIndexOfCurrencyCode":I
    .local v32, "_columnIndexOfCurrencyFactor":I
    .local v33, "_columnIndexOfVATBusPostingGroup":I
    .local v34, "_columnIndexOfVATProdPostingGroup":I
    .local v35, "_columnIndexOfGenPostingTypeSpecified":I
    .local v36, "_columnIndexOfGenBusPostingGroup":I
    .local v37, "_columnIndexOfGenProdPostingGroup":I
    .local v38, "_columnIndexOfVATAmount":I
    .local v39, "_columnIndexOfTotalAmount":I
    .local v40, "_columnIndexOfUserID":I
    .local v41, "_columnIndexOfApplyTo":I
    .local v42, "_columnIndexOfApplyToID":I
    .local v43, "_columnIndexOfDestGlobalDimension1Code":I
    .local v44, "_columnIndexOfDestShortcutDimension2Code":I
    .local v45, "_columnIndexOfLineNo":I
    .local v46, "_columnIndexOfPrintNo":I
    .local v47, "_columnIndexOfDepositSlipTime":I
    .local v48, "_columnIndexOfTellerID":I
    .local v49, "_columnIndexOfCustomerPaymentOnAccount":I
    .local v50, "_columnIndexOfSelect":I
    .local v51, "_columnIndexOfBatchPosted":I
    .local v52, "_columnIndexOfTransactionNo":I
    .local v53, "_columnIndexOfChequeDepositSlipBank":I
    .local v54, "_columnIndexOfBankAccount":I
    .local v55, "_columnIndexOfConfirmed":I
    .local v56, "_columnIndexOfReconciled":I
    .local v57, "_columnIndexOfOrigCashier":I
    .local v58, "_columnIndexOfCancelled":I
    .local v59, "_columnIndexOfCancelledBy":I
    .local v60, "_columnIndexOfCancelledDate":I
    .local v61, "_columnIndexOfCancelledTime":I
    .local v62, "_columnIndexOfPostDated":I
    .local v63, "_columnIndexOfChequeRetrieved":I
    .local v64, "_columnIndexOfRegisterNumber":I
    .local v65, "_columnIndexOfFromEntryNo":I
    .local v66, "_columnIndexOfToEntryNo":I
    .local v67, "_columnIndexOfBatchPostedUserID":I
    .local v68, "_columnIndexOfBDRegisterNumber":I
    .local v69, "_columnIndexOfBDFromNumber":I
    .local v70, "_columnIndexOfBDToNumber":I
    .local v71, "_columnIndexOfReversalBy":I
    .local v72, "_columnIndexOfReversalDate":I
    .local v73, "_columnIndexOfReversalTime":I
    .local v74, "_columnIndexOfReversalRegisterNo":I
    .local v75, "_columnIndexOfReversalFromEntryNo":I
    .local v76, "_columnIndexOfReversalToEntryNo":I
    .local v77, "_columnIndexOfReversed":I
    .local v78, "_columnIndexOfAppliesToDocNo":I
    .local v79, "_columnIndexOfAppliesToID":I
    .local v80, "_columnIndexOfGrantNo":I
    .local v81, "_columnIndexOfInstallmentNumber":I
    .local v82, "_columnIndexOfNextInstallmentDate":I
    .local v83, "_columnIndexOfDimensionSetID":I
    .local v84, "_columnIndexOfDonor":I
    .local v85, "_columnIndexOfGroupCode":I
    .local v89, "_columnIndexOfPenalty":I
    .restart local v91    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    :cond_61
    move/from16 v100, v34

    move/from16 v34, v33

    move/from16 v33, v32

    move/from16 v32, v31

    move/from16 v31, v30

    move/from16 v30, v29

    move/from16 v29, v28

    move/from16 v28, v27

    move/from16 v27, v26

    move/from16 v26, v25

    move/from16 v25, v24

    move/from16 v24, v23

    move/from16 v23, v22

    move/from16 v22, v21

    move/from16 v21, v18

    move/from16 v18, v4

    move-object/from16 v4, v91

    .line 2014
    .end local v91    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    .local v4, "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    .local v18, "_columnIndexOfNo":I
    .local v21, "_columnIndexOfPosted":I
    .local v22, "_columnIndexOfPostedBy":I
    .local v23, "_columnIndexOfAmount":I
    .local v24, "_columnIndexOfRemarks":I
    .local v25, "_columnIndexOfTransactionName":I
    .local v26, "_columnIndexOfBranchCode":I
    .local v27, "_columnIndexOfAgentCode":I
    .local v28, "_columnIndexOfGrouping":I
    .local v29, "_columnIndexOfGlobalDimension1Code":I
    .local v30, "_columnIndexOfShortcutDimension2Code":I
    .local v31, "_columnIndexOfVATPercent":I
    .local v32, "_columnIndexOfCurrencyCode":I
    .local v33, "_columnIndexOfCurrencyFactor":I
    .local v34, "_columnIndexOfVATBusPostingGroup":I
    .restart local v100    # "_columnIndexOfVATProdPostingGroup":I
    invoke-interface {v2}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 2012
    return-object v4

    .line 2014
    .end local v0    # "_columnIndexOfKey":I
    .end local v1    # "_columnIndexOfSent":I
    .end local v3    # "_columnIndexOfEntryNo":I
    .end local v4    # "_result":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    .end local v5    # "_columnIndexOfDate":I
    .end local v6    # "_columnIndexOfType":I
    .end local v7    # "_columnIndexOfTranstype":I
    .end local v8    # "_columnIndexOfPayMode":I
    .end local v9    # "_columnIndexOfPayMode_1":I
    .end local v10    # "_columnIndexOfChequeDepositSlipNo":I
    .end local v11    # "_columnIndexOfChequeDepositSlipDate":I
    .end local v12    # "_columnIndexOfBankCode":I
    .end local v13    # "_columnIndexOfReceivedFrom":I
    .end local v14    # "_columnIndexOfOnBehalfOf":I
    .end local v15    # "_columnIndexOfCashier":I
    .end local v16    # "_columnIndexOfAccountNo":I
    .end local v17    # "_columnIndexOfAccountName":I
    .end local v18    # "_columnIndexOfNo":I
    .end local v19    # "_columnIndexOfDatePosted":I
    .end local v20    # "_columnIndexOfTimePosted":I
    .end local v21    # "_columnIndexOfPosted":I
    .end local v22    # "_columnIndexOfPostedBy":I
    .end local v23    # "_columnIndexOfAmount":I
    .end local v24    # "_columnIndexOfRemarks":I
    .end local v25    # "_columnIndexOfTransactionName":I
    .end local v26    # "_columnIndexOfBranchCode":I
    .end local v27    # "_columnIndexOfAgentCode":I
    .end local v28    # "_columnIndexOfGrouping":I
    .end local v29    # "_columnIndexOfGlobalDimension1Code":I
    .end local v30    # "_columnIndexOfShortcutDimension2Code":I
    .end local v31    # "_columnIndexOfVATPercent":I
    .end local v32    # "_columnIndexOfCurrencyCode":I
    .end local v33    # "_columnIndexOfCurrencyFactor":I
    .end local v34    # "_columnIndexOfVATBusPostingGroup":I
    .end local v35    # "_columnIndexOfGenPostingTypeSpecified":I
    .end local v36    # "_columnIndexOfGenBusPostingGroup":I
    .end local v37    # "_columnIndexOfGenProdPostingGroup":I
    .end local v38    # "_columnIndexOfVATAmount":I
    .end local v39    # "_columnIndexOfTotalAmount":I
    .end local v40    # "_columnIndexOfUserID":I
    .end local v41    # "_columnIndexOfApplyTo":I
    .end local v42    # "_columnIndexOfApplyToID":I
    .end local v43    # "_columnIndexOfDestGlobalDimension1Code":I
    .end local v44    # "_columnIndexOfDestShortcutDimension2Code":I
    .end local v45    # "_columnIndexOfLineNo":I
    .end local v46    # "_columnIndexOfPrintNo":I
    .end local v47    # "_columnIndexOfDepositSlipTime":I
    .end local v48    # "_columnIndexOfTellerID":I
    .end local v49    # "_columnIndexOfCustomerPaymentOnAccount":I
    .end local v50    # "_columnIndexOfSelect":I
    .end local v51    # "_columnIndexOfBatchPosted":I
    .end local v52    # "_columnIndexOfTransactionNo":I
    .end local v53    # "_columnIndexOfChequeDepositSlipBank":I
    .end local v54    # "_columnIndexOfBankAccount":I
    .end local v55    # "_columnIndexOfConfirmed":I
    .end local v56    # "_columnIndexOfReconciled":I
    .end local v57    # "_columnIndexOfOrigCashier":I
    .end local v58    # "_columnIndexOfCancelled":I
    .end local v59    # "_columnIndexOfCancelledBy":I
    .end local v60    # "_columnIndexOfCancelledDate":I
    .end local v61    # "_columnIndexOfCancelledTime":I
    .end local v62    # "_columnIndexOfPostDated":I
    .end local v63    # "_columnIndexOfChequeRetrieved":I
    .end local v64    # "_columnIndexOfRegisterNumber":I
    .end local v65    # "_columnIndexOfFromEntryNo":I
    .end local v66    # "_columnIndexOfToEntryNo":I
    .end local v67    # "_columnIndexOfBatchPostedUserID":I
    .end local v68    # "_columnIndexOfBDRegisterNumber":I
    .end local v69    # "_columnIndexOfBDFromNumber":I
    .end local v70    # "_columnIndexOfBDToNumber":I
    .end local v71    # "_columnIndexOfReversalBy":I
    .end local v72    # "_columnIndexOfReversalDate":I
    .end local v73    # "_columnIndexOfReversalTime":I
    .end local v74    # "_columnIndexOfReversalRegisterNo":I
    .end local v75    # "_columnIndexOfReversalFromEntryNo":I
    .end local v76    # "_columnIndexOfReversalToEntryNo":I
    .end local v77    # "_columnIndexOfReversed":I
    .end local v78    # "_columnIndexOfAppliesToDocNo":I
    .end local v79    # "_columnIndexOfAppliesToID":I
    .end local v80    # "_columnIndexOfGrantNo":I
    .end local v81    # "_columnIndexOfInstallmentNumber":I
    .end local v82    # "_columnIndexOfNextInstallmentDate":I
    .end local v83    # "_columnIndexOfDimensionSetID":I
    .end local v84    # "_columnIndexOfDonor":I
    .end local v85    # "_columnIndexOfGroupCode":I
    .end local v86    # "_columnIndexOfPreADMFines":I
    .end local v87    # "_columnIndexOfMedFines":I
    .end local v88    # "_columnIndexOfLoanNo":I
    .end local v89    # "_columnIndexOfPenalty":I
    .end local v100    # "_columnIndexOfVATProdPostingGroup":I
    :catchall_0
    move-exception v0

    invoke-interface {v2}, Landroidx/sqlite/SQLiteStatement;->close()V

    .line 2015
    throw v0
.end method


# virtual methods
.method Insertall(Ljava/lang/Iterable;)V
    .locals 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "t"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;)V"
        }
    .end annotation

    .line 923
    .local p1, "t":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/trimline/metrocrew/transaction;>;"
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/transaction_dao_Impl$$ExternalSyntheticLambda2;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/transaction_dao_Impl$$ExternalSyntheticLambda2;-><init>(Lcom/trimline/metrocrew/transaction_dao_Impl;Ljava/lang/Iterable;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 927
    return-void
.end method

.method delete(Lcom/trimline/metrocrew/transaction;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/transaction;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 931
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/transaction_dao_Impl$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/transaction_dao_Impl$$ExternalSyntheticLambda0;-><init>(Lcom/trimline/metrocrew/transaction_dao_Impl;Lcom/trimline/metrocrew/transaction;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 935
    return-void
.end method

.method insert(Lcom/trimline/metrocrew/transaction;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/transaction;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 915
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/transaction_dao_Impl$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/transaction_dao_Impl$$ExternalSyntheticLambda3;-><init>(Lcom/trimline/metrocrew/transaction_dao_Impl;Lcom/trimline/metrocrew/transaction;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 919
    return-void
.end method

.method synthetic lambda$Insertall$1$com-trimline-metrocrew-transaction_dao_Impl(Ljava/lang/Iterable;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "t"    # Ljava/lang/Iterable;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 924
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction_dao_Impl;->__insertAdapterOftransaction:Landroidx/room/EntityInsertAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityInsertAdapter;->insert(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Iterable;)V

    .line 925
    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$delete$2$com-trimline-metrocrew-transaction_dao_Impl(Lcom/trimline/metrocrew/transaction;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/transaction;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 932
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction_dao_Impl;->__deleteAdapterOftransaction:Landroidx/room/EntityDeleteOrUpdateAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityDeleteOrUpdateAdapter;->handle(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)I

    .line 933
    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$insert$0$com-trimline-metrocrew-transaction_dao_Impl(Lcom/trimline/metrocrew/transaction;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/transaction;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 916
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction_dao_Impl;->__insertAdapterOftransaction:Landroidx/room/EntityInsertAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityInsertAdapter;->insert(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)V

    .line 917
    const/4 v0, 0x0

    return-object v0
.end method

.method synthetic lambda$update$3$com-trimline-metrocrew-transaction_dao_Impl(Lcom/trimline/metrocrew/transaction;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;
    .locals 1
    .param p1, "entity"    # Lcom/trimline/metrocrew/transaction;
    .param p2, "_connection"    # Landroidx/sqlite/SQLiteConnection;

    .line 940
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction_dao_Impl;->__updateAdapterOftransaction:Landroidx/room/EntityDeleteOrUpdateAdapter;

    invoke-virtual {v0, p2, p1}, Landroidx/room/EntityDeleteOrUpdateAdapter;->handle(Landroidx/sqlite/SQLiteConnection;Ljava/lang/Object;)I

    .line 941
    const/4 v0, 0x0

    return-object v0
.end method

.method load()Landroidx/lifecycle/LiveData;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;>;"
        }
    .end annotation

    .line 2021
    const-string v0, "SELECT * FROM `transaction`"

    .line 2022
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/trimline/metrocrew/transaction_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->getInvalidationTracker()Landroidx/room/InvalidationTracker;

    move-result-object v1

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const-string v3, "transaction"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    new-instance v3, Lcom/trimline/metrocrew/transaction_dao_Impl$$ExternalSyntheticLambda1;

    invoke-direct {v3}, Lcom/trimline/metrocrew/transaction_dao_Impl$$ExternalSyntheticLambda1;-><init>()V

    invoke-virtual {v1, v2, v4, v3}, Landroidx/room/InvalidationTracker;->createLiveData([Ljava/lang/String;ZLkotlin/jvm/functions/Function1;)Landroidx/lifecycle/LiveData;

    move-result-object v1

    return-object v1
.end method

.method loadAll()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;"
        }
    .end annotation

    .line 947
    const-string v0, "SELECT * FROM `transaction`"

    .line 948
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/trimline/metrocrew/transaction_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v2, Lcom/trimline/metrocrew/transaction_dao_Impl$$ExternalSyntheticLambda4;

    invoke-direct {v2}, Lcom/trimline/metrocrew/transaction_dao_Impl$$ExternalSyntheticLambda4;-><init>()V

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v1, v3, v4, v2}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    return-object v1
.end method

.method loadunsent()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;"
        }
    .end annotation

    .line 1484
    const-string v0, "SELECT * FROM `transaction` where sent =0"

    .line 1485
    .local v0, "_sql":Ljava/lang/String;
    iget-object v1, p0, Lcom/trimline/metrocrew/transaction_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v2, Lcom/trimline/metrocrew/transaction_dao_Impl$$ExternalSyntheticLambda6;

    invoke-direct {v2}, Lcom/trimline/metrocrew/transaction_dao_Impl$$ExternalSyntheticLambda6;-><init>()V

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v1, v3, v4, v2}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    return-object v1
.end method

.method update(Lcom/trimline/metrocrew/transaction;)V
    .locals 4
    .param p1, "entity"    # Lcom/trimline/metrocrew/transaction;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "entity"
        }
    .end annotation

    .line 939
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction_dao_Impl;->__db:Landroidx/room/RoomDatabase;

    new-instance v1, Lcom/trimline/metrocrew/transaction_dao_Impl$$ExternalSyntheticLambda5;

    invoke-direct {v1, p0, p1}, Lcom/trimline/metrocrew/transaction_dao_Impl$$ExternalSyntheticLambda5;-><init>(Lcom/trimline/metrocrew/transaction_dao_Impl;Lcom/trimline/metrocrew/transaction;)V

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v1}, Landroidx/room/util/DBUtil;->performBlocking(Landroidx/room/RoomDatabase;ZZLkotlin/jvm/functions/Function1;)Ljava/lang/Object;

    .line 943
    return-void
.end method
