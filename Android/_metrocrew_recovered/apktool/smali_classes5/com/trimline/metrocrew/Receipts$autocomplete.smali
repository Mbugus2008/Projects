.class Lcom/trimline/metrocrew/Receipts$autocomplete;
.super Landroid/os/AsyncTask;
.source "Receipts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Receipts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "autocomplete"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field members:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/Member;",
            ">;"
        }
    .end annotation
.end field

.field paymodes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/payment_modes;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/trimline/metrocrew/Receipts;

.field typess:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/types;",
            ">;"
        }
    .end annotation
.end field

.field vehicles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/Vehicles;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/trimline/metrocrew/Receipts;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 414
    iput-object p1, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->this$0:Lcom/trimline/metrocrew/Receipts;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/trimline/metrocrew/Receipts;Lcom/trimline/metrocrew/Receipts$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trimline/metrocrew/Receipts;
    .param p2, "x1"    # Lcom/trimline/metrocrew/Receipts$1;

    .line 414
    invoke-direct {p0, p1}, Lcom/trimline/metrocrew/Receipts$autocomplete;-><init>(Lcom/trimline/metrocrew/Receipts;)V

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
            "agents"
        }
    .end annotation

    .line 414
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/Receipts$autocomplete;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 1
    .param p1, "agents"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "agents"
        }
    .end annotation

    .line 424
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v0, v0, Lcom/trimline/metrocrew/Receipts;->model:Lcom/trimline/metrocrew/Member$Model;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/Member$Model;->getallmbers()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->members:Ljava/util/List;

    .line 425
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v0, v0, Lcom/trimline/metrocrew/Receipts;->tmodel:Lcom/trimline/metrocrew/types$Model;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/types$Model;->getalltypes()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->typess:Ljava/util/List;

    .line 426
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v0, v0, Lcom/trimline/metrocrew/Receipts;->pmodel:Lcom/trimline/metrocrew/payment_modes$Model;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/payment_modes$Model;->getall()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->paymodes:Ljava/util/List;

    .line 427
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v0, v0, Lcom/trimline/metrocrew/Receipts;->vmodel:Lcom/trimline/metrocrew/Vehicles$Model;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/Vehicles$Model;->getall()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->vehicles:Ljava/util/List;

    .line 429
    const/4 v0, 0x0

    return-object v0
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

    .line 414
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/Receipts$autocomplete;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 8
    .param p1, "res"    # Ljava/lang/Void;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "res"
        }
    .end annotation

    .line 439
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->this$0:Lcom/trimline/metrocrew/Receipts;

    new-instance v1, Lcom/trimline/metrocrew/Member$autocomplete;

    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->this$0:Lcom/trimline/metrocrew/Receipts;

    const v3, 0x7f0d0022

    iget-object v4, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->members:Ljava/util/List;

    invoke-direct {v1, v2, v3, v4}, Lcom/trimline/metrocrew/Member$autocomplete;-><init>(Landroid/content/Context;ILjava/util/List;)V

    iput-object v1, v0, Lcom/trimline/metrocrew/Receipts;->adapter:Lcom/trimline/metrocrew/Member$autocomplete;

    .line 440
    iget-object v0, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v0, v0, Lcom/trimline/metrocrew/Receipts;->memberno:Landroid/widget/AutoCompleteTextView;

    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v1, v1, Lcom/trimline/metrocrew/Receipts;->adapter:Lcom/trimline/metrocrew/Member$autocomplete;

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 442
    new-instance v0, Lcom/trimline/metrocrew/types;

    invoke-direct {v0}, Lcom/trimline/metrocrew/types;-><init>()V

    .line 443
    .local v0, "t":Lcom/trimline/metrocrew/types;
    const/4 v1, 0x0

    iput-object v1, v0, Lcom/trimline/metrocrew/types;->Code:Ljava/lang/String;

    .line 444
    const-string v2, ""

    iput-object v2, v0, Lcom/trimline/metrocrew/types;->Name:Ljava/lang/String;

    .line 445
    iget-object v3, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->typess:Ljava/util/List;

    const/4 v4, 0x0

    invoke-interface {v3, v4, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 446
    new-instance v3, Landroid/widget/ArrayAdapter;

    iget-object v5, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->this$0:Lcom/trimline/metrocrew/Receipts;

    const v6, 0x7f0d006e

    iget-object v7, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->typess:Ljava/util/List;

    invoke-direct {v3, v5, v6, v7}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 447
    .local v3, "dataAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/trimline/metrocrew/types;>;"
    iget-object v5, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v5, v5, Lcom/trimline/metrocrew/Receipts;->ttypes:Landroid/widget/Spinner;

    invoke-virtual {v5, v3}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 450
    new-instance v5, Lcom/trimline/metrocrew/payment_modes;

    invoke-direct {v5}, Lcom/trimline/metrocrew/payment_modes;-><init>()V

    .line 451
    .local v5, "p":Lcom/trimline/metrocrew/payment_modes;
    iput-object v1, v5, Lcom/trimline/metrocrew/payment_modes;->Code:Ljava/lang/String;

    .line 452
    iput-object v2, v5, Lcom/trimline/metrocrew/payment_modes;->Name:Ljava/lang/String;

    .line 453
    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->paymodes:Ljava/util/List;

    invoke-interface {v1, v4, v5}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 454
    new-instance v1, Landroid/widget/ArrayAdapter;

    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->this$0:Lcom/trimline/metrocrew/Receipts;

    const v4, 0x7f0d0076

    iget-object v6, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->paymodes:Ljava/util/List;

    invoke-direct {v1, v2, v4, v6}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 455
    .local v1, "dataAdapterpaymodes":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Lcom/trimline/metrocrew/payment_modes;>;"
    iget-object v2, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v2, v2, Lcom/trimline/metrocrew/Receipts;->paymentmodes:Landroid/widget/Spinner;

    invoke-virtual {v2, v1}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 457
    new-instance v2, Lcom/google/gson/Gson;

    invoke-direct {v2}, Lcom/google/gson/Gson;-><init>()V

    iget-object v4, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->vehicles:Ljava/util/List;

    invoke-virtual {v2, v4}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "Vehicles"

    invoke-static {v4, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 458
    new-instance v2, Lcom/trimline/metrocrew/Vehicles$autocomplete;

    iget-object v4, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->this$0:Lcom/trimline/metrocrew/Receipts;

    const v6, 0x7f0d0023

    iget-object v7, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->vehicles:Ljava/util/List;

    invoke-direct {v2, v4, v6, v7}, Lcom/trimline/metrocrew/Vehicles$autocomplete;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 459
    .local v2, "v":Lcom/trimline/metrocrew/Vehicles$autocomplete;
    iget-object v4, p0, Lcom/trimline/metrocrew/Receipts$autocomplete;->this$0:Lcom/trimline/metrocrew/Receipts;

    iget-object v4, v4, Lcom/trimline/metrocrew/Receipts;->vehicle:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v4, v2}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 460
    return-void
.end method
