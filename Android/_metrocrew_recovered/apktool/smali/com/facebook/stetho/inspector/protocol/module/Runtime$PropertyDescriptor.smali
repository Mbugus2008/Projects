.class Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;
.super Ljava/lang/Object;
.source "Runtime.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/protocol/module/Runtime;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PropertyDescriptor"
.end annotation


# instance fields
.field public final configurable:Z
    .annotation runtime Lcom/facebook/stetho/json/annotation/JsonProperty;
        required = true
    .end annotation
.end field

.field public final enumerable:Z
    .annotation runtime Lcom/facebook/stetho/json/annotation/JsonProperty;
        required = true
    .end annotation
.end field

.field public final isOwn:Z
    .annotation runtime Lcom/facebook/stetho/json/annotation/JsonProperty;
        required = true
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation runtime Lcom/facebook/stetho/json/annotation/JsonProperty;
        required = true
    .end annotation
.end field

.field public value:Lcom/facebook/stetho/inspector/protocol/module/Runtime$RemoteObject;
    .annotation runtime Lcom/facebook/stetho/json/annotation/JsonProperty;
        required = true
    .end annotation
.end field

.field public final writable:Z
    .annotation runtime Lcom/facebook/stetho/json/annotation/JsonProperty;
        required = true
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 531
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 538
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;->isOwn:Z

    .line 541
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;->configurable:Z

    .line 544
    iput-boolean v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;->enumerable:Z

    .line 547
    iput-boolean v1, p0, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;->writable:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/stetho/inspector/protocol/module/Runtime$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/facebook/stetho/inspector/protocol/module/Runtime$1;

    .line 531
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/protocol/module/Runtime$PropertyDescriptor;-><init>()V

    return-void
.end method
