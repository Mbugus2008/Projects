.class Lcom/trimline/metrocrew/Member$autocomplete$1;
.super Landroid/widget/Filter;
.source "Member.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Member$autocomplete;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/Member$autocomplete;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/Member$autocomplete;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/Member$autocomplete;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 222
    iput-object p1, p0, Lcom/trimline/metrocrew/Member$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Member$autocomplete;

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

    .line 226
    move-object v0, p1

    check-cast v0, Lcom/trimline/metrocrew/Member;

    .line 227
    .local v0, "str":Lcom/trimline/metrocrew/Member;
    iget-object v1, v0, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

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

    .line 232
    if-eqz p1, :cond_6

    .line 233
    iget-object v0, p0, Lcom/trimline/metrocrew/Member$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Member$autocomplete;

    invoke-static {v0}, Lcom/trimline/metrocrew/Member$autocomplete;->access$300(Lcom/trimline/metrocrew/Member$autocomplete;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 234
    iget-object v0, p0, Lcom/trimline/metrocrew/Member$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Member$autocomplete;

    invoke-static {v0}, Lcom/trimline/metrocrew/Member$autocomplete;->access$400(Lcom/trimline/metrocrew/Member$autocomplete;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trimline/metrocrew/Member;

    .line 235
    .local v1, "names":Lcom/trimline/metrocrew/Member;
    iget-object v2, v1, Lcom/trimline/metrocrew/Member;->Name:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 236
    iget-object v2, v1, Lcom/trimline/metrocrew/Member;->Name:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/trimline/metrocrew/Member$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Member$autocomplete;

    invoke-static {v2}, Lcom/trimline/metrocrew/Member$autocomplete;->access$300(Lcom/trimline/metrocrew/Member$autocomplete;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 238
    :cond_0
    iget-object v2, v1, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 239
    iget-object v2, p0, Lcom/trimline/metrocrew/Member$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Member$autocomplete;

    invoke-static {v2}, Lcom/trimline/metrocrew/Member$autocomplete;->access$300(Lcom/trimline/metrocrew/Member$autocomplete;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 241
    :cond_1
    iget-object v2, v1, Lcom/trimline/metrocrew/Member;->ID_No:Ljava/lang/String;

    if-eqz v2, :cond_2

    .line 242
    iget-object v2, v1, Lcom/trimline/metrocrew/Member;->ID_No:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 243
    iget-object v2, p0, Lcom/trimline/metrocrew/Member$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Member$autocomplete;

    invoke-static {v2}, Lcom/trimline/metrocrew/Member$autocomplete;->access$300(Lcom/trimline/metrocrew/Member$autocomplete;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 245
    :cond_2
    iget-object v2, v1, Lcom/trimline/metrocrew/Member;->Phone_No:Ljava/lang/String;

    if-eqz v2, :cond_3

    .line 246
    iget-object v2, v1, Lcom/trimline/metrocrew/Member;->Phone_No:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 247
    iget-object v2, p0, Lcom/trimline/metrocrew/Member$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Member$autocomplete;

    invoke-static {v2}, Lcom/trimline/metrocrew/Member$autocomplete;->access$300(Lcom/trimline/metrocrew/Member$autocomplete;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 249
    :cond_3
    iget-object v2, v1, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    const-string v3, "new"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 250
    iget-object v2, p0, Lcom/trimline/metrocrew/Member$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Member$autocomplete;

    invoke-static {v2}, Lcom/trimline/metrocrew/Member$autocomplete;->access$300(Lcom/trimline/metrocrew/Member$autocomplete;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 252
    .end local v1    # "names":Lcom/trimline/metrocrew/Member;
    :cond_4
    goto/16 :goto_0

    .line 253
    :cond_5
    new-instance v0, Landroid/widget/Filter$FilterResults;

    invoke-direct {v0}, Landroid/widget/Filter$FilterResults;-><init>()V

    .line 254
    .local v0, "filterResults":Landroid/widget/Filter$FilterResults;
    iget-object v1, p0, Lcom/trimline/metrocrew/Member$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Member$autocomplete;

    invoke-static {v1}, Lcom/trimline/metrocrew/Member$autocomplete;->access$300(Lcom/trimline/metrocrew/Member$autocomplete;)Ljava/util/List;

    move-result-object v1

    iput-object v1, v0, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    .line 255
    iget-object v1, p0, Lcom/trimline/metrocrew/Member$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Member$autocomplete;

    invoke-static {v1}, Lcom/trimline/metrocrew/Member$autocomplete;->access$300(Lcom/trimline/metrocrew/Member$autocomplete;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iput v1, v0, Landroid/widget/Filter$FilterResults;->count:I

    .line 256
    return-object v0

    .line 258
    .end local v0    # "filterResults":Landroid/widget/Filter$FilterResults;
    :cond_6
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

    .line 265
    :try_start_0
    iget-object v0, p2, Landroid/widget/Filter$FilterResults;->values:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    .line 266
    .local v0, "filterList":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/Member;>;"
    if-eqz p2, :cond_0

    iget v1, p2, Landroid/widget/Filter$FilterResults;->count:I

    if-lez v1, :cond_0

    .line 268
    iget-object v1, p0, Lcom/trimline/metrocrew/Member$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Member$autocomplete;

    invoke-virtual {v1}, Lcom/trimline/metrocrew/Member$autocomplete;->clear()V

    .line 269
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trimline/metrocrew/Member;

    .line 271
    .local v2, "item":Lcom/trimline/metrocrew/Member;
    iget-object v3, p0, Lcom/trimline/metrocrew/Member$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Member$autocomplete;

    invoke-virtual {v3, v2}, Lcom/trimline/metrocrew/Member$autocomplete;->add(Ljava/lang/Object;)V

    .line 272
    iget-object v3, p0, Lcom/trimline/metrocrew/Member$autocomplete$1;->this$0:Lcom/trimline/metrocrew/Member$autocomplete;

    invoke-virtual {v3}, Lcom/trimline/metrocrew/Member$autocomplete;->notifyDataSetChanged()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 273
    .end local v2    # "item":Lcom/trimline/metrocrew/Member;
    goto :goto_0

    .line 275
    .end local v0    # "filterList":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/Member;>;"
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
