package com.openvalley.afrecash.utils;

import android.content.Context;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.widget.TextView;

/**
 * Created by @GeekNat on 7/15/17.
 * All is possible
 */

public class ScrollableTextView extends TextView {

    public ScrollableTextView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init();
        rotate();
    }

    public ScrollableTextView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
        rotate();
    }

    public ScrollableTextView(Context context) {
        super(context);
        init();
        rotate();
    }

    private void rotate() {
        setEllipsize(TextUtils.TruncateAt.MARQUEE);
        setSingleLine(true);
        setMarqueeRepeatLimit(-1);
        setFocusableInTouchMode(true);
        setFocusable(true);
        setSelected(true);
    }

    private void init() {
        if (!isInEditMode()) {

        }
    }


}

