package androidx.room;

import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.room.migration.AutoMigrationSpec;
import androidx.room.migration.Migration;
import androidx.room.util.DBUtil;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;
import kotlinx.coroutines.BuildersKt;
import kotlinx.coroutines.CoroutineScope;

/* JADX INFO: compiled from: RoomDatabase.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u00008\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\"\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a<\u0010\u0000\u001a\u0002H\u0001\"\u0004\b\u0000\u0010\u0001*\u00020\u00022\"\u0010\u0003\u001a\u001e\b\u0001\u0012\u0004\u0012\u00020\u0005\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u00010\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u0004H\u0086@¢\u0006\u0002\u0010\b\u001a<\u0010\t\u001a\u0002H\u0001\"\u0004\b\u0000\u0010\u0001*\u00020\u00022\"\u0010\u0003\u001a\u001e\b\u0001\u0012\u0004\u0012\u00020\u0005\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u00010\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00070\u0004H\u0086@¢\u0006\u0002\u0010\b\u001a$\u0010\n\u001a\u00020\u000b2\f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000e0\r2\f\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\u000e0\rH\u0000\u001a\u0014\u0010\u0010\u001a\u00020\u000b*\u00020\u00022\u0006\u0010\u0011\u001a\u00020\u0012H\u0000\u001a\u0014\u0010\u0013\u001a\u00020\u000b*\u00020\u00022\u0006\u0010\u0011\u001a\u00020\u0012H\u0000¨\u0006\u0014"}, d2 = {"useReaderConnection", "R", "Landroidx/room/RoomDatabase;", "block", "Lkotlin/Function2;", "Landroidx/room/Transactor;", "Lkotlin/coroutines/Continuation;", "", "(Landroidx/room/RoomDatabase;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "useWriterConnection", "validateMigrationsNotRequired", "", "migrationStartAndEndVersions", "", "", "migrationsNotRequiredFrom", "validateAutoMigrations", "configuration", "Landroidx/room/DatabaseConfiguration;", "validateTypeConverters", "room-runtime"}, k = 5, mv = {2, 1, 0}, xi = 48, xs = "androidx/room/RoomDatabaseKt")
final /* synthetic */ class RoomDatabaseKt__RoomDatabaseKt {

    /* JADX INFO: renamed from: androidx.room.RoomDatabaseKt__RoomDatabaseKt$useReaderConnection$1, reason: invalid class name */
    /* JADX INFO: compiled from: RoomDatabase.kt */
    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "androidx.room.RoomDatabaseKt__RoomDatabaseKt", f = "RoomDatabase.kt", i = {0, 0}, l = {471, 471}, m = "useReaderConnection", n = {"$this$useReaderConnection", "block"}, s = {"L$0", "L$1"})
    static final class AnonymousClass1<R> extends ContinuationImpl {
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return RoomDatabaseKt.useReaderConnection(null, null, this);
        }
    }

    /* JADX INFO: renamed from: androidx.room.RoomDatabaseKt__RoomDatabaseKt$useWriterConnection$1, reason: invalid class name and case insensitive filesystem */
    /* JADX INFO: compiled from: RoomDatabase.kt */
    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "androidx.room.RoomDatabaseKt__RoomDatabaseKt", f = "RoomDatabase.kt", i = {0, 0, 1}, l = {501, 501}, m = "useWriterConnection", n = {"$this$useWriterConnection", "block", "$this$useWriterConnection"}, s = {"L$0", "L$1", "L$0"})
    static final class C00461<R> extends ContinuationImpl {
        Object L$0;
        Object L$1;
        int label;
        /* synthetic */ Object result;

        C00461(Continuation<? super C00461> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return RoomDatabaseKt.useWriterConnection(null, null, this);
        }
    }

    /* JADX INFO: Add missing generic type declarations: [R] */
    /* JADX INFO: renamed from: androidx.room.RoomDatabaseKt__RoomDatabaseKt$useReaderConnection$2, reason: invalid class name */
    /* JADX INFO: compiled from: RoomDatabase.kt */
    @Metadata(d1 = {"\u0000\b\n\u0002\b\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u0002H\u0001\"\u0004\b\u0000\u0010\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "R", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "androidx.room.RoomDatabaseKt__RoomDatabaseKt$useReaderConnection$2", f = "RoomDatabase.kt", i = {}, l = {472}, m = "invokeSuspend", n = {}, s = {})
    static final class AnonymousClass2<R> extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super R>, Object> {
        final /* synthetic */ Function2<Transactor, Continuation<? super R>, Object> $block;
        final /* synthetic */ RoomDatabase $this_useReaderConnection;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        AnonymousClass2(RoomDatabase roomDatabase, Function2<? super Transactor, ? super Continuation<? super R>, ? extends Object> function2, Continuation<? super AnonymousClass2> continuation) {
            super(2, continuation);
            this.$this_useReaderConnection = roomDatabase;
            this.$block = function2;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new AnonymousClass2(this.$this_useReaderConnection, this.$block, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(CoroutineScope coroutineScope, Continuation<? super R> continuation) {
            return ((AnonymousClass2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object $result) throws Throwable {
            Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
            switch (this.label) {
                case 0:
                    ResultKt.throwOnFailure($result);
                    this.label = 1;
                    Object objUseConnection = this.$this_useReaderConnection.useConnection(true, this.$block, this);
                    if (objUseConnection == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    return objUseConnection;
                case 1:
                    ResultKt.throwOnFailure($result);
                    return $result;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
    }

    /* JADX WARN: Code duplicated, block: B:7:0x0014  */
    public static final <R> Object useReaderConnection(RoomDatabase $this$useReaderConnection, Function2<? super Transactor, ? super Continuation<? super R>, ? extends Object> function2, Continuation<? super R> continuation) throws Throwable {
        AnonymousClass1 anonymousClass1;
        Object coroutineContext;
        RoomDatabase $this$useReaderConnection2;
        Function2<? super Transactor, ? super Continuation<? super R>, ? extends Object> function3;
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
                anonymousClass1.L$0 = $this$useReaderConnection;
                anonymousClass1.L$1 = function2;
                anonymousClass1.label = 1;
                coroutineContext = DBUtil.getCoroutineContext($this$useReaderConnection, false, anonymousClass1);
                if (coroutineContext == coroutine_suspended) {
                    return coroutine_suspended;
                }
                $this$useReaderConnection2 = $this$useReaderConnection;
                function3 = function2;
                break;
                break;
            case 1:
                function3 = (Function2) anonymousClass1.L$1;
                $this$useReaderConnection2 = (RoomDatabase) anonymousClass1.L$0;
                ResultKt.throwOnFailure($result);
                coroutineContext = $result;
                break;
            case 2:
                ResultKt.throwOnFailure($result);
                return $result;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
        CoroutineContext coroutineContextPlus = ((CoroutineContext) coroutineContext).plus(RoomExternalOperationElement.INSTANCE);
        AnonymousClass2 anonymousClass2 = new AnonymousClass2($this$useReaderConnection2, function3, null);
        anonymousClass1.L$0 = null;
        anonymousClass1.L$1 = null;
        anonymousClass1.label = 2;
        Object objWithContext = BuildersKt.withContext(coroutineContextPlus, anonymousClass2, anonymousClass1);
        if (objWithContext == coroutine_suspended) {
            return coroutine_suspended;
        }
        return objWithContext;
    }

    /* JADX INFO: Add missing generic type declarations: [R] */
    /* JADX INFO: renamed from: androidx.room.RoomDatabaseKt__RoomDatabaseKt$useWriterConnection$2, reason: invalid class name and case insensitive filesystem */
    /* JADX INFO: compiled from: RoomDatabase.kt */
    @Metadata(d1 = {"\u0000\b\n\u0002\b\u0002\n\u0002\u0018\u0002\u0010\u0000\u001a\u0002H\u0001\"\u0004\b\u0000\u0010\u0001*\u00020\u0002H\n"}, d2 = {"<anonymous>", "R", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "androidx.room.RoomDatabaseKt__RoomDatabaseKt$useWriterConnection$2", f = "RoomDatabase.kt", i = {}, l = {TypedValues.PositionType.TYPE_DRAWPATH}, m = "invokeSuspend", n = {}, s = {})
    static final class C00472<R> extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super R>, Object> {
        final /* synthetic */ Function2<Transactor, Continuation<? super R>, Object> $block;
        final /* synthetic */ RoomDatabase $this_useWriterConnection;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        /* JADX WARN: Multi-variable type inference failed */
        C00472(RoomDatabase roomDatabase, Function2<? super Transactor, ? super Continuation<? super R>, ? extends Object> function2, Continuation<? super C00472> continuation) {
            super(2, continuation);
            this.$this_useWriterConnection = roomDatabase;
            this.$block = function2;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new C00472(this.$this_useWriterConnection, this.$block, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(CoroutineScope coroutineScope, Continuation<? super R> continuation) {
            return ((C00472) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object $result) throws Throwable {
            Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
            switch (this.label) {
                case 0:
                    ResultKt.throwOnFailure($result);
                    this.label = 1;
                    Object objUseConnection = this.$this_useWriterConnection.useConnection(false, this.$block, this);
                    if (objUseConnection == coroutine_suspended) {
                        return coroutine_suspended;
                    }
                    return objUseConnection;
                case 1:
                    ResultKt.throwOnFailure($result);
                    return $result;
                default:
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
        }
    }

    /* JADX WARN: Code duplicated, block: B:19:0x0076 A[RETURN] */
    /* JADX WARN: Code duplicated, block: B:7:0x0014  */
    public static final <R> Object useWriterConnection(RoomDatabase $this$useWriterConnection, Function2<? super Transactor, ? super Continuation<? super R>, ? extends Object> function2, Continuation<? super R> continuation) throws Throwable {
        C00461 c00461;
        Object coroutineContext;
        Object objWithContext;
        if (continuation instanceof C00461) {
            c00461 = (C00461) continuation;
            if ((c00461.label & Integer.MIN_VALUE) != 0) {
                c00461.label -= Integer.MIN_VALUE;
            } else {
                c00461 = new C00461(continuation);
            }
        } else {
            c00461 = new C00461(continuation);
        }
        Object $result = c00461.result;
        Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
        switch (c00461.label) {
            case 0:
                ResultKt.throwOnFailure($result);
                c00461.L$0 = $this$useWriterConnection;
                c00461.L$1 = function2;
                c00461.label = 1;
                coroutineContext = DBUtil.getCoroutineContext($this$useWriterConnection, false, c00461);
                if (coroutineContext == coroutine_suspended) {
                    return coroutine_suspended;
                }
                CoroutineContext coroutineContextPlus = ((CoroutineContext) coroutineContext).plus(RoomExternalOperationElement.INSTANCE);
                C00472 c00472 = new C00472($this$useWriterConnection, function2, null);
                c00461.L$0 = $this$useWriterConnection;
                c00461.L$1 = null;
                c00461.label = 2;
                objWithContext = BuildersKt.withContext(coroutineContextPlus, c00472, c00461);
                if (objWithContext == coroutine_suspended) {
                    return coroutine_suspended;
                }
                $this$useWriterConnection.getInvalidationTracker().refreshAsync();
                return objWithContext;
            case 1:
                Function2<? super Transactor, ? super Continuation<? super R>, ? extends Object> function3 = (Function2) c00461.L$1;
                RoomDatabase $this$useWriterConnection2 = (RoomDatabase) c00461.L$0;
                ResultKt.throwOnFailure($result);
                function2 = function3;
                $this$useWriterConnection = $this$useWriterConnection2;
                coroutineContext = $result;
                CoroutineContext coroutineContextPlus2 = ((CoroutineContext) coroutineContext).plus(RoomExternalOperationElement.INSTANCE);
                C00472 c00473 = new C00472($this$useWriterConnection, function2, null);
                c00461.L$0 = $this$useWriterConnection;
                c00461.L$1 = null;
                c00461.label = 2;
                objWithContext = BuildersKt.withContext(coroutineContextPlus2, c00473, c00461);
                if (objWithContext == coroutine_suspended) {
                    return coroutine_suspended;
                }
                $this$useWriterConnection.getInvalidationTracker().refreshAsync();
                return objWithContext;
            case 2:
                $this$useWriterConnection = (RoomDatabase) c00461.L$0;
                ResultKt.throwOnFailure($result);
                objWithContext = $result;
                $this$useWriterConnection.getInvalidationTracker().refreshAsync();
                return objWithContext;
            default:
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
        }
    }

    public static final void validateMigrationsNotRequired(Set<Integer> migrationStartAndEndVersions, Set<Integer> migrationsNotRequiredFrom) {
        Intrinsics.checkNotNullParameter(migrationStartAndEndVersions, "migrationStartAndEndVersions");
        Intrinsics.checkNotNullParameter(migrationsNotRequiredFrom, "migrationsNotRequiredFrom");
        if (!migrationStartAndEndVersions.isEmpty()) {
            Iterator<Integer> it = migrationStartAndEndVersions.iterator();
            while (it.hasNext()) {
                int version = it.next().intValue();
                if (migrationsNotRequiredFrom.contains(Integer.valueOf(version))) {
                    throw new IllegalArgumentException(("Inconsistency detected. A Migration was supplied to addMigration() that has a start or end version equal to a start version supplied to fallbackToDestructiveMigrationFrom(). Start version is: " + version).toString());
                }
            }
        }
    }

    public static final void validateAutoMigrations(RoomDatabase $this$validateAutoMigrations, DatabaseConfiguration configuration) {
        Intrinsics.checkNotNullParameter($this$validateAutoMigrations, "<this>");
        Intrinsics.checkNotNullParameter(configuration, "configuration");
        Map autoMigrationSpecs = new LinkedHashMap();
        Set<KClass<? extends AutoMigrationSpec>> requiredAutoMigrationSpecClasses = $this$validateAutoMigrations.getRequiredAutoMigrationSpecClasses();
        boolean[] usedSpecs = new boolean[configuration.autoMigrationSpecs.size()];
        Iterator<KClass<? extends AutoMigrationSpec>> it = requiredAutoMigrationSpecClasses.iterator();
        while (true) {
            if (it.hasNext()) {
                KClass<? extends AutoMigrationSpec> next = it.next();
                int foundIndex = -1;
                int size = configuration.autoMigrationSpecs.size() - 1;
                if (size >= 0) {
                    do {
                        int providedIndex = size;
                        size--;
                        Object provided = configuration.autoMigrationSpecs.get(providedIndex);
                        if (next.isInstance(provided)) {
                            foundIndex = providedIndex;
                            usedSpecs[foundIndex] = true;
                            break;
                        }
                    } while (size >= 0);
                }
                if (!(foundIndex >= 0)) {
                    throw new IllegalArgumentException(("A required auto migration spec (" + next.getQualifiedName() + ") is missing in the database configuration.").toString());
                }
                autoMigrationSpecs.put(next, configuration.autoMigrationSpecs.get(foundIndex));
            } else {
                int size2 = configuration.autoMigrationSpecs.size() - 1;
                if (size2 >= 0) {
                    do {
                        int providedIndex2 = size2;
                        size2--;
                        if (!(providedIndex2 < usedSpecs.length && usedSpecs[providedIndex2])) {
                            throw new IllegalArgumentException("Unexpected auto migration specs found. Annotate AutoMigrationSpec implementation with @ProvidedAutoMigrationSpec annotation or remove this spec from the builder.".toString());
                        }
                    } while (size2 >= 0);
                }
                for (Migration autoMigration : $this$validateAutoMigrations.createAutoMigrations(autoMigrationSpecs)) {
                    boolean migrationExists = configuration.migrationContainer.contains(autoMigration.startVersion, autoMigration.endVersion);
                    if (!migrationExists) {
                        configuration.migrationContainer.addMigration(autoMigration);
                    }
                }
                return;
            }
        }
    }

    public static final void validateTypeConverters(RoomDatabase $this$validateTypeConverters, DatabaseConfiguration configuration) {
        Map<KClass<?>, List<KClass<?>>> map;
        boolean z;
        Intrinsics.checkNotNullParameter($this$validateTypeConverters, "<this>");
        Intrinsics.checkNotNullParameter(configuration, "configuration");
        Map<KClass<?>, List<KClass<?>>> requiredTypeConverterClassesMap$room_runtime = $this$validateTypeConverters.getRequiredTypeConverterClassesMap$room_runtime();
        boolean[] used = new boolean[configuration.typeConverters.size()];
        for (Map.Entry<KClass<?>, List<KClass<?>>> entry : requiredTypeConverterClassesMap$room_runtime.entrySet()) {
            KClass<?> key = entry.getKey();
            for (KClass<?> kClass : entry.getValue()) {
                int foundIndex = -1;
                int size = configuration.typeConverters.size() - 1;
                if (size >= 0) {
                    while (true) {
                        int providedIndex = size;
                        size--;
                        z = true;
                        map = requiredTypeConverterClassesMap$room_runtime;
                        Object provided = configuration.typeConverters.get(providedIndex);
                        if (!kClass.isInstance(provided)) {
                            if (size < 0) {
                                break;
                            } else {
                                requiredTypeConverterClassesMap$room_runtime = map;
                            }
                        } else {
                            foundIndex = providedIndex;
                            used[foundIndex] = true;
                            break;
                        }
                    }
                } else {
                    map = requiredTypeConverterClassesMap$room_runtime;
                    z = true;
                }
                if (!(foundIndex >= 0 ? z : false)) {
                    throw new IllegalArgumentException(("A required type converter (" + kClass.getQualifiedName() + ") for " + key.getQualifiedName() + " is missing in the database configuration.").toString());
                }
                $this$validateTypeConverters.addTypeConverter$room_runtime(kClass, configuration.typeConverters.get(foundIndex));
                requiredTypeConverterClassesMap$room_runtime = map;
            }
        }
        int size2 = configuration.typeConverters.size() - 1;
        if (size2 >= 0) {
            do {
                int providedIndex2 = size2;
                size2--;
                if (!used[providedIndex2]) {
                    Object converter = configuration.typeConverters.get(providedIndex2);
                    throw new IllegalArgumentException("Unexpected type converter " + converter + ". Annotate TypeConverter class with @ProvidedTypeConverter annotation or remove this converter from the builder.");
                }
            } while (size2 >= 0);
        }
    }
}
