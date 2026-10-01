.class public abstract Lcom/facebook/stetho/inspector/elements/android/window/WindowRootViewCompat;
.super Ljava/lang/Object;
.source "WindowRootViewCompat.java"


# static fields
.field private static sInstance:Lcom/facebook/stetho/inspector/elements/android/window/WindowRootViewCompat;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get(Landroid/content/Context;)Lcom/facebook/stetho/inspector/elements/android/window/WindowRootViewCompat;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .line 59
    sget-object v0, Lcom/facebook/stetho/inspector/elements/android/window/WindowRootViewCompat;->sInstance:Lcom/facebook/stetho/inspector/elements/android/window/WindowRootViewCompat;

    if-eqz v0, :cond_0

    .line 60
    sget-object v0, Lcom/facebook/stetho/inspector/elements/android/window/WindowRootViewCompat;->sInstance:Lcom/facebook/stetho/inspector/elements/android/window/WindowRootViewCompat;

    return-object v0

    .line 63
    :cond_0
    invoke-static {p0}, Lcom/facebook/stetho/common/Util;->throwIfNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    nop

    .line 66
    new-instance v0, Lcom/facebook/stetho/inspector/elements/android/window/WindowRootViewCompactV19Impl;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/elements/android/window/WindowRootViewCompactV19Impl;-><init>()V

    sput-object v0, Lcom/facebook/stetho/inspector/elements/android/window/WindowRootViewCompat;->sInstance:Lcom/facebook/stetho/inspector/elements/android/window/WindowRootViewCompat;

    .line 73
    sget-object v0, Lcom/facebook/stetho/inspector/elements/android/window/WindowRootViewCompat;->sInstance:Lcom/facebook/stetho/inspector/elements/android/window/WindowRootViewCompat;

    return-object v0
.end method


# virtual methods
.method public abstract getRootViews()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end method
