.class Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;
.super Ljava/lang/Object;
.source "LightHttpServer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/server/http/LightHttpServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HttpMessageReader"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader$NewLineDetector;
    }
.end annotation


# instance fields
.field private final mBuffer:Ljava/lang/StringBuilder;

.field private final mIn:Ljava/io/BufferedInputStream;

.field private final mNewLineDetector:Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader$NewLineDetector;


# direct methods
.method public constructor <init>(Ljava/io/BufferedInputStream;)V
    .locals 2
    .param p1, "in"    # Ljava/io/BufferedInputStream;

    .line 186
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 183
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;->mBuffer:Ljava/lang/StringBuilder;

    .line 184
    new-instance v0, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader$NewLineDetector;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader$NewLineDetector;-><init>(Lcom/facebook/stetho/server/http/LightHttpServer$1;)V

    iput-object v0, p0, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;->mNewLineDetector:Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader$NewLineDetector;

    .line 187
    iput-object p1, p0, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;->mIn:Ljava/io/BufferedInputStream;

    .line 188
    return-void
.end method


# virtual methods
.method public readLine()Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 193
    nop

    :goto_0
    iget-object v0, p0, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;->mIn:Ljava/io/BufferedInputStream;

    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->read()I

    move-result v0

    .line 194
    .local v0, "b":I
    if-gez v0, :cond_0

    .line 195
    const/4 v1, 0x0

    return-object v1

    .line 198
    :cond_0
    int-to-char v1, v0

    .line 199
    .local v1, "c":C
    iget-object v2, p0, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;->mNewLineDetector:Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader$NewLineDetector;

    invoke-virtual {v2, v1}, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader$NewLineDetector;->accept(C)V

    .line 201
    iget-object v2, p0, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;->mNewLineDetector:Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader$NewLineDetector;

    invoke-virtual {v2}, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader$NewLineDetector;->state()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    goto :goto_1

    .line 203
    :pswitch_0
    iget-object v2, p0, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;->mBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 204
    .local v2, "result":Ljava/lang/String;
    iget-object v3, p0, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;->mBuffer:Ljava/lang/StringBuilder;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 205
    return-object v2

    .line 207
    .end local v2    # "result":Ljava/lang/String;
    :pswitch_1
    goto :goto_1

    .line 209
    :pswitch_2
    iget-object v2, p0, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;->mBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 212
    .end local v0    # "b":I
    .end local v1    # "c":C
    :goto_1
    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
