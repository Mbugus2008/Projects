.class Landroidx/wear/ambient/WearableControllerProvider$1;
.super Lcom/google/android/wearable/compat/WearableActivityController$AmbientCallback;
.source "WearableControllerProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/wear/ambient/WearableControllerProvider;->getWearableController(Landroid/app/Activity;Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;)Lcom/google/android/wearable/compat/WearableActivityController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/wear/ambient/WearableControllerProvider;

.field final synthetic val$callback:Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;


# direct methods
.method constructor <init>(Landroidx/wear/ambient/WearableControllerProvider;Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/wear/ambient/WearableControllerProvider;

    .line 51
    iput-object p1, p0, Landroidx/wear/ambient/WearableControllerProvider$1;->this$0:Landroidx/wear/ambient/WearableControllerProvider;

    iput-object p2, p0, Landroidx/wear/ambient/WearableControllerProvider$1;->val$callback:Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;

    invoke-direct {p0}, Lcom/google/android/wearable/compat/WearableActivityController$AmbientCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onEnterAmbient(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "ambientDetails"    # Landroid/os/Bundle;

    .line 54
    iget-object v0, p0, Landroidx/wear/ambient/WearableControllerProvider$1;->val$callback:Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;

    invoke-interface {v0, p1}, Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;->onEnterAmbient(Landroid/os/Bundle;)V

    .line 55
    return-void
.end method

.method public onExitAmbient()V
    .locals 1

    .line 64
    iget-object v0, p0, Landroidx/wear/ambient/WearableControllerProvider$1;->val$callback:Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;

    invoke-interface {v0}, Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;->onExitAmbient()V

    .line 65
    return-void
.end method

.method public onInvalidateAmbientOffload()V
    .locals 1

    .line 69
    iget-object v0, p0, Landroidx/wear/ambient/WearableControllerProvider$1;->val$callback:Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;

    invoke-interface {v0}, Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;->onAmbientOffloadInvalidated()V

    .line 70
    return-void
.end method

.method public onUpdateAmbient()V
    .locals 1

    .line 59
    iget-object v0, p0, Landroidx/wear/ambient/WearableControllerProvider$1;->val$callback:Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;

    invoke-interface {v0}, Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;->onUpdateAmbient()V

    .line 60
    return-void
.end method
