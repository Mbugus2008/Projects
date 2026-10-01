.class public final enum Lcom/trimline/metrocrew/theader$Pay_Mode;
.super Ljava/lang/Enum;
.source "theader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/theader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Pay_Mode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/trimline/metrocrew/theader$Pay_Mode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/trimline/metrocrew/theader$Pay_Mode;

.field public static final enum Banker_x0027_s_Cheque:Lcom/trimline/metrocrew/theader$Pay_Mode;

.field public static final enum Cash:Lcom/trimline/metrocrew/theader$Pay_Mode;

.field public static final enum Cheque:Lcom/trimline/metrocrew/theader$Pay_Mode;

.field public static final enum Custom3:Lcom/trimline/metrocrew/theader$Pay_Mode;

.field public static final enum Deposit_Slip:Lcom/trimline/metrocrew/theader$Pay_Mode;

.field public static final enum EFT:Lcom/trimline/metrocrew/theader$Pay_Mode;

.field public static final enum Paybill:Lcom/trimline/metrocrew/theader$Pay_Mode;

.field public static final enum RTGS:Lcom/trimline/metrocrew/theader$Pay_Mode;

.field public static final enum _blank_:Lcom/trimline/metrocrew/theader$Pay_Mode;


# direct methods
.method private static synthetic $values()[Lcom/trimline/metrocrew/theader$Pay_Mode;
    .locals 9

    .line 195
    sget-object v0, Lcom/trimline/metrocrew/theader$Pay_Mode;->_blank_:Lcom/trimline/metrocrew/theader$Pay_Mode;

    sget-object v1, Lcom/trimline/metrocrew/theader$Pay_Mode;->Cash:Lcom/trimline/metrocrew/theader$Pay_Mode;

    sget-object v2, Lcom/trimline/metrocrew/theader$Pay_Mode;->Cheque:Lcom/trimline/metrocrew/theader$Pay_Mode;

    sget-object v3, Lcom/trimline/metrocrew/theader$Pay_Mode;->EFT:Lcom/trimline/metrocrew/theader$Pay_Mode;

    sget-object v4, Lcom/trimline/metrocrew/theader$Pay_Mode;->Deposit_Slip:Lcom/trimline/metrocrew/theader$Pay_Mode;

    sget-object v5, Lcom/trimline/metrocrew/theader$Pay_Mode;->Banker_x0027_s_Cheque:Lcom/trimline/metrocrew/theader$Pay_Mode;

    sget-object v6, Lcom/trimline/metrocrew/theader$Pay_Mode;->RTGS:Lcom/trimline/metrocrew/theader$Pay_Mode;

    sget-object v7, Lcom/trimline/metrocrew/theader$Pay_Mode;->Custom3:Lcom/trimline/metrocrew/theader$Pay_Mode;

    sget-object v8, Lcom/trimline/metrocrew/theader$Pay_Mode;->Paybill:Lcom/trimline/metrocrew/theader$Pay_Mode;

    filled-new-array/range {v0 .. v8}, [Lcom/trimline/metrocrew/theader$Pay_Mode;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 198
    new-instance v0, Lcom/trimline/metrocrew/theader$Pay_Mode;

    const-string v1, "_blank_"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/trimline/metrocrew/theader$Pay_Mode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trimline/metrocrew/theader$Pay_Mode;->_blank_:Lcom/trimline/metrocrew/theader$Pay_Mode;

    .line 201
    new-instance v0, Lcom/trimline/metrocrew/theader$Pay_Mode;

    const-string v1, "Cash"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/trimline/metrocrew/theader$Pay_Mode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trimline/metrocrew/theader$Pay_Mode;->Cash:Lcom/trimline/metrocrew/theader$Pay_Mode;

    .line 204
    new-instance v0, Lcom/trimline/metrocrew/theader$Pay_Mode;

    const-string v1, "Cheque"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/trimline/metrocrew/theader$Pay_Mode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trimline/metrocrew/theader$Pay_Mode;->Cheque:Lcom/trimline/metrocrew/theader$Pay_Mode;

    .line 207
    new-instance v0, Lcom/trimline/metrocrew/theader$Pay_Mode;

    const-string v1, "EFT"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/trimline/metrocrew/theader$Pay_Mode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trimline/metrocrew/theader$Pay_Mode;->EFT:Lcom/trimline/metrocrew/theader$Pay_Mode;

    .line 210
    new-instance v0, Lcom/trimline/metrocrew/theader$Pay_Mode;

    const-string v1, "Deposit_Slip"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/trimline/metrocrew/theader$Pay_Mode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trimline/metrocrew/theader$Pay_Mode;->Deposit_Slip:Lcom/trimline/metrocrew/theader$Pay_Mode;

    .line 213
    new-instance v0, Lcom/trimline/metrocrew/theader$Pay_Mode;

    const-string v1, "Banker_x0027_s_Cheque"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/trimline/metrocrew/theader$Pay_Mode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trimline/metrocrew/theader$Pay_Mode;->Banker_x0027_s_Cheque:Lcom/trimline/metrocrew/theader$Pay_Mode;

    .line 216
    new-instance v0, Lcom/trimline/metrocrew/theader$Pay_Mode;

    const-string v1, "RTGS"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/trimline/metrocrew/theader$Pay_Mode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trimline/metrocrew/theader$Pay_Mode;->RTGS:Lcom/trimline/metrocrew/theader$Pay_Mode;

    .line 219
    new-instance v0, Lcom/trimline/metrocrew/theader$Pay_Mode;

    const-string v1, "Custom3"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/trimline/metrocrew/theader$Pay_Mode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trimline/metrocrew/theader$Pay_Mode;->Custom3:Lcom/trimline/metrocrew/theader$Pay_Mode;

    .line 222
    new-instance v0, Lcom/trimline/metrocrew/theader$Pay_Mode;

    const-string v1, "Paybill"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/trimline/metrocrew/theader$Pay_Mode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/trimline/metrocrew/theader$Pay_Mode;->Paybill:Lcom/trimline/metrocrew/theader$Pay_Mode;

    .line 195
    invoke-static {}, Lcom/trimline/metrocrew/theader$Pay_Mode;->$values()[Lcom/trimline/metrocrew/theader$Pay_Mode;

    move-result-object v0

    sput-object v0, Lcom/trimline/metrocrew/theader$Pay_Mode;->$VALUES:[Lcom/trimline/metrocrew/theader$Pay_Mode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "$enum$name",
            "$enum$ordinal"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 195
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/trimline/metrocrew/theader$Pay_Mode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            "name"
        }
    .end annotation

    .line 195
    const-class v0, Lcom/trimline/metrocrew/theader$Pay_Mode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/theader$Pay_Mode;

    return-object v0
.end method

.method public static values()[Lcom/trimline/metrocrew/theader$Pay_Mode;
    .locals 1

    .line 195
    sget-object v0, Lcom/trimline/metrocrew/theader$Pay_Mode;->$VALUES:[Lcom/trimline/metrocrew/theader$Pay_Mode;

    invoke-virtual {v0}, [Lcom/trimline/metrocrew/theader$Pay_Mode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/trimline/metrocrew/theader$Pay_Mode;

    return-object v0
.end method
