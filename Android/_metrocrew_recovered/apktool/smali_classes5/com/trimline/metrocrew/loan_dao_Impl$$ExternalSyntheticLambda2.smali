.class public final synthetic Lcom/trimline/metrocrew/loan_dao_Impl$$ExternalSyntheticLambda2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:Lcom/trimline/metrocrew/loan_dao_Impl;

.field public final synthetic f$1:Lcom/trimline/metrocrew/loan;


# direct methods
.method public synthetic constructor <init>(Lcom/trimline/metrocrew/loan_dao_Impl;Lcom/trimline/metrocrew/loan;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/trimline/metrocrew/loan_dao_Impl$$ExternalSyntheticLambda2;->f$0:Lcom/trimline/metrocrew/loan_dao_Impl;

    iput-object p2, p0, Lcom/trimline/metrocrew/loan_dao_Impl$$ExternalSyntheticLambda2;->f$1:Lcom/trimline/metrocrew/loan;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/trimline/metrocrew/loan_dao_Impl$$ExternalSyntheticLambda2;->f$0:Lcom/trimline/metrocrew/loan_dao_Impl;

    iget-object v1, p0, Lcom/trimline/metrocrew/loan_dao_Impl$$ExternalSyntheticLambda2;->f$1:Lcom/trimline/metrocrew/loan;

    check-cast p1, Landroidx/sqlite/SQLiteConnection;

    invoke-virtual {v0, v1, p1}, Lcom/trimline/metrocrew/loan_dao_Impl;->lambda$delete$1$com-trimline-metrocrew-loan_dao_Impl(Lcom/trimline/metrocrew/loan;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
