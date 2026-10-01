.class public Lcom/trimline/metrocrew/Vehicles$autocomplete;
.super Landroid/widget/ArrayAdapter;
.source "Vehicles.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Vehicles;
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
            "Lcom/trimline/metrocrew/Vehicles;",
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
            "Lcom/trimline/metrocrew/Vehicles;",
            ">;"
        }
    .end annotation
.end field

.field private tempItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/Vehicles;",
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
            "Lcom/trimline/metrocrew/Vehicles;",
            ">;)V"
        }
    .end annotation

    .line 207
    .local p3, "items":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/Vehicles;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;IILjava/util/List;)V

    .line 238
    new-instance v0, Lcom/trimline/metrocrew/Vehicles$autocomplete$1;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/Vehicles$autocomplete$1;-><init>(Lcom/trimline/metrocrew/Vehicles$autocomplete;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete;->nameFilter:Landroid/widget/Filter;

    .line 209
    iput-object p1, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete;->context:Landroid/content/Context;

    .line 210
    iput p2, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete;->resource:I

    .line 211
    iput-object p3, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete;->items:Ljava/util/List;

    .line 212
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete;->tempItems:Ljava/util/List;

    .line 213
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete;->suggestions:Ljava/util/List;

    .line 214
    return-void
.end method

.method static synthetic access$300(Lcom/trimline/metrocrew/Vehicles$autocomplete;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/Vehicles$autocomplete;

    .line 197
    iget-object v0, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete;->suggestions:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$400(Lcom/trimline/metrocrew/Vehicles$autocomplete;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/Vehicles$autocomplete;

    .line 197
    iget-object v0, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete;->tempItems:Ljava/util/List;

    return-object v0
.end method


# virtual methods
.method public getFilter()Landroid/widget/Filter;
    .locals 1

    .line 235
    iget-object v0, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete;->nameFilter:Landroid/widget/Filter;

    return-object v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
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

    .line 218
    move-object v0, p2

    .line 219
    .local v0, "view":Landroid/view/View;
    if-nez p2, :cond_0

    .line 220
    iget-object v1, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete;->context:Landroid/content/Context;

    const-string v2, "layout_inflater"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    .line 221
    .local v1, "inflater":Landroid/view/LayoutInflater;
    iget v2, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete;->resource:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 224
    .end local v1    # "inflater":Landroid/view/LayoutInflater;
    :cond_0
    iget-object v1, p0, Lcom/trimline/metrocrew/Vehicles$autocomplete;->items:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/trimline/metrocrew/Vehicles;

    .line 225
    .local v1, "item":Lcom/trimline/metrocrew/Vehicles;
    const v2, 0x7f0a0164

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 227
    .local v2, "name":Landroid/widget/TextView;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v1, Lcom/trimline/metrocrew/Vehicles;->Fleet_No:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, v1, Lcom/trimline/metrocrew/Vehicles;->Vehicle_Number:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 229
    return-object v0
.end method
