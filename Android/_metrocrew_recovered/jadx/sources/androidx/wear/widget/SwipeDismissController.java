package androidx.wear.widget;

import android.content.Context;
import android.content.res.Resources;
import android.util.Log;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;

/* JADX INFO: loaded from: classes.dex */
class SwipeDismissController extends DismissController {
    public static final float DEFAULT_DISMISS_DRAG_WIDTH_RATIO = 0.33f;
    private static final float EDGE_SWIPE_THRESHOLD = 0.1f;
    private static final String TAG = "SwipeDismissController";
    private static final int VELOCITY_UNIT = 1000;
    private int mActiveTouchId;
    private boolean mBlockGesture;
    private boolean mDiscardIntercept;
    private float mDismissMinDragWidthRatio;
    private boolean mDismissed;
    private float mDownX;
    private float mDownY;
    private final float mGestureThresholdPx;
    private float mLastX;
    private final int mMinFlingVelocity;
    private final int mSlop;
    private final SwipeDismissTransitionHelper mSwipeDismissTransitionHelper;
    private boolean mSwiping;

    SwipeDismissController(Context context, DismissibleFrameLayout layout) {
        super(context, layout);
        this.mDismissMinDragWidthRatio = 0.33f;
        this.mBlockGesture = false;
        ViewConfiguration vc = ViewConfiguration.get(context);
        this.mSlop = vc.getScaledTouchSlop();
        this.mMinFlingVelocity = vc.getScaledMinimumFlingVelocity();
        this.mGestureThresholdPx = Resources.getSystem().getDisplayMetrics().widthPixels * 0.1f;
        this.mSwipeDismissTransitionHelper = new SwipeDismissTransitionHelper(context, layout);
    }

    public void requestDisallowInterceptTouchEvent(boolean disallowIntercept) {
        if (this.mLayout.getParent() != null) {
            this.mLayout.getParent().requestDisallowInterceptTouchEvent(disallowIntercept);
        }
    }

    void setDismissMinDragWidthRatio(float ratio) {
        this.mDismissMinDragWidthRatio = ratio;
    }

    float getDismissMinDragWidthRatio() {
        return this.mDismissMinDragWidthRatio;
    }

    boolean onInterceptTouchEvent(MotionEvent ev) {
        SwipeDismissController swipeDismissController;
        checkGesture(ev);
        if (this.mBlockGesture) {
            return true;
        }
        float offsetX = ev.getRawX() - ev.getX();
        ev.offsetLocation(offsetX, 0.0f);
        switch (ev.getActionMasked()) {
            case 0:
                swipeDismissController = this;
                resetSwipeDetectMembers();
                swipeDismissController.mDownX = ev.getRawX();
                swipeDismissController.mDownY = ev.getRawY();
                swipeDismissController.mActiveTouchId = ev.getPointerId(0);
                swipeDismissController.mSwipeDismissTransitionHelper.obtainVelocityTracker();
                swipeDismissController.mSwipeDismissTransitionHelper.getVelocityTracker().addMovement(ev);
                break;
            case 1:
            case 3:
                swipeDismissController = this;
                resetSwipeDetectMembers();
                break;
            case 2:
                if (this.mSwipeDismissTransitionHelper.getVelocityTracker() == null || this.mDiscardIntercept) {
                    swipeDismissController = this;
                } else {
                    int pointerIndex = ev.findPointerIndex(this.mActiveTouchId);
                    if (pointerIndex == -1) {
                        Log.e(TAG, "Invalid pointer index: ignoring.");
                        this.mDiscardIntercept = true;
                        swipeDismissController = this;
                    } else {
                        float dx = ev.getRawX() - this.mDownX;
                        float x = ev.getX(pointerIndex);
                        float y = ev.getY(pointerIndex);
                        if (dx != 0.0f && this.mDownX >= this.mGestureThresholdPx) {
                            swipeDismissController = this;
                            if (swipeDismissController.canScroll(this.mLayout, false, dx, x, y)) {
                                swipeDismissController.mDiscardIntercept = true;
                            }
                        } else {
                            swipeDismissController = this;
                        }
                        updateSwiping(ev);
                    }
                }
                break;
            case 4:
            default:
                swipeDismissController = this;
                break;
            case 5:
                this.mActiveTouchId = ev.getPointerId(ev.getActionIndex());
                swipeDismissController = this;
                break;
            case 6:
                int actionIndex = ev.getActionIndex();
                int pointerId = ev.getPointerId(actionIndex);
                if (pointerId != this.mActiveTouchId) {
                    swipeDismissController = this;
                } else {
                    int newActionIndex = actionIndex == 0 ? 1 : 0;
                    this.mActiveTouchId = ev.getPointerId(newActionIndex);
                    swipeDismissController = this;
                }
                break;
        }
        ev.offsetLocation(-offsetX, -0.0f);
        return !swipeDismissController.mDiscardIntercept && swipeDismissController.mSwiping;
    }

    public boolean canScrollHorizontally(int direction) {
        return direction < 0 && this.mLayout.getVisibility() == 0;
    }

    private boolean isPotentialSwipe(float dx, float dy) {
        return (dx * dx) + (dy * dy) > ((float) (this.mSlop * this.mSlop));
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code duplicated, block: B:18:0x0052  */
    /* JADX WARN: Code duplicated, block: B:19:0x005a  */
    public boolean onTouchEvent(MotionEvent ev) {
        checkGesture(ev);
        if (this.mBlockGesture) {
            return true;
        }
        if (this.mSwipeDismissTransitionHelper.getVelocityTracker() == null) {
            return false;
        }
        float offsetX = ev.getRawX() - ev.getX();
        ev.offsetLocation(offsetX, 0.0f);
        switch (ev.getActionMasked()) {
            case 1:
                updateDismiss(ev);
                if (this.mDismissed) {
                    this.mSwipeDismissTransitionHelper.animateDismissal(this.mDismissListener);
                } else if (this.mSwiping && this.mLastX != -2.1474836E9f) {
                    this.mSwipeDismissTransitionHelper.animateRecovery(this.mDismissListener);
                }
                resetSwipeDetectMembers();
                break;
            case 2:
                this.mSwipeDismissTransitionHelper.getVelocityTracker().addMovement(ev);
                this.mLastX = ev.getRawX();
                updateSwiping(ev);
                if (this.mSwiping) {
                    this.mSwipeDismissTransitionHelper.onSwipeProgressChanged(ev.getRawX() - this.mDownX, ev);
                }
                break;
            case 3:
                if (this.mDismissed) {
                    this.mSwipeDismissTransitionHelper.animateDismissal(this.mDismissListener);
                } else if (this.mSwiping) {
                    this.mSwipeDismissTransitionHelper.animateRecovery(this.mDismissListener);
                }
                resetSwipeDetectMembers();
                break;
        }
        ev.offsetLocation(-offsetX, -0.0f);
        return true;
    }

    private void resetSwipeDetectMembers() {
        if (this.mSwipeDismissTransitionHelper.getVelocityTracker() != null) {
            this.mSwipeDismissTransitionHelper.getVelocityTracker().recycle();
        }
        this.mSwipeDismissTransitionHelper.resetVelocityTracker();
        this.mDownX = 0.0f;
        this.mDownY = 0.0f;
        this.mSwiping = false;
        this.mLastX = -2.1474836E9f;
        this.mDismissed = false;
        this.mDiscardIntercept = false;
    }

    private void updateSwiping(MotionEvent ev) {
        if (!this.mSwiping) {
            float deltaX = ev.getRawX() - this.mDownX;
            float deltaY = ev.getRawY() - this.mDownY;
            boolean z = false;
            if (!isPotentialSwipe(deltaX, deltaY)) {
                this.mSwiping = false;
                return;
            }
            if (deltaX > this.mSlop * 2 && Math.abs(deltaY) < Math.abs(deltaX)) {
                z = true;
            }
            this.mSwiping = z;
        }
    }

    private void updateDismiss(MotionEvent ev) {
        float deltaX = ev.getRawX() - this.mDownX;
        VelocityTracker velocityTracker = this.mSwipeDismissTransitionHelper.getVelocityTracker();
        velocityTracker.computeCurrentVelocity(1000);
        float xVelocity = velocityTracker.getXVelocity();
        float yVelocity = velocityTracker.getYVelocity();
        if (this.mLastX == -2.1474836E9f) {
            xVelocity = deltaX / ((ev.getEventTime() - ev.getDownTime()) / 1000.0f);
        }
        if (!this.mDismissed && ((deltaX > this.mLayout.getWidth() * this.mDismissMinDragWidthRatio && ev.getRawX() >= this.mLastX) || (xVelocity >= this.mMinFlingVelocity && xVelocity > Math.abs(yVelocity)))) {
            this.mDismissed = true;
        }
        if (this.mDismissed && this.mSwiping && xVelocity < (-this.mMinFlingVelocity)) {
            this.mDismissed = false;
        }
    }

    protected boolean canScroll(View v, boolean checkV, float dx, float x, float y) {
        if (v instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) v;
            int scrollX = v.getScrollX();
            int scrollY = v.getScrollY();
            int count = group.getChildCount();
            for (int i = count - 1; i >= 0; i--) {
                View child = group.getChildAt(i);
                if (x + scrollX >= child.getLeft() && x + scrollX < child.getRight() && y + scrollY >= child.getTop() && y + scrollY < child.getBottom() && canScroll(child, true, dx, (x + scrollX) - child.getLeft(), (y + scrollY) - child.getTop())) {
                    return true;
                }
            }
        }
        return checkV && v.canScrollHorizontally((int) (-dx));
    }

    private void checkGesture(MotionEvent ev) {
        if (ev.getActionMasked() == 0) {
            this.mBlockGesture = this.mSwipeDismissTransitionHelper.isAnimating();
        }
    }
}
