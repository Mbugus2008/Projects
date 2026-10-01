.class public abstract Landroidx/wear/widget/DismissibleFrameLayout$Callback;
.super Ljava/lang/Object;
.source "DismissibleFrameLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/DismissibleFrameLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Callback"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismissCanceled(Landroidx/wear/widget/DismissibleFrameLayout;)V
    .locals 0
    .param p1, "layout"    # Landroidx/wear/widget/DismissibleFrameLayout;

    .line 61
    return-void
.end method

.method public onDismissFinished(Landroidx/wear/widget/DismissibleFrameLayout;)V
    .locals 0
    .param p1, "layout"    # Landroidx/wear/widget/DismissibleFrameLayout;

    .line 69
    return-void
.end method

.method public onDismissStarted(Landroidx/wear/widget/DismissibleFrameLayout;)V
    .locals 0
    .param p1, "layout"    # Landroidx/wear/widget/DismissibleFrameLayout;

    .line 51
    return-void
.end method
