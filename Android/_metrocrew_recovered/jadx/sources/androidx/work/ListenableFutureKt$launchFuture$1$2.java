package androidx.work;

import androidx.concurrent.futures.CallbackToFutureAdapter;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlinx.coroutines.CoroutineScope;

/* JADX INFO: compiled from: ListenableFuture.kt */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001\"\u0004\b\u0000\u0010\u0002*\u00020\u0003H\u008a@"}, d2 = {"<anonymous>", "", "T", "Lkotlinx/coroutines/CoroutineScope;"}, k = 3, mv = {1, 8, 0}, xi = 48)
@DebugMetadata(c = "androidx.work.ListenableFutureKt$launchFuture$1$2", f = "ListenableFuture.kt", i = {}, l = {42}, m = "invokeSuspend", n = {}, s = {})
final class ListenableFutureKt$launchFuture$1$2 extends SuspendLambda implements Function2<CoroutineScope, Continuation<? super Unit>, Object> {
    final /* synthetic */ Function2<CoroutineScope, Continuation<? super T>, Object> $block;
    final /* synthetic */ CallbackToFutureAdapter.Completer<T> $completer;
    private /* synthetic */ Object L$0;
    int label;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    /* JADX WARN: Multi-variable type inference failed */
    ListenableFutureKt$launchFuture$1$2(Function2<? super CoroutineScope, ? super Continuation<? super T>, ? extends Object> function2, CallbackToFutureAdapter.Completer<T> completer, Continuation<? super ListenableFutureKt$launchFuture$1$2> continuation) {
        super(2, continuation);
        this.$block = function2;
        this.$completer = completer;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
        ListenableFutureKt$launchFuture$1$2 listenableFutureKt$launchFuture$1$2 = new ListenableFutureKt$launchFuture$1$2(this.$block, this.$completer, continuation);
        listenableFutureKt$launchFuture$1$2.L$0 = obj;
        return listenableFutureKt$launchFuture$1$2;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(CoroutineScope coroutineScope, Continuation<? super Unit> continuation) {
        return ((ListenableFutureKt$launchFuture$1$2) create(coroutineScope, continuation)).invokeSuspend(Unit.INSTANCE);
    }

    /* JADX WARN: Type inference incomplete: some casts might be missing */
    /*  JADX ERROR: JadxRuntimeException in pass: ModVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Can't change immutable type java.lang.Object to androidx.work.ListenableFutureKt$launchFuture$1$2 for r5v1 'this'  java.lang.Object
        	at jadx.core.dex.instructions.args.SSAVar.setType(SSAVar.java:114)
        	at jadx.core.dex.instructions.args.RegisterArg.setType(RegisterArg.java:52)
        	at jadx.core.dex.visitors.ModVisitor.removeCheckCast(ModVisitor.java:417)
        	at jadx.core.dex.visitors.ModVisitor.replaceStep(ModVisitor.java:152)
        	at jadx.core.dex.visitors.ModVisitor.visit(ModVisitor.java:96)
        */
    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final java.lang.Object invokeSuspend(java.lang.Object r6) {
        /*
            r5 = this;
            java.lang.Object r0 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r1 = r5.label
            switch(r1) {
                case 0: goto L1a;
                case 1: goto L11;
                default: goto L9;
            }
        L9:
            java.lang.IllegalStateException r6 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r6.<init>(r0)
            throw r6
        L11:
            kotlin.ResultKt.throwOnFailure(r6)     // Catch: java.lang.Throwable -> L16 java.util.concurrent.CancellationException -> L18
            r0 = r6
            goto L30
        L16:
            r0 = move-exception
            goto L3f
        L18:
            r0 = move-exception
            goto L46
        L1a:
            kotlin.ResultKt.throwOnFailure(r6)
            java.lang.Object r1 = r5.L$0
            kotlinx.coroutines.CoroutineScope r1 = (kotlinx.coroutines.CoroutineScope) r1
            kotlin.jvm.functions.Function2<kotlinx.coroutines.CoroutineScope, kotlin.coroutines.Continuation<? super T>, java.lang.Object> r2 = r5.$block     // Catch: java.lang.Throwable -> L16 java.util.concurrent.CancellationException -> L18
            r3 = 1
            r5.label = r3     // Catch: java.lang.Throwable -> L16 java.util.concurrent.CancellationException -> L18
            java.lang.Object r2 = r2.invoke(r1, r5)     // Catch: java.lang.Throwable -> L16 java.util.concurrent.CancellationException -> L18
            if (r2 != r0) goto L2e
            return r0
        L2e:
            r0 = r6
            r6 = r2
        L30:
            androidx.concurrent.futures.CallbackToFutureAdapter$Completer<T> r1 = r5.$completer     // Catch: java.lang.Throwable -> L37 java.util.concurrent.CancellationException -> L3c
            r1.set(r6)     // Catch: java.lang.Throwable -> L37 java.util.concurrent.CancellationException -> L3c
            goto L4c
        L37:
            r6 = move-exception
            r4 = r0
            r0 = r6
            r6 = r4
            goto L3f
        L3c:
            r6 = move-exception
            r6 = r0
            goto L46
        L3f:
            androidx.concurrent.futures.CallbackToFutureAdapter$Completer<T> r1 = r5.$completer
            r1.setException(r0)
            r0 = r6
            goto L4c
        L46:
            androidx.concurrent.futures.CallbackToFutureAdapter$Completer<T> r0 = r5.$completer
            r0.setCancelled()
            r0 = r6
        L4c:
            kotlin.Unit r6 = kotlin.Unit.INSTANCE
            return r6
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.work.ListenableFutureKt$launchFuture$1$2.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
