package androidx.wear.internal.widget.drawer;

import androidx.wear.widget.drawer.WearableNavigationDrawerView;

/* JADX INFO: loaded from: classes.dex */
public class MultiPagePresenter extends WearableNavigationDrawerPresenter {
    private WearableNavigationDrawerView.WearableNavigationDrawerAdapter mAdapter;
    private final WearableNavigationDrawerView mDrawer;
    private final boolean mIsAccessibilityEnabled;
    private final Ui mUi;

    public interface Ui {
        void initialize(WearableNavigationDrawerView wearableNavigationDrawerView, WearableNavigationDrawerPresenter wearableNavigationDrawerPresenter);

        void notifyNavigationPagerAdapterDataChanged();

        void notifyPageIndicatorDataChanged();

        void setNavigationPagerAdapter(WearableNavigationDrawerView.WearableNavigationDrawerAdapter wearableNavigationDrawerAdapter);

        void setNavigationPagerSelectedItem(int i, boolean z);
    }

    public MultiPagePresenter(WearableNavigationDrawerView drawer, Ui ui, boolean isAccessibilityEnabled) {
        if (drawer == null) {
            throw new IllegalArgumentException("Received null drawer.");
        }
        if (ui == null) {
            throw new IllegalArgumentException("Received null ui.");
        }
        this.mDrawer = drawer;
        this.mUi = ui;
        this.mUi.initialize(drawer, this);
        this.mIsAccessibilityEnabled = isAccessibilityEnabled;
    }

    @Override // androidx.wear.internal.widget.drawer.WearableNavigationDrawerPresenter
    public void onDataSetChanged() {
        this.mUi.notifyNavigationPagerAdapterDataChanged();
        this.mUi.notifyPageIndicatorDataChanged();
    }

    @Override // androidx.wear.internal.widget.drawer.WearableNavigationDrawerPresenter
    public void onNewAdapter(WearableNavigationDrawerView.WearableNavigationDrawerAdapter adapter) {
        if (adapter == null) {
            throw new IllegalArgumentException("Received null adapter.");
        }
        this.mAdapter = adapter;
        this.mAdapter.setPresenter(this);
        this.mUi.setNavigationPagerAdapter(adapter);
    }

    @Override // androidx.wear.internal.widget.drawer.WearableNavigationDrawerPresenter
    public void onSelected(int index) {
        notifyItemSelectedListeners(index);
    }

    @Override // androidx.wear.internal.widget.drawer.WearableNavigationDrawerPresenter
    public void onSetCurrentItemRequested(int index, boolean smoothScrollTo) {
        this.mUi.setNavigationPagerSelectedItem(index, smoothScrollTo);
    }

    @Override // androidx.wear.internal.widget.drawer.WearableNavigationDrawerPresenter
    public boolean onDrawerTapped() {
        if (this.mDrawer.isOpened()) {
            if (this.mIsAccessibilityEnabled) {
                this.mDrawer.getController().peekDrawer();
                return true;
            }
            this.mDrawer.getController().closeDrawer();
            return true;
        }
        return false;
    }
}
