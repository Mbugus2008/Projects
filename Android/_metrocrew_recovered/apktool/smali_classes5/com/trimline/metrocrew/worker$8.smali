.class Lcom/trimline/metrocrew/worker$8;
.super Ljava/lang/Object;
.source "worker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/worker;->postReceiptLines()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/worker;

.field final synthetic val$Dao:Lcom/trimline/metrocrew/transaction$dao;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/worker;Lcom/trimline/metrocrew/transaction$dao;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/worker;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$Dao"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 297
    iput-object p1, p0, Lcom/trimline/metrocrew/worker$8;->this$0:Lcom/trimline/metrocrew/worker;

    iput-object p2, p0, Lcom/trimline/metrocrew/worker$8;->val$Dao:Lcom/trimline/metrocrew/transaction$dao;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 300
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    .line 301
    .local v0, "g":Lcom/google/gson/Gson;
    iget-object v1, p0, Lcom/trimline/metrocrew/worker$8;->val$Dao:Lcom/trimline/metrocrew/transaction$dao;

    invoke-virtual {v1}, Lcom/trimline/metrocrew/transaction$dao;->loadunsent()Ljava/util/List;

    move-result-object v1

    .line 302
    .local v1, "receiptList":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    const-string v2, "Posting Trans==>D1"

    invoke-virtual {v0, v1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/trimline/metrocrew/transaction;

    .line 304
    .local v3, "t":Lcom/trimline/metrocrew/transaction;
    invoke-virtual {v0, v3}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 305
    .local v4, "data":Ljava/lang/String;
    const-string v5, "Posting Trans==>D"

    invoke-static {v5, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    const-string v5, "receipts_line"

    const-string v6, "data"

    invoke-static {v5, v6, v4}, Lcom/trimline/metrocrew/JsonParser;->postjson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 307
    .local v5, "result":Ljava/lang/String;
    const-string v6, "Posting Trans==>R"

    invoke-static {v6, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 308
    new-instance v6, Lcom/trimline/metrocrew/worker$8$1;

    invoke-direct {v6, p0}, Lcom/trimline/metrocrew/worker$8$1;-><init>(Lcom/trimline/metrocrew/worker$8;)V

    invoke-virtual {v6}, Lcom/trimline/metrocrew/worker$8$1;->getType()Ljava/lang/reflect/Type;

    move-result-object v6

    .line 309
    .local v6, "localType":Ljava/lang/reflect/Type;
    new-instance v7, Lcom/google/gson/GsonBuilder;

    invoke-direct {v7}, Lcom/google/gson/GsonBuilder;-><init>()V

    const-string v8, "yyyy-MM-dd"

    invoke-virtual {v7, v8}, Lcom/google/gson/GsonBuilder;->setDateFormat(Ljava/lang/String;)Lcom/google/gson/GsonBuilder;

    move-result-object v7

    invoke-virtual {v7}, Lcom/google/gson/GsonBuilder;->create()Lcom/google/gson/Gson;

    move-result-object v7

    invoke-virtual {v7, v5, v6}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/trimline/metrocrew/transaction;

    .line 310
    .local v7, "res":Lcom/trimline/metrocrew/transaction;
    if-eqz v7, :cond_0

    .line 311
    iget-object v8, v7, Lcom/trimline/metrocrew/transaction;->Key:Ljava/lang/String;

    if-eqz v8, :cond_0

    .line 313
    const-string v8, "saving"

    invoke-static {v8, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 314
    const/4 v8, 0x1

    iput-boolean v8, v7, Lcom/trimline/metrocrew/transaction;->sent:Z

    .line 315
    iget-object v8, p0, Lcom/trimline/metrocrew/worker$8;->val$Dao:Lcom/trimline/metrocrew/transaction$dao;

    invoke-virtual {v8, v7}, Lcom/trimline/metrocrew/transaction$dao;->update(Lcom/trimline/metrocrew/transaction;)V

    .line 317
    .end local v3    # "t":Lcom/trimline/metrocrew/transaction;
    .end local v4    # "data":Ljava/lang/String;
    .end local v5    # "result":Ljava/lang/String;
    .end local v6    # "localType":Ljava/lang/reflect/Type;
    .end local v7    # "res":Lcom/trimline/metrocrew/transaction;
    :cond_0
    goto :goto_0

    .line 318
    :cond_1
    return-void
.end method
