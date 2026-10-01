.class public Lcom/trimline/metrocrew/types$Model;
.super Landroidx/lifecycle/AndroidViewModel;
.source "types.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/types;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Model"
.end annotation


# instance fields
.field private repository:Lcom/trimline/metrocrew/types$Repository;


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

    .line 120
    invoke-direct {p0, p1}, Landroidx/lifecycle/AndroidViewModel;-><init>(Landroid/app/Application;)V

    .line 121
    new-instance v0, Lcom/trimline/metrocrew/types$Repository;

    invoke-direct {v0, p1}, Lcom/trimline/metrocrew/types$Repository;-><init>(Landroid/app/Application;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/types$Model;->repository:Lcom/trimline/metrocrew/types$Repository;

    .line 122
    return-void
.end method


# virtual methods
.method public delete(Lcom/trimline/metrocrew/types;)V
    .locals 1
    .param p1, "types"    # Lcom/trimline/metrocrew/types;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "types"
        }
    .end annotation

    .line 133
    iget-object v0, p0, Lcom/trimline/metrocrew/types$Model;->repository:Lcom/trimline/metrocrew/types$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/types$Repository;->delete(Lcom/trimline/metrocrew/types;)V

    .line 134
    return-void
.end method

.method public getalltypes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/types;",
            ">;"
        }
    .end annotation

    .line 137
    iget-object v0, p0, Lcom/trimline/metrocrew/types$Model;->repository:Lcom/trimline/metrocrew/types$Repository;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/types$Repository;->gettypes()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public insert(Lcom/trimline/metrocrew/types;)V
    .locals 1
    .param p1, "types"    # Lcom/trimline/metrocrew/types;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "types"
        }
    .end annotation

    .line 125
    iget-object v0, p0, Lcom/trimline/metrocrew/types$Model;->repository:Lcom/trimline/metrocrew/types$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/types$Repository;->insert(Lcom/trimline/metrocrew/types;)V

    .line 126
    return-void
.end method

.method public update(Lcom/trimline/metrocrew/types;)V
    .locals 1
    .param p1, "types"    # Lcom/trimline/metrocrew/types;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "types"
        }
    .end annotation

    .line 129
    iget-object v0, p0, Lcom/trimline/metrocrew/types$Model;->repository:Lcom/trimline/metrocrew/types$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/types$Repository;->update(Lcom/trimline/metrocrew/types;)V

    .line 130
    return-void
.end method
