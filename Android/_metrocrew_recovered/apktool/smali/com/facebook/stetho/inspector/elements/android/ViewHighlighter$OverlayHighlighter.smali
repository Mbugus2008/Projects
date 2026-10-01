.class final Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;
.super Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;
.source "ViewHighlighter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "OverlayHighlighter"
.end annotation


# instance fields
.field private mBoundsToHighlight:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field

.field private mContentColor:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final mEmptyRect:Landroid/graphics/Rect;

.field private final mHandler:Landroid/os/Handler;

.field private final mHighlightOverlays:Lcom/facebook/stetho/inspector/elements/android/ViewHighlightOverlays;

.field private final mHighlightViewOnUiThreadRunnable:Ljava/lang/Runnable;

.field private final mHighlightedBounds:Landroid/graphics/Rect;

.field private mHighlightedView:Landroid/view/View;

.field private mViewToHighlight:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 76
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;-><init>()V

    .line 58
    invoke-static {}, Lcom/facebook/stetho/inspector/elements/android/ViewHighlightOverlays;->newInstance()Lcom/facebook/stetho/inspector/elements/android/ViewHighlightOverlays;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mHighlightOverlays:Lcom/facebook/stetho/inspector/elements/android/ViewHighlightOverlays;

    .line 62
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mHighlightedBounds:Landroid/graphics/Rect;

    .line 63
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mEmptyRect:Landroid/graphics/Rect;

    .line 65
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mViewToHighlight:Ljava/util/concurrent/atomic/AtomicReference;

    .line 66
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mBoundsToHighlight:Ljava/util/concurrent/atomic/AtomicReference;

    .line 67
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mContentColor:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 69
    new-instance v0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter$1;

    invoke-direct {v0, p0}, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter$1;-><init>(Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;)V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mHighlightViewOnUiThreadRunnable:Ljava/lang/Runnable;

    .line 77
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mHandler:Landroid/os/Handler;

    .line 78
    return-void
.end method

.method static synthetic access$100(Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;)V
    .locals 0
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;

    .line 53
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->highlightViewOnUiThread()V

    return-void
.end method

.method private highlightViewOnUiThread()V
    .locals 4

    .line 99
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mViewToHighlight:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 100
    .local v0, "viewToHighlight":Landroid/view/View;
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mBoundsToHighlight:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v1}, Ljava/util/concurrent/atomic/AtomicReference;->getAndSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Rect;

    .line 101
    .local v1, "boundsToHighlight":Landroid/graphics/Rect;
    if-nez v1, :cond_0

    .line 102
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mEmptyRect:Landroid/graphics/Rect;

    .line 105
    :cond_0
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mHighlightedView:Landroid/view/View;

    if-ne v0, v2, :cond_1

    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mHighlightedBounds:Landroid/graphics/Rect;

    invoke-virtual {v2, v1}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 106
    return-void

    .line 109
    :cond_1
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mHighlightedView:Landroid/view/View;

    if-eqz v2, :cond_2

    .line 110
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mHighlightOverlays:Lcom/facebook/stetho/inspector/elements/android/ViewHighlightOverlays;

    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mHighlightedView:Landroid/view/View;

    invoke-virtual {v2, v3}, Lcom/facebook/stetho/inspector/elements/android/ViewHighlightOverlays;->removeHighlight(Landroid/view/View;)V

    .line 113
    :cond_2
    if-eqz v0, :cond_3

    .line 114
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mHighlightOverlays:Lcom/facebook/stetho/inspector/elements/android/ViewHighlightOverlays;

    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mContentColor:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 117
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    .line 114
    invoke-virtual {v2, v0, v1, v3}, Lcom/facebook/stetho/inspector/elements/android/ViewHighlightOverlays;->highlightView(Landroid/view/View;Landroid/graphics/Rect;I)V

    .line 120
    :cond_3
    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mHighlightedView:Landroid/view/View;

    .line 122
    if-nez v1, :cond_4

    .line 123
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mHighlightedBounds:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->setEmpty()V

    goto :goto_0

    .line 125
    :cond_4
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mHighlightedBounds:Landroid/graphics/Rect;

    invoke-virtual {v2, v1}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 127
    :goto_0
    return-void
.end method

.method private setHighlightedViewImpl(Landroid/view/View;Landroid/graphics/Rect;I)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "bounds"    # Landroid/graphics/Rect;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "color"    # I

    .line 91
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mHighlightViewOnUiThreadRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 92
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mViewToHighlight:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 93
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mBoundsToHighlight:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 94
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mContentColor:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0, p3}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    .line 95
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->mHighlightViewOnUiThreadRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 96
    return-void
.end method


# virtual methods
.method public clearHighlight()V
    .locals 2

    .line 82
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v0, v1}, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->setHighlightedViewImpl(Landroid/view/View;Landroid/graphics/Rect;I)V

    .line 83
    return-void
.end method

.method public setHighlightedView(Landroid/view/View;Landroid/graphics/Rect;I)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "bounds"    # Landroid/graphics/Rect;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "color"    # I

    .line 87
    invoke-static {p1}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-direct {p0, v0, p2, p3}, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;->setHighlightedViewImpl(Landroid/view/View;Landroid/graphics/Rect;I)V

    .line 88
    return-void
.end method
