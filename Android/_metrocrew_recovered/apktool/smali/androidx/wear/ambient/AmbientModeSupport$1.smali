.class Landroidx/wear/ambient/AmbientModeSupport$1;
.super Ljava/lang/Object;
.source "AmbientModeSupport.java"

# interfaces
.implements Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/ambient/AmbientModeSupport;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/wear/ambient/AmbientModeSupport;


# direct methods
.method constructor <init>(Landroidx/wear/ambient/AmbientModeSupport;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/wear/ambient/AmbientModeSupport;

    .line 170
    iput-object p1, p0, Landroidx/wear/ambient/AmbientModeSupport$1;->this$0:Landroidx/wear/ambient/AmbientModeSupport;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAmbientOffloadInvalidated()V
    .locals 1

    .line 194
    iget-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport$1;->this$0:Landroidx/wear/ambient/AmbientModeSupport;

    iget-object v0, v0, Landroidx/wear/ambient/AmbientModeSupport;->mSuppliedCallback:Landroidx/wear/ambient/AmbientModeSupport$AmbientCallback;

    if-eqz v0, :cond_0

    .line 195
    iget-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport$1;->this$0:Landroidx/wear/ambient/AmbientModeSupport;

    iget-object v0, v0, Landroidx/wear/ambient/AmbientModeSupport;->mSuppliedCallback:Landroidx/wear/ambient/AmbientModeSupport$AmbientCallback;

    invoke-virtual {v0}, Landroidx/wear/ambient/AmbientModeSupport$AmbientCallback;->onAmbientOffloadInvalidated()V

    .line 197
    :cond_0
    return-void
.end method

.method public onEnterAmbient(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "ambientDetails"    # Landroid/os/Bundle;

    .line 173
    iget-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport$1;->this$0:Landroidx/wear/ambient/AmbientModeSupport;

    iget-object v0, v0, Landroidx/wear/ambient/AmbientModeSupport;->mSuppliedCallback:Landroidx/wear/ambient/AmbientModeSupport$AmbientCallback;

    if-eqz v0, :cond_0

    .line 174
    iget-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport$1;->this$0:Landroidx/wear/ambient/AmbientModeSupport;

    iget-object v0, v0, Landroidx/wear/ambient/AmbientModeSupport;->mSuppliedCallback:Landroidx/wear/ambient/AmbientModeSupport$AmbientCallback;

    invoke-virtual {v0, p1}, Landroidx/wear/ambient/AmbientModeSupport$AmbientCallback;->onEnterAmbient(Landroid/os/Bundle;)V

    .line 176
    :cond_0
    return-void
.end method

.method public onExitAmbient()V
    .locals 1

    .line 180
    iget-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport$1;->this$0:Landroidx/wear/ambient/AmbientModeSupport;

    iget-object v0, v0, Landroidx/wear/ambient/AmbientModeSupport;->mSuppliedCallback:Landroidx/wear/ambient/AmbientModeSupport$AmbientCallback;

    if-eqz v0, :cond_0

    .line 181
    iget-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport$1;->this$0:Landroidx/wear/ambient/AmbientModeSupport;

    iget-object v0, v0, Landroidx/wear/ambient/AmbientModeSupport;->mSuppliedCallback:Landroidx/wear/ambient/AmbientModeSupport$AmbientCallback;

    invoke-virtual {v0}, Landroidx/wear/ambient/AmbientModeSupport$AmbientCallback;->onExitAmbient()V

    .line 183
    :cond_0
    return-void
.end method

.method public onUpdateAmbient()V
    .locals 1

    .line 187
    iget-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport$1;->this$0:Landroidx/wear/ambient/AmbientModeSupport;

    iget-object v0, v0, Landroidx/wear/ambient/AmbientModeSupport;->mSuppliedCallback:Landroidx/wear/ambient/AmbientModeSupport$AmbientCallback;

    if-eqz v0, :cond_0

    .line 188
    iget-object v0, p0, Landroidx/wear/ambient/AmbientModeSupport$1;->this$0:Landroidx/wear/ambient/AmbientModeSupport;

    iget-object v0, v0, Landroidx/wear/ambient/AmbientModeSupport;->mSuppliedCallback:Landroidx/wear/ambient/AmbientModeSupport$AmbientCallback;

    invoke-virtual {v0}, Landroidx/wear/ambient/AmbientModeSupport$AmbientCallback;->onUpdateAmbient()V

    .line 190
    :cond_0
    return-void
.end method
