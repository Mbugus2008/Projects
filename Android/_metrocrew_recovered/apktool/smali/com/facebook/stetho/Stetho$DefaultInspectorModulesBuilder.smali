.class public final Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;
.super Ljava/lang/Object;
.source "Stetho.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/Stetho;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "DefaultInspectorModulesBuilder"
.end annotation


# instance fields
.field private final mContext:Landroid/app/Application;

.field private mDatabaseDrivers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mDatabaseFilesProvider:Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mDelegate:Lcom/facebook/stetho/Stetho$PluginBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/facebook/stetho/Stetho$PluginBuilder<",
            "Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;",
            ">;"
        }
    .end annotation
.end field

.field private mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mExcludeSqliteDatabaseDriver:Z

.field private mRuntimeRepl:Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .line 247
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 239
    new-instance v0, Lcom/facebook/stetho/Stetho$PluginBuilder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/stetho/Stetho$PluginBuilder;-><init>(Lcom/facebook/stetho/Stetho$1;)V

    iput-object v0, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mDelegate:Lcom/facebook/stetho/Stetho$PluginBuilder;

    .line 248
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Application;

    iput-object v0, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mContext:Landroid/app/Application;

    .line 249
    return-void
.end method

.method private provideIfDesired(Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;
    .locals 2
    .param p1, "module"    # Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;

    .line 352
    iget-object v0, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mDelegate:Lcom/facebook/stetho/Stetho$PluginBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/facebook/stetho/Stetho$PluginBuilder;->provideIfDesired(Ljava/lang/String;Ljava/lang/Object;)V

    .line 353
    return-object p0
.end method

.method private resolveDocumentProvider()Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;
    .locals 3
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 416
    iget-object v0, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;

    if-eqz v0, :cond_0

    .line 417
    iget-object v0, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;

    return-object v0

    .line 419
    :cond_0
    nop

    .line 420
    new-instance v0, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProviderFactory;

    iget-object v1, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mContext:Landroid/app/Application;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/facebook/stetho/inspector/elements/android/AndroidDocumentProviderFactory;-><init>(Landroid/app/Application;Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public databaseFiles(Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;
    .locals 0
    .param p1, "provider"    # Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 294
    iput-object p1, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mDatabaseFilesProvider:Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;

    .line 295
    return-object p0
.end method

.method public documentProvider(Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;
    .locals 0
    .param p1, "factory"    # Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;

    .line 259
    iput-object p1, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mDocumentProvider:Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;

    .line 260
    return-object p0
.end method

.method public excludeSqliteDatabaseDriver(Z)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;
    .locals 0
    .param p1, "exclude"    # Z

    .line 334
    iput-boolean p1, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mExcludeSqliteDatabaseDriver:Z

    .line 335
    return-object p0
.end method

.method public finish()Ljava/lang/Iterable;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Iterable<",
            "Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;",
            ">;"
        }
    .end annotation

    .line 370
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Console;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/protocol/module/Console;-><init>()V

    invoke-direct {p0, v0}, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->provideIfDesired(Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;

    .line 371
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Debugger;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/protocol/module/Debugger;-><init>()V

    invoke-direct {p0, v0}, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->provideIfDesired(Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;

    .line 372
    invoke-direct {p0}, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->resolveDocumentProvider()Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;

    move-result-object v0

    .line 373
    .local v0, "documentModel":Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;
    if-eqz v0, :cond_0

    .line 374
    new-instance v1, Lcom/facebook/stetho/inspector/elements/Document;

    invoke-direct {v1, v0}, Lcom/facebook/stetho/inspector/elements/Document;-><init>(Lcom/facebook/stetho/inspector/elements/DocumentProviderFactory;)V

    .line 375
    .local v1, "document":Lcom/facebook/stetho/inspector/elements/Document;
    new-instance v2, Lcom/facebook/stetho/inspector/protocol/module/DOM;

    invoke-direct {v2, v1}, Lcom/facebook/stetho/inspector/protocol/module/DOM;-><init>(Lcom/facebook/stetho/inspector/elements/Document;)V

    invoke-direct {p0, v2}, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->provideIfDesired(Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;

    .line 376
    new-instance v2, Lcom/facebook/stetho/inspector/protocol/module/CSS;

    invoke-direct {v2, v1}, Lcom/facebook/stetho/inspector/protocol/module/CSS;-><init>(Lcom/facebook/stetho/inspector/elements/Document;)V

    invoke-direct {p0, v2}, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->provideIfDesired(Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;

    .line 378
    .end local v1    # "document":Lcom/facebook/stetho/inspector/elements/Document;
    :cond_0
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage;

    iget-object v2, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mContext:Landroid/app/Application;

    invoke-direct {v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/DOMStorage;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v1}, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->provideIfDesired(Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;

    .line 379
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/HeapProfiler;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/protocol/module/HeapProfiler;-><init>()V

    invoke-direct {p0, v1}, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->provideIfDesired(Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;

    .line 380
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Inspector;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/protocol/module/Inspector;-><init>()V

    invoke-direct {p0, v1}, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->provideIfDesired(Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;

    .line 381
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Network;

    iget-object v2, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mContext:Landroid/app/Application;

    invoke-direct {v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Network;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v1}, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->provideIfDesired(Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;

    .line 382
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Page;

    iget-object v2, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mContext:Landroid/app/Application;

    invoke-direct {v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Page;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v1}, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->provideIfDesired(Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;

    .line 383
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Profiler;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/protocol/module/Profiler;-><init>()V

    invoke-direct {p0, v1}, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->provideIfDesired(Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;

    .line 384
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Runtime;

    iget-object v2, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mRuntimeRepl:Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mRuntimeRepl:Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;

    goto :goto_0

    :cond_1
    new-instance v2, Lcom/facebook/stetho/inspector/runtime/RhinoDetectingRuntimeReplFactory;

    iget-object v3, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mContext:Landroid/app/Application;

    invoke-direct {v2, v3}, Lcom/facebook/stetho/inspector/runtime/RhinoDetectingRuntimeReplFactory;-><init>(Landroid/content/Context;)V

    :goto_0
    invoke-direct {v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Runtime;-><init>(Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;)V

    invoke-direct {p0, v1}, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->provideIfDesired(Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;

    .line 389
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Worker;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/protocol/module/Worker;-><init>()V

    invoke-direct {p0, v1}, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->provideIfDesired(Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;

    .line 390
    nop

    .line 391
    new-instance v1, Lcom/facebook/stetho/inspector/protocol/module/Database;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/protocol/module/Database;-><init>()V

    .line 392
    .local v1, "database":Lcom/facebook/stetho/inspector/protocol/module/Database;
    const/4 v2, 0x0

    .line 393
    .local v2, "hasSqliteDatabaseDriver":Z
    iget-object v3, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mDatabaseDrivers:Ljava/util/List;

    if-eqz v3, :cond_3

    .line 394
    iget-object v3, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mDatabaseDrivers:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2;

    .line 395
    .local v4, "databaseDriver":Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2;
    invoke-virtual {v1, v4}, Lcom/facebook/stetho/inspector/protocol/module/Database;->add(Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2;)V

    .line 396
    instance-of v5, v4, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;

    if-eqz v5, :cond_2

    .line 397
    const/4 v2, 0x1

    .line 399
    .end local v4    # "databaseDriver":Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2;
    :cond_2
    goto :goto_1

    .line 401
    :cond_3
    if-nez v2, :cond_5

    iget-boolean v3, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mExcludeSqliteDatabaseDriver:Z

    if-nez v3, :cond_5

    .line 402
    new-instance v3, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;

    iget-object v4, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mContext:Landroid/app/Application;

    iget-object v5, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mDatabaseFilesProvider:Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;

    if-eqz v5, :cond_4

    iget-object v5, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mDatabaseFilesProvider:Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;

    goto :goto_2

    :cond_4
    new-instance v5, Lcom/facebook/stetho/inspector/database/DefaultDatabaseFilesProvider;

    iget-object v6, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mContext:Landroid/app/Application;

    invoke-direct {v5, v6}, Lcom/facebook/stetho/inspector/database/DefaultDatabaseFilesProvider;-><init>(Landroid/content/Context;)V

    :goto_2
    new-instance v6, Lcom/facebook/stetho/inspector/database/DefaultDatabaseConnectionProvider;

    invoke-direct {v6}, Lcom/facebook/stetho/inspector/database/DefaultDatabaseConnectionProvider;-><init>()V

    invoke-direct {v3, v4, v5, v6}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;-><init>(Landroid/content/Context;Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;Lcom/facebook/stetho/inspector/database/DatabaseConnectionProvider;)V

    invoke-virtual {v1, v3}, Lcom/facebook/stetho/inspector/protocol/module/Database;->add(Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2;)V

    .line 409
    :cond_5
    invoke-direct {p0, v1}, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->provideIfDesired(Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;

    .line 411
    .end local v1    # "database":Lcom/facebook/stetho/inspector/protocol/module/Database;
    .end local v2    # "hasSqliteDatabaseDriver":Z
    iget-object v1, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mDelegate:Lcom/facebook/stetho/Stetho$PluginBuilder;

    invoke-virtual {v1}, Lcom/facebook/stetho/Stetho$PluginBuilder;->finish()Ljava/lang/Iterable;

    move-result-object v1

    return-object v1
.end method

.method public provide(Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;
    .locals 2
    .param p1, "module"    # Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 347
    iget-object v0, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mDelegate:Lcom/facebook/stetho/Stetho$PluginBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/facebook/stetho/Stetho$PluginBuilder;->provide(Ljava/lang/String;Ljava/lang/Object;)V

    .line 348
    return-object p0
.end method

.method public provideDatabaseDriver(Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;
    .locals 1
    .param p1, "databaseDriver"    # Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 303
    new-instance v0, Lcom/facebook/stetho/inspector/database/DatabaseDriver2Adapter;

    invoke-direct {v0, p1}, Lcom/facebook/stetho/inspector/database/DatabaseDriver2Adapter;-><init>(Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;)V

    invoke-virtual {p0, v0}, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->provideDatabaseDriver(Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;

    .line 304
    return-object p0
.end method

.method public provideDatabaseDriver(Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;
    .locals 1
    .param p1, "databaseDriver"    # Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2;

    .line 321
    iget-object v0, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mDatabaseDrivers:Ljava/util/List;

    if-nez v0, :cond_0

    .line 322
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mDatabaseDrivers:Ljava/util/List;

    .line 324
    :cond_0
    iget-object v0, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mDatabaseDrivers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 325
    return-object p0
.end method

.method public remove(Ljava/lang/String;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;
    .locals 1
    .param p1, "moduleName"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 365
    iget-object v0, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mDelegate:Lcom/facebook/stetho/Stetho$PluginBuilder;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/Stetho$PluginBuilder;->remove(Ljava/lang/String;)V

    .line 366
    return-object p0
.end method

.method public runtimeRepl(Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;)Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;
    .locals 0
    .param p1, "factory"    # Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;

    .line 271
    iput-object p1, p0, Lcom/facebook/stetho/Stetho$DefaultInspectorModulesBuilder;->mRuntimeRepl:Lcom/facebook/stetho/inspector/console/RuntimeReplFactory;

    .line 272
    return-object p0
.end method
