.class Lcom/trimline/metrocrew/MainActivity$tillbalances$1;
.super Lcom/google/gson/reflect/TypeToken;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/MainActivity$tillbalances;->doInBackground([Ljava/lang/Void;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/gson/reflect/TypeToken<",
        "Ljava/util/List<",
        "Lcom/trimline/metrocrew/loan;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/trimline/metrocrew/MainActivity$tillbalances;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/MainActivity$tillbalances;)V
    .locals 0
    .param p1, "this$1"    # Lcom/trimline/metrocrew/MainActivity$tillbalances;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$1"
        }
    .end annotation

    .line 293
    iput-object p1, p0, Lcom/trimline/metrocrew/MainActivity$tillbalances$1;->this$1:Lcom/trimline/metrocrew/MainActivity$tillbalances;

    invoke-direct {p0}, Lcom/google/gson/reflect/TypeToken;-><init>()V

    return-void
.end method
