package androidx.wear.utils;

import android.R;
import android.content.Context;
import android.content.res.TypedArray;
import android.provider.Settings;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/* JADX INFO: loaded from: classes.dex */
public final class ActivityAnimationUtil {
    private static final int[] ACTIVITY_ANIMATION_ATTRS = {R.attr.activityCloseEnterAnimation, R.attr.activityCloseExitAnimation, R.attr.activityOpenEnterAnimation, R.attr.activityOpenExitAnimation};
    public static final int CLOSE_ENTER = 0;
    public static final int CLOSE_EXIT = 1;
    public static final int OPEN_ENTER = 2;
    public static final int OPEN_EXIT = 3;

    @Retention(RetentionPolicy.SOURCE)
    public @interface ActivityAnimationType {
    }

    private ActivityAnimationUtil() {
    }

    public static Animation getStandardActivityAnimation(Context context, int animationType, boolean scaled) {
        TypedArray animations = context.obtainStyledAttributes(R.style.Animation.Activity, new int[]{ACTIVITY_ANIMATION_ATTRS[animationType]});
        Animation animation = null;
        if (animations.getIndexCount() > 0) {
            animation = AnimationUtils.loadAnimation(context, animations.getResourceId(0, 0));
            if (scaled) {
                float scale = Settings.Global.getInt(context.getContentResolver(), "transition_animation_scale", 1);
                animation.scaleCurrentDuration(scale);
            }
        }
        animations.recycle();
        return animation;
    }
}
