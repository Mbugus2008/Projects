.class public Lcom/trimline/metrocrew/Vehicles$Model;
.super Landroidx/lifecycle/AndroidViewModel;
.source "Vehicles.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Vehicles;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Model"
.end annotation


# instance fields
.field private repository:Lcom/trimline/metrocrew/Vehicles$Repository;


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

    .line 174
    invoke-direct {p0, p1}, Landroidx/lifecycle/AndroidViewModel;-><init>(Landroid/app/Application;)V

    .line 175
    new-instance v0, Lcom/trimline/metrocrew/Vehicles$Repository;

    invoke-direct {v0, p1}, Lcom/trimline/metrocrew/Vehicles$Repository;-><init>(Landroid/app/Application;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/Vehicles$Model;->repository:Lcom/trimline/metrocrew/Vehicles$Repository;

    .line 176
    return-void
.end method


# virtual methods
.method public delete(Lcom/trimline/metrocrew/Vehicles;)V
    .locals 1
    .param p1, "loan"    # Lcom/trimline/metrocrew/Vehicles;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "loan"
        }
    .end annotation

    .line 187
    iget-object v0, p0, Lcom/trimline/metrocrew/Vehicles$Model;->repository:Lcom/trimline/metrocrew/Vehicles$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/Vehicles$Repository;->delete(Lcom/trimline/metrocrew/Vehicles;)V

    .line 188
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

    .line 191
    iget-object v0, p0, Lcom/trimline/metrocrew/Vehicles$Model;->repository:Lcom/trimline/metrocrew/Vehicles$Repository;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/Vehicles$Repository;->getall()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public insert(Lcom/trimline/metrocrew/Vehicles;)V
    .locals 1
    .param p1, "loan"    # Lcom/trimline/metrocrew/Vehicles;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "loan"
        }
    .end annotation

    .line 179
    iget-object v0, p0, Lcom/trimline/metrocrew/Vehicles$Model;->repository:Lcom/trimline/metrocrew/Vehicles$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/Vehicles$Repository;->insert(Lcom/trimline/metrocrew/Vehicles;)V

    .line 180
    return-void
.end method

.method public update(Lcom/trimline/metrocrew/Vehicles;)V
    .locals 1
    .param p1, "loan"    # Lcom/trimline/metrocrew/Vehicles;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "loan"
        }
    .end annotation

    .line 183
    iget-object v0, p0, Lcom/trimline/metrocrew/Vehicles$Model;->repository:Lcom/trimline/metrocrew/Vehicles$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/Vehicles$Repository;->update(Lcom/trimline/metrocrew/Vehicles;)V

    .line 184
    return-void
.end method
