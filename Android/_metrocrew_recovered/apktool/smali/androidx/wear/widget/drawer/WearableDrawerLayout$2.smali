.class Landroidx/wear/widget/drawer/WearableDrawerLayout$2;
.super Ljava/lang/Object;
.source "WearableDrawerLayout.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/wear/widget/drawer/WearableDrawerLayout;->onLayout(ZIIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;


# direct methods
.method constructor <init>(Landroidx/wear/widget/drawer/WearableDrawerLayout;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/wear/widget/drawer/WearableDrawerLayout;

    .line 614
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$2;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 3

    .line 617
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$2;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 618
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$2;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-boolean v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mShouldOpenBottomDrawerAfterLayout:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 619
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$2;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$2;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v2, v2, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mBottomDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v0, v2}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->openDrawerWithoutAnimation(Landroidx/wear/widget/drawer/WearableDrawerView;)V

    .line 620
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$2;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iput-boolean v1, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mShouldOpenBottomDrawerAfterLayout:Z

    goto :goto_0

    .line 621
    :cond_0
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$2;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-boolean v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mShouldPeekBottomDrawerAfterLayout:Z

    if-eqz v0, :cond_1

    .line 622
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$2;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    const/16 v2, 0x50

    invoke-virtual {v0, v2}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->peekDrawer(I)V

    .line 623
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$2;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iput-boolean v1, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mShouldPeekBottomDrawerAfterLayout:Z

    .line 626
    :cond_1
    :goto_0
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$2;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-boolean v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mShouldOpenTopDrawerAfterLayout:Z

    if-eqz v0, :cond_2

    .line 627
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$2;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$2;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v2, v2, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mTopDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v0, v2}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->openDrawerWithoutAnimation(Landroidx/wear/widget/drawer/WearableDrawerView;)V

    .line 628
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$2;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iput-boolean v1, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mShouldOpenTopDrawerAfterLayout:Z

    goto :goto_1

    .line 629
    :cond_2
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$2;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-boolean v0, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mShouldPeekTopDrawerAfterLayout:Z

    if-eqz v0, :cond_3

    .line 630
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$2;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    const/16 v2, 0x30

    invoke-virtual {v0, v2}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->peekDrawer(I)V

    .line 631
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$2;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iput-boolean v1, v0, Landroidx/wear/widget/drawer/WearableDrawerLayout;->mShouldPeekTopDrawerAfterLayout:Z

    .line 633
    :cond_3
    :goto_1
    return-void
.end method
