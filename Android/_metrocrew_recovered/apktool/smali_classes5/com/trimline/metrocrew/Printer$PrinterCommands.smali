.class public Lcom/trimline/metrocrew/Printer$PrinterCommands;
.super Ljava/lang/Object;
.source "Printer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Printer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PrinterCommands"
.end annotation


# static fields
.field public static FEED_LINE:[B

.field public static FEED_PAPER_AND_CUT:[B

.field public static final INIT:[B

.field public static PRINT_BAR_CODE_1:[B

.field public static SELECT_BIT_IMAGE_MODE:[B

.field public static SELECT_CYRILLIC_CHARACTER_CODE_TABLE:[B

.field public static SELECT_FONT_A:[B

.field public static SELECT_PRINT_SHEET:[B

.field public static SEND_NULL_BYTE:[B

.field public static SET_BAR_CODE_HEIGHT:[B

.field public static SET_LINE_SPACING_24:[B

.field public static SET_LINE_SPACING_30:[B

.field public static TRANSMIT_DLE_ERROR_STATUS:[B

.field public static TRANSMIT_DLE_OFFLINE_PRINTER_STATUS:[B

.field public static TRANSMIT_DLE_PRINTER_STATUS:[B

.field public static TRANSMIT_DLE_ROLL_PAPER_SENSOR_STATUS:[B


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 479
    const/4 v0, 0x2

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/trimline/metrocrew/Printer$PrinterCommands;->INIT:[B

    .line 480
    const/4 v0, 0x1

    new-array v1, v0, [B

    const/4 v2, 0x0

    const/16 v3, 0xa

    aput-byte v3, v1, v2

    sput-object v1, Lcom/trimline/metrocrew/Printer$PrinterCommands;->FEED_LINE:[B

    .line 482
    const/4 v1, 0x3

    new-array v3, v1, [B

    fill-array-data v3, :array_1

    sput-object v3, Lcom/trimline/metrocrew/Printer$PrinterCommands;->SELECT_FONT_A:[B

    .line 484
    new-array v3, v1, [B

    fill-array-data v3, :array_2

    sput-object v3, Lcom/trimline/metrocrew/Printer$PrinterCommands;->SET_BAR_CODE_HEIGHT:[B

    .line 485
    new-array v3, v1, [B

    fill-array-data v3, :array_3

    sput-object v3, Lcom/trimline/metrocrew/Printer$PrinterCommands;->PRINT_BAR_CODE_1:[B

    .line 486
    new-array v0, v0, [B

    aput-byte v2, v0, v2

    sput-object v0, Lcom/trimline/metrocrew/Printer$PrinterCommands;->SEND_NULL_BYTE:[B

    .line 488
    const/4 v0, 0x4

    new-array v2, v0, [B

    fill-array-data v2, :array_4

    sput-object v2, Lcom/trimline/metrocrew/Printer$PrinterCommands;->SELECT_PRINT_SHEET:[B

    .line 489
    new-array v0, v0, [B

    fill-array-data v0, :array_5

    sput-object v0, Lcom/trimline/metrocrew/Printer$PrinterCommands;->FEED_PAPER_AND_CUT:[B

    .line 491
    new-array v0, v1, [B

    fill-array-data v0, :array_6

    sput-object v0, Lcom/trimline/metrocrew/Printer$PrinterCommands;->SELECT_CYRILLIC_CHARACTER_CODE_TABLE:[B

    .line 493
    const/4 v0, 0x5

    new-array v0, v0, [B

    fill-array-data v0, :array_7

    sput-object v0, Lcom/trimline/metrocrew/Printer$PrinterCommands;->SELECT_BIT_IMAGE_MODE:[B

    .line 495
    new-array v0, v1, [B

    fill-array-data v0, :array_8

    sput-object v0, Lcom/trimline/metrocrew/Printer$PrinterCommands;->SET_LINE_SPACING_24:[B

    .line 496
    new-array v0, v1, [B

    fill-array-data v0, :array_9

    sput-object v0, Lcom/trimline/metrocrew/Printer$PrinterCommands;->SET_LINE_SPACING_30:[B

    .line 498
    new-array v0, v1, [B

    fill-array-data v0, :array_a

    sput-object v0, Lcom/trimline/metrocrew/Printer$PrinterCommands;->TRANSMIT_DLE_PRINTER_STATUS:[B

    .line 499
    new-array v0, v1, [B

    fill-array-data v0, :array_b

    sput-object v0, Lcom/trimline/metrocrew/Printer$PrinterCommands;->TRANSMIT_DLE_OFFLINE_PRINTER_STATUS:[B

    .line 500
    new-array v0, v1, [B

    fill-array-data v0, :array_c

    sput-object v0, Lcom/trimline/metrocrew/Printer$PrinterCommands;->TRANSMIT_DLE_ERROR_STATUS:[B

    .line 501
    new-array v0, v1, [B

    fill-array-data v0, :array_d

    sput-object v0, Lcom/trimline/metrocrew/Printer$PrinterCommands;->TRANSMIT_DLE_ROLL_PAPER_SENSOR_STATUS:[B

    return-void

    nop

    :array_0
    .array-data 1
        0x1bt
        0x40t
    .end array-data

    nop

    :array_1
    .array-data 1
        0x1bt
        0x21t
        0x0t
    .end array-data

    :array_2
    .array-data 1
        0x1dt
        0x68t
        0x64t
    .end array-data

    :array_3
    .array-data 1
        0x1dt
        0x6bt
        0x2t
    .end array-data

    :array_4
    .array-data 1
        0x1bt
        0x63t
        0x30t
        0x2t
    .end array-data

    :array_5
    .array-data 1
        0x1dt
        0x56t
        0x42t
        0x0t
    .end array-data

    :array_6
    .array-data 1
        0x1bt
        0x74t
        0x11t
    .end array-data

    :array_7
    .array-data 1
        0x1bt
        0x2at
        0x21t
        -0x80t
        0x0t
    .end array-data

    nop

    :array_8
    .array-data 1
        0x1bt
        0x33t
        0x18t
    .end array-data

    :array_9
    .array-data 1
        0x1bt
        0x33t
        0x1et
    .end array-data

    :array_a
    .array-data 1
        0x10t
        0x4t
        0x1t
    .end array-data

    :array_b
    .array-data 1
        0x10t
        0x4t
        0x2t
    .end array-data

    :array_c
    .array-data 1
        0x10t
        0x4t
        0x3t
    .end array-data

    :array_d
    .array-data 1
        0x10t
        0x4t
        0x4t
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 478
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
