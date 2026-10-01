.class Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$2;
.super Ljava/lang/Object;
.source "AndroidDocumentProvider.java"

# interfaces
.implements Lcom/facebook/stetho/common/Accumulator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->getWindows(Lcom/facebook/stetho/common/Accumulator;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/stetho/common/Accumulator<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;

.field final synthetic val$accumulator:Lcom/facebook/stetho/common/Accumulator;


# direct methods
.method constructor <init>(Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;Lcom/facebook/stetho/common/Accumulator;)V
    .locals 0
    .param p1, "this$0"    # Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;

    .line 251
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$2;->this$0:Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;

    iput-object p2, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$2;->val$accumulator:Lcom/facebook/stetho/common/Accumulator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public store(Ljava/lang/Object;)V
    .locals 2
    .param p1, "element"    # Ljava/lang/Object;

    .line 254
    instance-of v0, p1, Landroid/view/Window;

    if-eqz v0, :cond_0

    .line 256
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$2;->val$accumulator:Lcom/facebook/stetho/common/Accumulator;

    move-object v1, p1

    check-cast v1, Landroid/view/Window;

    invoke-interface {v0, v1}, Lcom/facebook/stetho/common/Accumulator;->store(Ljava/lang/Object;)V

    goto :goto_0

    .line 259
    :cond_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$2;->this$0:Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->getDescriptor(Ljava/lang/Object;)Lcom/facebook/stetho/inspector/elements/Descriptor;

    move-result-object v0

    .line 260
    .local v0, "elementDescriptor":Lcom/facebook/stetho/inspector/elements/Descriptor;
    if-eqz v0, :cond_1

    .line 261
    invoke-virtual {v0, p1, p0}, Lcom/facebook/stetho/inspector/elements/Descriptor;->getChildren(Ljava/lang/Object;Lcom/facebook/stetho/common/Accumulator;)V

    .line 264
    .end local v0    # "elementDescriptor":Lcom/facebook/stetho/inspector/elements/Descriptor;
    :cond_1
    :goto_0
    return-void
.end method
