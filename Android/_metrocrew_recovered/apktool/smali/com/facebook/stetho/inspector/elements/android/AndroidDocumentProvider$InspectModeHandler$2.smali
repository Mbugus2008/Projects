.class Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler$2;
.super Ljava/lang/Object;
.source "AndroidDocumentProvider.java"

# interfaces
.implements Lcom/facebook/stetho/common/Accumulator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;->enable()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/stetho/common/Accumulator<",
        "Landroid/view/Window;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;


# direct methods
.method constructor <init>(Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;)V
    .locals 0
    .param p1, "this$1"    # Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;

    .line 290
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler$2;->this$1:Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public store(Landroid/view/Window;)V
    .locals 4
    .param p1, "object"    # Landroid/view/Window;

    .line 293
    invoke-virtual {p1}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 294
    invoke-virtual {p1}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 296
    .local v0, "decorView":Landroid/view/ViewGroup;
    new-instance v1, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler$OverlayView;

    iget-object v2, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler$2;->this$1:Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;

    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler$2;->this$1:Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;

    iget-object v3, v3, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;->this$0:Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;

    invoke-static {v3}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;->access$300(Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider;)Landroid/app/Application;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler$OverlayView;-><init>(Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;Landroid/content/Context;)V

    .line 298
    .local v1, "overlayView":Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler$OverlayView;
    new-instance v2, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v2}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    .line 299
    .local v2, "layoutParams":Landroid/view/WindowManager$LayoutParams;
    const/4 v3, -0x1

    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 300
    iput v3, v2, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 302
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 303
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->bringChildToFront(Landroid/view/View;)V

    .line 305
    iget-object v3, p0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler$2;->this$1:Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;

    invoke-static {v3}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;->access$400(Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 307
    .end local v0    # "decorView":Landroid/view/ViewGroup;
    .end local v1    # "overlayView":Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler$OverlayView;
    .end local v2    # "layoutParams":Landroid/view/WindowManager$LayoutParams;
    :cond_0
    return-void
.end method

.method public bridge synthetic store(Ljava/lang/Object;)V
    .locals 0

    .line 290
    check-cast p1, Landroid/view/Window;

    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProvider$InspectModeHandler$2;->store(Landroid/view/Window;)V

    return-void
.end method
