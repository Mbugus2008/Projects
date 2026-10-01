.class public Landroidx/wear/utils/MetadataConstants;
.super Ljava/lang/Object;
.source "MetadataConstants.java"


# static fields
.field public static final NOTIFICATION_BRIDGE_MODE_BRIDGING:Ljava/lang/String; = "BRIDGING"

.field public static final NOTIFICATION_BRIDGE_MODE_METADATA_NAME:Ljava/lang/String; = "com.google.android.wearable.notificationBridgeMode"

.field public static final NOTIFICATION_BRIDGE_MODE_NO_BRIDGING:Ljava/lang/String; = "NO_BRIDGING"

.field public static final STANDALONE_METADATA_NAME:Ljava/lang/String; = "com.google.android.wearable.standalone"

.field public static final WATCH_FACE_PREVIEW_CIRCULAR_METADATA_NAME:Ljava/lang/String; = "com.google.android.wearable.watchface.preview_circular"

.field public static final WATCH_FACE_PREVIEW_METADATA_NAME:Ljava/lang/String; = "com.google.android.wearable.watchface.preview"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 195
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getPreviewDrawableResourceId(Landroid/content/Context;Z)I
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "circular"    # Z

    .line 181
    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 182
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 181
    const/16 v3, 0x80

    invoke-virtual {v1, v2, v3}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v1

    .line 183
    .local v1, "appInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v2, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-eqz v2, :cond_1

    .line 184
    if-eqz p1, :cond_0

    .line 185
    iget-object v2, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v3, "com.google.android.wearable.watchface.preview_circular"

    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    goto :goto_0

    .line 186
    :cond_0
    iget-object v2, v1, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v3, "com.google.android.wearable.watchface.preview"

    invoke-virtual {v2, v3, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 184
    :goto_0
    return v0

    .line 190
    .end local v1    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :cond_1
    goto :goto_1

    .line 188
    :catch_0
    move-exception v1

    .line 192
    :goto_1
    return v0
.end method

.method public static isNotificationBridgingEnabled(Landroid/content/Context;)Z
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .line 157
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 158
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 157
    const/16 v2, 0x80

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 159
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-eqz v1, :cond_0

    .line 160
    const-string v1, "BRIDGING"

    iget-object v2, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v3, "com.google.android.wearable.notificationBridgeMode"

    .line 161
    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 160
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    .line 165
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :cond_0
    goto :goto_0

    .line 163
    :catch_0
    move-exception v0

    .line 167
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method public static isStandalone(Landroid/content/Context;)Z
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .line 136
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 137
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    .line 136
    const/16 v2, 0x80

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    .line 138
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    if-eqz v1, :cond_0

    .line 139
    iget-object v1, v0, Landroid/content/pm/ApplicationInfo;->metaData:Landroid/os/Bundle;

    const-string v2, "com.google.android.wearable.standalone"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return v1

    .line 143
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    :cond_0
    goto :goto_0

    .line 141
    :catch_0
    move-exception v0

    .line 145
    :goto_0
    const/4 v0, 0x0

    return v0
.end method
