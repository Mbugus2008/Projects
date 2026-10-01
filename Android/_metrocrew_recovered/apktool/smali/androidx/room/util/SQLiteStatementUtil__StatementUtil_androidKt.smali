.class final synthetic Landroidx/room/util/SQLiteStatementUtil__StatementUtil_androidKt;
.super Ljava/lang/Object;
.source "StatementUtil.android.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0000\n\u0002\u0010\u0008\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u001a\u0014\u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0004H\u0000\u001a\u0019\u0010\u0005\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0003\u001a\u00020\u0004H\u0002\u00a2\u0006\u0002\u0008\u0006\u00a8\u0006\u0007"
    }
    d2 = {
        "columnIndexOf",
        "",
        "Landroidx/sqlite/SQLiteStatement;",
        "name",
        "",
        "findColumnIndexBySuffix",
        "findColumnIndexBySuffix$SQLiteStatementUtil__StatementUtil_androidKt",
        "room-runtime"
    }
    k = 0x5
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
    xs = "androidx/room/util/SQLiteStatementUtil"
.end annotation


# direct methods
.method public static final columnIndexOf(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I
    .locals 3
    .param p0, "$this$columnIndexOf"    # Landroidx/sqlite/SQLiteStatement;
    .param p1, "name"    # Ljava/lang/String;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "name"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 31
    invoke-static {p0, p1}, Landroidx/room/util/SQLiteStatementUtil;->columnIndexOfCommon(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v0

    .line 32
    .local v0, "index":I
    if-ltz v0, :cond_0

    .line 33
    return v0

    .line 35
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v2, 0x60

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Landroidx/room/util/SQLiteStatementUtil;->columnIndexOfCommon(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v0

    .line 36
    if-ltz v0, :cond_1

    .line 37
    move v1, v0

    goto :goto_0

    .line 39
    :cond_1
    invoke-static {p0, p1}, Landroidx/room/util/SQLiteStatementUtil__StatementUtil_androidKt;->findColumnIndexBySuffix$SQLiteStatementUtil__StatementUtil_androidKt(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I

    move-result v1

    .line 36
    :goto_0
    return v1
.end method

.method private static final findColumnIndexBySuffix$SQLiteStatementUtil__StatementUtil_androidKt(Landroidx/sqlite/SQLiteStatement;Ljava/lang/String;)I
    .locals 11
    .param p0, "$this$findColumnIndexBySuffix"    # Landroidx/sqlite/SQLiteStatement;
    .param p1, "name"    # Ljava/lang/String;

    .line 50
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x19

    const/4 v2, -0x1

    if-gt v0, v1, :cond_5

    move-object v0, p1

    check-cast v0, Ljava/lang/CharSequence;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    if-eqz v0, :cond_1

    goto :goto_2

    .line 53
    :cond_1
    invoke-interface {p0}, Landroidx/sqlite/SQLiteStatement;->getColumnCount()I

    move-result v0

    .line 54
    .local v0, "columnCount":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v4, 0x2e

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 55
    .local v3, "dotSuffix":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x60

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 56
    .local v4, "backtickSuffix":Ljava/lang/String;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    if-ge v6, v0, :cond_4

    .line 57
    invoke-interface {p0, v6}, Landroidx/sqlite/SQLiteStatement;->getColumnName(I)Ljava/lang/String;

    move-result-object v7

    .line 59
    .local v7, "columnName":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v9

    const/4 v10, 0x2

    add-int/2addr v9, v10

    if-lt v8, v9, :cond_3

    .line 60
    const/4 v8, 0x0

    invoke-static {v7, v3, v1, v10, v8}, Lkotlin/text/StringsKt;->endsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 61
    return v6

    .line 62
    :cond_2
    invoke-virtual {v7, v1}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v9, v5, :cond_3

    invoke-static {v7, v4, v1, v10, v8}, Lkotlin/text/StringsKt;->endsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 63
    return v6

    .line 56
    .end local v7    # "columnName":Ljava/lang/String;
    :cond_3
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 67
    .end local v6    # "i":I
    :cond_4
    return v2

    .line 51
    .end local v0    # "columnCount":I
    .end local v3    # "dotSuffix":Ljava/lang/String;
    .end local v4    # "backtickSuffix":Ljava/lang/String;
    :cond_5
    :goto_2
    return v2
.end method
