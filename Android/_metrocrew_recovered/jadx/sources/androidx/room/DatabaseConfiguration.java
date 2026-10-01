package androidx.room;

import android.content.Context;
import android.content.Intent;
import androidx.room.migration.AutoMigrationSpec;
import androidx.room.util.MigrationUtil;
import androidx.sqlite.SQLiteDriver;
import androidx.sqlite.db.SupportSQLiteOpenHelper;
import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.ReplaceWith;
import kotlin.collections.CollectionsKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.jvm.internal.Intrinsics;

/* JADX INFO: compiled from: DatabaseConfiguration.android.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0082\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\"\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u001a\b\u0016\u0018\u00002\u00020\u0001Bí\u0001\b\u0007\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u000e\u0010\n\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000b\u0012\u0006\u0010\r\u001a\u00020\u000e\u0012\u0006\u0010\u000f\u001a\u00020\u0010\u0012\u0006\u0010\u0011\u001a\u00020\u0012\u0012\u0006\u0010\u0013\u001a\u00020\u0012\u0012\b\u0010\u0014\u001a\u0004\u0018\u00010\u0015\u0012\u0006\u0010\u0016\u001a\u00020\u000e\u0012\u0006\u0010\u0017\u001a\u00020\u000e\u0012\u000e\u0010\u0018\u001a\n\u0012\u0004\u0012\u00020\u001a\u0018\u00010\u0019\u0012\b\u0010\u001b\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u001c\u001a\u0004\u0018\u00010\u001d\u0012\u000e\u0010\u001e\u001a\n\u0012\u0004\u0012\u00020 \u0018\u00010\u001f\u0012\b\u0010!\u001a\u0004\u0018\u00010\"\u0012\f\u0010#\u001a\b\u0012\u0004\u0012\u00020\u00010\u000b\u0012\f\u0010$\u001a\b\u0012\u0004\u0012\u00020%0\u000b\u0012\u0006\u0010&\u001a\u00020\u000e\u0012\b\u0010'\u001a\u0004\u0018\u00010(\u0012\b\u0010)\u001a\u0004\u0018\u00010*¢\u0006\u0004\b+\u0010,Bk\b\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u000e\u0010\n\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000b\u0012\u0006\u0010\r\u001a\u00020\u000e\u0012\u0006\u0010\u000f\u001a\u00020\u0010\u0012\u0006\u0010\u0011\u001a\u00020\u0012\u0012\u0006\u0010\u0016\u001a\u00020\u000e\u0012\u000e\u0010\u0018\u001a\n\u0012\u0004\u0012\u00020\u001a\u0018\u00010\u0019¢\u0006\u0004\b+\u0010-B\u0083\u0001\b\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u000e\u0010\n\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000b\u0012\u0006\u0010\r\u001a\u00020\u000e\u0012\u0006\u0010\u000f\u001a\u00020\u0010\u0012\u0006\u0010\u0011\u001a\u00020\u0012\u0012\u0006\u0010\u0013\u001a\u00020\u0012\u0012\u0006\u0010.\u001a\u00020\u000e\u0012\u0006\u0010\u0016\u001a\u00020\u000e\u0012\u0006\u0010\u0017\u001a\u00020\u000e\u0012\u000e\u0010\u0018\u001a\n\u0012\u0004\u0012\u00020\u001a\u0018\u00010\u0019¢\u0006\u0004\b+\u0010/B\u0097\u0001\b\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u000e\u0010\n\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000b\u0012\u0006\u0010\r\u001a\u00020\u000e\u0012\u0006\u0010\u000f\u001a\u00020\u0010\u0012\u0006\u0010\u0011\u001a\u00020\u0012\u0012\u0006\u0010\u0013\u001a\u00020\u0012\u0012\u0006\u0010.\u001a\u00020\u000e\u0012\u0006\u0010\u0016\u001a\u00020\u000e\u0012\u0006\u0010\u0017\u001a\u00020\u000e\u0012\u000e\u0010\u0018\u001a\n\u0012\u0004\u0012\u00020\u001a\u0018\u00010\u0019\u0012\b\u0010\u001b\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u001c\u001a\u0004\u0018\u00010\u001d¢\u0006\u0004\b+\u00100B§\u0001\b\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u000e\u0010\n\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000b\u0012\u0006\u0010\r\u001a\u00020\u000e\u0012\u0006\u0010\u000f\u001a\u00020\u0010\u0012\u0006\u0010\u0011\u001a\u00020\u0012\u0012\u0006\u0010\u0013\u001a\u00020\u0012\u0012\u0006\u0010.\u001a\u00020\u000e\u0012\u0006\u0010\u0016\u001a\u00020\u000e\u0012\u0006\u0010\u0017\u001a\u00020\u000e\u0012\u000e\u0010\u0018\u001a\n\u0012\u0004\u0012\u00020\u001a\u0018\u00010\u0019\u0012\b\u0010\u001b\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u001c\u001a\u0004\u0018\u00010\u001d\u0012\u000e\u0010\u001e\u001a\n\u0012\u0004\u0012\u00020 \u0018\u00010\u001f¢\u0006\u0004\b+\u00101B±\u0001\b\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u000e\u0010\n\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000b\u0012\u0006\u0010\r\u001a\u00020\u000e\u0012\u0006\u0010\u000f\u001a\u00020\u0010\u0012\u0006\u0010\u0011\u001a\u00020\u0012\u0012\u0006\u0010\u0013\u001a\u00020\u0012\u0012\u0006\u0010.\u001a\u00020\u000e\u0012\u0006\u0010\u0016\u001a\u00020\u000e\u0012\u0006\u0010\u0017\u001a\u00020\u000e\u0012\u000e\u0010\u0018\u001a\n\u0012\u0004\u0012\u00020\u001a\u0018\u00010\u0019\u0012\b\u0010\u001b\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u001c\u001a\u0004\u0018\u00010\u001d\u0012\u000e\u0010\u001e\u001a\n\u0012\u0004\u0012\u00020 \u0018\u00010\u001f\u0012\b\u0010!\u001a\u0004\u0018\u00010\"¢\u0006\u0004\b+\u00102B¿\u0001\b\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u000e\u0010\n\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000b\u0012\u0006\u0010\r\u001a\u00020\u000e\u0012\u0006\u0010\u000f\u001a\u00020\u0010\u0012\u0006\u0010\u0011\u001a\u00020\u0012\u0012\u0006\u0010\u0013\u001a\u00020\u0012\u0012\u0006\u0010.\u001a\u00020\u000e\u0012\u0006\u0010\u0016\u001a\u00020\u000e\u0012\u0006\u0010\u0017\u001a\u00020\u000e\u0012\u000e\u0010\u0018\u001a\n\u0012\u0004\u0012\u00020\u001a\u0018\u00010\u0019\u0012\b\u0010\u001b\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u001c\u001a\u0004\u0018\u00010\u001d\u0012\u000e\u0010\u001e\u001a\n\u0012\u0004\u0012\u00020 \u0018\u00010\u001f\u0012\b\u0010!\u001a\u0004\u0018\u00010\"\u0012\f\u0010#\u001a\b\u0012\u0004\u0012\u00020\u00010\u000b¢\u0006\u0004\b+\u00103BÍ\u0001\b\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u000e\u0010\n\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000b\u0012\u0006\u0010\r\u001a\u00020\u000e\u0012\u0006\u0010\u000f\u001a\u00020\u0010\u0012\u0006\u0010\u0011\u001a\u00020\u0012\u0012\u0006\u0010\u0013\u001a\u00020\u0012\u0012\u0006\u0010.\u001a\u00020\u000e\u0012\u0006\u0010\u0016\u001a\u00020\u000e\u0012\u0006\u0010\u0017\u001a\u00020\u000e\u0012\u000e\u0010\u0018\u001a\n\u0012\u0004\u0012\u00020\u001a\u0018\u00010\u0019\u0012\b\u0010\u001b\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u001c\u001a\u0004\u0018\u00010\u001d\u0012\u000e\u0010\u001e\u001a\n\u0012\u0004\u0012\u00020 \u0018\u00010\u001f\u0012\b\u0010!\u001a\u0004\u0018\u00010\"\u0012\f\u0010#\u001a\b\u0012\u0004\u0012\u00020\u00010\u000b\u0012\f\u0010$\u001a\b\u0012\u0004\u0012\u00020%0\u000b¢\u0006\u0004\b+\u00104BÏ\u0001\b\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u000e\u0010\n\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000b\u0012\u0006\u0010\r\u001a\u00020\u000e\u0012\u0006\u0010\u000f\u001a\u00020\u0010\u0012\u0006\u0010\u0011\u001a\u00020\u0012\u0012\u0006\u0010\u0013\u001a\u00020\u0012\u0012\b\u0010\u0014\u001a\u0004\u0018\u00010\u0015\u0012\u0006\u0010\u0016\u001a\u00020\u000e\u0012\u0006\u0010\u0017\u001a\u00020\u000e\u0012\u000e\u0010\u0018\u001a\n\u0012\u0004\u0012\u00020\u001a\u0018\u00010\u0019\u0012\b\u0010\u001b\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u001c\u001a\u0004\u0018\u00010\u001d\u0012\u000e\u0010\u001e\u001a\n\u0012\u0004\u0012\u00020 \u0018\u00010\u001f\u0012\b\u0010!\u001a\u0004\u0018\u00010\"\u0012\f\u0010#\u001a\b\u0012\u0004\u0012\u00020\u00010\u000b\u0012\f\u0010$\u001a\b\u0012\u0004\u0012\u00020%0\u000b¢\u0006\u0004\b+\u00105B×\u0001\b\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u000e\u0010\n\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000b\u0012\u0006\u0010\r\u001a\u00020\u000e\u0012\u0006\u0010\u000f\u001a\u00020\u0010\u0012\u0006\u0010\u0011\u001a\u00020\u0012\u0012\u0006\u0010\u0013\u001a\u00020\u0012\u0012\b\u0010\u0014\u001a\u0004\u0018\u00010\u0015\u0012\u0006\u0010\u0016\u001a\u00020\u000e\u0012\u0006\u0010\u0017\u001a\u00020\u000e\u0012\u000e\u0010\u0018\u001a\n\u0012\u0004\u0012\u00020\u001a\u0018\u00010\u0019\u0012\b\u0010\u001b\u001a\u0004\u0018\u00010\u0005\u0012\b\u0010\u001c\u001a\u0004\u0018\u00010\u001d\u0012\u000e\u0010\u001e\u001a\n\u0012\u0004\u0012\u00020 \u0018\u00010\u001f\u0012\b\u0010!\u001a\u0004\u0018\u00010\"\u0012\f\u0010#\u001a\b\u0012\u0004\u0012\u00020\u00010\u000b\u0012\f\u0010$\u001a\b\u0012\u0004\u0012\u00020%0\u000b\u0012\u0006\u0010&\u001a\u00020\u000e¢\u0006\u0004\b+\u00106J\u0010\u0010>\u001a\u00020\u000e2\u0006\u0010?\u001a\u00020\u001aH\u0017J\u0018\u0010@\u001a\u00020\u000e2\u0006\u0010A\u001a\u00020\u001a2\u0006\u0010B\u001a\u00020\u001aH\u0016J\u0098\u0002\u0010C\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u00072\b\b\u0002\u0010\b\u001a\u00020\t2\u0010\b\u0002\u0010\n\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000b2\b\b\u0002\u0010\r\u001a\u00020\u000e2\b\b\u0002\u0010\u000f\u001a\u00020\u00102\b\b\u0002\u0010\u0011\u001a\u00020\u00122\b\b\u0002\u0010\u0013\u001a\u00020\u00122\n\b\u0002\u0010\u0014\u001a\u0004\u0018\u00010\u00152\b\b\u0002\u0010\u0016\u001a\u00020\u000e2\b\b\u0002\u0010\u0017\u001a\u00020\u000e2\u0010\b\u0002\u0010\u0018\u001a\n\u0012\u0004\u0012\u00020\u001a\u0018\u00010\u00192\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u00052\n\b\u0002\u0010\u001c\u001a\u0004\u0018\u00010\u001d2\u0010\b\u0002\u0010\u001e\u001a\n\u0012\u0004\u0012\u00020 \u0018\u00010\u001f2\n\b\u0002\u0010!\u001a\u0004\u0018\u00010\"2\u000e\b\u0002\u0010#\u001a\b\u0012\u0004\u0012\u00020\u00010\u000b2\u000e\b\u0002\u0010$\u001a\b\u0012\u0004\u0012\u00020%0\u000b2\b\b\u0002\u0010&\u001a\u00020\u000e2\n\b\u0002\u0010'\u001a\u0004\u0018\u00010(2\n\b\u0002\u0010)\u001a\u0004\u0018\u00010*H\u0007R\u0010\u0010\u0002\u001a\u00020\u00038\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0012\u0010\u0004\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u00078\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\b\u001a\u00020\t8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0018\u0010\n\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000b8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\r\u001a\u00020\u000e8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u000f\u001a\u00020\u00108\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0011\u001a\u00020\u00128\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0013\u001a\u00020\u00128\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0012\u0010\u0014\u001a\u0004\u0018\u00010\u00158\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0016\u001a\u00020\u000e8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0017\u001a\u00020\u000e8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u001c\u0010\u0018\u001a\n\u0012\u0004\u0012\u00020\u001a\u0018\u00010\u0019X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b7\u00108R\u0012\u0010\u001b\u001a\u0004\u0018\u00010\u00058\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0012\u0010\u001c\u001a\u0004\u0018\u00010\u001d8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0018\u0010\u001e\u001a\n\u0012\u0004\u0012\u00020 \u0018\u00010\u001f8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0012\u0010!\u001a\u0004\u0018\u00010\"8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0016\u0010#\u001a\b\u0012\u0004\u0012\u00020\u00010\u000b8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0016\u0010$\u001a\b\u0012\u0004\u0012\u00020%0\u000b8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0010\u0010&\u001a\u00020\u000e8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0012\u0010'\u001a\u0004\u0018\u00010(8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0012\u0010)\u001a\u0004\u0018\u00010*8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0010\u0010.\u001a\u00020\u000e8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u001a\u00109\u001a\u00020\u000eX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b:\u0010;\"\u0004\b<\u0010=¨\u0006D"}, d2 = {"Landroidx/room/DatabaseConfiguration;", "", "context", "Landroid/content/Context;", "name", "", "sqliteOpenHelperFactory", "Landroidx/sqlite/db/SupportSQLiteOpenHelper$Factory;", "migrationContainer", "Landroidx/room/RoomDatabase$MigrationContainer;", "callbacks", "", "Landroidx/room/RoomDatabase$Callback;", "allowMainThreadQueries", "", "journalMode", "Landroidx/room/RoomDatabase$JournalMode;", "queryExecutor", "Ljava/util/concurrent/Executor;", "transactionExecutor", "multiInstanceInvalidationServiceIntent", "Landroid/content/Intent;", "requireMigration", "allowDestructiveMigrationOnDowngrade", "migrationNotRequiredFrom", "", "", "copyFromAssetPath", "copyFromFile", "Ljava/io/File;", "copyFromInputStream", "Ljava/util/concurrent/Callable;", "Ljava/io/InputStream;", "prepackagedDatabaseCallback", "Landroidx/room/RoomDatabase$PrepackagedDatabaseCallback;", "typeConverters", "autoMigrationSpecs", "Landroidx/room/migration/AutoMigrationSpec;", "allowDestructiveMigrationForAllTables", "sqliteDriver", "Landroidx/sqlite/SQLiteDriver;", "queryCoroutineContext", "Lkotlin/coroutines/CoroutineContext;", "<init>", "(Landroid/content/Context;Ljava/lang/String;Landroidx/sqlite/db/SupportSQLiteOpenHelper$Factory;Landroidx/room/RoomDatabase$MigrationContainer;Ljava/util/List;ZLandroidx/room/RoomDatabase$JournalMode;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Landroid/content/Intent;ZZLjava/util/Set;Ljava/lang/String;Ljava/io/File;Ljava/util/concurrent/Callable;Landroidx/room/RoomDatabase$PrepackagedDatabaseCallback;Ljava/util/List;Ljava/util/List;ZLandroidx/sqlite/SQLiteDriver;Lkotlin/coroutines/CoroutineContext;)V", "(Landroid/content/Context;Ljava/lang/String;Landroidx/sqlite/db/SupportSQLiteOpenHelper$Factory;Landroidx/room/RoomDatabase$MigrationContainer;Ljava/util/List;ZLandroidx/room/RoomDatabase$JournalMode;Ljava/util/concurrent/Executor;ZLjava/util/Set;)V", "multiInstanceInvalidation", "(Landroid/content/Context;Ljava/lang/String;Landroidx/sqlite/db/SupportSQLiteOpenHelper$Factory;Landroidx/room/RoomDatabase$MigrationContainer;Ljava/util/List;ZLandroidx/room/RoomDatabase$JournalMode;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;ZZZLjava/util/Set;)V", "(Landroid/content/Context;Ljava/lang/String;Landroidx/sqlite/db/SupportSQLiteOpenHelper$Factory;Landroidx/room/RoomDatabase$MigrationContainer;Ljava/util/List;ZLandroidx/room/RoomDatabase$JournalMode;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;ZZZLjava/util/Set;Ljava/lang/String;Ljava/io/File;)V", "(Landroid/content/Context;Ljava/lang/String;Landroidx/sqlite/db/SupportSQLiteOpenHelper$Factory;Landroidx/room/RoomDatabase$MigrationContainer;Ljava/util/List;ZLandroidx/room/RoomDatabase$JournalMode;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;ZZZLjava/util/Set;Ljava/lang/String;Ljava/io/File;Ljava/util/concurrent/Callable;)V", "(Landroid/content/Context;Ljava/lang/String;Landroidx/sqlite/db/SupportSQLiteOpenHelper$Factory;Landroidx/room/RoomDatabase$MigrationContainer;Ljava/util/List;ZLandroidx/room/RoomDatabase$JournalMode;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;ZZZLjava/util/Set;Ljava/lang/String;Ljava/io/File;Ljava/util/concurrent/Callable;Landroidx/room/RoomDatabase$PrepackagedDatabaseCallback;)V", "(Landroid/content/Context;Ljava/lang/String;Landroidx/sqlite/db/SupportSQLiteOpenHelper$Factory;Landroidx/room/RoomDatabase$MigrationContainer;Ljava/util/List;ZLandroidx/room/RoomDatabase$JournalMode;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;ZZZLjava/util/Set;Ljava/lang/String;Ljava/io/File;Ljava/util/concurrent/Callable;Landroidx/room/RoomDatabase$PrepackagedDatabaseCallback;Ljava/util/List;)V", "(Landroid/content/Context;Ljava/lang/String;Landroidx/sqlite/db/SupportSQLiteOpenHelper$Factory;Landroidx/room/RoomDatabase$MigrationContainer;Ljava/util/List;ZLandroidx/room/RoomDatabase$JournalMode;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;ZZZLjava/util/Set;Ljava/lang/String;Ljava/io/File;Ljava/util/concurrent/Callable;Landroidx/room/RoomDatabase$PrepackagedDatabaseCallback;Ljava/util/List;Ljava/util/List;)V", "(Landroid/content/Context;Ljava/lang/String;Landroidx/sqlite/db/SupportSQLiteOpenHelper$Factory;Landroidx/room/RoomDatabase$MigrationContainer;Ljava/util/List;ZLandroidx/room/RoomDatabase$JournalMode;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Landroid/content/Intent;ZZLjava/util/Set;Ljava/lang/String;Ljava/io/File;Ljava/util/concurrent/Callable;Landroidx/room/RoomDatabase$PrepackagedDatabaseCallback;Ljava/util/List;Ljava/util/List;)V", "(Landroid/content/Context;Ljava/lang/String;Landroidx/sqlite/db/SupportSQLiteOpenHelper$Factory;Landroidx/room/RoomDatabase$MigrationContainer;Ljava/util/List;ZLandroidx/room/RoomDatabase$JournalMode;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Landroid/content/Intent;ZZLjava/util/Set;Ljava/lang/String;Ljava/io/File;Ljava/util/concurrent/Callable;Landroidx/room/RoomDatabase$PrepackagedDatabaseCallback;Ljava/util/List;Ljava/util/List;Z)V", "getMigrationNotRequiredFrom$room_runtime", "()Ljava/util/Set;", "useTempTrackingTable", "getUseTempTrackingTable$room_runtime", "()Z", "setUseTempTrackingTable$room_runtime", "(Z)V", "isMigrationRequiredFrom", "version", "isMigrationRequired", "fromVersion", "toVersion", "copy", "room-runtime"}, k = 1, mv = {2, 1, 0}, xi = 48)
public class DatabaseConfiguration {
    public final boolean allowDestructiveMigrationForAllTables;
    public final boolean allowDestructiveMigrationOnDowngrade;
    public final boolean allowMainThreadQueries;
    public final List<AutoMigrationSpec> autoMigrationSpecs;
    public final List<RoomDatabase.Callback> callbacks;
    public final Context context;
    public final String copyFromAssetPath;
    public final File copyFromFile;
    public final Callable<InputStream> copyFromInputStream;
    public final RoomDatabase.JournalMode journalMode;
    public final RoomDatabase.MigrationContainer migrationContainer;
    private final Set<Integer> migrationNotRequiredFrom;
    public final boolean multiInstanceInvalidation;
    public final Intent multiInstanceInvalidationServiceIntent;
    public final String name;
    public final RoomDatabase.PrepackagedDatabaseCallback prepackagedDatabaseCallback;
    public final CoroutineContext queryCoroutineContext;
    public final Executor queryExecutor;
    public final boolean requireMigration;
    public final SQLiteDriver sqliteDriver;
    public final SupportSQLiteOpenHelper.Factory sqliteOpenHelperFactory;
    public final Executor transactionExecutor;
    public final List<Object> typeConverters;
    private boolean useTempTrackingTable;

    /* JADX WARN: Multi-variable type inference failed */
    public DatabaseConfiguration(Context context, String name, SupportSQLiteOpenHelper.Factory sqliteOpenHelperFactory, RoomDatabase.MigrationContainer migrationContainer, List<? extends RoomDatabase.Callback> list, boolean allowMainThreadQueries, RoomDatabase.JournalMode journalMode, Executor queryExecutor, Executor transactionExecutor, Intent multiInstanceInvalidationServiceIntent, boolean requireMigration, boolean allowDestructiveMigrationOnDowngrade, Set<Integer> set, String copyFromAssetPath, File copyFromFile, Callable<InputStream> callable, RoomDatabase.PrepackagedDatabaseCallback prepackagedDatabaseCallback, List<? extends Object> typeConverters, List<? extends AutoMigrationSpec> autoMigrationSpecs, boolean allowDestructiveMigrationForAllTables, SQLiteDriver sqliteDriver, CoroutineContext queryCoroutineContext) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(migrationContainer, "migrationContainer");
        Intrinsics.checkNotNullParameter(journalMode, "journalMode");
        Intrinsics.checkNotNullParameter(queryExecutor, "queryExecutor");
        Intrinsics.checkNotNullParameter(transactionExecutor, "transactionExecutor");
        Intrinsics.checkNotNullParameter(typeConverters, "typeConverters");
        Intrinsics.checkNotNullParameter(autoMigrationSpecs, "autoMigrationSpecs");
        this.context = context;
        this.name = name;
        this.sqliteOpenHelperFactory = sqliteOpenHelperFactory;
        this.migrationContainer = migrationContainer;
        this.callbacks = list;
        this.allowMainThreadQueries = allowMainThreadQueries;
        this.journalMode = journalMode;
        this.queryExecutor = queryExecutor;
        this.transactionExecutor = transactionExecutor;
        this.multiInstanceInvalidationServiceIntent = multiInstanceInvalidationServiceIntent;
        this.requireMigration = requireMigration;
        this.allowDestructiveMigrationOnDowngrade = allowDestructiveMigrationOnDowngrade;
        this.migrationNotRequiredFrom = set;
        this.copyFromAssetPath = copyFromAssetPath;
        this.copyFromFile = copyFromFile;
        this.copyFromInputStream = callable;
        this.prepackagedDatabaseCallback = prepackagedDatabaseCallback;
        this.typeConverters = typeConverters;
        this.autoMigrationSpecs = autoMigrationSpecs;
        this.allowDestructiveMigrationForAllTables = allowDestructiveMigrationForAllTables;
        this.sqliteDriver = sqliteDriver;
        this.queryCoroutineContext = queryCoroutineContext;
        this.multiInstanceInvalidation = this.multiInstanceInvalidationServiceIntent != null;
        this.useTempTrackingTable = true;
    }

    public final Set<Integer> getMigrationNotRequiredFrom$room_runtime() {
        return this.migrationNotRequiredFrom;
    }

    /* JADX INFO: renamed from: getUseTempTrackingTable$room_runtime, reason: from getter */
    public final boolean getUseTempTrackingTable() {
        return this.useTempTrackingTable;
    }

    public final void setUseTempTrackingTable$room_runtime(boolean z) {
        this.useTempTrackingTable = z;
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated(message = "This constructor is deprecated.")
    public DatabaseConfiguration(Context context, String name, SupportSQLiteOpenHelper.Factory sqliteOpenHelperFactory, RoomDatabase.MigrationContainer migrationContainer, List<? extends RoomDatabase.Callback> list, boolean allowMainThreadQueries, RoomDatabase.JournalMode journalMode, Executor queryExecutor, boolean requireMigration, Set<Integer> set) {
        this(context, name, sqliteOpenHelperFactory, migrationContainer, list, allowMainThreadQueries, journalMode, queryExecutor, queryExecutor, null, requireMigration, false, set, null, null, null, null, CollectionsKt.emptyList(), CollectionsKt.emptyList(), false, null, null);
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(sqliteOpenHelperFactory, "sqliteOpenHelperFactory");
        Intrinsics.checkNotNullParameter(migrationContainer, "migrationContainer");
        Intrinsics.checkNotNullParameter(journalMode, "journalMode");
        Intrinsics.checkNotNullParameter(queryExecutor, "queryExecutor");
    }

    @Deprecated(message = "This constructor is deprecated.")
    public DatabaseConfiguration(Context context, String name, SupportSQLiteOpenHelper.Factory sqliteOpenHelperFactory, RoomDatabase.MigrationContainer migrationContainer, List<? extends RoomDatabase.Callback> list, boolean allowMainThreadQueries, RoomDatabase.JournalMode journalMode, Executor queryExecutor, Executor transactionExecutor, boolean multiInstanceInvalidation, boolean requireMigration, boolean allowDestructiveMigrationOnDowngrade, Set<Integer> set) {
        Intent intent;
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(sqliteOpenHelperFactory, "sqliteOpenHelperFactory");
        Intrinsics.checkNotNullParameter(migrationContainer, "migrationContainer");
        Intrinsics.checkNotNullParameter(journalMode, "journalMode");
        Intrinsics.checkNotNullParameter(queryExecutor, "queryExecutor");
        Intrinsics.checkNotNullParameter(transactionExecutor, "transactionExecutor");
        if (multiInstanceInvalidation) {
            intent = new Intent(context, (Class<?>) MultiInstanceInvalidationService.class);
        } else {
            intent = null;
        }
        this(context, name, sqliteOpenHelperFactory, migrationContainer, list, allowMainThreadQueries, journalMode, queryExecutor, transactionExecutor, intent, requireMigration, allowDestructiveMigrationOnDowngrade, set, null, null, null, null, CollectionsKt.emptyList(), CollectionsKt.emptyList(), false, null, null);
    }

    @Deprecated(message = "This constructor is deprecated.")
    public DatabaseConfiguration(Context context, String name, SupportSQLiteOpenHelper.Factory sqliteOpenHelperFactory, RoomDatabase.MigrationContainer migrationContainer, List<? extends RoomDatabase.Callback> list, boolean allowMainThreadQueries, RoomDatabase.JournalMode journalMode, Executor queryExecutor, Executor transactionExecutor, boolean multiInstanceInvalidation, boolean requireMigration, boolean allowDestructiveMigrationOnDowngrade, Set<Integer> set, String copyFromAssetPath, File copyFromFile) {
        Intent intent;
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(sqliteOpenHelperFactory, "sqliteOpenHelperFactory");
        Intrinsics.checkNotNullParameter(migrationContainer, "migrationContainer");
        Intrinsics.checkNotNullParameter(journalMode, "journalMode");
        Intrinsics.checkNotNullParameter(queryExecutor, "queryExecutor");
        Intrinsics.checkNotNullParameter(transactionExecutor, "transactionExecutor");
        if (multiInstanceInvalidation) {
            intent = new Intent(context, (Class<?>) MultiInstanceInvalidationService.class);
        } else {
            intent = null;
        }
        this(context, name, sqliteOpenHelperFactory, migrationContainer, list, allowMainThreadQueries, journalMode, queryExecutor, transactionExecutor, intent, requireMigration, allowDestructiveMigrationOnDowngrade, set, copyFromAssetPath, copyFromFile, null, null, CollectionsKt.emptyList(), CollectionsKt.emptyList(), false, null, null);
    }

    @Deprecated(message = "This constructor is deprecated.")
    public DatabaseConfiguration(Context context, String name, SupportSQLiteOpenHelper.Factory sqliteOpenHelperFactory, RoomDatabase.MigrationContainer migrationContainer, List<? extends RoomDatabase.Callback> list, boolean allowMainThreadQueries, RoomDatabase.JournalMode journalMode, Executor queryExecutor, Executor transactionExecutor, boolean multiInstanceInvalidation, boolean requireMigration, boolean allowDestructiveMigrationOnDowngrade, Set<Integer> set, String copyFromAssetPath, File copyFromFile, Callable<InputStream> callable) {
        Intent intent;
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(sqliteOpenHelperFactory, "sqliteOpenHelperFactory");
        Intrinsics.checkNotNullParameter(migrationContainer, "migrationContainer");
        Intrinsics.checkNotNullParameter(journalMode, "journalMode");
        Intrinsics.checkNotNullParameter(queryExecutor, "queryExecutor");
        Intrinsics.checkNotNullParameter(transactionExecutor, "transactionExecutor");
        if (multiInstanceInvalidation) {
            intent = new Intent(context, (Class<?>) MultiInstanceInvalidationService.class);
        } else {
            intent = null;
        }
        this(context, name, sqliteOpenHelperFactory, migrationContainer, list, allowMainThreadQueries, journalMode, queryExecutor, transactionExecutor, intent, requireMigration, allowDestructiveMigrationOnDowngrade, set, copyFromAssetPath, copyFromFile, callable, null, CollectionsKt.emptyList(), CollectionsKt.emptyList(), false, null, null);
    }

    @Deprecated(message = "This constructor is deprecated.")
    public DatabaseConfiguration(Context context, String name, SupportSQLiteOpenHelper.Factory sqliteOpenHelperFactory, RoomDatabase.MigrationContainer migrationContainer, List<? extends RoomDatabase.Callback> list, boolean allowMainThreadQueries, RoomDatabase.JournalMode journalMode, Executor queryExecutor, Executor transactionExecutor, boolean multiInstanceInvalidation, boolean requireMigration, boolean allowDestructiveMigrationOnDowngrade, Set<Integer> set, String copyFromAssetPath, File copyFromFile, Callable<InputStream> callable, RoomDatabase.PrepackagedDatabaseCallback prepackagedDatabaseCallback) {
        Intent intent;
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(sqliteOpenHelperFactory, "sqliteOpenHelperFactory");
        Intrinsics.checkNotNullParameter(migrationContainer, "migrationContainer");
        Intrinsics.checkNotNullParameter(journalMode, "journalMode");
        Intrinsics.checkNotNullParameter(queryExecutor, "queryExecutor");
        Intrinsics.checkNotNullParameter(transactionExecutor, "transactionExecutor");
        if (multiInstanceInvalidation) {
            intent = new Intent(context, (Class<?>) MultiInstanceInvalidationService.class);
        } else {
            intent = null;
        }
        this(context, name, sqliteOpenHelperFactory, migrationContainer, list, allowMainThreadQueries, journalMode, queryExecutor, transactionExecutor, intent, requireMigration, allowDestructiveMigrationOnDowngrade, set, copyFromAssetPath, copyFromFile, callable, prepackagedDatabaseCallback, CollectionsKt.emptyList(), CollectionsKt.emptyList(), false, null, null);
    }

    @Deprecated(message = "This constructor is deprecated.")
    public DatabaseConfiguration(Context context, String name, SupportSQLiteOpenHelper.Factory sqliteOpenHelperFactory, RoomDatabase.MigrationContainer migrationContainer, List<? extends RoomDatabase.Callback> list, boolean allowMainThreadQueries, RoomDatabase.JournalMode journalMode, Executor queryExecutor, Executor transactionExecutor, boolean multiInstanceInvalidation, boolean requireMigration, boolean allowDestructiveMigrationOnDowngrade, Set<Integer> set, String copyFromAssetPath, File copyFromFile, Callable<InputStream> callable, RoomDatabase.PrepackagedDatabaseCallback prepackagedDatabaseCallback, List<? extends Object> typeConverters) {
        Intent intent;
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(sqliteOpenHelperFactory, "sqliteOpenHelperFactory");
        Intrinsics.checkNotNullParameter(migrationContainer, "migrationContainer");
        Intrinsics.checkNotNullParameter(journalMode, "journalMode");
        Intrinsics.checkNotNullParameter(queryExecutor, "queryExecutor");
        Intrinsics.checkNotNullParameter(transactionExecutor, "transactionExecutor");
        Intrinsics.checkNotNullParameter(typeConverters, "typeConverters");
        if (multiInstanceInvalidation) {
            intent = new Intent(context, (Class<?>) MultiInstanceInvalidationService.class);
        } else {
            intent = null;
        }
        this(context, name, sqliteOpenHelperFactory, migrationContainer, list, allowMainThreadQueries, journalMode, queryExecutor, transactionExecutor, intent, requireMigration, allowDestructiveMigrationOnDowngrade, set, copyFromAssetPath, copyFromFile, callable, prepackagedDatabaseCallback, typeConverters, CollectionsKt.emptyList(), false, null, null);
    }

    @Deprecated(message = "This constructor is deprecated.")
    public DatabaseConfiguration(Context context, String name, SupportSQLiteOpenHelper.Factory sqliteOpenHelperFactory, RoomDatabase.MigrationContainer migrationContainer, List<? extends RoomDatabase.Callback> list, boolean allowMainThreadQueries, RoomDatabase.JournalMode journalMode, Executor queryExecutor, Executor transactionExecutor, boolean multiInstanceInvalidation, boolean requireMigration, boolean allowDestructiveMigrationOnDowngrade, Set<Integer> set, String copyFromAssetPath, File copyFromFile, Callable<InputStream> callable, RoomDatabase.PrepackagedDatabaseCallback prepackagedDatabaseCallback, List<? extends Object> typeConverters, List<? extends AutoMigrationSpec> autoMigrationSpecs) {
        Intent intent;
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(sqliteOpenHelperFactory, "sqliteOpenHelperFactory");
        Intrinsics.checkNotNullParameter(migrationContainer, "migrationContainer");
        Intrinsics.checkNotNullParameter(journalMode, "journalMode");
        Intrinsics.checkNotNullParameter(queryExecutor, "queryExecutor");
        Intrinsics.checkNotNullParameter(transactionExecutor, "transactionExecutor");
        Intrinsics.checkNotNullParameter(typeConverters, "typeConverters");
        Intrinsics.checkNotNullParameter(autoMigrationSpecs, "autoMigrationSpecs");
        if (multiInstanceInvalidation) {
            intent = new Intent(context, (Class<?>) MultiInstanceInvalidationService.class);
        } else {
            intent = null;
        }
        this(context, name, sqliteOpenHelperFactory, migrationContainer, list, allowMainThreadQueries, journalMode, queryExecutor, transactionExecutor, intent, requireMigration, allowDestructiveMigrationOnDowngrade, set, copyFromAssetPath, copyFromFile, callable, null, typeConverters, autoMigrationSpecs, false, null, null);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated(message = "This constructor is deprecated.")
    public DatabaseConfiguration(Context context, String name, SupportSQLiteOpenHelper.Factory sqliteOpenHelperFactory, RoomDatabase.MigrationContainer migrationContainer, List<? extends RoomDatabase.Callback> list, boolean allowMainThreadQueries, RoomDatabase.JournalMode journalMode, Executor queryExecutor, Executor transactionExecutor, Intent multiInstanceInvalidationServiceIntent, boolean requireMigration, boolean allowDestructiveMigrationOnDowngrade, Set<Integer> set, String copyFromAssetPath, File copyFromFile, Callable<InputStream> callable, RoomDatabase.PrepackagedDatabaseCallback prepackagedDatabaseCallback, List<? extends Object> typeConverters, List<? extends AutoMigrationSpec> autoMigrationSpecs) {
        this(context, name, sqliteOpenHelperFactory, migrationContainer, list, allowMainThreadQueries, journalMode, queryExecutor, transactionExecutor, multiInstanceInvalidationServiceIntent, requireMigration, allowDestructiveMigrationOnDowngrade, set, copyFromAssetPath, copyFromFile, callable, null, typeConverters, autoMigrationSpecs, false, null, null);
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(sqliteOpenHelperFactory, "sqliteOpenHelperFactory");
        Intrinsics.checkNotNullParameter(migrationContainer, "migrationContainer");
        Intrinsics.checkNotNullParameter(journalMode, "journalMode");
        Intrinsics.checkNotNullParameter(queryExecutor, "queryExecutor");
        Intrinsics.checkNotNullParameter(transactionExecutor, "transactionExecutor");
        Intrinsics.checkNotNullParameter(typeConverters, "typeConverters");
        Intrinsics.checkNotNullParameter(autoMigrationSpecs, "autoMigrationSpecs");
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    @Deprecated(message = "This constructor is deprecated.")
    public DatabaseConfiguration(Context context, String name, SupportSQLiteOpenHelper.Factory sqliteOpenHelperFactory, RoomDatabase.MigrationContainer migrationContainer, List<? extends RoomDatabase.Callback> list, boolean allowMainThreadQueries, RoomDatabase.JournalMode journalMode, Executor queryExecutor, Executor transactionExecutor, Intent multiInstanceInvalidationServiceIntent, boolean requireMigration, boolean allowDestructiveMigrationOnDowngrade, Set<Integer> set, String copyFromAssetPath, File copyFromFile, Callable<InputStream> callable, RoomDatabase.PrepackagedDatabaseCallback prepackagedDatabaseCallback, List<? extends Object> typeConverters, List<? extends AutoMigrationSpec> autoMigrationSpecs, boolean allowDestructiveMigrationForAllTables) {
        this(context, name, sqliteOpenHelperFactory, migrationContainer, list, allowMainThreadQueries, journalMode, queryExecutor, transactionExecutor, multiInstanceInvalidationServiceIntent, requireMigration, allowDestructiveMigrationOnDowngrade, set, copyFromAssetPath, copyFromFile, callable, null, typeConverters, autoMigrationSpecs, allowDestructiveMigrationForAllTables, null, null);
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(sqliteOpenHelperFactory, "sqliteOpenHelperFactory");
        Intrinsics.checkNotNullParameter(migrationContainer, "migrationContainer");
        Intrinsics.checkNotNullParameter(journalMode, "journalMode");
        Intrinsics.checkNotNullParameter(queryExecutor, "queryExecutor");
        Intrinsics.checkNotNullParameter(transactionExecutor, "transactionExecutor");
        Intrinsics.checkNotNullParameter(typeConverters, "typeConverters");
        Intrinsics.checkNotNullParameter(autoMigrationSpecs, "autoMigrationSpecs");
    }

    @Deprecated(message = "Use [isMigrationRequired(int, int)] which takes\n      [allowDestructiveMigrationOnDowngrade] into account.", replaceWith = @ReplaceWith(expression = "isMigrationRequired(version, version + 1)", imports = {}))
    public boolean isMigrationRequiredFrom(int version) {
        return isMigrationRequired(version, version + 1);
    }

    public boolean isMigrationRequired(int fromVersion, int toVersion) {
        return MigrationUtil.isMigrationRequired(this, fromVersion, toVersion);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static /* synthetic */ DatabaseConfiguration copy$default(DatabaseConfiguration databaseConfiguration, Context context, String str, SupportSQLiteOpenHelper.Factory factory, RoomDatabase.MigrationContainer migrationContainer, List list, boolean z, RoomDatabase.JournalMode journalMode, Executor executor, Executor executor2, Intent intent, boolean z2, boolean z3, Set set, String str2, File file, Callable callable, RoomDatabase.PrepackagedDatabaseCallback prepackagedDatabaseCallback, List list2, List list3, boolean z4, SQLiteDriver sQLiteDriver, CoroutineContext coroutineContext, int i, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: copy");
        }
        Context context2 = (i & 1) != 0 ? databaseConfiguration.context : context;
        return databaseConfiguration.copy(context2, (i & 2) != 0 ? databaseConfiguration.name : str, (i & 4) != 0 ? databaseConfiguration.sqliteOpenHelperFactory : factory, (i & 8) != 0 ? databaseConfiguration.migrationContainer : migrationContainer, (i & 16) != 0 ? databaseConfiguration.callbacks : list, (i & 32) != 0 ? databaseConfiguration.allowMainThreadQueries : z, (i & 64) != 0 ? databaseConfiguration.journalMode : journalMode, (i & 128) != 0 ? databaseConfiguration.queryExecutor : executor, (i & 256) != 0 ? databaseConfiguration.transactionExecutor : executor2, (i & 512) != 0 ? databaseConfiguration.multiInstanceInvalidationServiceIntent : intent, (i & 1024) != 0 ? databaseConfiguration.requireMigration : z2, (i & 2048) != 0 ? databaseConfiguration.allowDestructiveMigrationOnDowngrade : z3, (i & 4096) != 0 ? databaseConfiguration.migrationNotRequiredFrom : set, (i & 8192) != 0 ? databaseConfiguration.copyFromAssetPath : str2, (i & 16384) != 0 ? databaseConfiguration.copyFromFile : file, (i & 32768) != 0 ? databaseConfiguration.copyFromInputStream : callable, (i & 65536) != 0 ? databaseConfiguration.prepackagedDatabaseCallback : prepackagedDatabaseCallback, (i & 131072) != 0 ? databaseConfiguration.typeConverters : list2, (i & 262144) != 0 ? databaseConfiguration.autoMigrationSpecs : list3, (i & 524288) != 0 ? databaseConfiguration.allowDestructiveMigrationForAllTables : z4, (i & 1048576) != 0 ? databaseConfiguration.sqliteDriver : sQLiteDriver, (i & 2097152) != 0 ? databaseConfiguration.queryCoroutineContext : coroutineContext);
    }

    public final DatabaseConfiguration copy(Context context, String name, SupportSQLiteOpenHelper.Factory sqliteOpenHelperFactory, RoomDatabase.MigrationContainer migrationContainer, List<? extends RoomDatabase.Callback> callbacks, boolean allowMainThreadQueries, RoomDatabase.JournalMode journalMode, Executor queryExecutor, Executor transactionExecutor, Intent multiInstanceInvalidationServiceIntent, boolean requireMigration, boolean allowDestructiveMigrationOnDowngrade, Set<Integer> migrationNotRequiredFrom, String copyFromAssetPath, File copyFromFile, Callable<InputStream> copyFromInputStream, RoomDatabase.PrepackagedDatabaseCallback prepackagedDatabaseCallback, List<? extends Object> typeConverters, List<? extends AutoMigrationSpec> autoMigrationSpecs, boolean allowDestructiveMigrationForAllTables, SQLiteDriver sqliteDriver, CoroutineContext queryCoroutineContext) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(migrationContainer, "migrationContainer");
        Intrinsics.checkNotNullParameter(journalMode, "journalMode");
        Intrinsics.checkNotNullParameter(queryExecutor, "queryExecutor");
        Intrinsics.checkNotNullParameter(transactionExecutor, "transactionExecutor");
        Intrinsics.checkNotNullParameter(typeConverters, "typeConverters");
        Intrinsics.checkNotNullParameter(autoMigrationSpecs, "autoMigrationSpecs");
        return new DatabaseConfiguration(context, name, sqliteOpenHelperFactory, migrationContainer, callbacks, allowMainThreadQueries, journalMode, queryExecutor, transactionExecutor, multiInstanceInvalidationServiceIntent, requireMigration, allowDestructiveMigrationOnDowngrade, migrationNotRequiredFrom, copyFromAssetPath, copyFromFile, copyFromInputStream, prepackagedDatabaseCallback, typeConverters, autoMigrationSpecs, allowDestructiveMigrationForAllTables, sqliteDriver, queryCoroutineContext);
    }
}
