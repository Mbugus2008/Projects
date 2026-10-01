.class public Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$ExactMagicMatcher;
.super Ljava/lang/Object;
.source "ProtocolDetectingSocketHandler.java"

# interfaces
.implements Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$MagicMatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ExactMagicMatcher"
.end annotation


# instance fields
.field private final mMagic:[B


# direct methods
.method public constructor <init>([B)V
    .locals 0
    .param p1, "magic"    # [B

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    iput-object p1, p0, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$ExactMagicMatcher;->mMagic:[B

    .line 78
    return-void
.end method


# virtual methods
.method public matches(Ljava/io/InputStream;)Z
    .locals 3
    .param p1, "in"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    iget-object v0, p0, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$ExactMagicMatcher;->mMagic:[B

    array-length v0, v0

    new-array v0, v0, [B

    .line 83
    .local v0, "buf":[B
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .line 84
    .local v1, "n":I
    array-length v2, v0

    if-ne v1, v2, :cond_0

    iget-object v2, p0, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$ExactMagicMatcher;->mMagic:[B

    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return v2
.end method
