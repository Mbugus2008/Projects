.class public Lcom/trimline/metrocrew/Printer$BluetoothConnector$FallbackBluetoothSocket;
.super Lcom/trimline/metrocrew/Printer$BluetoothConnector$NativeBluetoothSocket;
.source "Printer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Printer$BluetoothConnector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "FallbackBluetoothSocket"
.end annotation


# instance fields
.field private fallbackSocket:Landroid/bluetooth/BluetoothSocket;

.field final synthetic this$0:Lcom/trimline/metrocrew/Printer$BluetoothConnector;


# direct methods
.method public constructor <init>(Lcom/trimline/metrocrew/Printer$BluetoothConnector;Landroid/bluetooth/BluetoothSocket;)V
    .locals 5
    .param p1, "this$0"    # Lcom/trimline/metrocrew/Printer$BluetoothConnector;
    .param p2, "tmp"    # Landroid/bluetooth/BluetoothSocket;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            "this$0",
            "tmp"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/trimline/metrocrew/Printer$BluetoothConnector$FallbackException;
        }
    .end annotation

    .line 654
    iput-object p1, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector$FallbackBluetoothSocket;->this$0:Lcom/trimline/metrocrew/Printer$BluetoothConnector;

    .line 655
    invoke-direct {p0, p2}, Lcom/trimline/metrocrew/Printer$BluetoothConnector$NativeBluetoothSocket;-><init>(Landroid/bluetooth/BluetoothSocket;)V

    .line 658
    :try_start_0
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothSocket;->getRemoteDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 659
    .local v0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Class;

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    .line 660
    .local v2, "paramTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const-string v3, "createRfcommSocket"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    .line 661
    .local v3, "m":Ljava/lang/reflect/Method;
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    .line 662
    .local v1, "params":[Ljava/lang/Object;
    invoke-virtual {p2}, Landroid/bluetooth/BluetoothSocket;->getRemoteDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v4

    invoke-virtual {v3, v4, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/bluetooth/BluetoothSocket;

    iput-object v4, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector$FallbackBluetoothSocket;->fallbackSocket:Landroid/bluetooth/BluetoothSocket;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 667
    .end local v0    # "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v1    # "params":[Ljava/lang/Object;
    .end local v2    # "paramTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v3    # "m":Ljava/lang/reflect/Method;
    nop

    .line 668
    return-void

    .line 664
    :catch_0
    move-exception v0

    .line 666
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Lcom/trimline/metrocrew/Printer$BluetoothConnector$FallbackException;

    invoke-direct {v1, v0}, Lcom/trimline/metrocrew/Printer$BluetoothConnector$FallbackException;-><init>(Ljava/lang/Exception;)V

    throw v1
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 690
    iget-object v0, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector$FallbackBluetoothSocket;->fallbackSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->close()V

    .line 691
    return-void
.end method

.method public connect()Landroid/bluetooth/BluetoothSocket;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 683
    iget-object v0, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector$FallbackBluetoothSocket;->fallbackSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->connect()V

    .line 684
    iget-object v0, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector$FallbackBluetoothSocket;->fallbackSocket:Landroid/bluetooth/BluetoothSocket;

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 672
    iget-object v0, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector$FallbackBluetoothSocket;->fallbackSocket:Landroid/bluetooth/BluetoothSocket;

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

    .line 677
    iget-object v0, p0, Lcom/trimline/metrocrew/Printer$BluetoothConnector$FallbackBluetoothSocket;->fallbackSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    return-object v0
.end method
