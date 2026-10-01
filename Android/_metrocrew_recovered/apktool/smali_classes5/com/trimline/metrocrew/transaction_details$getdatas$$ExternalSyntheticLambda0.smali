.class public final synthetic Lcom/trimline/metrocrew/transaction_details$getdatas$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/Comparator;


# direct methods
.method public synthetic constructor <init>()V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 0
    check-cast p1, Lcom/trimline/metrocrew/tlines;

    check-cast p2, Lcom/trimline/metrocrew/tlines;

    invoke-static {p1, p2}, Lcom/trimline/metrocrew/transaction_details$getdatas;->lambda$doInBackground$0(Lcom/trimline/metrocrew/tlines;Lcom/trimline/metrocrew/tlines;)I

    move-result p1

    return p1
.end method
