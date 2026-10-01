.class public final enum Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;
.super Ljava/lang/Enum;
.source "Runtime.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/protocol/module/Runtime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ObjectSubType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

.field public static final enum ARRAY:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

.field public static final enum DATE:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

.field public static final enum ERROR:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

.field public static final enum GENERATOR:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

.field public static final enum ITERATOR:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

.field public static final enum MAP:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

.field public static final enum NODE:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

.field public static final enum NULL:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

.field public static final enum REGEXP:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

.field public static final enum SET:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;


# instance fields
.field private final mProtocolValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 14

    .line 573
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    const/4 v1, 0x0

    const-string v2, "array"

    const-string v3, "ARRAY"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->ARRAY:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    .line 574
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    const/4 v1, 0x1

    const-string v2, "null"

    const-string v3, "NULL"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->NULL:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    .line 575
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    const/4 v1, 0x2

    const-string v2, "node"

    const-string v3, "NODE"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->NODE:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    .line 576
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    const/4 v1, 0x3

    const-string v2, "regexp"

    const-string v3, "REGEXP"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->REGEXP:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    .line 577
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    const/4 v1, 0x4

    const-string v2, "date"

    const-string v3, "DATE"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->DATE:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    .line 578
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    const/4 v1, 0x5

    const-string v2, "map"

    const-string v3, "MAP"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->MAP:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    .line 579
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    const/4 v1, 0x6

    const-string/jumbo v2, "set"

    const-string v3, "SET"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->SET:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    .line 580
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    const/4 v1, 0x7

    const-string v2, "iterator"

    const-string v3, "ITERATOR"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->ITERATOR:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    .line 581
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    const/16 v1, 0x8

    const-string v2, "generator"

    const-string v3, "GENERATOR"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->GENERATOR:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    .line 582
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    const/16 v1, 0x9

    const-string v2, "error"

    const-string v3, "ERROR"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->ERROR:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    .line 572
    sget-object v4, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->ARRAY:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    sget-object v5, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->NULL:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    sget-object v6, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->NODE:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    sget-object v7, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->REGEXP:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    sget-object v8, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->DATE:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    sget-object v9, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->MAP:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    sget-object v10, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->SET:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    sget-object v11, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->ITERATOR:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    sget-object v12, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->GENERATOR:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    sget-object v13, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->ERROR:Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    filled-new-array/range {v4 .. v13}, [Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    move-result-object v0

    sput-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->$VALUES:[Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

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

    .line 586
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 587
    iput-object p3, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->mProtocolValue:Ljava/lang/String;

    .line 588
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 572
    const-class v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    return-object v0
.end method

.method public static values()[Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;
    .locals 1

    .line 572
    sget-object v0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->$VALUES:[Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    invoke-virtual {v0}, [Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;

    return-object v0
.end method


# virtual methods
.method public getProtocolValue()Ljava/lang/String;
    .locals 1
    .annotation runtime Lcom/facebook/stetho/json/annotation/JsonValue;
    .end annotation

    .line 592
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$ObjectSubType;->mProtocolValue:Ljava/lang/String;

    return-object v0
.end method
