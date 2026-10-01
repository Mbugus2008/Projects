.class Lcom/trimline/metrocrew/agent$Repository$DeleteagentAsyncTask;
.super Landroid/os/AsyncTask;
.source "agent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/agent$Repository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DeleteagentAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Lcom/trimline/metrocrew/agent;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private dao:Lcom/trimline/metrocrew/agent$dao;

.field final synthetic this$0:Lcom/trimline/metrocrew/agent$Repository;


# direct methods
.method private constructor <init>(Lcom/trimline/metrocrew/agent$Repository;Lcom/trimline/metrocrew/agent$dao;)V
    .locals 0
    .param p2, "dao"    # Lcom/trimline/metrocrew/agent$dao;
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

    .line 115
    iput-object p1, p0, Lcom/trimline/metrocrew/agent$Repository$DeleteagentAsyncTask;->this$0:Lcom/trimline/metrocrew/agent$Repository;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 116
    iput-object p2, p0, Lcom/trimline/metrocrew/agent$Repository$DeleteagentAsyncTask;->dao:Lcom/trimline/metrocrew/agent$dao;

    .line 117
    return-void
.end method

.method synthetic constructor <init>(Lcom/trimline/metrocrew/agent$Repository;Lcom/trimline/metrocrew/agent$dao;Lcom/trimline/metrocrew/agent$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trimline/metrocrew/agent$Repository;
    .param p2, "x1"    # Lcom/trimline/metrocrew/agent$dao;
    .param p3, "x2"    # Lcom/trimline/metrocrew/agent$1;

    .line 112
    invoke-direct {p0, p1, p2}, Lcom/trimline/metrocrew/agent$Repository$DeleteagentAsyncTask;-><init>(Lcom/trimline/metrocrew/agent$Repository;Lcom/trimline/metrocrew/agent$dao;)V

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

    .line 112
    check-cast p1, [Lcom/trimline/metrocrew/agent;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/agent$Repository$DeleteagentAsyncTask;->doInBackground([Lcom/trimline/metrocrew/agent;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Lcom/trimline/metrocrew/agent;)Ljava/lang/Void;
    .locals 2
    .param p1, "agents"    # [Lcom/trimline/metrocrew/agent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "agents"
        }
    .end annotation

    .line 121
    iget-object v0, p0, Lcom/trimline/metrocrew/agent$Repository$DeleteagentAsyncTask;->dao:Lcom/trimline/metrocrew/agent$dao;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/agent$dao;->delete(Lcom/trimline/metrocrew/agent;)V

    .line 122
    const/4 v0, 0x0

    return-object v0
.end method
