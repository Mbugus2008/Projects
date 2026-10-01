.class public final Landroidx/wear/utils/ActivityAnimationUtil;
.super Ljava/lang/Object;
.source "ActivityAnimationUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/utils/ActivityAnimationUtil$ActivityAnimationType;
    }
.end annotation


# static fields
.field private static final ACTIVITY_ANIMATION_ATTRS:[I

.field public static final CLOSE_ENTER:I = 0x0

.field public static final CLOSE_EXIT:I = 0x1

.field public static final OPEN_ENTER:I = 0x2

.field public static final OPEN_EXIT:I = 0x3


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 72
    const v0, 0x10100b8

    const v1, 0x10100b9

    const v2, 0x10100ba

    const v3, 0x10100bb

    filled-new-array {v2, v3, v0, v1}, [I

    move-result-object v0

    sput-object v0, Landroidx/wear/utils/ActivityAnimationUtil;->ACTIVITY_ANIMATION_ATTRS:[I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 79
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getStandardActivityAnimation(Landroid/content/Context;IZ)Landroid/view/animation/Animation;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "animationType"    # I
    .param p2, "scaled"    # Z

    .line 92
    sget-object v0, Landroidx/wear/utils/ActivityAnimationUtil;->ACTIVITY_ANIMATION_ATTRS:[I

    aget v0, v0, p1

    filled-new-array {v0}, [I

    move-result-object v0

    const v1, 0x1030001

    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 95
    .local v0, "animations":Landroid/content/res/TypedArray;
    const/4 v1, 0x0

    .line 96
    .local v1, "animation":Landroid/view/animation/Animation;
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v2

    if-lez v2, :cond_0

    .line 97
    const/4 v2, 0x0

    invoke-virtual {v0, v2, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    invoke-static {p0, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    .line 98
    if-eqz p2, :cond_0

    .line 99
    nop

    .line 100
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    .line 99
    const-string/jumbo v3, "transition_animation_scale"

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    int-to-float v2, v2

    .line 102
    .local v2, "scale":F
    invoke-virtual {v1, v2}, Landroid/view/animation/Animation;->scaleCurrentDuration(F)V

    .line 105
    .end local v2    # "scale":F
    :cond_0
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 106
    return-object v1
.end method
