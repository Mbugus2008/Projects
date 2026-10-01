.class Landroidx/wear/widget/SwipeDismissTransitionHelper;
.super Ljava/lang/Object;
.source "SwipeDismissTransitionHelper.java"


# static fields
.field private static final DIM_FOREGROUND_MIN:F = 0.3f

.field private static final DIM_FOREGROUND_PROGRESS_FACTOR:F = 2.0f

.field private static final SCALE_MAX:F = 1.0f

.field private static final SCALE_MIN:F = 0.7f

.field public static final SCRIM_BACKGROUND_MAX:F = 0.5f

.field private static final SPRING_ANIMATION_PROGRESS_FINISH_THRESHOLD_PX:I = 0x5

.field private static final SPRING_DAMPING_RATIO:F = 1.0f

.field private static final SPRING_MIN_VISIBLE_CHANGE:F = 0.5f

.field private static final SPRING_STIFFNESS:F = 600.0f

.field private static final TAG:Ljava/lang/String; = "SwipeDismissTransitionHelper"

.field private static final VELOCITY_UNIT:I = 0x3e8


# instance fields
.field private final mCompositingPaint:Landroid/graphics/Paint;

.field private mDimming:F

.field private final mDimmingColorFilterCache:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/graphics/ColorFilter;",
            ">;"
        }
    .end annotation
.end field

.field private mDismissalSpring:Landroidx/dynamicanimation/animation/SpringAnimation;

.field private final mIsScreenRound:Z

.field private final mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

.field private mOriginalViewWidth:I

.field private mPrevParentBackground:Landroid/graphics/drawable/Drawable;

.field private mProgress:F

.field private mRecoverySpring:Landroidx/dynamicanimation/animation/SpringAnimation;

.field private mScale:F

.field private final mScreenWidth:I

.field private final mScrimBackground:Landroid/graphics/drawable/Drawable;

.field private mStarted:Z

.field private mTranslationX:F

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroidx/wear/widget/DismissibleFrameLayout;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "layout"    # Landroidx/wear/widget/DismissibleFrameLayout;

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mDimmingColorFilterCache:Landroid/util/SparseArray;

    .line 71
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mCompositingPaint:Landroid/graphics/Paint;

    .line 83
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mPrevParentBackground:Landroid/graphics/drawable/Drawable;

    .line 87
    iput-object p2, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    .line 88
    invoke-virtual {p2}, Landroidx/wear/widget/DismissibleFrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Configuration;->isScreenRound()Z

    move-result v0

    iput-boolean v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mIsScreenRound:Z

    .line 89
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mScreenWidth:I

    .line 90
    iget v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mScreenWidth:I

    .line 91
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 90
    invoke-direct {p0, v0, v1}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->generateScrimBackgroundDrawable(II)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mScrimBackground:Landroid/graphics/drawable/Drawable;

    .line 92
    return-void
.end method

.method private static clamp(FFF)F
    .locals 1
    .param p0, "min"    # F
    .param p1, "max"    # F
    .param p2, "value"    # F

    .line 115
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {p0, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0
.end method

.method private static clipOutline(Landroid/view/View;Z)V
    .locals 1
    .param p0, "view"    # Landroid/view/View;
    .param p1, "useRoundShape"    # Z

    .line 95
    new-instance v0, Landroidx/wear/widget/SwipeDismissTransitionHelper$1;

    invoke-direct {v0, p1}, Landroidx/wear/widget/SwipeDismissTransitionHelper$1;-><init>(Z)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 106
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/view/View;->setClipToOutline(Z)V

    .line 107
    return-void
.end method

.method private createDimmingColorFilter(F)Landroid/graphics/ColorFilter;
    .locals 5
    .param p1, "level"    # F

    .line 123
    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1, p1}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->clamp(FFF)F

    move-result p1

    .line 124
    const/high16 v0, 0x437f0000    # 255.0f

    mul-float/2addr v0, p1

    float-to-int v0, v0

    .line 125
    .local v0, "alpha":I
    const/4 v1, 0x0

    invoke-static {v0, v1, v1, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v1

    .line 126
    .local v1, "color":I
    iget-object v2, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mDimmingColorFilterCache:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/ColorFilter;

    .line 127
    .local v2, "colorFilter":Landroid/graphics/ColorFilter;
    if-eqz v2, :cond_0

    .line 128
    return-object v2

    .line 130
    :cond_0
    new-instance v3, Landroid/graphics/PorterDuffColorFilter;

    sget-object v4, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v3, v1, v4}, Landroid/graphics/PorterDuffColorFilter;-><init>(ILandroid/graphics/PorterDuff$Mode;)V

    .line 131
    .end local v2    # "colorFilter":Landroid/graphics/ColorFilter;
    .local v3, "colorFilter":Landroid/graphics/ColorFilter;
    iget-object v2, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mDimmingColorFilterCache:Landroid/util/SparseArray;

    invoke-virtual {v2, v0, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 132
    return-object v3
.end method

.method private createSpringAnimation(FFFLandroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationUpdateListener;Landroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;)Landroidx/dynamicanimation/animation/SpringAnimation;
    .locals 3
    .param p1, "startValue"    # F
    .param p2, "finalValue"    # F
    .param p3, "startVelocity"    # F
    .param p4, "onUpdateListener"    # Landroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationUpdateListener;
    .param p5, "onEndListener"    # Landroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;

    .line 140
    new-instance v0, Landroidx/dynamicanimation/animation/SpringAnimation;

    new-instance v1, Landroidx/dynamicanimation/animation/FloatValueHolder;

    invoke-direct {v1}, Landroidx/dynamicanimation/animation/FloatValueHolder;-><init>()V

    invoke-direct {v0, v1}, Landroidx/dynamicanimation/animation/SpringAnimation;-><init>(Landroidx/dynamicanimation/animation/FloatValueHolder;)V

    .line 141
    .local v0, "animation":Landroidx/dynamicanimation/animation/SpringAnimation;
    invoke-virtual {v0, p1}, Landroidx/dynamicanimation/animation/SpringAnimation;->setStartValue(F)Landroidx/dynamicanimation/animation/DynamicAnimation;

    .line 142
    const/high16 v1, 0x3f000000    # 0.5f

    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/SpringAnimation;->setMinimumVisibleChange(F)Landroidx/dynamicanimation/animation/DynamicAnimation;

    .line 143
    new-instance v1, Landroidx/dynamicanimation/animation/SpringForce;

    invoke-direct {v1}, Landroidx/dynamicanimation/animation/SpringForce;-><init>()V

    .line 144
    .local v1, "spring":Landroidx/dynamicanimation/animation/SpringForce;
    invoke-virtual {v1, p2}, Landroidx/dynamicanimation/animation/SpringForce;->setFinalPosition(F)Landroidx/dynamicanimation/animation/SpringForce;

    .line 145
    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v1, v2}, Landroidx/dynamicanimation/animation/SpringForce;->setDampingRatio(F)Landroidx/dynamicanimation/animation/SpringForce;

    .line 146
    const/high16 v2, 0x44160000    # 600.0f

    invoke-virtual {v1, v2}, Landroidx/dynamicanimation/animation/SpringForce;->setStiffness(F)Landroidx/dynamicanimation/animation/SpringForce;

    .line 147
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroidx/dynamicanimation/animation/SpringAnimation;->setMinValue(F)Landroidx/dynamicanimation/animation/DynamicAnimation;

    .line 148
    iget v2, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mScreenWidth:I

    int-to-float v2, v2

    invoke-virtual {v0, v2}, Landroidx/dynamicanimation/animation/SpringAnimation;->setMaxValue(F)Landroidx/dynamicanimation/animation/DynamicAnimation;

    .line 149
    invoke-virtual {v0, p3}, Landroidx/dynamicanimation/animation/SpringAnimation;->setStartVelocity(F)Landroidx/dynamicanimation/animation/DynamicAnimation;

    .line 150
    invoke-virtual {v0, v1}, Landroidx/dynamicanimation/animation/SpringAnimation;->setSpring(Landroidx/dynamicanimation/animation/SpringForce;)Landroidx/dynamicanimation/animation/SpringAnimation;

    .line 151
    invoke-virtual {v0, p4}, Landroidx/dynamicanimation/animation/SpringAnimation;->addUpdateListener(Landroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationUpdateListener;)Landroidx/dynamicanimation/animation/DynamicAnimation;

    .line 152
    invoke-virtual {v0, p5}, Landroidx/dynamicanimation/animation/SpringAnimation;->addEndListener(Landroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;)Landroidx/dynamicanimation/animation/DynamicAnimation;

    .line 153
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/SpringAnimation;->start()V

    .line 154
    return-object v0
.end method

.method private generateScrimBackgroundDrawable(II)Landroid/graphics/drawable/Drawable;
    .locals 3
    .param p1, "width"    # I
    .param p2, "height"    # I

    .line 269
    new-instance v0, Landroid/graphics/drawable/ShapeDrawable;

    new-instance v1, Landroid/graphics/drawable/shapes/RectShape;

    invoke-direct {v1}, Landroid/graphics/drawable/shapes/RectShape;-><init>()V

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 270
    .local v0, "shape":Landroid/graphics/drawable/ShapeDrawable;
    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, p1, p2}, Landroid/graphics/drawable/ShapeDrawable;->setBounds(IIII)V

    .line 271
    invoke-virtual {v0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v1

    const/high16 v2, -0x1000000

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 272
    return-object v0
.end method

.method private getOriginalParentView()Landroid/view/ViewGroup;
    .locals 1

    .line 337
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    invoke-virtual {v0}, Landroidx/wear/widget/DismissibleFrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 338
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    invoke-virtual {v0}, Landroidx/wear/widget/DismissibleFrameLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0

    .line 340
    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private initializeTransition()V
    .locals 7

    .line 218
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mStarted:Z

    .line 219
    invoke-direct {p0}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->getOriginalParentView()Landroid/view/ViewGroup;

    move-result-object v1

    .line 221
    .local v1, "originalParentView":Landroid/view/ViewGroup;
    if-nez v1, :cond_0

    .line 222
    return-void

    .line 225
    :cond_0
    iget-object v2, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mPrevParentBackground:Landroid/graphics/drawable/Drawable;

    if-nez v2, :cond_1

    .line 226
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iput-object v2, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mPrevParentBackground:Landroid/graphics/drawable/Drawable;

    .line 231
    :cond_1
    iget-object v2, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mPrevParentBackground:Landroid/graphics/drawable/Drawable;

    const/4 v3, 0x2

    if-eqz v2, :cond_2

    .line 232
    new-instance v2, Landroid/graphics/drawable/LayerDrawable;

    new-array v4, v3, [Landroid/graphics/drawable/Drawable;

    const/4 v5, 0x0

    iget-object v6, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mPrevParentBackground:Landroid/graphics/drawable/Drawable;

    aput-object v6, v4, v5

    iget-object v5, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mScrimBackground:Landroid/graphics/drawable/Drawable;

    aput-object v5, v4, v0

    invoke-direct {v2, v4}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .local v2, "parentBackgroundLayers":Landroid/graphics/drawable/Drawable;
    goto :goto_0

    .line 235
    .end local v2    # "parentBackgroundLayers":Landroid/graphics/drawable/Drawable;
    :cond_2
    iget-object v2, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mScrimBackground:Landroid/graphics/drawable/Drawable;

    .line 237
    .restart local v2    # "parentBackgroundLayers":Landroid/graphics/drawable/Drawable;
    :goto_0
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 239
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mCompositingPaint:Landroid/graphics/Paint;

    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 240
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    iget-object v4, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mCompositingPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v3, v4}, Landroidx/wear/widget/DismissibleFrameLayout;->setLayerType(ILandroid/graphics/Paint;)V

    .line 241
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    iget-boolean v3, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mIsScreenRound:Z

    invoke-static {v0, v3}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->clipOutline(Landroid/view/View;Z)V

    .line 242
    return-void
.end method

.method private static lerp(FFF)F
    .locals 1
    .param p0, "min"    # F
    .param p1, "max"    # F
    .param p2, "value"    # F

    .line 111
    sub-float v0, p1, p0

    mul-float/2addr v0, p2

    add-float/2addr v0, p0

    return v0
.end method

.method private static lerpInv(FFF)F
    .locals 2
    .param p0, "min"    # F
    .param p1, "max"    # F
    .param p2, "value"    # F

    .line 119
    cmpl-float v0, p0, p1

    if-eqz v0, :cond_0

    sub-float v0, p2, p0

    sub-float v1, p1, p0

    div-float/2addr v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private onDismissalRecoveryAnimationProgressChanged(F)V
    .locals 4
    .param p1, "translationX"    # F

    .line 184
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    invoke-virtual {v0}, Landroidx/wear/widget/DismissibleFrameLayout;->getWidth()I

    move-result v0

    iput v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mOriginalViewWidth:I

    .line 185
    iput p1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mTranslationX:F

    .line 187
    iget v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mTranslationX:F

    const/high16 v1, 0x40000000    # 2.0f

    mul-float/2addr v0, v1

    iget v2, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mOriginalViewWidth:I

    int-to-float v2, v2

    div-float/2addr v0, v2

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float v0, v2, v0

    iput v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mScale:F

    .line 189
    iget v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mScale:F

    invoke-static {v0, v2}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const v3, 0x3f333333    # 0.7f

    invoke-static {v3, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iput v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mScale:F

    .line 190
    iget v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mScale:F

    invoke-static {v2, v3, v0}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->lerpInv(FFF)F

    move-result v0

    .line 191
    .local v0, "nextProgress":F
    iget v2, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mProgress:F

    cmpl-float v2, v0, v2

    if-lez v2, :cond_0

    .line 192
    iput v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mProgress:F

    .line 194
    :cond_0
    iget v2, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mProgress:F

    div-float/2addr v2, v1

    const v1, 0x3e99999a    # 0.3f

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iput v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mDimming:F

    .line 195
    invoke-direct {p0}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->updateView()V

    .line 196
    return-void
.end method

.method private resetTranslationAndAlpha()V
    .locals 4

    .line 246
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mStarted:Z

    .line 247
    const/4 v1, 0x0

    iput v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mTranslationX:F

    .line 248
    iput v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mProgress:F

    .line 249
    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mScale:F

    .line 251
    iget-object v3, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    invoke-virtual {v3, v1}, Landroidx/wear/widget/DismissibleFrameLayout;->setTranslationX(F)V

    .line 252
    iget-object v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    invoke-virtual {v1, v2}, Landroidx/wear/widget/DismissibleFrameLayout;->setScaleX(F)V

    .line 253
    iget-object v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    invoke-virtual {v1, v2}, Landroidx/wear/widget/DismissibleFrameLayout;->setScaleY(F)V

    .line 254
    iget-object v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    invoke-virtual {v1, v2}, Landroidx/wear/widget/DismissibleFrameLayout;->setAlpha(F)V

    .line 255
    iget-object v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mScrimBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 257
    iget-object v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mCompositingPaint:Landroid/graphics/Paint;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 258
    iget-object v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    invoke-virtual {v1, v0, v2}, Landroidx/wear/widget/DismissibleFrameLayout;->setLayerType(ILandroid/graphics/Paint;)V

    .line 259
    iget-object v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    invoke-virtual {v1, v0}, Landroidx/wear/widget/DismissibleFrameLayout;->setClipToOutline(Z)V

    .line 262
    invoke-direct {p0}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->getOriginalParentView()Landroid/view/ViewGroup;

    move-result-object v0

    .line 263
    .local v0, "originalParentView":Landroid/view/ViewGroup;
    if-eqz v0, :cond_0

    .line 264
    iget-object v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mPrevParentBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 266
    :cond_0
    iput-object v2, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mPrevParentBackground:Landroid/graphics/drawable/Drawable;

    .line 267
    return-void
.end method

.method private updateDim()V
    .locals 2

    .line 207
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mCompositingPaint:Landroid/graphics/Paint;

    iget v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mDimming:F

    invoke-direct {p0, v1}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->createDimmingColorFilter(F)Landroid/graphics/ColorFilter;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 208
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    iget-object v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mCompositingPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroidx/wear/widget/DismissibleFrameLayout;->setLayerPaint(Landroid/graphics/Paint;)V

    .line 209
    return-void
.end method

.method private updateScrim()V
    .locals 3

    .line 212
    const/high16 v0, 0x3f800000    # 1.0f

    iget v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mProgress:F

    sub-float/2addr v0, v1

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float/2addr v0, v1

    .line 214
    .local v0, "alpha":F
    iget-object v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mScrimBackground:Landroid/graphics/drawable/Drawable;

    const/high16 v2, 0x437f0000    # 255.0f

    mul-float/2addr v2, v0

    float-to-int v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 215
    return-void
.end method

.method private updateView()V
    .locals 2

    .line 199
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    iget v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mScale:F

    invoke-virtual {v0, v1}, Landroidx/wear/widget/DismissibleFrameLayout;->setScaleX(F)V

    .line 200
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    iget v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mScale:F

    invoke-virtual {v0, v1}, Landroidx/wear/widget/DismissibleFrameLayout;->setScaleY(F)V

    .line 201
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    iget v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mTranslationX:F

    invoke-virtual {v0, v1}, Landroidx/wear/widget/DismissibleFrameLayout;->setTranslationX(F)V

    .line 202
    invoke-direct {p0}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->updateDim()V

    .line 203
    invoke-direct {p0}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->updateScrim()V

    .line 204
    return-void
.end method


# virtual methods
.method animateDismissal(Landroidx/wear/widget/DismissController$OnDismissListener;)V
    .locals 8
    .param p1, "dismissListener"    # Landroidx/wear/widget/DismissController$OnDismissListener;

    .line 310
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v0, :cond_0

    .line 311
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 313
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v1, 0x3e8

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 315
    if-eqz p1, :cond_1

    .line 316
    invoke-interface {p1}, Landroidx/wear/widget/DismissController$OnDismissListener;->onDismissStarted()V

    .line 319
    :cond_1
    iget v3, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mTranslationX:F

    iget v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mScreenWidth:I

    int-to-float v4, v0

    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 320
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v5

    new-instance v6, Landroidx/wear/widget/SwipeDismissTransitionHelper$$ExternalSyntheticLambda2;

    invoke-direct {v6, p0}, Landroidx/wear/widget/SwipeDismissTransitionHelper$$ExternalSyntheticLambda2;-><init>(Landroidx/wear/widget/SwipeDismissTransitionHelper;)V

    new-instance v7, Landroidx/wear/widget/SwipeDismissTransitionHelper$$ExternalSyntheticLambda3;

    invoke-direct {v7, p0, p1}, Landroidx/wear/widget/SwipeDismissTransitionHelper$$ExternalSyntheticLambda3;-><init>(Landroidx/wear/widget/SwipeDismissTransitionHelper;Landroidx/wear/widget/DismissController$OnDismissListener;)V

    .line 319
    move-object v2, p0

    invoke-direct/range {v2 .. v7}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->createSpringAnimation(FFFLandroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationUpdateListener;Landroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;)Landroidx/dynamicanimation/animation/SpringAnimation;

    move-result-object v0

    iput-object v0, v2, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mDismissalSpring:Landroidx/dynamicanimation/animation/SpringAnimation;

    .line 334
    return-void
.end method

.method animateRecovery(Landroidx/wear/widget/DismissController$OnDismissListener;)V
    .locals 8
    .param p1, "dismissListener"    # Landroidx/wear/widget/DismissController$OnDismissListener;

    .line 287
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v1, 0x3e8

    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 288
    iget v3, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mTranslationX:F

    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->getXVelocity()F

    move-result v5

    new-instance v6, Landroidx/wear/widget/SwipeDismissTransitionHelper$$ExternalSyntheticLambda0;

    invoke-direct {v6, p0}, Landroidx/wear/widget/SwipeDismissTransitionHelper$$ExternalSyntheticLambda0;-><init>(Landroidx/wear/widget/SwipeDismissTransitionHelper;)V

    new-instance v7, Landroidx/wear/widget/SwipeDismissTransitionHelper$$ExternalSyntheticLambda1;

    invoke-direct {v7, p0, p1}, Landroidx/wear/widget/SwipeDismissTransitionHelper$$ExternalSyntheticLambda1;-><init>(Landroidx/wear/widget/SwipeDismissTransitionHelper;Landroidx/wear/widget/DismissController$OnDismissListener;)V

    const/4 v4, 0x0

    move-object v2, p0

    invoke-direct/range {v2 .. v7}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->createSpringAnimation(FFFLandroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationUpdateListener;Landroidx/dynamicanimation/animation/DynamicAnimation$OnAnimationEndListener;)Landroidx/dynamicanimation/animation/SpringAnimation;

    move-result-object v0

    iput-object v0, v2, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mRecoverySpring:Landroidx/dynamicanimation/animation/SpringAnimation;

    .line 304
    return-void
.end method

.method getVelocityTracker()Landroid/view/VelocityTracker;
    .locals 1

    .line 348
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    return-object v0
.end method

.method isAnimating()Z
    .locals 1

    .line 279
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mDismissalSpring:Landroidx/dynamicanimation/animation/SpringAnimation;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mDismissalSpring:Landroidx/dynamicanimation/animation/SpringAnimation;

    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/SpringAnimation;->isRunning()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mRecoverySpring:Landroidx/dynamicanimation/animation/SpringAnimation;

    if-eqz v0, :cond_2

    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mRecoverySpring:Landroidx/dynamicanimation/animation/SpringAnimation;

    .line 280
    invoke-virtual {v0}, Landroidx/dynamicanimation/animation/SpringAnimation;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    .line 279
    :goto_0
    return v0
.end method

.method synthetic lambda$animateDismissal$2$androidx-wear-widget-SwipeDismissTransitionHelper(Landroidx/dynamicanimation/animation/DynamicAnimation;FF)V
    .locals 2
    .param p1, "animation"    # Landroidx/dynamicanimation/animation/DynamicAnimation;
    .param p2, "value"    # F
    .param p3, "velocity"    # F

    .line 321
    iget v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mScreenWidth:I

    int-to-float v0, v0

    sub-float/2addr v0, p2

    const/4 v1, 0x0

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 322
    .local v0, "distanceRemaining":F
    const/high16 v1, 0x40a00000    # 5.0f

    cmpg-float v1, v0, v1

    if-gtz v1, :cond_0

    iget-object v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mDismissalSpring:Landroidx/dynamicanimation/animation/SpringAnimation;

    if-eqz v1, :cond_0

    .line 325
    iget-object v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mDismissalSpring:Landroidx/dynamicanimation/animation/SpringAnimation;

    invoke-virtual {v1}, Landroidx/dynamicanimation/animation/SpringAnimation;->skipToEnd()V

    .line 327
    :cond_0
    invoke-direct {p0, p2}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->onDismissalRecoveryAnimationProgressChanged(F)V

    .line 328
    return-void
.end method

.method synthetic lambda$animateDismissal$3$androidx-wear-widget-SwipeDismissTransitionHelper(Landroidx/wear/widget/DismissController$OnDismissListener;Landroidx/dynamicanimation/animation/DynamicAnimation;ZFF)V
    .locals 0
    .param p1, "dismissListener"    # Landroidx/wear/widget/DismissController$OnDismissListener;
    .param p2, "animation"    # Landroidx/dynamicanimation/animation/DynamicAnimation;
    .param p3, "canceled"    # Z
    .param p4, "value"    # F
    .param p5, "velocity"    # F

    .line 329
    invoke-direct {p0}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->resetTranslationAndAlpha()V

    .line 330
    if-eqz p1, :cond_0

    .line 331
    invoke-interface {p1}, Landroidx/wear/widget/DismissController$OnDismissListener;->onDismissed()V

    .line 333
    :cond_0
    return-void
.end method

.method synthetic lambda$animateRecovery$0$androidx-wear-widget-SwipeDismissTransitionHelper(Landroidx/dynamicanimation/animation/DynamicAnimation;FF)V
    .locals 2
    .param p1, "animation"    # Landroidx/dynamicanimation/animation/DynamicAnimation;
    .param p2, "value"    # F
    .param p3, "velocity"    # F

    .line 290
    const/4 v0, 0x0

    sub-float v1, p2, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 291
    .local v0, "distanceRemaining":F
    const/high16 v1, 0x40a00000    # 5.0f

    cmpg-float v1, v0, v1

    if-gtz v1, :cond_0

    iget-object v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mRecoverySpring:Landroidx/dynamicanimation/animation/SpringAnimation;

    if-eqz v1, :cond_0

    .line 294
    iget-object v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mRecoverySpring:Landroidx/dynamicanimation/animation/SpringAnimation;

    invoke-virtual {v1}, Landroidx/dynamicanimation/animation/SpringAnimation;->skipToEnd()V

    .line 296
    :cond_0
    invoke-direct {p0, p2}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->onDismissalRecoveryAnimationProgressChanged(F)V

    .line 297
    return-void
.end method

.method synthetic lambda$animateRecovery$1$androidx-wear-widget-SwipeDismissTransitionHelper(Landroidx/wear/widget/DismissController$OnDismissListener;Landroidx/dynamicanimation/animation/DynamicAnimation;ZFF)V
    .locals 0
    .param p1, "dismissListener"    # Landroidx/wear/widget/DismissController$OnDismissListener;
    .param p2, "animation"    # Landroidx/dynamicanimation/animation/DynamicAnimation;
    .param p3, "canceled"    # Z
    .param p4, "value"    # F
    .param p5, "velocity"    # F

    .line 299
    invoke-direct {p0}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->resetTranslationAndAlpha()V

    .line 300
    if-eqz p1, :cond_0

    .line 301
    invoke-interface {p1}, Landroidx/wear/widget/DismissController$OnDismissListener;->onDismissCanceled()V

    .line 303
    :cond_0
    return-void
.end method

.method obtainVelocityTracker()V
    .locals 1

    .line 355
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 356
    return-void
.end method

.method onSwipeProgressChanged(FLandroid/view/MotionEvent;)V
    .locals 3
    .param p1, "deltaX"    # F
    .param p2, "ev"    # Landroid/view/MotionEvent;

    .line 164
    iget-boolean v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mStarted:Z

    if-nez v0, :cond_0

    .line 165
    invoke-direct {p0}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->initializeTransition()V

    .line 168
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p2}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 169
    iget-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    invoke-virtual {v0}, Landroidx/wear/widget/DismissibleFrameLayout;->getWidth()I

    move-result v0

    iput v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mOriginalViewWidth:I

    .line 172
    iget v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mOriginalViewWidth:I

    int-to-float v0, v0

    div-float v0, p1, v0

    iput v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mProgress:F

    .line 175
    const v0, 0x3f333333    # 0.7f

    iget v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mProgress:F

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v2, v0, v1}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->lerp(FFF)F

    move-result v0

    iput v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mScale:F

    .line 177
    iget v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mScale:F

    sub-float/2addr v2, v0

    const/4 v0, 0x0

    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    iget-object v1, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    invoke-virtual {v1}, Landroidx/wear/widget/DismissibleFrameLayout;->getWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iput v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mTranslationX:F

    .line 178
    iget v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mProgress:F

    div-float/2addr v0, v1

    const v1, 0x3e99999a    # 0.3f

    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iput v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mDimming:F

    .line 180
    invoke-direct {p0}, Landroidx/wear/widget/SwipeDismissTransitionHelper;->updateView()V

    .line 181
    return-void
.end method

.method resetVelocityTracker()V
    .locals 1

    .line 362
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/wear/widget/SwipeDismissTransitionHelper;->mVelocityTracker:Landroid/view/VelocityTracker;

    .line 363
    return-void
.end method
