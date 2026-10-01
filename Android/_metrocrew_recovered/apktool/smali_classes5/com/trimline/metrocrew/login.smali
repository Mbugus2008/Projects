.class public Lcom/trimline/metrocrew/login;
.super Landroidx/appcompat/app/AppCompatActivity;
.source "login.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/trimline/metrocrew/login$LoginTask;
    }
.end annotation


# instance fields
.field Login:Landroid/widget/Button;

.field db:Lcom/trimline/metrocrew/DB;

.field model:Lcom/trimline/metrocrew/agent$Model;

.field pass:Landroid/widget/EditText;

.field preferences:Landroid/content/SharedPreferences;

.field username:Landroid/widget/EditText;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Landroidx/appcompat/app/AppCompatActivity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/trimline/metrocrew/login;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/trimline/metrocrew/login;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .line 26
    invoke-direct {p0, p1, p2}, Lcom/trimline/metrocrew/login;->savePreferences(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private getpreferences(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .line 108
    const-string v0, ""

    .line 109
    .local v0, "pref":Ljava/lang/String;
    iget-object v1, p0, Lcom/trimline/metrocrew/login;->preferences:Landroid/content/SharedPreferences;

    const-string v2, ""

    invoke-interface {v1, p1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 110
    .local v1, "value":Ljava/lang/String;
    if-nez v1, :cond_0

    if-eq v1, v2, :cond_1

    .line 111
    :cond_0
    move-object v0, v1

    .line 113
    :cond_1
    return-object v0
.end method

.method private savePreferences(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "value"
        }
    .end annotation

    .line 101
    iget-object v0, p0, Lcom/trimline/metrocrew/login;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 102
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 103
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 105
    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "savedInstanceState"
        }
    .end annotation

    .line 36
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 37
    const v0, 0x7f0d001e

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/login;->setContentView(I)V

    .line 38
    invoke-static {p0}, Lcom/facebook/stetho/Stetho;->initializeWithDefaults(Landroid/content/Context;)V

    .line 40
    invoke-static {p0}, Lcom/facebook/stetho/Stetho;->initializeWithDefaults(Landroid/content/Context;)V

    .line 41
    const-string v0, "Settings"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/trimline/metrocrew/login;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/trimline/metrocrew/login;->preferences:Landroid/content/SharedPreferences;

    .line 42
    iget-object v0, p0, Lcom/trimline/metrocrew/login;->preferences:Landroid/content/SharedPreferences;

    sput-object v0, Lcom/trimline/metrocrew/JsonParser;->preferences:Landroid/content/SharedPreferences;

    .line 43
    invoke-static {p0}, Landroidx/lifecycle/ViewModelProviders;->of(Landroidx/fragment/app/FragmentActivity;)Landroidx/lifecycle/ViewModelProvider;

    move-result-object v0

    const-class v1, Lcom/trimline/metrocrew/agent$Model;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/ViewModelProvider;->get(Ljava/lang/Class;)Landroidx/lifecycle/ViewModel;

    move-result-object v0

    check-cast v0, Lcom/trimline/metrocrew/agent$Model;

    iput-object v0, p0, Lcom/trimline/metrocrew/login;->model:Lcom/trimline/metrocrew/agent$Model;

    .line 44
    const v0, 0x7f0a0113

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/login;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/textfield/TextInputLayout;

    .line 45
    .local v0, "usernameWrapper":Lcom/google/android/material/textfield/TextInputLayout;
    const v1, 0x7f0a0112

    invoke-virtual {p0, v1}, Lcom/trimline/metrocrew/login;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/textfield/TextInputLayout;

    .line 46
    .local v1, "passwordWrapper":Lcom/google/android/material/textfield/TextInputLayout;
    const-string v2, "User Name"

    invoke-virtual {v0, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setHint(Ljava/lang/CharSequence;)V

    .line 47
    const-string v2, "Pin"

    invoke-virtual {v1, v2}, Lcom/google/android/material/textfield/TextInputLayout;->setHint(Ljava/lang/CharSequence;)V

    .line 48
    invoke-virtual {p0}, Lcom/trimline/metrocrew/login;->startwork()V

    .line 49
    const v2, 0x7f0a024d

    invoke-virtual {p0, v2}, Lcom/trimline/metrocrew/login;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/trimline/metrocrew/login;->username:Landroid/widget/EditText;

    .line 50
    const v2, 0x7f0a019f

    invoke-virtual {p0, v2}, Lcom/trimline/metrocrew/login;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/EditText;

    iput-object v2, p0, Lcom/trimline/metrocrew/login;->pass:Landroid/widget/EditText;

    .line 51
    iget-object v2, p0, Lcom/trimline/metrocrew/login;->pass:Landroid/widget/EditText;

    new-instance v3, Lcom/trimline/metrocrew/login$1;

    invoke-direct {v3, p0}, Lcom/trimline/metrocrew/login$1;-><init>(Lcom/trimline/metrocrew/login;)V

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 62
    const-string v2, "User"

    invoke-direct {p0, v2}, Lcom/trimline/metrocrew/login;->getpreferences(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 63
    .local v3, "us":Ljava/lang/String;
    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 64
    iget-object v4, p0, Lcom/trimline/metrocrew/login;->username:Landroid/widget/EditText;

    invoke-direct {p0, v2}, Lcom/trimline/metrocrew/login;->getpreferences(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 65
    iget-object v2, p0, Lcom/trimline/metrocrew/login;->pass:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->requestFocus()Z

    .line 67
    :cond_0
    const v2, 0x7f0a0126

    invoke-virtual {p0, v2}, Lcom/trimline/metrocrew/login;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    iput-object v2, p0, Lcom/trimline/metrocrew/login;->Login:Landroid/widget/Button;

    .line 68
    iget-object v2, p0, Lcom/trimline/metrocrew/login;->Login:Landroid/widget/Button;

    new-instance v4, Lcom/trimline/metrocrew/login$2;

    invoke-direct {v4, p0}, Lcom/trimline/metrocrew/login$2;-><init>(Lcom/trimline/metrocrew/login;)V

    invoke-virtual {v2, v4}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 92
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 1
    .param p1, "menu"    # Landroid/view/Menu;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "menu"
        }
    .end annotation

    .line 120
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "item"
        }
    .end annotation

    .line 132
    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method

.method startwork()V
    .locals 1

    .line 96
    new-instance v0, Lcom/trimline/metrocrew/worker;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/worker;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/trimline/metrocrew/worker;->doWork()V

    .line 97
    return-void
.end method
