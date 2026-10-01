.class interface abstract Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;
.super Ljava/lang/Object;
.source "AmbientDelegate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/ambient/AmbientDelegate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "AmbientCallback"
.end annotation


# virtual methods
.method public abstract onAmbientOffloadInvalidated()V
.end method

.method public abstract onEnterAmbient(Landroid/os/Bundle;)V
.end method

.method public abstract onExitAmbient()V
.end method

.method public abstract onUpdateAmbient()V
.end method
