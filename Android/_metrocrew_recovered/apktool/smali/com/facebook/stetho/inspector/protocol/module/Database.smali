.class public Lcom/facebook/stetho/inspector/protocol/module/Database;
.super Ljava/lang/Object;
.source "Database.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsDomain;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDriver;,
        Lcom/facebook/stetho/inspector/protocol/module/Database$Error;,
        Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseObject;,
        Lcom/facebook/stetho/inspector/protocol/module/Database$AddDatabaseEvent;,
        Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;,
        Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLRequest;,
        Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesResponse;,
        Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesRequest;,
        Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDescriptorHolder;,
        Lcom/facebook/stetho/inspector/protocol/module/Database$DatabasePeerRegistrationListener;
    }
.end annotation


# static fields
.field private static final MAX_BLOB_LENGTH:I = 0x200

.field private static final MAX_EXECUTE_RESULTS:I = 0xfa

.field private static final UNKNOWN_BLOB_LABEL:Ljava/lang/String; = "{blob}"


# instance fields
.field private final mChromePeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

.field private mDatabaseDrivers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2;",
            ">;"
        }
    .end annotation
.end field

.field private final mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

.field private final mPeerListener:Lcom/facebook/stetho/inspector/protocol/module/Database$DatabasePeerRegistrationListener;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mDatabaseDrivers:Ljava/util/List;

    .line 72
    new-instance v0, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mChromePeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    .line 73
    new-instance v0, Lcom/facebook/stetho/inspector/protocol/module/Database$DatabasePeerRegistrationListener;

    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mDatabaseDrivers:Ljava/util/List;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Database$DatabasePeerRegistrationListener;-><init>(Ljava/util/List;Lcom/facebook/stetho/inspector/protocol/module/Database$1;)V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mPeerListener:Lcom/facebook/stetho/inspector/protocol/module/Database$DatabasePeerRegistrationListener;

    .line 74
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mChromePeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mPeerListener:Lcom/facebook/stetho/inspector/protocol/module/Database$DatabasePeerRegistrationListener;

    invoke-virtual {v0, v1}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;->setListener(Lcom/facebook/stetho/inspector/helper/PeerRegistrationListener;)V

    .line 75
    new-instance v0, Lcom/facebook/stetho/json/ObjectMapper;

    invoke-direct {v0}, Lcom/facebook/stetho/json/ObjectMapper;-><init>()V

    iput-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    .line 76
    return-void
.end method

.method static synthetic access$200(Landroid/database/Cursor;I)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Landroid/database/Cursor;
    .param p1, "x1"    # I

    .line 40
    invoke-static {p0, p1}, Lcom/facebook/stetho/inspector/protocol/module/Database;->flattenRows(Landroid/database/Cursor;I)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method private static blobToString([B)Ljava/lang/String;
    .locals 2
    .param p0, "blob"    # [B

    .line 218
    array-length v0, p0

    const/16 v1, 0x200

    if-gt v0, v1, :cond_0

    .line 219
    invoke-static {p0}, Lcom/facebook/stetho/inspector/protocol/module/Database;->fastIsAscii([B)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 221
    :try_start_0
    new-instance v0, Ljava/lang/String;

    const-string v1, "US-ASCII"

    invoke-direct {v0, p0, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 222
    :catch_0
    move-exception v0

    .line 227
    :cond_0
    const-string/jumbo v0, "{blob}"

    return-object v0
.end method

.method private static fastIsAscii([B)Z
    .locals 5
    .param p0, "blob"    # [B

    .line 231
    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    aget-byte v3, p0, v2

    .line 232
    .local v3, "b":B
    and-int/lit8 v4, v3, -0x80

    if-eqz v4, :cond_0

    .line 233
    return v1

    .line 231
    .end local v3    # "b":B
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 236
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method private static flattenRows(Landroid/database/Cursor;I)Ljava/util/ArrayList;
    .locals 6
    .param p0, "cursor"    # Landroid/database/Cursor;
    .param p1, "limit"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "I)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 184
    if-ltz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/facebook/stetho/common/Util;->throwIfNot(Z)V

    .line 185
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 186
    .local v0, "flatList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-interface {p0}, Landroid/database/Cursor;->getColumnCount()I

    move-result v1

    .line 187
    .local v1, "numColumns":I
    const/4 v2, 0x0

    .local v2, "row":I
    :goto_1
    if-ge v2, p1, :cond_2

    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 188
    const/4 v3, 0x0

    .local v3, "column":I
    :goto_2
    if-ge v3, v1, :cond_1

    .line 189
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getType(I)I

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 204
    :pswitch_0
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 200
    :pswitch_1
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v4

    invoke-static {v4}, Lcom/facebook/stetho/inspector/protocol/module/Database;->blobToString([B)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 201
    goto :goto_3

    .line 197
    :pswitch_2
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(D)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 198
    goto :goto_3

    .line 194
    :pswitch_3
    invoke-interface {p0, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 195
    goto :goto_3

    .line 191
    :pswitch_4
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 192
    nop

    .line 188
    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 187
    .end local v3    # "column":I
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 209
    .end local v2    # "row":I
    :cond_2
    invoke-interface {p0}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v2

    if-nez v2, :cond_3

    .line 210
    const/4 v2, 0x0

    .local v2, "column":I
    :goto_4
    if-ge v2, v1, :cond_3

    .line 211
    const-string/jumbo v3, "{truncated}"

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 210
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 214
    .end local v2    # "column":I
    :cond_3
    return-object v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public add(Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2;)V
    .locals 1
    .param p1, "databaseDriver"    # Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2;

    .line 79
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mDatabaseDrivers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    return-void
.end method

.method public disable(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 89
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mChromePeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;->removePeer(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;)V

    .line 90
    return-void
.end method

.method public enable(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 84
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mChromePeerManager:Lcom/facebook/stetho/inspector/helper/ChromePeerManager;

    invoke-virtual {v0, p1}, Lcom/facebook/stetho/inspector/helper/ChromePeerManager;->addPeer(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;)Z

    .line 85
    return-void
.end method

.method public executeSQL(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcResult;
    .locals 6
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .line 117
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v1, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLRequest;

    invoke-virtual {v0, p2, v1}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLRequest;

    .line 120
    .local v0, "request":Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLRequest;
    iget-object v1, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mPeerListener:Lcom/facebook/stetho/inspector/protocol/module/Database$DatabasePeerRegistrationListener;

    iget-object v2, v0, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLRequest;->databaseId:Ljava/lang/String;

    .line 121
    invoke-virtual {v1, v2}, Lcom/facebook/stetho/inspector/protocol/module/Database$DatabasePeerRegistrationListener;->getDatabaseDescriptorHolder(Ljava/lang/String;)Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDescriptorHolder;

    move-result-object v1

    .line 124
    .local v1, "holder":Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDescriptorHolder;
    :try_start_0
    iget-object v2, v1, Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDescriptorHolder;->driver:Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2;

    iget-object v3, v1, Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDescriptorHolder;->descriptor:Lcom/facebook/stetho/inspector/protocol/module/DatabaseDescriptor;

    iget-object v4, v0, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLRequest;->query:Ljava/lang/String;

    new-instance v5, Lcom/facebook/stetho/inspector/protocol/module/Database$1;

    invoke-direct {v5, p0}, Lcom/facebook/stetho/inspector/protocol/module/Database$1;-><init>(Lcom/facebook/stetho/inspector/protocol/module/Database;)V

    invoke-virtual {v2, v3, v4, v5}, Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2;->executeSQL(Ljava/lang/Object;Ljava/lang/String;Lcom/facebook/stetho/inspector/protocol/module/BaseDatabaseDriver$ExecuteResultHandler;)Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 162
    :catch_0
    move-exception v2

    .line 163
    .local v2, "e":Ljava/lang/RuntimeException;
    iget-object v3, v0, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLRequest;->query:Ljava/lang/String;

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "Exception executing: %s"

    invoke-static {v2, v4, v3}, Lcom/facebook/stetho/common/LogUtil;->e(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 165
    new-instance v3, Lcom/facebook/stetho/inspector/protocol/module/Database$Error;

    invoke-direct {v3}, Lcom/facebook/stetho/inspector/protocol/module/Database$Error;-><init>()V

    .line 166
    .local v3, "error":Lcom/facebook/stetho/inspector/protocol/module/Database$Error;
    const/4 v4, 0x0

    iput v4, v3, Lcom/facebook/stetho/inspector/protocol/module/Database$Error;->code:I

    .line 167
    invoke-virtual {v2}, Ljava/lang/RuntimeException;->getMessage()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v3, Lcom/facebook/stetho/inspector/protocol/module/Database$Error;->message:Ljava/lang/String;

    .line 168
    new-instance v4, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;

    invoke-direct {v4}, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;-><init>()V

    .line 169
    .local v4, "response":Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;
    iput-object v3, v4, Lcom/facebook/stetho/inspector/protocol/module/Database$ExecuteSQLResponse;->sqlError:Lcom/facebook/stetho/inspector/protocol/module/Database$Error;

    .line 170
    return-object v4
.end method

.method public getDatabaseTableNames(Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;Lorg/json/JSONObject;)Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcResult;
    .locals 9
    .param p1, "peer"    # Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcPeer;
    .param p2, "params"    # Lorg/json/JSONObject;
    .annotation runtime Lcom/facebook/stetho/inspector/protocol/ChromeDevtoolsMethod;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;
        }
    .end annotation

    .line 95
    iget-object v0, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mObjectMapper:Lcom/facebook/stetho/json/ObjectMapper;

    const-class v1, Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesRequest;

    invoke-virtual {v0, p2, v1}, Lcom/facebook/stetho/json/ObjectMapper;->convertValue(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesRequest;

    .line 98
    .local v0, "request":Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesRequest;
    iget-object v1, v0, Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesRequest;->databaseId:Ljava/lang/String;

    .line 99
    .local v1, "databaseId":Ljava/lang/String;
    iget-object v2, p0, Lcom/facebook/stetho/inspector/protocol/module/Database;->mPeerListener:Lcom/facebook/stetho/inspector/protocol/module/Database$DatabasePeerRegistrationListener;

    .line 100
    invoke-virtual {v2, v1}, Lcom/facebook/stetho/inspector/protocol/module/Database$DatabasePeerRegistrationListener;->getDatabaseDescriptorHolder(Ljava/lang/String;)Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDescriptorHolder;

    move-result-object v2

    .line 103
    .local v2, "holder":Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDescriptorHolder;
    const/4 v3, 0x0

    :try_start_0
    new-instance v4, Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesResponse;

    invoke-direct {v4, v3}, Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesResponse;-><init>(Lcom/facebook/stetho/inspector/protocol/module/Database$1;)V

    .line 104
    .local v4, "response":Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesResponse;
    iget-object v5, v2, Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDescriptorHolder;->driver:Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2;

    iget-object v6, v2, Lcom/facebook/stetho/inspector/protocol/module/Database$DatabaseDescriptorHolder;->descriptor:Lcom/facebook/stetho/inspector/protocol/module/DatabaseDescriptor;

    invoke-virtual {v5, v6}, Lcom/facebook/stetho/inspector/protocol/module/DatabaseDriver2;->getTableNames(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v5

    iput-object v5, v4, Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesResponse;->tableNames:Ljava/util/List;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    return-object v4

    .line 106
    .end local v4    # "response":Lcom/facebook/stetho/inspector/protocol/module/Database$GetDatabaseTableNamesResponse;
    :catch_0
    move-exception v4

    .line 107
    .local v4, "e":Landroid/database/sqlite/SQLiteException;
    new-instance v5, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;

    new-instance v6, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;

    sget-object v7, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;->INVALID_REQUEST:Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;

    .line 110
    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteException;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v6, v7, v8, v3}, Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;-><init>(Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError$ErrorCode;Ljava/lang/String;Lorg/json/JSONObject;)V

    invoke-direct {v5, v6}, Lcom/facebook/stetho/inspector/jsonrpc/JsonRpcException;-><init>(Lcom/facebook/stetho/inspector/jsonrpc/protocol/JsonRpcError;)V

    throw v5
.end method
