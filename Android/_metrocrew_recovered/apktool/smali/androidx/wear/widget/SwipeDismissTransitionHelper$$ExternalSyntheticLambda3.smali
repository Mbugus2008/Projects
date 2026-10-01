.class public final synthetic Landroidx/wear/widget/SwipeDismissTransitionHelper$$ExternalSyntheticLambda3;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;


# instance fields
.field public final synthetic f$0:Landroidx/wear/widget/SwipeDismissTransitionHelper;

.field public final synthetic f$1:Landroidx/wear/widget/DismissController$OnDismissListener;


# direct methods
.method public synthetic constructor <init>(Landroidx/wear/widget/SwipeDismissTransitionHelper;Landroidx/wear/widget/DismissController$OnDismissListener;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper$$ExternalSyntheticLambda3;->f$0:Landroidx/wear/widget/SwipeDismissTransitionHelper;

    iput-object p2, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper$$ExternalSyntheticLambda3;->f$1:Landroidx/wear/widget/DismissController$OnDismissListener;

    return-void
.end method


# virtual methods
.method public final onAnimationEnd(Landroidx/dynamicanimation/animation/DynamicAnimation;ZFF)V
    .locals 6

    .line 0
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper$$ExternalSyntheticLambda3;->f$0:Landroidx/wear/widget/SwipeDismissTransitionHelper;

    iget-object v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper$$ExternalSyntheticLambda3;->f$1:Landroidx/wear/widget/DismissController$OnDismissListener;

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-virtual/range {v0 .. v5}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->lambda$animateDismissal$3$androidx-wear-widget-SwipeDismissTransitionHelper(Landroidx/wear/widget/DismissController$OnDismissListener;Landroidx/dynamicanimation/animation/DynamicAnimation;ZFF)V

    return-void
.end method
