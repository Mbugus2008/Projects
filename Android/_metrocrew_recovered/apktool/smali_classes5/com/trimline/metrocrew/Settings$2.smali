.class Lcom/trimline/metrocrew/Settings$2;
.super Ljava/lang/Object;
.source "Settings.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/Settings;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/Settings;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/Settings;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/Settings;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 51
    iput-object p1, p0, Lcom/trimline/metrocrew/Settings$2;->this$0:Lcom/trimline/metrocrew/Settings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "hasFocus"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "v",
            "hasFocus"
        }
    .end annotation

    .line 54
    if-nez p2, :cond_0

    .line 56
    iget-object v0, p0, Lcom/trimline/metrocrew/Settings$2;->this$0:Lcom/trimline/metrocrew/Settings;

    iget-object v1, p0, Lcom/trimline/metrocrew/Settings$2;->this$0:Lcom/trimline/metrocrew/Settings;

    iget-object v1, v1, Lcom/trimline/metrocrew/Settings;->ip:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "IP"

    invoke-static {v0, v2, v1}, Lcom/trimline/metrocrew/Settings;->access$000(Lcom/trimline/metrocrew/Settings;Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    :cond_0
    return-void
.end method
