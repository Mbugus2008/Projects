.class public Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;
.super Landroid/widget/BaseExpandableListAdapter;
.source "theader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/theader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CustomExpandableListAdapter"
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private expandableListDetail:Ljava/util/LinkedHashMap;
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

.field private expandableListTitle:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/theader;",
            ">;"
        }
    .end annotation
.end field

.field thmodel:Lcom/trimline/metrocrew/theader$Model;

.field tmodel:Lcom/trimline/metrocrew/transaction$Model;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Ljava/util/LinkedHashMap;Lcom/trimline/metrocrew/theader$Model;Lcom/trimline/metrocrew/transaction$Model;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p4, "thmodel"    # Lcom/trimline/metrocrew/theader$Model;
    .param p5, "tmodel"    # Lcom/trimline/metrocrew/transaction$Model;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "context",
            "expandableListTitle",
            "expandableListDetail",
            "thmodel",
            "tmodel"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/theader;",
            ">;",
            "Ljava/util/LinkedHashMap<",
            "Lcom/trimline/metrocrew/theader;",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;>;",
            "Lcom/trimline/metrocrew/theader$Model;",
            "Lcom/trimline/metrocrew/transaction$Model;",
            ")V"
        }
    .end annotation

    .line 528
    .local p2, "expandableListTitle":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/theader;>;"
    .local p3, "expandableListDetail":Ljava/util/LinkedHashMap;, "Ljava/util/LinkedHashMap<Lcom/trimline/metrocrew/theader;Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;>;"
    invoke-direct {p0}, Landroid/widget/BaseExpandableListAdapter;-><init>()V

    .line 530
    iput-object p1, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->context:Landroid/content/Context;

    .line 531
    iput-object p2, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->expandableListTitle:Ljava/util/List;

    .line 532
    iput-object p3, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->expandableListDetail:Ljava/util/LinkedHashMap;

    .line 533
    iput-object p4, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->thmodel:Lcom/trimline/metrocrew/theader$Model;

    .line 534
    iput-object p5, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->tmodel:Lcom/trimline/metrocrew/transaction$Model;

    .line 535
    return-void
.end method

.method static synthetic access$1100(Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;

    .line 520
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;

    .line 520
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->expandableListTitle:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;)Ljava/util/LinkedHashMap;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;

    .line 520
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->expandableListDetail:Ljava/util/LinkedHashMap;

    return-object v0
.end method


# virtual methods
.method public getChild(II)Ljava/lang/Object;
    .locals 2
    .param p1, "listPosition"    # I
    .param p2, "expandedListPosition"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "listPosition",
            "expandedListPosition"
        }
    .end annotation

    .line 539
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->expandableListDetail:Ljava/util/LinkedHashMap;

    iget-object v1, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->expandableListTitle:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 540
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 539
    return-object v0
.end method

.method public getChildId(II)J
    .locals 2
    .param p1, "listPosition"    # I
    .param p2, "expandedListPosition"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "listPosition",
            "expandedListPosition"
        }
    .end annotation

    .line 545
    int-to-long v0, p2

    return-wide v0
.end method

.method public getChildView(IIZLandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5
    .param p1, "listPosition"    # I
    .param p2, "expandedListPosition"    # I
    .param p3, "isLastChild"    # Z
    .param p4, "convertView"    # Landroid/view/View;
    .param p5, "parent"    # Landroid/view/ViewGroup;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x10,
            0x0,
            0x0,
            0x0
        }
        names = {
            "listPosition",
            "expandedListPosition",
            "isLastChild",
            "convertView",
            "parent"
        }
    .end annotation

    .line 551
    invoke-virtual {p0, p1, p2}, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->getChild(II)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/transaction;

    .line 552
    .local v0, "expandedListText":Lcom/trimline/metrocrew/transaction;
    if-nez p4, :cond_0

    .line 553
    iget-object v1, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->context:Landroid/content/Context;

    .line 554
    const-string v2, "layout_inflater"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    .line 555
    .local v1, "layoutInflater":Landroid/view/LayoutInflater;
    const v2, 0x7f0d0079

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p4

    .line 557
    .end local v1    # "layoutInflater":Landroid/view/LayoutInflater;
    :cond_0
    nop

    .line 558
    const v1, 0x7f0a0019

    invoke-virtual {p4, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 559
    .local v1, "expandedListTextView":Landroid/widget/TextView;
    iget-object v2, v0, Lcom/trimline/metrocrew/transaction;->transtype:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 561
    nop

    .line 562
    const v2, 0x7f0a0002

    invoke-virtual {p4, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 563
    .local v2, "amount":Landroid/widget/TextView;
    iget-object v3, v0, Lcom/trimline/metrocrew/transaction;->Amount:Ljava/lang/Double;

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "<b>%,.2f</b>"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 565
    return-object p4
.end method

.method public getChildrenCount(I)I
    .locals 2
    .param p1, "listPosition"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "listPosition"
        }
    .end annotation

    .line 570
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->expandableListDetail:Ljava/util/LinkedHashMap;

    iget-object v1, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->expandableListTitle:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 571
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    .line 570
    return v0
.end method

.method public getGroup(I)Ljava/lang/Object;
    .locals 1
    .param p1, "listPosition"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "listPosition"
        }
    .end annotation

    .line 576
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->expandableListTitle:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getGroupCount()I
    .locals 1

    .line 581
    iget-object v0, p0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->expandableListTitle:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getGroupId(I)J
    .locals 2
    .param p1, "listPosition"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "listPosition"
        }
    .end annotation

    .line 586
    int-to-long v0, p1

    return-wide v0
.end method

.method public getGroupView(IZLandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 16
    .param p1, "listPosition"    # I
    .param p2, "isExpanded"    # Z
    .param p3, "convertView"    # Landroid/view/View;
    .param p4, "parent"    # Landroid/view/ViewGroup;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "listPosition",
            "isExpanded",
            "convertView",
            "parent"
        }
    .end annotation

    .line 592
    move-object/from16 v0, p0

    move/from16 v1, p1

    invoke-virtual/range {p0 .. p1}, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->getGroup(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/trimline/metrocrew/theader;

    .line 594
    .local v2, "_theader":Lcom/trimline/metrocrew/theader;
    if-nez p3, :cond_0

    .line 595
    iget-object v3, v0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->context:Landroid/content/Context;

    .line 596
    const-string v4, "layout_inflater"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/LayoutInflater;

    .line 597
    .local v3, "layoutInflater":Landroid/view/LayoutInflater;
    const v4, 0x7f0d0078

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v4

    .end local p3    # "convertView":Landroid/view/View;
    .local v4, "convertView":Landroid/view/View;
    goto :goto_0

    .line 594
    .end local v3    # "layoutInflater":Landroid/view/LayoutInflater;
    .end local v4    # "convertView":Landroid/view/View;
    .restart local p3    # "convertView":Landroid/view/View;
    :cond_0
    move-object/from16 v4, p3

    .line 599
    .end local p3    # "convertView":Landroid/view/View;
    .restart local v4    # "convertView":Landroid/view/View;
    :goto_0
    const-string v3, ""

    .line 600
    .local v3, "types":Ljava/lang/String;
    iget-object v5, v0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->expandableListDetail:Ljava/util/LinkedHashMap;

    iget-object v6, v0, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;->expandableListTitle:Ljava/util/List;

    invoke-interface {v6, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 601
    .local v5, "trnss":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    invoke-interface {v5}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    move-result-object v6

    new-instance v7, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$$ExternalSyntheticLambda0;

    invoke-direct {v7}, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$$ExternalSyntheticLambda0;-><init>()V

    .line 602
    invoke-interface {v6, v7}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    move-result-object v6

    .line 603
    const-string v7, ", "

    invoke-static {v7}, Ljava/util/stream/Collectors;->joining(Ljava/lang/CharSequence;)Ljava/util/stream/Collector;

    move-result-object v7

    invoke-interface {v6, v7}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    move-result-object v6

    move-object v3, v6

    check-cast v3, Ljava/lang/String;

    .line 605
    const v6, 0x7f0a022c

    invoke-virtual {v4, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 606
    .local v6, "time":Landroid/widget/TextView;
    new-instance v7, Ljava/text/SimpleDateFormat;

    const-string v8, "HH:mm:ss"

    invoke-direct {v7, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 607
    .local v7, "df":Ljava/text/SimpleDateFormat;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, v2, Lcom/trimline/metrocrew/theader;->No:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " | "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v10, v2, Lcom/trimline/metrocrew/theader;->Created_Date_Time:Ljava/sql/Date;

    invoke-virtual {v7, v10}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 608
    nop

    .line 609
    const v8, 0x7f0a0010

    invoke-virtual {v4, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 611
    .local v8, "listTitleTextView":Landroid/widget/TextView;
    iget-object v9, v2, Lcom/trimline/metrocrew/theader;->Received_From:Ljava/lang/String;

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 613
    const v9, 0x7f0a01dc

    invoke-virtual {v4, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 615
    .local v9, "sent":Landroid/widget/TextView;
    iget-boolean v10, v2, Lcom/trimline/metrocrew/theader;->sent:Z

    const/4 v11, 0x0

    const/16 v12, 0x8

    if-eqz v10, :cond_1

    .line 616
    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    .line 618
    :cond_1
    invoke-virtual {v9, v12}, Landroid/widget/TextView;->setVisibility(I)V

    .line 620
    :goto_1
    nop

    .line 621
    const v10, 0x7f0a005d

    invoke-virtual {v4, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    .line 622
    .local v10, "amount":Landroid/widget/TextView;
    iget v13, v2, Lcom/trimline/metrocrew/theader;->Amount_Recieved:F

    invoke-static {v13}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v13

    filled-new-array {v13}, [Ljava/lang/Object;

    move-result-object v13

    const-string v14, "<b>%,.2f</b>"

    invoke-static {v14, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    invoke-static {v13}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v13

    invoke-virtual {v10, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 630
    move-object v13, v4

    .line 631
    .local v13, "finalConvertView":Landroid/view/View;
    const v14, 0x7f0a01ad

    invoke-virtual {v4, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/TextView;

    .line 632
    .local v14, "print":Landroid/widget/TextView;
    new-instance v15, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$1;

    invoke-direct {v15, v0, v13, v2}, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$1;-><init>(Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;Landroid/view/View;Lcom/trimline/metrocrew/theader;)V

    invoke-virtual {v14, v15}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 640
    iget v15, v2, Lcom/trimline/metrocrew/theader;->Print_No:I

    if-nez v15, :cond_2

    .line 641
    invoke-virtual {v14, v11}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_2

    .line 642
    :cond_2
    invoke-virtual {v14, v12}, Landroid/widget/TextView;->setVisibility(I)V

    .line 643
    :goto_2
    const v15, 0x7f0a01ba

    invoke-virtual {v4, v15}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Landroid/widget/TextView;

    .line 644
    .local v15, "reverse":Landroid/widget/TextView;
    sget-object v12, Lcom/trimline/metrocrew/agent$Model;->CurrentAgent:Lcom/trimline/metrocrew/agent;

    iget v12, v12, Lcom/trimline/metrocrew/agent;->Account_type:I

    const/4 v11, 0x1

    if-ne v12, v11, :cond_4

    .line 645
    iget v11, v2, Lcom/trimline/metrocrew/theader;->Print_No:I

    if-nez v11, :cond_3

    .line 646
    const/4 v11, 0x0

    invoke-virtual {v15, v11}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_3

    .line 647
    :cond_3
    const/16 v11, 0x8

    invoke-virtual {v15, v11}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_3

    .line 649
    :cond_4
    const/16 v11, 0x8

    invoke-virtual {v15, v11}, Landroid/widget/TextView;->setVisibility(I)V

    .line 651
    :goto_3
    new-instance v11, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;

    invoke-direct {v11, v0, v2, v1}, Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter$2;-><init>(Lcom/trimline/metrocrew/theader$CustomExpandableListAdapter;Lcom/trimline/metrocrew/theader;I)V

    invoke-virtual {v15, v11}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 719
    return-object v4
.end method

.method public hasStableIds()Z
    .locals 1

    .line 724
    const/4 v0, 0x0

    return v0
.end method

.method public isChildSelectable(II)Z
    .locals 1
    .param p1, "listPosition"    # I
    .param p2, "expandedListPosition"    # I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "listPosition",
            "expandedListPosition"
        }
    .end annotation

    .line 729
    const/4 v0, 0x1

    return v0
.end method
