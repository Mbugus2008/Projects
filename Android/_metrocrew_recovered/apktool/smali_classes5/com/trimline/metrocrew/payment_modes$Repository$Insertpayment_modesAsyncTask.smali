.class Lcom/trimline/metrocrew/payment_modes$Repository$Insertpayment_modesAsyncTask;
.super Landroid/os/AsyncTask;
.source "payment_modes.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/payment_modes$Repository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Insertpayment_modesAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Lcom/trimline/metrocrew/payment_modes;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private dao:Lcom/trimline/metrocrew/payment_modes$dao;

.field final synthetic this$0:Lcom/trimline/metrocrew/payment_modes$Repository;


# direct methods
.method private constructor <init>(Lcom/trimline/metrocrew/payment_modes$Repository;Lcom/trimline/metrocrew/payment_modes$dao;)V
    .locals 0
    .param p2, "dao"    # Lcom/trimline/metrocrew/payment_modes$dao;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            "this$0",
            "dao"
        }
    .end annotation

    .line 77
    iput-object p1, p0, Lcom/trimline/metrocrew/payment_modes$Repository$Insertpayment_modesAsyncTask;->this$0:Lcom/trimline/metrocrew/payment_modes$Repository;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 78
    iput-object p2, p0, Lcom/trimline/metrocrew/payment_modes$Repository$Insertpayment_modesAsyncTask;->dao:Lcom/trimline/metrocrew/payment_modes$dao;

    .line 79
    return-void
.end method

.method synthetic constructor <init>(Lcom/trimline/metrocrew/payment_modes$Repository;Lcom/trimline/metrocrew/payment_modes$dao;Lcom/trimline/metrocrew/payment_modes$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trimline/metrocrew/payment_modes$Repository;
    .param p2, "x1"    # Lcom/trimline/metrocrew/payment_modes$dao;
    .param p3, "x2"    # Lcom/trimline/metrocrew/payment_modes$1;

    .line 74
    invoke-direct {p0, p1, p2}, Lcom/trimline/metrocrew/payment_modes$Repository$Insertpayment_modesAsyncTask;-><init>(Lcom/trimline/metrocrew/payment_modes$Repository;Lcom/trimline/metrocrew/payment_modes$dao;)V

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
            "payment_modess"
        }
    .end annotation

    .line 74
    check-cast p1, [Lcom/trimline/metrocrew/payment_modes;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/payment_modes$Repository$Insertpayment_modesAsyncTask;->doInBackground([Lcom/trimline/metrocrew/payment_modes;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Lcom/trimline/metrocrew/payment_modes;)Ljava/lang/Void;
    .locals 2
    .param p1, "payment_modess"    # [Lcom/trimline/metrocrew/payment_modes;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "payment_modess"
        }
    .end annotation

    .line 83
    iget-object v0, p0, Lcom/trimline/metrocrew/payment_modes$Repository$Insertpayment_modesAsyncTask;->dao:Lcom/trimline/metrocrew/payment_modes$dao;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/payment_modes$dao;->insert(Lcom/trimline/metrocrew/payment_modes;)V

    .line 84
    const/4 v0, 0x0

    return-object v0
.end method
