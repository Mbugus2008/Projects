.class Lcom/trimline/metrocrew/worker$9$1;
.super Lcom/google/gson/reflect/TypeToken;
.source "worker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/worker$9;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/gson/reflect/TypeToken<",
        "Lcom/trimline/metrocrew/theader;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/trimline/metrocrew/worker$9;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/worker$9;)V
    .locals 0
    .param p1, "this$1"    # Lcom/trimline/metrocrew/worker$9;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$1"
        }
    .end annotation

    .line 345
    iput-object p1, p0, Lcom/trimline/metrocrew/worker$9$1;->this$1:Lcom/trimline/metrocrew/worker$9;

    invoke-direct {p0}, Lcom/google/gson/reflect/TypeToken;-><init>()V

    return-void
.end method
