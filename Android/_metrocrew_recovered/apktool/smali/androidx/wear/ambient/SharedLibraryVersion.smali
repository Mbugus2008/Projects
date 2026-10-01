.class final Landroidx/wear/ambient/SharedLibraryVersion;
.super Ljava/lang/Object;
.source "SharedLibraryVersion.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/ambient/SharedLibraryVersion$VersionHolder;,
        Landroidx/wear/ambient/SharedLibraryVersion$PresenceHolder;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    return-void
.end method

.method public static verifySharedLibraryPresent()V
    .locals 2

    .line 56
    sget-boolean v0, Landroidx/wear/ambient/SharedLibraryVersion$PresenceHolder;->PRESENT:Z

    if-eqz v0, :cond_0

    .line 61
    return-void

    .line 57
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Could not find wearable shared library classes. Please add <uses-library android:name=\"com.google.android.wearable\" android:required=\"false\" /> to the application manifest"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static version()I
    .locals 1

    .line 43
    invoke-static {}, Landroidx/wear/ambient/SharedLibraryVersion;->verifySharedLibraryPresent()V

    .line 44
    sget v0, Landroidx/wear/ambient/SharedLibraryVersion$VersionHolder;->VERSION:I

    return v0
.end method
