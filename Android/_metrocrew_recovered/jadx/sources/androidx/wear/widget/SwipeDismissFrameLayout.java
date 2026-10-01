package androidx.wear.widget;

import android.content.Context;
import android.util.AttributeSet;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class SwipeDismissFrameLayout extends DismissibleFrameLayout {
    public static final float DEFAULT_DISMISS_DRAG_WIDTH_RATIO = 0.33f;
    final ArrayList<Callback> mCallbacksCompat;

    public static abstract class Callback {
        public void onSwipeStarted(SwipeDismissFrameLayout layout) {
        }

        public void onSwipeCanceled(SwipeDismissFrameLayout layout) {
        }

        public void onDismissed(SwipeDismissFrameLayout layout) {
        }
    }

    public SwipeDismissFrameLayout(Context context) {
        this(context, null, 0);
    }

    public SwipeDismissFrameLayout(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public SwipeDismissFrameLayout(Context context, AttributeSet attrs, int defStyle) {
        this(context, attrs, defStyle, 0);
    }

    public SwipeDismissFrameLayout(Context context, AttributeSet attrs, int defStyle, int defStyleRes) {
        super(context, attrs, defStyle, defStyleRes);
        this.mCallbacksCompat = new ArrayList<>();
    }

    public void addCallback(Callback callback) {
        if (callback == null) {
            throw new NullPointerException("addCallback called with null callback");
        }
        this.mCallbacksCompat.add(callback);
    }

    public void removeCallback(Callback callback) {
        if (callback == null) {
            throw new NullPointerException("removeCallback called with null callback");
        }
        if (!this.mCallbacksCompat.remove(callback)) {
            throw new IllegalStateException("removeCallback called with nonexistent callback");
        }
    }

    public void setSwipeable(boolean swipeable) {
        super.setSwipeDismissible(swipeable);
    }

    public boolean isSwipeable() {
        return super.isDismissableBySwipe();
    }

    public void setDismissMinDragWidthRatio(float ratio) {
        if (isSwipeable()) {
            getSwipeDismissController().setDismissMinDragWidthRatio(ratio);
        }
    }

    public float getDismissMinDragWidthRatio() {
        if (isSwipeable()) {
            return getSwipeDismissController().getDismissMinDragWidthRatio();
        }
        return 0.33f;
    }

    @Override // androidx.wear.widget.DismissibleFrameLayout
    protected void performDismissFinishedCallbacks() {
        super.performDismissFinishedCallbacks();
        for (int i = this.mCallbacksCompat.size() - 1; i >= 0; i--) {
            this.mCallbacksCompat.get(i).onDismissed(this);
        }
    }

    @Override // androidx.wear.widget.DismissibleFrameLayout
    protected void performDismissStartedCallbacks() {
        super.performDismissStartedCallbacks();
        for (int i = this.mCallbacksCompat.size() - 1; i >= 0; i--) {
            this.mCallbacksCompat.get(i).onSwipeStarted(this);
        }
    }

    @Override // androidx.wear.widget.DismissibleFrameLayout
    protected void performDismissCanceledCallbacks() {
        super.performDismissCanceledCallbacks();
        for (int i = this.mCallbacksCompat.size() - 1; i >= 0; i--) {
            this.mCallbacksCompat.get(i).onSwipeCanceled(this);
        }
    }
}
