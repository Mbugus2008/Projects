.class public Lcom/facebook/stetho/inspector/network/DecompressionHelper;
.super Ljava/lang/Object;
.source "DecompressionHelper.java"


# static fields
.field static final DEFLATE_ENCODING:Ljava/lang/String; = "deflate"

.field static final GZIP_ENCODING:Ljava/lang/String; = "gzip"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static teeInputWithDecompression(Lcom/facebook/stetho/inspector/network/NetworkPeerManager;Ljava/lang/String;Ljava/io/InputStream;Ljava/io/OutputStream;Ljava/lang/String;Lcom/facebook/stetho/inspector/network/ResponseHandler;)Ljava/io/InputStream;
    .locals 15
    .param p0, "peerManager"    # Lcom/facebook/stetho/inspector/network/NetworkPeerManager;
    .param p1, "requestId"    # Ljava/lang/String;
    .param p2, "availableInputStream"    # Ljava/io/InputStream;
    .param p3, "decompressedOutput"    # Ljava/io/OutputStream;
    .param p4, "contentEncoding"    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "responseHandler"    # Lcom/facebook/stetho/inspector/network/ResponseHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 31
    move-object/from16 v0, p4

    move-object/from16 v1, p3

    .line 32
    .local v1, "output":Ljava/io/OutputStream;
    const/4 v2, 0x0

    .line 34
    .local v2, "decompressedCounter":Lcom/facebook/stetho/inspector/network/CountingOutputStream;
    if-eqz v0, :cond_4

    .line 35
    const-string v3, "gzip"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 36
    .local v3, "gzipEncoding":Z
    const-string v4, "deflate"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 38
    .local v4, "deflateEncoding":Z
    if-nez v3, :cond_1

    if-eqz v4, :cond_0

    move-object/from16 v10, p1

    goto :goto_0

    .line 46
    :cond_0
    sget-object v5, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;->WARNING:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;

    sget-object v6, Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;->NETWORK:Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unsupported Content-Encoding in response for request #"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v10, p1

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {p0, v5, v6, v7}, Lcom/facebook/stetho/inspector/console/CLog;->writeToConsole(Lcom/facebook/stetho/inspector/helper/ChromePeerManager;Lcom/facebook/stetho/inspector/protocol/module/Console$MessageLevel;Lcom/facebook/stetho/inspector/protocol/module/Console$MessageSource;Ljava/lang/String;)V

    move-object/from16 v6, p3

    goto :goto_1

    .line 38
    :cond_1
    move-object/from16 v10, p1

    .line 39
    :goto_0
    new-instance v5, Lcom/facebook/stetho/inspector/network/CountingOutputStream;

    move-object/from16 v6, p3

    invoke-direct {v5, v6}, Lcom/facebook/stetho/inspector/network/CountingOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object v2, v5

    .line 40
    if-eqz v3, :cond_2

    .line 41
    invoke-static {v2}, Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;->create(Ljava/io/OutputStream;)Lcom/facebook/stetho/inspector/network/GunzippingOutputStream;

    move-result-object v1

    move-object v11, v1

    move-object v12, v2

    goto :goto_2

    .line 42
    :cond_2
    if-eqz v4, :cond_3

    .line 43
    new-instance v5, Ljava/util/zip/InflaterOutputStream;

    invoke-direct {v5, v2}, Ljava/util/zip/InflaterOutputStream;-><init>(Ljava/io/OutputStream;)V

    move-object v1, v5

    move-object v11, v1

    move-object v12, v2

    goto :goto_2

    .line 42
    :cond_3
    move-object v11, v1

    move-object v12, v2

    goto :goto_2

    .line 34
    .end local v3    # "gzipEncoding":Z
    .end local v4    # "deflateEncoding":Z
    :cond_4
    move-object/from16 v10, p1

    move-object/from16 v6, p3

    .line 55
    :goto_1
    move-object v11, v1

    move-object v12, v2

    .end local v1    # "output":Ljava/io/OutputStream;
    .end local v2    # "decompressedCounter":Lcom/facebook/stetho/inspector/network/CountingOutputStream;
    .local v11, "output":Ljava/io/OutputStream;
    .local v12, "decompressedCounter":Lcom/facebook/stetho/inspector/network/CountingOutputStream;
    :goto_2
    new-instance v8, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;

    move-object v13, p0

    move-object/from16 v9, p2

    move-object/from16 v14, p5

    invoke-direct/range {v8 .. v14}, Lcom/facebook/stetho/inspector/network/ResponseHandlingInputStream;-><init>(Ljava/io/InputStream;Ljava/lang/String;Ljava/io/OutputStream;Lcom/facebook/stetho/inspector/network/CountingOutputStream;Lcom/facebook/stetho/inspector/helper/ChromePeerManager;Lcom/facebook/stetho/inspector/network/ResponseHandler;)V

    return-object v8
.end method
