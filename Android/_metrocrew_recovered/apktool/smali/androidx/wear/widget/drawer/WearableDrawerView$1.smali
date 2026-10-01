.class Landroidx/wear/widget/drawer/WearableDrawerView$1;
.super Ljava/lang/Object;
.source "WearableDrawerView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/wear/widget/drawer/WearableDrawerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/wear/widget/drawer/WearableDrawerView;


# direct methods
.method constructor <init>(Landroidx/wear/widget/drawer/WearableDrawerView;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/wear/widget/drawer/WearableDrawerView;

    .line 160
    iput-object p1, p0, Landroidx/wear/widget/drawer/WearableDrawerView$1;->this$0:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .line 163
    iget-object v0, p0, Landroidx/wear/widget/drawer/WearableDrawerView$1;->this$0:Landroidx/wear/widget/drawer/WearableDrawerView;

    invoke-virtual {v0, p1}, Landroidx/wear/widget/drawer/WearableDrawerView;->onPeekContainerClicked(Landroid/view/View;)V

    .line 164
    return-void
.end method
