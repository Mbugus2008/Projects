.class public Lcom/trimline/metrocrew/payment_modes$Model;
.super Landroidx/lifecycle/AndroidViewModel;
.source "payment_modes.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/payment_modes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Model"
.end annotation


# instance fields
.field private repository:Lcom/trimline/metrocrew/payment_modes$Repository;


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

    .line 124
    invoke-direct {p0, p1}, Landroidx/lifecycle/AndroidViewModel;-><init>(Landroid/app/Application;)V

    .line 125
    new-instance v0, Lcom/trimline/metrocrew/payment_modes$Repository;

    invoke-direct {v0, p1}, Lcom/trimline/metrocrew/payment_modes$Repository;-><init>(Landroid/app/Application;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/payment_modes$Model;->repository:Lcom/trimline/metrocrew/payment_modes$Repository;

    .line 126
    return-void
.end method


# virtual methods
.method public delete(Lcom/trimline/metrocrew/payment_modes;)V
    .locals 1
    .param p1, "payment_modes"    # Lcom/trimline/metrocrew/payment_modes;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "payment_modes"
        }
    .end annotation

    .line 137
    iget-object v0, p0, Lcom/trimline/metrocrew/payment_modes$Model;->repository:Lcom/trimline/metrocrew/payment_modes$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/payment_modes$Repository;->delete(Lcom/trimline/metrocrew/payment_modes;)V

    .line 138
    return-void
.end method

.method public getall()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/payment_modes;",
            ">;"
        }
    .end annotation

    .line 141
    iget-object v0, p0, Lcom/trimline/metrocrew/payment_modes$Model;->repository:Lcom/trimline/metrocrew/payment_modes$Repository;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/payment_modes$Repository;->getall()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public insert(Lcom/trimline/metrocrew/payment_modes;)V
    .locals 1
    .param p1, "payment_modes"    # Lcom/trimline/metrocrew/payment_modes;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "payment_modes"
        }
    .end annotation

    .line 129
    iget-object v0, p0, Lcom/trimline/metrocrew/payment_modes$Model;->repository:Lcom/trimline/metrocrew/payment_modes$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/payment_modes$Repository;->insert(Lcom/trimline/metrocrew/payment_modes;)V

    .line 130
    return-void
.end method

.method public update(Lcom/trimline/metrocrew/payment_modes;)V
    .locals 1
    .param p1, "payment_modes"    # Lcom/trimline/metrocrew/payment_modes;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "payment_modes"
        }
    .end annotation

    .line 133
    iget-object v0, p0, Lcom/trimline/metrocrew/payment_modes$Model;->repository:Lcom/trimline/metrocrew/payment_modes$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/payment_modes$Repository;->update(Lcom/trimline/metrocrew/payment_modes;)V

    .line 134
    return-void
.end method
