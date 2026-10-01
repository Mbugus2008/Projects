.class public abstract Lorg/apache/commons/cli/Parser;
.super Ljava/lang/Object;
.source "Parser.java"

# interfaces
.implements Lorg/apache/commons/cli/CommandLineParser;


# instance fields
.field protected cmd:Lorg/apache/commons/cli/CommandLine;

.field private options:Lorg/apache/commons/cli/Options;

.field private requiredOptions:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected checkRequiredOptions()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/cli/MissingOptionException;
        }
    .end annotation

    .line 297
    invoke-virtual {p0}, Lorg/apache/commons/cli/Parser;->getRequiredOptions()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 301
    return-void

    .line 299
    :cond_0
    new-instance v0, Lorg/apache/commons/cli/MissingOptionException;

    invoke-virtual {p0}, Lorg/apache/commons/cli/Parser;->getRequiredOptions()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/commons/cli/MissingOptionException;-><init>(Ljava/util/List;)V

    throw v0
.end method

.method protected abstract flatten(Lorg/apache/commons/cli/Options;[Ljava/lang/String;Z)[Ljava/lang/String;
.end method

.method protected getOptions()Lorg/apache/commons/cli/Options;
    .locals 1

    .line 53
    iget-object v0, p0, Lorg/apache/commons/cli/Parser;->options:Lorg/apache/commons/cli/Options;

    return-object v0
.end method

.method protected getRequiredOptions()Ljava/util/List;
    .locals 1

    .line 58
    iget-object v0, p0, Lorg/apache/commons/cli/Parser;->requiredOptions:Ljava/util/List;

    return-object v0
.end method

.method public parse(Lorg/apache/commons/cli/Options;[Ljava/lang/String;)Lorg/apache/commons/cli/CommandLine;
    .locals 2
    .param p1, "options"    # Lorg/apache/commons/cli/Options;
    .param p2, "arguments"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/cli/ParseException;
        }
    .end annotation

    .line 85
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v0, v1}, Lorg/apache/commons/cli/Parser;->parse(Lorg/apache/commons/cli/Options;[Ljava/lang/String;Ljava/util/Properties;Z)Lorg/apache/commons/cli/CommandLine;

    move-result-object v0

    return-object v0
.end method

.method public parse(Lorg/apache/commons/cli/Options;[Ljava/lang/String;Ljava/util/Properties;)Lorg/apache/commons/cli/CommandLine;
    .locals 1
    .param p1, "options"    # Lorg/apache/commons/cli/Options;
    .param p2, "arguments"    # [Ljava/lang/String;
    .param p3, "properties"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/cli/ParseException;
        }
    .end annotation

    .line 102
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/commons/cli/Parser;->parse(Lorg/apache/commons/cli/Options;[Ljava/lang/String;Ljava/util/Properties;Z)Lorg/apache/commons/cli/CommandLine;

    move-result-object v0

    return-object v0
.end method

.method public parse(Lorg/apache/commons/cli/Options;[Ljava/lang/String;Ljava/util/Properties;Z)Lorg/apache/commons/cli/CommandLine;
    .locals 7
    .param p1, "options"    # Lorg/apache/commons/cli/Options;
    .param p2, "arguments"    # [Ljava/lang/String;
    .param p3, "properties"    # Ljava/util/Properties;
    .param p4, "stopAtNonOption"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/cli/ParseException;
        }
    .end annotation

    .line 143
    invoke-virtual {p1}, Lorg/apache/commons/cli/Options;->helpOptions()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 145
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/cli/Option;

    .line 146
    .local v1, "opt":Lorg/apache/commons/cli/Option;
    invoke-virtual {v1}, Lorg/apache/commons/cli/Option;->clearValues()V

    .line 147
    .end local v1    # "opt":Lorg/apache/commons/cli/Option;
    goto :goto_0

    .line 150
    .end local v0    # "it":Ljava/util/Iterator;
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/commons/cli/Parser;->setOptions(Lorg/apache/commons/cli/Options;)V

    .line 152
    new-instance v0, Lorg/apache/commons/cli/CommandLine;

    invoke-direct {v0}, Lorg/apache/commons/cli/CommandLine;-><init>()V

    iput-object v0, p0, Lorg/apache/commons/cli/Parser;->cmd:Lorg/apache/commons/cli/CommandLine;

    .line 154
    const/4 v0, 0x0

    .line 156
    .local v0, "eatTheRest":Z
    if-nez p2, :cond_1

    .line 158
    const/4 v1, 0x0

    new-array p2, v1, [Ljava/lang/String;

    .line 161
    :cond_1
    invoke-virtual {p0}, Lorg/apache/commons/cli/Parser;->getOptions()Lorg/apache/commons/cli/Options;

    move-result-object v1

    invoke-virtual {p0, v1, p2, p4}, Lorg/apache/commons/cli/Parser;->flatten(Lorg/apache/commons/cli/Options;[Ljava/lang/String;Z)[Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 163
    .local v1, "tokenList":Ljava/util/List;
    invoke-interface {v1}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v2

    .line 166
    .local v2, "iterator":Ljava/util/ListIterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/ListIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 168
    invoke-interface {v2}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 171
    .local v3, "t":Ljava/lang/String;
    const-string v4, "--"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 173
    const/4 v0, 0x1

    goto :goto_2

    .line 177
    :cond_2
    const-string v5, "-"

    invoke-virtual {v5, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 179
    if-eqz p4, :cond_3

    .line 181
    const/4 v0, 0x1

    goto :goto_2

    .line 185
    :cond_3
    iget-object v5, p0, Lorg/apache/commons/cli/Parser;->cmd:Lorg/apache/commons/cli/CommandLine;

    invoke-virtual {v5, v3}, Lorg/apache/commons/cli/CommandLine;->addArg(Ljava/lang/String;)V

    goto :goto_2

    .line 190
    :cond_4
    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 192
    if-eqz p4, :cond_5

    invoke-virtual {p0}, Lorg/apache/commons/cli/Parser;->getOptions()Lorg/apache/commons/cli/Options;

    move-result-object v5

    invoke-virtual {v5, v3}, Lorg/apache/commons/cli/Options;->hasOption(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_5

    .line 194
    const/4 v0, 0x1

    .line 195
    iget-object v5, p0, Lorg/apache/commons/cli/Parser;->cmd:Lorg/apache/commons/cli/CommandLine;

    invoke-virtual {v5, v3}, Lorg/apache/commons/cli/CommandLine;->addArg(Ljava/lang/String;)V

    goto :goto_2

    .line 199
    :cond_5
    invoke-virtual {p0, v3, v2}, Lorg/apache/commons/cli/Parser;->processOption(Ljava/lang/String;Ljava/util/ListIterator;)V

    goto :goto_2

    .line 206
    :cond_6
    iget-object v5, p0, Lorg/apache/commons/cli/Parser;->cmd:Lorg/apache/commons/cli/CommandLine;

    invoke-virtual {v5, v3}, Lorg/apache/commons/cli/CommandLine;->addArg(Ljava/lang/String;)V

    .line 208
    if-eqz p4, :cond_7

    .line 210
    const/4 v0, 0x1

    .line 215
    :cond_7
    :goto_2
    if-eqz v0, :cond_9

    .line 217
    :goto_3
    invoke-interface {v2}, Ljava/util/ListIterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9

    .line 219
    invoke-interface {v2}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 222
    .local v5, "str":Ljava/lang/String;
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_8

    .line 224
    iget-object v6, p0, Lorg/apache/commons/cli/Parser;->cmd:Lorg/apache/commons/cli/CommandLine;

    invoke-virtual {v6, v5}, Lorg/apache/commons/cli/CommandLine;->addArg(Ljava/lang/String;)V

    .line 226
    .end local v5    # "str":Ljava/lang/String;
    :cond_8
    goto :goto_3

    .line 228
    .end local v3    # "t":Ljava/lang/String;
    :cond_9
    goto :goto_1

    .line 230
    :cond_a
    invoke-virtual {p0, p3}, Lorg/apache/commons/cli/Parser;->processProperties(Ljava/util/Properties;)V

    .line 231
    invoke-virtual {p0}, Lorg/apache/commons/cli/Parser;->checkRequiredOptions()V

    .line 233
    iget-object v3, p0, Lorg/apache/commons/cli/Parser;->cmd:Lorg/apache/commons/cli/CommandLine;

    return-object v3
.end method

.method public parse(Lorg/apache/commons/cli/Options;[Ljava/lang/String;Z)Lorg/apache/commons/cli/CommandLine;
    .locals 1
    .param p1, "options"    # Lorg/apache/commons/cli/Options;
    .param p2, "arguments"    # [Ljava/lang/String;
    .param p3, "stopAtNonOption"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/cli/ParseException;
        }
    .end annotation

    .line 119
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0, p3}, Lorg/apache/commons/cli/Parser;->parse(Lorg/apache/commons/cli/Options;[Ljava/lang/String;Ljava/util/Properties;Z)Lorg/apache/commons/cli/CommandLine;

    move-result-object v0

    return-object v0
.end method

.method public processArgs(Lorg/apache/commons/cli/Option;Ljava/util/ListIterator;)V
    .locals 2
    .param p1, "opt"    # Lorg/apache/commons/cli/Option;
    .param p2, "iter"    # Ljava/util/ListIterator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/cli/ParseException;
        }
    .end annotation

    .line 318
    nop

    :goto_0
    invoke-interface {p2}, Ljava/util/ListIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 320
    invoke-interface {p2}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 323
    .local v0, "str":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/apache/commons/cli/Parser;->getOptions()Lorg/apache/commons/cli/Options;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/commons/cli/Options;->hasOption(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "-"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 325
    invoke-interface {p2}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    .line 326
    goto :goto_1

    .line 332
    :cond_0
    :try_start_0
    invoke-static {v0}, Lorg/apache/commons/cli/Util;->stripLeadingAndTrailingQuotes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/apache/commons/cli/Option;->addValueForProcessing(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 338
    nop

    .line 339
    .end local v0    # "str":Ljava/lang/String;
    goto :goto_0

    .line 334
    .restart local v0    # "str":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 336
    .local v1, "exp":Ljava/lang/RuntimeException;
    invoke-interface {p2}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    .line 337
    nop

    .line 341
    .end local v0    # "str":Ljava/lang/String;
    .end local v1    # "exp":Ljava/lang/RuntimeException;
    :cond_1
    :goto_1
    invoke-virtual {p1}, Lorg/apache/commons/cli/Option;->getValues()[Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_3

    invoke-virtual {p1}, Lorg/apache/commons/cli/Option;->hasOptionalArg()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_2

    .line 343
    :cond_2
    new-instance v0, Lorg/apache/commons/cli/MissingArgumentException;

    invoke-direct {v0, p1}, Lorg/apache/commons/cli/MissingArgumentException;-><init>(Lorg/apache/commons/cli/Option;)V

    throw v0

    .line 345
    :cond_3
    :goto_2
    return-void
.end method

.method protected processOption(Ljava/lang/String;Ljava/util/ListIterator;)V
    .locals 4
    .param p1, "arg"    # Ljava/lang/String;
    .param p2, "iter"    # Ljava/util/ListIterator;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/cli/ParseException;
        }
    .end annotation

    .line 358
    invoke-virtual {p0}, Lorg/apache/commons/cli/Parser;->getOptions()Lorg/apache/commons/cli/Options;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/commons/cli/Options;->hasOption(Ljava/lang/String;)Z

    move-result v0

    .line 361
    .local v0, "hasOption":Z
    if-eqz v0, :cond_4

    .line 367
    invoke-virtual {p0}, Lorg/apache/commons/cli/Parser;->getOptions()Lorg/apache/commons/cli/Options;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/apache/commons/cli/Options;->getOption(Ljava/lang/String;)Lorg/apache/commons/cli/Option;

    move-result-object v1

    invoke-virtual {v1}, Lorg/apache/commons/cli/Option;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/commons/cli/Option;

    .line 371
    .local v1, "opt":Lorg/apache/commons/cli/Option;
    invoke-virtual {v1}, Lorg/apache/commons/cli/Option;->isRequired()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 373
    invoke-virtual {p0}, Lorg/apache/commons/cli/Parser;->getRequiredOptions()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1}, Lorg/apache/commons/cli/Option;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 378
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/cli/Parser;->getOptions()Lorg/apache/commons/cli/Options;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/apache/commons/cli/Options;->getOptionGroup(Lorg/apache/commons/cli/Option;)Lorg/apache/commons/cli/OptionGroup;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 380
    invoke-virtual {p0}, Lorg/apache/commons/cli/Parser;->getOptions()Lorg/apache/commons/cli/Options;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/apache/commons/cli/Options;->getOptionGroup(Lorg/apache/commons/cli/Option;)Lorg/apache/commons/cli/OptionGroup;

    move-result-object v2

    .line 382
    .local v2, "group":Lorg/apache/commons/cli/OptionGroup;
    invoke-virtual {v2}, Lorg/apache/commons/cli/OptionGroup;->isRequired()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 384
    invoke-virtual {p0}, Lorg/apache/commons/cli/Parser;->getRequiredOptions()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 387
    :cond_1
    invoke-virtual {v2, v1}, Lorg/apache/commons/cli/OptionGroup;->setSelected(Lorg/apache/commons/cli/Option;)V

    .line 391
    .end local v2    # "group":Lorg/apache/commons/cli/OptionGroup;
    :cond_2
    invoke-virtual {v1}, Lorg/apache/commons/cli/Option;->hasArg()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 393
    invoke-virtual {p0, v1, p2}, Lorg/apache/commons/cli/Parser;->processArgs(Lorg/apache/commons/cli/Option;Ljava/util/ListIterator;)V

    .line 397
    :cond_3
    iget-object v2, p0, Lorg/apache/commons/cli/Parser;->cmd:Lorg/apache/commons/cli/CommandLine;

    invoke-virtual {v2, v1}, Lorg/apache/commons/cli/CommandLine;->addOption(Lorg/apache/commons/cli/Option;)V

    .line 398
    return-void

    .line 363
    .end local v1    # "opt":Lorg/apache/commons/cli/Option;
    :cond_4
    new-instance v1, Lorg/apache/commons/cli/UnrecognizedOptionException;

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Unrecognized option: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Lorg/apache/commons/cli/UnrecognizedOptionException;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    throw v1
.end method

.method protected processProperties(Ljava/util/Properties;)V
    .locals 5
    .param p1, "properties"    # Ljava/util/Properties;

    .line 243
    if-nez p1, :cond_0

    .line 245
    return-void

    .line 248
    :cond_0
    invoke-virtual {p1}, Ljava/util/Properties;->propertyNames()Ljava/util/Enumeration;

    move-result-object v0

    .local v0, "e":Ljava/util/Enumeration;
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 250
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 252
    .local v1, "option":Ljava/lang/String;
    iget-object v2, p0, Lorg/apache/commons/cli/Parser;->cmd:Lorg/apache/commons/cli/CommandLine;

    invoke-virtual {v2, v1}, Lorg/apache/commons/cli/CommandLine;->hasOption(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_4

    .line 254
    invoke-virtual {p0}, Lorg/apache/commons/cli/Parser;->getOptions()Lorg/apache/commons/cli/Options;

    move-result-object v2

    invoke-virtual {v2, v1}, Lorg/apache/commons/cli/Options;->getOption(Ljava/lang/String;)Lorg/apache/commons/cli/Option;

    move-result-object v2

    .line 257
    .local v2, "opt":Lorg/apache/commons/cli/Option;
    invoke-virtual {p1, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 259
    .local v3, "value":Ljava/lang/String;
    invoke-virtual {v2}, Lorg/apache/commons/cli/Option;->hasArg()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 261
    invoke-virtual {v2}, Lorg/apache/commons/cli/Option;->getValues()[Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-virtual {v2}, Lorg/apache/commons/cli/Option;->getValues()[Ljava/lang/String;

    move-result-object v4

    array-length v4, v4

    if-nez v4, :cond_3

    .line 265
    :cond_1
    :try_start_0
    invoke-virtual {v2, v3}, Lorg/apache/commons/cli/Option;->addValueForProcessing(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    .line 270
    :goto_1
    goto :goto_2

    .line 267
    :catch_0
    move-exception v4

    goto :goto_1

    .line 273
    :cond_2
    const-string v4, "yes"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    const-string v4, "true"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    const-string v4, "1"

    invoke-virtual {v4, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 279
    goto :goto_3

    .line 282
    :cond_3
    :goto_2
    iget-object v4, p0, Lorg/apache/commons/cli/Parser;->cmd:Lorg/apache/commons/cli/CommandLine;

    invoke-virtual {v4, v2}, Lorg/apache/commons/cli/CommandLine;->addOption(Lorg/apache/commons/cli/Option;)V

    .line 284
    .end local v1    # "option":Ljava/lang/String;
    .end local v2    # "opt":Lorg/apache/commons/cli/Option;
    .end local v3    # "value":Ljava/lang/String;
    :cond_4
    goto :goto_0

    .line 285
    .end local v0    # "e":Ljava/util/Enumeration;
    :cond_5
    :goto_3
    return-void
.end method

.method protected setOptions(Lorg/apache/commons/cli/Options;)V
    .locals 2
    .param p1, "options"    # Lorg/apache/commons/cli/Options;

    .line 47
    iput-object p1, p0, Lorg/apache/commons/cli/Parser;->options:Lorg/apache/commons/cli/Options;

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p1}, Lorg/apache/commons/cli/Options;->getRequiredOptions()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lorg/apache/commons/cli/Parser;->requiredOptions:Ljava/util/List;

    .line 49
    return-void
.end method
