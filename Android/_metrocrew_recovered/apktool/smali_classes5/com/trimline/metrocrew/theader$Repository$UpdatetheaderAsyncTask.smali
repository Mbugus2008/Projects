.class Lcom/trimline/metrocrew/theader$Repository$UpdatetheaderAsyncTask;
.super Landroid/os/AsyncTask;
.source "theader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/theader$Repository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UpdatetheaderAsyncTask"
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

.field private theader:Lcom/trimline/metrocrew/theader;

.field final synthetic this$0:Lcom/trimline/metrocrew/theader$Repository;


# direct methods
.method private constructor <init>(Lcom/trimline/metrocrew/theader$Repository;Lcom/trimline/metrocrew/theader$dao;Lcom/trimline/metrocrew/theader;)V
    .locals 0
    .param p2, "dao"    # Lcom/trimline/metrocrew/theader$dao;
    .param p3, "theader1"    # Lcom/trimline/metrocrew/theader;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0,
            0x0
        }
        names = {
            "this$0",
            "dao",
            "theader1"
        }
    .end annotation

    .line 340
    iput-object p1, p0, Lcom/trimline/metrocrew/theader$Repository$UpdatetheaderAsyncTask;->this$0:Lcom/trimline/metrocrew/theader$Repository;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 341
    iput-object p2, p0, Lcom/trimline/metrocrew/theader$Repository$UpdatetheaderAsyncTask;->dao:Lcom/trimline/metrocrew/theader$dao;

    .line 342
    iput-object p3, p0, Lcom/trimline/metrocrew/theader$Repository$UpdatetheaderAsyncTask;->theader:Lcom/trimline/metrocrew/theader;

    .line 343
    return-void
.end method

.method synthetic constructor <init>(Lcom/trimline/metrocrew/theader$Repository;Lcom/trimline/metrocrew/theader$dao;Lcom/trimline/metrocrew/theader;Lcom/trimline/metrocrew/theader$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trimline/metrocrew/theader$Repository;
    .param p2, "x1"    # Lcom/trimline/metrocrew/theader$dao;
    .param p3, "x2"    # Lcom/trimline/metrocrew/theader;
    .param p4, "x3"    # Lcom/trimline/metrocrew/theader$1;

    .line 337
    invoke-direct {p0, p1, p2, p3}, Lcom/trimline/metrocrew/theader$Repository$UpdatetheaderAsyncTask;-><init>(Lcom/trimline/metrocrew/theader$Repository;Lcom/trimline/metrocrew/theader$dao;Lcom/trimline/metrocrew/theader;)V

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

    .line 337
    check-cast p1, [Lcom/trimline/metrocrew/theader;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/theader$Repository$UpdatetheaderAsyncTask;->doInBackground([Lcom/trimline/metrocrew/theader;)Ljava/lang/Void;

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

    .line 347
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    iget-object v1, p0, Lcom/trimline/metrocrew/theader$Repository$UpdatetheaderAsyncTask;->theader:Lcom/trimline/metrocrew/theader;

    invoke-virtual {v0, v1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Updating"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 348
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$Repository$UpdatetheaderAsyncTask;->dao:Lcom/trimline/metrocrew/theader$dao;

    iget-object v1, p0, Lcom/trimline/metrocrew/theader$Repository$UpdatetheaderAsyncTask;->theader:Lcom/trimline/metrocrew/theader;

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/theader$dao;->update(Lcom/trimline/metrocrew/theader;)V

    .line 349
    const/4 v0, 0x0

    return-object v0
.end method
