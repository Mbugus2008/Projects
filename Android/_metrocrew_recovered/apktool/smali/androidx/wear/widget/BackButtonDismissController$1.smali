.class Landroidx/wear/widget/BackButtonDismissController$1;
.super Ljava/lang/Object;
.source "BackButtonDismissController.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/wear/widget/BackButtonDismissController;->dismiss()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/wear/widget/BackButtonDismissController;


# direct methods
.method constructor <init>(Landroidx/wear/widget/BackButtonDismissController;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/wear/widget/BackButtonDismissController;

    .line 66
    iput-object p1, p0, Landroidx/wear/widget/BackButtonDismissController$1;->this$0:Landroidx/wear/widget/BackButtonDismissController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 1
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .line 78
    iget-object v0, p0, Landroidx/wear/widget/BackButtonDismissController$1;->this$0:Landroidx/wear/widget/BackButtonDismissController;

    iget-object v0, v0, Landroidx/wear/widget/BackButtonDismissController;->mDismissListener:Landroidx/wear/widget/DismissController$OnDismissListener;

    invoke-interface {v0}, Landroidx/wear/widget/DismissController$OnDismissListener;->onDismissed()V

    .line 79
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .line 74
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 1
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .line 69
    iget-object v0, p0, Landroidx/wear/widget/BackButtonDismissController$1;->this$0:Landroidx/wear/widget/BackButtonDismissController;

    iget-object v0, v0, Landroidx/wear/widget/BackButtonDismissController;->mDismissListener:Landroidx/wear/widget/DismissController$OnDismissListener;

    invoke-interface {v0}, Landroidx/wear/widget/DismissController$OnDismissListener;->onDismissStarted()V

    .line 70
    return-void
.end method
