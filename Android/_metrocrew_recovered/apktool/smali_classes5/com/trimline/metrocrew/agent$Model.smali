.class public Lcom/trimline/metrocrew/agent$Model;
.super Landroidx/lifecycle/AndroidViewModel;
.source "agent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/agent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Model"
.end annotation


# static fields
.field public static CurrentAgent:Lcom/trimline/metrocrew/agent;


# instance fields
.field private repository:Lcom/trimline/metrocrew/agent$Repository;


# direct methods
.method public constructor <init>(Landroid/app/Application;)V
    .locals 1
    .param p1, "application"    # Landroid/app/Application;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "application"
        }
    .end annotation

    .line 134
    invoke-direct {p0, p1}, Landroidx/lifecycle/AndroidViewModel;-><init>(Landroid/app/Application;)V

    .line 135
    new-instance v0, Lcom/trimline/metrocrew/agent$Repository;

    invoke-direct {v0, p1}, Lcom/trimline/metrocrew/agent$Repository;-><init>(Landroid/app/Application;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/agent$Model;->repository:Lcom/trimline/metrocrew/agent$Repository;

    .line 136
    return-void
.end method


# virtual methods
.method public agent(Lcom/trimline/metrocrew/agent;)Lcom/trimline/metrocrew/agent;
    .locals 1
    .param p1, "agent"    # Lcom/trimline/metrocrew/agent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "agent"
        }
    .end annotation

    .line 151
    iget-object v0, p0, Lcom/trimline/metrocrew/agent$Model;->repository:Lcom/trimline/metrocrew/agent$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/agent$Repository;->getagent(Lcom/trimline/metrocrew/agent;)Lcom/trimline/metrocrew/agent;

    move-result-object v0

    return-object v0
.end method

.method public delete(Lcom/trimline/metrocrew/agent;)V
    .locals 1
    .param p1, "agent"    # Lcom/trimline/metrocrew/agent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "agent"
        }
    .end annotation

    .line 147
    iget-object v0, p0, Lcom/trimline/metrocrew/agent$Model;->repository:Lcom/trimline/metrocrew/agent$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/agent$Repository;->delete(Lcom/trimline/metrocrew/agent;)V

    .line 148
    return-void
.end method

.method public insert(Lcom/trimline/metrocrew/agent;)V
    .locals 1
    .param p1, "agent"    # Lcom/trimline/metrocrew/agent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "agent"
        }
    .end annotation

    .line 139
    iget-object v0, p0, Lcom/trimline/metrocrew/agent$Model;->repository:Lcom/trimline/metrocrew/agent$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/agent$Repository;->insert(Lcom/trimline/metrocrew/agent;)V

    .line 140
    return-void
.end method

.method public update(Lcom/trimline/metrocrew/agent;)V
    .locals 1
    .param p1, "agent"    # Lcom/trimline/metrocrew/agent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "agent"
        }
    .end annotation

    .line 143
    iget-object v0, p0, Lcom/trimline/metrocrew/agent$Model;->repository:Lcom/trimline/metrocrew/agent$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/agent$Repository;->update(Lcom/trimline/metrocrew/agent;)V

    .line 144
    return-void
.end method
