package androidx.room;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.SetsKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.StringsKt;
import kotlinx.coroutines.BuildersKt__Builders_commonKt;
import kotlinx.coroutines.CoroutineScope;
import kotlinx.coroutines.channels.BufferOverflow;
import kotlinx.coroutines.flow.Flow;
import kotlinx.coroutines.flow.FlowCollector;
import kotlinx.coroutines.flow.MutableSharedFlow;
import kotlinx.coroutines.flow.SharedFlowKt;

/* JADX INFO: compiled from: MultiInstanceInvalidationClient.android.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000q\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\"\n\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\b\u0002*\u0001\u001c\b\u0000\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\b\u0010\"\u001a\u00020#H\u0002J\u000e\u0010$\u001a\u00020#2\u0006\u0010%\u001a\u00020&J\u0006\u0010'\u001a\u00020#J'\u0010(\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00050\u001a0)2\u000e\u0010*\u001a\n\u0012\u0006\b\u0001\u0012\u00020\u00050+¢\u0006\u0002\u0010,R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000bR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\f\u0010\rR\u0016\u0010\u000e\u001a\n \u000f*\u0004\u0018\u00010\u00030\u0003X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0010\u001a\u00020\u0011X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0012\u001a\u00020\u0013X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0016\u001a\u0004\u0018\u00010\u0017X\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010\u0018\u001a\u000e\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00050\u001a0\u0019X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u001b\u001a\u00020\u001cX\u0082\u0004¢\u0006\u0004\n\u0002\u0010\u001dR\u000e\u0010\u001e\u001a\u00020\u001fX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010 \u001a\u00020!X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006-"}, d2 = {"Landroidx/room/MultiInstanceInvalidationClient;", "", "context", "Landroid/content/Context;", "name", "", "invalidationTracker", "Landroidx/room/InvalidationTracker;", "<init>", "(Landroid/content/Context;Ljava/lang/String;Landroidx/room/InvalidationTracker;)V", "getName", "()Ljava/lang/String;", "getInvalidationTracker", "()Landroidx/room/InvalidationTracker;", "appContext", "kotlin.jvm.PlatformType", "coroutineScope", "Lkotlinx/coroutines/CoroutineScope;", "stopped", "Ljava/util/concurrent/atomic/AtomicBoolean;", "clientId", "", "invalidationService", "Landroidx/room/IMultiInstanceInvalidationService;", "invalidatedTables", "Lkotlinx/coroutines/flow/MutableSharedFlow;", "", "observer", "androidx/room/MultiInstanceInvalidationClient$observer$1", "Landroidx/room/MultiInstanceInvalidationClient$observer$1;", "invalidationCallback", "Landroidx/room/IMultiInstanceInvalidationCallback;", "serviceConnection", "Landroid/content/ServiceConnection;", "registerCallback", "", "start", "serviceIntent", "Landroid/content/Intent;", "stop", "createFlow", "Lkotlinx/coroutines/flow/Flow;", "resolvedTableNames", "", "([Ljava/lang/String;)Lkotlinx/coroutines/flow/Flow;", "room-runtime"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class MultiInstanceInvalidationClient {
    private final Context appContext;
    private int clientId;
    private final CoroutineScope coroutineScope;
    private final MutableSharedFlow<Set<String>> invalidatedTables;
    private final IMultiInstanceInvalidationCallback invalidationCallback;
    private IMultiInstanceInvalidationService invalidationService;
    private final InvalidationTracker invalidationTracker;
    private final String name;
    private final MultiInstanceInvalidationClient$observer$1 observer;
    private final ServiceConnection serviceConnection;
    private final AtomicBoolean stopped;

    /* JADX WARN: Type inference failed for: r1v2, types: [androidx.room.MultiInstanceInvalidationClient$observer$1] */
    public MultiInstanceInvalidationClient(Context context, String name, InvalidationTracker invalidationTracker) {
        Intrinsics.checkNotNullParameter(context, "context");
        Intrinsics.checkNotNullParameter(name, "name");
        Intrinsics.checkNotNullParameter(invalidationTracker, "invalidationTracker");
        this.name = name;
        this.invalidationTracker = invalidationTracker;
        this.appContext = context.getApplicationContext();
        this.coroutineScope = this.invalidationTracker.getDatabase().getCoroutineScope();
        this.stopped = new AtomicBoolean(true);
        this.invalidatedTables = SharedFlowKt.MutableSharedFlow(0, 0, BufferOverflow.SUSPEND);
        final String[] tableNames$room_runtime = this.invalidationTracker.getTableNames();
        this.observer = new InvalidationTracker.Observer(tableNames$room_runtime) { // from class: androidx.room.MultiInstanceInvalidationClient$observer$1
            @Override // androidx.room.InvalidationTracker.Observer
            public void onInvalidated(Set<String> tables) {
                Intrinsics.checkNotNullParameter(tables, "tables");
                if (!this.this$0.stopped.get()) {
                    try {
                        IMultiInstanceInvalidationService iMultiInstanceInvalidationService = this.this$0.invalidationService;
                        if (iMultiInstanceInvalidationService != null) {
                            Set<String> $this$toTypedArray$iv = tables;
                            iMultiInstanceInvalidationService.broadcastInvalidation(this.this$0.clientId, (String[]) $this$toTypedArray$iv.toArray(new String[0]));
                        }
                    } catch (RemoteException e) {
                        Log.w(Room.LOG_TAG, "Cannot broadcast invalidation", e);
                    }
                }
            }

            @Override // androidx.room.InvalidationTracker.Observer
            public boolean isRemote$room_runtime() {
                return true;
            }
        };
        this.invalidationCallback = new IMultiInstanceInvalidationCallback.Stub() { // from class: androidx.room.MultiInstanceInvalidationClient$invalidationCallback$1
            @Override // androidx.room.IMultiInstanceInvalidationCallback
            public void onInvalidation(String[] tables) {
                Intrinsics.checkNotNullParameter(tables, "tables");
                BuildersKt__Builders_commonKt.launch$default(this.this$0.coroutineScope, null, null, new MultiInstanceInvalidationClient$invalidationCallback$1$onInvalidation$1(tables, this.this$0, null), 3, null);
            }
        };
        this.serviceConnection = new ServiceConnection() { // from class: androidx.room.MultiInstanceInvalidationClient$serviceConnection$1
            @Override // android.content.ServiceConnection
            public void onServiceConnected(ComponentName name2, IBinder service) {
                Intrinsics.checkNotNullParameter(name2, "name");
                Intrinsics.checkNotNullParameter(service, "service");
                this.this$0.invalidationService = IMultiInstanceInvalidationService.Stub.asInterface(service);
                this.this$0.registerCallback();
            }

            @Override // android.content.ServiceConnection
            public void onServiceDisconnected(ComponentName name2) {
                Intrinsics.checkNotNullParameter(name2, "name");
                this.this$0.invalidationService = null;
            }
        };
    }

    public final String getName() {
        return this.name;
    }

    public final InvalidationTracker getInvalidationTracker() {
        return this.invalidationTracker;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void registerCallback() {
        try {
            IMultiInstanceInvalidationService it = this.invalidationService;
            if (it != null) {
                this.clientId = it.registerCallback(this.invalidationCallback, this.name);
            }
        } catch (RemoteException e) {
            Log.w(Room.LOG_TAG, "Cannot register multi-instance invalidation callback", e);
        }
    }

    public final void start(Intent serviceIntent) {
        Intrinsics.checkNotNullParameter(serviceIntent, "serviceIntent");
        if (this.stopped.compareAndSet(true, false)) {
            this.appContext.bindService(serviceIntent, this.serviceConnection, 1);
            this.invalidationTracker.addRemoteObserver$room_runtime(this.observer);
        }
    }

    public final void stop() {
        if (this.stopped.compareAndSet(false, true)) {
            this.invalidationTracker.removeObserver(this.observer);
            try {
                IMultiInstanceInvalidationService iMultiInstanceInvalidationService = this.invalidationService;
                if (iMultiInstanceInvalidationService != null) {
                    iMultiInstanceInvalidationService.unregisterCallback(this.invalidationCallback, this.clientId);
                }
            } catch (RemoteException e) {
                Log.w(Room.LOG_TAG, "Cannot unregister multi-instance invalidation callback", e);
            }
            this.appContext.unbindService(this.serviceConnection);
        }
    }

    public final Flow<Set<String>> createFlow(final String[] resolvedTableNames) {
        Intrinsics.checkNotNullParameter(resolvedTableNames, "resolvedTableNames");
        final Flow $this$mapNotNull$iv = this.invalidatedTables;
        return (Flow) new Flow<Set<? extends String>>() { // from class: androidx.room.MultiInstanceInvalidationClient$createFlow$$inlined$mapNotNull$1
            @Override // kotlinx.coroutines.flow.Flow
            public Object collect(FlowCollector<? super Set<? extends String>> flowCollector, Continuation $completion) {
                Object objCollect = $this$mapNotNull$iv.collect(new AnonymousClass2(flowCollector, resolvedTableNames), $completion);
                return objCollect == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? objCollect : Unit.INSTANCE;
            }

            /* JADX INFO: renamed from: androidx.room.MultiInstanceInvalidationClient$createFlow$$inlined$mapNotNull$1$2, reason: invalid class name */
            /* JADX INFO: compiled from: Emitters.kt */
            @Metadata(d1 = {"\u0000\n\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0007\u0010\u0000\u001a\u00020\u0001\"\u0004\b\u0000\u0010\u0002\"\u0004\b\u0001\u0010\u00032\u0006\u0010\u0004\u001a\u0002H\u0002H\u008a@¢\u0006\u0004\b\u0005\u0010\u0006¨\u0006\b"}, d2 = {"<anonymous>", "", "T", "R", "value", "emit", "(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "kotlinx/coroutines/flow/FlowKt__EmittersKt$unsafeTransform$1$1", "kotlinx/coroutines/flow/FlowKt__TransformKt$mapNotNull$$inlined$unsafeTransform$1$2"}, k = 3, mv = {2, 1, 0}, xi = 48)
            public static final class AnonymousClass2<T> implements FlowCollector {
                final /* synthetic */ String[] $resolvedTableNames$inlined;
                final /* synthetic */ FlowCollector $this_unsafeFlow;

                /* JADX INFO: renamed from: androidx.room.MultiInstanceInvalidationClient$createFlow$$inlined$mapNotNull$1$2$1, reason: invalid class name */
                /* JADX INFO: compiled from: Emitters.kt */
                @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
                @DebugMetadata(c = "androidx.room.MultiInstanceInvalidationClient$createFlow$$inlined$mapNotNull$1$2", f = "MultiInstanceInvalidationClient.android.kt", i = {}, l = {235}, m = "emit", n = {}, s = {})
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

                public AnonymousClass2(FlowCollector flowCollector, String[] strArr) {
                    this.$this_unsafeFlow = flowCollector;
                    this.$resolvedTableNames$inlined = strArr;
                }

                /* JADX WARN: Code duplicated, block: B:7:0x0018  */
                @Override // kotlinx.coroutines.flow.FlowCollector
                public final Object emit(Object value, Continuation $completion) throws Throwable {
                    AnonymousClass1 anonymousClass1;
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
                            FlowCollector $this$mapNotNull_u24lambda_u246 = this.$this_unsafeFlow;
                            Iterable invalidatedTables = (Set) value;
                            Set $this$createFlow_u24lambda_u245_u24lambda_u243 = SetsKt.createSetBuilder();
                            String[] strArr = this.$resolvedTableNames$inlined;
                            int length = strArr.length;
                            for (int i = 0; i < length; i++) {
                                String flowTable = strArr[i];
                                Iterable $this$forEach$iv = invalidatedTables;
                                for (Object element$iv : $this$forEach$iv) {
                                    String invalidatedTable = (String) element$iv;
                                    String flowTable2 = flowTable;
                                    Object $result2 = $result;
                                    if (StringsKt.equals(flowTable2, invalidatedTable, true)) {
                                        $this$createFlow_u24lambda_u245_u24lambda_u243.add(flowTable2);
                                    }
                                    flowTable = flowTable2;
                                    $result = $result2;
                                }
                            }
                            Set setBuild = SetsKt.build($this$createFlow_u24lambda_u245_u24lambda_u243);
                            if (setBuild.isEmpty()) {
                                setBuild = null;
                            }
                            if (setBuild != null) {
                                anonymousClass1.label = 1;
                                Object transformed = $this$mapNotNull_u24lambda_u246.emit(setBuild, anonymousClass1);
                                if (transformed == coroutine_suspended) {
                                    return coroutine_suspended;
                                }
                            }
                            break;
                        case 1:
                            ResultKt.throwOnFailure($result);
                            break;
                        default:
                            throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    return Unit.INSTANCE;
                }
            }
        };
    }
}
