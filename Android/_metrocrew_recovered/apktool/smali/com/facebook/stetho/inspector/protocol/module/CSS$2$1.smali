.class Lcom/facebook/stetho/inspector/protocol/module/CSS$2$1;
.super Ljava/lang/Object;
.source "CSS.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/elements/StyleRuleNameAccumulator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/stetho/inspector/protocol/module/CSS$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/facebook/stetho/inspector/protocol/module/CSS$2;

.field final synthetic val$elementForNodeId:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lcom/facebook/stetho/inspector/protocol/module/CSS$2;Ljava/lang/Object;)V
    .locals 0
    .param p1, "this$1"    # Lcom/facebook/stetho/inspector/protocol/module/CSS$2;

    .line 116
    iput-object p1, p0, Lcom/facebook/stetho/inspector/protocol/module/CSS$2$1;->this$1:Lcom/facebook/stetho/inspector/protocol/module/CSS$2;

    iput-object p2, p0, Lcom/facebook/stetho/inspector/protocol/module/CSS$2$1;->val$elementForNodeId:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public store(Ljava/lang/String;Z)V
    .locals 7
    .param p1, "ruleName"    # Ljava/lang/String;
    .param p2, "editable"    # Z

    .line 119
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 121
    .local v0, "properties":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSProperty;>;"
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/CSS$RuleMatch;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/CSS$RuleMatch;-><init>(Lcom/facebook/stetho/inspector/protocol/module/CSS$1;)V

    .line 122
    .local v1, "match":Lcom/facebook/stetho/inspector/protocol/module/CSS$RuleMatch;
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v3}, Lcom/facebook/stetho/common/ListUtil;->newImmutableList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    iput-object v3, v1, Lcom/facebook/stetho/inspector/protocol/module/CSS$RuleMatch;->matchingSelectors:Ljava/util/List;

    .line 124
    new-instance v3, Lcom/facebook/stetho/inspector/protocol/module/CSS$Selector;

    invoke-direct {v3, v2}, Lcom/facebook/stetho/inspector/protocol/module/CSS$Selector;-><init>(Lcom/facebook/stetho/inspector/protocol/module/CSS$1;)V

    .line 125
    .local v3, "selector":Lcom/facebook/stetho/inspector/protocol/module/CSS$Selector;
    iput-object p1, v3, Lcom/facebook/stetho/inspector/protocol/module/CSS$Selector;->value:Ljava/lang/String;

    .line 127
    new-instance v4, Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSRule;

    invoke-direct {v4, v2}, Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSRule;-><init>(Lcom/facebook/stetho/inspector/protocol/module/CSS$1;)V

    .line 128
    .local v4, "rule":Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSRule;
    sget-object v5, Lcom/facebook/stetho/inspector/elements/Origin;->REGULAR:Lcom/facebook/stetho/inspector/elements/Origin;

    iput-object v5, v4, Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSRule;->origin:Lcom/facebook/stetho/inspector/elements/Origin;

    .line 129
    new-instance v5, Lcom/facebook/stetho/inspector/protocol/module/CSS$SelectorList;

    invoke-direct {v5, v2}, Lcom/facebook/stetho/inspector/protocol/module/CSS$SelectorList;-><init>(Lcom/facebook/stetho/inspector/protocol/module/CSS$1;)V

    iput-object v5, v4, Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSRule;->selectorList:Lcom/facebook/stetho/inspector/protocol/module/CSS$SelectorList;

    .line 130
    iget-object v5, v4, Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSRule;->selectorList:Lcom/facebook/stetho/inspector/protocol/module/CSS$SelectorList;

    invoke-static {v3}, Lcom/facebook/stetho/common/ListUtil;->newImmutableList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    iput-object v6, v5, Lcom/facebook/stetho/inspector/protocol/module/CSS$SelectorList;->selectors:Ljava/util/List;

    .line 131
    new-instance v5, Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSStyle;

    invoke-direct {v5, v2}, Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSStyle;-><init>(Lcom/facebook/stetho/inspector/protocol/module/CSS$1;)V

    iput-object v5, v4, Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSRule;->style:Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSStyle;

    .line 132
    iget-object v2, v4, Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSRule;->style:Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSStyle;

    iput-object v0, v2, Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSStyle;->cssProperties:Ljava/util/List;

    .line 133
    iget-object v2, v4, Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSRule;->style:Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSStyle;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v5

    iput-object v5, v2, Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSStyle;->shorthandEntries:Ljava/util/List;

    .line 135
    if-eqz p2, :cond_0

    .line 136
    iget-object v2, v4, Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSRule;->style:Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSStyle;

    iget-object v5, p0, Lcom/facebook/stetho/inspector/protocol/module/CSS$2$1;->this$1:Lcom/facebook/stetho/inspector/protocol/module/CSS$2;

    iget-object v5, v5, Lcom/facebook/stetho/inspector/protocol/module/CSS$2;->val$request:Lcom/facebook/stetho/inspector/protocol/module/CSS$GetMatchedStylesForNodeRequest;

    iget v5, v5, Lcom/facebook/stetho/inspector/protocol/module/CSS$GetMatchedStylesForNodeRequest;->nodeId:I

    .line 138
    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v6, v3, Lcom/facebook/stetho/inspector/protocol/module/CSS$Selector;->value:Ljava/lang/String;

    filled-new-array {v5, v6}, [Ljava/lang/Object;

    move-result-object v5

    .line 136
    const-string v6, "%s.%s"

    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v2, Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSStyle;->styleSheetId:Ljava/lang/String;

    .line 142
    :cond_0
    iget-object v2, p0, Lcom/facebook/stetho/inspector/protocol/module/CSS$2$1;->this$1:Lcom/facebook/stetho/inspector/protocol/module/CSS$2;

    iget-object v2, v2, Lcom/facebook/stetho/inspector/protocol/module/CSS$2;->this$0:Lcom/facebook/stetho/inspector/protocol/module/CSS;

    invoke-static {v2}, Lcom/facebook/stetho/inspector/protocol/module/CSS;->access$200(Lcom/facebook/stetho/inspector/protocol/module/CSS;)Lcom/facebook/stetho/inspector/elements/Document;

    move-result-object v2

    iget-object v5, p0, Lcom/facebook/stetho/inspector/protocol/module/CSS$2$1;->val$elementForNodeId:Ljava/lang/Object;

    new-instance v6, Lcom/facebook/stetho/inspector/protocol/module/CSS$2$1$1;

    invoke-direct {v6, p0, v0}, Lcom/facebook/stetho/inspector/protocol/module/CSS$2$1$1;-><init>(Lcom/facebook/stetho/inspector/protocol/module/CSS$2$1;Ljava/util/ArrayList;)V

    invoke-virtual {v2, v5, p1, v6}, Lcom/facebook/stetho/inspector/elements/Document;->getElementStyles(Ljava/lang/Object;Ljava/lang/String;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    .line 152
    iput-object v4, v1, Lcom/facebook/stetho/inspector/protocol/module/CSS$RuleMatch;->rule:Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSRule;

    .line 153
    iget-object v2, p0, Lcom/facebook/stetho/inspector/protocol/module/CSS$2$1;->this$1:Lcom/facebook/stetho/inspector/protocol/module/CSS$2;

    iget-object v2, v2, Lcom/facebook/stetho/inspector/protocol/module/CSS$2;->val$result:Lcom/facebook/stetho/inspector/protocol/module/CSS$GetMatchedStylesForNodeResult;

    iget-object v2, v2, Lcom/facebook/stetho/inspector/protocol/module/CSS$GetMatchedStylesForNodeResult;->matchedCSSRules:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 154
    return-void
.end method
