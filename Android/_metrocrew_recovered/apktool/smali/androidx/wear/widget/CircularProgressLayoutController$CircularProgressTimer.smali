.class Landroidx/wear/widget/CircularProgressLayoutController$CircularProgressTimer;
.super Landroid/os/CountDownTimer;
.source "CircularProgressLayoutController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/CircularProgressLayoutController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CircularProgressTimer"
.end annotation


# instance fields
.field private final mTotalTime:J

.field final synthetic this$0:Landroidx/wear/widget/CircularProgressLayoutController;


# direct methods
.method constructor <init>(Landroidx/wear/widget/CircularProgressLayoutController;JJ)V
    .locals 0
    .param p2, "totalTime"    # J
    .param p4, "updateInterval"    # J

    .line 121
    iput-object p1, p0, Landroidx/wear/widget/CircularProgressLayoutController$CircularProgressTimer;->this$0:Landroidx/wear/widget/CircularProgressLayoutController;

    .line 122
    invoke-direct {p0, p2, p3, p4, p5}, Landroid/os/CountDownTimer;-><init>(JJ)V

    .line 123
    iput-wide p2, p0, Landroidx/wear/widget/CircularProgressLayoutController$CircularProgressTimer;->mTotalTime:J

    .line 124
    return-void
.end method


# virtual methods
.method public onFinish()V
    .locals 3

    .line 135
    iget-object v0, p0, Landroidx/wear/widget/CircularProgressLayoutController$CircularProgressTimer;->this$0:Landroidx/wear/widget/CircularProgressLayoutController;

    iget-object v0, v0, Landroidx/wear/widget/CircularProgressLayoutController;->mLayout:Landroidx/wear/widget/CircularProgressLayout;

    invoke-virtual {v0}, Landroidx/wear/widget/CircularProgressLayout;->getProgressDrawable()Landroidx/swiperefreshlayout/widget/CircularProgressDrawable;

    move-result-object v0

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1, v2}, Landroidx/swiperefreshlayout/widget/CircularProgressDrawable;->setStartEndTrim(FF)V

    .line 136
    iget-object v0, p0, Landroidx/wear/widget/CircularProgressLayoutController$CircularProgressTimer;->this$0:Landroidx/wear/widget/CircularProgressLayoutController;

    iget-object v0, v0, Landroidx/wear/widget/CircularProgressLayoutController;->mOnTimerFinishedListener:Landroidx/wear/widget/CircularProgressLayout$OnTimerFinishedListener;

    if-eqz v0, :cond_0

    .line 137
    iget-object v0, p0, Landroidx/wear/widget/CircularProgressLayoutController$CircularProgressTimer;->this$0:Landroidx/wear/widget/CircularProgressLayoutController;

    iget-object v0, v0, Landroidx/wear/widget/CircularProgressLayoutController;->mOnTimerFinishedListener:Landroidx/wear/widget/CircularProgressLayout$OnTimerFinishedListener;

    iget-object v1, p0, Landroidx/wear/widget/CircularProgressLayoutController$CircularProgressTimer;->this$0:Landroidx/wear/widget/CircularProgressLayoutController;

    iget-object v1, v1, Landroidx/wear/widget/CircularProgressLayoutController;->mLayout:Landroidx/wear/widget/CircularProgressLayout;

    invoke-interface {v0, v1}, Landroidx/wear/widget/CircularProgressLayout$OnTimerFinishedListener;->onTimerFinished(Landroidx/wear/widget/CircularProgressLayout;)V

    .line 139
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/CircularProgressLayoutController$CircularProgressTimer;->this$0:Landroidx/wear/widget/CircularProgressLayoutController;

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroidx/wear/widget/CircularProgressLayoutController;->mIsTimerRunning:Z

    .line 140
    return-void
.end method

.method public onTick(J)V
    .locals 4
    .param p1, "millisUntilFinished"    # J

    .line 128
    iget-object v0, p0, Landroidx/wear/widget/CircularProgressLayoutController$CircularProgressTimer;->this$0:Landroidx/wear/widget/CircularProgressLayoutController;

    iget-object v0, v0, Landroidx/wear/widget/CircularProgressLayoutController;->mLayout:Landroidx/wear/widget/CircularProgressLayout;

    invoke-virtual {v0}, Landroidx/wear/widget/CircularProgressLayout;->getProgressDrawable()Landroidx/swiperefreshlayout/widget/CircularProgressDrawable;

    move-result-object v0

    long-to-float v1, p1

    iget-wide v2, p0, Landroidx/wear/widget/CircularProgressLayoutController$CircularProgressTimer;->mTotalTime:J

    long-to-float v2, v2

    div-float/2addr v1, v2

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float/2addr v2, v1

    .line 129
    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroidx/swiperefreshlayout/widget/CircularProgressDrawable;->setStartEndTrim(FF)V

    .line 130
    iget-object v0, p0, Landroidx/wear/widget/CircularProgressLayoutController$CircularProgressTimer;->this$0:Landroidx/wear/widget/CircularProgressLayoutController;

    iget-object v0, v0, Landroidx/wear/widget/CircularProgressLayoutController;->mLayout:Landroidx/wear/widget/CircularProgressLayout;

    invoke-virtual {v0}, Landroidx/wear/widget/CircularProgressLayout;->invalidate()V

    .line 131
    return-void
.end method
