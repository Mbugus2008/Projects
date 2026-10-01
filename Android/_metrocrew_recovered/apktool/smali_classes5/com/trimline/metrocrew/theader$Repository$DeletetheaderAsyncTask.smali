.class Lcom/trimline/metrocrew/theader$Repository$DeletetheaderAsyncTask;
.super Landroid/os/AsyncTask;
.source "theader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/theader$Repository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DeletetheaderAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Lcom/trimline/metrocrew/theader;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private dao:Lcom/trimline/metrocrew/theader$dao;

.field final synthetic this$0:Lcom/trimline/metrocrew/theader$Repository;


# direct methods
.method private constructor <init>(Lcom/trimline/metrocrew/theader$Repository;Lcom/trimline/metrocrew/theader$dao;)V
    .locals 0
    .param p2, "dao"    # Lcom/trimline/metrocrew/theader$dao;
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

    .line 370
    iput-object p1, p0, Lcom/trimline/metrocrew/theader$Repository$DeletetheaderAsyncTask;->this$0:Lcom/trimline/metrocrew/theader$Repository;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 371
    iput-object p2, p0, Lcom/trimline/metrocrew/theader$Repository$DeletetheaderAsyncTask;->dao:Lcom/trimline/metrocrew/theader$dao;

    .line 372
    return-void
.end method

.method synthetic constructor <init>(Lcom/trimline/metrocrew/theader$Repository;Lcom/trimline/metrocrew/theader$dao;Lcom/trimline/metrocrew/theader$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trimline/metrocrew/theader$Repository;
    .param p2, "x1"    # Lcom/trimline/metrocrew/theader$dao;
    .param p3, "x2"    # Lcom/trimline/metrocrew/theader$1;

    .line 367
    invoke-direct {p0, p1, p2}, Lcom/trimline/metrocrew/theader$Repository$DeletetheaderAsyncTask;-><init>(Lcom/trimline/metrocrew/theader$Repository;Lcom/trimline/metrocrew/theader$dao;)V

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
            "theaders"
        }
    .end annotation

    .line 367
    check-cast p1, [Lcom/trimline/metrocrew/theader;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/theader$Repository$DeletetheaderAsyncTask;->doInBackground([Lcom/trimline/metrocrew/theader;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Lcom/trimline/metrocrew/theader;)Ljava/lang/Void;
    .locals 2
    .param p1, "theaders"    # [Lcom/trimline/metrocrew/theader;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "theaders"
        }
    .end annotation

    .line 376
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$Repository$DeletetheaderAsyncTask;->dao:Lcom/trimline/metrocrew/theader$dao;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/theader$dao;->delete(Lcom/trimline/metrocrew/theader;)V

    .line 377
    const/4 v0, 0x0

    return-object v0
.end method
