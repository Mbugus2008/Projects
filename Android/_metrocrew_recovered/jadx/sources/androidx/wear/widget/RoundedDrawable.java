package androidx.wear.widget;

import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.Xml;
import androidx.wear.R;
import java.io.IOException;
import java.util.Objects;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;

/* JADX INFO: loaded from: classes.dex */
public class RoundedDrawable extends Drawable {
    final Paint mBackgroundPaint;
    private Drawable mDrawable;
    private boolean mIsClipEnabled;
    private int mRadius;
    private final Rect mTmpBounds = new Rect();
    private final RectF mTmpBoundsF = new RectF();
    final Paint mPaint = new Paint();

    public RoundedDrawable() {
        this.mPaint.setAntiAlias(true);
        this.mBackgroundPaint = new Paint();
        this.mBackgroundPaint.setAntiAlias(true);
        this.mBackgroundPaint.setColor(0);
    }

    @Override // android.graphics.drawable.Drawable
    public void inflate(Resources r, XmlPullParser parser, AttributeSet attrs, Resources.Theme theme) throws XmlPullParserException, IOException {
        super.inflate(r, parser, attrs, theme);
        TypedArray a = r.obtainAttributes(Xml.asAttributeSet(parser), R.styleable.RoundedDrawable);
        if (a.hasValue(R.styleable.RoundedDrawable_android_src)) {
            setDrawable(a.getDrawable(R.styleable.RoundedDrawable_android_src));
        }
        setRadius(a.getDimensionPixelSize(R.styleable.RoundedDrawable_radius, 0));
        setClipEnabled(a.getBoolean(R.styleable.RoundedDrawable_clipEnabled, false));
        setBackgroundColor(a.getColor(R.styleable.RoundedDrawable_backgroundColor, 0));
        a.recycle();
    }

    public void setDrawable(Drawable drawable) {
        if (Objects.equals(this.mDrawable, drawable)) {
            return;
        }
        this.mDrawable = drawable;
        this.mPaint.setShader(null);
        invalidateSelf();
    }

    public Drawable getDrawable() {
        return this.mDrawable;
    }

    public void setBackgroundColor(int color) {
        this.mBackgroundPaint.setColor(color);
        invalidateSelf();
    }

    public int getBackgroundColor() {
        return this.mBackgroundPaint.getColor();
    }

    public void setClipEnabled(boolean clipEnabled) {
        this.mIsClipEnabled = clipEnabled;
        if (!clipEnabled) {
            this.mPaint.setShader(null);
        }
        invalidateSelf();
    }

    public boolean isClipEnabled() {
        return this.mIsClipEnabled;
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        this.mTmpBounds.right = bounds.width();
        this.mTmpBounds.bottom = bounds.height();
        this.mTmpBoundsF.right = bounds.width();
        this.mTmpBoundsF.bottom = bounds.height();
        this.mPaint.setShader(null);
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        Rect bounds = getBounds();
        if (this.mDrawable == null || bounds.isEmpty()) {
            return;
        }
        canvas.save();
        canvas.translate(bounds.left, bounds.top);
        canvas.drawRoundRect(this.mTmpBoundsF, this.mRadius, this.mRadius, this.mBackgroundPaint);
        if (this.mIsClipEnabled) {
            if (this.mPaint.getShader() == null) {
                updateBitmapShader();
            }
            canvas.drawRoundRect(this.mTmpBoundsF, this.mRadius, this.mRadius, this.mPaint);
        } else {
            int minEdge = Math.min(bounds.width(), bounds.height());
            int padding = (int) Math.ceil(Math.min(this.mRadius, minEdge / 2) * (1.0f - (1.0f / ((float) Math.sqrt(2.0d)))));
            this.mTmpBounds.inset(padding, padding);
            this.mDrawable.setBounds(this.mTmpBounds);
            this.mDrawable.draw(canvas);
            this.mTmpBounds.inset(-padding, -padding);
        }
        canvas.restore();
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return -3;
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.mPaint.setAlpha(alpha);
        this.mBackgroundPaint.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.Drawable
    public int getAlpha() {
        return this.mPaint.getAlpha();
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        this.mPaint.setColorFilter(cf);
    }

    public void setRadius(int radius) {
        this.mRadius = radius;
    }

    public int getRadius() {
        return this.mRadius;
    }

    private void updateBitmapShader() {
        if (this.mDrawable == null) {
            return;
        }
        Rect bounds = getBounds();
        if (!bounds.isEmpty()) {
            Bitmap bitmap = drawableToBitmap(this.mDrawable, bounds.width(), bounds.height());
            Shader shader = new BitmapShader(bitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
            this.mPaint.setShader(shader);
        }
    }

    private Bitmap drawableToBitmap(Drawable drawable, int width, int height) {
        Bitmap bitmap = Bitmap.createBitmap(width, height, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(bitmap);
        drawable.setBounds(0, 0, width, height);
        drawable.draw(canvas);
        return bitmap;
    }
}
