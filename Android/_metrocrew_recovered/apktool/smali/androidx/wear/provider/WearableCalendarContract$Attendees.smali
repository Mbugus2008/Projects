.class public final Landroidx/wear/provider/WearableCalendarContract$Attendees;
.super Ljava/lang/Object;
.source "WearableCalendarContract.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/wear/provider/WearableCalendarContract;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Attendees"
.end annotation


# static fields
.field public static final CONTENT_URI:Landroid/net/Uri;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 81
    sget-object v0, Landroidx/wear/provider/WearableCalendarContract;->CONTENT_URI:Landroid/net/Uri;

    .line 82
    const-string v1, "attendees"

    invoke-static {v0, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Landroidx/wear/provider/WearableCalendarContract$Attendees;->CONTENT_URI:Landroid/net/Uri;

    .line 81
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    return-void
.end method
