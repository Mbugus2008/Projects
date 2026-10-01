.class public Lcom/trimline/metrocrew/payment_modes$Repository;
.super Ljava/lang/Object;
.source "payment_modes.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/payment_modes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Repository"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/payment_modes$Repository$Insertpayment_modesAsyncTask;,
        Lcom/trimline/metrocrew/payment_modes$Repository$Updatepayment_modesAsyncTask;,
        Lcom/trimline/metrocrew/payment_modes$Repository$Deletepayment_modesAsyncTask;
    }
.end annotation


# instance fields
.field private dao:Lcom/trimline/metrocrew/payment_modes$dao;


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

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    invoke-static {p1}, Lcom/trimline/metrocrew/DB;->getInstance(Landroid/content/Context;)Lcom/trimline/metrocrew/DB;

    move-result-object v0

    .line 52
    .local v0, "database":Lcom/trimline/metrocrew/DB;
    invoke-virtual {v0}, Lcom/trimline/metrocrew/DB;->pdao()Lcom/trimline/metrocrew/payment_modes$dao;

    move-result-object v1

    iput-object v1, p0, Lcom/trimline/metrocrew/payment_modes$Repository;->dao:Lcom/trimline/metrocrew/payment_modes$dao;

    .line 54
    return-void
.end method


# virtual methods
.method public delete(Lcom/trimline/metrocrew/payment_modes;)V
    .locals 3
    .param p1, "payment_modes"    # Lcom/trimline/metrocrew/payment_modes;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "payment_modes"
        }
    .end annotation

    .line 70
    new-instance v0, Lcom/trimline/metrocrew/payment_modes$Repository$Deletepayment_modesAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/payment_modes$Repository;->dao:Lcom/trimline/metrocrew/payment_modes$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/payment_modes$Repository$Deletepayment_modesAsyncTask;-><init>(Lcom/trimline/metrocrew/payment_modes$Repository;Lcom/trimline/metrocrew/payment_modes$dao;Lcom/trimline/metrocrew/payment_modes$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/payment_modes;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/payment_modes$Repository$Deletepayment_modesAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 71
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

    .line 58
    iget-object v0, p0, Lcom/trimline/metrocrew/payment_modes$Repository;->dao:Lcom/trimline/metrocrew/payment_modes$dao;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/payment_modes$dao;->getall()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public insert(Lcom/trimline/metrocrew/payment_modes;)V
    .locals 3
    .param p1, "payment_modes"    # Lcom/trimline/metrocrew/payment_modes;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "payment_modes"
        }
    .end annotation

    .line 62
    new-instance v0, Lcom/trimline/metrocrew/payment_modes$Repository$Insertpayment_modesAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/payment_modes$Repository;->dao:Lcom/trimline/metrocrew/payment_modes$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/payment_modes$Repository$Insertpayment_modesAsyncTask;-><init>(Lcom/trimline/metrocrew/payment_modes$Repository;Lcom/trimline/metrocrew/payment_modes$dao;Lcom/trimline/metrocrew/payment_modes$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/payment_modes;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/payment_modes$Repository$Insertpayment_modesAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 63
    return-void
.end method

.method public update(Lcom/trimline/metrocrew/payment_modes;)V
    .locals 3
    .param p1, "payment_modes"    # Lcom/trimline/metrocrew/payment_modes;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "payment_modes"
        }
    .end annotation

    .line 66
    new-instance v0, Lcom/trimline/metrocrew/payment_modes$Repository$Updatepayment_modesAsyncTask;

    iget-object v1, p0, Lcom/trimline/metrocrew/payment_modes$Repository;->dao:Lcom/trimline/metrocrew/payment_modes$dao;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v1, v2}, Lcom/trimline/metrocrew/payment_modes$Repository$Updatepayment_modesAsyncTask;-><init>(Lcom/trimline/metrocrew/payment_modes$Repository;Lcom/trimline/metrocrew/payment_modes$dao;Lcom/trimline/metrocrew/payment_modes$1;)V

    const/4 v1, 0x1

    new-array v1, v1, [Lcom/trimline/metrocrew/payment_modes;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/payment_modes$Repository$Updatepayment_modesAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 67
    return-void
.end method
