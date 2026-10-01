.class public Lcom/trimline/metrocrew/Member$autocomplete;
.super Landroid/widget/ArrayAdapter;
.source "Member.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Member;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "autocomplete"
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/Member;",
            ">;"
        }
    .end annotation
.end field

.field nameFilter:Landroid/widget/Filter;

.field private resource:I

.field private suggestions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/Member;",
            ">;"
        }
    .end annotation
.end field

.field private tempItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/Member;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;ILjava/util/List;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resource"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "resource",
            "items"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/Member;",
            ">;)V"
        }
    .end annotation

    .line 178
    .local p3, "items":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/Member;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;IILjava/util/List;)V

    .line 221
    new-instance v0, Lcom/trimline/metrocrew/Member$autocomplete$1;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/Member$autocomplete$1;-><init>(Lcom/trimline/metrocrew/Member$autocomplete;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/Member$autocomplete;->nameFilter:Landroid/widget/Filter;

    .line 180
    iput-object p1, p0, Lcom/trimline/metrocrew/Member$autocomplete;->context:Landroid/content/Context;

    .line 181
    iput p2, p0, Lcom/trimline/metrocrew/Member$autocomplete;->resource:I

    .line 182
    iput-object p3, p0, Lcom/trimline/metrocrew/Member$autocomplete;->items:Ljava/util/List;

    .line 183
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/Member$autocomplete;->tempItems:Ljava/util/List;

    .line 184
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trimline/metrocrew/Member$autocomplete;->suggestions:Ljava/util/List;

    .line 185
    return-void
.end method

.method static synthetic access$300(Lcom/trimline/metrocrew/Member$autocomplete;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/Member$autocomplete;

    .line 168
    iget-object v0, p0, Lcom/trimline/metrocrew/Member$autocomplete;->suggestions:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$400(Lcom/trimline/metrocrew/Member$autocomplete;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/Member$autocomplete;

    .line 168
    iget-object v0, p0, Lcom/trimline/metrocrew/Member$autocomplete;->tempItems:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public getFilter()Landroid/widget/Filter;
    .locals 1

    .line 218
    iget-object v0, p0, Lcom/trimline/metrocrew/Member$autocomplete;->nameFilter:Landroid/widget/Filter;

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 9
    .param p1, "position"    # I
    .param p2, "convertView"    # Landroid/view/View;
    .param p3, "parent"    # Landroid/view/ViewGroup;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "position",
            "convertView",
            "parent"
        }
    .end annotation

    .line 189
    move-object v0, p2

    .line 190
    .local v0, "view":Landroid/view/View;
    const/4 v1, 0x0

    if-nez p2, :cond_0

    .line 191
    iget-object v2, p0, Lcom/trimline/metrocrew/Member$autocomplete;->context:Landroid/content/Context;

    const-string v3, "layout_inflater"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/LayoutInflater;

    .line 192
    .local v2, "inflater":Landroid/view/LayoutInflater;
    iget v3, p0, Lcom/trimline/metrocrew/Member$autocomplete;->resource:I

    invoke-virtual {v2, v3, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 195
    .end local v2    # "inflater":Landroid/view/LayoutInflater;
    :cond_0
    iget-object v2, p0, Lcom/trimline/metrocrew/Member$autocomplete;->items:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trimline/metrocrew/Member;

    .line 196
    .local v2, "item":Lcom/trimline/metrocrew/Member;
    const v3, 0x7f0a006b

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    .line 197
    .local v3, "lr":Landroid/widget/LinearLayout;
    const v4, 0x7f0a0175

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 198
    .local v4, "no":Landroid/widget/TextView;
    const v5, 0x7f0a0164

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 200
    .local v5, "name":Landroid/widget/TextView;
    if-eqz v2, :cond_3

    .line 201
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, v2, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " | "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v8, v2, Lcom/trimline/metrocrew/Member;->ID_No:Ljava/lang/String;

    if-nez v8, :cond_1

    const-string v8, "No ID"

    goto :goto_0

    :cond_1
    iget-object v8, v2, Lcom/trimline/metrocrew/Member;->ID_No:Ljava/lang/String;

    :goto_0
    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v2, Lcom/trimline/metrocrew/Member;->Phone_No:Ljava/lang/String;

    if-nez v7, :cond_2

    const-string v7, "No Phone"

    goto :goto_1

    :cond_2
    iget-object v7, v2, Lcom/trimline/metrocrew/Member;->Phone_No:Ljava/lang/String;

    :goto_1
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 202
    iget-object v6, v2, Lcom/trimline/metrocrew/Member;->Name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 204
    :cond_3
    invoke-virtual {v5}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object v6

    .line 205
    .local v6, "c":Landroid/content/res/ColorStateList;
    iget-object v7, v2, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    const-string v8, "New"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 206
    const/16 v1, 0x8

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 207
    const v1, -0xffff01

    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_2

    .line 209
    :cond_4
    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 210
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 212
    :goto_2
    return-object v0
.end method
