.class public Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;
.super Ljava/lang/Object;
.source "JsonRpcError.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;
    }
.end annotation


# instance fields
.field public code:Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;
    .annotation runtime Lcom/facebook/stetho/json/annotation/JsonProperty;
        required = true
    .end annotation
.end field

.field public data:Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/json/annotation/JsonProperty;
    .end annotation
.end field

.field public message:Ljava/lang/String;
    .annotation runtime Lcom/facebook/stetho/json/annotation/JsonProperty;
        required = true
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    return-void
.end method

.method public constructor <init>(Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "code"    # Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "data"    # Lorg/json/JSONObject;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput-object p1, p0, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;->code:Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;

    .line 34
    iput-object p2, p0, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;->message:Ljava/lang/String;

    .line 35
    iput-object p3, p0, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;->data:Lorg/json/JSONObject;

    .line 36
    return-void
.end method
