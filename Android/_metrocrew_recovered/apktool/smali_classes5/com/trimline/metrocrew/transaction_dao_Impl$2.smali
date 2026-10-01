.class Lcom/trimline/metrocrew/transaction_dao_Impl$2;
.super Landroidx/room/EntityDeleteOrUpdateAdapter;
.source "transaction_dao_Impl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/transaction_dao_Impl;-><init>(Landroidx/room/RoomDatabase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/room/EntityDeleteOrUpdateAdapter<",
        "Lcom/trimline/metrocrew/transaction;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/transaction_dao_Impl;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/transaction_dao_Impl;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/transaction_dao_Impl;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 452
    iput-object p1, p0, Lcom/trimline/metrocrew/transaction_dao_Impl$2;->this$0:Lcom/trimline/metrocrew/transaction_dao_Impl;

    invoke-direct {p0}, Landroidx/room/EntityDeleteOrUpdateAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method protected bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/transaction;)V
    .locals 2
    .param p1, "statement"    # Landroidx/sqlite/SQLiteStatement;
    .param p2, "entity"    # Lcom/trimline/metrocrew/transaction;
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

    .line 461
    iget-object v0, p2, Lcom/trimline/metrocrew/transaction;->No:Ljava/lang/String;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 462
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_0

    .line 464
    :cond_0
    iget-object v0, p2, Lcom/trimline/metrocrew/transaction;->No:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 466
    :goto_0
    iget-object v0, p2, Lcom/trimline/metrocrew/transaction;->Account_No:Ljava/lang/String;

    const/4 v1, 0x2

    if-nez v0, :cond_1

    .line 467
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_1

    .line 469
    :cond_1
    iget-object v0, p2, Lcom/trimline/metrocrew/transaction;->Account_No:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 471
    :goto_1
    iget-object v0, p2, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    const/4 v1, 0x3

    if-nez v0, :cond_2

    .line 472
    invoke-interface {p1, v1}, Landroidx/sqlite/SQLiteStatement;->bindNull(I)V

    goto :goto_2

    .line 474
    :cond_2
    iget-object v0, p2, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, Landroidx/sqlite/SQLiteStatement;->bindText(ILjava/lang/String;)V

    .line 476
    :goto_2
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

    .line 452
    check-cast p2, Lcom/trimline/metrocrew/transaction;

    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/transaction_dao_Impl$2;->bind(Landroidx/sqlite/SQLiteStatement;Lcom/trimline/metrocrew/transaction;)V

    return-void
.end method

.method protected createQuery()Ljava/lang/String;
    .locals 1

    .line 456
    const-string v0, "DELETE FROM `transaction` WHERE `No` = ? AND `Account_No` = ? AND `transtype` = ?"

    return-object v0
.end method
