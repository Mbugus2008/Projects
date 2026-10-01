.class public final Lcom/trimline/metrocrew/DB_Impl;
.super Lcom/trimline/metrocrew/DB;
.source "DB_Impl.java"


# instance fields
.field private volatile _agent:Lcom/trimline/metrocrew/agent$dao;

.field private volatile _loan:Lcom/trimline/metrocrew/loan$dao;

.field private volatile _member:Lcom/trimline/metrocrew/Member$dao;

.field private volatile _paymentModes:Lcom/trimline/metrocrew/payment_modes$dao;

.field private volatile _theader:Lcom/trimline/metrocrew/theader$dao;

.field private volatile _transaction:Lcom/trimline/metrocrew/transaction$dao;

.field private volatile _types:Lcom/trimline/metrocrew/types$dao;

.field private volatile _vehicles:Lcom/trimline/metrocrew/Vehicles$dao;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Lcom/trimline/metrocrew/DB;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/trimline/metrocrew/DB_Impl;Landroidx/sqlite/SQLiteConnection;)V
    .locals 0
    .param p0, "x0"    # Lcom/trimline/metrocrew/DB_Impl;
    .param p1, "x1"    # Landroidx/sqlite/SQLiteConnection;

    .line 24
    invoke-virtual {p0, p1}, Lcom/trimline/metrocrew/DB_Impl;->internalInitInvalidationTracker(Landroidx/sqlite/SQLiteConnection;)V

    return-void
.end method


# virtual methods
.method public aDao()Lcom/trimline/metrocrew/agent$dao;
    .locals 1

    .line 450
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_agent:Lcom/trimline/metrocrew/agent$dao;

    if-eqz v0, :cond_0

    .line 451
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_agent:Lcom/trimline/metrocrew/agent$dao;

    return-object v0

    .line 453
    :cond_0
    monitor-enter p0

    .line 454
    :try_start_0
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_agent:Lcom/trimline/metrocrew/agent$dao;

    if-nez v0, :cond_1

    .line 455
    new-instance v0, Lcom/trimline/metrocrew/agent_dao_Impl;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/agent_dao_Impl;-><init>(Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_agent:Lcom/trimline/metrocrew/agent$dao;

    .line 457
    :cond_1
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_agent:Lcom/trimline/metrocrew/agent$dao;

    monitor-exit p0

    return-object v0

    .line 458
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public clearAllTables()V
    .locals 4

    .line 387
    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "Member"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const/4 v1, 0x1

    const-string v3, "agent"

    aput-object v3, v0, v1

    const/4 v1, 0x2

    const-string v3, "transaction"

    aput-object v3, v0, v1

    const/4 v1, 0x3

    const-string v3, "types"

    aput-object v3, v0, v1

    const/4 v1, 0x4

    const-string v3, "loan"

    aput-object v3, v0, v1

    const/4 v1, 0x5

    const-string v3, "theader"

    aput-object v3, v0, v1

    const/4 v1, 0x6

    const-string v3, "payment_modes"

    aput-object v3, v0, v1

    const/4 v1, 0x7

    const-string v3, "Vehicles"

    aput-object v3, v0, v1

    invoke-super {p0, v2, v0}, Lcom/trimline/metrocrew/DB;->performClear(Z[Ljava/lang/String;)V

    .line 388
    return-void
.end method

.method protected createInvalidationTracker()Landroidx/room/InvalidationTracker;
    .locals 6

    .line 380
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 381
    .local v0, "_shadowTablesMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 382
    .local v2, "_viewTables":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Set<Ljava/lang/String;>;>;"
    new-instance v3, Landroidx/room/InvalidationTracker;

    const/16 v4, 0x8

    new-array v4, v4, [Ljava/lang/String;

    const-string v5, "Member"

    aput-object v5, v4, v1

    const/4 v1, 0x1

    const-string v5, "agent"

    aput-object v5, v4, v1

    const/4 v1, 0x2

    const-string v5, "transaction"

    aput-object v5, v4, v1

    const/4 v1, 0x3

    const-string v5, "types"

    aput-object v5, v4, v1

    const/4 v1, 0x4

    const-string v5, "loan"

    aput-object v5, v4, v1

    const/4 v1, 0x5

    const-string v5, "theader"

    aput-object v5, v4, v1

    const/4 v1, 0x6

    const-string v5, "payment_modes"

    aput-object v5, v4, v1

    const/4 v1, 0x7

    const-string v5, "Vehicles"

    aput-object v5, v4, v1

    invoke-direct {v3, p0, v0, v2, v4}, Landroidx/room/InvalidationTracker;-><init>(Landroidx/room/RoomDatabase;Ljava/util/Map;Ljava/util/Map;[Ljava/lang/String;)V

    return-object v3
.end method

.method protected createOpenDelegate()Landroidx/room/RoomOpenDelegate;
    .locals 4

    .line 44
    new-instance v0, Lcom/trimline/metrocrew/DB_Impl$1;

    const-string v1, "b44933ff7a4b90d14e8dc7849dd3b2de"

    const-string v2, "d67e58aedadec55e35d82d0cbc653dee"

    const/4 v3, 0x2

    invoke-direct {v0, p0, v3, v1, v2}, Lcom/trimline/metrocrew/DB_Impl$1;-><init>(Lcom/trimline/metrocrew/DB_Impl;ILjava/lang/String;Ljava/lang/String;)V

    .line 374
    .local v0, "_openDelegate":Landroidx/room/RoomOpenDelegate;
    return-object v0
.end method

.method protected bridge synthetic createOpenDelegate()Landroidx/room/RoomOpenDelegateMarker;
    .locals 1

    .line 23
    invoke-virtual {p0}, Lcom/trimline/metrocrew/DB_Impl;->createOpenDelegate()Landroidx/room/RoomOpenDelegate;

    move-result-object v0

    return-object v0
.end method

.method public getAutoMigrations(Ljava/util/Map;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x10
        }
        names = {
            "autoMigrationSpecs"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "+",
            "Landroidx/room/migration/AutoMigrationSpec;",
            ">;",
            "Landroidx/room/migration/AutoMigrationSpec;",
            ">;)",
            "Ljava/util/List<",
            "Landroidx/room/migration/Migration;",
            ">;"
        }
    .end annotation

    .line 416
    .local p1, "autoMigrationSpecs":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<+Landroidx/room/migration/AutoMigrationSpec;>;Landroidx/room/migration/AutoMigrationSpec;>;"
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 417
    .local v0, "_autoMigrations":Ljava/util/List;, "Ljava/util/List<Landroidx/room/migration/Migration;>;"
    return-object v0
.end method

.method public getRequiredAutoMigrationSpecs()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Landroidx/room/migration/AutoMigrationSpec;",
            ">;>;"
        }
    .end annotation

    .line 408
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 409
    .local v0, "_autoMigrationSpecsSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Class<+Landroidx/room/migration/AutoMigrationSpec;>;>;"
    return-object v0
.end method

.method protected getRequiredTypeConverters()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/List<",
            "Ljava/lang/Class<",
            "*>;>;>;"
        }
    .end annotation

    .line 393
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 394
    .local v0, "_typeConvertersMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Class<*>;Ljava/util/List<Ljava/lang/Class<*>;>;>;"
    const-class v1, Lcom/trimline/metrocrew/Member$dao;

    invoke-static {}, Lcom/trimline/metrocrew/Member_dao_Impl;->getRequiredConverters()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 395
    const-class v1, Lcom/trimline/metrocrew/Vehicles$dao;

    invoke-static {}, Lcom/trimline/metrocrew/Vehicles_dao_Impl;->getRequiredConverters()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 396
    const-class v1, Lcom/trimline/metrocrew/agent$dao;

    invoke-static {}, Lcom/trimline/metrocrew/agent_dao_Impl;->getRequiredConverters()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 397
    const-class v1, Lcom/trimline/metrocrew/theader$dao;

    invoke-static {}, Lcom/trimline/metrocrew/theader_dao_Impl;->getRequiredConverters()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 398
    const-class v1, Lcom/trimline/metrocrew/transaction$dao;

    invoke-static {}, Lcom/trimline/metrocrew/transaction_dao_Impl;->getRequiredConverters()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 399
    const-class v1, Lcom/trimline/metrocrew/loan$dao;

    invoke-static {}, Lcom/trimline/metrocrew/loan_dao_Impl;->getRequiredConverters()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 400
    const-class v1, Lcom/trimline/metrocrew/types$dao;

    invoke-static {}, Lcom/trimline/metrocrew/types_dao_Impl;->getRequiredConverters()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 401
    const-class v1, Lcom/trimline/metrocrew/payment_modes$dao;

    invoke-static {}, Lcom/trimline/metrocrew/payment_modes_dao_Impl;->getRequiredConverters()Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 402
    return-object v0
.end method

.method public ldao()Lcom/trimline/metrocrew/loan$dao;
    .locals 1

    .line 492
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_loan:Lcom/trimline/metrocrew/loan$dao;

    if-eqz v0, :cond_0

    .line 493
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_loan:Lcom/trimline/metrocrew/loan$dao;

    return-object v0

    .line 495
    :cond_0
    monitor-enter p0

    .line 496
    :try_start_0
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_loan:Lcom/trimline/metrocrew/loan$dao;

    if-nez v0, :cond_1

    .line 497
    new-instance v0, Lcom/trimline/metrocrew/loan_dao_Impl;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/loan_dao_Impl;-><init>(Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_loan:Lcom/trimline/metrocrew/loan$dao;

    .line 499
    :cond_1
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_loan:Lcom/trimline/metrocrew/loan$dao;

    monitor-exit p0

    return-object v0

    .line 500
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public memberDao()Lcom/trimline/metrocrew/Member$dao;
    .locals 1

    .line 422
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_member:Lcom/trimline/metrocrew/Member$dao;

    if-eqz v0, :cond_0

    .line 423
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_member:Lcom/trimline/metrocrew/Member$dao;

    return-object v0

    .line 425
    :cond_0
    monitor-enter p0

    .line 426
    :try_start_0
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_member:Lcom/trimline/metrocrew/Member$dao;

    if-nez v0, :cond_1

    .line 427
    new-instance v0, Lcom/trimline/metrocrew/Member_dao_Impl;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/Member_dao_Impl;-><init>(Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_member:Lcom/trimline/metrocrew/Member$dao;

    .line 429
    :cond_1
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_member:Lcom/trimline/metrocrew/Member$dao;

    monitor-exit p0

    return-object v0

    .line 430
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public pdao()Lcom/trimline/metrocrew/payment_modes$dao;
    .locals 1

    .line 520
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_paymentModes:Lcom/trimline/metrocrew/payment_modes$dao;

    if-eqz v0, :cond_0

    .line 521
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_paymentModes:Lcom/trimline/metrocrew/payment_modes$dao;

    return-object v0

    .line 523
    :cond_0
    monitor-enter p0

    .line 524
    :try_start_0
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_paymentModes:Lcom/trimline/metrocrew/payment_modes$dao;

    if-nez v0, :cond_1

    .line 525
    new-instance v0, Lcom/trimline/metrocrew/payment_modes_dao_Impl;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/payment_modes_dao_Impl;-><init>(Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_paymentModes:Lcom/trimline/metrocrew/payment_modes$dao;

    .line 527
    :cond_1
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_paymentModes:Lcom/trimline/metrocrew/payment_modes$dao;

    monitor-exit p0

    return-object v0

    .line 528
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public tdao()Lcom/trimline/metrocrew/transaction$dao;
    .locals 1

    .line 478
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_transaction:Lcom/trimline/metrocrew/transaction$dao;

    if-eqz v0, :cond_0

    .line 479
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_transaction:Lcom/trimline/metrocrew/transaction$dao;

    return-object v0

    .line 481
    :cond_0
    monitor-enter p0

    .line 482
    :try_start_0
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_transaction:Lcom/trimline/metrocrew/transaction$dao;

    if-nez v0, :cond_1

    .line 483
    new-instance v0, Lcom/trimline/metrocrew/transaction_dao_Impl;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/transaction_dao_Impl;-><init>(Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_transaction:Lcom/trimline/metrocrew/transaction$dao;

    .line 485
    :cond_1
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_transaction:Lcom/trimline/metrocrew/transaction$dao;

    monitor-exit p0

    return-object v0

    .line 486
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public thDao()Lcom/trimline/metrocrew/theader$dao;
    .locals 1

    .line 464
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_theader:Lcom/trimline/metrocrew/theader$dao;

    if-eqz v0, :cond_0

    .line 465
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_theader:Lcom/trimline/metrocrew/theader$dao;

    return-object v0

    .line 467
    :cond_0
    monitor-enter p0

    .line 468
    :try_start_0
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_theader:Lcom/trimline/metrocrew/theader$dao;

    if-nez v0, :cond_1

    .line 469
    new-instance v0, Lcom/trimline/metrocrew/theader_dao_Impl;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/theader_dao_Impl;-><init>(Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_theader:Lcom/trimline/metrocrew/theader$dao;

    .line 471
    :cond_1
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_theader:Lcom/trimline/metrocrew/theader$dao;

    monitor-exit p0

    return-object v0

    .line 472
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public trandao()Lcom/trimline/metrocrew/types$dao;
    .locals 1

    .line 506
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_types:Lcom/trimline/metrocrew/types$dao;

    if-eqz v0, :cond_0

    .line 507
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_types:Lcom/trimline/metrocrew/types$dao;

    return-object v0

    .line 509
    :cond_0
    monitor-enter p0

    .line 510
    :try_start_0
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_types:Lcom/trimline/metrocrew/types$dao;

    if-nez v0, :cond_1

    .line 511
    new-instance v0, Lcom/trimline/metrocrew/types_dao_Impl;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/types_dao_Impl;-><init>(Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_types:Lcom/trimline/metrocrew/types$dao;

    .line 513
    :cond_1
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_types:Lcom/trimline/metrocrew/types$dao;

    monitor-exit p0

    return-object v0

    .line 514
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public vDao()Lcom/trimline/metrocrew/Vehicles$dao;
    .locals 1

    .line 436
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_vehicles:Lcom/trimline/metrocrew/Vehicles$dao;

    if-eqz v0, :cond_0

    .line 437
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_vehicles:Lcom/trimline/metrocrew/Vehicles$dao;

    return-object v0

    .line 439
    :cond_0
    monitor-enter p0

    .line 440
    :try_start_0
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_vehicles:Lcom/trimline/metrocrew/Vehicles$dao;

    if-nez v0, :cond_1

    .line 441
    new-instance v0, Lcom/trimline/metrocrew/Vehicles_dao_Impl;

    invoke-direct {v0, p0}, Lcom/trimline/metrocrew/Vehicles_dao_Impl;-><init>(Landroidx/room/RoomDatabase;)V

    iput-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_vehicles:Lcom/trimline/metrocrew/Vehicles$dao;

    .line 443
    :cond_1
    iget-object v0, p0, Lcom/trimline/metrocrew/DB_Impl;->_vehicles:Lcom/trimline/metrocrew/Vehicles$dao;

    monitor-exit p0

    return-object v0

    .line 444
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
