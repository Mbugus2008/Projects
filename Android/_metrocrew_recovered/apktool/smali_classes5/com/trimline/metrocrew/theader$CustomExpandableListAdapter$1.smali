.class Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$1;
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

.field final synthetic val$finalConvertView:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;Landroid/view/View;Lcom/trimline/metrocrew/theader;)V
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
            "val$finalConvertView",
            "val$_theader"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 632
    iput-object p1, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$1;->this$0:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;

    iput-object p2, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$1;->val$finalConvertView:Landroid/view/View;

    iput-object p3, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$1;->val$_theader:Lcom/trimline/metrocrew/theader;

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

    .line 635
    new-instance v0, Lcom/trimline/metrocrew/Printer$printer;

    invoke-direct {v0}, Lcom/trimline/metrocrew/Printer$printer;-><init>()V

    .line 636
    .local v0, "p":Lcom/trimline/metrocrew/Printer$printer;
    iget-object v1, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$1;->val$finalConvertView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0800be

    invoke-static {v1, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 637
    .local v1, "b":Landroid/graphics/Bitmap;
    iget-object v2, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$1;->val$_theader:Lcom/trimline/metrocrew/theader;

    invoke-virtual {v0, v1, v2}, Lcom/trimline/metrocrew/Printer$printer;->printcollection(Landroid/graphics/Bitmap;Lcom/trimline/metrocrew/theader;)V

    .line 638
    return-void
.end method
