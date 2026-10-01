.class Lcom/trimline/metrocrew/MainActivity$8;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/MainActivity;->ConfirmationBox(Lcom/trimline/metrocrew/theader;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/MainActivity;

.field final synthetic val$adialog:Landroid/app/AlertDialog;

.field final synthetic val$t:Ljava/util/List;

.field final synthetic val$th:Lcom/trimline/metrocrew/theader;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/MainActivity;Lcom/trimline/metrocrew/theader;Ljava/util/List;Landroid/app/AlertDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/MainActivity;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            "this$0",
            "val$th",
            "val$t",
            "val$adialog"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 248
    iput-object p1, p0, Lcom/trimline/metrocrew/MainActivity$8;->this$0:Lcom/trimline/metrocrew/MainActivity;

    iput-object p2, p0, Lcom/trimline/metrocrew/MainActivity$8;->val$th:Lcom/trimline/metrocrew/theader;

    iput-object p3, p0, Lcom/trimline/metrocrew/MainActivity$8;->val$t:Ljava/util/List;

    iput-object p4, p0, Lcom/trimline/metrocrew/MainActivity$8;->val$adialog:Landroid/app/AlertDialog;

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

    .line 251
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$8;->val$th:Lcom/trimline/metrocrew/theader;

    iget v0, v0, Lcom/trimline/metrocrew/theader;->Print_No:I

    if-nez v0, :cond_0

    .line 252
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$8;->this$0:Lcom/trimline/metrocrew/MainActivity;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0800be

    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 253
    .local v0, "b":Landroid/graphics/Bitmap;
    iget-object v1, p0, Lcom/trimline/metrocrew/MainActivity$8;->val$th:Lcom/trimline/metrocrew/theader;

    iget-object v2, p0, Lcom/trimline/metrocrew/MainActivity$8;->val$t:Ljava/util/List;

    iput-object v2, v1, Lcom/trimline/metrocrew/theader;->tlines:Ljava/util/List;

    .line 254
    iget-object v1, p0, Lcom/trimline/metrocrew/MainActivity$8;->this$0:Lcom/trimline/metrocrew/MainActivity;

    invoke-static {v1}, Lcom/trimline/metrocrew/MainActivity;->access$000(Lcom/trimline/metrocrew/MainActivity;)Lcom/trimline/metrocrew/Printer$printer;

    move-result-object v1

    iget-object v2, p0, Lcom/trimline/metrocrew/MainActivity$8;->val$th:Lcom/trimline/metrocrew/theader;

    invoke-virtual {v1, v0, v2}, Lcom/trimline/metrocrew/Printer$printer;->printcollection(Landroid/graphics/Bitmap;Lcom/trimline/metrocrew/theader;)V

    .line 255
    iget-object v1, p0, Lcom/trimline/metrocrew/MainActivity$8;->val$adialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    .line 256
    .end local v0    # "b":Landroid/graphics/Bitmap;
    goto :goto_0

    .line 259
    :cond_0
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$8;->this$0:Lcom/trimline/metrocrew/MainActivity;

    const-string v1, "Receipt has been cancelled"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 261
    :goto_0
    return-void
.end method
