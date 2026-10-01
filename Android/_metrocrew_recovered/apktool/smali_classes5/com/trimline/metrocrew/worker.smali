.class public Lcom/trimline/metrocrew/worker;
.super Ljava/lang/Object;
.source "worker.java"


# instance fields
.field c:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "context"
        }
    .end annotation

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/trimline/metrocrew/worker;->c:Landroid/content/Context;

    .line 23
    return-void
.end method

.method static synthetic access$000(Lcom/trimline/metrocrew/worker;)V
    .locals 0
    .param p0, "x0"    # Lcom/trimline/metrocrew/worker;

    .line 16
    invoke-direct {p0}, Lcom/trimline/metrocrew/worker;->getlogins()V

    return-void
.end method

.method static synthetic access$100(Lcom/trimline/metrocrew/worker;)V
    .locals 0
    .param p0, "x0"    # Lcom/trimline/metrocrew/worker;

    .line 16
    invoke-direct {p0}, Lcom/trimline/metrocrew/worker;->gettypes()V

    return-void
.end method

.method static synthetic access$200(Lcom/trimline/metrocrew/worker;)V
    .locals 0
    .param p0, "x0"    # Lcom/trimline/metrocrew/worker;

    .line 16
    invoke-direct {p0}, Lcom/trimline/metrocrew/worker;->getvehicles()V

    return-void
.end method

.method static synthetic access$300(Lcom/trimline/metrocrew/worker;)V
    .locals 0
    .param p0, "x0"    # Lcom/trimline/metrocrew/worker;

    .line 16
    invoke-direct {p0}, Lcom/trimline/metrocrew/worker;->getmembers()V

    return-void
.end method

.method static synthetic access$400(Lcom/trimline/metrocrew/worker;)V
    .locals 0
    .param p0, "x0"    # Lcom/trimline/metrocrew/worker;

    .line 16
    invoke-direct {p0}, Lcom/trimline/metrocrew/worker;->getpaymenttypes()V

    return-void
.end method

.method private getloans()V
    .locals 10

    .line 234
    iget-object v0, p0, Lcom/trimline/metrocrew/worker;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/trimline/metrocrew/DB;->getInstance(Landroid/content/Context;)Lcom/trimline/metrocrew/DB;

    move-result-object v0

    .line 235
    .local v0, "db":Lcom/trimline/metrocrew/DB;
    invoke-virtual {v0}, Lcom/trimline/metrocrew/DB;->ldao()Lcom/trimline/metrocrew/loan$dao;

    move-result-object v1

    .line 238
    .local v1, "Dao":Lcom/trimline/metrocrew/loan$dao;
    :try_start_0
    const-string v2, ""

    .line 239
    .local v2, "key":Ljava/lang/String;
    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 240
    .local v3, "all":Ljava/lang/Boolean;
    :goto_0
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_3

    .line 241
    const-string v4, "loans"

    const-string v5, "bookmarkkey"

    invoke-static {v4, v5, v2}, Lcom/trimline/metrocrew/JsonParser;->postjson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 242
    .local v4, "result":Ljava/lang/String;
    new-instance v5, Lcom/trimline/metrocrew/worker$7;

    invoke-direct {v5, p0}, Lcom/trimline/metrocrew/worker$7;-><init>(Lcom/trimline/metrocrew/worker;)V

    .line 243
    invoke-virtual {v5}, Lcom/trimline/metrocrew/worker$7;->getType()Ljava/lang/reflect/Type;

    move-result-object v5

    .line 244
    .local v5, "localType":Ljava/lang/reflect/Type;
    new-instance v6, Lcom/google/gson/Gson;

    invoke-direct {v6}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v6, v4, v5}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 245
    .local v6, "results":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/loan;>;"
    if-eqz v6, :cond_2

    .line 247
    const/4 v7, 0x1

    :try_start_1
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    move-object v3, v7

    .line 248
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/trimline/metrocrew/loan;

    .line 250
    .local v8, "f":Lcom/trimline/metrocrew/loan;
    iget-object v9, v8, Lcom/trimline/metrocrew/loan;->Loan_No:Ljava/lang/String;

    if-eqz v9, :cond_0

    .line 251
    invoke-virtual {v1, v8}, Lcom/trimline/metrocrew/loan$dao;->insert(Lcom/trimline/metrocrew/loan;)V

    .line 252
    :cond_0
    iget-object v9, v8, Lcom/trimline/metrocrew/loan;->Key:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object v2, v9

    .line 253
    .end local v8    # "f":Lcom/trimline/metrocrew/loan;
    goto :goto_1

    .line 254
    :catch_0
    move-exception v7

    .line 255
    .local v7, "ex":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v7}, Ljava/lang/Exception;->printStackTrace()V

    .line 256
    .end local v7    # "ex":Ljava/lang/Exception;
    :cond_1
    goto :goto_2

    .line 258
    :cond_2
    const-string v7, "Groups"

    const-string v8, "Empty"

    invoke-static {v7, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 260
    .end local v4    # "result":Ljava/lang/String;
    .end local v5    # "localType":Ljava/lang/reflect/Type;
    :goto_2
    goto :goto_0

    .line 264
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "all":Ljava/lang/Boolean;
    .end local v6    # "results":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/loan;>;"
    :cond_3
    goto :goto_3

    .line 261
    :catch_1
    move-exception v2

    .line 263
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 265
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_3
    return-void
.end method

.method private getlogins()V
    .locals 8

    .line 119
    iget-object v0, p0, Lcom/trimline/metrocrew/worker;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/trimline/metrocrew/DB;->getInstance(Landroid/content/Context;)Lcom/trimline/metrocrew/DB;

    move-result-object v0

    .line 120
    .local v0, "db":Lcom/trimline/metrocrew/DB;
    invoke-virtual {v0}, Lcom/trimline/metrocrew/DB;->aDao()Lcom/trimline/metrocrew/agent$dao;

    move-result-object v1

    .line 122
    .local v1, "Dao":Lcom/trimline/metrocrew/agent$dao;
    :try_start_0
    new-instance v2, Lcom/google/gson/Gson;

    invoke-direct {v2}, Lcom/google/gson/Gson;-><init>()V

    .line 123
    .local v2, "g":Lcom/google/gson/Gson;
    const-string v3, "Users"

    const/4 v4, 0x0

    invoke-static {v3, v4, v4}, Lcom/trimline/metrocrew/JsonParser;->postjson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 124
    .local v3, "result":Ljava/lang/String;
    new-instance v4, Lcom/trimline/metrocrew/worker$4;

    invoke-direct {v4, p0}, Lcom/trimline/metrocrew/worker$4;-><init>(Lcom/trimline/metrocrew/worker;)V

    .line 125
    invoke-virtual {v4}, Lcom/trimline/metrocrew/worker$4;->getType()Ljava/lang/reflect/Type;

    move-result-object v4

    .line 126
    .local v4, "localType":Ljava/lang/reflect/Type;
    new-instance v5, Lcom/google/gson/Gson;

    invoke-direct {v5}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v5, v3, v4}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 127
    .local v5, "results":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/agent;>;"
    if-eqz v5, :cond_1

    .line 129
    :try_start_1
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/trimline/metrocrew/agent;

    .line 132
    .local v7, "f":Lcom/trimline/metrocrew/agent;
    invoke-virtual {v1, v7}, Lcom/trimline/metrocrew/agent$dao;->insert(Lcom/trimline/metrocrew/agent;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 133
    .end local v7    # "f":Lcom/trimline/metrocrew/agent;
    goto :goto_0

    .line 134
    :catch_0
    move-exception v6

    .line 136
    .local v6, "ex":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V

    .line 137
    .end local v6    # "ex":Ljava/lang/Exception;
    :cond_0
    goto :goto_1

    .line 139
    :cond_1
    const-string v6, "members"

    const-string v7, "Empty"

    invoke-static {v6, v7}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 144
    .end local v2    # "g":Lcom/google/gson/Gson;
    .end local v3    # "result":Ljava/lang/String;
    .end local v4    # "localType":Ljava/lang/reflect/Type;
    .end local v5    # "results":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/agent;>;"
    :goto_1
    goto :goto_2

    .line 141
    :catch_1
    move-exception v2

    .line 143
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 145
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_2
    return-void
.end method

.method private getmembers()V
    .locals 15

    .line 150
    iget-object v0, p0, Lcom/trimline/metrocrew/worker;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/trimline/metrocrew/DB;->getInstance(Landroid/content/Context;)Lcom/trimline/metrocrew/DB;

    move-result-object v0

    .line 151
    .local v0, "db":Lcom/trimline/metrocrew/DB;
    invoke-virtual {v0}, Lcom/trimline/metrocrew/DB;->memberDao()Lcom/trimline/metrocrew/Member$dao;

    move-result-object v1

    .line 152
    .local v1, "Dao":Lcom/trimline/metrocrew/Member$dao;
    invoke-virtual {v0}, Lcom/trimline/metrocrew/DB;->ldao()Lcom/trimline/metrocrew/loan$dao;

    move-result-object v2

    .line 155
    .local v2, "ldao":Lcom/trimline/metrocrew/loan$dao;
    :try_start_0
    const-string v3, ""

    .line 156
    .local v3, "key":Ljava/lang/String;
    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    .line 157
    .local v5, "all":Ljava/lang/Boolean;
    :goto_0
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-nez v6, :cond_4

    .line 158
    const-string v6, "Members"

    const-string v7, "key"

    invoke-static {v6, v7, v3}, Lcom/trimline/metrocrew/JsonParser;->postjson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 159
    .local v6, "result":Ljava/lang/String;
    new-instance v7, Lcom/trimline/metrocrew/worker$5;

    invoke-direct {v7, p0}, Lcom/trimline/metrocrew/worker$5;-><init>(Lcom/trimline/metrocrew/worker;)V

    .line 160
    invoke-virtual {v7}, Lcom/trimline/metrocrew/worker$5;->getType()Ljava/lang/reflect/Type;

    move-result-object v7

    .line 161
    .local v7, "localType":Ljava/lang/reflect/Type;
    new-instance v8, Lcom/google/gson/Gson;

    invoke-direct {v8}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v8, v6, v7}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 162
    .local v8, "results":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/Member;>;"
    if-eqz v8, :cond_3

    .line 164
    const/4 v9, 0x1

    :try_start_1
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    move-object v5, v9

    .line 165
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/trimline/metrocrew/Member;

    .line 167
    .local v10, "f":Lcom/trimline/metrocrew/Member;
    iget-object v11, v10, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    if-eqz v11, :cond_0

    .line 168
    invoke-virtual {v1, v10}, Lcom/trimline/metrocrew/Member$dao;->insert(Lcom/trimline/metrocrew/Member;)V

    .line 170
    :cond_0
    iget-object v11, v10, Lcom/trimline/metrocrew/Member;->loans:[Lcom/trimline/metrocrew/loan;

    array-length v11, v11

    if-lez v11, :cond_1

    .line 171
    iget-object v11, v10, Lcom/trimline/metrocrew/Member;->No:Ljava/lang/String;

    invoke-virtual {v2, v11}, Lcom/trimline/metrocrew/loan$dao;->removelclientloans(Ljava/lang/String;)V

    .line 172
    iget-object v11, v10, Lcom/trimline/metrocrew/Member;->loans:[Lcom/trimline/metrocrew/loan;

    array-length v12, v11

    move v13, v4

    :goto_2
    if-ge v13, v12, :cond_1

    aget-object v14, v11, v13

    .line 174
    .local v14, "l":Lcom/trimline/metrocrew/loan;
    invoke-virtual {v2, v14}, Lcom/trimline/metrocrew/loan$dao;->insert(Lcom/trimline/metrocrew/loan;)V

    .line 172
    .end local v14    # "l":Lcom/trimline/metrocrew/loan;
    add-int/lit8 v13, v13, 0x1

    goto :goto_2

    .line 177
    :cond_1
    iget-object v11, v10, Lcom/trimline/metrocrew/Member;->Key:Ljava/lang/String;

    move-object v3, v11

    .line 178
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object v5, v11

    .line 179
    .end local v10    # "f":Lcom/trimline/metrocrew/Member;
    goto :goto_1

    .line 180
    :catch_0
    move-exception v9

    .line 182
    .local v9, "ex":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V

    .line 183
    .end local v9    # "ex":Ljava/lang/Exception;
    :cond_2
    goto :goto_3

    .line 185
    :cond_3
    const-string v9, "members"

    const-string v10, "Empty"

    invoke-static {v9, v10}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 187
    .end local v6    # "result":Ljava/lang/String;
    .end local v7    # "localType":Ljava/lang/reflect/Type;
    :goto_3
    goto :goto_0

    .line 191
    .end local v3    # "key":Ljava/lang/String;
    .end local v5    # "all":Ljava/lang/Boolean;
    .end local v8    # "results":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/Member;>;"
    :cond_4
    goto :goto_4

    .line 188
    :catch_1
    move-exception v3

    .line 190
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 192
    .end local v3    # "e":Ljava/lang/Exception;
    :goto_4
    return-void
.end method

.method private getpaymenttypes()V
    .locals 8

    .line 87
    iget-object v0, p0, Lcom/trimline/metrocrew/worker;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/trimline/metrocrew/DB;->getInstance(Landroid/content/Context;)Lcom/trimline/metrocrew/DB;

    move-result-object v0

    .line 88
    .local v0, "db":Lcom/trimline/metrocrew/DB;
    invoke-virtual {v0}, Lcom/trimline/metrocrew/DB;->pdao()Lcom/trimline/metrocrew/payment_modes$dao;

    move-result-object v1

    .line 90
    .local v1, "Dao":Lcom/trimline/metrocrew/payment_modes$dao;
    :try_start_0
    new-instance v2, Lcom/google/gson/Gson;

    invoke-direct {v2}, Lcom/google/gson/Gson;-><init>()V

    .line 91
    .local v2, "g":Lcom/google/gson/Gson;
    const-string v3, "PaymentModes"

    const/4 v4, 0x0

    invoke-static {v3, v4, v4}, Lcom/trimline/metrocrew/JsonParser;->postjson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 92
    .local v3, "result":Ljava/lang/String;
    new-instance v4, Lcom/trimline/metrocrew/worker$3;

    invoke-direct {v4, p0}, Lcom/trimline/metrocrew/worker$3;-><init>(Lcom/trimline/metrocrew/worker;)V

    .line 93
    invoke-virtual {v4}, Lcom/trimline/metrocrew/worker$3;->getType()Ljava/lang/reflect/Type;

    move-result-object v4

    .line 94
    .local v4, "localType":Ljava/lang/reflect/Type;
    new-instance v5, Lcom/google/gson/Gson;

    invoke-direct {v5}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v5, v3, v4}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 96
    .local v5, "results":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/payment_modes;>;"
    if-eqz v5, :cond_2

    .line 98
    :try_start_1
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_0

    .line 99
    invoke-virtual {v1}, Lcom/trimline/metrocrew/payment_modes$dao;->deleteall()V

    .line 100
    :cond_0
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/trimline/metrocrew/payment_modes;

    .line 102
    .local v7, "f":Lcom/trimline/metrocrew/payment_modes;
    invoke-virtual {v1, v7}, Lcom/trimline/metrocrew/payment_modes$dao;->insert(Lcom/trimline/metrocrew/payment_modes;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 103
    .end local v7    # "f":Lcom/trimline/metrocrew/payment_modes;
    goto :goto_0

    .line 107
    :cond_1
    goto :goto_1

    .line 104
    :catch_0
    move-exception v6

    .line 106
    .local v6, "ex":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 114
    .end local v2    # "g":Lcom/google/gson/Gson;
    .end local v3    # "result":Ljava/lang/String;
    .end local v4    # "localType":Ljava/lang/reflect/Type;
    .end local v5    # "results":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/payment_modes;>;"
    .end local v6    # "ex":Ljava/lang/Exception;
    :cond_2
    :goto_1
    goto :goto_2

    .line 111
    :catch_1
    move-exception v2

    .line 113
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 115
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_2
    return-void
.end method

.method private gettypes()V
    .locals 8

    .line 56
    iget-object v0, p0, Lcom/trimline/metrocrew/worker;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/trimline/metrocrew/DB;->getInstance(Landroid/content/Context;)Lcom/trimline/metrocrew/DB;

    move-result-object v0

    .line 57
    .local v0, "db":Lcom/trimline/metrocrew/DB;
    invoke-virtual {v0}, Lcom/trimline/metrocrew/DB;->trandao()Lcom/trimline/metrocrew/types$dao;

    move-result-object v1

    .line 59
    .local v1, "Dao":Lcom/trimline/metrocrew/types$dao;
    :try_start_0
    new-instance v2, Lcom/google/gson/Gson;

    invoke-direct {v2}, Lcom/google/gson/Gson;-><init>()V

    .line 60
    .local v2, "g":Lcom/google/gson/Gson;
    const-string v3, "Transtypes"

    const/4 v4, 0x0

    invoke-static {v3, v4, v4}, Lcom/trimline/metrocrew/JsonParser;->postjson(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 61
    .local v3, "result":Ljava/lang/String;
    new-instance v4, Lcom/trimline/metrocrew/worker$2;

    invoke-direct {v4, p0}, Lcom/trimline/metrocrew/worker$2;-><init>(Lcom/trimline/metrocrew/worker;)V

    .line 62
    invoke-virtual {v4}, Lcom/trimline/metrocrew/worker$2;->getType()Ljava/lang/reflect/Type;

    move-result-object v4

    .line 63
    .local v4, "localType":Ljava/lang/reflect/Type;
    new-instance v5, Lcom/google/gson/Gson;

    invoke-direct {v5}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v5, v3, v4}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 64
    .local v5, "results":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/types;>;"
    if-eqz v5, :cond_2

    .line 66
    :try_start_1
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_0

    .line 67
    invoke-virtual {v1}, Lcom/trimline/metrocrew/types$dao;->deleteall()V

    .line 68
    :cond_0
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/trimline/metrocrew/types;

    .line 70
    .local v7, "f":Lcom/trimline/metrocrew/types;
    invoke-virtual {v1, v7}, Lcom/trimline/metrocrew/types$dao;->insert(Lcom/trimline/metrocrew/types;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 71
    .end local v7    # "f":Lcom/trimline/metrocrew/types;
    goto :goto_0

    .line 75
    :cond_1
    goto :goto_1

    .line 72
    :catch_0
    move-exception v6

    .line 74
    .local v6, "ex":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 82
    .end local v2    # "g":Lcom/google/gson/Gson;
    .end local v3    # "result":Ljava/lang/String;
    .end local v4    # "localType":Ljava/lang/reflect/Type;
    .end local v5    # "results":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/types;>;"
    .end local v6    # "ex":Ljava/lang/Exception;
    :cond_2
    :goto_1
    goto :goto_2

    .line 79
    :catch_1
    move-exception v2

    .line 81
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 83
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_2
    return-void
.end method

.method private getvehicles()V
    .locals 11

    .line 196
    const-string v0, ""

    iget-object v1, p0, Lcom/trimline/metrocrew/worker;->c:Landroid/content/Context;

    invoke-static {v1}, Lcom/trimline/metrocrew/DB;->getInstance(Landroid/content/Context;)Lcom/trimline/metrocrew/DB;

    move-result-object v1

    .line 197
    .local v1, "db":Lcom/trimline/metrocrew/DB;
    invoke-virtual {v1}, Lcom/trimline/metrocrew/DB;->vDao()Lcom/trimline/metrocrew/Vehicles$dao;

    move-result-object v2

    .line 201
    .local v2, "vdao":Lcom/trimline/metrocrew/Vehicles$dao;
    move-object v3, v0

    .line 202
    .local v3, "key":Ljava/lang/String;
    const/4 v4, 0x0

    :try_start_0
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    .line 204
    .local v4, "all":Ljava/lang/Boolean;
    const-string v5, "Vehicles"

    const/4 v6, 0x0

    invoke-static {v5, v6, v6}, Lcom/trimline/metrocrew/JsonParser;->postjson_metro(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 205
    .local v5, "result":Ljava/lang/String;
    new-instance v6, Lcom/trimline/metrocrew/worker$6;

    invoke-direct {v6, p0}, Lcom/trimline/metrocrew/worker$6;-><init>(Lcom/trimline/metrocrew/worker;)V

    .line 206
    invoke-virtual {v6}, Lcom/trimline/metrocrew/worker$6;->getType()Ljava/lang/reflect/Type;

    move-result-object v6

    .line 207
    .local v6, "localType":Ljava/lang/reflect/Type;
    new-instance v7, Lcom/google/gson/Gson;

    invoke-direct {v7}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v7, v5, v6}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 208
    .local v7, "results":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/Vehicles;>;"
    if-eqz v7, :cond_2

    .line 211
    :try_start_1
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/trimline/metrocrew/Vehicles;

    .line 213
    .local v9, "f":Lcom/trimline/metrocrew/Vehicles;
    iget-object v10, v9, Lcom/trimline/metrocrew/Vehicles;->Code:Ljava/lang/String;

    invoke-virtual {v10, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_0

    .line 214
    iget-object v10, v9, Lcom/trimline/metrocrew/Vehicles;->Fleet_No:Ljava/lang/String;

    if-eqz v10, :cond_0

    .line 215
    iget-object v10, v9, Lcom/trimline/metrocrew/Vehicles;->Vehicle_Number:Ljava/lang/String;

    if-eqz v10, :cond_0

    .line 216
    invoke-virtual {v2, v9}, Lcom/trimline/metrocrew/Vehicles$dao;->insert(Lcom/trimline/metrocrew/Vehicles;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 218
    .end local v9    # "f":Lcom/trimline/metrocrew/Vehicles;
    :cond_0
    goto :goto_0

    .line 219
    :catch_0
    move-exception v0

    .line 221
    .local v0, "ex":Ljava/lang/Exception;
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 222
    .end local v0    # "ex":Ljava/lang/Exception;
    :cond_1
    goto :goto_1

    .line 224
    :cond_2
    const-string v0, "members"

    const-string v8, "Empty"

    invoke-static {v0, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 230
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "all":Ljava/lang/Boolean;
    .end local v5    # "result":Ljava/lang/String;
    .end local v6    # "localType":Ljava/lang/reflect/Type;
    .end local v7    # "results":Ljava/util/List;, "Ljava/util/List<Lcom/trimline/metrocrew/Vehicles;>;"
    :goto_1
    goto :goto_2

    .line 227
    :catch_1
    move-exception v0

    .line 229
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 231
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_2
    return-void
.end method


# virtual methods
.method public doWork()V
    .locals 2

    .line 28
    :try_start_0
    new-instance v0, Lcom/trimline/metrocrew/worker$1;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/worker$1;-><init>(Lcom/trimline/metrocrew/worker;)V

    .line 40
    .local v0, "myRunnable4":Ljava/lang/Runnable;
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .end local v0    # "myRunnable4":Ljava/lang/Runnable;
    goto :goto_0

    .line 48
    :catch_0
    move-exception v0

    .line 49
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 51
    .end local v0    # "ex":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public postReceiptHeader()V
    .locals 3

    .line 325
    const-string v0, "Posting Header==>"

    const-string v1, "Receipt headers"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 327
    iget-object v0, p0, Lcom/trimline/metrocrew/worker;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/trimline/metrocrew/DB;->getInstance(Landroid/content/Context;)Lcom/trimline/metrocrew/DB;

    move-result-object v0

    .line 328
    .local v0, "db":Lcom/trimline/metrocrew/DB;
    invoke-virtual {v0}, Lcom/trimline/metrocrew/DB;->thDao()Lcom/trimline/metrocrew/theader$dao;

    move-result-object v1

    .line 330
    .local v1, "Dao":Lcom/trimline/metrocrew/theader$dao;
    :try_start_0
    new-instance v2, Lcom/trimline/metrocrew/worker$9;

    invoke-direct {v2, p0, v1}, Lcom/trimline/metrocrew/worker$9;-><init>(Lcom/trimline/metrocrew/worker;Lcom/trimline/metrocrew/theader$dao;)V

    invoke-static {v2}, Landroid/os/AsyncTask;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 360
    goto :goto_0

    .line 357
    :catch_0
    move-exception v2

    .line 359
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 361
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public postReceiptLines()V
    .locals 3

    .line 292
    const-string v0, "Posting Trans==>"

    const-string v1, "Receipts"

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 294
    iget-object v0, p0, Lcom/trimline/metrocrew/worker;->c:Landroid/content/Context;

    invoke-static {v0}, Lcom/trimline/metrocrew/DB;->getInstance(Landroid/content/Context;)Lcom/trimline/metrocrew/DB;

    move-result-object v0

    .line 295
    .local v0, "db":Lcom/trimline/metrocrew/DB;
    invoke-virtual {v0}, Lcom/trimline/metrocrew/DB;->tdao()Lcom/trimline/metrocrew/transaction$dao;

    move-result-object v1

    .line 297
    .local v1, "Dao":Lcom/trimline/metrocrew/transaction$dao;
    :try_start_0
    new-instance v2, Lcom/trimline/metrocrew/worker$8;

    invoke-direct {v2, p0, v1}, Lcom/trimline/metrocrew/worker$8;-><init>(Lcom/trimline/metrocrew/worker;Lcom/trimline/metrocrew/transaction$dao;)V

    invoke-static {v2}, Landroid/os/AsyncTask;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 322
    goto :goto_0

    .line 319
    :catch_0
    move-exception v2

    .line 321
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 323
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method
