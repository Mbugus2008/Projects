.class public Lcom/trimline/metrocrew/agent$Repository;
.super Ljava/lang/Object;
.source "agent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/agent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Repository"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/agent$Repository$InsertagentAsyncTask;,
        Lcom/trimline/metrocrew/agent$Repository$UpdateagentAsyncTask;,
        Lcom/trimline/metrocrew/agent$Repository$DeleteagentAsyncTask;
    }
.end annotation


# instance fields
.field private dao:Lcom/trimline/metrocrew/agent$dao;


# direct methods
.method public constructor <init>(Landroid/app/Application;)V
    .locals 2
    .param p1, "application"    # Landroid/app/Application;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "application"
        }
    .end annotation

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    invoke-static {p1}, Lcom/trimline/metrocrew/DB;->getInstance(Landroid/content/Context;)Lcom/trimline/metrocrew/DB;

    move-result-object v0

    .line 61
    .local v0, "database":Lcom/trimline/metrocrew/DB;
    invoke-virtual {v0}, Lcom/trimline/metrocrew/DB;->aDao()Lcom/trimline/metrocrew/agent$dao;

    move-result-object v1

    iput-object v1, p0, Lcom/trimline/metrocrew/agent$Repository;->dao:Lcom/trimline/metrocrew/agent$dao;

    .line 63
    return-void
.end method


# virtual methods
.method public delete(Lcom/trimline/metrocrew/agent;)V
    .locals 3
    .param p1, "agent"    # Lcom/trimline/metrocrew/agent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "agent"
        }
    .end annotation

    .line 79
    new-instance v0, Lcom/trimline/metrocrew/agent$Repository$DeleteagentAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/agent$Repository;->dao:Lcom/trimline/metrocrew/agent$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/agent$Repository$DeleteagentAsyncTask;-><init>(Lcom/trimline/metrocrew/agent$Repository;Lcom/trimline/metrocrew/agent$dao;Lcom/trimline/metrocrew/agent$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/agent;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/agent$Repository$DeleteagentAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 80
    return-void
.end method

.method public getagent(Lcom/trimline/metrocrew/agent;)Lcom/trimline/metrocrew/agent;
    .locals 3
    .param p1, "agent"    # Lcom/trimline/metrocrew/agent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "agent"
        }
    .end annotation

    .line 67
    iget-object v0, p0, Lcom/trimline/metrocrew/agent$Repository;->dao:Lcom/trimline/metrocrew/agent$dao;

    iget-object v1, p1, Lcom/trimline/metrocrew/agent;->Agent_Code:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Lcom/trimline/metrocrew/agent;->Password:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/trimline/metrocrew/agent$dao;->getagent(Ljava/lang/String;Ljava/lang/String;)Lcom/trimline/metrocrew/agent;

    move-result-object v0

    return-object v0
.end method

.method public insert(Lcom/trimline/metrocrew/agent;)V
    .locals 3
    .param p1, "agent"    # Lcom/trimline/metrocrew/agent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "agent"
        }
    .end annotation

    .line 71
    new-instance v0, Lcom/trimline/metrocrew/agent$Repository$InsertagentAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/agent$Repository;->dao:Lcom/trimline/metrocrew/agent$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/agent$Repository$InsertagentAsyncTask;-><init>(Lcom/trimline/metrocrew/agent$Repository;Lcom/trimline/metrocrew/agent$dao;Lcom/trimline/metrocrew/agent$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/agent;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/agent$Repository$InsertagentAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 72
    return-void
.end method

.method public update(Lcom/trimline/metrocrew/agent;)V
    .locals 3
    .param p1, "agent"    # Lcom/trimline/metrocrew/agent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "agent"
        }
    .end annotation

    .line 75
    new-instance v0, Lcom/trimline/metrocrew/agent$Repository$UpdateagentAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/agent$Repository;->dao:Lcom/trimline/metrocrew/agent$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/agent$Repository$UpdateagentAsyncTask;-><init>(Lcom/trimline/metrocrew/agent$Repository;Lcom/trimline/metrocrew/agent$dao;Lcom/trimline/metrocrew/agent$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/agent;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/agent$Repository$UpdateagentAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 76
    return-void
.end method
