.class public Lcom/trimline/metrocrew/loan$Repository;
.super Ljava/lang/Object;
.source "loan.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/loan;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Repository"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/loan$Repository$InsertloanAsyncTask;,
        Lcom/trimline/metrocrew/loan$Repository$UpdateloanAsyncTask;,
        Lcom/trimline/metrocrew/loan$Repository$DeleteloanAsyncTask;
    }
.end annotation


# instance fields
.field private dao:Lcom/trimline/metrocrew/loan$dao;


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

    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    invoke-static {p1}, Lcom/trimline/metrocrew/DB;->getInstance(Landroid/content/Context;)Lcom/trimline/metrocrew/DB;

    move-result-object v0

    .line 82
    .local v0, "database":Lcom/trimline/metrocrew/DB;
    invoke-virtual {v0}, Lcom/trimline/metrocrew/DB;->ldao()Lcom/trimline/metrocrew/loan$dao;

    move-result-object v1

    iput-object v1, p0, Lcom/trimline/metrocrew/loan$Repository;->dao:Lcom/trimline/metrocrew/loan$dao;

    .line 84
    return-void
.end method


# virtual methods
.method public delete(Lcom/trimline/metrocrew/loan;)V
    .locals 3
    .param p1, "loan"    # Lcom/trimline/metrocrew/loan;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "loan"
        }
    .end annotation

    .line 104
    new-instance v0, Lcom/trimline/metrocrew/loan$Repository$DeleteloanAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/loan$Repository;->dao:Lcom/trimline/metrocrew/loan$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/loan$Repository$DeleteloanAsyncTask;-><init>(Lcom/trimline/metrocrew/loan$Repository;Lcom/trimline/metrocrew/loan$dao;Lcom/trimline/metrocrew/loan$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/loan;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/loan$Repository$DeleteloanAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 105
    return-void
.end method

.method public getloans()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/loan;",
            ">;"
        }
    .end annotation

    .line 88
    iget-object v0, p0, Lcom/trimline/metrocrew/loan$Repository;->dao:Lcom/trimline/metrocrew/loan$dao;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/loan$dao;->getall()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getmemberloans(Ljava/lang/String;)Ljava/util/List;
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

    .line 91
    iget-object v0, p0, Lcom/trimline/metrocrew/loan$Repository;->dao:Lcom/trimline/metrocrew/loan$dao;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/loan$dao;->getmemberloans(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public insert(Lcom/trimline/metrocrew/loan;)V
    .locals 3
    .param p1, "loan"    # Lcom/trimline/metrocrew/loan;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "loan"
        }
    .end annotation

    .line 96
    new-instance v0, Lcom/trimline/metrocrew/loan$Repository$InsertloanAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/loan$Repository;->dao:Lcom/trimline/metrocrew/loan$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/loan$Repository$InsertloanAsyncTask;-><init>(Lcom/trimline/metrocrew/loan$Repository;Lcom/trimline/metrocrew/loan$dao;Lcom/trimline/metrocrew/loan$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/loan;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/loan$Repository$InsertloanAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 97
    return-void
.end method

.method public update(Lcom/trimline/metrocrew/loan;)V
    .locals 3
    .param p1, "loan"    # Lcom/trimline/metrocrew/loan;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "loan"
        }
    .end annotation

    .line 100
    new-instance v0, Lcom/trimline/metrocrew/loan$Repository$UpdateloanAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/loan$Repository;->dao:Lcom/trimline/metrocrew/loan$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/loan$Repository$UpdateloanAsyncTask;-><init>(Lcom/trimline/metrocrew/loan$Repository;Lcom/trimline/metrocrew/loan$dao;Lcom/trimline/metrocrew/loan$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/loan;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/loan$Repository$UpdateloanAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 101
    return-void
.end method
