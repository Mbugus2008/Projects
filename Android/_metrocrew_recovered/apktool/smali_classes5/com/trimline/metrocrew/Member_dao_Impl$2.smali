.class Lcom/trimline/metrocrew/Member_dao_Impl$2;
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

    .line 66
    iput-object p1, p0, Lcom/trimline/metrocrew/Member_dao_Impl$2;->this$0:Lcom/trimline/metrocrew/Member_dao_Impl;

    invoke-direct {p0}, Landroidx/room/EntityDeleteOrUpdateAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method protected bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/Member;)V
    .locals 2
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

    .line 75
    iget-object v0, p2, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 76
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 78
    :cond_0
    iget-object v0, p2, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 80
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

    .line 66
    check-cast p2, Lcom/trimline/metrocrew/Member;

    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/Member_dao_Impl$2;->bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/Member;)V

    return-void
.end method

.method protected createQuery()Ljava/lang/String;
    .locals 1

    .line 70
    const-string v0, "DELETE FROM `Member` WHERE `No` = ?"

    return-object v0
.end method
