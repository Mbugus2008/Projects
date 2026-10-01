.class final Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;
.super Ljava/lang/Object;
.source "GsonTypes.java"

# interfaces
.implements Ljava/lang/reflect/ParameterizedType;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/gson/internal/GsonTypes;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ParameterizedTypeImpl"
.end annotation


# static fields
.field private static final serialVersionUID:J


# instance fields
.field private final ownerType:Ljava/lang/reflect/Type;

.field private final rawType:Ljava/lang/reflect/Type;

.field private final typeArguments:[Ljava/lang/reflect/Type;


# direct methods
.method varargs constructor <init>(Ljava/lang/reflect/Type;Ljava/lang/Class;[Ljava/lang/reflect/Type;)V
    .locals 4
    .param p1, "ownerType"    # Ljava/lang/reflect/Type;
    .param p3, "typeArguments"    # [Ljava/lang/reflect/Type;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Type;",
            "Ljava/lang/Class<",
            "*>;[",
            "Ljava/lang/reflect/Type;",
            ")V"
        }
    .end annotation

    .line 523
    .local p2, "rawType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 524
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 526
    if-nez p1, :cond_1

    invoke-static {p2}, Lcom/google/gson/internal/GsonTypes;->requiresOwnerType(Ljava/lang/reflect/Type;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 527
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Must specify owner type for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 530
    :cond_1
    :goto_0
    if-nez p1, :cond_2

    const/4 v0, 0x0

    goto :goto_1

    :cond_2
    invoke-static {p1}, Lcom/google/gson/internal/GsonTypes;->canonicalize(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v0

    :goto_1
    iput-object v0, p0, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;->ownerType:Ljava/lang/reflect/Type;

    .line 531
    invoke-static {p2}, Lcom/google/gson/internal/GsonTypes;->canonicalize(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v0

    iput-object v0, p0, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;->rawType:Ljava/lang/reflect/Type;

    .line 532
    invoke-virtual {p3}, [Ljava/lang/reflect/Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/reflect/Type;

    iput-object v0, p0, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;->typeArguments:[Ljava/lang/reflect/Type;

    .line 533
    const/4 v0, 0x0

    .local v0, "t":I
    iget-object v1, p0, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;->typeArguments:[Ljava/lang/reflect/Type;

    array-length v1, v1

    .local v1, "length":I
    :goto_2
    if-ge v0, v1, :cond_3

    .line 534
    iget-object v2, p0, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;->typeArguments:[Ljava/lang/reflect/Type;

    aget-object v2, v2, v0

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 535
    iget-object v2, p0, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;->typeArguments:[Ljava/lang/reflect/Type;

    aget-object v2, v2, v0

    invoke-static {v2}, Lcom/google/gson/internal/GsonTypes;->checkNotPrimitive(Ljava/lang/reflect/Type;)V

    .line 536
    iget-object v2, p0, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;->typeArguments:[Ljava/lang/reflect/Type;

    iget-object v3, p0, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;->typeArguments:[Ljava/lang/reflect/Type;

    aget-object v3, v3, v0

    invoke-static {v3}, Lcom/google/gson/internal/GsonTypes;->canonicalize(Ljava/lang/reflect/Type;)Ljava/lang/reflect/Type;

    move-result-object v3

    aput-object v3, v2, v0

    .line 533
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 538
    .end local v0    # "t":I
    .end local v1    # "length":I
    :cond_3
    return-void
.end method

.method private static hashCodeOrZero(Ljava/lang/Object;)I
    .locals 1
    .param p0, "o"    # Ljava/lang/Object;

    .line 562
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "other"    # Ljava/lang/Object;

    .line 557
    instance-of v0, p1, Ljava/lang/reflect/ParameterizedType;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Ljava/lang/reflect/ParameterizedType;

    .line 558
    invoke-static {p0, v0}, Lcom/google/gson/internal/GsonTypes;->equals(Ljava/lang/reflect/Type;Ljava/lang/reflect/Type;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 557
    :goto_0
    return v0
.end method

.method public getActualTypeArguments()[Ljava/lang/reflect/Type;
    .locals 1

    .line 542
    iget-object v0, p0, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;->typeArguments:[Ljava/lang/reflect/Type;

    invoke-virtual {v0}, [Ljava/lang/reflect/Type;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/reflect/Type;

    return-object v0
.end method

.method public getOwnerType()Ljava/lang/reflect/Type;
    .locals 1

    .line 552
    iget-object v0, p0, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;->ownerType:Ljava/lang/reflect/Type;

    return-object v0
.end method

.method public getRawType()Ljava/lang/reflect/Type;
    .locals 1

    .line 547
    iget-object v0, p0, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;->rawType:Ljava/lang/reflect/Type;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 567
    iget-object v0, p0, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;->typeArguments:[Ljava/lang/reflect/Type;

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    iget-object v1, p0, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;->rawType:Ljava/lang/reflect/Type;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    iget-object v1, p0, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;->ownerType:Ljava/lang/reflect/Type;

    invoke-static {v1}, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;->hashCodeOrZero(Ljava/lang/Object;)I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 572
    iget-object v0, p0, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;->typeArguments:[Ljava/lang/reflect/Type;

    array-length v0, v0

    .line 573
    .local v0, "length":I
    if-nez v0, :cond_0

    .line 574
    iget-object v1, p0, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;->rawType:Ljava/lang/reflect/Type;

    invoke-static {v1}, Lcom/google/gson/internal/GsonTypes;->typeToString(Ljava/lang/reflect/Type;)Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 577
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    add-int/lit8 v2, v0, 0x1

    mul-int/lit8 v2, v2, 0x1e

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 578
    .local v1, "stringBuilder":Ljava/lang/StringBuilder;
    iget-object v2, p0, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;->rawType:Ljava/lang/reflect/Type;

    .line 579
    invoke-static {v2}, Lcom/google/gson/internal/GsonTypes;->typeToString(Ljava/lang/reflect/Type;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 580
    const-string v3, "<"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;->typeArguments:[Ljava/lang/reflect/Type;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    .line 581
    invoke-static {v3}, Lcom/google/gson/internal/GsonTypes;->typeToString(Ljava/lang/reflect/Type;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 582
    const/4 v2, 0x1

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 583
    const-string v3, ", "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/google/gson/internal/GsonTypes$ParameterizedTypeImpl;->typeArguments:[Ljava/lang/reflect/Type;

    aget-object v4, v4, v2

    invoke-static {v4}, Lcom/google/gson/internal/GsonTypes;->typeToString(Ljava/lang/reflect/Type;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 582
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 585
    .end local v2    # "i":I
    :cond_1
    const-string v2, ">"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
