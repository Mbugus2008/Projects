.class public Landroidx/wear/widget/SwipeDismissFrameLayout;
.super Landroidx/wear/widget/DismissibleFrameLayout;
.source "SwipeDismissFrameLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/widget/SwipeDismissFrameLayout$Callback;
    }
.end annotation


# static fields
.field public static final DEFAULT_DISMISS_DRAG_WIDTH_RATIO:F = 0.33f


# instance fields
.field final mCallbacksCompat:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/wear/widget/SwipeDismissFrameLayout$Callback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 82
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Landroidx/wear/widget/SwipeDismissFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 83
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 100
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/wear/widget/SwipeDismissFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 101
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .line 115
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroidx/wear/widget/SwipeDismissFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 116
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I
    .param p4, "defStyleRes"    # I

    .line 132
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/wear/widget/DismissibleFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 73
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/wear/widget/SwipeDismissFrameLayout;->mCallbacksCompat:Ljava/util/ArrayList;

    .line 133
    return-void
.end method


# virtual methods
.method public addCallback(Landroidx/wear/widget/SwipeDismissFrameLayout$Callback;)V
    .locals 2
    .param p1, "callback"    # Landroidx/wear/widget/SwipeDismissFrameLayout$Callback;

    .line 137
    if-eqz p1, :cond_0

    .line 141
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissFrameLayout;->mCallbacksCompat:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 142
    return-void

    .line 138
    :cond_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "addCallback called with null callback"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getDismissMinDragWidthRatio()F
    .locals 1

    .line 185
    invoke-virtual {p0}, Landroidx/wear/widget/SwipeDismissFrameLayout;->isSwipeable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 186
    invoke-virtual {p0}, Landroidx/wear/widget/SwipeDismissFrameLayout;->getSwipeDismissController()Landroidx/wear/widget/SwipeDismissController;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/wear/widget/SwipeDismissController;->getDismissMinDragWidthRatio()F

    move-result v0

    return v0

    .line 188
    :cond_0
    const v0, 0x3ea8f5c3    # 0.33f

    return v0
.end method

.method public isSwipeable()Z
    .locals 1

    .line 164
    invoke-super {p0}, Landroidx/wear/widget/DismissibleFrameLayout;->isDismissableBySwipe()Z

    move-result v0

    return v0
.end method

.method protected performDismissCanceledCallbacks()V
    .locals 2

    .line 209
    invoke-super {p0}, Landroidx/wear/widget/DismissibleFrameLayout;->performDismissCanceledCallbacks()V

    .line 210
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissFrameLayout;->mCallbacksCompat:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_0

    .line 211
    iget-object v1, p0, Landroidx/wear/widget/SwipeDismissFrameLayout;->mCallbacksCompat:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/wear/widget/SwipeDismissFrameLayout$Callback;

    invoke-virtual {v1, p0}, Landroidx/wear/widget/SwipeDismissFrameLayout$Callback;->onSwipeCanceled(Landroidx/wear/widget/SwipeDismissFrameLayout;)V

    .line 210
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 213
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method protected performDismissFinishedCallbacks()V
    .locals 2

    .line 193
    invoke-super {p0}, Landroidx/wear/widget/DismissibleFrameLayout;->performDismissFinishedCallbacks()V

    .line 194
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissFrameLayout;->mCallbacksCompat:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_0

    .line 195
    iget-object v1, p0, Landroidx/wear/widget/SwipeDismissFrameLayout;->mCallbacksCompat:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/wear/widget/SwipeDismissFrameLayout$Callback;

    invoke-virtual {v1, p0}, Landroidx/wear/widget/SwipeDismissFrameLayout$Callback;->onDismissed(Landroidx/wear/widget/SwipeDismissFrameLayout;)V

    .line 194
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 197
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method protected performDismissStartedCallbacks()V
    .locals 2

    .line 201
    invoke-super {p0}, Landroidx/wear/widget/DismissibleFrameLayout;->performDismissStartedCallbacks()V

    .line 202
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissFrameLayout;->mCallbacksCompat:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_0

    .line 203
    iget-object v1, p0, Landroidx/wear/widget/SwipeDismissFrameLayout;->mCallbacksCompat:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/wear/widget/SwipeDismissFrameLayout$Callback;

    invoke-virtual {v1, p0}, Landroidx/wear/widget/SwipeDismissFrameLayout$Callback;->onSwipeStarted(Landroidx/wear/widget/SwipeDismissFrameLayout;)V

    .line 202
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 205
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method public removeCallback(Landroidx/wear/widget/SwipeDismissFrameLayout$Callback;)V
    .locals 2
    .param p1, "callback"    # Landroidx/wear/widget/SwipeDismissFrameLayout$Callback;

    .line 146
    if-eqz p1, :cond_1

    .line 149
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissFrameLayout;->mCallbacksCompat:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 152
    return-void

    .line 150
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "removeCallback called with nonexistent callback"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 147
    :cond_1
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "removeCallback called with null callback"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public setDismissMinDragWidthRatio(F)V
    .locals 1
    .param p1, "ratio"    # F

    .line 175
    invoke-virtual {p0}, Landroidx/wear/widget/SwipeDismissFrameLayout;->isSwipeable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 176
    invoke-virtual {p0}, Landroidx/wear/widget/SwipeDismissFrameLayout;->getSwipeDismissController()Landroidx/wear/widget/SwipeDismissController;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroidx/wear/widget/SwipeDismissController;->setDismissMinDragWidthRatio(F)V

    .line 178
    :cond_0
    return-void
.end method

.method public setSwipeable(Z)V
    .locals 0
    .param p1, "swipeable"    # Z

    .line 159
    invoke-super {p0, p1}, Landroidx/wear/widget/DismissibleFrameLayout;->setSwipeDismissible(Z)V

    .line 160
    return-void
.end method
