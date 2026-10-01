.class public Lcom/trimline/metrocrew/types$Repository;
.super Ljava/lang/Object;
.source "types.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/types;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Repository"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/types$Repository$InserttypesAsyncTask;,
        Lcom/trimline/metrocrew/types$Repository$UpdatetypesAsyncTask;,
        Lcom/trimline/metrocrew/types$Repository$DeletetypesAsyncTask;
    }
.end annotation


# instance fields
.field private dao:Lcom/trimline/metrocrew/types$dao;


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

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    invoke-static {p1}, Lcom/trimline/metrocrew/DB;->getInstance(Landroid/content/Context;)Lcom/trimline/metrocrew/DB;

    move-result-object v0

    .line 60
    .local v0, "database":Lcom/trimline/metrocrew/DB;
    invoke-virtual {v0}, Lcom/trimline/metrocrew/DB;->trandao()Lcom/trimline/metrocrew/types$dao;

    move-result-object v1

    iput-object v1, p0, Lcom/trimline/metrocrew/types$Repository;->dao:Lcom/trimline/metrocrew/types$dao;

    .line 61
    return-void
.end method


# virtual methods
.method public delete(Lcom/trimline/metrocrew/types;)V
    .locals 3
    .param p1, "types"    # Lcom/trimline/metrocrew/types;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "types"
        }
    .end annotation

    .line 74
    new-instance v0, Lcom/trimline/metrocrew/types$Repository$DeletetypesAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/types$Repository;->dao:Lcom/trimline/metrocrew/types$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/types$Repository$DeletetypesAsyncTask;-><init>(Lcom/trimline/metrocrew/types$Repository;Lcom/trimline/metrocrew/types$dao;Lcom/trimline/metrocrew/types$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/types;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/types$Repository$DeletetypesAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 75
    return-void
.end method

.method public gettypes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/types;",
            ">;"
        }
    .end annotation

    .line 64
    iget-object v0, p0, Lcom/trimline/metrocrew/types$Repository;->dao:Lcom/trimline/metrocrew/types$dao;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/types$dao;->getypes()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public insert(Lcom/trimline/metrocrew/types;)V
    .locals 3
    .param p1, "types"    # Lcom/trimline/metrocrew/types;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "types"
        }
    .end annotation

    .line 68
    new-instance v0, Lcom/trimline/metrocrew/types$Repository$InserttypesAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/types$Repository;->dao:Lcom/trimline/metrocrew/types$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/types$Repository$InserttypesAsyncTask;-><init>(Lcom/trimline/metrocrew/types$Repository;Lcom/trimline/metrocrew/types$dao;Lcom/trimline/metrocrew/types$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/types;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/types$Repository$InserttypesAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 69
    return-void
.end method

.method public update(Lcom/trimline/metrocrew/types;)V
    .locals 3
    .param p1, "types"    # Lcom/trimline/metrocrew/types;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "types"
        }
    .end annotation

    .line 71
    new-instance v0, Lcom/trimline/metrocrew/types$Repository$UpdatetypesAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/types$Repository;->dao:Lcom/trimline/metrocrew/types$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/types$Repository$UpdatetypesAsyncTask;-><init>(Lcom/trimline/metrocrew/types$Repository;Lcom/trimline/metrocrew/types$dao;Lcom/trimline/metrocrew/types$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/types;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/types$Repository$UpdatetypesAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 72
    return-void
.end method
