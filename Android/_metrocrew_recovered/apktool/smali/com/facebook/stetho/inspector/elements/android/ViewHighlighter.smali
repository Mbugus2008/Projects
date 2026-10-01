.class abstract Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;
.super Ljava/lang/Object;
.source "ViewHighlighter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;,
        Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$NoopHighlighter;
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    return-void
.end method

.method public static newInstance()Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter;
    .locals 1

    .line 27
    nop

    .line 28
    new-instance v0, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/elements/android/ViewHighlighter$OverlayHighlighter;-><init>()V

    return-object v0
.end method


# virtual methods
.method public abstract clearHighlight()V
.end method

.method public abstract setHighlightedView(Landroid/view/View;Landroid/graphics/Rect;I)V
    .param p2    # Landroid/graphics/Rect;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
.end method
