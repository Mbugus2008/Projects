.class Lcom/trimline/metrocrew/worker$9;
.super Ljava/lang/Object;
.source "worker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/worker;->postReceiptHeader()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/worker;

.field final synthetic val$Dao:Lcom/trimline/metrocrew/theader$dao;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/worker;Lcom/trimline/metrocrew/theader$dao;)V
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

    .line 330
    iput-object p1, p0, Lcom/trimline/metrocrew/worker$9;->this$0:Lcom/trimline/metrocrew/worker;

    iput-object p2, p0, Lcom/trimline/metrocrew/worker$9;->val$Dao:Lcom/trimline/metrocrew/theader$dao;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 333
    new-instance v0, Lcom/google/gson/GsonBuilder;

    invoke-direct {v0}, Lcom/google/gson/GsonBuilder;-><init>()V

    const-string v1, "yyyy-MM-dd HH:mm:ss"

    invoke-virtual {v0, v1}, Lcom/google/gson/GsonBuilder;->setDateFormat(Ljava/lang/String;)Lcom/google/gson/GsonBuilder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/gson/GsonBuilder;->create()Lcom/google/gson/Gson;

    move-result-object v0

    .line 335
    .local v0, "g":Lcom/google/gson/Gson;
    iget-object v2, p0, Lcom/trimline/metrocrew/worker$9;->val$Dao:Lcom/trimline/metrocrew/theader$dao;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/trimline/metrocrew/theader$dao;->loadAll(Z)Ljava/util/List;

    move-result-object v2

    .line 337
    .local v2, "receiptList":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/theader;>;"
    const-string v3, "Posting Header==>All"

    invoke-virtual {v0, v2}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 339
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/trimline/metrocrew/theader;

    .line 340
    .local v4, "t":Lcom/trimline/metrocrew/theader;
    invoke-virtual {v0, v4}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 342
    .local v5, "data":Ljava/lang/String;
    const-string v6, "Posting Header==>Data"

    invoke-static {v6, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 344
    const-string v6, "receipts"

    const-string v7, "data"

    invoke-static {v6, v7, v5}, Lcom/trimline/metrocrew/JsonParser;->postjson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 345
    .local v6, "result":Ljava/lang/String;
    new-instance v7, Lcom/trimline/metrocrew/worker$9$1;

    invoke-direct {v7, p0}, Lcom/trimline/metrocrew/worker$9$1;-><init>(Lcom/trimline/metrocrew/worker$9;)V

    invoke-virtual {v7}, Lcom/trimline/metrocrew/worker$9$1;->getType()Ljava/lang/reflect/Type;

    move-result-object v7

    .line 346
    .local v7, "localType":Ljava/lang/reflect/Type;
    new-instance v8, Lcom/google/gson/GsonBuilder;

    invoke-direct {v8}, Lcom/google/gson/GsonBuilder;-><init>()V

    invoke-virtual {v8, v1}, Lcom/google/gson/GsonBuilder;->setDateFormat(Ljava/lang/String;)Lcom/google/gson/GsonBuilder;

    move-result-object v8

    invoke-virtual {v8}, Lcom/google/gson/GsonBuilder;->create()Lcom/google/gson/Gson;

    move-result-object v8

    invoke-virtual {v8, v6, v7}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/trimline/metrocrew/theader;

    .line 347
    .local v8, "res":Lcom/trimline/metrocrew/theader;
    if-eqz v8, :cond_0

    .line 348
    iget-object v9, v8, Lcom/trimline/metrocrew/theader;->Key:Ljava/lang/String;

    if-eqz v9, :cond_0

    .line 350
    const/4 v9, 0x1

    iput-boolean v9, v8, Lcom/trimline/metrocrew/theader;->sent:Z

    .line 351
    iget-object v9, p0, Lcom/trimline/metrocrew/worker$9;->val$Dao:Lcom/trimline/metrocrew/theader$dao;

    invoke-virtual {v9, v8}, Lcom/trimline/metrocrew/theader$dao;->update(Lcom/trimline/metrocrew/theader;)V

    .line 353
    .end local v4    # "t":Lcom/trimline/metrocrew/theader;
    .end local v5    # "data":Ljava/lang/String;
    .end local v6    # "result":Ljava/lang/String;
    .end local v7    # "localType":Ljava/lang/reflect/Type;
    .end local v8    # "res":Lcom/trimline/metrocrew/theader;
    :cond_0
    goto :goto_0

    .line 355
    :cond_1
    return-void
.end method
