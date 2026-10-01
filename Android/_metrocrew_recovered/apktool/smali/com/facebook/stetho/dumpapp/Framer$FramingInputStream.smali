.class Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;
.super Ljava/io/InputStream;
.source "Framer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/dumpapp/Framer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FramingInputStream"
.end annotation


# instance fields
.field private final mClosedHelper:Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;

.field final synthetic this$0:Lcom/facebook/stetho/dumpapp/Framer;


# direct methods
.method private constructor <init>(Lcom/facebook/stetho/dumpapp/Framer;)V
    .locals 1

    .line 134
    iput-object p1, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->this$0:Lcom/facebook/stetho/dumpapp/Framer;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 135
    new-instance p1, Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;-><init>(Lcom/facebook/stetho/dumpapp/Framer$1;)V

    iput-object p1, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->mClosedHelper:Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/stetho/dumpapp/Framer;Lcom/facebook/stetho/dumpapp/Framer$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/facebook/stetho/dumpapp/Framer;
    .param p2, "x1"    # Lcom/facebook/stetho/dumpapp/Framer$1;

    .line 134
    invoke-direct {p0, p1}, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;-><init>(Lcom/facebook/stetho/dumpapp/Framer;)V

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 195
    iget-object v0, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->mClosedHelper:Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;

    invoke-virtual {v0}, Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;->close()V

    .line 196
    return-void
.end method

.method public read()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 139
    const/4 v0, 0x1

    new-array v0, v0, [B

    .line 140
    .local v0, "buf":[B
    invoke-virtual {p0, v0}, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->read([B)I

    move-result v1

    if-nez v1, :cond_0

    .line 141
    const/4 v1, -0x1

    return v1

    .line 143
    :cond_0
    const/4 v1, 0x0

    aget-byte v1, v0, v1

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

    .line 148
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 6
    .param p1, "buffer"    # [B
    .param p2, "byteOffset"    # I
    .param p3, "byteCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 153
    iget-object v0, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->mClosedHelper:Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;

    invoke-virtual {v0}, Lcom/facebook/stetho/dumpapp/Framer$ClosedHelper;->throwIfClosed()V

    .line 155
    iget-object v0, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->this$0:Lcom/facebook/stetho/dumpapp/Framer;

    monitor-enter v0

    .line 157
    :try_start_0
    iget-object v1, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->this$0:Lcom/facebook/stetho/dumpapp/Framer;

    const/16 v2, 0x5f

    invoke-virtual {v1, v2, p3}, Lcom/facebook/stetho/dumpapp/Framer;->writeIntFrame(BI)V

    .line 158
    iget-object v1, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->this$0:Lcom/facebook/stetho/dumpapp/Framer;

    invoke-virtual {v1}, Lcom/facebook/stetho/dumpapp/Framer;->readFrameType()B

    move-result v1

    .line 159
    .local v1, "b":B
    const/16 v2, 0x2d

    if-ne v1, v2, :cond_2

    .line 164
    iget-object v2, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->this$0:Lcom/facebook/stetho/dumpapp/Framer;

    invoke-virtual {v2}, Lcom/facebook/stetho/dumpapp/Framer;->readInt()I

    move-result v2

    .line 165
    .local v2, "length":I
    if-lez v2, :cond_1

    .line 166
    if-gt v2, p3, :cond_0

    .line 170
    iget-object v3, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->this$0:Lcom/facebook/stetho/dumpapp/Framer;

    invoke-static {v3}, Lcom/facebook/stetho/dumpapp/Framer;->access$200(Lcom/facebook/stetho/dumpapp/Framer;)Ljava/io/DataInputStream;

    move-result-object v3

    invoke-virtual {v3, p1, p2, v2}, Ljava/io/DataInputStream;->readFully([BII)V

    goto :goto_0

    .line 167
    :cond_0
    new-instance v3, Lcom/facebook/stetho/dumpapp/DumpappFramingException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Expected at most "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " bytes, got: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/facebook/stetho/dumpapp/DumpappFramingException;-><init>(Ljava/lang/String;)V

    .end local p1    # "buffer":[B
    .end local p2    # "byteOffset":I
    .end local p3    # "byteCount":I
    throw v3

    .line 172
    .restart local p1    # "buffer":[B
    .restart local p2    # "byteOffset":I
    .restart local p3    # "byteCount":I
    :cond_1
    :goto_0
    monitor-exit v0

    return v2

    .line 160
    .end local v2    # "length":I
    :cond_2
    new-instance v3, Lcom/facebook/stetho/dumpapp/UnexpectedFrameException;

    invoke-direct {v3, v2, v1}, Lcom/facebook/stetho/dumpapp/UnexpectedFrameException;-><init>(BB)V

    .end local p1    # "buffer":[B
    .end local p2    # "byteOffset":I
    .end local p3    # "byteCount":I
    throw v3

    .line 173
    .end local v1    # "b":B
    .restart local p1    # "buffer":[B
    .restart local p2    # "byteOffset":I
    .restart local p3    # "byteCount":I
    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public skip(J)J
    .locals 8
    .param p1, "byteCount"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 178
    const-wide/16 v0, 0x0

    .line 179
    .local v0, "skipped":J
    const-wide/16 v2, 0x800

    invoke-static {p1, p2, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v2, v2

    .line 180
    .local v2, "bufSize":I
    new-array v3, v2, [B

    .line 181
    .local v3, "buf":[B
    iget-object v4, p0, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->this$0:Lcom/facebook/stetho/dumpapp/Framer;

    monitor-enter v4

    .line 182
    :goto_0
    cmp-long v5, v0, p1

    if-gez v5, :cond_1

    .line 183
    :try_start_0
    invoke-virtual {p0, v3}, Lcom/facebook/stetho/dumpapp/Framer$FramingInputStream;->read([B)I

    move-result v5

    .line 184
    .local v5, "n":I
    if-gez v5, :cond_0

    .line 185
    goto :goto_1

    .line 187
    :cond_0
    int-to-long v6, v5

    add-long/2addr v0, v6

    .line 188
    .end local v5    # "n":I
    goto :goto_0

    .line 189
    :cond_1
    :goto_1
    monitor-exit v4

    .line 190
    return-wide v0

    .line 189
    :catchall_0
    move-exception v5

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5
.end method
