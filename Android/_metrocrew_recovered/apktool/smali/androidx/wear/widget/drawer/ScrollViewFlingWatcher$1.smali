.class Landroidx/wear/widget/drawer/ScrollViewFlingWatcher$1;
.super Ljava/lang/Object;
.source "ScrollViewFlingWatcher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/widget/drawer/ScrollViewFlingWatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/wear/widget/drawer/ScrollViewFlingWatcher;


# direct methods
.method constructor <init>(Landroidx/wear/widget/drawer/ScrollViewFlingWatcher;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/wear/widget/drawer/ScrollViewFlingWatcher;

    .line 48
    iput-object p1, p0, Landroidx/wear/widget/drawer/ScrollViewFlingWatcher$1;->this$0:Landroidx/wear/widget/drawer/ScrollViewFlingWatcher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 51
    iget-object v0, p0, Landroidx/wear/widget/drawer/ScrollViewFlingWatcher$1;->this$0:Landroidx/wear/widget/drawer/ScrollViewFlingWatcher;

    invoke-virtual {v0}, Landroidx/wear/widget/drawer/ScrollViewFlingWatcher;->onEndOfFlingFound()V

    .line 52
    return-void
.end method
