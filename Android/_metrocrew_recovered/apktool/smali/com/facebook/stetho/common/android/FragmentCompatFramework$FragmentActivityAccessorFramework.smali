.class Lcom/facebook/stetho/common/android/FragmentCompatFramework$FragmentActivityAccessorFramework;
.super Ljava/lang/Object;
.source "FragmentCompatFramework.java"

# interfaces
.implements Lcom/facebook/stetho/common/android/FragmentActivityAccessor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/common/android/FragmentCompatFramework;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FragmentActivityAccessorFramework"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/facebook/stetho/common/android/FragmentActivityAccessor<",
        "Landroid/app/Activity;",
        "Landroid/app/FragmentManager;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 172
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/stetho/common/android/FragmentCompatFramework$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/facebook/stetho/common/android/FragmentCompatFramework$1;

    .line 172
    invoke-direct {p0}, Lcom/facebook/stetho/common/android/FragmentCompatFramework$FragmentActivityAccessorFramework;-><init>()V

    return-void
.end method


# virtual methods
.method public getFragmentManager(Landroid/app/Activity;)Landroid/app/FragmentManager;
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 177
    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getFragmentManager(Landroid/app/Activity;)Ljava/lang/Object;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 172
    invoke-virtual {p0, p1}, Lcom/facebook/stetho/common/android/FragmentCompatFramework$FragmentActivityAccessorFramework;->getFragmentManager(Landroid/app/Activity;)Landroid/app/FragmentManager;

    move-result-object p1

    return-object p1
.end method
