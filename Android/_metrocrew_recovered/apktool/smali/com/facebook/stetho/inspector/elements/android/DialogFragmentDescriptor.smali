.class final Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;
.super Lcom/facebook/stetho/inspector/elements/Descriptor;
.source "DialogFragmentDescriptor.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/elements/ChainedDescriptor;
.implements Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/stetho/inspector/elements/Descriptor<",
        "Ljava/lang/Object;",
        ">;",
        "Lcom/facebook/stetho/inspector/elements/ChainedDescriptor<",
        "Ljava/lang/Object;",
        ">;",
        "Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field private final mAccessor:Lcom/facebook/stetho/common/android/DialogFragmentAccessor;

.field private mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/stetho/inspector/elements/Descriptor<",
            "-",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/facebook/stetho/common/android/FragmentCompat;)V
    .locals 1
    .param p1, "compat"    # Lcom/facebook/stetho/common/android/FragmentCompat;

    .line 51
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Descriptor;-><init>()V

    .line 52
    invoke-virtual {p1}, Lcom/facebook/stetho/common/android/FragmentCompat;->forDialogFragment()Lcom/facebook/stetho/common/android/DialogFragmentAccessor;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;->mAccessor:Lcom/facebook/stetho/common/android/DialogFragmentAccessor;

    .line 53
    return-void
.end method

.method private static maybeRegister(Lcom/facebook/stetho/inspector/elements/DescriptorMap;Lcom/facebook/stetho/common/android/FragmentCompat;)V
    .locals 3
    .param p0, "map"    # Lcom/facebook/stetho/inspector/elements/DescriptorMap;
    .param p1, "compat"    # Lcom/facebook/stetho/common/android/FragmentCompat;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 44
    if-eqz p1, :cond_0

    .line 45
    invoke-virtual {p1}, Lcom/facebook/stetho/common/android/FragmentCompat;->getDialogFragmentClass()Ljava/lang/Class;

    move-result-object v0

    .line 46
    .local v0, "dialogFragmentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v1, "Adding support for %s"

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/facebook/stetho/common/LogUtil;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 47
    new-instance v1, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;

    invoke-direct {v1, p1}, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;-><init>(Lcom/facebook/stetho/common/android/FragmentCompat;)V

    invoke-virtual {p0, v0, v1}, Lcom/facebook/stetho/inspector/elements/DescriptorMap;->registerDescriptor(Ljava/lang/Class;Lcom/facebook/stetho/inspector/elements/Descriptor;)Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    .line 49
    .end local v0    # "dialogFragmentClass":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    return-void
.end method

.method public static register(Lcom/facebook/stetho/inspector/elements/DescriptorMap;)Lcom/facebook/stetho/inspector/elements/DescriptorMap;
    .locals 1
    .param p0, "map"    # Lcom/facebook/stetho/inspector/elements/DescriptorMap;

    .line 38
    invoke-static {}, Lcom/facebook/stetho/common/android/FragmentCompat;->getSupportLibInstance()Lcom/facebook/stetho/common/android/FragmentCompat;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;->maybeRegister(Lcom/facebook/stetho/inspector/elements/DescriptorMap;Lcom/facebook/stetho/common/android/FragmentCompat;)V

    .line 39
    invoke-static {}, Lcom/facebook/stetho/common/android/FragmentCompat;->getFrameworkInstance()Lcom/facebook/stetho/common/android/FragmentCompat;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;->maybeRegister(Lcom/facebook/stetho/inspector/elements/DescriptorMap;Lcom/facebook/stetho/common/android/FragmentCompat;)V

    .line 40
    return-object p0
.end method


# virtual methods
.method public getAttributes(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;)V
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "attributes"    # Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;

    .line 112
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getAttributes(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;)V

    .line 113
    return-void
.end method

.method public getChildren(Ljava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V
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

    .line 107
    .local p2, "children":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;->mAccessor:Lcom/facebook/stetho/common/android/DialogFragmentAccessor;

    invoke-interface {v0, p1}, Lcom/facebook/stetho/common/android/DialogFragmentAccessor;->getDialog(Ljava/lang/Object;)Landroid/app/Dialog;

    move-result-object v0

    invoke-interface {p2, v0}, Lcom/facebook/stetho/common/Accumulator;->store(Ljava/lang/Object;)V

    .line 108
    return-void
.end method

.method public getComputedStyles(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;)V
    .locals 0
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "styles"    # Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;

    .line 168
    return-void
.end method

.method public getElementToHighlightAtPosition(Ljava/lang/Object;IILandroid/graphics/Rect;)Ljava/lang/Object;
    .locals 4
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "x"    # I
    .param p3, "y"    # I
    .param p4, "bounds"    # Landroid/graphics/Rect;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 140
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;->getHost()Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    move-result-object v0

    .line 141
    .local v0, "host":Lcom/facebook/stetho/inspector/elements/Descriptor$Host;
    const/4 v1, 0x0

    .line 142
    .local v1, "dialog":Landroid/app/Dialog;
    const/4 v2, 0x0

    .line 144
    .local v2, "descriptor":Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;
    instance-of v3, v0, Lcom/facebook/stetho/inspector/elements/android/AndroidDescriptorHost;

    if-eqz v3, :cond_0

    .line 145
    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;->mAccessor:Lcom/facebook/stetho/common/android/DialogFragmentAccessor;

    invoke-interface {v3, p1}, Lcom/facebook/stetho/common/android/DialogFragmentAccessor;->getDialog(Ljava/lang/Object;)Landroid/app/Dialog;

    move-result-object v1

    .line 146
    move-object v3, v0

    check-cast v3, Lcom/facebook/stetho/inspector/elements/android/AndroidDescriptorHost;

    invoke-interface {v3, v1}, Lcom/facebook/stetho/inspector/elements/android/AndroidDescriptorHost;->getHighlightableDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;

    move-result-object v2

    .line 149
    :cond_0
    if-nez v2, :cond_1

    const/4 v3, 0x0

    goto :goto_0

    .line 151
    :cond_1
    invoke-interface {v2, v1, p2, p3, p4}, Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;->getElementToHighlightAtPosition(Ljava/lang/Object;IILandroid/graphics/Rect;)Ljava/lang/Object;

    move-result-object v3

    .line 149
    :goto_0
    return-object v3
.end method

.method public getLocalName(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;

    .line 89
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getLocalName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNodeName(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;

    .line 84
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getNodeName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNodeType(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeType;
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;

    .line 79
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getNodeType(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeType;

    move-result-object v0

    return-object v0
.end method

.method public getNodeValue(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 95
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getNodeValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getStyleRuleNames(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/StyleRuleNameAccumulator;)V
    .locals 0
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "accumulator"    # Lcom/facebook/stetho/inspector/elements/StyleRuleNameAccumulator;

    .line 156
    return-void
.end method

.method public getStyles(Ljava/lang/Object;Ljava/lang/String;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V
    .locals 0
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "ruleName"    # Ljava/lang/String;
    .param p3, "accumulator"    # Lcom/facebook/stetho/inspector/elements/StyleAccumulator;

    .line 160
    return-void
.end method

.method public getViewAndBoundsForHighlighting(Ljava/lang/Object;Landroid/graphics/Rect;)Landroid/view/View;
    .locals 4
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "bounds"    # Landroid/graphics/Rect;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 123
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;->getHost()Lcom/facebook/stetho/inspector/elements/Descriptor$Host;

    move-result-object v0

    .line 124
    .local v0, "host":Lcom/facebook/stetho/inspector/elements/Descriptor$Host;
    const/4 v1, 0x0

    .line 125
    .local v1, "dialog":Landroid/app/Dialog;
    const/4 v2, 0x0

    .line 127
    .local v2, "descriptor":Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;
    instance-of v3, v0, Lcom/facebook/stetho/inspector/elements/android/AndroidDescriptorHost;

    if-eqz v3, :cond_0

    .line 128
    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;->mAccessor:Lcom/facebook/stetho/common/android/DialogFragmentAccessor;

    invoke-interface {v3, p1}, Lcom/facebook/stetho/common/android/DialogFragmentAccessor;->getDialog(Ljava/lang/Object;)Landroid/app/Dialog;

    move-result-object v1

    .line 129
    move-object v3, v0

    check-cast v3, Lcom/facebook/stetho/inspector/elements/android/AndroidDescriptorHost;

    invoke-interface {v3, v1}, Lcom/facebook/stetho/inspector/elements/android/AndroidDescriptorHost;->getHighlightableDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;

    move-result-object v2

    .line 132
    :cond_0
    if-nez v2, :cond_1

    const/4 v3, 0x0

    goto :goto_0

    .line 134
    :cond_1
    invoke-interface {v2, v1, p2}, Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;->getViewAndBoundsForHighlighting(Ljava/lang/Object;Landroid/graphics/Rect;)Landroid/view/View;

    move-result-object v3

    .line 132
    :goto_0
    return-object v3
.end method

.method public hook(Ljava/lang/Object;)V
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;

    .line 69
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/Descriptor;->hook(Ljava/lang/Object;)V

    .line 70
    return-void
.end method

.method public setAttributesAsText(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "text"    # Ljava/lang/String;

    .line 117
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/stetho/inspector/elements/Descriptor;->setAttributesAsText(Ljava/lang/Object;Ljava/lang/String;)V

    .line 118
    return-void
.end method

.method public setStyle(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "element"    # Ljava/lang/Object;
    .param p2, "ruleName"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "value"    # Ljava/lang/String;

    .line 164
    return-void
.end method

.method public setSuper(Lcom/facebook/stetho/inspector/elements/Descriptor;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/stetho/inspector/elements/Descriptor<",
            "-",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 57
    .local p1, "superDescriptor":Lcom/facebook/stetho/inspector/elements/Descriptor;, "Lcom/facebook/stetho/inspector/elements/Descriptor<-Ljava/lang/Object;>;"
    invoke-static {p1}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    if-eq p1, v0, :cond_1

    .line 60
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    if-nez v0, :cond_0

    .line 63
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    goto :goto_0

    .line 61
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 65
    :cond_1
    :goto_0
    return-void
.end method

.method public unhook(Ljava/lang/Object;)V
    .locals 1
    .param p1, "element"    # Ljava/lang/Object;

    .line 74
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/DialogFragmentDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/Descriptor;->unhook(Ljava/lang/Object;)V

    .line 75
    return-void
.end method
