.class public Landroidx/wear/widget/DismissibleFrameLayout;
.super Landroid/widget/FrameLayout;
.source "DismissibleFrameLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/widget/DismissibleFrameLayout$MyDismissListener;,
        Landroidx/wear/widget/DismissibleFrameLayout$Callback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "DismissibleFrameLayout"


# instance fields
.field private mBackButtonDismissController:Landroidx/wear/widget/BackButtonDismissController;

.field final mCallbacks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/wear/widget/DismissibleFrameLayout$Callback;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;

.field private final mDismissListener:Landroidx/wear/widget/DismissibleFrameLayout$MyDismissListener;

.field private mSwipeDismissController:Landroidx/wear/widget/SwipeDismissController;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 85
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/wear/widget/DismissibleFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 86
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 103
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/wear/widget/DismissibleFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 104
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .line 121
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroidx/wear/widget/DismissibleFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 122
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I
    .param p4, "defStyleRes"    # I

    .line 140
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 73
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mSwipeDismissController:Landroidx/wear/widget/SwipeDismissController;

    .line 74
    iput-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mBackButtonDismissController:Landroidx/wear/widget/BackButtonDismissController;

    .line 75
    new-instance v0, Landroidx/wear/widget/DismissibleFrameLayout$MyDismissListener;

    invoke-direct {v0, p0}, Landroidx/wear/widget/DismissibleFrameLayout$MyDismissListener;-><init>(Landroidx/wear/widget/DismissibleFrameLayout;)V

    iput-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mDismissListener:Landroidx/wear/widget/DismissibleFrameLayout$MyDismissListener;

    .line 76
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mCallbacks:Ljava/util/ArrayList;

    .line 142
    iput-object p1, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mContext:Landroid/content/Context;

    .line 144
    invoke-static {p1}, Landroidx/wear/utils/WearableNavigationHelper;->isSwipeToDismissEnabled(Landroid/content/Context;)Z

    move-result v0

    invoke-virtual {p0, v0}, Landroidx/wear/widget/DismissibleFrameLayout;->setSwipeDismissible(Z)V

    .line 145
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/wear/widget/DismissibleFrameLayout;->setBackButtonDismissible(Z)V

    .line 146
    return-void
.end method


# virtual methods
.method public canScrollHorizontally(I)Z
    .locals 1
    .param p1, "direction"    # I

    .line 272
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mSwipeDismissController:Landroidx/wear/widget/SwipeDismissController;

    if-eqz v0, :cond_0

    .line 273
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mSwipeDismissController:Landroidx/wear/widget/SwipeDismissController;

    invoke-virtual {v0, p1}, Landroidx/wear/widget/SwipeDismissController;->canScrollHorizontally(I)Z

    move-result v0

    return v0

    .line 275
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->canScrollHorizontally(I)Z

    move-result v0

    return v0
.end method

.method getSwipeDismissController()Landroidx/wear/widget/SwipeDismissController;
    .locals 1

    .line 207
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mSwipeDismissController:Landroidx/wear/widget/SwipeDismissController;

    return-object v0
.end method

.method public isDismissableByBackButton()Z
    .locals 1

    .line 202
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mBackButtonDismissController:Landroidx/wear/widget/BackButtonDismissController;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isDismissableBySwipe()Z
    .locals 1

    .line 181
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mSwipeDismissController:Landroidx/wear/widget/SwipeDismissController;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .line 264
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mSwipeDismissController:Landroidx/wear/widget/SwipeDismissController;

    if-eqz v0, :cond_0

    .line 265
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mSwipeDismissController:Landroidx/wear/widget/SwipeDismissController;

    invoke-virtual {v0, p1}, Landroidx/wear/widget/SwipeDismissController;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0

    .line 267
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .line 281
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mSwipeDismissController:Landroidx/wear/widget/SwipeDismissController;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mSwipeDismissController:Landroidx/wear/widget/SwipeDismissController;

    .line 282
    invoke-virtual {v0, p1}, Landroidx/wear/widget/SwipeDismissController;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 283
    const/4 v0, 0x1

    return v0

    .line 285
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method protected performDismissCanceledCallbacks()V
    .locals 2

    .line 223
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_0

    .line 224
    iget-object v1, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/wear/widget/DismissibleFrameLayout$Callback;

    invoke-virtual {v1, p0}, Landroidx/wear/widget/DismissibleFrameLayout$Callback;->onDismissCanceled(Landroidx/wear/widget/DismissibleFrameLayout;)V

    .line 223
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 226
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method protected performDismissFinishedCallbacks()V
    .locals 2

    .line 211
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_0

    .line 212
    iget-object v1, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/wear/widget/DismissibleFrameLayout$Callback;

    invoke-virtual {v1, p0}, Landroidx/wear/widget/DismissibleFrameLayout$Callback;->onDismissFinished(Landroidx/wear/widget/DismissibleFrameLayout;)V

    .line 211
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 214
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method protected performDismissStartedCallbacks()V
    .locals 2

    .line 217
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_0

    .line 218
    iget-object v1, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/wear/widget/DismissibleFrameLayout$Callback;

    invoke-virtual {v1, p0}, Landroidx/wear/widget/DismissibleFrameLayout$Callback;->onDismissStarted(Landroidx/wear/widget/DismissibleFrameLayout;)V

    .line 217
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 220
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method public final registerCallback(Landroidx/wear/widget/DismissibleFrameLayout$Callback;)V
    .locals 1
    .param p1, "callback"    # Landroidx/wear/widget/DismissibleFrameLayout$Callback;

    .line 151
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 152
    return-void
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .locals 1
    .param p1, "disallowIntercept"    # Z

    .line 255
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mSwipeDismissController:Landroidx/wear/widget/SwipeDismissController;

    if-eqz v0, :cond_0

    .line 256
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mSwipeDismissController:Landroidx/wear/widget/SwipeDismissController;

    invoke-virtual {v0, p1}, Landroidx/wear/widget/SwipeDismissController;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_0

    .line 258
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->requestDisallowInterceptTouchEvent(Z)V

    .line 260
    :goto_0
    return-void
.end method

.method public final setBackButtonDismissible(Z)V
    .locals 2
    .param p1, "backButtonDismissible"    # Z

    .line 189
    if-eqz p1, :cond_0

    .line 190
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mBackButtonDismissController:Landroidx/wear/widget/BackButtonDismissController;

    if-nez v0, :cond_1

    .line 191
    new-instance v0, Landroidx/wear/widget/BackButtonDismissController;

    iget-object v1, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p0}, Landroidx/wear/widget/BackButtonDismissController;-><init>(Landroid/content/Context;Landroidx/wear/widget/DismissibleFrameLayout;)V

    iput-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mBackButtonDismissController:Landroidx/wear/widget/BackButtonDismissController;

    .line 192
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mBackButtonDismissController:Landroidx/wear/widget/BackButtonDismissController;

    iget-object v1, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mDismissListener:Landroidx/wear/widget/DismissibleFrameLayout$MyDismissListener;

    invoke-virtual {v0, v1}, Landroidx/wear/widget/BackButtonDismissController;->setOnDismissListener(Landroidx/wear/widget/DismissController$OnDismissListener;)V

    goto :goto_0

    .line 194
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mBackButtonDismissController:Landroidx/wear/widget/BackButtonDismissController;

    if-eqz v0, :cond_1

    .line 195
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mBackButtonDismissController:Landroidx/wear/widget/BackButtonDismissController;

    invoke-virtual {v0, p0}, Landroidx/wear/widget/BackButtonDismissController;->disable(Landroidx/wear/widget/DismissibleFrameLayout;)V

    .line 196
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mBackButtonDismissController:Landroidx/wear/widget/BackButtonDismissController;

    .line 198
    :cond_1
    :goto_0
    return-void
.end method

.method public final setSwipeDismissible(Z)V
    .locals 2
    .param p1, "swipeDismissible"    # Z

    .line 168
    if-eqz p1, :cond_0

    .line 169
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mSwipeDismissController:Landroidx/wear/widget/SwipeDismissController;

    if-nez v0, :cond_1

    .line 170
    new-instance v0, Landroidx/wear/widget/SwipeDismissController;

    iget-object v1, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p0}, Landroidx/wear/widget/SwipeDismissController;-><init>(Landroid/content/Context;Landroidx/wear/widget/DismissibleFrameLayout;)V

    iput-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mSwipeDismissController:Landroidx/wear/widget/SwipeDismissController;

    .line 171
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mSwipeDismissController:Landroidx/wear/widget/SwipeDismissController;

    iget-object v1, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mDismissListener:Landroidx/wear/widget/DismissibleFrameLayout$MyDismissListener;

    invoke-virtual {v0, v1}, Landroidx/wear/widget/SwipeDismissController;->setOnDismissListener(Landroidx/wear/widget/DismissController$OnDismissListener;)V

    goto :goto_0

    .line 173
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mSwipeDismissController:Landroidx/wear/widget/SwipeDismissController;

    if-eqz v0, :cond_1

    .line 174
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mSwipeDismissController:Landroidx/wear/widget/SwipeDismissController;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/wear/widget/SwipeDismissController;->setOnDismissListener(Landroidx/wear/widget/DismissController$OnDismissListener;)V

    .line 175
    iput-object v1, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mSwipeDismissController:Landroidx/wear/widget/SwipeDismissController;

    .line 177
    :cond_1
    :goto_0
    return-void
.end method

.method public final unregisterCallback(Landroidx/wear/widget/DismissibleFrameLayout$Callback;)V
    .locals 2
    .param p1, "callback"    # Landroidx/wear/widget/DismissibleFrameLayout$Callback;

    .line 157
    iget-object v0, p0, Landroidx/wear/widget/DismissibleFrameLayout;->mCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 160
    return-void

    .line 158
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "removeCallback called with nonexistent callback"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
