.class public Lcom/trimline/metrocrew/Printer$collectiondates;
.super Ljava/lang/Object;
.source "Printer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/trimline/metrocrew/Printer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "collectiondates"
.end annotation


# instance fields
.field public Count:I

.field public MemberName:Ljava/lang/String;

.field public MemberNo:Ljava/lang/String;

.field public Total:Ljava/lang/Double;

.field public date:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/trimline/metrocrew/Printer$collectiondates;->date:Ljava/lang/String;

    return-object v0
.end method
