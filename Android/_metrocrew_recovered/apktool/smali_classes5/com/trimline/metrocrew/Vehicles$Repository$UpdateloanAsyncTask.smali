.class Lcom/trimline/metrocrew/Vehicles$Repository$UpdateloanAsyncTask;
.super Landroid/os/AsyncTask;
.source "Vehicles.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Vehicles$Repository;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UpdateloanAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Lcom/trimline/metrocrew/Vehicles;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private dao:Lcom/trimline/metrocrew/Vehicles$dao;

.field final synthetic this$0:Lcom/trimline/metrocrew/Vehicles$Repository;


# direct methods
.method private constructor <init>(Lcom/trimline/metrocrew/Vehicles$Repository;Lcom/trimline/metrocrew/Vehicles$dao;)V
    .locals 0
    .param p2, "dao"    # Lcom/trimline/metrocrew/Vehicles$dao;
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

    .line 139
    iput-object p1, p0, Lcom/trimline/metrocrew/Vehicles$Repository$UpdateloanAsyncTask;->this$0:Lcom/trimline/metrocrew/Vehicles$Repository;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 140
    iput-object p2, p0, Lcom/trimline/metrocrew/Vehicles$Repository$UpdateloanAsyncTask;->dao:Lcom/trimline/metrocrew/Vehicles$dao;

    .line 141
    return-void
.end method

.method synthetic constructor <init>(Lcom/trimline/metrocrew/Vehicles$Repository;Lcom/trimline/metrocrew/Vehicles$dao;Lcom/trimline/metrocrew/Vehicles$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/trimline/metrocrew/Vehicles$Repository;
    .param p2, "x1"    # Lcom/trimline/metrocrew/Vehicles$dao;
    .param p3, "x2"    # Lcom/trimline/metrocrew/Vehicles$1;

    .line 136
    invoke-direct {p0, p1, p2}, Lcom/trimline/metrocrew/Vehicles$Repository$UpdateloanAsyncTask;-><init>(Lcom/trimline/metrocrew/Vehicles$Repository;Lcom/trimline/metrocrew/Vehicles$dao;)V

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
            "loans"
        }
    .end annotation

    .line 136
    check-cast p1, [Lcom/trimline/metrocrew/Vehicles;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/Vehicles$Repository$UpdateloanAsyncTask;->doInBackground([Lcom/trimline/metrocrew/Vehicles;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Lcom/trimline/metrocrew/Vehicles;)Ljava/lang/Void;
    .locals 2
    .param p1, "loans"    # [Lcom/trimline/metrocrew/Vehicles;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "loans"
        }
    .end annotation

    .line 145
    iget-object v0, p0, Lcom/trimline/metrocrew/Vehicles$Repository$UpdateloanAsyncTask;->dao:Lcom/trimline/metrocrew/Vehicles$dao;

    const/4 v1, 0x0

    aget-object v1, p1, v1

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/Vehicles$dao;->update(Lcom/trimline/metrocrew/Vehicles;)V

    .line 146
    const/4 v0, 0x0

    return-object v0
.end method
