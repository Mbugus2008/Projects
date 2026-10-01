.class Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$BitmapFetchRunnable;
.super Ljava/lang/Object;
.source "ScreencastDispatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BitmapFetchRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;


# direct methods
.method private constructor <init>(Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;)V
    .locals 0

    .line 69
    iput-object p1, p0, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$BitmapFetchRunnable;->this$0:Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;
    .param p2, "x1"    # Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$1;

    .line 69
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$BitmapFetchRunnable;-><init>(Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;)V

    return-void
.end method

.method private updateScreenBitmap()V
    .locals 12

    .line 77
    iget-object v0, p0, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$BitmapFetchRunnable;->this$0:Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;

    invoke-static {v0}, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;->access$600(Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 78
    return-void

    .line 80
    :cond_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$BitmapFetchRunnable;->this$0:Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;

    invoke-static {v0}, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;->access$700(Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;)Lcom/facebook/stetho/inspector/elements/android/ActivityTracker;

    move-result-object v0

    invoke-virtual {v0}, Lcom/facebook/stetho/inspector/elements/android/ActivityTracker;->tryGetTopActivity()Landroid/app/Activity;

    move-result-object v0

    .line 81
    .local v0, "activity":Landroid/app/Activity;
    if-nez v0, :cond_1

    .line 82
    return-void

    .line 85
    :cond_1
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    .line 87
    .local v1, "rootView":Landroid/view/View;
    :try_start_0
    iget-object v2, p0, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$BitmapFetchRunnable;->this$0:Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;

    invoke-static {v2}, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;->access$800(Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;)Landroid/graphics/Bitmap;

    move-result-object v2

    if-nez v2, :cond_2

    .line 88
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v2

    .line 89
    .local v2, "viewWidth":I
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v3

    .line 90
    .local v3, "viewHeight":I
    iget-object v4, p0, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$BitmapFetchRunnable;->this$0:Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;

    invoke-static {v4}, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;->access$900(Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;)Lcom/facebook/stetho/inspector/protocol/module/Page$StartScreencastRequest;

    move-result-object v4

    iget v4, v4, Lcom/facebook/stetho/inspector/protocol/module/Page$StartScreencastRequest;->maxWidth:I

    int-to-float v4, v4

    int-to-float v5, v2

    div-float/2addr v4, v5

    iget-object v5, p0, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$BitmapFetchRunnable;->this$0:Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;

    .line 91
    invoke-static {v5}, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;->access$900(Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;)Lcom/facebook/stetho/inspector/protocol/module/Page$StartScreencastRequest;

    move-result-object v5

    iget v5, v5, Lcom/facebook/stetho/inspector/protocol/module/Page$StartScreencastRequest;->maxHeight:I

    int-to-float v5, v5

    int-to-float v6, v3

    div-float/2addr v5, v6

    .line 90
    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v4

    .line 92
    .local v4, "scale":F
    int-to-float v5, v2

    mul-float/2addr v5, v4

    float-to-int v5, v5

    .line 93
    .local v5, "destWidth":I
    int-to-float v6, v3

    mul-float/2addr v6, v4

    float-to-int v6, v6

    .line 94
    .local v6, "destHeight":I
    iget-object v7, p0, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$BitmapFetchRunnable;->this$0:Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;

    sget-object v8, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v5, v6, v8}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;->access$802(Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 95
    iget-object v7, p0, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$BitmapFetchRunnable;->this$0:Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;

    new-instance v8, Landroid/graphics/Canvas;

    iget-object v9, p0, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$BitmapFetchRunnable;->this$0:Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;

    invoke-static {v9}, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;->access$800(Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;)Landroid/graphics/Bitmap;

    move-result-object v9

    invoke-direct {v8, v9}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-static {v7, v8}, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;->access$1002(Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;Landroid/graphics/Canvas;)Landroid/graphics/Canvas;

    .line 96
    new-instance v7, Landroid/graphics/Matrix;

    invoke-direct {v7}, Landroid/graphics/Matrix;-><init>()V

    .line 97
    .local v7, "matrix":Landroid/graphics/Matrix;
    iget-object v8, p0, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$BitmapFetchRunnable;->this$0:Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;

    invoke-static {v8}, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;->access$1100(Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;)Landroid/graphics/RectF;

    move-result-object v8

    int-to-float v9, v2

    int-to-float v10, v3

    const/4 v11, 0x0

    invoke-virtual {v8, v11, v11, v9, v10}, Landroid/graphics/RectF;->set(FFFF)V

    .line 98
    iget-object v8, p0, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$BitmapFetchRunnable;->this$0:Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;

    invoke-static {v8}, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;->access$1200(Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;)Landroid/graphics/RectF;

    move-result-object v8

    int-to-float v9, v5

    int-to-float v10, v6

    invoke-virtual {v8, v11, v11, v9, v10}, Landroid/graphics/RectF;->set(FFFF)V

    .line 99
    iget-object v8, p0, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$BitmapFetchRunnable;->this$0:Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;

    invoke-static {v8}, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;->access$1100(Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;)Landroid/graphics/RectF;

    move-result-object v8

    iget-object v9, p0, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$BitmapFetchRunnable;->this$0:Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;

    invoke-static {v9}, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;->access$1200(Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;)Landroid/graphics/RectF;

    move-result-object v9

    sget-object v10, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v7, v8, v9, v10}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    .line 100
    iget-object v8, p0, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$BitmapFetchRunnable;->this$0:Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;

    invoke-static {v8}, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;->access$1000(Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;)Landroid/graphics/Canvas;

    move-result-object v8

    invoke-virtual {v8, v7}, Landroid/graphics/Canvas;->setMatrix(Landroid/graphics/Matrix;)V

    .line 102
    .end local v2    # "viewWidth":I
    .end local v3    # "viewHeight":I
    .end local v4    # "scale":F
    .end local v5    # "destWidth":I
    .end local v6    # "destHeight":I
    .end local v7    # "matrix":Landroid/graphics/Matrix;
    :cond_2
    iget-object v2, p0, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$BitmapFetchRunnable;->this$0:Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;

    invoke-static {v2}, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;->access$1000(Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;)Landroid/graphics/Canvas;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    goto :goto_0

    .line 103
    :catch_0
    move-exception v2

    .line 104
    .local v2, "e":Ljava/lang/OutOfMemoryError;
    const-string v3, "Out of memory trying to allocate screencast Bitmap."

    invoke-static {v3}, Lcom/facebook/stetho/common/LogUtil;->w(Ljava/lang/String;)V

    .line 106
    .end local v2    # "e":Ljava/lang/OutOfMemoryError;
    :goto_0
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 72
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$BitmapFetchRunnable;->updateScreenBitmap()V

    .line 73
    iget-object v0, p0, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$BitmapFetchRunnable;->this$0:Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;

    invoke-static {v0}, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;->access$500(Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$BitmapFetchRunnable;->this$0:Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;

    invoke-static {v1}, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;->access$300(Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher;)Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$EventDispatchRunnable;

    move-result-object v1

    invoke-static {v1, p0}, Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$EventDispatchRunnable;->access$400(Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$EventDispatchRunnable;Ljava/lang/Runnable;)Lcom/facebook/stetho/inspector/screencast/ScreencastDispatcher$EventDispatchRunnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 74
    return-void
.end method
