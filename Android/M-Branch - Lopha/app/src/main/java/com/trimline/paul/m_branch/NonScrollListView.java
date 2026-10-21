package com.trimline.paul.m_branch;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.ListView;

/**
 * ListView that measures itself to fit all of its rows, so it can live inside a
 * scrolling page instead of scrolling on its own.
 */
public class NonScrollListView extends ListView {

    public NonScrollListView(Context context) {
        super(context);
    }

    public NonScrollListView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public NonScrollListView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @Override
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int expandSpec = MeasureSpec.makeMeasureSpec(Integer.MAX_VALUE >> 2, MeasureSpec.AT_MOST);
        super.onMeasure(widthMeasureSpec, expandSpec);
        int width = getMeasuredWidth();
        int height = Math.max(getSuggestedMinimumHeight(), getMeasuredHeight());
        setMeasuredDimension(width, height);
    }
}
