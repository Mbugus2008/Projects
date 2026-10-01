.class public final enum Lcom/trimline/metrocrew/theader$Stat;
.super Ljava/lang/Enum;
.source "theader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/theader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Stat"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/trimline/metrocrew/theader$Stat;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/trimline/metrocrew/theader$Stat;

.field public static final enum Approved:Lcom/trimline/metrocrew/theader$Stat;

.field public static final enum Cancelled:Lcom/trimline/metrocrew/theader$Stat;

.field public static final enum Normal:Lcom/trimline/metrocrew/theader$Stat;

.field public static final enum Partial:Lcom/trimline/metrocrew/theader$Stat;

.field public static final enum Pending_Approval:Lcom/trimline/metrocrew/theader$Stat;

.field public static final enum Post_Dated:Lcom/trimline/metrocrew/theader$Stat;

.field public static final enum Posted:Lcom/trimline/metrocrew/theader$Stat;

.field public static final enum _blank_:Lcom/trimline/metrocrew/theader$Stat;


# instance fields
.field private mValue:I


# direct methods
.method private static synthetic $values()[Lcom/trimline/metrocrew/theader$Stat;
    .locals 8

    .line 138
    sget-object v0, Lcom/trimline/metrocrew/theader$Stat;->_blank_:Lcom/trimline/metrocrew/theader$Stat;

    sget-object v1, Lcom/trimline/metrocrew/theader$Stat;->Normal:Lcom/trimline/metrocrew/theader$Stat;

    sget-object v2, Lcom/trimline/metrocrew/theader$Stat;->Post_Dated:Lcom/trimline/metrocrew/theader$Stat;

    sget-object v3, Lcom/trimline/metrocrew/theader$Stat;->Posted:Lcom/trimline/metrocrew/theader$Stat;

    sget-object v4, Lcom/trimline/metrocrew/theader$Stat;->Partial:Lcom/trimline/metrocrew/theader$Stat;

    sget-object v5, Lcom/trimline/metrocrew/theader$Stat;->Pending_Approval:Lcom/trimline/metrocrew/theader$Stat;

    sget-object v6, Lcom/trimline/metrocrew/theader$Stat;->Approved:Lcom/trimline/metrocrew/theader$Stat;

    sget-object v7, Lcom/trimline/metrocrew/theader$Stat;->Cancelled:Lcom/trimline/metrocrew/theader$Stat;

    filled-new-array/range {v0 .. v7}, [Lcom/trimline/metrocrew/theader$Stat;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 4

    .line 141
    new-instance v0, Lcom/trimline/metrocrew/theader$Stat;

    const-string v1, "_blank_"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Lcom/trimline/metrocrew/theader$Stat;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/trimline/metrocrew/theader$Stat;->_blank_:Lcom/trimline/metrocrew/theader$Stat;

    .line 144
    new-instance v0, Lcom/trimline/metrocrew/theader$Stat;

    const-string v1, "Normal"

    const/4 v3, 0x1

    invoke-direct {v0, v1, v3, v2}, Lcom/trimline/metrocrew/theader$Stat;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/trimline/metrocrew/theader$Stat;->Normal:Lcom/trimline/metrocrew/theader$Stat;

    .line 147
    new-instance v0, Lcom/trimline/metrocrew/theader$Stat;

    const-string v1, "Post_Dated"

    const/4 v3, 0x2

    invoke-direct {v0, v1, v3, v2}, Lcom/trimline/metrocrew/theader$Stat;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/trimline/metrocrew/theader$Stat;->Post_Dated:Lcom/trimline/metrocrew/theader$Stat;

    .line 150
    new-instance v0, Lcom/trimline/metrocrew/theader$Stat;

    const-string v1, "Posted"

    const/4 v3, 0x3

    invoke-direct {v0, v1, v3, v2}, Lcom/trimline/metrocrew/theader$Stat;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/trimline/metrocrew/theader$Stat;->Posted:Lcom/trimline/metrocrew/theader$Stat;

    .line 153
    new-instance v0, Lcom/trimline/metrocrew/theader$Stat;

    const-string v1, "Partial"

    const/4 v3, 0x4

    invoke-direct {v0, v1, v3, v2}, Lcom/trimline/metrocrew/theader$Stat;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/trimline/metrocrew/theader$Stat;->Partial:Lcom/trimline/metrocrew/theader$Stat;

    .line 156
    new-instance v0, Lcom/trimline/metrocrew/theader$Stat;

    const-string v1, "Pending_Approval"

    const/4 v3, 0x5

    invoke-direct {v0, v1, v3, v2}, Lcom/trimline/metrocrew/theader$Stat;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/trimline/metrocrew/theader$Stat;->Pending_Approval:Lcom/trimline/metrocrew/theader$Stat;

    .line 159
    new-instance v0, Lcom/trimline/metrocrew/theader$Stat;

    const-string v1, "Approved"

    const/4 v3, 0x6

    invoke-direct {v0, v1, v3, v2}, Lcom/trimline/metrocrew/theader$Stat;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/trimline/metrocrew/theader$Stat;->Approved:Lcom/trimline/metrocrew/theader$Stat;

    .line 162
    new-instance v0, Lcom/trimline/metrocrew/theader$Stat;

    const-string v1, "Cancelled"

    const/4 v3, 0x7

    invoke-direct {v0, v1, v3, v2}, Lcom/trimline/metrocrew/theader$Stat;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/trimline/metrocrew/theader$Stat;->Cancelled:Lcom/trimline/metrocrew/theader$Stat;

    .line 138
    invoke-static {}, Lcom/trimline/metrocrew/theader$Stat;->$values()[Lcom/trimline/metrocrew/theader$Stat;

    move-result-object v0

    sput-object v0, Lcom/trimline/metrocrew/theader$Stat;->$VALUES:[Lcom/trimline/metrocrew/theader$Stat;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "value"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000,
            0x0
        }
        names = {
            "$enum$name",
            "$enum$ordinal",
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 166
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 167
    iput p3, p0, Lcom/trimline/metrocrew/theader$Stat;->mValue:I

    .line 168
    return-void
.end method

.method public static fromId(I)Lcom/trimline/metrocrew/theader$Stat;
    .locals 5
    .param p0, "value"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 175
    invoke-static {}, Lcom/trimline/metrocrew/theader$Stat;->values()[Lcom/trimline/metrocrew/theader$Stat;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 176
    .local v3, "status":Lcom/trimline/metrocrew/theader$Stat;
    iget v4, v3, Lcom/trimline/metrocrew/theader$Stat;->mValue:I

    if-ne v4, p0, :cond_0

    .line 177
    return-object v3

    .line 175
    .end local v3    # "status":Lcom/trimline/metrocrew/theader$Stat;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 180
    :cond_1
    sget-object v0, Lcom/trimline/metrocrew/theader$Stat;->_blank_:Lcom/trimline/metrocrew/theader$Stat;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/trimline/metrocrew/theader$Stat;
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

    .line 138
    const-class v0, Lcom/trimline/metrocrew/theader$Stat;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/theader$Stat;

    return-object v0
.end method

.method public static values()[Lcom/trimline/metrocrew/theader$Stat;
    .locals 1

    .line 138
    sget-object v0, Lcom/trimline/metrocrew/theader$Stat;->$VALUES:[Lcom/trimline/metrocrew/theader$Stat;

    invoke-virtual {v0}, [Lcom/trimline/metrocrew/theader$Stat;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/trimline/metrocrew/theader$Stat;

    return-object v0
.end method


# virtual methods
.method public id()I
    .locals 1

    .line 171
    iget v0, p0, Lcom/trimline/metrocrew/theader$Stat;->mValue:I

    return v0
.end method
