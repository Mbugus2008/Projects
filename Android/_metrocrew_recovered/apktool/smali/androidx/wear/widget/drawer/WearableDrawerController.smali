.class public Landroidx/wear/widget/drawer/WearableDrawerController;
.super Ljava/lang/Object;
.source "WearableDrawerController.java"


# instance fields
.field private final mDrawerLayout:Landroidx/wear/widget/drawer/WearableDrawerLayout;

.field private final mDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;


# direct methods
.method constructor <init>(Landroidx/wear/widget/drawer/WearableDrawerLayout;Landroidx/wear/widget/drawer/WearableDrawerView;)V
    .locals 0
    .param p1, "drawerLayout"    # Landroidx/wear/widget/drawer/WearableDrawerLayout;
    .param p2, "drawerView"    # Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableDrawerController;->mDrawerLayout:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    .line 30
    iput-object p2, p0, Landroidx/wear/widget/drawer/WearableDrawerController;->mDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 31
    return-void
.end method


# virtual methods
.method public closeDrawer()V
    .locals 2

    .line 44
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerController;->mDrawerLayout:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerController;->mDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v0, v1}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->closeDrawer(Landroidx/wear/widget/drawer/WearableDrawerView;)V

    .line 45
    return-void
.end method

.method public openDrawer()V
    .locals 2

    .line 37
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerController;->mDrawerLayout:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerController;->mDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v0, v1}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->openDrawer(Landroidx/wear/widget/drawer/WearableDrawerView;)V

    .line 38
    return-void
.end method

.method public peekDrawer()V
    .locals 2

    .line 51
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerController;->mDrawerLayout:Landroidx/wear/widget/drawer/WearableDrawerLayout;

    iget-object v1, p0, Landroidx/wear/widget/drawer/WearableDrawerController;->mDrawerView:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v0, v1}, Landroidx/wear/widget/drawer/WearableDrawerLayout;->peekDrawer(Landroidx/wear/widget/drawer/WearableDrawerView;)V

    .line 52
    return-void
.end method
