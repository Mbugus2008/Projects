.class public Landroidx/wear/provider/WearableCalendarContract;
.super Ljava/lang/Object;
.source "WearableCalendarContract.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/wear/provider/WearableCalendarContract$Reminders;,
        Landroidx/wear/provider/WearableCalendarContract$Attendees;,
        Landroidx/wear/provider/WearableCalendarContract$Instances;
    }
.end annotation


# static fields
.field private static final AUTHORITY:Ljava/lang/String; = "com.google.android.wearable.provider.calendar"

.field public static final CONTENT_URI:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 63
    const-string v0, "content://com.google.android.wearable.provider.calendar"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroidx/wear/provider/WearableCalendarContract;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addCalendarAuthorityUri(Landroid/content/UriMatcher;Ljava/lang/String;I)V
    .locals 1
    .param p0, "uriMatcher"    # Landroid/content/UriMatcher;
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "code"    # I

    .line 46
    const-string v0, "com.google.android.wearable.provider.calendar"

    invoke-virtual {p0, v0, p1, p2}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 47
    return-void
.end method

.method public static addCalendarDataAuthority(Landroid/content/IntentFilter;Ljava/lang/String;)V
    .locals 1
    .param p0, "intentFilter"    # Landroid/content/IntentFilter;
    .param p1, "port"    # Ljava/lang/String;

    .line 58
    const-string v0, "com.google.android.wearable.provider.calendar"

    invoke-virtual {p0, v0, p1}, Landroid/content/IntentFilter;->addDataAuthority(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    return-void
.end method
