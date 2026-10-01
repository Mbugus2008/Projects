package androidx.wear.widget;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RectShape;
import android.util.SparseArray;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewOutlineProvider;
import androidx.core.view.ViewCompat;
import androidx.dynamicanimation.animation.DynamicAnimation;
import androidx.dynamicanimation.animation.FloatValueHolder;
import androidx.dynamicanimation.animation.SpringAnimation;
import androidx.dynamicanimation.animation.SpringForce;

/* JADX INFO: loaded from: classes.dex */
class SwipeDismissTransitionHelper {
    private static final float DIM_FOREGROUND_MIN = 0.3f;
    private static final float DIM_FOREGROUND_PROGRESS_FACTOR = 2.0f;
    private static final float SCALE_MAX = 1.0f;
    private static final float SCALE_MIN = 0.7f;
    public static final float SCRIM_BACKGROUND_MAX = 0.5f;
    private static final int SPRING_ANIMATION_PROGRESS_FINISH_THRESHOLD_PX = 5;
    private static final float SPRING_DAMPING_RATIO = 1.0f;
    private static final float SPRING_MIN_VISIBLE_CHANGE = 0.5f;
    private static final float SPRING_STIFFNESS = 600.0f;
    private static final String TAG = "SwipeDismissTransitionHelper";
    private static final int VELOCITY_UNIT = 1000;
    private float mDimming;
    private SpringAnimation mDismissalSpring;
    private final boolean mIsScreenRound;
    private final DismissibleFrameLayout mLayout;
    private int mOriginalViewWidth;
    private float mProgress;
    private SpringAnimation mRecoverySpring;
    private float mScale;
    private boolean mStarted;
    private float mTranslationX;
    private VelocityTracker mVelocityTracker;
    private final SparseArray<ColorFilter> mDimmingColorFilterCache = new SparseArray<>();
    private final Paint mCompositingPaint = new Paint();
    private Drawable mPrevParentBackground = null;
    private final int mScreenWidth = Resources.getSystem().getDisplayMetrics().widthPixels;
    private final Drawable mScrimBackground = generateScrimBackgroundDrawable(this.mScreenWidth, Resources.getSystem().getDisplayMetrics().heightPixels);

    SwipeDismissTransitionHelper(Context context, DismissibleFrameLayout layout) {
        this.mLayout = layout;
        this.mIsScreenRound = layout.getResources().getConfiguration().isScreenRound();
    }

    private static void clipOutline(View view, final boolean useRoundShape) {
        view.setOutlineProvider(new ViewOutlineProvider() { // from class: androidx.wear.widget.SwipeDismissTransitionHelper.1
            @Override // android.view.ViewOutlineProvider
            public void getOutline(View view2, Outline outline) {
                if (useRoundShape) {
                    outline.setOval(0, 0, view2.getWidth(), view2.getHeight());
                } else {
                    outline.setRect(0, 0, view2.getWidth(), view2.getHeight());
                }
                outline.setAlpha(0.0f);
            }
        });
        view.setClipToOutline(true);
    }

    private static float lerp(float min, float max, float value) {
        return ((max - min) * value) + min;
    }

    private static float clamp(float min, float max, float value) {
        return Math.max(min, Math.min(max, value));
    }

    private static float lerpInv(float min, float max, float value) {
        if (min != max) {
            return (value - min) / (max - min);
        }
        return 0.0f;
    }

    private ColorFilter createDimmingColorFilter(float level) {
        int alpha = (int) (255.0f * clamp(0.0f, 1.0f, level));
        int color = Color.argb(alpha, 0, 0, 0);
        ColorFilter colorFilter = this.mDimmingColorFilterCache.get(alpha);
        if (colorFilter != null) {
            return colorFilter;
        }
        ColorFilter colorFilter2 = new PorterDuffColorFilter(color, PorterDuff.Mode.SRC_ATOP);
        this.mDimmingColorFilterCache.put(alpha, colorFilter2);
        return colorFilter2;
    }

    private SpringAnimation createSpringAnimation(float startValue, float finalValue, float startVelocity, DynamicAnimation.OnAnimationUpdateListener onUpdateListener, DynamicAnimation.OnAnimationEndListener onEndListener) {
        SpringAnimation animation = new SpringAnimation(new FloatValueHolder());
        animation.setStartValue(startValue);
        animation.setMinimumVisibleChange(0.5f);
        SpringForce spring = new SpringForce();
        spring.setFinalPosition(finalValue);
        spring.setDampingRatio(1.0f);
        spring.setStiffness(SPRING_STIFFNESS);
        animation.setMinValue(0.0f);
        animation.setMaxValue(this.mScreenWidth);
        animation.setStartVelocity(startVelocity);
        animation.setSpring(spring);
        animation.addUpdateListener(onUpdateListener);
        animation.addEndListener(onEndListener);
        animation.start();
        return animation;
    }

    void onSwipeProgressChanged(float deltaX, MotionEvent ev) {
        if (!this.mStarted) {
            initializeTransition();
        }
        this.mVelocityTracker.addMovement(ev);
        this.mOriginalViewWidth = this.mLayout.getWidth();
        this.mProgress = deltaX / this.mOriginalViewWidth;
        this.mScale = lerp(1.0f, SCALE_MIN, this.mProgress);
        this.mTranslationX = (Math.max(0.0f, 1.0f - this.mScale) * this.mLayout.getWidth()) / DIM_FOREGROUND_PROGRESS_FACTOR;
        this.mDimming = Math.min(DIM_FOREGROUND_MIN, this.mProgress / DIM_FOREGROUND_PROGRESS_FACTOR);
        updateView();
    }

    private void onDismissalRecoveryAnimationProgressChanged(float translationX) {
        this.mOriginalViewWidth = this.mLayout.getWidth();
        this.mTranslationX = translationX;
        this.mScale = 1.0f - ((this.mTranslationX * DIM_FOREGROUND_PROGRESS_FACTOR) / this.mOriginalViewWidth);
        this.mScale = Math.max(SCALE_MIN, Math.min(this.mScale, 1.0f));
        float nextProgress = lerpInv(1.0f, SCALE_MIN, this.mScale);
        if (nextProgress > this.mProgress) {
            this.mProgress = nextProgress;
        }
        this.mDimming = Math.min(DIM_FOREGROUND_MIN, this.mProgress / DIM_FOREGROUND_PROGRESS_FACTOR);
        updateView();
    }

    private void updateView() {
        this.mLayout.setScaleX(this.mScale);
        this.mLayout.setScaleY(this.mScale);
        this.mLayout.setTranslationX(this.mTranslationX);
        updateDim();
        updateScrim();
    }

    private void updateDim() {
        this.mCompositingPaint.setColorFilter(createDimmingColorFilter(this.mDimming));
        this.mLayout.setLayerPaint(this.mCompositingPaint);
    }

    private void updateScrim() {
        float alpha = (1.0f - this.mProgress) * 0.5f;
        this.mScrimBackground.setAlpha((int) (255.0f * alpha));
    }

    private void initializeTransition() {
        Drawable parentBackgroundLayers;
        this.mStarted = true;
        ViewGroup originalParentView = getOriginalParentView();
        if (originalParentView == null) {
            return;
        }
        if (this.mPrevParentBackground == null) {
            this.mPrevParentBackground = originalParentView.getBackground();
        }
        if (this.mPrevParentBackground != null) {
            parentBackgroundLayers = new LayerDrawable(new Drawable[]{this.mPrevParentBackground, this.mScrimBackground});
        } else {
            parentBackgroundLayers = this.mScrimBackground;
        }
        originalParentView.setBackground(parentBackgroundLayers);
        this.mCompositingPaint.setColorFilter(null);
        this.mLayout.setLayerType(2, this.mCompositingPaint);
        clipOutline(this.mLayout, this.mIsScreenRound);
    }

    private void resetTranslationAndAlpha() {
        this.mStarted = false;
        this.mTranslationX = 0.0f;
        this.mProgress = 0.0f;
        this.mScale = 1.0f;
        this.mLayout.setTranslationX(0.0f);
        this.mLayout.setScaleX(1.0f);
        this.mLayout.setScaleY(1.0f);
        this.mLayout.setAlpha(1.0f);
        this.mScrimBackground.setAlpha(0);
        this.mCompositingPaint.setColorFilter(null);
        this.mLayout.setLayerType(0, null);
        this.mLayout.setClipToOutline(false);
        ViewGroup originalParentView = getOriginalParentView();
        if (originalParentView != null) {
            originalParentView.setBackground(this.mPrevParentBackground);
        }
        this.mPrevParentBackground = null;
    }

    private Drawable generateScrimBackgroundDrawable(int width, int height) {
        ShapeDrawable shape = new ShapeDrawable(new RectShape());
        shape.setBounds(0, 0, width, height);
        shape.getPaint().setColor(ViewCompat.MEASURED_STATE_MASK);
        return shape;
    }

    boolean isAnimating() {
        return (this.mDismissalSpring != null && this.mDismissalSpring.isRunning()) || (this.mRecoverySpring != null && this.mRecoverySpring.isRunning());
    }

    void animateRecovery(final DismissController.OnDismissListener dismissListener) {
        this.mVelocityTracker.computeCurrentVelocity(1000);
        this.mRecoverySpring = createSpringAnimation(this.mTranslationX, 0.0f, this.mVelocityTracker.getXVelocity(), new DynamicAnimation.OnAnimationUpdateListener() { // from class: androidx.wear.widget.SwipeDismissTransitionHelper$$ExternalSyntheticLambda0
            @Override // androidx.dynamicanimation.animation.DynamicAnimation.OnAnimationUpdateListener
            public final void onAnimationUpdate(DynamicAnimation dynamicAnimation, float f, float f2) {
                this.f$0.m300x82aa9ab3(dynamicAnimation, f, f2);
            }
        }, new DynamicAnimation.OnAnimationEndListener() { // from class: androidx.wear.widget.SwipeDismissTransitionHelper$$ExternalSyntheticLambda1
            @Override // androidx.dynamicanimation.animation.DynamicAnimation.OnAnimationEndListener
            public final void onAnimationEnd(DynamicAnimation dynamicAnimation, boolean z, float f, float f2) {
                this.f$0.m301xc635b874(dismissListener, dynamicAnimation, z, f, f2);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$animateRecovery$0$androidx-wear-widget-SwipeDismissTransitionHelper, reason: not valid java name */
    /* synthetic */ void m300x82aa9ab3(DynamicAnimation animation, float value, float velocity) {
        float distanceRemaining = Math.max(0.0f, value - 0.0f);
        if (distanceRemaining <= 5.0f && this.mRecoverySpring != null) {
            this.mRecoverySpring.skipToEnd();
        }
        onDismissalRecoveryAnimationProgressChanged(value);
    }

    /* JADX INFO: renamed from: lambda$animateRecovery$1$androidx-wear-widget-SwipeDismissTransitionHelper, reason: not valid java name */
    /* synthetic */ void m301xc635b874(DismissController.OnDismissListener dismissListener, DynamicAnimation animation, boolean canceled, float value, float velocity) {
        resetTranslationAndAlpha();
        if (dismissListener != null) {
            dismissListener.onDismissCanceled();
        }
    }

    void animateDismissal(final DismissController.OnDismissListener dismissListener) {
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.computeCurrentVelocity(1000);
        if (dismissListener != null) {
            dismissListener.onDismissStarted();
        }
        this.mDismissalSpring = createSpringAnimation(this.mTranslationX, this.mScreenWidth, this.mVelocityTracker.getXVelocity(), new DynamicAnimation.OnAnimationUpdateListener() { // from class: androidx.wear.widget.SwipeDismissTransitionHelper$$ExternalSyntheticLambda2
            @Override // androidx.dynamicanimation.animation.DynamicAnimation.OnAnimationUpdateListener
            public final void onAnimationUpdate(DynamicAnimation dynamicAnimation, float f, float f2) {
                this.f$0.m298x779fc50d(dynamicAnimation, f, f2);
            }
        }, new DynamicAnimation.OnAnimationEndListener() { // from class: androidx.wear.widget.SwipeDismissTransitionHelper$$ExternalSyntheticLambda3
            @Override // androidx.dynamicanimation.animation.DynamicAnimation.OnAnimationEndListener
            public final void onAnimationEnd(DynamicAnimation dynamicAnimation, boolean z, float f, float f2) {
                this.f$0.m299xbb2ae2ce(dismissListener, dynamicAnimation, z, f, f2);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$animateDismissal$2$androidx-wear-widget-SwipeDismissTransitionHelper, reason: not valid java name */
    /* synthetic */ void m298x779fc50d(DynamicAnimation animation, float value, float velocity) {
        float distanceRemaining = Math.max(0.0f, this.mScreenWidth - value);
        if (distanceRemaining <= 5.0f && this.mDismissalSpring != null) {
            this.mDismissalSpring.skipToEnd();
        }
        onDismissalRecoveryAnimationProgressChanged(value);
    }

    /* JADX INFO: renamed from: lambda$animateDismissal$3$androidx-wear-widget-SwipeDismissTransitionHelper, reason: not valid java name */
    /* synthetic */ void m299xbb2ae2ce(DismissController.OnDismissListener dismissListener, DynamicAnimation animation, boolean canceled, float value, float velocity) {
        resetTranslationAndAlpha();
        if (dismissListener != null) {
            dismissListener.onDismissed();
        }
    }

    private ViewGroup getOriginalParentView() {
        if (this.mLayout.getParent() instanceof ViewGroup) {
            return (ViewGroup) this.mLayout.getParent();
        }
        return null;
    }

    VelocityTracker getVelocityTracker() {
        return this.mVelocityTracker;
    }

    void obtainVelocityTracker() {
        this.mVelocityTracker = VelocityTracker.obtain();
    }

    void resetVelocityTracker() {
        this.mVelocityTracker = null;
    }
}
