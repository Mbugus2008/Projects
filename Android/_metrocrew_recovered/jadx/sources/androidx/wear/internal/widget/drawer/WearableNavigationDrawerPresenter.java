package androidx.wear.internal.widget.drawer;

import androidx.wear.widget.drawer.WearableNavigationDrawerView;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public abstract class WearableNavigationDrawerPresenter {
    private final Set<WearableNavigationDrawerView.OnItemSelectedListener> mOnItemSelectedListeners = new HashSet();

    public abstract void onDataSetChanged();

    public abstract boolean onDrawerTapped();

    public abstract void onNewAdapter(WearableNavigationDrawerView.WearableNavigationDrawerAdapter wearableNavigationDrawerAdapter);

    public abstract void onSelected(int i);

    public abstract void onSetCurrentItemRequested(int i, boolean z);

    public void onItemSelectedListenerAdded(WearableNavigationDrawerView.OnItemSelectedListener listener) {
        this.mOnItemSelectedListeners.add(listener);
    }

    public void onItemSelectedListenerRemoved(WearableNavigationDrawerView.OnItemSelectedListener listener) {
        this.mOnItemSelectedListeners.remove(listener);
    }

    void notifyItemSelectedListeners(int selectedPos) {
        for (WearableNavigationDrawerView.OnItemSelectedListener listener : this.mOnItemSelectedListeners) {
            listener.onItemSelected(selectedPos);
        }
    }
}
