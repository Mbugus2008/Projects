.class Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$2;
.super Ljava/lang/Object;
.source "theader.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;)V
    .locals 0
    .param p1, "this$1"    # Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$1"
        }
    .end annotation

    .line 706
    iput-object p1, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$2;->this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "id"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dialog",
            "id"
        }
    .end annotation

    .line 708
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 709
    return-void
.end method
