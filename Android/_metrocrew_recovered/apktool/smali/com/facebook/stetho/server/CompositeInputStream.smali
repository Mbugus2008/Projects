.class public Lcom/facebook/stetho/server/CompositeInputStream;
.super Ljava/io/InputStream;
.source "CompositeInputStream.java"


# instance fields
.field private mCurrentIndex:I

.field private final mStreams:[Ljava/io/InputStream;


# direct methods
.method public constructor <init>([Ljava/io/InputStream;)V
    .locals 2
    .param p1, "streams"    # [Ljava/io/InputStream;

    .line 22
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 23
    if-eqz p1, :cond_0

    array-length v0, p1

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    .line 26
    iput-object p1, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mStreams:[Ljava/io/InputStream;

    .line 27
    const/4 v0, 0x0

    iput v0, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mCurrentIndex:I

    .line 28
    return-void

    .line 24
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Streams must be non-null and have more than 1 entry"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private closeAll(I)V
    .locals 5
    .param p1, "mostImportantIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 41
    const/4 v0, 0x0

    .line 42
    .local v0, "exceptionToThrow":Ljava/io/IOException;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mStreams:[Ljava/io/InputStream;

    array-length v2, v2

    if-ge v1, v2, :cond_3

    .line 44
    :try_start_0
    iget-object v2, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mStreams:[Ljava/io/InputStream;

    aget-object v2, v2, v1

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    goto :goto_1

    .line 45
    :catch_0
    move-exception v2

    .line 46
    .local v2, "e":Ljava/io/IOException;
    move-object v3, v0

    .line 47
    .local v3, "previousException":Ljava/io/IOException;
    if-eq v1, p1, :cond_0

    if-nez v0, :cond_1

    .line 48
    :cond_0
    move-object v0, v2

    .line 50
    :cond_1
    if-eqz v3, :cond_2

    if-eq v3, v0, :cond_2

    .line 51
    const-string v4, "Suppressing exception"

    invoke-static {v3, v4}, Lcom/facebook/stetho/common/LogUtil;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 42
    .end local v2    # "e":Ljava/io/IOException;
    .end local v3    # "previousException":Ljava/io/IOException;
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 55
    .end local v1    # "i":I
    :cond_3
    return-void
.end method

.method private tryMoveToNextStream()Z
    .locals 3

    .line 100
    iget v0, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mCurrentIndex:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iget-object v2, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mStreams:[Ljava/io/InputStream;

    array-length v2, v2

    if-ge v0, v2, :cond_0

    .line 101
    iget v0, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mCurrentIndex:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mCurrentIndex:I

    .line 102
    return v1

    .line 104
    :cond_0
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public available()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 32
    iget-object v0, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mStreams:[Ljava/io/InputStream;

    iget v1, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mCurrentIndex:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/io/InputStream;->available()I

    move-result v0

    return v0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 37
    iget v0, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mCurrentIndex:I

    invoke-direct {p0, v0}, Lcom/facebook/stetho/server/CompositeInputStream;->closeAll(I)V

    .line 38
    return-void
.end method

.method public mark(I)V
    .locals 1
    .param p1, "readlimit"    # I

    .line 59
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public markSupported()Z
    .locals 1

    .line 64
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

    .line 91
    nop

    :cond_0
    iget-object v0, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mStreams:[Ljava/io/InputStream;

    iget v1, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mCurrentIndex:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    move v1, v0

    .local v1, "b":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_1

    .line 92
    invoke-direct {p0}, Lcom/facebook/stetho/server/CompositeInputStream;->tryMoveToNextStream()Z

    move-result v0

    if-nez v0, :cond_0

    .line 93
    nop

    .line 96
    :cond_1
    return v1
.end method

.method public read([B)I
    .locals 2
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 74
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/facebook/stetho/server/CompositeInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 3
    .param p1, "buffer"    # [B
    .param p2, "byteOffset"    # I
    .param p3, "byteCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 80
    nop

    :cond_0
    iget-object v0, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mStreams:[Ljava/io/InputStream;

    iget v1, p0, Lcom/facebook/stetho/server/CompositeInputStream;->mCurrentIndex:I

    aget-object v0, v0, v1

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    move v1, v0

    .local v1, "n":I
    const/4 v2, -0x1

    if-ne v0, v2, :cond_1

    .line 81
    invoke-direct {p0}, Lcom/facebook/stetho/server/CompositeInputStream;->tryMoveToNextStream()Z

    move-result v0

    if-nez v0, :cond_0

    .line 82
    nop

    .line 85
    :cond_1
    return v1
.end method

.method public reset()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 69
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public skip(J)J
    .locals 4
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 109
    long-to-int v0, p1

    new-array v0, v0, [B

    .line 110
    .local v0, "buf":[B
    invoke-virtual {p0, v0}, Lcom/facebook/stetho/server/CompositeInputStream;->read([B)I

    move-result v1

    .line 111
    .local v1, "n":I
    if-ltz v1, :cond_0

    int-to-long v2, v1

    goto :goto_0

    :cond_0
    const-wide/16 v2, -0x1

    :goto_0
    return-wide v2
.end method
