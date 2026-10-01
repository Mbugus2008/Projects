package androidx.wear.widget;

import android.content.Context;
import android.view.KeyEvent;
import android.view.View;
import android.view.animation.Animation;
import androidx.wear.utils.ActivityAnimationUtil;

/* JADX INFO: loaded from: classes.dex */
class BackButtonDismissController extends DismissController {
    BackButtonDismissController(Context context, DismissibleFrameLayout layout) {
        super(context, layout);
        layout.setFocusableInTouchMode(true);
        layout.requestFocus();
        layout.setOnKeyListener(new View.OnKeyListener() { // from class: androidx.wear.widget.BackButtonDismissController$$ExternalSyntheticLambda0
            @Override // android.view.View.OnKeyListener
            public final boolean onKey(View view, int i, KeyEvent keyEvent) {
                return this.f$0.m297lambda$new$0$androidxwearwidgetBackButtonDismissController(view, i, keyEvent);
            }
        });
    }

    /* JADX INFO: renamed from: lambda$new$0$androidx-wear-widget-BackButtonDismissController, reason: not valid java name */
    /* synthetic */ boolean m297lambda$new$0$androidxwearwidgetBackButtonDismissController(View view, int keyCode, KeyEvent event) {
        return keyCode == 4 && event.getAction() == 1 && dismiss();
    }

    void disable(DismissibleFrameLayout layout) {
        setOnDismissListener(null);
        layout.setOnKeyListener(null);
        layout.setFocusable(false);
        layout.clearFocus();
    }

    private boolean dismiss() {
        if (this.mDismissListener == null) {
            return false;
        }
        Animation exitAnimation = ActivityAnimationUtil.getStandardActivityAnimation(this.mContext, 1, true);
        if (exitAnimation != null) {
            exitAnimation.setAnimationListener(new Animation.AnimationListener() { // from class: androidx.wear.widget.BackButtonDismissController.1
                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationStart(Animation animation) {
                    BackButtonDismissController.this.mDismissListener.onDismissStarted();
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationRepeat(Animation animation) {
                }

                @Override // android.view.animation.Animation.AnimationListener
                public void onAnimationEnd(Animation animation) {
                    BackButtonDismissController.this.mDismissListener.onDismissed();
                }
            });
            this.mLayout.startAnimation(exitAnimation);
        } else {
            this.mDismissListener.onDismissStarted();
            this.mDismissListener.onDismissed();
        }
        return true;
    }
}
