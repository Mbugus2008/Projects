.class public Lcom/facebook/stetho/common/android/ResourcesUtil;
.super Ljava/lang/Object;
.source "ResourcesUtil.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    return-void
.end method

.method private static getFallbackIdString(I)Ljava/lang/String;
    .locals 2
    .param p0, "resourceId"    # I

    .line 67
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "#"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getIdString(Landroid/content/res/Resources;I)Ljava/lang/String;
    .locals 7
    .param p0, "r"    # Landroid/content/res/Resources;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "resourceId"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    .line 33
    if-nez p0, :cond_0

    .line 34
    invoke-static {p1}, Lcom/facebook/stetho/common/android/ResourcesUtil;->getFallbackIdString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 39
    :cond_0
    invoke-static {p1}, Lcom/facebook/stetho/common/android/ResourcesUtil;->getResourcePackageId(I)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 45
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourcePackageName(I)Ljava/lang/String;

    move-result-object v0

    .line 46
    .local v0, "prefix":Ljava/lang/String;
    const-string v1, ":"

    .local v1, "prefixSeparator":Ljava/lang/String;
    goto :goto_0

    .line 41
    .end local v0    # "prefix":Ljava/lang/String;
    .end local v1    # "prefixSeparator":Ljava/lang/String;
    :pswitch_0
    const-string v0, ""

    .line 42
    .restart local v0    # "prefix":Ljava/lang/String;
    const-string v1, ""

    .line 43
    .restart local v1    # "prefixSeparator":Ljava/lang/String;
    nop

    .line 50
    :goto_0
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceTypeName(I)Ljava/lang/String;

    move-result-object v2

    .line 51
    .local v2, "typeName":Ljava/lang/String;
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object v3

    .line 53
    .local v3, "entryName":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    .line 54
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    .line 55
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v5, v6

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 56
    .local v4, "sb":Ljava/lang/StringBuilder;
    const-string v5, "@"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5

    nop

    :pswitch_data_0
    .packed-switch 0x7f
        :pswitch_0
    .end packed-switch
.end method

.method public static getIdStringQuietly(Ljava/lang/Object;Landroid/content/res/Resources;I)Ljava/lang/String;
    .locals 4
    .param p0, "idContext"    # Ljava/lang/Object;
    .param p1, "r"    # Landroid/content/res/Resources;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "resourceId"    # I
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 23
    :try_start_0
    invoke-static {p1, p2}, Lcom/facebook/stetho/common/android/ResourcesUtil;->getIdString(Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 24
    :catch_0
    move-exception v0

    .line 25
    .local v0, "e":Landroid/content/res/Resources$NotFoundException;
    invoke-static {p2}, Lcom/facebook/stetho/common/android/ResourcesUtil;->getFallbackIdString(I)Ljava/lang/String;

    move-result-object v1

    .line 26
    .local v1, "idString":Ljava/lang/String;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unknown identifier encountered on "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/stetho/common/LogUtil;->w(Ljava/lang/String;)V

    .line 27
    return-object v1
.end method

.method private static getResourcePackageId(I)I
    .locals 1
    .param p0, "id"    # I

    .line 71
    ushr-int/lit8 v0, p0, 0x18

    and-int/lit16 v0, v0, 0xff

    return v0
.end method
