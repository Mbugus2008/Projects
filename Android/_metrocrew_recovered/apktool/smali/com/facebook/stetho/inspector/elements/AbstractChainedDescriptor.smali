.class public abstract Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;
.super Lcom/facebook/stetho/inspector/elements/Descriptor;
.source "AbstractChainedDescriptor.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/elements/ChainedDescriptor;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/facebook/stetho/inspector/elements/Descriptor<",
        "TE;>;",
        "Lcom/facebook/stetho/inspector/elements/ChainedDescriptor<",
        "TE;>;"
    }
.end annotation


# instance fields
.field private mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/stetho/inspector/elements/Descriptor<",
            "-TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 35
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/Descriptor;-><init>()V

    return-void
.end method


# virtual methods
.method public final getAttributes(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;)V
    .locals 1
    .param p2, "attributes"    # Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;",
            ")V"
        }
    .end annotation

    .line 124
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getAttributes(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;)V

    .line 125
    invoke-virtual {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->onGetAttributes(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;)V

    .line 126
    return-void
.end method

.method public final getChildren(Ljava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/facebook/stetho/common/Accumulator<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 115
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    .local p2, "children":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getChildren(Ljava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V

    .line 116
    invoke-virtual {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->onGetChildren(Ljava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V

    .line 117
    return-void
.end method

.method public getComputedStyles(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;)V
    .locals 1
    .param p2, "accumulator"    # Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;",
            ")V"
        }
    .end annotation

    .line 169
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getComputedStyles(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;)V

    .line 170
    invoke-virtual {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->onGetComputedStyles(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;)V

    .line 171
    return-void
.end method

.method public final getLocalName(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 96
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->onGetLocalName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getNodeName(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 87
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->onGetNodeName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getNodeType(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeType;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Lcom/facebook/stetho/inspector/elements/NodeType;"
        }
    .end annotation

    .line 78
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->onGetNodeType(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeType;

    move-result-object v0

    return-object v0
.end method

.method public final getNodeValue(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 105
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->onGetNodeValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final getStyleRuleNames(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/StyleRuleNameAccumulator;)V
    .locals 1
    .param p2, "accumulator"    # Lcom/facebook/stetho/inspector/elements/StyleRuleNameAccumulator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/facebook/stetho/inspector/elements/StyleRuleNameAccumulator;",
            ")V"
        }
    .end annotation

    .line 142
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getStyleRuleNames(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/StyleRuleNameAccumulator;)V

    .line 143
    invoke-virtual {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->onGetStyleRuleNames(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/StyleRuleNameAccumulator;)V

    .line 144
    return-void
.end method

.method public final getStyles(Ljava/lang/Object;Ljava/lang/String;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V
    .locals 1
    .param p2, "ruleName"    # Ljava/lang/String;
    .param p3, "accumulator"    # Lcom/facebook/stetho/inspector/elements/StyleAccumulator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Ljava/lang/String;",
            "Lcom/facebook/stetho/inspector/elements/StyleAccumulator;",
            ")V"
        }
    .end annotation

    .line 151
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1, p2, p3}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getStyles(Ljava/lang/Object;Ljava/lang/String;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    .line 152
    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->onGetStyles(Ljava/lang/Object;Ljava/lang/String;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    .line 153
    return-void
.end method

.method final getSuper()Lcom/facebook/stetho/inspector/elements/Descriptor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/facebook/stetho/inspector/elements/Descriptor<",
            "-TE;>;"
        }
    .end annotation

    .line 53
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    return-object v0
.end method

.method public final hook(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .line 58
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->verifyThreadAccess()V

    .line 59
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/Descriptor;->hook(Ljava/lang/Object;)V

    .line 60
    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->onHook(Ljava/lang/Object;)V

    .line 61
    return-void
.end method

.method protected onGetAttributes(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;)V
    .locals 0
    .param p2, "attributes"    # Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;",
            ")V"
        }
    .end annotation

    .line 129
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    return-void
.end method

.method protected onGetChildren(Ljava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/facebook/stetho/common/Accumulator<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 120
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    .local p2, "children":Lcom/facebook/stetho/common/Accumulator;, "Lcom/facebook/stetho/common/Accumulator<Ljava/lang/Object;>;"
    return-void
.end method

.method protected onGetComputedStyles(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;)V
    .locals 0
    .param p2, "accumulator"    # Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/facebook/stetho/inspector/elements/ComputedStyleAccumulator;",
            ")V"
        }
    .end annotation

    .line 174
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    return-void
.end method

.method protected onGetLocalName(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 100
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getLocalName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onGetNodeName(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 91
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getNodeName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onGetNodeType(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeType;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Lcom/facebook/stetho/inspector/elements/NodeType;"
        }
    .end annotation

    .line 82
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getNodeType(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeType;

    move-result-object v0

    return-object v0
.end method

.method public onGetNodeValue(Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 110
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getNodeValue(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onGetStyleRuleNames(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/StyleRuleNameAccumulator;)V
    .locals 0
    .param p2, "accumulator"    # Lcom/facebook/stetho/inspector/elements/StyleRuleNameAccumulator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/facebook/stetho/inspector/elements/StyleRuleNameAccumulator;",
            ")V"
        }
    .end annotation

    .line 147
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    return-void
.end method

.method protected onGetStyles(Ljava/lang/Object;Ljava/lang/String;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V
    .locals 0
    .param p2, "ruleName"    # Ljava/lang/String;
    .param p3, "accumulator"    # Lcom/facebook/stetho/inspector/elements/StyleAccumulator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Ljava/lang/String;",
            "Lcom/facebook/stetho/inspector/elements/StyleAccumulator;",
            ")V"
        }
    .end annotation

    .line 156
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    return-void
.end method

.method protected onHook(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .line 64
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    return-void
.end method

.method protected onSetAttributesAsText(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 1
    .param p2, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 137
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1, p2}, Lcom/facebook/stetho/inspector/elements/Descriptor;->setAttributesAsText(Ljava/lang/Object;Ljava/lang/String;)V

    .line 138
    return-void
.end method

.method protected onSetStyle(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p2, "ruleName"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 165
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    return-void
.end method

.method protected onUnhook(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .line 74
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    return-void
.end method

.method public final setAttributesAsText(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 0
    .param p2, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 133
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->onSetAttributesAsText(Ljava/lang/Object;Ljava/lang/String;)V

    .line 134
    return-void
.end method

.method public final setStyle(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p2, "ruleName"    # Ljava/lang/String;
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 160
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/facebook/stetho/inspector/elements/Descriptor;->setStyle(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 161
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->onSetStyle(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    return-void
.end method

.method public setSuper(Lcom/facebook/stetho/inspector/elements/Descriptor;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/stetho/inspector/elements/Descriptor<",
            "-TE;>;)V"
        }
    .end annotation

    .line 42
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "superDescriptor":Lcom/facebook/stetho/inspector/elements/Descriptor;, "Lcom/facebook/stetho/inspector/elements/Descriptor<-TE;>;"
    invoke-static {p1}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    if-eq p1, v0, :cond_1

    .line 45
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    if-nez v0, :cond_0

    .line 48
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    goto :goto_0

    .line 46
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 50
    :cond_1
    :goto_0
    return-void
.end method

.method public final unhook(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .line 68
    .local p0, "this":Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;, "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor<TE;>;"
    .local p1, "element":Ljava/lang/Object;, "TE;"
    invoke-virtual {p0}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->verifyThreadAccess()V

    .line 69
    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->onUnhook(Ljava/lang/Object;)V

    .line 70
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;->mSuper:Lcom/facebook/stetho/inspector/elements/Descriptor;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/Descriptor;->unhook(Ljava/lang/Object;)V

    .line 71
    return-void
.end method
