.class public Lcom/trimline/metrocrew/Printer$printer;
.super Ljava/lang/Object;
.source "Printer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Printer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "printer"
.end annotation


# static fields
.field public static printThread:Lcom/trimline/metrocrew/Printer$Printerthread;

.field public static printerdevice:Landroid/bluetooth/BluetoothDevice;

.field public static printerout:Ljava/io/OutputStream;

.field public static printersock:Landroid/bluetooth/BluetoothSocket;


# instance fields
.field dots:Ljava/util/BitSet;

.field mHeight:I

.field mStatus:Ljava/lang/String;

.field mWidth:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 225
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private convertArgbToGrayscale(Landroid/graphics/Bitmap;II)V
    .locals 19
    .param p1, "bmpOriginal"    # Landroid/graphics/Bitmap;
    .param p2, "width"    # I
    .param p3, "height"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "bmpOriginal",
            "width",
            "height"
        }
    .end annotation

    .line 432
    move-object/from16 v1, p0

    const/4 v0, 0x0

    .line 433
    .local v0, "k":I
    const/4 v2, 0x0

    .local v2, "B":I
    const/4 v3, 0x0

    .local v3, "G":I
    const/4 v4, 0x0

    .line 434
    .local v4, "R":I
    new-instance v5, Ljava/util/BitSet;

    invoke-direct {v5}, Ljava/util/BitSet;-><init>()V

    iput-object v5, v1, Lcom/trimline/metrocrew/Printer$printer;->dots:Ljava/util/BitSet;

    .line 437
    const/4 v5, 0x0

    .local v5, "x":I
    :goto_0
    move/from16 v6, p3

    if-ge v5, v6, :cond_2

    .line 438
    const/4 v7, 0x0

    move/from16 v18, v2

    move v2, v0

    move v0, v7

    move v7, v4

    move v4, v3

    move/from16 v3, v18

    .local v0, "y":I
    .local v2, "k":I
    .local v3, "B":I
    .local v4, "G":I
    .local v7, "R":I
    :goto_1
    move/from16 v8, p2

    if-ge v0, v8, :cond_1

    .line 440
    move-object/from16 v9, p1

    :try_start_0
    invoke-virtual {v9, v0, v5}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v10

    .line 443
    .local v10, "pixel":I
    invoke-static {v10}, Landroid/graphics/Color;->red(I)I

    move-result v11
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    .line 444
    .end local v7    # "R":I
    .local v11, "R":I
    :try_start_1
    invoke-static {v10}, Landroid/graphics/Color;->green(I)I

    move-result v7
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 445
    .end local v4    # "G":I
    .local v7, "G":I
    :try_start_2
    invoke-static {v10}, Landroid/graphics/Color;->blue(I)I

    move-result v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 448
    .end local v3    # "B":I
    .local v4, "B":I
    const-wide v12, 0x3fd322d0e5604189L    # 0.299

    int-to-double v14, v11

    mul-double/2addr v14, v12

    const-wide v16, 0x3fe2c8b439581062L    # 0.587

    int-to-double v12, v7

    mul-double v12, v12, v16

    add-double/2addr v14, v12

    const-wide v16, 0x3fbd2f1a9fbe76c9L    # 0.114

    int-to-double v12, v4

    mul-double v12, v12, v16

    add-double/2addr v14, v12

    double-to-int v3, v14

    move v4, v3

    move v7, v3

    .line 450
    .end local v11    # "R":I
    .local v3, "R":I
    const/16 v11, 0x37

    if-ge v3, v11, :cond_0

    .line 451
    :try_start_3
    iget-object v11, v1, Lcom/trimline/metrocrew/Printer$printer;->dots:Ljava/util/BitSet;

    invoke-virtual {v11, v2}, Ljava/util/BitSet;->set(I)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_2

    .line 461
    .end local v0    # "y":I
    .end local v5    # "x":I
    .end local v10    # "pixel":I
    :catch_0
    move-exception v0

    move/from16 v18, v7

    move v7, v3

    move v3, v4

    move/from16 v4, v18

    goto :goto_3

    .line 453
    .restart local v0    # "y":I
    .restart local v5    # "x":I
    .restart local v10    # "pixel":I
    :cond_0
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 438
    add-int/lit8 v0, v0, 0x1

    move/from16 v18, v7

    move v7, v3

    move v3, v4

    move/from16 v4, v18

    goto :goto_1

    .line 461
    .end local v0    # "y":I
    .end local v4    # "B":I
    .end local v5    # "x":I
    .end local v10    # "pixel":I
    .local v3, "B":I
    .restart local v11    # "R":I
    :catch_1
    move-exception v0

    move v4, v7

    move v7, v11

    goto :goto_3

    .end local v7    # "G":I
    .local v4, "G":I
    :catch_2
    move-exception v0

    move v7, v11

    goto :goto_3

    .end local v11    # "R":I
    .local v7, "R":I
    :catch_3
    move-exception v0

    .line 463
    .local v0, "e":Ljava/lang/Exception;
    :goto_3
    const-string v5, "TAG"

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v5, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v0, v2

    move v2, v3

    move v3, v4

    move v4, v7

    goto :goto_4

    .line 438
    .local v0, "y":I
    .restart local v5    # "x":I
    :cond_1
    move-object/from16 v9, p1

    .line 437
    .end local v0    # "y":I
    add-int/lit8 v5, v5, 0x1

    move v0, v2

    move v2, v3

    move v3, v4

    move v4, v7

    goto :goto_0

    .end local v7    # "R":I
    .local v0, "k":I
    .local v2, "B":I
    .local v3, "G":I
    .local v4, "R":I
    :cond_2
    move-object/from16 v9, p1

    move/from16 v8, p2

    .line 464
    .end local v5    # "x":I
    nop

    .line 465
    :goto_4
    return-void
.end method

.method private getpreferences(Landroid/content/SharedPreferences;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "s"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "s",
            "key"
        }
    .end annotation

    .line 468
    const-string v0, ""

    .line 469
    .local v0, "pref":Ljava/lang/String;
    const-string v1, ""

    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 471
    .local v2, "value":Ljava/lang/String;
    if-nez v2, :cond_0

    if-eq v2, v1, :cond_1

    .line 472
    :cond_0
    move-object v0, v2

    .line 474
    :cond_1
    return-object v0
.end method

.method private print_image(Landroid/graphics/Bitmap;)V
    .locals 11
    .param p1, "bb"    # Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bb"
        }
    .end annotation

    .line 373
    move-object v0, p1

    .line 374
    .local v0, "bmp":Landroid/graphics/Bitmap;
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Printer$printer;->convertBitmap(Landroid/graphics/Bitmap;)Ljava/lang/String;

    .line 375
    sget-object v1, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    sget-object v2, Lcom/trimline/metrocrew/Printer$PrinterCommands;->SET_LINE_SPACING_24:[B

    invoke-virtual {v1, v2}, Ljava/io/OutputStream;->write([B)V

    .line 377
    const/4 v1, 0x0

    .line 378
    .local v1, "offset":I
    :goto_0
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    if-ge v1, v2, :cond_5

    .line 379
    sget-object v2, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    sget-object v3, Lcom/trimline/metrocrew/Printer$PrinterCommands;->SELECT_BIT_IMAGE_MODE:[B

    invoke-virtual {v2, v3}, Ljava/io/OutputStream;->write([B)V

    .line 380
    const/4 v2, 0x0

    .local v2, "x":I
    :goto_1
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    if-ge v2, v3, :cond_4

    .line 382
    const/4 v3, 0x0

    .local v3, "k":I
    :goto_2
    const/4 v4, 0x3

    if-ge v3, v4, :cond_3

    .line 384
    const/4 v4, 0x0

    .line 385
    .local v4, "slice":B
    const/4 v5, 0x0

    .local v5, "b":I
    :goto_3
    const/16 v6, 0x8

    if-ge v5, v6, :cond_2

    .line 386
    div-int/lit8 v7, v1, 0x8

    add-int/2addr v7, v3

    mul-int/2addr v7, v6

    add-int/2addr v7, v5

    .line 387
    .local v7, "y":I
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    mul-int/2addr v6, v7

    add-int/2addr v6, v2

    .line 388
    .local v6, "i":I
    const/4 v8, 0x0

    .line 389
    .local v8, "v":Z
    iget-object v9, p0, Lcom/trimline/metrocrew/Printer$printer;->dots:Ljava/util/BitSet;

    invoke-virtual {v9}, Ljava/util/BitSet;->length()I

    move-result v9

    if-ge v6, v9, :cond_0

    .line 390
    iget-object v9, p0, Lcom/trimline/metrocrew/Printer$printer;->dots:Ljava/util/BitSet;

    invoke-virtual {v9, v6}, Ljava/util/BitSet;->get(I)Z

    move-result v9

    move v8, v9

    .line 392
    :cond_0
    if-eqz v8, :cond_1

    const/4 v9, 0x1

    goto :goto_4

    :cond_1
    const/4 v9, 0x0

    :goto_4
    rsub-int/lit8 v10, v5, 0x7

    shl-int/2addr v9, v10

    int-to-byte v9, v9

    or-int/2addr v9, v4

    int-to-byte v4, v9

    .line 385
    .end local v6    # "i":I
    .end local v7    # "y":I
    .end local v8    # "v":Z
    add-int/lit8 v5, v5, 0x1

    goto :goto_3

    .line 394
    .end local v5    # "b":I
    :cond_2
    sget-object v5, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    invoke-virtual {v5, v4}, Ljava/io/OutputStream;->write(I)V

    .line 382
    .end local v4    # "slice":B
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 380
    .end local v3    # "k":I
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 397
    .end local v2    # "x":I
    :cond_4
    add-int/lit8 v1, v1, 0x18

    .line 398
    sget-object v2, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    sget-object v3, Lcom/trimline/metrocrew/Printer$PrinterCommands;->FEED_LINE:[B

    invoke-virtual {v2, v3}, Ljava/io/OutputStream;->write([B)V

    .line 399
    sget-object v2, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    sget-object v3, Lcom/trimline/metrocrew/Printer$PrinterCommands;->FEED_LINE:[B

    invoke-virtual {v2, v3}, Ljava/io/OutputStream;->write([B)V

    .line 400
    sget-object v2, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    sget-object v3, Lcom/trimline/metrocrew/Printer$PrinterCommands;->FEED_LINE:[B

    invoke-virtual {v2, v3}, Ljava/io/OutputStream;->write([B)V

    .line 401
    sget-object v2, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    sget-object v3, Lcom/trimline/metrocrew/Printer$PrinterCommands;->FEED_LINE:[B

    invoke-virtual {v2, v3}, Ljava/io/OutputStream;->write([B)V

    .line 402
    sget-object v2, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    sget-object v3, Lcom/trimline/metrocrew/Printer$PrinterCommands;->FEED_LINE:[B

    invoke-virtual {v2, v3}, Ljava/io/OutputStream;->write([B)V

    .line 403
    sget-object v2, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    sget-object v3, Lcom/trimline/metrocrew/Printer$PrinterCommands;->FEED_LINE:[B

    invoke-virtual {v2, v3}, Ljava/io/OutputStream;->write([B)V

    goto :goto_0

    .line 405
    :cond_5
    sget-object v2, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    sget-object v3, Lcom/trimline/metrocrew/Printer$PrinterCommands;->SET_LINE_SPACING_30:[B

    invoke-virtual {v2, v3}, Ljava/io/OutputStream;->write([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 410
    .end local v0    # "bmp":Landroid/graphics/Bitmap;
    .end local v1    # "offset":I
    goto :goto_5

    .line 408
    :catch_0
    move-exception v0

    .line 409
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 411
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_5
    return-void
.end method


# virtual methods
.method public convertBitmap(Landroid/graphics/Bitmap;)Ljava/lang/String;
    .locals 2
    .param p1, "inputBitmap"    # Landroid/graphics/Bitmap;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "inputBitmap"
        }
    .end annotation

    .line 418
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/trimline/metrocrew/Printer$printer;->mWidth:I

    .line 419
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/trimline/metrocrew/Printer$printer;->mHeight:I

    .line 421
    iget v0, p0, Lcom/trimline/metrocrew/Printer$printer;->mWidth:I

    iget v1, p0, Lcom/trimline/metrocrew/Printer$printer;->mHeight:I

    invoke-direct {p0, p1, v0, v1}, Lcom/trimline/metrocrew/Printer$printer;->convertArgbToGrayscale(Landroid/graphics/Bitmap;II)V

    .line 422
    const-string v0, "ok"

    iput-object v0, p0, Lcom/trimline/metrocrew/Printer$printer;->mStatus:Ljava/lang/String;

    .line 423
    iget-object v0, p0, Lcom/trimline/metrocrew/Printer$printer;->mStatus:Ljava/lang/String;

    return-object v0
.end method

.method public flushprinter()V
    .locals 1

    .line 259
    monitor-enter p0

    .line 260
    :try_start_0
    sget-object v0, Lcom/trimline/metrocrew/Printer$printer;->printThread:Lcom/trimline/metrocrew/Printer$Printerthread;

    .line 261
    .local v0, "r":Lcom/trimline/metrocrew/Printer$Printerthread;
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 263
    invoke-virtual {v0}, Lcom/trimline/metrocrew/Printer$Printerthread;->flush()V

    .line 264
    return-void

    .line 261
    .end local v0    # "r":Lcom/trimline/metrocrew/Printer$Printerthread;
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public printcollection(Landroid/graphics/Bitmap;Lcom/trimline/metrocrew/theader;)V
    .locals 22
    .param p1, "logo"    # Landroid/graphics/Bitmap;
    .param p2, "t"    # Lcom/trimline/metrocrew/theader;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "logo",
            "t"
        }
    .end annotation

    .line 269
    move-object/from16 v1, p2

    const-string v0, "--------------------------------\n\n"

    const-string v2, "--------------------------------\n"

    const-string v3, ""

    const-string v4, "\n"

    const-string v5, "s"

    const-string v6, "%"

    move-object v7, v3

    .line 271
    .local v7, "space":Ljava/lang/String;
    :try_start_0
    const-string v8, "      METROTRANS CREW SACCO     \n"

    .line 272
    .local v8, "head":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "     P.O. Box 11670 - 00400    \n"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 273
    .end local v8    # "head":Ljava/lang/String;
    .local v9, "head":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, "           Nairobi             \n"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 274
    .end local v9    # "head":Ljava/lang/String;
    .restart local v8    # "head":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "      +254-721-381-573         \n"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 275
    .end local v8    # "head":Ljava/lang/String;
    .restart local v9    # "head":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, "    metrotrans.bus@gmail.com   \n"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 276
    .end local v9    # "head":Ljava/lang/String;
    .restart local v8    # "head":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "-------------------------------\n"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 277
    .end local v8    # "head":Ljava/lang/String;
    .restart local v9    # "head":Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v10, "    CASH COLLECTION RECIEPT    \n"

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 278
    .end local v9    # "head":Ljava/lang/String;
    .restart local v8    # "head":Ljava/lang/String;
    move-object v9, v3

    .line 279
    .local v9, "data":Ljava/lang/String;
    move-object v9, v2

    .line 281
    const-string v10, "Ref:"

    .line 282
    .local v10, "header":Ljava/lang/String;
    iget-object v11, v1, Lcom/trimline/metrocrew/theader;->No:Ljava/lang/String;

    .line 283
    .local v11, "value":Ljava/lang/String;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v14

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v15

    add-int/2addr v14, v15

    rsub-int/lit8 v14, v14, 0x1f

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v14

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 286
    .end local v9    # "data":Ljava/lang/String;
    .local v12, "data":Ljava/lang/String;
    const-string v9, "Member. No:"

    .line 287
    .end local v10    # "header":Ljava/lang/String;
    .local v9, "header":Ljava/lang/String;
    iget-object v10, v1, Lcom/trimline/metrocrew/theader;->Account_No:Ljava/lang/String;

    .line 288
    .end local v11    # "value":Ljava/lang/String;
    .local v10, "value":Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v14

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v15

    add-int/2addr v14, v15

    rsub-int/lit8 v14, v14, 0x1f

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v14

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 291
    .end local v12    # "data":Ljava/lang/String;
    .local v11, "data":Ljava/lang/String;
    const-string v12, "Name:"

    .line 292
    .end local v9    # "header":Ljava/lang/String;
    .local v12, "header":Ljava/lang/String;
    iget-object v9, v1, Lcom/trimline/metrocrew/theader;->Received_From:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    const/16 v13, 0x19

    if-le v9, v13, :cond_0

    iget-object v9, v1, Lcom/trimline/metrocrew/theader;->Received_From:Ljava/lang/String;

    const/16 v13, 0x18

    const/4 v14, 0x0

    invoke-virtual {v9, v14, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    goto :goto_0

    :cond_0
    iget-object v9, v1, Lcom/trimline/metrocrew/theader;->Received_From:Ljava/lang/String;

    .line 293
    .end local v10    # "value":Ljava/lang/String;
    .local v9, "value":Ljava/lang/String;
    :goto_0
    const-string v10, "Name lenhg"

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v13

    invoke-static {v13}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    invoke-static {v10, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v14

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v15

    add-int/2addr v14, v15

    rsub-int/lit8 v14, v14, 0x1f

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v14

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 298
    .end local v11    # "data":Ljava/lang/String;
    .local v10, "data":Ljava/lang/String;
    const-string v11, "Date:"

    .line 299
    .end local v12    # "header":Ljava/lang/String;
    .local v11, "header":Ljava/lang/String;
    iget-object v12, v1, Lcom/trimline/metrocrew/theader;->Date:Ljava/sql/Date;

    invoke-virtual {v12}, Ljava/sql/Date;->toString()Ljava/lang/String;

    move-result-object v12

    .line 300
    .end local v9    # "value":Ljava/lang/String;
    .local v12, "value":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v14

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v15

    add-int/2addr v14, v15

    rsub-int/lit8 v14, v14, 0x1f

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v14

    invoke-static {v13, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v9, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 302
    .end local v10    # "data":Ljava/lang/String;
    .local v9, "data":Ljava/lang/String;
    new-instance v10, Ljava/text/SimpleDateFormat;

    const-string v13, "HH:mm:ss"

    invoke-direct {v10, v13}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 303
    .local v10, "d":Ljava/text/SimpleDateFormat;
    const-string v13, "Time:"

    .line 304
    .end local v11    # "header":Ljava/lang/String;
    .local v13, "header":Ljava/lang/String;
    iget-object v11, v1, Lcom/trimline/metrocrew/theader;->Created_Date_Time:Ljava/sql/Date;

    invoke-virtual {v10, v11}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v11

    .line 305
    .end local v12    # "value":Ljava/lang/String;
    .local v11, "value":Ljava/lang/String;
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v15

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v16

    add-int v15, v15, v16

    rsub-int/lit8 v15, v15, 0x1f

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v15

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 309
    .end local v9    # "data":Ljava/lang/String;
    .local v12, "data":Ljava/lang/String;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 310
    .end local v12    # "data":Ljava/lang/String;
    .restart local v9    # "data":Ljava/lang/String;
    const-string v12, "Trans Type"

    .line 311
    .end local v13    # "header":Ljava/lang/String;
    .local v12, "header":Ljava/lang/String;
    const-string v13, "Amount"

    .line 313
    .end local v11    # "value":Ljava/lang/String;
    .local v13, "value":Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v15

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v16

    add-int v15, v15, v16

    rsub-int/lit8 v15, v15, 0x1f

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v15

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 316
    .end local v9    # "data":Ljava/lang/String;
    .local v11, "data":Ljava/lang/String;
    const-string v9, "----------"

    .line 317
    .end local v12    # "header":Ljava/lang/String;
    .local v9, "header":Ljava/lang/String;
    const-string v12, "------"

    .line 318
    .end local v13    # "value":Ljava/lang/String;
    .local v12, "value":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v15

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v16

    add-int v15, v15, v16

    rsub-int/lit8 v15, v15, 0x1f

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v15

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 321
    .end local v11    # "data":Ljava/lang/String;
    .local v13, "data":Ljava/lang/String;
    const-wide/16 v14, 0x0

    .line 322
    .local v14, "total":D
    iget-object v11, v1, Lcom/trimline/metrocrew/theader;->tlines:Ljava/util/List;

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v16
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    const-string v1, "%.2f"

    if-eqz v16, :cond_2

    :try_start_1
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/trimline/metrocrew/transaction;

    move-object/from16 v17, v16

    .line 324
    .local v17, "tt":Lcom/trimline/metrocrew/transaction;
    move-object/from16 v16, v3

    const-string v3, "ddd"

    move-object/from16 v18, v7

    .end local v7    # "space":Ljava/lang/String;
    .local v18, "space":Ljava/lang/String;
    new-instance v7, Lcom/google/gson/Gson;

    invoke-direct {v7}, Lcom/google/gson/Gson;-><init>()V

    move-object/from16 v19, v8

    move-object/from16 v8, v17

    .end local v17    # "tt":Lcom/trimline/metrocrew/transaction;
    .local v8, "tt":Lcom/trimline/metrocrew/transaction;
    .local v19, "head":Ljava/lang/String;
    invoke-virtual {v7, v8}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 325
    iget-object v3, v8, Lcom/trimline/metrocrew/transaction;->Amount:Ljava/lang/Double;

    invoke-virtual {v3}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v20

    add-double v14, v14, v20

    .line 326
    iget-object v3, v8, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    if-nez v3, :cond_1

    move-object/from16 v3, v16

    goto :goto_2

    :cond_1
    iget-object v3, v8, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    :goto_2
    move-object v9, v3

    .line 327
    iget-object v3, v8, Lcom/trimline/metrocrew/transaction;->Amount:Ljava/lang/Double;

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    move-object v12, v1

    const-string v1, "value"

    invoke-static {v1, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 328
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v17

    add-int v7, v7, v17

    rsub-int/lit8 v7, v7, 0x1f

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    filled-new-array/range {v18 .. v18}, [Ljava/lang/Object;

    move-result-object v7

    invoke-static {v3, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    move-object v13, v1

    .line 329
    .end local v8    # "tt":Lcom/trimline/metrocrew/transaction;
    move-object/from16 v1, p2

    move-object/from16 v3, v16

    move-object/from16 v7, v18

    move-object/from16 v8, v19

    goto/16 :goto_1

    .line 330
    .end local v18    # "space":Ljava/lang/String;
    .end local v19    # "head":Ljava/lang/String;
    .restart local v7    # "space":Ljava/lang/String;
    .local v8, "head":Ljava/lang/String;
    :cond_2
    move-object/from16 v18, v7

    move-object/from16 v19, v8

    .end local v7    # "space":Ljava/lang/String;
    .end local v8    # "head":Ljava/lang/String;
    .restart local v18    # "space":Ljava/lang/String;
    .restart local v19    # "head":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 331
    .end local v13    # "data":Ljava/lang/String;
    .local v2, "data":Ljava/lang/String;
    const-string v3, "TOTAL:"

    .line 332
    .end local v9    # "header":Ljava/lang/String;
    .local v3, "header":Ljava/lang/String;
    invoke-static {v14, v15}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    invoke-static {v1, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 334
    .end local v12    # "value":Ljava/lang/String;
    .local v1, "value":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v11

    add-int/2addr v9, v11

    rsub-int/lit8 v9, v9, 0x1f

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    filled-new-array/range {v18 .. v18}, [Ljava/lang/Object;

    move-result-object v9

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 338
    .end local v2    # "data":Ljava/lang/String;
    .local v4, "data":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 339
    .end local v4    # "data":Ljava/lang/String;
    .local v0, "data":Ljava/lang/String;
    const-string v2, "Served by:"

    .line 340
    .end local v3    # "header":Ljava/lang/String;
    .local v2, "header":Ljava/lang/String;
    const-string v3, "%s"

    sget-object v4, Lcom/trimline/metrocrew/agent$Model;->CurrentAgent:Lcom/trimline/metrocrew/agent;

    iget-object v4, v4, Lcom/trimline/metrocrew/agent;->Name:Ljava/lang/String;

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 341
    .end local v1    # "value":Ljava/lang/String;
    .local v3, "value":Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v7

    add-int/2addr v6, v7

    rsub-int/lit8 v6, v6, 0x1f

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    filled-new-array/range {v18 .. v18}, [Ljava/lang/Object;

    move-result-object v5

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, "\n\n\n\n\n"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 344
    .end local v0    # "data":Ljava/lang/String;
    .local v1, "data":Ljava/lang/String;
    const-wide/16 v4, 0x64

    :try_start_2
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 347
    goto :goto_3

    .line 345
    :catch_0
    move-exception v0

    .line 346
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 348
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :goto_3
    sget-object v0, Lcom/trimline/metrocrew/Printer$printer;->printersock:Landroid/bluetooth/BluetoothSocket;

    if-eqz v0, :cond_3

    .line 349
    const/4 v0, 0x3

    new-array v4, v0, [B

    fill-array-data v4, :array_0

    .line 350
    .local v4, "arrayOfByte1":[B
    new-array v5, v0, [B

    fill-array-data v5, :array_1

    .line 351
    .local v5, "format":[B
    sget-object v6, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    invoke-virtual {v6, v5}, Ljava/io/OutputStream;->write([B)V

    .line 352
    move-object/from16 v6, v19

    .line 353
    .local v6, "msg":Ljava/lang/String;
    sget-object v7, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write([B)V

    .line 354
    new-array v0, v0, [B

    fill-array-data v0, :array_2

    .line 355
    .local v0, "printformat":[B
    sget-object v7, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    invoke-virtual {v7, v0}, Ljava/io/OutputStream;->write([B)V

    .line 356
    move-object v6, v1

    .line 357
    sget-object v7, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    invoke-virtual {v6}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write([B)V

    .line 358
    sget-object v7, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    const/16 v8, 0xd

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write(I)V

    .line 359
    sget-object v7, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write(I)V

    .line 360
    sget-object v7, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    invoke-virtual {v7, v8}, Ljava/io/OutputStream;->write(I)V

    .line 361
    sget-object v7, Lcom/trimline/metrocrew/Printer$printer;->printerout:Ljava/io/OutputStream;

    invoke-virtual {v7}, Ljava/io/OutputStream;->flush()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 365
    .end local v0    # "printformat":[B
    .end local v1    # "data":Ljava/lang/String;
    .end local v2    # "header":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    .end local v4    # "arrayOfByte1":[B
    .end local v5    # "format":[B
    .end local v6    # "msg":Ljava/lang/String;
    .end local v10    # "d":Ljava/text/SimpleDateFormat;
    .end local v14    # "total":D
    .end local v18    # "space":Ljava/lang/String;
    .end local v19    # "head":Ljava/lang/String;
    :cond_3
    goto :goto_4

    .line 363
    :catch_1
    move-exception v0

    .line 364
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 367
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_4
    return-void

    :array_0
    .array-data 1
        0x1bt
        0x21t
        0x0t
    .end array-data

    :array_1
    .array-data 1
        0x1bt
        0x21t
        0x0t
    .end array-data

    :array_2
    .array-data 1
        0x1bt
        0x21t
        0x0t
    .end array-data
.end method

.method public writetoprinter(I)V
    .locals 1
    .param p1, "out"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "out"
        }
    .end annotation

    .line 247
    monitor-enter p0

    .line 249
    :try_start_0
    sget-object v0, Lcom/trimline/metrocrew/Printer$printer;->printThread:Lcom/trimline/metrocrew/Printer$Printerthread;

    .line 250
    .local v0, "r":Lcom/trimline/metrocrew/Printer$Printerthread;
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 252
    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/Printer$Printerthread;->write(I)V

    .line 253
    return-void

    .line 250
    .end local v0    # "r":Lcom/trimline/metrocrew/Printer$Printerthread;
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public writetoprinter([B)V
    .locals 1
    .param p1, "out"    # [B
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "out"
        }
    .end annotation

    .line 235
    monitor-enter p0

    .line 237
    :try_start_0
    sget-object v0, Lcom/trimline/metrocrew/Printer$printer;->printThread:Lcom/trimline/metrocrew/Printer$Printerthread;

    .line 238
    .local v0, "r":Lcom/trimline/metrocrew/Printer$Printerthread;
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 240
    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/Printer$Printerthread;->write([B)V

    .line 241
    return-void

    .line 238
    .end local v0    # "r":Lcom/trimline/metrocrew/Printer$Printerthread;
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
