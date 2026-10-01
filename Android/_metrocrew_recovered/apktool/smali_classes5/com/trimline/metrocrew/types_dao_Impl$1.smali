.class Lcom/trimline/metrocrew/types_dao_Impl$1;
.super Landroidx/room/EntityInsertAdapter;
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
        "Landroidx/room/EntityInsertAdapter<",
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

    .line 31
    iput-object p1, p0, Lcom/trimline/metrocrew/types_dao_Impl$1;->this$0:Lcom/trimline/metrocrew/types_dao_Impl;

    invoke-direct {p0}, Landroidx/room/EntityInsertAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method protected bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/types;)V
    .locals 4
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

    .line 40
    iget-object v0, p2, Lcom/trimline/metrocrew/types;->Code:Ljava/lang/String;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 41
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 43
    :cond_0
    iget-object v0, p2, Lcom/trimline/metrocrew/types;->Code:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 45
    :goto_0
    iget-object v0, p2, Lcom/trimline/metrocrew/types;->Name:Ljava/lang/String;

    const/4 v1, 0x2

    if-nez v0, :cond_1

    .line 46
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 48
    :cond_1
    iget-object v0, p2, Lcom/trimline/metrocrew/types;->Name:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 50
    :goto_1
    iget-object v0, p2, Lcom/trimline/metrocrew/types;->Active:Ljava/lang/Boolean;

    if-nez v0, :cond_2

    const/4 v0, 0x0

    goto :goto_2

    :cond_2
    iget-object v0, p2, Lcom/trimline/metrocrew/types;->Active:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 51
    .local v0, "_tmp":Ljava/lang/Integer;
    :goto_2
    const/4 v1, 0x3

    if-nez v0, :cond_3

    .line 52
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_3

    .line 54
    :cond_3
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-long v2, v2

    invoke-interface {p1, v1, v2, v3}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 56
    :goto_3
    iget-object v1, p2, Lcom/trimline/metrocrew/types;->Account:Ljava/lang/String;

    const/4 v2, 0x4

    if-nez v1, :cond_4

    .line 57
    invoke-interface {p1, v2}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_4

    .line 59
    :cond_4
    iget-object v1, p2, Lcom/trimline/metrocrew/types;->Account:Ljava/lang/String;

    invoke-interface {p1, v2, v1}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 61
    :goto_4
    iget v1, p2, Lcom/trimline/metrocrew/types;->Order:I

    int-to-long v1, v1

    const/4 v3, 0x5

    invoke-interface {p1, v3, v1, v2}, Landroidx/sqlite/SQLiteStatement;->bindLong(IJ)V

    .line 62
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

    .line 31
    check-cast p2, Lcom/trimline/metrocrew/types;

    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/types_dao_Impl$1;->bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/types;)V

    return-void
.end method

.method protected createQuery()Ljava/lang/String;
    .locals 1

    .line 35
    const-string v0, "INSERT OR REPLACE INTO `types` (`Code`,`Name`,`Active`,`Account`,`Order`) VALUES (?,?,?,?,?)"

    return-object v0
.end method
