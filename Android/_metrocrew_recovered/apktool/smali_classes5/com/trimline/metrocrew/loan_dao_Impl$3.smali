.class Lcom/trimline/metrocrew/loan_dao_Impl$3;
.super Landroidx/room/EntityDeleteOrUpdateAdapter;
.source "loan_dao_Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/loan_dao_Impl;-><init>(Landroidx/room/RoomDatabase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/room/EntityDeleteOrUpdateAdapter<",
        "Lcom/trimline/metrocrew/loan;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/loan_dao_Impl;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/loan_dao_Impl;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/loan_dao_Impl;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 87
    iput-object p1, p0, Lcom/trimline/metrocrew/loan_dao_Impl$3;->this$0:Lcom/trimline/metrocrew/loan_dao_Impl;

    invoke-direct {p0}, Landroidx/room/EntityDeleteOrUpdateAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method protected bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/loan;)V
    .locals 4
    .param p1, "statement"    # Landroidx/sqlite/SQLiteStatement;
    .param p2, "entity"    # Lcom/trimline/metrocrew/loan;
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

    .line 96
    iget-object v0, p2, Lcom/trimline/metrocrew/loan;->Loan_No:Ljava/lang/String;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 97
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 99
    :cond_0
    iget-object v0, p2, Lcom/trimline/metrocrew/loan;->Loan_No:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 101
    :goto_0
    iget-object v0, p2, Lcom/trimline/metrocrew/loan;->Application_Date:Ljava/lang/String;

    const/4 v1, 0x2

    if-nez v0, :cond_1

    .line 102
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 104
    :cond_1
    iget-object v0, p2, Lcom/trimline/metrocrew/loan;->Application_Date:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 106
    :goto_1
    iget-object v0, p2, Lcom/trimline/metrocrew/loan;->Loan_Product_Type:Ljava/lang/String;

    const/4 v1, 0x3

    if-nez v0, :cond_2

    .line 107
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2

    .line 109
    :cond_2
    iget-object v0, p2, Lcom/trimline/metrocrew/loan;->Loan_Product_Type:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 111
    :goto_2
    iget-object v0, p2, Lcom/trimline/metrocrew/loan;->Client_Code:Ljava/lang/String;

    const/4 v1, 0x4

    if-nez v0, :cond_3

    .line 112
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_3

    .line 114
    :cond_3
    iget-object v0, p2, Lcom/trimline/metrocrew/loan;->Client_Code:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 116
    :goto_3
    iget-object v0, p2, Lcom/trimline/metrocrew/loan;->Balance:Ljava/lang/Double;

    const/4 v1, 0x5

    if-nez v0, :cond_4

    .line 117
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4

    .line 119
    :cond_4
    iget-object v0, p2, Lcom/trimline/metrocrew/loan;->Balance:Ljava/lang/Double;

    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-interface {p1, v1, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 121
    :goto_4
    iget-object v0, p2, Lcom/trimline/metrocrew/loan;->Loan_Product_Type_Name:Ljava/lang/String;

    const/4 v1, 0x6

    if-nez v0, :cond_5

    .line 122
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_5

    .line 124
    :cond_5
    iget-object v0, p2, Lcom/trimline/metrocrew/loan;->Loan_Product_Type_Name:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 126
    :goto_5
    iget-object v0, p2, Lcom/trimline/metrocrew/loan;->Loan_No:Ljava/lang/String;

    const/4 v1, 0x7

    if-nez v0, :cond_6

    .line 127
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_6

    .line 129
    :cond_6
    iget-object v0, p2, Lcom/trimline/metrocrew/loan;->Loan_No:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 131
    :goto_6
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

    .line 87
    check-cast p2, Lcom/trimline/metrocrew/loan;

    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/loan_dao_Impl$3;->bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/loan;)V

    return-void
.end method

.method protected createQuery()Ljava/lang/String;
    .locals 1

    .line 91
    const-string v0, "UPDATE OR ABORT `loan` SET `Loan_No` = ?,`Application_Date` = ?,`Loan_Product_Type` = ?,`Client_Code` = ?,`Balance` = ?,`Loan_Product_Type_Name` = ? WHERE `Loan_No` = ?"

    return-object v0
.end method
