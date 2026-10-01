.class public Lcom/trimline/metrocrew/add_edit_member;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "add_edit_member.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/add_edit_member$savemember;
    }
.end annotation


# instance fields
.field members:Lcom/trimline/metrocrew/databinding/Members;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "savedInstanceState"
        }
    .end annotation

    .line 26
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 28
    const v0, 0x7f0d001c

    invoke-static {p0, v0}, Landroidx/databinding/DataBindingUtil;->setContentView(Landroid/app/Activity;I)Landroidx/databinding/ViewDataBinding;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/databinding/Members;

    iput-object v0, p0, Lcom/trimline/metrocrew/add_edit_member;->members:Lcom/trimline/metrocrew/databinding/Members;

    .line 29
    invoke-virtual {p0}, Lcom/trimline/metrocrew/add_edit_member;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 30
    .local v0, "i":Landroid/content/Intent;
    const-string v1, "member"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Lcom/trimline/metrocrew/Member;

    .line 31
    .local v1, "t":Lcom/trimline/metrocrew/Member;
    iget-object v2, p0, Lcom/trimline/metrocrew/add_edit_member;->members:Lcom/trimline/metrocrew/databinding/Members;

    invoke-virtual {v2, v1}, Lcom/trimline/metrocrew/databinding/Members;->setD(Lcom/trimline/metrocrew/Member;)V

    .line 33
    iget-object v2, p0, Lcom/trimline/metrocrew/add_edit_member;->members:Lcom/trimline/metrocrew/databinding/Members;

    iget-object v2, v2, Lcom/trimline/metrocrew/databinding/Members;->save:Landroid/widget/Button;

    new-instance v3, Lcom/trimline/metrocrew/add_edit_member$1;

    invoke-direct {v3, p0}, Lcom/trimline/metrocrew/add_edit_member$1;-><init>(Lcom/trimline/metrocrew/add_edit_member;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    return-void
.end method
