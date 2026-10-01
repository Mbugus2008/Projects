.class Lcom/trimline/metrocrew/DeviceListActivity$4;
.super Landroid/content/BroadcastReceiver;
.source "DeviceListActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/DeviceListActivity;
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

    .line 201
    iput-object p1, p0, Lcom/trimline/metrocrew/DeviceListActivity$4;->this$0:Lcom/trimline/metrocrew/DeviceListActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "context",
            "intent"
        }
    .end annotation

    .line 204
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 207
    .local v0, "action":Ljava/lang/String;
    const-string v1, "android.bluetooth.device.action.FOUND"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 209
    const-string v1, "android.bluetooth.device.extra.DEVICE"

    invoke-virtual {p2, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/bluetooth/BluetoothDevice;

    .line 211
    .local v1, "device":Landroid/bluetooth/BluetoothDevice;
    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getBondState()I

    move-result v2

    const/16 v3, 0xc

    if-eq v2, v3, :cond_1

    .line 212
    iget-object v2, p0, Lcom/trimline/metrocrew/DeviceListActivity$4;->this$0:Lcom/trimline/metrocrew/DeviceListActivity;

    invoke-static {v2}, Lcom/trimline/metrocrew/DeviceListActivity;->access$200(Lcom/trimline/metrocrew/DeviceListActivity;)Landroid/widget/ArrayAdapter;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    goto :goto_0

    .line 215
    .end local v1    # "device":Landroid/bluetooth/BluetoothDevice;
    :cond_0
    const-string v1, "android.bluetooth.adapter.action.DISCOVERY_FINISHED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 216
    iget-object v1, p0, Lcom/trimline/metrocrew/DeviceListActivity$4;->this$0:Lcom/trimline/metrocrew/DeviceListActivity;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/trimline/metrocrew/DeviceListActivity;->setProgressBarIndeterminateVisibility(Z)V

    .line 217
    iget-object v1, p0, Lcom/trimline/metrocrew/DeviceListActivity$4;->this$0:Lcom/trimline/metrocrew/DeviceListActivity;

    const v2, 0x7f1200b5

    invoke-virtual {v1, v2}, Lcom/trimline/metrocrew/DeviceListActivity;->setTitle(I)V

    .line 218
    iget-object v1, p0, Lcom/trimline/metrocrew/DeviceListActivity$4;->this$0:Lcom/trimline/metrocrew/DeviceListActivity;

    invoke-static {v1}, Lcom/trimline/metrocrew/DeviceListActivity;->access$200(Lcom/trimline/metrocrew/DeviceListActivity;)Landroid/widget/ArrayAdapter;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ArrayAdapter;->getCount()I

    move-result v1

    if-nez v1, :cond_2

    .line 219
    iget-object v1, p0, Lcom/trimline/metrocrew/DeviceListActivity$4;->this$0:Lcom/trimline/metrocrew/DeviceListActivity;

    invoke-virtual {v1}, Lcom/trimline/metrocrew/DeviceListActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f1200a9

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 220
    .local v1, "noDevices":Ljava/lang/String;
    iget-object v2, p0, Lcom/trimline/metrocrew/DeviceListActivity$4;->this$0:Lcom/trimline/metrocrew/DeviceListActivity;

    invoke-static {v2}, Lcom/trimline/metrocrew/DeviceListActivity;->access$200(Lcom/trimline/metrocrew/DeviceListActivity;)Landroid/widget/ArrayAdapter;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    goto :goto_1

    .line 215
    .end local v1    # "noDevices":Ljava/lang/String;
    :cond_1
    :goto_0
    nop

    .line 223
    :cond_2
    :goto_1
    return-void
.end method
