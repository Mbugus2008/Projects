.class Lcom/trimline/metrocrew/MainActivity$3;
.super Ljava/lang/Object;
.source "MainActivity.java"

# interfaces
.implements Landroidx/lifecycle/Observer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/trimline/metrocrew/MainActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/lifecycle/Observer<",
        "Ljava/util/List<",
        "Lcom/trimline/metrocrew/theader;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/trimline/metrocrew/MainActivity;

.field final synthetic val$adapter:Lcom/trimline/metrocrew/theader$adapter;


# direct methods
.method constructor <init>(Lcom/trimline/metrocrew/MainActivity;Lcom/trimline/metrocrew/theader$adapter;)V
    .locals 0
    .param p1, "this$0"    # Lcom/trimline/metrocrew/MainActivity;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$adapter"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 142
    iput-object p1, p0, Lcom/trimline/metrocrew/MainActivity$3;->this$0:Lcom/trimline/metrocrew/MainActivity;

    iput-object p2, p0, Lcom/trimline/metrocrew/MainActivity$3;->val$adapter:Lcom/trimline/metrocrew/theader$adapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$onChanged$0(Ljava/lang/String;Lcom/trimline/metrocrew/theader;)Z
    .locals 1
    .param p0, "date"    # Ljava/lang/String;
    .param p1, "o"    # Lcom/trimline/metrocrew/theader;

    .line 154
    invoke-virtual {p1}, Lcom/trimline/metrocrew/theader;->Getdate()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method static synthetic lambda$onChanged$1(Lcom/trimline/metrocrew/theader;)D
    .locals 2
    .param p0, "a"    # Lcom/trimline/metrocrew/theader;

    .line 154
    iget v0, p0, Lcom/trimline/metrocrew/theader;->Amount_Recieved:F

    float-to-double v0, v0

    return-wide v0
.end method


# virtual methods
.method public bridge synthetic onChanged(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "notes"
        }
    .end annotation

    .line 142
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/MainActivity$3;->onChanged(Ljava/util/List;)V

    return-void
.end method

.method public onChanged(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "notes"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/theader;",
            ">;)V"
        }
    .end annotation

    .line 145
    .local p1, "notes":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/theader;>;"
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$3;->this$0:Lcom/trimline/metrocrew/MainActivity;

    iput-object p1, v0, Lcom/trimline/metrocrew/MainActivity;->transList:Ljava/util/List;

    .line 146
    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v0, p1}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "notes"

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    sget-object v0, Lcom/trimline/metrocrew/agent$Model;->CurrentAgent:Lcom/trimline/metrocrew/agent;

    if-eqz v0, :cond_0

    .line 148
    new-instance v0, Lcom/trimline/metrocrew/MainActivity$tillbalances;

    iget-object v1, p0, Lcom/trimline/metrocrew/MainActivity$3;->this$0:Lcom/trimline/metrocrew/MainActivity;

    sget-object v2, Lcom/trimline/metrocrew/agent$Model;->CurrentAgent:Lcom/trimline/metrocrew/agent;

    invoke-direct {v0, v1, v2}, Lcom/trimline/metrocrew/MainActivity$tillbalances;-><init>(Lcom/trimline/metrocrew/MainActivity;Lcom/trimline/metrocrew/agent;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/MainActivity$tillbalances;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 149
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMdd"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 150
    .local v0, "sd":Ljava/text/SimpleDateFormat;
    new-instance v1, Ljava/sql/Date;

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/sql/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    .line 154
    .local v1, "date":Ljava/lang/String;
    iget-object v2, p0, Lcom/trimline/metrocrew/MainActivity$3;->this$0:Lcom/trimline/metrocrew/MainActivity;

    iget-object v2, v2, Lcom/trimline/metrocrew/MainActivity;->tillbal:Landroid/widget/TextView;

    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v3

    new-instance v4, Lcom/trimline/metrocrew/MainActivity$3$$ExternalSyntheticLambda0;

    invoke-direct {v4, v1}, Lcom/trimline/metrocrew/MainActivity$3$$ExternalSyntheticLambda0;-><init>(Ljava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v3

    new-instance v4, Lcom/trimline/metrocrew/MainActivity$3$$ExternalSyntheticLambda1;

    invoke-direct {v4}, Lcom/trimline/metrocrew/MainActivity$3$$ExternalSyntheticLambda1;-><init>()V

    invoke-interface {v3, v4}, Ljava/util/stream/Stream;->mapToDouble(Ljava/util/function/ToDoubleFunction;)Ljava/util/stream/DoubleStream;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/stream/DoubleStream;->sum()D

    move-result-wide v3

    double-to-float v3, v3

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "Todays Col:<b>%,.2f</b>"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    .end local v0    # "sd":Ljava/text/SimpleDateFormat;
    .end local v1    # "date":Ljava/lang/String;
    :cond_0
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity$3;->val$adapter:Lcom/trimline/metrocrew/theader$adapter;

    invoke-virtual {v0, p1}, Lcom/trimline/metrocrew/theader$adapter;->setTransactions(Ljava/util/List;)V

    .line 160
    return-void
.end method
