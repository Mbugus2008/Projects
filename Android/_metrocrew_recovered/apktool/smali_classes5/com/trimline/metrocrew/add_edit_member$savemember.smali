.class Lcom/trimline/metrocrew/add_edit_member$savemember;
.super Landroid/os/AsyncTask;
.source "add_edit_member.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/add_edit_member;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "savemember"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Lcom/trimline/metrocrew/Member;",
        "Lcom/trimline/metrocrew/Member;",
        ">;"
    }
.end annotation


# instance fields
.field aa:Lcom/trimline/metrocrew/Member;

.field private dialog:Landroid/app/ProgressDialog;

.field final synthetic this$0:Lcom/trimline/metrocrew/add_edit_member;


# direct methods
.method public constructor <init>(Lcom/trimline/metrocrew/add_edit_member;Lcom/trimline/metrocrew/Member;)V
    .locals 1
    .param p2, "a"    # Lcom/trimline/metrocrew/Member;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            "this$0",
            "a"
        }
    .end annotation

    .line 60
    iput-object p1, p0, Lcom/trimline/metrocrew/add_edit_member$savemember;->this$0:Lcom/trimline/metrocrew/add_edit_member;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 61
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/add_edit_member$savemember;->dialog:Landroid/app/ProgressDialog;

    .line 62
    iput-object p2, p0, Lcom/trimline/metrocrew/add_edit_member$savemember;->aa:Lcom/trimline/metrocrew/Member;

    .line 63
    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/trimline/metrocrew/Member;
    .locals 6
    .param p1, "params"    # [Ljava/lang/Void;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "params"
        }
    .end annotation

    .line 72
    const/4 v0, 0x0

    .line 73
    .local v0, "results":Lcom/trimline/metrocrew/Member;
    const/4 v1, 0x0

    .line 75
    .local v1, "result":Ljava/lang/String;
    :try_start_0
    new-instance v2, Lcom/google/gson/GsonBuilder;

    invoke-direct {v2}, Lcom/google/gson/GsonBuilder;-><init>()V

    const-string v3, "yyyy-MM-dd"

    invoke-virtual {v2, v3}, Lcom/google/gson/GsonBuilder;->setDateFormat(Ljava/lang/String;)Lcom/google/gson/GsonBuilder;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/gson/GsonBuilder;->create()Lcom/google/gson/Gson;

    move-result-object v2

    .line 77
    .local v2, "g":Lcom/google/gson/Gson;
    const-string v3, "newmember"

    const-string v4, "data"

    iget-object v5, p0, Lcom/trimline/metrocrew/add_edit_member$savemember;->aa:Lcom/trimline/metrocrew/Member;

    invoke-virtual {v2, v5}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/trimline/metrocrew/JsonParser;->postjson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    move-object v1, v3

    .line 78
    new-instance v3, Lcom/trimline/metrocrew/add_edit_member$savemember$1;

    invoke-direct {v3, p0}, Lcom/trimline/metrocrew/add_edit_member$savemember$1;-><init>(Lcom/trimline/metrocrew/add_edit_member$savemember;)V

    .line 79
    invoke-virtual {v3}, Lcom/trimline/metrocrew/add_edit_member$savemember$1;->getType()Ljava/lang/reflect/Type;

    move-result-object v3

    .line 80
    .local v3, "localType":Ljava/lang/reflect/Type;
    new-instance v4, Lcom/google/gson/Gson;

    invoke-direct {v4}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v4, v1, v3}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/trimline/metrocrew/Member;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v0, v4

    .line 81
    nop

    .line 87
    .end local v2    # "g":Lcom/google/gson/Gson;
    .end local v3    # "localType":Ljava/lang/reflect/Type;
    goto :goto_0

    .line 84
    :catch_0
    move-exception v2

    .line 86
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 88
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_0
    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "params"
        }
    .end annotation

    .line 57
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/add_edit_member$savemember;->doInBackground([Ljava/lang/Void;)Lcom/trimline/metrocrew/Member;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Lcom/trimline/metrocrew/Member;)V
    .locals 3
    .param p1, "res"    # Lcom/trimline/metrocrew/Member;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "res"
        }
    .end annotation

    .line 93
    iget-object v0, p0, Lcom/trimline/metrocrew/add_edit_member$savemember;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/trimline/metrocrew/add_edit_member$savemember;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 96
    :cond_0
    if-eqz p1, :cond_1

    .line 97
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 98
    .local v0, "returnIntent":Landroid/content/Intent;
    const-string v1, "member"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 99
    iget-object v1, p0, Lcom/trimline/metrocrew/add_edit_member$savemember;->this$0:Lcom/trimline/metrocrew/add_edit_member;

    const/4 v2, -0x1

    invoke-virtual {v1, v2, v0}, Lcom/trimline/metrocrew/add_edit_member;->setResult(ILandroid/content/Intent;)V

    .line 100
    iget-object v1, p0, Lcom/trimline/metrocrew/add_edit_member$savemember;->this$0:Lcom/trimline/metrocrew/add_edit_member;

    invoke-virtual {v1}, Lcom/trimline/metrocrew/add_edit_member;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 103
    .end local v0    # "returnIntent":Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 104
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 105
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_1
    :goto_0
    nop

    .line 106
    :goto_1
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

    .line 57
    check-cast p1, Lcom/trimline/metrocrew/Member;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/add_edit_member$savemember;->onPostExecute(Lcom/trimline/metrocrew/Member;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 3

    .line 66
    iget-object v0, p0, Lcom/trimline/metrocrew/add_edit_member$savemember;->dialog:Landroid/app/ProgressDialog;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Creating account for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/trimline/metrocrew/add_edit_member$savemember;->aa:Lcom/trimline/metrocrew/Member;

    iget-object v2, v2, Lcom/trimline/metrocrew/Member;->Name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", please wait."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 67
    iget-object v0, p0, Lcom/trimline/metrocrew/add_edit_member$savemember;->dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 68
    return-void
.end method
