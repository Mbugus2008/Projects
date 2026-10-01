.class Lcom/trimline/metrocrew/Settings$1;
.super Ljava/lang/Object;
.source "Settings.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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

    .line 38
    iput-object p1, p0, Lcom/trimline/metrocrew/Settings$1;->this$0:Lcom/trimline/metrocrew/Settings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 41
    iget-object v0, p0, Lcom/trimline/metrocrew/Settings$1;->this$0:Lcom/trimline/metrocrew/Settings;

    iget-object v1, p0, Lcom/trimline/metrocrew/Settings$1;->this$0:Lcom/trimline/metrocrew/Settings;

    iget-object v1, v1, Lcom/trimline/metrocrew/Settings;->ip:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "IP"

    invoke-static {v0, v2, v1}, Lcom/trimline/metrocrew/Settings;->access$000(Lcom/trimline/metrocrew/Settings;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    iget-object v0, p0, Lcom/trimline/metrocrew/Settings$1;->this$0:Lcom/trimline/metrocrew/Settings;

    iget-object v1, p0, Lcom/trimline/metrocrew/Settings$1;->this$0:Lcom/trimline/metrocrew/Settings;

    iget-object v1, v1, Lcom/trimline/metrocrew/Settings;->printer:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "PRINTER"

    invoke-static {v0, v2, v1}, Lcom/trimline/metrocrew/Settings;->access$000(Lcom/trimline/metrocrew/Settings;Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    iget-object v0, p0, Lcom/trimline/metrocrew/Settings$1;->this$0:Lcom/trimline/metrocrew/Settings;

    iget-object v1, p0, Lcom/trimline/metrocrew/Settings$1;->this$0:Lcom/trimline/metrocrew/Settings;

    iget-object v1, v1, Lcom/trimline/metrocrew/Settings;->copies:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "COPIES"

    invoke-static {v0, v2, v1}, Lcom/trimline/metrocrew/Settings;->access$000(Lcom/trimline/metrocrew/Settings;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    iget-object v0, p0, Lcom/trimline/metrocrew/Settings$1;->this$0:Lcom/trimline/metrocrew/Settings;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/Settings;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Settings saved successfully"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 45
    iget-object v0, p0, Lcom/trimline/metrocrew/Settings$1;->this$0:Lcom/trimline/metrocrew/Settings;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/Settings;->finish()V

    .line 46
    return-void
.end method
