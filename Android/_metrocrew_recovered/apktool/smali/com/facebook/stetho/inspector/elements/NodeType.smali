.class public final enum Lcom/facebook/stetho/inspector/elements/NodeType;
.super Ljava/lang/Enum;
.source "NodeType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/facebook/stetho/inspector/elements/NodeType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/facebook/stetho/inspector/elements/NodeType;

.field public static final enum COMMENT_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

.field public static final enum DOCUMENT_FRAGMENT_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

.field public static final enum DOCUMENT_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

.field public static final enum DOCUMENT_TYPE_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

.field public static final enum ELEMENT_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

.field public static final enum PROCESSING_INSTRUCTION_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

.field public static final enum TEXT_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;


# instance fields
.field private final mValue:I


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 13
    new-instance v0, Lcom/facebook/stetho/inspector/elements/NodeType;

    const-string v1, "ELEMENT_NODE"

    const/4 v2, 0x0

    const/4 v3, 0x1

    invoke-direct {v0, v1, v2, v3}, Lcom/facebook/stetho/inspector/elements/NodeType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/stetho/inspector/elements/NodeType;->ELEMENT_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

    .line 14
    new-instance v0, Lcom/facebook/stetho/inspector/elements/NodeType;

    const-string v1, "TEXT_NODE"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v3, v2}, Lcom/facebook/stetho/inspector/elements/NodeType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/stetho/inspector/elements/NodeType;->TEXT_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

    .line 15
    new-instance v0, Lcom/facebook/stetho/inspector/elements/NodeType;

    const/4 v1, 0x2

    const/4 v3, 0x7

    const-string v4, "PROCESSING_INSTRUCTION_NODE"

    invoke-direct {v0, v4, v1, v3}, Lcom/facebook/stetho/inspector/elements/NodeType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/stetho/inspector/elements/NodeType;->PROCESSING_INSTRUCTION_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

    .line 16
    new-instance v0, Lcom/facebook/stetho/inspector/elements/NodeType;

    const-string v1, "COMMENT_NODE"

    const/16 v3, 0x8

    invoke-direct {v0, v1, v2, v3}, Lcom/facebook/stetho/inspector/elements/NodeType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/stetho/inspector/elements/NodeType;->COMMENT_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

    .line 17
    new-instance v0, Lcom/facebook/stetho/inspector/elements/NodeType;

    const/4 v1, 0x4

    const/16 v2, 0x9

    const-string v3, "DOCUMENT_NODE"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/elements/NodeType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/stetho/inspector/elements/NodeType;->DOCUMENT_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

    .line 18
    new-instance v0, Lcom/facebook/stetho/inspector/elements/NodeType;

    const/4 v1, 0x5

    const/16 v2, 0xa

    const-string v3, "DOCUMENT_TYPE_NODE"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/elements/NodeType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/stetho/inspector/elements/NodeType;->DOCUMENT_TYPE_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

    .line 19
    new-instance v0, Lcom/facebook/stetho/inspector/elements/NodeType;

    const/4 v1, 0x6

    const/16 v2, 0xb

    const-string v3, "DOCUMENT_FRAGMENT_NODE"

    invoke-direct {v0, v3, v1, v2}, Lcom/facebook/stetho/inspector/elements/NodeType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/facebook/stetho/inspector/elements/NodeType;->DOCUMENT_FRAGMENT_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

    .line 12
    sget-object v4, Lcom/facebook/stetho/inspector/elements/NodeType;->ELEMENT_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

    sget-object v5, Lcom/facebook/stetho/inspector/elements/NodeType;->TEXT_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

    sget-object v6, Lcom/facebook/stetho/inspector/elements/NodeType;->PROCESSING_INSTRUCTION_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

    sget-object v7, Lcom/facebook/stetho/inspector/elements/NodeType;->COMMENT_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

    sget-object v8, Lcom/facebook/stetho/inspector/elements/NodeType;->DOCUMENT_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

    sget-object v9, Lcom/facebook/stetho/inspector/elements/NodeType;->DOCUMENT_TYPE_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

    sget-object v10, Lcom/facebook/stetho/inspector/elements/NodeType;->DOCUMENT_FRAGMENT_NODE:Lcom/facebook/stetho/inspector/elements/NodeType;

    filled-new-array/range {v4 .. v10}, [Lcom/facebook/stetho/inspector/elements/NodeType;

    move-result-object v0

    sput-object v0, Lcom/facebook/stetho/inspector/elements/NodeType;->$VALUES:[Lcom/facebook/stetho/inspector/elements/NodeType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "value"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 23
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 24
    iput p3, p0, Lcom/facebook/stetho/inspector/elements/NodeType;->mValue:I

    .line 25
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/facebook/stetho/inspector/elements/NodeType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .line 12
    const-class v0, Lcom/facebook/stetho/inspector/elements/NodeType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/elements/NodeType;

    return-object v0
.end method

.method public static values()[Lcom/facebook/stetho/inspector/elements/NodeType;
    .locals 1

    .line 12
    sget-object v0, Lcom/facebook/stetho/inspector/elements/NodeType;->$VALUES:[Lcom/facebook/stetho/inspector/elements/NodeType;

    invoke-virtual {v0}, [Lcom/facebook/stetho/inspector/elements/NodeType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/facebook/stetho/inspector/elements/NodeType;

    return-object v0
.end method


# virtual methods
.method public getProtocolValue()I
    .locals 1
    .annotation runtime Lcom/facebook/stetho/json/annotation/JsonValue;
    .end annotation

    .line 29
    iget v0, p0, Lcom/facebook/stetho/inspector/elements/NodeType;->mValue:I

    return v0
.end method
