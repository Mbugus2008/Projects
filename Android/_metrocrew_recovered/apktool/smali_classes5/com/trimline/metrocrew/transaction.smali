.class public Lcom/trimline/metrocrew/transaction;
.super Ljava/lang/Object;
.source "transaction.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/transaction$TransAdapter;,
        Lcom/trimline/metrocrew/transaction$Model;,
        Lcom/trimline/metrocrew/transaction$Repository;,
        Lcom/trimline/metrocrew/transaction$dao;
    }
.end annotation


# instance fields
.field public Account_Name:Ljava/lang/String;

.field public Account_No:Ljava/lang/String;

.field public Agent_Code:Ljava/lang/String;

.field public Amount:Ljava/lang/Double;

.field public Applies_to_Doc_No:Ljava/lang/String;

.field public Applies_to_ID:Ljava/lang/String;

.field public Apply_to:Ljava/lang/String;

.field public Apply_to_ID:Ljava/lang/String;

.field public BD_From_Number:I

.field public BD_Register_Number:I

.field public BD_To_Number:I

.field public Bank_Account:Ljava/lang/String;

.field public Bank_Code:Ljava/lang/String;

.field public Batch_Posted:Ljava/lang/Boolean;

.field public Batch_Posted_UserID:Ljava/lang/String;

.field public Branch_Code:Ljava/lang/String;

.field public Cancelled:Ljava/lang/Boolean;

.field public Cancelled_By:Ljava/lang/String;

.field public Cancelled_Date:Ljava/sql/Date;

.field public Cancelled_Time:Ljava/sql/Date;

.field public Cashier:Ljava/lang/String;

.field public Cheque_Deposit_Slip_Bank:Ljava/lang/String;

.field public Cheque_Deposit_Slip_Date:Ljava/sql/Date;

.field public Cheque_Deposit_Slip_No:Ljava/lang/String;

.field public Cheque_Retrieved:Ljava/lang/Boolean;

.field public Confirmed:Ljava/lang/Boolean;

.field public Currency_Code:Ljava/lang/String;

.field public Currency_Factor:Ljava/lang/Double;

.field public Customer_Payment_On_Account:Ljava/lang/Boolean;

.field public Date:Ljava/sql/Date;

.field public Date_Posted:Ljava/sql/Date;

.field public Deposit_Slip_Time:Ljava/sql/Date;

.field public Dest_Global_Dimension_1_Code:Ljava/lang/String;

.field public Dest_Shortcut_Dimension_2_Code:Ljava/lang/String;

.field public Dimension_Set_ID:I

.field public Donor:Ljava/lang/String;

.field public Entry_No:I

.field public From_Entry_No:I

.field public Gen_Bus_Posting_Group:Ljava/lang/String;

.field public Gen_Posting_TypeSpecified:Ljava/lang/Boolean;

.field public Gen_Prod_Posting_Group:Ljava/lang/String;

.field public Global_Dimension_1_Code:Ljava/lang/String;

.field public Grant_No:Ljava/lang/String;

.field public Group_Code:Ljava/lang/String;

.field public Grouping:Ljava/lang/String;

.field public Installment_Number:I

.field public Key:Ljava/lang/String;

.field public Line_No:I

.field public Loan_No:Ljava/lang/String;

.field public Med_Fines:Ljava/lang/Double;

.field public Next_Installment_Date:Ljava/sql/Date;

.field public No:Ljava/lang/String;

.field public On_Behalf_Of:Ljava/lang/String;

.field public Orig_Cashier:Ljava/lang/String;

.field public PayMode:Ljava/lang/String;

.field public Pay_Mode:Ljava/lang/String;

.field public Penalty:Ljava/lang/Double;

.field public Post_Dated:Ljava/lang/Boolean;

.field public Posted:Ljava/lang/Boolean;

.field public Posted_By:Ljava/lang/String;

.field public Pre_ADM_Fines:Ljava/lang/Double;

.field public Print_No:I

.field public Received_From:Ljava/lang/String;

.field public Reconciled:Ljava/lang/Boolean;

.field public Register_Number:I

.field public Remarks:Ljava/lang/String;

.field public Reversal_By:Ljava/lang/String;

.field public Reversal_Date:Ljava/sql/Date;

.field public Reversal_From_Entry_No:I

.field public Reversal_Register_No:I

.field public Reversal_Time:Ljava/sql/Date;

.field public Reversal_To_Entry_No:I

.field public Reversed:Ljava/lang/Boolean;

.field public Select:Ljava/lang/Boolean;

.field public Shortcut_Dimension_2_Code:Ljava/lang/String;

.field public Teller_ID:Ljava/lang/String;

.field public Time_Posted:Ljava/sql/Date;

.field public To_Entry_No:I

.field public Total_Amount:Ljava/lang/Double;

.field public Transaction_Name:Ljava/lang/String;

.field public Transaction_No:Ljava/lang/String;

.field public Type:Ljava/lang/String;

.field public User_ID:Ljava/lang/String;

.field public VAT_Amount:Ljava/lang/Double;

.field public VAT_Bus_Posting_Group:Ljava/lang/String;

.field public VAT_Percent:Ljava/lang/Double;

.field public VAT_Prod_Posting_Group:Ljava/lang/String;

.field public sent:Z

.field public transtype:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getTranstype()Ljava/lang/String;
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    return-object v0
.end method

.method public setTranstype(Ljava/lang/String;)V
    .locals 0
    .param p1, "transtype"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "transtype"
        }
    .end annotation

    .line 49
    iput-object p1, p0, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    .line 50
    return-void
.end method
