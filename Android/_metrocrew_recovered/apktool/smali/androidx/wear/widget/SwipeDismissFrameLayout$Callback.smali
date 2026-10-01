.class public abstract Landroidx/wear/widget/SwipeDismissFrameLayout$Callback;
.super Ljava/lang/Object;
.source "SwipeDismissFrameLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/SwipeDismissFrameLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Callback"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismissed(Landroidx/wear/widget/SwipeDismissFrameLayout;)V
    .locals 0
    .param p1, "layout"    # Landroidx/wear/widget/SwipeDismissFrameLayout;

    .line 70
    return-void
.end method

.method public onSwipeCanceled(Landroidx/wear/widget/SwipeDismissFrameLayout;)V
    .locals 0
    .param p1, "layout"    # Landroidx/wear/widget/SwipeDismissFrameLayout;

    .line 63
    return-void
.end method

.method public onSwipeStarted(Landroidx/wear/widget/SwipeDismissFrameLayout;)V
    .locals 0
    .param p1, "layout"    # Landroidx/wear/widget/SwipeDismissFrameLayout;

    .line 55
    return-void
.end method
