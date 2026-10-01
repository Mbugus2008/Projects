.class Lcom/facebook/stetho/inspector/database/SQLiteDatabaseCompat$JellyBeanAndBeyondImpl;
.super Lcom/facebook/stetho/inspector/database/SQLiteDatabaseCompat;
.source "SQLiteDatabaseCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/database/SQLiteDatabaseCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "JellyBeanAndBeyondImpl"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/database/SQLiteDatabaseCompat;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/stetho/inspector/database/SQLiteDatabaseCompat$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/facebook/stetho/inspector/database/SQLiteDatabaseCompat$1;

    .line 48
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/database/SQLiteDatabaseCompat$JellyBeanAndBeyondImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public enableFeatures(ILandroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p1, "openOptions"    # I
    .param p2, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 60
    and-int/lit8 v0, p1, 0x2

    if-eqz v0, :cond_0

    .line 61
    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroid/database/sqlite/SQLiteDatabase;->setForeignKeyConstraintsEnabled(Z)V

    .line 63
    :cond_0
    return-void
.end method

.method public provideOpenFlags(I)I
    .locals 2
    .param p1, "openOptions"    # I

    .line 51
    const/4 v0, 0x0

    .line 52
    .local v0, "openFlags":I
    and-int/lit8 v1, p1, 0x1

    if-eqz v1, :cond_0

    .line 53
    const/high16 v1, 0x20000000

    or-int/2addr v0, v1

    .line 55
    :cond_0
    return v0
.end method
