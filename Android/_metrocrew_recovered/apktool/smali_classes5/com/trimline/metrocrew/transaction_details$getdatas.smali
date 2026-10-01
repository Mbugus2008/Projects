.class Lcom/trimline/metrocrew/transaction_details$getdatas;
.super Landroid/os/AsyncTask;
.source "transaction_details.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/transaction_details;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "getdatas"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/util/Date;",
        "Ljava/lang/Void;",
        "Ljava/util/List<",
        "Lcom/trimline/metrocrew/tlines;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/transaction_details;


# direct methods
.method private constructor <init>(Lcom/trimline/metrocrew/transaction_details;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 188
    iput-object p1, p0, Lcom/trimline/metrocrew/transaction_details$getdatas;->this$0:Lcom/trimline/metrocrew/transaction_details;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/trimline/metrocrew/transaction_details;Lcom/trimline/metrocrew/transaction_details$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trimline/metrocrew/transaction_details;
    .param p2, "x1"    # Lcom/trimline/metrocrew/transaction_details$1;

    .line 188
    invoke-direct {p0, p1}, Lcom/trimline/metrocrew/transaction_details$getdatas;-><init>(Lcom/trimline/metrocrew/transaction_details;)V

    return-void
.end method

.method static synthetic lambda$doInBackground$0(Lcom/trimline/metrocrew/tlines;Lcom/trimline/metrocrew/tlines;)I
    .locals 2
    .param p0, "p1"    # Lcom/trimline/metrocrew/tlines;
    .param p1, "p2"    # Lcom/trimline/metrocrew/tlines;

    .line 194
    iget-object v0, p0, Lcom/trimline/metrocrew/tlines;->theader:Lcom/trimline/metrocrew/theader;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/theader;->Getdatetime()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p1, Lcom/trimline/metrocrew/tlines;->theader:Lcom/trimline/metrocrew/theader;

    invoke-virtual {v1}, Lcom/trimline/metrocrew/theader;->Getdatetime()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "date"
        }
    .end annotation

    .line 188
    check-cast p1, [Ljava/util/Date;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/transaction_details$getdatas;->doInBackground([Ljava/util/Date;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/util/Date;)Ljava/util/List;
    .locals 3
    .param p1, "date"    # [Ljava/util/Date;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "date"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/util/Date;",
            ")",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/tlines;",
            ">;"
        }
    .end annotation

    .line 192
    const/4 v0, 0x0

    aget-object v0, p1, v0

    .line 193
    .local v0, "selectedDate":Ljava/util/Date;
    iget-object v1, p0, Lcom/trimline/metrocrew/transaction_details$getdatas;->this$0:Lcom/trimline/metrocrew/transaction_details;

    iget-object v2, p0, Lcom/trimline/metrocrew/transaction_details$getdatas;->this$0:Lcom/trimline/metrocrew/transaction_details;

    iget-object v2, v2, Lcom/trimline/metrocrew/transaction_details;->theaderModel:Lcom/trimline/metrocrew/theader$Model;

    invoke-virtual {v2, v0}, Lcom/trimline/metrocrew/theader$Model;->gettransactionreportdaily(Ljava/util/Date;)Ljava/util/List;

    move-result-object v2

    iput-object v2, v1, Lcom/trimline/metrocrew/transaction_details;->masterdata:Ljava/util/List;

    .line 194
    iget-object v1, p0, Lcom/trimline/metrocrew/transaction_details$getdatas;->this$0:Lcom/trimline/metrocrew/transaction_details;

    iget-object v1, v1, Lcom/trimline/metrocrew/transaction_details;->masterdata:Ljava/util/List;

    new-instance v2, Lcom/trimline/metrocrew/transaction_details$getdatas$$ExternalSyntheticLambda0;

    invoke-direct {v2}, Lcom/trimline/metrocrew/transaction_details$getdatas$$ExternalSyntheticLambda0;-><init>()V

    invoke-interface {v1, v2}, Ljava/util/List;->sort(Ljava/util/Comparator;)V

    .line 197
    iget-object v1, p0, Lcom/trimline/metrocrew/transaction_details$getdatas;->this$0:Lcom/trimline/metrocrew/transaction_details;

    iget-object v1, v1, Lcom/trimline/metrocrew/transaction_details;->masterdata:Ljava/util/List;

    return-object v1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "l"
        }
    .end annotation

    .line 188
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/transaction_details$getdatas;->onPostExecute(Ljava/util/List;)V

    return-void
.end method

.method protected onPostExecute(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "l"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/tlines;",
            ">;)V"
        }
    .end annotation

    .line 204
    .local p1, "l":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/tlines;>;"
    :try_start_0
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction_details$getdatas;->this$0:Lcom/trimline/metrocrew/transaction_details;

    iget-object v1, p0, Lcom/trimline/metrocrew/transaction_details$getdatas;->this$0:Lcom/trimline/metrocrew/transaction_details;

    iget-object v1, v1, Lcom/trimline/metrocrew/transaction_details;->d:Ljava/sql/Date;

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/transaction_details;->loaddata(Ljava/sql/Date;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 213
    goto :goto_0

    .line 211
    :catch_0
    move-exception v0

    .line 212
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 214
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_0
    return-void
.end method
