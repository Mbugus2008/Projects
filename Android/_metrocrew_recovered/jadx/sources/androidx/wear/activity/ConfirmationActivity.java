package androidx.wear.activity;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.SparseIntArray;
import androidx.wear.R;
import androidx.wear.widget.ConfirmationOverlay;

/* JADX INFO: loaded from: classes.dex */
public class ConfirmationActivity extends Activity {
    private static final SparseIntArray CONFIRMATION_OVERLAY_TYPES = new SparseIntArray();
    static final int DEFAULT_ANIMATION_DURATION_MILLIS = 1000;
    public static final String EXTRA_ANIMATION_DURATION_MILLIS = "androidx.wear.activity.extra.ANIMATION_DURATION_MILLIS";
    public static final String EXTRA_ANIMATION_TYPE = "androidx.wear.activity.extra.ANIMATION_TYPE";
    public static final String EXTRA_MESSAGE = "androidx.wear.activity.extra.MESSAGE";
    public static final int FAILURE_ANIMATION = 3;
    public static final int OPEN_ON_PHONE_ANIMATION = 2;
    public static final int SUCCESS_ANIMATION = 1;

    static {
        CONFIRMATION_OVERLAY_TYPES.append(1, 0);
        CONFIRMATION_OVERLAY_TYPES.append(2, 2);
        CONFIRMATION_OVERLAY_TYPES.append(3, 1);
    }

    @Override // android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setTheme(R.style.ConfirmationActivity);
        Intent intent = getIntent();
        int requestedType = intent.getIntExtra(EXTRA_ANIMATION_TYPE, 1);
        int animationDurationMillis = intent.getIntExtra(EXTRA_ANIMATION_DURATION_MILLIS, 1000);
        if (CONFIRMATION_OVERLAY_TYPES.indexOfKey(requestedType) < 0) {
            throw new IllegalArgumentException("Unknown type of animation: " + requestedType);
        }
        int type = CONFIRMATION_OVERLAY_TYPES.get(requestedType);
        CharSequence message = intent.getStringExtra(EXTRA_MESSAGE);
        if (message == null) {
            message = "";
        }
        new ConfirmationOverlay().setType(type).setMessage(message).setDuration(animationDurationMillis).setOnAnimationFinishedListener(new ConfirmationOverlay.OnAnimationFinishedListener() { // from class: androidx.wear.activity.ConfirmationActivity.1
            @Override // androidx.wear.widget.ConfirmationOverlay.OnAnimationFinishedListener
            public void onAnimationFinished() {
                ConfirmationActivity.this.onAnimationFinished();
            }
        }).showOn(this);
    }

    protected void onAnimationFinished() {
        finish();
    }
}
