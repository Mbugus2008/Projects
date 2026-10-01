package androidx.constraintlayout.motion.widget;

import android.content.Context;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.Log;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AnimationUtils;
import android.view.animation.BounceInterpolator;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import android.view.animation.OvershootInterpolator;
import androidx.constraintlayout.core.motion.utils.CurveFit;
import androidx.constraintlayout.core.motion.utils.Easing;
import androidx.constraintlayout.core.motion.utils.KeyCache;
import androidx.constraintlayout.core.motion.utils.SplineSet;
import androidx.constraintlayout.core.motion.utils.VelocityMatrix;
import androidx.constraintlayout.core.widgets.analyzer.BasicMeasure;
import androidx.constraintlayout.motion.utils.CustomSupport;
import androidx.constraintlayout.motion.utils.ViewOscillator;
import androidx.constraintlayout.motion.utils.ViewSpline;
import androidx.constraintlayout.motion.utils.ViewState;
import androidx.constraintlayout.motion.utils.ViewTimeCycle;
import androidx.constraintlayout.widget.ConstraintAttribute;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.constraintlayout.widget.ConstraintSet;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

/* JADX INFO: loaded from: classes.dex */
public class MotionController {
    static final int BOUNCE = 4;
    private static final boolean DEBUG = false;
    public static final int DRAW_PATH_AS_CONFIGURED = 4;
    public static final int DRAW_PATH_BASIC = 1;
    public static final int DRAW_PATH_CARTESIAN = 3;
    public static final int DRAW_PATH_NONE = 0;
    public static final int DRAW_PATH_RECTANGLE = 5;
    public static final int DRAW_PATH_RELATIVE = 2;
    public static final int DRAW_PATH_SCREEN = 6;
    static final int EASE_IN = 1;
    static final int EASE_IN_OUT = 0;
    static final int EASE_OUT = 2;
    private static final boolean FAVOR_FIXED_SIZE_VIEWS = false;
    public static final int HORIZONTAL_PATH_X = 2;
    public static final int HORIZONTAL_PATH_Y = 3;
    private static final int INTERPOLATOR_REFERENCE_ID = -2;
    private static final int INTERPOLATOR_UNDEFINED = -3;
    static final int LINEAR = 3;
    static final int OVERSHOOT = 5;
    public static final int PATH_PERCENT = 0;
    public static final int PATH_PERPENDICULAR = 1;
    public static final int ROTATION_LEFT = 2;
    public static final int ROTATION_RIGHT = 1;
    private static final int SPLINE_STRING = -1;
    private static final String TAG = "MotionController";
    public static final int VERTICAL_PATH_X = 4;
    public static final int VERTICAL_PATH_Y = 5;
    private CurveFit mArcSpline;
    private int[] mAttributeInterpolatorCount;
    private String[] mAttributeNames;
    String[] mAttributeTable;
    private HashMap<String, ViewSpline> mAttributesMap;
    String mConstraintTag;
    float mCurrentCenterX;
    float mCurrentCenterY;
    private HashMap<String, ViewOscillator> mCycleMap;
    int mId;
    private double[] mInterpolateData;
    private int[] mInterpolateVariables;
    private double[] mInterpolateVelocity;
    private KeyTrigger[] mKeyTriggers;
    private CurveFit[] mSpline;
    private HashMap<String, ViewTimeCycle> mTimeCycleAttributesMap;
    View mView;
    Rect mTempRect = new Rect();
    boolean mForceMeasure = false;
    private int mCurveFitType = -1;
    private MotionPaths mStartMotionPath = new MotionPaths();
    private MotionPaths mEndMotionPath = new MotionPaths();
    private MotionConstrainedPoint mStartPoint = new MotionConstrainedPoint();
    private MotionConstrainedPoint mEndPoint = new MotionConstrainedPoint();
    float mMotionStagger = Float.NaN;
    float mStaggerOffset = 0.0f;
    float mStaggerScale = 1.0f;
    private int mMaxDimension = 4;
    private float[] mValuesBuff = new float[this.mMaxDimension];
    private ArrayList<MotionPaths> mMotionPaths = new ArrayList<>();
    private float[] mVelocity = new float[1];
    private ArrayList<Key> mKeyList = new ArrayList<>();
    private int mPathMotionArc = Key.UNSET;
    private int mTransformPivotTarget = Key.UNSET;
    private View mTransformPivotView = null;
    private int mQuantizeMotionSteps = Key.UNSET;
    private float mQuantizeMotionPhase = Float.NaN;
    private Interpolator mQuantizeMotionInterpolator = null;
    private boolean mNoMovement = false;

    public int getTransformPivotTarget() {
        return this.mTransformPivotTarget;
    }

    public void setTransformPivotTarget(int transformPivotTarget) {
        this.mTransformPivotTarget = transformPivotTarget;
        this.mTransformPivotView = null;
    }

    MotionPaths getKeyFrame(int i) {
        return this.mMotionPaths.get(i);
    }

    MotionController(View view) {
        setView(view);
    }

    public float getStartX() {
        return this.mStartMotionPath.mX;
    }

    public float getStartY() {
        return this.mStartMotionPath.mY;
    }

    public float getFinalX() {
        return this.mEndMotionPath.mX;
    }

    public float getFinalY() {
        return this.mEndMotionPath.mY;
    }

    public float getStartWidth() {
        return this.mStartMotionPath.mWidth;
    }

    public float getStartHeight() {
        return this.mStartMotionPath.mHeight;
    }

    public float getFinalWidth() {
        return this.mEndMotionPath.mWidth;
    }

    public float getFinalHeight() {
        return this.mEndMotionPath.mHeight;
    }

    public int getAnimateRelativeTo() {
        return this.mStartMotionPath.mAnimateRelativeTo;
    }

    public void setupRelative(MotionController motionController) {
        this.mStartMotionPath.setupRelative(motionController, motionController.mStartMotionPath);
        this.mEndMotionPath.setupRelative(motionController, motionController.mEndMotionPath);
    }

    public float getCenterX() {
        return this.mCurrentCenterX;
    }

    public float getCenterY() {
        return this.mCurrentCenterY;
    }

    public void getCenter(double p, float[] pos, float[] vel) {
        double[] position = new double[4];
        double[] velocity = new double[4];
        int[] iArr = new int[4];
        this.mSpline[0].getPos(p, position);
        this.mSpline[0].getSlope(p, velocity);
        Arrays.fill(vel, 0.0f);
        this.mStartMotionPath.getCenter(p, this.mInterpolateVariables, position, pos, velocity, vel);
    }

    public void remeasure() {
        this.mForceMeasure = true;
    }

    void buildPath(float[] points, int pointCount) {
        int i = pointCount;
        float f = 1.0f;
        float mils = 1.0f / (i - 1);
        SplineSet trans_x = this.mAttributesMap == null ? null : this.mAttributesMap.get("translationX");
        SplineSet trans_y = this.mAttributesMap == null ? null : this.mAttributesMap.get("translationY");
        ViewOscillator osc_x = this.mCycleMap == null ? null : this.mCycleMap.get("translationX");
        ViewOscillator osc_y = this.mCycleMap != null ? this.mCycleMap.get("translationY") : null;
        int i2 = 0;
        while (i2 < i) {
            float position = i2 * mils;
            if (this.mStaggerScale != f) {
                if (position < this.mStaggerOffset) {
                    position = 0.0f;
                }
                if (position > this.mStaggerOffset && position < 1.0d) {
                    position = Math.min((position - this.mStaggerOffset) * this.mStaggerScale, f);
                }
            }
            double p = position;
            Easing easing = this.mStartMotionPath.mKeyFrameEasing;
            float start = 0.0f;
            float end = Float.NaN;
            for (MotionPaths frame : this.mMotionPaths) {
                if (frame.mKeyFrameEasing != null) {
                    if (frame.mTime < position) {
                        Easing easing2 = frame.mKeyFrameEasing;
                        start = frame.mTime;
                        easing = easing2;
                    } else if (Float.isNaN(end)) {
                        end = frame.mTime;
                    }
                }
            }
            if (easing != null) {
                if (Float.isNaN(end)) {
                    end = 1.0f;
                }
                float offset = (position - start) / (end - start);
                p = ((end - start) * ((float) easing.get(offset))) + start;
            }
            this.mSpline[0].getPos(p, this.mInterpolateData);
            if (this.mArcSpline != null && this.mInterpolateData.length > 0) {
                this.mArcSpline.getPos(p, this.mInterpolateData);
            }
            this.mStartMotionPath.getCenter(p, this.mInterpolateVariables, this.mInterpolateData, points, i2 * 2);
            if (osc_x != null) {
                int i3 = i2 * 2;
                points[i3] = points[i3] + osc_x.get(position);
            } else if (trans_x != null) {
                int i4 = i2 * 2;
                points[i4] = points[i4] + trans_x.get(position);
            }
            if (osc_y != null) {
                int i5 = (i2 * 2) + 1;
                points[i5] = points[i5] + osc_y.get(position);
            } else if (trans_y != null) {
                int i6 = (i2 * 2) + 1;
                points[i6] = points[i6] + trans_y.get(position);
            }
            i2++;
            i = pointCount;
            mils = mils;
            f = 1.0f;
        }
    }

    double[] getPos(double position) {
        this.mSpline[0].getPos(position, this.mInterpolateData);
        if (this.mArcSpline != null && this.mInterpolateData.length > 0) {
            this.mArcSpline.getPos(position, this.mInterpolateData);
        }
        return this.mInterpolateData;
    }

    void buildBounds(float[] bounds, int pointCount) {
        MotionController motionController = this;
        int i = pointCount;
        float f = 1.0f;
        float mils = 1.0f / (i - 1);
        SplineSet trans_x = motionController.mAttributesMap == null ? null : motionController.mAttributesMap.get("translationX");
        if (motionController.mAttributesMap != null) {
            motionController.mAttributesMap.get("translationY");
        }
        if (motionController.mCycleMap != null) {
            motionController.mCycleMap.get("translationX");
        }
        if (motionController.mCycleMap != null) {
            motionController.mCycleMap.get("translationY");
        }
        int i2 = 0;
        while (i2 < i) {
            float position = i2 * mils;
            if (motionController.mStaggerScale != f) {
                if (position < motionController.mStaggerOffset) {
                    position = 0.0f;
                }
                if (position > motionController.mStaggerOffset && position < 1.0d) {
                    position = Math.min((position - motionController.mStaggerOffset) * motionController.mStaggerScale, f);
                }
            }
            double p = position;
            Easing easing = motionController.mStartMotionPath.mKeyFrameEasing;
            float start = 0.0f;
            float end = Float.NaN;
            for (MotionPaths frame : motionController.mMotionPaths) {
                if (frame.mKeyFrameEasing != null) {
                    if (frame.mTime < position) {
                        Easing easing2 = frame.mKeyFrameEasing;
                        start = frame.mTime;
                        easing = easing2;
                    } else if (Float.isNaN(end)) {
                        end = frame.mTime;
                    }
                }
            }
            if (easing != null) {
                if (Float.isNaN(end)) {
                    end = 1.0f;
                }
                float offset = (position - start) / (end - start);
                p = ((end - start) * ((float) easing.get(offset))) + start;
            }
            motionController.mSpline[0].getPos(p, motionController.mInterpolateData);
            if (motionController.mArcSpline != null && motionController.mInterpolateData.length > 0) {
                motionController.mArcSpline.getPos(p, motionController.mInterpolateData);
            }
            motionController.mStartMotionPath.getBounds(motionController.mInterpolateVariables, motionController.mInterpolateData, bounds, i2 * 2);
            i2++;
            motionController = this;
            i = pointCount;
            mils = mils;
            trans_x = trans_x;
            f = 1.0f;
        }
    }

    private float getPreCycleDistance() {
        int pointCount = 100;
        float[] points = new float[2];
        float sum = 0.0f;
        float mils = 1.0f / (100 - 1);
        double x = 0.0d;
        double y = 0.0d;
        int i = 0;
        while (i < pointCount) {
            float position = i * mils;
            double p = position;
            Easing easing = this.mStartMotionPath.mKeyFrameEasing;
            float end = Float.NaN;
            int pointCount2 = pointCount;
            Iterator<MotionPaths> it = this.mMotionPaths.iterator();
            float start = 0.0f;
            while (it.hasNext()) {
                MotionPaths frame = it.next();
                Iterator<MotionPaths> it2 = it;
                if (frame.mKeyFrameEasing != null) {
                    if (frame.mTime < position) {
                        Easing easing2 = frame.mKeyFrameEasing;
                        start = frame.mTime;
                        easing = easing2;
                    } else if (Float.isNaN(end)) {
                        end = frame.mTime;
                    }
                }
                it = it2;
            }
            if (easing != null) {
                if (Float.isNaN(end)) {
                    end = 1.0f;
                }
                float offset = (position - start) / (end - start);
                p = ((end - start) * ((float) easing.get(offset))) + start;
            }
            this.mSpline[0].getPos(p, this.mInterpolateData);
            this.mStartMotionPath.getCenter(p, this.mInterpolateVariables, this.mInterpolateData, points, 0);
            if (i > 0) {
                sum += (float) Math.hypot(y - ((double) points[1]), x - ((double) points[0]));
            }
            x = points[0];
            y = points[1];
            i++;
            pointCount = pointCount2;
            sum = sum;
        }
        return sum;
    }

    KeyPositionBase getPositionKeyframe(int layoutWidth, int layoutHeight, float x, float y) {
        int layoutWidth2;
        int layoutHeight2;
        float x2;
        float y2;
        RectF start = new RectF();
        start.left = this.mStartMotionPath.mX;
        start.top = this.mStartMotionPath.mY;
        start.right = start.left + this.mStartMotionPath.mWidth;
        start.bottom = start.top + this.mStartMotionPath.mHeight;
        RectF end = new RectF();
        end.left = this.mEndMotionPath.mX;
        end.top = this.mEndMotionPath.mY;
        end.right = end.left + this.mEndMotionPath.mWidth;
        end.bottom = end.top + this.mEndMotionPath.mHeight;
        for (Key key : this.mKeyList) {
            if (!(key instanceof KeyPositionBase)) {
                layoutWidth2 = layoutWidth;
                layoutHeight2 = layoutHeight;
                x2 = x;
                y2 = y;
            } else {
                layoutWidth2 = layoutWidth;
                layoutHeight2 = layoutHeight;
                x2 = x;
                y2 = y;
                if (((KeyPositionBase) key).intersects(layoutWidth2, layoutHeight2, start, end, x2, y2)) {
                    return (KeyPositionBase) key;
                }
            }
            layoutWidth = layoutWidth2;
            layoutHeight = layoutHeight2;
            x = x2;
            y = y2;
        }
        return null;
    }

    int buildKeyFrames(float[] keyFrames, int[] mode) {
        if (keyFrames == null) {
            return 0;
        }
        int count = 0;
        double[] time = this.mSpline[0].getTimePoints();
        if (mode != null) {
            for (MotionPaths keyFrame : this.mMotionPaths) {
                mode[count] = keyFrame.mMode;
                count++;
            }
            count = 0;
        }
        int count2 = count;
        for (int i = 0; i < time.length; i++) {
            this.mSpline[0].getPos(time[i], this.mInterpolateData);
            this.mStartMotionPath.getCenter(time[i], this.mInterpolateVariables, this.mInterpolateData, keyFrames, count2);
            count2 += 2;
        }
        return count2 / 2;
    }

    int buildKeyBounds(float[] keyBounds, int[] mode) {
        if (keyBounds == null) {
            return 0;
        }
        int count = 0;
        double[] time = this.mSpline[0].getTimePoints();
        if (mode != null) {
            for (MotionPaths keyFrame : this.mMotionPaths) {
                mode[count] = keyFrame.mMode;
                count++;
            }
            count = 0;
        }
        for (double d : time) {
            this.mSpline[0].getPos(d, this.mInterpolateData);
            this.mStartMotionPath.getBounds(this.mInterpolateVariables, this.mInterpolateData, keyBounds, count);
            count += 2;
        }
        return count / 2;
    }

    int getAttributeValues(String attributeType, float[] points, int pointCount) {
        float f = 1.0f / (pointCount - 1);
        SplineSet spline = this.mAttributesMap.get(attributeType);
        if (spline == null) {
            return -1;
        }
        for (int j = 0; j < points.length; j++) {
            points[j] = spline.get(j / (points.length - 1));
        }
        int j2 = points.length;
        return j2;
    }

    void buildRect(float p, float[] path, int offset) {
        this.mSpline[0].getPos(getAdjustedPosition(p, null), this.mInterpolateData);
        this.mStartMotionPath.getRect(this.mInterpolateVariables, this.mInterpolateData, path, offset);
    }

    void buildRectangles(float[] path, int pointCount) {
        float mils = 1.0f / (pointCount - 1);
        for (int i = 0; i < pointCount; i++) {
            float position = i * mils;
            this.mSpline[0].getPos(getAdjustedPosition(position, null), this.mInterpolateData);
            this.mStartMotionPath.getRect(this.mInterpolateVariables, this.mInterpolateData, path, i * 8);
        }
    }

    float getKeyFrameParameter(int type, float x, float y) {
        float dx = this.mEndMotionPath.mX - this.mStartMotionPath.mX;
        float dy = this.mEndMotionPath.mY - this.mStartMotionPath.mY;
        float startCenterX = this.mStartMotionPath.mX + (this.mStartMotionPath.mWidth / 2.0f);
        float startCenterY = this.mStartMotionPath.mY + (this.mStartMotionPath.mHeight / 2.0f);
        float hypotenuse = (float) Math.hypot(dx, dy);
        if (hypotenuse < 1.0E-7d) {
            return Float.NaN;
        }
        float vx = x - startCenterX;
        float vy = y - startCenterY;
        float distFromStart = (float) Math.hypot(vx, vy);
        if (distFromStart == 0.0f) {
            return 0.0f;
        }
        float pathDistance = (vx * dx) + (vy * dy);
        switch (type) {
            case 0:
                return pathDistance / hypotenuse;
            case 1:
                return (float) Math.sqrt((hypotenuse * hypotenuse) - (pathDistance * pathDistance));
            case 2:
                return vx / dx;
            case 3:
                return vy / dx;
            case 4:
                return vx / dy;
            case 5:
                return vy / dy;
            default:
                return 0.0f;
        }
    }

    private void insertKey(MotionPaths point) {
        int pos = Collections.binarySearch(this.mMotionPaths, point);
        if (pos == 0) {
            Log.e(TAG, " KeyPath position \"" + point.mPosition + "\" outside of range");
        }
        this.mMotionPaths.add((-pos) - 1, point);
    }

    void addKeys(ArrayList<Key> list) {
        this.mKeyList.addAll(list);
    }

    public void addKey(Key key) {
        this.mKeyList.add(key);
    }

    public void setPathMotionArc(int arc) {
        this.mPathMotionArc = arc;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void setup(int i, int i2, float f, long j) {
        char c;
        MotionPaths[] motionPathsArr;
        ArrayList<KeyTrigger> arrayList;
        int i3;
        int i4;
        ConstraintAttribute constraintAttribute;
        Iterator<String> it;
        ViewTimeCycle viewTimeCycleMakeSpline;
        Integer num;
        ViewSpline viewSplineMakeSpline;
        HashSet hashSet = new HashSet();
        HashSet<String> hashSet2 = new HashSet<>();
        HashSet<String> hashSet3 = new HashSet<>();
        HashSet<String> hashSet4 = new HashSet<>();
        HashMap<String, Integer> map = new HashMap<>();
        ArrayList<KeyTrigger> arrayList2 = null;
        if (this.mPathMotionArc != Key.UNSET) {
            this.mStartMotionPath.mPathMotionArc = this.mPathMotionArc;
        }
        this.mStartPoint.different(this.mEndPoint, hashSet3);
        if (this.mKeyList != null) {
            for (Key key : this.mKeyList) {
                if (key instanceof KeyPosition) {
                    KeyPosition keyPosition = (KeyPosition) key;
                    insertKey(new MotionPaths(i, i2, keyPosition, this.mStartMotionPath, this.mEndMotionPath));
                    if (keyPosition.mCurveFit != Key.UNSET) {
                        this.mCurveFitType = keyPosition.mCurveFit;
                    }
                } else if (key instanceof KeyCycle) {
                    key.getAttributeNames(hashSet4);
                } else if (key instanceof KeyTimeCycle) {
                    key.getAttributeNames(hashSet2);
                } else if (key instanceof KeyTrigger) {
                    if (arrayList2 == null) {
                        arrayList2 = new ArrayList<>();
                    }
                    arrayList2.add((KeyTrigger) key);
                } else {
                    key.setInterpolation(map);
                    key.getAttributeNames(hashSet3);
                }
            }
        }
        if (arrayList2 != null) {
            this.mKeyTriggers = (KeyTrigger[]) arrayList2.toArray(new KeyTrigger[0]);
        }
        char c2 = 1;
        if (hashSet3.isEmpty()) {
            c = 1;
        } else {
            this.mAttributesMap = new HashMap<>();
            for (String str : hashSet3) {
                if (str.startsWith("CUSTOM,")) {
                    SparseArray sparseArray = new SparseArray();
                    String str2 = str.split(",")[c2];
                    for (Key key2 : this.mKeyList) {
                        c2 = c2;
                        if (key2.mCustomConstraints != null) {
                            ConstraintAttribute constraintAttribute2 = key2.mCustomConstraints.get(str2);
                            if (constraintAttribute2 != null) {
                                sparseArray.append(key2.mFramePosition, constraintAttribute2);
                            }
                            hashSet = hashSet;
                        }
                    }
                    hashSet = hashSet;
                    c2 = c2;
                    viewSplineMakeSpline = ViewSpline.makeCustomSpline(str, (SparseArray<ConstraintAttribute>) sparseArray);
                } else {
                    hashSet = hashSet;
                    c2 = c2;
                    viewSplineMakeSpline = ViewSpline.makeSpline(str);
                }
                if (viewSplineMakeSpline != null) {
                    viewSplineMakeSpline.setType(str);
                    this.mAttributesMap.put(str, viewSplineMakeSpline);
                }
            }
            c = c2;
            if (this.mKeyList != null) {
                for (Key key3 : this.mKeyList) {
                    if (key3 instanceof KeyAttributes) {
                        key3.addValues(this.mAttributesMap);
                    }
                }
            }
            this.mStartPoint.addValues(this.mAttributesMap, 0);
            this.mEndPoint.addValues(this.mAttributesMap, 100);
            for (String str3 : this.mAttributesMap.keySet()) {
                int iIntValue = 0;
                if (map.containsKey(str3) && (num = map.get(str3)) != null) {
                    iIntValue = num.intValue();
                }
                ViewSpline viewSpline = this.mAttributesMap.get(str3);
                if (viewSpline != null) {
                    viewSpline.setup(iIntValue);
                }
            }
        }
        if (!hashSet2.isEmpty()) {
            if (this.mTimeCycleAttributesMap == null) {
                this.mTimeCycleAttributesMap = new HashMap<>();
            }
            Iterator<String> it2 = hashSet2.iterator();
            while (it2.hasNext()) {
                String next = it2.next();
                if (!this.mTimeCycleAttributesMap.containsKey(next)) {
                    if (next.startsWith("CUSTOM,")) {
                        SparseArray sparseArray2 = new SparseArray();
                        String str4 = next.split(",")[c];
                        for (Key key4 : this.mKeyList) {
                            if (key4.mCustomConstraints != null) {
                                ConstraintAttribute constraintAttribute3 = key4.mCustomConstraints.get(str4);
                                if (constraintAttribute3 != null) {
                                    sparseArray2.append(key4.mFramePosition, constraintAttribute3);
                                }
                                it2 = it2;
                            }
                        }
                        it = it2;
                        viewTimeCycleMakeSpline = ViewTimeCycle.makeCustomSpline(next, sparseArray2);
                    } else {
                        it = it2;
                        viewTimeCycleMakeSpline = ViewTimeCycle.makeSpline(next, j);
                    }
                    if (viewTimeCycleMakeSpline == null) {
                        it2 = it;
                    } else {
                        viewTimeCycleMakeSpline.setType(next);
                        this.mTimeCycleAttributesMap.put(next, viewTimeCycleMakeSpline);
                        it2 = it;
                    }
                }
            }
            if (this.mKeyList != null) {
                for (Key key5 : this.mKeyList) {
                    if (key5 instanceof KeyTimeCycle) {
                        ((KeyTimeCycle) key5).addTimeValues(this.mTimeCycleAttributesMap);
                    }
                }
            }
            for (String str5 : this.mTimeCycleAttributesMap.keySet()) {
                int iIntValue2 = 0;
                if (map.containsKey(str5)) {
                    iIntValue2 = map.get(str5).intValue();
                }
                this.mTimeCycleAttributesMap.get(str5).setup(iIntValue2);
            }
        }
        MotionPaths[] motionPathsArr2 = new MotionPaths[this.mMotionPaths.size() + 2];
        int i5 = 1;
        motionPathsArr2[0] = this.mStartMotionPath;
        motionPathsArr2[motionPathsArr2.length - 1] = this.mEndMotionPath;
        if (this.mMotionPaths.size() > 0 && this.mCurveFitType == -1) {
            this.mCurveFitType = 0;
        }
        Iterator<MotionPaths> it3 = this.mMotionPaths.iterator();
        while (it3.hasNext()) {
            motionPathsArr2[i5] = it3.next();
            i5++;
        }
        HashSet hashSet5 = new HashSet();
        for (String str6 : this.mEndMotionPath.mAttributes.keySet()) {
            if (this.mStartMotionPath.mAttributes.containsKey(str6) && !hashSet3.contains("CUSTOM," + str6)) {
                hashSet5.add(str6);
            }
        }
        this.mAttributeNames = (String[]) hashSet5.toArray(new String[0]);
        this.mAttributeInterpolatorCount = new int[this.mAttributeNames.length];
        int i6 = 0;
        while (i6 < this.mAttributeNames.length) {
            String str7 = this.mAttributeNames[i6];
            this.mAttributeInterpolatorCount[i6] = 0;
            int i7 = 0;
            while (i7 < motionPathsArr2.length) {
                if (motionPathsArr2[i7].mAttributes.containsKey(str7) && (constraintAttribute = motionPathsArr2[i7].mAttributes.get(str7)) != null) {
                    int[] iArr = this.mAttributeInterpolatorCount;
                    iArr[i6] = iArr[i6] + constraintAttribute.numberOfInterpolatedValues();
                    break;
                } else {
                    i7++;
                    hashSet2 = hashSet2;
                }
            }
            i6++;
            hashSet2 = hashSet2;
        }
        boolean z = motionPathsArr2[0].mPathMotionArc != Key.UNSET ? c : 0;
        boolean[] zArr = new boolean[this.mAttributeNames.length + 18];
        int i8 = 1;
        while (i8 < motionPathsArr2.length) {
            motionPathsArr2[i8].different(motionPathsArr2[i8 - 1], zArr, this.mAttributeNames, z);
            i8++;
            hashSet3 = hashSet3;
        }
        int i9 = 0;
        for (int i10 = 1; i10 < zArr.length; i10++) {
            if (zArr[i10]) {
                i9++;
            }
        }
        this.mInterpolateVariables = new int[i9];
        int iMax = Math.max(2, i9);
        this.mInterpolateData = new double[iMax];
        this.mInterpolateVelocity = new double[iMax];
        int i11 = 0;
        for (int i12 = 1; i12 < zArr.length; i12++) {
            if (zArr[i12]) {
                this.mInterpolateVariables[i11] = i12;
                i11++;
            }
        }
        int length = motionPathsArr2.length;
        int[] iArr2 = new int[2];
        iArr2[c] = this.mInterpolateVariables.length;
        iArr2[0] = length;
        double[][] dArr = (double[][]) Array.newInstance((Class<?>) Double.TYPE, iArr2);
        double[] dArr2 = new double[motionPathsArr2.length];
        int i13 = 0;
        while (i13 < motionPathsArr2.length) {
            motionPathsArr2[i13].fillStandard(dArr[i13], this.mInterpolateVariables);
            dArr2[i13] = motionPathsArr2[i13].mTime;
            i13++;
            i11 = i11;
            hashSet4 = hashSet4;
        }
        HashSet<String> hashSet6 = hashSet4;
        int i14 = 0;
        while (i14 < this.mInterpolateVariables.length) {
            int i15 = this.mInterpolateVariables[i14];
            if (i15 < MotionPaths.sNames.length) {
                i4 = i14;
                String str8 = MotionPaths.sNames[this.mInterpolateVariables[i4]] + " [";
                int i16 = 0;
                while (i16 < motionPathsArr2.length) {
                    str8 = str8 + dArr[i16][i4];
                    i16++;
                    i15 = i15;
                }
            } else {
                i4 = i14;
            }
            i14 = i4 + 1;
        }
        this.mSpline = new CurveFit[this.mAttributeNames.length + 1];
        int i17 = 0;
        while (i17 < this.mAttributeNames.length) {
            int i18 = 0;
            double[][] dArr3 = null;
            double[] dArr4 = null;
            int i19 = i17;
            String str9 = this.mAttributeNames[i19];
            HashMap<String, Integer> map2 = map;
            int i20 = 0;
            while (true) {
                arrayList = arrayList2;
                if (i20 < motionPathsArr2.length) {
                    if (!motionPathsArr2[i20].hasCustomData(str9)) {
                        i3 = i20;
                    } else {
                        if (dArr3 != null) {
                            i3 = i20;
                        } else {
                            dArr4 = new double[motionPathsArr2.length];
                            int length2 = motionPathsArr2.length;
                            i3 = i20;
                            int[] iArr3 = new int[2];
                            iArr3[c] = motionPathsArr2[i3].getCustomDataCount(str9);
                            iArr3[0] = length2;
                            dArr3 = (double[][]) Array.newInstance((Class<?>) Double.TYPE, iArr3);
                        }
                        dArr4[i18] = motionPathsArr2[i3].mTime;
                        motionPathsArr2[i3].getCustomData(str9, dArr3[i18], 0);
                        i18++;
                    }
                    i20 = i3 + 1;
                    arrayList2 = arrayList;
                    zArr = zArr;
                }
            }
            this.mSpline[i19 + 1] = CurveFit.get(this.mCurveFitType, Arrays.copyOf(dArr4, i18), (double[][]) Arrays.copyOf(dArr3, i18));
            i17 = i19 + 1;
            map = map2;
            arrayList2 = arrayList;
            zArr = zArr;
        }
        this.mSpline[0] = CurveFit.get(this.mCurveFitType, dArr2, dArr);
        if (motionPathsArr2[0].mPathMotionArc != Key.UNSET) {
            int length3 = motionPathsArr2.length;
            int[] iArr4 = new int[length3];
            double[] dArr5 = new double[length3];
            int[] iArr5 = new int[2];
            iArr5[c] = 2;
            iArr5[0] = length3;
            double[][] dArr6 = (double[][]) Array.newInstance((Class<?>) Double.TYPE, iArr5);
            int i21 = 0;
            while (i21 < length3) {
                motionPathsArr = motionPathsArr2;
                iArr4[i21] = motionPathsArr[i21].mPathMotionArc;
                dArr5[i21] = motionPathsArr[i21].mTime;
                MotionPaths[] motionPathsArr3 = motionPathsArr;
                dArr6[i21][0] = motionPathsArr[i21].mX;
                dArr6[i21][c] = motionPathsArr3[i21].mY;
                i21++;
                motionPathsArr = motionPathsArr3;
                dArr = dArr;
            }
            motionPathsArr = motionPathsArr2;
            this.mArcSpline = CurveFit.getArc(iArr4, dArr5, dArr6);
        }
        float preCycleDistance = Float.NaN;
        this.mCycleMap = new HashMap<>();
        if (this.mKeyList != null) {
            for (String str10 : hashSet6) {
                ViewOscillator viewOscillatorMakeSpline = ViewOscillator.makeSpline(str10);
                if (viewOscillatorMakeSpline != null) {
                    if (viewOscillatorMakeSpline.variesByPath() && Float.isNaN(preCycleDistance)) {
                        preCycleDistance = getPreCycleDistance();
                    }
                    viewOscillatorMakeSpline.setType(str10);
                    this.mCycleMap.put(str10, viewOscillatorMakeSpline);
                }
            }
            for (Key key6 : this.mKeyList) {
                if (key6 instanceof KeyCycle) {
                    ((KeyCycle) key6).addCycleValues(this.mCycleMap);
                }
            }
            Iterator<ViewOscillator> it4 = this.mCycleMap.values().iterator();
            while (it4.hasNext()) {
                it4.next().setup(preCycleDistance);
            }
        }
    }

    public String toString() {
        return " start: x: " + this.mStartMotionPath.mX + " y: " + this.mStartMotionPath.mY + " end: x: " + this.mEndMotionPath.mX + " y: " + this.mEndMotionPath.mY;
    }

    private void readView(MotionPaths motionPaths) {
        motionPaths.setBounds((int) this.mView.getX(), (int) this.mView.getY(), this.mView.getWidth(), this.mView.getHeight());
    }

    public void setView(View view) {
        this.mView = view;
        this.mId = view.getId();
        ViewGroup.LayoutParams lp = view.getLayoutParams();
        if (lp instanceof ConstraintLayout.LayoutParams) {
            this.mConstraintTag = ((ConstraintLayout.LayoutParams) lp).getConstraintTag();
        }
    }

    public View getView() {
        return this.mView;
    }

    void setStartCurrentState(View v) {
        this.mStartMotionPath.mTime = 0.0f;
        this.mStartMotionPath.mPosition = 0.0f;
        this.mStartMotionPath.setBounds(v.getX(), v.getY(), v.getWidth(), v.getHeight());
        this.mStartPoint.setState(v);
    }

    public void setStartState(ViewState rect, View v, int rotation, int preWidth, int preHeight) {
        this.mStartMotionPath.mTime = 0.0f;
        this.mStartMotionPath.mPosition = 0.0f;
        Rect r = new Rect();
        switch (rotation) {
            case 1:
                int cx = rect.left;
                int cx2 = cx + rect.right;
                int cy = rect.top + rect.bottom;
                r.left = (cy - rect.width()) / 2;
                r.top = preWidth - ((rect.height() + cx2) / 2);
                r.right = r.left + rect.width();
                r.bottom = r.top + rect.height();
                break;
            case 2:
                int cx3 = rect.left + rect.right;
                int cy2 = rect.top + rect.bottom;
                r.left = preHeight - ((rect.width() + cy2) / 2);
                r.top = (cx3 - rect.height()) / 2;
                r.right = r.left + rect.width();
                r.bottom = r.top + rect.height();
                break;
        }
        this.mStartMotionPath.setBounds(r.left, r.top, r.width(), r.height());
        this.mStartPoint.setState(r, v, rotation, rect.rotation);
    }

    void rotate(Rect rect, Rect out, int rotation, int preHeight, int preWidth) {
        switch (rotation) {
            case 1:
                int cx = rect.left;
                int cx2 = cx + rect.right;
                int cy = rect.top + rect.bottom;
                out.left = (cy - rect.width()) / 2;
                out.top = preWidth - ((rect.height() + cx2) / 2);
                out.right = out.left + rect.width();
                out.bottom = out.top + rect.height();
                break;
            case 2:
                int cx3 = rect.left;
                int cx4 = cx3 + rect.right;
                int cy2 = rect.top + rect.bottom;
                out.left = preHeight - ((rect.width() + cy2) / 2);
                out.top = (cx4 - rect.height()) / 2;
                out.right = out.left + rect.width();
                out.bottom = out.top + rect.height();
                break;
            case 3:
                int cx5 = rect.left;
                int cx6 = cx5 + rect.right;
                int i = rect.top + rect.bottom;
                out.left = ((rect.height() / 2) + rect.top) - (cx6 / 2);
                out.top = preWidth - ((rect.height() + cx6) / 2);
                out.right = out.left + rect.width();
                out.bottom = out.top + rect.height();
                break;
            case 4:
                int cx7 = rect.left + rect.right;
                int cy3 = rect.bottom + rect.top;
                out.left = preHeight - ((rect.width() + cy3) / 2);
                out.top = (cx7 - rect.height()) / 2;
                out.right = out.left + rect.width();
                out.bottom = out.top + rect.height();
                break;
        }
    }

    void setStartState(Rect cw, ConstraintSet constraintSet, int parentWidth, int parentHeight) {
        MotionController motionController;
        Rect cw2;
        int rotate = constraintSet.mRotate;
        if (rotate == 0) {
            motionController = this;
            cw2 = cw;
        } else {
            motionController = this;
            cw2 = cw;
            motionController.rotate(cw2, this.mTempRect, rotate, parentWidth, parentHeight);
        }
        motionController.mStartMotionPath.mTime = 0.0f;
        motionController.mStartMotionPath.mPosition = 0.0f;
        readView(motionController.mStartMotionPath);
        motionController.mStartMotionPath.setBounds(cw2.left, cw2.top, cw2.width(), cw2.height());
        ConstraintSet.Constraint constraint = constraintSet.getParameters(motionController.mId);
        motionController.mStartMotionPath.applyParameters(constraint);
        motionController.mMotionStagger = constraint.motion.mMotionStagger;
        motionController.mStartPoint.setState(cw2, constraintSet, rotate, motionController.mId);
        motionController.mTransformPivotTarget = constraint.transform.transformPivotTarget;
        motionController.mQuantizeMotionSteps = constraint.motion.mQuantizeMotionSteps;
        motionController.mQuantizeMotionPhase = constraint.motion.mQuantizeMotionPhase;
        motionController.mQuantizeMotionInterpolator = getInterpolator(motionController.mView.getContext(), constraint.motion.mQuantizeInterpolatorType, constraint.motion.mQuantizeInterpolatorString, constraint.motion.mQuantizeInterpolatorID);
    }

    private static Interpolator getInterpolator(Context context, int type, String interpolatorString, int id) {
        switch (type) {
            case -3:
                return null;
            case -2:
                return AnimationUtils.loadInterpolator(context, id);
            case -1:
                final Easing easing = Easing.getInterpolator(interpolatorString);
                return new Interpolator() { // from class: androidx.constraintlayout.motion.widget.MotionController.1
                    @Override // android.animation.TimeInterpolator
                    public float getInterpolation(float v) {
                        return (float) easing.get(v);
                    }
                };
            case 0:
                return new AccelerateDecelerateInterpolator();
            case 1:
                return new AccelerateInterpolator();
            case 2:
                return new DecelerateInterpolator();
            case 3:
                return null;
            case 4:
                return new BounceInterpolator();
            case 5:
                return new OvershootInterpolator();
            default:
                return null;
        }
    }

    void setEndState(Rect cw, ConstraintSet constraintSet, int parentWidth, int parentHeight) {
        MotionController motionController;
        int rotate = constraintSet.mRotate;
        if (rotate == 0) {
            motionController = this;
        } else {
            motionController = this;
            motionController.rotate(cw, this.mTempRect, rotate, parentWidth, parentHeight);
            cw = motionController.mTempRect;
        }
        motionController.mEndMotionPath.mTime = 1.0f;
        motionController.mEndMotionPath.mPosition = 1.0f;
        readView(motionController.mEndMotionPath);
        motionController.mEndMotionPath.setBounds(cw.left, cw.top, cw.width(), cw.height());
        motionController.mEndMotionPath.applyParameters(constraintSet.getParameters(motionController.mId));
        motionController.mEndPoint.setState(cw, constraintSet, rotate, motionController.mId);
    }

    void setBothStates(View v) {
        this.mStartMotionPath.mTime = 0.0f;
        this.mStartMotionPath.mPosition = 0.0f;
        this.mNoMovement = true;
        this.mStartMotionPath.setBounds(v.getX(), v.getY(), v.getWidth(), v.getHeight());
        this.mEndMotionPath.setBounds(v.getX(), v.getY(), v.getWidth(), v.getHeight());
        this.mStartPoint.setState(v);
        this.mEndPoint.setState(v);
    }

    private float getAdjustedPosition(float position, float[] velocity) {
        if (velocity != null) {
            velocity[0] = 1.0f;
        } else if (this.mStaggerScale != 1.0d) {
            if (position < this.mStaggerOffset) {
                position = 0.0f;
            }
            if (position > this.mStaggerOffset && position < 1.0d) {
                position = Math.min((position - this.mStaggerOffset) * this.mStaggerScale, 1.0f);
            }
        }
        float adjusted = position;
        Easing easing = this.mStartMotionPath.mKeyFrameEasing;
        float start = 0.0f;
        float end = Float.NaN;
        for (MotionPaths frame : this.mMotionPaths) {
            if (frame.mKeyFrameEasing != null) {
                if (frame.mTime < position) {
                    easing = frame.mKeyFrameEasing;
                    start = frame.mTime;
                } else if (Float.isNaN(end)) {
                    end = frame.mTime;
                }
            }
        }
        if (easing != null) {
            if (Float.isNaN(end)) {
                end = 1.0f;
            }
            float offset = (position - start) / (end - start);
            float new_offset = (float) easing.get(offset);
            adjusted = ((end - start) * new_offset) + start;
            if (velocity != null) {
                velocity[0] = (float) easing.getDiff(offset);
            }
        }
        return adjusted;
    }

    void endTrigger(boolean start) {
        if ("button".equals(Debug.getName(this.mView)) && this.mKeyTriggers != null) {
            for (int i = 0; i < this.mKeyTriggers.length; i++) {
                this.mKeyTriggers[i].conditionallyFire(start ? -100.0f : 100.0f, this.mView);
            }
        }
    }

    boolean interpolate(View child, float globalPosition, long time, KeyCache keyCache) {
        boolean timeAnimation;
        ViewTimeCycle.PathRotate timePathRotate;
        View view;
        float position;
        View view2;
        float f;
        float section;
        View view3 = child;
        float position2 = getAdjustedPosition(globalPosition, null);
        if (this.mQuantizeMotionSteps != Key.UNSET) {
            float steps = 1.0f / this.mQuantizeMotionSteps;
            float jump = ((float) Math.floor(position2 / steps)) * steps;
            float section2 = (position2 % steps) / steps;
            if (!Float.isNaN(this.mQuantizeMotionPhase)) {
                section2 = (this.mQuantizeMotionPhase + section2) % 1.0f;
            }
            if (this.mQuantizeMotionInterpolator != null) {
                section = this.mQuantizeMotionInterpolator.getInterpolation(section2);
            } else {
                section = ((double) section2) > 0.5d ? 1.0f : 0.0f;
            }
            position2 = (section * steps) + jump;
        }
        if (this.mAttributesMap != null) {
            Iterator<ViewSpline> it = this.mAttributesMap.values().iterator();
            while (it.hasNext()) {
                it.next().setProperty(view3, position2);
            }
        }
        if (this.mTimeCycleAttributesMap == null) {
            timeAnimation = false;
            timePathRotate = null;
        } else {
            Iterator<ViewTimeCycle> it2 = this.mTimeCycleAttributesMap.values().iterator();
            boolean timeAnimation2 = false;
            timePathRotate = null;
            while (timeAnimation) {
                ViewTimeCycle aSpline = it2.next();
                if (aSpline instanceof ViewTimeCycle.PathRotate) {
                    timePathRotate = (ViewTimeCycle.PathRotate) aSpline;
                } else {
                    timeAnimation2 |= aSpline.setProperty(view3, position2, time, keyCache);
                    view3 = child;
                }
            }
            timeAnimation = timeAnimation2;
        }
        if (this.mSpline != null) {
            this.mSpline[0].getPos(position2, this.mInterpolateData);
            this.mSpline[0].getSlope(position2, this.mInterpolateVelocity);
            if (this.mArcSpline != null && this.mInterpolateData.length > 0) {
                this.mArcSpline.getPos(position2, this.mInterpolateData);
                this.mArcSpline.getSlope(position2, this.mInterpolateVelocity);
            }
            if (!this.mNoMovement) {
                float position3 = position2;
                this.mStartMotionPath.setView(position3, child, this.mInterpolateVariables, this.mInterpolateData, this.mInterpolateVelocity, null, this.mForceMeasure);
                position2 = position3;
                view2 = child;
                this.mForceMeasure = false;
            } else {
                view2 = child;
            }
            if (this.mTransformPivotTarget != Key.UNSET) {
                if (this.mTransformPivotView == null) {
                    View layout = (View) view2.getParent();
                    this.mTransformPivotView = layout.findViewById(this.mTransformPivotTarget);
                }
                View layout2 = this.mTransformPivotView;
                if (layout2 != null) {
                    float cy = (this.mTransformPivotView.getTop() + this.mTransformPivotView.getBottom()) / 2.0f;
                    float cx = (this.mTransformPivotView.getLeft() + this.mTransformPivotView.getRight()) / 2.0f;
                    if (view2.getRight() - view2.getLeft() > 0 && view2.getBottom() - view2.getTop() > 0) {
                        float px = cx - view2.getLeft();
                        float py = cy - view2.getTop();
                        view2.setPivotX(px);
                        view2.setPivotY(py);
                    }
                }
            }
            if (this.mAttributesMap != null) {
                for (SplineSet aSpline2 : this.mAttributesMap.values()) {
                    if ((aSpline2 instanceof ViewSpline.PathRotate) && this.mInterpolateVelocity.length > 1) {
                        ((ViewSpline.PathRotate) aSpline2).setPathRotate(view2, position2, this.mInterpolateVelocity[0], this.mInterpolateVelocity[1]);
                    }
                    view2 = child;
                }
            }
            if (timePathRotate != null) {
                view = child;
                f = 0.0f;
                float position4 = position2;
                position2 = position4;
                timeAnimation |= timePathRotate.setPathRotate(view, keyCache, position4, time, this.mInterpolateVelocity[0], this.mInterpolateVelocity[1]);
            } else {
                view = child;
                f = 0.0f;
            }
            for (int i = 1; i < this.mSpline.length; i++) {
                CurveFit spline = this.mSpline[i];
                spline.getPos(position2, this.mValuesBuff);
                CustomSupport.setInterpolatedValue(this.mStartMotionPath.mAttributes.get(this.mAttributeNames[i - 1]), view, this.mValuesBuff);
            }
            if (this.mStartPoint.mVisibilityMode == 0) {
                if (position2 <= f) {
                    view.setVisibility(this.mStartPoint.mVisibility);
                } else if (position2 < 1.0f) {
                    if (this.mEndPoint.mVisibility != this.mStartPoint.mVisibility) {
                        view.setVisibility(0);
                    }
                } else {
                    view.setVisibility(this.mEndPoint.mVisibility);
                }
            }
            if (this.mKeyTriggers != null) {
                for (int i2 = 0; i2 < this.mKeyTriggers.length; i2++) {
                    this.mKeyTriggers[i2].conditionallyFire(position2, view);
                }
            }
            position2 = position2;
        } else {
            view = child;
            float float_l = this.mStartMotionPath.mX + ((this.mEndMotionPath.mX - this.mStartMotionPath.mX) * position2);
            float float_t = this.mStartMotionPath.mY + ((this.mEndMotionPath.mY - this.mStartMotionPath.mY) * position2);
            float float_width = this.mStartMotionPath.mWidth + ((this.mEndMotionPath.mWidth - this.mStartMotionPath.mWidth) * position2);
            float float_height = this.mStartMotionPath.mHeight + ((this.mEndMotionPath.mHeight - this.mStartMotionPath.mHeight) * position2);
            int l = (int) (float_l + 0.5f);
            int t = (int) (float_t + 0.5f);
            int r = (int) (float_l + 0.5f + float_width);
            int b = (int) (0.5f + float_t + float_height);
            int width = r - l;
            int height = b - t;
            if (this.mEndMotionPath.mWidth != this.mStartMotionPath.mWidth || this.mEndMotionPath.mHeight != this.mStartMotionPath.mHeight || this.mForceMeasure) {
                int widthMeasureSpec = View.MeasureSpec.makeMeasureSpec(width, BasicMeasure.EXACTLY);
                int heightMeasureSpec = View.MeasureSpec.makeMeasureSpec(height, BasicMeasure.EXACTLY);
                view.measure(widthMeasureSpec, heightMeasureSpec);
                this.mForceMeasure = false;
            }
            view.layout(l, t, r, b);
        }
        if (this.mCycleMap != null) {
            for (ViewOscillator osc : this.mCycleMap.values()) {
                if (osc instanceof ViewOscillator.PathRotateSet) {
                    position = position2;
                    ((ViewOscillator.PathRotateSet) osc).setPathRotate(view, position, this.mInterpolateVelocity[0], this.mInterpolateVelocity[1]);
                } else {
                    position = position2;
                    osc.setProperty(view, position);
                }
                position2 = position;
            }
        }
        return timeAnimation;
    }

    void getDpDt(float position, float locationX, float locationY, float[] mAnchorDpDt) {
        float position2 = getAdjustedPosition(position, this.mVelocity);
        if (this.mSpline != null) {
            this.mSpline[0].getSlope(position2, this.mInterpolateVelocity);
            this.mSpline[0].getPos(position2, this.mInterpolateData);
            float v = this.mVelocity[0];
            for (int i = 0; i < this.mInterpolateVelocity.length; i++) {
                double[] dArr = this.mInterpolateVelocity;
                dArr[i] = dArr[i] * ((double) v);
            }
            if (this.mArcSpline == null) {
                this.mStartMotionPath.setDpDt(locationX, locationY, mAnchorDpDt, this.mInterpolateVariables, this.mInterpolateVelocity, this.mInterpolateData);
                return;
            } else {
                if (this.mInterpolateData.length > 0) {
                    this.mArcSpline.getPos(position2, this.mInterpolateData);
                    this.mArcSpline.getSlope(position2, this.mInterpolateVelocity);
                    this.mStartMotionPath.setDpDt(locationX, locationY, mAnchorDpDt, this.mInterpolateVariables, this.mInterpolateVelocity, this.mInterpolateData);
                    return;
                }
                return;
            }
        }
        float dleft = this.mEndMotionPath.mX - this.mStartMotionPath.mX;
        float dTop = this.mEndMotionPath.mY - this.mStartMotionPath.mY;
        float dWidth = this.mEndMotionPath.mWidth - this.mStartMotionPath.mWidth;
        float dHeight = this.mEndMotionPath.mHeight - this.mStartMotionPath.mHeight;
        float dRight = dleft + dWidth;
        float dBottom = dTop + dHeight;
        mAnchorDpDt[0] = ((1.0f - locationX) * dleft) + (dRight * locationX);
        mAnchorDpDt[1] = ((1.0f - locationY) * dTop) + (dBottom * locationY);
    }

    void getPostLayoutDvDp(float position, int width, int height, float locationX, float locationY, float[] mAnchorDpDt) {
        float position2 = getAdjustedPosition(position, this.mVelocity);
        SplineSet trans_x = this.mAttributesMap == null ? null : this.mAttributesMap.get("translationX");
        SplineSet trans_y = this.mAttributesMap == null ? null : this.mAttributesMap.get("translationY");
        SplineSet rotation = this.mAttributesMap == null ? null : this.mAttributesMap.get(Key.ROTATION);
        SplineSet scale_x = this.mAttributesMap == null ? null : this.mAttributesMap.get("scaleX");
        SplineSet scale_y = this.mAttributesMap == null ? null : this.mAttributesMap.get("scaleY");
        ViewOscillator osc_x = this.mCycleMap == null ? null : this.mCycleMap.get("translationX");
        ViewOscillator osc_y = this.mCycleMap == null ? null : this.mCycleMap.get("translationY");
        ViewOscillator osc_r = this.mCycleMap == null ? null : this.mCycleMap.get(Key.ROTATION);
        ViewOscillator osc_sx = this.mCycleMap == null ? null : this.mCycleMap.get("scaleX");
        ViewOscillator osc_sy = this.mCycleMap != null ? this.mCycleMap.get("scaleY") : null;
        VelocityMatrix vmat = new VelocityMatrix();
        vmat.clear();
        vmat.setRotationVelocity(rotation, position2);
        vmat.setTranslationVelocity(trans_x, trans_y, position2);
        vmat.setScaleVelocity(scale_x, scale_y, position2);
        vmat.setRotationVelocity(osc_r, position2);
        vmat.setTranslationVelocity(osc_x, osc_y, position2);
        vmat.setScaleVelocity(osc_sx, osc_sy, position2);
        if (this.mArcSpline != null) {
            if (this.mInterpolateData.length > 0) {
                this.mArcSpline.getPos(position2, this.mInterpolateData);
                this.mArcSpline.getSlope(position2, this.mInterpolateVelocity);
                this.mStartMotionPath.setDpDt(locationX, locationY, mAnchorDpDt, this.mInterpolateVariables, this.mInterpolateVelocity, this.mInterpolateData);
            }
            vmat.applyTransform(locationX, locationY, width, height, mAnchorDpDt);
            return;
        }
        if (this.mSpline != null) {
            float position3 = getAdjustedPosition(position2, this.mVelocity);
            this.mSpline[0].getSlope(position3, this.mInterpolateVelocity);
            this.mSpline[0].getPos(position3, this.mInterpolateData);
            float v = this.mVelocity[0];
            int i = 0;
            while (i < this.mInterpolateVelocity.length) {
                double[] dArr = this.mInterpolateVelocity;
                int i2 = i;
                dArr[i2] = dArr[i] * ((double) v);
                i = i2 + 1;
            }
            this.mStartMotionPath.setDpDt(locationX, locationY, mAnchorDpDt, this.mInterpolateVariables, this.mInterpolateVelocity, this.mInterpolateData);
            vmat.applyTransform(locationX, locationY, width, height, mAnchorDpDt);
            return;
        }
        float dleft = this.mEndMotionPath.mX - this.mStartMotionPath.mX;
        float dTop = this.mEndMotionPath.mY - this.mStartMotionPath.mY;
        float dWidth = this.mEndMotionPath.mWidth - this.mStartMotionPath.mWidth;
        float dHeight = this.mEndMotionPath.mHeight - this.mStartMotionPath.mHeight;
        float dRight = dleft + dWidth;
        float dBottom = dTop + dHeight;
        mAnchorDpDt[0] = ((1.0f - locationX) * dleft) + (dRight * locationX);
        mAnchorDpDt[1] = ((1.0f - locationY) * dTop) + (dBottom * locationY);
        vmat.clear();
        vmat.setRotationVelocity(rotation, position2);
        vmat.setTranslationVelocity(trans_x, trans_y, position2);
        vmat.setScaleVelocity(scale_x, scale_y, position2);
        vmat.setRotationVelocity(osc_r, position2);
        vmat.setTranslationVelocity(osc_x, osc_y, position2);
        vmat.setScaleVelocity(osc_sx, osc_sy, position2);
        vmat.applyTransform(locationX, locationY, width, height, mAnchorDpDt);
    }

    public int getDrawPath() {
        int mode = this.mStartMotionPath.mDrawPath;
        for (MotionPaths keyFrame : this.mMotionPaths) {
            mode = Math.max(mode, keyFrame.mDrawPath);
        }
        return Math.max(mode, this.mEndMotionPath.mDrawPath);
    }

    public void setDrawPath(int debugMode) {
        this.mStartMotionPath.mDrawPath = debugMode;
    }

    String name() {
        Context context = this.mView.getContext();
        return context.getResources().getResourceEntryName(this.mView.getId());
    }

    void positionKeyframe(View view, KeyPositionBase key, float x, float y, String[] attribute, float[] value) {
        RectF start = new RectF();
        start.left = this.mStartMotionPath.mX;
        start.top = this.mStartMotionPath.mY;
        start.right = start.left + this.mStartMotionPath.mWidth;
        start.bottom = start.top + this.mStartMotionPath.mHeight;
        RectF end = new RectF();
        end.left = this.mEndMotionPath.mX;
        end.top = this.mEndMotionPath.mY;
        end.right = end.left + this.mEndMotionPath.mWidth;
        end.bottom = end.top + this.mEndMotionPath.mHeight;
        key.positionAttributes(view, start, end, x, y, attribute, value);
    }

    public int getKeyFramePositions(int[] type, float[] pos) {
        int i = 0;
        int count = 0;
        for (Key key : this.mKeyList) {
            int i2 = i + 1;
            type[i] = key.mFramePosition + (key.mType * 1000);
            float time = key.mFramePosition / 100.0f;
            this.mSpline[0].getPos(time, this.mInterpolateData);
            this.mStartMotionPath.getCenter(time, this.mInterpolateVariables, this.mInterpolateData, pos, count);
            count += 2;
            i = i2;
        }
        return i;
    }

    public int getKeyFrameInfo(int type, int[] info) {
        int count = 0;
        int cursor = 0;
        float[] pos = new float[2];
        for (Key key : this.mKeyList) {
            if (key.mType == type || type != -1) {
                int len = cursor;
                info[cursor] = 0;
                int cursor2 = cursor + 1;
                info[cursor2] = key.mType;
                int cursor3 = cursor2 + 1;
                info[cursor3] = key.mFramePosition;
                float time = key.mFramePosition / 100.0f;
                this.mSpline[0].getPos(time, this.mInterpolateData);
                this.mStartMotionPath.getCenter(time, this.mInterpolateVariables, this.mInterpolateData, pos, 0);
                int cursor4 = cursor3 + 1;
                info[cursor4] = Float.floatToIntBits(pos[0]);
                int cursor5 = cursor4 + 1;
                info[cursor5] = Float.floatToIntBits(pos[1]);
                if (key instanceof KeyPosition) {
                    KeyPosition kp = (KeyPosition) key;
                    int cursor6 = cursor5 + 1;
                    info[cursor6] = kp.mPositionType;
                    int cursor7 = cursor6 + 1;
                    info[cursor7] = Float.floatToIntBits(kp.mPercentX);
                    cursor5 = cursor7 + 1;
                    info[cursor5] = Float.floatToIntBits(kp.mPercentY);
                }
                cursor = cursor5 + 1;
                info[len] = cursor - len;
                count++;
            }
        }
        return count;
    }
}
