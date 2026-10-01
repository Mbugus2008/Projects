package androidx.work;

import androidx.concurrent.futures.CallbackToFutureAdapter;
import com.google.common.util.concurrent.ListenableFuture;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* JADX INFO: compiled from: Worker.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a&\u0010\u0000\u001a\b\u0012\u0004\u0012\u0002H\u00020\u0001\"\u0004\b\u0000\u0010\u0002*\u00020\u00032\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u0002H\u00020\u0005H\u0002¨\u0006\u0006"}, d2 = {"future", "Lcom/google/common/util/concurrent/ListenableFuture;", "T", "Ljava/util/concurrent/Executor;", "block", "Lkotlin/Function0;", "work-runtime_release"}, k = 2, mv = {1, 8, 0}, xi = 48)
public final class WorkerKt {
    /* JADX INFO: Access modifiers changed from: private */
    public static final <T> ListenableFuture<T> future(final Executor $this$future, final Function0<? extends T> function0) {
        ListenableFuture<T> future = CallbackToFutureAdapter.getFuture(new CallbackToFutureAdapter.Resolver() { // from class: androidx.work.WorkerKt$$ExternalSyntheticLambda2
            @Override // androidx.concurrent.futures.CallbackToFutureAdapter.Resolver
            public final Object attachCompleter(CallbackToFutureAdapter.Completer completer) {
                return WorkerKt.future$lambda$2($this$future, function0, completer);
            }
        });
        Intrinsics.checkNotNullExpressionValue(future, "getFuture {\n        val …        }\n        }\n    }");
        return future;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final Unit future$lambda$2(Executor $this_future, final Function0 $block, final CallbackToFutureAdapter.Completer it) {
        Intrinsics.checkNotNullParameter(it, "it");
        final AtomicBoolean cancelled = new AtomicBoolean(false);
        it.addCancellationListener(new Runnable() { // from class: androidx.work.WorkerKt$$ExternalSyntheticLambda0
            @Override // java.lang.Runnable
            public final void run() {
                cancelled.set(true);
            }
        }, DirectExecutor.INSTANCE);
        $this_future.execute(new Runnable() { // from class: androidx.work.WorkerKt$$ExternalSyntheticLambda1
            @Override // java.lang.Runnable
            public final void run() {
                WorkerKt.future$lambda$2$lambda$1(cancelled, it, $block);
            }
        });
        return Unit.INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void future$lambda$2$lambda$1(AtomicBoolean $cancelled, CallbackToFutureAdapter.Completer $it, Function0 $block) {
        if ($cancelled.get()) {
            return;
        }
        try {
            $it.set($block.invoke());
        } catch (Throwable t) {
            $it.setException(t);
        }
    }
}
