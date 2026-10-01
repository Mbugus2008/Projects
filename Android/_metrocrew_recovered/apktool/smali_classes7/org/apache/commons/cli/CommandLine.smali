.class public Lorg/apache/commons/cli/CommandLine;
.super Ljava/lang/Object;
.source "CommandLine.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private args:Ljava/util/List;

.field private options:Ljava/util/List;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/cli/CommandLine;->args:Ljava/util/List;

    .line 51
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/cli/CommandLine;->options:Ljava/util/List;

    .line 59
    return-void
.end method

.method private resolveOption(Ljava/lang/String;)Lorg/apache/commons/cli/Option;
    .locals 3
    .param p1, "opt"    # Ljava/lang/String;

    .line 193
    invoke-static {p1}, Lorg/apache/commons/cli/Util;->stripLeadingHyphens(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 194
    iget-object v0, p0, Lorg/apache/commons/cli/CommandLine;->options:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 196
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/cli/Option;

    .line 197
    .local v1, "option":Lorg/apache/commons/cli/Option;
    invoke-virtual {v1}, Lorg/apache/commons/cli/Option;->getOpt()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 199
    return-object v1

    .line 202
    :cond_0
    invoke-virtual {v1}, Lorg/apache/commons/cli/Option;->getLongOpt()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 204
    return-object v1

    .line 207
    .end local v1    # "option":Lorg/apache/commons/cli/Option;
    :cond_1
    goto :goto_0

    .line 208
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method addArg(Ljava/lang/String;)V
    .locals 1
    .param p1, "arg"    # Ljava/lang/String;

    .line 346
    iget-object v0, p0, Lorg/apache/commons/cli/CommandLine;->args:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 347
    return-void
.end method

.method addOption(Lorg/apache/commons/cli/Option;)V
    .locals 1
    .param p1, "opt"    # Lorg/apache/commons/cli/Option;

    .line 356
    iget-object v0, p0, Lorg/apache/commons/cli/CommandLine;->options:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 357
    return-void
.end method

.method public getArgList()Ljava/util/List;
    .locals 1

    .line 314
    iget-object v0, p0, Lorg/apache/commons/cli/CommandLine;->args:Ljava/util/List;

    return-object v0
.end method

.method public getArgs()[Ljava/lang/String;
    .locals 2

    .line 300
    iget-object v0, p0, Lorg/apache/commons/cli/CommandLine;->args:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    .line 302
    .local v0, "answer":[Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/commons/cli/CommandLine;->args:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 304
    return-object v0
.end method

.method public getOptionObject(C)Ljava/lang/Object;
    .locals 1
    .param p1, "opt"    # C

    .line 133
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/cli/CommandLine;->getOptionObject(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getOptionObject(Ljava/lang/String;)Ljava/lang/Object;
    .locals 4
    .param p1, "opt"    # Ljava/lang/String;

    .line 93
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/apache/commons/cli/CommandLine;->getParsedOptionValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Lorg/apache/commons/cli/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 94
    :catch_0
    move-exception v0

    .line 95
    .local v0, "pe":Lorg/apache/commons/cli/ParseException;
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Exception found converting "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " to desired type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v0}, Lorg/apache/commons/cli/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 97
    const/4 v1, 0x0

    return-object v1
.end method

.method public getOptionProperties(Ljava/lang/String;)Ljava/util/Properties;
    .locals 8
    .param p1, "opt"    # Ljava/lang/String;

    .line 268
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 270
    .local v0, "props":Ljava/util/Properties;
    iget-object v1, p0, Lorg/apache/commons/cli/CommandLine;->options:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 272
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/cli/Option;

    .line 274
    .local v2, "option":Lorg/apache/commons/cli/Option;
    invoke-virtual {v2}, Lorg/apache/commons/cli/Option;->getOpt()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v2}, Lorg/apache/commons/cli/Option;->getLongOpt()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 276
    :cond_0
    invoke-virtual {v2}, Lorg/apache/commons/cli/Option;->getValuesList()Ljava/util/List;

    move-result-object v3

    .line 277
    .local v3, "values":Ljava/util/List;
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x1

    if-lt v4, v5, :cond_1

    .line 280
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 282
    :cond_1
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    if-ne v4, v7, :cond_2

    .line 285
    invoke-interface {v3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    const-string v5, "true"

    invoke-virtual {v0, v4, v5}, Ljava/util/Properties;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    .end local v2    # "option":Lorg/apache/commons/cli/Option;
    .end local v3    # "values":Ljava/util/List;
    :cond_2
    :goto_1
    goto :goto_0

    .line 290
    .end local v1    # "it":Ljava/util/Iterator;
    :cond_3
    return-object v0
.end method

.method public getOptionValue(C)Ljava/lang/String;
    .locals 1
    .param p1, "opt"    # C

    .line 159
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/cli/CommandLine;->getOptionValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOptionValue(CLjava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "opt"    # C
    .param p2, "defaultValue"    # Ljava/lang/String;

    .line 250
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lorg/apache/commons/cli/CommandLine;->getOptionValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOptionValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "opt"    # Ljava/lang/String;

    .line 145
    invoke-virtual {p0, p1}, Lorg/apache/commons/cli/CommandLine;->getOptionValues(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 147
    .local v0, "values":[Ljava/lang/String;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    aget-object v1, v0, v1

    :goto_0
    return-object v1
.end method

.method public getOptionValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "opt"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .line 234
    invoke-virtual {p0, p1}, Lorg/apache/commons/cli/CommandLine;->getOptionValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 236
    .local v0, "answer":Ljava/lang/String;
    if-eqz v0, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    move-object v1, p2

    :goto_0
    return-object v1
.end method

.method public getOptionValues(C)[Ljava/lang/String;
    .locals 1
    .param p1, "opt"    # C

    .line 220
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/cli/CommandLine;->getOptionValues(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOptionValues(Ljava/lang/String;)[Ljava/lang/String;
    .locals 4
    .param p1, "opt"    # Ljava/lang/String;

    .line 171
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 173
    .local v0, "values":Ljava/util/List;
    iget-object v1, p0, Lorg/apache/commons/cli/CommandLine;->options:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 175
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/apache/commons/cli/Option;

    .line 176
    .local v2, "option":Lorg/apache/commons/cli/Option;
    invoke-virtual {v2}, Lorg/apache/commons/cli/Option;->getOpt()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {v2}, Lorg/apache/commons/cli/Option;->getLongOpt()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 178
    :cond_0
    invoke-virtual {v2}, Lorg/apache/commons/cli/Option;->getValuesList()Ljava/util/List;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 180
    .end local v2    # "option":Lorg/apache/commons/cli/Option;
    :cond_1
    goto :goto_0

    .line 182
    .end local v1    # "it":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v1, 0x0

    goto :goto_1

    :cond_3
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    check-cast v1, [Ljava/lang/String;

    :goto_1
    return-object v1
.end method

.method public getOptions()[Lorg/apache/commons/cli/Option;
    .locals 3

    .line 377
    iget-object v0, p0, Lorg/apache/commons/cli/CommandLine;->options:Ljava/util/List;

    .line 380
    .local v0, "processed":Ljava/util/Collection;
    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v1

    new-array v1, v1, [Lorg/apache/commons/cli/Option;

    .line 383
    .local v1, "optionsArray":[Lorg/apache/commons/cli/Option;
    invoke-interface {v0, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lorg/apache/commons/cli/Option;

    check-cast v2, [Lorg/apache/commons/cli/Option;

    return-object v2
.end method

.method public getParsedOptionValue(Ljava/lang/String;)Ljava/lang/Object;
    .locals 4
    .param p1, "opt"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/cli/ParseException;
        }
    .end annotation

    .line 112
    invoke-virtual {p0, p1}, Lorg/apache/commons/cli/CommandLine;->getOptionValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 114
    .local v0, "res":Ljava/lang/String;
    invoke-direct {p0, p1}, Lorg/apache/commons/cli/CommandLine;->resolveOption(Ljava/lang/String;)Lorg/apache/commons/cli/Option;

    move-result-object v1

    .line 115
    .local v1, "option":Lorg/apache/commons/cli/Option;
    const/4 v2, 0x0

    if-nez v1, :cond_0

    .line 117
    return-object v2

    .line 120
    :cond_0
    invoke-virtual {v1}, Lorg/apache/commons/cli/Option;->getType()Ljava/lang/Object;

    move-result-object v3

    .line 122
    .local v3, "type":Ljava/lang/Object;
    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-static {v0, v3}, Lorg/apache/commons/cli/TypeHandler;->createValue(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    :goto_0
    return-object v2
.end method

.method public hasOption(C)Z
    .locals 1
    .param p1, "opt"    # C

    .line 80
    invoke-static {p1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/commons/cli/CommandLine;->hasOption(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public hasOption(Ljava/lang/String;)Z
    .locals 2
    .param p1, "opt"    # Ljava/lang/String;

    .line 69
    iget-object v0, p0, Lorg/apache/commons/cli/CommandLine;->options:Ljava/util/List;

    invoke-direct {p0, p1}, Lorg/apache/commons/cli/CommandLine;->resolveOption(Ljava/lang/String;)Lorg/apache/commons/cli/Option;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1

    .line 367
    iget-object v0, p0, Lorg/apache/commons/cli/CommandLine;->options:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method
