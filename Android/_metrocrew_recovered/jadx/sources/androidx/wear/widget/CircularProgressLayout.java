package androidx.wear.widget;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Paint;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import androidx.core.content.ContextCompat;
import androidx.core.view.ViewCompat;
import androidx.swiperefreshlayout.widget.CircularProgressDrawable;
import androidx.wear.R;

/* JADX INFO: loaded from: classes.dex */
public class CircularProgressLayout extends FrameLayout {
    private static final float DEFAULT_ROTATION = 0.75f;
    private static final long DEFAULT_UPDATE_INTERVAL = 16;
    private CircularProgressLayoutController mController;
    private CircularProgressDrawable mProgressDrawable;
    private float mStartingRotation;
    private long mTotalTime;

    public interface OnTimerFinishedListener {
        void onTimerFinished(CircularProgressLayout circularProgressLayout);
    }

    public CircularProgressLayout(Context context) {
        this(context, null);
    }

    public CircularProgressLayout(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public CircularProgressLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        this(context, attrs, defStyleAttr, 0);
    }

    public CircularProgressLayout(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mStartingRotation = 0.75f;
        this.mProgressDrawable = new CircularProgressDrawable(context);
        this.mProgressDrawable.setProgressRotation(0.75f);
        this.mProgressDrawable.setStrokeCap(Paint.Cap.BUTT);
        setBackground(this.mProgressDrawable);
        setOnHierarchyChangeListener(new ViewGroup.OnHierarchyChangeListener() { // from class: androidx.wear.widget.CircularProgressLayout.1
            @Override // android.view.ViewGroup.OnHierarchyChangeListener
            public void onChildViewAdded(View parent, View child) {
                FrameLayout.LayoutParams params = (FrameLayout.LayoutParams) child.getLayoutParams();
                params.gravity = 17;
                child.setLayoutParams(params);
            }

            @Override // android.view.ViewGroup.OnHierarchyChangeListener
            public void onChildViewRemoved(View parent, View child) {
            }
        });
        this.mController = new CircularProgressLayoutController(this);
        Resources r = context.getResources();
        TypedArray a = r.obtainAttributes(attrs, R.styleable.CircularProgressLayout);
        if (a.getType(R.styleable.CircularProgressLayout_colorSchemeColors) == 1 || !a.hasValue(R.styleable.CircularProgressLayout_colorSchemeColors)) {
            int arrayResId = a.getResourceId(R.styleable.CircularProgressLayout_colorSchemeColors, R.array.circular_progress_layout_color_scheme_colors);
            setColorSchemeColors(getColorListFromResources(r, arrayResId));
        } else {
            setColorSchemeColors(a.getColor(R.styleable.CircularProgressLayout_colorSchemeColors, ViewCompat.MEASURED_STATE_MASK));
        }
        setStrokeWidth(a.getDimensionPixelSize(R.styleable.CircularProgressLayout_strokeWidth, r.getDimensionPixelSize(R.dimen.circular_progress_layout_stroke_width)));
        setBackgroundColor(a.getColor(R.styleable.CircularProgressLayout_backgroundColor, ContextCompat.getColor(context, R.color.circular_progress_layout_background_color)));
        setIndeterminate(a.getBoolean(R.styleable.CircularProgressLayout_indeterminate, false));
        a.recycle();
    }

    private int[] getColorListFromResources(Resources resources, int arrayResId) {
        TypedArray colorArray = resources.obtainTypedArray(arrayResId);
        int[] colors = new int[colorArray.length()];
        for (int i = 0; i < colorArray.length(); i++) {
            colors[i] = colorArray.getColor(i, 0);
        }
        colorArray.recycle();
        return colors;
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        super.onLayout(changed, left, top, right, bottom);
        if (getChildCount() != 0) {
            View childView = getChildAt(0);
            this.mProgressDrawable.setCenterRadius(Math.min(childView.getWidth(), childView.getHeight()) / 2.0f);
        } else {
            this.mProgressDrawable.setCenterRadius(0.0f);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.mController.reset();
    }

    @Override // android.view.View
    public void setBackgroundColor(int color) {
        this.mProgressDrawable.setBackgroundColor(color);
    }

    public int getBackgroundColor() {
        return this.mProgressDrawable.getBackgroundColor();
    }

    public CircularProgressDrawable getProgressDrawable() {
        return this.mProgressDrawable;
    }

    public void setIndeterminate(boolean indeterminate) {
        this.mController.setIndeterminate(indeterminate);
    }

    public boolean isIndeterminate() {
        return this.mController.isIndeterminate();
    }

    public void setTotalTime(long totalTime) {
        if (totalTime <= 0) {
            throw new IllegalArgumentException("Total time should be greater than zero.");
        }
        this.mTotalTime = totalTime;
    }

    public long getTotalTime() {
        return this.mTotalTime;
    }

    public void startTimer() {
        this.mController.startTimer(this.mTotalTime, DEFAULT_UPDATE_INTERVAL);
        this.mProgressDrawable.setProgressRotation(this.mStartingRotation);
    }

    public void stopTimer() {
        this.mController.stopTimer();
    }

    public boolean isTimerRunning() {
        return this.mController.isTimerRunning();
    }

    public void setStartingRotation(float rotation) {
        this.mStartingRotation = rotation;
    }

    public float getStartingRotation() {
        return this.mStartingRotation;
    }

    public void setStrokeWidth(float strokeWidth) {
        this.mProgressDrawable.setStrokeWidth(strokeWidth);
    }

    public float getStrokeWidth() {
        return this.mProgressDrawable.getStrokeWidth();
    }

    public void setColorSchemeColors(int... colors) {
        this.mProgressDrawable.setColorSchemeColors(colors);
    }

    public int[] getColorSchemeColors() {
        return this.mProgressDrawable.getColorSchemeColors();
    }

    public OnTimerFinishedListener getOnTimerFinishedListener() {
        return this.mController.getOnTimerFinishedListener();
    }

    public void setOnTimerFinishedListener(OnTimerFinishedListener listener) {
        this.mController.setOnTimerFinishedListener(listener);
    }
}
