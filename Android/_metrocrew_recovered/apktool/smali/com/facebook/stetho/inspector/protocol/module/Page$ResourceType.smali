.class public final enum Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;
.super Ljava/lang/Enum;
.source "Page.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/protocol/module/Page;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ResourceType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

.field public static final enum DOCUMENT:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

.field public static final enum FONT:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

.field public static final enum IMAGE:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

.field public static final enum OTHER:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

.field public static final enum SCRIPT:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

.field public static final enum STYLESHEET:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

.field public static final enum WEBSOCKET:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

.field public static final enum XHR:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;


# instance fields
.field private final mProtocolValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 246
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    const/4 v1, 0x0

    const-string v2, "Document"

    const-string v3, "DOCUMENT"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->DOCUMENT:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    .line 247
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    const/4 v1, 0x1

    const-string v2, "Stylesheet"

    const-string v3, "STYLESHEET"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->STYLESHEET:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    .line 248
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    const/4 v1, 0x2

    const-string v2, "Image"

    const-string v3, "IMAGE"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->IMAGE:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    .line 249
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    const/4 v1, 0x3

    const-string v2, "Font"

    const-string v3, "FONT"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->FONT:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    .line 250
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    const/4 v1, 0x4

    const-string v2, "Script"

    const-string v3, "SCRIPT"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->SCRIPT:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    .line 251
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    const-string v1, "XHR"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2, v1}, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->XHR:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    .line 252
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    const/4 v1, 0x6

    const-string v2, "WebSocket"

    const-string v3, "WEBSOCKET"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->WEBSOCKET:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    .line 253
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    const/4 v1, 0x7

    const-string v2, "Other"

    const-string v3, "OTHER"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->OTHER:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    .line 245
    sget-object v4, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->DOCUMENT:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    sget-object v5, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->STYLESHEET:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    sget-object v6, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->IMAGE:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    sget-object v7, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->FONT:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    sget-object v8, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->SCRIPT:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    sget-object v9, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->XHR:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    sget-object v10, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->WEBSOCKET:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    sget-object v11, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->OTHER:Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    filled-new-array/range {v4 .. v11}, [Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    move-result-object v0

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->$VALUES:[Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "protocolValue"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 257
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 258
    iput-object p3, p0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->mProtocolValue:Ljava/lang/String;

    .line 259
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 245
    const-class v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    return-object v0
.end method

.method public static values()[Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;
    .locals 1

    .line 245
    sget-object v0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->$VALUES:[Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    invoke-virtual {v0}, [Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;

    return-object v0
.end method


# virtual methods
.method public getProtocolValue()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/facebook/stetho/json/annotation/JsonValue;
    .end annotation

    .line 263
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Page$ResourceType;->mProtocolValue:Ljava/lang/String;

    return-object v0
.end method
