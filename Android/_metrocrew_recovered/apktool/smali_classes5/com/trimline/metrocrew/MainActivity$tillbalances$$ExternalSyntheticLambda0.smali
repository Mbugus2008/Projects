.class public final synthetic Lcom/trimline/metrocrew/MainActivity$tillbalances$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic f$0:Lcom/trimline/metrocrew/MainActivity$tillbalances;


# direct methods
.method public synthetic constructor <init>(Lcom/trimline/metrocrew/MainActivity$tillbalances;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/trimline/metrocrew/MainActivity$tillbalances$$ExternalSyntheticLambda0;->f$0:Lcom/trimline/metrocrew/MainActivity$tillbalances;

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$tillbalances$$ExternalSyntheticLambda0;->f$0:Lcom/trimline/metrocrew/MainActivity$tillbalances;

    check-cast p1, Lcom/trimline/metrocrew/agent;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/MainActivity$tillbalances;->lambda$onPostExecute$0$com-trimline-metrocrew-MainActivity$tillbalances(Lcom/trimline/metrocrew/agent;)Z

    move-result p1

    return p1
.end method
