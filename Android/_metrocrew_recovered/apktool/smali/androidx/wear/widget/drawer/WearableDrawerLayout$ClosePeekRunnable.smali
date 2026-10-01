.class Landroidx/wear/widget/drawer/WearableDrawerLayout$ClosePeekRunnable;
.super Ljava/lang/Object;
.source "WearableDrawerLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/drawer/WearableDrawerLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ClosePeekRunnable"
.end annotation


# instance fields
.field private final mGravity:I

.field final synthetic this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;


# direct methods
.method constructor <init>(Landroidx/wear/widget/drawer/WearableDrawerLayout;I)V
    .locals 0
    .param p2, "gravity"    # I

    .line 1199
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$ClosePeekRunnable;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1200
    iput p2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$ClosePeekRunnable;->mGravity:I

    .line 1201
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1205
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$ClosePeekRunnable;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$ClosePeekRunnable;->mGravity:I

    invoke-virtual {v0, v1}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->findDrawerWithGravity(I)Landroidx/wear/widget/drawer/WearableDrawerView;

    move-result-object v0

    .line 1206
    .local v0, "drawer":Landroidx/wear/widget/drawer/WearableDrawerView;
    if-eqz v0, :cond_0

    .line 1207
    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->isOpened()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1208
    invoke-virtual {v0}, Landroidx/wear/widget/drawer/WearableDrawerView;->getDrawerState()I

    move-result v1

    if-nez v1, :cond_0

    .line 1209
    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$ClosePeekRunnable;->this$0:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget v2, p0, Landroidx/wear/widget/drawer/WearableDrawerLayout$ClosePeekRunnable;->mGravity:I

    invoke-virtual {v1, v2}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->closeDrawer(I)V

    .line 1211
    :cond_0
    return-void
.end method
