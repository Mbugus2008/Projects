.class public Lcom/trimline/metrocrew/Vehicles$Repository;
.super Ljava/lang/Object;
.source "Vehicles.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Vehicles;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Repository"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/Vehicles$Repository$InsertAsyncTask;,
        Lcom/trimline/metrocrew/Vehicles$Repository$UpdateloanAsyncTask;,
        Lcom/trimline/metrocrew/Vehicles$Repository$DeleteloanAsyncTask;
    }
.end annotation


# instance fields
.field private dao:Lcom/trimline/metrocrew/Vehicles$dao;


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

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    invoke-static {p1}, Lcom/trimline/metrocrew/DB;->getInstance(Landroid/content/Context;)Lcom/trimline/metrocrew/DB;

    move-result-object v0

    .line 98
    .local v0, "database":Lcom/trimline/metrocrew/DB;
    invoke-virtual {v0}, Lcom/trimline/metrocrew/DB;->vDao()Lcom/trimline/metrocrew/Vehicles$dao;

    move-result-object v1

    iput-object v1, p0, Lcom/trimline/metrocrew/Vehicles$Repository;->dao:Lcom/trimline/metrocrew/Vehicles$dao;

    .line 100
    return-void
.end method


# virtual methods
.method public delete(Lcom/trimline/metrocrew/Vehicles;)V
    .locals 3
    .param p1, "loan"    # Lcom/trimline/metrocrew/Vehicles;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "loan"
        }
    .end annotation

    .line 118
    new-instance v0, Lcom/trimline/metrocrew/Vehicles$Repository$DeleteloanAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/Vehicles$Repository;->dao:Lcom/trimline/metrocrew/Vehicles$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/Vehicles$Repository$DeleteloanAsyncTask;-><init>(Lcom/trimline/metrocrew/Vehicles$Repository;Lcom/trimline/metrocrew/Vehicles$dao;Lcom/trimline/metrocrew/Vehicles$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/Vehicles;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/Vehicles$Repository$DeleteloanAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 119
    return-void
.end method

.method public getall()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/Vehicles;",
            ">;"
        }
    .end annotation

    .line 104
    iget-object v0, p0, Lcom/trimline/metrocrew/Vehicles$Repository;->dao:Lcom/trimline/metrocrew/Vehicles$dao;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/Vehicles$dao;->getall()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public insert(Lcom/trimline/metrocrew/Vehicles;)V
    .locals 3
    .param p1, "loan"    # Lcom/trimline/metrocrew/Vehicles;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "loan"
        }
    .end annotation

    .line 110
    new-instance v0, Lcom/trimline/metrocrew/Vehicles$Repository$InsertAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/Vehicles$Repository;->dao:Lcom/trimline/metrocrew/Vehicles$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/Vehicles$Repository$InsertAsyncTask;-><init>(Lcom/trimline/metrocrew/Vehicles$Repository;Lcom/trimline/metrocrew/Vehicles$dao;Lcom/trimline/metrocrew/Vehicles$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/Vehicles;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/Vehicles$Repository$InsertAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 111
    return-void
.end method

.method public update(Lcom/trimline/metrocrew/Vehicles;)V
    .locals 3
    .param p1, "loan"    # Lcom/trimline/metrocrew/Vehicles;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "loan"
        }
    .end annotation

    .line 114
    new-instance v0, Lcom/trimline/metrocrew/Vehicles$Repository$UpdateloanAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/Vehicles$Repository;->dao:Lcom/trimline/metrocrew/Vehicles$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/Vehicles$Repository$UpdateloanAsyncTask;-><init>(Lcom/trimline/metrocrew/Vehicles$Repository;Lcom/trimline/metrocrew/Vehicles$dao;Lcom/trimline/metrocrew/Vehicles$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/Vehicles;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/Vehicles$Repository$UpdateloanAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 115
    return-void
.end method
