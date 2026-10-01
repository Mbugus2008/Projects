.class public Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;
.super Ljava/lang/Object;
.source "DefaultResponseHandler.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/network/ResponseHandler;


# instance fields
.field private mBytesRead:I

.field private mDecodedBytesRead:I

.field private final mEventReporter:Lcom/facebook/stetho/inspector/network/NetworkEventReporter;

.field private final mRequestId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/facebook/stetho/inspector/network/NetworkEventReporter;Ljava/lang/String;)V
    .locals 1
    .param p1, "eventReporter"    # Lcom/facebook/stetho/inspector/network/NetworkEventReporter;
    .param p2, "requestId"    # Ljava/lang/String;

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, 0x0

    iput v0, p0, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->mBytesRead:I

    .line 20
    const/4 v0, -0x1

    iput v0, p0, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->mDecodedBytesRead:I

    .line 23
    iput-object p1, p0, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->mEventReporter:Lcom/facebook/stetho/inspector/network/NetworkEventReporter;

    .line 24
    iput-object p2, p0, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->mRequestId:Ljava/lang/String;

    .line 25
    return-void
.end method

.method private reportDataReceived()V
    .locals 4

    .line 51
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->mEventReporter:Lcom/facebook/stetho/inspector/network/NetworkEventReporter;

    iget-object v1, p0, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->mRequestId:Ljava/lang/String;

    iget v2, p0, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->mBytesRead:I

    iget v3, p0, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->mDecodedBytesRead:I

    if-ltz v3, :cond_0

    iget v3, p0, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->mDecodedBytesRead:I

    goto :goto_0

    :cond_0
    iget v3, p0, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->mBytesRead:I

    :goto_0
    invoke-interface {v0, v1, v2, v3}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter;->dataReceived(Ljava/lang/String;II)V

    .line 55
    return-void
.end method


# virtual methods
.method public onEOF()V
    .locals 2

    .line 41
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->reportDataReceived()V

    .line 42
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->mEventReporter:Lcom/facebook/stetho/inspector/network/NetworkEventReporter;

    iget-object v1, p0, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->mRequestId:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter;->responseReadFinished(Ljava/lang/String;)V

    .line 43
    return-void
.end method

.method public onError(Ljava/io/IOException;)V
    .locals 3
    .param p1, "e"    # Ljava/io/IOException;

    .line 46
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->reportDataReceived()V

    .line 47
    iget-object v0, p0, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->mEventReporter:Lcom/facebook/stetho/inspector/network/NetworkEventReporter;

    iget-object v1, p0, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->mRequestId:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/facebook/stetho/inspector/network/NetworkEventReporter;->responseReadFailed(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method public onRead(I)V
    .locals 1
    .param p1, "numBytes"    # I

    .line 29
    iget v0, p0, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->mBytesRead:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->mBytesRead:I

    .line 30
    return-void
.end method

.method public onReadDecoded(I)V
    .locals 2
    .param p1, "numBytes"    # I

    .line 34
    iget v0, p0, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->mDecodedBytesRead:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 35
    const/4 v0, 0x0

    iput v0, p0, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->mDecodedBytesRead:I

    .line 37
    :cond_0
    iget v0, p0, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->mDecodedBytesRead:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/facebook/stetho/inspector/network/DefaultResponseHandler;->mDecodedBytesRead:I

    .line 38
    return-void
.end method
