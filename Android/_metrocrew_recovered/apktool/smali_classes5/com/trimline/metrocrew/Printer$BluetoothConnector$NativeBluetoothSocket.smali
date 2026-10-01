.class public Lcom/trimline/metrocrew/Printer$BluetoothConnector$NativeBluetoothSocket;
.super Ljava/lang/Object;
.source "Printer.java"

# interfaces
.implements Lcom/trimline/metrocrew/Printer$BluetoothConnector$BluetoothSocketWrapper;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Printer$BluetoothConnector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NativeBluetoothSocket"
.end annotation


# instance fields
.field private socket:Landroid/bluetooth/BluetoothSocket;


# direct methods
.method public constructor <init>(Landroid/bluetooth/BluetoothSocket;)V
    .locals 0
    .param p1, "tmp"    # Landroid/bluetooth/BluetoothSocket;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "tmp"
        }
    .end annotation

    .line 608
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 609
    iput-object p1, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector$NativeBluetoothSocket;->socket:Landroid/bluetooth/BluetoothSocket;

    .line 610
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 640
    iget-object v0, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector$NativeBluetoothSocket;->socket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->close()V

    .line 641
    return-void
.end method

.method public connect()Landroid/bluetooth/BluetoothSocket;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 629
    iget-object v0, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector$NativeBluetoothSocket;->socket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->connect()V

    .line 630
    invoke-virtual {p0}, Lcom/trimline/metrocrew/Printer$BluetoothConnector$NativeBluetoothSocket;->getUnderlyingSocket()Landroid/bluetooth/BluetoothSocket;

    move-result-object v0

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 614
    iget-object v0, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector$NativeBluetoothSocket;->socket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method public getOutputStream()Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 619
    iget-object v0, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector$NativeBluetoothSocket;->socket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method

.method public getRemoteDeviceAddress()Ljava/lang/String;
    .locals 1

    .line 635
    iget-object v0, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector$NativeBluetoothSocket;->socket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->getRemoteDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRemoteDeviceName()Ljava/lang/String;
    .locals 1

    .line 624
    iget-object v0, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector$NativeBluetoothSocket;->socket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->getRemoteDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUnderlyingSocket()Landroid/bluetooth/BluetoothSocket;
    .locals 1

    .line 645
    iget-object v0, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector$NativeBluetoothSocket;->socket:Landroid/bluetooth/BluetoothSocket;

    return-object v0
.end method
