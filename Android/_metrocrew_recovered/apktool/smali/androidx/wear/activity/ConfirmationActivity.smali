.class public Landroidx/wear/activity/ConfirmationActivity;
.super Landroid/app/Activity;
.source "ConfirmationActivity.java"


# static fields
.field private static final CONFIRMATION_OVERLAY_TYPES:Landroid/util/SparseIntArray;

.field static final DEFAULT_ANIMATION_DURATION_MILLIS:I = 0x3e8

.field public static final EXTRA_ANIMATION_DURATION_MILLIS:Ljava/lang/String; = "androidx.wear.activity.extra.ANIMATION_DURATION_MILLIS"

.field public static final EXTRA_ANIMATION_TYPE:Ljava/lang/String; = "androidx.wear.activity.extra.ANIMATION_TYPE"

.field public static final EXTRA_MESSAGE:Ljava/lang/String; = "androidx.wear.activity.extra.MESSAGE"

.field public static final FAILURE_ANIMATION:I = 0x3

.field public static final OPEN_ON_PHONE_ANIMATION:I = 0x2

.field public static final SUCCESS_ANIMATION:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 92
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    sput-object v0, Landroidx/wear/activity/ConfirmationActivity;->CONFIRMATION_OVERLAY_TYPES:Landroid/util/SparseIntArray;

    .line 95
    sget-object v0, Landroidx/wear/activity/ConfirmationActivity;->CONFIRMATION_OVERLAY_TYPES:Landroid/util/SparseIntArray;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseIntArray;->append(II)V

    .line 96
    sget-object v0, Landroidx/wear/activity/ConfirmationActivity;->CONFIRMATION_OVERLAY_TYPES:Landroid/util/SparseIntArray;

    const/4 v1, 0x2

    invoke-virtual {v0, v1, v1}, Landroid/util/SparseIntArray;->append(II)V

    .line 98
    sget-object v0, Landroidx/wear/activity/ConfirmationActivity;->CONFIRMATION_OVERLAY_TYPES:Landroid/util/SparseIntArray;

    const/4 v1, 0x3

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 99
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 56
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onAnimationFinished()V
    .locals 0

    .line 140
    invoke-virtual {p0}, Landroidx/wear/activity/ConfirmationActivity;->finish()V

    .line 141
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 103
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 104
    sget v0, Landroidx/wear/R$style;->ConfirmationActivity:I

    invoke-virtual {p0, v0}, Landroidx/wear/activity/ConfirmationActivity;->setTheme(I)V

    .line 106
    invoke-virtual {p0}, Landroidx/wear/activity/ConfirmationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 108
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "androidx.wear.activity.extra.ANIMATION_TYPE"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 109
    .local v1, "requestedType":I
    const-string v2, "androidx.wear.activity.extra.ANIMATION_DURATION_MILLIS"

    const/16 v3, 0x3e8

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 111
    .local v2, "animationDurationMillis":I
    sget-object v3, Landroidx/wear/activity/ConfirmationActivity;->CONFIRMATION_OVERLAY_TYPES:Landroid/util/SparseIntArray;

    invoke-virtual {v3, v1}, Landroid/util/SparseIntArray;->indexOfKey(I)I

    move-result v3

    if-ltz v3, :cond_1

    .line 115
    sget-object v3, Landroidx/wear/activity/ConfirmationActivity;->CONFIRMATION_OVERLAY_TYPES:Landroid/util/SparseIntArray;

    invoke-virtual {v3, v1}, Landroid/util/SparseIntArray;->get(I)I

    move-result v3

    .line 116
    .local v3, "type":I
    const-string v4, "androidx.wear.activity.extra.MESSAGE"

    invoke-virtual {v0, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 117
    .local v4, "message":Ljava/lang/CharSequence;
    if-nez v4, :cond_0

    .line 118
    const-string v4, ""

    .line 121
    :cond_0
    new-instance v5, Landroidx/wear/widget/ConfirmationOverlay;

    invoke-direct {v5}, Landroidx/wear/widget/ConfirmationOverlay;-><init>()V

    .line 122
    invoke-virtual {v5, v3}, Landroidx/wear/widget/ConfirmationOverlay;->setType(I)Landroidx/wear/widget/ConfirmationOverlay;

    move-result-object v5

    .line 123
    invoke-virtual {v5, v4}, Landroidx/wear/widget/ConfirmationOverlay;->setMessage(Ljava/lang/CharSequence;)Landroidx/wear/widget/ConfirmationOverlay;

    move-result-object v5

    .line 124
    invoke-virtual {v5, v2}, Landroidx/wear/widget/ConfirmationOverlay;->setDuration(I)Landroidx/wear/widget/ConfirmationOverlay;

    move-result-object v5

    new-instance v6, Landroidx/wear/activity/ConfirmationActivity$1;

    invoke-direct {v6, p0}, Landroidx/wear/activity/ConfirmationActivity$1;-><init>(Landroidx/wear/activity/ConfirmationActivity;)V

    .line 125
    invoke-virtual {v5, v6}, Landroidx/wear/widget/ConfirmationOverlay;->setOnAnimationFinishedListener(Landroidx/wear/widget/ConfirmationOverlay$OnAnimationFinishedListener;)Landroidx/wear/widget/ConfirmationOverlay;

    move-result-object v5

    .line 132
    invoke-virtual {v5, p0}, Landroidx/wear/widget/ConfirmationOverlay;->showOn(Landroid/app/Activity;)V

    .line 133
    return-void

    .line 112
    .end local v3    # "type":I
    .end local v4    # "message":Ljava/lang/CharSequence;
    :cond_1
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unknown type of animation: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
.end method
