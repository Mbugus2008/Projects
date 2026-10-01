.class Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;
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

    .line 659
    iput-object p1, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;->this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 11
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

    .line 662
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;->this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    iget-object v0, v0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->val$_theader:Lcom/trimline/metrocrew/theader;

    const/4 v1, 0x1

    .line 663
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .line 662
    iput v1, v0, Lcom/trimline/metrocrew/theader;->Print_No:I

    .line 663
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;->this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    iget-object v0, v0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->val$_theader:Lcom/trimline/metrocrew/theader;

    iput-object v2, v0, Lcom/trimline/metrocrew/theader;->Print_NoSpecified:Ljava/lang/Boolean;

    .line 664
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    iget-object v3, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;->this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    iget-object v3, v3, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->val$_theader:Lcom/trimline/metrocrew/theader;

    invoke-virtual {v0, v3}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v3, "Update"

    invoke-static {v3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 665
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;->this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    iget-object v0, v0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->this$0:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;

    iget-object v0, v0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->thmodel:Lcom/trimline/metrocrew/theader$Model;

    iget-object v3, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;->this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    iget-object v3, v3, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->val$_theader:Lcom/trimline/metrocrew/theader;

    invoke-virtual {v0, v3}, Lcom/trimline/metrocrew/theader$Model;->update(Lcom/trimline/metrocrew/theader;)V

    .line 666
    const/4 v0, 0x0

    .line 668
    .local v0, "theader":Lcom/trimline/metrocrew/theader;
    const/4 v3, 0x0

    :try_start_0
    iget-object v4, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;->this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    iget-object v4, v4, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->val$_theader:Lcom/trimline/metrocrew/theader;

    invoke-static {v4}, Lcom/trimline/metrocrew/theader;->access$1200(Lcom/trimline/metrocrew/theader;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/trimline/metrocrew/theader;

    move-object v0, v4

    .line 669
    iget-object v4, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;->this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    iget-object v4, v4, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->val$_theader:Lcom/trimline/metrocrew/theader;

    iget v4, v4, Lcom/trimline/metrocrew/theader;->Amount_Recieved:F

    const/high16 v5, -0x40800000    # -1.0f

    mul-float/2addr v4, v5

    iput v4, v0, Lcom/trimline/metrocrew/theader;->Amount_Recieved:F

    .line 670
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;->this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    iget-object v5, v5, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->val$_theader:Lcom/trimline/metrocrew/theader;

    iget-object v5, v5, Lcom/trimline/metrocrew/theader;->No:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "R"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/trimline/metrocrew/theader;->No:Ljava/lang/String;

    .line 671
    iput-boolean v3, v0, Lcom/trimline/metrocrew/theader;->sent:Z

    .line 672
    iput v1, v0, Lcom/trimline/metrocrew/theader;->Print_No:I

    .line 673
    iput-object v2, v0, Lcom/trimline/metrocrew/theader;->Print_NoSpecified:Ljava/lang/Boolean;

    .line 675
    const-string v1, "Insert"

    new-instance v2, Lcom/google/gson/Gson;

    invoke-direct {v2}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v2, v0}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 676
    iget-object v1, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;->this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    iget-object v1, v1, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->this$0:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;

    invoke-static {v1}, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->access$1300(Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 678
    iget-object v1, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;->this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    iget-object v1, v1, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->this$0:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;

    iget-object v1, v1, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->thmodel:Lcom/trimline/metrocrew/theader$Model;

    invoke-virtual {v1, v0}, Lcom/trimline/metrocrew/theader$Model;->insert(Lcom/trimline/metrocrew/theader;)V
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 681
    goto :goto_0

    .line 679
    :catch_0
    move-exception v1

    .line 680
    .local v1, "e":Ljava/lang/CloneNotSupportedException;
    invoke-virtual {v1}, Ljava/lang/CloneNotSupportedException;->printStackTrace()V

    .line 685
    .end local v1    # "e":Ljava/lang/CloneNotSupportedException;
    :goto_0
    new-instance v1, Lcom/google/gson/Gson;

    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    iget-object v2, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;->this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    iget-object v2, v2, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->this$0:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;

    invoke-static {v2}, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->access$1400(Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;)Ljava/util/LinkedHashMap;

    move-result-object v2

    iget-object v4, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;->this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    iget-object v4, v4, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->this$0:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;

    invoke-static {v4}, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->access$1300(Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;)Ljava/util/List;

    move-result-object v4

    iget-object v5, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;->this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    iget v5, v5, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->val$listPosition:I

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "MMMM"

    invoke-static {v2, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 686
    iget-object v1, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;->this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    iget-object v1, v1, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->this$0:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;

    invoke-static {v1}, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->access$1400(Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;)Ljava/util/LinkedHashMap;

    move-result-object v1

    iget-object v2, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;->this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    iget-object v2, v2, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->this$0:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;

    invoke-static {v2}, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->access$1300(Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;)Ljava/util/List;

    move-result-object v2

    iget-object v4, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;->this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    iget v4, v4, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->val$listPosition:I

    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 687
    .local v1, "trns":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 688
    .local v2, "trl":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/trimline/metrocrew/transaction;

    .line 690
    .local v5, "tr":Lcom/trimline/metrocrew/transaction;
    move-object v6, v5

    .line 691
    .local v6, "trr":Lcom/trimline/metrocrew/transaction;
    iget-object v7, v0, Lcom/trimline/metrocrew/theader;->No:Ljava/lang/String;

    iput-object v7, v6, Lcom/trimline/metrocrew/transaction;->No:Ljava/lang/String;

    .line 692
    iget-object v7, v5, Lcom/trimline/metrocrew/transaction;->Amount:Ljava/lang/Double;

    invoke-virtual {v7}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v7

    const-wide/high16 v9, -0x4010000000000000L    # -1.0

    mul-double/2addr v7, v9

    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v7

    iput-object v7, v6, Lcom/trimline/metrocrew/transaction;->Amount:Ljava/lang/Double;

    .line 693
    iput-boolean v3, v6, Lcom/trimline/metrocrew/transaction;->sent:Z

    .line 694
    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 695
    .end local v5    # "tr":Lcom/trimline/metrocrew/transaction;
    .end local v6    # "trr":Lcom/trimline/metrocrew/transaction;
    goto :goto_1

    .line 696
    :cond_0
    iget-object v3, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;->this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    iget-object v3, v3, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->this$0:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;

    iget-object v3, v3, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->tmodel:Lcom/trimline/metrocrew/transaction$Model;

    invoke-virtual {v3, v2}, Lcom/trimline/metrocrew/transaction$Model;->insert(Ljava/util/List;)V

    .line 698
    iget-object v3, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2$1;->this$1:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    iget-object v3, v3, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;->this$0:Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;

    invoke-virtual {v3}, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->notifyDataSetChanged()V

    .line 701
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 704
    return-void
.end method
