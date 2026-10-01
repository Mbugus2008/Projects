.class public Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;
.super Ljava/lang/Object;
.source "FilesDumperPlugin.java"

# interfaces
.implements Lcom/facebook/stetho/dumpapp/DumperPlugin;


# static fields
.field private static final NAME:Ljava/lang/String; = "files"


# instance fields
.field private final mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->mContext:Landroid/content/Context;

    .line 39
    return-void
.end method

.method private addFiles(Ljava/util/zip/ZipOutputStream;[B[Ljava/io/File;)V
    .locals 5
    .param p1, "output"    # Ljava/util/zip/ZipOutputStream;
    .param p2, "buf"    # [B
    .param p3, "files"    # [Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 156
    array-length v0, p3

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p3, v1

    .line 157
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 158
    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    invoke-direct {p0, p1, p2, v3}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->addFiles(Ljava/util/zip/ZipOutputStream;[B[Ljava/io/File;)V

    goto :goto_1

    .line 160
    :cond_0
    new-instance v3, Ljava/util/zip/ZipEntry;

    iget-object v4, p0, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->mContext:Landroid/content/Context;

    .line 163
    invoke-static {v4}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->getBaseDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    .line 162
    invoke-static {v4, v2}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->relativizePath(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/util/zip/ZipEntry;-><init>(Ljava/lang/String;)V

    .line 160
    invoke-virtual {p1, v3}, Ljava/util/zip/ZipOutputStream;->putNextEntry(Ljava/util/zip/ZipEntry;)V

    .line 165
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 167
    .local v3, "input":Ljava/io/FileInputStream;
    :try_start_0
    invoke-static {v3, p1, p2}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;[B)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 169
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    .line 170
    nop

    .line 156
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "input":Ljava/io/FileInputStream;
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 169
    .restart local v2    # "file":Ljava/io/File;
    .restart local v3    # "input":Ljava/io/FileInputStream;
    :catchall_0
    move-exception v0

    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    .line 170
    throw v0

    .line 173
    .end local v2    # "file":Ljava/io/File;
    .end local v3    # "input":Ljava/io/FileInputStream;
    :cond_1
    return-void
.end method

.method private static copy(Ljava/io/InputStream;Ljava/io/OutputStream;[B)V
    .locals 2
    .param p0, "in"    # Ljava/io/InputStream;
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "buf"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 177
    nop

    :goto_0
    invoke-virtual {p0, p2}, Ljava/io/InputStream;->read([B)I

    move-result v0

    move v1, v0

    .local v1, "n":I
    if-ltz v0, :cond_0

    .line 178
    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0, v1}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_0

    .line 180
    :cond_0
    return-void
.end method

.method private doDownload(Ljava/io/PrintStream;Ljava/util/Iterator;)V
    .locals 9
    .param p1, "writer"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/PrintStream;",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/dumpapp/DumpUsageException;
        }
    .end annotation

    .line 117
    .local p2, "remainingArgs":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    const-string v0, "Must specify output file or \'-\'"

    invoke-static {p2, v0}, Lcom/facebook/stetho/dumpapp/ArgsHelper;->nextArg(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 118
    .local v0, "outputPath":Ljava/lang/String;
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 119
    .local v1, "selectedFiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 120
    iget-object v2, p0, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->mContext:Landroid/content/Context;

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->resolvePossibleAppStoragePath(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 125
    :cond_0
    :try_start_0
    const-string v2, "-"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 126
    move-object v2, p1

    .local v2, "outputStream":Ljava/io/OutputStream;
    goto :goto_1

    .line 128
    .end local v2    # "outputStream":Ljava/io/OutputStream;
    :cond_1
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-static {v0}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->resolvePossibleSdcardPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 130
    .restart local v2    # "outputStream":Ljava/io/OutputStream;
    :goto_1
    new-instance v3, Ljava/util/zip/ZipOutputStream;

    new-instance v4, Ljava/io/BufferedOutputStream;

    invoke-direct {v4, v2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v3, v4}, Ljava/util/zip/ZipOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 131
    .local v3, "output":Ljava/util/zip/ZipOutputStream;
    const/4 v4, 0x0

    .line 133
    .local v4, "success":Z
    const/16 v5, 0x800

    const/4 v6, 0x1

    const/4 v7, 0x0

    :try_start_1
    new-array v5, v5, [B

    .line 134
    .local v5, "buf":[B
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-lez v8, :cond_2

    .line 135
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v8, v8, [Ljava/io/File;

    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/io/File;

    invoke-direct {p0, v3, v5, v8}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->addFiles(Ljava/util/zip/ZipOutputStream;[B[Ljava/io/File;)V

    goto :goto_2

    .line 137
    :cond_2
    iget-object v8, p0, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->mContext:Landroid/content/Context;

    invoke-static {v8}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->getBaseDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v8

    invoke-direct {p0, v3, v5, v8}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->addFiles(Ljava/util/zip/ZipOutputStream;[B[Ljava/io/File;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 139
    :goto_2
    const/4 v4, 0x1

    .line 142
    .end local v5    # "buf":[B
    :try_start_2
    invoke-virtual {v3}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 148
    goto :goto_4

    .line 143
    :catch_0
    move-exception v5

    .line 144
    .local v5, "e":Ljava/io/IOException;
    if-nez v4, :cond_3

    goto :goto_3

    :cond_3
    move v6, v7

    :goto_3
    :try_start_3
    invoke-static {v2, v6}, Lcom/facebook/stetho/common/Util;->close(Ljava/io/Closeable;Z)V

    .line 145
    if-nez v4, :cond_4

    .line 149
    .end local v5    # "e":Ljava/io/IOException;
    nop

    .line 152
    .end local v2    # "outputStream":Ljava/io/OutputStream;
    .end local v3    # "output":Ljava/util/zip/ZipOutputStream;
    .end local v4    # "success":Z
    :goto_4
    nop

    .line 153
    return-void

    .line 146
    .restart local v2    # "outputStream":Ljava/io/OutputStream;
    .restart local v3    # "output":Ljava/util/zip/ZipOutputStream;
    .restart local v4    # "success":Z
    .restart local v5    # "e":Ljava/io/IOException;
    :cond_4
    nop

    .end local v0    # "outputPath":Ljava/lang/String;
    .end local v1    # "selectedFiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    .end local p1    # "writer":Ljava/io/PrintStream;
    .end local p2    # "remainingArgs":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    throw v5
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 141
    .end local v5    # "e":Ljava/io/IOException;
    .restart local v0    # "outputPath":Ljava/lang/String;
    .restart local v1    # "selectedFiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    .restart local p1    # "writer":Ljava/io/PrintStream;
    .restart local p2    # "remainingArgs":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :catchall_0
    move-exception v5

    .line 142
    :try_start_4
    invoke-virtual {v3}, Ljava/util/zip/ZipOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 148
    goto :goto_6

    .line 143
    :catch_1
    move-exception v8

    .line 144
    .local v8, "e":Ljava/io/IOException;
    if-nez v4, :cond_5

    goto :goto_5

    :cond_5
    move v6, v7

    :goto_5
    :try_start_5
    invoke-static {v2, v6}, Lcom/facebook/stetho/common/Util;->close(Ljava/io/Closeable;Z)V

    .line 145
    if-eqz v4, :cond_6

    .line 146
    nop

    .end local v0    # "outputPath":Ljava/lang/String;
    .end local v1    # "selectedFiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    .end local p1    # "writer":Ljava/io/PrintStream;
    .end local p2    # "remainingArgs":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    throw v8

    .line 149
    .end local v8    # "e":Ljava/io/IOException;
    .restart local v0    # "outputPath":Ljava/lang/String;
    .restart local v1    # "selectedFiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    .restart local p1    # "writer":Ljava/io/PrintStream;
    .restart local p2    # "remainingArgs":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_6
    :goto_6
    nop

    .end local v0    # "outputPath":Ljava/lang/String;
    .end local v1    # "selectedFiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    .end local p1    # "writer":Ljava/io/PrintStream;
    .end local p2    # "remainingArgs":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    throw v5
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 150
    .end local v2    # "outputStream":Ljava/io/OutputStream;
    .end local v3    # "output":Ljava/util/zip/ZipOutputStream;
    .end local v4    # "success":Z
    .restart local v0    # "outputPath":Ljava/lang/String;
    .restart local v1    # "selectedFiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/io/File;>;"
    .restart local p1    # "writer":Ljava/io/PrintStream;
    .restart local p2    # "remainingArgs":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :catch_2
    move-exception v2

    .line 151
    .local v2, "e":Ljava/io/IOException;
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3
.end method

.method private doLs(Ljava/io/PrintStream;)V
    .locals 2
    .param p1, "writer"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/dumpapp/DumpUsageException;
        }
    .end annotation

    .line 66
    iget-object v0, p0, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->getBaseDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 67
    .local v0, "baseDir":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 68
    const-string v1, ""

    invoke-static {v0, v1, p1}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->printDirectoryText(Ljava/io/File;Ljava/lang/String;Ljava/io/PrintStream;)V

    .line 70
    :cond_0
    return-void
.end method

.method private doTree(Ljava/io/PrintStream;)V
    .locals 2
    .param p1, "writer"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/dumpapp/DumpUsageException;
        }
    .end annotation

    .line 73
    iget-object v0, p0, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->getBaseDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    .line 74
    .local v0, "baseDir":Ljava/io/File;
    const/4 v1, 0x0

    invoke-static {v0, v1, p1}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->printDirectoryVisual(Ljava/io/File;ILjava/io/PrintStream;)V

    .line 75
    return-void
.end method

.method private doUsage(Ljava/io/PrintStream;)V
    .locals 5
    .param p1, "writer"    # Ljava/io/PrintStream;

    .line 211
    const-string v0, "dumpapp files"

    .line 213
    .local v0, "cmdName":Ljava/lang/String;
    const-string v1, "Usage: dumpapp files "

    .line 214
    .local v1, "usagePrefix":Ljava/lang/String;
    const-string v2, "       dumpapp files "

    .line 215
    .local v2, "blankPrefix":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "<command> [command-options]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 216
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "ls"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 217
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, "tree"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 218
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "download <output.zip> [<path>...]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 219
    invoke-virtual {p1}, Ljava/io/PrintStream;->println()V

    .line 220
    const-string v3, "dumpapp files ls: List files similar to the ls command"

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 221
    invoke-virtual {p1}, Ljava/io/PrintStream;->println()V

    .line 222
    const-string v3, "dumpapp files tree: List files similar to the tree command"

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 223
    invoke-virtual {p1}, Ljava/io/PrintStream;->println()V

    .line 224
    const-string v3, "dumpapp files download: Fetch internal application storage"

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 225
    const-string v3, "    <output.zip>: Output location or \'-\' for stdout"

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 226
    const-string v3, "    <path>: Fetch only those paths named (directories fetch recursively)"

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 227
    return-void
.end method

.method private static getBaseDir(Landroid/content/Context;)Ljava/io/File;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .line 79
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method private static printDirectoryText(Ljava/io/File;Ljava/lang/String;Ljava/io/PrintStream;)V
    .locals 5
    .param p0, "dir"    # Ljava/io/File;
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "writer"    # Ljava/io/PrintStream;

    .line 83
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 84
    .local v0, "listFiles":[Ljava/io/File;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 85
    aget-object v2, v0, v1

    .line 86
    .local v2, "file":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 87
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, p2}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->printDirectoryText(Ljava/io/File;Ljava/lang/String;Ljava/io/PrintStream;)V

    goto :goto_1

    .line 89
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 84
    .end local v2    # "file":Ljava/io/File;
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 92
    .end local v1    # "i":I
    :cond_1
    return-void
.end method

.method private static printDirectoryVisual(Ljava/io/File;ILjava/io/PrintStream;)V
    .locals 4
    .param p0, "dir"    # Ljava/io/File;
    .param p1, "depth"    # I
    .param p2, "writer"    # Ljava/io/PrintStream;

    .line 95
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    .line 96
    .local v0, "listFiles":[Ljava/io/File;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_1

    .line 97
    invoke-static {p1, p2}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->printHeaderVisual(ILjava/io/PrintStream;)V

    .line 98
    aget-object v2, v0, v1

    .line 99
    .local v2, "file":Ljava/io/File;
    const-string v3, "+---"

    invoke-virtual {p2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 100
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 101
    invoke-virtual {p2}, Ljava/io/PrintStream;->println()V

    .line 103
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 104
    add-int/lit8 v3, p1, 0x1

    invoke-static {v2, v3, p2}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->printDirectoryVisual(Ljava/io/File;ILjava/io/PrintStream;)V

    .line 96
    .end local v2    # "file":Ljava/io/File;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 107
    .end local v1    # "i":I
    :cond_1
    return-void
.end method

.method private static printHeaderVisual(ILjava/io/PrintStream;)V
    .locals 2
    .param p0, "depth"    # I
    .param p1, "writer"    # Ljava/io/PrintStream;

    .line 110
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p0, :cond_0

    .line 111
    const-string/jumbo v1, "|   "

    invoke-virtual {p1, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 110
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 113
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method private static relativizePath(Ljava/io/File;Ljava/io/File;)Ljava/lang/String;
    .locals 3
    .param p0, "base"    # Ljava/io/File;
    .param p1, "path"    # Ljava/io/File;

    .line 184
    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    .line 185
    .local v0, "baseStr":Ljava/lang/String;
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 187
    .local v1, "pathStr":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 188
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 190
    :cond_0
    return-object v1
.end method

.method private static resolvePossibleAppStoragePath(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "path"    # Ljava/lang/String;

    .line 195
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 196
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0

    .line 198
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-static {p0}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->getBaseDir(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method

.method private static resolvePossibleSdcardPath(Ljava/lang/String;)Ljava/io/File;
    .locals 2
    .param p0, "path"    # Ljava/lang/String;

    .line 203
    const-string v0, "/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 204
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v0

    .line 206
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public dump(Lcom/facebook/stetho/dumpapp/DumperContext;)V
    .locals 5
    .param p1, "dumpContext"    # Lcom/facebook/stetho/dumpapp/DumperContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/dumpapp/DumpException;
        }
    .end annotation

    .line 48
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/DumperContext;->getArgsAsList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 50
    .local v0, "args":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    const-string v1, ""

    invoke-static {v0, v1}, Lcom/facebook/stetho/dumpapp/ArgsHelper;->nextOptionalArg(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 51
    .local v2, "command":Ljava/lang/String;
    const-string v3, "ls"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 52
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/DumperContext;->getStdout()Ljava/io/PrintStream;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->doLs(Ljava/io/PrintStream;)V

    goto :goto_0

    .line 53
    :cond_0
    const-string/jumbo v3, "tree"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 54
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/DumperContext;->getStdout()Ljava/io/PrintStream;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->doTree(Ljava/io/PrintStream;)V

    goto :goto_0

    .line 55
    :cond_1
    const-string v3, "download"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 56
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/DumperContext;->getStdout()Ljava/io/PrintStream;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->doDownload(Ljava/io/PrintStream;Ljava/util/Iterator;)V

    goto :goto_0

    .line 58
    :cond_2
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/DumperContext;->getStdout()Ljava/io/PrintStream;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/facebook/stetho/dumpapp/plugins/FilesDumperPlugin;->doUsage(Ljava/io/PrintStream;)V

    .line 59
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 63
    :goto_0
    return-void

    .line 60
    :cond_3
    new-instance v1, Lcom/facebook/stetho/dumpapp/DumpUsageException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unknown command: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/facebook/stetho/dumpapp/DumpUsageException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 43
    const-string v0, "files"

    return-object v0
.end method
