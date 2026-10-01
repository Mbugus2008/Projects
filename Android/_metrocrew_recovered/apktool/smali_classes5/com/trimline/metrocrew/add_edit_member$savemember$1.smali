.class Lcom/trimline/metrocrew/add_edit_member$savemember$1;
.super Lcom/google/gson/reflect/TypeToken;
.source "add_edit_member.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/add_edit_member$savemember;->doInBackground([Ljava/lang/Void;)Lcom/trimline/metrocrew/Member;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/gson/reflect/TypeToken<",
        "Lcom/trimline/metrocrew/Member;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/trimline/metrocrew/add_edit_member$savemember;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/add_edit_member$savemember;)V
    .locals 0
    .param p1, "this$1"    # Lcom/trimline/metrocrew/add_edit_member$savemember;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$1"
        }
    .end annotation

    .line 78
    iput-object p1, p0, Lcom/trimline/metrocrew/add_edit_member$savemember$1;->this$1:Lcom/trimline/metrocrew/add_edit_member$savemember;

    invoke-direct {p0}, Lcom/google/gson/reflect/TypeToken;-><init>()V

    return-void
.end method
