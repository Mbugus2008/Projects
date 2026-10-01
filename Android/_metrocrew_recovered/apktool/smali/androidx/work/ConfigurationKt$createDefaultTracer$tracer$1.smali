.class public final Landroidx/work/ConfigurationKt$createDefaultTracer$tracer$1;
.super Ljava/lang/Object;
.source "Configuration.kt"

# interfaces
.implements Landroidx/work/Tracer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/work/ConfigurationKt;->createDefaultTracer()Landroidx/work/Tracer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0010\u0010\u0008\u001a\u00020\u00032\u0006\u0010\t\u001a\u00020\u0005H\u0016J\u0018\u0010\n\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0008\u0010\u000b\u001a\u00020\u0003H\u0016J\u0008\u0010\u000c\u001a\u00020\rH\u0016\u00a8\u0006\u000e"
    }
    d2 = {
        "androidx/work/ConfigurationKt$createDefaultTracer$tracer$1",
        "Landroidx/work/Tracer;",
        "beginAsyncSection",
        "",
        "methodName",
        "",
        "cookie",
        "",
        "beginSection",
        "label",
        "endAsyncSection",
        "endSection",
        "isEnabled",
        "",
        "work-runtime_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 602
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public beginAsyncSection(Ljava/lang/String;I)V
    .locals 1
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "cookie"    # I

    const-string v0, "methodName"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 616
    invoke-static {p1, p2}, Landroidx/tracing/Trace;->beginAsyncSection(Ljava/lang/String;I)V

    .line 617
    return-void
.end method

.method public beginSection(Ljava/lang/String;)V
    .locals 1
    .param p1, "label"    # Ljava/lang/String;

    const-string v0, "label"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 608
    invoke-static {p1}, Landroidx/tracing/Trace;->beginSection(Ljava/lang/String;)V

    .line 609
    return-void
.end method

.method public endAsyncSection(Ljava/lang/String;I)V
    .locals 1
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "cookie"    # I

    const-string v0, "methodName"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 620
    invoke-static {p1, p2}, Landroidx/tracing/Trace;->endAsyncSection(Ljava/lang/String;I)V

    .line 621
    return-void
.end method

.method public endSection()V
    .locals 0

    .line 612
    invoke-static {}, Landroidx/tracing/Trace;->endSection()V

    .line 613
    return-void
.end method

.method public isEnabled()Z
    .locals 1

    .line 604
    invoke-static {}, Landroidx/tracing/Trace;->isEnabled()Z

    move-result v0

    return v0
.end method
