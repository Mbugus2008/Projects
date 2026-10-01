.class public Lcom/facebook/stetho/inspector/protocol/module/CSS;
.super Ljava/lang/Object;
.source "CSS.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/protocol/module/CSS$SetPropertyTextResult;,
        Lcom/facebook/stetho/inspector/protocol/module/CSS$SetPropertyTextRequest;,
        Lcom/facebook/stetho/inspector/protocol/module/CSS$GetMatchedStylesForNodeResult;,
        Lcom/facebook/stetho/inspector/protocol/module/CSS$GetMatchedStylesForNodeRequest;,
        Lcom/facebook/stetho/inspector/protocol/module/CSS$GetComputedStyleForNodeResult;,
        Lcom/facebook/stetho/inspector/protocol/module/CSS$InheritedStyleEntry;,
        Lcom/facebook/stetho/inspector/protocol/module/CSS$GetComputedStyleForNodeRequest;,
        Lcom/facebook/stetho/inspector/protocol/module/CSS$PseudoIdMatches;,
        Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSProperty;,
        Lcom/facebook/stetho/inspector/protocol/module/CSS$ShorthandEntry;,
        Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSStyle;,
        Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSRule;,
        Lcom/facebook/stetho/inspector/protocol/module/CSS$Selector;,
        Lcom/facebook/stetho/inspector/protocol/module/CSS$SourceRange;,
        Lcom/facebook/stetho/inspector/protocol/module/CSS$SelectorList;,
        Lcom/facebook/stetho/inspector/protocol/module/CSS$RuleMatch;,
        Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSComputedStyleProperty;,
        Lcom/facebook/stetho/inspector/protocol/module/CSS$PeerManagerListener;
    }
.end annotation


# instance fields
.field private final mDocument:Lcom/facebook/stetho/inspector/elements/Document;

.field private final mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

.field private final mPeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;


# direct methods
.method public constructor <init>(Lcom/facebook/stetho/inspector/elements/Document;)V
    .locals 3
    .param p1, "document"    # Lcom/facebook/stetho/inspector/elements/Document;

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    invoke-static {p1}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/elements/Document;

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/CSS;->mDocument:Lcom/facebook/stetho/inspector/elements/Document;

    .line 42
    new-instance v0, Lcom/facebook/stetho/json/ObjectMapper;

    invoke-direct {v0}, Lcom/facebook/stetho/json/ObjectMapper;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/CSS;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    .line 43
    new-instance v0, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/CSS;->mPeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    .line 44
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/CSS;->mPeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/CSS$PeerManagerListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/facebook/stetho/inspector/protocol/module/CSS$PeerManagerListener;-><init>(Lcom/facebook/stetho/inspector/protocol/module/CSS;Lcom/facebook/stetho/inspector/protocol/module/CSS$1;)V

    invoke-virtual {v0, v1}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;->setListener(Lcom/facebook/stetho/inspector/helper/PeerRegistrationListener;)V

    .line 45
    return-void
.end method

.method static synthetic access$200(Lcom/facebook/stetho/inspector/protocol/module/CSS;)Lcom/facebook/stetho/inspector/elements/Document;
    .locals 1
    .param p0, "x0"    # Lcom/facebook/stetho/inspector/protocol/module/CSS;

    .line 35
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/CSS;->mDocument:Lcom/facebook/stetho/inspector/elements/Document;

    return-object v0
.end method


# virtual methods
.method public disable(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 53
    return-void
.end method

.method public enable(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 49
    return-void
.end method

.method public getComputedStyleForNode(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcResult;
    .locals 4
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 57
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/CSS;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v1, Lcom/facebook/stetho/inspector/protocol/module/CSS$GetComputedStyleForNodeRequest;

    invoke-virtual {v0, p2, v1}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/CSS$GetComputedStyleForNodeRequest;

    .line 61
    .local v0, "request":Lcom/facebook/stetho/inspector/protocol/module/CSS$GetComputedStyleForNodeRequest;
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/CSS$GetComputedStyleForNodeResult;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/CSS$GetComputedStyleForNodeResult;-><init>(Lcom/facebook/stetho/inspector/protocol/module/CSS$1;)V

    .line 62
    .local v1, "result":Lcom/facebook/stetho/inspector/protocol/module/CSS$GetComputedStyleForNodeResult;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/CSS$GetComputedStyleForNodeResult;->computedStyle:Ljava/util/List;

    .line 64
    iget-object v2, p0, Lcom/facebook/stetho/inspector/protocol/module/CSS;->mDocument:Lcom/facebook/stetho/inspector/elements/Document;

    new-instance v3, Lcom/facebook/stetho/inspector/protocol/module/CSS$1;

    invoke-direct {v3, p0, v0, v1}, Lcom/facebook/stetho/inspector/protocol/module/CSS$1;-><init>(Lcom/facebook/stetho/inspector/protocol/module/CSS;Lcom/facebook/stetho/inspector/protocol/module/CSS$GetComputedStyleForNodeRequest;Lcom/facebook/stetho/inspector/protocol/module/CSS$GetComputedStyleForNodeResult;)V

    invoke-virtual {v2, v3}, Lcom/facebook/stetho/inspector/elements/Document;->postAndWait(Ljava/lang/Runnable;)V

    .line 90
    return-object v1
.end method

.method public getMatchedStylesForNode(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcResult;
    .locals 4
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 96
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/CSS;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v1, Lcom/facebook/stetho/inspector/protocol/module/CSS$GetMatchedStylesForNodeRequest;

    invoke-virtual {v0, p2, v1}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/CSS$GetMatchedStylesForNodeRequest;

    .line 100
    .local v0, "request":Lcom/facebook/stetho/inspector/protocol/module/CSS$GetMatchedStylesForNodeRequest;
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/CSS$GetMatchedStylesForNodeResult;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/CSS$GetMatchedStylesForNodeResult;-><init>(Lcom/facebook/stetho/inspector/protocol/module/CSS$1;)V

    .line 101
    .local v1, "result":Lcom/facebook/stetho/inspector/protocol/module/CSS$GetMatchedStylesForNodeResult;
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/CSS$GetMatchedStylesForNodeResult;->matchedCSSRules:Ljava/util/List;

    .line 102
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/CSS$GetMatchedStylesForNodeResult;->inherited:Ljava/util/List;

    .line 103
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    iput-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/CSS$GetMatchedStylesForNodeResult;->pseudoElements:Ljava/util/List;

    .line 105
    iget-object v2, p0, Lcom/facebook/stetho/inspector/protocol/module/CSS;->mDocument:Lcom/facebook/stetho/inspector/elements/Document;

    new-instance v3, Lcom/facebook/stetho/inspector/protocol/module/CSS$2;

    invoke-direct {v3, p0, v0, v1}, Lcom/facebook/stetho/inspector/protocol/module/CSS$2;-><init>(Lcom/facebook/stetho/inspector/protocol/module/CSS;Lcom/facebook/stetho/inspector/protocol/module/CSS$GetMatchedStylesForNodeRequest;Lcom/facebook/stetho/inspector/protocol/module/CSS$GetMatchedStylesForNodeResult;)V

    invoke-virtual {v2, v3}, Lcom/facebook/stetho/inspector/elements/Document;->postAndWait(Ljava/lang/Runnable;)V

    .line 159
    return-object v1
.end method

.method public setPropertyText(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)Lcom/facebook/stetho/inspector/protocol/module/CSS$SetPropertyTextResult;
    .locals 12
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 164
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/CSS;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v1, Lcom/facebook/stetho/inspector/protocol/module/CSS$SetPropertyTextRequest;

    invoke-virtual {v0, p2, v1}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/CSS$SetPropertyTextRequest;

    .line 168
    .local v0, "request":Lcom/facebook/stetho/inspector/protocol/module/CSS$SetPropertyTextRequest;
    iget-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/CSS$SetPropertyTextRequest;->styleSheetId:Ljava/lang/String;

    const-string v2, "\\."

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    .line 169
    .local v1, "parts":[Ljava/lang/String;
    const/4 v2, 0x0

    aget-object v4, v1, v2

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    .line 170
    .local v7, "nodeId":I
    const/4 v4, 0x1

    aget-object v9, v1, v4

    .line 174
    .local v9, "ruleName":Ljava/lang/String;
    iget-object v5, v0, Lcom/facebook/stetho/inspector/protocol/module/CSS$SetPropertyTextRequest;->text:Ljava/lang/String;

    if-eqz v5, :cond_1

    iget-object v5, v0, Lcom/facebook/stetho/inspector/protocol/module/CSS$SetPropertyTextRequest;->text:Ljava/lang/String;

    const-string v6, ":"

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    goto :goto_0

    .line 178
    :cond_0
    iget-object v5, v0, Lcom/facebook/stetho/inspector/protocol/module/CSS$SetPropertyTextRequest;->text:Ljava/lang/String;

    invoke-virtual {v5, v6, v3}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v3

    .line 179
    .local v3, "keyValue":[Ljava/lang/String;
    aget-object v2, v3, v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 180
    .local v2, "key":Ljava/lang/String;
    aget-object v4, v3, v4

    const/16 v5, 0x3b

    invoke-static {v4, v5}, Lcom/facebook/stetho/common/StringUtil;->removeAll(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    move-object v8, v2

    move-object v10, v4

    .local v4, "value":Ljava/lang/String;
    goto :goto_1

    .line 175
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "keyValue":[Ljava/lang/String;
    .end local v4    # "value":Ljava/lang/String;
    :cond_1
    :goto_0
    const/4 v2, 0x0

    .line 176
    .restart local v2    # "key":Ljava/lang/String;
    const/4 v4, 0x0

    move-object v8, v2

    move-object v10, v4

    .line 184
    .end local v2    # "key":Ljava/lang/String;
    .local v8, "key":Ljava/lang/String;
    .local v10, "value":Ljava/lang/String;
    :goto_1
    new-instance v11, Lcom/facebook/stetho/inspector/protocol/module/CSS$SetPropertyTextResult;

    const/4 v2, 0x0

    invoke-direct {v11, v2}, Lcom/facebook/stetho/inspector/protocol/module/CSS$SetPropertyTextResult;-><init>(Lcom/facebook/stetho/inspector/protocol/module/CSS$1;)V

    .line 185
    .local v11, "result":Lcom/facebook/stetho/inspector/protocol/module/CSS$SetPropertyTextResult;
    new-instance v3, Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSStyle;

    invoke-direct {v3, v2}, Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSStyle;-><init>(Lcom/facebook/stetho/inspector/protocol/module/CSS$1;)V

    iput-object v3, v11, Lcom/facebook/stetho/inspector/protocol/module/CSS$SetPropertyTextResult;->style:Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSStyle;

    .line 186
    iget-object v2, v11, Lcom/facebook/stetho/inspector/protocol/module/CSS$SetPropertyTextResult;->style:Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSStyle;

    iget-object v3, v0, Lcom/facebook/stetho/inspector/protocol/module/CSS$SetPropertyTextRequest;->styleSheetId:Ljava/lang/String;

    iput-object v3, v2, Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSStyle;->styleSheetId:Ljava/lang/String;

    .line 187
    iget-object v2, v11, Lcom/facebook/stetho/inspector/protocol/module/CSS$SetPropertyTextResult;->style:Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSStyle;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, v2, Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSStyle;->cssProperties:Ljava/util/List;

    .line 188
    iget-object v2, v11, Lcom/facebook/stetho/inspector/protocol/module/CSS$SetPropertyTextResult;->style:Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSStyle;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v3

    iput-object v3, v2, Lcom/facebook/stetho/inspector/protocol/module/CSS$CSSStyle;->shorthandEntries:Ljava/util/List;

    .line 190
    iget-object v2, p0, Lcom/facebook/stetho/inspector/protocol/module/CSS;->mDocument:Lcom/facebook/stetho/inspector/elements/Document;

    new-instance v5, Lcom/facebook/stetho/inspector/protocol/module/CSS$3;

    move-object v6, p0

    invoke-direct/range {v5 .. v11}, Lcom/facebook/stetho/inspector/protocol/module/CSS$3;-><init>(Lcom/facebook/stetho/inspector/protocol/module/CSS;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/CSS$SetPropertyTextResult;)V

    invoke-virtual {v2, v5}, Lcom/facebook/stetho/inspector/elements/Document;->postAndWait(Ljava/lang/Runnable;)V

    .line 216
    return-object v11
.end method
