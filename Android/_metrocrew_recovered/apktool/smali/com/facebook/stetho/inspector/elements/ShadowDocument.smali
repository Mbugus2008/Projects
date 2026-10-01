.class public final Lcom/facebook/stetho/inspector/elements/ShadowDocument;
.super Ljava/lang/Object;
.source "ShadowDocument.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/elements/DocumentView;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/elements/ShadowDocument$Update;,
        Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;
    }
.end annotation


# instance fields
.field private final mElementToInfoMap:Ljava/util/IdentityHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/IdentityHashMap<",
            "Ljava/lang/Object;",
            "Lcom/facebook/stetho/inspector/elements/ElementInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mIsUpdating:Z

.field private final mRootElement:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 1
    .param p1, "rootElement"    # Ljava/lang/Object;

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ljava/util/IdentityHashMap;

    invoke-direct {v0}, Ljava/util/IdentityHashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->mElementToInfoMap:Ljava/util/IdentityHashMap;

    .line 31
    invoke-static {p1}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->mRootElement:Ljava/lang/Object;

    .line 32
    return-void
.end method

.method static synthetic access$000(Lcom/facebook/stetho/inspector/elements/ShadowDocument;)Ljava/util/IdentityHashMap;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    .line 25
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->mElementToInfoMap:Ljava/util/IdentityHashMap;

    return-object v0
.end method

.method static synthetic access$100(Lcom/facebook/stetho/inspector/elements/ShadowDocument;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    .line 25
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->mRootElement:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$200(Lcom/facebook/stetho/inspector/elements/ShadowDocument;)Z
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/ShadowDocument;

    .line 25
    iget-boolean v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->mIsUpdating:Z

    return v0
.end method

.method static synthetic access$202(Lcom/facebook/stetho/inspector/elements/ShadowDocument;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/ShadowDocument;
    .param p1, "x1"    # Z

    .line 25
    iput-boolean p1, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->mIsUpdating:Z

    return p1
.end method


# virtual methods
.method public beginUpdate()Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;
    .locals 1

    .line 45
    iget-boolean v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->mIsUpdating:Z

    if-nez v0, :cond_0

    .line 49
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->mIsUpdating:Z

    .line 51
    new-instance v0, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;

    invoke-direct {v0, p0}, Lcom/facebook/stetho/inspector/elements/ShadowDocument$UpdateBuilder;-><init>(Lcom/facebook/stetho/inspector/elements/ShadowDocument;)V

    return-object v0

    .line 46
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method public getElementInfo(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/ElementInfo;
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;

    .line 41
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->mElementToInfoMap:Ljava/util/IdentityHashMap;

    invoke-virtual {v0, p1}, Ljava/util/IdentityHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/elements/ElementInfo;

    return-object v0
.end method

.method public getRootElement()Ljava/lang/Object;
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/ShadowDocument;->mRootElement:Ljava/lang/Object;

    return-object v0
.end method
