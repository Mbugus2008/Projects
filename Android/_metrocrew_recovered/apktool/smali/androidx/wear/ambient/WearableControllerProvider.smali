.class public Landroidx/wear/ambient/WearableControllerProvider;
.super Ljava/lang/Object;
.source "WearableControllerProvider.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "WearableControllerProvider"

.field private static volatile sAmbientCallbacksVerifiedPresent:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static verifyAmbientCallbacksPresent()V
    .locals 6

    .line 79
    sget-boolean v0, Landroidx/wear/ambient/WearableControllerProvider;->sAmbientCallbacksVerifiedPresent:Z

    if-eqz v0, :cond_0

    .line 80
    return-void

    .line 83
    :cond_0
    :try_start_0
    const-class v0, Lcom/google/android/wearable/compat/WearableActivityController$AmbientCallback;

    const-string v1, "onEnterAmbient"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Landroid/os/Bundle;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    .line 84
    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 89
    .local v0, "method":Ljava/lang/reflect/Method;
    const-string v1, ".onEnterAmbient"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v1, :cond_1

    .line 98
    .end local v0    # "method":Ljava/lang/reflect/Method;
    nop

    .line 99
    sput-boolean v2, Landroidx/wear/ambient/WearableControllerProvider;->sAmbientCallbacksVerifiedPresent:Z

    .line 100
    return-void

    .line 90
    .restart local v0    # "method":Ljava/lang/reflect/Method;
    :cond_1
    :try_start_1
    new-instance v1, Ljava/lang/NoSuchMethodException;

    invoke-direct {v1}, Ljava/lang/NoSuchMethodException;-><init>()V

    throw v1
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0

    .line 92
    .end local v0    # "method":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v0

    .line 93
    .local v0, "e":Ljava/lang/NoSuchMethodException;
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Could not find a required method for ambient support, likely due to proguard optimization. Please add com.google.android.wearable:wearable jar to the list of library jars for your project"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method


# virtual methods
.method public getWearableController(Landroid/app/Activity;Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;)Lcom/google/android/wearable/compat/WearableActivityController;
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "callback"    # Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;

    .line 47
    invoke-static {}, Landroidx/wear/ambient/SharedLibraryVersion;->verifySharedLibraryPresent()V

    .line 50
    new-instance v0, Landroidx/wear/ambient/WearableControllerProvider$1;

    invoke-direct {v0, p0, p2}, Landroidx/wear/ambient/WearableControllerProvider$1;-><init>(Landroidx/wear/ambient/WearableControllerProvider;Landroidx/wear/ambient/AmbientDelegate$AmbientCallback;)V

    .line 73
    .local v0, "callbackBridge":Lcom/google/android/wearable/compat/WearableActivityController$AmbientCallback;
    invoke-static {}, Landroidx/wear/ambient/WearableControllerProvider;->verifyAmbientCallbacksPresent()V

    .line 75
    new-instance v1, Lcom/google/android/wearable/compat/WearableActivityController;

    const-string v2, "WearableControllerProvider"

    invoke-direct {v1, v2, p1, v0}, Lcom/google/android/wearable/compat/WearableActivityController;-><init>(Ljava/lang/String;Landroid/app/Activity;Lcom/google/android/wearable/compat/WearableActivityController$AmbientCallback;)V

    return-object v1
.end method
