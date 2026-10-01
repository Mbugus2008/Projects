.class public Lcom/trimline/metrocrew/Member$Repository;
.super Ljava/lang/Object;
.source "Member.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Member;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Repository"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/Member$Repository$InsertmemberAsyncTask;,
        Lcom/trimline/metrocrew/Member$Repository$UpdatememberAsyncTask;,
        Lcom/trimline/metrocrew/Member$Repository$DeletememberAsyncTask;
    }
.end annotation


# instance fields
.field private dao:Lcom/trimline/metrocrew/Member$dao;


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

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    invoke-static {p1}, Lcom/trimline/metrocrew/DB;->getInstance(Landroid/content/Context;)Lcom/trimline/metrocrew/DB;

    move-result-object v0

    .line 72
    .local v0, "database":Lcom/trimline/metrocrew/DB;
    invoke-virtual {v0}, Lcom/trimline/metrocrew/DB;->memberDao()Lcom/trimline/metrocrew/Member$dao;

    move-result-object v1

    iput-object v1, p0, Lcom/trimline/metrocrew/Member$Repository;->dao:Lcom/trimline/metrocrew/Member$dao;

    .line 74
    return-void
.end method


# virtual methods
.method public delete(Lcom/trimline/metrocrew/Member;)V
    .locals 3
    .param p1, "member"    # Lcom/trimline/metrocrew/Member;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "member"
        }
    .end annotation

    .line 90
    new-instance v0, Lcom/trimline/metrocrew/Member$Repository$DeletememberAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/Member$Repository;->dao:Lcom/trimline/metrocrew/Member$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/Member$Repository$DeletememberAsyncTask;-><init>(Lcom/trimline/metrocrew/Member$Repository;Lcom/trimline/metrocrew/Member$dao;Lcom/trimline/metrocrew/Member$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/Member;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/Member$Repository$DeletememberAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 91
    return-void
.end method

.method public getmembers()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/Member;",
            ">;"
        }
    .end annotation

    .line 78
    iget-object v0, p0, Lcom/trimline/metrocrew/Member$Repository;->dao:Lcom/trimline/metrocrew/Member$dao;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/Member$dao;->getmembers()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public insert(Lcom/trimline/metrocrew/Member;)V
    .locals 3
    .param p1, "member"    # Lcom/trimline/metrocrew/Member;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "member"
        }
    .end annotation

    .line 82
    new-instance v0, Lcom/trimline/metrocrew/Member$Repository$InsertmemberAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/Member$Repository;->dao:Lcom/trimline/metrocrew/Member$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/Member$Repository$InsertmemberAsyncTask;-><init>(Lcom/trimline/metrocrew/Member$Repository;Lcom/trimline/metrocrew/Member$dao;Lcom/trimline/metrocrew/Member$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/Member;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/Member$Repository$InsertmemberAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 83
    return-void
.end method

.method public update(Lcom/trimline/metrocrew/Member;)V
    .locals 3
    .param p1, "member"    # Lcom/trimline/metrocrew/Member;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "member"
        }
    .end annotation

    .line 86
    new-instance v0, Lcom/trimline/metrocrew/Member$Repository$UpdatememberAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/Member$Repository;->dao:Lcom/trimline/metrocrew/Member$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/Member$Repository$UpdatememberAsyncTask;-><init>(Lcom/trimline/metrocrew/Member$Repository;Lcom/trimline/metrocrew/Member$dao;Lcom/trimline/metrocrew/Member$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/Member;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/Member$Repository$UpdatememberAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 87
    return-void
.end method
