.class Landroidx/wear/widget/drawer/PageIndicatorView$1;
.super Landroidx/wear/widget/SimpleAnimatorListener;
.source "PageIndicatorView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/wear/widget/drawer/PageIndicatorView;->fadeInOut()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/wear/widget/drawer/PageIndicatorView;


# direct methods
.method constructor <init>(Landroidx/wear/widget/drawer/PageIndicatorView;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/wear/widget/drawer/PageIndicatorView;

    .line 500
    iput-object p1, p0, Landroidx/wear/widget/drawer/PageIndicatorView$1;->this$0:Landroidx/wear/widget/drawer/PageIndicatorView;

    invoke-direct {p0}, Landroidx/wear/widget/SimpleAnimatorListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationComplete(Landroid/animation/Animator;)V
    .locals 3
    .param p1, "animator"    # Landroid/animation/Animator;

    .line 503
    iget-object v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView$1;->this$0:Landroidx/wear/widget/drawer/PageIndicatorView;

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroidx/wear/widget/drawer/PageIndicatorView;->mVisible:Z

    .line 504
    iget-object v0, p0, Landroidx/wear/widget/drawer/PageIndicatorView$1;->this$0:Landroidx/wear/widget/drawer/PageIndicatorView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/PageIndicatorView;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 505
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 506
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-object v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView$1;->this$0:Landroidx/wear/widget/drawer/PageIndicatorView;

    iget v1, v1, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeOutDelay:I

    int-to-long v1, v1

    .line 507
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-object v1, p0, Landroidx/wear/widget/drawer/PageIndicatorView$1;->this$0:Landroidx/wear/widget/drawer/PageIndicatorView;

    iget v1, v1, Landroidx/wear/widget/drawer/PageIndicatorView;->mDotFadeOutDuration:I

    int-to-long v1, v1

    .line 508
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    .line 509
    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 510
    return-void
.end method
