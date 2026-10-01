.class public Landroidx/wear/widget/RoundedDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "RoundedDrawable.java"


# instance fields
.field final mBackgroundPaint:Landroid/graphics/Paint;

.field private mDrawable:Landroid/graphics/drawable/Drawable;

.field private mIsClipEnabled:Z

.field final mPaint:Landroid/graphics/Paint;

.field private mRadius:I

.field private final mTmpBounds:Landroid/graphics/Rect;

.field private final mTmpBoundsF:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 93
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 90
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mTmpBounds:Landroid/graphics/Rect;

    .line 91
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mTmpBoundsF:Landroid/graphics/RectF;

    .line 94
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mPaint:Landroid/graphics/Paint;

    .line 95
    iget-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 96
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    .line 97
    iget-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 98
    iget-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 99
    return-void
.end method

.method private drawableToBitmap(Landroid/graphics/drawable/Drawable;II)Landroid/graphics/Bitmap;
    .locals 3
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;
    .param p2, "width"    # I
    .param p3, "height"    # I

    .line 290
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p2, p3, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 292
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 293
    .local v1, "canvas":Landroid/graphics/Canvas;
    const/4 v2, 0x0

    invoke-virtual {p1, v2, v2, p2, p3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 294
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 295
    return-object v0
.end method

.method private updateBitmapShader()V
    .locals 5

    .line 276
    iget-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_0

    .line 277
    return-void

    .line 279
    :cond_0
    invoke-virtual {p0}, Landroidx/wear/widget/RoundedDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 280
    .local v0, "bounds":Landroid/graphics/Rect;
    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 281
    iget-object v1, p0, Landroidx/wear/widget/RoundedDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v3

    invoke-direct {p0, v1, v2, v3}, Landroidx/wear/widget/RoundedDrawable;->drawableToBitmap(Landroid/graphics/drawable/Drawable;II)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 283
    .local v1, "bitmap":Landroid/graphics/Bitmap;
    new-instance v2, Landroid/graphics/BitmapShader;

    sget-object v3, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v4, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v2, v1, v3, v4}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 284
    .local v2, "shader":Landroid/graphics/Shader;
    iget-object v3, p0, Landroidx/wear/widget/RoundedDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 286
    .end local v1    # "bitmap":Landroid/graphics/Bitmap;
    .end local v2    # "shader":Landroid/graphics/Shader;
    :cond_1
    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 6
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .line 200
    invoke-virtual {p0}, Landroidx/wear/widget/RoundedDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 201
    .local v0, "bounds":Landroid/graphics/Rect;
    iget-object v1, p0, Landroidx/wear/widget/RoundedDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_1

    .line 204
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 205
    iget v1, v0, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    iget v2, v0, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 208
    iget-object v1, p0, Landroidx/wear/widget/RoundedDrawable;->mTmpBoundsF:Landroid/graphics/RectF;

    iget v2, p0, Landroidx/wear/widget/RoundedDrawable;->mRadius:I

    int-to-float v2, v2

    iget v3, p0, Landroidx/wear/widget/RoundedDrawable;->mRadius:I

    int-to-float v3, v3

    iget-object v4, p0, Landroidx/wear/widget/RoundedDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 210
    iget-boolean v1, p0, Landroidx/wear/widget/RoundedDrawable;->mIsClipEnabled:Z

    if-eqz v1, :cond_2

    .line 212
    iget-object v1, p0, Landroidx/wear/widget/RoundedDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    move-result-object v1

    if-nez v1, :cond_1

    .line 213
    invoke-direct {p0}, Landroidx/wear/widget/RoundedDrawable;->updateBitmapShader()V

    .line 216
    :cond_1
    iget-object v1, p0, Landroidx/wear/widget/RoundedDrawable;->mTmpBoundsF:Landroid/graphics/RectF;

    iget v2, p0, Landroidx/wear/widget/RoundedDrawable;->mRadius:I

    int-to-float v2, v2

    iget v3, p0, Landroidx/wear/widget/RoundedDrawable;->mRadius:I

    int-to-float v3, v3

    iget-object v4, p0, Landroidx/wear/widget/RoundedDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_0

    .line 219
    :cond_2
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 220
    .local v1, "minEdge":I
    iget v2, p0, Landroidx/wear/widget/RoundedDrawable;->mRadius:I

    div-int/lit8 v3, v1, 0x2

    .line 221
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    int-to-float v2, v2

    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    double-to-float v3, v3

    const/high16 v4, 0x3f800000    # 1.0f

    div-float v3, v4, v3

    sub-float/2addr v4, v3

    mul-float/2addr v2, v4

    float-to-double v2, v2

    .line 220
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v2, v2

    .line 222
    .local v2, "padding":I
    iget-object v3, p0, Landroidx/wear/widget/RoundedDrawable;->mTmpBounds:Landroid/graphics/Rect;

    invoke-virtual {v3, v2, v2}, Landroid/graphics/Rect;->inset(II)V

    .line 223
    iget-object v3, p0, Landroidx/wear/widget/RoundedDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    iget-object v4, p0, Landroidx/wear/widget/RoundedDrawable;->mTmpBounds:Landroid/graphics/Rect;

    invoke-virtual {v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 224
    iget-object v3, p0, Landroidx/wear/widget/RoundedDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 225
    iget-object v3, p0, Landroidx/wear/widget/RoundedDrawable;->mTmpBounds:Landroid/graphics/Rect;

    neg-int v4, v2

    neg-int v5, v2

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Rect;->inset(II)V

    .line 227
    .end local v1    # "minEdge":I
    .end local v2    # "padding":I
    :goto_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 228
    return-void

    .line 202
    :cond_3
    :goto_1
    return-void
.end method

.method public getAlpha()I
    .locals 1

    .line 244
    iget-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    return v0
.end method

.method public getBackgroundColor()I
    .locals 1

    .line 160
    iget-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getColor()I

    move-result v0

    return v0
.end method

.method public getDrawable()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 139
    iget-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getOpacity()I
    .locals 1

    .line 233
    const/4 v0, -0x3

    return v0
.end method

.method public getRadius()I
    .locals 1

    .line 268
    iget v0, p0, Landroidx/wear/widget/RoundedDrawable;->mRadius:I

    return v0
.end method

.method public inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V
    .locals 3
    .param p1, "r"    # Landroid/content/res/Resources;
    .param p2, "parser"    # Lorg/xmlpull/v1/XmlPullParser;
    .param p3, "attrs"    # Landroid/util/AttributeSet;
    .param p4, "theme"    # Landroid/content/res/Resources$Theme;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 105
    invoke-super {p0, p1, p2, p3, p4}, Landroid/graphics/drawable/Drawable;->inflate(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V

    .line 106
    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v0

    sget-object v1, Landroidx/wear/R$styleable;->RoundedDrawable:[I

    invoke-virtual {p1, v0, v1}, Landroid/content/res/Resources;->obtainAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 107
    .local v0, "a":Landroid/content/res/TypedArray;
    sget v1, Landroidx/wear/R$styleable;->RoundedDrawable_android_src:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 108
    sget v1, Landroidx/wear/R$styleable;->RoundedDrawable_android_src:I

    invoke-virtual {v0, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroidx/wear/widget/RoundedDrawable;->setDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 110
    :cond_0
    sget v1, Landroidx/wear/R$styleable;->RoundedDrawable_radius:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    invoke-virtual {p0, v1}, Landroidx/wear/widget/RoundedDrawable;->setRadius(I)V

    .line 111
    sget v1, Landroidx/wear/R$styleable;->RoundedDrawable_clipEnabled:I

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1}, Landroidx/wear/widget/RoundedDrawable;->setClipEnabled(Z)V

    .line 112
    sget v1, Landroidx/wear/R$styleable;->RoundedDrawable_backgroundColor:I

    .line 113
    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    .line 112
    invoke-virtual {p0, v1}, Landroidx/wear/widget/RoundedDrawable;->setBackgroundColor(I)V

    .line 114
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 115
    return-void
.end method

.method public isClipEnabled()Z
    .locals 1

    .line 186
    iget-boolean v0, p0, Landroidx/wear/widget/RoundedDrawable;->mIsClipEnabled:Z

    return v0
.end method

.method protected onBoundsChange(Landroid/graphics/Rect;)V
    .locals 2
    .param p1, "bounds"    # Landroid/graphics/Rect;

    .line 191
    iget-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mTmpBounds:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    iput v1, v0, Landroid/graphics/Rect;->right:I

    .line 192
    iget-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mTmpBounds:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v1

    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 193
    iget-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mTmpBoundsF:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 194
    iget-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mTmpBoundsF:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result v1

    int-to-float v1, v1

    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 195
    iget-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 196
    return-void
.end method

.method public setAlpha(I)V
    .locals 1
    .param p1, "alpha"    # I

    .line 238
    iget-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 239
    iget-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 240
    return-void
.end method

.method public setBackgroundColor(I)V
    .locals 1
    .param p1, "color"    # I

    .line 149
    iget-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mBackgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 150
    invoke-virtual {p0}, Landroidx/wear/widget/RoundedDrawable;->invalidateSelf()V

    .line 151
    return-void
.end method

.method public setClipEnabled(Z)V
    .locals 2
    .param p1, "clipEnabled"    # Z

    .line 173
    iput-boolean p1, p0, Landroidx/wear/widget/RoundedDrawable;->mIsClipEnabled:Z

    .line 174
    if-nez p1, :cond_0

    .line 175
    iget-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 177
    :cond_0
    invoke-virtual {p0}, Landroidx/wear/widget/RoundedDrawable;->invalidateSelf()V

    .line 178
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1
    .param p1, "cf"    # Landroid/graphics/ColorFilter;

    .line 249
    iget-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 250
    return-void
.end method

.method public setDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 2
    .param p1, "drawable"    # Landroid/graphics/drawable/Drawable;

    .line 124
    iget-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 125
    return-void

    .line 127
    :cond_0
    iput-object p1, p0, Landroidx/wear/widget/RoundedDrawable;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 128
    iget-object v0, p0, Landroidx/wear/widget/RoundedDrawable;->mPaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 129
    invoke-virtual {p0}, Landroidx/wear/widget/RoundedDrawable;->invalidateSelf()V

    .line 130
    return-void
.end method

.method public setRadius(I)V
    .locals 0
    .param p1, "radius"    # I

    .line 259
    iput p1, p0, Landroidx/wear/widget/RoundedDrawable;->mRadius:I

    .line 260
    return-void
.end method
