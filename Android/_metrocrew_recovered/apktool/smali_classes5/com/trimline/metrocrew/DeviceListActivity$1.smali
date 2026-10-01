.class Lcom/trimline/metrocrew/DeviceListActivity$1;
.super Ljava/lang/Object;
.source "DeviceListActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/DeviceListActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/DeviceListActivity;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/DeviceListActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/DeviceListActivity;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 81
    iput-object p1, p0, Lcom/trimline/metrocrew/DeviceListActivity$1;->this$0:Lcom/trimline/metrocrew/DeviceListActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 83
    iget-object v0, p0, Lcom/trimline/metrocrew/DeviceListActivity$1;->this$0:Lcom/trimline/metrocrew/DeviceListActivity;

    invoke-static {v0}, Lcom/trimline/metrocrew/DeviceListActivity;->access$000(Lcom/trimline/metrocrew/DeviceListActivity;)V

    .line 84
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 85
    return-void
.end method
