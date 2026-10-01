.class final Lcom/facebook/stetho/inspector/elements/Document$DocumentObjectIdMapper;
.super Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;
.source "Document.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/elements/Document;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "DocumentObjectIdMapper"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/stetho/inspector/elements/Document;


# direct methods
.method private constructor <init>(Lcom/facebook/stetho/inspector/elements/Document;)V
    .locals 0

    .line 697
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/Document$DocumentObjectIdMapper;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    invoke-direct {p0}, Lcom/facebook/stetho/inspector/helper/ObjectIdMapper;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/stetho/inspector/elements/Document;Lcom/facebook/stetho/inspector/elements/Document$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/facebook/stetho/inspector/elements/Document;
    .param p2, "x1"    # Lcom/facebook/stetho/inspector/elements/Document$1;

    .line 697
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/elements/Document$DocumentObjectIdMapper;-><init>(Lcom/facebook/stetho/inspector/elements/Document;)V

    return-void
.end method


# virtual methods
.method protected onMapped(Ljava/lang/Object;I)V
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "id"    # I

    .line 700
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document$DocumentObjectIdMapper;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/elements/Document;->verifyThreadAccess()V

    .line 702
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document$DocumentObjectIdMapper;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    invoke-static {v0}, Lcom/facebook/stetho/inspector/elements/Document;->access$200(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->getNodeDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeDescriptor;

    move-result-object v0

    .line 703
    .local v0, "descriptor":Lcom/facebook/stetho/inspector/elements/NodeDescriptor;
    invoke-interface {v0, p1}, Lcom/facebook/stetho/inspector/elements/NodeDescriptor;->hook(Ljava/lang/Object;)V

    .line 704
    return-void
.end method

.method protected onUnmapped(Ljava/lang/Object;I)V
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;
    .param p2, "id"    # I

    .line 708
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document$DocumentObjectIdMapper;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/elements/Document;->verifyThreadAccess()V

    .line 710
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/Document$DocumentObjectIdMapper;->this$0:Lcom/facebook/stetho/inspector/elements/Document;

    invoke-static {v0}, Lcom/facebook/stetho/inspector/elements/Document;->access$200(Lcom/facebook/stetho/inspector/elements/Document;)Lcom/facebook/stetho/inspector/elements/DocumentProvider;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/facebook/stetho/inspector/elements/DocumentProvider;->getNodeDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/NodeDescriptor;

    move-result-object v0

    .line 711
    .local v0, "descriptor":Lcom/facebook/stetho/inspector/elements/NodeDescriptor;
    invoke-interface {v0, p1}, Lcom/facebook/stetho/inspector/elements/NodeDescriptor;->unhook(Ljava/lang/Object;)V

    .line 712
    return-void
.end method
