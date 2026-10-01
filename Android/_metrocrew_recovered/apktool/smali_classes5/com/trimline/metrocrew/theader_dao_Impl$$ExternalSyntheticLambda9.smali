.class public final synthetic Lcom/trimline/metrocrew/theader_dao_Impl$$ExternalSyntheticLambda9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic f$0:F

.field public final synthetic f$1:Ljava/lang/String;

.field public final synthetic f$2:Ljava/lang/String;

.field public final synthetic f$3:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(FLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/trimline/metrocrew/theader_dao_Impl$$ExternalSyntheticLambda9;->f$0:F

    iput-object p2, p0, Lcom/trimline/metrocrew/theader_dao_Impl$$ExternalSyntheticLambda9;->f$1:Ljava/lang/String;

    iput-object p3, p0, Lcom/trimline/metrocrew/theader_dao_Impl$$ExternalSyntheticLambda9;->f$2:Ljava/lang/String;

    iput-object p4, p0, Lcom/trimline/metrocrew/theader_dao_Impl$$ExternalSyntheticLambda9;->f$3:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 0
    iget v0, p0, Lcom/trimline/metrocrew/theader_dao_Impl$$ExternalSyntheticLambda9;->f$0:F

    iget-object v1, p0, Lcom/trimline/metrocrew/theader_dao_Impl$$ExternalSyntheticLambda9;->f$1:Ljava/lang/String;

    iget-object v2, p0, Lcom/trimline/metrocrew/theader_dao_Impl$$ExternalSyntheticLambda9;->f$2:Ljava/lang/String;

    iget-object v3, p0, Lcom/trimline/metrocrew/theader_dao_Impl$$ExternalSyntheticLambda9;->f$3:Ljava/lang/String;

    check-cast p1, Landroidx/sqlite/SQLiteConnection;

    invoke-static {v0, v1, v2, v3, p1}, Lcom/trimline/metrocrew/theader_dao_Impl;->lambda$updateHeader$8(FLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroidx/sqlite/SQLiteConnection;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
