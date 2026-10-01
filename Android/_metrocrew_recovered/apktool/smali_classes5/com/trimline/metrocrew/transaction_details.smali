.class public Lcom/trimline/metrocrew/transaction_details;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "transaction_details.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/transaction_details$getdatas;
    }
.end annotation


# instance fields
.field d:Ljava/sql/Date;

.field date:Ljava/lang/String;

.field expandableListAdapter:Landroid/widget/ExpandableListAdapter;

.field expandableListDetail:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Lcom/trimline/metrocrew/theader;",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;>;"
        }
    .end annotation
.end field

.field expandableListTitle:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/theader;",
            ">;"
        }
    .end annotation
.end field

.field expandableListView:Landroid/widget/ExpandableListView;

.field private mDay:I

.field private mHour:I

.field private mMinute:I

.field private mMonth:I

.field private mYear:I

.field masterdata:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/tlines;",
            ">;"
        }
    .end annotation
.end field

.field progress:Landroid/app/ProgressDialog;

.field setdate:Landroid/widget/Button;

.field theaderModel:Lcom/trimline/metrocrew/theader$Model;

.field tmodel:Lcom/trimline/metrocrew/transaction$Model;

.field total:Landroid/widget/TextView;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method static synthetic lambda$loaddata$0(Lcom/trimline/metrocrew/tlines;)D
    .locals 2
    .param p0, "a"    # Lcom/trimline/metrocrew/tlines;

    .line 164
    iget-object v0, p0, Lcom/trimline/metrocrew/tlines;->theader:Lcom/trimline/metrocrew/theader;

    iget v0, v0, Lcom/trimline/metrocrew/theader;->Amount_Recieved:F

    float-to-double v0, v0

    return-wide v0
.end method

.method static synthetic lambda$loaddata$1(Lcom/trimline/metrocrew/theader;Lcom/trimline/metrocrew/theader;)I
    .locals 2
    .param p0, "p1"    # Lcom/trimline/metrocrew/theader;
    .param p1, "p2"    # Lcom/trimline/metrocrew/theader;

    .line 169
    invoke-virtual {p0}, Lcom/trimline/metrocrew/theader;->Getdatetime()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/trimline/metrocrew/theader;->Getdatetime()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    return v0
.end method


# virtual methods
.method public getdata(Ljava/util/List;)Ljava/util/LinkedHashMap;
    .locals 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "tlines"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/tlines;",
            ">;)",
            "Ljava/util/LinkedHashMap<",
            "Lcom/trimline/metrocrew/theader;",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;>;"
        }
    .end annotation

    .line 177
    .local p1, "tlines":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/tlines;>;"
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 178
    .local v0, "list":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Lcom/trimline/metrocrew/theader;Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trimline/metrocrew/tlines;

    .line 180
    .local v2, "t":Lcom/trimline/metrocrew/tlines;
    iget-object v3, v2, Lcom/trimline/metrocrew/tlines;->theader:Lcom/trimline/metrocrew/theader;

    iget-object v3, v3, Lcom/trimline/metrocrew/theader;->Date:Ljava/sql/Date;

    invoke-virtual {v3}, Ljava/sql/Date;->toString()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Transss"

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    iget-object v3, v2, Lcom/trimline/metrocrew/tlines;->theader:Lcom/trimline/metrocrew/theader;

    iget-object v4, v2, Lcom/trimline/metrocrew/tlines;->transactionList:Ljava/util/List;

    invoke-virtual {v0, v3, v4}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    .end local v2    # "t":Lcom/trimline/metrocrew/tlines;
    goto :goto_0

    .line 184
    :cond_0
    return-object v0
.end method

.method public loaddata(Ljava/sql/Date;)V
    .locals 9
    .param p1, "date"    # Ljava/sql/Date;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "date"
        }
    .end annotation

    .line 152
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    move-object v1, v0

    .line 153
    .local v1, "tt":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/tlines;>;"
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction_details;->masterdata:Ljava/util/List;

    if-eqz v0, :cond_2

    .line 154
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction_details;->masterdata:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/trimline/metrocrew/tlines;

    .line 158
    .local v3, "t":Lcom/trimline/metrocrew/tlines;
    :try_start_0
    iget-object v0, v3, Lcom/trimline/metrocrew/tlines;->theader:Lcom/trimline/metrocrew/theader;

    iget-object v0, v0, Lcom/trimline/metrocrew/theader;->Date:Ljava/sql/Date;

    invoke-virtual {p1, v0}, Ljava/sql/Date;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 159
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 162
    :cond_0
    goto :goto_1

    .line 160
    :catch_0
    move-exception v0

    .line 161
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 163
    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v3    # "t":Lcom/trimline/metrocrew/tlines;
    :goto_1
    goto :goto_0

    .line 164
    :cond_1
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction_details;->total:Landroid/widget/TextView;

    invoke-interface {v1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v2

    new-instance v3, Lcom/trimline/metrocrew/transaction_details$$ExternalSyntheticLambda0;

    invoke-direct {v3}, Lcom/trimline/metrocrew/transaction_details$$ExternalSyntheticLambda0;-><init>()V

    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->mapToDouble(Ljava/util/function/ToDoubleFunction;)Ljava/util/stream/DoubleStream;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/stream/DoubleStream;->sum()D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const-string v3, "Total       : <b>%,.2f</b>"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 167
    :cond_2
    invoke-virtual {p0, v1}, Lcom/trimline/metrocrew/transaction_details;->getdata(Ljava/util/List;)Ljava/util/LinkedHashMap;

    move-result-object v0

    iput-object v0, p0, Lcom/trimline/metrocrew/transaction_details;->expandableListDetail:Ljava/util/LinkedHashMap;

    .line 168
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/trimline/metrocrew/transaction_details;->expandableListDetail:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/transaction_details;->expandableListTitle:Ljava/util/List;

    .line 169
    iget-object v0, p0, Lcom/trimline/metrocrew/transaction_details;->expandableListTitle:Ljava/util/List;

    new-instance v2, Lcom/trimline/metrocrew/transaction_details$$ExternalSyntheticLambda1;

    invoke-direct {v2}, Lcom/trimline/metrocrew/transaction_details$$ExternalSyntheticLambda1;-><init>()V

    invoke-interface {v0, v2}, Ljava/util/List;->sort(Ljava/util/Comparator;)V

    .line 171
    new-instance v3, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;

    iget-object v5, p0, Lcom/trimline/metrocrew/transaction_details;->expandableListTitle:Ljava/util/List;

    iget-object v6, p0, Lcom/trimline/metrocrew/transaction_details;->expandableListDetail:Ljava/util/LinkedHashMap;

    iget-object v7, p0, Lcom/trimline/metrocrew/transaction_details;->theaderModel:Lcom/trimline/metrocrew/theader$Model;

    iget-object v8, p0, Lcom/trimline/metrocrew/transaction_details;->tmodel:Lcom/trimline/metrocrew/transaction$Model;

    move-object v4, p0

    invoke-direct/range {v3 .. v8}, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;-><init>(Landroid/content/Context;Ljava/util/List;Ljava/util/LinkedHashMap;Lcom/trimline/metrocrew/theader$Model;Lcom/trimline/metrocrew/transaction$Model;)V

    iput-object v3, v4, Lcom/trimline/metrocrew/transaction_details;->expandableListAdapter:Landroid/widget/ExpandableListAdapter;

    .line 172
    iget-object v0, v4, Lcom/trimline/metrocrew/transaction_details;->expandableListView:Landroid/widget/ExpandableListView;

    iget-object v2, v4, Lcom/trimline/metrocrew/transaction_details;->expandableListAdapter:Landroid/widget/ExpandableListAdapter;

    invoke-virtual {v0, v2}, Landroid/widget/ExpandableListView;->setAdapter(Landroid/widget/ExpandableListAdapter;)V

    .line 173
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "v"
        }
    .end annotation

    .line 127
    new-instance v0, Landroid/app/DatePickerDialog;

    new-instance v2, Lcom/trimline/metrocrew/transaction_details$4;

    invoke-direct {v2, p0}, Lcom/trimline/metrocrew/transaction_details$4;-><init>(Lcom/trimline/metrocrew/transaction_details;)V

    iget v3, p0, Lcom/trimline/metrocrew/transaction_details;->mYear:I

    iget v4, p0, Lcom/trimline/metrocrew/transaction_details;->mMonth:I

    iget v5, p0, Lcom/trimline/metrocrew/transaction_details;->mDay:I

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Landroid/app/DatePickerDialog;-><init>(Landroid/content/Context;Landroid/app/DatePickerDialog$OnDateSetListener;III)V

    .line 148
    .local v0, "datePickerDialog":Landroid/app/DatePickerDialog;
    invoke-virtual {v0}, Landroid/app/DatePickerDialog;->show()V

    .line 149
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 16
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "savedInstanceState"
        }
    .end annotation

    .line 52
    move-object/from16 v0, p0

    invoke-super/range {p0 .. p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 53
    const v1, 0x7f0d0081

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/transaction_details;->setContentView(I)V

    .line 54
    invoke-static {v0}, Landroidx/lifecycle/ViewModelProviders;->of(Landroidx/fragment/app/FragmentActivity;)Landroidx/lifecycle/ViewModelProvider;

    move-result-object v1

    const-class v2, Lcom/trimline/metrocrew/theader$Model;

    invoke-virtual {v1, v2}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object v1

    check-cast v1, Lcom/trimline/metrocrew/theader$Model;

    iput-object v1, v0, Lcom/trimline/metrocrew/transaction_details;->theaderModel:Lcom/trimline/metrocrew/theader$Model;

    .line 55
    invoke-static {v0}, Landroidx/lifecycle/ViewModelProviders;->of(Landroidx/fragment/app/FragmentActivity;)Landroidx/lifecycle/ViewModelProvider;

    move-result-object v1

    const-class v2, Lcom/trimline/metrocrew/transaction$Model;

    invoke-virtual {v1, v2}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object v1

    check-cast v1, Lcom/trimline/metrocrew/transaction$Model;

    iput-object v1, v0, Lcom/trimline/metrocrew/transaction_details;->tmodel:Lcom/trimline/metrocrew/transaction$Model;

    .line 56
    const v1, 0x7f0a0218

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/transaction_details;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ExpandableListView;

    iput-object v1, v0, Lcom/trimline/metrocrew/transaction_details;->expandableListView:Landroid/widget/ExpandableListView;

    .line 57
    const v1, 0x7f0a0238

    invoke-virtual {v0, v1}, Lcom/trimline/metrocrew/transaction_details;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, v0, Lcom/trimline/metrocrew/transaction_details;->total:Landroid/widget/TextView;

    .line 58
    new-instance v1, Landroid/app/ProgressDialog;

    invoke-direct {v1, v0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v1, v0, Lcom/trimline/metrocrew/transaction_details;->progress:Landroid/app/ProgressDialog;

    .line 59
    iget-object v1, v0, Lcom/trimline/metrocrew/transaction_details;->progress:Landroid/app/ProgressDialog;

    const-string v2, "Loading report"

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 60
    iget-object v1, v0, Lcom/trimline/metrocrew/transaction_details;->progress:Landroid/app/ProgressDialog;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 61
    iget-object v1, v0, Lcom/trimline/metrocrew/transaction_details;->progress:Landroid/app/ProgressDialog;

    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 62
    iget-object v1, v0, Lcom/trimline/metrocrew/transaction_details;->progress:Landroid/app/ProgressDialog;

    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 64
    iget-object v1, v0, Lcom/trimline/metrocrew/transaction_details;->expandableListView:Landroid/widget/ExpandableListView;

    new-instance v4, Lcom/trimline/metrocrew/transaction_details$1;

    invoke-direct {v4, v0}, Lcom/trimline/metrocrew/transaction_details$1;-><init>(Lcom/trimline/metrocrew/transaction_details;)V

    invoke-virtual {v1, v4}, Landroid/widget/ExpandableListView;->setOnGroupExpandListener(Landroid/widget/ExpandableListView$OnGroupExpandListener;)V

    .line 73
    iget-object v1, v0, Lcom/trimline/metrocrew/transaction_details;->expandableListView:Landroid/widget/ExpandableListView;

    new-instance v4, Lcom/trimline/metrocrew/transaction_details$2;

    invoke-direct {v4, v0}, Lcom/trimline/metrocrew/transaction_details$2;-><init>(Lcom/trimline/metrocrew/transaction_details;)V

    invoke-virtual {v1, v4}, Landroid/widget/ExpandableListView;->setOnGroupCollapseListener(Landroid/widget/ExpandableListView$OnGroupCollapseListener;)V

    .line 84
    iget-object v1, v0, Lcom/trimline/metrocrew/transaction_details;->expandableListView:Landroid/widget/ExpandableListView;

    new-instance v4, Lcom/trimline/metrocrew/transaction_details$3;

    invoke-direct {v4, v0}, Lcom/trimline/metrocrew/transaction_details$3;-><init>(Lcom/trimline/metrocrew/transaction_details;)V

    invoke-virtual {v1, v4}, Landroid/widget/ExpandableListView;->setOnChildClickListener(Landroid/widget/ExpandableListView$OnChildClickListener;)V

    .line 101
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 102
    .local v1, "c":Ljava/util/Calendar;
    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v4

    iput v4, v0, Lcom/trimline/metrocrew/transaction_details;->mYear:I

    .line 103
    const/4 v4, 0x2

    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    iput v4, v0, Lcom/trimline/metrocrew/transaction_details;->mMonth:I

    .line 104
    const/4 v4, 0x5

    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v4

    iput v4, v0, Lcom/trimline/metrocrew/transaction_details;->mDay:I

    .line 105
    iget v4, v0, Lcom/trimline/metrocrew/transaction_details;->mMonth:I

    add-int/2addr v4, v2

    .line 106
    .local v4, "m":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget v6, v0, Lcom/trimline/metrocrew/transaction_details;->mYear:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "-"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v0, Lcom/trimline/metrocrew/transaction_details;->mDay:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 107
    .local v5, "date":Ljava/lang/String;
    invoke-static {v5}, Ljava/sql/Date;->valueOf(Ljava/lang/String;)Ljava/sql/Date;

    move-result-object v6

    iput-object v6, v0, Lcom/trimline/metrocrew/transaction_details;->d:Ljava/sql/Date;

    .line 108
    const v6, 0x7f0a0007

    invoke-virtual {v0, v6}, Lcom/trimline/metrocrew/transaction_details;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/Button;

    iput-object v6, v0, Lcom/trimline/metrocrew/transaction_details;->setdate:Landroid/widget/Button;

    .line 109
    iget-object v6, v0, Lcom/trimline/metrocrew/transaction_details;->setdate:Landroid/widget/Button;

    iget-object v7, v0, Lcom/trimline/metrocrew/transaction_details;->d:Ljava/sql/Date;

    invoke-virtual {v7}, Ljava/sql/Date;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 110
    iget-object v6, v0, Lcom/trimline/metrocrew/transaction_details;->setdate:Landroid/widget/Button;

    invoke-virtual {v6, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 112
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v7

    .line 113
    .local v7, "cal":Ljava/util/Calendar;
    const/4 v12, 0x0

    const/4 v13, 0x0

    const/16 v8, 0x7e9

    const/16 v9, 0x9

    const/4 v10, 0x4

    const/4 v11, 0x0

    invoke-virtual/range {v7 .. v13}, Ljava/util/Calendar;->set(IIIIII)V

    .line 114
    const/16 v6, 0xe

    invoke-virtual {v7, v6, v3}, Ljava/util/Calendar;->set(II)V

    .line 115
    invoke-virtual {v7}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v14

    .line 117
    .local v14, "startOfDay":J
    const/16 v12, 0x3b

    const/16 v13, 0x3b

    const/16 v11, 0x17

    invoke-virtual/range {v7 .. v13}, Ljava/util/Calendar;->set(IIIIII)V

    .line 118
    const/16 v8, 0x3e7

    invoke-virtual {v7, v6, v8}, Ljava/util/Calendar;->set(II)V

    .line 119
    invoke-virtual {v7}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v8

    .line 121
    .local v8, "endOfDay":J
    new-instance v6, Lcom/trimline/metrocrew/transaction_details$getdatas;

    const/4 v10, 0x0

    invoke-direct {v6, v0, v10}, Lcom/trimline/metrocrew/transaction_details$getdatas;-><init>(Lcom/trimline/metrocrew/transaction_details;Lcom/trimline/metrocrew/transaction_details$1;)V

    sget-object v10, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v2, v2, [Ljava/util/Date;

    invoke-virtual {v7}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v11

    aput-object v11, v2, v3

    invoke-virtual {v6, v10, v2}, Lcom/trimline/metrocrew/transaction_details$getdatas;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 122
    return-void
.end method
