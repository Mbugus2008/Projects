.class final Lcom/facebook/stetho/inspector/elements/android/FragmentDescriptor;
.super Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;
.source "FragmentDescriptor.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<",
        "Ljava/lang/Object;",
        ">;",
        "Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field private static final ID_ATTRIBUTE_NAME:Ljava/lang/String; = "id"

.field private static final TAG_ATTRIBUTE_NAME:Ljava/lang/String; = "tag"


# instance fields
.field private final mAccessor:Lcom/facebook/stetho/common/android/FragmentAccessor;


# direct methods
.method private constructor <init>(Lcom/facebook/stetho/common/android/FragmentCompat;)V
    .locals 1
    .param p1, "compat"    # Lcom/facebook/stetho/common/android/FragmentCompat;

    .line 46
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;-><init>()V

    .line 47
    invoke-virtual {p1}, Lcom/facebook/stetho/common/android/FragmentCompat;->forFragment()Lcom/facebook/stetho/common/android/FragmentAccessor;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/FragmentDescriptor;->mAccessor:Lcom/facebook/stetho/common/android/FragmentAccessor;

    .line 48
    return-void
.end method

.method private static maybeRegister(Lcom/facebook/stetho/inspector/elements/DescriptorMap;Lcom/facebook/stetho/common/android/FragmentCompat;)V
    .locals 3
    .param p0, "map"    # Lcom/facebook/stetho/inspector/elements/DescriptorMap;
    .param p1, "compat"    # Lcom/facebook/stetho/common/android/FragmentCompat;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 39
    if-eqz p1, :cond_0

    .line 40
    invoke-virtual {p1}, Lcom/facebook/stetho/common/android/FragmentCompat;->getFragmentClass()Ljava/lang/Class;

    move-result-object v0

    .line 41
    .local v0, "fragmentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Adding support for %s"

    invoke-static {v2, v1}, Lcom/facebook/stetho/common/LogUtil;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 42
    new-instance v1, Lcom/facebook/stetho/inspector/elements/android/FragmentDescriptor;

    invoke-direct {v1, p1}, Lcom/facebook/stetho/inspector/elements/android/FragmentDescriptor;-><init>(Lcom/facebook/stetho/common/android/FragmentCompat;)V

    invoke-virtual {p0, v0, v1}, Lcom/facebook/stetho/inspector/elements/DescriptorMap;->registerDescriptor(Ljava/lang/Class;Lcom/facebook/stetho/inspector/elements/Descriptor;)Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    .line 44
    .end local v0    # "fragmentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    return-void
.end method

.method public static register(Lcom/facebook/stetho/inspector/elements/DescriptorMap;)Lcom/facebook/stetho/inspector/elements/DescriptorMap;
    .locals 1
    .param p0, "map"    # Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    .line 33
    invoke-static {}, Lcom/facebook/stetho/common/android/FragmentCompat;->getSupportLibInstance()Lcom/facebook/stetho/common/android/FragmentCompat;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/facebook/stetho/inspector/elements/android/FragmentDescriptor;->maybeRegister(Lcom/facebook/stetho/inspector/elements/DescriptorMap;Lcom/facebook/stetho/common/android/FragmentCompat;)V

    .line 34
    invoke-static {}, Lcom/facebook/stetho/common/android/FragmentCompat;->getFrameworkInstance()Lcom/facebook/stetho/common/android/FragmentCompat;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/facebook/stetho/inspector/elements/android/FragmentDescriptor;->maybeRegister(Lcom/facebook/stetho/inspector/elements/DescriptorMap;Lcom/facebook/stetho/common/android/FragmentCompat;)V

    .line 35
    return-object p0
.end method


# virtual methods
.method public getElementToHighlightAtPosition(Ljava/lang/Object;IILandroid/graphics/Rect;)Ljava/lang/Object;
    .locals 4
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "bounds"    # Landroid/graphics/Rect;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 84
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/android/FragmentDescriptor;->getHost()Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    move-result-object v0

    .line 85
    .local v0, "host":Lcom/facebook/stetho/inspector/elements/Descriptor$Host;
    const/4 v1, 0x0

    .line 86
    .local v1, "view":Landroid/view/View;
    const/4 v2, 0x0

    .line 88
    .local v2, "descriptor":Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;
    instance-of v3, v0, Lcom/facebook/stetho/inspector/elements/android/AndroidDescriptorHost;

    if-eqz v3, :cond_0

    .line 89
    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/android/FragmentDescriptor;->mAccessor:Lcom/facebook/stetho/common/android/FragmentAccessor;

    invoke-interface {v3, p1}, Lcom/facebook/stetho/common/android/FragmentAccessor;->getView(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v1

    .line 90
    move-object v3, v0

    check-cast v3, Lcom/facebook/stetho/inspector/elements/android/AndroidDescriptorHost;

    invoke-interface {v3, v1}, Lcom/facebook/stetho/inspector/elements/android/AndroidDescriptorHost;->getHighlightableDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;

    move-result-object v2

    .line 93
    :cond_0
    if-nez v2, :cond_1

    const/4 v3, 0x0

    goto :goto_0

    .line 95
    :cond_1
    invoke-interface {v2, v1, p2, p3, p4}, Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;->getElementToHighlightAtPosition(Ljava/lang/Object;IILandroid/graphics/Rect;)Ljava/lang/Object;

    move-result-object v3

    .line 93
    :goto_0
    return-object v3
.end method

.method public getViewAndBoundsForHighlighting(Ljava/lang/Object;Landroid/graphics/Rect;)Landroid/view/View;
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "bounds"    # Landroid/graphics/Rect;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 78
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/FragmentDescriptor;->mAccessor:Lcom/facebook/stetho/common/android/FragmentAccessor;

    invoke-interface {v0, p1}, Lcom/facebook/stetho/common/android/FragmentAccessor;->getView(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected onGetAttributes(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;)V
    .locals 3
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "attributes"    # Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;

    .line 52
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/FragmentDescriptor;->mAccessor:Lcom/facebook/stetho/common/android/FragmentAccessor;

    invoke-interface {v0, p1}, Lcom/facebook/stetho/common/android/FragmentAccessor;->getId(Ljava/lang/Object;)I

    move-result v0

    .line 53
    .local v0, "id":I
    if-eqz v0, :cond_0

    .line 54
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/android/FragmentDescriptor;->mAccessor:Lcom/facebook/stetho/common/android/FragmentAccessor;

    .line 56
    invoke-interface {v1, p1}, Lcom/facebook/stetho/common/android/FragmentAccessor;->getResources(Ljava/lang/Object;)Landroid/content/res/Resources;

    move-result-object v1

    .line 54
    invoke-static {p1, v1, v0}, Lcom/facebook/stetho/common/android/ResourcesUtil;->getIdStringQuietly(Ljava/lang/Object;Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v1

    .line 58
    .local v1, "value":Ljava/lang/String;
    const-string v2, "id"

    invoke-interface {p2, v2, v1}, Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;->store(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .end local v1    # "value":Ljava/lang/String;
    :cond_0
    iget-object v1, p0, Lcom/facebook/stetho/inspector/elements/android/FragmentDescriptor;->mAccessor:Lcom/facebook/stetho/common/android/FragmentAccessor;

    invoke-interface {v1, p1}, Lcom/facebook/stetho/common/android/FragmentAccessor;->getTag(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 62
    .local v1, "tag":Ljava/lang/String;
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1

    .line 63
    const-string/jumbo v2, "tag"

    invoke-interface {p2, v2, v1}, Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;->store(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    :cond_1
    return-void
.end method

.method protected onGetChildren(Ljava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lcom/facebook/stetho/common/Accumulator<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 69
    .local p2, "children":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/FragmentDescriptor;->mAccessor:Lcom/facebook/stetho/common/android/FragmentAccessor;

    invoke-interface {v0, p1}, Lcom/facebook/stetho/common/android/FragmentAccessor;->getView(Ljava/lang/Object;)Landroid/view/View;

    move-result-object v0

    .line 70
    .local v0, "view":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 71
    invoke-interface {p2, v0}, Lcom/facebook/stetho/common/Accumulator;->store(Ljava/lang/Object;)V

    .line 73
    :cond_0
    return-void
.end method
