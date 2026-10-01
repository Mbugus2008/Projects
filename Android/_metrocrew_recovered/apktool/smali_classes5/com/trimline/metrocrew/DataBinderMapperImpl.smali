.class public Lcom/trimline/metrocrew/DataBinderMapperImpl;
.super Landroidx/databinding/DataBinderMapper;
.source "DataBinderMapperImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/DataBinderMapperImpl$InnerLayoutIdLookup;,
        Lcom/trimline/metrocrew/DataBinderMapperImpl$InnerBrLookup;
    }
.end annotation


# static fields
.field private static final INTERNAL_LAYOUT_ID_LOOKUP:Landroid/util/SparseIntArray;

.field private static final LAYOUT_ACTIVITYADDEDITMEMBER:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 23
    new-instance v0, Landroid/util/SparseIntArray;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/util/SparseIntArray;-><init>(I)V

    sput-object v0, Lcom/trimline/metrocrew/DataBinderMapperImpl;->INTERNAL_LAYOUT_ID_LOOKUP:Landroid/util/SparseIntArray;

    .line 26
    sget-object v0, Lcom/trimline/metrocrew/DataBinderMapperImpl;->INTERNAL_LAYOUT_ID_LOOKUP:Landroid/util/SparseIntArray;

    const v2, 0x7f0d001c

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseIntArray;->put(II)V

    .line 27
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Landroidx/databinding/DataBinderMapper;-><init>()V

    return-void
.end method


# virtual methods
.method public collectDependencies()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/databinding/DataBinderMapper;",
            ">;"
        }
    .end annotation

    .line 83
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 84
    .local v0, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/databinding/DataBinderMapper;>;"
    new-instance v1, Landroidx/databinding/library/baseAdapters/DataBinderMapperImpl;

    invoke-direct {v1}, Landroidx/databinding/library/baseAdapters/DataBinderMapperImpl;-><init>()V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 85
    return-object v0
.end method

.method public convertBrIdToString(I)Ljava/lang/String;
    .locals 1
    .param p1, "localId"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "localId"
        }
    .end annotation

    .line 77
    sget-object v0, Lcom/trimline/metrocrew/DataBinderMapperImpl$InnerBrLookup;->sKeys:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 78
    .local v0, "tmpVal":Ljava/lang/String;
    return-object v0
.end method

.method public getDataBinder(Landroidx/databinding/DataBindingComponent;Landroid/view/View;I)Landroidx/databinding/ViewDataBinding;
    .locals 5
    .param p1, "component"    # Landroidx/databinding/DataBindingComponent;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "layoutId"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "component",
            "view",
            "layoutId"
        }
    .end annotation

    .line 31
    sget-object v0, Lcom/trimline/metrocrew/DataBinderMapperImpl;->INTERNAL_LAYOUT_ID_LOOKUP:Landroid/util/SparseIntArray;

    invoke-virtual {v0, p3}, Landroid/util/SparseIntArray;->get(I)I

    move-result v0

    .line 32
    .local v0, "localizedLayoutId":I
    if-lez v0, :cond_2

    .line 33
    invoke-virtual {p2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    .line 34
    .local v1, "tag":Ljava/lang/Object;
    if-eqz v1, :cond_1

    .line 37
    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 39
    :pswitch_0
    const-string v2, "layout/activity_add_edit_member_0"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 40
    new-instance v2, Lcom/trimline/metrocrew/databinding/MembersImpl;

    invoke-direct {v2, p1, p2}, Lcom/trimline/metrocrew/databinding/MembersImpl;-><init>(Landroidx/databinding/DataBindingComponent;Landroid/view/View;)V

    return-object v2

    .line 42
    :cond_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "The tag for activity_add_edit_member is invalid. Received: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 35
    :cond_1
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "view must have a tag"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 46
    .end local v1    # "tag":Ljava/lang/Object;
    :cond_2
    :goto_0
    const/4 v1, 0x0

    return-object v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public getDataBinder(Landroidx/databinding/DataBindingComponent;[Landroid/view/View;I)Landroidx/databinding/ViewDataBinding;
    .locals 4
    .param p1, "component"    # Landroidx/databinding/DataBindingComponent;
    .param p2, "views"    # [Landroid/view/View;
    .param p3, "layoutId"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "component",
            "views",
            "layoutId"
        }
    .end annotation

    .line 51
    const/4 v0, 0x0

    if-eqz p2, :cond_3

    array-length v1, p2

    if-nez v1, :cond_0

    goto :goto_1

    .line 54
    :cond_0
    sget-object v1, Lcom/trimline/metrocrew/DataBinderMapperImpl;->INTERNAL_LAYOUT_ID_LOOKUP:Landroid/util/SparseIntArray;

    invoke-virtual {v1, p3}, Landroid/util/SparseIntArray;->get(I)I

    move-result v1

    .line 55
    .local v1, "localizedLayoutId":I
    if-lez v1, :cond_2

    .line 56
    const/4 v2, 0x0

    aget-object v2, p2, v2

    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    .line 57
    .local v2, "tag":Ljava/lang/Object;
    if-eqz v2, :cond_1

    .line 60
    goto :goto_0

    .line 58
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v3, "view must have a tag"

    invoke-direct {v0, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 63
    .end local v2    # "tag":Ljava/lang/Object;
    :cond_2
    :goto_0
    return-object v0

    .line 52
    .end local v1    # "localizedLayoutId":I
    :cond_3
    :goto_1
    return-object v0
.end method

.method public getLayoutId(Ljava/lang/String;)I
    .locals 2
    .param p1, "tag"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "tag"
        }
    .end annotation

    .line 68
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 69
    return v0

    .line 71
    :cond_0
    sget-object v1, Lcom/trimline/metrocrew/DataBinderMapperImpl$InnerLayoutIdLookup;->sKeys:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 72
    .local v1, "tmpVal":Ljava/lang/Integer;
    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_0
    return v0
.end method
