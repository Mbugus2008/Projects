.class public final synthetic Lcom/trimline/metrocrew/MainActivity$2$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Predicate;


# instance fields
.field public final synthetic f$0:Lcom/trimline/metrocrew/theader;


# direct methods
.method public synthetic constructor <init>(Lcom/trimline/metrocrew/theader;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/trimline/metrocrew/MainActivity$2$$ExternalSyntheticLambda0;->f$0:Lcom/trimline/metrocrew/theader;

    return-void
.end method


# virtual methods
.method public final test(Ljava/lang/Object;)Z
    .locals 1

    .line 0
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$2$$ExternalSyntheticLambda0;->f$0:Lcom/trimline/metrocrew/theader;

    check-cast p1, Lcom/trimline/metrocrew/transaction;

    invoke-static {v0, p1}, Lcom/trimline/metrocrew/MainActivity$2;->lambda$onItemClick$0(Lcom/trimline/metrocrew/theader;Lcom/trimline/metrocrew/transaction;)Z

    move-result p1

    return p1
.end method
