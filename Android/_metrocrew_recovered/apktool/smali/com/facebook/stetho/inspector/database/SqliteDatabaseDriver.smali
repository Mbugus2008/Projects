.class public Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;
.super Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2;
.source "SqliteDatabaseDriver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2<",
        "Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;",
        ">;"
    }
.end annotation


# static fields
.field private static final UNINTERESTING_FILENAME_SUFFIXES:[Ljava/lang/String;


# instance fields
.field private final mDatabaseConnectionProvider:Lcom/facebook/stetho/inspector/database/DatabaseConnectionProvider;

.field private final mDatabaseFilesProvider:Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 35
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "-journal"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "-shm"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "-uid"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "-wal"

    aput-object v2, v0, v1

    sput-object v0, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->UNINTERESTING_FILENAME_SUFFIXES:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 54
    new-instance v0, Lcom/facebook/stetho/inspector/database/DefaultDatabaseFilesProvider;

    invoke-direct {v0, p1}, Lcom/facebook/stetho/inspector/database/DefaultDatabaseFilesProvider;-><init>(Landroid/content/Context;)V

    new-instance v1, Lcom/facebook/stetho/inspector/database/DefaultDatabaseConnectionProvider;

    invoke-direct {v1}, Lcom/facebook/stetho/inspector/database/DefaultDatabaseConnectionProvider;-><init>()V

    invoke-direct {p0, p1, v0, v1}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;-><init>(Landroid/content/Context;Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;Lcom/facebook/stetho/inspector/database/DatabaseConnectionProvider;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "databaseFilesProvider"    # Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 67
    new-instance v0, Lcom/facebook/stetho/inspector/database/DefaultDatabaseConnectionProvider;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/database/DefaultDatabaseConnectionProvider;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;-><init>(Landroid/content/Context;Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;Lcom/facebook/stetho/inspector/database/DatabaseConnectionProvider;)V

    .line 71
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;Lcom/facebook/stetho/inspector/database/DatabaseConnectionProvider;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "databaseFilesProvider"    # Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;
    .param p3, "databaseConnectionProvider"    # Lcom/facebook/stetho/inspector/database/DatabaseConnectionProvider;

    .line 83
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2;-><init>(Landroid/content/Context;)V

    .line 84
    iput-object p2, p0, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->mDatabaseFilesProvider:Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;

    .line 85
    iput-object p3, p0, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->mDatabaseConnectionProvider:Lcom/facebook/stetho/inspector/database/DatabaseConnectionProvider;

    .line 86
    return-void
.end method

.method private executeInsert(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;)Ljava/lang/Object;
    .locals 4
    .param p1, "database"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/String;",
            "Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 199
    .local p3, "handler":Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;, "Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler<TT;>;"
    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 200
    .local v0, "statement":Landroid/database/sqlite/SQLiteStatement;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->executeInsert()J

    move-result-wide v1

    .line 201
    .local v1, "count":J
    invoke-interface {p3, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;->handleInsert(J)Ljava/lang/Object;

    move-result-object v3

    return-object v3
.end method

.method private executeRawQuery(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;)Ljava/lang/Object;
    .locals 1
    .param p1, "database"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/String;",
            "Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 220
    .local p3, "handler":Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;, "Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler<TT;>;"
    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 221
    invoke-interface {p3}, Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;->handleRawQuery()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private executeSelect(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;)Ljava/lang/Object;
    .locals 2
    .param p1, "database"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/String;",
            "Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 208
    .local p3, "handler":Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;, "Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler<TT;>;"
    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 210
    .local v0, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-interface {p3, v0}, Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;->handleSelect(Landroid/database/Cursor;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 212
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 210
    return-object v1

    .line 212
    :catchall_0
    move-exception v1

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 213
    throw v1
.end method

.method private executeUpdateDelete(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;)Ljava/lang/Object;
    .locals 3
    .param p1, "database"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/String;",
            "Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 190
    .local p3, "handler":Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;, "Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler<TT;>;"
    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->compileStatement(Ljava/lang/String;)Landroid/database/sqlite/SQLiteStatement;

    move-result-object v0

    .line 191
    .local v0, "statement":Landroid/database/sqlite/SQLiteStatement;
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteStatement;->executeUpdateDelete()I

    move-result v1

    .line 192
    .local v1, "count":I
    invoke-interface {p3, v1}, Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;->handleUpdateDelete(I)Ljava/lang/Object;

    move-result-object v2

    return-object v2
.end method

.method private static getFirstWord(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "s"    # Ljava/lang/String;

    .line 180
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 181
    const/16 v0, 0x20

    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 182
    .local v0, "firstSpace":I
    if-ltz v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, p0

    :goto_0
    return-object v1
.end method

.method private openDatabase(Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;)Landroid/database/sqlite/SQLiteDatabase;
    .locals 2
    .param p1, "databaseDesc"    # Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;
        }
    .end annotation

    .line 227
    invoke-static {p1}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    iget-object v0, p0, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->mDatabaseConnectionProvider:Lcom/facebook/stetho/inspector/database/DatabaseConnectionProvider;

    iget-object v1, p1, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;->file:Ljava/io/File;

    invoke-interface {v0, v1}, Lcom/facebook/stetho/inspector/database/DatabaseConnectionProvider;->openDatabase(Ljava/io/File;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method private static removeSuffix(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "suffixesToRemove"    # [Ljava/lang/String;

    .line 123
    array-length v0, p1

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    aget-object v3, p1, v2

    .line 124
    .local v3, "suffix":Ljava/lang/String;
    invoke-virtual {p0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 125
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v0, v2

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 123
    .end local v3    # "suffix":Ljava/lang/String;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 128
    :cond_1
    return-object p0
.end method

.method static tidyDatabaseList(Ljava/util/List;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .line 110
    .local p0, "databaseFiles":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 111
    .local v0, "originalAsSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/io/File;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 112
    .local v1, "tidiedList":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/File;

    .line 113
    .local v3, "databaseFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 114
    .local v4, "databaseFilename":Ljava/lang/String;
    sget-object v5, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->UNINTERESTING_FILENAME_SUFFIXES:[Ljava/lang/String;

    invoke-static {v4, v5}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->removeSuffix(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 115
    .local v5, "sansSuffix":Ljava/lang/String;
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 116
    :cond_0
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 118
    .end local v3    # "databaseFile":Ljava/io/File;
    .end local v4    # "databaseFilename":Ljava/lang/String;
    .end local v5    # "sansSuffix":Ljava/lang/String;
    :cond_1
    goto :goto_0

    .line 119
    :cond_2
    return-object v1
.end method


# virtual methods
.method public executeSQL(Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;)Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;
    .locals 3
    .param p1, "databaseDesc"    # Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;
    .param p2, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;",
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

    .line 156
    .local p3, "handler":Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;, "Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler<Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;>;"
    invoke-static {p2}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 157
    invoke-static {p3}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->openDatabase(Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 160
    .local v0, "database":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    invoke-static {p2}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->getFirstWord(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    .line 161
    .local v1, "firstWordUpperCase":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_0
    goto :goto_0

    :sswitch_0
    const-string v2, "DELETE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_1

    :sswitch_1
    const-string v2, "EXPLAIN"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x5

    goto :goto_1

    :sswitch_2
    const-string v2, "UPDATE"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    goto :goto_1

    :sswitch_3
    const-string v2, "SELECT"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x3

    goto :goto_1

    :sswitch_4
    const-string v2, "PRAGMA"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x4

    goto :goto_1

    :sswitch_5
    const-string v2, "INSERT"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x2

    goto :goto_1

    :goto_0
    const/4 v2, -0x1

    :goto_1
    packed-switch v2, :pswitch_data_0

    .line 172
    invoke-direct {p0, v0, p2, p3}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->executeRawQuery(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_2

    .line 170
    :pswitch_0
    invoke-direct {p0, v0, p2, p3}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->executeSelect(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 175
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 170
    return-object v2

    .line 166
    :pswitch_1
    :try_start_1
    invoke-direct {p0, v0, p2, p3}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->executeInsert(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 175
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 166
    return-object v2

    .line 164
    :pswitch_2
    :try_start_2
    invoke-direct {p0, v0, p2, p3}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->executeUpdateDelete(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 175
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 164
    return-object v2

    .line 172
    :goto_2
    :try_start_3
    check-cast v2, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 175
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 172
    return-object v2

    .line 175
    .end local v1    # "firstWordUpperCase":Ljava/lang/String;
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 176
    throw v1

    :sswitch_data_0
    .sparse-switch
        -0x7efc4947 -> :sswitch_5
        -0x72da26c4 -> :sswitch_4
        -0x6e6dd704 -> :sswitch_3
        -0x6a6cd337 -> :sswitch_2
        -0x233caf29 -> :sswitch_1
        0x77f979ab -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic executeSQL(Ljava/lang/Object;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;)Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;
        }
    .end annotation

    .line 32
    check-cast p1, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;

    invoke-virtual {p0, p1, p2, p3}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->executeSQL(Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;)Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;

    move-result-object p1

    return-object p1
.end method

.method public getDatabaseNames()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;",
            ">;"
        }
    .end annotation

    .line 90
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .local v0, "databases":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;>;"
    iget-object v1, p0, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->mDatabaseFilesProvider:Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;

    invoke-interface {v1}, Lcom/facebook/stetho/inspector/database/DatabaseFilesProvider;->getDatabaseFiles()Ljava/util/List;

    move-result-object v1

    .line 92
    .local v1, "potentialDatabaseFiles":Ljava/util/List;, "Ljava/util/List<Ljava/io/File;>;"
    invoke-static {v1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 93
    invoke-static {v1}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->tidyDatabaseList(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    .line 94
    .local v2, "tidiedList":Ljava/lang/Iterable;, "Ljava/lang/Iterable<Ljava/io/File;>;"
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/io/File;

    .line 95
    .local v4, "database":Ljava/io/File;
    new-instance v5, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;

    invoke-direct {v5, v4}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;-><init>(Ljava/io/File;)V

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 96
    .end local v4    # "database":Ljava/io/File;
    goto :goto_0

    .line 97
    :cond_0
    return-object v0
.end method

.method public getTableNames(Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;)Ljava/util/List;
    .locals 6
    .param p1, "databaseDesc"    # Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;
        }
    .end annotation

    .line 133
    invoke-direct {p0, p1}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->openDatabase(Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 135
    .local v0, "database":Landroid/database/sqlite/SQLiteDatabase;
    :try_start_0
    const-string v1, "SELECT name FROM sqlite_master WHERE type IN (?, ?)"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    const-string/jumbo v3, "table"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string/jumbo v3, "view"

    const/4 v5, 0x1

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 138
    .local v1, "cursor":Landroid/database/Cursor;
    :try_start_1
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 139
    .local v2, "tableNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 140
    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 142
    :cond_0
    nop

    .line 144
    :try_start_2
    invoke-interface {v1}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 147
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 142
    return-object v2

    .line 144
    .end local v2    # "tableNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v2

    :try_start_3
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    .line 145
    nop

    .end local v0    # "database":Landroid/database/sqlite/SQLiteDatabase;
    .end local p1    # "databaseDesc":Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 147
    .end local v1    # "cursor":Landroid/database/Cursor;
    .restart local v0    # "database":Landroid/database/sqlite/SQLiteDatabase;
    .restart local p1    # "databaseDesc":Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;
    :catchall_1
    move-exception v1

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 148
    throw v1
.end method

.method public bridge synthetic getTableNames(Ljava/lang/Object;)Ljava/util/List;
    .locals 0

    .line 32
    check-cast p1, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;

    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver;->getTableNames(Lcom/facebook/stetho/inspector/database/SqliteDatabaseDriver$SqliteDatabaseDescriptor;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method
