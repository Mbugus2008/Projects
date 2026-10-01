.class Lcom/trimline/metrocrew/Receipts$8;
.super Ljava/lang/Object;
.source "Receipts.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/Receipts;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/Receipts;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/Receipts;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/Receipts;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 385
    iput-object p1, p0, Lcom/trimline/metrocrew/Receipts$8;->this$0:Lcom/trimline/metrocrew/Receipts;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 388
    new-instance v0, Lcom/trimline/metrocrew/worker;

    iget-object v1, p0, Lcom/trimline/metrocrew/Receipts$8;->this$0:Lcom/trimline/metrocrew/Receipts;

    invoke-direct {v0, v1}, Lcom/trimline/metrocrew/worker;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/trimline/metrocrew/worker;->postReceiptHeader()V

    .line 389
    return-void
.end method
