.class public final Landroidx/wear/ambient/AmbientModeSupport;
.super Landroidx/fragment/app/Fragment;
.source "AmbientModeSupport.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/ambient/AmbientModeSupport$AmbientController;,
        Landroidx/wear/ambient/AmbientModeSupport$AmbientCallbackProvider;,
        Landroidx/wear/ambient/AmbientModeSupport$AmbientCallback;
    }
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field public static final EXTRA_BURN_IN_PROTECTION:Ljava/lang/String; = "com.google.android.wearable.compat.extra.BURN_IN_PROTECTION"

.field public static final EXTRA_LOWBIT_AMBIENT:Ljava/lang/String; = "com.google.android.wearable.compat.extra.LOWBIT_AMBIENT"

.field public static final FRAGMENT_TAG:Ljava/lang/String; = "android.support.wearable.ambient.AmbientMode"

.field private static final TAG:Ljava/lang/String; = "AmbientModeSupport"


# instance fields
.field private final mCallback:Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;

.field private mController:Landroidx/wear/ambient/AmbientModeSupport$AmbientController;

.field mDelegate:Landroidx/wear/ambient/AmbientDelegate;

.field mSuppliedCallback:Landroidx/wear/ambient/AmbientModeSupport$AmbientCallback;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 209
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    .line 169
    new-instance v0, Landroidx/wear/ambient/AmbientModeSupport$1;

    invoke-direct {v0, p0}, Landroidx/wear/ambient/AmbientModeSupport$1;-><init>(Landroidx/wear/ambient/AmbientModeSupport;)V

    iput-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport;->mCallback:Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;

    .line 210
    new-instance v0, Landroidx/wear/ambient/AmbientModeSupport$AmbientController;

    invoke-direct {v0, p0}, Landroidx/wear/ambient/AmbientModeSupport$AmbientController;-><init>(Landroidx/wear/ambient/AmbientModeSupport;)V

    iput-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport;->mController:Landroidx/wear/ambient/AmbientModeSupport$AmbientController;

    .line 211
    return-void
.end method

.method public static attach(Landroidx/fragment/app/FragmentActivity;)Landroidx/wear/ambient/AmbientModeSupport$AmbientController;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroidx/fragment/app/FragmentActivity;",
            ">(TT;)",
            "Landroidx/wear/ambient/AmbientModeSupport$AmbientController;"
        }
    .end annotation

    .line 285
    .local p0, "activity":Landroidx/fragment/app/FragmentActivity;, "TT;"
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 286
    .local v0, "fragmentManager":Landroidx/fragment/app/FragmentManager;
    nop

    .line 287
    const-string v1, "android.support.wearable.ambient.AmbientMode"

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v2

    check-cast v2, Landroidx/wear/ambient/AmbientModeSupport;

    .line 288
    .local v2, "ambientFragment":Landroidx/wear/ambient/AmbientModeSupport;
    if-nez v2, :cond_0

    .line 289
    new-instance v3, Landroidx/wear/ambient/AmbientModeSupport;

    invoke-direct {v3}, Landroidx/wear/ambient/AmbientModeSupport;-><init>()V

    .line 290
    .local v3, "fragment":Landroidx/wear/ambient/AmbientModeSupport;
    nop

    .line 291
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v4

    .line 292
    invoke-virtual {v4, v3, v1}, Landroidx/fragment/app/FragmentTransaction;->add(Landroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    move-result-object v1

    .line 293
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    .line 294
    move-object v2, v3

    .line 296
    .end local v3    # "fragment":Landroidx/wear/ambient/AmbientModeSupport;
    :cond_0
    iget-object v1, v2, Landroidx/wear/ambient/AmbientModeSupport;->mController:Landroidx/wear/ambient/AmbientModeSupport$AmbientController;

    return-object v1
.end method


# virtual methods
.method public dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 1
    .param p1, "prefix"    # Ljava/lang/String;
    .param p2, "fd"    # Ljava/io/FileDescriptor;
    .param p3, "writer"    # Ljava/io/PrintWriter;
    .param p4, "args"    # [Ljava/lang/String;

    .line 301
    iget-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport;->mDelegate:Landroidx/wear/ambient/AmbientDelegate;

    if-eqz v0, :cond_0

    .line 302
    iget-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport;->mDelegate:Landroidx/wear/ambient/AmbientDelegate;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroidx/wear/ambient/AmbientDelegate;->dump(Ljava/lang/String;Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 304
    :cond_0
    return-void
.end method

.method public onAttach(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .line 216
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onAttach(Landroid/content/Context;)V

    .line 217
    new-instance v0, Landroidx/wear/ambient/AmbientDelegate;

    invoke-virtual {p0}, Landroidx/wear/ambient/AmbientModeSupport;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    new-instance v2, Landroidx/wear/ambient/WearableControllerProvider;

    invoke-direct {v2}, Landroidx/wear/ambient/WearableControllerProvider;-><init>()V

    iget-object v3, p0, Landroidx/wear/ambient/AmbientModeSupport;->mCallback:Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;

    invoke-direct {v0, v1, v2, v3}, Landroidx/wear/ambient/AmbientDelegate;-><init>(Landroid/app/Activity;Landroidx/wear/ambient/WearableControllerProvider;Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;)V

    iput-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport;->mDelegate:Landroidx/wear/ambient/AmbientDelegate;

    .line 219
    instance-of v0, p1, Landroidx/wear/ambient/AmbientModeSupport$AmbientCallbackProvider;

    if-eqz v0, :cond_0

    .line 220
    move-object v0, p1

    check-cast v0, Landroidx/wear/ambient/AmbientModeSupport$AmbientCallbackProvider;

    invoke-interface {v0}, Landroidx/wear/ambient/AmbientModeSupport$AmbientCallbackProvider;->getAmbientCallback()Landroidx/wear/ambient/AmbientModeSupport$AmbientCallback;

    move-result-object v0

    iput-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport;->mSuppliedCallback:Landroidx/wear/ambient/AmbientModeSupport$AmbientCallback;

    goto :goto_0

    .line 222
    :cond_0
    const-string v0, "AmbientModeSupport"

    const-string v1, "No callback provided - enabling only smart resume"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 224
    :goto_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .line 229
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 230
    iget-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport;->mDelegate:Landroidx/wear/ambient/AmbientDelegate;

    invoke-virtual {v0}, Landroidx/wear/ambient/AmbientDelegate;->onCreate()V

    .line 231
    iget-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport;->mSuppliedCallback:Landroidx/wear/ambient/AmbientModeSupport$AmbientCallback;

    if-eqz v0, :cond_0

    .line 232
    iget-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport;->mDelegate:Landroidx/wear/ambient/AmbientDelegate;

    invoke-virtual {v0}, Landroidx/wear/ambient/AmbientDelegate;->setAmbientEnabled()V

    .line 234
    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 260
    iget-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport;->mDelegate:Landroidx/wear/ambient/AmbientDelegate;

    invoke-virtual {v0}, Landroidx/wear/ambient/AmbientDelegate;->onDestroy()V

    .line 261
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    .line 262
    return-void
.end method

.method public onDetach()V
    .locals 1

    .line 267
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport;->mDelegate:Landroidx/wear/ambient/AmbientDelegate;

    .line 268
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDetach()V

    .line 269
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 246
    iget-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport;->mDelegate:Landroidx/wear/ambient/AmbientDelegate;

    invoke-virtual {v0}, Landroidx/wear/ambient/AmbientDelegate;->onPause()V

    .line 247
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    .line 248
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 239
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    .line 240
    iget-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport;->mDelegate:Landroidx/wear/ambient/AmbientDelegate;

    invoke-virtual {v0}, Landroidx/wear/ambient/AmbientDelegate;->onResume()V

    .line 241
    return-void
.end method

.method public onStop()V
    .locals 1

    .line 253
    iget-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport;->mDelegate:Landroidx/wear/ambient/AmbientDelegate;

    invoke-virtual {v0}, Landroidx/wear/ambient/AmbientDelegate;->onStop()V

    .line 254
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    .line 255
    return-void
.end method

.method setAmbientDelegate(Landroidx/wear/ambient/AmbientDelegate;)V
    .locals 0
    .param p1, "delegate"    # Landroidx/wear/ambient/AmbientDelegate;

    .line 308
    iput-object p1, p0, Landroidx/wear/ambient/AmbientModeSupport;->mDelegate:Landroidx/wear/ambient/AmbientDelegate;

    .line 309
    return-void
.end method
