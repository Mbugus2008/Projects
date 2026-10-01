.class Lcom/trimline/metrocrew/add_edit_member$1;
.super Ljava/lang/Object;
.source "add_edit_member.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/add_edit_member;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/add_edit_member;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/add_edit_member;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/add_edit_member;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 33
    iput-object p1, p0, Lcom/trimline/metrocrew/add_edit_member$1;->this$0:Lcom/trimline/metrocrew/add_edit_member;

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

    .line 36
    iget-object v0, p0, Lcom/trimline/metrocrew/add_edit_member$1;->this$0:Lcom/trimline/metrocrew/add_edit_member;

    iget-object v0, v0, Lcom/trimline/metrocrew/add_edit_member;->members:Lcom/trimline/metrocrew/databinding/Members;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/databinding/Members;->getD()Lcom/trimline/metrocrew/Member;

    move-result-object v0

    .line 37
    .local v0, "m":Lcom/trimline/metrocrew/Member;
    iget-object v1, v0, Lcom/trimline/metrocrew/Member;->Name:Ljava/lang/String;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 38
    iget-object v1, p0, Lcom/trimline/metrocrew/add_edit_member$1;->this$0:Lcom/trimline/metrocrew/add_edit_member;

    iget-object v1, v1, Lcom/trimline/metrocrew/add_edit_member;->members:Lcom/trimline/metrocrew/databinding/Members;

    iget-object v1, v1, Lcom/trimline/metrocrew/databinding/Members;->Nameedit:Landroid/widget/EditText;

    const-string v2, "Name Required"

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 39
    iget-object v1, p0, Lcom/trimline/metrocrew/add_edit_member$1;->this$0:Lcom/trimline/metrocrew/add_edit_member;

    iget-object v1, v1, Lcom/trimline/metrocrew/add_edit_member;->members:Lcom/trimline/metrocrew/databinding/Members;

    iget-object v1, v1, Lcom/trimline/metrocrew/databinding/Members;->Nameedit:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->requestFocus()Z

    .line 40
    return-void

    .line 42
    :cond_0
    iget-object v1, v0, Lcom/trimline/metrocrew/Member;->Phone_No:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 43
    iget-object v1, p0, Lcom/trimline/metrocrew/add_edit_member$1;->this$0:Lcom/trimline/metrocrew/add_edit_member;

    iget-object v1, v1, Lcom/trimline/metrocrew/add_edit_member;->members:Lcom/trimline/metrocrew/databinding/Members;

    iget-object v1, v1, Lcom/trimline/metrocrew/databinding/Members;->phoneedit:Landroid/widget/EditText;

    const-string v2, "Phone Required"

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 44
    iget-object v1, p0, Lcom/trimline/metrocrew/add_edit_member$1;->this$0:Lcom/trimline/metrocrew/add_edit_member;

    iget-object v1, v1, Lcom/trimline/metrocrew/add_edit_member;->members:Lcom/trimline/metrocrew/databinding/Members;

    iget-object v1, v1, Lcom/trimline/metrocrew/databinding/Members;->phoneedit:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->requestFocus()Z

    .line 45
    return-void

    .line 47
    :cond_1
    iget-object v1, v0, Lcom/trimline/metrocrew/Member;->ID_No:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 48
    iget-object v1, p0, Lcom/trimline/metrocrew/add_edit_member$1;->this$0:Lcom/trimline/metrocrew/add_edit_member;

    iget-object v1, v1, Lcom/trimline/metrocrew/add_edit_member;->members:Lcom/trimline/metrocrew/databinding/Members;

    iget-object v1, v1, Lcom/trimline/metrocrew/databinding/Members;->idedit:Landroid/widget/EditText;

    const-string v2, "Id Required"

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    .line 49
    iget-object v1, p0, Lcom/trimline/metrocrew/add_edit_member$1;->this$0:Lcom/trimline/metrocrew/add_edit_member;

    iget-object v1, v1, Lcom/trimline/metrocrew/add_edit_member;->members:Lcom/trimline/metrocrew/databinding/Members;

    iget-object v1, v1, Lcom/trimline/metrocrew/databinding/Members;->idedit:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->requestFocus()Z

    .line 50
    return-void

    .line 53
    :cond_2
    new-instance v1, Lcom/trimline/metrocrew/add_edit_member$savemember;

    iget-object v2, p0, Lcom/trimline/metrocrew/add_edit_member$1;->this$0:Lcom/trimline/metrocrew/add_edit_member;

    invoke-direct {v1, v2, v0}, Lcom/trimline/metrocrew/add_edit_member$savemember;-><init>(Lcom/trimline/metrocrew/add_edit_member;Lcom/trimline/metrocrew/Member;)V

    sget-object v2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Void;

    invoke-virtual {v1, v2, v3}, Lcom/trimline/metrocrew/add_edit_member$savemember;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 54
    return-void
.end method
