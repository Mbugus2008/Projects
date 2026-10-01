.class public interface abstract Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;
.super Ljava/lang/Object;
.source "AmbientLifecycleObserver.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/ambient/AmbientLifecycleObserver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "AmbientLifecycleCallback"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008f\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016J\u0008\u0010\u0006\u001a\u00020\u0003H\u0016J\u0008\u0010\u0007\u001a\u00020\u0003H\u0016\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006\u0008\u00c0\u0006\u0001"
    }
    d2 = {
        "Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;",
        "",
        "onEnterAmbient",
        "",
        "ambientDetails",
        "Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientDetails;",
        "onExitAmbient",
        "onUpdateAmbient",
        "wear_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# virtual methods
.method public onEnterAmbient(Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientDetails;)V
    .locals 1
    .param p1, "ambientDetails"    # Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientDetails;

    const-string v0, "ambientDetails"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 146
    return-void
.end method

.method public onExitAmbient()V
    .locals 0

    .line 158
    return-void
.end method

.method public onUpdateAmbient()V
    .locals 0

    .line 152
    return-void
.end method
