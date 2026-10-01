package androidx.room;

import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.room.concurrent.CloseBarrier;
import androidx.sqlite.SQLite;
import androidx.sqlite.SQLiteConnection;
import androidx.sqlite.SQLiteStatement;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.TuplesKt;
import kotlin.Unit;
import kotlin.collections.MapsKt;
import kotlin.collections.SetsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.Boxing;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jdk7.AutoCloseableKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineName;
import kotlinx.coroutines.flow.Flow;
import kotlinx.coroutines.flow.FlowKt;

/* JADX INFO: compiled from: InvalidationTracker.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0082\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\"\n\u0000\n\u0002\u0010\u0011\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\u0010\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0015\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\u0012\b\u0000\u0018\u0000 O2\u00020\u0001:\u0001OBo\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0012\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00060\u0005\u0012\u0018\u0010\u0007\u001a\u0014\u0012\u0004\u0012\u00020\u0006\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00060\b0\u0005\u0012\u000e\u0010\t\u001a\n\u0012\u0006\b\u0001\u0012\u00020\u00060\n\u0012\u0006\u0010\u000b\u001a\u00020\f\u0012\u0018\u0010\r\u001a\u0014\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u000f0\b\u0012\u0004\u0012\u00020\u00100\u000e¢\u0006\u0004\b\u0011\u0010\u0012J\u000e\u0010$\u001a\u00020\u00102\u0006\u0010%\u001a\u00020&J9\u0010'\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00060\b0(2\f\u0010)\u001a\b\u0012\u0004\u0012\u00020\u00060\n2\u0006\u0010*\u001a\u00020+2\u0006\u0010,\u001a\u00020\fH\u0000¢\u0006\u0004\b-\u0010.J1\u0010/\u001a\u0014\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00060\n\u0012\u0004\u0012\u00020+002\u000e\u00101\u001a\n\u0012\u0006\b\u0001\u0012\u00020\u00060\nH\u0000¢\u0006\u0004\b2\u00103J#\u00104\u001a\b\u0012\u0004\u0012\u00020\u00060\n2\u000e\u00101\u001a\n\u0012\u0006\b\u0001\u0012\u00020\u00060\nH\u0002¢\u0006\u0002\u00105J\u0015\u00106\u001a\u00020\f2\u0006\u0010*\u001a\u00020+H\u0000¢\u0006\u0002\b7J\u0015\u00108\u001a\u00020\f2\u0006\u0010*\u001a\u00020+H\u0000¢\u0006\u0002\b9J\u0010\u0010:\u001a\u00020\u0010H\u0080@¢\u0006\u0004\b;\u0010<J\u001e\u0010=\u001a\u00020\u00102\u0006\u0010%\u001a\u00020>2\u0006\u0010?\u001a\u00020\u000fH\u0082@¢\u0006\u0002\u0010@J\u001e\u0010A\u001a\u00020\u00102\u0006\u0010%\u001a\u00020>2\u0006\u0010?\u001a\u00020\u000fH\u0082@¢\u0006\u0002\u0010@J@\u0010B\u001a\u00020\f2\u000e\u0010C\u001a\n\u0012\u0006\b\u0001\u0012\u00020\u00060\n2\u000e\b\u0002\u0010D\u001a\b\u0012\u0004\u0012\u00020\u00100\u001f2\u000e\b\u0002\u0010E\u001a\b\u0012\u0004\u0012\u00020\u00100\u001fH\u0080@¢\u0006\u0004\bF\u0010GJ-\u0010H\u001a\u00020\u00102\u000e\b\u0002\u0010D\u001a\b\u0012\u0004\u0012\u00020\u00100\u001f2\u000e\b\u0002\u0010E\u001a\b\u0012\u0004\u0012\u00020\u00100\u001fH\u0000¢\u0006\u0002\bIJ\u0014\u0010J\u001a\b\u0012\u0004\u0012\u00020\u000f0\bH\u0082@¢\u0006\u0002\u0010<J\u001c\u0010K\u001a\b\u0012\u0004\u0012\u00020\u000f0\b2\u0006\u0010%\u001a\u00020>H\u0082@¢\u0006\u0002\u0010LJ\r\u0010M\u001a\u00020\u0010H\u0000¢\u0006\u0002\bNR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R \u0010\u0007\u001a\u0014\u0012\u0004\u0012\u00020\u0006\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00060\b0\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\fX\u0082\u0004¢\u0006\u0002\n\u0000R \u0010\r\u001a\u0014\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u000f0\b\u0012\u0004\u0012\u00020\u00100\u000eX\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u0013\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u000f0\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\u00060\nX\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0015R\u000e\u0010\u0016\u001a\u00020\u0017X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0018\u001a\u00020\u0019X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u001a\u001a\u00060\u001bj\u0002`\u001cX\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u001dR \u0010\u001e\u001a\b\u0012\u0004\u0012\u00020\f0\u001fX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b \u0010!\"\u0004\b\"\u0010#¨\u0006P"}, d2 = {"Landroidx/room/TriggerBasedInvalidationTracker;", "", "database", "Landroidx/room/RoomDatabase;", "shadowTablesMap", "", "", "viewTables", "", "tableNames", "", "useTempTable", "", "onInvalidatedTablesIds", "Lkotlin/Function1;", "", "", "<init>", "(Landroidx/room/RoomDatabase;Ljava/util/Map;Ljava/util/Map;[Ljava/lang/String;ZLkotlin/jvm/functions/Function1;)V", "tableIdLookup", "tablesNames", "[Ljava/lang/String;", "observedTableStates", "Landroidx/room/ObservedTableStates;", "observedTableVersions", "Landroidx/room/ObservedTableVersions;", "pendingRefresh", "Ljava/util/concurrent/atomic/AtomicBoolean;", "Landroidx/room/concurrent/AtomicBoolean;", "Ljava/util/concurrent/atomic/AtomicBoolean;", "onAllowRefresh", "Lkotlin/Function0;", "getOnAllowRefresh$room_runtime", "()Lkotlin/jvm/functions/Function0;", "setOnAllowRefresh$room_runtime", "(Lkotlin/jvm/functions/Function0;)V", "configureConnection", "connection", "Landroidx/sqlite/SQLiteConnection;", "createFlow", "Lkotlinx/coroutines/flow/Flow;", "resolvedTableNames", "tableIds", "", "emitInitialState", "createFlow$room_runtime", "([Ljava/lang/String;[IZ)Lkotlinx/coroutines/flow/Flow;", "validateTableNames", "Lkotlin/Pair;", "names", "validateTableNames$room_runtime", "([Ljava/lang/String;)Lkotlin/Pair;", "resolveViews", "([Ljava/lang/String;)[Ljava/lang/String;", "onObserverAdded", "onObserverAdded$room_runtime", "onObserverRemoved", "onObserverRemoved$room_runtime", "syncTriggers", "syncTriggers$room_runtime", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "startTrackingTable", "Landroidx/room/PooledConnection;", "tableId", "(Landroidx/room/PooledConnection;ILkotlin/coroutines/Continuation;)Ljava/lang/Object;", "stopTrackingTable", "refreshInvalidation", "tables", "onRefreshScheduled", "onRefreshCompleted", "refreshInvalidation$room_runtime", "([Ljava/lang/String;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "refreshInvalidationAsync", "refreshInvalidationAsync$room_runtime", "notifyInvalidation", "checkInvalidatedTables", "(Landroidx/room/PooledConnection;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "resetSync", "resetSync$room_runtime", "Companion", "room-runtime"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class TriggerBasedInvalidationTracker {
    private static final String CREATE_TRACKING_TABLE_SQL = "CREATE TEMP TABLE IF NOT EXISTS room_table_modification_log (table_id INTEGER PRIMARY KEY, invalidated INTEGER NOT NULL DEFAULT 0)";
    private static final String DROP_TRACKING_TABLE_SQL = "DROP TABLE IF EXISTS room_table_modification_log";
    private static final String INVALIDATED_COLUMN_NAME = "invalidated";
    private static final String RESET_UPDATED_TABLES_SQL = "UPDATE room_table_modification_log SET invalidated = 0 WHERE invalidated = 1";
    private static final String SELECT_UPDATED_TABLES_SQL = "SELECT * FROM room_table_modification_log WHERE invalidated = 1";
    private static final String TABLE_ID_COLUMN_NAME = "table_id";
    private static final String UPDATE_TABLE_NAME = "room_table_modification_log";
    private final RoomDatabase database;
    private final ObservedTableStates observedTableStates;
    private final ObservedTableVersions observedTableVersions;
    private Function0<Boolean> onAllowRefresh;
    private final Function1<Set<Integer>, Unit> onInvalidatedTablesIds;
    private final AtomicBoolean pendingRefresh;
    private final Map<String, String> shadowTablesMap;
    private final Map<String, Integer> tableIdLookup;
    private final String[] tablesNames;
    private final boolean useTempTable;
    private final Map<String, Set<String>> viewTables;

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    private static final String[] TRIGGERS = {"INSERT", "UPDATE", "DELETE"};

    /* JADX INFO: renamed from: androidx.room.TriggerBasedInvalidationTracker$checkInvalidatedTables$1, reason: invalid class name */
    /* JADX INFO: compiled from: InvalidationTracker.kt */
    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "androidx.room.TriggerBasedInvalidationTracker", f = "InvalidationTracker.kt", i = {0, 1}, l = {444, 452}, m = "checkInvalidatedTables", n = {"connection", "invalidatedTableIds"}, s = {"L$0", "L$0"})
    static final class AnonymousClass1 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return TriggerBasedInvalidationTracker.this.checkInvalidatedTables(null, this);
        }
    }

    /* JADX INFO: renamed from: androidx.room.TriggerBasedInvalidationTracker$notifyInvalidation$1, reason: invalid class name and case insensitive filesystem */
    /* JADX INFO: compiled from: InvalidationTracker.kt */
    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "androidx.room.TriggerBasedInvalidationTracker", f = "InvalidationTracker.kt", i = {0}, l = {TypedValues.CycleType.TYPE_PATH_ROTATE}, m = "notifyInvalidation", n = {"$this$ifNotClosed$iv"}, s = {"L$0"})
    static final class C00501 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        C00501(Continuation<? super C00501> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return TriggerBasedInvalidationTracker.this.notifyInvalidation(this);
        }
    }

    /* JADX INFO: renamed from: androidx.room.TriggerBasedInvalidationTracker$startTrackingTable$1, reason: invalid class name and case insensitive filesystem */
    /* JADX INFO: compiled from: InvalidationTracker.kt */
    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "androidx.room.TriggerBasedInvalidationTracker", f = "InvalidationTracker.kt", i = {0, 0, 1, 1, 1}, l = {327, 332}, m = "startTrackingTable", n = {"connection", "tableId", "connection", "tableName", "tableId"}, s = {"L$0", "I$0", "L$0", "L$1", "I$0"})
    static final class C00511 extends ContinuationImpl {
        int I$0;
        int I$1;
        int I$2;
        Object L$0;
        Object L$1;
        Object L$2;
        int label;
        /* synthetic */ Object result;

        C00511(Continuation<? super C00511> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return TriggerBasedInvalidationTracker.this.startTrackingTable(null, 0, this);
        }
    }

    /* JADX INFO: renamed from: androidx.room.TriggerBasedInvalidationTracker$stopTrackingTable$1, reason: invalid class name and case insensitive filesystem */
    /* JADX INFO: compiled from: InvalidationTracker.kt */
    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "androidx.room.TriggerBasedInvalidationTracker", f = "InvalidationTracker.kt", i = {0, 0}, l = {346}, m = "stopTrackingTable", n = {"connection", "tableName"}, s = {"L$0", "L$1"})
    static final class C00521 extends ContinuationImpl {
        int I$0;
        int I$1;
        Object L$0;
        Object L$1;
        Object L$2;
        int label;
        /* synthetic */ Object result;

        C00521(Continuation<? super C00521> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return TriggerBasedInvalidationTracker.this.stopTrackingTable(null, 0, this);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public TriggerBasedInvalidationTracker(RoomDatabase database, Map<String, String> shadowTablesMap, Map<String, ? extends Set<String>> viewTables, String[] tableNames, boolean z, Function1<? super Set<Integer>, Unit> onInvalidatedTablesIds) {
        String lowerCase;
        Intrinsics.checkNotNullParameter(database, "database");
        Intrinsics.checkNotNullParameter(shadowTablesMap, "shadowTablesMap");
        Intrinsics.checkNotNullParameter(viewTables, "viewTables");
        Intrinsics.checkNotNullParameter(tableNames, "tableNames");
        Intrinsics.checkNotNullParameter(onInvalidatedTablesIds, "onInvalidatedTablesIds");
        this.database = database;
        this.shadowTablesMap = shadowTablesMap;
        this.viewTables = viewTables;
        this.useTempTable = z;
        this.onInvalidatedTablesIds = onInvalidatedTablesIds;
        this.pendingRefresh = new AtomicBoolean(false);
        this.onAllowRefresh = new Function0() { // from class: androidx.room.TriggerBasedInvalidationTracker$$ExternalSyntheticLambda1
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                return Boolean.valueOf(TriggerBasedInvalidationTracker.onAllowRefresh$lambda$0());
            }
        };
        this.tableIdLookup = new LinkedHashMap();
        int length = tableNames.length;
        String[] strArr = new String[length];
        for (int i = 0; i < length; i++) {
            String lowerCase2 = tableNames[i].toLowerCase(Locale.ROOT);
            Intrinsics.checkNotNullExpressionValue(lowerCase2, "toLowerCase(...)");
            this.tableIdLookup.put(lowerCase2, Integer.valueOf(i));
            String str = this.shadowTablesMap.get(tableNames[i]);
            if (str != null) {
                lowerCase = str.toLowerCase(Locale.ROOT);
                Intrinsics.checkNotNullExpressionValue(lowerCase, "toLowerCase(...)");
            } else {
                lowerCase = null;
            }
            if (lowerCase != null) {
                lowerCase2 = lowerCase;
            }
            strArr[i] = lowerCase2;
        }
        this.tablesNames = strArr;
        for (Map.Entry<String, String> entry : this.shadowTablesMap.entrySet()) {
            String lowerCase3 = entry.getValue().toLowerCase(Locale.ROOT);
            Intrinsics.checkNotNullExpressionValue(lowerCase3, "toLowerCase(...)");
            if (this.tableIdLookup.containsKey(lowerCase3)) {
                String lowerCase4 = entry.getKey().toLowerCase(Locale.ROOT);
                Intrinsics.checkNotNullExpressionValue(lowerCase4, "toLowerCase(...)");
                this.tableIdLookup.put(lowerCase4, (Integer) MapsKt.getValue(this.tableIdLookup, lowerCase3));
            }
        }
        this.observedTableStates = new ObservedTableStates(this.tablesNames.length);
        this.observedTableVersions = new ObservedTableVersions(this.tablesNames.length);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean onAllowRefresh$lambda$0() {
        return true;
    }

    public final Function0<Boolean> getOnAllowRefresh$room_runtime() {
        return this.onAllowRefresh;
    }

    public final void setOnAllowRefresh$room_runtime(Function0<Boolean> function0) {
        Intrinsics.checkNotNullParameter(function0, "<set-?>");
        this.onAllowRefresh = function0;
    }

    public final void configureConnection(SQLiteConnection connection) throws Exception {
        Intrinsics.checkNotNullParameter(connection, "connection");
        SQLiteStatement sQLiteStatementPrepare = connection.prepare("PRAGMA query_only");
        try {
            SQLiteStatement it = sQLiteStatementPrepare;
            it.step();
            boolean isReadConnection = it.getBoolean(0);
            AutoCloseableKt.closeFinally(sQLiteStatementPrepare, null);
            if (!isReadConnection) {
                SQLite.execSQL(connection, "PRAGMA temp_store = MEMORY");
                SQLite.execSQL(connection, "PRAGMA recursive_triggers = 1");
                SQLite.execSQL(connection, DROP_TRACKING_TABLE_SQL);
                if (this.useTempTable) {
                    SQLite.execSQL(connection, CREATE_TRACKING_TABLE_SQL);
                } else {
                    SQLite.execSQL(connection, StringsKt.replace$default(CREATE_TRACKING_TABLE_SQL, "TEMP", "", false, 4, (Object) null));
                }
                this.observedTableStates.forceNeedSync$room_runtime();
            }
        } catch (Throwable th) {
            try {
                throw th;
            } catch (Throwable th2) {
                AutoCloseableKt.closeFinally(sQLiteStatementPrepare, th);
                throw th2;
            }
        }
    }

    public final Flow<Set<String>> createFlow$room_runtime(String[] resolvedTableNames, int[] tableIds, boolean emitInitialState) {
        Intrinsics.checkNotNullParameter(resolvedTableNames, "resolvedTableNames");
        Intrinsics.checkNotNullParameter(tableIds, "tableIds");
        return FlowKt.flow(new TriggerBasedInvalidationTracker$createFlow$1(this, tableIds, emitInitialState, resolvedTableNames, null));
    }

    public final Pair<String[], int[]> validateTableNames$room_runtime(String[] names) {
        Intrinsics.checkNotNullParameter(names, "names");
        String[] tableNames = resolveViews(names);
        int length = tableNames.length;
        int[] tableIds = new int[length];
        for (int i = 0; i < length; i++) {
            String tableName = tableNames[i];
            Map<String, Integer> map = this.tableIdLookup;
            String lowerCase = tableName.toLowerCase(Locale.ROOT);
            Intrinsics.checkNotNullExpressionValue(lowerCase, "toLowerCase(...)");
            Integer num = map.get(lowerCase);
            if (num != null) {
                tableIds[i] = num.intValue();
            } else {
                throw new IllegalArgumentException("There is no table with name " + tableName);
            }
        }
        return TuplesKt.to(tableNames, tableIds);
    }

    private final String[] resolveViews(String[] names) {
        Set $this$resolveViews_u24lambda_u245 = SetsKt.createSetBuilder();
        for (String str : names) {
            Map<String, Set<String>> map = this.viewTables;
            String lowerCase = str.toLowerCase(Locale.ROOT);
            Intrinsics.checkNotNullExpressionValue(lowerCase, "toLowerCase(...)");
            Set<String> set = map.get(lowerCase);
            if (set != null) {
                $this$resolveViews_u24lambda_u245.addAll(set);
            } else {
                $this$resolveViews_u24lambda_u245.add(str);
            }
        }
        Collection $this$toTypedArray$iv = SetsKt.build($this$resolveViews_u24lambda_u245);
        return (String[]) $this$toTypedArray$iv.toArray(new String[0]);
    }

    public final boolean onObserverAdded$room_runtime(int[] tableIds) {
        Intrinsics.checkNotNullParameter(tableIds, "tableIds");
        return this.observedTableStates.onObserverAdded$room_runtime(tableIds);
    }

    public final boolean onObserverRemoved$room_runtime(int[] tableIds) {
        Intrinsics.checkNotNullParameter(tableIds, "tableIds");
        return this.observedTableStates.onObserverRemoved$room_runtime(tableIds);
    }

    /* JADX WARN: Code duplicated, block: B:7:0x0014  */
    public final Object syncTriggers$room_runtime(Continuation<? super Unit> continuation) throws Throwable {
        TriggerBasedInvalidationTracker$syncTriggers$1 triggerBasedInvalidationTracker$syncTriggers$1;
        CloseBarrier $this$ifNotClosed$iv;
        if (continuation instanceof TriggerBasedInvalidationTracker$syncTriggers$1) {
            triggerBasedInvalidationTracker$syncTriggers$1 = (TriggerBasedInvalidationTracker$syncTriggers$1) continuation;
            if ((triggerBasedInvalidationTracker$syncTriggers$1.label & Integer.MIN_VALUE) != 0) {
                triggerBasedInvalidationTracker$syncTriggers$1.label -= Integer.MIN_VALUE;
            } else {
                triggerBasedInvalidationTracker$syncTriggers$1 = new TriggerBasedInvalidationTracker$syncTriggers$1(this, continuation);
            }
        } else {
            triggerBasedInvalidationTracker$syncTriggers$1 = new TriggerBasedInvalidationTracker$syncTriggers$1(this, continuation);
        }
        Object $result = triggerBasedInvalidationTracker$syncTriggers$1.result;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (triggerBasedInvalidationTracker$syncTriggers$1.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                $this$ifNotClosed$iv = this.database.getCloseBarrier();
                if ($this$ifNotClosed$iv.block$room_runtime()) {
                    try {
                        RoomDatabase roomDatabase = this.database;
                        TriggerBasedInvalidationTracker$syncTriggers$2$1 triggerBasedInvalidationTracker$syncTriggers$2$1 = new TriggerBasedInvalidationTracker$syncTriggers$2$1(this, null);
                        triggerBasedInvalidationTracker$syncTriggers$1.L$0 = $this$ifNotClosed$iv;
                        triggerBasedInvalidationTracker$syncTriggers$1.label = 1;
                        if (roomDatabase.useConnection(false, triggerBasedInvalidationTracker$syncTriggers$2$1, triggerBasedInvalidationTracker$syncTriggers$1) == coroutine_suspended) {
                            return coroutine_suspended;
                        }
                        $this$ifNotClosed$iv.unblock$room_runtime();
                    } catch (Throwable th) {
                        th = th;
                        $this$ifNotClosed$iv.unblock$room_runtime();
                        throw th;
                    }
                }
                return Unit.INSTANCE;
            case 1:
                $this$ifNotClosed$iv = (CloseBarrier) triggerBasedInvalidationTracker$syncTriggers$1.L$0;
                try {
                    ResultKt.throwOnFailure($result);
                    $this$ifNotClosed$iv.unblock$room_runtime();
                    return Unit.INSTANCE;
                } catch (Throwable th2) {
                    th = th2;
                    $this$ifNotClosed$iv.unblock$room_runtime();
                    throw th;
                }
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code duplicated, block: B:19:0x009e  */
    /* JADX WARN: Code duplicated, block: B:21:0x00a4  */
    /* JADX WARN: Code duplicated, block: B:22:0x00a7  */
    /* JADX WARN: Code duplicated, block: B:25:0x0110 A[RETURN] */
    /* JADX WARN: Code duplicated, block: B:26:0x0111  */
    /* JADX WARN: Code duplicated, block: B:7:0x0018  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:26:0x0111 -> B:27:0x0113). Please report as a decompilation issue!!! */
    /*  JADX ERROR: JadxOverflowException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxOverflowException: Regions stack size limit reached
        	at jadx.core.utils.ErrorsCounter.addError(ErrorsCounter.java:59)
        	at jadx.core.utils.ErrorsCounter.error(ErrorsCounter.java:31)
        	at jadx.core.dex.attributes.nodes.NotificationAttrNode.addError(NotificationAttrNode.java:19)
        */
    public final java.lang.Object startTrackingTable(androidx.room.PooledConnection r19, int r20, kotlin.coroutines.Continuation<? super kotlin.Unit> r21) {
        /*
            Method dump skipped, instruction units count: 296
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.room.TriggerBasedInvalidationTracker.startTrackingTable(androidx.room.PooledConnection, int, kotlin.coroutines.Continuation):java.lang.Object");
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code duplicated, block: B:15:0x0054  */
    /* JADX WARN: Code duplicated, block: B:17:0x0087 A[RETURN] */
    /* JADX WARN: Code duplicated, block: B:7:0x0014  */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:16:0x0085 -> B:18:0x0088). Please report as a decompilation issue!!! */
    /*  JADX ERROR: JadxOverflowException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxOverflowException: Regions stack size limit reached
        	at jadx.core.utils.ErrorsCounter.addError(ErrorsCounter.java:59)
        	at jadx.core.utils.ErrorsCounter.error(ErrorsCounter.java:31)
        	at jadx.core.dex.attributes.nodes.NotificationAttrNode.addError(NotificationAttrNode.java:19)
        */
    public final java.lang.Object stopTrackingTable(androidx.room.PooledConnection r12, int r13, kotlin.coroutines.Continuation<? super kotlin.Unit> r14) {
        /*
            r11 = this;
            boolean r0 = r14 instanceof androidx.room.TriggerBasedInvalidationTracker.C00521
            if (r0 == 0) goto L14
            r0 = r14
            androidx.room.TriggerBasedInvalidationTracker$stopTrackingTable$1 r0 = (androidx.room.TriggerBasedInvalidationTracker.C00521) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            androidx.room.TriggerBasedInvalidationTracker$stopTrackingTable$1 r0 = new androidx.room.TriggerBasedInvalidationTracker$stopTrackingTable$1
            r0.<init>(r14)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            r4 = 1
            switch(r3) {
                case 0: goto L41;
                case 1: goto L2d;
                default: goto L25;
            }
        L25:
            java.lang.IllegalStateException r12 = new java.lang.IllegalStateException
            java.lang.String r13 = "call to 'resume' before 'invoke' with coroutine"
            r12.<init>(r13)
            throw r12
        L2d:
            int r12 = r0.I$1
            int r13 = r0.I$0
            java.lang.Object r3 = r0.L$2
            java.lang.String[] r3 = (java.lang.String[]) r3
            java.lang.Object r5 = r0.L$1
            java.lang.String r5 = (java.lang.String) r5
            java.lang.Object r6 = r0.L$0
            androidx.room.PooledConnection r6 = (androidx.room.PooledConnection) r6
            kotlin.ResultKt.throwOnFailure(r1)
            goto L88
        L41:
            kotlin.ResultKt.throwOnFailure(r1)
            r3 = r11
            java.lang.String[] r5 = r3.tablesNames
            r13 = r5[r13]
            java.lang.String[] r3 = androidx.room.TriggerBasedInvalidationTracker.TRIGGERS
            int r5 = r3.length
            r6 = 0
            r10 = r6
            r6 = r12
            r12 = r5
            r5 = r13
            r13 = r10
        L52:
            if (r13 >= r12) goto L8a
            r7 = r3[r13]
            androidx.room.TriggerBasedInvalidationTracker$Companion r8 = androidx.room.TriggerBasedInvalidationTracker.INSTANCE
            java.lang.String r7 = androidx.room.TriggerBasedInvalidationTracker.Companion.access$getTriggerName(r8, r5, r7)
            java.lang.StringBuilder r8 = new java.lang.StringBuilder
            r8.<init>()
            java.lang.String r9 = "DROP TRIGGER IF EXISTS `"
            java.lang.StringBuilder r8 = r8.append(r9)
            java.lang.StringBuilder r8 = r8.append(r7)
            r9 = 96
            java.lang.StringBuilder r8 = r8.append(r9)
            java.lang.String r8 = r8.toString()
            r0.L$0 = r6
            r0.L$1 = r5
            r0.L$2 = r3
            r0.I$0 = r13
            r0.I$1 = r12
            r0.label = r4
            java.lang.Object r7 = androidx.room.TransactorKt.execSQL(r6, r8, r0)
            if (r7 != r2) goto L88
            return r2
        L88:
            int r13 = r13 + r4
            goto L52
        L8a:
            kotlin.Unit r12 = kotlin.Unit.INSTANCE
            return r12
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.room.TriggerBasedInvalidationTracker.stopTrackingTable(androidx.room.PooledConnection, int, kotlin.coroutines.Continuation):java.lang.Object");
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ Object refreshInvalidation$room_runtime$default(TriggerBasedInvalidationTracker triggerBasedInvalidationTracker, String[] strArr, Function0 function0, Function0 function1, Continuation continuation, int i, Object obj) {
        if ((i & 2) != 0) {
            function0 = new Function0() { // from class: androidx.room.TriggerBasedInvalidationTracker$$ExternalSyntheticLambda4
                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    return Unit.INSTANCE;
                }
            };
        }
        if ((i & 4) != 0) {
            function1 = new Function0() { // from class: androidx.room.TriggerBasedInvalidationTracker$$ExternalSyntheticLambda5
                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    return Unit.INSTANCE;
                }
            };
        }
        return triggerBasedInvalidationTracker.refreshInvalidation$room_runtime(strArr, function0, function1, continuation);
    }

    /* JADX WARN: Code duplicated, block: B:23:0x0062  */
    /* JADX WARN: Code duplicated, block: B:24:0x0064  */
    /* JADX WARN: Code duplicated, block: B:26:0x0068 A[Catch: all -> 0x0094, TryCatch #0 {all -> 0x0094, blocks: (B:21:0x005c, B:26:0x0068, B:28:0x006d, B:37:0x008c, B:31:0x007c, B:33:0x0081, B:18:0x004f), top: B:44:0x004f }] */
    /* JADX WARN: Code duplicated, block: B:28:0x006d A[Catch: all -> 0x0094, TryCatch #0 {all -> 0x0094, blocks: (B:21:0x005c, B:26:0x0068, B:28:0x006d, B:37:0x008c, B:31:0x007c, B:33:0x0081, B:18:0x004f), top: B:44:0x004f }] */
    /* JADX WARN: Code duplicated, block: B:31:0x007c A[Catch: all -> 0x0094, LOOP:0: B:27:0x006b->B:31:0x007c, LOOP_END, TryCatch #0 {all -> 0x0094, blocks: (B:21:0x005c, B:26:0x0068, B:28:0x006d, B:37:0x008c, B:31:0x007c, B:33:0x0081, B:18:0x004f), top: B:44:0x004f }] */
    /* JADX WARN: Code duplicated, block: B:33:0x0081 A[Catch: all -> 0x0094, TryCatch #0 {all -> 0x0094, blocks: (B:21:0x005c, B:26:0x0068, B:28:0x006d, B:37:0x008c, B:31:0x007c, B:33:0x0081, B:18:0x004f), top: B:44:0x004f }] */
    /* JADX WARN: Code duplicated, block: B:35:0x008a  */
    /* JADX WARN: Code duplicated, block: B:36:0x008b  */
    /* JADX WARN: Code duplicated, block: B:48:0x007f A[SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:49:0x007b A[SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:7:0x0014  */
    public final Object refreshInvalidation$room_runtime(String[] tables, Function0<Unit> function0, Function0<Unit> function1, Continuation<? super Boolean> continuation) throws Throwable {
        TriggerBasedInvalidationTracker$refreshInvalidation$1 triggerBasedInvalidationTracker$refreshInvalidation$1;
        int[] tableIds;
        Object objNotifyInvalidation;
        Function0<Unit> function2;
        Throwable th;
        Set invalidatesTableIds;
        boolean z;
        int length;
        int i;
        int element$iv;
        if (continuation instanceof TriggerBasedInvalidationTracker$refreshInvalidation$1) {
            triggerBasedInvalidationTracker$refreshInvalidation$1 = (TriggerBasedInvalidationTracker$refreshInvalidation$1) continuation;
            if ((triggerBasedInvalidationTracker$refreshInvalidation$1.label & Integer.MIN_VALUE) != 0) {
                triggerBasedInvalidationTracker$refreshInvalidation$1.label -= Integer.MIN_VALUE;
            } else {
                triggerBasedInvalidationTracker$refreshInvalidation$1 = new TriggerBasedInvalidationTracker$refreshInvalidation$1(this, continuation);
            }
        } else {
            triggerBasedInvalidationTracker$refreshInvalidation$1 = new TriggerBasedInvalidationTracker$refreshInvalidation$1(this, continuation);
        }
        Object $result = triggerBasedInvalidationTracker$refreshInvalidation$1.result;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        boolean z2 = true;
        switch (triggerBasedInvalidationTracker$refreshInvalidation$1.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                tableIds = validateTableNames$room_runtime(tables).component2();
                function0.invoke();
                try {
                    triggerBasedInvalidationTracker$refreshInvalidation$1.L$0 = function1;
                    triggerBasedInvalidationTracker$refreshInvalidation$1.L$1 = tableIds;
                    triggerBasedInvalidationTracker$refreshInvalidation$1.label = 1;
                    objNotifyInvalidation = notifyInvalidation(triggerBasedInvalidationTracker$refreshInvalidation$1);
                    if (objNotifyInvalidation == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    invalidatesTableIds = (Set) objNotifyInvalidation;
                    if (tableIds.length == 0) {
                        z = true;
                    } else {
                        z = false;
                    }
                    if (!z) {
                        if (!invalidatesTableIds.isEmpty()) {
                            z2 = false;
                        }
                    } else {
                        length = tableIds.length;
                        i = 0;
                        while (true) {
                            if (i < length) {
                                element$iv = tableIds[i];
                                if (invalidatesTableIds.contains(Boxing.boxInt(element$iv))) {
                                    i++;
                                }
                            } else {
                                z2 = false;
                            }
                        }
                    }
                    Boolean boolBoxBoolean = Boxing.boxBoolean(z2);
                    function1.invoke();
                    return boolBoxBoolean;
                } catch (Throwable th2) {
                    th = th2;
                    function2 = function1;
                    function2.invoke();
                    throw th;
                }
            case 1:
                tableIds = (int[]) triggerBasedInvalidationTracker$refreshInvalidation$1.L$1;
                function2 = (Function0) triggerBasedInvalidationTracker$refreshInvalidation$1.L$0;
                try {
                    ResultKt.throwOnFailure($result);
                    function1 = function2;
                    objNotifyInvalidation = $result;
                    invalidatesTableIds = (Set) objNotifyInvalidation;
                    if (tableIds.length == 0) {
                        z = true;
                    } else {
                        z = false;
                    }
                    if (!z) {
                        if (!invalidatesTableIds.isEmpty()) {
                            z2 = false;
                        }
                    } else {
                        length = tableIds.length;
                        i = 0;
                        while (true) {
                            if (i < length) {
                                element$iv = tableIds[i];
                                if (invalidatesTableIds.contains(Boxing.boxInt(element$iv))) {
                                    i++;
                                }
                            } else {
                                z2 = false;
                            }
                        }
                    }
                    Boolean boolBoxBoolean2 = Boxing.boxBoolean(z2);
                    function1.invoke();
                    return boolBoxBoolean2;
                } catch (Throwable th3) {
                    th = th3;
                    function2.invoke();
                    throw th;
                }
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ void refreshInvalidationAsync$room_runtime$default(TriggerBasedInvalidationTracker triggerBasedInvalidationTracker, Function0 function0, Function0 function1, int i, Object obj) {
        if ((i & 1) != 0) {
            function0 = new Function0() { // from class: androidx.room.TriggerBasedInvalidationTracker$$ExternalSyntheticLambda2
                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    return Unit.INSTANCE;
                }
            };
        }
        if ((i & 2) != 0) {
            function1 = new Function0() { // from class: androidx.room.TriggerBasedInvalidationTracker$$ExternalSyntheticLambda3
                @Override // kotlin.jvm.functions.Function0
                public final Object invoke() {
                    return Unit.INSTANCE;
                }
            };
        }
        triggerBasedInvalidationTracker.refreshInvalidationAsync$room_runtime(function0, function1);
    }

    public final void refreshInvalidationAsync$room_runtime(Function0<Unit> onRefreshScheduled, Function0<Unit> onRefreshCompleted) {
        Intrinsics.checkNotNullParameter(onRefreshScheduled, "onRefreshScheduled");
        Intrinsics.checkNotNullParameter(onRefreshCompleted, "onRefreshCompleted");
        if (this.pendingRefresh.compareAndSet(false, true)) {
            onRefreshScheduled.invoke();
            BuildersKt__Builders_commonKt.launch$default(this.database.getCoroutineScope(), new CoroutineName("Room Invalidation Tracker Refresh"), null, new TriggerBasedInvalidationTracker$refreshInvalidationAsync$3(this, onRefreshCompleted, null), 2, null);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code duplicated, block: B:35:0x0095 A[Catch: all -> 0x0038, TRY_LEAVE, TryCatch #1 {all -> 0x0038, blocks: (B:13:0x0033, B:33:0x0089, B:35:0x0095, B:25:0x005f, B:27:0x006d), top: B:44:0x0021 }] */
    /* JADX WARN: Code duplicated, block: B:7:0x0014  */
    public final Object notifyInvalidation(Continuation<? super Set<Integer>> continuation) throws Throwable {
        C00501 c00501;
        CloseBarrier $this$ifNotClosed$iv;
        Object objUseConnection;
        TriggerBasedInvalidationTracker triggerBasedInvalidationTracker;
        Set<Integer> set;
        if (continuation instanceof C00501) {
            c00501 = (C00501) continuation;
            if ((c00501.label & Integer.MIN_VALUE) != 0) {
                c00501.label -= Integer.MIN_VALUE;
            } else {
                c00501 = new C00501(continuation);
            }
        } else {
            c00501 = new C00501(continuation);
        }
        Object $result = c00501.result;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        try {
            switch (c00501.label) {
                case 0:
                    ResultKt.throwOnFailure($result);
                    $this$ifNotClosed$iv = this.database.getCloseBarrier();
                    if (!$this$ifNotClosed$iv.block$room_runtime()) {
                        return SetsKt.emptySet();
                    }
                    try {
                        if (!this.pendingRefresh.compareAndSet(true, false) || !this.onAllowRefresh.invoke().booleanValue()) {
                            Set setEmptySet = SetsKt.emptySet();
                            $this$ifNotClosed$iv.unblock$room_runtime();
                            return setEmptySet;
                        }
                        RoomDatabase roomDatabase = this.database;
                        TriggerBasedInvalidationTracker$notifyInvalidation$2$invalidatedTableIds$1 triggerBasedInvalidationTracker$notifyInvalidation$2$invalidatedTableIds$1 = new TriggerBasedInvalidationTracker$notifyInvalidation$2$invalidatedTableIds$1(this, null);
                        c00501.L$0 = $this$ifNotClosed$iv;
                        c00501.label = 1;
                        objUseConnection = roomDatabase.useConnection(false, triggerBasedInvalidationTracker$notifyInvalidation$2$invalidatedTableIds$1, c00501);
                        if (objUseConnection == coroutine_suspended) {
                            return coroutine_suspended;
                        }
                        triggerBasedInvalidationTracker = this;
                        set = (Set) objUseConnection;
                        if (!set.isEmpty()) {
                            triggerBasedInvalidationTracker.observedTableVersions.increment(set);
                            triggerBasedInvalidationTracker.onInvalidatedTablesIds.invoke(set);
                        }
                        $this$ifNotClosed$iv.unblock$room_runtime();
                        return set;
                    } catch (Throwable th) {
                        th = th;
                        $this$ifNotClosed$iv.unblock$room_runtime();
                        throw th;
                    }
                case 1:
                    triggerBasedInvalidationTracker = this;
                    $this$ifNotClosed$iv = (CloseBarrier) c00501.L$0;
                    ResultKt.throwOnFailure($result);
                    objUseConnection = $result;
                    set = (Set) objUseConnection;
                    if (!set.isEmpty()) {
                        triggerBasedInvalidationTracker.observedTableVersions.increment(set);
                        triggerBasedInvalidationTracker.onInvalidatedTablesIds.invoke(set);
                    }
                    $this$ifNotClosed$iv.unblock$room_runtime();
                    return set;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Code duplicated, block: B:19:0x005f  */
    /* JADX WARN: Code duplicated, block: B:21:0x006c A[RETURN] */
    /* JADX WARN: Code duplicated, block: B:22:0x006d  */
    /* JADX WARN: Code duplicated, block: B:25:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Code duplicated, block: B:7:0x0014  */
    public final Object checkInvalidatedTables(PooledConnection connection, Continuation<? super Set<Integer>> continuation) throws Throwable {
        AnonymousClass1 anonymousClass1;
        Object objUsePrepared;
        Set invalidatedTableIds;
        Set invalidatedTableIds2;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            if ((anonymousClass1.label & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label -= Integer.MIN_VALUE;
            } else {
                anonymousClass1 = new AnonymousClass1(continuation);
            }
        } else {
            anonymousClass1 = new AnonymousClass1(continuation);
        }
        Object $result = anonymousClass1.result;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (anonymousClass1.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                Function1 function1 = new Function1() { // from class: androidx.room.TriggerBasedInvalidationTracker$$ExternalSyntheticLambda0
                    @Override // kotlin.jvm.functions.Function1
                    public final Object invoke(Object obj) {
                        return TriggerBasedInvalidationTracker.checkInvalidatedTables$lambda$14((SQLiteStatement) obj);
                    }
                };
                anonymousClass1.L$0 = connection;
                anonymousClass1.label = 1;
                objUsePrepared = connection.usePrepared(SELECT_UPDATED_TABLES_SQL, function1, anonymousClass1);
                if (objUsePrepared == coroutine_suspended) {
                    return coroutine_suspended;
                }
                invalidatedTableIds = (Set) objUsePrepared;
                if (!invalidatedTableIds.isEmpty()) {
                    return invalidatedTableIds;
                }
                anonymousClass1.L$0 = invalidatedTableIds;
                anonymousClass1.label = 2;
                if (TransactorKt.execSQL(connection, RESET_UPDATED_TABLES_SQL, anonymousClass1) == coroutine_suspended) {
                    return coroutine_suspended;
                }
                invalidatedTableIds2 = invalidatedTableIds;
                return invalidatedTableIds2;
            case 1:
                connection = (PooledConnection) anonymousClass1.L$0;
                ResultKt.throwOnFailure($result);
                objUsePrepared = $result;
                invalidatedTableIds = (Set) objUsePrepared;
                if (!invalidatedTableIds.isEmpty()) {
                    return invalidatedTableIds;
                }
                anonymousClass1.L$0 = invalidatedTableIds;
                anonymousClass1.label = 2;
                if (TransactorKt.execSQL(connection, RESET_UPDATED_TABLES_SQL, anonymousClass1) == coroutine_suspended) {
                    return coroutine_suspended;
                }
                invalidatedTableIds2 = invalidatedTableIds;
                return invalidatedTableIds2;
            case 2:
                invalidatedTableIds2 = (Set) anonymousClass1.L$0;
                ResultKt.throwOnFailure($result);
                return invalidatedTableIds2;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Set checkInvalidatedTables$lambda$14(SQLiteStatement statement) {
        Intrinsics.checkNotNullParameter(statement, "statement");
        Set $this$checkInvalidatedTables_u24lambda_u2414_u24lambda_u2413 = SetsKt.createSetBuilder();
        while (statement.step()) {
            $this$checkInvalidatedTables_u24lambda_u2414_u24lambda_u2413.add(Integer.valueOf((int) statement.getLong(0)));
        }
        return SetsKt.build($this$checkInvalidatedTables_u24lambda_u2414_u24lambda_u2413);
    }

    public final void resetSync$room_runtime() {
        this.observedTableStates.resetTriggerState$room_runtime();
    }

    /* JADX INFO: compiled from: InvalidationTracker.kt */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0011\n\u0002\u0010\u000e\n\u0002\b\f\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0018\u0010\u000f\u001a\u00020\u00062\u0006\u0010\u0010\u001a\u00020\u00062\u0006\u0010\u0011\u001a\u00020\u0006H\u0002R\u0016\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u0005X\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u0007R\u000e\u0010\b\u001a\u00020\u0006X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0006X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0006X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0006X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\u0006X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0006X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u000e\u001a\u00020\u0006X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u0012"}, d2 = {"Landroidx/room/TriggerBasedInvalidationTracker$Companion;", "", "<init>", "()V", "TRIGGERS", "", "", "[Ljava/lang/String;", "UPDATE_TABLE_NAME", "TABLE_ID_COLUMN_NAME", "INVALIDATED_COLUMN_NAME", "CREATE_TRACKING_TABLE_SQL", "DROP_TRACKING_TABLE_SQL", "SELECT_UPDATED_TABLES_SQL", "RESET_UPDATED_TABLES_SQL", "getTriggerName", "tableName", "triggerType", "room-runtime"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final String getTriggerName(String tableName, String triggerType) {
            return "room_table_modification_trigger_" + tableName + '_' + triggerType;
        }
    }
}
