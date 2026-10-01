.class public final enum Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;
.super Ljava/lang/Enum;
.source "Vehicles.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Vehicles;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Vehicle_Type"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

.field public static final enum _x0031_4_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

.field public static final enum _x0032_5_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

.field public static final enum _x0032_6_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

.field public static final enum _x0032_9_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

.field public static final enum _x0033_3_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

.field public static final enum _x0033_7_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

.field public static final enum _x0034_1_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;


# instance fields
.field private type:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;
    .locals 7

    .line 51
    sget-object v0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;->_x0031_4_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    sget-object v1, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;->_x0033_3_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    sget-object v2, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;->_x0032_5_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    sget-object v3, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;->_x0032_9_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    sget-object v4, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;->_x0034_1_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    sget-object v5, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;->_x0032_6_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    sget-object v6, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;->_x0033_7_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    filled-new-array/range {v0 .. v6}, [Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 54
    new-instance v0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    const/4 v1, 0x0

    const-string v2, "14 Seater"

    const-string v3, "_x0031_4_Seater"

    invoke-direct {v0, v3, v1, v2}, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;->_x0031_4_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    .line 56
    new-instance v0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    const/4 v1, 0x1

    const-string v2, "33 Seater"

    const-string v3, "_x0033_3_Seater"

    invoke-direct {v0, v3, v1, v2}, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;->_x0033_3_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    .line 58
    new-instance v0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    const/4 v1, 0x2

    const-string v2, "25 Seater"

    const-string v3, "_x0032_5_Seater"

    invoke-direct {v0, v3, v1, v2}, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;->_x0032_5_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    .line 60
    new-instance v0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    const/4 v1, 0x3

    const-string v2, "29 Seater"

    const-string v3, "_x0032_9_Seater"

    invoke-direct {v0, v3, v1, v2}, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;->_x0032_9_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    .line 62
    new-instance v0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    const/4 v1, 0x4

    const-string v2, "41 Seater"

    const-string v3, "_x0034_1_Seater"

    invoke-direct {v0, v3, v1, v2}, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;->_x0034_1_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    .line 64
    new-instance v0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    const/4 v1, 0x5

    const-string v2, "26 Seater"

    const-string v3, "_x0032_6_Seater"

    invoke-direct {v0, v3, v1, v2}, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;->_x0032_6_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    .line 66
    new-instance v0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    const/4 v1, 0x6

    const-string v2, "37 Seater"

    const-string v3, "_x0033_7_Seater"

    invoke-direct {v0, v3, v1, v2}, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;->_x0033_7_Seater:Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    .line 51
    invoke-static {}, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;->$values()[Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    move-result-object v0

    sput-object v0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;->$VALUES:[Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .param p3, "aState"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x0
        }
        names = {
            "$enum$name",
            "$enum$ordinal",
            "aState"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 70
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 71
    iput-object p3, p0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;->type:Ljava/lang/String;

    .line 72
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;
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

    .line 51
    const-class v0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    return-object v0
.end method

.method public static values()[Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;
    .locals 1

    .line 51
    sget-object v0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;->$VALUES:[Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    invoke-virtual {v0}, [Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/trimline/metrocrew/Vehicles$Vehicle_Type;->type:Ljava/lang/String;

    return-object v0
.end method
