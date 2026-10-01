.class Landroidx/wear/widget/drawer/WearableNavigationDrawerView$2;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "WearableNavigationDrawerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/drawer/WearableNavigationDrawerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/wear/widget/drawer/WearableNavigationDrawerView;


# direct methods
.method constructor <init>(Landroidx/wear/widget/drawer/WearableNavigationDrawerView;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

    .line 115
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView$2;->this$0:Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "e"    # Landroid/view/MotionEvent;

    .line 118
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView$2;->this$0:Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

    iget-object v0, v0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->mPresenter:Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;

    invoke-virtual {v0}, Landroidx/wear/internal/widget/drawer/WearableNavigationDrawerPresenter;->onDrawerTapped()Z

    move-result v0

    return v0
.end method
