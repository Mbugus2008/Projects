.class Lcom/trimline/metrocrew/agent_dao_Impl$1;
.super Landroidx/room/EntityInsertAdapter;
.source "agent_dao_Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/agent_dao_Impl;-><init>(Landroidx/room/RoomDatabase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/room/EntityInsertAdapter<",
        "Lcom/trimline/metrocrew/agent;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/agent_dao_Impl;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/agent_dao_Impl;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/agent_dao_Impl;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 30
    iput-object p1, p0, Lcom/trimline/metrocrew/agent_dao_Impl$1;->this$0:Lcom/trimline/metrocrew/agent_dao_Impl;

    invoke-direct {p0}, Landroidx/room/EntityInsertAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method protected bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/agent;)V
    .locals 3
    .param p1, "statement"    # Landroidx/sqlite/SQLiteStatement;
    .param p2, "entity"    # Lcom/trimline/metrocrew/agent;
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
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Agent_Code:Ljava/lang/String;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 40
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 42
    :cond_0
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Agent_Code:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 44
    :goto_0
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Customer_ID_No:Ljava/lang/String;

    const/4 v1, 0x2

    if-nez v0, :cond_1

    .line 45
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 47
    :cond_1
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Customer_ID_No:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 49
    :goto_1
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Mobile_No:Ljava/lang/String;

    const/4 v1, 0x3

    if-nez v0, :cond_2

    .line 50
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2

    .line 52
    :cond_2
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Mobile_No:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 54
    :goto_2
    iget v0, p2, Lcom/trimline/metrocrew/agent;->Status:I

    int-to-long v0, v0

    const/4 v2, 0x4

    invoke-interface {p1, v2, v0, v1}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 55
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Name:Ljava/lang/String;

    const/4 v1, 0x5

    if-nez v0, :cond_3

    .line 56
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_3

    .line 58
    :cond_3
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Name:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 60
    :goto_3
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Account:Ljava/lang/String;

    const/4 v1, 0x6

    if-nez v0, :cond_4

    .line 61
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4

    .line 63
    :cond_4
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Account:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 65
    :goto_4
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Password:Ljava/lang/String;

    const/4 v1, 0x7

    if-nez v0, :cond_5

    .line 66
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_5

    .line 68
    :cond_5
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Password:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 70
    :goto_5
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Constituency:Ljava/lang/String;

    const/16 v1, 0x8

    if-nez v0, :cond_6

    .line 71
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_6

    .line 73
    :cond_6
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Constituency:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 75
    :goto_6
    iget v0, p2, Lcom/trimline/metrocrew/agent;->Account_type:I

    int-to-long v0, v0

    const/16 v2, 0x9

    invoke-interface {p1, v2, v0, v1}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 76
    const/16 v0, 0xa

    iget-wide v1, p2, Lcom/trimline/metrocrew/agent;->Balance:D

    invoke-interface {p1, v0, v1, v2}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 77
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
    check-cast p2, Lcom/trimline/metrocrew/agent;

    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/agent_dao_Impl$1;->bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/agent;)V

    return-void
.end method

.method protected createQuery()Ljava/lang/String;
    .locals 1

    .line 34
    const-string v0, "INSERT OR REPLACE INTO `agent` (`Agent_Code`,`Customer_ID_No`,`Mobile_No`,`Status`,`Name`,`Account`,`Password`,`Constituency`,`Account_type`,`Balance`) VALUES (?,?,?,?,?,?,?,?,?,?)"

    return-object v0
.end method
