.class Lcom/trimline/metrocrew/login$2;
.super Ljava/lang/Object;
.source "login.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/login;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/login;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/login;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/login;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 68
    iput-object p1, p0, Lcom/trimline/metrocrew/login$2;->this$0:Lcom/trimline/metrocrew/login;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 71
    iget-object v0, p0, Lcom/trimline/metrocrew/login$2;->this$0:Lcom/trimline/metrocrew/login;

    iget-object v0, v0, Lcom/trimline/metrocrew/login;->username:Landroid/widget/EditText;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 72
    iget-object v0, p0, Lcom/trimline/metrocrew/login$2;->this$0:Lcom/trimline/metrocrew/login;

    iget-object v0, v0, Lcom/trimline/metrocrew/login;->pass:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 73
    iget-object v0, p0, Lcom/trimline/metrocrew/login$2;->this$0:Lcom/trimline/metrocrew/login;

    iget-object v0, v0, Lcom/trimline/metrocrew/login;->username:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 74
    iget-object v0, p0, Lcom/trimline/metrocrew/login$2;->this$0:Lcom/trimline/metrocrew/login;

    iget-object v0, v0, Lcom/trimline/metrocrew/login;->username:Landroid/widget/EditText;

    const-string v1, "username required"

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 75
    iget-object v0, p0, Lcom/trimline/metrocrew/login$2;->this$0:Lcom/trimline/metrocrew/login;

    iget-object v0, v0, Lcom/trimline/metrocrew/login;->username:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 76
    return-void

    .line 78
    :cond_0
    iget-object v0, p0, Lcom/trimline/metrocrew/login$2;->this$0:Lcom/trimline/metrocrew/login;

    iget-object v0, v0, Lcom/trimline/metrocrew/login;->pass:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 79
    iget-object v0, p0, Lcom/trimline/metrocrew/login$2;->this$0:Lcom/trimline/metrocrew/login;

    iget-object v0, v0, Lcom/trimline/metrocrew/login;->pass:Landroid/widget/EditText;

    const-string v1, "Password required"

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 80
    iget-object v0, p0, Lcom/trimline/metrocrew/login$2;->this$0:Lcom/trimline/metrocrew/login;

    iget-object v0, v0, Lcom/trimline/metrocrew/login;->pass:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->requestFocus()Z

    .line 81
    return-void

    .line 83
    :cond_1
    new-instance v0, Lcom/trimline/metrocrew/agent;

    invoke-direct {v0}, Lcom/trimline/metrocrew/agent;-><init>()V

    .line 84
    .local v0, "a":Lcom/trimline/metrocrew/agent;
    iget-object v1, p0, Lcom/trimline/metrocrew/login$2;->this$0:Lcom/trimline/metrocrew/login;

    iget-object v1, v1, Lcom/trimline/metrocrew/login;->pass:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/trimline/metrocrew/agent;->Password:Ljava/lang/String;

    .line 85
    iget-object v1, p0, Lcom/trimline/metrocrew/login$2;->this$0:Lcom/trimline/metrocrew/login;

    iget-object v1, v1, Lcom/trimline/metrocrew/login;->username:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/trimline/metrocrew/agent;->Agent_Code:Ljava/lang/String;

    .line 86
    nop

    .line 87
    new-instance v1, Lcom/trimline/metrocrew/login$LoginTask;

    iget-object v2, p0, Lcom/trimline/metrocrew/login$2;->this$0:Lcom/trimline/metrocrew/login;

    invoke-direct {v1, v2, v0}, Lcom/trimline/metrocrew/login$LoginTask;-><init>(Lcom/trimline/metrocrew/login;Lcom/trimline/metrocrew/agent;)V

    sget-object v2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v3, 0x0

    new-array v3, v3, [Lcom/trimline/metrocrew/agent;

    invoke-virtual {v1, v2, v3}, Lcom/trimline/metrocrew/login$LoginTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 90
    return-void
.end method
