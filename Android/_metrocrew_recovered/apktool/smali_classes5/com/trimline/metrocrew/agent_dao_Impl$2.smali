.class Lcom/trimline/metrocrew/agent_dao_Impl$2;
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

    .line 79
    iput-object p1, p0, Lcom/trimline/metrocrew/agent_dao_Impl$2;->this$0:Lcom/trimline/metrocrew/agent_dao_Impl;

    invoke-direct {p0}, Landroidx/room/EntityDeleteOrUpdateAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method protected bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/agent;)V
    .locals 2
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

    .line 88
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Agent_Code:Ljava/lang/String;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 89
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 91
    :cond_0
    iget-object v0, p2, Lcom/trimline/metrocrew/agent;->Agent_Code:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 93
    :goto_0
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

    .line 79
    check-cast p2, Lcom/trimline/metrocrew/agent;

    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/agent_dao_Impl$2;->bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/agent;)V

    return-void
.end method

.method protected createQuery()Ljava/lang/String;
    .locals 1

    .line 83
    const-string v0, "DELETE FROM `agent` WHERE `Agent_Code` = ?"

    return-object v0
.end method
