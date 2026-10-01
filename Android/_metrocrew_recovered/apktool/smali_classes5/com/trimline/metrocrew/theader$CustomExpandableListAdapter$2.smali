.class Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;
.super Ljava/lang/Object;
.source "theader.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->getGroupView(IZLandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;

.field final synthetic val$_theader:Lcom/trimline/metrocrew/theader;

.field final synthetic val$listPosition:I


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;Lcom/trimline/metrocrew/theader;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            "this$0",
            "val$_theader",
            "val$listPosition"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 651
    iput-object p1, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->this$0:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;

    iput-object p2, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->val$_theader:Lcom/trimline/metrocrew/theader;

    iput p3, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->val$listPosition:I

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

    .line 655
    new-instance v0, Landroidx/appcompat/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->this$0:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;

    invoke-static {v1}, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->access$1100(Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;)Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 656
    .local v0, "builder":Landroidx/appcompat/app/AlertDialog$Builder;
    const v1, 0x7f12001c

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setTitle(I)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 657
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Do you want to cancel this receipt for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->val$_theader:Lcom/trimline/metrocrew/theader;

    iget-object v2, v2, Lcom/trimline/metrocrew/theader;->Received_From:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " of KES "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->val$_theader:Lcom/trimline/metrocrew/theader;

    iget v2, v2, Lcom/trimline/metrocrew/theader;->Amount_Recieved:F

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ?"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 658
    const v1, 0x7f0800c5

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setIcon(I)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 659
    new-instance v1, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;

    invoke-direct {v1, p0}, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;-><init>(Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;)V

    const-string v2, "Yes"

    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 706
    new-instance v1, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$2;

    invoke-direct {v1, p0}, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$2;-><init>(Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;)V

    const-string v2, "No"

    invoke-virtual {v0, v2, v1}, Landroidx/appcompat/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroidx/appcompat/app/AlertDialog$Builder;

    .line 711
    invoke-virtual {v0}, Landroidx/appcompat/app/AlertDialog$Builder;->create()Landroidx/appcompat/app/AlertDialog;

    move-result-object v1

    .line 712
    .local v1, "alert":Landroidx/appcompat/app/AlertDialog;
    invoke-virtual {v1}, Landroidx/appcompat/app/AlertDialog;->show()V

    .line 716
    return-void
.end method
