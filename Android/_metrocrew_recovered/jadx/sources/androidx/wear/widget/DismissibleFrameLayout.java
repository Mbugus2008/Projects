package androidx.wear.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.FrameLayout;
import androidx.wear.utils.WearableNavigationHelper;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class DismissibleFrameLayout extends FrameLayout {
    private static final String TAG = "DismissibleFrameLayout";
    private BackButtonDismissController mBackButtonDismissController;
    final ArrayList<Callback> mCallbacks;
    private final Context mContext;
    private final MyDismissListener mDismissListener;
    private SwipeDismissController mSwipeDismissController;

    public static abstract class Callback {
        public void onDismissStarted(DismissibleFrameLayout layout) {
        }

        public void onDismissCanceled(DismissibleFrameLayout layout) {
        }

        public void onDismissFinished(DismissibleFrameLayout layout) {
        }
    }

    public DismissibleFrameLayout(Context context) {
        this(context, null);
    }

    public DismissibleFrameLayout(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public DismissibleFrameLayout(Context context, AttributeSet attrs, int defStyle) {
        this(context, attrs, defStyle, 0);
    }

    public DismissibleFrameLayout(Context context, AttributeSet attrs, int defStyle, int defStyleRes) {
        super(context, attrs, defStyle, defStyleRes);
        this.mSwipeDismissController = null;
        this.mBackButtonDismissController = null;
        this.mDismissListener = new MyDismissListener();
        this.mCallbacks = new ArrayList<>();
        this.mContext = context;
        setSwipeDismissible(WearableNavigationHelper.isSwipeToDismissEnabled(context));
        setBackButtonDismissible(false);
    }

    public final void registerCallback(Callback callback) {
        this.mCallbacks.add(callback);
    }

    public final void unregisterCallback(Callback callback) {
        if (!this.mCallbacks.remove(callback)) {
            throw new IllegalStateException("removeCallback called with nonexistent callback");
        }
    }

    public final void setSwipeDismissible(boolean swipeDismissible) {
        if (swipeDismissible) {
            if (this.mSwipeDismissController == null) {
                this.mSwipeDismissController = new SwipeDismissController(this.mContext, this);
                this.mSwipeDismissController.setOnDismissListener(this.mDismissListener);
                return;
            }
            return;
        }
        if (this.mSwipeDismissController != null) {
            this.mSwipeDismissController.setOnDismissListener(null);
            this.mSwipeDismissController = null;
        }
    }

    public boolean isDismissableBySwipe() {
        return this.mSwipeDismissController != null;
    }

    public final void setBackButtonDismissible(boolean backButtonDismissible) {
        if (backButtonDismissible) {
            if (this.mBackButtonDismissController == null) {
                this.mBackButtonDismissController = new BackButtonDismissController(this.mContext, this);
                this.mBackButtonDismissController.setOnDismissListener(this.mDismissListener);
                return;
            }
            return;
        }
        if (this.mBackButtonDismissController != null) {
            this.mBackButtonDismissController.disable(this);
            this.mBackButtonDismissController = null;
        }
    }

    public boolean isDismissableByBackButton() {
        return this.mBackButtonDismissController != null;
    }

    SwipeDismissController getSwipeDismissController() {
        return this.mSwipeDismissController;
    }

    protected void performDismissFinishedCallbacks() {
        for (int i = this.mCallbacks.size() - 1; i >= 0; i--) {
            this.mCallbacks.get(i).onDismissFinished(this);
        }
    }

    protected void performDismissStartedCallbacks() {
        for (int i = this.mCallbacks.size() - 1; i >= 0; i--) {
            this.mCallbacks.get(i).onDismissStarted(this);
        }
    }

    protected void performDismissCanceledCallbacks() {
        for (int i = this.mCallbacks.size() - 1; i >= 0; i--) {
            this.mCallbacks.get(i).onDismissCanceled(this);
        }
    }

    private final class MyDismissListener implements DismissController.OnDismissListener {
        MyDismissListener() {
        }

        @Override // androidx.wear.widget.DismissController.OnDismissListener
        public void onDismissStarted() {
            DismissibleFrameLayout.this.performDismissStartedCallbacks();
        }

        @Override // androidx.wear.widget.DismissController.OnDismissListener
        public void onDismissCanceled() {
            DismissibleFrameLayout.this.performDismissCanceledCallbacks();
        }

        @Override // androidx.wear.widget.DismissController.OnDismissListener
        public void onDismissed() {
            DismissibleFrameLayout.this.performDismissFinishedCallbacks();
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public void requestDisallowInterceptTouchEvent(boolean disallowIntercept) {
        if (this.mSwipeDismissController != null) {
            this.mSwipeDismissController.requestDisallowInterceptTouchEvent(disallowIntercept);
        } else {
            super.requestDisallowInterceptTouchEvent(disallowIntercept);
        }
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        if (this.mSwipeDismissController != null) {
            return this.mSwipeDismissController.onInterceptTouchEvent(ev);
        }
        return super.onInterceptTouchEvent(ev);
    }

    @Override // android.view.View
    public boolean canScrollHorizontally(int direction) {
        if (this.mSwipeDismissController != null) {
            return this.mSwipeDismissController.canScrollHorizontally(direction);
        }
        return super.canScrollHorizontally(direction);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        if (this.mSwipeDismissController != null && this.mSwipeDismissController.onTouchEvent(ev)) {
            return true;
        }
        return super.onTouchEvent(ev);
    }
}
