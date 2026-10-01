.class public Lcom/trimline/metrocrew/Member$Model;
.super Landroidx/lifecycle/AndroidViewModel;
.source "Member.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Member;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Model"
.end annotation


# instance fields
.field private repository:Lcom/trimline/metrocrew/Member$Repository;


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

    .line 144
    invoke-direct {p0, p1}, Landroidx/lifecycle/AndroidViewModel;-><init>(Landroid/app/Application;)V

    .line 145
    new-instance v0, Lcom/trimline/metrocrew/Member$Repository;

    invoke-direct {v0, p1}, Lcom/trimline/metrocrew/Member$Repository;-><init>(Landroid/app/Application;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/Member$Model;->repository:Lcom/trimline/metrocrew/Member$Repository;

    .line 146
    return-void
.end method


# virtual methods
.method public delete(Lcom/trimline/metrocrew/Member;)V
    .locals 1
    .param p1, "member"    # Lcom/trimline/metrocrew/Member;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "member"
        }
    .end annotation

    .line 157
    iget-object v0, p0, Lcom/trimline/metrocrew/Member$Model;->repository:Lcom/trimline/metrocrew/Member$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/Member$Repository;->delete(Lcom/trimline/metrocrew/Member;)V

    .line 158
    return-void
.end method

.method public getallmbers()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/Member;",
            ">;"
        }
    .end annotation

    .line 161
    iget-object v0, p0, Lcom/trimline/metrocrew/Member$Model;->repository:Lcom/trimline/metrocrew/Member$Repository;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/Member$Repository;->getmembers()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public insert(Lcom/trimline/metrocrew/Member;)V
    .locals 1
    .param p1, "member"    # Lcom/trimline/metrocrew/Member;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "member"
        }
    .end annotation

    .line 149
    iget-object v0, p0, Lcom/trimline/metrocrew/Member$Model;->repository:Lcom/trimline/metrocrew/Member$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/Member$Repository;->insert(Lcom/trimline/metrocrew/Member;)V

    .line 150
    return-void
.end method

.method public update(Lcom/trimline/metrocrew/Member;)V
    .locals 1
    .param p1, "member"    # Lcom/trimline/metrocrew/Member;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "member"
        }
    .end annotation

    .line 153
    iget-object v0, p0, Lcom/trimline/metrocrew/Member$Model;->repository:Lcom/trimline/metrocrew/Member$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/Member$Repository;->update(Lcom/trimline/metrocrew/Member;)V

    .line 154
    return-void
.end method
