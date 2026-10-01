.class Landroidx/wear/widget/DismissController;
.super Ljava/lang/Object;
.source "DismissController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/widget/DismissController$OnDismissListener;
    }
.end annotation


# instance fields
.field protected final mContext:Landroid/content/Context;

.field protected mDismissListener:Landroidx/wear/widget/DismissController$OnDismissListener;

.field protected final mLayout:Landroidx/wear/widget/DismissibleFrameLayout;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroidx/wear/widget/DismissibleFrameLayout;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "layout"    # Landroidx/wear/widget/DismissibleFrameLayout;

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Landroidx/wear/widget/DismissController;->mContext:Landroid/content/Context;

    .line 47
    iput-object p2, p0, Landroidx/wear/widget/DismissController;->mLayout:Landroidx/wear/widget/DismissibleFrameLayout;

    .line 48
    return-void
.end method


# virtual methods
.method setOnDismissListener(Landroidx/wear/widget/DismissController$OnDismissListener;)V
    .locals 0
    .param p1, "listener"    # Landroidx/wear/widget/DismissController$OnDismissListener;

    .line 51
    iput-object p1, p0, Landroidx/wear/widget/DismissController;->mDismissListener:Landroidx/wear/widget/DismissController$OnDismissListener;

    .line 52
    return-void
.end method
