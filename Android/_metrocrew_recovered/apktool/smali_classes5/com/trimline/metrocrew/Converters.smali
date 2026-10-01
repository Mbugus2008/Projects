.class public Lcom/trimline/metrocrew/Converters;
.super Ljava/lang/Object;
.source "Converters.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/Converters$TimeConverter;,
        Lcom/trimline/metrocrew/Converters$DateConverter;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static toInteger(Lcom/trimline/metrocrew/theader$Stat;)Ljava/lang/Integer;
    .locals 1
    .param p0, "status"    # Lcom/trimline/metrocrew/theader$Stat;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "status"
        }
    .end annotation

    .line 44
    invoke-virtual {p0}, Lcom/trimline/metrocrew/theader$Stat;->id()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public static toStatus(I)Lcom/trimline/metrocrew/theader$Stat;
    .locals 1
    .param p0, "status"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "status"
        }
    .end annotation

    .line 39
    invoke-static {p0}, Lcom/trimline/metrocrew/theader$Stat;->fromId(I)Lcom/trimline/metrocrew/theader$Stat;

    move-result-object v0

    return-object v0
.end method
