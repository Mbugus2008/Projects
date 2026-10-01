package androidx.wear.widget.drawer;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import androidx.core.view.ViewCompat;
import androidx.wear.R;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* JADX INFO: loaded from: classes.dex */
public class WearableDrawerView extends FrameLayout {
    public static final int STATE_DRAGGING = 1;
    public static final int STATE_IDLE = 0;
    public static final int STATE_SETTLING = 2;
    private boolean mCanAutoPeek;
    private View mContent;
    private int mContentResId;
    private WearableDrawerController mController;
    private int mDrawerState;
    private boolean mIsLocked;
    private boolean mIsPeeking;
    private boolean mLockWhenClosed;
    private boolean mOpenOnlyAtTop;
    private float mOpenedPercent;
    private final ViewGroup mPeekContainer;
    private final ImageView mPeekIcon;
    private boolean mPeekOnScrollDown;
    private int mPeekResId;

    @Retention(RetentionPolicy.SOURCE)
    public @interface DrawerState {
    }

    public WearableDrawerView(Context context) {
        this(context, null);
    }

    public WearableDrawerView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public WearableDrawerView(Context context, AttributeSet attrs, int defStyleAttr) {
        this(context, attrs, defStyleAttr, 0);
    }

    public WearableDrawerView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mIsLocked = false;
        this.mCanAutoPeek = true;
        this.mLockWhenClosed = false;
        this.mOpenOnlyAtTop = false;
        this.mPeekOnScrollDown = false;
        this.mPeekResId = 0;
        this.mContentResId = 0;
        LayoutInflater.from(context).inflate(R.layout.ws_wearable_drawer_view, (ViewGroup) this, true);
        setClickable(true);
        setElevation(context.getResources().getDimension(R.dimen.ws_wearable_drawer_view_elevation));
        this.mPeekContainer = (ViewGroup) findViewById(R.id.ws_drawer_view_peek_container);
        this.mPeekIcon = (ImageView) findViewById(R.id.ws_drawer_view_peek_icon);
        this.mPeekContainer.setOnClickListener(new View.OnClickListener() { // from class: androidx.wear.widget.drawer.WearableDrawerView.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                WearableDrawerView.this.onPeekContainerClicked(v);
            }
        });
        parseAttributes(context, attrs, defStyleAttr);
    }

    private static Drawable getDrawable(Context context, TypedArray typedArray, int index) {
        int backgroundResId = typedArray.getResourceId(index, 0);
        if (backgroundResId == 0) {
            Drawable background = typedArray.getDrawable(index);
            return background;
        }
        Drawable background2 = context.getDrawable(backgroundResId);
        return background2;
    }

    @Override // android.view.View
    protected void onFinishInflate() {
        super.onFinishInflate();
        this.mPeekContainer.bringToFront();
    }

    public void onPeekContainerClicked(View v) {
        this.mController.openDrawer();
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        FrameLayout.LayoutParams peekParams = (FrameLayout.LayoutParams) this.mPeekContainer.getLayoutParams();
        if (!Gravity.isVertical(peekParams.gravity)) {
            boolean isTopDrawer = (((FrameLayout.LayoutParams) getLayoutParams()).gravity & 112) == 48;
            if (isTopDrawer) {
                peekParams.gravity = 80;
                this.mPeekIcon.setImageResource(R.drawable.ws_ic_more_horiz_24dp_wht);
            } else {
                peekParams.gravity = 48;
                this.mPeekIcon.setImageResource(R.drawable.ws_ic_more_vert_24dp_wht);
            }
            this.mPeekContainer.setLayoutParams(peekParams);
        }
    }

    @Override // android.view.ViewGroup
    public void addView(View child, int index, ViewGroup.LayoutParams params) {
        int childId = child.getId();
        if (childId != 0) {
            if (childId == this.mPeekResId) {
                setPeekContent(child, index, params);
                return;
            } else if (childId == this.mContentResId && !setDrawerContentWithoutAdding(child)) {
                return;
            }
        }
        super.addView(child, index, params);
    }

    int preferGravity() {
        return 0;
    }

    ViewGroup getPeekContainer() {
        return this.mPeekContainer;
    }

    void setDrawerController(WearableDrawerController controller) {
        this.mController = controller;
    }

    public View getDrawerContent() {
        return this.mContent;
    }

    public void setDrawerContent(View content) {
        if (setDrawerContentWithoutAdding(content)) {
            addView(content);
        }
    }

    public void setPeekContent(View content) {
        ViewGroup.LayoutParams layoutParams = content.getLayoutParams();
        setPeekContent(content, -1, layoutParams != null ? layoutParams : generateDefaultLayoutParams());
    }

    public void onDrawerOpened() {
    }

    public void onDrawerClosed() {
    }

    public void onDrawerStateChanged(int state) {
    }

    public void setOpenOnlyAtTopEnabled(boolean openOnlyAtTop) {
        this.mOpenOnlyAtTop = openOnlyAtTop;
    }

    public boolean isOpenOnlyAtTopEnabled() {
        return this.mOpenOnlyAtTop;
    }

    public void setPeekOnScrollDownEnabled(boolean peekOnScrollDown) {
        this.mPeekOnScrollDown = peekOnScrollDown;
    }

    public boolean isPeekOnScrollDownEnabled() {
        return this.mPeekOnScrollDown;
    }

    public void setLockedWhenClosed(boolean locked) {
        this.mLockWhenClosed = locked;
    }

    public boolean isLockedWhenClosed() {
        return this.mLockWhenClosed;
    }

    public int getDrawerState() {
        return this.mDrawerState;
    }

    void setDrawerState(int drawerState) {
        this.mDrawerState = drawerState;
    }

    public boolean isPeeking() {
        return this.mIsPeeking;
    }

    public boolean isAutoPeekEnabled() {
        return this.mCanAutoPeek && !this.mIsLocked;
    }

    public void setIsAutoPeekEnabled(boolean canAutoPeek) {
        this.mCanAutoPeek = canAutoPeek;
    }

    public boolean isLocked() {
        return this.mIsLocked || (isLockedWhenClosed() && this.mOpenedPercent <= 0.0f);
    }

    public void setIsLocked(boolean locked) {
        this.mIsLocked = locked;
    }

    public boolean isOpened() {
        return this.mOpenedPercent == 1.0f;
    }

    public boolean isClosed() {
        return this.mOpenedPercent == 0.0f;
    }

    public WearableDrawerController getController() {
        return this.mController;
    }

    void setIsPeeking(boolean isPeeking) {
        this.mIsPeeking = isPeeking;
    }

    float getOpenedPercent() {
        return this.mOpenedPercent;
    }

    void setOpenedPercent(float openedPercent) {
        this.mOpenedPercent = openedPercent;
    }

    private void parseAttributes(Context context, AttributeSet attrs, int defStyleAttr) {
        if (attrs == null) {
            return;
        }
        TypedArray typedArray = context.obtainStyledAttributes(attrs, R.styleable.WearableDrawerView, defStyleAttr, R.style.Widget_Wear_WearableDrawerView);
        ViewCompat.saveAttributeDataForStyleable(this, context, R.styleable.WearableDrawerView, attrs, typedArray, defStyleAttr, R.style.Widget_Wear_WearableDrawerView);
        Drawable background = getDrawable(context, typedArray, R.styleable.WearableDrawerView_android_background);
        int elevation = typedArray.getDimensionPixelSize(R.styleable.WearableDrawerView_android_elevation, 0);
        setBackground(background);
        setElevation(elevation);
        this.mContentResId = typedArray.getResourceId(R.styleable.WearableDrawerView_drawerContent, 0);
        this.mPeekResId = typedArray.getResourceId(R.styleable.WearableDrawerView_peekView, 0);
        this.mCanAutoPeek = typedArray.getBoolean(R.styleable.WearableDrawerView_enableAutoPeek, this.mCanAutoPeek);
        typedArray.recycle();
    }

    private void setPeekContent(View content, int index, ViewGroup.LayoutParams params) {
        if (content == null) {
            return;
        }
        if (this.mPeekContainer.getChildCount() > 0) {
            this.mPeekContainer.removeAllViews();
        }
        this.mPeekContainer.addView(content, index, params);
    }

    private boolean setDrawerContentWithoutAdding(View content) {
        if (content == this.mContent) {
            return false;
        }
        if (this.mContent != null) {
            removeView(this.mContent);
        }
        this.mContent = content;
        return this.mContent != null;
    }
}
