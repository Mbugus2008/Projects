.class public Landroidx/wear/widget/ConfirmationOverlay;
.super Ljava/lang/Object;
.source "ConfirmationOverlay.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/widget/ConfirmationOverlay$OnAnimationFinishedListener;,
        Landroidx/wear/widget/ConfirmationOverlay$OverlayType;
    }
.end annotation


# static fields
.field private static final A11Y_ANIMATION_DURATION_MS:I = 0x1388

.field public static final DEFAULT_ANIMATION_DURATION_MS:I = 0x3e8

.field public static final FAILURE_ANIMATION:I = 0x1

.field public static final OPEN_ON_PHONE_ANIMATION:I = 0x2

.field public static final SUCCESS_ANIMATION:I


# instance fields
.field private mDurationMillis:I

.field private final mHideRunnable:Ljava/lang/Runnable;

.field mIsShowing:Z

.field mListener:Landroidx/wear/widget/ConfirmationOverlay$OnAnimationFinishedListener;

.field private final mMainThreadHandler:Landroid/os/Handler;

.field private mMessage:Ljava/lang/CharSequence;

.field private mOverlayDrawable:Landroid/graphics/drawable/Drawable;

.field mOverlayView:Landroid/view/View;

.field private mType:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    const/4 v0, 0x0

    iput v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mType:I

    .line 130
    const/16 v1, 0x3e8

    iput v1, p0, Landroidx/wear/widget/ConfirmationOverlay;->mDurationMillis:I

    .line 133
    const-string v1, ""

    iput-object v1, p0, Landroidx/wear/widget/ConfirmationOverlay;->mMessage:Ljava/lang/CharSequence;

    .line 137
    iput-boolean v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mIsShowing:Z

    .line 140
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mMainThreadHandler:Landroid/os/Handler;

    .line 141
    new-instance v0, Landroidx/wear/widget/ConfirmationOverlay$1;

    invoke-direct {v0, p0}, Landroidx/wear/widget/ConfirmationOverlay$1;-><init>(Landroidx/wear/widget/ConfirmationOverlay;)V

    iput-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mHideRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method private animateAndHideAfterDelay()V
    .locals 4

    .line 278
    iget-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    instance-of v0, v0, Landroid/graphics/drawable/Animatable;

    if-eqz v0, :cond_0

    .line 279
    iget-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    check-cast v0, Landroid/graphics/drawable/Animatable;

    .line 280
    .local v0, "animatable":Landroid/graphics/drawable/Animatable;
    invoke-interface {v0}, Landroid/graphics/drawable/Animatable;->start()V

    .line 282
    .end local v0    # "animatable":Landroid/graphics/drawable/Animatable;
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mMainThreadHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroidx/wear/widget/ConfirmationOverlay;->mHideRunnable:Ljava/lang/Runnable;

    invoke-direct {p0}, Landroidx/wear/widget/ConfirmationOverlay;->getDurationMillis()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 283
    return-void
.end method

.method private getAccessibilityText()Ljava/lang/CharSequence;
    .locals 5

    .line 389
    iget-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mMessage:Ljava/lang/CharSequence;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 390
    iget-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mMessage:Ljava/lang/CharSequence;

    return-object v0

    .line 392
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 393
    .local v0, "context":Landroid/content/Context;
    const-string v1, ""

    .line 394
    .local v1, "imageDescription":Ljava/lang/CharSequence;
    iget v2, p0, Landroidx/wear/widget/ConfirmationOverlay;->mType:I

    packed-switch v2, :pswitch_data_0

    .line 408
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget v3, p0, Landroidx/wear/widget/ConfirmationOverlay;->mType:I

    .line 409
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "Invalid ConfirmationOverlay type [%d]"

    invoke-static {v2, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 410
    .local v2, "errorMessage":Ljava/lang/String;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 404
    .end local v2    # "errorMessage":Ljava/lang/String;
    :pswitch_0
    sget v2, Landroidx/wear/R$string;->confirmation_overlay_a11y_description_phone:I

    .line 405
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 406
    goto :goto_0

    .line 400
    :pswitch_1
    sget v2, Landroidx/wear/R$string;->confirmation_overlay_a11y_description_fail:I

    .line 401
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 402
    goto :goto_0

    .line 396
    :pswitch_2
    sget v2, Landroidx/wear/R$string;->confirmation_overlay_a11y_description_success:I

    .line 397
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 398
    nop

    .line 412
    :goto_0
    return-object v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getDurationMillis()I
    .locals 2

    .line 270
    iget-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-class v1, Landroid/view/accessibility/AccessibilityManager;

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/accessibility/AccessibilityManager;

    invoke-virtual {v0}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 271
    const/16 v0, 0x1388

    iget v1, p0, Landroidx/wear/widget/ConfirmationOverlay;->mDurationMillis:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0

    .line 273
    :cond_0
    iget v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mDurationMillis:I

    return v0
.end method

.method private setUpForAccessibility()V
    .locals 2

    .line 260
    iget-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayView:Landroid/view/View;

    invoke-direct {p0}, Landroidx/wear/widget/ConfirmationOverlay;->getAccessibilityText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 261
    iget-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 262
    iget-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayView:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->sendAccessibilityEvent(I)V

    .line 263
    return-void
.end method

.method private updateImageView(Landroid/content/Context;Landroid/view/View;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "overlayView"    # Landroid/view/View;

    .line 360
    iget v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mType:I

    packed-switch v0, :pswitch_data_0

    .line 373
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    iget v1, p0, Landroidx/wear/widget/ConfirmationOverlay;->mType:I

    .line 374
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const-string v2, "Invalid ConfirmationOverlay type [%d]"

    invoke-static {v0, v2, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 375
    .local v0, "errorMessage":Ljava/lang/String;
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 369
    .end local v0    # "errorMessage":Ljava/lang/String;
    :pswitch_0
    sget v0, Landroidx/wear/R$drawable;->open_on_phone_animation:I

    .line 370
    invoke-static {p1, v0}, Landroidx/core/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    .line 371
    goto :goto_0

    .line 366
    :pswitch_1
    sget v0, Landroidx/wear/R$drawable;->failure_animation:I

    invoke-static {p1, v0}, Landroidx/core/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    .line 367
    goto :goto_0

    .line 362
    :pswitch_2
    sget v0, Landroidx/wear/R$drawable;->confirmation_animation:I

    invoke-static {p1, v0}, Landroidx/core/content/ContextCompat;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    .line 364
    nop

    .line 378
    :goto_0
    sget v0, Landroidx/wear/R$id;->wearable_support_confirmation_overlay_image:I

    .line 379
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 380
    .local v0, "imageView":Landroid/widget/ImageView;
    iget-object v1, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 381
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private updateMessageView(Landroid/content/Context;Landroid/view/View;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "overlayView"    # Landroid/view/View;

    .line 342
    sget v0, Landroidx/wear/R$id;->wearable_support_confirmation_overlay_message:I

    .line 343
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 345
    .local v0, "messageView":Landroid/widget/TextView;
    invoke-static {p1}, Landroidx/wear/widget/ResourcesUtil;->getScreenWidthPx(Landroid/content/Context;)I

    move-result v1

    .line 346
    .local v1, "screenWidthPx":I
    sget v2, Landroidx/wear/R$fraction;->confirmation_overlay_text_inset_margin:I

    invoke-static {p1, v1, v2}, Landroidx/wear/widget/ResourcesUtil;->getFractionOfScreenPx(Landroid/content/Context;II)I

    move-result v2

    .line 349
    .local v2, "insetMarginPx":I
    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 350
    .local v3, "layoutParams":Landroid/view/ViewGroup$MarginLayoutParams;
    iput v2, v3, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 351
    iput v2, v3, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 353
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 354
    iget-object v4, p0, Landroidx/wear/widget/ConfirmationOverlay;->mMessage:Ljava/lang/CharSequence;

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 355
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 356
    return-void
.end method

.method private updateOverlayView(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .line 322
    iget-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayView:Landroid/view/View;

    if-nez v0, :cond_0

    .line 324
    nop

    .line 325
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Landroidx/wear/R$layout;->ws_overlay_confirmation:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayView:Landroid/view/View;

    .line 327
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayView:Landroid/view/View;

    new-instance v1, Landroidx/wear/widget/ConfirmationOverlay$3;

    invoke-direct {v1, p0}, Landroidx/wear/widget/ConfirmationOverlay$3;-><init>(Landroidx/wear/widget/ConfirmationOverlay;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 333
    iget-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayView:Landroid/view/View;

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 336
    iget-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayView:Landroid/view/View;

    invoke-direct {p0, p1, v0}, Landroidx/wear/widget/ConfirmationOverlay;->updateImageView(Landroid/content/Context;Landroid/view/View;)V

    .line 337
    iget-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayView:Landroid/view/View;

    invoke-direct {p0, p1, v0}, Landroidx/wear/widget/ConfirmationOverlay;->updateMessageView(Landroid/content/Context;Landroid/view/View;)V

    .line 338
    return-void
.end method


# virtual methods
.method public hide()V
    .locals 2

    .line 294
    iget-object v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayView:Landroid/view/View;

    .line 295
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x10a0001

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 296
    .local v0, "fadeOut":Landroid/view/animation/Animation;
    new-instance v1, Landroidx/wear/widget/ConfirmationOverlay$2;

    invoke-direct {v1, p0}, Landroidx/wear/widget/ConfirmationOverlay$2;-><init>(Landroidx/wear/widget/ConfirmationOverlay;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 317
    iget-object v1, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 318
    return-void
.end method

.method public setDuration(I)Landroidx/wear/widget/ConfirmationOverlay;
    .locals 0
    .param p1, "millis"    # I

    .line 192
    iput p1, p0, Landroidx/wear/widget/ConfirmationOverlay;->mDurationMillis:I

    .line 193
    return-object p0
.end method

.method public setFinishedAnimationListener(Landroidx/wear/widget/ConfirmationOverlay$OnAnimationFinishedListener;)Landroidx/wear/widget/ConfirmationOverlay;
    .locals 0
    .param p1, "listener"    # Landroidx/wear/widget/ConfirmationOverlay$OnAnimationFinishedListener;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 208
    iput-object p1, p0, Landroidx/wear/widget/ConfirmationOverlay;->mListener:Landroidx/wear/widget/ConfirmationOverlay$OnAnimationFinishedListener;

    .line 209
    return-object p0
.end method

.method public setMessage(Ljava/lang/CharSequence;)Landroidx/wear/widget/ConfirmationOverlay;
    .locals 0
    .param p1, "message"    # Ljava/lang/CharSequence;

    .line 169
    iput-object p1, p0, Landroidx/wear/widget/ConfirmationOverlay;->mMessage:Ljava/lang/CharSequence;

    .line 170
    return-object p0
.end method

.method public setMessage(Ljava/lang/String;)Landroidx/wear/widget/ConfirmationOverlay;
    .locals 0
    .param p1, "message"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 158
    iput-object p1, p0, Landroidx/wear/widget/ConfirmationOverlay;->mMessage:Ljava/lang/CharSequence;

    .line 159
    return-object p0
.end method

.method public setOnAnimationFinishedListener(Landroidx/wear/widget/ConfirmationOverlay$OnAnimationFinishedListener;)Landroidx/wear/widget/ConfirmationOverlay;
    .locals 0
    .param p1, "listener"    # Landroidx/wear/widget/ConfirmationOverlay$OnAnimationFinishedListener;

    .line 221
    iput-object p1, p0, Landroidx/wear/widget/ConfirmationOverlay;->mListener:Landroidx/wear/widget/ConfirmationOverlay$OnAnimationFinishedListener;

    .line 222
    return-object p0
.end method

.method public setType(I)Landroidx/wear/widget/ConfirmationOverlay;
    .locals 0
    .param p1, "type"    # I

    .line 180
    iput p1, p0, Landroidx/wear/widget/ConfirmationOverlay;->mType:I

    .line 181
    return-object p0
.end method

.method public showAbove(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .line 231
    iget-boolean v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mIsShowing:Z

    if-eqz v0, :cond_0

    .line 232
    return-void

    .line 234
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mIsShowing:Z

    .line 236
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Landroidx/wear/widget/ConfirmationOverlay;->updateOverlayView(Landroid/content/Context;)V

    .line 237
    invoke-virtual {p1}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 238
    invoke-direct {p0}, Landroidx/wear/widget/ConfirmationOverlay;->setUpForAccessibility()V

    .line 239
    invoke-direct {p0}, Landroidx/wear/widget/ConfirmationOverlay;->animateAndHideAfterDelay()V

    .line 240
    return-void
.end method

.method public showOn(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .line 248
    iget-boolean v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mIsShowing:Z

    if-eqz v0, :cond_0

    .line 249
    return-void

    .line 251
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/wear/widget/ConfirmationOverlay;->mIsShowing:Z

    .line 253
    invoke-direct {p0, p1}, Landroidx/wear/widget/ConfirmationOverlay;->updateOverlayView(Landroid/content/Context;)V

    .line 254
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    iget-object v1, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayView:Landroid/view/View;

    iget-object v2, p0, Landroidx/wear/widget/ConfirmationOverlay;->mOverlayView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/view/Window;->addContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 255
    invoke-direct {p0}, Landroidx/wear/widget/ConfirmationOverlay;->setUpForAccessibility()V

    .line 256
    invoke-direct {p0}, Landroidx/wear/widget/ConfirmationOverlay;->animateAndHideAfterDelay()V

    .line 257
    return-void
.end method
