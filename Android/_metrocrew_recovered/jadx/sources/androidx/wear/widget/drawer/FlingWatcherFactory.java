package androidx.wear.widget.drawer;

import android.view.View;
import android.widget.AbsListView;
import android.widget.ScrollView;
import androidx.core.widget.NestedScrollView;
import androidx.recyclerview.widget.RecyclerView;
import java.util.Map;
import java.util.WeakHashMap;

/* JADX INFO: loaded from: classes.dex */
class FlingWatcherFactory {
    private final FlingListener mListener;
    private final Map<View, FlingWatcher> mWatchers = new WeakHashMap();

    interface FlingListener {
        void onFlingComplete(View view);
    }

    interface FlingWatcher {
        void watch();
    }

    FlingWatcherFactory(FlingListener listener) {
        if (listener == null) {
            throw new IllegalArgumentException("FlingListener was null");
        }
        this.mListener = listener;
    }

    FlingWatcher getFor(View view) {
        FlingWatcher watcher = this.mWatchers.get(view);
        if (watcher == null && (watcher = createFor(view)) != null) {
            this.mWatchers.put(view, watcher);
        }
        return watcher;
    }

    private FlingWatcher createFor(View view) {
        if (view == null) {
            throw new IllegalArgumentException("View was null");
        }
        if (view instanceof RecyclerView) {
            return new RecyclerViewFlingWatcher(this.mListener, (RecyclerView) view);
        }
        if (view instanceof AbsListView) {
            return new AbsListViewFlingWatcher(this.mListener, (AbsListView) view);
        }
        if (view instanceof ScrollView) {
            return new ScrollViewFlingWatcher(this.mListener, (ScrollView) view);
        }
        if (view instanceof NestedScrollView) {
            return new NestedScrollViewFlingWatcher(this.mListener, (NestedScrollView) view);
        }
        return null;
    }
}
