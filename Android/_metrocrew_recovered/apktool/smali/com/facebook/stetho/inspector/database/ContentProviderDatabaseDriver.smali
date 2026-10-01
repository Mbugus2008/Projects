.class public Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver;
.super Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2;
.source "ContentProviderDatabaseDriver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver$ContentProviderDatabaseDescriptor;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2<",
        "Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver$ContentProviderDatabaseDescriptor;",
        ">;"
    }
.end annotation


# static fields
.field private static final sDatabaseName:Ljava/lang/String; = "content-providers"


# instance fields
.field private final mContentProviderSchemas:[Lcom/facebook/stetho/inspector/database/ContentProviderSchema;

.field private mTableNames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public varargs constructor <init>(Landroid/content/Context;[Lcom/facebook/stetho/inspector/database/ContentProviderSchema;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "contentProviderSchemas"    # [Lcom/facebook/stetho/inspector/database/ContentProviderSchema;

    .line 37
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2;-><init>(Landroid/content/Context;)V

    .line 38
    iput-object p2, p0, Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver;->mContentProviderSchemas:[Lcom/facebook/stetho/inspector/database/ContentProviderSchema;

    .line 39
    return-void
.end method

.method private fetchTableName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "query"    # Ljava/lang/String;

    .line 89
    iget-object v0, p0, Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver;->mTableNames:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 90
    .local v1, "tableName":Ljava/lang/String;
    invoke-virtual {p1, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 91
    return-object v1

    .line 93
    .end local v1    # "tableName":Ljava/lang/String;
    :cond_0
    goto :goto_0

    .line 94
    :cond_1
    const-string v0, ""

    return-object v0
.end method


# virtual methods
.method public executeSQL(Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver$ContentProviderDatabaseDescriptor;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;)Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;
    .locals 10
    .param p1, "databaseDesc"    # Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver$ContentProviderDatabaseDescriptor;
    .param p2, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver$ContentProviderDatabaseDescriptor;",
            "Ljava/lang/String;",
            "Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler<",
            "Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;",
            ">;)",
            "Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;
        }
    .end annotation

    .line 64
    .local p3, "handler":Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;, "Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler<Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;>;"
    invoke-direct {p0, p2}, Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver;->fetchTableName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 67
    .local v1, "tableName":Ljava/lang/String;
    iget-object v0, p0, Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver;->mTableNames:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v2

    .line 68
    .local v2, "index":I
    iget-object v0, p0, Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver;->mContentProviderSchemas:[Lcom/facebook/stetho/inspector/database/ContentProviderSchema;

    aget-object v3, v0, v2

    .line 71
    .local v3, "contentProviderSchema":Lcom/facebook/stetho/inspector/database/ContentProviderSchema;
    iget-object v0, p0, Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    .line 72
    .local v4, "contentResolver":Landroid/content/ContentResolver;
    nop

    .line 73
    invoke-virtual {v3}, Lcom/facebook/stetho/inspector/database/ContentProviderSchema;->getUri()Landroid/net/Uri;

    move-result-object v5

    .line 74
    invoke-virtual {v3}, Lcom/facebook/stetho/inspector/database/ContentProviderSchema;->getProjection()[Ljava/lang/String;

    move-result-object v6

    .line 72
    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 79
    .local v5, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-interface {p3, v5}, Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;->handleSelect(Landroid/database/Cursor;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 81
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 79
    return-object v0

    .line 81
    :catchall_0
    move-exception v0

    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    .line 82
    throw v0
.end method

.method public bridge synthetic executeSQL(Ljava/lang/Object;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;)Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;
        }
    .end annotation

    .line 25
    check-cast p1, Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver$ContentProviderDatabaseDescriptor;

    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver;->executeSQL(Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver$ContentProviderDatabaseDescriptor;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;)Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;

    move-result-object p1

    return-object p1
.end method

.method public getDatabaseNames()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver$ContentProviderDatabaseDescriptor;",
            ">;"
        }
    .end annotation

    .line 43
    new-instance v0, Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver$ContentProviderDatabaseDescriptor;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver$ContentProviderDatabaseDescriptor;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getTableNames(Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver$ContentProviderDatabaseDescriptor;)Ljava/util/List;
    .locals 6
    .param p1, "databaseDesc"    # Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver$ContentProviderDatabaseDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver$ContentProviderDatabaseDescriptor;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 48
    iget-object v0, p0, Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver;->mTableNames:Ljava/util/List;

    if-nez v0, :cond_0

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver;->mTableNames:Ljava/util/List;

    .line 50
    iget-object v0, p0, Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver;->mContentProviderSchemas:[Lcom/facebook/stetho/inspector/database/ContentProviderSchema;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, v0, v2

    .line 51
    .local v3, "schema":Lcom/facebook/stetho/inspector/database/ContentProviderSchema;
    iget-object v4, p0, Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver;->mTableNames:Ljava/util/List;

    invoke-virtual {v3}, Lcom/facebook/stetho/inspector/database/ContentProviderSchema;->getTableName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 50
    .end local v3    # "schema":Lcom/facebook/stetho/inspector/database/ContentProviderSchema;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 54
    :cond_0
    iget-object v0, p0, Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver;->mTableNames:Ljava/util/List;

    return-object v0
.end method

.method public bridge synthetic getTableNames(Ljava/lang/Object;)Ljava/util/List;
    .locals 0

    .line 25
    check-cast p1, Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver$ContentProviderDatabaseDescriptor;

    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver;->getTableNames(Lcom/facebook/stetho/inspector/database/ContentProviderDatabaseDriver$ContentProviderDatabaseDescriptor;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method
