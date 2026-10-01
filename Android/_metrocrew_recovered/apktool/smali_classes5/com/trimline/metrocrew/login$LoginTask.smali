.class Lcom/trimline/metrocrew/login$LoginTask;
.super Landroid/os/AsyncTask;
.source "login.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/login;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoginTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Lcom/trimline/metrocrew/agent;",
        "Ljava/lang/Void;",
        "Lcom/trimline/metrocrew/agent;",
        ">;"
    }
.end annotation


# instance fields
.field aa:Lcom/trimline/metrocrew/agent;

.field final synthetic this$0:Lcom/trimline/metrocrew/login;


# direct methods
.method public constructor <init>(Lcom/trimline/metrocrew/login;Lcom/trimline/metrocrew/agent;)V
    .locals 0
    .param p2, "aaa"    # Lcom/trimline/metrocrew/agent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            "this$0",
            "aaa"
        }
    .end annotation

    .line 138
    iput-object p1, p0, Lcom/trimline/metrocrew/login$LoginTask;->this$0:Lcom/trimline/metrocrew/login;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 139
    iput-object p2, p0, Lcom/trimline/metrocrew/login$LoginTask;->aa:Lcom/trimline/metrocrew/agent;

    .line 140
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Lcom/trimline/metrocrew/agent;)Lcom/trimline/metrocrew/agent;
    .locals 2
    .param p1, "agents"    # [Lcom/trimline/metrocrew/agent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "agents"
        }
    .end annotation

    .line 144
    iget-object v0, p0, Lcom/trimline/metrocrew/login$LoginTask;->this$0:Lcom/trimline/metrocrew/login;

    iget-object v0, v0, Lcom/trimline/metrocrew/login;->model:Lcom/trimline/metrocrew/agent$Model;

    iget-object v1, p0, Lcom/trimline/metrocrew/login$LoginTask;->aa:Lcom/trimline/metrocrew/agent;

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/agent$Model;->agent(Lcom/trimline/metrocrew/agent;)Lcom/trimline/metrocrew/agent;

    move-result-object v0

    .line 145
    .local v0, "a":Lcom/trimline/metrocrew/agent;
    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "agents"
        }
    .end annotation

    .line 135
    check-cast p1, [Lcom/trimline/metrocrew/agent;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/login$LoginTask;->doInBackground([Lcom/trimline/metrocrew/agent;)Lcom/trimline/metrocrew/agent;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Lcom/trimline/metrocrew/agent;)V
    .locals 5
    .param p1, "res"    # Lcom/trimline/metrocrew/agent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "res"
        }
    .end annotation

    .line 150
    const/4 v0, 0x1

    if-eqz p1, :cond_0

    .line 151
    iget-object v1, p0, Lcom/trimline/metrocrew/login$LoginTask;->this$0:Lcom/trimline/metrocrew/login;

    iget-object v1, v1, Lcom/trimline/metrocrew/login;->model:Lcom/trimline/metrocrew/agent$Model;

    sput-object p1, Lcom/trimline/metrocrew/agent$Model;->CurrentAgent:Lcom/trimline/metrocrew/agent;

    .line 152
    iget-object v1, p0, Lcom/trimline/metrocrew/login$LoginTask;->this$0:Lcom/trimline/metrocrew/login;

    const-string v2, "User"

    iget-object v3, p1, Lcom/trimline/metrocrew/agent;->Agent_Code:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Lcom/trimline/metrocrew/login;->access$000(Lcom/trimline/metrocrew/login;Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    iget-object v1, p0, Lcom/trimline/metrocrew/login$LoginTask;->this$0:Lcom/trimline/metrocrew/login;

    new-instance v2, Landroid/content/Intent;

    iget-object v3, p0, Lcom/trimline/metrocrew/login$LoginTask;->this$0:Lcom/trimline/metrocrew/login;

    const-class v4, Lcom/trimline/metrocrew/MainActivity;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v2}, Lcom/trimline/metrocrew/login;->startActivity(Landroid/content/Intent;)V

    .line 154
    iget-object v1, p0, Lcom/trimline/metrocrew/login$LoginTask;->this$0:Lcom/trimline/metrocrew/login;

    invoke-virtual {v1}, Lcom/trimline/metrocrew/login;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "Login successfull"

    invoke-static {v1, v2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 156
    :cond_0
    iget-object v1, p0, Lcom/trimline/metrocrew/login$LoginTask;->this$0:Lcom/trimline/metrocrew/login;

    invoke-virtual {v1}, Lcom/trimline/metrocrew/login;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "Invalid username or password"

    invoke-static {v1, v2, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 159
    :goto_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "res"
        }
    .end annotation

    .line 135
    check-cast p1, Lcom/trimline/metrocrew/agent;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/login$LoginTask;->onPostExecute(Lcom/trimline/metrocrew/agent;)V

    return-void
.end method
