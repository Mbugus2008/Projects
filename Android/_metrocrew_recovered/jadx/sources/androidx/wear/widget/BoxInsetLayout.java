package androidx.wear.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.widget.FrameLayout;
import androidx.wear.R;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* JADX INFO: loaded from: classes.dex */
public class BoxInsetLayout extends ViewGroup {
    private static final int DEFAULT_CHILD_GRAVITY = 8388659;
    private static final float FACTOR = 0.146447f;
    private Drawable mForegroundDrawable;
    private Rect mForegroundPadding;
    private Rect mInsets;
    private boolean mIsRound;
    private final int mScreenHeight;
    private final int mScreenWidth;

    public BoxInsetLayout(Context context) {
        this(context, null);
    }

    public BoxInsetLayout(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public BoxInsetLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        if (this.mForegroundPadding == null) {
            this.mForegroundPadding = new Rect();
        }
        if (this.mInsets == null) {
            this.mInsets = new Rect();
        }
        this.mScreenHeight = Resources.getSystem().getDisplayMetrics().heightPixels;
        this.mScreenWidth = Resources.getSystem().getDisplayMetrics().widthPixels;
    }

    @Override // android.view.View
    public void setForeground(Drawable drawable) {
        super.setForeground(drawable);
        this.mForegroundDrawable = drawable;
        if (this.mForegroundPadding == null) {
            this.mForegroundPadding = new Rect();
        }
        if (this.mForegroundDrawable != null) {
            drawable.getPadding(this.mForegroundPadding);
        }
    }

    @Override // android.view.ViewGroup
    public LayoutParams generateLayoutParams(AttributeSet attrs) {
        return new LayoutParams(getContext(), attrs);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.mIsRound = getResources().getConfiguration().isScreenRound();
        WindowInsets insets = getRootWindowInsets();
        this.mInsets.set(insets.getSystemWindowInsetLeft(), insets.getSystemWindowInsetTop(), insets.getSystemWindowInsetRight(), insets.getSystemWindowInsetBottom());
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int marginRight;
        int marginTop;
        int marginBottom;
        int marginBottom2;
        int count = getChildCount();
        int maxWidth = 0;
        int maxHeight = 0;
        int childState = 0;
        for (int i = 0; i < count; i++) {
            View child = getChildAt(i);
            if (child.getVisibility() != 8) {
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                int marginLeft = 0;
                int marginRight2 = 0;
                int marginTop2 = 0;
                if (this.mIsRound) {
                    if ((lp.boxedEdges & 1) == 0) {
                        marginLeft = lp.leftMargin;
                    }
                    if ((lp.boxedEdges & 4) == 0) {
                        marginRight2 = lp.rightMargin;
                    }
                    if ((lp.boxedEdges & 2) == 0) {
                        marginTop2 = lp.topMargin;
                    }
                    if ((8 & lp.boxedEdges) != 0) {
                        marginRight = marginRight2;
                        marginTop = marginTop2;
                        marginBottom = 0;
                        marginBottom2 = marginLeft;
                    } else {
                        int marginBottom3 = lp.bottomMargin;
                        marginRight = marginRight2;
                        marginTop = marginTop2;
                        marginBottom = marginBottom3;
                        marginBottom2 = marginLeft;
                    }
                } else {
                    int marginLeft2 = lp.leftMargin;
                    int marginTop3 = lp.topMargin;
                    int marginRight3 = lp.rightMargin;
                    int marginBottom4 = lp.bottomMargin;
                    marginRight = marginRight3;
                    marginTop = marginTop3;
                    marginBottom = marginBottom4;
                    marginBottom2 = marginLeft2;
                }
                measureChildWithMargins(child, widthMeasureSpec, 0, heightMeasureSpec, 0);
                int maxWidth2 = Math.max(maxWidth, child.getMeasuredWidth() + marginBottom2 + marginRight);
                maxHeight = Math.max(maxHeight, child.getMeasuredHeight() + marginTop + marginBottom);
                childState = combineMeasuredStates(childState, child.getMeasuredState());
                maxWidth = maxWidth2;
            }
        }
        int maxWidth3 = maxWidth + getPaddingLeft() + this.mForegroundPadding.left + getPaddingRight() + this.mForegroundPadding.right;
        int maxHeight2 = Math.max(maxHeight + getPaddingTop() + this.mForegroundPadding.top + getPaddingBottom() + this.mForegroundPadding.bottom, getSuggestedMinimumHeight());
        int maxWidth4 = Math.max(maxWidth3, getSuggestedMinimumWidth());
        if (this.mForegroundDrawable != null) {
            maxHeight2 = Math.max(maxHeight2, this.mForegroundDrawable.getMinimumHeight());
            maxWidth4 = Math.max(maxWidth4, this.mForegroundDrawable.getMinimumWidth());
        }
        int measuredWidth = resolveSizeAndState(maxWidth4, widthMeasureSpec, childState);
        int measuredHeight = resolveSizeAndState(maxHeight2, heightMeasureSpec, childState << 16);
        setMeasuredDimension(measuredWidth, measuredHeight);
        int boxInset = calculateInset(measuredWidth, measuredHeight);
        for (int i2 = 0; i2 < count; i2++) {
            measureChild(widthMeasureSpec, heightMeasureSpec, boxInset, i2);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        int parentLeft;
        int parentRight;
        int childLeft;
        int childTop;
        BoxInsetLayout boxInsetLayout = this;
        int count = boxInsetLayout.getChildCount();
        int parentLeft2 = boxInsetLayout.getPaddingLeft() + boxInsetLayout.mForegroundPadding.left;
        int parentRight2 = ((right - left) - boxInsetLayout.getPaddingRight()) - boxInsetLayout.mForegroundPadding.right;
        int parentTop = boxInsetLayout.getPaddingTop() + boxInsetLayout.mForegroundPadding.top;
        int parentBottom = ((bottom - top) - boxInsetLayout.getPaddingBottom()) - boxInsetLayout.mForegroundPadding.bottom;
        int i = 0;
        while (i < count) {
            View child = boxInsetLayout.getChildAt(i);
            if (child.getVisibility() != 8) {
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                int width = child.getMeasuredWidth();
                int height = child.getMeasuredHeight();
                int gravity = lp.gravity;
                if (gravity == -1) {
                    gravity = 8388659;
                }
                int layoutDirection = boxInsetLayout.getLayoutDirection();
                int absoluteGravity = Gravity.getAbsoluteGravity(gravity, layoutDirection);
                int verticalGravity = gravity & 112;
                int horizontalGravity = gravity & 7;
                int count2 = boxInsetLayout.getMeasuredWidth();
                parentLeft = parentLeft2;
                int parentLeft3 = boxInsetLayout.getMeasuredHeight();
                int desiredInset = boxInsetLayout.calculateInset(count2, parentLeft3);
                int leftChildMargin = boxInsetLayout.calculateChildLeftMargin(lp, horizontalGravity, desiredInset);
                int rightChildMargin = boxInsetLayout.calculateChildRightMargin(lp, horizontalGravity, desiredInset);
                parentRight = parentRight2;
                if (lp.width == -1) {
                    childLeft = parentLeft + leftChildMargin;
                } else {
                    int childLeft2 = absoluteGravity & 7;
                    switch (childLeft2) {
                        case 1:
                            childLeft = ((parentLeft + (((parentRight - parentLeft) - width) / 2)) + leftChildMargin) - rightChildMargin;
                            break;
                        case 5:
                            childLeft = (parentRight - width) - rightChildMargin;
                            break;
                        default:
                            childLeft = parentLeft + leftChildMargin;
                            break;
                    }
                }
                int topChildMargin = boxInsetLayout.calculateChildTopMargin(lp, verticalGravity, desiredInset);
                int bottomChildMargin = boxInsetLayout.calculateChildBottomMargin(lp, verticalGravity, desiredInset);
                if (lp.height == -1) {
                    childTop = parentTop + topChildMargin;
                } else {
                    switch (verticalGravity) {
                        case 16:
                            int childTop2 = parentBottom - parentTop;
                            childTop = ((((childTop2 - height) / 2) + parentTop) + topChildMargin) - bottomChildMargin;
                            break;
                        case 80:
                            int childTop3 = parentBottom - height;
                            childTop = childTop3 - bottomChildMargin;
                            break;
                        default:
                            childTop = parentTop + topChildMargin;
                            break;
                    }
                }
                child.layout(childLeft, childTop, childLeft + width, childTop + height);
            } else {
                parentLeft = parentLeft2;
                parentRight = parentRight2;
            }
            i++;
            boxInsetLayout = this;
            count = count;
            parentLeft2 = parentLeft;
            parentRight2 = parentRight;
        }
    }

    @Override // android.view.ViewGroup
    protected boolean checkLayoutParams(ViewGroup.LayoutParams p) {
        return p instanceof LayoutParams;
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams p) {
        return new LayoutParams(p);
    }

    private void measureChild(int widthMeasureSpec, int heightMeasureSpec, int desiredMinInset, int i) {
        View child = getChildAt(i);
        LayoutParams childLayoutParams = (LayoutParams) child.getLayoutParams();
        int gravity = childLayoutParams.gravity;
        if (gravity == -1) {
            gravity = 8388659;
        }
        int verticalGravity = gravity & 112;
        int horizontalGravity = gravity & 7;
        int leftParentPadding = getPaddingLeft() + this.mForegroundPadding.left;
        int rightParentPadding = getPaddingRight() + this.mForegroundPadding.right;
        int topParentPadding = getPaddingTop() + this.mForegroundPadding.top;
        int bottomParentPadding = getPaddingBottom() + this.mForegroundPadding.bottom;
        int totalWidthMargin = leftParentPadding + rightParentPadding + calculateChildLeftMargin(childLayoutParams, horizontalGravity, desiredMinInset) + calculateChildRightMargin(childLayoutParams, horizontalGravity, desiredMinInset);
        int totalHeightMargin = topParentPadding + bottomParentPadding + calculateChildTopMargin(childLayoutParams, verticalGravity, desiredMinInset) + calculateChildBottomMargin(childLayoutParams, verticalGravity, desiredMinInset);
        int childWidthMeasureSpec = getChildMeasureSpec(widthMeasureSpec, totalWidthMargin, childLayoutParams.width);
        int childHeightMeasureSpec = getChildMeasureSpec(heightMeasureSpec, totalHeightMargin, childLayoutParams.height);
        int maxAllowedWidth = getMeasuredWidth() - totalWidthMargin;
        int maxAllowedHeight = getMeasuredHeight() - totalHeightMargin;
        if (child.getMeasuredWidth() > maxAllowedWidth || child.getMeasuredHeight() > maxAllowedHeight) {
            child.measure(childWidthMeasureSpec, childHeightMeasureSpec);
        }
    }

    private int calculateChildLeftMargin(LayoutParams lp, int horizontalGravity, int desiredMinInset) {
        if (this.mIsRound && (lp.boxedEdges & 1) != 0 && (lp.width == -1 || horizontalGravity == 3)) {
            return lp.leftMargin + desiredMinInset;
        }
        return lp.leftMargin;
    }

    private int calculateChildRightMargin(LayoutParams lp, int horizontalGravity, int desiredMinInset) {
        if (this.mIsRound && (lp.boxedEdges & 4) != 0 && (lp.width == -1 || horizontalGravity == 5)) {
            return lp.rightMargin + desiredMinInset;
        }
        return lp.rightMargin;
    }

    private int calculateChildTopMargin(LayoutParams lp, int verticalGravity, int desiredMinInset) {
        if (this.mIsRound && (lp.boxedEdges & 2) != 0 && (lp.height == -1 || verticalGravity == 48)) {
            return lp.topMargin + desiredMinInset;
        }
        return lp.topMargin;
    }

    private int calculateChildBottomMargin(LayoutParams lp, int verticalGravity, int desiredMinInset) {
        if (this.mIsRound && (lp.boxedEdges & 8) != 0 && (lp.height == -1 || verticalGravity == 80)) {
            return lp.bottomMargin + desiredMinInset;
        }
        return lp.bottomMargin;
    }

    private int calculateInset(int measuredWidth, int measuredHeight) {
        int rightEdge = Math.min(measuredWidth, this.mScreenWidth);
        int bottomEdge = Math.min(measuredHeight, this.mScreenHeight);
        return (int) (Math.max(rightEdge, bottomEdge) * FACTOR);
    }

    public static class LayoutParams extends FrameLayout.LayoutParams {
        public static final int BOX_ALL = 15;
        public static final int BOX_BOTTOM = 8;
        public static final int BOX_LEFT = 1;
        public static final int BOX_NONE = 0;
        public static final int BOX_RIGHT = 4;
        public static final int BOX_TOP = 2;
        public int boxedEdges;

        @Retention(RetentionPolicy.SOURCE)
        public @interface BoxedEdges {
        }

        public LayoutParams(Context context, AttributeSet attrs) {
            super(context, attrs);
            this.boxedEdges = 0;
            TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.BoxInsetLayout_Layout, 0, 0);
            int boxedEdgesResourceKey = R.styleable.BoxInsetLayout_Layout_layout_boxedEdges;
            this.boxedEdges = a.getInt(a.hasValueOrEmpty(R.styleable.BoxInsetLayout_Layout_layout_boxedEdges) ? boxedEdgesResourceKey : R.styleable.BoxInsetLayout_Layout_boxedEdges, 0);
            a.recycle();
        }

        public LayoutParams(int width, int height) {
            super(width, height);
            this.boxedEdges = 0;
        }

        public LayoutParams(int width, int height, int gravity) {
            super(width, height, gravity);
            this.boxedEdges = 0;
        }

        public LayoutParams(int width, int height, int gravity, int boxed) {
            super(width, height, gravity);
            this.boxedEdges = 0;
            this.boxedEdges = boxed;
        }

        public LayoutParams(ViewGroup.LayoutParams source) {
            super(source);
            this.boxedEdges = 0;
        }

        public LayoutParams(ViewGroup.MarginLayoutParams source) {
            super(source);
            this.boxedEdges = 0;
        }

        public LayoutParams(FrameLayout.LayoutParams source) {
            super(source);
            this.boxedEdges = 0;
        }

        public LayoutParams(LayoutParams source) {
            super((FrameLayout.LayoutParams) source);
            this.boxedEdges = 0;
            this.boxedEdges = source.boxedEdges;
            this.gravity = source.gravity;
        }
    }
}
