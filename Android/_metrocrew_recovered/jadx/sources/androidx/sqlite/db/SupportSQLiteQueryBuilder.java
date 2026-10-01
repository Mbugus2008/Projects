package androidx.sqlite.db;

import java.util.regex.Pattern;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;

/* JADX INFO: compiled from: SupportSQLiteQueryBuilder.android.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0011\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\u0018\u0000 \u001e2\u00020\u0001:\u0001\u001eB\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005J\u0006\u0010\u0006\u001a\u00020\u0000J\u001d\u0010\b\u001a\u00020\u00002\u0010\u0010\b\u001a\f\u0012\u0006\b\u0001\u0012\u00020\u0003\u0018\u00010\t¢\u0006\u0002\u0010\u0012J)\u0010\u000b\u001a\u00020\u00002\b\u0010\u000b\u001a\u0004\u0018\u00010\u00032\u0012\u0010\f\u001a\u000e\u0012\b\b\u0001\u0012\u0004\u0018\u00010\u0001\u0018\u00010\t¢\u0006\u0002\u0010\u0013J\u0010\u0010\u000e\u001a\u00020\u00002\b\u0010\u000e\u001a\u0004\u0018\u00010\u0003J\u0010\u0010\u000f\u001a\u00020\u00002\b\u0010\u000f\u001a\u0004\u0018\u00010\u0003J\u0010\u0010\u0010\u001a\u00020\u00002\b\u0010\u0010\u001a\u0004\u0018\u00010\u0003J\u000e\u0010\u0011\u001a\u00020\u00002\u0006\u0010\u0011\u001a\u00020\u0003J\u0006\u0010\u0014\u001a\u00020\u0015J\"\u0010\u0016\u001a\u00020\u0017*\u00060\u0018j\u0002`\u00192\u0006\u0010\u001a\u001a\u00020\u00032\b\u0010\u001b\u001a\u0004\u0018\u00010\u0003H\u0002J%\u0010\u001c\u001a\u00020\u0017*\u00060\u0018j\u0002`\u00192\u000e\u0010\b\u001a\n\u0012\u0006\b\u0001\u0012\u00020\u00030\tH\u0002¢\u0006\u0002\u0010\u001dR\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010\b\u001a\f\u0012\u0006\b\u0001\u0012\u00020\u0003\u0018\u00010\tX\u0082\u000e¢\u0006\u0004\n\u0002\u0010\nR\u0010\u0010\u000b\u001a\u0004\u0018\u00010\u0003X\u0082\u000e¢\u0006\u0002\n\u0000R\u001c\u0010\f\u001a\u000e\u0012\b\b\u0001\u0012\u0004\u0018\u00010\u0001\u0018\u00010\tX\u0082\u000e¢\u0006\u0004\n\u0002\u0010\rR\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u0003X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u000f\u001a\u0004\u0018\u00010\u0003X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0010\u001a\u0004\u0018\u00010\u0003X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0011\u001a\u0004\u0018\u00010\u0003X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u001f"}, d2 = {"Landroidx/sqlite/db/SupportSQLiteQueryBuilder;", "", "table", "", "<init>", "(Ljava/lang/String;)V", "distinct", "", "columns", "", "[Ljava/lang/String;", "selection", "bindArgs", "[Ljava/lang/Object;", "groupBy", "having", "orderBy", "limit", "([Ljava/lang/String;)Landroidx/sqlite/db/SupportSQLiteQueryBuilder;", "(Ljava/lang/String;[Ljava/lang/Object;)Landroidx/sqlite/db/SupportSQLiteQueryBuilder;", "create", "Landroidx/sqlite/db/SupportSQLiteQuery;", "appendClause", "", "Ljava/lang/StringBuilder;", "Lkotlin/text/StringBuilder;", "name", "clause", "appendColumns", "(Ljava/lang/StringBuilder;[Ljava/lang/String;)V", "Companion", "sqlite"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class SupportSQLiteQueryBuilder {

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    private static final Pattern limitPattern = Pattern.compile("\\s*\\d+\\s*(,\\s*\\d+\\s*)?");
    private Object[] bindArgs;
    private String[] columns;
    private boolean distinct;
    private String groupBy;
    private String having;
    private String limit;
    private String orderBy;
    private String selection;
    private final String table;

    public /* synthetic */ SupportSQLiteQueryBuilder(String str, DefaultConstructorMarker defaultConstructorMarker) {
        this(str);
    }

    private SupportSQLiteQueryBuilder(String table) {
        this.table = table;
    }

    public final SupportSQLiteQueryBuilder distinct() {
        SupportSQLiteQueryBuilder $this$distinct_u24lambda_u240 = this;
        $this$distinct_u24lambda_u240.distinct = true;
        return this;
    }

    public final SupportSQLiteQueryBuilder columns(String[] columns) {
        SupportSQLiteQueryBuilder $this$columns_u24lambda_u241 = this;
        $this$columns_u24lambda_u241.columns = columns;
        return this;
    }

    public final SupportSQLiteQueryBuilder selection(String selection, Object[] bindArgs) {
        SupportSQLiteQueryBuilder $this$selection_u24lambda_u242 = this;
        $this$selection_u24lambda_u242.selection = selection;
        $this$selection_u24lambda_u242.bindArgs = bindArgs;
        return this;
    }

    public final SupportSQLiteQueryBuilder groupBy(String groupBy) {
        SupportSQLiteQueryBuilder $this$groupBy_u24lambda_u243 = this;
        $this$groupBy_u24lambda_u243.groupBy = groupBy;
        return this;
    }

    public final SupportSQLiteQueryBuilder having(String having) {
        SupportSQLiteQueryBuilder $this$having_u24lambda_u244 = this;
        $this$having_u24lambda_u244.having = having;
        return this;
    }

    public final SupportSQLiteQueryBuilder orderBy(String orderBy) {
        SupportSQLiteQueryBuilder $this$orderBy_u24lambda_u245 = this;
        $this$orderBy_u24lambda_u245.orderBy = orderBy;
        return this;
    }

    public final SupportSQLiteQueryBuilder limit(String limit) {
        Intrinsics.checkNotNullParameter(limit, "limit");
        SupportSQLiteQueryBuilder $this$limit_u24lambda_u247 = this;
        boolean patternMatches = limitPattern.matcher(limit).matches();
        boolean z = true;
        if (!(limit.length() == 0) && !patternMatches) {
            z = false;
        }
        if (!z) {
            throw new IllegalArgumentException(("invalid LIMIT clauses:" + limit).toString());
        }
        $this$limit_u24lambda_u247.limit = limit;
        return this;
    }

    /* JADX WARN: Code duplicated, block: B:20:0x0029  */
    /* JADX WARN: Code duplicated, block: B:32:0x004f  */
    public final SupportSQLiteQuery create() {
        boolean z;
        boolean z2;
        String str = this.groupBy;
        if (str == null || str.length() == 0) {
            String str2 = this.having;
            if (str2 == null || str2.length() == 0) {
                z = true;
            } else {
                z = false;
            }
        } else {
            z = true;
        }
        if (!z) {
            throw new IllegalArgumentException("HAVING clauses are only permitted when using a groupBy clause".toString());
        }
        StringBuilder $this$create_u24lambda_u249 = new StringBuilder(120);
        $this$create_u24lambda_u249.append("SELECT ");
        if (this.distinct) {
            $this$create_u24lambda_u249.append("DISTINCT ");
        }
        String[] strArr = this.columns;
        if (strArr != null) {
            z2 = strArr.length == 0;
        }
        if (!z2) {
            String[] strArr2 = this.columns;
            Intrinsics.checkNotNull(strArr2);
            appendColumns($this$create_u24lambda_u249, strArr2);
        } else {
            $this$create_u24lambda_u249.append("* ");
        }
        $this$create_u24lambda_u249.append("FROM ");
        $this$create_u24lambda_u249.append(this.table);
        appendClause($this$create_u24lambda_u249, " WHERE ", this.selection);
        appendClause($this$create_u24lambda_u249, " GROUP BY ", this.groupBy);
        appendClause($this$create_u24lambda_u249, " HAVING ", this.having);
        appendClause($this$create_u24lambda_u249, " ORDER BY ", this.orderBy);
        appendClause($this$create_u24lambda_u249, " LIMIT ", this.limit);
        String query = $this$create_u24lambda_u249.toString();
        return new SimpleSQLiteQuery(query, this.bindArgs);
    }

    private final void appendClause(StringBuilder $this$appendClause, String name, String clause) {
        String str = clause;
        if (!(str == null || str.length() == 0)) {
            $this$appendClause.append(name);
            $this$appendClause.append(clause);
        }
    }

    private final void appendColumns(StringBuilder $this$appendColumns, String[] columns) {
        int n = columns.length;
        for (int i = 0; i < n; i++) {
            String column = columns[i];
            if (i > 0) {
                $this$appendColumns.append(", ");
            }
            $this$appendColumns.append(column);
        }
        $this$appendColumns.append(' ');
    }

    /* JADX INFO: compiled from: SupportSQLiteQueryBuilder.android.kt */
    @Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\nH\u0007R\u0016\u0010\u0004\u001a\n \u0006*\u0004\u0018\u00010\u00050\u0005X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u000b"}, d2 = {"Landroidx/sqlite/db/SupportSQLiteQueryBuilder$Companion;", "", "<init>", "()V", "limitPattern", "Ljava/util/regex/Pattern;", "kotlin.jvm.PlatformType", "builder", "Landroidx/sqlite/db/SupportSQLiteQueryBuilder;", "tableName", "", "sqlite"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        @JvmStatic
        public final SupportSQLiteQueryBuilder builder(String tableName) {
            Intrinsics.checkNotNullParameter(tableName, "tableName");
            return new SupportSQLiteQueryBuilder(tableName, null);
        }
    }

    @JvmStatic
    public static final SupportSQLiteQueryBuilder builder(String tableName) {
        return INSTANCE.builder(tableName);
    }
}
