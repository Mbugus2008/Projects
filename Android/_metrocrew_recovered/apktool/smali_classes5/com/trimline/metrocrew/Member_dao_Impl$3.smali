.class Lcom/trimline/metrocrew/Member_dao_Impl$3;
.super Landroidx/room/EntityDeleteOrUpdateAdapter;
.source "Member_dao_Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/Member_dao_Impl;-><init>(Landroidx/room/RoomDatabase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/room/EntityDeleteOrUpdateAdapter<",
        "Lcom/trimline/metrocrew/Member;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/Member_dao_Impl;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/Member_dao_Impl;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/Member_dao_Impl;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 82
    iput-object p1, p0, Lcom/trimline/metrocrew/Member_dao_Impl$3;->this$0:Lcom/trimline/metrocrew/Member_dao_Impl;

    invoke-direct {p0}, Landroidx/room/EntityDeleteOrUpdateAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method protected bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/Member;)V
    .locals 3
    .param p1, "statement"    # Landroidx/sqlite/SQLiteStatement;
    .param p2, "entity"    # Lcom/trimline/metrocrew/Member;
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

    .line 91
    iget-object v0, p2, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 92
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 94
    :cond_0
    iget-object v0, p2, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 96
    :goto_0
    iget-object v0, p2, Lcom/trimline/metrocrew/Member;->Name:Ljava/lang/String;

    const/4 v1, 0x2

    if-nez v0, :cond_1

    .line 97
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 99
    :cond_1
    iget-object v0, p2, Lcom/trimline/metrocrew/Member;->Name:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 101
    :goto_1
    iget-object v0, p2, Lcom/trimline/metrocrew/Member;->ID_No:Ljava/lang/String;

    const/4 v1, 0x3

    if-nez v0, :cond_2

    .line 102
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2

    .line 104
    :cond_2
    iget-object v0, p2, Lcom/trimline/metrocrew/Member;->ID_No:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 106
    :goto_2
    iget-object v0, p2, Lcom/trimline/metrocrew/Member;->Phone_No:Ljava/lang/String;

    const/4 v1, 0x4

    if-nez v0, :cond_3

    .line 107
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_3

    .line 109
    :cond_3
    iget-object v0, p2, Lcom/trimline/metrocrew/Member;->Phone_No:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 111
    :goto_3
    const/4 v0, 0x5

    iget-wide v1, p2, Lcom/trimline/metrocrew/Member;->Outstanding_Balance:D

    invoke-interface {p1, v0, v1, v2}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 112
    const/4 v0, 0x6

    iget-wide v1, p2, Lcom/trimline/metrocrew/Member;->Shares_Retained:D

    invoke-interface {p1, v0, v1, v2}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 113
    const/4 v0, 0x7

    iget-wide v1, p2, Lcom/trimline/metrocrew/Member;->Current_Shares:D

    invoke-interface {p1, v0, v1, v2}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 114
    const/16 v0, 0x8

    iget-wide v1, p2, Lcom/trimline/metrocrew/Member;->Current_Savings:D

    invoke-interface {p1, v0, v1, v2}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 115
    const/16 v0, 0x9

    iget-wide v1, p2, Lcom/trimline/metrocrew/Member;->Registration_Fee_Paid:D

    invoke-interface {p1, v0, v1, v2}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 116
    iget-object v0, p2, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    const/16 v1, 0xa

    if-nez v0, :cond_4

    .line 117
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4

    .line 119
    :cond_4
    iget-object v0, p2, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 121
    :goto_4
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

    .line 82
    check-cast p2, Lcom/trimline/metrocrew/Member;

    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/Member_dao_Impl$3;->bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/Member;)V

    return-void
.end method

.method protected createQuery()Ljava/lang/String;
    .locals 1

    .line 86
    const-string v0, "UPDATE OR ABORT `Member` SET `No` = ?,`Name` = ?,`ID_No` = ?,`Phone_No` = ?,`Outstanding_Balance` = ?,`Shares_Retained` = ?,`Current_Shares` = ?,`Current_Savings` = ?,`Registration_Fee_Paid` = ? WHERE `No` = ?"

    return-object v0
.end method
