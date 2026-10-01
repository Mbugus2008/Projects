.class Landroidx/wear/widget/BackButtonDismissController;
.super Landroidx/wear/widget/DismissController;
.source "BackButtonDismissController.java"


# direct methods
.method constructor <init>(Landroid/content/Context;Landroidx/wear/widget/DismissibleFrameLayout;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "layout"    # Landroidx/wear/widget/DismissibleFrameLayout;

    .line 38
    invoke-direct {p0, p1, p2}, Landroidx/wear/widget/DismissController;-><init>(Landroid/content/Context;Landroidx/wear/widget/DismissibleFrameLayout;)V

    .line 41
    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroidx/wear/widget/DismissibleFrameLayout;->setFocusableInTouchMode(Z)V

    .line 43
    invoke-virtual {p2}, Landroidx/wear/widget/DismissibleFrameLayout;->requestFocus()Z

    .line 44
    new-instance v0, Landroidx/wear/widget/BackButtonDismissController$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Landroidx/wear/widget/BackButtonDismissController$$ExternalSyntheticLambda0;-><init>(Landroidx/wear/widget/BackButtonDismissController;)V

    invoke-virtual {p2, v0}, Landroidx/wear/widget/DismissibleFrameLayout;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 48
    return-void
.end method

.method private dismiss()Z
    .locals 3

    .line 59
    iget-object v0, p0, Landroidx/wear/widget/BackButtonDismissController;->mDismissListener:Landroidx/wear/widget/DismissController$OnDismissListener;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 61
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/BackButtonDismissController;->mContext:Landroid/content/Context;

    const/4 v1, 0x1

    invoke-static {v0, v1, v1}, Landroidx/wear/utils/ActivityAnimationUtil;->getStandardActivityAnimation(Landroid/content/Context;IZ)Landroid/view/animation/Animation;

    move-result-object v0

    .line 64
    .local v0, "exitAnimation":Landroid/view/animation/Animation;
    if-eqz v0, :cond_1

    .line 65
    new-instance v2, Landroidx/wear/widget/BackButtonDismissController$1;

    invoke-direct {v2, p0}, Landroidx/wear/widget/BackButtonDismissController$1;-><init>(Landroidx/wear/widget/BackButtonDismissController;)V

    invoke-virtual {v0, v2}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 81
    iget-object v2, p0, Landroidx/wear/widget/BackButtonDismissController;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    invoke-virtual {v2, v0}, Landroidx/wear/widget/DismissibleFrameLayout;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0

    .line 83
    :cond_1
    iget-object v2, p0, Landroidx/wear/widget/BackButtonDismissController;->mDismissListener:Landroidx/wear/widget/DismissController$OnDismissListener;

    invoke-interface {v2}, Landroidx/wear/widget/DismissController$OnDismissListener;->onDismissStarted()V

    .line 84
    iget-object v2, p0, Landroidx/wear/widget/BackButtonDismissController;->mDismissListener:Landroidx/wear/widget/DismissController$OnDismissListener;

    invoke-interface {v2}, Landroidx/wear/widget/DismissController$OnDismissListener;->onDismissed()V

    .line 86
    :goto_0
    return v1
.end method


# virtual methods
.method disable(Landroidx/wear/widget/DismissibleFrameLayout;)V
    .locals 1
    .param p1, "layout"    # Landroidx/wear/widget/DismissibleFrameLayout;

    .line 51
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/wear/widget/BackButtonDismissController;->setOnDismissListener(Landroidx/wear/widget/DismissController$OnDismissListener;)V

    .line 52
    invoke-virtual {p1, v0}, Landroidx/wear/widget/DismissibleFrameLayout;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 54
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroidx/wear/widget/DismissibleFrameLayout;->setFocusable(Z)V

    .line 55
    invoke-virtual {p1}, Landroidx/wear/widget/DismissibleFrameLayout;->clearFocus()V

    .line 56
    return-void
.end method

.method synthetic lambda$new$0$androidx-wear-widget-BackButtonDismissController(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .line 45
    const/4 v0, 0x4

    if-ne p2, v0, :cond_0

    .line 46
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 47
    invoke-direct {p0}, Landroidx/wear/widget/BackButtonDismissController;->dismiss()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 45
    :goto_0
    return v1
.end method
