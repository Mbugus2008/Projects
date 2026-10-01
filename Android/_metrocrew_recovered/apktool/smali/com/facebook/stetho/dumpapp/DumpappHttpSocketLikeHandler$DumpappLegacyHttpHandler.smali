.class Lcom/facebook/stetho/dumpapp/DumpappHttpSocketLikeHandler$DumpappLegacyHttpHandler;
.super Ljava/lang/Object;
.source "DumpappHttpSocketLikeHandler.java"

# interfaces
.implements Lcom/facebook/stetho/server/http/HttpHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/dumpapp/DumpappHttpSocketLikeHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DumpappLegacyHttpHandler"
.end annotation


# static fields
.field private static final CONTENT_TYPE:Ljava/lang/String; = "application/octet-stream"

.field private static final QUERY_PARAM_ARGV:Ljava/lang/String; = "argv"

.field private static final RESPONSE_HEADER_ALLOW_ORIGIN:Ljava/lang/String; = "Access-Control-Allow-Origin"


# instance fields
.field private final mDumper:Lcom/facebook/stetho/dumpapp/Dumper;


# direct methods
.method public constructor <init>(Lcom/facebook/stetho/dumpapp/Dumper;)V
    .locals 0
    .param p1, "dumper"    # Lcom/facebook/stetho/dumpapp/Dumper;

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Lcom/facebook/stetho/dumpapp/DumpappHttpSocketLikeHandler$DumpappLegacyHttpHandler;->mDumper:Lcom/facebook/stetho/dumpapp/Dumper;

    .line 63
    return-void
.end method


# virtual methods
.method public handleRequest(Lcom/facebook/stetho/server/SocketLike;Lcom/facebook/stetho/server/http/LightHttpRequest;Lcom/facebook/stetho/server/http/LightHttpResponse;)Z
    .locals 10
    .param p1, "socket"    # Lcom/facebook/stetho/server/SocketLike;
    .param p2, "request"    # Lcom/facebook/stetho/server/http/LightHttpRequest;
    .param p3, "response"    # Lcom/facebook/stetho/server/http/LightHttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 70
    const-string v0, "POST"

    iget-object v1, p2, Lcom/facebook/stetho/server/http/LightHttpRequest;->method:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 71
    .local v0, "postMethod":Z
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    const-string v3, "GET"

    iget-object v4, p2, Lcom/facebook/stetho/server/http/LightHttpRequest;->method:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    move v3, v2

    goto :goto_0

    :cond_0
    move v3, v1

    .line 73
    .local v3, "getMethod":Z
    :goto_0
    if-nez v3, :cond_2

    if-eqz v0, :cond_1

    goto :goto_1

    .line 99
    :cond_1
    const/16 v1, 0x1f5

    iput v1, p3, Lcom/facebook/stetho/server/http/LightHttpResponse;->code:I

    .line 100
    const-string v1, "Not implemented"

    iput-object v1, p3, Lcom/facebook/stetho/server/http/LightHttpResponse;->reasonPhrase:Ljava/lang/String;

    .line 101
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p2, Lcom/facebook/stetho/server/http/LightHttpRequest;->method:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v4, " not implemented"

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v4, "text/plain"

    invoke-static {v1, v4}, Lcom/facebook/stetho/server/http/LightHttpBody;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/stetho/server/http/LightHttpBody;

    move-result-object v1

    iput-object v1, p3, Lcom/facebook/stetho/server/http/LightHttpResponse;->body:Lcom/facebook/stetho/server/http/LightHttpBody;

    goto :goto_4

    .line 74
    :cond_2
    :goto_1
    iget-object v4, p2, Lcom/facebook/stetho/server/http/LightHttpRequest;->uri:Landroid/net/Uri;

    const-string v5, "argv"

    invoke-virtual {v4, v5}, Landroid/net/Uri;->getQueryParameters(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    .line 76
    .local v4, "argv":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v5, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v5}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 77
    .local v5, "outputBuffer":Ljava/io/ByteArrayOutputStream;
    new-instance v6, Lcom/facebook/stetho/dumpapp/Framer;

    new-instance v7, Ljava/io/ByteArrayInputStream;

    new-array v1, v1, [B

    invoke-direct {v7, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v6, v7, v5}, Lcom/facebook/stetho/dumpapp/Framer;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 81
    .local v6, "framer":Lcom/facebook/stetho/dumpapp/Framer;
    if-eqz v0, :cond_3

    const-string v1, "ERROR"

    goto :goto_2

    :cond_3
    const-string v1, "WARNING"

    .line 83
    .local v1, "warningPrefix":Ljava/lang/String;
    :goto_2
    invoke-virtual {v6}, Lcom/facebook/stetho/dumpapp/Framer;->getStderr()Ljava/io/PrintStream;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "*** "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ": Using legacy HTTP protocol; update dumpapp script! ***"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 86
    if-eqz v3, :cond_4

    .line 87
    iget-object v7, p0, Lcom/facebook/stetho/dumpapp/DumpappHttpSocketLikeHandler$DumpappLegacyHttpHandler;->mDumper:Lcom/facebook/stetho/dumpapp/Dumper;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/String;

    invoke-interface {v4, v8}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/String;

    invoke-static {v7, v6, v8}, Lcom/facebook/stetho/dumpapp/DumpappSocketLikeHandler;->dump(Lcom/facebook/stetho/dumpapp/Dumper;Lcom/facebook/stetho/dumpapp/Framer;[Ljava/lang/String;)V

    goto :goto_3

    .line 91
    :cond_4
    invoke-virtual {v6, v2}, Lcom/facebook/stetho/dumpapp/Framer;->writeExitCode(I)V

    .line 94
    :goto_3
    const/16 v7, 0xc8

    iput v7, p3, Lcom/facebook/stetho/server/http/LightHttpResponse;->code:I

    .line 95
    const-string v7, "OK"

    iput-object v7, p3, Lcom/facebook/stetho/server/http/LightHttpResponse;->reasonPhrase:Ljava/lang/String;

    .line 96
    const-string v7, "Access-Control-Allow-Origin"

    const-string v8, "*"

    invoke-virtual {p3, v7, v8}, Lcom/facebook/stetho/server/http/LightHttpResponse;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7

    const-string v8, "application/octet-stream"

    invoke-static {v7, v8}, Lcom/facebook/stetho/server/http/LightHttpBody;->create([BLjava/lang/String;)Lcom/facebook/stetho/server/http/LightHttpBody;

    move-result-object v7

    iput-object v7, p3, Lcom/facebook/stetho/server/http/LightHttpResponse;->body:Lcom/facebook/stetho/server/http/LightHttpBody;

    .line 98
    .end local v1    # "warningPrefix":Ljava/lang/String;
    .end local v4    # "argv":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v5    # "outputBuffer":Ljava/io/ByteArrayOutputStream;
    .end local v6    # "framer":Lcom/facebook/stetho/dumpapp/Framer;
    nop

    .line 104
    :goto_4
    return v2
.end method
