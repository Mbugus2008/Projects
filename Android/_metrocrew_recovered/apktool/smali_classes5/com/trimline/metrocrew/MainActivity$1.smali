.class Lcom/trimline/metrocrew/MainActivity$1;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

    .line 120
    iput-object p1, p0, Lcom/trimline/metrocrew/MainActivity$1;->this$0:Lcom/trimline/metrocrew/MainActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "view"
        }
    .end annotation

    .line 123
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$1;->this$0:Lcom/trimline/metrocrew/MainActivity;

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/trimline/metrocrew/MainActivity$1;->this$0:Lcom/trimline/metrocrew/MainActivity;

    const-class v3, Lcom/trimline/metrocrew/Receipts;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 124
    return-void
.end method
