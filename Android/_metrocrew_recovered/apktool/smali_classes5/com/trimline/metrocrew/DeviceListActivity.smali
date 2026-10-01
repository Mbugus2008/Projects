.class public Lcom/trimline/metrocrew/DeviceListActivity;
.super Landroid/app/Activity;
.source "DeviceListActivity.java"


# static fields
.field public static EXTRA_DEVICE_ADDRESS:Ljava/lang/String; = null

.field public static final REQUEST_CONNECT_BT:I = 0x2300

.field private static final TAG:Ljava/lang/String; = "DeviceListActivity"


# instance fields
.field SP:Ljava/lang/String;

.field private mBtAdapter:Landroid/bluetooth/BluetoothAdapter;

.field private mDeviceClickListener:Landroid/widget/AdapterView$OnItemClickListener;

.field private mNewDevicesArrayAdapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 55
    const-string v0, "device_address"

    sput-object v0, Lcom/trimline/metrocrew/DeviceListActivity;->EXTRA_DEVICE_ADDRESS:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 45
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 179
    new-instance v0, Lcom/trimline/metrocrew/DeviceListActivity$3;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/DeviceListActivity$3;-><init>(Lcom/trimline/metrocrew/DeviceListActivity;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/DeviceListActivity;->mDeviceClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    .line 201
    new-instance v0, Lcom/trimline/metrocrew/DeviceListActivity$4;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/DeviceListActivity$4;-><init>(Lcom/trimline/metrocrew/DeviceListActivity;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/DeviceListActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/trimline/metrocrew/DeviceListActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/trimline/metrocrew/DeviceListActivity;

    .line 45
    invoke-direct {p0}, Lcom/trimline/metrocrew/DeviceListActivity;->doDiscovery()V

    return-void
.end method

.method static synthetic access$100(Lcom/trimline/metrocrew/DeviceListActivity;)Landroid/bluetooth/BluetoothAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/DeviceListActivity;

    .line 45
    iget-object v0, p0, Lcom/trimline/metrocrew/DeviceListActivity;->mBtAdapter:Landroid/bluetooth/BluetoothAdapter;

    return-object v0
.end method

.method static synthetic access$200(Lcom/trimline/metrocrew/DeviceListActivity;)Landroid/widget/ArrayAdapter;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/DeviceListActivity;

    .line 45
    iget-object v0, p0, Lcom/trimline/metrocrew/DeviceListActivity;->mNewDevicesArrayAdapter:Landroid/widget/ArrayAdapter;

    return-object v0
.end method

.method private doDiscovery()V
    .locals 2

    .line 158
    const-string v0, "DeviceListActivity"

    const-string v1, "doDiscovery()"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/DeviceListActivity;->setProgressBarIndeterminateVisibility(Z)V

    .line 162
    const v0, 0x7f1200b0

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/DeviceListActivity;->setTitle(I)V

    .line 165
    const v0, 0x7f0a022f

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/DeviceListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 168
    iget-object v0, p0, Lcom/trimline/metrocrew/DeviceListActivity;->mBtAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->isDiscovering()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 169
    iget-object v0, p0, Lcom/trimline/metrocrew/DeviceListActivity;->mBtAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 173
    :cond_0
    iget-object v0, p0, Lcom/trimline/metrocrew/DeviceListActivity;->mBtAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->startDiscovery()Z

    .line 174
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 11
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "savedInstanceState"
        }
    .end annotation

    .line 69
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 72
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/DeviceListActivity;->requestWindowFeature(I)Z

    .line 73
    const v0, 0x7f0d001d

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/DeviceListActivity;->setContentView(I)V

    .line 74
    invoke-virtual {p0}, Lcom/trimline/metrocrew/DeviceListActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 75
    .local v0, "bundle":Landroid/os/Bundle;
    const-string v1, "SP"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/trimline/metrocrew/DeviceListActivity;->SP:Ljava/lang/String;

    .line 77
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Lcom/trimline/metrocrew/DeviceListActivity;->setResult(I)V

    .line 80
    const v2, 0x7f0a007e

    invoke-virtual {p0, v2}, Lcom/trimline/metrocrew/DeviceListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 81
    .local v2, "scanButton":Landroid/widget/Button;
    new-instance v3, Lcom/trimline/metrocrew/DeviceListActivity$1;

    invoke-direct {v3, p0}, Lcom/trimline/metrocrew/DeviceListActivity$1;-><init>(Lcom/trimline/metrocrew/DeviceListActivity;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 90
    new-instance v3, Landroid/widget/ArrayAdapter;

    const v4, 0x7f0d0034

    invoke-direct {v3, p0, v4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    .line 92
    .local v3, "pairedDevicesArrayAdapter":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    new-instance v5, Landroid/widget/ArrayAdapter;

    invoke-direct {v5, p0, v4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I)V

    iput-object v5, p0, Lcom/trimline/metrocrew/DeviceListActivity;->mNewDevicesArrayAdapter:Landroid/widget/ArrayAdapter;

    .line 95
    const v4, 0x7f0a0199

    invoke-virtual {p0, v4}, Lcom/trimline/metrocrew/DeviceListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ListView;

    .line 96
    .local v4, "pairedListView":Landroid/widget/ListView;
    invoke-virtual {v4, v3}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 97
    iget-object v5, p0, Lcom/trimline/metrocrew/DeviceListActivity;->mDeviceClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v4, v5}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 98
    new-instance v5, Lcom/trimline/metrocrew/DeviceListActivity$2;

    invoke-direct {v5, p0}, Lcom/trimline/metrocrew/DeviceListActivity$2;-><init>(Lcom/trimline/metrocrew/DeviceListActivity;)V

    invoke-virtual {v4, v5}, Landroid/widget/ListView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 111
    const v5, 0x7f0a0174

    invoke-virtual {p0, v5}, Lcom/trimline/metrocrew/DeviceListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ListView;

    .line 112
    .local v5, "newDevicesListView":Landroid/widget/ListView;
    iget-object v6, p0, Lcom/trimline/metrocrew/DeviceListActivity;->mNewDevicesArrayAdapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 113
    iget-object v6, p0, Lcom/trimline/metrocrew/DeviceListActivity;->mDeviceClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v5, v6}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 116
    new-instance v6, Landroid/content/IntentFilter;

    const-string v7, "android.bluetooth.device.action.FOUND"

    invoke-direct {v6, v7}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 117
    .local v6, "filter":Landroid/content/IntentFilter;
    iget-object v7, p0, Lcom/trimline/metrocrew/DeviceListActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v7, v6}, Lcom/trimline/metrocrew/DeviceListActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 120
    new-instance v7, Landroid/content/IntentFilter;

    const-string v8, "android.bluetooth.adapter.action.DISCOVERY_FINISHED"

    invoke-direct {v7, v8}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 121
    .end local v6    # "filter":Landroid/content/IntentFilter;
    .local v7, "filter":Landroid/content/IntentFilter;
    iget-object v6, p0, Lcom/trimline/metrocrew/DeviceListActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v6, v7}, Lcom/trimline/metrocrew/DeviceListActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 124
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v6

    iput-object v6, p0, Lcom/trimline/metrocrew/DeviceListActivity;->mBtAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 127
    iget-object v6, p0, Lcom/trimline/metrocrew/DeviceListActivity;->mBtAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothAdapter;->getBondedDevices()Ljava/util/Set;

    move-result-object v6

    .line 130
    .local v6, "pairedDevices":Ljava/util/Set;, "Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    invoke-interface {v6}, Ljava/util/Set;->size()I

    move-result v8

    if-lez v8, :cond_1

    .line 131
    const v8, 0x7f0a0230

    invoke-virtual {p0, v8}, Lcom/trimline/metrocrew/DeviceListActivity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8, v1}, Landroid/view/View;->setVisibility(I)V

    .line 132
    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/bluetooth/BluetoothDevice;

    .line 133
    .local v8, "device":Landroid/bluetooth/BluetoothDevice;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\n"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v8}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v9}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 134
    .end local v8    # "device":Landroid/bluetooth/BluetoothDevice;
    goto :goto_0

    :cond_0
    goto :goto_1

    .line 136
    :cond_1
    invoke-virtual {p0}, Lcom/trimline/metrocrew/DeviceListActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v8, 0x7f1200aa

    invoke-virtual {v1, v8}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 137
    .local v1, "noDevices":Ljava/lang/String;
    invoke-virtual {v3, v1}, Landroid/widget/ArrayAdapter;->add(Ljava/lang/Object;)V

    .line 139
    .end local v1    # "noDevices":Ljava/lang/String;
    :goto_1
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 143
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 146
    iget-object v0, p0, Lcom/trimline/metrocrew/DeviceListActivity;->mBtAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-eqz v0, :cond_0

    .line 147
    iget-object v0, p0, Lcom/trimline/metrocrew/DeviceListActivity;->mBtAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 151
    :cond_0
    iget-object v0, p0, Lcom/trimline/metrocrew/DeviceListActivity;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/DeviceListActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 152
    return-void
.end method
