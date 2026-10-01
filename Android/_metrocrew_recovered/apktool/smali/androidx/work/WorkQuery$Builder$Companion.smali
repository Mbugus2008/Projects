.class public final Landroidx/work/WorkQuery$Builder$Companion;
.super Ljava/lang/Object;
.source "WorkQuery.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/work/WorkQuery$Builder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\u0008\u0002\u00a2\u0006\u0002\u0010\u0002J\u0016\u0010\u0003\u001a\u00020\u00042\u000c\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00020\u00070\u0006H\u0007J\u0016\u0010\u0008\u001a\u00020\u00042\u000c\u0010\t\u001a\u0008\u0012\u0004\u0012\u00020\n0\u0006H\u0007J\u0016\u0010\u000b\u001a\u00020\u00042\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\r0\u0006H\u0007J\u0016\u0010\u000e\u001a\u00020\u00042\u000c\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\r0\u0006H\u0007\u00a8\u0006\u0010"
    }
    d2 = {
        "Landroidx/work/WorkQuery$Builder$Companion;",
        "",
        "()V",
        "fromIds",
        "Landroidx/work/WorkQuery$Builder;",
        "ids",
        "",
        "Ljava/util/UUID;",
        "fromStates",
        "states",
        "Landroidx/work/WorkInfo$State;",
        "fromTags",
        "tags",
        "",
        "fromUniqueWorkNames",
        "uniqueWorkNames",
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
.method private constructor <init>()V
    .locals 0

    .line 120
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0}, Landroidx/work/WorkQuery$Builder$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final fromIds(Ljava/util/List;)Landroidx/work/WorkQuery$Builder;
    .locals 2
    .param p1, "ids"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/util/UUID;",
            ">;)",
            "Landroidx/work/WorkQuery$Builder;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string v0, "ids"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 130
    new-instance v0, Landroidx/work/WorkQuery$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroidx/work/WorkQuery$Builder;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 131
    .local v0, "builder":Landroidx/work/WorkQuery$Builder;
    invoke-virtual {v0, p1}, Landroidx/work/WorkQuery$Builder;->addIds(Ljava/util/List;)Landroidx/work/WorkQuery$Builder;

    .line 132
    return-object v0
.end method

.method public final fromStates(Ljava/util/List;)Landroidx/work/WorkQuery$Builder;
    .locals 2
    .param p1, "states"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroidx/work/WorkInfo$State;",
            ">;)",
            "Landroidx/work/WorkQuery$Builder;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string/jumbo v0, "states"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 172
    new-instance v0, Landroidx/work/WorkQuery$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroidx/work/WorkQuery$Builder;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 173
    .local v0, "builder":Landroidx/work/WorkQuery$Builder;
    invoke-virtual {v0, p1}, Landroidx/work/WorkQuery$Builder;->addStates(Ljava/util/List;)Landroidx/work/WorkQuery$Builder;

    .line 174
    return-object v0
.end method

.method public final fromTags(Ljava/util/List;)Landroidx/work/WorkQuery$Builder;
    .locals 2
    .param p1, "tags"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Landroidx/work/WorkQuery$Builder;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string/jumbo v0, "tags"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 158
    new-instance v0, Landroidx/work/WorkQuery$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroidx/work/WorkQuery$Builder;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 159
    .local v0, "builder":Landroidx/work/WorkQuery$Builder;
    invoke-virtual {v0, p1}, Landroidx/work/WorkQuery$Builder;->addTags(Ljava/util/List;)Landroidx/work/WorkQuery$Builder;

    .line 160
    return-object v0
.end method

.method public final fromUniqueWorkNames(Ljava/util/List;)Landroidx/work/WorkQuery$Builder;
    .locals 2
    .param p1, "uniqueWorkNames"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Landroidx/work/WorkQuery$Builder;"
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    const-string/jumbo v0, "uniqueWorkNames"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 144
    new-instance v0, Landroidx/work/WorkQuery$Builder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroidx/work/WorkQuery$Builder;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 145
    .local v0, "builder":Landroidx/work/WorkQuery$Builder;
    invoke-virtual {v0, p1}, Landroidx/work/WorkQuery$Builder;->addUniqueWorkNames(Ljava/util/List;)Landroidx/work/WorkQuery$Builder;

    .line 146
    return-object v0
.end method
