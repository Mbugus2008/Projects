package androidx.wear.widget;

import android.os.CountDownTimer;

/* JADX INFO: loaded from: classes.dex */
class CircularProgressLayoutController {
    private boolean mIsIndeterminate;
    boolean mIsTimerRunning;
    final CircularProgressLayout mLayout;
    CircularProgressLayout.OnTimerFinishedListener mOnTimerFinishedListener;
    CountDownTimer mTimer;

    CircularProgressLayoutController(CircularProgressLayout layout) {
        this.mLayout = layout;
    }

    public CircularProgressLayout.OnTimerFinishedListener getOnTimerFinishedListener() {
        return this.mOnTimerFinishedListener;
    }

    public void setOnTimerFinishedListener(CircularProgressLayout.OnTimerFinishedListener listener) {
        this.mOnTimerFinishedListener = listener;
    }

    boolean isIndeterminate() {
        return this.mIsIndeterminate;
    }

    boolean isTimerRunning() {
        return this.mIsTimerRunning;
    }

    void setIndeterminate(boolean indeterminate) {
        if (this.mIsIndeterminate == indeterminate) {
            return;
        }
        this.mIsIndeterminate = indeterminate;
        if (this.mIsIndeterminate) {
            if (this.mIsTimerRunning) {
                stopTimer();
            }
            this.mLayout.getProgressDrawable().start();
            return;
        }
        this.mLayout.getProgressDrawable().stop();
    }

    void startTimer(long totalTime, long updateInterval) {
        reset();
        this.mIsTimerRunning = true;
        this.mTimer = new CircularProgressTimer(totalTime, updateInterval);
        this.mTimer.start();
    }

    void stopTimer() {
        if (this.mIsTimerRunning) {
            this.mTimer.cancel();
            this.mIsTimerRunning = false;
            this.mLayout.getProgressDrawable().setStartEndTrim(0.0f, 0.0f);
        }
    }

    void reset() {
        setIndeterminate(false);
        stopTimer();
        this.mLayout.getProgressDrawable().setStartEndTrim(0.0f, 0.0f);
    }

    private class CircularProgressTimer extends CountDownTimer {
        private final long mTotalTime;

        CircularProgressTimer(long totalTime, long updateInterval) {
            super(totalTime, updateInterval);
            this.mTotalTime = totalTime;
        }

        @Override // android.os.CountDownTimer
        public void onTick(long millisUntilFinished) {
            CircularProgressLayoutController.this.mLayout.getProgressDrawable().setStartEndTrim(0.0f, 1.0f - (millisUntilFinished / this.mTotalTime));
            CircularProgressLayoutController.this.mLayout.invalidate();
        }

        @Override // android.os.CountDownTimer
        public void onFinish() {
            CircularProgressLayoutController.this.mLayout.getProgressDrawable().setStartEndTrim(0.0f, 1.0f);
            if (CircularProgressLayoutController.this.mOnTimerFinishedListener != null) {
                CircularProgressLayoutController.this.mOnTimerFinishedListener.onTimerFinished(CircularProgressLayoutController.this.mLayout);
            }
            CircularProgressLayoutController.this.mIsTimerRunning = false;
        }
    }
}
