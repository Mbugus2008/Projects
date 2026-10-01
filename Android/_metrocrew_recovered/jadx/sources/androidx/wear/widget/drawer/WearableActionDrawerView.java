package androidx.wear.widget.drawer;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityManager;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.core.view.ViewCompat;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.wear.R;
import androidx.wear.internal.widget.ResourcesUtil;

/* JADX INFO: loaded from: classes.dex */
public class WearableActionDrawerView extends WearableDrawerView {
    private static final String TAG = "WearableActionDrawer";
    final RecyclerView mActionList;
    final RecyclerView.Adapter<RecyclerView.ViewHolder> mActionListAdapter;
    final int mBottomPadding;
    final int mFirstItemTopPadding;
    final int mIconRightMargin;
    final int mLastItemBottomPadding;
    final int mLeftPadding;
    private Menu mMenu;
    private MenuItem.OnMenuItemClickListener mOnMenuItemClickListener;
    private final ImageView mPeekActionIcon;
    private final ImageView mPeekExpandIcon;
    final int mRightPadding;
    private final boolean mShowOverflowInPeek;
    CharSequence mTitle;
    final int mTopPadding;

    public WearableActionDrawerView(Context context) {
        this(context, null);
    }

    public WearableActionDrawerView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public WearableActionDrawerView(Context context, AttributeSet attrs, int defStyleAttr) {
        this(context, attrs, defStyleAttr, 0);
    }

    public WearableActionDrawerView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        boolean z = true;
        setLockedWhenClosed(true);
        boolean showOverflowInPeek = false;
        int menuRes = 0;
        if (attrs != null) {
            TypedArray typedArray = context.obtainStyledAttributes(attrs, R.styleable.WearableActionDrawerView, defStyleAttr, 0);
            ViewCompat.saveAttributeDataForStyleable(this, context, R.styleable.WearableActionDrawerView, attrs, typedArray, defStyleAttr, 0);
            try {
                this.mTitle = typedArray.getString(R.styleable.WearableActionDrawerView_drawerTitle);
                showOverflowInPeek = typedArray.getBoolean(R.styleable.WearableActionDrawerView_showOverflowInPeek, false);
                menuRes = typedArray.getResourceId(R.styleable.WearableActionDrawerView_actionMenu, 0);
                typedArray.recycle();
            } catch (Throwable th) {
                typedArray.recycle();
                throw th;
            }
        }
        AccessibilityManager accessibilityManager = (AccessibilityManager) context.getSystemService("accessibility");
        if (!showOverflowInPeek && !accessibilityManager.isEnabled()) {
            z = false;
        }
        this.mShowOverflowInPeek = z;
        if (!this.mShowOverflowInPeek) {
            LayoutInflater layoutInflater = LayoutInflater.from(context);
            View peekView = layoutInflater.inflate(R.layout.ws_action_drawer_peek_view, getPeekContainer(), false);
            setPeekContent(peekView);
            this.mPeekActionIcon = (ImageView) peekView.findViewById(R.id.ws_action_drawer_peek_action_icon);
            this.mPeekExpandIcon = (ImageView) peekView.findViewById(R.id.ws_action_drawer_expand_icon);
        } else {
            this.mPeekActionIcon = null;
            this.mPeekExpandIcon = null;
            getPeekContainer().setContentDescription(context.getString(R.string.ws_action_drawer_content_description));
        }
        if (menuRes != 0) {
            MenuInflater inflater = new MenuInflater(context);
            inflater.inflate(menuRes, getMenu());
        }
        int screenWidthPx = ResourcesUtil.getScreenWidthPx(context);
        int screenHeightPx = ResourcesUtil.getScreenHeightPx(context);
        Resources res = getResources();
        this.mTopPadding = res.getDimensionPixelOffset(R.dimen.ws_action_drawer_item_top_padding);
        this.mBottomPadding = res.getDimensionPixelOffset(R.dimen.ws_action_drawer_item_bottom_padding);
        this.mLeftPadding = ResourcesUtil.getFractionOfScreenPx(context, screenWidthPx, R.fraction.ws_action_drawer_item_left_padding);
        this.mRightPadding = ResourcesUtil.getFractionOfScreenPx(context, screenWidthPx, R.fraction.ws_action_drawer_item_right_padding);
        this.mFirstItemTopPadding = ResourcesUtil.getFractionOfScreenPx(context, screenHeightPx, R.fraction.ws_action_drawer_item_first_item_top_padding);
        this.mLastItemBottomPadding = ResourcesUtil.getFractionOfScreenPx(context, screenHeightPx, R.fraction.ws_action_drawer_item_last_item_bottom_padding);
        this.mIconRightMargin = res.getDimensionPixelOffset(R.dimen.ws_action_drawer_item_icon_right_margin);
        this.mActionList = new RecyclerView(context);
        this.mActionList.setId(R.id.action_list);
        this.mActionList.setLayoutManager(new LinearLayoutManager(context));
        this.mActionListAdapter = new ActionListAdapter(getMenu());
        setDrawerContent(this.mActionList);
    }

    @Override // androidx.wear.widget.drawer.WearableDrawerView
    public void onDrawerOpened() {
        RecyclerView.ViewHolder holder;
        setContentIfFirstCall();
        if (this.mActionListAdapter.getItemCount() > 0 && (holder = this.mActionList.findViewHolderForAdapterPosition(0)) != null && holder.itemView != null) {
            holder.itemView.sendAccessibilityEvent(8);
        }
    }

    private void setContentIfFirstCall() {
        if (this.mActionList.getAdapter() == null) {
            this.mActionList.setAdapter(this.mActionListAdapter);
        }
    }

    @Override // android.view.View
    public boolean canScrollHorizontally(int direction) {
        return isOpened();
    }

    @Override // androidx.wear.widget.drawer.WearableDrawerView
    public void onPeekContainerClicked(View v) {
        if (this.mShowOverflowInPeek) {
            super.onPeekContainerClicked(v);
        } else {
            onMenuItemClicked(0);
        }
    }

    @Override // androidx.wear.widget.drawer.WearableDrawerView
    int preferGravity() {
        return 80;
    }

    public void setOnMenuItemClickListener(MenuItem.OnMenuItemClickListener listener) {
        this.mOnMenuItemClickListener = listener;
    }

    public void setTitle(CharSequence title) {
        if (TextUtils.equals(title, this.mTitle)) {
            return;
        }
        CharSequence oldTitle = this.mTitle;
        this.mTitle = title;
        if (oldTitle == null) {
            this.mActionListAdapter.notifyItemInserted(0);
        } else if (title == null) {
            this.mActionListAdapter.notifyItemRemoved(0);
        } else {
            this.mActionListAdapter.notifyItemChanged(0);
        }
    }

    boolean hasTitle() {
        return this.mTitle != null;
    }

    void onMenuItemClicked(int position) {
        if (position >= 0 && position < getMenu().size()) {
            WearableActionDrawerMenu.WearableActionDrawerMenuItem menuItem = (WearableActionDrawerMenu.WearableActionDrawerMenuItem) getMenu().getItem(position);
            if (!menuItem.invoke() && this.mOnMenuItemClickListener != null) {
                this.mOnMenuItemClickListener.onMenuItemClick(menuItem);
            }
        }
    }

    void updatePeekIcons() {
        if (this.mPeekActionIcon == null || this.mPeekExpandIcon == null) {
            return;
        }
        Menu menu = getMenu();
        int numberOfActions = menu.size();
        if (numberOfActions > 1) {
            setDrawerContent(this.mActionList);
            this.mPeekExpandIcon.setVisibility(0);
        } else {
            setDrawerContent(null);
            this.mPeekExpandIcon.setVisibility(8);
        }
        if (numberOfActions >= 1) {
            Drawable firstActionDrawable = menu.getItem(0).getIcon();
            if (firstActionDrawable != null) {
                firstActionDrawable = firstActionDrawable.getConstantState().newDrawable().mutate();
                firstActionDrawable.clearColorFilter();
            }
            this.mPeekActionIcon.setImageDrawable(firstActionDrawable);
            this.mPeekActionIcon.setContentDescription(menu.getItem(0).getTitle());
        }
    }

    public Menu getMenu() {
        if (this.mMenu == null) {
            this.mMenu = new WearableActionDrawerMenu(getContext(), new WearableActionDrawerMenu.WearableActionDrawerMenuListener() { // from class: androidx.wear.widget.drawer.WearableActionDrawerView.1
                @Override // androidx.wear.widget.drawer.WearableActionDrawerMenu.WearableActionDrawerMenuListener
                public void menuItemChanged(int position) {
                    if (WearableActionDrawerView.this.mActionListAdapter != null) {
                        int listPosition = WearableActionDrawerView.this.hasTitle() ? position + 1 : position;
                        WearableActionDrawerView.this.mActionListAdapter.notifyItemChanged(listPosition);
                    }
                    if (position == 0) {
                        WearableActionDrawerView.this.updatePeekIcons();
                    }
                }

                @Override // androidx.wear.widget.drawer.WearableActionDrawerMenu.WearableActionDrawerMenuListener
                public void menuItemAdded(int position) {
                    if (WearableActionDrawerView.this.mActionListAdapter != null) {
                        int listPosition = WearableActionDrawerView.this.hasTitle() ? position + 1 : position;
                        WearableActionDrawerView.this.mActionListAdapter.notifyItemInserted(listPosition);
                    }
                    if (position <= 1) {
                        WearableActionDrawerView.this.updatePeekIcons();
                    }
                }

                @Override // androidx.wear.widget.drawer.WearableActionDrawerMenu.WearableActionDrawerMenuListener
                public void menuItemRemoved(int position) {
                    if (WearableActionDrawerView.this.mActionListAdapter != null) {
                        int listPosition = WearableActionDrawerView.this.hasTitle() ? position + 1 : position;
                        WearableActionDrawerView.this.mActionListAdapter.notifyItemRemoved(listPosition);
                    }
                    if (position <= 1) {
                        WearableActionDrawerView.this.updatePeekIcons();
                    }
                }

                @Override // androidx.wear.widget.drawer.WearableActionDrawerMenu.WearableActionDrawerMenuListener
                public void menuChanged() {
                    if (WearableActionDrawerView.this.mActionListAdapter != null) {
                        WearableActionDrawerView.this.mActionListAdapter.notifyDataSetChanged();
                    }
                    WearableActionDrawerView.this.updatePeekIcons();
                }
            });
        }
        return this.mMenu;
    }

    private static final class TitleViewHolder extends RecyclerView.ViewHolder {
        public final TextView textView;

        TitleViewHolder(View view) {
            super(view);
            this.textView = (TextView) view.findViewById(R.id.ws_action_drawer_title);
        }
    }

    private final class ActionListAdapter extends RecyclerView.Adapter<RecyclerView.ViewHolder> {
        public static final int TYPE_ACTION = 0;
        public static final int TYPE_TITLE = 1;
        private final Menu mActionMenu;
        private final View.OnClickListener mItemClickListener = new View.OnClickListener() { // from class: androidx.wear.widget.drawer.WearableActionDrawerView.ActionListAdapter.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                int childAdapterPosition = WearableActionDrawerView.this.mActionList.getChildAdapterPosition(view) - (WearableActionDrawerView.this.hasTitle() ? 1 : 0);
                if (childAdapterPosition == -1) {
                    Log.w(WearableActionDrawerView.TAG, "invalid child position");
                } else {
                    WearableActionDrawerView.this.onMenuItemClicked(childAdapterPosition);
                }
            }
        };

        ActionListAdapter(Menu menu) {
            this.mActionMenu = WearableActionDrawerView.this.getMenu();
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public int getItemCount() {
            return this.mActionMenu.size() + (WearableActionDrawerView.this.hasTitle() ? 1 : 0);
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public void onBindViewHolder(RecyclerView.ViewHolder viewHolder, int position) {
            int titleAwarePosition = WearableActionDrawerView.this.hasTitle() ? position - 1 : position;
            if (viewHolder instanceof ActionItemViewHolder) {
                ActionItemViewHolder holder = (ActionItemViewHolder) viewHolder;
                View view = holder.view;
                int i = WearableActionDrawerView.this.mLeftPadding;
                WearableActionDrawerView wearableActionDrawerView = WearableActionDrawerView.this;
                view.setPadding(i, position == 0 ? wearableActionDrawerView.mFirstItemTopPadding : wearableActionDrawerView.mTopPadding, WearableActionDrawerView.this.mRightPadding, position == getItemCount() + (-1) ? WearableActionDrawerView.this.mLastItemBottomPadding : WearableActionDrawerView.this.mBottomPadding);
                Drawable icon = this.mActionMenu.getItem(titleAwarePosition).getIcon();
                if (icon != null) {
                    icon = icon.getConstantState().newDrawable().mutate();
                }
                CharSequence title = this.mActionMenu.getItem(titleAwarePosition).getTitle();
                holder.textView.setText(title);
                holder.textView.setContentDescription(title);
                holder.iconView.setImageDrawable(icon);
                return;
            }
            if (viewHolder instanceof TitleViewHolder) {
                TitleViewHolder holder2 = (TitleViewHolder) viewHolder;
                holder2.textView.setPadding(0, WearableActionDrawerView.this.mFirstItemTopPadding, 0, WearableActionDrawerView.this.mBottomPadding);
                holder2.textView.setText(WearableActionDrawerView.this.mTitle);
            }
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public RecyclerView.ViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            switch (viewType) {
                case 1:
                    View titleView = LayoutInflater.from(parent.getContext()).inflate(R.layout.ws_action_drawer_title_view, parent, false);
                    return new TitleViewHolder(titleView);
                default:
                    View actionView = LayoutInflater.from(parent.getContext()).inflate(R.layout.ws_action_drawer_item_view, parent, false);
                    actionView.setOnClickListener(this.mItemClickListener);
                    return WearableActionDrawerView.this.new ActionItemViewHolder(actionView);
            }
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return (WearableActionDrawerView.this.hasTitle() && position == 0) ? 1 : 0;
        }
    }

    private final class ActionItemViewHolder extends RecyclerView.ViewHolder {
        public final ImageView iconView;
        public final TextView textView;
        public final View view;

        ActionItemViewHolder(View view) {
            super(view);
            this.view = view;
            this.iconView = (ImageView) view.findViewById(R.id.ws_action_drawer_item_icon);
            ((LinearLayout.LayoutParams) this.iconView.getLayoutParams()).setMarginEnd(WearableActionDrawerView.this.mIconRightMargin);
            this.textView = (TextView) view.findViewById(R.id.ws_action_drawer_item_text);
        }
    }
}
