package com.facebook.stetho.inspector.elements.android;

import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import com.facebook.stetho.common.Util;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import javax.annotation.Nullable;

/* JADX INFO: loaded from: classes.dex */
abstract class ViewHighlighter {
    public abstract void clearHighlight();

    public abstract void setHighlightedView(View view, @Nullable Rect rect, int i);

    public static ViewHighlighter newInstance() {
        return new OverlayHighlighter();
    }

    protected ViewHighlighter() {
    }

    private static final class NoopHighlighter extends ViewHighlighter {
        private NoopHighlighter() {
        }

        @Override // com.facebook.stetho.inspector.elements.android.ViewHighlighter
        public void clearHighlight() {
        }

        @Override // com.facebook.stetho.inspector.elements.android.ViewHighlighter
        public void setHighlightedView(View view, @Nullable Rect bounds, int color) {
        }
    }

    private static final class OverlayHighlighter extends ViewHighlighter {
        private View mHighlightedView;
        private final ViewHighlightOverlays mHighlightOverlays = ViewHighlightOverlays.newInstance();
        private final Rect mHighlightedBounds = new Rect();
        private final Rect mEmptyRect = new Rect();
        private AtomicReference<View> mViewToHighlight = new AtomicReference<>();
        private AtomicReference<Rect> mBoundsToHighlight = new AtomicReference<>();
        private AtomicInteger mContentColor = new AtomicInteger();
        private final Runnable mHighlightViewOnUiThreadRunnable = new Runnable() { // from class: com.facebook.stetho.inspector.elements.android.ViewHighlighter.OverlayHighlighter.1
            @Override // java.lang.Runnable
            public void run() {
                OverlayHighlighter.this.highlightViewOnUiThread();
            }
        };
        private final Handler mHandler = new Handler(Looper.getMainLooper());

        @Override // com.facebook.stetho.inspector.elements.android.ViewHighlighter
        public void clearHighlight() {
            setHighlightedViewImpl(null, null, 0);
        }

        @Override // com.facebook.stetho.inspector.elements.android.ViewHighlighter
        public void setHighlightedView(View view, @Nullable Rect bounds, int color) {
            setHighlightedViewImpl((View) Util.throwIfNull(view), bounds, color);
        }

        private void setHighlightedViewImpl(@Nullable View view, @Nullable Rect bounds, int color) {
            this.mHandler.removeCallbacks(this.mHighlightViewOnUiThreadRunnable);
            this.mViewToHighlight.set(view);
            this.mBoundsToHighlight.set(bounds);
            this.mContentColor.set(color);
            this.mHandler.postDelayed(this.mHighlightViewOnUiThreadRunnable, 100L);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void highlightViewOnUiThread() {
            View viewToHighlight = this.mViewToHighlight.getAndSet(null);
            Rect boundsToHighlight = this.mBoundsToHighlight.getAndSet(null);
            if (boundsToHighlight == null) {
                boundsToHighlight = this.mEmptyRect;
            }
            if (viewToHighlight == this.mHighlightedView && this.mHighlightedBounds.equals(boundsToHighlight)) {
                return;
            }
            if (this.mHighlightedView != null) {
                this.mHighlightOverlays.removeHighlight(this.mHighlightedView);
            }
            if (viewToHighlight != null) {
                this.mHighlightOverlays.highlightView(viewToHighlight, boundsToHighlight, this.mContentColor.get());
            }
            this.mHighlightedView = viewToHighlight;
            if (boundsToHighlight == null) {
                this.mHighlightedBounds.setEmpty();
            } else {
                this.mHighlightedBounds.set(boundsToHighlight);
            }
        }
    }
}
