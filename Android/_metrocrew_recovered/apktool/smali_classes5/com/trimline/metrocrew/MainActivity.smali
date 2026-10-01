.class public Lcom/trimline/metrocrew/MainActivity;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "MainActivity.java"

# interfaces
.implements Lcom/google/android/material/navigation/NavigationView$OnNavigationItemSelectedListener;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/MainActivity$adapter;,
        Lcom/trimline/metrocrew/MainActivity$tillbalances;
    }
.end annotation


# static fields
.field private static final REQUEST_BLUETOOTH_PERMISSIONS:I = 0x3e9


# instance fields
.field date:Ljava/lang/String;

.field private mConnectedDeviceName:Ljava/lang/String;

.field private mDay:I

.field private final mHandler:Landroid/os/Handler;

.field private mHour:I

.field private mMinute:I

.field private mMonth:I

.field private mYear:I

.field private p:Lcom/trimline/metrocrew/Printer$printer;

.field preferences:Landroid/content/SharedPreferences;

.field printer:Landroid/widget/CheckBox;

.field receipts:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

.field setdate:Landroid/widget/Button;

.field sp:Lcom/trimline/metrocrew/Printer$Printerthread;

.field theaderModel:Lcom/trimline/metrocrew/theader$Model;

.field tillbal:Landroid/widget/TextView;

.field transList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/theader;",
            ">;"
        }
    .end annotation
.end field

.field transModel:Lcom/trimline/metrocrew/transaction$Model;

.field transactions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 58
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    .line 63
    new-instance v0, Lcom/trimline/metrocrew/Printer$printer;

    invoke-direct {v0}, Lcom/trimline/metrocrew/Printer$printer;-><init>()V

    iput-object v0, p0, Lcom/trimline/metrocrew/MainActivity;->p:Lcom/trimline/metrocrew/Printer$printer;

    .line 369
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/trimline/metrocrew/MainActivity;->mConnectedDeviceName:Ljava/lang/String;

    .line 370
    new-instance v0, Lcom/trimline/metrocrew/MainActivity$10;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/MainActivity$10;-><init>(Lcom/trimline/metrocrew/MainActivity;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/MainActivity;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/trimline/metrocrew/MainActivity;)Lcom/trimline/metrocrew/Printer$printer;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/MainActivity;

    .line 58
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity;->p:Lcom/trimline/metrocrew/Printer$printer;

    return-object v0
.end method

.method static synthetic access$100(Lcom/trimline/metrocrew/MainActivity;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/trimline/metrocrew/MainActivity;

    .line 58
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity;->mConnectedDeviceName:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$102(Lcom/trimline/metrocrew/MainActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/trimline/metrocrew/MainActivity;
    .param p1, "x1"    # Ljava/lang/String;

    .line 58
    iput-object p1, p0, Lcom/trimline/metrocrew/MainActivity;->mConnectedDeviceName:Ljava/lang/String;

    return-object p1
.end method


# virtual methods
.method public ConfirmationBox(Lcom/trimline/metrocrew/theader;Ljava/util/List;)V
    .locals 8
    .param p1, "th"    # Lcom/trimline/metrocrew/theader;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10,
            0x10
        }
        names = {
            "th",
            "t"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/trimline/metrocrew/theader;",
            "Ljava/util/List<",
            "Lcom/trimline/metrocrew/transaction;",
            ">;)V"
        }
    .end annotation

    .line 215
    .local p2, "t":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/transaction;>;"
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 216
    .local v0, "li":Landroid/view/LayoutInflater;
    const v1, 0x7f0d007f

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 217
    .local v1, "promptsView":Landroid/view/View;
    new-instance v2, Landroid/app/AlertDialog$Builder;

    invoke-direct {v2, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 219
    .local v2, "alertDialogBuilder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v2, v1}, Landroid/app/AlertDialog$Builder;->setView(Landroid/view/View;)Landroid/app/AlertDialog$Builder;

    .line 220
    const v3, 0x7f0a0218

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroidx/recyclerview/widget/RecyclerView;

    .line 221
    .local v3, "otp":Landroidx/recyclerview/widget/RecyclerView;
    new-instance v4, Lcom/trimline/metrocrew/MainActivity$adapter;

    invoke-direct {v4, p0}, Lcom/trimline/metrocrew/MainActivity$adapter;-><init>(Landroid/content/Context;)V

    .line 222
    .local v4, "adapter":Lcom/trimline/metrocrew/MainActivity$adapter;
    invoke-virtual {v4, p2}, Lcom/trimline/metrocrew/MainActivity$adapter;->setTransactions(Ljava/util/List;)V

    .line 223
    new-instance v5, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v5, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v5}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 224
    const/4 v5, 0x1

    invoke-virtual {v3, v5}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 225
    invoke-virtual {v3, v4}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 226
    nop

    .line 227
    invoke-virtual {v2, v5}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 229
    const/4 v6, 0x0

    invoke-interface {p2, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/trimline/metrocrew/transaction;

    iget-object v6, v6, Lcom/trimline/metrocrew/transaction;->No:Ljava/lang/String;

    filled-new-array {v6}, [Ljava/lang/Object;

    move-result-object v6

    const-string v7, "Receipt No: %s"

    invoke-static {v7, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    new-instance v6, Lcom/trimline/metrocrew/MainActivity$7;

    invoke-direct {v6, p0}, Lcom/trimline/metrocrew/MainActivity$7;-><init>(Lcom/trimline/metrocrew/MainActivity;)V

    .line 230
    const-string v7, "Reprint"

    invoke-virtual {v5, v7, v6}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    new-instance v6, Lcom/trimline/metrocrew/MainActivity$6;

    invoke-direct {v6, p0}, Lcom/trimline/metrocrew/MainActivity$6;-><init>(Lcom/trimline/metrocrew/MainActivity;)V

    .line 236
    const-string v7, "Ok"

    invoke-virtual {v5, v7, v6}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 245
    invoke-virtual {v2}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v5

    .line 246
    .local v5, "adialog":Landroid/app/AlertDialog;
    invoke-virtual {v5}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v6

    const/16 v7, 0x10

    invoke-virtual {v6, v7}, Landroid/view/Window;->setSoftInputMode(I)V

    .line 247
    invoke-virtual {v5}, Landroid/app/AlertDialog;->show()V

    .line 248
    const/4 v6, -0x1

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v6

    new-instance v7, Lcom/trimline/metrocrew/MainActivity$8;

    invoke-direct {v7, p0, p1, p2, v5}, Lcom/trimline/metrocrew/MainActivity$8;-><init>(Lcom/trimline/metrocrew/MainActivity;Lcom/trimline/metrocrew/theader;Ljava/util/List;Landroid/app/AlertDialog;)V

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 263
    const/4 v6, -0x2

    invoke-virtual {v5, v6}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v6

    new-instance v7, Lcom/trimline/metrocrew/MainActivity$9;

    invoke-direct {v7, p0, v5}, Lcom/trimline/metrocrew/MainActivity$9;-><init>(Lcom/trimline/metrocrew/MainActivity;Landroid/app/AlertDialog;)V

    invoke-virtual {v6, v7}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 278
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

    .line 177
    new-instance v0, Landroid/app/DatePickerDialog;

    new-instance v2, Lcom/trimline/metrocrew/MainActivity$5;

    invoke-direct {v2, p0}, Lcom/trimline/metrocrew/MainActivity$5;-><init>(Lcom/trimline/metrocrew/MainActivity;)V

    iget v3, p0, Lcom/trimline/metrocrew/MainActivity;->mYear:I

    iget v4, p0, Lcom/trimline/metrocrew/MainActivity;->mMonth:I

    iget v5, p0, Lcom/trimline/metrocrew/MainActivity;->mDay:I

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Landroid/app/DatePickerDialog;-><init>(Landroid/content/Context;Landroid/app/DatePickerDialog$OnDateSetListener;III)V

    .line 190
    .local v0, "datePickerDialog":Landroid/app/DatePickerDialog;
    invoke-virtual {v0}, Landroid/app/DatePickerDialog;->show()V

    .line 191
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 12
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "savedInstanceState"
        }
    .end annotation

    .line 76
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 77
    const v0, 0x7f0d001f

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/MainActivity;->setContentView(I)V

    .line 78
    const v0, 0x7f0a0233

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroidx/appcompat/widget/Toolbar;

    .line 79
    .local v4, "toolbar":Landroidx/appcompat/widget/Toolbar;
    invoke-virtual {p0, v4}, Lcom/trimline/metrocrew/MainActivity;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    .line 80
    invoke-virtual {p0}, Lcom/trimline/metrocrew/MainActivity;->permissions()V

    .line 81
    invoke-static {p0}, Landroidx/lifecycle/ViewModelProviders;->of(Landroidx/fragment/app/FragmentActivity;)Landroidx/lifecycle/ViewModelProvider;

    move-result-object v0

    const-class v1, Lcom/trimline/metrocrew/theader$Model;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/theader$Model;

    iput-object v0, p0, Lcom/trimline/metrocrew/MainActivity;->theaderModel:Lcom/trimline/metrocrew/theader$Model;

    .line 82
    invoke-static {p0}, Landroidx/lifecycle/ViewModelProviders;->of(Landroidx/fragment/app/FragmentActivity;)Landroidx/lifecycle/ViewModelProvider;

    move-result-object v0

    const-class v1, Lcom/trimline/metrocrew/transaction$Model;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/transaction$Model;

    iput-object v0, p0, Lcom/trimline/metrocrew/MainActivity;->transModel:Lcom/trimline/metrocrew/transaction$Model;

    .line 84
    const v0, 0x7f0a01ae

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    iput-object v0, p0, Lcom/trimline/metrocrew/MainActivity;->printer:Landroid/widget/CheckBox;

    .line 85
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity;->printer:Landroid/widget/CheckBox;

    const-string v1, "Printer Disconnected"

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    .line 86
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity;->printer:Landroid/widget/CheckBox;

    const/high16 v1, -0x10000

    invoke-virtual {v0, v1}, Landroid/widget/CheckBox;->setTextColor(I)V

    .line 89
    const-string v0, "Settings"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/trimline/metrocrew/MainActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/trimline/metrocrew/MainActivity;->preferences:Landroid/content/SharedPreferences;

    .line 90
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity;->preferences:Landroid/content/SharedPreferences;

    sput-object v0, Lcom/trimline/metrocrew/JsonParser;->preferences:Landroid/content/SharedPreferences;

    .line 91
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity;->mHandler:Landroid/os/Handler;

    sput-object v0, Lcom/trimline/metrocrew/Printer;->mHandler:Landroid/os/Handler;

    .line 92
    new-instance v0, Lcom/trimline/metrocrew/Printer$Printerthread;

    iget-object v1, p0, Lcom/trimline/metrocrew/MainActivity;->preferences:Landroid/content/SharedPreferences;

    invoke-direct {v0, v1}, Lcom/trimline/metrocrew/Printer$Printerthread;-><init>(Landroid/content/SharedPreferences;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/MainActivity;->sp:Lcom/trimline/metrocrew/Printer$Printerthread;

    .line 93
    iget-object v0, p0, Lcom/trimline/metrocrew/MainActivity;->sp:Lcom/trimline/metrocrew/Printer$Printerthread;

    invoke-virtual {v0}, Lcom/trimline/metrocrew/Printer$Printerthread;->start()V

    .line 95
    const v0, 0x7f0a00c5

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Landroidx/drawerlayout/widget/DrawerLayout;

    .line 96
    .local v3, "drawer":Landroidx/drawerlayout/widget/DrawerLayout;
    new-instance v1, Landroidx/appcompat/app/ActionBarDrawerToggle;

    const v5, 0x7f1200a8

    const v6, 0x7f1200a7

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Landroidx/appcompat/app/ActionBarDrawerToggle;-><init>(Landroid/app/Activity;Landroidx/drawerlayout/widget/DrawerLayout;Landroidx/appcompat/widget/Toolbar;II)V

    .line 98
    .local v1, "toggle":Landroidx/appcompat/app/ActionBarDrawerToggle;
    invoke-virtual {v3, v1}, Landroidx/drawerlayout/widget/DrawerLayout;->setDrawerListener(Landroidx/drawerlayout/widget/DrawerLayout$DrawerListener;)V

    .line 99
    invoke-virtual {v1}, Landroidx/appcompat/app/ActionBarDrawerToggle;->syncState()V

    .line 100
    const v0, 0x7f0a0166

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/navigation/NavigationView;

    .line 101
    .local v0, "navigationView":Lcom/google/android/material/navigation/NavigationView;
    invoke-virtual {v0, p0}, Lcom/google/android/material/navigation/NavigationView;->setNavigationItemSelectedListener(Lcom/google/android/material/navigation/NavigationView$OnNavigationItemSelectedListener;)V

    .line 106
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v5

    .line 107
    .local v5, "c":Ljava/util/Calendar;
    new-instance v6, Ljava/text/DecimalFormat;

    const-string v7, "00"

    invoke-direct {v6, v7}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 109
    .local v6, "mFormat":Ljava/text/DecimalFormat;
    const/4 v7, 0x1

    invoke-virtual {v5, v7}, Ljava/util/Calendar;->get(I)I

    move-result v8

    iput v8, v2, Lcom/trimline/metrocrew/MainActivity;->mYear:I

    .line 110
    const/4 v8, 0x2

    invoke-virtual {v5, v8}, Ljava/util/Calendar;->get(I)I

    move-result v8

    iput v8, v2, Lcom/trimline/metrocrew/MainActivity;->mMonth:I

    .line 111
    const/4 v8, 0x5

    invoke-virtual {v5, v8}, Ljava/util/Calendar;->get(I)I

    move-result v8

    iput v8, v2, Lcom/trimline/metrocrew/MainActivity;->mDay:I

    .line 113
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget v9, v2, Lcom/trimline/metrocrew/MainActivity;->mDay:I

    int-to-double v9, v9

    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/text/DecimalFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "-"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v10, v2, Lcom/trimline/metrocrew/MainActivity;->mMonth:I

    add-int/2addr v10, v7

    int-to-double v10, v10

    invoke-static {v10, v11}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v10

    invoke-virtual {v6, v10}, Ljava/text/DecimalFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v2, Lcom/trimline/metrocrew/MainActivity;->mYear:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v2, Lcom/trimline/metrocrew/MainActivity;->date:Ljava/lang/String;

    .line 114
    const v8, 0x7f0a0007

    invoke-virtual {p0, v8}, Lcom/trimline/metrocrew/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/Button;

    iput-object v8, v2, Lcom/trimline/metrocrew/MainActivity;->setdate:Landroid/widget/Button;

    .line 116
    iget-object v8, v2, Lcom/trimline/metrocrew/MainActivity;->setdate:Landroid/widget/Button;

    invoke-virtual {v8, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 117
    iget-object v8, v2, Lcom/trimline/metrocrew/MainActivity;->setdate:Landroid/widget/Button;

    iget-object v9, v2, Lcom/trimline/metrocrew/MainActivity;->date:Ljava/lang/String;

    invoke-virtual {v8, v9}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 119
    const v8, 0x7f0a0011

    invoke-virtual {p0, v8}, Lcom/trimline/metrocrew/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    iput-object v8, v2, Lcom/trimline/metrocrew/MainActivity;->receipts:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    .line 120
    iget-object v8, v2, Lcom/trimline/metrocrew/MainActivity;->receipts:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    new-instance v9, Lcom/trimline/metrocrew/MainActivity$1;

    invoke-direct {v9, p0}, Lcom/trimline/metrocrew/MainActivity$1;-><init>(Lcom/trimline/metrocrew/MainActivity;)V

    invoke-virtual {v8, v9}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 126
    const v8, 0x7f0a022b

    invoke-virtual {p0, v8}, Lcom/trimline/metrocrew/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    iput-object v8, v2, Lcom/trimline/metrocrew/MainActivity;->tillbal:Landroid/widget/TextView;

    .line 127
    sget-object v8, Lcom/trimline/metrocrew/agent$Model;->CurrentAgent:Lcom/trimline/metrocrew/agent;

    if-eqz v8, :cond_0

    .line 128
    iget-object v8, v2, Lcom/trimline/metrocrew/MainActivity;->tillbal:Landroid/widget/TextView;

    sget-object v9, Lcom/trimline/metrocrew/agent$Model;->CurrentAgent:Lcom/trimline/metrocrew/agent;

    iget-wide v9, v9, Lcom/trimline/metrocrew/agent;->Balance:D

    invoke-static {v9, v10}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v9

    filled-new-array {v9}, [Ljava/lang/Object;

    move-result-object v9

    const-string v10, "TILL BAL: <b>%,.2f</b>"

    invoke-static {v10, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    :cond_0
    new-instance v8, Lcom/trimline/metrocrew/theader$adapter;

    invoke-direct {v8, p0}, Lcom/trimline/metrocrew/theader$adapter;-><init>(Landroid/content/Context;)V

    .line 131
    .local v8, "adapter":Lcom/trimline/metrocrew/theader$adapter;
    const v9, 0x7f0a00fa

    invoke-virtual {p0, v9}, Lcom/trimline/metrocrew/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroidx/recyclerview/widget/RecyclerView;

    .line 132
    .local v9, "recyclerView":Landroidx/recyclerview/widget/RecyclerView;
    new-instance v10, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v10, p0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v9, v10}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 133
    invoke-virtual {v9, v7}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 134
    invoke-virtual {v9, v8}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 135
    new-instance v7, Lcom/trimline/metrocrew/MainActivity$2;

    invoke-direct {v7, p0}, Lcom/trimline/metrocrew/MainActivity$2;-><init>(Lcom/trimline/metrocrew/MainActivity;)V

    invoke-virtual {v8, v7}, Lcom/trimline/metrocrew/theader$adapter;->setOnItemClickListener(Lcom/trimline/metrocrew/theader$adapter$OnItemClickListener;)V

    .line 142
    iget-object v7, v2, Lcom/trimline/metrocrew/MainActivity;->theaderModel:Lcom/trimline/metrocrew/theader$Model;

    invoke-virtual {v7}, Lcom/trimline/metrocrew/theader$Model;->gettodaystransactions()Landroidx/lifecycle/LiveData;

    move-result-object v7

    new-instance v10, Lcom/trimline/metrocrew/MainActivity$3;

    invoke-direct {v10, p0, v8}, Lcom/trimline/metrocrew/MainActivity$3;-><init>(Lcom/trimline/metrocrew/MainActivity;Lcom/trimline/metrocrew/theader$adapter;)V

    invoke-virtual {v7, p0, v10}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V

    .line 162
    iget-object v7, v2, Lcom/trimline/metrocrew/MainActivity;->transModel:Lcom/trimline/metrocrew/transaction$Model;

    invoke-virtual {v7}, Lcom/trimline/metrocrew/transaction$Model;->getall()Landroidx/lifecycle/LiveData;

    move-result-object v7

    new-instance v10, Lcom/trimline/metrocrew/MainActivity$4;

    invoke-direct {v10, p0}, Lcom/trimline/metrocrew/MainActivity$4;-><init>(Lcom/trimline/metrocrew/MainActivity;)V

    invoke-virtual {v7, p0, v10}, Landroidx/lifecycle/LiveData;->observe(Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Observer;)V

    .line 170
    return-void
.end method

.method public onNavigationItemSelected(Landroid/view/MenuItem;)Z
    .locals 4
    .param p1, "item"    # Landroid/view/MenuItem;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "item"
        }
    .end annotation

    .line 196
    const/4 v0, 0x0

    .line 197
    .local v0, "i":Landroid/content/Intent;
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    .line 198
    .local v1, "id":I
    const v2, 0x7f0a0165

    if-ne v1, v2, :cond_0

    .line 199
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/trimline/metrocrew/Settings;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    move-object v0, v2

    goto :goto_0

    .line 200
    :cond_0
    const v2, 0x7f0a0208

    if-ne v1, v2, :cond_1

    goto :goto_0

    .line 202
    :cond_1
    const v2, 0x7f0a024e

    if-ne v1, v2, :cond_2

    goto :goto_0

    .line 204
    :cond_2
    const v2, 0x7f0a01b4

    if-ne v1, v2, :cond_3

    .line 205
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/trimline/metrocrew/transaction_details;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    move-object v0, v2

    .line 207
    :cond_3
    :goto_0
    if-eqz v0, :cond_4

    .line 208
    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 209
    :cond_4
    const v2, 0x7f0a00c5

    invoke-virtual {p0, v2}, Lcom/trimline/metrocrew/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/drawerlayout/widget/DrawerLayout;

    .line 210
    .local v2, "drawer":Landroidx/drawerlayout/widget/DrawerLayout;
    const v3, 0x800003

    invoke-virtual {v2, v3}, Landroidx/drawerlayout/widget/DrawerLayout;->closeDrawer(I)V

    .line 211
    const/4 v3, 0x1

    return v3
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "requestCode",
            "permissions",
            "grantResults"
        }
    .end annotation

    .line 358
    invoke-super {p0, p1, p2, p3}, Landroidx/appcompat/app/AppCompatActivity;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 359
    const/16 v0, 0x3e9

    if-ne p1, v0, :cond_1

    .line 360
    array-length v0, p3

    const/4 v1, 0x0

    if-lez v0, :cond_0

    aget v0, p3, v1

    if-nez v0, :cond_0

    .line 362
    const-string v0, "Bluetooth permission granted"

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 364
    :cond_0
    const-string v0, "Bluetooth permission denied"

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 367
    :cond_1
    :goto_0
    return-void
.end method

.method public permissions()V
    .locals 6

    .line 325
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1f

    const/16 v2, 0x3e9

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-lt v0, v1, :cond_1

    .line 327
    const-string v0, "android.permission.BLUETOOTH_CONNECT"

    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    const-string v5, "android.permission.BLUETOOTH_SCAN"

    if-nez v1, :cond_0

    .line 329
    invoke-static {p0, v5}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_2

    .line 332
    :cond_0
    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    aput-object v0, v1, v3

    aput-object v5, v1, v4

    invoke-static {p0, v1, v2}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    goto :goto_0

    .line 343
    :cond_1
    const-string v0, "android.permission.BLUETOOTH"

    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_2

    .line 345
    new-array v1, v4, [Ljava/lang/String;

    aput-object v0, v1, v3

    invoke-static {p0, v1, v2}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 352
    :cond_2
    :goto_0
    return-void
.end method
