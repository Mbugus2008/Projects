.class public Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;
.super Ljava/lang/Object;
.source "SharedPreferencesDumperPlugin.java"

# interfaces
.implements Lcom/facebook/stetho/dumpapp/DumperPlugin;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;
    }
.end annotation


# static fields
.field private static final NAME:Ljava/lang/String; = "prefs"

.field private static final XML_SUFFIX:Ljava/lang/String; = ".xml"


# instance fields
.field private final mAppContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->mAppContext:Landroid/content/Context;

    .line 38
    return-void
.end method

.method private doPrint(Ljava/io/PrintStream;Ljava/util/List;)V
    .locals 7
    .param p1, "writer"    # Ljava/io/PrintStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/PrintStream;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 137
    .local p2, "args":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->mAppContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    iget-object v1, v1, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/shared_prefs"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 138
    .local v3, "rootPath":Ljava/lang/String;
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_0

    move-object v5, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    move-object v5, v0

    .line 139
    .local v5, "offsetPrefix":Ljava/lang/String;
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v0

    const/4 v2, 0x1

    if-le v0, v2, :cond_1

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ljava/lang/String;

    :cond_1
    move-object v6, v1

    .line 141
    .local v6, "keyPrefix":Ljava/lang/String;
    const-string v4, ""

    move-object v1, p0

    move-object v2, p1

    .end local p1    # "writer":Ljava/io/PrintStream;
    .local v2, "writer":Ljava/io/PrintStream;
    invoke-direct/range {v1 .. v6}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->printRecursive(Ljava/io/PrintStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    return-void
.end method

.method private doUsage(Ljava/io/PrintStream;)V
    .locals 5
    .param p1, "writer"    # Ljava/io/PrintStream;

    .line 183
    const-string v0, "dumpapp prefs"

    .line 185
    .local v0, "cmdName":Ljava/lang/String;
    const-string v1, "Usage: dumpapp prefs "

    .line 186
    .local v1, "usagePrefix":Ljava/lang/String;
    const-string v2, "       dumpapp prefs "

    .line 187
    .local v2, "blankPrefix":Ljava/lang/String;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "<command> [command-options]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 188
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "print [pathPrefix [keyPrefix]]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 189
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 191
    const-string/jumbo v4, "write <path> <key> <"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 190
    const-string/jumbo v4, "|"

    invoke-static {v3, v4}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->appendNamesList(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 193
    const-string v4, "> <value>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    .line 189
    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 194
    invoke-virtual {p1}, Ljava/io/PrintStream;->println()V

    .line 195
    const-string v3, "dumpapp prefs print: Print all matching values from the shared preferences"

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 196
    invoke-virtual {p1}, Ljava/io/PrintStream;->println()V

    .line 197
    const-string v3, "dumpapp prefs write: Writes a value to the shared preferences"

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 198
    return-void
.end method

.method private doWrite(Ljava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/dumpapp/DumpUsageException;
        }
    .end annotation

    .line 67
    .local p1, "args":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v0, "Usage: prefs write <path> <key> <type> <value>, where type is one of: "

    .line 69
    .local v0, "usagePrefix":Ljava/lang/String;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 70
    .local v1, "argsIter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    const-string v2, "Expected <path>"

    invoke-static {v1, v2}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->nextArg(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 71
    .local v2, "path":Ljava/lang/String;
    const-string v3, "Expected <key>"

    invoke-static {v1, v3}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->nextArg(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 72
    .local v3, "key":Ljava/lang/String;
    const-string v4, "Expected <type>"

    invoke-static {v1, v4}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->nextArg(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 74
    .local v4, "typeName":Ljava/lang/String;
    invoke-static {v4}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->of(Ljava/lang/String;)Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;

    move-result-object v5

    .line 75
    .local v5, "type":Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;
    if-eqz v5, :cond_0

    .line 80
    invoke-direct {p0, v2}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->getSharedPreferences(Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 81
    .local v6, "sharedPreferences":Landroid/content/SharedPreferences;
    invoke-interface {v6}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    .line 83
    .local v7, "editor":Landroid/content/SharedPreferences$Editor;
    sget-object v8, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$1;->$SwitchMap$com$facebook$stetho$dumpapp$plugins$SharedPreferencesDumperPlugin$Type:[I

    invoke-virtual {v5}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_0

    goto :goto_0

    .line 100
    :pswitch_0
    invoke-static {v7, v3, v1}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->putStringSet(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;Ljava/util/Iterator;)V

    goto :goto_0

    .line 97
    :pswitch_1
    invoke-static {v1}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->nextArgValue(Ljava/util/Iterator;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v3, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 98
    goto :goto_0

    .line 94
    :pswitch_2
    invoke-static {v1}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->nextArgValue(Ljava/util/Iterator;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Float;->floatValue()F

    move-result v8

    invoke-interface {v7, v3, v8}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    .line 95
    goto :goto_0

    .line 91
    :pswitch_3
    invoke-static {v1}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->nextArgValue(Ljava/util/Iterator;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    invoke-interface {v7, v3, v8, v9}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 92
    goto :goto_0

    .line 88
    :pswitch_4
    invoke-static {v1}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->nextArgValue(Ljava/util/Iterator;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-interface {v7, v3, v8}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 89
    goto :goto_0

    .line 85
    :pswitch_5
    invoke-static {v1}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->nextArgValue(Ljava/util/Iterator;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    invoke-interface {v7, v3, v8}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 86
    nop

    .line 104
    :goto_0
    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 105
    return-void

    .line 76
    .end local v6    # "sharedPreferences":Landroid/content/SharedPreferences;
    .end local v7    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_0
    new-instance v6, Lcom/facebook/stetho/dumpapp/DumpUsageException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    const-string v8, ", "

    invoke-static {v7, v8}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin$Type;->appendNamesList(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Lcom/facebook/stetho/dumpapp/DumpUsageException;-><init>(Ljava/lang/String;)V

    throw v6

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private getSharedPreferences(Ljava/lang/String;)Landroid/content/SharedPreferences;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .line 201
    iget-object v0, p0, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->mAppContext:Landroid/content/Context;

    const/4 v1, 0x4

    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0
.end method

.method private static nextArg(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "messageIfNotPresent"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/dumpapp/DumpUsageException;
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 110
    .local p0, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 113
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0

    .line 111
    :cond_0
    new-instance v0, Lcom/facebook/stetho/dumpapp/DumpUsageException;

    invoke-direct {v0, p1}, Lcom/facebook/stetho/dumpapp/DumpUsageException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static nextArgValue(Ljava/util/Iterator;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/dumpapp/DumpUsageException;
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 118
    .local p0, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    const-string v0, "Expected <value>"

    invoke-static {p0, v0}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->nextArg(Ljava/util/Iterator;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private printFile(Ljava/io/PrintStream;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "writer"    # Ljava/io/PrintStream;
    .param p2, "prefsName"    # Ljava/lang/String;
    .param p3, "keyPrefix"    # Ljava/lang/String;

    .line 173
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 174
    invoke-direct {p0, p2}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->getSharedPreferences(Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 175
    .local v0, "preferences":Landroid/content/SharedPreferences;
    invoke-static {v0}, Lcom/facebook/stetho/inspector/domstorage/SharedPreferencesHelper;->getSharedPreferenceEntriesSorted(Landroid/content/SharedPreferences;)Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 176
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;*>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3, p3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 177
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "  "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 179
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;*>;"
    :cond_0
    goto :goto_0

    .line 180
    :cond_1
    return-void
.end method

.method private printRecursive(Ljava/io/PrintStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p1, "writer"    # Ljava/io/PrintStream;
    .param p2, "rootPath"    # Ljava/lang/String;
    .param p3, "offsetPath"    # Ljava/lang/String;
    .param p4, "pathPrefix"    # Ljava/lang/String;
    .param p5, "keyPrefix"    # Ljava/lang/String;

    .line 150
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2, p3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 152
    const-string v1, ".xml"

    invoke-virtual {p3, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 153
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    .line 154
    .local v1, "suffixLength":I
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v1

    const/4 v3, 0x0

    invoke-virtual {p3, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 155
    .local v2, "prefsName":Ljava/lang/String;
    invoke-direct {p0, p1, v2, p5}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->printFile(Ljava/io/PrintStream;Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    .end local v1    # "suffixLength":I
    .end local v2    # "prefsName":Ljava/lang/String;
    move-object v5, p1

    move-object v6, p2

    move-object v8, p4

    move-object v9, p5

    goto/16 :goto_3

    .line 152
    :cond_0
    move-object v5, p1

    move-object v6, p2

    move-object v8, p4

    move-object v9, p5

    goto/16 :goto_3

    .line 157
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 158
    invoke-virtual {v0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    .line 159
    .local v1, "children":[Ljava/lang/String;
    if-eqz v1, :cond_5

    .line 160
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_4

    .line 161
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    aget-object v3, v1, v2

    goto :goto_1

    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    aget-object v4, v1, v2

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    :goto_1
    move-object v7, v3

    .line 164
    .local v7, "childOffsetPath":Ljava/lang/String;
    invoke-virtual {v7, p4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 165
    move-object v4, p0

    move-object v5, p1

    move-object v6, p2

    move-object v8, p4

    move-object v9, p5

    .end local p1    # "writer":Ljava/io/PrintStream;
    .end local p2    # "rootPath":Ljava/lang/String;
    .end local p4    # "pathPrefix":Ljava/lang/String;
    .end local p5    # "keyPrefix":Ljava/lang/String;
    .local v5, "writer":Ljava/io/PrintStream;
    .local v6, "rootPath":Ljava/lang/String;
    .local v8, "pathPrefix":Ljava/lang/String;
    .local v9, "keyPrefix":Ljava/lang/String;
    invoke-direct/range {v4 .. v9}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->printRecursive(Ljava/io/PrintStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 164
    .end local v5    # "writer":Ljava/io/PrintStream;
    .end local v6    # "rootPath":Ljava/lang/String;
    .end local v8    # "pathPrefix":Ljava/lang/String;
    .end local v9    # "keyPrefix":Ljava/lang/String;
    .restart local p1    # "writer":Ljava/io/PrintStream;
    .restart local p2    # "rootPath":Ljava/lang/String;
    .restart local p4    # "pathPrefix":Ljava/lang/String;
    .restart local p5    # "keyPrefix":Ljava/lang/String;
    :cond_3
    move-object v5, p1

    move-object v6, p2

    move-object v8, p4

    move-object v9, p5

    .line 160
    .end local v7    # "childOffsetPath":Ljava/lang/String;
    .end local p1    # "writer":Ljava/io/PrintStream;
    .end local p2    # "rootPath":Ljava/lang/String;
    .end local p4    # "pathPrefix":Ljava/lang/String;
    .end local p5    # "keyPrefix":Ljava/lang/String;
    .restart local v5    # "writer":Ljava/io/PrintStream;
    .restart local v6    # "rootPath":Ljava/lang/String;
    .restart local v8    # "pathPrefix":Ljava/lang/String;
    .restart local v9    # "keyPrefix":Ljava/lang/String;
    :goto_2
    add-int/lit8 v2, v2, 0x1

    move-object p1, v5

    move-object p2, v6

    move-object p4, v8

    move-object p5, v9

    goto :goto_0

    .end local v5    # "writer":Ljava/io/PrintStream;
    .end local v6    # "rootPath":Ljava/lang/String;
    .end local v8    # "pathPrefix":Ljava/lang/String;
    .end local v9    # "keyPrefix":Ljava/lang/String;
    .restart local p1    # "writer":Ljava/io/PrintStream;
    .restart local p2    # "rootPath":Ljava/lang/String;
    .restart local p4    # "pathPrefix":Ljava/lang/String;
    .restart local p5    # "keyPrefix":Ljava/lang/String;
    :cond_4
    move-object v5, p1

    move-object v6, p2

    move-object v8, p4

    move-object v9, p5

    .end local p1    # "writer":Ljava/io/PrintStream;
    .end local p2    # "rootPath":Ljava/lang/String;
    .end local p4    # "pathPrefix":Ljava/lang/String;
    .end local p5    # "keyPrefix":Ljava/lang/String;
    .restart local v5    # "writer":Ljava/io/PrintStream;
    .restart local v6    # "rootPath":Ljava/lang/String;
    .restart local v8    # "pathPrefix":Ljava/lang/String;
    .restart local v9    # "keyPrefix":Ljava/lang/String;
    goto :goto_3

    .line 159
    .end local v2    # "i":I
    .end local v5    # "writer":Ljava/io/PrintStream;
    .end local v6    # "rootPath":Ljava/lang/String;
    .end local v8    # "pathPrefix":Ljava/lang/String;
    .end local v9    # "keyPrefix":Ljava/lang/String;
    .restart local p1    # "writer":Ljava/io/PrintStream;
    .restart local p2    # "rootPath":Ljava/lang/String;
    .restart local p4    # "pathPrefix":Ljava/lang/String;
    .restart local p5    # "keyPrefix":Ljava/lang/String;
    :cond_5
    move-object v5, p1

    move-object v6, p2

    move-object v8, p4

    move-object v9, p5

    .end local p1    # "writer":Ljava/io/PrintStream;
    .end local p2    # "rootPath":Ljava/lang/String;
    .end local p4    # "pathPrefix":Ljava/lang/String;
    .end local p5    # "keyPrefix":Ljava/lang/String;
    .restart local v5    # "writer":Ljava/io/PrintStream;
    .restart local v6    # "rootPath":Ljava/lang/String;
    .restart local v8    # "pathPrefix":Ljava/lang/String;
    .restart local v9    # "keyPrefix":Ljava/lang/String;
    goto :goto_3

    .line 157
    .end local v1    # "children":[Ljava/lang/String;
    .end local v5    # "writer":Ljava/io/PrintStream;
    .end local v6    # "rootPath":Ljava/lang/String;
    .end local v8    # "pathPrefix":Ljava/lang/String;
    .end local v9    # "keyPrefix":Ljava/lang/String;
    .restart local p1    # "writer":Ljava/io/PrintStream;
    .restart local p2    # "rootPath":Ljava/lang/String;
    .restart local p4    # "pathPrefix":Ljava/lang/String;
    .restart local p5    # "keyPrefix":Ljava/lang/String;
    :cond_6
    move-object v5, p1

    move-object v6, p2

    move-object v8, p4

    move-object v9, p5

    .line 170
    .end local p1    # "writer":Ljava/io/PrintStream;
    .end local p2    # "rootPath":Ljava/lang/String;
    .end local p4    # "pathPrefix":Ljava/lang/String;
    .end local p5    # "keyPrefix":Ljava/lang/String;
    .restart local v5    # "writer":Ljava/io/PrintStream;
    .restart local v6    # "rootPath":Ljava/lang/String;
    .restart local v8    # "pathPrefix":Ljava/lang/String;
    .restart local v9    # "keyPrefix":Ljava/lang/String;
    :goto_3
    return-void
.end method

.method private static putStringSet(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;Ljava/util/Iterator;)V
    .locals 2
    .param p0, "editor"    # Landroid/content/SharedPreferences$Editor;
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/SharedPreferences$Editor;",
            "Ljava/lang/String;",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 125
    .local p2, "remainingArgs":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 126
    .local v0, "set":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 127
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 129
    :cond_0
    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    .line 130
    return-void
.end method


# virtual methods
.method public dump(Lcom/facebook/stetho/dumpapp/DumperContext;)V
    .locals 4
    .param p1, "dumpContext"    # Lcom/facebook/stetho/dumpapp/DumperContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/dumpapp/DumpUsageException;
        }
    .end annotation

    .line 47
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/DumperContext;->getStdout()Ljava/io/PrintStream;

    move-result-object v0

    .line 48
    .local v0, "writer":Ljava/io/PrintStream;
    invoke-virtual {p1}, Lcom/facebook/stetho/dumpapp/DumperContext;->getArgsAsList()Ljava/util/List;

    move-result-object v1

    .line 50
    .local v1, "args":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, ""

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 52
    .local v2, "commandName":Ljava/lang/String;
    :goto_0
    const-string v3, "print"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 53
    invoke-direct {p0, v0, v1}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->doPrint(Ljava/io/PrintStream;Ljava/util/List;)V

    goto :goto_1

    .line 54
    :cond_1
    const-string/jumbo v3, "write"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 55
    invoke-direct {p0, v1}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->doWrite(Ljava/util/List;)V

    goto :goto_1

    .line 57
    :cond_2
    invoke-direct {p0, v0}, Lcom/facebook/stetho/dumpapp/plugins/SharedPreferencesDumperPlugin;->doUsage(Ljava/io/PrintStream;)V

    .line 59
    :goto_1
    return-void
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 42
    const-string v0, "prefs"

    return-object v0
.end method
