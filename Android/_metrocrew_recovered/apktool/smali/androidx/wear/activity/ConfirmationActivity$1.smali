.class Landroidx/wear/activity/ConfirmationActivity$1;
.super Ljava/lang/Object;
.source "ConfirmationActivity.java"

# interfaces
.implements Landroidx/wear/widget/ConfirmationOverlay$OnAnimationFinishedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/wear/activity/ConfirmationActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/wear/activity/ConfirmationActivity;


# direct methods
.method constructor <init>(Landroidx/wear/activity/ConfirmationActivity;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/wear/activity/ConfirmationActivity;

    .line 126
    iput-object p1, p0, Landroidx/wear/activity/ConfirmationActivity$1;->this$0:Landroidx/wear/activity/ConfirmationActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationFinished()V
    .locals 1

    .line 129
    iget-object v0, p0, Landroidx/wear/activity/ConfirmationActivity$1;->this$0:Landroidx/wear/activity/ConfirmationActivity;

    invoke-virtual {v0}, Landroidx/wear/activity/ConfirmationActivity;->onAnimationFinished()V

    .line 130
    return-void
.end method
