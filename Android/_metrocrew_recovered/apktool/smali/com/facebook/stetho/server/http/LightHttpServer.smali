.class public Lcom/facebook/stetho/server/http/LightHttpServer;
.super Ljava/lang/Object;
.source "LightHttpServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageWriter;,
        Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "LightHttpServer"


# instance fields
.field private final mHandlerRegistry:Lcom/facebook/stetho/server/http/HandlerRegistry;


# direct methods
.method public constructor <init>(Lcom/facebook/stetho/server/http/HandlerRegistry;)V
    .locals 0
    .param p1, "handlerRegistry"    # Lcom/facebook/stetho/server/http/HandlerRegistry;

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/facebook/stetho/server/http/LightHttpServer;->mHandlerRegistry:Lcom/facebook/stetho/server/http/HandlerRegistry;

    .line 39
    return-void
.end method

.method private dispatchToHandler(Lcom/facebook/stetho/server/SocketLike;Lcom/facebook/stetho/server/http/LightHttpRequest;Lcom/facebook/stetho/server/http/LightHttpResponse;)Z
    .locals 7
    .param p1, "socketLike"    # Lcom/facebook/stetho/server/SocketLike;
    .param p2, "request"    # Lcom/facebook/stetho/server/http/LightHttpRequest;
    .param p3, "response"    # Lcom/facebook/stetho/server/http/LightHttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 75
    iget-object v0, p0, Lcom/facebook/stetho/server/http/LightHttpServer;->mHandlerRegistry:Lcom/facebook/stetho/server/http/HandlerRegistry;

    iget-object v1, p2, Lcom/facebook/stetho/server/http/LightHttpRequest;->uri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/facebook/stetho/server/http/HandlerRegistry;->lookup(Ljava/lang/String;)Lcom/facebook/stetho/server/http/HttpHandler;

    move-result-object v0

    .line 76
    .local v0, "handler":Lcom/facebook/stetho/server/http/HttpHandler;
    const/4 v1, 0x1

    const-string/jumbo v2, "text/plain"

    if-nez v0, :cond_0

    .line 77
    const/16 v3, 0x194

    iput v3, p3, Lcom/facebook/stetho/server/http/LightHttpResponse;->code:I

    .line 78
    const-string v3, "Not found"

    iput-object v3, p3, Lcom/facebook/stetho/server/http/LightHttpResponse;->reasonPhrase:Ljava/lang/String;

    .line 79
    const-string v3, "No handler found\n"

    invoke-static {v3, v2}, Lcom/facebook/stetho/server/http/LightHttpBody;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/stetho/server/http/LightHttpBody;

    move-result-object v2

    iput-object v2, p3, Lcom/facebook/stetho/server/http/LightHttpResponse;->body:Lcom/facebook/stetho/server/http/LightHttpBody;

    .line 80
    return v1

    .line 83
    :cond_0
    :try_start_0
    invoke-interface {v0, p1, p2, p3}, Lcom/facebook/stetho/server/http/HttpHandler;->handleRequest(Lcom/facebook/stetho/server/SocketLike;Lcom/facebook/stetho/server/http/LightHttpRequest;Lcom/facebook/stetho/server/http/LightHttpResponse;)Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    .line 84
    :catch_0
    move-exception v3

    .line 85
    .local v3, "e":Ljava/lang/RuntimeException;
    const/16 v4, 0x1f4

    iput v4, p3, Lcom/facebook/stetho/server/http/LightHttpResponse;->code:I

    .line 86
    const-string v4, "Internal Server Error"

    iput-object v4, p3, Lcom/facebook/stetho/server/http/LightHttpResponse;->reasonPhrase:Ljava/lang/String;

    .line 87
    new-instance v4, Ljava/io/StringWriter;

    invoke-direct {v4}, Ljava/io/StringWriter;-><init>()V

    .line 88
    .local v4, "stack":Ljava/io/StringWriter;
    new-instance v5, Ljava/io/PrintWriter;

    invoke-direct {v5, v4}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 90
    .local v5, "stackWriter":Ljava/io/PrintWriter;
    :try_start_1
    invoke-virtual {v3, v5}, Ljava/lang/RuntimeException;->printStackTrace(Ljava/io/PrintWriter;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 92
    invoke-virtual {v5}, Ljava/io/PrintWriter;->close()V

    .line 93
    nop

    .line 94
    invoke-virtual {v4}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v2}, Lcom/facebook/stetho/server/http/LightHttpBody;->create(Ljava/lang/String;Ljava/lang/String;)Lcom/facebook/stetho/server/http/LightHttpBody;

    move-result-object v2

    iput-object v2, p3, Lcom/facebook/stetho/server/http/LightHttpResponse;->body:Lcom/facebook/stetho/server/http/LightHttpBody;

    .line 95
    return v1

    .line 92
    :catchall_0
    move-exception v1

    invoke-virtual {v5}, Ljava/io/PrintWriter;->close()V

    .line 93
    throw v1
.end method

.method private static readHeaders(Lcom/facebook/stetho/server/http/LightHttpMessage;Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;)V
    .locals 5
    .param p0, "message"    # Lcom/facebook/stetho/server/http/LightHttpMessage;
    .param p1, "reader"    # Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 132
    nop

    :goto_0
    invoke-virtual {p1}, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 133
    .local v0, "headerLine":Ljava/lang/String;
    if-eqz v0, :cond_2

    .line 135
    const-string v1, ""

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 136
    nop

    .line 149
    return-void

    .line 138
    :cond_0
    const-string v1, ": "

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 139
    .local v1, "headerParts":[Ljava/lang/String;
    array-length v3, v1

    if-ne v3, v2, :cond_1

    .line 142
    const/4 v2, 0x0

    aget-object v2, v1, v2

    .line 143
    .local v2, "name":Ljava/lang/String;
    const/4 v3, 0x1

    aget-object v3, v1, v3

    .line 145
    .local v3, "value":Ljava/lang/String;
    iget-object v4, p0, Lcom/facebook/stetho/server/http/LightHttpMessage;->headerNames:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 146
    iget-object v4, p0, Lcom/facebook/stetho/server/http/LightHttpMessage;->headerValues:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 147
    .end local v1    # "headerParts":[Ljava/lang/String;
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    goto :goto_0

    .line 140
    .restart local v1    # "headerParts":[Ljava/lang/String;
    :cond_1
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Malformed header: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 134
    .end local v1    # "headerParts":[Ljava/lang/String;
    :cond_2
    new-instance v1, Ljava/io/EOFException;

    invoke-direct {v1}, Ljava/io/EOFException;-><init>()V

    throw v1
.end method

.method private static readRequestMessage(Lcom/facebook/stetho/server/http/LightHttpRequest;Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;)Lcom/facebook/stetho/server/http/LightHttpRequest;
    .locals 5
    .param p0, "request"    # Lcom/facebook/stetho/server/http/LightHttpRequest;
    .param p1, "reader"    # Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 105
    invoke-virtual {p0}, Lcom/facebook/stetho/server/http/LightHttpRequest;->reset()V

    .line 107
    invoke-virtual {p1}, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 108
    .local v0, "requestLine":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 109
    const/4 v1, 0x0

    return-object v1

    .line 113
    :cond_0
    const-string v1, " "

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 114
    .local v1, "requestParts":[Ljava/lang/String;
    array-length v3, v1

    if-ne v3, v2, :cond_1

    .line 118
    const/4 v2, 0x0

    aget-object v2, v1, v2

    iput-object v2, p0, Lcom/facebook/stetho/server/http/LightHttpRequest;->method:Ljava/lang/String;

    .line 119
    const/4 v2, 0x1

    aget-object v2, v1, v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    iput-object v2, p0, Lcom/facebook/stetho/server/http/LightHttpRequest;->uri:Landroid/net/Uri;

    .line 120
    const/4 v2, 0x2

    aget-object v2, v1, v2

    iput-object v2, p0, Lcom/facebook/stetho/server/http/LightHttpRequest;->protocol:Ljava/lang/String;

    .line 122
    invoke-static {p0, p1}, Lcom/facebook/stetho/server/http/LightHttpServer;->readHeaders(Lcom/facebook/stetho/server/http/LightHttpMessage;Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;)V

    .line 124
    return-object p0

    .line 115
    :cond_1
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid request line: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static writeFullResponse(Lcom/facebook/stetho/server/http/LightHttpResponse;Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageWriter;Ljava/io/OutputStream;)V
    .locals 1
    .param p0, "response"    # Lcom/facebook/stetho/server/http/LightHttpResponse;
    .param p1, "writer"    # Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageWriter;
    .param p2, "output"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 156
    invoke-virtual {p0}, Lcom/facebook/stetho/server/http/LightHttpResponse;->prepare()V

    .line 157
    invoke-static {p0, p1}, Lcom/facebook/stetho/server/http/LightHttpServer;->writeResponseMessage(Lcom/facebook/stetho/server/http/LightHttpResponse;Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageWriter;)V

    .line 158
    iget-object v0, p0, Lcom/facebook/stetho/server/http/LightHttpResponse;->body:Lcom/facebook/stetho/server/http/LightHttpBody;

    if-eqz v0, :cond_0

    .line 159
    iget-object v0, p0, Lcom/facebook/stetho/server/http/LightHttpResponse;->body:Lcom/facebook/stetho/server/http/LightHttpBody;

    invoke-virtual {v0, p2}, Lcom/facebook/stetho/server/http/LightHttpBody;->writeTo(Ljava/io/OutputStream;)V

    .line 161
    :cond_0
    return-void
.end method

.method public static writeResponseMessage(Lcom/facebook/stetho/server/http/LightHttpResponse;Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageWriter;)V
    .locals 6
    .param p0, "response"    # Lcom/facebook/stetho/server/http/LightHttpResponse;
    .param p1, "writer"    # Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageWriter;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 165
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "HTTP/1.1 "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/facebook/stetho/server/http/LightHttpResponse;->code:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/stetho/server/http/LightHttpResponse;->reasonPhrase:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageWriter;->writeLine(Ljava/lang/String;)V

    .line 166
    const/4 v0, 0x0

    .local v0, "i":I
    iget-object v1, p0, Lcom/facebook/stetho/server/http/LightHttpResponse;->headerNames:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    .local v1, "N":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 167
    iget-object v2, p0, Lcom/facebook/stetho/server/http/LightHttpResponse;->headerNames:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 168
    .local v2, "name":Ljava/lang/String;
    iget-object v3, p0, Lcom/facebook/stetho/server/http/LightHttpResponse;->headerValues:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 169
    .local v3, "value":Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageWriter;->writeLine(Ljava/lang/String;)V

    .line 166
    .end local v2    # "name":Ljava/lang/String;
    .end local v3    # "value":Ljava/lang/String;
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 171
    .end local v0    # "i":I
    .end local v1    # "N":I
    :cond_0
    invoke-virtual {p1}, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageWriter;->writeLine()V

    .line 172
    invoke-virtual {p1}, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageWriter;->flush()V

    .line 173
    return-void
.end method


# virtual methods
.method public serve(Lcom/facebook/stetho/server/SocketLike;)V
    .locals 10
    .param p1, "socket"    # Lcom/facebook/stetho/server/SocketLike;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 42
    new-instance v0, Lcom/facebook/stetho/server/LeakyBufferedInputStream;

    invoke-virtual {p1}, Lcom/facebook/stetho/server/SocketLike;->getInput()Ljava/io/InputStream;

    move-result-object v1

    const/16 v2, 0x400

    invoke-direct {v0, v1, v2}, Lcom/facebook/stetho/server/LeakyBufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    .line 43
    .local v0, "input":Lcom/facebook/stetho/server/LeakyBufferedInputStream;
    invoke-virtual {p1}, Lcom/facebook/stetho/server/SocketLike;->getOutput()Ljava/io/OutputStream;

    move-result-object v1

    .line 44
    .local v1, "output":Ljava/io/OutputStream;
    new-instance v2, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;

    invoke-direct {v2, v0}, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;-><init>(Ljava/io/BufferedInputStream;)V

    .line 45
    .local v2, "reader":Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;
    new-instance v3, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageWriter;

    new-instance v4, Ljava/io/BufferedOutputStream;

    invoke-direct {v4, v1}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {v3, v4}, Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageWriter;-><init>(Ljava/io/BufferedOutputStream;)V

    .line 47
    .local v3, "writer":Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageWriter;
    new-instance v4, Lcom/facebook/stetho/server/SocketLike;

    invoke-direct {v4, p1, v0}, Lcom/facebook/stetho/server/SocketLike;-><init>(Lcom/facebook/stetho/server/SocketLike;Lcom/facebook/stetho/server/LeakyBufferedInputStream;)V

    .line 48
    .local v4, "anotherSocketLike":Lcom/facebook/stetho/server/SocketLike;
    new-instance v5, Lcom/facebook/stetho/server/http/LightHttpRequest;

    invoke-direct {v5}, Lcom/facebook/stetho/server/http/LightHttpRequest;-><init>()V

    .line 49
    .local v5, "scratchRequest":Lcom/facebook/stetho/server/http/LightHttpRequest;
    new-instance v6, Lcom/facebook/stetho/server/http/LightHttpResponse;

    invoke-direct {v6}, Lcom/facebook/stetho/server/http/LightHttpResponse;-><init>()V

    .line 54
    .local v6, "scratchResponse":Lcom/facebook/stetho/server/http/LightHttpResponse;
    :goto_0
    invoke-static {v5, v2}, Lcom/facebook/stetho/server/http/LightHttpServer;->readRequestMessage(Lcom/facebook/stetho/server/http/LightHttpRequest;Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageReader;)Lcom/facebook/stetho/server/http/LightHttpRequest;

    move-result-object v7

    move-object v8, v7

    .local v8, "request":Lcom/facebook/stetho/server/http/LightHttpRequest;
    if-eqz v7, :cond_1

    .line 55
    move-object v7, v6

    .line 56
    .local v7, "response":Lcom/facebook/stetho/server/http/LightHttpResponse;
    invoke-virtual {v7}, Lcom/facebook/stetho/server/http/LightHttpResponse;->reset()V

    .line 60
    invoke-direct {p0, v4, v8, v7}, Lcom/facebook/stetho/server/http/LightHttpServer;->dispatchToHandler(Lcom/facebook/stetho/server/SocketLike;Lcom/facebook/stetho/server/http/LightHttpRequest;Lcom/facebook/stetho/server/http/LightHttpResponse;)Z

    move-result v9

    .line 61
    .local v9, "keepGoing":Z
    if-nez v9, :cond_0

    .line 63
    goto :goto_1

    .line 66
    :cond_0
    invoke-static {v7, v3, v1}, Lcom/facebook/stetho/server/http/LightHttpServer;->writeFullResponse(Lcom/facebook/stetho/server/http/LightHttpResponse;Lcom/facebook/stetho/server/http/LightHttpServer$HttpMessageWriter;Ljava/io/OutputStream;)V

    .line 67
    .end local v7    # "response":Lcom/facebook/stetho/server/http/LightHttpResponse;
    .end local v9    # "keepGoing":Z
    goto :goto_0

    .line 68
    :cond_1
    :goto_1
    return-void
.end method
