.class final Landroidx/work/impl/utils/CancelWorkRunnable$forAll$1;
.super Lkotlin/jvm/internal/Lambda;
.source "CancelWorkRunnable.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/work/impl/utils/CancelWorkRunnable;->forAll(Landroidx/work/impl/WorkManagerImpl;)Landroidx/work/Operation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $workManagerImpl:Landroidx/work/impl/WorkManagerImpl;


# direct methods
.method public static synthetic $r8$lambda$FiwYY7euQVFoWhAgDTmAY3zxQHo(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/WorkManagerImpl;)V
    .locals 0

    invoke-static {p0, p1}, Landroidx/work/impl/utils/CancelWorkRunnable$forAll$1;->invoke$lambda$0(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/WorkManagerImpl;)V

    return-void
.end method

.method constructor <init>(Landroidx/work/impl/WorkManagerImpl;)V
    .locals 1

    iput-object p1, p0, Landroidx/work/impl/utils/CancelWorkRunnable$forAll$1;->$workManagerImpl:Landroidx/work/impl/WorkManagerImpl;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method

.method private static final invoke$lambda$0(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/WorkManagerImpl;)V
    .locals 5
    .param p0, "$workDatabase"    # Landroidx/work/impl/WorkDatabase;
    .param p1, "$workManagerImpl"    # Landroidx/work/impl/WorkManagerImpl;

    .line 146
    invoke-virtual {p0}, Landroidx/work/impl/WorkDatabase;->workSpecDao()Landroidx/work/impl/model/WorkSpecDao;

    move-result-object v0

    .line 147
    .local v0, "workSpecDao":Landroidx/work/impl/model/WorkSpecDao;
    invoke-interface {v0}, Landroidx/work/impl/model/WorkSpecDao;->getAllUnfinishedWork()Ljava/util/List;

    move-result-object v1

    .line 148
    .local v1, "workSpecIds":Ljava/util/List;
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 149
    .local v3, "workSpecId":Ljava/lang/String;
    invoke-static {p1, v3}, Landroidx/work/impl/utils/CancelWorkRunnable;->access$cancel(Landroidx/work/impl/WorkManagerImpl;Ljava/lang/String;)V

    .end local v3    # "workSpecId":Ljava/lang/String;
    goto :goto_0

    .line 152
    :cond_0
    new-instance v2, Landroidx/work/impl/utils/PreferenceUtils;

    invoke-direct {v2, p0}, Landroidx/work/impl/utils/PreferenceUtils;-><init>(Landroidx/work/impl/WorkDatabase;)V

    .line 153
    invoke-virtual {p1}, Landroidx/work/impl/WorkManagerImpl;->getConfiguration()Landroidx/work/Configuration;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/work/Configuration;->getClock()Landroidx/work/Clock;

    move-result-object v3

    invoke-interface {v3}, Landroidx/work/Clock;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Landroidx/work/impl/utils/PreferenceUtils;->setLastCancelAllTimeMillis(J)V

    .line 154
    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 1

    .line 139
    invoke-virtual {p0}, Landroidx/work/impl/utils/CancelWorkRunnable$forAll$1;->invoke()V

    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object v0
.end method

.method public final invoke()V
    .locals 3

    .line 144
    iget-object v0, p0, Landroidx/work/impl/utils/CancelWorkRunnable$forAll$1;->$workManagerImpl:Landroidx/work/impl/WorkManagerImpl;

    invoke-virtual {v0}, Landroidx/work/impl/WorkManagerImpl;->getWorkDatabase()Landroidx/work/impl/WorkDatabase;

    move-result-object v0

    const-string/jumbo v1, "workManagerImpl.workDatabase"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 145
    .local v0, "workDatabase":Landroidx/work/impl/WorkDatabase;
    iget-object v1, p0, Landroidx/work/impl/utils/CancelWorkRunnable$forAll$1;->$workManagerImpl:Landroidx/work/impl/WorkManagerImpl;

    new-instance v2, Landroidx/work/impl/utils/CancelWorkRunnable$forAll$1$$ExternalSyntheticLambda0;

    invoke-direct {v2, v0, v1}, Landroidx/work/impl/utils/CancelWorkRunnable$forAll$1$$ExternalSyntheticLambda0;-><init>(Landroidx/work/impl/WorkDatabase;Landroidx/work/impl/WorkManagerImpl;)V

    invoke-virtual {v0, v2}, Landroidx/work/impl/WorkDatabase;->runInTransaction(Ljava/lang/Runnable;)V

    .line 156
    return-void
.end method
