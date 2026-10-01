.class Landroidx/wear/widget/CircularProgressLayoutController;
.super Ljava/lang/Object;
.source "CircularProgressLayoutController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/widget/CircularProgressLayoutController$CircularProgressTimer;
    }
.end annotation


# instance fields
.field private mIsIndeterminate:Z

.field mIsTimerRunning:Z

.field final mLayout:Landroidx/wear/widget/CircularProgressLayout;

.field mOnTimerFinishedListener:Landroidx/wear/widget/CircularProgressLayout$OnTimerFinishedListener;

.field mTimer:Landroid/os/CountDownTimer;


# direct methods
.method constructor <init>(Landroidx/wear/widget/CircularProgressLayout;)V
    .locals 0
    .param p1, "layout"    # Landroidx/wear/widget/CircularProgressLayout;

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    iput-object p1, p0, Landroidx/wear/widget/CircularProgressLayoutController;->mLayout:Landroidx/wear/widget/CircularProgressLayout;

    .line 45
    return-void
.end method


# virtual methods
.method public getOnTimerFinishedListener()Landroidx/wear/widget/CircularProgressLayout$OnTimerFinishedListener;
    .locals 1

    .line 52
    iget-object v0, p0, Landroidx/wear/widget/CircularProgressLayoutController;->mOnTimerFinishedListener:Landroidx/wear/widget/CircularProgressLayout$OnTimerFinishedListener;

    return-object v0
.end method

.method isIndeterminate()Z
    .locals 1

    .line 66
    iget-boolean v0, p0, Landroidx/wear/widget/CircularProgressLayoutController;->mIsIndeterminate:Z

    return v0
.end method

.method isTimerRunning()Z
    .locals 1

    .line 71
    iget-boolean v0, p0, Landroidx/wear/widget/CircularProgressLayoutController;->mIsTimerRunning:Z

    return v0
.end method

.method reset()V
    .locals 2

    .line 109
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/wear/widget/CircularProgressLayoutController;->setIndeterminate(Z)V

    .line 110
    invoke-virtual {p0}, Landroidx/wear/widget/CircularProgressLayoutController;->stopTimer()V

    .line 111
    iget-object v0, p0, Landroidx/wear/widget/CircularProgressLayoutController;->mLayout:Landroidx/wear/widget/CircularProgressLayout;

    invoke-virtual {v0}, Landroidx/wear/widget/CircularProgressLayout;->getProgressDrawable()Landroidx/swiperefreshlayout/widget/CircularProgressDrawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Landroidx/swiperefreshlayout/widget/CircularProgressDrawable;->setStartEndTrim(FF)V

    .line 112
    return-void
.end method

.method setIndeterminate(Z)V
    .locals 1
    .param p1, "indeterminate"    # Z

    .line 76
    iget-boolean v0, p0, Landroidx/wear/widget/CircularProgressLayoutController;->mIsIndeterminate:Z

    if-ne v0, p1, :cond_0

    .line 77
    return-void

    .line 79
    :cond_0
    iput-boolean p1, p0, Landroidx/wear/widget/CircularProgressLayoutController;->mIsIndeterminate:Z

    .line 80
    iget-boolean v0, p0, Landroidx/wear/widget/CircularProgressLayoutController;->mIsIndeterminate:Z

    if-eqz v0, :cond_2

    .line 81
    iget-boolean v0, p0, Landroidx/wear/widget/CircularProgressLayoutController;->mIsTimerRunning:Z

    if-eqz v0, :cond_1

    .line 82
    invoke-virtual {p0}, Landroidx/wear/widget/CircularProgressLayoutController;->stopTimer()V

    .line 84
    :cond_1
    iget-object v0, p0, Landroidx/wear/widget/CircularProgressLayoutController;->mLayout:Landroidx/wear/widget/CircularProgressLayout;

    invoke-virtual {v0}, Landroidx/wear/widget/CircularProgressLayout;->getProgressDrawable()Landroidx/swiperefreshlayout/widget/CircularProgressDrawable;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/swiperefreshlayout/widget/CircularProgressDrawable;->start()V

    goto :goto_0

    .line 86
    :cond_2
    iget-object v0, p0, Landroidx/wear/widget/CircularProgressLayoutController;->mLayout:Landroidx/wear/widget/CircularProgressLayout;

    invoke-virtual {v0}, Landroidx/wear/widget/CircularProgressLayout;->getProgressDrawable()Landroidx/swiperefreshlayout/widget/CircularProgressDrawable;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/swiperefreshlayout/widget/CircularProgressDrawable;->stop()V

    .line 88
    :goto_0
    return-void
.end method

.method public setOnTimerFinishedListener(Landroidx/wear/widget/CircularProgressLayout$OnTimerFinishedListener;)V
    .locals 0
    .param p1, "listener"    # Landroidx/wear/widget/CircularProgressLayout$OnTimerFinishedListener;

    .line 61
    iput-object p1, p0, Landroidx/wear/widget/CircularProgressLayoutController;->mOnTimerFinishedListener:Landroidx/wear/widget/CircularProgressLayout$OnTimerFinishedListener;

    .line 62
    return-void
.end method

.method startTimer(JJ)V
    .locals 7
    .param p1, "totalTime"    # J
    .param p3, "updateInterval"    # J

    .line 91
    invoke-virtual {p0}, Landroidx/wear/widget/CircularProgressLayoutController;->reset()V

    .line 92
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/wear/widget/CircularProgressLayoutController;->mIsTimerRunning:Z

    .line 93
    new-instance v1, Landroidx/wear/widget/CircularProgressLayoutController$CircularProgressTimer;

    move-object v2, p0

    move-wide v3, p1

    move-wide v5, p3

    .end local p1    # "totalTime":J
    .end local p3    # "updateInterval":J
    .local v3, "totalTime":J
    .local v5, "updateInterval":J
    invoke-direct/range {v1 .. v6}, Landroidx/wear/widget/CircularProgressLayoutController$CircularProgressTimer;-><init>(Landroidx/wear/widget/CircularProgressLayoutController;JJ)V

    iput-object v1, v2, Landroidx/wear/widget/CircularProgressLayoutController;->mTimer:Landroid/os/CountDownTimer;

    .line 94
    iget-object p1, v2, Landroidx/wear/widget/CircularProgressLayoutController;->mTimer:Landroid/os/CountDownTimer;

    invoke-virtual {p1}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    .line 95
    return-void
.end method

.method stopTimer()V
    .locals 2

    .line 98
    iget-boolean v0, p0, Landroidx/wear/widget/CircularProgressLayoutController;->mIsTimerRunning:Z

    if-eqz v0, :cond_0

    .line 99
    iget-object v0, p0, Landroidx/wear/widget/CircularProgressLayoutController;->mTimer:Landroid/os/CountDownTimer;

    invoke-virtual {v0}, Landroid/os/CountDownTimer;->cancel()V

    .line 100
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/wear/widget/CircularProgressLayoutController;->mIsTimerRunning:Z

    .line 101
    iget-object v0, p0, Landroidx/wear/widget/CircularProgressLayoutController;->mLayout:Landroidx/wear/widget/CircularProgressLayout;

    invoke-virtual {v0}, Landroidx/wear/widget/CircularProgressLayout;->getProgressDrawable()Landroidx/swiperefreshlayout/widget/CircularProgressDrawable;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Landroidx/swiperefreshlayout/widget/CircularProgressDrawable;->setStartEndTrim(FF)V

    .line 103
    :cond_0
    return-void
.end method
