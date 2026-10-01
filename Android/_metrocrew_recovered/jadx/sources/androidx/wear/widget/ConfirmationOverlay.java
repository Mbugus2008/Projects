package androidx.wear.widget;

import android.R;
import android.app.Activity;
import android.content.Context;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.os.Looper;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityManager;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.core.content.ContextCompat;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.Locale;

/* JADX INFO: loaded from: classes.dex */
public class ConfirmationOverlay {
    private static final int A11Y_ANIMATION_DURATION_MS = 5000;
    public static final int DEFAULT_ANIMATION_DURATION_MS = 1000;
    public static final int FAILURE_ANIMATION = 1;
    public static final int OPEN_ON_PHONE_ANIMATION = 2;
    public static final int SUCCESS_ANIMATION = 0;
    OnAnimationFinishedListener mListener;
    private Drawable mOverlayDrawable;
    View mOverlayView;
    private int mType = 0;
    private int mDurationMillis = 1000;
    private CharSequence mMessage = "";
    boolean mIsShowing = false;
    private final Handler mMainThreadHandler = new Handler(Looper.getMainLooper());
    private final Runnable mHideRunnable = new Runnable() { // from class: androidx.wear.widget.ConfirmationOverlay.1
        @Override // java.lang.Runnable
        public void run() {
            ConfirmationOverlay.this.hide();
        }
    };

    public interface OnAnimationFinishedListener {
        void onAnimationFinished();
    }

    @Retention(RetentionPolicy.SOURCE)
    public @interface OverlayType {
    }

    @Deprecated
    public ConfirmationOverlay setMessage(String message) {
        this.mMessage = message;
        return this;
    }

    public ConfirmationOverlay setMessage(CharSequence message) {
        this.mMessage = message;
        return this;
    }

    public ConfirmationOverlay setType(int type) {
        this.mType = type;
        return this;
    }

    public ConfirmationOverlay setDuration(int millis) {
        this.mDurationMillis = millis;
        return this;
    }

    @Deprecated
    public ConfirmationOverlay setFinishedAnimationListener(OnAnimationFinishedListener listener) {
        this.mListener = listener;
        return this;
    }

    public ConfirmationOverlay setOnAnimationFinishedListener(OnAnimationFinishedListener listener) {
        this.mListener = listener;
        return this;
    }

    public void showAbove(View view) {
        if (this.mIsShowing) {
            return;
        }
        this.mIsShowing = true;
        updateOverlayView(view.getContext());
        ((ViewGroup) view.getRootView()).addView(this.mOverlayView);
        setUpForAccessibility();
        animateAndHideAfterDelay();
    }

    public void showOn(Activity activity) {
        if (this.mIsShowing) {
            return;
        }
        this.mIsShowing = true;
        updateOverlayView(activity);
        activity.getWindow().addContentView(this.mOverlayView, this.mOverlayView.getLayoutParams());
        setUpForAccessibility();
        animateAndHideAfterDelay();
    }

    private void setUpForAccessibility() {
        this.mOverlayView.setContentDescription(getAccessibilityText());
        this.mOverlayView.requestFocus();
        this.mOverlayView.sendAccessibilityEvent(8);
    }

    private int getDurationMillis() {
        if (((AccessibilityManager) this.mOverlayView.getContext().getSystemService(AccessibilityManager.class)).isEnabled()) {
            return Math.max(A11Y_ANIMATION_DURATION_MS, this.mDurationMillis);
        }
        return this.mDurationMillis;
    }

    private void animateAndHideAfterDelay() {
        if (this.mOverlayDrawable instanceof Animatable) {
            Animatable animatable = (Animatable) this.mOverlayDrawable;
            animatable.start();
        }
        this.mMainThreadHandler.postDelayed(this.mHideRunnable, getDurationMillis());
    }

    public void hide() {
        Animation fadeOut = AnimationUtils.loadAnimation(this.mOverlayView.getContext(), R.anim.fade_out);
        fadeOut.setAnimationListener(new Animation.AnimationListener() { // from class: androidx.wear.widget.ConfirmationOverlay.2
            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationStart(Animation animation) {
                ConfirmationOverlay.this.mOverlayView.clearAnimation();
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationEnd(Animation animation) {
                ((ViewGroup) ConfirmationOverlay.this.mOverlayView.getParent()).removeView(ConfirmationOverlay.this.mOverlayView);
                ConfirmationOverlay.this.mIsShowing = false;
                if (ConfirmationOverlay.this.mListener != null) {
                    ConfirmationOverlay.this.mListener.onAnimationFinished();
                }
                ConfirmationOverlay.this.mOverlayView.clearFocus();
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationRepeat(Animation animation) {
            }
        });
        this.mOverlayView.startAnimation(fadeOut);
    }

    private void updateOverlayView(Context context) {
        if (this.mOverlayView == null) {
            this.mOverlayView = LayoutInflater.from(context).inflate(androidx.wear.R.layout.ws_overlay_confirmation, (ViewGroup) null);
        }
        this.mOverlayView.setOnTouchListener(new View.OnTouchListener() { // from class: androidx.wear.widget.ConfirmationOverlay.3
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View v, MotionEvent event) {
                return true;
            }
        });
        this.mOverlayView.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        updateImageView(context, this.mOverlayView);
        updateMessageView(context, this.mOverlayView);
    }

    private void updateMessageView(Context context, View overlayView) {
        TextView messageView = (TextView) overlayView.findViewById(androidx.wear.R.id.wearable_support_confirmation_overlay_message);
        int screenWidthPx = ResourcesUtil.getScreenWidthPx(context);
        int insetMarginPx = ResourcesUtil.getFractionOfScreenPx(context, screenWidthPx, androidx.wear.R.fraction.confirmation_overlay_text_inset_margin);
        ViewGroup.MarginLayoutParams layoutParams = (ViewGroup.MarginLayoutParams) messageView.getLayoutParams();
        layoutParams.leftMargin = insetMarginPx;
        layoutParams.rightMargin = insetMarginPx;
        messageView.setLayoutParams(layoutParams);
        messageView.setText(this.mMessage);
        messageView.setVisibility(0);
    }

    private void updateImageView(Context context, View overlayView) {
        switch (this.mType) {
            case 0:
                this.mOverlayDrawable = ContextCompat.getDrawable(context, androidx.wear.R.drawable.confirmation_animation);
                break;
            case 1:
                this.mOverlayDrawable = ContextCompat.getDrawable(context, androidx.wear.R.drawable.failure_animation);
                break;
            case 2:
                this.mOverlayDrawable = ContextCompat.getDrawable(context, androidx.wear.R.drawable.open_on_phone_animation);
                break;
            default:
                String errorMessage = String.format(Locale.US, "Invalid ConfirmationOverlay type [%d]", Integer.valueOf(this.mType));
                throw new IllegalStateException(errorMessage);
        }
        ImageView imageView = (ImageView) overlayView.findViewById(androidx.wear.R.id.wearable_support_confirmation_overlay_image);
        imageView.setImageDrawable(this.mOverlayDrawable);
    }

    private CharSequence getAccessibilityText() {
        if (!this.mMessage.toString().isEmpty()) {
            return this.mMessage;
        }
        Context context = this.mOverlayView.getContext();
        switch (this.mType) {
            case 0:
                CharSequence imageDescription = context.getString(androidx.wear.R.string.confirmation_overlay_a11y_description_success);
                return imageDescription;
            case 1:
                CharSequence imageDescription2 = context.getString(androidx.wear.R.string.confirmation_overlay_a11y_description_fail);
                return imageDescription2;
            case 2:
                CharSequence imageDescription3 = context.getString(androidx.wear.R.string.confirmation_overlay_a11y_description_phone);
                return imageDescription3;
            default:
                String errorMessage = String.format(Locale.US, "Invalid ConfirmationOverlay type [%d]", Integer.valueOf(this.mType));
                throw new IllegalStateException(errorMessage);
        }
    }
}
