.class Lcom/trimline/metrocrew/loan$Repository$DeleteloanAsyncTask;
.super Landroid/os/AsyncTask;
.source "loan.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/loan$Repository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DeleteloanAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Lcom/trimline/metrocrew/loan;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private dao:Lcom/trimline/metrocrew/loan$dao;

.field final synthetic this$0:Lcom/trimline/metrocrew/loan$Repository;


# direct methods
.method private constructor <init>(Lcom/trimline/metrocrew/loan$Repository;Lcom/trimline/metrocrew/loan$dao;)V
    .locals 0
    .param p2, "dao"    # Lcom/trimline/metrocrew/loan$dao;
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

    .line 140
    iput-object p1, p0, Lcom/trimline/metrocrew/loan$Repository$DeleteloanAsyncTask;->this$0:Lcom/trimline/metrocrew/loan$Repository;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 141
    iput-object p2, p0, Lcom/trimline/metrocrew/loan$Repository$DeleteloanAsyncTask;->dao:Lcom/trimline/metrocrew/loan$dao;

    .line 142
    return-void
.end method

.method synthetic constructor <init>(Lcom/trimline/metrocrew/loan$Repository;Lcom/trimline/metrocrew/loan$dao;Lcom/trimline/metrocrew/loan$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trimline/metrocrew/loan$Repository;
    .param p2, "x1"    # Lcom/trimline/metrocrew/loan$dao;
    .param p3, "x2"    # Lcom/trimline/metrocrew/loan$1;

    .line 137
    invoke-direct {p0, p1, p2}, Lcom/trimline/metrocrew/loan$Repository$DeleteloanAsyncTask;-><init>(Lcom/trimline/metrocrew/loan$Repository;Lcom/trimline/metrocrew/loan$dao;)V

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
            "loans"
        }
    .end annotation

    .line 137
    check-cast p1, [Lcom/trimline/metrocrew/loan;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/loan$Repository$DeleteloanAsyncTask;->doInBackground([Lcom/trimline/metrocrew/loan;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Lcom/trimline/metrocrew/loan;)Ljava/lang/Void;
    .locals 2
    .param p1, "loans"    # [Lcom/trimline/metrocrew/loan;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "loans"
        }
    .end annotation

    .line 146
    iget-object v0, p0, Lcom/trimline/metrocrew/loan$Repository$DeleteloanAsyncTask;->dao:Lcom/trimline/metrocrew/loan$dao;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/loan$dao;->delete(Lcom/trimline/metrocrew/loan;)V

    .line 147
    const/4 v0, 0x0

    return-object v0
.end method
