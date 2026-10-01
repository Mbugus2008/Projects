package androidx.wear.internal.widget.drawer;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.viewpager.widget.PagerAdapter;
import androidx.viewpager.widget.ViewPager;
import androidx.wear.R;
import androidx.wear.widget.drawer.PageIndicatorView;
import androidx.wear.widget.drawer.WearableNavigationDrawerView;

/* JADX INFO: loaded from: classes.dex */
public class MultiPageUi implements MultiPagePresenter.Ui {
    private static final String TAG = "MultiPageUi";
    private ViewPager mNavigationPager;
    private PageIndicatorView mPageIndicatorView;
    WearableNavigationDrawerPresenter mPresenter;

    @Override // androidx.wear.internal.widget.drawer.MultiPagePresenter.Ui
    public void initialize(WearableNavigationDrawerView drawer, WearableNavigationDrawerPresenter presenter) {
        if (drawer == null) {
            throw new IllegalArgumentException("Received null drawer.");
        }
        if (presenter == null) {
            throw new IllegalArgumentException("Received null presenter.");
        }
        this.mPresenter = presenter;
        LayoutInflater inflater = LayoutInflater.from(drawer.getContext());
        View content = inflater.inflate(R.layout.ws_navigation_drawer_view, (ViewGroup) drawer, false);
        this.mNavigationPager = (ViewPager) content.findViewById(R.id.ws_navigation_drawer_view_pager);
        this.mPageIndicatorView = (PageIndicatorView) content.findViewById(R.id.ws_navigation_drawer_page_indicator);
        drawer.setDrawerContent(content);
    }

    @Override // androidx.wear.internal.widget.drawer.MultiPagePresenter.Ui
    public void setNavigationPagerAdapter(WearableNavigationDrawerView.WearableNavigationDrawerAdapter adapter) {
        if (this.mNavigationPager == null || this.mPageIndicatorView == null) {
            Log.w(TAG, "setNavigationPagerAdapter was called before initialize.");
            return;
        }
        NavigationPagerAdapter navigationPagerAdapter = new NavigationPagerAdapter(adapter);
        this.mNavigationPager.setAdapter(navigationPagerAdapter);
        this.mNavigationPager.clearOnPageChangeListeners();
        this.mNavigationPager.addOnPageChangeListener(new ViewPager.SimpleOnPageChangeListener() { // from class: androidx.wear.internal.widget.drawer.MultiPageUi.1
            @Override // androidx.viewpager.widget.ViewPager.SimpleOnPageChangeListener, androidx.viewpager.widget.ViewPager.OnPageChangeListener
            public void onPageSelected(int position) {
                MultiPageUi.this.mPresenter.onSelected(position);
            }
        });
        this.mPageIndicatorView.setPager(this.mNavigationPager);
    }

    @Override // androidx.wear.internal.widget.drawer.MultiPagePresenter.Ui
    public void notifyPageIndicatorDataChanged() {
        if (this.mPageIndicatorView != null) {
            this.mPageIndicatorView.notifyDataSetChanged();
        }
    }

    @Override // androidx.wear.internal.widget.drawer.MultiPagePresenter.Ui
    public void notifyNavigationPagerAdapterDataChanged() {
        PagerAdapter adapter;
        if (this.mNavigationPager != null && (adapter = this.mNavigationPager.getAdapter()) != null) {
            adapter.notifyDataSetChanged();
        }
    }

    @Override // androidx.wear.internal.widget.drawer.MultiPagePresenter.Ui
    public void setNavigationPagerSelectedItem(int index, boolean smoothScrollTo) {
        if (this.mNavigationPager != null) {
            this.mNavigationPager.setCurrentItem(index, smoothScrollTo);
        }
    }

    private static final class NavigationPagerAdapter extends PagerAdapter {
        private final WearableNavigationDrawerView.WearableNavigationDrawerAdapter mAdapter;

        NavigationPagerAdapter(WearableNavigationDrawerView.WearableNavigationDrawerAdapter adapter) {
            this.mAdapter = adapter;
        }

        @Override // androidx.viewpager.widget.PagerAdapter
        public Object instantiateItem(ViewGroup container, int position) {
            View view = LayoutInflater.from(container.getContext()).inflate(R.layout.ws_navigation_drawer_item_view, container, false);
            container.addView(view);
            ImageView iconView = (ImageView) view.findViewById(R.id.ws_navigation_drawer_item_icon);
            TextView textView = (TextView) view.findViewById(R.id.ws_navigation_drawer_item_text);
            iconView.setImageDrawable(this.mAdapter.getItemDrawable(position));
            textView.setText(this.mAdapter.getItemText(position));
            return view;
        }

        @Override // androidx.viewpager.widget.PagerAdapter
        public void destroyItem(ViewGroup container, int position, Object object) {
            container.removeView((View) object);
        }

        @Override // androidx.viewpager.widget.PagerAdapter
        public int getCount() {
            return this.mAdapter.getCount();
        }

        @Override // androidx.viewpager.widget.PagerAdapter
        public int getItemPosition(Object object) {
            return -2;
        }

        @Override // androidx.viewpager.widget.PagerAdapter
        public boolean isViewFromObject(View view, Object object) {
            return view == object;
        }
    }
}
