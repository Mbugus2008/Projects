.class public Lorg/apache/commons/cli/Option;
.super Ljava/lang/Object;
.source "Option.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static final UNINITIALIZED:I = -0x1

.field public static final UNLIMITED_VALUES:I = -0x2

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private argName:Ljava/lang/String;

.field private description:Ljava/lang/String;

.field private longOpt:Ljava/lang/String;

.field private numberOfArgs:I

.field private opt:Ljava/lang/String;

.field private optionalArg:Z

.field private required:Z

.field private type:Ljava/lang/Object;

.field private values:Ljava/util/List;

.field private valuesep:C


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "opt"    # Ljava/lang/String;
    .param p2, "description"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 90
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1, p2}, Lorg/apache/commons/cli/Option;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 91
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 1
    .param p1, "opt"    # Ljava/lang/String;
    .param p2, "longOpt"    # Ljava/lang/String;
    .param p3, "hasArg"    # Z
    .param p4, "description"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    const-string v0, "arg"

    iput-object v0, p0, Lorg/apache/commons/cli/Option;->argName:Ljava/lang/String;

    .line 68
    const/4 v0, -0x1

    iput v0, p0, Lorg/apache/commons/cli/Option;->numberOfArgs:I

    .line 74
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/cli/Option;->values:Ljava/util/List;

    .line 123
    invoke-static {p1}, Lorg/apache/commons/cli/OptionValidator;->validateOption(Ljava/lang/String;)V

    .line 125
    iput-object p1, p0, Lorg/apache/commons/cli/Option;->opt:Ljava/lang/String;

    .line 126
    iput-object p2, p0, Lorg/apache/commons/cli/Option;->longOpt:Ljava/lang/String;

    .line 129
    if-eqz p3, :cond_0

    .line 131
    const/4 v0, 0x1

    iput v0, p0, Lorg/apache/commons/cli/Option;->numberOfArgs:I

    .line 134
    :cond_0
    iput-object p4, p0, Lorg/apache/commons/cli/Option;->description:Ljava/lang/String;

    .line 135
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;ZLjava/lang/String;)V
    .locals 1
    .param p1, "opt"    # Ljava/lang/String;
    .param p2, "hasArg"    # Z
    .param p3, "description"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 105
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Lorg/apache/commons/cli/Option;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    .line 106
    return-void
.end method

.method private add(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 468
    iget v0, p0, Lorg/apache/commons/cli/Option;->numberOfArgs:I

    if-lez v0, :cond_1

    iget-object v0, p0, Lorg/apache/commons/cli/Option;->values:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget v1, p0, Lorg/apache/commons/cli/Option;->numberOfArgs:I

    add-int/lit8 v1, v1, -0x1

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 470
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Cannot add value, list full."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 474
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/cli/Option;->values:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 475
    return-void
.end method

.method private hasNoValues()Z
    .locals 1

    .line 590
    iget-object v0, p0, Lorg/apache/commons/cli/Option;->values:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    return v0
.end method

.method private processValue(Ljava/lang/String;)V
    .locals 4
    .param p1, "value"    # Ljava/lang/String;

    .line 425
    invoke-virtual {p0}, Lorg/apache/commons/cli/Option;->hasValueSeparator()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 428
    invoke-virtual {p0}, Lorg/apache/commons/cli/Option;->getValueSeparator()C

    move-result v0

    .line 431
    .local v0, "sep":C
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 434
    .local v1, "index":I
    :goto_0
    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 437
    iget-object v2, p0, Lorg/apache/commons/cli/Option;->values:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    iget v3, p0, Lorg/apache/commons/cli/Option;->numberOfArgs:I

    add-int/lit8 v3, v3, -0x1

    if-ne v2, v3, :cond_0

    .line 439
    goto :goto_1

    .line 443
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lorg/apache/commons/cli/Option;->add(Ljava/lang/String;)V

    .line 446
    add-int/lit8 v2, v1, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 449
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    goto :goto_0

    .line 454
    .end local v0    # "sep":C
    .end local v1    # "index":I
    :cond_1
    :goto_1
    invoke-direct {p0, p1}, Lorg/apache/commons/cli/Option;->add(Ljava/lang/String;)V

    .line 455
    return-void
.end method


# virtual methods
.method public addValue(Ljava/lang/String;)Z
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 670
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "The addValue method is not intended for client use. Subclasses should use the addValueForProcessing method instead. "

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method addValueForProcessing(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .line 401
    iget v0, p0, Lorg/apache/commons/cli/Option;->numberOfArgs:I

    packed-switch v0, :pswitch_data_0

    .line 407
    invoke-direct {p0, p1}, Lorg/apache/commons/cli/Option;->processValue(Ljava/lang/String;)V

    .line 409
    return-void

    .line 404
    :pswitch_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "NO_ARGS_ALLOWED"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_0
    .end packed-switch
.end method

.method clearValues()V
    .locals 1

    .line 659
    iget-object v0, p0, Lorg/apache/commons/cli/Option;->values:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 660
    return-void
.end method

.method public clone()Ljava/lang/Object;
    .locals 4

    .line 641
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/commons/cli/Option;

    .line 642
    .local v0, "option":Lorg/apache/commons/cli/Option;
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lorg/apache/commons/cli/Option;->values:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v1, v0, Lorg/apache/commons/cli/Option;->values:Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 643
    return-object v0

    .line 645
    .end local v0    # "option":Lorg/apache/commons/cli/Option;
    :catch_0
    move-exception v0

    .line 647
    .local v0, "cnse":Ljava/lang/CloneNotSupportedException;
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "A CloneNotSupportedException was thrown: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/CloneNotSupportedException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .line 595
    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    .line 597
    return v0

    .line 599
    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_6

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_2

    .line 604
    :cond_1
    move-object v2, p1

    check-cast v2, Lorg/apache/commons/cli/Option;

    .line 607
    .local v2, "option":Lorg/apache/commons/cli/Option;
    iget-object v3, p0, Lorg/apache/commons/cli/Option;->opt:Ljava/lang/String;

    if-eqz v3, :cond_2

    iget-object v3, p0, Lorg/apache/commons/cli/Option;->opt:Ljava/lang/String;

    iget-object v4, v2, Lorg/apache/commons/cli/Option;->opt:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    goto :goto_0

    :cond_2
    iget-object v3, v2, Lorg/apache/commons/cli/Option;->opt:Ljava/lang/String;

    if-eqz v3, :cond_3

    .line 609
    :goto_0
    return v1

    .line 611
    :cond_3
    iget-object v3, p0, Lorg/apache/commons/cli/Option;->longOpt:Ljava/lang/String;

    if-eqz v3, :cond_4

    iget-object v3, p0, Lorg/apache/commons/cli/Option;->longOpt:Ljava/lang/String;

    iget-object v4, v2, Lorg/apache/commons/cli/Option;->longOpt:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    goto :goto_1

    :cond_4
    iget-object v3, v2, Lorg/apache/commons/cli/Option;->longOpt:Ljava/lang/String;

    if-eqz v3, :cond_5

    .line 613
    :goto_1
    return v1

    .line 616
    :cond_5
    return v0

    .line 601
    .end local v2    # "option":Lorg/apache/commons/cli/Option;
    :cond_6
    :goto_2
    return v1
.end method

.method public getArgName()Ljava/lang/String;
    .locals 1

    .line 317
    iget-object v0, p0, Lorg/apache/commons/cli/Option;->argName:Ljava/lang/String;

    return-object v0
.end method

.method public getArgs()I
    .locals 1

    .line 391
    iget v0, p0, Lorg/apache/commons/cli/Option;->numberOfArgs:I

    return v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    .line 266
    iget-object v0, p0, Lorg/apache/commons/cli/Option;->description:Ljava/lang/String;

    return-object v0
.end method

.method public getId()I
    .locals 2

    .line 146
    invoke-virtual {p0}, Lorg/apache/commons/cli/Option;->getKey()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0
.end method

.method getKey()Ljava/lang/String;
    .locals 1

    .line 157
    iget-object v0, p0, Lorg/apache/commons/cli/Option;->opt:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 159
    iget-object v0, p0, Lorg/apache/commons/cli/Option;->longOpt:Ljava/lang/String;

    return-object v0

    .line 162
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/cli/Option;->opt:Ljava/lang/String;

    return-object v0
.end method

.method public getLongOpt()Ljava/lang/String;
    .locals 1

    .line 207
    iget-object v0, p0, Lorg/apache/commons/cli/Option;->longOpt:Ljava/lang/String;

    return-object v0
.end method

.method public getOpt()Ljava/lang/String;
    .locals 1

    .line 177
    iget-object v0, p0, Lorg/apache/commons/cli/Option;->opt:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/Object;
    .locals 1

    .line 187
    iget-object v0, p0, Lorg/apache/commons/cli/Option;->type:Ljava/lang/Object;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 2

    .line 486
    invoke-direct {p0}, Lorg/apache/commons/cli/Option;->hasNoValues()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/apache/commons/cli/Option;->values:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :goto_0
    return-object v0
.end method

.method public getValue(I)Ljava/lang/String;
    .locals 1
    .param p1, "index"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IndexOutOfBoundsException;
        }
    .end annotation

    .line 503
    invoke-direct {p0}, Lorg/apache/commons/cli/Option;->hasNoValues()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/apache/commons/cli/Option;->values:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    :goto_0
    return-object v0
.end method

.method public getValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "defaultValue"    # Ljava/lang/String;

    .line 518
    invoke-virtual {p0}, Lorg/apache/commons/cli/Option;->getValue()Ljava/lang/String;

    move-result-object v0

    .line 520
    .local v0, "value":Ljava/lang/String;
    if-eqz v0, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    move-object v1, p1

    :goto_0
    return-object v1
.end method

.method public getValueSeparator()C
    .locals 1

    .line 370
    iget-char v0, p0, Lorg/apache/commons/cli/Option;->valuesep:C

    return v0
.end method

.method public getValues()[Ljava/lang/String;
    .locals 2

    .line 532
    invoke-direct {p0}, Lorg/apache/commons/cli/Option;->hasNoValues()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lorg/apache/commons/cli/Option;->values:Ljava/util/List;

    iget-object v1, p0, Lorg/apache/commons/cli/Option;->values:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    check-cast v0, [Ljava/lang/String;

    :goto_0
    return-object v0
.end method

.method public getValuesList()Ljava/util/List;
    .locals 1

    .line 541
    iget-object v0, p0, Lorg/apache/commons/cli/Option;->values:Ljava/util/List;

    return-object v0
.end method

.method public hasArg()Z
    .locals 2

    .line 256
    iget v0, p0, Lorg/apache/commons/cli/Option;->numberOfArgs:I

    if-gtz v0, :cond_1

    iget v0, p0, Lorg/apache/commons/cli/Option;->numberOfArgs:I

    const/4 v1, -0x2

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public hasArgName()Z
    .locals 1

    .line 329
    iget-object v0, p0, Lorg/apache/commons/cli/Option;->argName:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/commons/cli/Option;->argName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasArgs()Z
    .locals 3

    .line 339
    iget v0, p0, Lorg/apache/commons/cli/Option;->numberOfArgs:I

    const/4 v1, 0x1

    if-gt v0, v1, :cond_1

    iget v0, p0, Lorg/apache/commons/cli/Option;->numberOfArgs:I

    const/4 v2, -0x2

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1
.end method

.method public hasLongOpt()Z
    .locals 1

    .line 246
    iget-object v0, p0, Lorg/apache/commons/cli/Option;->longOpt:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasOptionalArg()Z
    .locals 1

    .line 236
    iget-boolean v0, p0, Lorg/apache/commons/cli/Option;->optionalArg:Z

    return v0
.end method

.method public hasValueSeparator()Z
    .locals 1

    .line 381
    iget-char v0, p0, Lorg/apache/commons/cli/Option;->valuesep:C

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 4

    .line 622
    iget-object v0, p0, Lorg/apache/commons/cli/Option;->opt:Ljava/lang/String;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/commons/cli/Option;->opt:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v1

    .line 623
    .local v0, "result":I
    :goto_0
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lorg/apache/commons/cli/Option;->longOpt:Ljava/lang/String;

    if-eqz v3, :cond_1

    iget-object v1, p0, Lorg/apache/commons/cli/Option;->longOpt:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_1
    add-int/2addr v2, v1

    .line 624
    .end local v0    # "result":I
    .local v2, "result":I
    return v2
.end method

.method public isRequired()Z
    .locals 1

    .line 287
    iget-boolean v0, p0, Lorg/apache/commons/cli/Option;->required:Z

    return v0
.end method

.method public setArgName(Ljava/lang/String;)V
    .locals 0
    .param p1, "argName"    # Ljava/lang/String;

    .line 307
    iput-object p1, p0, Lorg/apache/commons/cli/Option;->argName:Ljava/lang/String;

    .line 308
    return-void
.end method

.method public setArgs(I)V
    .locals 0
    .param p1, "num"    # I

    .line 349
    iput p1, p0, Lorg/apache/commons/cli/Option;->numberOfArgs:I

    .line 350
    return-void
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 0
    .param p1, "description"    # Ljava/lang/String;

    .line 277
    iput-object p1, p0, Lorg/apache/commons/cli/Option;->description:Ljava/lang/String;

    .line 278
    return-void
.end method

.method public setLongOpt(Ljava/lang/String;)V
    .locals 0
    .param p1, "longOpt"    # Ljava/lang/String;

    .line 217
    iput-object p1, p0, Lorg/apache/commons/cli/Option;->longOpt:Ljava/lang/String;

    .line 218
    return-void
.end method

.method public setOptionalArg(Z)V
    .locals 0
    .param p1, "optionalArg"    # Z

    .line 228
    iput-boolean p1, p0, Lorg/apache/commons/cli/Option;->optionalArg:Z

    .line 229
    return-void
.end method

.method public setRequired(Z)V
    .locals 0
    .param p1, "required"    # Z

    .line 297
    iput-boolean p1, p0, Lorg/apache/commons/cli/Option;->required:Z

    .line 298
    return-void
.end method

.method public setType(Ljava/lang/Object;)V
    .locals 0
    .param p1, "type"    # Ljava/lang/Object;

    .line 197
    iput-object p1, p0, Lorg/apache/commons/cli/Option;->type:Ljava/lang/Object;

    .line 198
    return-void
.end method

.method public setValueSeparator(C)V
    .locals 0
    .param p1, "sep"    # C

    .line 360
    iput-char p1, p0, Lorg/apache/commons/cli/Option;->valuesep:C

    .line 361
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 551
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "[ option: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 553
    .local v0, "buf":Ljava/lang/StringBuffer;
    iget-object v1, p0, Lorg/apache/commons/cli/Option;->opt:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 555
    iget-object v1, p0, Lorg/apache/commons/cli/Option;->longOpt:Ljava/lang/String;

    const-string v2, " "

    if-eqz v1, :cond_0

    .line 557
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v3, p0, Lorg/apache/commons/cli/Option;->longOpt:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 560
    :cond_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 562
    invoke-virtual {p0}, Lorg/apache/commons/cli/Option;->hasArgs()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 564
    const-string v1, "[ARG...]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 566
    :cond_1
    invoke-virtual {p0}, Lorg/apache/commons/cli/Option;->hasArg()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 568
    const-string v1, " [ARG]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 571
    :cond_2
    :goto_0
    const-string v1, " :: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    iget-object v3, p0, Lorg/apache/commons/cli/Option;->description:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 573
    iget-object v2, p0, Lorg/apache/commons/cli/Option;->type:Ljava/lang/Object;

    if-eqz v2, :cond_3

    .line 575
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/apache/commons/cli/Option;->type:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 578
    :cond_3
    const-string v1, " ]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 580
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
