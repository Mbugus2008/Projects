.class public final Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;
.super Ljava/io/FilterInputStream;
.source "ResponseHandlingInputStream.java"


# static fields
.field private static final BUFFER_SIZE:I = 0x400

.field public static final TAG:Ljava/lang/String; = "ResponseHandlingInputStream"


# instance fields
.field private mClosed:Z

.field private final mDecompressedCounter:Lcom/facebook/stetho/inspector/network/CountingOutputStream;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mEofSeen:Z

.field private mLastDecompressedCount:J

.field private final mNetworkPeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

.field private final mOutputStream:Ljava/io/OutputStream;

.field private final mRequestId:Ljava/lang/String;

.field private final mResponseHandler:Lcom/facebook/stetho/inspector/network/ResponseHandler;

.field private mSkipBuffer:[B
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/OutputStream;Lcom/facebook/stetho/inspector/network/CountingOutputStream;Lcom/facebook/stetho/inspector/helper/ChromePeerManager;Lcom/facebook/stetho/inspector/network/ResponseHandler;)V
    .locals 2
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .param p2, "requestId"    # Ljava/lang/String;
    .param p3, "outputStream"    # Ljava/io/OutputStream;
    .param p4, "decompressedCounter"    # Lcom/facebook/stetho/inspector/network/CountingOutputStream;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "networkPeerManager"    # Lcom/facebook/stetho/inspector/helper/ChromePeerManager;
    .param p6, "responseHandler"    # Lcom/facebook/stetho/inspector/network/ResponseHandler;

    .line 76
    invoke-direct {p0, p1}, Ljava/io/FilterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 55
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mLastDecompressedCount:J

    .line 77
    iput-object p2, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mRequestId:Ljava/lang/String;

    .line 78
    iput-object p3, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mOutputStream:Ljava/io/OutputStream;

    .line 79
    iput-object p4, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mDecompressedCounter:Lcom/facebook/stetho/inspector/network/CountingOutputStream;

    .line 80
    iput-object p5, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mNetworkPeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    .line 81
    iput-object p6, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mResponseHandler:Lcom/facebook/stetho/inspector/network/ResponseHandler;

    .line 82
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mClosed:Z

    .line 83
    return-void
.end method

.method private declared-synchronized checkEOF(I)I
    .locals 1
    .param p1, "n"    # I

    monitor-enter p0

    .line 86
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 87
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->closeOutputStreamQuietly()V

    .line 88
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mResponseHandler:Lcom/facebook/stetho/inspector/network/ResponseHandler;

    invoke-interface {v0}, Lcom/facebook/stetho/inspector/network/ResponseHandler;->onEOF()V

    .line 89
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mEofSeen:Z

    goto :goto_0

    .line 85
    .end local p0    # "this":Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;
    .end local p1    # "n":I
    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 91
    .restart local p1    # "n":I
    :cond_0
    :goto_0
    monitor-exit p0

    return p1
.end method

.method private declared-synchronized closeOutputStreamQuietly()V
    .locals 7

    monitor-enter p0

    .line 197
    :try_start_0
    iget-boolean v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mClosed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez v0, :cond_0

    .line 199
    const/4 v0, 0x1

    :try_start_1
    iget-object v1, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mOutputStream:Ljava/io/OutputStream;

    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 200
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->reportDecodedSizeIfApplicable()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 208
    :try_start_2
    iput-boolean v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mClosed:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 209
    goto :goto_1

    .line 208
    .end local p0    # "this":Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;
    :catchall_0
    move-exception v1

    goto :goto_0

    .line 201
    :catch_0
    move-exception v1

    .line 202
    .local v1, "e":Ljava/io/IOException;
    :try_start_3
    iget-object v2, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mNetworkPeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    sget-object v3, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;->ERROR:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;

    sget-object v4, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->NETWORK:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Could not close the output stream"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v3, v4, v5}, Lcom/facebook/stetho/inspector/console/CLog;->writeToConsole(Lcom/facebook/stetho/inspector/helper/ChromePeerManager;Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 208
    .end local v1    # "e":Ljava/io/IOException;
    :try_start_4
    iput-boolean v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mClosed:Z

    .line 209
    goto :goto_1

    .line 208
    :goto_0
    iput-boolean v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mClosed:Z

    .line 209
    throw v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 211
    :cond_0
    :goto_1
    monitor-exit p0

    return-void

    .line 196
    :catchall_1
    move-exception v0

    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v0
.end method

.method private getSkipBufferLocked()[B
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 145
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mSkipBuffer:[B

    if-nez v0, :cond_0

    .line 146
    const/16 v0, 0x400

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mSkipBuffer:[B

    .line 149
    :cond_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mSkipBuffer:[B

    return-object v0
.end method

.method private handleIOException(Ljava/io/IOException;)Ljava/io/IOException;
    .locals 1
    .param p1, "ex"    # Ljava/io/IOException;

    .line 220
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mResponseHandler:Lcom/facebook/stetho/inspector/network/ResponseHandler;

    invoke-interface {v0, p1}, Lcom/facebook/stetho/inspector/network/ResponseHandler;->onError(Ljava/io/IOException;)V

    .line 221
    return-object p1
.end method

.method private handleIOExceptionWritingToStream(Ljava/io/IOException;)V
    .locals 5
    .param p1, "e"    # Ljava/io/IOException;

    .line 268
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mNetworkPeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    sget-object v1, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;->ERROR:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;

    sget-object v2, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->NETWORK:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not write response body to the stream "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/facebook/stetho/inspector/console/CLog;->writeToConsole(Lcom/facebook/stetho/inspector/helper/ChromePeerManager;Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;Ljava/lang/String;)V

    .line 274
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->closeOutputStreamQuietly()V

    .line 275
    return-void
.end method

.method private reportDecodedSizeIfApplicable()V
    .locals 4

    .line 225
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mDecompressedCounter:Lcom/facebook/stetho/inspector/network/CountingOutputStream;

    if-eqz v0, :cond_0

    .line 226
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mDecompressedCounter:Lcom/facebook/stetho/inspector/network/CountingOutputStream;

    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/network/CountingOutputStream;->getCount()J

    move-result-wide v0

    .line 227
    .local v0, "currentCount":J
    iget-wide v2, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mLastDecompressedCount:J

    sub-long v2, v0, v2

    long-to-int v2, v2

    .line 228
    .local v2, "delta":I
    iget-object v3, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mResponseHandler:Lcom/facebook/stetho/inspector/network/ResponseHandler;

    invoke-interface {v3, v2}, Lcom/facebook/stetho/inspector/network/ResponseHandler;->onReadDecoded(I)V

    .line 229
    iput-wide v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mLastDecompressedCount:J

    .line 231
    .end local v0    # "currentCount":J
    .end local v2    # "delta":I
    :cond_0
    return-void
.end method

.method private declared-synchronized writeToOutputStream(I)V
    .locals 1
    .param p1, "oneByte"    # I

    monitor-enter p0

    .line 239
    :try_start_0
    iget-boolean v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mClosed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 240
    monitor-exit p0

    return-void

    .line 244
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mOutputStream:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write(I)V

    .line 245
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->reportDecodedSizeIfApplicable()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 248
    goto :goto_0

    .line 246
    .end local p0    # "this":Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;
    :catch_0
    move-exception v0

    .line 247
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    invoke-direct {p0, v0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->handleIOExceptionWritingToStream(Ljava/io/IOException;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 249
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    monitor-exit p0

    return-void

    .line 238
    .end local p1    # "oneByte":I
    :catchall_0
    move-exception p1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw p1
.end method

.method private declared-synchronized writeToOutputStream([BII)V
    .locals 1
    .param p1, "b"    # [B
    .param p2, "offset"    # I
    .param p3, "count"    # I

    monitor-enter p0

    .line 255
    :try_start_0
    iget-boolean v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mClosed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 256
    monitor-exit p0

    return-void

    .line 260
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mOutputStream:Ljava/io/OutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 261
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->reportDecodedSizeIfApplicable()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 264
    goto :goto_0

    .line 262
    .end local p0    # "this":Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;
    :catch_0
    move-exception v0

    .line 263
    .local v0, "e":Ljava/io/IOException;
    :try_start_2
    invoke-direct {p0, v0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->handleIOExceptionWritingToStream(Ljava/io/IOException;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 265
    .end local v0    # "e":Ljava/io/IOException;
    :goto_0
    monitor-exit p0

    return-void

    .line 254
    .end local p1    # "b":[B
    .end local p2    # "offset":I
    .end local p3    # "count":I
    :catchall_0
    move-exception p1

    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw p1
.end method


# virtual methods
.method public close()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 171
    const-wide/16 v0, 0x0

    .line 172
    .local v0, "bytesRead":J
    :try_start_0
    iget-boolean v2, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mEofSeen:Z

    if-nez v2, :cond_0

    .line 173
    const/16 v2, 0x400

    new-array v2, v2, [B

    .line 175
    .local v2, "buffer":[B
    :goto_0
    invoke-virtual {p0, v2}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->read([B)I

    move-result v3

    move v4, v3

    .local v4, "count":I
    const/4 v5, -0x1

    if-eq v3, v5, :cond_0

    .line 176
    int-to-long v5, v4

    add-long/2addr v0, v5

    goto :goto_0

    .line 179
    .end local v2    # "buffer":[B
    .end local v4    # "count":I
    :cond_0
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_1

    .line 180
    iget-object v2, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mNetworkPeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    sget-object v3, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;->ERROR:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;

    sget-object v4, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->NETWORK:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "There were "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    .line 184
    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " bytes that were not consumed while processing request "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mRequestId:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 180
    invoke-static {v2, v3, v4, v5}, Lcom/facebook/stetho/inspector/console/CLog;->writeToConsole(Lcom/facebook/stetho/inspector/helper/ChromePeerManager;Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 188
    .end local v0    # "bytesRead":J
    :cond_1
    invoke-super {p0}, Ljava/io/FilterInputStream;->close()V

    .line 189
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->closeOutputStreamQuietly()V

    .line 190
    nop

    .line 191
    return-void

    .line 188
    :catchall_0
    move-exception v0

    invoke-super {p0}, Ljava/io/FilterInputStream;->close()V

    .line 189
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->closeOutputStreamQuietly()V

    .line 190
    throw v0
.end method

.method public mark(I)V
    .locals 0
    .param p1, "readlimit"    # I

    .line 161
    return-void
.end method

.method public markSupported()Z
    .locals 1

    .line 155
    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 97
    :try_start_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->checkEOF(I)I

    move-result v0

    .line 98
    .local v0, "result":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 99
    iget-object v1, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mResponseHandler:Lcom/facebook/stetho/inspector/network/ResponseHandler;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Lcom/facebook/stetho/inspector/network/ResponseHandler;->onRead(I)V

    .line 100
    invoke-direct {p0, v0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->writeToOutputStream(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    :cond_0
    return v0

    .line 103
    .end local v0    # "result":I
    :catch_0
    move-exception v0

    .line 104
    .local v0, "ex":Ljava/io/IOException;
    invoke-direct {p0, v0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->handleIOException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v1

    throw v1
.end method

.method public read([B)I
    .locals 2
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 110
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 2
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 116
    :try_start_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->in:Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    invoke-direct {p0, v0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->checkEOF(I)I

    move-result v0

    .line 117
    .local v0, "result":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 118
    iget-object v1, p0, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->mResponseHandler:Lcom/facebook/stetho/inspector/network/ResponseHandler;

    invoke-interface {v1, v0}, Lcom/facebook/stetho/inspector/network/ResponseHandler;->onRead(I)V

    .line 119
    invoke-direct {p0, p1, p2, v0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->writeToOutputStream([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 121
    :cond_0
    return v0

    .line 122
    .end local v0    # "result":I
    :catch_0
    move-exception v0

    .line 123
    .local v0, "ex":Ljava/io/IOException;
    invoke-direct {p0, v0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->handleIOException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v1

    throw v1
.end method

.method public reset()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 165
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Mark not supported"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public declared-synchronized skip(J)J
    .locals 9
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 129
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->getSkipBufferLocked()[B

    move-result-object v0

    .line 130
    .local v0, "buffer":[B
    const-wide/16 v1, 0x0

    .line 131
    .local v1, "total":J
    :goto_0
    cmp-long v3, v1, p1

    if-gez v3, :cond_1

    .line 132
    sub-long v3, p1, v1

    .line 133
    .local v3, "bytesDiff":J
    array-length v5, v0

    int-to-long v5, v5

    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    long-to-int v5, v5

    .line 134
    .local v5, "bytesToRead":I
    const/4 v6, 0x0

    invoke-virtual {p0, v0, v6, v5}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;->read([BII)I

    move-result v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 135
    .local v6, "result":I
    const/4 v7, -0x1

    if-ne v6, v7, :cond_0

    .line 136
    goto :goto_1

    .line 138
    :cond_0
    int-to-long v7, v6

    add-long/2addr v1, v7

    .line 139
    .end local v3    # "bytesDiff":J
    .end local v5    # "bytesToRead":I
    .end local v6    # "result":I
    goto :goto_0

    .line 140
    .end local p0    # "this":Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;
    :cond_1
    :goto_1
    monitor-exit p0

    return-wide v1

    .line 128
    .end local v0    # "buffer":[B
    .end local v1    # "total":J
    .end local p1    # "n":J
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
