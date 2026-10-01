.class abstract Lcom/facebook/stetho/inspector/elements/android/ActivityTracker$AutomaticTracker;
.super Ljava/lang/Object;
.source "ActivityTracker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/elements/android/ActivityTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "AutomaticTracker"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/elements/android/ActivityTracker$AutomaticTracker$AutomaticTrackerICSAndBeyond;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/stetho/inspector/elements/android/ActivityTracker$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/facebook/stetho/inspector/elements/android/ActivityTracker$1;

    .line 150
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/android/ActivityTracker$AutomaticTracker;-><init>()V

    return-void
.end method

.method public static newInstance(Landroid/app/Application;Lcom/facebook/stetho/inspector/elements/android/ActivityTracker;)Lcom/facebook/stetho/inspector/elements/android/ActivityTracker$AutomaticTracker;
    .locals 1
    .param p0, "application"    # Landroid/app/Application;
    .param p1, "tracker"    # Lcom/facebook/stetho/inspector/elements/android/ActivityTracker;

    .line 155
    new-instance v0, Lcom/facebook/stetho/inspector/elements/android/ActivityTracker$AutomaticTracker$AutomaticTrackerICSAndBeyond;

    invoke-direct {v0, p0, p1}, Lcom/facebook/stetho/inspector/elements/android/ActivityTracker$AutomaticTracker$AutomaticTrackerICSAndBeyond;-><init>(Landroid/app/Application;Lcom/facebook/stetho/inspector/elements/android/ActivityTracker;)V

    return-object v0
.end method


# virtual methods
.method public abstract register()V
.end method

.method public abstract unregister()V
.end method
