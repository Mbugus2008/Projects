package androidx.wear.widget.drawer;

import android.os.Handler;
import android.os.Looper;
import android.view.View;
import androidx.core.widget.NestedScrollView;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes.dex */
class NestedScrollViewFlingWatcher implements FlingWatcherFactory.FlingWatcher, NestedScrollView.OnScrollChangeListener {
    static final int MAX_WAIT_TIME_MS = 100;
    private final FlingWatcherFactory.FlingListener mListener;
    private final WeakReference<NestedScrollView> mNestedScrollView;
    private final Handler mMainThreadHandler = new Handler(Looper.getMainLooper());
    private final Runnable mNotifyListenerRunnable = new Runnable() { // from class: androidx.wear.widget.drawer.NestedScrollViewFlingWatcher.1
        @Override // java.lang.Runnable
        public void run() {
            NestedScrollViewFlingWatcher.this.onEndOfFlingFound();
        }
    };

    NestedScrollViewFlingWatcher(FlingWatcherFactory.FlingListener listener, NestedScrollView nestedScrollView) {
        this.mListener = listener;
        this.mNestedScrollView = new WeakReference<>(nestedScrollView);
    }

    private static boolean isViewAtTopOrBottom(View view) {
        return (view.canScrollVertically(-1) && view.canScrollVertically(1)) ? false : true;
    }

    @Override // androidx.wear.widget.drawer.FlingWatcherFactory.FlingWatcher
    public void watch() {
        NestedScrollView nestedScrollView = this.mNestedScrollView.get();
        if (nestedScrollView != null) {
            nestedScrollView.setOnScrollChangeListener(this);
            scheduleNext();
        }
    }

    @Override // androidx.core.widget.NestedScrollView.OnScrollChangeListener
    public void onScrollChange(NestedScrollView v, int scrollX, int scrollY, int oldScrollX, int oldScrollY) {
        if (isViewAtTopOrBottom(v)) {
            onEndOfFlingFound();
        } else {
            scheduleNext();
        }
    }

    void onEndOfFlingFound() {
        this.mMainThreadHandler.removeCallbacks(this.mNotifyListenerRunnable);
        NestedScrollView nestedScrollView = this.mNestedScrollView.get();
        if (nestedScrollView != null) {
            nestedScrollView.setOnScrollChangeListener((NestedScrollView.OnScrollChangeListener) null);
            this.mListener.onFlingComplete(nestedScrollView);
        }
    }

    private void scheduleNext() {
        this.mMainThreadHandler.removeCallbacks(this.mNotifyListenerRunnable);
        this.mMainThreadHandler.postDelayed(this.mNotifyListenerRunnable, 100L);
    }
}
