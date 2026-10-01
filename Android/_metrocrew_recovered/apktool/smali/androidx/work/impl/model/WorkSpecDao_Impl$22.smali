.class Landroidx/work/impl/model/WorkSpecDao_Impl$22;
.super Ljava/lang/Object;
.source "WorkSpecDao_Impl.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/work/impl/model/WorkSpecDao_Impl;->getWorkStatusPojoLiveDataForTag(Ljava/lang/String;)Landroidx/lifecycle/LiveData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/util/List<",
        "Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroidx/work/impl/model/WorkSpecDao_Impl;

.field final synthetic val$_statement:Landroidx/room/RoomSQLiteQuery;


# direct methods
.method constructor <init>(Landroidx/work/impl/model/WorkSpecDao_Impl;Landroidx/room/RoomSQLiteQuery;)V
    .locals 0
    .param p1, "this$0"    # Landroidx/work/impl/model/WorkSpecDao_Impl;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$_statement"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1859
    iput-object p1, p0, Landroidx/work/impl/model/WorkSpecDao_Impl$22;->this$0:Landroidx/work/impl/model/WorkSpecDao_Impl;

    iput-object p2, p0, Landroidx/work/impl/model/WorkSpecDao_Impl$22;->val$_statement:Landroidx/room/RoomSQLiteQuery;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1859
    invoke-virtual {p0}, Landroidx/work/impl/model/WorkSpecDao_Impl$22;->call()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/util/List;
    .locals 78
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1863
    move-object/from16 v1, p0

    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl$22;->this$0:Landroidx/work/impl/model/WorkSpecDao_Impl;

    invoke-static {v0}, Landroidx/work/impl/model/WorkSpecDao_Impl;->access$000(Landroidx/work/impl/model/WorkSpecDao_Impl;)Landroidx/room/RoomDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 1865
    :try_start_0
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl$22;->this$0:Landroidx/work/impl/model/WorkSpecDao_Impl;

    invoke-static {v0}, Landroidx/work/impl/model/WorkSpecDao_Impl;->access$000(Landroidx/work/impl/model/WorkSpecDao_Impl;)Landroidx/room/RoomDatabase;

    move-result-object v0

    iget-object v2, v1, Landroidx/work/impl/model/WorkSpecDao_Impl$22;->val$_statement:Landroidx/room/RoomSQLiteQuery;

    const/4 v3, 0x0

    const/4 v4, 0x1

    invoke-static {v0, v2, v4, v3}, Landroidx/room/util/DBUtil;->query(Landroidx/room/RoomDatabase;Landroidx/sqlite/db/SupportSQLiteQuery;ZLandroid/os/CancellationSignal;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-object v2, v0

    .line 1867
    .local v2, "_cursor":Landroid/database/Cursor;
    const/4 v0, 0x0

    .line 1868
    .local v0, "_cursorIndexOfId":I
    const/4 v3, 0x1

    .line 1869
    .local v3, "_cursorIndexOfState":I
    const/4 v5, 0x2

    .line 1870
    .local v5, "_cursorIndexOfOutput":I
    const/4 v6, 0x3

    .line 1871
    .local v6, "_cursorIndexOfRunAttemptCount":I
    const/4 v7, 0x4

    .line 1872
    .local v7, "_cursorIndexOfGeneration":I
    const/4 v8, 0x5

    .line 1873
    .local v8, "_cursorIndexOfRequiredNetworkType":I
    const/4 v9, 0x6

    .line 1874
    .local v9, "_cursorIndexOfRequiredNetworkRequestCompat":I
    const/4 v10, 0x7

    .line 1875
    .local v10, "_cursorIndexOfRequiresCharging":I
    const/16 v11, 0x8

    .line 1876
    .local v11, "_cursorIndexOfRequiresDeviceIdle":I
    const/16 v12, 0x9

    .line 1877
    .local v12, "_cursorIndexOfRequiresBatteryNotLow":I
    const/16 v13, 0xa

    .line 1878
    .local v13, "_cursorIndexOfRequiresStorageNotLow":I
    const/16 v14, 0xb

    .line 1879
    .local v14, "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    const/16 v15, 0xc

    .line 1880
    .local v15, "_cursorIndexOfContentTriggerMaxDelayMillis":I
    const/16 v16, 0xd

    .line 1881
    .local v16, "_cursorIndexOfContentUriTriggers":I
    const/16 v17, 0xe

    .line 1882
    .local v17, "_cursorIndexOfInitialDelay":I
    const/16 v18, 0xf

    .line 1883
    .local v18, "_cursorIndexOfIntervalDuration":I
    const/16 v19, 0x10

    .line 1884
    .local v19, "_cursorIndexOfFlexDuration":I
    const/16 v20, 0x11

    .line 1885
    .local v20, "_cursorIndexOfBackoffPolicy":I
    const/16 v21, 0x12

    .line 1886
    .local v21, "_cursorIndexOfBackoffDelayDuration":I
    const/16 v22, 0x13

    .line 1887
    .local v22, "_cursorIndexOfLastEnqueueTime":I
    const/16 v23, 0x14

    .line 1888
    .local v23, "_cursorIndexOfPeriodCount":I
    const/16 v24, 0x15

    .line 1889
    .local v24, "_cursorIndexOfNextScheduleTimeOverride":I
    const/16 v25, 0x16

    .line 1890
    .local v25, "_cursorIndexOfStopReason":I
    :try_start_1
    new-instance v26, Ljava/util/HashMap;

    invoke-direct/range {v26 .. v26}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v27, v26

    .line 1891
    .local v27, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    new-instance v26, Ljava/util/HashMap;

    invoke-direct/range {v26 .. v26}, Ljava/util/HashMap;-><init>()V

    move-object/from16 v28, v26

    .line 1892
    .local v28, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v26

    const/4 v4, 0x0

    if-eqz v26, :cond_2

    .line 1894
    invoke-interface {v2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v30, v26

    .line 1895
    .local v30, "_tmpKey":Ljava/lang/String;
    move-object/from16 v4, v27

    move/from16 v27, v0

    move-object/from16 v0, v30

    .end local v30    # "_tmpKey":Ljava/lang/String;
    .local v0, "_tmpKey":Ljava/lang/String;
    .local v4, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v27, "_cursorIndexOfId":I
    invoke-virtual {v4, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v30

    if-nez v30, :cond_0

    .line 1896
    move/from16 v30, v3

    .end local v3    # "_cursorIndexOfState":I
    .local v30, "_cursorIndexOfState":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v4, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 1895
    .end local v30    # "_cursorIndexOfState":I
    .restart local v3    # "_cursorIndexOfState":I
    :cond_0
    move/from16 v30, v3

    .line 1899
    .end local v3    # "_cursorIndexOfState":I
    .restart local v30    # "_cursorIndexOfState":I
    :goto_1
    const/4 v3, 0x0

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 1900
    .local v3, "_tmpKey_1":Ljava/lang/String;
    move-object/from16 v26, v0

    move-object/from16 v0, v28

    .end local v28    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .local v0, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .local v26, "_tmpKey":Ljava/lang/String;
    invoke-virtual {v0, v3}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v28

    if-nez v28, :cond_1

    .line 1901
    move/from16 v28, v5

    .end local v5    # "_cursorIndexOfOutput":I
    .local v28, "_cursorIndexOfOutput":I
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 1900
    .end local v28    # "_cursorIndexOfOutput":I
    .restart local v5    # "_cursorIndexOfOutput":I
    :cond_1
    move/from16 v28, v5

    .line 1903
    .end local v3    # "_tmpKey_1":Ljava/lang/String;
    .end local v5    # "_cursorIndexOfOutput":I
    .end local v26    # "_tmpKey":Ljava/lang/String;
    .restart local v28    # "_cursorIndexOfOutput":I
    :goto_2
    move/from16 v5, v28

    move/from16 v3, v30

    move-object/from16 v28, v0

    move/from16 v0, v27

    move-object/from16 v27, v4

    const/4 v4, 0x1

    goto :goto_0

    .line 1904
    .end local v4    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .end local v30    # "_cursorIndexOfState":I
    .local v0, "_cursorIndexOfId":I
    .local v3, "_cursorIndexOfState":I
    .restart local v5    # "_cursorIndexOfOutput":I
    .local v27, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v28, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    :cond_2
    move/from16 v30, v3

    move-object/from16 v4, v27

    move/from16 v27, v0

    move-object/from16 v0, v28

    move/from16 v28, v5

    .end local v3    # "_cursorIndexOfState":I
    .end local v5    # "_cursorIndexOfOutput":I
    .local v0, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .restart local v4    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v27, "_cursorIndexOfId":I
    .local v28, "_cursorIndexOfOutput":I
    .restart local v30    # "_cursorIndexOfState":I
    const/4 v3, -0x1

    invoke-interface {v2, v3}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 1905
    iget-object v3, v1, Landroidx/work/impl/model/WorkSpecDao_Impl$22;->this$0:Landroidx/work/impl/model/WorkSpecDao_Impl;

    invoke-static {v3, v4}, Landroidx/work/impl/model/WorkSpecDao_Impl;->access$100(Landroidx/work/impl/model/WorkSpecDao_Impl;Ljava/util/HashMap;)V

    .line 1906
    iget-object v3, v1, Landroidx/work/impl/model/WorkSpecDao_Impl$22;->this$0:Landroidx/work/impl/model/WorkSpecDao_Impl;

    invoke-static {v3, v0}, Landroidx/work/impl/model/WorkSpecDao_Impl;->access$200(Landroidx/work/impl/model/WorkSpecDao_Impl;Ljava/util/HashMap;)V

    .line 1907
    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v5

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 1908
    .local v3, "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;>;"
    :goto_3
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 1911
    const/4 v5, 0x0

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v31

    move-object/from16 v33, v31

    .line 1914
    .local v33, "_tmpId":Ljava/lang/String;
    const/4 v5, 0x1

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v29

    .line 1915
    .local v29, "_tmp":I
    sget-object v31, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static/range {v29 .. v29}, Landroidx/work/impl/model/WorkTypeConverters;->intToState(I)Landroidx/work/WorkInfo$State;

    move-result-object v34

    .line 1918
    .local v34, "_tmpState":Landroidx/work/WorkInfo$State;
    const/4 v5, 0x2

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v5

    .line 1919
    .local v5, "_tmp_1":[B
    invoke-static {v5}, Landroidx/work/Data;->fromByteArray([B)Landroidx/work/Data;

    move-result-object v35

    .line 1921
    .local v35, "_tmpOutput":Landroidx/work/Data;
    move-object/from16 v56, v5

    .end local v5    # "_tmp_1":[B
    .local v56, "_tmp_1":[B
    const/4 v5, 0x3

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v43

    .line 1923
    .local v43, "_tmpRunAttemptCount":I
    const/4 v5, 0x4

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v50

    .line 1925
    .local v50, "_tmpGeneration":I
    const/16 v5, 0xe

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v36

    .line 1927
    .local v36, "_tmpInitialDelay":J
    const/16 v5, 0xf

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v38

    .line 1929
    .local v38, "_tmpIntervalDuration":J
    const/16 v5, 0x10

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v40

    .line 1932
    .local v40, "_tmpFlexDuration":J
    const/16 v5, 0x11

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 1933
    .local v5, "_tmp_2":I
    sget-object v32, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v5}, Landroidx/work/impl/model/WorkTypeConverters;->intToBackoffPolicy(I)Landroidx/work/BackoffPolicy;

    move-result-object v44

    .line 1935
    .local v44, "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    move/from16 v57, v5

    .end local v5    # "_tmp_2":I
    .local v57, "_tmp_2":I
    const/16 v5, 0x12

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v45

    .line 1937
    .local v45, "_tmpBackoffDelayDuration":J
    const/16 v5, 0x13

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v47

    .line 1939
    .local v47, "_tmpLastEnqueueTime":J
    const/16 v5, 0x14

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v49

    .line 1941
    .local v49, "_tmpPeriodCount":I
    const/16 v5, 0x15

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v51

    .line 1943
    .local v51, "_tmpNextScheduleTimeOverride":J
    const/16 v5, 0x16

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v53

    .line 1947
    .local v53, "_tmpStopReason":I
    const/4 v5, 0x5

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 1948
    .local v5, "_tmp_3":I
    sget-object v32, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v5}, Landroidx/work/impl/model/WorkTypeConverters;->intToNetworkType(I)Landroidx/work/NetworkType;

    move-result-object v32

    move-object/from16 v60, v32

    .line 1951
    .local v60, "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    move/from16 v70, v5

    .end local v5    # "_tmp_3":I
    .local v70, "_tmp_3":I
    const/4 v5, 0x6

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v5

    .line 1952
    .local v5, "_tmp_4":[B
    sget-object v32, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v5}, Landroidx/work/impl/model/WorkTypeConverters;->toNetworkRequest$work_runtime_release([B)Landroidx/work/impl/utils/NetworkRequestCompat;

    move-result-object v59

    .line 1955
    .local v59, "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    move-object/from16 v71, v5

    .end local v5    # "_tmp_4":[B
    .local v71, "_tmp_4":[B
    const/4 v5, 0x7

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 1956
    .local v5, "_tmp_5":I
    if-eqz v5, :cond_3

    const/16 v61, 0x1

    goto :goto_4

    :cond_3
    const/16 v61, 0x0

    .line 1959
    .local v61, "_tmpRequiresCharging":Z
    :goto_4
    move/from16 v72, v5

    .end local v5    # "_tmp_5":I
    .local v72, "_tmp_5":I
    const/16 v5, 0x8

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 1960
    .local v5, "_tmp_6":I
    if-eqz v5, :cond_4

    const/16 v62, 0x1

    goto :goto_5

    :cond_4
    const/16 v62, 0x0

    .line 1963
    .local v62, "_tmpRequiresDeviceIdle":Z
    :goto_5
    move/from16 v73, v5

    .end local v5    # "_tmp_6":I
    .local v73, "_tmp_6":I
    const/16 v5, 0x9

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 1964
    .local v5, "_tmp_7":I
    if-eqz v5, :cond_5

    const/16 v63, 0x1

    goto :goto_6

    :cond_5
    const/16 v63, 0x0

    .line 1967
    .local v63, "_tmpRequiresBatteryNotLow":Z
    :goto_6
    move/from16 v74, v5

    .end local v5    # "_tmp_7":I
    .local v74, "_tmp_7":I
    const/16 v5, 0xa

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    .line 1968
    .local v5, "_tmp_8":I
    if-eqz v5, :cond_6

    const/16 v64, 0x1

    goto :goto_7

    :cond_6
    const/16 v64, 0x0

    .line 1970
    .local v64, "_tmpRequiresStorageNotLow":Z
    :goto_7
    move/from16 v75, v5

    .end local v5    # "_tmp_8":I
    .local v75, "_tmp_8":I
    const/16 v5, 0xb

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v65

    .line 1972
    .local v65, "_tmpContentTriggerUpdateDelayMillis":J
    const/16 v5, 0xc

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v67

    .line 1975
    .local v67, "_tmpContentTriggerMaxDelayMillis":J
    const/16 v5, 0xd

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v5

    .line 1976
    .local v5, "_tmp_9":[B
    sget-object v32, Landroidx/work/impl/model/WorkTypeConverters;->INSTANCE:Landroidx/work/impl/model/WorkTypeConverters;

    invoke-static {v5}, Landroidx/work/impl/model/WorkTypeConverters;->byteArrayToSetOfTriggers([B)Ljava/util/Set;

    move-result-object v69

    .line 1977
    .local v69, "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    new-instance v58, Landroidx/work/Constraints;

    invoke-direct/range {v58 .. v69}, Landroidx/work/Constraints;-><init>(Landroidx/work/impl/utils/NetworkRequestCompat;Landroidx/work/NetworkType;ZZZZJJLjava/util/Set;)V

    move-object/from16 v42, v58

    .line 1980
    .local v42, "_tmpConstraints":Landroidx/work/Constraints;
    move-object/from16 v58, v5

    const/4 v5, 0x0

    .end local v5    # "_tmp_9":[B
    .local v58, "_tmp_9":[B
    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v32

    move-object/from16 v5, v32

    .line 1981
    .local v5, "_tmpKey_2":Ljava/lang/String;
    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    move-object/from16 v54, v32

    check-cast v54, Ljava/util/ArrayList;

    .line 1984
    .local v54, "_tmpTagsCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v76, v4

    const/4 v4, 0x0

    .end local v4    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v76, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    invoke-interface {v2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v77, v26

    .line 1985
    .local v77, "_tmpKey_3":Ljava/lang/String;
    move-object/from16 v4, v77

    .end local v77    # "_tmpKey_3":Ljava/lang/String;
    .local v4, "_tmpKey_3":Ljava/lang/String;
    invoke-virtual {v0, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v32

    move-object/from16 v55, v32

    check-cast v55, Ljava/util/ArrayList;

    .line 1986
    .local v55, "_tmpProgressCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/work/Data;>;"
    new-instance v32, Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;

    invoke-direct/range {v32 .. v55}, Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;-><init>(Ljava/lang/String;Landroidx/work/WorkInfo$State;Landroidx/work/Data;JJJLandroidx/work/Constraints;ILandroidx/work/BackoffPolicy;JJIIJILjava/util/List;Ljava/util/List;)V

    move-object/from16 v77, v32

    .line 1987
    .local v77, "_item":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    move-object/from16 v32, v0

    move-object/from16 v0, v77

    .end local v77    # "_item":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    .local v0, "_item":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    .local v32, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1988
    move-object/from16 v0, v32

    move-object/from16 v4, v76

    .end local v0    # "_item":Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;
    .end local v4    # "_tmpKey_3":Ljava/lang/String;
    .end local v5    # "_tmpKey_2":Ljava/lang/String;
    .end local v29    # "_tmp":I
    .end local v33    # "_tmpId":Ljava/lang/String;
    .end local v34    # "_tmpState":Landroidx/work/WorkInfo$State;
    .end local v35    # "_tmpOutput":Landroidx/work/Data;
    .end local v36    # "_tmpInitialDelay":J
    .end local v38    # "_tmpIntervalDuration":J
    .end local v40    # "_tmpFlexDuration":J
    .end local v42    # "_tmpConstraints":Landroidx/work/Constraints;
    .end local v43    # "_tmpRunAttemptCount":I
    .end local v44    # "_tmpBackoffPolicy":Landroidx/work/BackoffPolicy;
    .end local v45    # "_tmpBackoffDelayDuration":J
    .end local v47    # "_tmpLastEnqueueTime":J
    .end local v49    # "_tmpPeriodCount":I
    .end local v50    # "_tmpGeneration":I
    .end local v51    # "_tmpNextScheduleTimeOverride":J
    .end local v53    # "_tmpStopReason":I
    .end local v54    # "_tmpTagsCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v55    # "_tmpProgressCollection":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroidx/work/Data;>;"
    .end local v56    # "_tmp_1":[B
    .end local v57    # "_tmp_2":I
    .end local v58    # "_tmp_9":[B
    .end local v59    # "_tmpRequiredNetworkRequestCompat":Landroidx/work/impl/utils/NetworkRequestCompat;
    .end local v60    # "_tmpRequiredNetworkType":Landroidx/work/NetworkType;
    .end local v61    # "_tmpRequiresCharging":Z
    .end local v62    # "_tmpRequiresDeviceIdle":Z
    .end local v63    # "_tmpRequiresBatteryNotLow":Z
    .end local v64    # "_tmpRequiresStorageNotLow":Z
    .end local v65    # "_tmpContentTriggerUpdateDelayMillis":J
    .end local v67    # "_tmpContentTriggerMaxDelayMillis":J
    .end local v69    # "_tmpContentUriTriggers":Ljava/util/Set;, "Ljava/util/Set<Landroidx/work/Constraints$ContentUriTrigger;>;"
    .end local v70    # "_tmp_3":I
    .end local v71    # "_tmp_4":[B
    .end local v72    # "_tmp_5":I
    .end local v73    # "_tmp_6":I
    .end local v74    # "_tmp_7":I
    .end local v75    # "_tmp_8":I
    goto/16 :goto_3

    .line 1989
    .end local v32    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .end local v76    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .local v0, "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .local v4, "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    :cond_7
    move-object/from16 v32, v0

    move-object/from16 v76, v4

    .end local v0    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .end local v4    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .restart local v32    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .restart local v76    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl$22;->this$0:Landroidx/work/impl/model/WorkSpecDao_Impl;

    invoke-static {v0}, Landroidx/work/impl/model/WorkSpecDao_Impl;->access$000(Landroidx/work/impl/model/WorkSpecDao_Impl;)Landroidx/room/RoomDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1990
    nop

    .line 1992
    :try_start_2
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1995
    iget-object v0, v1, Landroidx/work/impl/model/WorkSpecDao_Impl$22;->this$0:Landroidx/work/impl/model/WorkSpecDao_Impl;

    invoke-static {v0}, Landroidx/work/impl/model/WorkSpecDao_Impl;->access$000(Landroidx/work/impl/model/WorkSpecDao_Impl;)Landroidx/room/RoomDatabase;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 1990
    return-object v3

    .line 1992
    .end local v3    # "_result":Ljava/util/List;, "Ljava/util/List<Landroidx/work/impl/model/WorkSpec$WorkInfoPojo;>;"
    .end local v6    # "_cursorIndexOfRunAttemptCount":I
    .end local v7    # "_cursorIndexOfGeneration":I
    .end local v8    # "_cursorIndexOfRequiredNetworkType":I
    .end local v9    # "_cursorIndexOfRequiredNetworkRequestCompat":I
    .end local v10    # "_cursorIndexOfRequiresCharging":I
    .end local v11    # "_cursorIndexOfRequiresDeviceIdle":I
    .end local v12    # "_cursorIndexOfRequiresBatteryNotLow":I
    .end local v13    # "_cursorIndexOfRequiresStorageNotLow":I
    .end local v14    # "_cursorIndexOfContentTriggerUpdateDelayMillis":I
    .end local v15    # "_cursorIndexOfContentTriggerMaxDelayMillis":I
    .end local v16    # "_cursorIndexOfContentUriTriggers":I
    .end local v17    # "_cursorIndexOfInitialDelay":I
    .end local v18    # "_cursorIndexOfIntervalDuration":I
    .end local v19    # "_cursorIndexOfFlexDuration":I
    .end local v20    # "_cursorIndexOfBackoffPolicy":I
    .end local v21    # "_cursorIndexOfBackoffDelayDuration":I
    .end local v22    # "_cursorIndexOfLastEnqueueTime":I
    .end local v23    # "_cursorIndexOfPeriodCount":I
    .end local v24    # "_cursorIndexOfNextScheduleTimeOverride":I
    .end local v25    # "_cursorIndexOfStopReason":I
    .end local v27    # "_cursorIndexOfId":I
    .end local v28    # "_cursorIndexOfOutput":I
    .end local v30    # "_cursorIndexOfState":I
    .end local v32    # "_collectionProgress":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Landroidx/work/Data;>;>;"
    .end local v76    # "_collectionTags":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    :catchall_0
    move-exception v0

    :try_start_3
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    .line 1993
    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1995
    .end local v2    # "_cursor":Landroid/database/Cursor;
    :catchall_1
    move-exception v0

    iget-object v2, v1, Landroidx/work/impl/model/WorkSpecDao_Impl$22;->this$0:Landroidx/work/impl/model/WorkSpecDao_Impl;

    invoke-static {v2}, Landroidx/work/impl/model/WorkSpecDao_Impl;->access$000(Landroidx/work/impl/model/WorkSpecDao_Impl;)Landroidx/room/RoomDatabase;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 1996
    throw v0
.end method

.method protected finalize()V
    .locals 1

    .line 2001
    iget-object v0, p0, Landroidx/work/impl/model/WorkSpecDao_Impl$22;->val$_statement:Landroidx/room/RoomSQLiteQuery;

    invoke-virtual {v0}, Landroidx/room/RoomSQLiteQuery;->release()V

    .line 2002
    return-void
.end method
