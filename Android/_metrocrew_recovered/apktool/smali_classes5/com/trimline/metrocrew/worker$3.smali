.class Lcom/trimline/metrocrew/worker$3;
.super Lcom/google/gson/reflect/TypeToken;
.source "worker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/worker;->getpaymenttypes()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/gson/reflect/TypeToken<",
        "Ljava/util/List<",
        "Lcom/trimline/metrocrew/payment_modes;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/worker;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/worker;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/worker;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 92
    iput-object p1, p0, Lcom/trimline/metrocrew/worker$3;->this$0:Lcom/trimline/metrocrew/worker;

    invoke-direct {p0}, Lcom/google/gson/reflect/TypeToken;-><init>()V

    return-void
.end method
