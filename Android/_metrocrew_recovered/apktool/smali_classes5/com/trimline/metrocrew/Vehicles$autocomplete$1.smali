.class Lcom/trimline/metrocrew/Vehicles$autocomplete$1;
.super Landroid/widget/Filter;
.source "Vehicles.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Vehicles$autocomplete;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/Vehicles$autocomplete;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/Vehicles$autocomplete;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/Vehicles$autocomplete;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 239
    iput-object p1, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Vehicles$autocomplete;

    invoke-direct {p0}, Landroid/widget/Filter;-><init>()V

    return-void
.end method


# virtual methods
.method public convertResultToString(Ljava/lang/Object;)Ljava/lang/CharSequence;
    .locals 2
    .param p1, "resultValue"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "resultValue"
        }
    .end annotation

    .line 243
    move-object v0, p1

    check-cast v0, Lcom/trimline/metrocrew/Vehicles;

    .line 244
    .local v0, "str":Lcom/trimline/metrocrew/Vehicles;
    iget-object v1, v0, Lcom/trimline/metrocrew/Vehicles;->Vehicle_Number:Ljava/lang/String;

    return-object v1
.end method

.method protected performFiltering(Ljava/lang/CharSequence;)Landroid/widget/Filter$FilterResults;
    .locals 4
    .param p1, "constraint"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "constraint"
        }
    .end annotation

    .line 249
    if-eqz p1, :cond_3

    .line 250
    iget-object v0, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Vehicles$autocomplete;

    invoke-static {v0}, Lcom/trimline/metrocrew/Vehicles$autocomplete;->access$300(Lcom/trimline/metrocrew/Vehicles$autocomplete;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 251
    iget-object v0, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Vehicles$autocomplete;

    invoke-static {v0}, Lcom/trimline/metrocrew/Vehicles$autocomplete;->access$400(Lcom/trimline/metrocrew/Vehicles$autocomplete;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trimline/metrocrew/Vehicles;

    .line 252
    .local v1, "names":Lcom/trimline/metrocrew/Vehicles;
    iget-object v2, v1, Lcom/trimline/metrocrew/Vehicles;->Vehicle_Number:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 253
    iget-object v2, v1, Lcom/trimline/metrocrew/Vehicles;->Vehicle_Number:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Vehicles$autocomplete;

    invoke-static {v2}, Lcom/trimline/metrocrew/Vehicles$autocomplete;->access$300(Lcom/trimline/metrocrew/Vehicles$autocomplete;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 255
    :cond_0
    iget-object v2, v1, Lcom/trimline/metrocrew/Vehicles;->Fleet_No:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 256
    iget-object v2, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Vehicles$autocomplete;

    invoke-static {v2}, Lcom/trimline/metrocrew/Vehicles$autocomplete;->access$300(Lcom/trimline/metrocrew/Vehicles$autocomplete;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 259
    .end local v1    # "names":Lcom/trimline/metrocrew/Vehicles;
    :cond_1
    goto :goto_0

    .line 260
    :cond_2
    new-instance v0, Landroid/widget/Filter$FilterResults;

    invoke-direct {v0}, Landroid/widget/Filter$FilterResults;-><init>()V

    .line 261
    .local v0, "filterResults":Landroid/widget/Filter$FilterResults;
    iget-object v1, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Vehicles$autocomplete;

    invoke-static {v1}, Lcom/trimline/metrocrew/Vehicles$autocomplete;->access$300(Lcom/trimline/metrocrew/Vehicles$autocomplete;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    .line 262
    iget-object v1, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Vehicles$autocomplete;

    invoke-static {v1}, Lcom/trimline/metrocrew/Vehicles$autocomplete;->access$300(Lcom/trimline/metrocrew/Vehicles$autocomplete;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iput v1, v0, Landroid/widget/Filter$FilterResults;->count:I

    .line 263
    return-object v0

    .line 265
    .end local v0    # "filterResults":Landroid/widget/Filter$FilterResults;
    :cond_3
    new-instance v0, Landroid/widget/Filter$FilterResults;

    invoke-direct {v0}, Landroid/widget/Filter$FilterResults;-><init>()V

    return-object v0
.end method

.method protected publishResults(Ljava/lang/CharSequence;Landroid/widget/Filter$FilterResults;)V
    .locals 4
    .param p1, "constraint"    # Ljava/lang/CharSequence;
    .param p2, "results"    # Landroid/widget/Filter$FilterResults;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "constraint",
            "results"
        }
    .end annotation

    .line 272
    :try_start_0
    iget-object v0, p2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    .line 273
    .local v0, "filterList":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/Vehicles;>;"
    if-eqz p2, :cond_0

    iget v1, p2, Landroid/widget/Filter$FilterResults;->count:I

    if-lez v1, :cond_0

    .line 275
    iget-object v1, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Vehicles$autocomplete;

    invoke-virtual {v1}, Lcom/trimline/metrocrew/Vehicles$autocomplete;->clear()V

    .line 276
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trimline/metrocrew/Vehicles;

    .line 278
    .local v2, "item":Lcom/trimline/metrocrew/Vehicles;
    iget-object v3, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Vehicles$autocomplete;

    invoke-virtual {v3, v2}, Lcom/trimline/metrocrew/Vehicles$autocomplete;->add(Ljava/lang/Object;)V

    .line 279
    iget-object v3, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Vehicles$autocomplete;

    invoke-virtual {v3}, Lcom/trimline/metrocrew/Vehicles$autocomplete;->notifyDataSetChanged()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 280
    .end local v2    # "item":Lcom/trimline/metrocrew/Vehicles;
    goto :goto_0

    .line 282
    .end local v0    # "filterList":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/Vehicles;>;"
    :cond_0
    goto :goto_1

    :catch_0
    move-exception v0

    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_1
    return-void
.end method
