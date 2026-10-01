.class Lcom/trimline/metrocrew/Member_dao_Impl$1;
.super Landroidx/room/EntityInsertAdapter;
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
        "Landroidx/room/EntityInsertAdapter<",
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

    .line 30
    iput-object p1, p0, Lcom/trimline/metrocrew/Member_dao_Impl$1;->this$0:Lcom/trimline/metrocrew/Member_dao_Impl;

    invoke-direct {p0}, Landroidx/room/EntityInsertAdapter;-><init>()V

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

    .line 39
    iget-object v0, p2, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 40
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 42
    :cond_0
    iget-object v0, p2, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 44
    :goto_0
    iget-object v0, p2, Lcom/trimline/metrocrew/Member;->Name:Ljava/lang/String;

    const/4 v1, 0x2

    if-nez v0, :cond_1

    .line 45
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 47
    :cond_1
    iget-object v0, p2, Lcom/trimline/metrocrew/Member;->Name:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 49
    :goto_1
    iget-object v0, p2, Lcom/trimline/metrocrew/Member;->ID_No:Ljava/lang/String;

    const/4 v1, 0x3

    if-nez v0, :cond_2

    .line 50
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2

    .line 52
    :cond_2
    iget-object v0, p2, Lcom/trimline/metrocrew/Member;->ID_No:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 54
    :goto_2
    iget-object v0, p2, Lcom/trimline/metrocrew/Member;->Phone_No:Ljava/lang/String;

    const/4 v1, 0x4

    if-nez v0, :cond_3

    .line 55
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_3

    .line 57
    :cond_3
    iget-object v0, p2, Lcom/trimline/metrocrew/Member;->Phone_No:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 59
    :goto_3
    const/4 v0, 0x5

    iget-wide v1, p2, Lcom/trimline/metrocrew/Member;->Outstanding_Balance:D

    invoke-interface {p1, v0, v1, v2}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 60
    const/4 v0, 0x6

    iget-wide v1, p2, Lcom/trimline/metrocrew/Member;->Shares_Retained:D

    invoke-interface {p1, v0, v1, v2}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 61
    const/4 v0, 0x7

    iget-wide v1, p2, Lcom/trimline/metrocrew/Member;->Current_Shares:D

    invoke-interface {p1, v0, v1, v2}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 62
    const/16 v0, 0x8

    iget-wide v1, p2, Lcom/trimline/metrocrew/Member;->Current_Savings:D

    invoke-interface {p1, v0, v1, v2}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 63
    const/16 v0, 0x9

    iget-wide v1, p2, Lcom/trimline/metrocrew/Member;->Registration_Fee_Paid:D

    invoke-interface {p1, v0, v1, v2}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 64
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

    .line 30
    check-cast p2, Lcom/trimline/metrocrew/Member;

    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/Member_dao_Impl$1;->bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/Member;)V

    return-void
.end method

.method protected createQuery()Ljava/lang/String;
    .locals 1

    .line 34
    const-string v0, "INSERT OR REPLACE INTO `Member` (`No`,`Name`,`ID_No`,`Phone_No`,`Outstanding_Balance`,`Shares_Retained`,`Current_Shares`,`Current_Savings`,`Registration_Fee_Paid`) VALUES (?,?,?,?,?,?,?,?,?)"

    return-object v0
.end method
