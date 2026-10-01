.class public Landroidx/wear/widget/drawer/WearableNavigationDrawerView;
.super Landroidx/wear/widget/drawer/WearableDrawerView;
.source "WearableNavigationDrawerView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;,
        Landroidx/wear/widget/drawer/WearableNavigationDrawerView$OnItemSelectedListener;,
        Landroidx/wear/widget/drawer/WearableNavigationDrawerView$NavigationStyle;
    }
.end annotation


# static fields
.field private static final AUTO_CLOSE_DRAWER_DELAY_MS:J

.field private static final DEFAULT_STYLE:I = 0x0

.field public static final MULTI_PAGE:I = 0x1

.field public static final SINGLE_PAGE:I = 0x0

.field private static final TAG:Ljava/lang/String; = "WearableNavDrawer"


# instance fields
.field private final mCloseDrawerRunnable:Ljava/lang/Runnable;

.field private final mGestureDetector:Landroid/view/GestureDetector;

.field private final mIsAccessibilityEnabled:Z

.field private final mMainThreadHandler:Landroid/os/Handler;

.field private final mNavigationStyle:I

.field private final mOnGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

.field final mPresenter:Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 98
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x5

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->AUTO_CLOSE_DRAWER_DELAY_MS:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 122
    const/4 v0, 0x0

    move-object v1, v0

    check-cast v1, Landroid/util/AttributeSet;

    invoke-direct {p0, p1, v0}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 123
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .line 125
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 126
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .line 129
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 130
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I

    .line 134
    invoke-direct {p0, p1, p2, p3, p4}, Landroidx/wear/widget/drawer/WearableDrawerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 100
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mMainThreadHandler:Landroid/os/Handler;

    .line 101
    new-instance v0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView$1;

    invoke-direct {v0, p0}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView$1;-><init>(Landroidx/wear/widget/drawer/WearableNavigationDrawerView;)V

    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mCloseDrawerRunnable:Ljava/lang/Runnable;

    .line 114
    new-instance v0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView$2;

    invoke-direct {v0, p0}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView$2;-><init>(Landroidx/wear/widget/drawer/WearableNavigationDrawerView;)V

    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mOnGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

    .line 136
    new-instance v0, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mOnGestureListener:Landroid/view/GestureDetector$SimpleOnGestureListener;

    invoke-direct {v0, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mGestureDetector:Landroid/view/GestureDetector;

    .line 138
    const/4 v0, 0x0

    .line 139
    .local v0, "navStyle":I
    if-eqz p2, :cond_0

    .line 140
    sget-object v1, Landroidx/wear/R$styleable;->WearableNavigationDrawerView:[I

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v7

    .line 146
    .local v7, "typedArray":Landroid/content/res/TypedArray;
    sget-object v5, Landroidx/wear/R$styleable;->WearableNavigationDrawerView:[I

    const/4 v9, 0x0

    move-object v3, p0

    move-object v4, p1

    move-object v6, p2

    move v8, p3

    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "attrs":Landroid/util/AttributeSet;
    .end local p3    # "defStyleAttr":I
    .local v4, "context":Landroid/content/Context;
    .local v6, "attrs":Landroid/util/AttributeSet;
    .local v8, "defStyleAttr":I
    invoke-static/range {v3 .. v9}, Landroidx/core/view/ViewCompat;->saveAttributeDataForStyleable(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 151
    sget p1, Landroidx/wear/R$styleable;->WearableNavigationDrawerView_navigationStyle:I

    invoke-virtual {v7, p1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    .line 153
    invoke-virtual {v7}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_0

    .line 139
    .end local v4    # "context":Landroid/content/Context;
    .end local v6    # "attrs":Landroid/util/AttributeSet;
    .end local v7    # "typedArray":Landroid/content/res/TypedArray;
    .end local v8    # "defStyleAttr":I
    .restart local p1    # "context":Landroid/content/Context;
    .restart local p2    # "attrs":Landroid/util/AttributeSet;
    .restart local p3    # "defStyleAttr":I
    :cond_0
    move-object v3, p0

    move-object v4, p1

    move-object v6, p2

    move v8, p3

    .line 156
    .end local p1    # "context":Landroid/content/Context;
    .end local p2    # "attrs":Landroid/util/AttributeSet;
    .end local p3    # "defStyleAttr":I
    .restart local v4    # "context":Landroid/content/Context;
    .restart local v6    # "attrs":Landroid/util/AttributeSet;
    .restart local v8    # "defStyleAttr":I
    :goto_0
    iput v0, v3, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mNavigationStyle:I

    .line 157
    nop

    .line 158
    const-string p1, "accessibility"

    invoke-virtual {v4, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/accessibility/AccessibilityManager;

    .line 159
    .local p1, "accessibilityManager":Landroid/view/accessibility/AccessibilityManager;
    invoke-virtual {p1}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result p2

    iput-boolean p2, v3, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mIsAccessibilityEnabled:Z

    .line 161
    nop

    .line 162
    iget p2, v3, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mNavigationStyle:I

    if-nez p2, :cond_1

    .line 163
    new-instance p2, Landroidx/wear/internal/widget/drawer/SinglePagePresenter;

    new-instance p3, Landroidx/wear/internal/widget/drawer/SinglePageUi;

    invoke-direct {p3, p0}, Landroidx/wear/internal/widget/drawer/SinglePageUi;-><init>(Landroidx/wear/widget/drawer/WearableNavigationDrawerView;)V

    iget-boolean v1, v3, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mIsAccessibilityEnabled:Z

    invoke-direct {p2, p3, v1}, Landroidx/wear/internal/widget/drawer/SinglePagePresenter;-><init>(Landroidx/wear/internal/widget/drawer/SinglePagePresenter$Ui;Z)V

    goto :goto_1

    .line 164
    :cond_1
    new-instance p2, Landroidx/wear/internal/widget/drawer/MultiPagePresenter;

    new-instance p3, Landroidx/wear/internal/widget/drawer/MultiPageUi;

    invoke-direct {p3}, Landroidx/wear/internal/widget/drawer/MultiPageUi;-><init>()V

    iget-boolean v1, v3, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mIsAccessibilityEnabled:Z

    invoke-direct {p2, p0, p3, v1}, Landroidx/wear/internal/widget/drawer/MultiPagePresenter;-><init>(Landroidx/wear/widget/drawer/WearableNavigationDrawerView;Landroidx/wear/internal/widget/drawer/MultiPagePresenter$Ui;Z)V

    :goto_1
    iput-object p2, v3, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mPresenter:Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;

    .line 166
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->getPeekContainer()Landroid/view/ViewGroup;

    move-result-object p2

    sget p3, Landroidx/wear/R$string;->ws_navigation_drawer_content_description:I

    .line 168
    invoke-virtual {v4, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p3

    .line 167
    invoke-virtual {p2, p3}, Landroid/view/ViewGroup;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 170
    const/4 p2, 0x1

    invoke-virtual {p0, p2}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->setOpenOnlyAtTopEnabled(Z)V

    .line 171
    return-void
.end method

.method private autoCloseDrawerAfterDelay()V
    .locals 4

    .line 235
    iget-boolean v0, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mIsAccessibilityEnabled:Z

    if-nez v0, :cond_0

    .line 236
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mMainThreadHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mCloseDrawerRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 237
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mMainThreadHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mCloseDrawerRunnable:Ljava/lang/Runnable;

    sget-wide v2, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->AUTO_CLOSE_DRAWER_DELAY_MS:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 239
    :cond_0
    return-void
.end method


# virtual methods
.method public addOnItemSelectedListener(Landroidx/wear/widget/drawer/WearableNavigationDrawerView$OnItemSelectedListener;)V
    .locals 1
    .param p1, "listener"    # Landroidx/wear/widget/drawer/WearableNavigationDrawerView$OnItemSelectedListener;

    .line 184
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mPresenter:Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;

    invoke-virtual {v0, p1}, Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;->onItemSelectedListenerAdded(Landroidx/wear/widget/drawer/WearableNavigationDrawerView$OnItemSelectedListener;)V

    .line 185
    return-void
.end method

.method public canScrollHorizontally(I)Z
    .locals 1
    .param p1, "direction"    # I

    .line 221
    invoke-virtual {p0}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->isOpened()Z

    move-result v0

    return v0
.end method

.method public getNavigationStyle()I
    .locals 1

    .line 208
    iget v0, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mNavigationStyle:I

    return v0
.end method

.method public onDrawerClosed()V
    .locals 2

    .line 231
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mMainThreadHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mCloseDrawerRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 232
    return-void
.end method

.method public onDrawerOpened()V
    .locals 0

    .line 226
    invoke-direct {p0}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->autoCloseDrawerAfterDelay()V

    .line 227
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .line 213
    invoke-direct {p0}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->autoCloseDrawerAfterDelay()V

    .line 214
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mGestureDetector:Landroid/view/GestureDetector;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method preferGravity()I
    .locals 1

    .line 243
    const/16 v0, 0x30

    return v0
.end method

.method public removeOnItemSelectedListener(Landroidx/wear/widget/drawer/WearableNavigationDrawerView$OnItemSelectedListener;)V
    .locals 1
    .param p1, "listener"    # Landroidx/wear/widget/drawer/WearableNavigationDrawerView$OnItemSelectedListener;

    .line 191
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mPresenter:Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;

    invoke-virtual {v0, p1}, Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;->onItemSelectedListenerRemoved(Landroidx/wear/widget/drawer/WearableNavigationDrawerView$OnItemSelectedListener;)V

    .line 192
    return-void
.end method

.method public setAdapter(Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;)V
    .locals 1
    .param p1, "adapter"    # Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;

    .line 177
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mPresenter:Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;

    invoke-virtual {v0, p1}, Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;->onNewAdapter(Landroidx/wear/widget/drawer/WearableNavigationDrawerView$WearableNavigationDrawerAdapter;)V

    .line 178
    return-void
.end method

.method public setCurrentItem(IZ)V
    .locals 1
    .param p1, "index"    # I
    .param p2, "smoothScrollTo"    # Z

    .line 200
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mPresenter:Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;

    invoke-virtual {v0, p1, p2}, Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;->onSetCurrentItemRequested(IZ)V

    .line 201
    return-void
.end method
