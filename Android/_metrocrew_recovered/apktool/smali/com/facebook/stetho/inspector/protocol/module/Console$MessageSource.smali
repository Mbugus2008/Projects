.class public final enum Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;
.super Ljava/lang/Enum;
.source "Console.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/protocol/module/Console;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "MessageSource"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

.field public static final enum APPCACHE:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

.field public static final enum CONSOLE_API:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

.field public static final enum CSS:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

.field public static final enum JAVASCRIPT:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

.field public static final enum NETWORK:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

.field public static final enum OTHER:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

.field public static final enum RENDERING:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

.field public static final enum SECURITY:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

.field public static final enum STORAGE:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

.field public static final enum XML:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;


# instance fields
.field private final mProtocolValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 54
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    const/4 v1, 0x0

    const-string/jumbo v2, "xml"

    const-string v3, "XML"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->XML:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    .line 55
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    const/4 v1, 0x1

    const-string v2, "javascript"

    const-string v3, "JAVASCRIPT"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->JAVASCRIPT:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    .line 56
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    const/4 v1, 0x2

    const-string v2, "network"

    const-string v3, "NETWORK"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->NETWORK:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    .line 57
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    const/4 v1, 0x3

    const-string v2, "console-api"

    const-string v3, "CONSOLE_API"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->CONSOLE_API:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    .line 58
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    const/4 v1, 0x4

    const-string/jumbo v2, "storage"

    const-string v3, "STORAGE"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->STORAGE:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    .line 59
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    const/4 v1, 0x5

    const-string v2, "appcache"

    const-string v3, "APPCACHE"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->APPCACHE:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    .line 60
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    const/4 v1, 0x6

    const-string v2, "rendering"

    const-string v3, "RENDERING"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->RENDERING:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    .line 61
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    const/4 v1, 0x7

    const-string v2, "css"

    const-string v3, "CSS"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->CSS:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    .line 62
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    const/16 v1, 0x8

    const-string/jumbo v2, "security"

    const-string v3, "SECURITY"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->SECURITY:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    .line 63
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    const/16 v1, 0x9

    const-string v2, "other"

    const-string v3, "OTHER"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->OTHER:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    .line 53
    sget-object v4, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->XML:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    sget-object v5, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->JAVASCRIPT:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    sget-object v6, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->NETWORK:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    sget-object v7, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->CONSOLE_API:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    sget-object v8, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->STORAGE:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    sget-object v9, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->APPCACHE:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    sget-object v10, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->RENDERING:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    sget-object v11, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->CSS:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    sget-object v12, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->SECURITY:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    sget-object v13, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->OTHER:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    filled-new-array/range {v4 .. v13}, [Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    move-result-object v0

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->$VALUES:[Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

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

    .line 67
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 68
    iput-object p3, p0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->mProtocolValue:Ljava/lang/String;

    .line 69
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 53
    const-class v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    return-object v0
.end method

.method public static values()[Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;
    .locals 1

    .line 53
    sget-object v0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->$VALUES:[Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    invoke-virtual {v0}, [Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    return-object v0
.end method


# virtual methods
.method public getProtocolValue()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/facebook/stetho/json/annotation/JsonValue;
    .end annotation

    .line 73
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->mProtocolValue:Ljava/lang/String;

    return-object v0
.end method
