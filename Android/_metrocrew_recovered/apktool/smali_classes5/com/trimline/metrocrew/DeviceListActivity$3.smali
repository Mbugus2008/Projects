.class Lcom/trimline/metrocrew/DeviceListActivity$3;
.super Ljava/lang/Object;
.source "DeviceListActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


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

    .line 180
    iput-object p1, p0, Lcom/trimline/metrocrew/DeviceListActivity$3;->this$0:Lcom/trimline/metrocrew/DeviceListActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .param p2, "v"    # Landroid/view/View;
    .param p3, "arg2"    # I
    .param p4, "arg3"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "av",
            "v",
            "arg2",
            "arg3"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 183
    .local p1, "av":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/trimline/metrocrew/DeviceListActivity$3;->this$0:Lcom/trimline/metrocrew/DeviceListActivity;

    invoke-static {v0}, Lcom/trimline/metrocrew/DeviceListActivity;->access$100(Lcom/trimline/metrocrew/DeviceListActivity;)Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 185
    move-object v0, p2

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 186
    .local v0, "info":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x11

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 188
    .local v1, "address":Ljava/lang/String;
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 189
    .local v2, "intent":Landroid/content/Intent;
    sget-object v3, Lcom/trimline/metrocrew/DeviceListActivity;->EXTRA_DEVICE_ADDRESS:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 190
    iget-object v3, p0, Lcom/trimline/metrocrew/DeviceListActivity$3;->this$0:Lcom/trimline/metrocrew/DeviceListActivity;

    iget-object v3, v3, Lcom/trimline/metrocrew/DeviceListActivity;->SP:Ljava/lang/String;

    const-string v4, "SP"

    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 192
    iget-object v3, p0, Lcom/trimline/metrocrew/DeviceListActivity$3;->this$0:Lcom/trimline/metrocrew/DeviceListActivity;

    const/4 v4, -0x1

    invoke-virtual {v3, v4, v2}, Lcom/trimline/metrocrew/DeviceListActivity;->setResult(ILandroid/content/Intent;)V

    .line 193
    iget-object v3, p0, Lcom/trimline/metrocrew/DeviceListActivity$3;->this$0:Lcom/trimline/metrocrew/DeviceListActivity;

    invoke-virtual {v3}, Lcom/trimline/metrocrew/DeviceListActivity;->finish()V

    .line 194
    return-void
.end method
