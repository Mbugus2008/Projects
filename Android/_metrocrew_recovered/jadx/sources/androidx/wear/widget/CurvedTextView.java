package androidx.wear.widget;

import android.R;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.os.Build;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import kotlin.text.Typography;

/* JADX INFO: loaded from: classes.dex */
public class CurvedTextView extends View implements ArcLayout.Widget {
    private static final float ANCHOR_DEGREE_OFFSET = -90.0f;
    private static final boolean DEFAULT_CLOCKWISE = true;
    private static final int DEFAULT_TEXT_COLOR = -1;
    private static final float DEFAULT_TEXT_SIZE = 24.0f;
    private static final int DEFAULT_TEXT_STYLE = 0;
    private static final int FONT_WEIGHT_MAX = 1000;
    private static final float ITALIC_SKEW_X = -0.25f;
    private static final float MAX_SWEEP_DEGREE = 359.9f;
    private static final float MIN_SWEEP_DEGREE = 0.0f;
    private static final float UNSET_ANCHOR_DEGREE = -1.0f;
    private static final int UNSET_ANCHOR_TYPE = -1;
    private float mAnchorAngleDegrees;
    private int mAnchorType;
    private float mBackgroundSweepDegrees;
    private final Rect mBgBounds;
    private final Path mBgPath;
    private final Rect mBounds;
    private boolean mClockwise;
    private boolean mDirty;
    private TextUtils.TruncateAt mEllipsize;
    private String mFontFeatureSettings;
    private String mFontVariationSettings;
    private boolean mHandlingTouch;
    private int mLastUsedTextAlignment;
    private float mLetterSpacing;
    private float mLocalRotateAngle;
    private float mMaxSweepDegrees;
    private float mMinSweepDegrees;
    private final TextPaint mPaint;
    private final Path mPath;
    private float mPathRadius;
    private String mText;
    private int mTextColor;
    private float mTextSize;
    private float mTextSweepDegrees;
    private String mTextToDraw;
    private Typeface mTypeface;

    public CurvedTextView(Context context) {
        this(context, null);
    }

    public CurvedTextView(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.textViewStyle);
    }

    public CurvedTextView(Context context, AttributeSet attrs, int defStyle) {
        this(context, attrs, defStyle, 0);
    }

    public CurvedTextView(Context context, AttributeSet attrs, int defStyle, int defStyleRes) {
        super(context, attrs, defStyle, defStyleRes);
        this.mPath = new Path();
        this.mBgPath = new Path();
        this.mPaint = new TextPaint();
        this.mBounds = new Rect();
        this.mBgBounds = new Rect();
        this.mDirty = true;
        this.mTextToDraw = "";
        this.mPathRadius = 0.0f;
        this.mTextSweepDegrees = 0.0f;
        this.mBackgroundSweepDegrees = MAX_SWEEP_DEGREE;
        this.mLastUsedTextAlignment = -1;
        this.mLocalRotateAngle = 0.0f;
        this.mText = "";
        this.mTextSize = DEFAULT_TEXT_SIZE;
        this.mTypeface = null;
        this.mClockwise = true;
        this.mTextColor = -1;
        this.mEllipsize = null;
        this.mLetterSpacing = 0.0f;
        this.mFontFeatureSettings = null;
        this.mFontVariationSettings = null;
        this.mHandlingTouch = false;
        this.mPaint.setAntiAlias(true);
        TextAppearanceAttributes attributes = new TextAppearanceAttributes();
        attributes.mTextColor = ColorStateList.valueOf(-1);
        Resources.Theme theme = context.getTheme();
        TypedArray a = theme.obtainStyledAttributes(attrs, androidx.wear.R.styleable.TextViewAppearance, defStyle, defStyleRes);
        int ap = a.getResourceId(androidx.wear.R.styleable.TextViewAppearance_android_textAppearance, -1);
        a.recycle();
        TypedArray appearance = ap != -1 ? theme.obtainStyledAttributes(ap, androidx.wear.R.styleable.TextAppearance) : null;
        if (appearance != null) {
            readTextAppearance(appearance, attributes, true);
            appearance.recycle();
        }
        TypedArray a2 = context.obtainStyledAttributes(attrs, androidx.wear.R.styleable.CurvedTextView, defStyle, defStyleRes);
        readTextAppearance(a2, attributes, false);
        if (a2.hasValue(androidx.wear.R.styleable.CurvedTextView_android_text)) {
            this.mText = a2.getString(androidx.wear.R.styleable.CurvedTextView_android_text);
        }
        int textEllipsize = a2.getInt(androidx.wear.R.styleable.CurvedTextView_android_ellipsize, 0);
        switch (textEllipsize) {
            case 1:
                this.mEllipsize = TextUtils.TruncateAt.START;
                break;
            case 2:
                this.mEllipsize = TextUtils.TruncateAt.MIDDLE;
                break;
            case 3:
                this.mEllipsize = TextUtils.TruncateAt.END;
                break;
            default:
                this.mEllipsize = null;
                break;
        }
        this.mMaxSweepDegrees = a2.getFloat(androidx.wear.R.styleable.CurvedTextView_maxSweepDegrees, MAX_SWEEP_DEGREE);
        this.mMaxSweepDegrees = Math.min(this.mMaxSweepDegrees, MAX_SWEEP_DEGREE);
        this.mMinSweepDegrees = a2.getFloat(androidx.wear.R.styleable.CurvedTextView_minSweepDegrees, 0.0f);
        if (this.mMinSweepDegrees <= this.mMaxSweepDegrees) {
            this.mAnchorType = a2.getInt(androidx.wear.R.styleable.CurvedTextView_anchorPosition, -1);
            this.mAnchorAngleDegrees = a2.getFloat(androidx.wear.R.styleable.CurvedTextView_anchorAngleDegrees, UNSET_ANCHOR_DEGREE);
            this.mAnchorAngleDegrees %= 360.0f;
            this.mClockwise = a2.getBoolean(androidx.wear.R.styleable.CurvedTextView_clockwise, true);
            a2.recycle();
            applyTextAppearance(attributes);
            this.mPaint.setTextSize(this.mTextSize);
            return;
        }
        throw new IllegalArgumentException("MinSweepDegrees cannot be bigger than MaxSweepDegrees");
    }

    @Override // androidx.wear.widget.ArcLayout.Widget
    public float getSweepAngleDegrees() {
        return this.mBackgroundSweepDegrees;
    }

    @Override // androidx.wear.widget.ArcLayout.Widget
    public void setSweepAngleDegrees(float angleDegrees) {
        this.mBackgroundSweepDegrees = angleDegrees;
    }

    @Override // androidx.wear.widget.ArcLayout.Widget
    public int getThickness() {
        return Math.round(this.mPaint.getFontMetrics().descent - this.mPaint.getFontMetrics().ascent);
    }

    @Override // androidx.wear.widget.ArcLayout.Widget
    public void checkInvalidAttributeAsChild() {
        if (this.mAnchorType != -1) {
            throw new IllegalArgumentException("CurvedTextView shall not set anchorType value when added intoArcLayout");
        }
        if (this.mAnchorAngleDegrees != UNSET_ANCHOR_DEGREE) {
            throw new IllegalArgumentException("CurvedTextView shall not set anchorAngleDegrees value when added into ArcLayout");
        }
    }

    @Override // androidx.wear.widget.ArcLayout.Widget
    public boolean isPointInsideClickArea(float x, float y) {
        float radius2 = (Math.min(getWidth(), getHeight()) / 2.0f) - (this.mClockwise ? getPaddingTop() : getPaddingBottom());
        float radius1 = (radius2 - this.mPaint.getFontMetrics().descent) + this.mPaint.getFontMetrics().ascent;
        float dx = x - (getWidth() / 2);
        float dy = y - (getHeight() / 2);
        float r2 = (dx * dx) + (dy * dy);
        if (r2 < radius1 * radius1 || r2 > radius2 * radius2) {
            return false;
        }
        float angle = (float) Math.toDegrees(Math.atan2(Math.abs(dx), -dy));
        return angle < this.mBackgroundSweepDegrees / 2.0f;
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        doUpdate();
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        this.mPaint.getTextBounds(this.mText, 0, this.mText.length(), this.mBounds);
        this.mPathRadius = (Math.min(getMeasuredWidth(), getMeasuredHeight()) / 2.0f) + (this.mClockwise ? this.mPaint.getFontMetrics().ascent - getPaddingTop() : (-this.mPaint.getFontMetrics().descent) - getPaddingBottom());
        this.mTextSweepDegrees = Math.min(((getWidthSelf() / this.mPathRadius) / 3.1415927f) * 180.0f, MAX_SWEEP_DEGREE);
        this.mBackgroundSweepDegrees = Math.max(Math.min(this.mMaxSweepDegrees, this.mTextSweepDegrees), this.mMinSweepDegrees);
    }

    private float getWidthSelf() {
        return this.mBounds.width() + getPaddingLeft() + getPaddingRight();
    }

    private String ellipsize(int ellipsizedWidth) {
        StaticLayout.Builder layoutBuilder = StaticLayout.Builder.obtain(this.mText, 0, this.mText.length(), this.mPaint, ellipsizedWidth);
        layoutBuilder.setEllipsize(this.mEllipsize);
        layoutBuilder.setMaxLines(1);
        StaticLayout layout = layoutBuilder.build();
        if (this.mEllipsize == null) {
            return this.mText.substring(0, layout.getLineEnd(0));
        }
        int ellipsisCount = layout.getEllipsisCount(0);
        if (ellipsisCount == 0) {
            return this.mText;
        }
        int ellipsisStart = layout.getEllipsisStart(0);
        char[] textToDrawArray = this.mText.toCharArray();
        textToDrawArray[ellipsisStart] = Typography.ellipsis;
        for (int i = ellipsisStart + 1; i < ellipsisStart + ellipsisCount; i++) {
            if (i >= 0 && i < this.mText.length()) {
                textToDrawArray[i] = 65279;
            }
        }
        return new String(textToDrawArray);
    }

    private void updatePathsIfNeeded(boolean withBackground) {
        float alignmentFactor;
        float anchorTypeFactor;
        int iMin;
        int iMax;
        if (this.mDirty || getTextAlignment() != this.mLastUsedTextAlignment) {
            this.mDirty = false;
            this.mLastUsedTextAlignment = getTextAlignment();
            if (this.mTextSweepDegrees <= this.mMaxSweepDegrees) {
                this.mTextToDraw = this.mText;
            } else {
                this.mTextToDraw = ellipsize((((int) ((((double) (this.mMaxSweepDegrees / 180.0f)) * 3.141592653589793d) * ((double) this.mPathRadius))) - getPaddingLeft()) - getPaddingRight());
                this.mTextSweepDegrees = this.mMaxSweepDegrees;
            }
            float clockwiseFactor = this.mClockwise ? 1.0f : -1.0f;
            switch (getTextAlignment()) {
                case 2:
                case 5:
                    alignmentFactor = 0.0f;
                    break;
                case 3:
                case 6:
                    alignmentFactor = 1.0f;
                    break;
                case 4:
                default:
                    alignmentFactor = 0.5f;
                    break;
            }
            switch (this.mAnchorType) {
                case 0:
                    anchorTypeFactor = 0.5f;
                    break;
                case 1:
                default:
                    anchorTypeFactor = 0.0f;
                    break;
                case 2:
                    anchorTypeFactor = -0.5f;
                    break;
            }
            this.mLocalRotateAngle = (this.mAnchorAngleDegrees == UNSET_ANCHOR_DEGREE ? 0.0f : this.mAnchorAngleDegrees) + (clockwiseFactor * anchorTypeFactor * this.mBackgroundSweepDegrees);
            float backgroundStartAngle = ((-clockwiseFactor) * 0.5f * this.mBackgroundSweepDegrees) + ANCHOR_DEGREE_OFFSET;
            float textStartAngle = backgroundStartAngle + (((float) (((double) ((this.mBackgroundSweepDegrees - this.mTextSweepDegrees) * alignmentFactor)) + ((((double) (getPaddingLeft() / this.mPathRadius)) / 3.141592653589793d) * 180.0d))) * clockwiseFactor);
            float centerX = getWidth() / 2.0f;
            float centerY = getHeight() / 2.0f;
            this.mPath.reset();
            this.mPath.addArc(centerX - this.mPathRadius, centerY - this.mPathRadius, centerX + this.mPathRadius, centerY + this.mPathRadius, textStartAngle, clockwiseFactor * this.mTextSweepDegrees);
            if (withBackground) {
                this.mBgPath.reset();
                float radius1 = this.mPathRadius - (this.mPaint.getFontMetrics().descent * clockwiseFactor);
                float radius2 = this.mPathRadius - (this.mPaint.getFontMetrics().ascent * clockwiseFactor);
                this.mBgPath.arcTo(centerX - radius2, centerY - radius2, centerX + radius2, centerY + radius2, backgroundStartAngle, this.mBackgroundSweepDegrees * clockwiseFactor, false);
                this.mBgPath.arcTo(centerX - radius1, centerY - radius1, centerX + radius1, centerY + radius1, backgroundStartAngle + (this.mBackgroundSweepDegrees * clockwiseFactor), (-clockwiseFactor) * this.mBackgroundSweepDegrees, false);
                this.mBgPath.close();
                float x0 = (float) (((double) centerX) + (((double) radius2) * Math.cos((((double) backgroundStartAngle) * 3.141592653589793d) / 180.0d)));
                float x1 = (float) (((double) centerX) + (((double) radius1) * Math.cos((((double) backgroundStartAngle) * 3.141592653589793d) / 180.0d)));
                float y0 = (float) (((double) centerY) + (((double) radius2) * Math.sin((((double) backgroundStartAngle) * 3.141592653589793d) / 180.0d)));
                float y1 = (float) (((double) centerY) + (Math.sin((((double) backgroundStartAngle) * 3.141592653589793d) / 180.0d) * ((double) radius1)));
                float angle = backgroundStartAngle + (this.mBackgroundSweepDegrees * clockwiseFactor);
                float x2 = (float) (((double) centerX) + (Math.cos((((double) angle) * 3.141592653589793d) / 180.0d) * ((double) radius2)));
                float x3 = (float) (((double) centerX) + (Math.cos((((double) angle) * 3.141592653589793d) / 180.0d) * ((double) radius1)));
                float outerRadius = Math.max(radius1, radius2);
                this.mBgBounds.top = (int) (centerY - outerRadius);
                this.mBgBounds.bottom = (int) Math.max(y0, y1);
                Rect rect = this.mBgBounds;
                if (this.mBackgroundSweepDegrees >= 180.0f) {
                    iMin = (int) (centerX - outerRadius);
                } else {
                    iMin = (int) Math.min(x0, Math.min(x1, Math.min(x2, x3)));
                }
                rect.left = iMin;
                Rect rect2 = this.mBgBounds;
                if (this.mBackgroundSweepDegrees >= 180.0f) {
                    iMax = (int) (centerX + outerRadius);
                } else {
                    iMax = (int) Math.max(x0, Math.max(x1, Math.max(x2, x3)));
                }
                rect2.right = iMax;
            }
        }
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        if (!this.mHandlingTouch && event.getAction() != 0) {
            return false;
        }
        float x0 = event.getX() - (getWidth() / 2);
        float y0 = event.getY() - (getHeight() / 2);
        double rotAngle = -Math.toRadians(this.mLocalRotateAngle);
        float tempX = (float) (((((double) x0) * Math.cos(rotAngle)) - (((double) y0) * Math.sin(rotAngle))) + ((double) (getWidth() / 2)));
        float y1 = (float) ((((double) x0) * Math.sin(rotAngle)) + (((double) y0) * Math.cos(rotAngle)) + ((double) (getHeight() / 2)));
        if (!this.mHandlingTouch && isPointInsideClickArea(tempX, y1)) {
            this.mHandlingTouch = true;
        }
        if (!this.mHandlingTouch) {
            return false;
        }
        if (event.getAction() == 1 || event.getAction() == 3) {
            this.mHandlingTouch = false;
        }
        event.offsetLocation(tempX - event.getX(), y1 - event.getY());
        return super.onTouchEvent(event);
    }

    @Override // android.view.View
    public void draw(Canvas canvas) {
        canvas.save();
        boolean withBackground = getBackground() != null;
        updatePathsIfNeeded(withBackground);
        canvas.rotate(this.mLocalRotateAngle, getWidth() / 2.0f, getHeight() / 2.0f);
        if (withBackground) {
            canvas.clipPath(this.mBgPath);
            getBackground().setBounds(this.mBgBounds);
        }
        super.draw(canvas);
        canvas.restore();
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        this.mPaint.setColor(this.mTextColor);
        this.mPaint.setStyle(Paint.Style.FILL);
        canvas.drawTextOnPath(this.mTextToDraw, this.mPath, 0.0f, 0.0f, this.mPaint);
    }

    private void setTypefaceFromAttrs(String familyName, int typefaceIndex, int style, int weight) {
        if (this.mTypeface == null && familyName != null) {
            Typeface normalTypeface = Typeface.create(familyName, 0);
            resolveStyleAndSetTypeface(normalTypeface, style, weight);
            return;
        }
        if (this.mTypeface != null) {
            resolveStyleAndSetTypeface(this.mTypeface, style, weight);
            return;
        }
        switch (typefaceIndex) {
            case 1:
                resolveStyleAndSetTypeface(Typeface.SANS_SERIF, style, weight);
                break;
            case 2:
                resolveStyleAndSetTypeface(Typeface.SERIF, style, weight);
                break;
            case 3:
                resolveStyleAndSetTypeface(Typeface.MONOSPACE, style, weight);
                break;
            default:
                resolveStyleAndSetTypeface(null, style, weight);
                break;
        }
    }

    private void resolveStyleAndSetTypeface(Typeface tf, int style, int weight) {
        if (weight >= 0 && Build.VERSION.SDK_INT >= 28) {
            int clampedWeight = Math.min(1000, weight);
            boolean italic = (style & 2) != 0;
            this.mTypeface = Api28Impl.createTypeface(tf, clampedWeight, italic);
            this.mPaint.setTypeface(this.mTypeface);
            return;
        }
        setTypeface(tf, style);
    }

    public void setTypeface(Typeface tf, int style) {
        Typeface tf2;
        if (style > 0) {
            if (tf == null) {
                tf2 = Typeface.defaultFromStyle(style);
            } else {
                tf2 = Typeface.create(tf, style);
            }
            if (!tf2.equals(this.mPaint.getTypeface())) {
                this.mPaint.setTypeface(tf2);
                this.mTypeface = tf2;
            }
            int typefaceStyle = tf2 != null ? tf2.getStyle() : 0;
            int need = (~typefaceStyle) & style;
            this.mPaint.setFakeBoldText((need & 1) != 0);
            this.mPaint.setTextSkewX((need & 2) != 0 ? ITALIC_SKEW_X : 0.0f);
        } else {
            this.mPaint.setFakeBoldText(false);
            this.mPaint.setTextSkewX(0.0f);
            if ((tf != null && !tf.equals(this.mPaint.getTypeface())) || (tf == null && this.mPaint.getTypeface() != null)) {
                this.mPaint.setTypeface(tf);
                this.mTypeface = tf;
            }
        }
        doUpdate();
    }

    private static class TextAppearanceAttributes {
        ColorStateList mTextColor = null;
        float mTextSize = CurvedTextView.DEFAULT_TEXT_SIZE;
        String mFontFamily = null;
        boolean mFontFamilyExplicit = false;
        int mTypefaceIndex = -1;
        int mTextStyle = 0;
        int mFontWeight = -1;
        float mLetterSpacing = 0.0f;
        String mFontFeatureSettings = null;
        String mFontVariationSettings = null;

        TextAppearanceAttributes() {
        }
    }

    private void applyTextAppearance(TextAppearanceAttributes attributes) {
        if (attributes.mTextColor != null) {
            this.mTextColor = attributes.mTextColor.getDefaultColor();
        }
        if (attributes.mTextSize != UNSET_ANCHOR_DEGREE) {
            this.mTextSize = attributes.mTextSize;
        }
        setTypefaceFromAttrs(attributes.mFontFamily, attributes.mTypefaceIndex, attributes.mTextStyle, attributes.mFontWeight);
        this.mPaint.setLetterSpacing(attributes.mLetterSpacing);
        this.mLetterSpacing = attributes.mLetterSpacing;
        this.mPaint.setFontFeatureSettings(attributes.mFontFeatureSettings);
        this.mFontFeatureSettings = attributes.mFontFeatureSettings;
        if (Build.VERSION.SDK_INT >= 26) {
            Api26Impl.paintSetFontVariationSettings(this.mPaint, attributes.mFontVariationSettings);
        }
        this.mFontVariationSettings = attributes.mFontVariationSettings;
    }

    private void readTextAppearance(TypedArray appearance, TextAppearanceAttributes attributes, boolean isTextAppearance) {
        int attrIndex = isTextAppearance ? androidx.wear.R.styleable.TextAppearance_android_textColor : androidx.wear.R.styleable.CurvedTextView_android_textColor;
        if (appearance.hasValue(attrIndex)) {
            attributes.mTextColor = appearance.getColorStateList(attrIndex);
        }
        attributes.mTextSize = appearance.getDimensionPixelSize(isTextAppearance ? androidx.wear.R.styleable.TextAppearance_android_textSize : androidx.wear.R.styleable.CurvedTextView_android_textSize, (int) attributes.mTextSize);
        attributes.mTextStyle = appearance.getInt(isTextAppearance ? androidx.wear.R.styleable.TextAppearance_android_textStyle : androidx.wear.R.styleable.CurvedTextView_android_textStyle, attributes.mTextStyle);
        attributes.mTypefaceIndex = appearance.getInt(isTextAppearance ? androidx.wear.R.styleable.TextAppearance_android_typeface : androidx.wear.R.styleable.CurvedTextView_android_typeface, attributes.mTypefaceIndex);
        if (attributes.mTypefaceIndex != -1 && !attributes.mFontFamilyExplicit) {
            attributes.mFontFamily = null;
        }
        int attrIndex2 = isTextAppearance ? androidx.wear.R.styleable.TextAppearance_android_fontFamily : androidx.wear.R.styleable.CurvedTextView_android_fontFamily;
        if (appearance.hasValue(attrIndex2)) {
            attributes.mFontFamily = appearance.getString(attrIndex2);
            attributes.mFontFamilyExplicit = !isTextAppearance;
        }
        attributes.mFontWeight = appearance.getInt(isTextAppearance ? androidx.wear.R.styleable.TextAppearance_android_textFontWeight : androidx.wear.R.styleable.CurvedTextView_android_textFontWeight, attributes.mFontWeight);
        attributes.mLetterSpacing = appearance.getFloat(isTextAppearance ? androidx.wear.R.styleable.TextAppearance_android_letterSpacing : androidx.wear.R.styleable.CurvedTextView_android_letterSpacing, attributes.mLetterSpacing);
        int attrIndex3 = isTextAppearance ? androidx.wear.R.styleable.TextAppearance_android_fontFeatureSettings : androidx.wear.R.styleable.CurvedTextView_android_fontFeatureSettings;
        if (appearance.hasValue(attrIndex3)) {
            attributes.mFontFeatureSettings = appearance.getString(attrIndex3);
        }
        int attrIndex4 = isTextAppearance ? androidx.wear.R.styleable.TextAppearance_android_fontVariationSettings : androidx.wear.R.styleable.CurvedTextView_android_fontVariationSettings;
        if (appearance.hasValue(attrIndex4)) {
            attributes.mFontVariationSettings = appearance.getString(attrIndex4);
        }
    }

    private void doUpdate() {
        this.mDirty = true;
        requestLayout();
        postInvalidate();
    }

    private void doRedraw() {
        this.mDirty = true;
        postInvalidate();
    }

    public int getAnchorType() {
        return this.mAnchorType;
    }

    public void setAnchorType(int value) {
        this.mAnchorType = value;
        doUpdate();
    }

    public float getAnchorAngleDegrees() {
        return this.mAnchorAngleDegrees;
    }

    public void setAnchorAngleDegrees(float value) {
        this.mAnchorAngleDegrees = value;
        doRedraw();
    }

    public void setSweepRangeDegrees(float minSweep, float maxSweep) {
        if (minSweep > maxSweep) {
            throw new IllegalArgumentException("MaxSweepDegrees cannot be smaller than MinSweepDegrees");
        }
        this.mMinSweepDegrees = Math.min(Math.max(minSweep, 0.0f), MAX_SWEEP_DEGREE);
        this.mMaxSweepDegrees = Math.min(maxSweep, MAX_SWEEP_DEGREE);
        doUpdate();
    }

    public float getMinSweepDegrees() {
        return this.mMinSweepDegrees;
    }

    public float getMaxSweepDegrees() {
        return this.mMaxSweepDegrees;
    }

    public String getText() {
        return this.mText;
    }

    public void setText(String value) {
        this.mText = value == null ? "" : value;
        doUpdate();
    }

    public float getTextSize() {
        return this.mTextSize;
    }

    public void setTextSize(float value) {
        this.mTextSize = value;
        this.mPaint.setTextSize(this.mTextSize);
        doUpdate();
    }

    public Typeface getTypeface() {
        return this.mTypeface;
    }

    public void setTypeface(Typeface value) {
        this.mTypeface = value;
        doUpdate();
    }

    public boolean isClockwise() {
        return this.mClockwise;
    }

    public void setClockwise(boolean value) {
        this.mClockwise = value;
        doUpdate();
    }

    public int getTextColor() {
        return this.mTextColor;
    }

    public void setTextColor(int value) {
        this.mTextColor = value;
        doRedraw();
    }

    public TextUtils.TruncateAt getEllipsize() {
        return this.mEllipsize;
    }

    public void setEllipsize(TextUtils.TruncateAt value) {
        this.mEllipsize = value;
        doRedraw();
    }

    public float getLetterSpacing() {
        return this.mLetterSpacing;
    }

    public void setLetterSpacing(float value) {
        this.mLetterSpacing = value;
        doUpdate();
    }

    public String getFontFeatureSettings() {
        return this.mFontFeatureSettings;
    }

    public void setFontFeatureSettings(String value) {
        this.mFontFeatureSettings = value;
        doUpdate();
    }

    public String getFontVariationSettings() {
        return this.mFontVariationSettings;
    }

    public void setFontVariationSettings(String value) {
        this.mFontVariationSettings = value;
        doUpdate();
    }

    @Override // android.view.View
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
        super.onInitializeAccessibilityNodeInfo(info);
        info.setText(this.mText);
    }

    @Override // android.view.View
    public void onPopulateAccessibilityEvent(AccessibilityEvent event) {
        super.onPopulateAccessibilityEvent(event);
        event.getText().add(this.mText);
    }

    private static class Api26Impl {
        private Api26Impl() {
        }

        static void paintSetFontVariationSettings(Paint paint, String fontVariationSettings) {
            paint.setFontVariationSettings(fontVariationSettings);
        }
    }

    private static class Api28Impl {
        private Api28Impl() {
        }

        static Typeface createTypeface(Typeface family, int weight, boolean italic) {
            return Typeface.create(family, weight, italic);
        }
    }
}
