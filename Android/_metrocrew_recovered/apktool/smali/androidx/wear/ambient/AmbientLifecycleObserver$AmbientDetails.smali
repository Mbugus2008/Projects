.class public final Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientDetails;
.super Ljava/lang/Object;
.source "AmbientLifecycleObserver.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/ambient/AmbientLifecycleObserver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "AmbientDetails"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0010\u000e\n\u0000\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0005J\u0008\u0010\t\u001a\u00020\nH\u0016R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u0011\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\u0007\u00a8\u0006\u000b"
    }
    d2 = {
        "Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientDetails;",
        "",
        "burnInProtectionRequired",
        "",
        "deviceHasLowBitAmbient",
        "(ZZ)V",
        "getBurnInProtectionRequired",
        "()Z",
        "getDeviceHasLowBitAmbient",
        "toString",
        "",
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


# instance fields
.field private final burnInProtectionRequired:Z

.field private final deviceHasLowBitAmbient:Z


# direct methods
.method public constructor <init>(ZZ)V
    .locals 0
    .param p1, "burnInProtectionRequired"    # Z
    .param p2, "deviceHasLowBitAmbient"    # Z

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 127
    iput-boolean p1, p0, Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientDetails;->burnInProtectionRequired:Z

    .line 128
    iput-boolean p2, p0, Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientDetails;->deviceHasLowBitAmbient:Z

    .line 126
    return-void
.end method


# virtual methods
.method public final getBurnInProtectionRequired()Z
    .locals 1

    .line 127
    iget-boolean v0, p0, Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientDetails;->burnInProtectionRequired:Z

    return v0
.end method

.method public final getDeviceHasLowBitAmbient()Z
    .locals 1

    .line 128
    iget-boolean v0, p0, Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientDetails;->deviceHasLowBitAmbient:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 131
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AmbientDetails - burnInProtectionRequired: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientDetails;->burnInProtectionRequired:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", deviceHasLowBitAmbient: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 132
    iget-boolean v1, p0, Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientDetails;->deviceHasLowBitAmbient:Z

    .line 131
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 132
    return-object v0
.end method
