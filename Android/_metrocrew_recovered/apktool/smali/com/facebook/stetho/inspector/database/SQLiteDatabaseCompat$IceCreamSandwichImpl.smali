.class Lcom/facebook/stetho/inspector/database/SQLiteDatabaseCompat$IceCreamSandwichImpl;
.super Lcom/facebook/stetho/inspector/database/SQLiteDatabaseCompat;
.source "SQLiteDatabaseCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/stetho/inspector/database/SQLiteDatabaseCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "IceCreamSandwichImpl"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 67
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/database/SQLiteDatabaseCompat;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/facebook/stetho/inspector/database/SQLiteDatabaseCompat$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/facebook/stetho/inspector/database/SQLiteDatabaseCompat$1;

    .line 67
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/database/SQLiteDatabaseCompat$IceCreamSandwichImpl;-><init>()V

    return-void
.end method


# virtual methods
.method public enableFeatures(ILandroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .param p1, "openOptions"    # I
    .param p2, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .line 75
    and-int/lit8 v0, p1, 0x1

    if-eqz v0, :cond_0

    .line 76
    invoke-virtual {p2}, Landroid/database/sqlite/SQLiteDatabase;->enableWriteAheadLogging()Z

    .line 79
    :cond_0
    and-int/lit8 v0, p1, 0x2

    if-eqz v0, :cond_1

    .line 80
    const-string v0, "PRAGMA foreign_keys = ON"

    invoke-virtual {p2, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 82
    :cond_1
    return-void
.end method

.method public provideOpenFlags(I)I
    .locals 1
    .param p1, "openOptions"    # I

    .line 70
    const/4 v0, 0x0

    return v0
.end method
