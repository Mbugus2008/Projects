.class public abstract Landroidx/wear/ambient/AmbientMode$AmbientCallback;
.super Ljava/lang/Object;
.source "AmbientMode.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/ambient/AmbientMode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "AmbientCallback"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAmbientOffloadInvalidated()V
    .locals 0

    .line 136
    return-void
.end method

.method public onEnterAmbient(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "ambientDetails"    # Landroid/os/Bundle;

    .line 118
    return-void
.end method

.method public onExitAmbient()V
    .locals 0

    .line 130
    return-void
.end method

.method public onUpdateAmbient()V
    .locals 0

    .line 124
    return-void
.end method
