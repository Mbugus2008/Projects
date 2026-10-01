.class Lcom/trimline/metrocrew/types_dao_Impl$2;
.super Landroidx/room/EntityDeleteOrUpdateAdapter;
.source "types_dao_Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/types_dao_Impl;-><init>(Landroidx/room/RoomDatabase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/room/EntityDeleteOrUpdateAdapter<",
        "Lcom/trimline/metrocrew/types;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/types_dao_Impl;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/types_dao_Impl;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/types_dao_Impl;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 64
    iput-object p1, p0, Lcom/trimline/metrocrew/types_dao_Impl$2;->this$0:Lcom/trimline/metrocrew/types_dao_Impl;

    invoke-direct {p0}, Landroidx/room/EntityDeleteOrUpdateAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method protected bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/types;)V
    .locals 2
    .param p1, "statement"    # Landroidx/sqlite/SQLiteStatement;
    .param p2, "entity"    # Lcom/trimline/metrocrew/types;
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

    .line 73
    iget-object v0, p2, Lcom/trimline/metrocrew/types;->Code:Ljava/lang/String;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 74
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 76
    :cond_0
    iget-object v0, p2, Lcom/trimline/metrocrew/types;->Code:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 78
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

    .line 64
    check-cast p2, Lcom/trimline/metrocrew/types;

    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/types_dao_Impl$2;->bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/types;)V

    return-void
.end method

.method protected createQuery()Ljava/lang/String;
    .locals 1

    .line 68
    const-string v0, "DELETE FROM `types` WHERE `Code` = ?"

    return-object v0
.end method
