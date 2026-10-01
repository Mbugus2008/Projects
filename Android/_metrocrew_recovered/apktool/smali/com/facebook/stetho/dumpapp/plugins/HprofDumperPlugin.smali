.class public Lcom/facebook/stetho/dumpapp/plugins/HprofDumperPlugin;
.super Ljava/lang/Object;
.source "HprofDumperPlugin.java"

# interfaces
.implements Lcom/facebook/stetho/dumpapp/DumperPlugin;


# static fields
.field private static final NAME:Ljava/lang/String; = "hprof"


# instance fields
.field private final mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/facebook/stetho/dumpapp/plugins/HprofDumperPlugin;->mContext:Landroid/content/Context;

    .line 40
    return-void
.end method

.method private handlePipeOutput(Ljava/io/OutputStream;)V
    .locals 5
    .param p1, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/dumpapp/DumpException;
        }
    .end annotation

    .line 70
    iget-object v0, p0, Lcom/facebook/stetho/dumpapp/plugins/HprofDumperPlugin;->mContext:Landroid/content/Context;

    const-string v1, "hprof-dump.hprof"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 72
    .local v0, "hprofFile":Ljava/io/File;
    :try_start_0
    invoke-direct {p0, v0}, Lcom/facebook/stetho/dumpapp/plugins/HprofDumperPlugin;->writeHprof(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 74
    :try_start_1
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 76
    .local v1, "input":Ljava/io/InputStream;
    const/16 v2, 0x800

    :try_start_2
    new-array v2, v2, [B

    invoke-static {v1, p1, v2}, Lcom/facebook/stetho/common/Util;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;[B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 78
    :try_start_3
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 79
    nop

    .line 82
    .end local v1    # "input":Ljava/io/InputStream;
    nop

    .line 84
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 85
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 88
    :cond_0
    return-void

    .line 78
    .restart local v1    # "input":Ljava/io/InputStream;
    :catchall_0
    move-exception v2

    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 79
    nop

    .end local v0    # "hprofFile":Ljava/io/File;
    .end local p1    # "output":Ljava/io/OutputStream;
    throw v2
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 80
    .end local v1    # "input":Ljava/io/InputStream;
    .restart local v0    # "hprofFile":Ljava/io/File;
    .restart local p1    # "output":Ljava/io/OutputStream;
    :catch_0
    move-exception v1

    .line 81
    .local v1, "e":Ljava/io/IOException;
    :try_start_5
    new-instance v2, Lcom/facebook/stetho/dumpapp/DumpException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failure copying "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " to dumper output"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/facebook/stetho/dumpapp/DumpException;-><init>(Ljava/lang/String;)V

    .end local v0    # "hprofFile":Ljava/io/File;
    .end local p1    # "output":Ljava/io/OutputStream;
    throw v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 84
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v0    # "hprofFile":Ljava/io/File;
    .restart local p1    # "output":Ljava/io/OutputStream;
    :catchall_1
    move-exception v1

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 85
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 87
    :cond_1
    throw v1
.end method

.method private static truncateAndDeleteFile(Ljava/io/File;)V
    .locals 4
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 102
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 103
    .local v0, "out":Ljava/io/FileOutputStream;
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    .line 104
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 107
    return-void

    .line 105
    :cond_0
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to delete "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private usage(Ljava/io/PrintStream;)V
    .locals 2
    .param p1, "output"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/dumpapp/DumpUsageException;
        }
    .end annotation

    .line 110
    const-string v0, "Usage: dumpapp hprof [ path ]"

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 111
    const-string v0, "Dump HPROF memory usage data from the running application."

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 112
    invoke-virtual {p1}, Ljava/io/PrintStream;->println()V

    .line 113
    const-string v0, "Where path can be any of:"

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 114
    const-string v0, "  -           Output directly to stdout"

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 115
    const-string v0, "  <path>      Full path to a writable file on the device"

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 116
    const-string v0, "  <filename>  Relative filename that will be stored in the app internal storage"

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 117
    new-instance v0, Lcom/facebook/stetho/dumpapp/DumpUsageException;

    const-string v1, "Missing path"

    invoke-direct {v0, v1}, Lcom/facebook/stetho/dumpapp/DumpUsageException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private writeHprof(Ljava/io/File;)V
    .locals 4
    .param p1, "outputPath"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/dumpapp/DumpException;
        }
    .end annotation

    .line 94
    :try_start_0
    invoke-static {p1}, Lcom/facebook/stetho/dumpapp/plugins/HprofDumperPlugin;->truncateAndDeleteFile(Ljava/io/File;)V

    .line 95
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/os/Debug;->dumpHprofData(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    nop

    .line 99
    return-void

    .line 96
    :catch_0
    move-exception v0

    .line 97
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lcom/facebook/stetho/dumpapp/DumpException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failure writing to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/facebook/stetho/dumpapp/DumpException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public dump(Lcom/facebook/stetho/dumpapp/DumperContext;)V
    .locals 6
    .param p1, "dumpContext"    # Lcom/facebook/stetho/dumpapp/DumperContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/dumpapp/DumpException;
        }
    .end annotation

    .line 49
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/DumperContext;->getStdout()Ljava/io/PrintStream;

    move-result-object v0

    .line 51
    .local v0, "output":Ljava/io/PrintStream;
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/DumperContext;->getArgsAsList()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 52
    .local v1, "argsIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    .line 53
    .local v2, "outputPath":Ljava/lang/String;
    :goto_0
    if-nez v2, :cond_1

    .line 54
    invoke-direct {p0, v0}, Lcom/facebook/stetho/dumpapp/plugins/HprofDumperPlugin;->usage(Ljava/io/PrintStream;)V

    goto :goto_1

    .line 56
    :cond_1
    const-string v3, "-"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 57
    invoke-direct {p0, v0}, Lcom/facebook/stetho/dumpapp/plugins/HprofDumperPlugin;->handlePipeOutput(Ljava/io/OutputStream;)V

    goto :goto_1

    .line 59
    :cond_2
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 60
    .local v3, "outputFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->isAbsolute()Z

    move-result v4

    if-nez v4, :cond_3

    .line 61
    iget-object v4, p0, Lcom/facebook/stetho/dumpapp/plugins/HprofDumperPlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v4, v2}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    .line 63
    :cond_3
    invoke-direct {p0, v3}, Lcom/facebook/stetho/dumpapp/plugins/HprofDumperPlugin;->writeHprof(Ljava/io/File;)V

    .line 64
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Wrote to "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 67
    .end local v3    # "outputFile":Ljava/io/File;
    :goto_1
    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 44
    const-string v0, "hprof"

    return-object v0
.end method
