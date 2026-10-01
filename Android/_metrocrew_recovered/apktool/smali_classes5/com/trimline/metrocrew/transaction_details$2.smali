.class Lcom/trimline/metrocrew/transaction_details$2;
.super Ljava/lang/Object;
.source "transaction_details.java"

# interfaces
.implements Landroid/widget/ExpandableListView$OnGroupCollapseListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/transaction_details;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/transaction_details;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/transaction_details;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/transaction_details;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 73
    iput-object p1, p0, Lcom/trimline/metrocrew/transaction_details$2;->this$0:Lcom/trimline/metrocrew/transaction_details;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGroupCollapse(I)V
    .locals 0
    .param p1, "groupPosition"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "groupPosition"
        }
    .end annotation

    .line 81
    return-void
.end method
