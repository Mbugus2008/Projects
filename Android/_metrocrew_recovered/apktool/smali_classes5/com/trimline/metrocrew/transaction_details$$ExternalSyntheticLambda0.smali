.class public final synthetic Lcom/trimline/metrocrew/transaction_details$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/ToDoubleFunction;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final applyAsDouble(Ljava/lang/Object;)D
    .locals 2

    .line 0
    check-cast p1, Lcom/trimline/metrocrew/tlines;

    invoke-static {p1}, Lcom/trimline/metrocrew/transaction_details;->lambda$loaddata$0(Lcom/trimline/metrocrew/tlines;)D

    move-result-wide v0

    return-wide v0
.end method
