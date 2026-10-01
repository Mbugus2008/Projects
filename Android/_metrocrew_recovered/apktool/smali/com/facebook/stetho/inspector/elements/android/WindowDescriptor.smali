.class final Lcom/facebook/stetho/inspector/elements/android/WindowDescriptor;
.super Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;
.source "WindowDescriptor.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<",
        "Landroid/view/Window;",
        ">;",
        "Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor<",
        "Landroid/view/Window;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;-><init>()V

    return-void
.end method


# virtual methods
.method public getElementToHighlightAtPosition(Landroid/view/Window;IILandroid/graphics/Rect;)Ljava/lang/Object;
    .locals 4
    .param p1, "element"    # Landroid/view/Window;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "bounds"    # Landroid/graphics/Rect;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 39
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/android/WindowDescriptor;->getHost()Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    move-result-object v0

    .line 40
    .local v0, "host":Lcom/facebook/stetho/inspector/elements/Descriptor$Host;
    const/4 v1, 0x0

    .line 41
    .local v1, "view":Landroid/view/View;
    const/4 v2, 0x0

    .line 43
    .local v2, "descriptor":Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;
    instance-of v3, v0, Lcom/facebook/stetho/inspector/elements/android/AndroidDescriptorHost;

    if-eqz v3, :cond_0

    .line 44
    invoke-virtual {p1}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    move-result-object v1

    .line 45
    move-object v3, v0

    check-cast v3, Lcom/facebook/stetho/inspector/elements/android/AndroidDescriptorHost;

    invoke-interface {v3, v1}, Lcom/facebook/stetho/inspector/elements/android/AndroidDescriptorHost;->getHighlightableDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;

    move-result-object v2

    .line 48
    :cond_0
    if-nez v2, :cond_1

    const/4 v3, 0x0

    goto :goto_0

    .line 50
    :cond_1
    invoke-interface {v2, v1, p2, p3, p4}, Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;->getElementToHighlightAtPosition(Ljava/lang/Object;IILandroid/graphics/Rect;)Ljava/lang/Object;

    move-result-object v3

    .line 48
    :goto_0
    return-object v3
.end method

.method public bridge synthetic getElementToHighlightAtPosition(Ljava/lang/Object;IILandroid/graphics/Rect;)Ljava/lang/Object;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 20
    check-cast p1, Landroid/view/Window;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/facebook/stetho/inspector/elements/android/WindowDescriptor;->getElementToHighlightAtPosition(Landroid/view/Window;IILandroid/graphics/Rect;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getViewAndBoundsForHighlighting(Landroid/view/Window;Landroid/graphics/Rect;)Landroid/view/View;
    .locals 1
    .param p1, "element"    # Landroid/view/Window;
    .param p2, "bounds"    # Landroid/graphics/Rect;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 33
    invoke-virtual {p1}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getViewAndBoundsForHighlighting(Ljava/lang/Object;Landroid/graphics/Rect;)Landroid/view/View;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 20
    check-cast p1, Landroid/view/Window;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/android/WindowDescriptor;->getViewAndBoundsForHighlighting(Landroid/view/Window;Landroid/graphics/Rect;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method protected onGetChildren(Landroid/view/Window;Lcom/facebook/stetho/common/Accumulator;)V
    .locals 1
    .param p1, "element"    # Landroid/view/Window;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/Window;",
            "Lcom/facebook/stetho/common/Accumulator<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 24
    .local p2, "children":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    invoke-virtual {p1}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    move-result-object v0

    .line 25
    .local v0, "decorView":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 26
    invoke-interface {p2, v0}, Lcom/facebook/stetho/common/Accumulator;->store(Ljava/lang/Object;)V

    .line 28
    :cond_0
    return-void
.end method

.method protected bridge synthetic onGetChildren(Ljava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V
    .locals 0

    .line 20
    check-cast p1, Landroid/view/Window;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/android/WindowDescriptor;->onGetChildren(Landroid/view/Window;Lcom/facebook/stetho/common/Accumulator;)V

    return-void
.end method
