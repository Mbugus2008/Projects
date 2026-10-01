.class Lcom/trimline/metrocrew/MainActivity$tillbalances;
.super Landroid/os/AsyncTask;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/MainActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "tillbalances"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Lcom/trimline/metrocrew/agent;",
        "Ljava/util/List<",
        "Lcom/trimline/metrocrew/agent;",
        ">;>;"
    }
.end annotation


# instance fields
.field aa:Lcom/trimline/metrocrew/agent;

.field final synthetic this$0:Lcom/trimline/metrocrew/MainActivity;


# direct methods
.method public constructor <init>(Lcom/trimline/metrocrew/MainActivity;Lcom/trimline/metrocrew/agent;)V
    .locals 0
    .param p2, "a"    # Lcom/trimline/metrocrew/agent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            "this$0",
            "a"
        }
    .end annotation

    .line 281
    iput-object p1, p0, Lcom/trimline/metrocrew/MainActivity$tillbalances;->this$0:Lcom/trimline/metrocrew/MainActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 282
    iput-object p2, p0, Lcom/trimline/metrocrew/MainActivity$tillbalances;->aa:Lcom/trimline/metrocrew/agent;

    .line 283
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "params"
        }
    .end annotation

    .line 279
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/MainActivity$tillbalances;->doInBackground([Ljava/lang/Void;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/util/List;
    .locals 5
    .param p1, "params"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "params"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/agent;",
            ">;"
        }
    .end annotation

    .line 287
    const/4 v0, 0x0

    .line 288
    .local v0, "results":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/agent;>;"
    const/4 v1, 0x0

    .line 290
    .local v1, "result":Ljava/lang/String;
    :try_start_0
    new-instance v2, Lcom/google/gson/Gson;

    invoke-direct {v2}, Lcom/google/gson/Gson;-><init>()V

    .line 292
    .local v2, "g":Lcom/google/gson/Gson;
    const-string v3, "Users"

    const/4 v4, 0x0

    invoke-static {v3, v4, v4}, Lcom/trimline/metrocrew/JsonParser;->postjson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object v1, v3

    .line 293
    new-instance v3, Lcom/trimline/metrocrew/MainActivity$tillbalances$1;

    invoke-direct {v3, p0}, Lcom/trimline/metrocrew/MainActivity$tillbalances$1;-><init>(Lcom/trimline/metrocrew/MainActivity$tillbalances;)V

    .line 294
    invoke-virtual {v3}, Lcom/trimline/metrocrew/MainActivity$tillbalances$1;->getType()Ljava/lang/reflect/Type;

    move-result-object v3

    .line 295
    .local v3, "localType":Ljava/lang/reflect/Type;
    new-instance v4, Lcom/google/gson/Gson;

    invoke-direct {v4}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v4, v1, v3}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v4

    .line 296
    nop

    .line 302
    .end local v2    # "g":Lcom/google/gson/Gson;
    .end local v3    # "localType":Ljava/lang/reflect/Type;
    goto :goto_0

    .line 299
    :catch_0
    move-exception v2

    .line 301
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 303
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_0
    return-object v0
.end method

.method synthetic lambda$onPostExecute$0$com-trimline-metrocrew-MainActivity$tillbalances(Lcom/trimline/metrocrew/agent;)Z
    .locals 2
    .param p1, "o"    # Lcom/trimline/metrocrew/agent;

    .line 311
    iget-object v0, p1, Lcom/trimline/metrocrew/agent;->Agent_Code:Ljava/lang/String;

    iget-object v1, p0, Lcom/trimline/metrocrew/MainActivity$tillbalances;->aa:Lcom/trimline/metrocrew/agent;

    iget-object v1, v1, Lcom/trimline/metrocrew/agent;->Agent_Code:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "res"
        }
    .end annotation

    .line 279
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/MainActivity$tillbalances;->onPostExecute(Ljava/util/List;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "res"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/agent;",
            ">;)V"
        }
    .end annotation

    .line 309
    .local p1, "res":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/agent;>;"
    if-eqz p1, :cond_0

    .line 310
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 311
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v1, Lcom/trimline/metrocrew/MainActivity$tillbalances$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/trimline/metrocrew/MainActivity$tillbalances$$ExternalSyntheticLambda0;-><init>(Lcom/trimline/metrocrew/MainActivity$tillbalances;)V

    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v0

    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 312
    .local v0, "a":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/agent;>;"
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 313
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trimline/metrocrew/agent;

    sput-object v1, Lcom/trimline/metrocrew/agent$Model;->CurrentAgent:Lcom/trimline/metrocrew/agent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 316
    .end local v0    # "a":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/agent;>;"
    :catch_0
    move-exception v0

    .line 317
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 318
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_0
    :goto_0
    nop

    .line 319
    :goto_1
    return-void
.end method
