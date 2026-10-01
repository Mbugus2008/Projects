.class public Lcom/trimline/metrocrew/loan$Model;
.super Landroidx/lifecycle/AndroidViewModel;
.source "loan.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/loan;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Model"
.end annotation


# instance fields
.field private repository:Lcom/trimline/metrocrew/loan$Repository;


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

    .line 160
    invoke-direct {p0, p1}, Landroidx/lifecycle/AndroidViewModel;-><init>(Landroid/app/Application;)V

    .line 161
    new-instance v0, Lcom/trimline/metrocrew/loan$Repository;

    invoke-direct {v0, p1}, Lcom/trimline/metrocrew/loan$Repository;-><init>(Landroid/app/Application;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/loan$Model;->repository:Lcom/trimline/metrocrew/loan$Repository;

    .line 162
    return-void
.end method


# virtual methods
.method public delete(Lcom/trimline/metrocrew/loan;)V
    .locals 1
    .param p1, "loan"    # Lcom/trimline/metrocrew/loan;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "loan"
        }
    .end annotation

    .line 173
    iget-object v0, p0, Lcom/trimline/metrocrew/loan$Model;->repository:Lcom/trimline/metrocrew/loan$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/loan$Repository;->delete(Lcom/trimline/metrocrew/loan;)V

    .line 174
    return-void
.end method

.method public getall()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/loan;",
            ">;"
        }
    .end annotation

    .line 177
    iget-object v0, p0, Lcom/trimline/metrocrew/loan$Model;->repository:Lcom/trimline/metrocrew/loan$Repository;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/loan$Repository;->getloans()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getcustomerloans(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "s"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "s"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/loan;",
            ">;"
        }
    .end annotation

    .line 179
    iget-object v0, p0, Lcom/trimline/metrocrew/loan$Model;->repository:Lcom/trimline/metrocrew/loan$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/loan$Repository;->getmemberloans(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public insert(Lcom/trimline/metrocrew/loan;)V
    .locals 1
    .param p1, "loan"    # Lcom/trimline/metrocrew/loan;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "loan"
        }
    .end annotation

    .line 165
    iget-object v0, p0, Lcom/trimline/metrocrew/loan$Model;->repository:Lcom/trimline/metrocrew/loan$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/loan$Repository;->insert(Lcom/trimline/metrocrew/loan;)V

    .line 166
    return-void
.end method

.method public update(Lcom/trimline/metrocrew/loan;)V
    .locals 1
    .param p1, "loan"    # Lcom/trimline/metrocrew/loan;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "loan"
        }
    .end annotation

    .line 169
    iget-object v0, p0, Lcom/trimline/metrocrew/loan$Model;->repository:Lcom/trimline/metrocrew/loan$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/loan$Repository;->update(Lcom/trimline/metrocrew/loan;)V

    .line 170
    return-void
.end method
