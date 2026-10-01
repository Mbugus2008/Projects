package androidx.wear.widget.drawer;

import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.ScrollView;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes.dex */
class ScrollViewFlingWatcher implements FlingWatcherFactory.FlingWatcher, View.OnScrollChangeListener {
    static final int MAX_WAIT_TIME_MS = 100;
    private final FlingWatcherFactory.FlingListener mListener;
    private final Handler mMainThreadHandler = new Handler(Looper.getMainLooper());
    private final Runnable mNotifyListenerRunnable = new Runnable() { // from class: androidx.wear.widget.drawer.ScrollViewFlingWatcher.1
        @Override // java.lang.Runnable
        public void run() {
            ScrollViewFlingWatcher.this.onEndOfFlingFound();
        }
    };
    private final WeakReference<ScrollView> mScrollView;

    ScrollViewFlingWatcher(FlingWatcherFactory.FlingListener listener, ScrollView scrollView) {
        this.mListener = listener;
        this.mScrollView = new WeakReference<>(scrollView);
    }

    private static boolean isViewAtTopOrBottom(View view) {
        return (view.canScrollVertically(-1) && view.canScrollVertically(1)) ? false : true;
    }

    @Override // androidx.wear.widget.drawer.FlingWatcherFactory.FlingWatcher
    public void watch() {
        ScrollView scrollView = this.mScrollView.get();
        if (scrollView != null) {
            scrollView.setOnScrollChangeListener(this);
            scheduleNext();
        }
    }

    @Override // android.view.View.OnScrollChangeListener
    public void onScrollChange(View v, int scrollX, int scrollY, int oldScrollX, int oldScrollY) {
        if (isViewAtTopOrBottom(v)) {
            onEndOfFlingFound();
        } else {
            scheduleNext();
        }
    }

    void onEndOfFlingFound() {
        this.mMainThreadHandler.removeCallbacks(this.mNotifyListenerRunnable);
        ScrollView scrollView = this.mScrollView.get();
        if (scrollView != null) {
            scrollView.setOnScrollChangeListener(null);
            this.mListener.onFlingComplete(scrollView);
        }
    }

    private void scheduleNext() {
        this.mMainThreadHandler.removeCallbacks(this.mNotifyListenerRunnable);
        this.mMainThreadHandler.postDelayed(this.mNotifyListenerRunnable, 100L);
    }
}
