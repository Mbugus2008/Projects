.class public Lcom/facebook/stetho/common/ProcessUtil;
.super Ljava/lang/Object;
.source "ProcessUtil.java"


# static fields
.field private static final CMDLINE_BUFFER_SIZE:I = 0x40

.field private static sProcessName:Ljava/lang/String;

.field private static sProcessNameRead:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized getProcessName()Ljava/lang/String;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const-class v0, Lcom/facebook/stetho/common/ProcessUtil;

    monitor-enter v0

    .line 33
    :try_start_0
    sget-boolean v1, Lcom/facebook/stetho/common/ProcessUtil;->sProcessNameRead:Z

    if-nez v1, :cond_0

    .line 34
    const/4 v1, 0x1

    sput-boolean v1, Lcom/facebook/stetho/common/ProcessUtil;->sProcessNameRead:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    :try_start_1
    invoke-static {}, Lcom/facebook/stetho/common/ProcessUtil;->readProcessName()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/facebook/stetho/common/ProcessUtil;->sProcessName:Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    goto :goto_0

    .line 37
    :catch_0
    move-exception v1

    .line 40
    :cond_0
    :goto_0
    :try_start_2
    sget-object v1, Lcom/facebook/stetho/common/ProcessUtil;->sProcessName:Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit v0

    return-object v1

    .line 32
    :catchall_0
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1
.end method

.method private static indexOf([BIIB)I
    .locals 2
    .param p0, "haystack"    # [B
    .param p1, "offset"    # I
    .param p2, "length"    # I
    .param p3, "needle"    # B

    .line 60
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_1

    .line 61
    aget-byte v1, p0, v0

    if-ne v1, p3, :cond_0

    .line 62
    return v0

    .line 60
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 65
    .end local v0    # "i":I
    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method private static readProcessName()Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 44
    const/16 v0, 0x40

    new-array v0, v0, [B

    .line 47
    .local v0, "cmdlineBuffer":[B
    new-instance v1, Ljava/io/FileInputStream;

    const-string v2, "/proc/self/cmdline"

    invoke-direct {v1, v2}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 48
    .local v1, "stream":Ljava/io/FileInputStream;
    const/4 v2, 0x0

    .line 50
    .local v2, "success":Z
    :try_start_0
    invoke-virtual {v1, v0}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    .line 51
    .local v3, "n":I
    const/4 v2, 0x1

    .line 52
    const/4 v4, 0x0

    invoke-static {v0, v4, v3, v4}, Lcom/facebook/stetho/common/ProcessUtil;->indexOf([BIIB)I

    move-result v5

    .line 53
    .local v5, "endIndex":I
    new-instance v6, Ljava/lang/String;

    if-lez v5, :cond_0

    move v7, v5

    goto :goto_0

    :cond_0
    move v7, v3

    :goto_0
    invoke-direct {v6, v0, v4, v7}, Ljava/lang/String;-><init>([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    xor-int/lit8 v4, v2, 0x1

    invoke-static {v1, v4}, Lcom/facebook/stetho/common/Util;->close(Ljava/io/Closeable;Z)V

    .line 53
    return-object v6

    .line 55
    .end local v3    # "n":I
    .end local v5    # "endIndex":I
    :catchall_0
    move-exception v3

    xor-int/lit8 v4, v2, 0x1

    invoke-static {v1, v4}, Lcom/facebook/stetho/common/Util;->close(Ljava/io/Closeable;Z)V

    .line 56
    throw v3
.end method
