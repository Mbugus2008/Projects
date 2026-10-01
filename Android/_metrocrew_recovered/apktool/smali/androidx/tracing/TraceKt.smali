.class public final Landroidx/tracing/TraceKt;
.super Ljava/lang/Object;
.source "Trace.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0007\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\u001a3\u0010\u0000\u001a\u0002H\u0001\"\u0004\u0008\u0000\u0010\u00012\u000c\u0010\u0002\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u00032\u000c\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u0002H\u00010\u0003H\u0086\u0008\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\u0006\u001a/\u0010\u0000\u001a\u0002H\u0001\"\u0004\u0008\u0000\u0010\u00012\u0006\u0010\u0007\u001a\u00020\u00042\u000e\u0008\u0004\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u0002H\u00010\u0003H\u0086\u0008\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\u0008\u001aA\u0010\t\u001a\u0002H\u0001\"\u0004\u0008\u0000\u0010\u00012\u000c\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\u00040\u00032\u000c\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u00032\u000c\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u0002H\u00010\u0003H\u0086\u0008\u00f8\u0001\u0000\u00a2\u0006\u0002\u0010\r\u001aG\u0010\t\u001a\u0002H\u0001\"\u0004\u0008\u0000\u0010\u00012\u0006\u0010\u000e\u001a\u00020\u00042\u0006\u0010\u000f\u001a\u00020\u000c2\u001e\u0008\u0004\u0010\u0005\u001a\u0018\u0008\u0001\u0012\n\u0012\u0008\u0012\u0004\u0012\u0002H\u00010\u0011\u0012\u0006\u0012\u0004\u0018\u00010\u00120\u0010H\u0086H\u00f8\u0001\u0001\u00a2\u0006\u0002\u0010\u0013\u0082\u0002\u000b\n\u0005\u0008\u009920\u0001\n\u0002\u0008\u0019\u00a8\u0006\u0014"
    }
    d2 = {
        "trace",
        "T",
        "lazyLabel",
        "Lkotlin/Function0;",
        "",
        "block",
        "(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;",
        "label",
        "(Ljava/lang/String;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;",
        "traceAsync",
        "lazyMethodName",
        "lazyCookie",
        "",
        "(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;",
        "methodName",
        "cookie",
        "Lkotlin/Function1;",
        "Lkotlin/coroutines/Continuation;",
        "",
        "(Ljava/lang/String;ILkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "tracing-ktx_release"
    }
    k = 0x2
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final trace(Ljava/lang/String;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;
    .locals 2
    .param p0, "label"    # Ljava/lang/String;
    .param p1, "block"    # Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lkotlin/jvm/functions/Function0<",
            "+TT;>;)TT;"
        }
    .end annotation

    const-string v0, "label"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "block"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 27
    .local v0, "$i$f$trace":I
    invoke-static {p0}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 28
    nop

    .line 29
    :try_start_0
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    .line 29
    return-object v1

    .line 31
    :catchall_0
    move-exception v1

    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    throw v1
.end method

.method public static final trace(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;
    .locals 3
    .param p0, "lazyLabel"    # Lkotlin/jvm/functions/Function0;
    .param p1, "block"    # Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/lang/String;",
            ">;",
            "Lkotlin/jvm/functions/Function0<",
            "+TT;>;)TT;"
        }
    .end annotation

    const-string v0, "lazyLabel"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "block"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 49
    .local v0, "$i$f$trace":I
    invoke-static {}, Landroidx/tracing/Trace;->isEnabled()Z

    move-result v1

    .line 50
    .local v1, "isEnabled":Z
    if-eqz v1, :cond_0

    .line 51
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 53
    :cond_0
    nop

    .line 54
    :try_start_0
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    if-eqz v1, :cond_1

    .line 57
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    :cond_1
    nop

    .line 54
    return-object v2

    .line 56
    :catchall_0
    move-exception v2

    if-eqz v1, :cond_2

    .line 57
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    :cond_2
    throw v2
.end method

.method public static final traceAsync(Ljava/lang/String;ILkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "I",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lkotlin/coroutines/Continuation<",
            "-TT;>;+",
            "Ljava/lang/Object;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-TT;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    instance-of v0, p3, Landroidx/tracing/TraceKt$traceAsync$1;

    if-eqz v0, :cond_0

    move-object v0, p3

    check-cast v0, Landroidx/tracing/TraceKt$traceAsync$1;

    iget v1, v0, Landroidx/tracing/TraceKt$traceAsync$1;->label:I

    const/high16 v2, -0x80000000

    and-int/2addr v1, v2

    if-eqz v1, :cond_0

    iget p3, v0, Landroidx/tracing/TraceKt$traceAsync$1;->label:I

    sub-int/2addr p3, v2

    iput p3, v0, Landroidx/tracing/TraceKt$traceAsync$1;->label:I

    goto :goto_0

    :cond_0
    new-instance v0, Landroidx/tracing/TraceKt$traceAsync$1;

    invoke-direct {v0, p3}, Landroidx/tracing/TraceKt$traceAsync$1;-><init>(Lkotlin/coroutines/Continuation;)V

    .local v0, "$continuation":Lkotlin/coroutines/Continuation;
    :goto_0
    iget-object p3, v0, Landroidx/tracing/TraceKt$traceAsync$1;->result:Ljava/lang/Object;

    .local p3, "$result":Ljava/lang/Object;
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    .line 69
    iget v2, v0, Landroidx/tracing/TraceKt$traceAsync$1;->label:I

    packed-switch v2, :pswitch_data_0

    .end local v0    # "$continuation":Lkotlin/coroutines/Continuation;
    .end local p3    # "$result":Ljava/lang/Object;
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .restart local v0    # "$continuation":Lkotlin/coroutines/Continuation;
    .restart local p3    # "$result":Ljava/lang/Object;
    :pswitch_0
    const/4 p0, 0x0

    .local p0, "$i$f$traceAsync":I
    iget p1, v0, Landroidx/tracing/TraceKt$traceAsync$1;->I$0:I

    .local p1, "cookie":I
    iget-object p2, v0, Landroidx/tracing/TraceKt$traceAsync$1;->L$0:Ljava/lang/Object;

    check-cast p2, Ljava/lang/String;

    .local p2, "methodName":Ljava/lang/String;
    :try_start_0
    invoke-static {p3}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v3, p3

    goto :goto_1

    .line 78
    :catchall_0
    move-exception v1

    goto :goto_2

    .line 69
    .end local p0    # "$i$f$traceAsync":I
    .end local p1    # "cookie":I
    .end local p2    # "methodName":Ljava/lang/String;
    :pswitch_1
    invoke-static {p3}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .local p0, "methodName":Ljava/lang/String;
    .restart local p1    # "cookie":I
    .local p2, "block":Lkotlin/jvm/functions/Function1;
    const/4 v2, 0x0

    .line 74
    .local v2, "$i$f$traceAsync":I
    invoke-static {p0, p1}, Landroidx/tracing/Trace;->beginAsyncSection(Ljava/lang/String;I)V

    .line 75
    nop

    .line 76
    :try_start_1
    iput-object p0, v0, Landroidx/tracing/TraceKt$traceAsync$1;->L$0:Ljava/lang/Object;

    iput p1, v0, Landroidx/tracing/TraceKt$traceAsync$1;->I$0:I

    const/4 v3, 0x1

    iput v3, v0, Landroidx/tracing/TraceKt$traceAsync$1;->label:I

    invoke-interface {p2, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .end local p2    # "block":Lkotlin/jvm/functions/Function1;
    if-ne v3, v1, :cond_1

    .line 69
    return-object v1

    .line 76
    :cond_1
    move-object p2, p0

    move p0, v2

    .end local v2    # "$i$f$traceAsync":I
    .local p0, "$i$f$traceAsync":I
    .local p2, "methodName":Ljava/lang/String;
    :goto_1
    nop

    .line 78
    invoke-static {p2, p1}, Landroidx/tracing/Trace;->endAsyncSection(Ljava/lang/String;I)V

    .line 76
    .end local p1    # "cookie":I
    .end local p2    # "methodName":Ljava/lang/String;
    return-object v3

    .line 78
    .restart local v2    # "$i$f$traceAsync":I
    .local p0, "methodName":Ljava/lang/String;
    .restart local p1    # "cookie":I
    :catchall_1
    move-exception v1

    move-object p2, p0

    move p0, v2

    .end local v2    # "$i$f$traceAsync":I
    .local p0, "$i$f$traceAsync":I
    .restart local p2    # "methodName":Ljava/lang/String;
    :goto_2
    invoke-static {p2, p1}, Landroidx/tracing/Trace;->endAsyncSection(Ljava/lang/String;I)V

    throw v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static final traceAsync(Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;
    .locals 4
    .param p0, "lazyMethodName"    # Lkotlin/jvm/functions/Function0;
    .param p1, "lazyCookie"    # Lkotlin/jvm/functions/Function0;
    .param p2, "block"    # Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/lang/String;",
            ">;",
            "Lkotlin/jvm/functions/Function0<",
            "Ljava/lang/Integer;",
            ">;",
            "Lkotlin/jvm/functions/Function0<",
            "+TT;>;)TT;"
        }
    .end annotation

    const-string v0, "lazyMethodName"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "lazyCookie"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "block"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 96
    .local v0, "$i$f$traceAsync":I
    const/4 v1, 0x0

    .line 97
    .local v1, "methodName":Ljava/lang/String;
    const/4 v2, 0x0

    .line 98
    .local v2, "cookie":I
    invoke-static {}, Landroidx/tracing/Trace;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 99
    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v3

    move-object v1, v3

    check-cast v1, Ljava/lang/String;

    .line 100
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Number;

    invoke-virtual {v3}, Ljava/lang/Number;->intValue()I

    move-result v2

    .line 101
    invoke-static {v1, v2}, Landroidx/tracing/Trace;->beginAsyncSection(Ljava/lang/String;I)V

    .line 103
    :cond_0
    nop

    .line 104
    :try_start_0
    invoke-interface {p2}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    if-eqz v1, :cond_1

    .line 107
    invoke-static {v1, v2}, Landroidx/tracing/Trace;->endAsyncSection(Ljava/lang/String;I)V

    :cond_1
    nop

    .line 104
    return-object v3

    .line 106
    :catchall_0
    move-exception v3

    if-eqz v1, :cond_2

    .line 107
    invoke-static {v1, v2}, Landroidx/tracing/Trace;->endAsyncSection(Ljava/lang/String;I)V

    :cond_2
    throw v3
.end method

.method private static final traceAsync$$forInline(Ljava/lang/String;ILkotlin/jvm/functions/Function1;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 2
    .param p0, "methodName"    # Ljava/lang/String;
    .param p1, "cookie"    # I
    .param p2, "block"    # Lkotlin/jvm/functions/Function1;
    .param p3, "$completion"    # Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "I",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lkotlin/coroutines/Continuation<",
            "-TT;>;+",
            "Ljava/lang/Object;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-TT;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 74
    .local v0, "$i$f$traceAsync":I
    invoke-static {p0, p1}, Landroidx/tracing/Trace;->beginAsyncSection(Ljava/lang/String;I)V

    .line 75
    nop

    .line 76
    :try_start_0
    invoke-interface {p2, p3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    invoke-static {p0, p1}, Landroidx/tracing/Trace;->endAsyncSection(Ljava/lang/String;I)V

    .line 76
    return-object v1

    .line 78
    :catchall_0
    move-exception v1

    invoke-static {p0, p1}, Landroidx/tracing/Trace;->endAsyncSection(Ljava/lang/String;I)V

    throw v1
.end method
