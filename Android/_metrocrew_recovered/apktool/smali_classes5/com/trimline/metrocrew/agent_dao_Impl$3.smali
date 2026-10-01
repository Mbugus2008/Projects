.class Lcom/trimline/metrocrew/agent_dao_Impl$3;
.super Landroidx/room/EntityDeleteOrUpdateAdapter;
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
        "Landroidx/room/EntityDeleteOrUpdateAdapter<",
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

    .line 95
    iput-object p1, p0, Lcom/trimline/metrocrew/agent_dao_Impl$3;->this$0:Lcom/trimline/metrocrew/agent_dao_Impl;

    invoke-direct {p0}, Landroidx/room/EntityDeleteOrUpdateAdapter;-><init>()V

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

    .line 104
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Agent_Code:Ljava/lang/String;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 105
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 107
    :cond_0
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Agent_Code:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 109
    :goto_0
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Customer_ID_No:Ljava/lang/String;

    const/4 v1, 0x2

    if-nez v0, :cond_1

    .line 110
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 112
    :cond_1
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Customer_ID_No:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 114
    :goto_1
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Mobile_No:Ljava/lang/String;

    const/4 v1, 0x3

    if-nez v0, :cond_2

    .line 115
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2

    .line 117
    :cond_2
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Mobile_No:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 119
    :goto_2
    iget v0, p2, Lcom/trimline/metrocrew/agent;->Status:I

    int-to-long v0, v0

    const/4 v2, 0x4

    invoke-interface {p1, v2, v0, v1}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 120
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Name:Ljava/lang/String;

    const/4 v1, 0x5

    if-nez v0, :cond_3

    .line 121
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_3

    .line 123
    :cond_3
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Name:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 125
    :goto_3
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Account:Ljava/lang/String;

    const/4 v1, 0x6

    if-nez v0, :cond_4

    .line 126
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4

    .line 128
    :cond_4
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Account:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 130
    :goto_4
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Password:Ljava/lang/String;

    const/4 v1, 0x7

    if-nez v0, :cond_5

    .line 131
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_5

    .line 133
    :cond_5
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Password:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 135
    :goto_5
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Constituency:Ljava/lang/String;

    const/16 v1, 0x8

    if-nez v0, :cond_6

    .line 136
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_6

    .line 138
    :cond_6
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Constituency:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 140
    :goto_6
    iget v0, p2, Lcom/trimline/metrocrew/agent;->Account_type:I

    int-to-long v0, v0

    const/16 v2, 0x9

    invoke-interface {p1, v2, v0, v1}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 141
    const/16 v0, 0xa

    iget-wide v1, p2, Lcom/trimline/metrocrew/agent;->Balance:D

    invoke-interface {p1, v0, v1, v2}, Landroidx/sqlite/SQLiteStatement;->bindDouble(ID)V

    .line 142
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Agent_Code:Ljava/lang/String;

    const/16 v1, 0xb

    if-nez v0, :cond_7

    .line 143
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_7

    .line 145
    :cond_7
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Agent_Code:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 147
    :goto_7
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

    .line 95
    check-cast p2, Lcom/trimline/metrocrew/agent;

    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/agent_dao_Impl$3;->bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/agent;)V

    return-void
.end method

.method protected createQuery()Ljava/lang/String;
    .locals 1

    .line 99
    const-string v0, "UPDATE OR ABORT `agent` SET `Agent_Code` = ?,`Customer_ID_No` = ?,`Mobile_No` = ?,`Status` = ?,`Name` = ?,`Account` = ?,`Password` = ?,`Constituency` = ?,`Account_type` = ?,`Balance` = ? WHERE `Agent_Code` = ?"

    return-object v0
.end method
