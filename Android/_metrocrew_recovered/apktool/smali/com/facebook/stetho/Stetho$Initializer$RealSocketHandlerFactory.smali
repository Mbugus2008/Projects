.class Lcom/facebook/stetho/Stetho$Initializer$RealSocketHandlerFactory;
.super Ljava/lang/Object;
.source "Stetho.java"

# interfaces
.implements Lcom/facebook/stetho/server/SocketHandlerFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/Stetho$Initializer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RealSocketHandlerFactory"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/stetho/Stetho$Initializer;


# direct methods
.method private constructor <init>(Lcom/facebook/stetho/Stetho$Initializer;)V
    .locals 0

    .line 455
    iput-object p1, p0, Lcom/facebook/stetho/Stetho$Initializer$RealSocketHandlerFactory;->this$0:Lcom/facebook/stetho/Stetho$Initializer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/stetho/Stetho$Initializer;Lcom/facebook/stetho/Stetho$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/facebook/stetho/Stetho$Initializer;
    .param p2, "x1"    # Lcom/facebook/stetho/Stetho$1;

    .line 455
    invoke-direct {p0, p1}, Lcom/facebook/stetho/Stetho$Initializer$RealSocketHandlerFactory;-><init>(Lcom/facebook/stetho/Stetho$Initializer;)V

    return-void
.end method


# virtual methods
.method public create()Lcom/facebook/stetho/server/SocketHandler;
    .locals 6

    .line 458
    new-instance v0, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler;

    iget-object v1, p0, Lcom/facebook/stetho/Stetho$Initializer$RealSocketHandlerFactory;->this$0:Lcom/facebook/stetho/Stetho$Initializer;

    .line 459
    invoke-static {v1}, Lcom/facebook/stetho/Stetho$Initializer;->access$100(Lcom/facebook/stetho/Stetho$Initializer;)Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler;-><init>(Landroid/content/Context;)V

    .line 461
    .local v0, "socketHandler":Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler;
    iget-object v1, p0, Lcom/facebook/stetho/Stetho$Initializer$RealSocketHandlerFactory;->this$0:Lcom/facebook/stetho/Stetho$Initializer;

    invoke-virtual {v1}, Lcom/facebook/stetho/Stetho$Initializer;->getDumperPlugins()Ljava/lang/Iterable;

    move-result-object v1

    .line 462
    .local v1, "dumperPlugins":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/facebook/stetho/dumpapp/DumperPlugin;>;"
    if-eqz v1, :cond_0

    .line 463
    new-instance v2, Lcom/facebook/stetho/dumpapp/Dumper;

    invoke-direct {v2, v1}, Lcom/facebook/stetho/dumpapp/Dumper;-><init>(Ljava/lang/Iterable;)V

    .line 465
    .local v2, "dumper":Lcom/facebook/stetho/dumpapp/Dumper;
    new-instance v3, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$ExactMagicMatcher;

    sget-object v4, Lcom/facebook/stetho/dumpapp/DumpappSocketLikeHandler;->PROTOCOL_MAGIC:[B

    invoke-direct {v3, v4}, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$ExactMagicMatcher;-><init>([B)V

    new-instance v4, Lcom/facebook/stetho/dumpapp/DumpappSocketLikeHandler;

    invoke-direct {v4, v2}, Lcom/facebook/stetho/dumpapp/DumpappSocketLikeHandler;-><init>(Lcom/facebook/stetho/dumpapp/Dumper;)V

    invoke-virtual {v0, v3, v4}, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler;->addHandler(Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$MagicMatcher;Lcom/facebook/stetho/server/SocketLikeHandler;)V

    .line 471
    new-instance v3, Lcom/facebook/stetho/dumpapp/DumpappHttpSocketLikeHandler;

    invoke-direct {v3, v2}, Lcom/facebook/stetho/dumpapp/DumpappHttpSocketLikeHandler;-><init>(Lcom/facebook/stetho/dumpapp/Dumper;)V

    .line 472
    .local v3, "legacyHandler":Lcom/facebook/stetho/dumpapp/DumpappHttpSocketLikeHandler;
    new-instance v4, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$ExactMagicMatcher;

    .line 474
    const-string v5, "GET /dumpapp"

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$ExactMagicMatcher;-><init>([B)V

    .line 472
    invoke-virtual {v0, v4, v3}, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler;->addHandler(Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$MagicMatcher;Lcom/facebook/stetho/server/SocketLikeHandler;)V

    .line 476
    new-instance v4, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$ExactMagicMatcher;

    .line 478
    const-string v5, "POST /dumpapp"

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$ExactMagicMatcher;-><init>([B)V

    .line 476
    invoke-virtual {v0, v4, v3}, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler;->addHandler(Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$MagicMatcher;Lcom/facebook/stetho/server/SocketLikeHandler;)V

    .line 482
    .end local v2    # "dumper":Lcom/facebook/stetho/dumpapp/Dumper;
    .end local v3    # "legacyHandler":Lcom/facebook/stetho/dumpapp/DumpappHttpSocketLikeHandler;
    :cond_0
    iget-object v2, p0, Lcom/facebook/stetho/Stetho$Initializer$RealSocketHandlerFactory;->this$0:Lcom/facebook/stetho/Stetho$Initializer;

    invoke-virtual {v2}, Lcom/facebook/stetho/Stetho$Initializer;->getInspectorModules()Ljava/lang/Iterable;

    move-result-object v2

    .line 483
    .local v2, "inspectorModules":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;>;"
    if-eqz v2, :cond_1

    .line 484
    new-instance v3, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$AlwaysMatchMatcher;

    invoke-direct {v3}, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$AlwaysMatchMatcher;-><init>()V

    new-instance v4, Lcom/facebook/stetho/inspector/DevtoolsSocketHandler;

    iget-object v5, p0, Lcom/facebook/stetho/Stetho$Initializer$RealSocketHandlerFactory;->this$0:Lcom/facebook/stetho/Stetho$Initializer;

    .line 486
    invoke-static {v5}, Lcom/facebook/stetho/Stetho$Initializer;->access$100(Lcom/facebook/stetho/Stetho$Initializer;)Landroid/content/Context;

    move-result-object v5

    invoke-direct {v4, v5, v2}, Lcom/facebook/stetho/inspector/DevtoolsSocketHandler;-><init>(Landroid/content/Context;Ljava/lang/Iterable;)V

    .line 484
    invoke-virtual {v0, v3, v4}, Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler;->addHandler(Lcom/facebook/stetho/server/ProtocolDetectingSocketHandler$MagicMatcher;Lcom/facebook/stetho/server/SocketLikeHandler;)V

    .line 489
    :cond_1
    return-object v0
.end method
