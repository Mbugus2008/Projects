.class public Lcom/trimline/metrocrew/Printer$Printerthread;
.super Ljava/lang/Thread;
.source "Printer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Printer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Printerthread"
.end annotation


# instance fields
.field private pSocket:Landroid/bluetooth/BluetoothSocket;

.field preferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>(Landroid/content/SharedPreferences;)V
    .locals 1
    .param p1, "s"    # Landroid/content/SharedPreferences;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "s"
        }
    .end annotation

    .line 96
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 98
    :try_start_0
    iput-object p1, p0, Lcom/trimline/metrocrew/Printer$Printerthread;->preferences:Landroid/content/SharedPreferences;

    .line 99
    sput-object p0, Lcom/trimline/metrocrew/Printer$printer;->printThread:Lcom/trimline/metrocrew/Printer$Printerthread;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    goto :goto_0

    .line 100
    :catch_0
    move-exception v0

    .line 101
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 103
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_0
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .line 216
    :try_start_0
    iget-object v0, p0, Lcom/trimline/metrocrew/Printer$Printerthread;->pSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->close()V

    .line 217
    sget-object v0, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 220
    goto :goto_0

    .line 218
    :catch_0
    move-exception v0

    .line 221
    :goto_0
    return-void
.end method

.method public flush()V
    .locals 1

    .line 204
    :try_start_0
    sget-object v0, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 208
    :catch_0
    move-exception v0

    .line 209
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 206
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 207
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 210
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    nop

    .line 212
    :goto_1
    return-void
.end method

.method public run()V
    .locals 21

    .line 106
    move-object/from16 v1, p0

    const-string v2, "printer connected"

    const-string v3, ""

    const-string v4, "thread"

    const/16 v0, 0x400

    new-array v5, v0, [B

    .line 107
    .local v5, "pbuffer":[B
    const/4 v6, 0x0

    .line 108
    .local v6, "pbytes":I
    const/4 v7, 0x0

    .line 112
    .local v7, "pbegin":I
    :goto_0
    :try_start_0
    const-string v0, "running"

    invoke-static {v4, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    iget-object v0, v1, Lcom/trimline/metrocrew/Printer$Printerthread;->preferences:Landroid/content/SharedPreferences;

    const-string v8, "PRINTER"

    invoke-interface {v0, v8, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v8, v0

    .line 115
    .local v8, "value":Ljava/lang/String;
    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 116
    invoke-static {}, Landroid/bluetooth/BluetoothAdapter;->getDefaultAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v0

    move-object v9, v0

    .line 117
    .local v9, "ad":Landroid/bluetooth/BluetoothAdapter;
    if-eqz v9, :cond_5

    .line 118
    invoke-virtual {v9}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 119
    invoke-virtual {v9}, Landroid/bluetooth/BluetoothAdapter;->enable()Z

    .line 120
    :cond_0
    invoke-virtual {v9, v8}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    move-object v10, v0

    .line 121
    .local v10, "prnt":Landroid/bluetooth/BluetoothDevice;
    invoke-virtual {v10}, Landroid/bluetooth/BluetoothDevice;->getUuids()[Landroid/os/ParcelUuid;

    move-result-object v0

    move-object v11, v0

    .line 122
    .local v11, "uuds":[Landroid/os/ParcelUuid;
    if-eqz v11, :cond_2

    .line 123
    array-length v12, v11

    const/4 v13, 0x0

    :goto_1
    if-ge v13, v12, :cond_1

    aget-object v14, v11, v13

    .line 125
    .local v14, "u":Landroid/os/ParcelUuid;
    invoke-virtual {v14}, Landroid/os/ParcelUuid;->getUuid()Ljava/util/UUID;

    move-result-object v15

    .line 126
    .local v15, "pa":Ljava/util/UUID;
    const/16 v16, 0x0

    const-string v0, "Device uuid"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    move-object/from16 v17, v3

    :try_start_1
    invoke-virtual {v15}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    nop

    .end local v14    # "u":Landroid/os/ParcelUuid;
    .end local v15    # "pa":Ljava/util/UUID;
    add-int/lit8 v13, v13, 0x1

    move-object/from16 v3, v17

    goto :goto_1

    :cond_1
    move-object/from16 v17, v3

    const/16 v16, 0x0

    goto :goto_2

    .line 122
    :cond_2
    move-object/from16 v17, v3

    const/16 v16, 0x0

    .line 128
    :goto_2
    sput-object v10, Lcom/trimline/metrocrew/Printer$printer;->printerdevice:Landroid/bluetooth/BluetoothDevice;

    .line 129
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v3, "createRfcommSocket"

    const/4 v12, 0x1

    new-array v13, v12, [Ljava/lang/Class;

    sget-object v14, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v14, v13, v16

    invoke-virtual {v0, v3, v13}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    move-object v3, v0

    .line 131
    .local v3, "m":Ljava/lang/reflect/Method;
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v3, v10, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothSocket;

    sput-object v0, Lcom/trimline/metrocrew/Printer$printer;->printersock:Landroid/bluetooth/BluetoothSocket;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 133
    const-wide/16 v13, 0x3e8

    :try_start_2
    invoke-static {v13, v14}, Ljava/lang/Thread;->sleep(J)V

    .line 134
    sget-object v0, Lcom/trimline/metrocrew/Printer$printer;->printersock:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->isConnected()Z

    move-result v0

    if-nez v0, :cond_3

    .line 135
    sget-object v0, Lcom/trimline/metrocrew/Printer$printer;->printersock:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->connect()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 146
    :cond_3
    move-object/from16 v18, v3

    goto :goto_3

    .line 136
    :catch_0
    move-exception v0

    .line 138
    .local v0, "ex":Ljava/io/IOException;
    :try_start_3
    const-string v15, "fa87c0d0-afac-11de-8a39-0800200c9a66"

    .line 139
    invoke-static {v15}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v15

    .line 140
    .local v15, "MY_UUID_SECURE":Ljava/util/UUID;
    new-instance v16, Ljava/util/ArrayList;

    invoke-direct/range {v16 .. v16}, Ljava/util/ArrayList;-><init>()V

    move-object/from16 v18, v16

    .line 141
    .local v18, "ids":Ljava/util/List;, "Ljava/util/List<Ljava/util/UUID;>;"
    move-object/from16 v16, v15

    .line 142
    .local v16, "id":Ljava/util/UUID;
    move-wide/from16 v19, v13

    move-object/from16 v14, v16

    move-object/from16 v13, v18

    .end local v16    # "id":Ljava/util/UUID;
    .end local v18    # "ids":Ljava/util/List;, "Ljava/util/List<Ljava/util/UUID;>;"
    .local v13, "ids":Ljava/util/List;, "Ljava/util/List<Ljava/util/UUID;>;"
    .local v14, "id":Ljava/util/UUID;
    invoke-interface {v13, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    new-instance v12, Lcom/trimline/metrocrew/Printer$BluetoothConnector;

    move-object/from16 v18, v3

    const/4 v3, 0x1

    .end local v3    # "m":Ljava/lang/reflect/Method;
    .local v18, "m":Ljava/lang/reflect/Method;
    invoke-direct {v12, v10, v3, v9, v13}, Lcom/trimline/metrocrew/Printer$BluetoothConnector;-><init>(Landroid/bluetooth/BluetoothDevice;ZLandroid/bluetooth/BluetoothAdapter;Ljava/util/List;)V

    .line 144
    .local v12, "bc":Lcom/trimline/metrocrew/Printer$BluetoothConnector;
    invoke-static/range {v19 .. v20}, Ljava/lang/Thread;->sleep(J)V

    .line 145
    invoke-virtual {v12}, Lcom/trimline/metrocrew/Printer$BluetoothConnector;->connect()Landroid/bluetooth/BluetoothSocket;

    move-result-object v3

    sput-object v3, Lcom/trimline/metrocrew/Printer$printer;->printersock:Landroid/bluetooth/BluetoothSocket;

    .line 147
    .end local v0    # "ex":Ljava/io/IOException;
    .end local v12    # "bc":Lcom/trimline/metrocrew/Printer$BluetoothConnector;
    .end local v13    # "ids":Ljava/util/List;, "Ljava/util/List<Ljava/util/UUID;>;"
    .end local v14    # "id":Ljava/util/UUID;
    .end local v15    # "MY_UUID_SECURE":Ljava/util/UUID;
    :goto_3
    sget-object v0, Lcom/trimline/metrocrew/Printer;->mHandler:Landroid/os/Handler;

    const/16 v16, 0x1

    invoke-static/range {v16 .. v16}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    const/16 v12, 0x9

    invoke-virtual {v0, v12, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 148
    sget-object v0, Lcom/trimline/metrocrew/Printer$printer;->printersock:Landroid/bluetooth/BluetoothSocket;

    iput-object v0, v1, Lcom/trimline/metrocrew/Printer$Printerthread;->pSocket:Landroid/bluetooth/BluetoothSocket;

    .line 150
    iget-object v0, v1, Lcom/trimline/metrocrew/Printer$Printerthread;->pSocket:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    sput-object v0, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    .line 151
    invoke-static {v4, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 154
    :goto_4
    :try_start_4
    sget-object v0, Lcom/trimline/metrocrew/Printer$printer;->printersock:Landroid/bluetooth/BluetoothSocket;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothSocket;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 155
    invoke-static {v4, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    const-wide/16 v12, 0x7d0

    invoke-static {v12, v13}, Lcom/trimline/metrocrew/Printer$Printerthread;->sleep(J)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_4

    .line 163
    :cond_4
    goto :goto_5

    .line 161
    :catch_1
    move-exception v0

    .line 162
    .local v0, "e":Ljava/lang/Exception;
    :try_start_5
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 164
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v10    # "prnt":Landroid/bluetooth/BluetoothDevice;
    .end local v11    # "uuds":[Landroid/os/ParcelUuid;
    .end local v18    # "m":Ljava/lang/reflect/Method;
    :goto_5
    goto :goto_6

    .line 165
    :cond_5
    move-object/from16 v17, v3

    sget-object v0, Lcom/trimline/metrocrew/Printer;->mHandler:Landroid/os/Handler;

    const-string v3, "No bluetooth found"

    const/4 v10, 0x5

    invoke-virtual {v0, v10, v3}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2

    .line 167
    .end local v9    # "ad":Landroid/bluetooth/BluetoothAdapter;
    :goto_6
    goto :goto_8

    .line 168
    .end local v8    # "value":Ljava/lang/String;
    :catch_2
    move-exception v0

    goto :goto_7

    .line 167
    .restart local v8    # "value":Ljava/lang/String;
    :cond_6
    return-void

    .line 168
    .end local v8    # "value":Ljava/lang/String;
    :catch_3
    move-exception v0

    move-object/from16 v17, v3

    .line 169
    .local v0, "ex":Ljava/lang/Exception;
    :goto_7
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 171
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_8
    move-object/from16 v3, v17

    goto/16 :goto_0
.end method

.method public write(I)V
    .locals 1
    .param p1, "buffer"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "buffer"
        }
    .end annotation

    .line 193
    :try_start_0
    sget-object v0, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 197
    :catch_0
    move-exception v0

    .line 198
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 195
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 196
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 199
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    nop

    .line 200
    :goto_1
    return-void
.end method

.method public write([B)V
    .locals 1
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "buffer"
        }
    .end annotation

    .line 182
    :try_start_0
    sget-object v0, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 186
    :catch_0
    move-exception v0

    .line 187
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 184
    .end local v0    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v0

    .line 185
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 188
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    nop

    .line 189
    :goto_1
    return-void
.end method
