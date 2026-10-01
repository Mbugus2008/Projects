.class public abstract Lcom/trimline/metrocrew/databinding/Members;
.super Landroidx/databinding/ViewDataBinding;
.source "Members.java"


# instance fields
.field public final Id:Landroid/widget/TextView;

.field public final Name:Landroid/widget/TextView;

.field public final Nameedit:Landroid/widget/EditText;

.field public final balances:Landroidx/cardview/widget/CardView;

.field public final guideline4:Landroidx/constraintlayout/widget/Guideline;

.field public final guideline5:Landroidx/constraintlayout/widget/Guideline;

.field public final idedit:Landroid/widget/EditText;

.field protected mD:Lcom/trimline/metrocrew/Member;
    .annotation runtime Landroidx/databinding/Bindable;
    .end annotation
.end field

.field public final no:Landroid/widget/TextView;

.field public final phone:Landroid/widget/TextView;

.field public final phoneedit:Landroid/widget/EditText;

.field public final save:Landroid/widget/Button;


# direct methods
.method protected constructor <init>(Ljava/lang/Object;Landroid/view/View;ILandroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/EditText;Landroidx/cardview/widget/CardView;Landroidx/constraintlayout/widget/Guideline;Landroidx/constraintlayout/widget/Guideline;Landroid/widget/EditText;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/EditText;Landroid/widget/Button;)V
    .locals 0
    .param p1, "_bindingComponent"    # Ljava/lang/Object;
    .param p2, "_root"    # Landroid/view/View;
    .param p3, "_localFieldCount"    # I
    .param p4, "Id"    # Landroid/widget/TextView;
    .param p5, "Name"    # Landroid/widget/TextView;
    .param p6, "Nameedit"    # Landroid/widget/EditText;
    .param p7, "balances"    # Landroidx/cardview/widget/CardView;
    .param p8, "guideline4"    # Landroidx/constraintlayout/widget/Guideline;
    .param p9, "guideline5"    # Landroidx/constraintlayout/widget/Guideline;
    .param p10, "idedit"    # Landroid/widget/EditText;
    .param p11, "no"    # Landroid/widget/TextView;
    .param p12, "phone"    # Landroid/widget/TextView;
    .param p13, "phoneedit"    # Landroid/widget/EditText;
    .param p14, "save"    # Landroid/widget/Button;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "_bindingComponent",
            "_root",
            "_localFieldCount",
            "Id",
            "Name",
            "Nameedit",
            "balances",
            "guideline4",
            "guideline5",
            "idedit",
            "no",
            "phone",
            "phoneedit",
            "save"
        }
    .end annotation

    .line 63
    invoke-direct {p0, p1, p2, p3}, Landroidx/databinding/ViewDataBinding;-><init>(Ljava/lang/Object;Landroid/view/View;I)V

    .line 64
    iput-object p4, p0, Lcom/trimline/metrocrew/databinding/Members;->Id:Landroid/widget/TextView;

    .line 65
    iput-object p5, p0, Lcom/trimline/metrocrew/databinding/Members;->Name:Landroid/widget/TextView;

    .line 66
    iput-object p6, p0, Lcom/trimline/metrocrew/databinding/Members;->Nameedit:Landroid/widget/EditText;

    .line 67
    iput-object p7, p0, Lcom/trimline/metrocrew/databinding/Members;->balances:Landroidx/cardview/widget/CardView;

    .line 68
    iput-object p8, p0, Lcom/trimline/metrocrew/databinding/Members;->guideline4:Landroidx/constraintlayout/widget/Guideline;

    .line 69
    iput-object p9, p0, Lcom/trimline/metrocrew/databinding/Members;->guideline5:Landroidx/constraintlayout/widget/Guideline;

    .line 70
    iput-object p10, p0, Lcom/trimline/metrocrew/databinding/Members;->idedit:Landroid/widget/EditText;

    .line 71
    iput-object p11, p0, Lcom/trimline/metrocrew/databinding/Members;->no:Landroid/widget/TextView;

    .line 72
    iput-object p12, p0, Lcom/trimline/metrocrew/databinding/Members;->phone:Landroid/widget/TextView;

    .line 73
    iput-object p13, p0, Lcom/trimline/metrocrew/databinding/Members;->phoneedit:Landroid/widget/EditText;

    .line 74
    iput-object p14, p0, Lcom/trimline/metrocrew/databinding/Members;->save:Landroid/widget/Button;

    .line 75
    return-void
.end method

.method public static bind(Landroid/view/View;)Lcom/trimline/metrocrew/databinding/Members;
    .locals 1
    .param p0, "view"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "view"
        }
    .end annotation

    .line 123
    invoke-static {}, Landroidx/databinding/DataBindingUtil;->getDefaultComponent()Landroidx/databinding/DataBindingComponent;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/trimline/metrocrew/databinding/Members;->bind(Landroid/view/View;Ljava/lang/Object;)Lcom/trimline/metrocrew/databinding/Members;

    move-result-object v0

    return-object v0
.end method

.method public static bind(Landroid/view/View;Ljava/lang/Object;)Lcom/trimline/metrocrew/databinding/Members;
    .locals 1
    .param p0, "view"    # Landroid/view/View;
    .param p1, "component"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "view",
            "component"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 135
    const v0, 0x7f0d001c

    invoke-static {p1, p0, v0}, Lcom/trimline/metrocrew/databinding/Members;->bind(Ljava/lang/Object;Landroid/view/View;I)Landroidx/databinding/ViewDataBinding;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/databinding/Members;

    return-object v0
.end method

.method public static inflate(Landroid/view/LayoutInflater;)Lcom/trimline/metrocrew/databinding/Members;
    .locals 1
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "inflater"
        }
    .end annotation

    .line 106
    invoke-static {}, Landroidx/databinding/DataBindingUtil;->getDefaultComponent()Landroidx/databinding/DataBindingComponent;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/trimline/metrocrew/databinding/Members;->inflate(Landroid/view/LayoutInflater;Ljava/lang/Object;)Lcom/trimline/metrocrew/databinding/Members;

    move-result-object v0

    return-object v0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/trimline/metrocrew/databinding/Members;
    .locals 1
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
    .param p1, "root"    # Landroid/view/ViewGroup;
    .param p2, "attachToRoot"    # Z
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "inflater",
            "root",
            "attachToRoot"
        }
    .end annotation

    .line 87
    invoke-static {}, Landroidx/databinding/DataBindingUtil;->getDefaultComponent()Landroidx/databinding/DataBindingComponent;

    move-result-object v0

    invoke-static {p0, p1, p2, v0}, Lcom/trimline/metrocrew/databinding/Members;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;ZLjava/lang/Object;)Lcom/trimline/metrocrew/databinding/Members;

    move-result-object v0

    return-object v0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;ZLjava/lang/Object;)Lcom/trimline/metrocrew/databinding/Members;
    .locals 1
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
    .param p1, "root"    # Landroid/view/ViewGroup;
    .param p2, "attachToRoot"    # Z
    .param p3, "component"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "inflater",
            "root",
            "attachToRoot",
            "component"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 101
    const v0, 0x7f0d001c

    invoke-static {p0, v0, p1, p2, p3}, Landroidx/databinding/ViewDataBinding;->inflateInternal(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;ZLjava/lang/Object;)Landroidx/databinding/ViewDataBinding;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/databinding/Members;

    return-object v0
.end method

.method public static inflate(Landroid/view/LayoutInflater;Ljava/lang/Object;)Lcom/trimline/metrocrew/databinding/Members;
    .locals 3
    .param p0, "inflater"    # Landroid/view/LayoutInflater;
    .param p1, "component"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "inflater",
            "component"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 119
    const/4 v0, 0x0

    const/4 v1, 0x0

    const v2, 0x7f0d001c

    invoke-static {p0, v2, v0, v1, p1}, Landroidx/databinding/ViewDataBinding;->inflateInternal(Landroid/view/LayoutInflater;ILandroid/view/ViewGroup;ZLjava/lang/Object;)Landroidx/databinding/ViewDataBinding;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/databinding/Members;

    return-object v0
.end method


# virtual methods
.method public getD()Lcom/trimline/metrocrew/Member;
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/trimline/metrocrew/databinding/Members;->mD:Lcom/trimline/metrocrew/Member;

    return-object v0
.end method

.method public abstract setD(Lcom/trimline/metrocrew/Member;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "d"
        }
    .end annotation
.end method
