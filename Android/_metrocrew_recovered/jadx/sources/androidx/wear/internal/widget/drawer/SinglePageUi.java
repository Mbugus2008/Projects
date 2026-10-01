package androidx.wear.internal.widget.drawer;

import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import android.widget.Toast;
import androidx.wear.R;
import androidx.wear.widget.CircledImageView;
import androidx.wear.widget.drawer.WearableNavigationDrawerView;

/* JADX INFO: loaded from: classes.dex */
public class SinglePageUi implements SinglePagePresenter.Ui {
    private static final int[] SINGLE_PAGE_BUTTON_IDS = {R.id.ws_nav_drawer_icon_0, R.id.ws_nav_drawer_icon_1, R.id.ws_nav_drawer_icon_2, R.id.ws_nav_drawer_icon_3, R.id.ws_nav_drawer_icon_4, R.id.ws_nav_drawer_icon_5, R.id.ws_nav_drawer_icon_6};
    private static final int[] SINGLE_PAGE_LAYOUT_RES = {0, R.layout.ws_single_page_nav_drawer_1_item, R.layout.ws_single_page_nav_drawer_2_item, R.layout.ws_single_page_nav_drawer_3_item, R.layout.ws_single_page_nav_drawer_4_item, R.layout.ws_single_page_nav_drawer_5_item, R.layout.ws_single_page_nav_drawer_6_item, R.layout.ws_single_page_nav_drawer_7_item};
    final WearableNavigationDrawerView mDrawer;
    private WearableNavigationDrawerPresenter mPresenter;
    private CircledImageView[] mSinglePageImageViews;
    private TextView mTextView;
    private final Handler mMainThreadHandler = new Handler(Looper.getMainLooper());
    private final Runnable mCloseDrawerRunnable = new Runnable() { // from class: androidx.wear.internal.widget.drawer.SinglePageUi.1
        @Override // java.lang.Runnable
        public void run() {
            SinglePageUi.this.mDrawer.getController().closeDrawer();
        }
    };

    public SinglePageUi(WearableNavigationDrawerView navigationDrawer) {
        if (navigationDrawer == null) {
            throw new IllegalArgumentException("Received null navigationDrawer.");
        }
        this.mDrawer = navigationDrawer;
    }

    @Override // androidx.wear.internal.widget.drawer.SinglePagePresenter.Ui
    public void setPresenter(WearableNavigationDrawerPresenter presenter) {
        this.mPresenter = presenter;
    }

    @Override // androidx.wear.internal.widget.drawer.SinglePagePresenter.Ui
    public void initialize(int count) {
        if (count < 0 || count >= SINGLE_PAGE_LAYOUT_RES.length || SINGLE_PAGE_LAYOUT_RES[count] == 0) {
            this.mDrawer.setDrawerContent(null);
            return;
        }
        int layoutRes = SINGLE_PAGE_LAYOUT_RES[count];
        LayoutInflater inflater = LayoutInflater.from(this.mDrawer.getContext());
        View content = inflater.inflate(layoutRes, (ViewGroup) this.mDrawer, false);
        View peek = inflater.inflate(R.layout.ws_single_page_nav_drawer_peek_view, (ViewGroup) this.mDrawer, false);
        this.mTextView = (TextView) content.findViewById(R.id.ws_nav_drawer_text);
        this.mSinglePageImageViews = new CircledImageView[count];
        for (int i = 0; i < count; i++) {
            this.mSinglePageImageViews[i] = (CircledImageView) content.findViewById(SINGLE_PAGE_BUTTON_IDS[i]);
            this.mSinglePageImageViews[i].setOnClickListener(new OnSelectedClickHandler(i, this.mPresenter));
            this.mSinglePageImageViews[i].setCircleHidden(true);
        }
        this.mDrawer.setDrawerContent(content);
        this.mDrawer.setPeekContent(peek);
    }

    @Override // androidx.wear.internal.widget.drawer.SinglePagePresenter.Ui
    public void setIcon(int index, Drawable drawable, CharSequence contentDescription) {
        this.mSinglePageImageViews[index].setImageDrawable(drawable);
        this.mSinglePageImageViews[index].setContentDescription(contentDescription);
    }

    @Override // androidx.wear.internal.widget.drawer.SinglePagePresenter.Ui
    public void setText(CharSequence itemText, boolean showToastIfNoTextView) {
        if (this.mTextView != null) {
            this.mTextView.setText(itemText);
        } else if (showToastIfNoTextView) {
            Toast toast = Toast.makeText(this.mDrawer.getContext(), itemText, 0);
            toast.setGravity(17, 0, 0);
            toast.show();
        }
    }

    @Override // androidx.wear.internal.widget.drawer.SinglePagePresenter.Ui
    public void selectItem(int index) {
        this.mSinglePageImageViews[index].setCircleHidden(false);
    }

    @Override // androidx.wear.internal.widget.drawer.SinglePagePresenter.Ui
    public void deselectItem(int index) {
        this.mSinglePageImageViews[index].setCircleHidden(true);
    }

    @Override // androidx.wear.internal.widget.drawer.SinglePagePresenter.Ui
    public void closeDrawerDelayed(long delayMs) {
        this.mMainThreadHandler.removeCallbacks(this.mCloseDrawerRunnable);
        this.mMainThreadHandler.postDelayed(this.mCloseDrawerRunnable, delayMs);
    }

    @Override // androidx.wear.internal.widget.drawer.SinglePagePresenter.Ui
    public void peekDrawer() {
        this.mDrawer.getController().peekDrawer();
    }

    private static class OnSelectedClickHandler implements View.OnClickListener {
        private final int mIndex;
        private final WearableNavigationDrawerPresenter mPresenter;

        OnSelectedClickHandler(int index, WearableNavigationDrawerPresenter presenter) {
            this.mIndex = index;
            this.mPresenter = presenter;
        }

        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            this.mPresenter.onSelected(this.mIndex);
        }
    }
}
