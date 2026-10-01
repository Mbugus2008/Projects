.class Landroidx/wear/widget/SwipeDismissTransitionHelper$1;
.super Landroid/view/ViewOutlineProvider;
.source "SwipeDismissTransitionHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/wear/widget/SwipeDismissTransitionHelper;->clipOutline(Landroid/view/View;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$useRoundShape:Z


# direct methods
.method constructor <init>(Z)V
    .locals 0

    .line 95
    iput-boolean p1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper$1;->val$useRoundShape:Z

    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "outline"    # Landroid/graphics/Outline;

    .line 98
    iget-boolean v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper$1;->val$useRoundShape:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 99
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    invoke-virtual {p2, v1, v1, v0, v2}, Landroid/graphics/Outline;->setOval(IIII)V

    goto :goto_0

    .line 101
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v2

    invoke-virtual {p2, v1, v1, v0, v2}, Landroid/graphics/Outline;->setRect(IIII)V

    .line 103
    :goto_0
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/graphics/Outline;->setAlpha(F)V

    .line 104
    return-void
.end method
