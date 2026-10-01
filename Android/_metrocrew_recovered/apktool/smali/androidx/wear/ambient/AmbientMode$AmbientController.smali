.class public final Landroidx/wear/ambient/AmbientMode$AmbientController;
.super Ljava/lang/Object;
.source "AmbientMode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/ambient/AmbientMode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "AmbientController"
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "AmbientController"


# instance fields
.field final synthetic this$0:Landroidx/wear/ambient/AmbientMode;


# direct methods
.method constructor <init>(Landroidx/wear/ambient/AmbientMode;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/wear/ambient/AmbientMode;

    .line 287
    iput-object p1, p0, Landroidx/wear/ambient/AmbientMode$AmbientController;->this$0:Landroidx/wear/ambient/AmbientMode;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isAmbient()Z
    .locals 1

    .line 293
    iget-object v0, p0, Landroidx/wear/ambient/AmbientMode$AmbientController;->this$0:Landroidx/wear/ambient/AmbientMode;

    iget-object v0, v0, Landroidx/wear/ambient/AmbientMode;->mDelegate:Landroidx/wear/ambient/AmbientDelegate;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Landroidx/wear/ambient/AmbientMode$AmbientController;->this$0:Landroidx/wear/ambient/AmbientMode;

    iget-object v0, v0, Landroidx/wear/ambient/AmbientMode;->mDelegate:Landroidx/wear/ambient/AmbientDelegate;

    invoke-virtual {v0}, Landroidx/wear/ambient/AmbientDelegate;->isAmbient()Z

    move-result v0

    :goto_0
    return v0
.end method

.method public setAmbientOffloadEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .line 300
    iget-object v0, p0, Landroidx/wear/ambient/AmbientMode$AmbientController;->this$0:Landroidx/wear/ambient/AmbientMode;

    iget-object v0, v0, Landroidx/wear/ambient/AmbientMode;->mDelegate:Landroidx/wear/ambient/AmbientDelegate;

    if-eqz v0, :cond_0

    .line 301
    iget-object v0, p0, Landroidx/wear/ambient/AmbientMode$AmbientController;->this$0:Landroidx/wear/ambient/AmbientMode;

    iget-object v0, v0, Landroidx/wear/ambient/AmbientMode;->mDelegate:Landroidx/wear/ambient/AmbientDelegate;

    invoke-virtual {v0, p1}, Landroidx/wear/ambient/AmbientDelegate;->setAmbientOffloadEnabled(Z)V

    .line 303
    :cond_0
    return-void
.end method
