package androidx.constraintlayout.motion.widget;

import android.graphics.Rect;
import android.util.Log;
import android.view.View;
import androidx.constraintlayout.core.motion.utils.Easing;
import androidx.constraintlayout.motion.utils.ViewSpline;
import androidx.constraintlayout.widget.ConstraintAttribute;
import androidx.constraintlayout.widget.ConstraintSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
class MotionConstrainedPoint implements Comparable<MotionConstrainedPoint> {
    static final int CARTESIAN = 2;
    public static final boolean DEBUG = false;
    static final int PERPENDICULAR = 1;
    public static final String TAG = "MotionPaths";
    static String[] sNames = {"position", "x", "y", "width", "height", "pathRotate"};
    private float mHeight;
    private Easing mKeyFrameEasing;
    private float mPosition;
    int mVisibility;
    private float mWidth;
    private float mX;
    private float mY;
    public float rotationY = 0.0f;
    int mVisibilityMode = 0;
    LinkedHashMap<String, ConstraintAttribute> mAttributes = new LinkedHashMap<>();
    int mMode = 0;
    double[] mTempValue = new double[18];
    double[] mTempDelta = new double[18];
    private float mAlpha = 1.0f;
    private boolean mApplyElevation = false;
    private float mElevation = 0.0f;
    private float mRotation = 0.0f;
    private float mRotationX = 0.0f;
    private float mScaleX = 1.0f;
    private float mScaleY = 1.0f;
    private float mPivotX = Float.NaN;
    private float mPivotY = Float.NaN;
    private float mTranslationX = 0.0f;
    private float mTranslationY = 0.0f;
    private float mTranslationZ = 0.0f;
    private int mDrawPath = 0;
    private float mPathRotate = Float.NaN;
    private float mProgress = Float.NaN;
    private int mAnimateRelativeTo = -1;

    MotionConstrainedPoint() {
    }

    private boolean diff(float a, float b) {
        if (Float.isNaN(a) || Float.isNaN(b)) {
            return Float.isNaN(a) != Float.isNaN(b);
        }
        return Math.abs(a - b) > 1.0E-6f;
    }

    void different(MotionConstrainedPoint points, HashSet<String> keySet) {
        if (diff(this.mAlpha, points.mAlpha)) {
            keySet.add("alpha");
        }
        if (diff(this.mElevation, points.mElevation)) {
            keySet.add("elevation");
        }
        if (this.mVisibility != points.mVisibility && this.mVisibilityMode == 0 && (this.mVisibility == 0 || points.mVisibility == 0)) {
            keySet.add("alpha");
        }
        if (diff(this.mRotation, points.mRotation)) {
            keySet.add(Key.ROTATION);
        }
        if (!Float.isNaN(this.mPathRotate) || !Float.isNaN(points.mPathRotate)) {
            keySet.add("transitionPathRotate");
        }
        if (!Float.isNaN(this.mProgress) || !Float.isNaN(points.mProgress)) {
            keySet.add("progress");
        }
        if (diff(this.mRotationX, points.mRotationX)) {
            keySet.add("rotationX");
        }
        if (diff(this.rotationY, points.rotationY)) {
            keySet.add("rotationY");
        }
        if (diff(this.mPivotX, points.mPivotX)) {
            keySet.add(Key.PIVOT_X);
        }
        if (diff(this.mPivotY, points.mPivotY)) {
            keySet.add(Key.PIVOT_Y);
        }
        if (diff(this.mScaleX, points.mScaleX)) {
            keySet.add("scaleX");
        }
        if (diff(this.mScaleY, points.mScaleY)) {
            keySet.add("scaleY");
        }
        if (diff(this.mTranslationX, points.mTranslationX)) {
            keySet.add("translationX");
        }
        if (diff(this.mTranslationY, points.mTranslationY)) {
            keySet.add("translationY");
        }
        if (diff(this.mTranslationZ, points.mTranslationZ)) {
            keySet.add("translationZ");
        }
    }

    void different(MotionConstrainedPoint points, boolean[] mask, String[] custom) {
        int c = 0 + 1;
        mask[0] = mask[0] | diff(this.mPosition, points.mPosition);
        int c2 = c + 1;
        mask[c] = mask[c] | diff(this.mX, points.mX);
        int c3 = c2 + 1;
        mask[c2] = mask[c2] | diff(this.mY, points.mY);
        int c4 = c3 + 1;
        mask[c3] = mask[c3] | diff(this.mWidth, points.mWidth);
        int i = c4 + 1;
        mask[c4] = mask[c4] | diff(this.mHeight, points.mHeight);
    }

    void fillStandard(double[] data, int[] toUse) {
        float[] set = {this.mPosition, this.mX, this.mY, this.mWidth, this.mHeight, this.mAlpha, this.mElevation, this.mRotation, this.mRotationX, this.rotationY, this.mScaleX, this.mScaleY, this.mPivotX, this.mPivotY, this.mTranslationX, this.mTranslationY, this.mTranslationZ, this.mPathRotate};
        int c = 0;
        for (int i = 0; i < toUse.length; i++) {
            if (toUse[i] < set.length) {
                data[c] = set[toUse[i]];
                c++;
            }
        }
    }

    boolean hasCustomData(String name) {
        return this.mAttributes.containsKey(name);
    }

    int getCustomDataCount(String name) {
        return this.mAttributes.get(name).numberOfInterpolatedValues();
    }

    int getCustomData(String name, double[] value, int offset) {
        ConstraintAttribute a = this.mAttributes.get(name);
        if (a.numberOfInterpolatedValues() == 1) {
            value[offset] = a.getValueToInterpolate();
            return 1;
        }
        int n = a.numberOfInterpolatedValues();
        float[] f = new float[n];
        a.getValuesToInterpolate(f);
        int i = 0;
        while (i < n) {
            value[offset] = f[i];
            i++;
            offset++;
        }
        return n;
    }

    void setBounds(float x, float y, float w, float h) {
        this.mX = x;
        this.mY = y;
        this.mWidth = w;
        this.mHeight = h;
    }

    @Override // java.lang.Comparable
    public int compareTo(MotionConstrainedPoint o) {
        return Float.compare(this.mPosition, o.mPosition);
    }

    public void applyParameters(View view) {
        this.mVisibility = view.getVisibility();
        this.mAlpha = view.getVisibility() != 0 ? 0.0f : view.getAlpha();
        this.mApplyElevation = false;
        this.mElevation = view.getElevation();
        this.mRotation = view.getRotation();
        this.mRotationX = view.getRotationX();
        this.rotationY = view.getRotationY();
        this.mScaleX = view.getScaleX();
        this.mScaleY = view.getScaleY();
        this.mPivotX = view.getPivotX();
        this.mPivotY = view.getPivotY();
        this.mTranslationX = view.getTranslationX();
        this.mTranslationY = view.getTranslationY();
        this.mTranslationZ = view.getTranslationZ();
    }

    public void applyParameters(ConstraintSet.Constraint c) {
        this.mVisibilityMode = c.propertySet.mVisibilityMode;
        this.mVisibility = c.propertySet.visibility;
        this.mAlpha = (c.propertySet.visibility == 0 || this.mVisibilityMode != 0) ? c.propertySet.alpha : 0.0f;
        this.mApplyElevation = c.transform.applyElevation;
        this.mElevation = c.transform.elevation;
        this.mRotation = c.transform.rotation;
        this.mRotationX = c.transform.rotationX;
        this.rotationY = c.transform.rotationY;
        this.mScaleX = c.transform.scaleX;
        this.mScaleY = c.transform.scaleY;
        this.mPivotX = c.transform.transformPivotX;
        this.mPivotY = c.transform.transformPivotY;
        this.mTranslationX = c.transform.translationX;
        this.mTranslationY = c.transform.translationY;
        this.mTranslationZ = c.transform.translationZ;
        this.mKeyFrameEasing = Easing.getInterpolator(c.motion.mTransitionEasing);
        this.mPathRotate = c.motion.mPathRotate;
        this.mDrawPath = c.motion.mDrawPath;
        this.mAnimateRelativeTo = c.motion.mAnimateRelativeTo;
        this.mProgress = c.propertySet.mProgress;
        Set<String> at = c.mCustomConstraints.keySet();
        for (String s : at) {
            ConstraintAttribute attr = c.mCustomConstraints.get(s);
            if (attr.isContinuous()) {
                this.mAttributes.put(s, attr);
            }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code duplicated, block: B:53:0x00c5  */
    public void addValues(HashMap<String, ViewSpline> splines, int mFramePosition) {
        byte b;
        for (String s : splines.keySet()) {
            ViewSpline viewSpline = splines.get(s);
            if (viewSpline != null) {
                switch (s) {
                    case "rotationX":
                        b = 3;
                        break;
                    case "rotationY":
                        b = 4;
                        break;
                    case "translationX":
                        b = 11;
                        break;
                    case "translationY":
                        b = 12;
                        break;
                    case "translationZ":
                        b = 13;
                        break;
                    case "progress":
                        b = 8;
                        break;
                    case "scaleX":
                        b = 9;
                        break;
                    case "scaleY":
                        b = 10;
                        break;
                    case "transformPivotX":
                        b = 5;
                        break;
                    case "transformPivotY":
                        b = 6;
                        break;
                    case "rotation":
                        b = 2;
                        break;
                    case "elevation":
                        b = 1;
                        break;
                    case "transitionPathRotate":
                        b = 7;
                        break;
                    case "alpha":
                        b = 0;
                        break;
                    default:
                        b = -1;
                        break;
                }
                switch (b) {
                    case 0:
                        viewSpline.setPoint(mFramePosition, Float.isNaN(this.mAlpha) ? 1.0f : this.mAlpha);
                        break;
                    case 1:
                        viewSpline.setPoint(mFramePosition, Float.isNaN(this.mElevation) ? 0.0f : this.mElevation);
                        break;
                    case 2:
                        viewSpline.setPoint(mFramePosition, Float.isNaN(this.mRotation) ? 0.0f : this.mRotation);
                        break;
                    case 3:
                        viewSpline.setPoint(mFramePosition, Float.isNaN(this.mRotationX) ? 0.0f : this.mRotationX);
                        break;
                    case 4:
                        viewSpline.setPoint(mFramePosition, Float.isNaN(this.rotationY) ? 0.0f : this.rotationY);
                        break;
                    case 5:
                        viewSpline.setPoint(mFramePosition, Float.isNaN(this.mPivotX) ? 0.0f : this.mPivotX);
                        break;
                    case 6:
                        viewSpline.setPoint(mFramePosition, Float.isNaN(this.mPivotY) ? 0.0f : this.mPivotY);
                        break;
                    case 7:
                        viewSpline.setPoint(mFramePosition, Float.isNaN(this.mPathRotate) ? 0.0f : this.mPathRotate);
                        break;
                    case 8:
                        viewSpline.setPoint(mFramePosition, Float.isNaN(this.mProgress) ? 0.0f : this.mProgress);
                        break;
                    case 9:
                        viewSpline.setPoint(mFramePosition, Float.isNaN(this.mScaleX) ? 1.0f : this.mScaleX);
                        break;
                    case 10:
                        viewSpline.setPoint(mFramePosition, Float.isNaN(this.mScaleY) ? 1.0f : this.mScaleY);
                        break;
                    case 11:
                        viewSpline.setPoint(mFramePosition, Float.isNaN(this.mTranslationX) ? 0.0f : this.mTranslationX);
                        break;
                    case 12:
                        viewSpline.setPoint(mFramePosition, Float.isNaN(this.mTranslationY) ? 0.0f : this.mTranslationY);
                        break;
                    case 13:
                        viewSpline.setPoint(mFramePosition, Float.isNaN(this.mTranslationZ) ? 0.0f : this.mTranslationZ);
                        break;
                    default:
                        if (s.startsWith("CUSTOM")) {
                            String customName = s.split(",")[1];
                            if (this.mAttributes.containsKey(customName)) {
                                ConstraintAttribute custom = this.mAttributes.get(customName);
                                if (viewSpline instanceof ViewSpline.CustomSet) {
                                    ((ViewSpline.CustomSet) viewSpline).setPoint(mFramePosition, custom);
                                } else {
                                    Log.e("MotionPaths", s + " ViewSpline not a CustomSet frame = " + mFramePosition + ", value" + custom.getValueToInterpolate() + viewSpline);
                                }
                            }
                        } else {
                            Log.e("MotionPaths", "UNKNOWN spline " + s);
                        }
                        break;
                }
            }
        }
    }

    public void setState(View view) {
        setBounds(view.getX(), view.getY(), view.getWidth(), view.getHeight());
        applyParameters(view);
    }

    public void setState(Rect rect, View view, int rotation, float prevous) {
        setBounds(rect.left, rect.top, rect.width(), rect.height());
        applyParameters(view);
        this.mPivotX = Float.NaN;
        this.mPivotY = Float.NaN;
        switch (rotation) {
            case 1:
                this.mRotation = prevous - 90.0f;
                break;
            case 2:
                this.mRotation = 90.0f + prevous;
                break;
        }
    }

    public void setState(Rect cw, ConstraintSet constraintSet, int rotation, int viewId) {
        setBounds(cw.left, cw.top, cw.width(), cw.height());
        applyParameters(constraintSet.getParameters(viewId));
        switch (rotation) {
            case 1:
            case 3:
                this.mRotation -= 90.0f;
                break;
            case 2:
            case 4:
                this.mRotation += 90.0f;
                if (this.mRotation > 180.0f) {
                    this.mRotation -= 360.0f;
                }
                break;
        }
    }
}
