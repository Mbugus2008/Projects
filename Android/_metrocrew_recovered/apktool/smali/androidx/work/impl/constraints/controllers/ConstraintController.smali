.class public interface abstract Landroidx/work/impl/constraints/controllers/ConstraintController;
.super Ljava/lang/Object;
.source "ContraintControllers.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008f\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&J\u0010\u0010\u0006\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&J\u0016\u0010\u0007\u001a\u0008\u0012\u0004\u0012\u00020\t0\u00082\u0006\u0010\n\u001a\u00020\u000bH&\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006\u000c\u00c0\u0006\u0001"
    }
    d2 = {
        "Landroidx/work/impl/constraints/controllers/ConstraintController;",
        "",
        "hasConstraint",
        "",
        "workSpec",
        "Landroidx/work/impl/model/WorkSpec;",
        "isCurrentlyConstrained",
        "track",
        "Lkotlinx/coroutines/flow/Flow;",
        "Landroidx/work/impl/constraints/ConstraintsState;",
        "constraints",
        "Landroidx/work/Constraints;",
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


# virtual methods
.method public abstract hasConstraint(Landroidx/work/impl/model/WorkSpec;)Z
.end method

.method public abstract isCurrentlyConstrained(Landroidx/work/impl/model/WorkSpec;)Z
.end method

.method public abstract track(Landroidx/work/Constraints;)Lkotlinx/coroutines/flow/Flow;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/work/Constraints;",
            ")",
            "Lkotlinx/coroutines/flow/Flow<",
            "Landroidx/work/impl/constraints/ConstraintsState;",
            ">;"
        }
    .end annotation
.end method
