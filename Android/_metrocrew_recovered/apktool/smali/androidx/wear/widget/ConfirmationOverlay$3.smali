.class Landroidx/wear/widget/ConfirmationOverlay$3;
.super Ljava/lang/Object;
.source "ConfirmationOverlay.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/wear/widget/ConfirmationOverlay;->updateOverlayView(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/wear/widget/ConfirmationOverlay;


# direct methods
.method constructor <init>(Landroidx/wear/widget/ConfirmationOverlay;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/wear/widget/ConfirmationOverlay;

    .line 327
    iput-object p1, p0, Landroidx/wear/widget/ConfirmationOverlay$3;->this$0:Landroidx/wear/widget/ConfirmationOverlay;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/view/View;
    .param p2, "event"    # Landroid/view/MotionEvent;

    .line 330
    const/4 v0, 0x1

    return v0
.end method
