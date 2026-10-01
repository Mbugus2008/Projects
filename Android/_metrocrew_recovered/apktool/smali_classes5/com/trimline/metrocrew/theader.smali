.class public Lcom/trimline/metrocrew/theader;
.super Ljava/lang/Object;
.source "theader.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;,
        Lcom/trimline/metrocrew/theader$adapter;,
        Lcom/trimline/metrocrew/theader$Model;,
        Lcom/trimline/metrocrew/theader$Repository;,
        Lcom/trimline/metrocrew/theader$dao;,
        Lcom/trimline/metrocrew/theader$Pay_Mode;,
        Lcom/trimline/metrocrew/theader$Receipt_Type;,
        Lcom/trimline/metrocrew/theader$Stat;
    }
.end annotation


# instance fields
.field public Account_No:Ljava/lang/String;

.field public Amount_Recieved:F

.field public Amount_RecievedSpecified:Ljava/lang/Boolean;

.field public Bank_Code:Ljava/lang/String;

.field public Bank_Name:Ljava/lang/String;

.field public Bank_Ref_No:Ljava/lang/String;

.field public Cashier:Ljava/lang/String;

.field public Cheque_Deposit_Slip_Date:Ljava/sql/Date;

.field public Cheque_Deposit_Slip_DateSpecified:Ljava/lang/Boolean;

.field public Cheque_Deposit_Slip_No:Ljava/lang/String;

.field public Cheque_No:Ljava/lang/String;

.field public Created_By:Ljava/lang/String;

.field public Created_Date_Time:Ljava/sql/Date;

.field public Created_Date_TimeSpecified:Ljava/lang/Boolean;

.field public Currency_Code:Ljava/lang/String;

.field public Currency_Factor:F

.field public Currency_FactorSpecified:Ljava/lang/Boolean;

.field public DFLT:F

.field public DFLTSpecified:Ljava/lang/Boolean;

.field public Date:Ljava/sql/Date;

.field public DateSpecified:Ljava/lang/Boolean;

.field public Date_Posted:Ljava/sql/Date;

.field public Date_PostedSpecified:Ljava/lang/Boolean;

.field public Dim1:Ljava/lang/String;

.field public Dim2:Ljava/lang/String;

.field public Dim3:Ljava/lang/String;

.field public Dim4:Ljava/lang/String;

.field public Dimension_Set_ID:I

.field public Dimension_Set_IDSpecified:Ljava/lang/Boolean;

.field public Document_Date:Ljava/sql/Date;

.field public Document_DateSpecified:Ljava/lang/Boolean;

.field public From_Entry_No:I

.field public From_Entry_NoSpecified:Ljava/lang/Boolean;

.field public Global_Dimension_1_Code:Ljava/lang/String;

.field public Group_Name:Ljava/lang/String;

.field public Key:Ljava/lang/String;

.field public Name:Ljava/lang/String;

.field public No:Ljava/lang/String;

.field public No_Printed:I

.field public No_PrintedSpecified:Ljava/lang/Boolean;

.field public No_Series:Ljava/lang/String;

.field public On_Behalf_Of:Ljava/lang/String;

.field public PayMode:Ljava/lang/String;

.field public Pay_ModeSpecified:Ljava/lang/Boolean;

.field public Posted:Ljava/lang/Boolean;

.field public PostedSpecified:Ljava/lang/Boolean;

.field public Posted_By:Ljava/lang/String;

.field public Print_No:I

.field public Print_NoSpecified:Ljava/lang/Boolean;

.field public Receipt_TypeSpecified:Ljava/lang/Boolean;

.field public Received_From:Ljava/lang/String;

.field public Reference_No:Ljava/lang/String;

.field public Register_No:I

.field public Register_NoSpecified:Ljava/lang/Boolean;

.field public Responsibility_Center:Ljava/lang/String;

.field public Shortcut_Dimension_2_Code:Ljava/lang/String;

.field public Shortcut_Dimension_3_Code:Ljava/lang/String;

.field public Shortcut_Dimension_4_Code:Ljava/lang/String;

.field public StatusSpecified:Ljava/lang/Boolean;

.field public Time_Posted:Ljava/sql/Date;

.field public Time_PostedSpecified:Ljava/lang/Boolean;

.field public To_Entry_No:I

.field public To_Entry_NoSpecified:Ljava/lang/Boolean;

.field public Total_Amount:F

.field public Total_AmountSpecified:Ljava/lang/Boolean;

.field public Total_Amount_Guaranteed:F

.field public Total_Amount_GuaranteedSpecified:Ljava/lang/Boolean;

.field public sent:Z

.field public tlines:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$1200(Lcom/trimline/metrocrew/theader;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/theader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 48
    invoke-virtual {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public Getdate()Ljava/lang/String;
    .locals 2

    .line 131
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMdd"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 132
    .local v0, "sd":Ljava/text/SimpleDateFormat;
    iget-object v1, p0, Lcom/trimline/metrocrew/theader;->Date:Ljava/sql/Date;

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public Getdatetime()Ljava/lang/String;
    .locals 2

    .line 135
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMddhhmmss"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 136
    .local v0, "sd":Ljava/text/SimpleDateFormat;
    iget-object v1, p0, Lcom/trimline/metrocrew/theader;->Date:Ljava/sql/Date;

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
