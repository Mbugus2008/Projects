.class Lcom/google/gson/stream/JsonReader$1;
.super Lcom/google/gson/internal/JsonReaderInternalAccess;
.source "JsonReader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/gson/stream/JsonReader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1860
    invoke-direct {p0}, Lcom/google/gson/internal/JsonReaderInternalAccess;-><init>()V

    return-void
.end method


# virtual methods
.method public promoteNameToValue(Lcom/google/gson/stream/JsonReader;)V
    .locals 2
    .param p1, "reader"    # Lcom/google/gson/stream/JsonReader;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1863
    instance-of v0, p1, Lcom/google/gson/internal/bind/JsonTreeReader;

    if-eqz v0, :cond_0

    .line 1864
    move-object v0, p1

    check-cast v0, Lcom/google/gson/internal/bind/JsonTreeReader;

    invoke-virtual {v0}, Lcom/google/gson/internal/bind/JsonTreeReader;->promoteNameToValue()V

    .line 1865
    return-void

    .line 1867
    :cond_0
    iget v0, p1, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 1868
    .local v0, "p":I
    if-nez v0, :cond_1

    .line 1869
    invoke-virtual {p1}, Lcom/google/gson/stream/JsonReader;->doPeek()I

    move-result v0

    .line 1871
    :cond_1
    const/16 v1, 0xd

    if-ne v0, v1, :cond_2

    .line 1872
    const/16 v1, 0x9

    iput v1, p1, Lcom/google/gson/stream/JsonReader;->peeked:I

    goto :goto_0

    .line 1873
    :cond_2
    const/16 v1, 0xc

    if-ne v0, v1, :cond_3

    .line 1874
    const/16 v1, 0x8

    iput v1, p1, Lcom/google/gson/stream/JsonReader;->peeked:I

    goto :goto_0

    .line 1875
    :cond_3
    const/16 v1, 0xe

    if-ne v0, v1, :cond_4

    .line 1876
    const/16 v1, 0xa

    iput v1, p1, Lcom/google/gson/stream/JsonReader;->peeked:I

    .line 1880
    :goto_0
    return-void

    .line 1878
    :cond_4
    const-string v1, "a name"

    invoke-static {p1, v1}, Lcom/google/gson/stream/JsonReader;->access$000(Lcom/google/gson/stream/JsonReader;Ljava/lang/String;)Ljava/lang/IllegalStateException;

    move-result-object v1

    throw v1
.end method
