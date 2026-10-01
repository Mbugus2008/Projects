package androidx.wear.widget;

import android.content.Context;
import android.graphics.Path;
import android.graphics.PathMeasure;
import android.view.View;
import androidx.recyclerview.widget.RecyclerView;
import androidx.wear.R;

/* JADX INFO: loaded from: classes.dex */
public class CurvingLayoutCallback extends WearableLinearLayoutManager.LayoutCallback {
    private static final float EPSILON = 0.001f;
    private float mCurveBottom;
    private int mCurvePathHeight;
    private float mCurveTop;
    private boolean mIsScreenRound;
    private int mLayoutHeight;
    private int mLayoutWidth;
    private float mLineGradient;
    private RecyclerView mParentView;
    private float mPathLength;
    private int mXCurveOffset;
    private final float[] mPathPoints = new float[2];
    private final float[] mPathTangent = new float[2];
    private final float[] mAnchorOffsetXY = new float[2];
    private final Path mCurvePath = new Path();
    private final PathMeasure mPathMeasure = new PathMeasure();

    public CurvingLayoutCallback(Context context) {
        this.mIsScreenRound = context.getResources().getConfiguration().isScreenRound();
        this.mXCurveOffset = context.getResources().getDimensionPixelSize(R.dimen.ws_wrv_curve_default_x_offset);
    }

    @Override // androidx.wear.widget.WearableLinearLayoutManager.LayoutCallback
    public void onLayoutFinished(View child, RecyclerView parent) {
        if (this.mParentView != parent || (this.mParentView != null && (this.mParentView.getWidth() != parent.getWidth() || this.mParentView.getHeight() != parent.getHeight()))) {
            this.mParentView = parent;
            this.mLayoutWidth = this.mParentView.getWidth();
            this.mLayoutHeight = this.mParentView.getHeight();
        }
        if (this.mIsScreenRound) {
            maybeSetUpCircularInitialLayout(this.mLayoutWidth, this.mLayoutHeight);
            this.mAnchorOffsetXY[0] = this.mXCurveOffset;
            this.mAnchorOffsetXY[1] = child.getHeight() / 2.0f;
            adjustAnchorOffsetXY(child, this.mAnchorOffsetXY);
            float minCenter = (-child.getHeight()) / 2.0f;
            float maxCenter = this.mLayoutHeight + (child.getHeight() / 2.0f);
            float range = maxCenter - minCenter;
            float verticalAnchor = child.getTop() + this.mAnchorOffsetXY[1];
            float mYScrollProgress = (Math.abs(minCenter) + verticalAnchor) / range;
            this.mPathMeasure.getPosTan(this.mPathLength * mYScrollProgress, this.mPathPoints, this.mPathTangent);
            boolean topClusterRisk = Math.abs(this.mPathPoints[1] - this.mCurveBottom) < EPSILON && minCenter < this.mPathPoints[1];
            boolean bottomClusterRisk = Math.abs(this.mPathPoints[1] - this.mCurveTop) < EPSILON && maxCenter > this.mPathPoints[1];
            if (topClusterRisk || bottomClusterRisk) {
                this.mPathPoints[1] = verticalAnchor;
                this.mPathPoints[0] = Math.abs(verticalAnchor) * this.mLineGradient;
            }
            int newLeft = (int) (this.mPathPoints[0] - this.mAnchorOffsetXY[0]);
            child.offsetLeftAndRight(newLeft - child.getLeft());
            float verticalTranslation = this.mPathPoints[1] - verticalAnchor;
            child.setTranslationY(verticalTranslation);
            return;
        }
        child.setTranslationY(0.0f);
    }

    public void adjustAnchorOffsetXY(View child, float[] anchorOffsetXY) {
    }

    void setRound(boolean isScreenRound) {
        this.mIsScreenRound = isScreenRound;
    }

    void setOffset(int offset) {
        this.mXCurveOffset = offset;
    }

    private void maybeSetUpCircularInitialLayout(int width, int height) {
        if (this.mCurvePathHeight != height) {
            this.mCurvePathHeight = height;
            this.mCurveBottom = height * (-0.048f);
            this.mCurveTop = height * 1.048f;
            this.mLineGradient = 10.416667f;
            this.mCurvePath.reset();
            this.mCurvePath.moveTo(width * 0.5f, this.mCurveBottom);
            this.mCurvePath.lineTo(width * 0.34f, height * 0.075f);
            this.mCurvePath.cubicTo(width * 0.22f, height * 0.17f, width * 0.13f, height * 0.32f, width * 0.13f, height / 2);
            this.mCurvePath.cubicTo(width * 0.13f, height * 0.68f, width * 0.22f, height * 0.83f, width * 0.34f, height * 0.925f);
            this.mCurvePath.lineTo(width / 2, this.mCurveTop);
            this.mPathMeasure.setPath(this.mCurvePath, false);
            this.mPathLength = this.mPathMeasure.getLength();
        }
    }
}
