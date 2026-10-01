.class Lcom/trimline/metrocrew/types$Repository$InserttypesAsyncTask;
.super Landroid/os/AsyncTask;
.source "types.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/types$Repository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InserttypesAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Lcom/trimline/metrocrew/types;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private dao:Lcom/trimline/metrocrew/types$dao;

.field final synthetic this$0:Lcom/trimline/metrocrew/types$Repository;


# direct methods
.method private constructor <init>(Lcom/trimline/metrocrew/types$Repository;Lcom/trimline/metrocrew/types$dao;)V
    .locals 0
    .param p2, "dao"    # Lcom/trimline/metrocrew/types$dao;
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

    .line 78
    iput-object p1, p0, Lcom/trimline/metrocrew/types$Repository$InserttypesAsyncTask;->this$0:Lcom/trimline/metrocrew/types$Repository;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 79
    iput-object p2, p0, Lcom/trimline/metrocrew/types$Repository$InserttypesAsyncTask;->dao:Lcom/trimline/metrocrew/types$dao;

    .line 80
    return-void
.end method

.method synthetic constructor <init>(Lcom/trimline/metrocrew/types$Repository;Lcom/trimline/metrocrew/types$dao;Lcom/trimline/metrocrew/types$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trimline/metrocrew/types$Repository;
    .param p2, "x1"    # Lcom/trimline/metrocrew/types$dao;
    .param p3, "x2"    # Lcom/trimline/metrocrew/types$1;

    .line 76
    invoke-direct {p0, p1, p2}, Lcom/trimline/metrocrew/types$Repository$InserttypesAsyncTask;-><init>(Lcom/trimline/metrocrew/types$Repository;Lcom/trimline/metrocrew/types$dao;)V

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
            "typess"
        }
    .end annotation

    .line 76
    check-cast p1, [Lcom/trimline/metrocrew/types;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/types$Repository$InserttypesAsyncTask;->doInBackground([Lcom/trimline/metrocrew/types;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Lcom/trimline/metrocrew/types;)Ljava/lang/Void;
    .locals 2
    .param p1, "typess"    # [Lcom/trimline/metrocrew/types;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "typess"
        }
    .end annotation

    .line 83
    iget-object v0, p0, Lcom/trimline/metrocrew/types$Repository$InserttypesAsyncTask;->dao:Lcom/trimline/metrocrew/types$dao;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/types$dao;->insert(Lcom/trimline/metrocrew/types;)V

    .line 84
    const/4 v0, 0x0

    return-object v0
.end method
