.class public Lcom/trimline/metrocrew/Printer$BluetoothConnector;
.super Ljava/lang/Object;
.source "Printer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Printer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BluetoothConnector"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/Printer$BluetoothConnector$BluetoothSocketWrapper;,
        Lcom/trimline/metrocrew/Printer$BluetoothConnector$FallbackBluetoothSocket;,
        Lcom/trimline/metrocrew/Printer$BluetoothConnector$FallbackException;,
        Lcom/trimline/metrocrew/Printer$BluetoothConnector$NativeBluetoothSocket;
    }
.end annotation


# instance fields
.field private adapter:Landroid/bluetooth/BluetoothAdapter;

.field private bluetoothSocket:Lcom/trimline/metrocrew/Printer$BluetoothConnector$BluetoothSocketWrapper;

.field private candidate:I

.field private device:Landroid/bluetooth/BluetoothDevice;

.field private secure:Z

.field private uuidCandidates:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/UUID;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/bluetooth/BluetoothDevice;ZLandroid/bluetooth/BluetoothAdapter;Ljava/util/List;)V
    .locals 2
    .param p1, "device"    # Landroid/bluetooth/BluetoothDevice;
    .param p2, "secure"    # Z
    .param p3, "adapter"    # Landroid/bluetooth/BluetoothAdapter;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "device",
            "secure",
            "adapter",
            "uuidCandidates"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/bluetooth/BluetoothDevice;",
            "Z",
            "Landroid/bluetooth/BluetoothAdapter;",
            "Ljava/util/List<",
            "Ljava/util/UUID;",
            ">;)V"
        }
    .end annotation

    .line 520
    .local p4, "uuidCandidates":Ljava/util/List;, "Ljava/util/List<Ljava/util/UUID;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 521
    iput-object p1, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->device:Landroid/bluetooth/BluetoothDevice;

    .line 522
    iput-boolean p2, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->secure:Z

    .line 523
    iput-object p3, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->adapter:Landroid/bluetooth/BluetoothAdapter;

    .line 524
    iput-object p4, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->uuidCandidates:Ljava/util/List;

    .line 526
    iget-object v0, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->uuidCandidates:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->uuidCandidates:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 527
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->uuidCandidates:Ljava/util/List;

    .line 528
    iget-object v0, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->uuidCandidates:Ljava/util/List;

    const-string v1, "00001101-0000-1000-8000-00805F9B34FB"

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 530
    :cond_1
    return-void
.end method

.method private selectSocket()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 568
    iget v0, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->candidate:I

    iget-object v1, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->uuidCandidates:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 569
    const/4 v0, 0x0

    return v0

    .line 573
    :cond_0
    iget-object v0, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->uuidCandidates:Ljava/util/List;

    iget v1, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->candidate:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->candidate:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    .line 575
    .local v0, "uuid":Ljava/util/UUID;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Attempting to connect to Protocol: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "BT"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 576
    iget-boolean v1, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->secure:Z

    if-eqz v1, :cond_1

    .line 577
    iget-object v1, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->device:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v1, v0}, Landroid/bluetooth/BluetoothDevice;->createRfcommSocketToServiceRecord(Ljava/util/UUID;)Landroid/bluetooth/BluetoothSocket;

    move-result-object v1

    .local v1, "tmp":Landroid/bluetooth/BluetoothSocket;
    goto :goto_0

    .line 579
    .end local v1    # "tmp":Landroid/bluetooth/BluetoothSocket;
    :cond_1
    iget-object v1, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->device:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v1, v0}, Landroid/bluetooth/BluetoothDevice;->createInsecureRfcommSocketToServiceRecord(Ljava/util/UUID;)Landroid/bluetooth/BluetoothSocket;

    move-result-object v1

    .line 581
    .restart local v1    # "tmp":Landroid/bluetooth/BluetoothSocket;
    :goto_0
    new-instance v2, Lcom/trimline/metrocrew/Printer$BluetoothConnector$NativeBluetoothSocket;

    invoke-direct {v2, v1}, Lcom/trimline/metrocrew/Printer$BluetoothConnector$NativeBluetoothSocket;-><init>(Landroid/bluetooth/BluetoothSocket;)V

    iput-object v2, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->bluetoothSocket:Lcom/trimline/metrocrew/Printer$BluetoothConnector$BluetoothSocketWrapper;

    .line 583
    const/4 v2, 0x1

    return v2
.end method


# virtual methods
.method public connect()Landroid/bluetooth/BluetoothSocket;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 533
    const-string v0, "BT"

    const/4 v1, 0x0

    .line 534
    .local v1, "success":Z
    const/4 v2, 0x0

    .line 535
    .local v2, "bs":Landroid/bluetooth/BluetoothSocket;
    :goto_0
    invoke-direct {p0}, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->selectSocket()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 536
    iget-object v3, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->adapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothAdapter;->cancelDiscovery()Z

    .line 539
    :try_start_0
    iget-object v3, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->bluetoothSocket:Lcom/trimline/metrocrew/Printer$BluetoothConnector$BluetoothSocketWrapper;

    invoke-interface {v3}, Lcom/trimline/metrocrew/Printer$BluetoothConnector$BluetoothSocketWrapper;->connect()Landroid/bluetooth/BluetoothSocket;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v2, v0

    .line 540
    const/4 v1, 0x1

    .line 541
    goto :goto_3

    .line 542
    :catch_0
    move-exception v3

    .line 545
    .local v3, "e":Ljava/io/IOException;
    :try_start_1
    new-instance v4, Lcom/trimline/metrocrew/Printer$BluetoothConnector$FallbackBluetoothSocket;

    iget-object v5, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->bluetoothSocket:Lcom/trimline/metrocrew/Printer$BluetoothConnector$BluetoothSocketWrapper;

    invoke-interface {v5}, Lcom/trimline/metrocrew/Printer$BluetoothConnector$BluetoothSocketWrapper;->getUnderlyingSocket()Landroid/bluetooth/BluetoothSocket;

    move-result-object v5

    invoke-direct {v4, p0, v5}, Lcom/trimline/metrocrew/Printer$BluetoothConnector$FallbackBluetoothSocket;-><init>(Lcom/trimline/metrocrew/Printer$BluetoothConnector;Landroid/bluetooth/BluetoothSocket;)V

    iput-object v4, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->bluetoothSocket:Lcom/trimline/metrocrew/Printer$BluetoothConnector$BluetoothSocketWrapper;

    .line 546
    const-wide/16 v4, 0x1f4

    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V

    .line 547
    iget-object v4, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->bluetoothSocket:Lcom/trimline/metrocrew/Printer$BluetoothConnector$BluetoothSocketWrapper;

    invoke-interface {v4}, Lcom/trimline/metrocrew/Printer$BluetoothConnector$BluetoothSocketWrapper;->connect()Landroid/bluetooth/BluetoothSocket;

    move-result-object v0
    :try_end_1
    .catch Lcom/trimline/metrocrew/Printer$BluetoothConnector$FallbackException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-object v2, v0

    .line 548
    const/4 v1, 0x1

    .line 549
    goto :goto_3

    .line 554
    :catch_1
    move-exception v4

    .line 555
    .local v4, "e1":Ljava/io/IOException;
    const-string v5, "Fallback failed. Cancelling."

    invoke-static {v0, v5, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 556
    invoke-virtual {v4}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_2

    .line 552
    .end local v4    # "e1":Ljava/io/IOException;
    :catch_2
    move-exception v4

    .line 553
    .local v4, "e1":Ljava/lang/InterruptedException;
    invoke-virtual {v4}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .end local v4    # "e1":Ljava/lang/InterruptedException;
    goto :goto_1

    .line 550
    :catch_3
    move-exception v4

    .line 551
    .local v4, "e1":Lcom/trimline/metrocrew/Printer$BluetoothConnector$FallbackException;
    const-string v5, "Could not initialize FallbackBluetoothSocket classes."

    invoke-static {v0, v5, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 557
    .end local v4    # "e1":Lcom/trimline/metrocrew/Printer$BluetoothConnector$FallbackException;
    :goto_1
    nop

    .line 558
    .end local v3    # "e":Ljava/io/IOException;
    :goto_2
    goto :goto_0

    .line 561
    :cond_0
    :goto_3
    if-eqz v1, :cond_1

    .line 565
    return-object v2

    .line 562
    :cond_1
    new-instance v0, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not connect to device: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->device:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v4}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
