.class public Lcom/trimline/metrocrew/Printer;
.super Ljava/lang/Object;
.source "Printer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/Printer$Constants;,
        Lcom/trimline/metrocrew/Printer$BluetoothConnector;,
        Lcom/trimline/metrocrew/Printer$PrinterCommands;,
        Lcom/trimline/metrocrew/Printer$printer;,
        Lcom/trimline/metrocrew/Printer$Printerthread;,
        Lcom/trimline/metrocrew/Printer$reportheader;,
        Lcom/trimline/metrocrew/Printer$Receipts;,
        Lcom/trimline/metrocrew/Printer$getdata;,
        Lcom/trimline/metrocrew/Printer$collectiondates;,
        Lcom/trimline/metrocrew/Printer$reportfields;
    }
.end annotation


# static fields
.field static mHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 80
    const/4 v0, 0x0

    sput-object v0, Lcom/trimline/metrocrew/Printer;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createBond(Landroid/bluetooth/BluetoothDevice;)Z
    .locals 4
    .param p0, "btDevice"    # Landroid/bluetooth/BluetoothDevice;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "btDevice"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 85
    const-string v0, "android.bluetooth.BluetoothDevice"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 86
    .local v0, "class1":Ljava/lang/Class;
    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    const-string v3, "createBond"

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 87
    .local v2, "createBondMethod":Ljava/lang/reflect/Method;
    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v2, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    .line 88
    .local v1, "returnValue":Ljava/lang/Boolean;
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    return v3
.end method
