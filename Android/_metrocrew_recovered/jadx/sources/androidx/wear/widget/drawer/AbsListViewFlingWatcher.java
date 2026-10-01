package androidx.wear.widget.drawer;

import android.widget.AbsListView;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes.dex */
class AbsListViewFlingWatcher implements FlingWatcherFactory.FlingWatcher, AbsListView.OnScrollListener {
    private final WeakReference<AbsListView> mListView;
    private final FlingWatcherFactory.FlingListener mListener;

    AbsListViewFlingWatcher(FlingWatcherFactory.FlingListener listener, AbsListView listView) {
        this.mListener = listener;
        this.mListView = new WeakReference<>(listView);
    }

    @Override // androidx.wear.widget.drawer.FlingWatcherFactory.FlingWatcher
    public void watch() {
        AbsListView absListView = this.mListView.get();
        if (absListView != null) {
            absListView.setOnScrollListener(this);
        }
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScrollStateChanged(AbsListView view, int scrollState) {
        if (scrollState != 2) {
            view.setOnScrollChangeListener(null);
            this.mListener.onFlingComplete(view);
        }
    }

    @Override // android.widget.AbsListView.OnScrollListener
    public void onScroll(AbsListView view, int firstVisibleItem, int visibleItemCount, int totalItemCount) {
    }
}
