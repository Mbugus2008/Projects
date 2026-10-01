.class final Lcom/facebook/stetho/inspector/elements/android/ViewGroupDescriptor;
.super Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;
.source "ViewGroupDescriptor.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<",
        "Landroid/view/ViewGroup;",
        ">;",
        "Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor<",
        "Landroid/view/ViewGroup;",
        ">;"
    }
.end annotation


# instance fields
.field private final mViewToElementMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 37
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;-><init>()V

    .line 34
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    .line 35
    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewGroupDescriptor;->mViewToElementMap:Ljava/util/Map;

    .line 38
    return-void
.end method

.method private getElement(Landroid/view/View;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "childView"    # Landroid/view/View;
    .param p2, "value"    # Ljava/lang/Object;

    .line 89
    if-ne p2, p0, :cond_0

    .line 90
    return-object p1

    .line 92
    :cond_0
    move-object v0, p2

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private getElementForView(Landroid/view/ViewGroup;Landroid/view/View;)Ljava/lang/Object;
    .locals 4
    .param p1, "parentView"    # Landroid/view/ViewGroup;
    .param p2, "childView"    # Landroid/view/View;

    .line 56
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewGroupDescriptor;->mViewToElementMap:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 57
    .local v0, "value":Ljava/lang/Object;
    if-eqz v0, :cond_1

    .line 58
    invoke-direct {p0, p2, v0}, Lcom/facebook/stetho/inspector/elements/android/ViewGroupDescriptor;->getElement(Landroid/view/View;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 62
    .local v1, "element":Ljava/lang/Object;
    if-eqz v1, :cond_0

    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-ne v2, p1, :cond_0

    .line 63
    return-object v1

    .line 65
    :cond_0
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/android/ViewGroupDescriptor;->mViewToElementMap:Ljava/util/Map;

    invoke-interface {v2, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .end local v1    # "element":Ljava/lang/Object;
    :cond_1
    invoke-static {p2}, Lcom/facebook/stetho/common/android/FragmentCompatUtil;->findFragmentForView(Landroid/view/View;)Ljava/lang/Object;

    move-result-object v1

    .line 75
    .local v1, "fragment":Ljava/lang/Object;
    if-eqz v1, :cond_2

    invoke-static {v1}, Lcom/facebook/stetho/common/android/FragmentCompatUtil;->isDialogFragment(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 76
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/android/ViewGroupDescriptor;->mViewToElementMap:Ljava/util/Map;

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v2, p2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    return-object v1

    .line 82
    :cond_2
    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/android/ViewGroupDescriptor;->mViewToElementMap:Ljava/util/Map;

    invoke-interface {v2, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    return-object p2
.end method

.method private isChildVisible(Landroid/view/View;)Z
    .locals 1
    .param p1, "child"    # Landroid/view/View;

    .line 52
    instance-of v0, p1, Lcom/facebook/stetho/inspector/elements/android/DocumentHiddenView;

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method


# virtual methods
.method public getElementToHighlightAtPosition(Landroid/view/ViewGroup;IILandroid/graphics/Rect;)Ljava/lang/Object;
    .locals 4
    .param p1, "element"    # Landroid/view/ViewGroup;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "bounds"    # Landroid/graphics/Rect;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 105
    const/4 v0, 0x0

    .line 106
    .local v0, "hitChild":Landroid/view/View;
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    .local v1, "i":I
    :goto_0
    if-ltz v1, :cond_1

    .line 107
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 108
    .local v2, "childView":Landroid/view/View;
    invoke-direct {p0, v2}, Lcom/facebook/stetho/inspector/elements/android/ViewGroupDescriptor;->isChildVisible(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 109
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_0

    .line 110
    invoke-virtual {v2, p4}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 111
    invoke-virtual {p4, p2, p3}, Landroid/graphics/Rect;->contains(II)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 112
    move-object v0, v2

    .line 113
    goto :goto_1

    .line 106
    .end local v2    # "childView":Landroid/view/View;
    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 118
    .end local v1    # "i":I
    :cond_1
    :goto_1
    if-eqz v0, :cond_2

    .line 119
    return-object v0

    .line 121
    :cond_2
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWidth()I

    move-result v1

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {p4, v3, v3, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    .line 122
    return-object p1
.end method

.method public bridge synthetic getElementToHighlightAtPosition(Ljava/lang/Object;IILandroid/graphics/Rect;)Ljava/lang/Object;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 25
    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/facebook/stetho/inspector/elements/android/ViewGroupDescriptor;->getElementToHighlightAtPosition(Landroid/view/ViewGroup;IILandroid/graphics/Rect;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getViewAndBoundsForHighlighting(Landroid/view/ViewGroup;Landroid/graphics/Rect;)Landroid/view/View;
    .locals 0
    .param p1, "element"    # Landroid/view/ViewGroup;
    .param p2, "bounds"    # Landroid/graphics/Rect;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 99
    return-object p1
.end method

.method public bridge synthetic getViewAndBoundsForHighlighting(Ljava/lang/Object;Landroid/graphics/Rect;)Landroid/view/View;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 25
    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/android/ViewGroupDescriptor;->getViewAndBoundsForHighlighting(Landroid/view/ViewGroup;Landroid/graphics/Rect;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method protected onGetChildren(Landroid/view/ViewGroup;Lcom/facebook/stetho/common/Accumulator;)V
    .locals 4
    .param p1, "element"    # Landroid/view/ViewGroup;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Lcom/facebook/stetho/common/Accumulator<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 42
    .local p2, "children":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    .local v1, "N":I
    :goto_0
    if-ge v0, v1, :cond_1

    .line 43
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 44
    .local v2, "childView":Landroid/view/View;
    invoke-direct {p0, v2}, Lcom/facebook/stetho/inspector/elements/android/ViewGroupDescriptor;->isChildVisible(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 45
    invoke-direct {p0, p1, v2}, Lcom/facebook/stetho/inspector/elements/android/ViewGroupDescriptor;->getElementForView(Landroid/view/ViewGroup;Landroid/view/View;)Ljava/lang/Object;

    move-result-object v3

    .line 46
    .local v3, "childElement":Ljava/lang/Object;
    invoke-interface {p2, v3}, Lcom/facebook/stetho/common/Accumulator;->store(Ljava/lang/Object;)V

    .line 42
    .end local v2    # "childView":Landroid/view/View;
    .end local v3    # "childElement":Ljava/lang/Object;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 49
    .end local v0    # "i":I
    .end local v1    # "N":I
    :cond_1
    return-void
.end method

.method protected bridge synthetic onGetChildren(Ljava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V
    .locals 0

    .line 25
    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/android/ViewGroupDescriptor;->onGetChildren(Landroid/view/ViewGroup;Lcom/facebook/stetho/common/Accumulator;)V

    return-void
.end method
