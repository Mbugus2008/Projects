.class public Lcom/facebook/stetho/dumpapp/DumpappSocketLikeHandler;
.super Ljava/lang/Object;
.source "DumpappSocketLikeHandler.java"

# interfaces
.implements Lcom/facebook/stetho/server/SocketLikeHandler;


# static fields
.field public static final PROTOCOL_MAGIC:[B

.field public static final PROTOCOL_VERSION:I = 0x1


# instance fields
.field private final mDumper:Lcom/facebook/stetho/dumpapp/Dumper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 27
    const/4 v0, 0x4

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lcom/facebook/stetho/dumpapp/DumpappSocketLikeHandler;->PROTOCOL_MAGIC:[B

    return-void

    nop

    :array_0
    .array-data 1
        0x44t
        0x55t
        0x4dt
        0x50t
    .end array-data
.end method

.method public constructor <init>(Lcom/facebook/stetho/dumpapp/Dumper;)V
    .locals 0
    .param p1, "dumper"    # Lcom/facebook/stetho/dumpapp/Dumper;

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/facebook/stetho/dumpapp/DumpappSocketLikeHandler;->mDumper:Lcom/facebook/stetho/dumpapp/Dumper;

    .line 34
    return-void
.end method

.method static dump(Lcom/facebook/stetho/dumpapp/Dumper;Lcom/facebook/stetho/dumpapp/Framer;[Ljava/lang/String;)V
    .locals 3
    .param p0, "dumper"    # Lcom/facebook/stetho/dumpapp/Dumper;
    .param p1, "framer"    # Lcom/facebook/stetho/dumpapp/Framer;
    .param p2, "args"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 65
    nop

    .line 66
    :try_start_0
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/Framer;->getStdin()Ljava/io/InputStream;

    move-result-object v0

    .line 67
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/Framer;->getStdout()Ljava/io/PrintStream;

    move-result-object v1

    .line 68
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/Framer;->getStderr()Ljava/io/PrintStream;

    move-result-object v2

    .line 65
    invoke-virtual {p0, v0, v1, v2, p2}, Lcom/facebook/stetho/dumpapp/Dumper;->dump(Ljava/io/InputStream;Ljava/io/PrintStream;Ljava/io/PrintStream;[Ljava/lang/String;)I

    move-result v0

    .line 70
    .local v0, "exitCode":I
    invoke-virtual {p1, v0}, Lcom/facebook/stetho/dumpapp/Framer;->writeExitCode(I)V
    :try_end_0
    .catch Lcom/facebook/stetho/dumpapp/DumpappOutputBrokenException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    .end local v0    # "exitCode":I
    goto :goto_0

    .line 71
    :catch_0
    move-exception v0

    .line 77
    :goto_0
    return-void
.end method

.method private establishConversation(Ljava/io/DataInputStream;)V
    .locals 4
    .param p1, "in"    # Ljava/io/DataInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 80
    const/4 v0, 0x4

    new-array v0, v0, [B

    .line 81
    .local v0, "magic":[B
    invoke-virtual {p1, v0}, Ljava/io/DataInputStream;->readFully([B)V

    .line 82
    sget-object v1, Lcom/facebook/stetho/dumpapp/DumpappSocketLikeHandler;->PROTOCOL_MAGIC:[B

    invoke-static {v1, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 87
    invoke-virtual {p1}, Ljava/io/DataInputStream;->readInt()I

    move-result v1

    .line 88
    .local v1, "version":I
    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 92
    return-void

    .line 89
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected version=1; got="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/facebook/stetho/dumpapp/DumpappSocketLikeHandler;->logAndThrowProtocolException(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v2

    throw v2

    .line 83
    .end local v1    # "version":I
    :cond_1
    const-string v1, "Incompatible protocol, are you using an old dumpapp script?"

    invoke-static {v1}, Lcom/facebook/stetho/dumpapp/DumpappSocketLikeHandler;->logAndThrowProtocolException(Ljava/lang/String;)Ljava/io/IOException;

    move-result-object v1

    throw v1
.end method

.method private static logAndThrowProtocolException(Ljava/lang/String;)Ljava/io/IOException;
    .locals 1
    .param p0, "message"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 95
    invoke-static {p0}, Lcom/facebook/stetho/common/LogUtil;->w(Ljava/lang/String;)V

    .line 96
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private readArgs(Lcom/facebook/stetho/dumpapp/Framer;)[Ljava/lang/String;
    .locals 5
    .param p1, "framer"    # Lcom/facebook/stetho/dumpapp/Framer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 100
    monitor-enter p1

    .line 101
    :try_start_0
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/Framer;->readFrameType()B

    move-result v0

    .line 102
    .local v0, "type":B
    packed-switch v0, :pswitch_data_0

    .line 111
    new-instance v1, Lcom/facebook/stetho/dumpapp/DumpappFramingException;

    goto :goto_1

    .line 104
    :pswitch_0
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/Framer;->readInt()I

    move-result v1

    .line 105
    .local v1, "argc":I
    new-array v2, v1, [Ljava/lang/String;

    .line 106
    .local v2, "argv":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-ge v3, v1, :cond_0

    .line 107
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/Framer;->readString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 106
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 109
    .end local v3    # "i":I
    :cond_0
    monitor-exit p1

    return-object v2

    .line 111
    .end local v1    # "argc":I
    .end local v2    # "argv":[Ljava/lang/String;
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Expected enter frame, got: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/facebook/stetho/dumpapp/DumpappFramingException;-><init>(Ljava/lang/String;)V

    .end local p1    # "framer":Lcom/facebook/stetho/dumpapp/Framer;
    throw v1

    .line 113
    .end local v0    # "type":B
    .restart local p1    # "framer":Lcom/facebook/stetho/dumpapp/Framer;
    :catchall_0
    move-exception v0

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    nop

    :pswitch_data_0
    .packed-switch 0x21
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public onAccepted(Lcom/facebook/stetho/server/SocketLike;)V
    .locals 4
    .param p1, "socket"    # Lcom/facebook/stetho/server/SocketLike;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 38
    new-instance v0, Ljava/io/DataInputStream;

    invoke-virtual {p1}, Lcom/facebook/stetho/server/SocketLike;->getInput()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    .line 41
    .local v0, "in":Ljava/io/DataInputStream;
    invoke-direct {p0, v0}, Lcom/facebook/stetho/dumpapp/DumpappSocketLikeHandler;->establishConversation(Ljava/io/DataInputStream;)V

    .line 43
    new-instance v1, Lcom/facebook/stetho/dumpapp/Framer;

    invoke-virtual {p1}, Lcom/facebook/stetho/server/SocketLike;->getOutput()Ljava/io/OutputStream;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lcom/facebook/stetho/dumpapp/Framer;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 44
    .local v1, "framer":Lcom/facebook/stetho/dumpapp/Framer;
    invoke-direct {p0, v1}, Lcom/facebook/stetho/dumpapp/DumpappSocketLikeHandler;->readArgs(Lcom/facebook/stetho/dumpapp/Framer;)[Ljava/lang/String;

    move-result-object v2

    .line 46
    .local v2, "args":[Ljava/lang/String;
    iget-object v3, p0, Lcom/facebook/stetho/dumpapp/DumpappSocketLikeHandler;->mDumper:Lcom/facebook/stetho/dumpapp/Dumper;

    invoke-static {v3, v1, v2}, Lcom/facebook/stetho/dumpapp/DumpappSocketLikeHandler;->dump(Lcom/facebook/stetho/dumpapp/Dumper;Lcom/facebook/stetho/dumpapp/Framer;[Ljava/lang/String;)V

    .line 47
    return-void
.end method
