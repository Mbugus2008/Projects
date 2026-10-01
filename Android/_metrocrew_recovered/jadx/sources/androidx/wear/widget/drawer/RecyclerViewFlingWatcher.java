package androidx.wear.widget.drawer;

import androidx.recyclerview.widget.RecyclerView;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes.dex */
class RecyclerViewFlingWatcher extends RecyclerView.OnScrollListener implements FlingWatcherFactory.FlingWatcher {
    private final FlingWatcherFactory.FlingListener mListener;
    private final WeakReference<RecyclerView> mRecyclerView;

    RecyclerViewFlingWatcher(FlingWatcherFactory.FlingListener listener, RecyclerView view) {
        this.mListener = listener;
        this.mRecyclerView = new WeakReference<>(view);
    }

    @Override // androidx.wear.widget.drawer.FlingWatcherFactory.FlingWatcher
    public void watch() {
        RecyclerView recyclerView = this.mRecyclerView.get();
        if (recyclerView != null) {
            recyclerView.addOnScrollListener(this);
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.OnScrollListener
    public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
        if (newState == 0) {
            this.mListener.onFlingComplete(recyclerView);
            recyclerView.removeOnScrollListener(this);
        }
    }
}
