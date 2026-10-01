package androidx.wear.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Point;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewTreeObserver;
import androidx.core.view.ViewCompat;
import androidx.recyclerview.widget.RecyclerView;
import androidx.wear.R;

/* JADX INFO: loaded from: classes.dex */
public class WearableRecyclerView extends RecyclerView {
    private static final int NO_VALUE = Integer.MIN_VALUE;
    private static final String TAG = "WearableRecyclerView";
    boolean mCenterEdgeItemsWhenThereAreChildren;
    private boolean mCircularScrollingEnabled;
    private boolean mEdgeItemsCenteringEnabled;
    private int mOriginalPaddingBottom;
    private int mOriginalPaddingTop;
    private final ViewTreeObserver.OnPreDrawListener mPaddingPreDrawListener;
    private final ScrollManager mScrollManager;

    public WearableRecyclerView(Context context) {
        this(context, null);
    }

    public WearableRecyclerView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public WearableRecyclerView(Context context, AttributeSet attrs, int defStyle) {
        this(context, attrs, defStyle, 0);
    }

    public WearableRecyclerView(Context context, AttributeSet attrs, int defStyle, int defStyleRes) {
        super(context, attrs, defStyle);
        this.mScrollManager = new ScrollManager();
        this.mOriginalPaddingTop = Integer.MIN_VALUE;
        this.mOriginalPaddingBottom = Integer.MIN_VALUE;
        this.mPaddingPreDrawListener = new ViewTreeObserver.OnPreDrawListener() { // from class: androidx.wear.widget.WearableRecyclerView.1
            @Override // android.view.ViewTreeObserver.OnPreDrawListener
            public boolean onPreDraw() {
                if (WearableRecyclerView.this.mCenterEdgeItemsWhenThereAreChildren && WearableRecyclerView.this.getChildCount() > 0) {
                    WearableRecyclerView.this.setupCenteredPadding();
                    WearableRecyclerView.this.mCenterEdgeItemsWhenThereAreChildren = false;
                    return true;
                }
                return true;
            }
        };
        setHasFixedSize(true);
        setClipToPadding(false);
        if (attrs != null) {
            TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.WearableRecyclerView, defStyle, defStyleRes);
            ViewCompat.saveAttributeDataForStyleable(this, context, R.styleable.WearableRecyclerView, attrs, a, defStyle, defStyleRes);
            setCircularScrollingGestureEnabled(a.getBoolean(R.styleable.WearableRecyclerView_circularScrollingGestureEnabled, this.mCircularScrollingEnabled));
            setBezelFraction(a.getFloat(R.styleable.WearableRecyclerView_bezelWidth, this.mScrollManager.getBezelWidth()));
            setScrollDegreesPerScreen(a.getFloat(R.styleable.WearableRecyclerView_scrollDegreesPerScreen, this.mScrollManager.getScrollDegreesPerScreen()));
            a.recycle();
        }
    }

    void setupCenteredPadding() {
        if (getChildCount() < 1 || !this.mEdgeItemsCenteringEnabled) {
            return;
        }
        View child = getChildAt(0);
        int height = child.getHeight();
        int desiredPadding = (int) ((getHeight() * 0.5f) - (height * 0.5f));
        if (getPaddingTop() != desiredPadding) {
            this.mOriginalPaddingTop = getPaddingTop();
            this.mOriginalPaddingBottom = getPaddingBottom();
            setPadding(getPaddingLeft(), desiredPadding, getPaddingRight(), desiredPadding);
            View focusedChild = getFocusedChild();
            int focusedPosition = focusedChild != null ? getLayoutManager().getPosition(focusedChild) : 0;
            getLayoutManager().scrollToPosition(focusedPosition);
        }
    }

    private void setupOriginalPadding() {
        if (this.mOriginalPaddingTop == Integer.MIN_VALUE) {
            return;
        }
        setPadding(getPaddingLeft(), this.mOriginalPaddingTop, getPaddingRight(), this.mOriginalPaddingBottom);
    }

    @Override // androidx.recyclerview.widget.RecyclerView, android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        if (this.mCircularScrollingEnabled && this.mScrollManager.onTouchEvent(event)) {
            return true;
        }
        return super.onTouchEvent(event);
    }

    @Override // androidx.recyclerview.widget.RecyclerView, android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        Point screenSize = new Point();
        getDisplay().getSize(screenSize);
        this.mScrollManager.setRecyclerView(this, screenSize.x, screenSize.y);
        getViewTreeObserver().addOnPreDrawListener(this.mPaddingPreDrawListener);
    }

    @Override // androidx.recyclerview.widget.RecyclerView, android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.mScrollManager.clearRecyclerView();
        getViewTreeObserver().removeOnPreDrawListener(this.mPaddingPreDrawListener);
    }

    public void setCircularScrollingGestureEnabled(boolean circularScrollingGestureEnabled) {
        this.mCircularScrollingEnabled = circularScrollingGestureEnabled;
    }

    public boolean isCircularScrollingGestureEnabled() {
        return this.mCircularScrollingEnabled;
    }

    public void setScrollDegreesPerScreen(float degreesPerScreen) {
        this.mScrollManager.setScrollDegreesPerScreen(degreesPerScreen);
    }

    public float getScrollDegreesPerScreen() {
        return this.mScrollManager.getScrollDegreesPerScreen();
    }

    public void setBezelFraction(float fraction) {
        this.mScrollManager.setBezelWidth(fraction);
    }

    public float getBezelFraction() {
        return this.mScrollManager.getBezelWidth();
    }

    public void setEdgeItemsCenteringEnabled(boolean isEnabled) {
        if (!getResources().getConfiguration().isScreenRound()) {
            this.mEdgeItemsCenteringEnabled = false;
            return;
        }
        this.mEdgeItemsCenteringEnabled = isEnabled;
        if (this.mEdgeItemsCenteringEnabled) {
            if (getChildCount() > 0) {
                setupCenteredPadding();
                return;
            } else {
                this.mCenterEdgeItemsWhenThereAreChildren = true;
                return;
            }
        }
        setupOriginalPadding();
        this.mCenterEdgeItemsWhenThereAreChildren = false;
    }

    public boolean isEdgeItemsCenteringEnabled() {
        return this.mEdgeItemsCenteringEnabled;
    }
}
