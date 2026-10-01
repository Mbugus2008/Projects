.class Lcom/trimline/metrocrew/MainActivity$2;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Lcom/trimline/metrocrew/theader$adapter$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/MainActivity;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/MainActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/MainActivity;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 135
    iput-object p1, p0, Lcom/trimline/metrocrew/MainActivity$2;->this$0:Lcom/trimline/metrocrew/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$onItemClick$0(Lcom/trimline/metrocrew/theader;Lcom/trimline/metrocrew/transaction;)Z
    .locals 2
    .param p0, "note"    # Lcom/trimline/metrocrew/theader;
    .param p1, "o"    # Lcom/trimline/metrocrew/transaction;

    .line 138
    iget-object v0, p1, Lcom/trimline/metrocrew/transaction;->No:Ljava/lang/String;

    iget-object v1, p0, Lcom/trimline/metrocrew/theader;->No:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public onItemClick(Lcom/trimline/metrocrew/theader;)V
    .locals 3
    .param p1, "note"    # Lcom/trimline/metrocrew/theader;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "note"
        }
    .end annotation

    .line 138
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$2;->this$0:Lcom/trimline/metrocrew/MainActivity;

    iget-object v1, p0, Lcom/trimline/metrocrew/MainActivity$2;->this$0:Lcom/trimline/metrocrew/MainActivity;

    iget-object v1, v1, Lcom/trimline/metrocrew/MainActivity;->transactions:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v1

    new-instance v2, Lcom/trimline/metrocrew/MainActivity$2$$ExternalSyntheticLambda0;

    invoke-direct {v2, p1}, Lcom/trimline/metrocrew/MainActivity$2$$ExternalSyntheticLambda0;-><init>(Lcom/trimline/metrocrew/theader;)V

    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v1

    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0, p1, v1}, Lcom/trimline/metrocrew/MainActivity;->ConfirmationBox(Lcom/trimline/metrocrew/theader;Ljava/util/List;)V

    .line 139
    return-void
.end method
