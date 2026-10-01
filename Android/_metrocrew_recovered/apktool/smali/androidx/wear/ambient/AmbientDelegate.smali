.class final Landroidx/wear/ambient/AmbientDelegate;
.super Ljava/lang/Object;
.source "AmbientDelegate.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;
    }
.end annotation


# instance fields
.field private final mActivity:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field

.field private final mCallback:Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;

.field private mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

.field private final mWearableControllerProvider:Landroidx/wear/ambient/WearableControllerProvider;


# direct methods
.method constructor <init>(Landroid/app/Activity;Landroidx/wear/ambient/WearableControllerProvider;Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "wearableControllerProvider"    # Landroidx/wear/ambient/WearableControllerProvider;
    .param p3, "callback"    # Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/wear/ambient/AmbientDelegate;->mActivity:Ljava/lang/ref/WeakReference;

    .line 87
    iput-object p3, p0, Landroidx/wear/ambient/AmbientDelegate;->mCallback:Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;

    .line 88
    iput-object p2, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableControllerProvider:Landroidx/wear/ambient/WearableControllerProvider;

    .line 89
    return-void
.end method


# virtual methods
.method dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 1
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "fd"    # Ljava/io/FileDescriptor;
    .param p3, "writer"    # Ljava/io/PrintWriter;
    .param p4, "args"    # [Ljava/lang/String;

    .line 185
    iget-object v0, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    if-eqz v0, :cond_0

    .line 186
    iget-object v0, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/google/android/wearable/compat/WearableActivityController;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 188
    :cond_0
    return-void
.end method

.method isAmbient()Z
    .locals 1

    .line 174
    iget-object v0, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    if-eqz v0, :cond_0

    .line 175
    iget-object v0, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    invoke-virtual {v0}, Lcom/google/android/wearable/compat/WearableActivityController;->isAmbient()Z

    move-result v0

    return v0

    .line 177
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method onCreate()V
    .locals 3

    .line 95
    iget-object v0, p0, Landroidx/wear/ambient/AmbientDelegate;->mActivity:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    .line 96
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 97
    iget-object v1, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableControllerProvider:Landroidx/wear/ambient/WearableControllerProvider;

    iget-object v2, p0, Landroidx/wear/ambient/AmbientDelegate;->mCallback:Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;

    .line 98
    invoke-virtual {v1, v0, v2}, Landroidx/wear/ambient/WearableControllerProvider;->getWearableController(Landroid/app/Activity;Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;)Lcom/google/android/wearable/compat/WearableActivityController;

    move-result-object v1

    iput-object v1, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    .line 100
    :cond_0
    iget-object v1, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    if-eqz v1, :cond_1

    .line 101
    iget-object v1, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    invoke-virtual {v1}, Lcom/google/android/wearable/compat/WearableActivityController;->onCreate()V

    .line 103
    :cond_1
    return-void
.end method

.method onDestroy()V
    .locals 1

    .line 136
    iget-object v0, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    if-eqz v0, :cond_0

    .line 137
    iget-object v0, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    invoke-virtual {v0}, Lcom/google/android/wearable/compat/WearableActivityController;->onDestroy()V

    .line 139
    :cond_0
    return-void
.end method

.method onPause()V
    .locals 1

    .line 118
    iget-object v0, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    if-eqz v0, :cond_0

    .line 119
    iget-object v0, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    invoke-virtual {v0}, Lcom/google/android/wearable/compat/WearableActivityController;->onPause()V

    .line 121
    :cond_0
    return-void
.end method

.method onResume()V
    .locals 1

    .line 109
    iget-object v0, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    if-eqz v0, :cond_0

    .line 110
    iget-object v0, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    invoke-virtual {v0}, Lcom/google/android/wearable/compat/WearableActivityController;->onResume()V

    .line 112
    :cond_0
    return-void
.end method

.method onStop()V
    .locals 1

    .line 127
    iget-object v0, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    if-eqz v0, :cond_0

    .line 128
    iget-object v0, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    invoke-virtual {v0}, Lcom/google/android/wearable/compat/WearableActivityController;->onStop()V

    .line 130
    :cond_0
    return-void
.end method

.method setAmbientEnabled()V
    .locals 1

    .line 146
    iget-object v0, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    if-eqz v0, :cond_0

    .line 147
    iget-object v0, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    invoke-virtual {v0}, Lcom/google/android/wearable/compat/WearableActivityController;->setAmbientEnabled()V

    .line 149
    :cond_0
    return-void
.end method

.method public setAmbientOffloadEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .line 153
    iget-object v0, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    if-eqz v0, :cond_0

    .line 154
    iget-object v0, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    invoke-virtual {v0, p1}, Lcom/google/android/wearable/compat/WearableActivityController;->setAmbientOffloadEnabled(Z)V

    .line 156
    :cond_0
    return-void
.end method

.method public setAutoResumeEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .line 165
    iget-object v0, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    if-eqz v0, :cond_0

    .line 166
    iget-object v0, p0, Landroidx/wear/ambient/AmbientDelegate;->mWearableController:Lcom/google/android/wearable/compat/WearableActivityController;

    invoke-virtual {v0, p1}, Lcom/google/android/wearable/compat/WearableActivityController;->setAutoResumeEnabled(Z)V

    .line 168
    :cond_0
    return-void
.end method
