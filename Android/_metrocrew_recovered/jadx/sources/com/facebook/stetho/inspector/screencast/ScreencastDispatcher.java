package com.facebook.stetho.inspector.screencast;

import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.util.Base64OutputStream;
import android.view.View;
import com.facebook.stetho.common.LogUtil;
import com.facebook.stetho.inspector.elements.android.ActivityTracker;
import com.facebook.stetho.inspector.jsonrpc.JsonRpcPeer;
import com.facebook.stetho.inspector.protocol.module.Page;
import java.io.ByteArrayOutputStream;

/* JADX INFO: loaded from: classes.dex */
public final class ScreencastDispatcher {
    private static final long FRAME_DELAY = 200;
    private Handler mBackgroundHandler;
    private Bitmap mBitmap;
    private final BitmapFetchRunnable mBitmapFetchRunnable;
    private Canvas mCanvas;
    private final EventDispatchRunnable mEventDispatchRunnable;
    private HandlerThread mHandlerThread;
    private boolean mIsRunning;
    private JsonRpcPeer mPeer;
    private Page.StartScreencastRequest mRequest;
    private ByteArrayOutputStream mStream;
    private final Handler mMainHandler = new Handler(Looper.getMainLooper());
    private final ActivityTracker mActivityTracker = ActivityTracker.get();
    private final RectF mTempSrc = new RectF();
    private final RectF mTempDst = new RectF();
    private Page.ScreencastFrameEvent mEvent = new Page.ScreencastFrameEvent();
    private Page.ScreencastFrameEventMetadata mMetadata = new Page.ScreencastFrameEventMetadata();

    public ScreencastDispatcher() {
        this.mBitmapFetchRunnable = new BitmapFetchRunnable();
        this.mEventDispatchRunnable = new EventDispatchRunnable();
    }

    public void startScreencast(JsonRpcPeer peer, Page.StartScreencastRequest request) {
        LogUtil.d("Starting screencast");
        this.mRequest = request;
        this.mHandlerThread = new HandlerThread("Screencast Thread");
        this.mHandlerThread.start();
        this.mPeer = peer;
        this.mIsRunning = true;
        this.mStream = new ByteArrayOutputStream();
        this.mBackgroundHandler = new Handler(this.mHandlerThread.getLooper());
        this.mMainHandler.postDelayed(this.mBitmapFetchRunnable, FRAME_DELAY);
    }

    public void stopScreencast() {
        LogUtil.d("Stopping screencast");
        this.mBackgroundHandler.post(new CancellationRunnable());
    }

    private class BitmapFetchRunnable implements Runnable {
        private BitmapFetchRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            updateScreenBitmap();
            ScreencastDispatcher.this.mBackgroundHandler.post(ScreencastDispatcher.this.mEventDispatchRunnable.withEndAction(this));
        }

        private void updateScreenBitmap() {
            Activity activity;
            if (!ScreencastDispatcher.this.mIsRunning || (activity = ScreencastDispatcher.this.mActivityTracker.tryGetTopActivity()) == null) {
                return;
            }
            View rootView = activity.getWindow().getDecorView();
            try {
                if (ScreencastDispatcher.this.mBitmap == null) {
                    int viewWidth = rootView.getWidth();
                    int viewHeight = rootView.getHeight();
                    float scale = Math.min(ScreencastDispatcher.this.mRequest.maxWidth / viewWidth, ScreencastDispatcher.this.mRequest.maxHeight / viewHeight);
                    int destWidth = (int) (viewWidth * scale);
                    int destHeight = (int) (viewHeight * scale);
                    ScreencastDispatcher.this.mBitmap = Bitmap.createBitmap(destWidth, destHeight, Bitmap.Config.RGB_565);
                    ScreencastDispatcher.this.mCanvas = new Canvas(ScreencastDispatcher.this.mBitmap);
                    Matrix matrix = new Matrix();
                    ScreencastDispatcher.this.mTempSrc.set(0.0f, 0.0f, viewWidth, viewHeight);
                    ScreencastDispatcher.this.mTempDst.set(0.0f, 0.0f, destWidth, destHeight);
                    matrix.setRectToRect(ScreencastDispatcher.this.mTempSrc, ScreencastDispatcher.this.mTempDst, Matrix.ScaleToFit.CENTER);
                    ScreencastDispatcher.this.mCanvas.setMatrix(matrix);
                }
                rootView.draw(ScreencastDispatcher.this.mCanvas);
            } catch (OutOfMemoryError e) {
                LogUtil.w("Out of memory trying to allocate screencast Bitmap.");
            }
        }
    }

    private class EventDispatchRunnable implements Runnable {
        private Runnable mEndAction;

        private EventDispatchRunnable() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public EventDispatchRunnable withEndAction(Runnable endAction) {
            this.mEndAction = endAction;
            return this;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (ScreencastDispatcher.this.mIsRunning && ScreencastDispatcher.this.mBitmap != null) {
                int width = ScreencastDispatcher.this.mBitmap.getWidth();
                int height = ScreencastDispatcher.this.mBitmap.getHeight();
                ScreencastDispatcher.this.mStream.reset();
                Base64OutputStream base64Stream = new Base64OutputStream(ScreencastDispatcher.this.mStream, 0);
                Bitmap.CompressFormat format = Bitmap.CompressFormat.valueOf(ScreencastDispatcher.this.mRequest.format.toUpperCase());
                ScreencastDispatcher.this.mBitmap.compress(format, ScreencastDispatcher.this.mRequest.quality, base64Stream);
                ScreencastDispatcher.this.mEvent.data = ScreencastDispatcher.this.mStream.toString();
                ScreencastDispatcher.this.mMetadata.pageScaleFactor = 1;
                ScreencastDispatcher.this.mMetadata.deviceWidth = width;
                ScreencastDispatcher.this.mMetadata.deviceHeight = height;
                ScreencastDispatcher.this.mEvent.metadata = ScreencastDispatcher.this.mMetadata;
                ScreencastDispatcher.this.mPeer.invokeMethod("Page.screencastFrame", ScreencastDispatcher.this.mEvent, null);
                ScreencastDispatcher.this.mMainHandler.postDelayed(this.mEndAction, ScreencastDispatcher.FRAME_DELAY);
            }
        }
    }

    private class CancellationRunnable implements Runnable {
        private CancellationRunnable() {
        }

        @Override // java.lang.Runnable
        public void run() {
            ScreencastDispatcher.this.mHandlerThread.interrupt();
            ScreencastDispatcher.this.mMainHandler.removeCallbacks(ScreencastDispatcher.this.mBitmapFetchRunnable);
            ScreencastDispatcher.this.mBackgroundHandler.removeCallbacks(ScreencastDispatcher.this.mEventDispatchRunnable);
            ScreencastDispatcher.this.mIsRunning = false;
            ScreencastDispatcher.this.mHandlerThread = null;
            ScreencastDispatcher.this.mBitmap = null;
            ScreencastDispatcher.this.mCanvas = null;
            ScreencastDispatcher.this.mStream = null;
        }
    }
}
