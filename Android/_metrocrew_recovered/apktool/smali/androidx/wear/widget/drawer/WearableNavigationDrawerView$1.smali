.class Landroidx/wear/widget/drawer/WearableNavigationDrawerView$1;
.super Ljava/lang/Object;
.source "WearableNavigationDrawerView.java"

# interfaces
.implements Ljava/lang/Runnable;


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

    .line 102
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView$1;->this$0:Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 105
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableNavigationDrawerView$1;->this$0:Landroidx/wear/widget/drawer/WearableNavigationDrawerView;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableNavigationDrawerView;->getController()Landroidx/wear/widget/drawer/WearableDrawerController;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerController;->closeDrawer()V

    .line 106
    return-void
.end method
