.class Lcom/trimline/metrocrew/databinding/MembersImpl$1;
.super Ljava/lang/Object;
.source "MembersImpl.java"

# interfaces
.implements Landroidx/databinding/InverseBindingListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/databinding/MembersImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/databinding/MembersImpl;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/databinding/MembersImpl;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/databinding/MembersImpl;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 35
    iput-object p1, p0, Lcom/trimline/metrocrew/databinding/MembersImpl$1;->this$0:Lcom/trimline/metrocrew/databinding/MembersImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onChange()V
    .locals 5

    .line 40
    iget-object v0, p0, Lcom/trimline/metrocrew/databinding/MembersImpl$1;->this$0:Lcom/trimline/metrocrew/databinding/MembersImpl;

    iget-object v0, v0, Lcom/trimline/metrocrew/databinding/MembersImpl;->Nameedit:Landroid/widget/EditText;

    invoke-static {v0}, Landroidx/databinding/adapters/TextViewBindingAdapter;->getTextString(Landroid/widget/TextView;)Ljava/lang/String;

    move-result-object v0

    .line 43
    .local v0, "callbackArg_0":Ljava/lang/String;
    const/4 v1, 0x0

    .line 45
    .local v1, "dName":Ljava/lang/String;
    const/4 v2, 0x0

    .line 47
    .local v2, "dJavaLangObjectNull":Z
    iget-object v3, p0, Lcom/trimline/metrocrew/databinding/MembersImpl$1;->this$0:Lcom/trimline/metrocrew/databinding/MembersImpl;

    iget-object v3, v3, Lcom/trimline/metrocrew/databinding/MembersImpl;->mD:Lcom/trimline/metrocrew/Member;

    .line 51
    .local v3, "d":Lcom/trimline/metrocrew/Member;
    if-eqz v3, :cond_0

    const/4 v4, 0x1

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    .line 52
    .end local v2    # "dJavaLangObjectNull":Z
    .local v4, "dJavaLangObjectNull":Z
    :goto_0
    if-eqz v4, :cond_1

    .line 55
    iput-object v0, v3, Lcom/trimline/metrocrew/Member;->Name:Ljava/lang/String;

    .line 57
    :cond_1
    return-void
.end method
