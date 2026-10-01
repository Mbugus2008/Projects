.class public Lcom/trimline/metrocrew/theader$Model;
.super Landroidx/lifecycle/AndroidViewModel;
.source "theader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/theader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Model"
.end annotation


# instance fields
.field public livetrans:Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/theader;",
            ">;>;"
        }
    .end annotation
.end field

.field public livetrans_todays:Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/theader;",
            ">;>;"
        }
    .end annotation
.end field

.field private repository:Lcom/trimline/metrocrew/theader$Repository;

.field public trans:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/theader;",
            ">;"
        }
    .end annotation
.end field


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

    .line 390
    invoke-direct {p0, p1}, Landroidx/lifecycle/AndroidViewModel;-><init>(Landroid/app/Application;)V

    .line 387
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trimline/metrocrew/theader$Model;->trans:Ljava/util/List;

    .line 391
    new-instance v0, Lcom/trimline/metrocrew/theader$Repository;

    invoke-direct {v0, p1}, Lcom/trimline/metrocrew/theader$Repository;-><init>(Landroid/app/Application;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/theader$Model;->repository:Lcom/trimline/metrocrew/theader$Repository;

    .line 392
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$Model;->repository:Lcom/trimline/metrocrew/theader$Repository;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/theader$Repository;->findAll()Landroidx/lifecycle/LiveData;

    move-result-object v0

    iput-object v0, p0, Lcom/trimline/metrocrew/theader$Model;->livetrans:Landroidx/lifecycle/LiveData;

    .line 393
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$Model;->repository:Lcom/trimline/metrocrew/theader$Repository;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/theader$Repository;->findtodays()Landroidx/lifecycle/LiveData;

    move-result-object v0

    iput-object v0, p0, Lcom/trimline/metrocrew/theader$Model;->livetrans_todays:Landroidx/lifecycle/LiveData;

    .line 394
    return-void
.end method


# virtual methods
.method public delete(Lcom/trimline/metrocrew/theader;)V
    .locals 1
    .param p1, "theader"    # Lcom/trimline/metrocrew/theader;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "theader"
        }
    .end annotation

    .line 409
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$Model;->repository:Lcom/trimline/metrocrew/theader$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/theader$Repository;->delete(Lcom/trimline/metrocrew/theader;)V

    .line 410
    return-void
.end method

.method public gettodaystransactions()Landroidx/lifecycle/LiveData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/theader;",
            ">;>;"
        }
    .end annotation

    .line 416
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$Model;->livetrans_todays:Landroidx/lifecycle/LiveData;

    return-object v0
.end method

.method public gettransactionreport()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/tlines;",
            ">;"
        }
    .end annotation

    .line 421
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$Model;->repository:Lcom/trimline/metrocrew/theader$Repository;

    invoke-static {v0}, Lcom/trimline/metrocrew/theader$Repository;->access$400(Lcom/trimline/metrocrew/theader$Repository;)Lcom/trimline/metrocrew/theader$dao;

    move-result-object v0

    invoke-virtual {v0}, Lcom/trimline/metrocrew/theader$dao;->transaction_n_lines()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public gettransactionreportdaily(Ljava/util/Date;)Ljava/util/List;
    .locals 8
    .param p1, "selectedDate"    # Ljava/util/Date;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "selectedDate"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Date;",
            ")",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/tlines;",
            ">;"
        }
    .end annotation

    .line 424
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 425
    .local v0, "cal":Ljava/util/Calendar;
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 428
    const/16 v1, 0xb

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 429
    const/16 v3, 0xc

    invoke-virtual {v0, v3, v2}, Ljava/util/Calendar;->set(II)V

    .line 430
    const/16 v4, 0xd

    invoke-virtual {v0, v4, v2}, Ljava/util/Calendar;->set(II)V

    .line 431
    const/16 v5, 0xe

    invoke-virtual {v0, v5, v2}, Ljava/util/Calendar;->set(II)V

    .line 432
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v6

    .line 435
    .local v6, "startOfDay":J
    const/16 v2, 0x17

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->set(II)V

    .line 436
    const/16 v1, 0x3b

    invoke-virtual {v0, v3, v1}, Ljava/util/Calendar;->set(II)V

    .line 437
    invoke-virtual {v0, v4, v1}, Ljava/util/Calendar;->set(II)V

    .line 438
    const/16 v1, 0x3e7

    invoke-virtual {v0, v5, v1}, Ljava/util/Calendar;->set(II)V

    .line 439
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v1

    .line 441
    .local v1, "endOfDay":J
    iget-object v3, p0, Lcom/trimline/metrocrew/theader$Model;->repository:Lcom/trimline/metrocrew/theader$Repository;

    invoke-static {v3}, Lcom/trimline/metrocrew/theader$Repository;->access$400(Lcom/trimline/metrocrew/theader$Repository;)Lcom/trimline/metrocrew/theader$dao;

    move-result-object v3

    invoke-virtual {v3, v6, v7, v1, v2}, Lcom/trimline/metrocrew/theader$dao;->transaction_n_linesdaily(JJ)Ljava/util/List;

    move-result-object v3

    return-object v3
.end method

.method public gettransactions()Landroidx/lifecycle/LiveData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/theader;",
            ">;>;"
        }
    .end annotation

    .line 413
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$Model;->livetrans:Landroidx/lifecycle/LiveData;

    return-object v0
.end method

.method public insert(Lcom/trimline/metrocrew/theader;)V
    .locals 1
    .param p1, "theader"    # Lcom/trimline/metrocrew/theader;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "theader"
        }
    .end annotation

    .line 397
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$Model;->repository:Lcom/trimline/metrocrew/theader$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/theader$Repository;->insert(Lcom/trimline/metrocrew/theader;)V

    .line 398
    return-void
.end method

.method public update(Lcom/trimline/metrocrew/theader;)V
    .locals 1
    .param p1, "theader"    # Lcom/trimline/metrocrew/theader;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "theader"
        }
    .end annotation

    .line 401
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$Model;->repository:Lcom/trimline/metrocrew/theader$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/theader$Repository;->update(Lcom/trimline/metrocrew/theader;)V

    .line 402
    return-void
.end method

.method public updateHeader(Lcom/trimline/metrocrew/theader;)V
    .locals 1
    .param p1, "theader"    # Lcom/trimline/metrocrew/theader;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "theader"
        }
    .end annotation

    .line 405
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$Model;->repository:Lcom/trimline/metrocrew/theader$Repository;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/theader$Repository;->updateHeader(Lcom/trimline/metrocrew/theader;)V

    .line 406
    return-void
.end method
