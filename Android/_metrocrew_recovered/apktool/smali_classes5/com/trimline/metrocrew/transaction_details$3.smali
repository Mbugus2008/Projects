.class Lcom/trimline/metrocrew/transaction_details$3;
.super Ljava/lang/Object;
.source "transaction_details.java"

# interfaces
.implements Landroid/widget/ExpandableListView$OnChildClickListener;


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

    .line 84
    iput-object p1, p0, Lcom/trimline/metrocrew/transaction_details$3;->this$0:Lcom/trimline/metrocrew/transaction_details;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChildClick(Landroid/widget/ExpandableListView;Landroid/view/View;IIJ)Z
    .locals 1
    .param p1, "parent"    # Landroid/widget/ExpandableListView;
    .param p2, "v"    # Landroid/view/View;
    .param p3, "groupPosition"    # I
    .param p4, "childPosition"    # I
    .param p5, "id"    # J
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "parent",
            "v",
            "groupPosition",
            "childPosition",
            "id"
        }
    .end annotation

    .line 96
    const/4 v0, 0x0

    return v0
.end method
