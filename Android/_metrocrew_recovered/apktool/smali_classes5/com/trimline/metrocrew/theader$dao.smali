.class public abstract Lcom/trimline/metrocrew/theader$dao;
.super Ljava/lang/Object;
.source "theader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/theader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "dao"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 226
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method abstract delete(Lcom/trimline/metrocrew/theader;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entity"
        }
    .end annotation
.end method

.method abstract insert(Lcom/trimline/metrocrew/theader;)J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entity"
        }
    .end annotation
.end method

.method abstract loadAll()Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/theader;",
            ">;>;"
        }
    .end annotation
.end method

.method abstract loadAll(Z)Ljava/util/List;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "sent"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/theader;",
            ">;"
        }
    .end annotation
.end method

.method abstract loadtodays()Landroidx/lifecycle/LiveData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroidx/lifecycle/LiveData<",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/theader;",
            ">;>;"
        }
    .end annotation
.end method

.method abstract transaction_n_lines()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/tlines;",
            ">;"
        }
    .end annotation
.end method

.method abstract transaction_n_linesdaily(JJ)Ljava/util/List;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "startOfDay",
            "endOfDay"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ)",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/tlines;",
            ">;"
        }
    .end annotation
.end method

.method abstract update(Lcom/trimline/metrocrew/theader;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entity"
        }
    .end annotation
.end method

.method abstract updateHeader(FLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "total",
            "documentNo",
            "payMode",
            "accountNo"
        }
    .end annotation
.end method
