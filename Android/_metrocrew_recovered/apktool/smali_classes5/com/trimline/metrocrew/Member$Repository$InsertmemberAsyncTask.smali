.class Lcom/trimline/metrocrew/Member$Repository$InsertmemberAsyncTask;
.super Landroid/os/AsyncTask;
.source "Member.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Member$Repository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InsertmemberAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Lcom/trimline/metrocrew/Member;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private dao:Lcom/trimline/metrocrew/Member$dao;

.field final synthetic this$0:Lcom/trimline/metrocrew/Member$Repository;


# direct methods
.method private constructor <init>(Lcom/trimline/metrocrew/Member$Repository;Lcom/trimline/metrocrew/Member$dao;)V
    .locals 0
    .param p2, "dao"    # Lcom/trimline/metrocrew/Member$dao;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            "this$0",
            "dao"
        }
    .end annotation

    .line 97
    iput-object p1, p0, Lcom/trimline/metrocrew/Member$Repository$InsertmemberAsyncTask;->this$0:Lcom/trimline/metrocrew/Member$Repository;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 98
    iput-object p2, p0, Lcom/trimline/metrocrew/Member$Repository$InsertmemberAsyncTask;->dao:Lcom/trimline/metrocrew/Member$dao;

    .line 99
    return-void
.end method

.method synthetic constructor <init>(Lcom/trimline/metrocrew/Member$Repository;Lcom/trimline/metrocrew/Member$dao;Lcom/trimline/metrocrew/Member$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trimline/metrocrew/Member$Repository;
    .param p2, "x1"    # Lcom/trimline/metrocrew/Member$dao;
    .param p3, "x2"    # Lcom/trimline/metrocrew/Member$1;

    .line 94
    invoke-direct {p0, p1, p2}, Lcom/trimline/metrocrew/Member$Repository$InsertmemberAsyncTask;-><init>(Lcom/trimline/metrocrew/Member$Repository;Lcom/trimline/metrocrew/Member$dao;)V

    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "members"
        }
    .end annotation

    .line 94
    check-cast p1, [Lcom/trimline/metrocrew/Member;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/Member$Repository$InsertmemberAsyncTask;->doInBackground([Lcom/trimline/metrocrew/Member;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Lcom/trimline/metrocrew/Member;)Ljava/lang/Void;
    .locals 2
    .param p1, "members"    # [Lcom/trimline/metrocrew/Member;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "members"
        }
    .end annotation

    .line 103
    iget-object v0, p0, Lcom/trimline/metrocrew/Member$Repository$InsertmemberAsyncTask;->dao:Lcom/trimline/metrocrew/Member$dao;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/Member$dao;->insert(Lcom/trimline/metrocrew/Member;)V

    .line 104
    const/4 v0, 0x0

    return-object v0
.end method
