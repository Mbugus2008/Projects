.class public Lcom/facebook/stetho/dumpapp/Dumper;
.super Ljava/lang/Object;
.source "Dumper.java"


# instance fields
.field private final mDumperPlugins:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/stetho/dumpapp/DumperPlugin;",
            ">;"
        }
    .end annotation
.end field

.field private final mGlobalOptions:Lcom/facebook/stetho/dumpapp/GlobalOptions;

.field private final mParser:Lorg/apache/commons/cli/CommandLineParser;


# direct methods
.method public constructor <init>(Ljava/lang/Iterable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/facebook/stetho/dumpapp/DumperPlugin;",
            ">;)V"
        }
    .end annotation

    .line 35
    .local p1, "dumperPlugins":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/facebook/stetho/dumpapp/DumperPlugin;>;"
    new-instance v0, Lorg/apache/commons/cli/GnuParser;

    invoke-direct {v0}, Lorg/apache/commons/cli/GnuParser;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/facebook/stetho/dumpapp/Dumper;-><init>(Ljava/lang/Iterable;Lorg/apache/commons/cli/CommandLineParser;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Ljava/lang/Iterable;Lorg/apache/commons/cli/CommandLineParser;)V
    .locals 1
    .param p2, "parser"    # Lorg/apache/commons/cli/CommandLineParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/facebook/stetho/dumpapp/DumperPlugin;",
            ">;",
            "Lorg/apache/commons/cli/CommandLineParser;",
            ")V"
        }
    .end annotation

    .line 40
    .local p1, "dumperPlugins":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/facebook/stetho/dumpapp/DumperPlugin;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    invoke-static {p1}, Lcom/facebook/stetho/dumpapp/Dumper;->generatePluginMap(Ljava/lang/Iterable;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/dumpapp/Dumper;->mDumperPlugins:Ljava/util/Map;

    .line 42
    iput-object p2, p0, Lcom/facebook/stetho/dumpapp/Dumper;->mParser:Lorg/apache/commons/cli/CommandLineParser;

    .line 43
    new-instance v0, Lcom/facebook/stetho/dumpapp/GlobalOptions;

    invoke-direct {v0}, Lcom/facebook/stetho/dumpapp/GlobalOptions;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/dumpapp/Dumper;->mGlobalOptions:Lcom/facebook/stetho/dumpapp/GlobalOptions;

    .line 44
    return-void
.end method

.method private doDump(Ljava/io/InputStream;Ljava/io/PrintStream;Ljava/io/PrintStream;[Ljava/lang/String;)I
    .locals 4
    .param p1, "input"    # Ljava/io/InputStream;
    .param p2, "out"    # Ljava/io/PrintStream;
    .param p3, "err"    # Ljava/io/PrintStream;
    .param p4, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/commons/cli/ParseException;,
            Lcom/facebook/stetho/dumpapp/DumpException;
        }
    .end annotation

    .line 91
    iget-object v0, p0, Lcom/facebook/stetho/dumpapp/Dumper;->mParser:Lorg/apache/commons/cli/CommandLineParser;

    iget-object v1, p0, Lcom/facebook/stetho/dumpapp/Dumper;->mGlobalOptions:Lcom/facebook/stetho/dumpapp/GlobalOptions;

    iget-object v1, v1, Lcom/facebook/stetho/dumpapp/GlobalOptions;->options:Lorg/apache/commons/cli/Options;

    const/4 v2, 0x1

    invoke-interface {v0, v1, p4, v2}, Lorg/apache/commons/cli/CommandLineParser;->parse(Lorg/apache/commons/cli/Options;[Ljava/lang/String;Z)Lorg/apache/commons/cli/CommandLine;

    move-result-object v0

    .line 95
    .local v0, "parsedArgs":Lorg/apache/commons/cli/CommandLine;
    iget-object v1, p0, Lcom/facebook/stetho/dumpapp/Dumper;->mGlobalOptions:Lcom/facebook/stetho/dumpapp/GlobalOptions;

    iget-object v1, v1, Lcom/facebook/stetho/dumpapp/GlobalOptions;->optionHelp:Lorg/apache/commons/cli/Option;

    invoke-virtual {v1}, Lorg/apache/commons/cli/Option;->getOpt()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/cli/CommandLine;->hasOption(Ljava/lang/String;)Z

    move-result v1

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    .line 96
    invoke-direct {p0, p2}, Lcom/facebook/stetho/dumpapp/Dumper;->dumpUsage(Ljava/io/PrintStream;)V

    .line 97
    return v3

    .line 98
    :cond_0
    iget-object v1, p0, Lcom/facebook/stetho/dumpapp/Dumper;->mGlobalOptions:Lcom/facebook/stetho/dumpapp/GlobalOptions;

    iget-object v1, v1, Lcom/facebook/stetho/dumpapp/GlobalOptions;->optionListPlugins:Lorg/apache/commons/cli/Option;

    invoke-virtual {v1}, Lorg/apache/commons/cli/Option;->getOpt()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/commons/cli/CommandLine;->hasOption(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 99
    invoke-direct {p0, p2}, Lcom/facebook/stetho/dumpapp/Dumper;->dumpAvailablePlugins(Ljava/io/PrintStream;)V

    .line 100
    return v3

    .line 101
    :cond_1
    invoke-virtual {v0}, Lorg/apache/commons/cli/CommandLine;->getArgList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 102
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/facebook/stetho/dumpapp/Dumper;->dumpPluginOutput(Ljava/io/InputStream;Ljava/io/PrintStream;Ljava/io/PrintStream;Lorg/apache/commons/cli/CommandLine;)V

    .line 103
    return v3

    .line 106
    :cond_2
    invoke-direct {p0, p3}, Lcom/facebook/stetho/dumpapp/Dumper;->dumpUsage(Ljava/io/PrintStream;)V

    .line 107
    return v2
.end method

.method private dumpAvailablePlugins(Ljava/io/PrintStream;)V
    .locals 4
    .param p1, "output"    # Ljava/io/PrintStream;

    .line 112
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 113
    .local v0, "pluginNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v1, p0, Lcom/facebook/stetho/dumpapp/Dumper;->mDumperPlugins:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/stetho/dumpapp/DumperPlugin;

    .line 114
    .local v2, "pluginToDump":Lcom/facebook/stetho/dumpapp/DumperPlugin;
    invoke-interface {v2}, Lcom/facebook/stetho/dumpapp/DumperPlugin;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 115
    .end local v2    # "pluginToDump":Lcom/facebook/stetho/dumpapp/DumperPlugin;
    goto :goto_0

    .line 116
    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 117
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 118
    .local v2, "pluginName":Ljava/lang/String;
    invoke-virtual {p1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 119
    .end local v2    # "pluginName":Ljava/lang/String;
    goto :goto_1

    .line 120
    :cond_1
    return-void
.end method

.method private dumpPluginOutput(Ljava/io/InputStream;Ljava/io/PrintStream;Ljava/io/PrintStream;Lorg/apache/commons/cli/CommandLine;)V
    .locals 8
    .param p1, "input"    # Ljava/io/InputStream;
    .param p2, "out"    # Ljava/io/PrintStream;
    .param p3, "err"    # Ljava/io/PrintStream;
    .param p4, "parsedArgs"    # Lorg/apache/commons/cli/CommandLine;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/dumpapp/DumpException;
        }
    .end annotation

    .line 126
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {p4}, Lorg/apache/commons/cli/CommandLine;->getArgList()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    move-object v7, v0

    .line 127
    .local v7, "args":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_1

    .line 130
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 132
    .local v0, "pluginName":Ljava/lang/String;
    iget-object v1, p0, Lcom/facebook/stetho/dumpapp/Dumper;->mDumperPlugins:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/stetho/dumpapp/DumperPlugin;

    .line 133
    .local v1, "plugin":Lcom/facebook/stetho/dumpapp/DumperPlugin;
    if-eqz v1, :cond_0

    .line 137
    new-instance v2, Lcom/facebook/stetho/dumpapp/DumperContext;

    iget-object v6, p0, Lcom/facebook/stetho/dumpapp/Dumper;->mParser:Lorg/apache/commons/cli/CommandLineParser;

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    .end local p1    # "input":Ljava/io/InputStream;
    .end local p2    # "out":Ljava/io/PrintStream;
    .end local p3    # "err":Ljava/io/PrintStream;
    .local v3, "input":Ljava/io/InputStream;
    .local v4, "out":Ljava/io/PrintStream;
    .local v5, "err":Ljava/io/PrintStream;
    invoke-direct/range {v2 .. v7}, Lcom/facebook/stetho/dumpapp/DumperContext;-><init>(Ljava/io/InputStream;Ljava/io/PrintStream;Ljava/io/PrintStream;Lorg/apache/commons/cli/CommandLineParser;Ljava/util/List;)V

    .line 138
    .local v2, "dumperContext":Lcom/facebook/stetho/dumpapp/DumperContext;
    invoke-interface {v1, v2}, Lcom/facebook/stetho/dumpapp/DumperPlugin;->dump(Lcom/facebook/stetho/dumpapp/DumperContext;)V

    .line 139
    return-void

    .line 134
    .end local v2    # "dumperContext":Lcom/facebook/stetho/dumpapp/DumperContext;
    .end local v3    # "input":Ljava/io/InputStream;
    .end local v4    # "out":Ljava/io/PrintStream;
    .end local v5    # "err":Ljava/io/PrintStream;
    .restart local p1    # "input":Ljava/io/InputStream;
    .restart local p2    # "out":Ljava/io/PrintStream;
    .restart local p3    # "err":Ljava/io/PrintStream;
    :cond_0
    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    .end local p1    # "input":Ljava/io/InputStream;
    .end local p2    # "out":Ljava/io/PrintStream;
    .end local p3    # "err":Ljava/io/PrintStream;
    .restart local v3    # "input":Ljava/io/InputStream;
    .restart local v4    # "out":Ljava/io/PrintStream;
    .restart local v5    # "err":Ljava/io/PrintStream;
    new-instance p1, Lcom/facebook/stetho/dumpapp/DumpException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "No plugin named \'"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, "\'"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/facebook/stetho/dumpapp/DumpException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 128
    .end local v0    # "pluginName":Ljava/lang/String;
    .end local v1    # "plugin":Lcom/facebook/stetho/dumpapp/DumperPlugin;
    .end local v3    # "input":Ljava/io/InputStream;
    .end local v4    # "out":Ljava/io/PrintStream;
    .end local v5    # "err":Ljava/io/PrintStream;
    .restart local p1    # "input":Ljava/io/InputStream;
    .restart local p2    # "out":Ljava/io/PrintStream;
    .restart local p3    # "err":Ljava/io/PrintStream;
    :cond_1
    move-object v3, p1

    move-object v4, p2

    .end local p1    # "input":Ljava/io/InputStream;
    .end local p2    # "out":Ljava/io/PrintStream;
    .restart local v3    # "input":Ljava/io/InputStream;
    .restart local v4    # "out":Ljava/io/PrintStream;
    new-instance p1, Lcom/facebook/stetho/dumpapp/DumpException;

    const-string p2, "Expected plugin argument"

    invoke-direct {p1, p2}, Lcom/facebook/stetho/dumpapp/DumpException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private dumpUsage(Ljava/io/PrintStream;)V
    .locals 8
    .param p1, "output"    # Ljava/io/PrintStream;

    .line 142
    const-string v1, "dumpapp"

    .line 143
    .local v1, "cmdName":Ljava/lang/String;
    new-instance v0, Lorg/apache/commons/cli/HelpFormatter;

    invoke-direct {v0}, Lorg/apache/commons/cli/HelpFormatter;-><init>()V

    move-object v2, v0

    .line 145
    .local v2, "formatter":Lorg/apache/commons/cli/HelpFormatter;
    const-string v0, "Usage: dumpapp [options] <plugin> [plugin-options]"

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 147
    new-instance v3, Ljava/io/PrintWriter;

    invoke-direct {v3, p1}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V

    .line 149
    .local v3, "writer":Ljava/io/PrintWriter;
    nop

    .line 151
    :try_start_0
    invoke-virtual {v2}, Lorg/apache/commons/cli/HelpFormatter;->getWidth()I

    move-result v4

    iget-object v0, p0, Lcom/facebook/stetho/dumpapp/Dumper;->mGlobalOptions:Lcom/facebook/stetho/dumpapp/GlobalOptions;

    iget-object v5, v0, Lcom/facebook/stetho/dumpapp/GlobalOptions;->options:Lorg/apache/commons/cli/Options;

    .line 153
    invoke-virtual {v2}, Lorg/apache/commons/cli/HelpFormatter;->getLeftPadding()I

    move-result v6

    .line 154
    invoke-virtual {v2}, Lorg/apache/commons/cli/HelpFormatter;->getDescPadding()I

    move-result v7

    .line 149
    invoke-virtual/range {v2 .. v7}, Lorg/apache/commons/cli/HelpFormatter;->printOptions(Ljava/io/PrintWriter;ILorg/apache/commons/cli/Options;II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 156
    invoke-virtual {v3}, Ljava/io/PrintWriter;->flush()V

    .line 157
    nop

    .line 158
    return-void

    .line 156
    :catchall_0
    move-exception v0

    invoke-virtual {v3}, Ljava/io/PrintWriter;->flush()V

    .line 157
    throw v0
.end method

.method private static generatePluginMap(Ljava/lang/Iterable;)Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Lcom/facebook/stetho/dumpapp/DumperPlugin;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/stetho/dumpapp/DumperPlugin;",
            ">;"
        }
    .end annotation

    .line 47
    .local p0, "plugins":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/facebook/stetho/dumpapp/DumperPlugin;>;"
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 48
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/facebook/stetho/dumpapp/DumperPlugin;>;"
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/stetho/dumpapp/DumperPlugin;

    .line 49
    .local v2, "plugin":Lcom/facebook/stetho/dumpapp/DumperPlugin;
    invoke-interface {v2}, Lcom/facebook/stetho/dumpapp/DumperPlugin;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .end local v2    # "plugin":Lcom/facebook/stetho/dumpapp/DumperPlugin;
    goto :goto_0

    .line 51
    :cond_0
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public dump(Ljava/io/InputStream;Ljava/io/PrintStream;Ljava/io/PrintStream;[Ljava/lang/String;)I
    .locals 3
    .param p1, "input"    # Ljava/io/InputStream;
    .param p2, "out"    # Ljava/io/PrintStream;
    .param p3, "err"    # Ljava/io/PrintStream;
    .param p4, "args"    # [Ljava/lang/String;

    .line 67
    const/4 v0, 0x1

    :try_start_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/facebook/stetho/dumpapp/Dumper;->doDump(Ljava/io/InputStream;Ljava/io/PrintStream;Ljava/io/PrintStream;[Ljava/lang/String;)I

    move-result v0
    :try_end_0
    .catch Lorg/apache/commons/cli/ParseException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Lcom/facebook/stetho/dumpapp/DumpException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/facebook/stetho/dumpapp/DumpappOutputBrokenException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    .line 78
    :catch_0
    move-exception v1

    .line 79
    .local v1, "e":Ljava/lang/RuntimeException;
    invoke-virtual {v1, p3}, Ljava/lang/RuntimeException;->printStackTrace(Ljava/io/PrintStream;)V

    .line 80
    return v0

    .line 75
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :catch_1
    move-exception v0

    .line 77
    .local v0, "e":Lcom/facebook/stetho/dumpapp/DumpappOutputBrokenException;
    throw v0

    .line 72
    .end local v0    # "e":Lcom/facebook/stetho/dumpapp/DumpappOutputBrokenException;
    :catch_2
    move-exception v1

    .line 73
    .local v1, "e":Lcom/facebook/stetho/dumpapp/DumpException;
    invoke-virtual {v1}, Lcom/facebook/stetho/dumpapp/DumpException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 74
    return v0

    .line 68
    .end local v1    # "e":Lcom/facebook/stetho/dumpapp/DumpException;
    :catch_3
    move-exception v1

    .line 69
    .local v1, "e":Lorg/apache/commons/cli/ParseException;
    invoke-virtual {v1}, Lorg/apache/commons/cli/ParseException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 70
    invoke-direct {p0, p3}, Lcom/facebook/stetho/dumpapp/Dumper;->dumpUsage(Ljava/io/PrintStream;)V

    .line 71
    return v0
.end method
