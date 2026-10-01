.class public final enum Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;
.super Ljava/lang/Enum;
.source "Runtime.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/protocol/module/Runtime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ObjectType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

.field public static final enum BOOLEAN:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

.field public static final enum FUNCTION:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

.field public static final enum NUMBER:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

.field public static final enum OBJECT:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

.field public static final enum STRING:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

.field public static final enum SYMBOL:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

.field public static final enum UNDEFINED:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;


# instance fields
.field private final mProtocolValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 552
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    const/4 v1, 0x0

    const-string v2, "object"

    const-string v3, "OBJECT"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->OBJECT:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    .line 553
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    const/4 v1, 0x1

    const-string v2, "function"

    const-string v3, "FUNCTION"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->FUNCTION:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    .line 554
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    const/4 v1, 0x2

    const-string/jumbo v2, "undefined"

    const-string v3, "UNDEFINED"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->UNDEFINED:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    .line 555
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    const/4 v1, 0x3

    const-string/jumbo v2, "string"

    const-string v3, "STRING"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->STRING:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    .line 556
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    const/4 v1, 0x4

    const-string v2, "number"

    const-string v3, "NUMBER"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->NUMBER:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    .line 557
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    const/4 v1, 0x5

    const-string v2, "boolean"

    const-string v3, "BOOLEAN"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->BOOLEAN:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    .line 558
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    const/4 v1, 0x6

    const-string/jumbo v2, "symbol"

    const-string v3, "SYMBOL"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->SYMBOL:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    .line 551
    sget-object v4, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->OBJECT:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    sget-object v5, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->FUNCTION:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    sget-object v6, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->UNDEFINED:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    sget-object v7, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->STRING:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    sget-object v8, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->NUMBER:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    sget-object v9, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->BOOLEAN:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    sget-object v10, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->SYMBOL:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    filled-new-array/range {v4 .. v10}, [Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    move-result-object v0

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->$VALUES:[Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

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

    .line 562
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 563
    iput-object p3, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->mProtocolValue:Ljava/lang/String;

    .line 564
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 551
    const-class v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    return-object v0
.end method

.method public static values()[Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;
    .locals 1

    .line 551
    sget-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->$VALUES:[Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    invoke-virtual {v0}, [Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;

    return-object v0
.end method


# virtual methods
.method public getProtocolValue()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/facebook/stetho/json/annotation/JsonValue;
    .end annotation

    .line 568
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectType;->mProtocolValue:Ljava/lang/String;

    return-object v0
.end method
