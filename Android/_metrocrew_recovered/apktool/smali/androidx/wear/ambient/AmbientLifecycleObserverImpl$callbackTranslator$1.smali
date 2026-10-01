.class public final Landroidx/wear/ambient/AmbientLifecycleObserverImpl$callbackTranslator$1;
.super Ljava/lang/Object;
.source "AmbientLifecycleObserverImpl.kt"

# interfaces
.implements Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/wear/ambient/AmbientLifecycleObserverImpl;-><init>(Landroid/app/Activity;Ljava/util/concurrent/Executor;Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nAmbientLifecycleObserverImpl.kt\nKotlin\n*S Kotlin\n*F\n+ 1 AmbientLifecycleObserverImpl.kt\nandroidx/wear/ambient/AmbientLifecycleObserverImpl$callbackTranslator$1\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,135:1\n1#2:136\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016J\u0012\u0010\u0004\u001a\u00020\u00032\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0006H\u0016J\u0008\u0010\u0007\u001a\u00020\u0003H\u0016J\u0008\u0010\u0008\u001a\u00020\u0003H\u0016\u00a8\u0006\t"
    }
    d2 = {
        "androidx/wear/ambient/AmbientLifecycleObserverImpl$callbackTranslator$1",
        "Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;",
        "onAmbientOffloadInvalidated",
        "",
        "onEnterAmbient",
        "ambientDetails",
        "Landroid/os/Bundle;",
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


# instance fields
.field final synthetic $callback:Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;

.field final synthetic $callbackExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method constructor <init>(Ljava/util/concurrent/Executor;Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;)V
    .locals 0
    .param p1, "$callbackExecutor"    # Ljava/util/concurrent/Executor;
    .param p2, "$callback"    # Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;

    iput-object p1, p0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl$callbackTranslator$1;->$callbackExecutor:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl$callbackTranslator$1;->$callback:Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAmbientOffloadInvalidated()V
    .locals 0

    .line 87
    return-void
.end method

.method public onEnterAmbient(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "ambientDetails"    # Landroid/os/Bundle;

    .line 66
    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 67
    nop

    .line 66
    const-string v1, "com.google.android.wearable.compat.extra.BURN_IN_PROTECTION"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    goto :goto_0

    .line 67
    :cond_0
    move v1, v0

    .line 66
    :goto_0
    nop

    .line 68
    .local v1, "burnInProtection":Z
    if-eqz p1, :cond_1

    .line 69
    nop

    .line 68
    const-string v0, "com.google.android.wearable.compat.extra.LOWBIT_AMBIENT"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    goto :goto_1

    .line 69
    :cond_1
    nop

    .line 68
    :goto_1
    nop

    .line 70
    .local v0, "lowBitAmbient":Z
    iget-object v2, p0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl$callbackTranslator$1;->$callbackExecutor:Ljava/util/concurrent/Executor;

    .local v2, "$this$onEnterAmbient_u24lambda_u240":Ljava/util/concurrent/Executor;
    iget-object v3, p0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl$callbackTranslator$1;->$callback:Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;

    const/4 v4, 0x0

    .line 71
    .local v4, "$i$a$-run-AmbientLifecycleObserverImpl$callbackTranslator$1$onEnterAmbient$1":I
    new-instance v5, Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientDetails;

    .line 72
    nop

    .line 73
    nop

    .line 71
    invoke-direct {v5, v1, v0}, Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientDetails;-><init>(ZZ)V

    invoke-interface {v3, v5}, Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;->onEnterAmbient(Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientDetails;)V

    .line 75
    nop

    .line 70
    .end local v2    # "$this$onEnterAmbient_u24lambda_u240":Ljava/util/concurrent/Executor;
    .end local v4    # "$i$a$-run-AmbientLifecycleObserverImpl$callbackTranslator$1$onEnterAmbient$1":I
    nop

    .line 76
    return-void
.end method

.method public onExitAmbient()V
    .locals 3

    .line 83
    iget-object v0, p0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl$callbackTranslator$1;->$callbackExecutor:Ljava/util/concurrent/Executor;

    .local v0, "$this$onExitAmbient_u24lambda_u242":Ljava/util/concurrent/Executor;
    iget-object v1, p0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl$callbackTranslator$1;->$callback:Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;

    .line 136
    const/4 v2, 0x0

    .line 83
    .local v2, "$i$a$-run-AmbientLifecycleObserverImpl$callbackTranslator$1$onExitAmbient$1":I
    invoke-interface {v1}, Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;->onExitAmbient()V

    .line 84
    .end local v0    # "$this$onExitAmbient_u24lambda_u242":Ljava/util/concurrent/Executor;
    .end local v2    # "$i$a$-run-AmbientLifecycleObserverImpl$callbackTranslator$1$onExitAmbient$1":I
    return-void
.end method

.method public onUpdateAmbient()V
    .locals 3

    .line 79
    iget-object v0, p0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl$callbackTranslator$1;->$callbackExecutor:Ljava/util/concurrent/Executor;

    .local v0, "$this$onUpdateAmbient_u24lambda_u241":Ljava/util/concurrent/Executor;
    iget-object v1, p0, Landroidx/wear/ambient/AmbientLifecycleObserverImpl$callbackTranslator$1;->$callback:Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;

    .line 136
    const/4 v2, 0x0

    .line 79
    .local v2, "$i$a$-run-AmbientLifecycleObserverImpl$callbackTranslator$1$onUpdateAmbient$1":I
    invoke-interface {v1}, Landroidx/wear/ambient/AmbientLifecycleObserver$AmbientLifecycleCallback;->onUpdateAmbient()V

    .line 80
    .end local v0    # "$this$onUpdateAmbient_u24lambda_u241":Ljava/util/concurrent/Executor;
    .end local v2    # "$i$a$-run-AmbientLifecycleObserverImpl$callbackTranslator$1$onUpdateAmbient$1":I
    return-void
.end method
