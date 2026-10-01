package androidx.wear.widget;

import android.content.Context;

/* JADX INFO: loaded from: classes.dex */
class DismissController {
    protected final Context mContext;
    protected OnDismissListener mDismissListener;
    protected final DismissibleFrameLayout mLayout;

    interface OnDismissListener {
        void onDismissCanceled();

        void onDismissStarted();

        void onDismissed();
    }

    DismissController(Context context, DismissibleFrameLayout layout) {
        this.mContext = context;
        this.mLayout = layout;
    }

    void setOnDismissListener(OnDismissListener listener) {
        this.mDismissListener = listener;
    }
}
