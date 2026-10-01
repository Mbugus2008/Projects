package androidx.wear.widget;

import android.content.Context;
import android.view.View;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

/* JADX INFO: loaded from: classes.dex */
public class WearableLinearLayoutManager extends LinearLayoutManager {
    private LayoutCallback mLayoutCallback;

    public static abstract class LayoutCallback {
        public abstract void onLayoutFinished(View view, RecyclerView recyclerView);
    }

    public WearableLinearLayoutManager(Context context, LayoutCallback layoutCallback) {
        super(context, 1, false);
        this.mLayoutCallback = layoutCallback;
    }

    public WearableLinearLayoutManager(Context context) {
        this(context, new CurvingLayoutCallback(context));
    }

    public void setLayoutCallback(LayoutCallback layoutCallback) {
        this.mLayoutCallback = layoutCallback;
    }

    public LayoutCallback getLayoutCallback() {
        return this.mLayoutCallback;
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, androidx.recyclerview.widget.RecyclerView.LayoutManager
    public int scrollVerticallyBy(int dy, RecyclerView.Recycler recycler, RecyclerView.State state) {
        int scrolled = super.scrollVerticallyBy(dy, recycler, state);
        updateLayout();
        return scrolled;
    }

    @Override // androidx.recyclerview.widget.LinearLayoutManager, androidx.recyclerview.widget.RecyclerView.LayoutManager
    public void onLayoutChildren(RecyclerView.Recycler recycler, RecyclerView.State state) {
        super.onLayoutChildren(recycler, state);
        if (getChildCount() == 0) {
            return;
        }
        updateLayout();
    }

    private void updateLayout() {
        if (this.mLayoutCallback == null) {
            return;
        }
        int childCount = getChildCount();
        for (int count = 0; count < childCount; count++) {
            View child = getChildAt(count);
            this.mLayoutCallback.onLayoutFinished(child, (WearableRecyclerView) child.getParent());
        }
    }
}
