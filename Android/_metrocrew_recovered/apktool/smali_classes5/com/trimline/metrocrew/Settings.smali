.class public Lcom/trimline/metrocrew/Settings;
.super Landroid/app/Activity;
.source "Settings.java"


# instance fields
.field Scale:Landroid/widget/EditText;

.field copies:Landroid/widget/EditText;

.field ip:Landroid/widget/EditText;

.field printer:Landroid/widget/EditText;

.field save:Landroid/widget/Button;

.field sharedPreferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/trimline/metrocrew/Settings;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/trimline/metrocrew/Settings;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;

    .line 16
    invoke-direct {p0, p1, p2}, Lcom/trimline/metrocrew/Settings;->savePreferences(Ljava/lang/String;Ljava/lang/String;)V

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

    .line 104
    const-string v0, ""

    .line 105
    .local v0, "pref":Ljava/lang/String;
    iget-object v1, p0, Lcom/trimline/metrocrew/Settings;->sharedPreferences:Landroid/content/SharedPreferences;

    const-string v2, ""

    invoke-interface {v1, p1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 107
    .local v1, "value":Ljava/lang/String;
    if-nez v1, :cond_0

    if-eq v1, v2, :cond_1

    .line 108
    :cond_0
    move-object v0, v1

    .line 110
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

    .line 115
    iget-object v0, p0, Lcom/trimline/metrocrew/Settings;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 116
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 117
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 121
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "requestCode",
            "resultCode",
            "data"
        }
    .end annotation

    .line 82
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 84
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 86
    :pswitch_0
    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    .line 87
    :try_start_0
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "SP"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 88
    .local v0, "sp":Ljava/lang/String;
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "device_address"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 89
    .local v1, "extra":Ljava/lang/String;
    const-string v2, "S"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 90
    iget-object v2, p0, Lcom/trimline/metrocrew/Settings;->Scale:Landroid/widget/EditText;

    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 91
    const-string v2, "SCALE"

    invoke-direct {p0, v2, v1}, Lcom/trimline/metrocrew/Settings;->savePreferences(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 93
    :cond_0
    const-string v2, "P"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 94
    iget-object v2, p0, Lcom/trimline/metrocrew/Settings;->printer:Landroid/widget/EditText;

    invoke-virtual {v2, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 95
    const-string v2, "PRINTER"

    invoke-direct {p0, v2, v1}, Lcom/trimline/metrocrew/Settings;->savePreferences(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 99
    .end local v0    # "sp":Ljava/lang/String;
    .end local v1    # "extra":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 100
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 101
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_0
    nop

    .line 102
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x2300
        :pswitch_0
    .end packed-switch
.end method

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

    .line 24
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 25
    const v0, 0x7f0d007d

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Settings;->setContentView(I)V

    .line 27
    const v0, 0x7f0a01df

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Settings;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/trimline/metrocrew/Settings;->printer:Landroid/widget/EditText;

    .line 28
    const v0, 0x7f0a00a0

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Settings;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/trimline/metrocrew/Settings;->copies:Landroid/widget/EditText;

    .line 29
    const v0, 0x7f0a01de

    invoke-virtual {p0, v0}, Lcom/trimline/metrocrew/Settings;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/trimline/metrocrew/Settings;->ip:Landroid/widget/EditText;

    .line 30
    const-string v0, "Settings"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/trimline/metrocrew/Settings;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/trimline/metrocrew/Settings;->sharedPreferences:Landroid/content/SharedPreferences;

    .line 31
    iget-object v0, p0, Lcom/trimline/metrocrew/Settings;->sharedPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    .line 33
    .local v0, "keys":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;*>;"
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 34
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;*>;"
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 35
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 34
    const-string v4, "map values"

    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;*>;"
    goto :goto_0

    .line 37
    :cond_0
    const v1, 0x7f0a01c6

    invoke-virtual {p0, v1}, Lcom/trimline/metrocrew/Settings;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/trimline/metrocrew/Settings;->save:Landroid/widget/Button;

    .line 38
    iget-object v1, p0, Lcom/trimline/metrocrew/Settings;->save:Landroid/widget/Button;

    new-instance v2, Lcom/trimline/metrocrew/Settings$1;

    invoke-direct {v2, p0}, Lcom/trimline/metrocrew/Settings$1;-><init>(Lcom/trimline/metrocrew/Settings;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 48
    iget-object v1, p0, Lcom/trimline/metrocrew/Settings;->printer:Landroid/widget/EditText;

    const-string v2, "PRINTER"

    invoke-direct {p0, v2}, Lcom/trimline/metrocrew/Settings;->getpreferences(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 49
    iget-object v1, p0, Lcom/trimline/metrocrew/Settings;->ip:Landroid/widget/EditText;

    const-string v2, "IP"

    invoke-direct {p0, v2}, Lcom/trimline/metrocrew/Settings;->getpreferences(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 51
    iget-object v1, p0, Lcom/trimline/metrocrew/Settings;->ip:Landroid/widget/EditText;

    new-instance v2, Lcom/trimline/metrocrew/Settings$2;

    invoke-direct {v2, p0}, Lcom/trimline/metrocrew/Settings$2;-><init>(Lcom/trimline/metrocrew/Settings;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 61
    iget-object v1, p0, Lcom/trimline/metrocrew/Settings;->printer:Landroid/widget/EditText;

    new-instance v2, Lcom/trimline/metrocrew/Settings$3;

    invoke-direct {v2, p0}, Lcom/trimline/metrocrew/Settings$3;-><init>(Lcom/trimline/metrocrew/Settings;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 70
    iget-object v1, p0, Lcom/trimline/metrocrew/Settings;->printer:Landroid/widget/EditText;

    new-instance v2, Lcom/trimline/metrocrew/Settings$4;

    invoke-direct {v2, p0}, Lcom/trimline/metrocrew/Settings$4;-><init>(Lcom/trimline/metrocrew/Settings;)V

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 79
    return-void
.end method
