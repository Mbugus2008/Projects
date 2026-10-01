package androidx.wear.widget.drawer;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.util.AttributeSet;
import android.util.Log;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.accessibility.AccessibilityManager;
import androidx.core.view.ViewCompat;
import androidx.wear.R;
import androidx.wear.internal.widget.drawer.MultiPagePresenter;
import androidx.wear.internal.widget.drawer.MultiPageUi;
import androidx.wear.internal.widget.drawer.SinglePagePresenter;
import androidx.wear.internal.widget.drawer.SinglePageUi;
import androidx.wear.internal.widget.drawer.WearableNavigationDrawerPresenter;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public class WearableNavigationDrawerView extends WearableDrawerView {
    private static final long AUTO_CLOSE_DRAWER_DELAY_MS = TimeUnit.SECONDS.toMillis(5);
    private static final int DEFAULT_STYLE = 0;
    public static final int MULTI_PAGE = 1;
    public static final int SINGLE_PAGE = 0;
    private static final String TAG = "WearableNavDrawer";
    private final Runnable mCloseDrawerRunnable;
    private final GestureDetector mGestureDetector;
    private final boolean mIsAccessibilityEnabled;
    private final Handler mMainThreadHandler;
    private final int mNavigationStyle;
    private final GestureDetector.SimpleOnGestureListener mOnGestureListener;
    final WearableNavigationDrawerPresenter mPresenter;

    @Retention(RetentionPolicy.SOURCE)
    public @interface NavigationStyle {
    }

    public interface OnItemSelectedListener {
        void onItemSelected(int i);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public WearableNavigationDrawerView(Context context) {
        this(context, null);
    }

    public WearableNavigationDrawerView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public WearableNavigationDrawerView(Context context, AttributeSet attrs, int defStyleAttr) {
        this(context, attrs, defStyleAttr, 0);
    }

    public WearableNavigationDrawerView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        WearableNavigationDrawerView wearableNavigationDrawerView;
        Context context2;
        WearableNavigationDrawerPresenter multiPagePresenter;
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mMainThreadHandler = new Handler(Looper.getMainLooper());
        this.mCloseDrawerRunnable = new Runnable() { // from class: androidx.wear.widget.drawer.WearableNavigationDrawerView.1
            @Override // java.lang.Runnable
            public void run() {
                WearableNavigationDrawerView.this.getController().closeDrawer();
            }
        };
        this.mOnGestureListener = new GestureDetector.SimpleOnGestureListener() { // from class: androidx.wear.widget.drawer.WearableNavigationDrawerView.2
            @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
            public boolean onSingleTapUp(MotionEvent e) {
                return WearableNavigationDrawerView.this.mPresenter.onDrawerTapped();
            }
        };
        this.mGestureDetector = new GestureDetector(getContext(), this.mOnGestureListener);
        int navStyle = 0;
        if (attrs == null) {
            wearableNavigationDrawerView = this;
            context2 = context;
        } else {
            TypedArray typedArray = context.obtainStyledAttributes(attrs, R.styleable.WearableNavigationDrawerView, defStyleAttr, 0);
            wearableNavigationDrawerView = this;
            context2 = context;
            ViewCompat.saveAttributeDataForStyleable(wearableNavigationDrawerView, context2, R.styleable.WearableNavigationDrawerView, attrs, typedArray, defStyleAttr, 0);
            navStyle = typedArray.getInt(R.styleable.WearableNavigationDrawerView_navigationStyle, 0);
            typedArray.recycle();
        }
        wearableNavigationDrawerView.mNavigationStyle = navStyle;
        AccessibilityManager accessibilityManager = (AccessibilityManager) context2.getSystemService("accessibility");
        wearableNavigationDrawerView.mIsAccessibilityEnabled = accessibilityManager.isEnabled();
        if (wearableNavigationDrawerView.mNavigationStyle == 0) {
            multiPagePresenter = new SinglePagePresenter(new SinglePageUi(this), wearableNavigationDrawerView.mIsAccessibilityEnabled);
        } else {
            multiPagePresenter = new MultiPagePresenter(this, new MultiPageUi(), wearableNavigationDrawerView.mIsAccessibilityEnabled);
        }
        wearableNavigationDrawerView.mPresenter = multiPagePresenter;
        getPeekContainer().setContentDescription(context2.getString(R.string.ws_navigation_drawer_content_description));
        setOpenOnlyAtTopEnabled(true);
    }

    public void setAdapter(WearableNavigationDrawerAdapter adapter) {
        this.mPresenter.onNewAdapter(adapter);
    }

    public void addOnItemSelectedListener(OnItemSelectedListener listener) {
        this.mPresenter.onItemSelectedListenerAdded(listener);
    }

    public void removeOnItemSelectedListener(OnItemSelectedListener listener) {
        this.mPresenter.onItemSelectedListenerRemoved(listener);
    }

    public void setCurrentItem(int index, boolean smoothScrollTo) {
        this.mPresenter.onSetCurrentItemRequested(index, smoothScrollTo);
    }

    public int getNavigationStyle() {
        return this.mNavigationStyle;
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        autoCloseDrawerAfterDelay();
        return this.mGestureDetector != null && this.mGestureDetector.onTouchEvent(ev);
    }

    @Override // android.view.View
    public boolean canScrollHorizontally(int direction) {
        return isOpened();
    }

    @Override // androidx.wear.widget.drawer.WearableDrawerView
    public void onDrawerOpened() {
        autoCloseDrawerAfterDelay();
    }

    @Override // androidx.wear.widget.drawer.WearableDrawerView
    public void onDrawerClosed() {
        this.mMainThreadHandler.removeCallbacks(this.mCloseDrawerRunnable);
    }

    private void autoCloseDrawerAfterDelay() {
        if (!this.mIsAccessibilityEnabled) {
            this.mMainThreadHandler.removeCallbacks(this.mCloseDrawerRunnable);
            this.mMainThreadHandler.postDelayed(this.mCloseDrawerRunnable, AUTO_CLOSE_DRAWER_DELAY_MS);
        }
    }

    @Override // androidx.wear.widget.drawer.WearableDrawerView
    int preferGravity() {
        return 48;
    }

    public static abstract class WearableNavigationDrawerAdapter {
        private WearableNavigationDrawerPresenter mPresenter;

        public abstract int getCount();

        public abstract Drawable getItemDrawable(int i);

        public abstract CharSequence getItemText(int i);

        public void notifyDataSetChanged() {
            if (this.mPresenter != null) {
                this.mPresenter.onDataSetChanged();
            } else {
                Log.w(WearableNavigationDrawerView.TAG, "adapter.notifyDataSetChanged called before drawer.setAdapter; ignoring.");
            }
        }

        public void setPresenter(WearableNavigationDrawerPresenter presenter) {
            this.mPresenter = presenter;
        }
    }
}
