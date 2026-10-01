.class public Landroidx/wear/widget/WearableRecyclerView;
.super Landroidx/recyclerview/widget/RecyclerView;
.source "WearableRecyclerView.java"


# static fields
.field private static final NO_VALUE:I = -0x80000000

.field private static final TAG:Ljava/lang/String; = "WearableRecyclerView"


# instance fields
.field mCenterEdgeItemsWhenThereAreChildren:Z

.field private mCircularScrollingEnabled:Z

.field private mEdgeItemsCenteringEnabled:Z

.field private mOriginalPaddingBottom:I

.field private mOriginalPaddingTop:I

.field private final mPaddingPreDrawListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

.field private final mScrollManager:Landroidx/wear/widget/ScrollManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 65
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroidx/wear/widget/WearableRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 66
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 69
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/wear/widget/WearableRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 70
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .line 73
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroidx/wear/widget/WearableRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 74
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I
    .param p4, "defStyleRes"    # I

    .line 78
    invoke-direct {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 43
    new-instance v0, Landroidx/wear/widget/ScrollManager;

    invoke-direct {v0}, Landroidx/wear/widget/ScrollManager;-><init>()V

    iput-object v0, p0, Landroidx/wear/widget/WearableRecyclerView;->mScrollManager:Landroidx/wear/widget/ScrollManager;

    .line 48
    const/high16 v0, -0x80000000

    iput v0, p0, Landroidx/wear/widget/WearableRecyclerView;->mOriginalPaddingTop:I

    .line 49
    iput v0, p0, Landroidx/wear/widget/WearableRecyclerView;->mOriginalPaddingBottom:I

    .line 52
    new-instance v0, Landroidx/wear/widget/WearableRecyclerView$1;

    invoke-direct {v0, p0}, Landroidx/wear/widget/WearableRecyclerView$1;-><init>(Landroidx/wear/widget/WearableRecyclerView;)V

    iput-object v0, p0, Landroidx/wear/widget/WearableRecyclerView;->mPaddingPreDrawListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 80
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroidx/wear/widget/WearableRecyclerView;->setHasFixedSize(Z)V

    .line 83
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/wear/widget/WearableRecyclerView;->setClipToPadding(Z)V

    .line 85
    if-eqz p2, :cond_0

    .line 86
    sget-object v0, Landroidx/wear/R$styleable;->WearableRecyclerView:[I

    invoke-virtual {p1, p2, v0, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v5

    .line 88
    .local v5, "a":Landroid/content/res/TypedArray;
    sget-object v3, Landroidx/wear/R$styleable;->WearableRecyclerView:[I

    move-object v1, p0

    move-object v2, p1

    move-object v4, p2

    move v6, p3

    move v7, p4

    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "attrs":Landroid/util/AttributeSet;
    .end local p3    # "defStyle":I
    .end local p4    # "defStyleRes":I
    .local v2, "context":Landroid/content/Context;
    .local v4, "attrs":Landroid/util/AttributeSet;
    .local v6, "defStyle":I
    .local v7, "defStyleRes":I
    invoke-static/range {v1 .. v7}, Landroidx/core/view/ViewCompat;->saveAttributeDataForStyleable(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 92
    sget p1, Landroidx/wear/R$styleable;->WearableRecyclerView_circularScrollingGestureEnabled:I

    iget-boolean p2, v1, Landroidx/wear/widget/WearableRecyclerView;->mCircularScrollingEnabled:Z

    .line 93
    invoke-virtual {v5, p1, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    .line 92
    invoke-virtual {p0, p1}, Landroidx/wear/widget/WearableRecyclerView;->setCircularScrollingGestureEnabled(Z)V

    .line 96
    sget p1, Landroidx/wear/R$styleable;->WearableRecyclerView_bezelWidth:I

    iget-object p2, v1, Landroidx/wear/widget/WearableRecyclerView;->mScrollManager:Landroidx/wear/widget/ScrollManager;

    .line 98
    invoke-virtual {p2}, Landroidx/wear/widget/ScrollManager;->getBezelWidth()F

    move-result p2

    .line 97
    invoke-virtual {v5, p1, p2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p1

    .line 96
    invoke-virtual {p0, p1}, Landroidx/wear/widget/WearableRecyclerView;->setBezelFraction(F)V

    .line 99
    sget p1, Landroidx/wear/R$styleable;->WearableRecyclerView_scrollDegreesPerScreen:I

    iget-object p2, v1, Landroidx/wear/widget/WearableRecyclerView;->mScrollManager:Landroidx/wear/widget/ScrollManager;

    .line 102
    invoke-virtual {p2}, Landroidx/wear/widget/ScrollManager;->getScrollDegreesPerScreen()F

    move-result p2

    .line 100
    invoke-virtual {v5, p1, p2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p1

    .line 99
    invoke-virtual {p0, p1}, Landroidx/wear/widget/WearableRecyclerView;->setScrollDegreesPerScreen(F)V

    .line 103
    invoke-virtual {v5}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_0

    .line 85
    .end local v2    # "context":Landroid/content/Context;
    .end local v4    # "attrs":Landroid/util/AttributeSet;
    .end local v5    # "a":Landroid/content/res/TypedArray;
    .end local v6    # "defStyle":I
    .end local v7    # "defStyleRes":I
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "attrs":Landroid/util/AttributeSet;
    .restart local p3    # "defStyle":I
    .restart local p4    # "defStyleRes":I
    :cond_0
    move-object v1, p0

    move-object v2, p1

    move-object v4, p2

    move v6, p3

    move v7, p4

    .line 105
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "attrs":Landroid/util/AttributeSet;
    .end local p3    # "defStyle":I
    .end local p4    # "defStyleRes":I
    .restart local v2    # "context":Landroid/content/Context;
    .restart local v4    # "attrs":Landroid/util/AttributeSet;
    .restart local v6    # "defStyle":I
    .restart local v7    # "defStyleRes":I
    :goto_0
    return-void
.end method

.method private setupOriginalPadding()V
    .locals 4

    .line 135
    iget v0, p0, Landroidx/wear/widget/WearableRecyclerView;->mOriginalPaddingTop:I

    const/high16 v1, -0x80000000

    if-ne v0, v1, :cond_0

    .line 136
    return-void

    .line 138
    :cond_0
    invoke-virtual {p0}, Landroidx/wear/widget/WearableRecyclerView;->getPaddingLeft()I

    move-result v0

    iget v1, p0, Landroidx/wear/widget/WearableRecyclerView;->mOriginalPaddingTop:I

    invoke-virtual {p0}, Landroidx/wear/widget/WearableRecyclerView;->getPaddingRight()I

    move-result v2

    iget v3, p0, Landroidx/wear/widget/WearableRecyclerView;->mOriginalPaddingBottom:I

    invoke-virtual {p0, v0, v1, v2, v3}, Landroidx/wear/widget/WearableRecyclerView;->setPadding(IIII)V

    .line 141
    return-void
.end method


# virtual methods
.method public getBezelFraction()F
    .locals 1

    .line 231
    iget-object v0, p0, Landroidx/wear/widget/WearableRecyclerView;->mScrollManager:Landroidx/wear/widget/ScrollManager;

    invoke-virtual {v0}, Landroidx/wear/widget/ScrollManager;->getBezelWidth()F

    move-result v0

    return v0
.end method

.method public getScrollDegreesPerScreen()F
    .locals 1

    .line 212
    iget-object v0, p0, Landroidx/wear/widget/WearableRecyclerView;->mScrollManager:Landroidx/wear/widget/ScrollManager;

    invoke-virtual {v0}, Landroidx/wear/widget/ScrollManager;->getScrollDegreesPerScreen()F

    move-result v0

    return v0
.end method

.method public isCircularScrollingGestureEnabled()Z
    .locals 1

    .line 187
    iget-boolean v0, p0, Landroidx/wear/widget/WearableRecyclerView;->mCircularScrollingEnabled:Z

    return v0
.end method

.method public isEdgeItemsCenteringEnabled()Z
    .locals 1

    .line 267
    iget-boolean v0, p0, Landroidx/wear/widget/WearableRecyclerView;->mEdgeItemsCenteringEnabled:Z

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 4

    .line 154
    invoke-super {p0}, Landroidx/recyclerview/widget/RecyclerView;->onAttachedToWindow()V

    .line 155
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 156
    .local v0, "screenSize":Landroid/graphics/Point;
    invoke-virtual {p0}, Landroidx/wear/widget/WearableRecyclerView;->getDisplay()Landroid/view/Display;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 157
    iget-object v1, p0, Landroidx/wear/widget/WearableRecyclerView;->mScrollManager:Landroidx/wear/widget/ScrollManager;

    iget v2, v0, Landroid/graphics/Point;->x:I

    iget v3, v0, Landroid/graphics/Point;->y:I

    invoke-virtual {v1, p0, v2, v3}, Landroidx/wear/widget/ScrollManager;->setRecyclerView(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 158
    invoke-virtual {p0}, Landroidx/wear/widget/WearableRecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    iget-object v2, p0, Landroidx/wear/widget/WearableRecyclerView;->mPaddingPreDrawListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 159
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .line 163
    invoke-super {p0}, Landroidx/recyclerview/widget/RecyclerView;->onDetachedFromWindow()V

    .line 164
    iget-object v0, p0, Landroidx/wear/widget/WearableRecyclerView;->mScrollManager:Landroidx/wear/widget/ScrollManager;

    invoke-virtual {v0}, Landroidx/wear/widget/ScrollManager;->clearRecyclerView()V

    .line 165
    invoke-virtual {p0}, Landroidx/wear/widget/WearableRecyclerView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Landroidx/wear/widget/WearableRecyclerView;->mPaddingPreDrawListener:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 166
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "event"    # Landroid/view/MotionEvent;

    .line 145
    iget-boolean v0, p0, Landroidx/wear/widget/WearableRecyclerView;->mCircularScrollingEnabled:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/wear/widget/WearableRecyclerView;->mScrollManager:Landroidx/wear/widget/ScrollManager;

    invoke-virtual {v0, p1}, Landroidx/wear/widget/ScrollManager;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 146
    const/4 v0, 0x1

    return v0

    .line 148
    :cond_0
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method

.method public setBezelFraction(F)V
    .locals 1
    .param p1, "fraction"    # F

    .line 221
    iget-object v0, p0, Landroidx/wear/widget/WearableRecyclerView;->mScrollManager:Landroidx/wear/widget/ScrollManager;

    invoke-virtual {v0, p1}, Landroidx/wear/widget/ScrollManager;->setBezelWidth(F)V

    .line 222
    return-void
.end method

.method public setCircularScrollingGestureEnabled(Z)V
    .locals 0
    .param p1, "circularScrollingGestureEnabled"    # Z

    .line 178
    iput-boolean p1, p0, Landroidx/wear/widget/WearableRecyclerView;->mCircularScrollingEnabled:Z

    .line 179
    return-void
.end method

.method public setEdgeItemsCenteringEnabled(Z)V
    .locals 2
    .param p1, "isEnabled"    # Z

    .line 245
    invoke-virtual {p0}, Landroidx/wear/widget/WearableRecyclerView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Configuration;->isScreenRound()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 246
    iput-boolean v1, p0, Landroidx/wear/widget/WearableRecyclerView;->mEdgeItemsCenteringEnabled:Z

    .line 247
    return-void

    .line 249
    :cond_0
    iput-boolean p1, p0, Landroidx/wear/widget/WearableRecyclerView;->mEdgeItemsCenteringEnabled:Z

    .line 250
    iget-boolean v0, p0, Landroidx/wear/widget/WearableRecyclerView;->mEdgeItemsCenteringEnabled:Z

    if-eqz v0, :cond_2

    .line 251
    invoke-virtual {p0}, Landroidx/wear/widget/WearableRecyclerView;->getChildCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 252
    invoke-virtual {p0}, Landroidx/wear/widget/WearableRecyclerView;->setupCenteredPadding()V

    goto :goto_0

    .line 254
    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/wear/widget/WearableRecyclerView;->mCenterEdgeItemsWhenThereAreChildren:Z

    goto :goto_0

    .line 257
    :cond_2
    invoke-direct {p0}, Landroidx/wear/widget/WearableRecyclerView;->setupOriginalPadding()V

    .line 258
    iput-boolean v1, p0, Landroidx/wear/widget/WearableRecyclerView;->mCenterEdgeItemsWhenThereAreChildren:Z

    .line 260
    :goto_0
    return-void
.end method

.method public setScrollDegreesPerScreen(F)V
    .locals 1
    .param p1, "degreesPerScreen"    # F

    .line 201
    iget-object v0, p0, Landroidx/wear/widget/WearableRecyclerView;->mScrollManager:Landroidx/wear/widget/ScrollManager;

    invoke-virtual {v0, p1}, Landroidx/wear/widget/ScrollManager;->setScrollDegreesPerScreen(F)V

    .line 202
    return-void
.end method

.method setupCenteredPadding()V
    .locals 6

    .line 108
    invoke-virtual {p0}, Landroidx/wear/widget/WearableRecyclerView;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_3

    iget-boolean v0, p0, Landroidx/wear/widget/WearableRecyclerView;->mEdgeItemsCenteringEnabled:Z

    if-nez v0, :cond_0

    goto :goto_1

    .line 113
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/wear/widget/WearableRecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 114
    .local v1, "child":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v2

    .line 116
    .local v2, "height":I
    invoke-virtual {p0}, Landroidx/wear/widget/WearableRecyclerView;->getHeight()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x3f000000    # 0.5f

    mul-float/2addr v3, v4

    int-to-float v5, v2

    mul-float/2addr v5, v4

    sub-float/2addr v3, v5

    float-to-int v3, v3

    .line 118
    .local v3, "desiredPadding":I
    invoke-virtual {p0}, Landroidx/wear/widget/WearableRecyclerView;->getPaddingTop()I

    move-result v4

    if-eq v4, v3, :cond_2

    .line 119
    invoke-virtual {p0}, Landroidx/wear/widget/WearableRecyclerView;->getPaddingTop()I

    move-result v4

    iput v4, p0, Landroidx/wear/widget/WearableRecyclerView;->mOriginalPaddingTop:I

    .line 120
    invoke-virtual {p0}, Landroidx/wear/widget/WearableRecyclerView;->getPaddingBottom()I

    move-result v4

    iput v4, p0, Landroidx/wear/widget/WearableRecyclerView;->mOriginalPaddingBottom:I

    .line 123
    invoke-virtual {p0}, Landroidx/wear/widget/WearableRecyclerView;->getPaddingLeft()I

    move-result v4

    invoke-virtual {p0}, Landroidx/wear/widget/WearableRecyclerView;->getPaddingRight()I

    move-result v5

    invoke-virtual {p0, v4, v3, v5, v3}, Landroidx/wear/widget/WearableRecyclerView;->setPadding(IIII)V

    .line 126
    invoke-virtual {p0}, Landroidx/wear/widget/WearableRecyclerView;->getFocusedChild()Landroid/view/View;

    move-result-object v4

    .line 128
    .local v4, "focusedChild":Landroid/view/View;
    if-eqz v4, :cond_1

    invoke-virtual {p0}, Landroidx/wear/widget/WearableRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->getPosition(Landroid/view/View;)I

    move-result v0

    goto :goto_0

    .line 129
    :cond_1
    nop

    :goto_0
    nop

    .line 130
    .local v0, "focusedPosition":I
    invoke-virtual {p0}, Landroidx/wear/widget/WearableRecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    move-result-object v5

    invoke-virtual {v5, v0}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->scrollToPosition(I)V

    .line 132
    .end local v0    # "focusedPosition":I
    .end local v4    # "focusedChild":Landroid/view/View;
    :cond_2
    return-void

    .line 109
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "height":I
    .end local v3    # "desiredPadding":I
    :cond_3
    :goto_1
    return-void
.end method
