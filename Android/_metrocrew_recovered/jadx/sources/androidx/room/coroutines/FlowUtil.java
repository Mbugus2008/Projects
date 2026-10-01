package androidx.room.coroutines;

import androidx.room.RoomDatabase;
import androidx.room.util.DBUtil;
import androidx.sqlite.SQLiteConnection;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.flow.Flow;
import kotlinx.coroutines.flow.FlowCollector;
import kotlinx.coroutines.flow.FlowKt;

/* JADX INFO: compiled from: FlowBuilder.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000,\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0011\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u001aK\u0010\u0000\u001a\b\u0012\u0004\u0012\u0002H\u00020\u0001\"\u0004\b\u0000\u0010\u00022\u0006\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u00062\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\t0\b2\u0012\u0010\n\u001a\u000e\u0012\u0004\u0012\u00020\f\u0012\u0004\u0012\u0002H\u00020\u000bH\u0007¢\u0006\u0002\u0010\r¨\u0006\u000e"}, d2 = {"createFlow", "Lkotlinx/coroutines/flow/Flow;", "R", "db", "Landroidx/room/RoomDatabase;", "inTransaction", "", "tableNames", "", "", "block", "Lkotlin/Function1;", "Landroidx/sqlite/SQLiteConnection;", "(Landroidx/room/RoomDatabase;Z[Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/flow/Flow;", "room-runtime"}, k = 2, mv = {2, 1, 0}, xi = 48)
public final class FlowUtil {
    public static final <R> Flow<R> createFlow(final RoomDatabase db, final boolean inTransaction, String[] tableNames, final Function1<? super SQLiteConnection, ? extends R> block) {
        Intrinsics.checkNotNullParameter(db, "db");
        Intrinsics.checkNotNullParameter(tableNames, "tableNames");
        Intrinsics.checkNotNullParameter(block, "block");
        final Flow $this$map$iv = FlowKt.conflate(db.getInvalidationTracker().createFlow((String[]) Arrays.copyOf(tableNames, tableNames.length), true));
        return new Flow<R>() { // from class: androidx.room.coroutines.FlowUtil$createFlow$$inlined$map$1

            /* JADX INFO: renamed from: androidx.room.coroutines.FlowUtil$createFlow$$inlined$map$1$2, reason: invalid class name */
            /* JADX INFO: compiled from: Emitters.kt */
            @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0007\u0010\u0000\u001a\u00020\u0001\"\u0004\b\u0000\u0010\u0002\"\u0004\b\u0001\u0010\u00032\u0006\u0010\u0004\u001a\u0002H\u0002H\u008a@¢\u0006\u0004\b\u0005\u0010\u0006¨\u0006\b"}, d2 = {"<anonymous>", "", "T", "R", "value", "emit", "(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "kotlinx/coroutines/flow/FlowKt__EmittersKt$unsafeTransform$1$1", "kotlinx/coroutines/flow/FlowKt__TransformKt$map$$inlined$unsafeTransform$1$2"}, k = 3, mv = {2, 1, 0}, xi = 48)
            public static final class AnonymousClass2<T> implements FlowCollector {
                final /* synthetic */ Function1 $block$inlined;
                final /* synthetic */ RoomDatabase $db$inlined;
                final /* synthetic */ boolean $inTransaction$inlined;
                final /* synthetic */ FlowCollector $this_unsafeFlow;

                /* JADX INFO: renamed from: androidx.room.coroutines.FlowUtil$createFlow$$inlined$map$1$2$1, reason: invalid class name */
                /* JADX INFO: compiled from: Emitters.kt */
                @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
                @DebugMetadata(c = "androidx.room.coroutines.FlowUtil$createFlow$$inlined$map$1$2", f = "FlowBuilder.kt", i = {}, l = {220, 219}, m = "emit", n = {}, s = {})
                public static final class AnonymousClass1 extends ContinuationImpl {
                    Object L$0;
                    int label;
                    /* synthetic */ Object result;

                    public AnonymousClass1(Continuation continuation) {
                        super(continuation);
                    }

                    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
                    public final Object invokeSuspend(Object obj) {
                        this.result = obj;
                        this.label |= Integer.MIN_VALUE;
                        return AnonymousClass2.this.emit(null, this);
                    }
                }

                public AnonymousClass2(FlowCollector flowCollector, RoomDatabase roomDatabase, boolean z, Function1 function1) {
                    this.$this_unsafeFlow = flowCollector;
                    this.$db$inlined = roomDatabase;
                    this.$inTransaction$inlined = z;
                    this.$block$inlined = function1;
                }

                /* JADX WARN: Code duplicated, block: B:20:0x006f A[RETURN] */
                /* JADX WARN: Code duplicated, block: B:7:0x0014  */
                @Override // kotlinx.coroutines.flow.FlowCollector
                public final Object emit(Object value, Continuation $completion) throws Throwable {
                    AnonymousClass1 anonymousClass1;
                    FlowCollector flowCollector;
                    Object obj;
                    if ($completion instanceof AnonymousClass1) {
                        anonymousClass1 = (AnonymousClass1) $completion;
                        if ((anonymousClass1.label & Integer.MIN_VALUE) != 0) {
                            anonymousClass1.label -= Integer.MIN_VALUE;
                        } else {
                            anonymousClass1 = new AnonymousClass1($completion);
                        }
                    } else {
                        anonymousClass1 = new AnonymousClass1($completion);
                    }
                    Object $result = anonymousClass1.result;
                    Object coroutine_suspended = IntrinsicsKt.getCOROUTINE_SUSPENDED();
                    switch (anonymousClass1.label) {
                        case 0:
                            ResultKt.throwOnFailure($result);
                            FlowCollector flowCollector2 = this.$this_unsafeFlow;
                            RoomDatabase roomDatabase = this.$db$inlined;
                            boolean z = this.$inTransaction$inlined;
                            Function1 function1 = this.$block$inlined;
                            anonymousClass1.L$0 = flowCollector2;
                            anonymousClass1.label = 1;
                            Object objPerformSuspending = DBUtil.performSuspending(roomDatabase, true, z, function1, anonymousClass1);
                            if (objPerformSuspending == coroutine_suspended) {
                                return coroutine_suspended;
                            }
                            flowCollector = flowCollector2;
                            obj = objPerformSuspending;
                            anonymousClass1.L$0 = null;
                            anonymousClass1.label = 2;
                            if (flowCollector.emit(obj, anonymousClass1) == coroutine_suspended) {
                                return coroutine_suspended;
                            }
                            return Unit.INSTANCE;
                        case 1:
                            FlowCollector flowCollector3 = (FlowCollector) anonymousClass1.L$0;
                            ResultKt.throwOnFailure($result);
                            flowCollector = flowCollector3;
                            obj = $result;
                            anonymousClass1.L$0 = null;
                            anonymousClass1.label = 2;
                            if (flowCollector.emit(obj, anonymousClass1) == coroutine_suspended) {
                                return coroutine_suspended;
                            }
                            return Unit.INSTANCE;
                        case 2:
                            ResultKt.throwOnFailure($result);
                            return Unit.INSTANCE;
                        default:
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                }
            }

            @Override // kotlinx.coroutines.flow.Flow
            public Object collect(FlowCollector collector, Continuation $completion) {
                Object objCollect = $this$map$iv.collect(new AnonymousClass2(collector, db, inTransaction, block), $completion);
                return objCollect == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? objCollect : Unit.INSTANCE;
            }
        };
    }
}
