.class public Lcom/facebook/stetho/server/LeakyBufferedInputStream;
.super Ljava/io/BufferedInputStream;
.source "LeakyBufferedInputStream.java"


# instance fields
.field private mLeaked:Z

.field private mMarked:Z


# direct methods
.method public constructor <init>(Ljava/io/InputStream;I)V
    .locals 0
    .param p1, "in"    # Ljava/io/InputStream;
    .param p2, "bufSize"    # I

    .line 23
    invoke-direct {p0, p1, p2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 24
    return-void
.end method

.method private clearBufferLocked()[B
    .locals 5

    .line 57
    iget v0, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->count:I

    iget v1, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->pos:I

    sub-int/2addr v0, v1

    new-array v0, v0, [B

    .line 58
    .local v0, "leaked":[B
    iget-object v1, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->buf:[B

    iget v2, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->pos:I

    array-length v3, v0

    const/4 v4, 0x0

    invoke-static {v1, v2, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 59
    iput v4, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->pos:I

    .line 60
    iput v4, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->count:I

    .line 61
    return-object v0
.end method

.method private throwIfLeaked()V
    .locals 1

    .line 65
    iget-boolean v0, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->mLeaked:Z

    if-nez v0, :cond_0

    .line 68
    return-void

    .line 66
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method private throwIfMarked()V
    .locals 1

    .line 71
    iget-boolean v0, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->mMarked:Z

    if-nez v0, :cond_0

    .line 74
    return-void

    .line 72
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method


# virtual methods
.method public declared-synchronized leakBufferAndStream()Ljava/io/InputStream;
    .locals 5

    monitor-enter p0

    .line 46
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->throwIfLeaked()V

    .line 47
    invoke-direct {p0}, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->throwIfMarked()V

    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->mLeaked:Z

    .line 49
    new-instance v1, Lcom/facebook/stetho/server/CompositeInputStream;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/io/InputStream;

    new-instance v3, Ljava/io/ByteArrayInputStream;

    .line 51
    invoke-direct {p0}, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->clearBufferLocked()[B

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->in:Ljava/io/InputStream;

    aput-object v3, v2, v0

    invoke-direct {v1, v2}, Lcom/facebook/stetho/server/CompositeInputStream;-><init>([Ljava/io/InputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    monitor-exit p0

    return-object v1

    .line 45
    .end local p0    # "this":Lcom/facebook/stetho/server/LeakyBufferedInputStream;
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public declared-synchronized mark(I)V
    .locals 1
    .param p1, "readlimit"    # I

    monitor-enter p0

    .line 28
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->throwIfLeaked()V

    .line 29
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->mMarked:Z

    .line 30
    invoke-super {p0, p1}, Ljava/io/BufferedInputStream;->mark(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    monitor-exit p0

    return-void

    .line 27
    .end local p0    # "this":Lcom/facebook/stetho/server/LeakyBufferedInputStream;
    .end local p1    # "readlimit":I
    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public markSupported()Z
    .locals 1

    .line 42
    const/4 v0, 0x1

    return v0
.end method

.method public declared-synchronized reset()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 35
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->throwIfLeaked()V

    .line 36
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;->mMarked:Z

    .line 37
    invoke-super {p0}, Ljava/io/BufferedInputStream;->reset()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    monitor-exit p0

    return-void

    .line 34
    .end local p0    # "this":Lcom/facebook/stetho/server/LeakyBufferedInputStream;
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
