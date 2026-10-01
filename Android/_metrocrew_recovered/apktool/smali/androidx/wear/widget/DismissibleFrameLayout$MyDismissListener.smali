.class final Landroidx/wear/widget/DismissibleFrameLayout$MyDismissListener;
.super Ljava/lang/Object;
.source "DismissibleFrameLayout.java"

# interfaces
.implements Landroidx/wear/widget/DismissController$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/DismissibleFrameLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "MyDismissListener"
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/wear/widget/DismissibleFrameLayout;


# direct methods
.method constructor <init>(Landroidx/wear/widget/DismissibleFrameLayout;)V
    .locals 0

    .line 229
    iput-object p1, p0, Landroidx/wear/widget/DismissibleFrameLayout$MyDismissListener;->this$0:Landroidx/wear/widget/DismissibleFrameLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 230
    return-void
.end method


# virtual methods
.method public onDismissCanceled()V
    .locals 1

    .line 239
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout$MyDismissListener;->this$0:Landroidx/wear/widget/DismissibleFrameLayout;

    invoke-virtual {v0}, Landroidx/wear/widget/DismissibleFrameLayout;->performDismissCanceledCallbacks()V

    .line 240
    return-void
.end method

.method public onDismissStarted()V
    .locals 1

    .line 234
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout$MyDismissListener;->this$0:Landroidx/wear/widget/DismissibleFrameLayout;

    invoke-virtual {v0}, Landroidx/wear/widget/DismissibleFrameLayout;->performDismissStartedCallbacks()V

    .line 235
    return-void
.end method

.method public onDismissed()V
    .locals 1

    .line 244
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout$MyDismissListener;->this$0:Landroidx/wear/widget/DismissibleFrameLayout;

    invoke-virtual {v0}, Landroidx/wear/widget/DismissibleFrameLayout;->performDismissFinishedCallbacks()V

    .line 245
    return-void
.end method
