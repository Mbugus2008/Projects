.class Lcom/trimline/metrocrew/Settings$4;
.super Ljava/lang/Object;
.source "Settings.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/Settings;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/Settings;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/Settings;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/Settings;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 70
    iput-object p1, p0, Lcom/trimline/metrocrew/Settings$4;->this$0:Lcom/trimline/metrocrew/Settings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 73
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/trimline/metrocrew/Settings$4;->this$0:Lcom/trimline/metrocrew/Settings;

    const-class v2, Lcom/trimline/metrocrew/DeviceListActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 74
    .local v0, "BT":Landroid/content/Intent;
    const-string v1, "SP"

    const-string v2, "P"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 75
    iget-object v1, p0, Lcom/trimline/metrocrew/Settings$4;->this$0:Lcom/trimline/metrocrew/Settings;

    const/16 v2, 0x2300

    invoke-virtual {v1, v0, v2}, Lcom/trimline/metrocrew/Settings;->startActivityForResult(Landroid/content/Intent;I)V

    .line 77
    return-void
.end method
