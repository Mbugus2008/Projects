.class public Lcom/facebook/stetho/inspector/network/ResponseBodyFileManager;
.super Ljava/lang/Object;
.source "ResponseBodyFileManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/network/ResponseBodyFileManager$AsyncPrettyPrintingCallable;
    }
.end annotation


# static fields
.field private static final FILENAME_PREFIX:Ljava/lang/String; = "network-response-body-"

.field private static final PRETTY_PRINT_TIMEOUT_SEC:I = 0xa

.field private static final TAG:Ljava/lang/String; = "ResponseBodyFileManager"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mRequestIdMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseBodyFileManager;->mRequestIdMap:Ljava/util/Map;

    .line 48
    iput-object p1, p0, Lcom/facebook/stetho/inspector/network/ResponseBodyFileManager;->mContext:Landroid/content/Context;

    .line 49
    return-void
.end method

.method private static getFilename(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "requestId"    # Ljava/lang/String;

    .line 124
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "network-response-body-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private prettyPrintContentWithTimeOut(Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;Ljava/io/InputStream;)Ljava/lang/String;
    .locals 6
    .param p1, "asyncPrettyPrinter"    # Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;
    .param p2, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 90
    new-instance v0, Lcom/facebook/stetho/inspector/network/ResponseBodyFileManager$AsyncPrettyPrintingCallable;

    invoke-direct {v0, p0, p2, p1}, Lcom/facebook/stetho/inspector/network/ResponseBodyFileManager$AsyncPrettyPrintingCallable;-><init>(Lcom/facebook/stetho/inspector/network/ResponseBodyFileManager;Ljava/io/InputStream;Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;)V

    .line 93
    .local v0, "prettyPrintingCallable":Lcom/facebook/stetho/inspector/network/ResponseBodyFileManager$AsyncPrettyPrintingCallable;
    invoke-static {}, Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinterExecutorHolder;->getExecutorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    .line 94
    .local v1, "executorService":Ljava/util/concurrent/ExecutorService;
    if-nez v1, :cond_0

    .line 96
    const/4 v2, 0x0

    return-object v2

    .line 98
    :cond_0
    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v2

    .line 100
    .local v2, "future":Ljava/util/concurrent/Future;, "Ljava/util/concurrent/Future<Ljava/lang/String;>;"
    :try_start_0
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v4, 0xa

    invoke-static {v2, v4, v5, v3}, Lcom/facebook/stetho/common/Util;->getUninterruptibly(Ljava/util/concurrent/Future;JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;
    :try_end_0
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v3

    .line 105
    :catch_0
    move-exception v3

    .line 106
    .local v3, "e":Ljava/util/concurrent/ExecutionException;
    invoke-virtual {v3}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    .line 107
    .local v4, "cause":Ljava/lang/Throwable;
    const-class v5, Ljava/io/IOException;

    invoke-static {v4, v5}, Lcom/facebook/stetho/common/ExceptionUtil;->propagateIfInstanceOf(Ljava/lang/Throwable;Ljava/lang/Class;)V

    .line 108
    invoke-static {v4}, Lcom/facebook/stetho/common/ExceptionUtil;->propagate(Ljava/lang/Throwable;)Ljava/lang/RuntimeException;

    move-result-object v5

    throw v5

    .line 101
    .end local v3    # "e":Ljava/util/concurrent/ExecutionException;
    .end local v4    # "cause":Ljava/lang/Throwable;
    :catch_1
    move-exception v3

    .line 102
    .local v3, "e":Ljava/util/concurrent/TimeoutException;
    const/4 v4, 0x1

    invoke-interface {v2, v4}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 103
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Time out after 10 seconds of attempting to pretty print\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    .line 104
    invoke-static {p2}, Lcom/facebook/stetho/common/Util;->readAsUTF8(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 103
    return-object v4
.end method


# virtual methods
.method public associateAsyncPrettyPrinterWithId(Ljava/lang/String;Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;)V
    .locals 3
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "asyncPrettyPrinter"    # Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;

    .line 139
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseBodyFileManager;->mRequestIdMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_0

    .line 143
    return-void

    .line 140
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cannot associate different pretty printers with the same request id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public cleanupFiles()V
    .locals 7

    .line 52
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseBodyFileManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    const-string v3, "ResponseBodyFileManager"

    if-ge v2, v1, :cond_1

    aget-object v4, v0, v2

    .line 53
    .local v4, "file":Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    const-string v6, "network-response-body-"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 54
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    move-result v5

    if-nez v5, :cond_0

    .line 55
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to delete "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Lcom/facebook/stetho/common/LogRedirector;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .end local v4    # "file":Ljava/io/File;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 59
    :cond_1
    const-string v0, "Cleaned up temporary network files."

    invoke-static {v3, v0}, Lcom/facebook/stetho/common/LogRedirector;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    return-void
.end method

.method public openResponseBodyFile(Ljava/lang/String;Z)Ljava/io/OutputStream;
    .locals 3
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "base64Encode"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 114
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseBodyFileManager;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/facebook/stetho/inspector/network/ResponseBodyFileManager;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v0

    .line 115
    .local v0, "out":Ljava/io/OutputStream;
    invoke-virtual {v0, p2}, Ljava/io/OutputStream;->write(I)V

    .line 116
    if-eqz p2, :cond_0

    .line 117
    new-instance v1, Landroid/util/Base64OutputStream;

    invoke-direct {v1, v0, v2}, Landroid/util/Base64OutputStream;-><init>(Ljava/io/OutputStream;I)V

    return-object v1

    .line 119
    :cond_0
    return-object v0
.end method

.method public readFile(Ljava/lang/String;)Lcom/facebook/stetho/inspector/network/ResponseBodyData;
    .locals 5
    .param p1, "requestId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 63
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseBodyFileManager;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/facebook/stetho/inspector/network/ResponseBodyFileManager;->getFilename(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v0

    .line 65
    .local v0, "in":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v1

    .line 66
    .local v1, "firstByte":I
    const/4 v2, -0x1

    if-eq v1, v2, :cond_2

    .line 69
    new-instance v2, Lcom/facebook/stetho/inspector/network/ResponseBodyData;

    invoke-direct {v2}, Lcom/facebook/stetho/inspector/network/ResponseBodyData;-><init>()V

    .line 70
    .local v2, "bodyData":Lcom/facebook/stetho/inspector/network/ResponseBodyData;
    if-eqz v1, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    iput-boolean v3, v2, Lcom/facebook/stetho/inspector/network/ResponseBodyData;->base64Encoded:Z

    .line 72
    iget-object v3, p0, Lcom/facebook/stetho/inspector/network/ResponseBodyFileManager;->mRequestIdMap:Ljava/util/Map;

    invoke-interface {v3, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;

    .line 73
    .local v3, "asyncPrettyPrinter":Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;
    if-eqz v3, :cond_1

    .line 76
    invoke-direct {p0, v3, v0}, Lcom/facebook/stetho/inspector/network/ResponseBodyFileManager;->prettyPrintContentWithTimeOut(Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lcom/facebook/stetho/inspector/network/ResponseBodyData;->data:Ljava/lang/String;

    goto :goto_1

    .line 78
    :cond_1
    invoke-static {v0}, Lcom/facebook/stetho/common/Util;->readAsUTF8(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lcom/facebook/stetho/inspector/network/ResponseBodyData;->data:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    :goto_1
    nop

    .line 83
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 80
    return-object v2

    .line 67
    .end local v2    # "bodyData":Lcom/facebook/stetho/inspector/network/ResponseBodyData;
    .end local v3    # "asyncPrettyPrinter":Lcom/facebook/stetho/inspector/network/AsyncPrettyPrinter;
    :cond_2
    :try_start_1
    new-instance v2, Ljava/io/EOFException;

    const-string v3, "Failed to read base64Encode byte"

    invoke-direct {v2, v3}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .end local v0    # "in":Ljava/io/InputStream;
    .end local p1    # "requestId":Ljava/lang/String;
    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 83
    .end local v1    # "firstByte":I
    .restart local v0    # "in":Ljava/io/InputStream;
    .restart local p1    # "requestId":Ljava/lang/String;
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 84
    throw v1
.end method
