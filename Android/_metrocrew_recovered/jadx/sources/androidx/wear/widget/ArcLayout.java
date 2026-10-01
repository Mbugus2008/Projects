package androidx.wear.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import androidx.constraintlayout.core.widgets.analyzer.BasicMeasure;
import androidx.wear.R;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* JADX INFO: loaded from: classes.dex */
public class ArcLayout extends ViewGroup {
    public static final int ANCHOR_CENTER = 1;
    public static final int ANCHOR_END = 2;
    public static final int ANCHOR_START = 0;
    private static final int DEFAULT_ANCHOR_TYPE = 0;
    private static final boolean DEFAULT_LAYOUT_DIRECTION_IS_CLOCKWISE = true;
    private static final float DEFAULT_START_ANGLE_DEGREES = 0.0f;
    private float mAnchorAngleDegrees;
    private int mAnchorType;
    private final ChildArcAngles mChildArcAngles;
    private boolean mClockwise;
    private float mMaxAngleDegrees;
    private int mThicknessPx;
    private View mTouchedView;

    @Retention(RetentionPolicy.SOURCE)
    public @interface AnchorType {
    }

    public interface Widget {
        void checkInvalidAttributeAsChild();

        float getSweepAngleDegrees();

        int getThickness();

        boolean isPointInsideClickArea(float f, float f2);

        default void setSweepAngleDegrees(float sweepAngleDegrees) {
        }
    }

    public static class LayoutParams extends ViewGroup.MarginLayoutParams {
        public static final int VERTICAL_ALIGN_CENTER = 1;
        public static final int VERTICAL_ALIGN_INNER = 2;
        public static final int VERTICAL_ALIGN_OUTER = 0;
        float mCenterX;
        float mCenterY;
        float mMiddleAngle;
        private boolean mRotated;
        private int mVerticalAlignment;
        float mWeight;

        @Retention(RetentionPolicy.SOURCE)
        public @interface VerticalAlignment {
        }

        public LayoutParams(Context context, AttributeSet attrs) {
            super(context, attrs);
            this.mRotated = true;
            this.mVerticalAlignment = 1;
            TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.ArcLayout_Layout);
            this.mRotated = a.getBoolean(R.styleable.ArcLayout_Layout_layout_rotate, true);
            this.mVerticalAlignment = a.getInt(R.styleable.ArcLayout_Layout_layout_valign, 1);
            this.mWeight = a.getFloat(R.styleable.ArcLayout_Layout_layout_weight, 0.0f);
            a.recycle();
        }

        public LayoutParams(int width, int height) {
            super(width, height);
            this.mRotated = true;
            this.mVerticalAlignment = 1;
        }

        public LayoutParams(ViewGroup.LayoutParams source) {
            super(source);
            this.mRotated = true;
            this.mVerticalAlignment = 1;
        }

        public boolean isRotated() {
            return this.mRotated;
        }

        public void setRotated(boolean rotated) {
            this.mRotated = rotated;
        }

        public int getVerticalAlignment() {
            return this.mVerticalAlignment;
        }

        public void setVerticalAlignment(int verticalAlignment) {
            this.mVerticalAlignment = verticalAlignment;
        }

        public float getWeight() {
            return this.mWeight;
        }

        public void setWeight(float weight) {
            this.mWeight = weight;
        }
    }

    public ArcLayout(Context context) {
        this(context, null);
    }

    public ArcLayout(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public ArcLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        this(context, attrs, defStyleAttr, 0);
    }

    public ArcLayout(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mThicknessPx = 0;
        this.mMaxAngleDegrees = 360.0f;
        this.mChildArcAngles = new ChildArcAngles();
        this.mTouchedView = null;
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.ArcLayout, defStyleAttr, defStyleRes);
        this.mAnchorType = a.getInt(R.styleable.ArcLayout_anchorPosition, 0);
        this.mAnchorAngleDegrees = a.getFloat(R.styleable.ArcLayout_anchorAngleDegrees, 0.0f);
        this.mClockwise = a.getBoolean(R.styleable.ArcLayout_clockwise, true);
        a.recycle();
    }

    @Override // android.view.View, android.view.ViewParent
    public void requestLayout() {
        super.requestLayout();
        for (int i = 0; i < getChildCount(); i++) {
            getChildAt(i).forceLayout();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int childMeasuredHeight;
        int actualWidthPx = View.MeasureSpec.getSize(widthMeasureSpec);
        int actualHeightPx = View.MeasureSpec.getSize(heightMeasureSpec);
        if (View.MeasureSpec.getMode(widthMeasureSpec) == 0 && View.MeasureSpec.getMode(heightMeasureSpec) == 0) {
            DisplayMetrics displayMetrics = getContext().getResources().getDisplayMetrics();
            actualWidthPx = displayMetrics.widthPixels;
            actualHeightPx = displayMetrics.heightPixels;
        }
        if (actualWidthPx < actualHeightPx) {
            actualHeightPx = actualWidthPx;
        } else if (actualHeightPx < actualWidthPx) {
            actualWidthPx = actualHeightPx;
        }
        int maxChildDimension = actualHeightPx / 2;
        int childMeasureSpec = View.MeasureSpec.makeMeasureSpec(maxChildDimension, Integer.MIN_VALUE);
        int maxChildHeightPx = 0;
        int childState = 0;
        for (int i = 0; i < getChildCount(); i++) {
            View childAt = getChildAt(i);
            if (childAt.getVisibility() != 8) {
                if (childAt instanceof Widget) {
                    childMeasuredHeight = ((Widget) childAt).getThickness();
                } else {
                    measureChild(childAt, getChildMeasureSpec(childMeasureSpec, 0, childAt.getLayoutParams().width), getChildMeasureSpec(childMeasureSpec, 0, childAt.getLayoutParams().height));
                    childMeasuredHeight = childAt.getMeasuredHeight();
                    childState = combineMeasuredStates(childState, childAt.getMeasuredState());
                }
                LayoutParams childLayoutParams = (LayoutParams) childAt.getLayoutParams();
                maxChildHeightPx = Math.max(maxChildHeightPx, childLayoutParams.topMargin + childMeasuredHeight + childLayoutParams.bottomMargin);
            }
        }
        this.mThicknessPx = maxChildHeightPx;
        for (int i2 = 0; i2 < getChildCount(); i2++) {
            View child = getChildAt(i2);
            if (child.getVisibility() != 8 && (child instanceof Widget)) {
                LayoutParams childLayoutParams2 = (LayoutParams) child.getLayoutParams();
                float insetPx = getChildTopInset(child);
                int innerChildMeasureSpec = View.MeasureSpec.makeMeasureSpec((maxChildDimension * 2) - Math.round(2.0f * insetPx), BasicMeasure.EXACTLY);
                measureChild(child, getChildMeasureSpec(innerChildMeasureSpec, 0, childLayoutParams2.width), getChildMeasureSpec(innerChildMeasureSpec, 0, childLayoutParams2.height));
                childState = combineMeasuredStates(childState, child.getMeasuredState());
            }
        }
        setMeasuredDimension(resolveSizeAndState(actualWidthPx, widthMeasureSpec, childState), resolveSizeAndState(actualHeightPx, heightMeasureSpec, childState));
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        int i;
        float f;
        float multiplier;
        boolean isLayoutRtl;
        boolean isLayoutRtl2 = getLayoutDirection() == 1;
        float multiplier2 = this.mClockwise != isLayoutRtl2 ? 1.0f : -1.0f;
        float currentCumulativeAngle = calculateInitialRotation(multiplier2);
        float totalAngle = 0.0f;
        float weightSum = 0.0f;
        int i2 = 0;
        while (true) {
            i = 8;
            f = 0.0f;
            if (i2 >= getChildCount()) {
                break;
            }
            View child = getChildAt(i2);
            if (child.getVisibility() != 8) {
                LayoutParams childLayoutParams = (LayoutParams) child.getLayoutParams();
                if (childLayoutParams.mWeight <= 0.0f) {
                    calculateArcAngle(child, this.mChildArcAngles);
                    totalAngle += this.mChildArcAngles.getTotalAngle();
                } else {
                    weightSum += childLayoutParams.mWeight;
                    calculateArcAngle(child, this.mChildArcAngles);
                    totalAngle += this.mChildArcAngles.leftMarginAsAngle + this.mChildArcAngles.rightMarginAsAngle;
                }
            }
            i2++;
        }
        float weightMultiplier = 0.0f;
        if (weightSum > 0.0f) {
            weightMultiplier = (this.mMaxAngleDegrees - totalAngle) / weightSum;
        }
        int i3 = 0;
        while (i3 < getChildCount()) {
            View childAt = getChildAt(i3);
            if (childAt.getVisibility() != i) {
                calculateArcAngle(childAt, this.mChildArcAngles);
                LayoutParams childLayoutParams2 = (LayoutParams) childAt.getLayoutParams();
                if (childLayoutParams2.mWeight > f) {
                    this.mChildArcAngles.actualChildAngle = childLayoutParams2.mWeight * weightMultiplier;
                    if (childAt instanceof Widget) {
                        ((Widget) childAt).setSweepAngleDegrees(this.mChildArcAngles.actualChildAngle);
                    } else {
                        throw new IllegalStateException("ArcLayout.LayoutParams with non zero weights are only supported for views implementing ArcLayout.Widget");
                    }
                }
                float preRotation = this.mChildArcAngles.leftMarginAsAngle + (this.mChildArcAngles.actualChildAngle / 2.0f);
                float middleAngle = (currentCumulativeAngle + preRotation) * multiplier2;
                childLayoutParams2.mMiddleAngle = middleAngle;
                float centerToCenterDistance = ((getMeasuredHeight() - childAt.getMeasuredHeight()) / 2) - getChildTopInset(childAt);
                multiplier = multiplier2;
                isLayoutRtl = isLayoutRtl2;
                childLayoutParams2.mCenterX = (float) (((double) (getMeasuredWidth() / 2.0f)) + (((double) centerToCenterDistance) * Math.sin((((double) middleAngle) * 3.141592653589793d) / 180.0d)));
                childLayoutParams2.mCenterY = (float) (((double) (getMeasuredHeight() / 2.0f)) - (((double) centerToCenterDistance) * Math.cos((((double) middleAngle) * 3.141592653589793d) / 180.0d)));
                currentCumulativeAngle += this.mChildArcAngles.getTotalAngle();
                if (childAt instanceof Widget) {
                    int leftPx = Math.round((getMeasuredWidth() / 2.0f) - (childAt.getMeasuredWidth() / 2.0f));
                    int topPx = Math.round((getMeasuredHeight() / 2.0f) - (childAt.getMeasuredHeight() / 2.0f));
                    childAt.layout(leftPx, topPx, childAt.getMeasuredWidth() + leftPx, childAt.getMeasuredHeight() + topPx);
                } else {
                    int leftPx2 = Math.round(childLayoutParams2.mCenterX - (childAt.getMeasuredWidth() / 2.0f));
                    int topPx2 = Math.round(childLayoutParams2.mCenterY - (childAt.getMeasuredHeight() / 2.0f));
                    childAt.layout(leftPx2, topPx2, childAt.getMeasuredWidth() + leftPx2, childAt.getMeasuredHeight() + topPx2);
                }
            } else {
                multiplier = multiplier2;
                isLayoutRtl = isLayoutRtl2;
            }
            i3++;
            isLayoutRtl2 = isLayoutRtl;
            multiplier2 = multiplier;
            i = 8;
            f = 0.0f;
        }
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent event) {
        if (this.mTouchedView == null && event.getActionMasked() == 0) {
            for (int i = 0; i < getChildCount(); i++) {
                View child = getChildAt(i);
                if (child.getVisibility() == 0) {
                    LayoutParams childLayoutParams = (LayoutParams) child.getLayoutParams();
                    float angle = childLayoutParams.mMiddleAngle;
                    float[] point = {event.getX(), event.getY()};
                    mapPoint(child, angle, point);
                    float x = point[0];
                    float y = point[1];
                    if (insideChildClickArea(child, x, y)) {
                        this.mTouchedView = child;
                        break;
                    }
                }
            }
        }
        return true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static boolean insideChildClickArea(View view, float x, float y) {
        if (view instanceof Widget) {
            return ((Widget) view).isPointInsideClickArea(x, y);
        }
        return x >= 0.0f && x < ((float) view.getMeasuredWidth()) && y >= 0.0f && y < ((float) view.getMeasuredHeight());
    }

    private void mapPoint(View child, float angle, float[] point) {
        Matrix m = new Matrix();
        LayoutParams childLayoutParams = (LayoutParams) child.getLayoutParams();
        if (child instanceof Widget) {
            m.postRotate(-angle, getMeasuredWidth() / 2, getMeasuredHeight() / 2);
            m.postTranslate(-child.getX(), -child.getY());
        } else {
            m.postTranslate(-childLayoutParams.mCenterX, -childLayoutParams.mCenterY);
            if (childLayoutParams.isRotated()) {
                m.postRotate(-angle);
            }
            m.postTranslate(child.getWidth() / 2, child.getHeight() / 2);
        }
        m.mapPoints(point);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        if (this.mTouchedView == null) {
            return false;
        }
        float[] point = {event.getX(), event.getY()};
        LayoutParams touchedViewLayoutParams = (LayoutParams) this.mTouchedView.getLayoutParams();
        mapPoint(this.mTouchedView, touchedViewLayoutParams.mMiddleAngle, point);
        float dx = point[0] - event.getX();
        float dy = point[1] - event.getY();
        event.offsetLocation(dx, dy);
        this.mTouchedView.dispatchTouchEvent(event);
        if (event.getActionMasked() == 1 || event.getActionMasked() == 3) {
            this.mTouchedView = null;
        }
        return true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.view.ViewGroup
    protected boolean drawChild(Canvas canvas, View view, long drawingTime) {
        canvas.save();
        LayoutParams childLayoutParams = (LayoutParams) view.getLayoutParams();
        float middleAngle = childLayoutParams.mMiddleAngle;
        if (view instanceof Widget) {
            canvas.rotate(middleAngle, getMeasuredWidth() / 2.0f, getMeasuredHeight() / 2.0f);
            ((Widget) view).checkInvalidAttributeAsChild();
        } else {
            float angleToRotate = 0.0f;
            if (childLayoutParams.isRotated()) {
                angleToRotate = this.mClockwise ? 0.0f : 180.0f;
                angleToRotate += middleAngle;
            }
            canvas.rotate(angleToRotate, childLayoutParams.mCenterX, childLayoutParams.mCenterY);
        }
        boolean wasInvalidateIssued = super.drawChild(canvas, view, drawingTime);
        canvas.restore();
        return wasInvalidateIssued;
    }

    private float calculateInitialRotation(float multiplier) {
        if (this.mAnchorType == 0) {
            return this.mAnchorAngleDegrees * multiplier;
        }
        float totalArcAngle = 0.0f;
        boolean hasWeights = false;
        for (int i = 0; i < getChildCount(); i++) {
            View child = getChildAt(i);
            LayoutParams childLayoutParams = (LayoutParams) child.getLayoutParams();
            if (childLayoutParams.getWeight() > 0.0f) {
                hasWeights = true;
            }
            calculateArcAngle(child, this.mChildArcAngles);
            totalArcAngle += this.mChildArcAngles.getTotalAngle();
        }
        if (hasWeights && totalArcAngle < this.mMaxAngleDegrees) {
            totalArcAngle = this.mMaxAngleDegrees;
        }
        if (this.mAnchorType == 1) {
            return (this.mAnchorAngleDegrees * multiplier) - (totalArcAngle / 2.0f);
        }
        if (this.mAnchorType == 2) {
            return (this.mAnchorAngleDegrees * multiplier) - totalArcAngle;
        }
        return 0.0f;
    }

    private static float widthToAngleDegrees(float widthPx, float radiusPx) {
        return (float) Math.toDegrees(Math.asin((widthPx / radiusPx) / 2.0f) * 2.0d);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private void calculateArcAngle(View view, ChildArcAngles childAngles) {
        if (view.getVisibility() == 8) {
            childAngles.leftMarginAsAngle = 0.0f;
            childAngles.rightMarginAsAngle = 0.0f;
            childAngles.actualChildAngle = 0.0f;
            return;
        }
        float radiusPx = (getMeasuredWidth() / 2.0f) - this.mThicknessPx;
        LayoutParams childLayoutParams = (LayoutParams) view.getLayoutParams();
        childAngles.leftMarginAsAngle = widthToAngleDegrees(childLayoutParams.leftMargin, radiusPx);
        childAngles.rightMarginAsAngle = widthToAngleDegrees(childLayoutParams.rightMargin, radiusPx);
        if (view instanceof Widget) {
            childAngles.actualChildAngle = ((Widget) view).getSweepAngleDegrees();
        } else {
            childAngles.actualChildAngle = widthToAngleDegrees(view.getMeasuredWidth(), radiusPx);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private float getChildTopInset(View view) {
        int childHeight;
        LayoutParams childLayoutParams = (LayoutParams) view.getLayoutParams();
        if (view instanceof Widget) {
            childHeight = ((Widget) view).getThickness();
        } else {
            childHeight = view.getMeasuredHeight();
        }
        int thicknessDiffPx = ((this.mThicknessPx - childLayoutParams.topMargin) - childLayoutParams.bottomMargin) - childHeight;
        int margin = this.mClockwise ? childLayoutParams.topMargin : childLayoutParams.bottomMargin;
        float topInset = margin + getChildTopOffset(view);
        switch (childLayoutParams.getVerticalAlignment()) {
            case 0:
                return topInset;
            case 1:
                return (thicknessDiffPx / 2.0f) + topInset;
            case 2:
                return thicknessDiffPx + topInset;
            default:
                return 0.0f;
        }
    }

    private float getChildTopOffset(View child) {
        if ((child instanceof Widget) || getMeasuredWidth() >= getMeasuredHeight()) {
            return 0.0f;
        }
        return Math.round((getMeasuredHeight() - getMeasuredWidth()) / 2.0f);
    }

    @Override // android.view.ViewGroup
    protected boolean checkLayoutParams(ViewGroup.LayoutParams p) {
        return p instanceof LayoutParams;
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams p) {
        return new LayoutParams(p);
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateLayoutParams(AttributeSet attrs) {
        return new LayoutParams(getContext(), attrs);
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams(-1, -1);
    }

    public int getAnchorType() {
        return this.mAnchorType;
    }

    public void setAnchorType(int anchorType) {
        if (anchorType < 0 || anchorType > 2) {
            throw new IllegalArgumentException("Unknown anchor type");
        }
        this.mAnchorType = anchorType;
        invalidate();
    }

    public float getAnchorAngleDegrees() {
        return this.mAnchorAngleDegrees;
    }

    public void setAnchorAngleDegrees(float anchorAngleDegrees) {
        this.mAnchorAngleDegrees = anchorAngleDegrees;
        invalidate();
    }

    public float getMaxAngleDegrees() {
        return this.mMaxAngleDegrees;
    }

    public void setMaxAngleDegrees(float maxAngleDegrees) {
        this.mMaxAngleDegrees = maxAngleDegrees;
        invalidate();
        requestLayout();
    }

    public boolean isClockwise() {
        return this.mClockwise;
    }

    public void setClockwise(boolean clockwise) {
        this.mClockwise = clockwise;
        invalidate();
    }

    private static class ChildArcAngles {
        public float actualChildAngle;
        public float leftMarginAsAngle;
        public float rightMarginAsAngle;

        private ChildArcAngles() {
        }

        public float getTotalAngle() {
            return this.leftMarginAsAngle + this.rightMarginAsAngle + this.actualChildAngle;
        }
    }
}
