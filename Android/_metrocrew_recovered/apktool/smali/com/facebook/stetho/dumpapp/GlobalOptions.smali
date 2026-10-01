.class public Lcom/facebook/stetho/dumpapp/GlobalOptions;
.super Ljava/lang/Object;
.source "GlobalOptions.java"


# instance fields
.field public final optionHelp:Lorg/apache/commons/cli/Option;

.field public final optionListPlugins:Lorg/apache/commons/cli/Option;

.field public final optionProcess:Lorg/apache/commons/cli/Option;

.field public final options:Lorg/apache/commons/cli/Options;


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    new-instance v0, Lorg/apache/commons/cli/Option;

    const-string v1, "Print this help"

    const-string v2, "h"

    const-string v3, "help"

    const/4 v4, 0x0

    invoke-direct {v0, v2, v3, v4, v1}, Lorg/apache/commons/cli/Option;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    iput-object v0, p0, Lcom/facebook/stetho/dumpapp/GlobalOptions;->optionHelp:Lorg/apache/commons/cli/Option;

    .line 15
    new-instance v0, Lorg/apache/commons/cli/Option;

    const-string v1, "list"

    const-string v2, "List available plugins"

    const-string v3, "l"

    invoke-direct {v0, v3, v1, v4, v2}, Lorg/apache/commons/cli/Option;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    iput-object v0, p0, Lcom/facebook/stetho/dumpapp/GlobalOptions;->optionListPlugins:Lorg/apache/commons/cli/Option;

    .line 22
    new-instance v0, Lorg/apache/commons/cli/Option;

    const/4 v1, 0x1

    const-string v2, "Specify target process"

    const-string v3, "p"

    const-string v4, "process"

    invoke-direct {v0, v3, v4, v1, v2}, Lorg/apache/commons/cli/Option;-><init>(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;)V

    iput-object v0, p0, Lcom/facebook/stetho/dumpapp/GlobalOptions;->optionProcess:Lorg/apache/commons/cli/Option;

    .line 27
    new-instance v0, Lorg/apache/commons/cli/Options;

    invoke-direct {v0}, Lorg/apache/commons/cli/Options;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/dumpapp/GlobalOptions;->options:Lorg/apache/commons/cli/Options;

    .line 28
    iget-object v0, p0, Lcom/facebook/stetho/dumpapp/GlobalOptions;->options:Lorg/apache/commons/cli/Options;

    iget-object v1, p0, Lcom/facebook/stetho/dumpapp/GlobalOptions;->optionHelp:Lorg/apache/commons/cli/Option;

    invoke-virtual {v0, v1}, Lorg/apache/commons/cli/Options;->addOption(Lorg/apache/commons/cli/Option;)Lorg/apache/commons/cli/Options;

    .line 29
    iget-object v0, p0, Lcom/facebook/stetho/dumpapp/GlobalOptions;->options:Lorg/apache/commons/cli/Options;

    iget-object v1, p0, Lcom/facebook/stetho/dumpapp/GlobalOptions;->optionListPlugins:Lorg/apache/commons/cli/Option;

    invoke-virtual {v0, v1}, Lorg/apache/commons/cli/Options;->addOption(Lorg/apache/commons/cli/Option;)Lorg/apache/commons/cli/Options;

    .line 30
    iget-object v0, p0, Lcom/facebook/stetho/dumpapp/GlobalOptions;->options:Lorg/apache/commons/cli/Options;

    iget-object v1, p0, Lcom/facebook/stetho/dumpapp/GlobalOptions;->optionProcess:Lorg/apache/commons/cli/Option;

    invoke-virtual {v0, v1}, Lorg/apache/commons/cli/Options;->addOption(Lorg/apache/commons/cli/Option;)Lorg/apache/commons/cli/Options;

    .line 31
    return-void
.end method
